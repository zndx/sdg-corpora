Animal control operations form a tightly coupled ecosystem of field patrols, incident response, enforcement actions, and animal welfare outcomes. At the heart of this domain sit seven base tables that capture the lifecycle of an animal—from its first encounter with an officer through incident documentation, potential citation, health and temperament assessment, and ultimately adoption or disposition. The relational model normalizes these entities to eliminate redundancy while preserving the ability to reconstruct complete operational narratives through a set of twelve join views. Each table carries a surrogate primary key, a set of descriptive attributes, and one or more foreign keys that anchor it to the entities it depends on.

## The Officer and Patrol Foundation

The domain begins with the people who do the work. The `animal_services_officers` table stores the roster of certified personnel. Each row is identified by `officer_id` (a numeric surrogate such as `103165` or `7441150`), carries a human-readable `full_name` (`Theodore Mcgrath`, `Norma Fisher`), and a `badge_number` (`BAD-2782`, `BAD-2794`). Certification and fitness-to-duty are tracked through `certification_status` (values like `certified`, `pending`, `expired`), `driver_license_status` (`valid`, `suspended`, `revoked`), `drug_test_status` (`pass`, `fail`, `pending`), and `criminal_history_status` (`clear`, `flagged`, `pending`). These status columns are the first place where cardinality-bounded constraints appear: an officer can hold exactly one value per status column, and the domain enforces that an officer must be `certified` before issuing citations.

**Table `animal_services_officers`**

| officer_id | full_name | badge_number | certification_status | driver_license_status | drug_test_status | criminal_history_status | citation_id | animal_id |
|---|---|---|---|---|---|---|---|---|
| 103165 | Theodore Mcgrath | BAD-2782 | certified | valid | pass | clear | strategic-networking | 100 |
| 2933464 | Account Name | BAD-2786 | pending | suspended | fail | flagged | 2933470 | 101 |
| 10445622 | Saipan International Airport | BAD-2790 | expired | revoked | pending | pending | 4447022 | 102 |
| 7441150 | Norma Fisher | BAD-2794 | certified | valid | pass | clear | bj1 | 103 |

Patrol assignments are recorded in `animal_control_patrols`, which links a time-bound field operation to a specific officer and, when relevant, to an incident. The primary key `animal_control_patrol_id` is a numeric surrogate (`1`, `2`, `3`, `4`), while `patrol_id` (`10238262`, `2106715`, `69444`, `5243`) serves as the business identifier. The `assigned_area` column (`distributed-assigned-78`, `baseline-assigned-79`, `pilot-assigned-80`, `extended-assigned-81`) and `patrol_type` (`emergency`, `non-emergency`, `routine`) describe the scope of the patrol. Temporal boundaries are captured by `start_time` and `end_time` as ISO-8601 timestamps. The `weather_conditions` column (`distributed-weather-42`, `baseline-weather-43`, `pilot-weather-44`, `extended-weather-45`) records environmental context. Crucially, `officer_id` is a foreign key into `animal_services_officers`, binding the patrol to a single officer, while `incident_report_id` is a foreign key into `incident_reports`, linking the patrol to the incident it was dispatched for.

**Table `animal_control_patrols`**

| animal_control_patrol_id | patrol_id | assigned_area | start_time | end_time | patrol_type | weather_conditions | officer_badge_number | officer_id | incident_report_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10238262 | distributed-assigned-78 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | emergency | distributed-weather-42 | OFF-2116 | 103165 | 1 |
| 2 | 2106715 | baseline-assigned-79 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | non-emergency | baseline-weather-43 | OFF-2118 | 2933464 | 2 |
| 3 | 69444 | pilot-assigned-80 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | routine | pilot-weather-44 | OFF-2120 | 10445622 | 3 |
| 4 | 5243 | extended-assigned-81 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | emergency | extended-weather-45 | OFF-2122 | 7441150 | 4 |

## Incident Reporting and Animal Intake

When a patrol encounters a situation requiring documentation, an `incident_reports` row is created. The table's primary key `id` (`1`, `2`, `3`, `4`) is a numeric surrogate, and `report_id` (`1202-0008-S`, `8189500`, `L355`, `5844272`) is the human-facing identifier. The `incident_type` column (`bite`, `stray`, `nuisance`, `complaint`) classifies the event, while `reported_date` (`2025-04-27T03:09:00`, `2022-09-11T10:26:00`, `2023-02-22T17:43:00`, `2024-07-06T00:00:00`) and `location` (`extended-location-99`, `integrated-location-100`, `seasonal-location-101`, `regional-location-102`) capture when and where it occurred. Severity is recorded as `low`, `medium`, `high`, or `critical`, and `resolution_status` (`open`, `investigating`, `closed`, `escalated`) tracks the case lifecycle. A `citizen_complaint_id` (`407`, `d9d981b8-8fcc-11eb-924d-9cd76263cbd0`, `2087733`, `8350037`) may reference an external complaint.

**Table `incident_reports`**

| id | report_id | incident_type | reported_date | location | severity | resolution_status | citizen_complaint_id | officer_id | animal_id | citation_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | bite | 2025-04-27T03:09:00 | extended-location-99 | low | open | 407 | 103165 | 100 | strategic-networking |
| 2 | 8189500 | stray | 2022-09-11T10:26:00 | integrated-location-100 | medium | investigating | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | 2933464 | 101 | 2933470 |
| 3 | L355 | nuisance | 2023-02-22T17:43:00 | seasonal-location-101 | high | closed | 2087733 | 10445622 | 102 | 4447022 |
| 4 | 5844272 | complaint | 2024-07-06T00:00:00 | regional-location-102 | critical | escalated | 8350037 | 7441150 | 103 | bj1 |

The `incident_reports` table carries three foreign keys that anchor the incident to the rest of the domain: `officer_id` references `animal_services_officers.officer_id`, `animal_id` references `animals.id`, and `citation_id` references `citations.citation_id`. This means every incident is attributable to a single officer, involves a single animal, and may result in a single citation. The cardinality is one-to-one from the incident's perspective: one officer, one animal, zero or one citation.

The `animals` table stores the biological and welfare profile of each animal encountered. Its primary key `id` (`100`, `101`, `102`, `103`) is numeric, and `animal_id` (`6511`, `10966216`, `5844275`, `1250199`) is the business identifier. Species and breed are captured as `species` (`pilot-species-14`, `extended-species-15`, `integrated-species-16`, `seasonal-species-17`) and `breed` (`compact-breed-80`, `composite-breed-81`, `primary-breed-82`, `adaptive-breed-83`). Physical attributes include `age` (ranging from `35` to `50`) and `weight` (from `0.48410348` to `1.02669`). Health and behavioral state are recorded in `health_status` (`healthy`, `injured`, `ill`, `deceased`) and `temperament` (`aggressive`, `friendly`, `fearful`, `neutral`). The `impound_status` column (`free`, `impounded`, `adopted`, `euthanized`) tracks the animal's disposition.

**Table `animals`**

| id | animal_id | species | breed | age | weight | health_status | temperament | impound_status | incident_report_id | adoption_assessment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 6511 | pilot-species-14 | compact-breed-80 | 35 | 1.02669 | healthy | aggressive | free | 1 | 1000 |
| 101 | 10966216 | extended-species-15 | composite-breed-81 | 40 | 0.6 | injured | friendly | impounded | 2 | 1001 |
| 102 | 5844275 | integrated-species-16 | primary-breed-82 | 45 | 0.48410348 | ill | fearful | adopted | 3 | 1002 |
| 103 | 1250199 | seasonal-species-17 | adaptive-breed-83 | 50 | 0.6000001 | deceased | neutral | euthanized | 4 | 1003 |

The `animals` table holds two foreign keys: `incident_report_id` references `incident_reports.id`, and `adoption_assessment_id` references `adoption_assessments.id`. This means each animal is associated with exactly one incident and one adoption assessment, establishing a clean one-to-one linkage from animal to both its encounter history and its welfare evaluation.

## Enforcement: Citations

When an incident warrants legal action, a `citations` row is created. The primary key `citation_id` is a string (`strategic-networking`, `2933470`, `4447022`, `bj1`), which is unusual but serves as a human-readable citation number. The `issue_date` (`2023-02-01`, `2024-07-12`, `2025-12-23`, `2022-05-07`) and `violation_code` (`3355763`, `2087745`, `4074`, `2002007020220`) define the legal basis. The `fine_amount` (`29.99`, `16.11`, `32.21`, `35.45`) and `court_date` (`2025-04-25`, `2022-09-09`, `2023-02-20`, `2024-07-04`) capture the financial and scheduling consequences. `payment_status` (`unpaid`, `paid`, `disputed`, `dismissed`) tracks resolution, and `officer_notes` (`adaptive-officer-59`, `distributed-officer-60`, `baseline-officer-61`, `pilot-officer-62`) provides free-text context.

**Table `citations`**

| citation_id | issue_date | violation_code | fine_amount | court_date | payment_status | officer_notes | officer_id | incident_report_id |
|---|---|---|---|---|---|---|---|---|
| strategic-networking | 2023-02-01 | 3355763 | 29.99 | 2025-04-25 | unpaid | adaptive-officer-59 | 103165 | 1 |
| 2933470 | 2024-07-12 | 2087745 | 16.11 | 2022-09-09 | paid | distributed-officer-60 | 2933464 | 2 |
| 4447022 | 2025-12-23 | 4074 | 32.21 | 2023-02-20 | disputed | baseline-officer-61 | 10445622 | 3 |
| bj1 | 2022-05-07 | 2002007020220 | 35.45 | 2024-07-04 | dismissed | pilot-officer-62 | 7441150 | 4 |

The `citations` table carries two foreign keys: `officer_id` references `animal_services_officers.officer_id`, and `incident_report_id` references `incident_reports.id`. This means each citation is issued by a single officer in connection with a single incident, reinforcing the one-to-one relationship between citation and incident.

## Adoption Workflow: Assessments and Records

The adoption pipeline is captured across two tables. The `adoption_assessments` table evaluates an animal's suitability for placement. Its primary key `id` (`1000`, `1001`, `1002`, `1003`) is numeric, and `assessment_id` (`template_ivacode_pagata_20det40ind`, `19508914`, `506000`, `1204-0009-M`) is the business identifier. The `assessment_date` (`2022-05-10T04:24:00`, `2023-10-21T11:41:00`, `2024-03-05T18:58:00`, `2025-08-16T01:15:00`) records when the evaluation occurred. Scoring is captured through `temperament_score` (`14`, `25`, `36`, `47`) and `health_score` (`23`, `34`, `45`, `56`), which appear to be on a scale where higher values indicate worse condition. The `adoptability_rating` column (`highly_adoptable`, `moderately_adoptable`, `low_adoptability`, `not_adoptable`) is the synthesized judgment, and `special_needs` (`false`, `true`, `false`, `true`) flags additional care requirements.

**Table `adoption_assessments`**

| id | assessment_id | assessment_date | temperament_score | health_score | adoptability_rating | special_needs | assessor_id | animal_id | officer_id | adoption_record_adoption_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 14 | 23 | highly_adoptable | false | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | 100 | 103165 | 726055 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 25 | 34 | moderately_adoptable | true | 4060646 | 101 | 2933464 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 |
| 1002 | 506000 | 2024-03-05T18:58:00 | 36 | 45 | low_adoptability | false | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 102 | 10445622 | 1152667 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 47 | 56 | not_adoptable | true | 2933475 | 103 | 7441150 | 9246307 |

The `adoption_assessments` table carries three foreign keys: `assessor_id` references `animal_services_officers.officer_id`, `animal_id` references `animals.id`, and `officer_id` also references `animal_services_officers.officer_id`. The dual officer references suggest that the assessor and the handling officer may be different people, though in the sample data they coincide. The `adoption_record_adoption_id` column (`726055`, `b83e028a-8fcd-11eb-924d-9cd76263cbd0`, `1152667`, `9246307`) is a foreign key into `adoption_records`, linking the assessment to the final adoption transaction.

The `adoption_records` table (referenced by the assessment's `adoption_record_adoption_id`) stores the final adoption transaction. Its primary key is `adoption_id`, and it carries `animal_id` and `adoption_assessment_id` as foreign keys, completing the adoption chain from animal through assessment to final placement.

## Materialized Views: Reconstructing Domain Facts

The normalized tables are joined into views that answer specific operational questions. Each view is a named query that materializes a particular facet of the domain by pulling columns from two or more base tables.

### Patrol-to-Officer and Patrol-to-Incident Views

The view `vw_animal_control_patrol_animal_services_officer` joins `animal_control_patrols` to `animal_services_officers` on `officer_id`, producing a single row per patrol that includes the officer's name, badge number, and certification status alongside the patrol's time window and assigned area. Reading the row for patrol `10238262`, one sees that officer `Theodore Mcgrath` (badge `BAD-2782`, status `certified`) was assigned to area `distributed-assigned-78` during an `emergency` patrol that started at `2024-03-27T14:42:00`.

The view `vw_animal_control_patrol_incident_report` joins `animal_control_patrols` to `incident_reports` on `incident_report_id`, answering the question "which incident did this patrol address?" For patrol `69444`, the joined row shows incident `L355`, a `nuisance` report of `high` severity at `seasonal-location-101` that is now `closed`.

### Officer-to-Citation and Officer-to-Animal Views

The view `vw_animal_services_officer_citation` joins `animal_services_officers` to `citations` on `officer_id`, answering "what citations has this officer issued?" For officer `Theodore Mcgrath` (`103165`), the joined row shows citation `strategic-networking`, issued on `2023-02-01` for violation code `3355763` with a fine of `$29.99` that remains `unpaid`.

The view `vw_animal_services_officer_animal` joins `animal_services_officers` to `animals` on `animal_id`, answering "which animals has this officer encountered?" For officer `Account Name` (`2933464`), the joined row shows animal `10966216`, an `extended-species-15` that is `injured` and `friendly`, currently `impounded`.

### Incident-to-Animal and Incident-to-Officer Views

The view `vw_animal_incident_report` joins `animals` to `incident_reports` on `animal_id`, answering "what incident involved this animal?" For animal `6511`, the joined row shows incident `1202-0008-S`, a `bite` report of `low` severity at `extended-location-99` that remains `open`.

The view `vw_incident_report_animal_services_officer` joins `incident_reports` to `animal_services_officers` on `officer_id`, answering "which officer handled this incident?" For incident `1202-0008-S`, the joined row shows officer `Theodore Mcgrath` (`103165`), badge `BAD-2782`, who is `certified` with a `valid` driver's license.

The view `vw_incident_report_animal` joins `incident_reports` to `animals` on `animal_id`, answering "which animal was involved in this incident?" For incident `L355`, the joined row shows animal `5844275`, an `integrated-species-16` that is `ill` and `fearful`, with `adopted` impound status.

The view `vw_incident_report_citation` joins `incident_reports` to `citations` on `citation_id`, answering "what citation resulted from this incident?" For incident `8189500`, the joined row shows citation `2933470`, issued on `2024-07-12` for violation code `2087745` with a fine of `$16.11` that is now `paid`.

### Citation-to-Officer and Citation-to-Incident Views

The view `vw_citation_animal_services_officer` joins `citations` to `animal_services_officers` on `officer_id`, answering "which officer issued this citation?" For citation `bj1`, the joined row shows officer `Norma Fisher` (`7441150`), badge `BAD-2794`, who is `certified` with a `valid` driver's license.

The view `vw_citation_incident_report` joins `citations` to `incident_reports` on `incident_report_id`, answering "which incident led to this citation?" For citation `4447022`, the joined row shows incident `L355`, a `nuisance` report of `high` severity at `seasonal-location-101` that is now `closed`.

### Adoption Assessment Views

The view `vw_adoption_assessment_animal` joins `adoption_assessments` to `animals` on `animal_id`, answering "what is the welfare profile of this assessed animal?" For assessment `template_ivacode_pagata_20det40ind`, the joined row shows animal `6511`, a `pilot-species-14` that is `healthy` and `aggressive`, with `free` impound status.

The view `vw_adoption_assessment_animal_services_officer` joins `adoption_assessments` to `animal_services_officers` on `assessor_id`, answering "which officer performed this assessment?" For assessment `19508914`, the joined row shows officer `Account Name` (`2933464`), badge `BAD-2786`, whose certification is `pending` and whose drug test result is `fail`.

The view `vw_adoption_assessment_adoption_record` joins `adoption_assessments` to `adoption_records` on `adoption_record_adoption_id`, answering "has this assessment led to a final adoption?" For assessment `506000`, the joined row shows adoption record `1152667`, completing the chain from assessment to placement for animal `5844275`.

### Adoption Record Views

The view `vw_adoption_record_animal` joins `adoption_records` to `animals` on `animal_id`, answering "which animal was adopted in this record?" For adoption record `726055`, the joined row shows animal `6511`, a `pilot-species-14` that is `healthy` and `aggressive`, now with `adopted` impound status.

The view `vw_adoption_record_adoption_assessment` joins `adoption_records` to `adoption_assessments` on `adoption_assessment_id`, answering "which assessment preceded this adoption?" For adoption record `b83e028a-8fcd-11eb-924d-9cd76263cbd0`, the joined row shows assessment `19508914`, which rated the animal `moderately_adoptable` with a temperament score of `25` and a health score of `34`, and flagged `special_needs` as `true`.

## Synthesis

The animal control domain model distributes information across seven normalized tables to eliminate redundancy while preserving the ability to reconstruct complete operational narratives. The officer table anchors the entire schema: every patrol, incident, citation, and assessment references an officer. The incident table serves as the central hub, linking officers to animals and citations in a single encounter. The animal table captures biological and welfare attributes, linked to both the incident that brought it into contact with authorities and the assessment that evaluated its adoptability. The adoption pipeline flows from assessment to record, with the assessment bridging the animal's welfare profile to the final placement decision.

The twelve join views materialize the most common operational questions by reassembling the normalized facts: which officer handled which incident, which animal was involved in which citation, which assessment led to which adoption. Each view answers a single question by joining exactly two tables, and the join keys are the foreign keys that were established during normalization. The result is a schema that is both efficient in storage and expressive in query, allowing analysts to reconstruct any domain fact from the normalized tables by following the foreign key paths that the views make explicit.

## Data appendix

**Table `adoption_records`**

| adoption_id | adoption_date | adopter_name | adopter_contact | adoption_fee | follow_up_required | follow_up_status | animal_id | adoption_assessment_id |
|---|---|---|---|---|---|---|---|---|
| 726055 | 2025-08-12 | Composite Programme | Kimberly Smith | 19.97 | false | scheduled | 100 | 1000 |
| b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-01-23 | Compact Standard A | William Sherman | 43.48 | true | completed | 101 | 1001 |
| 1152667 | 2023-06-07 | Legacy Framework | Walter Pratt | 38.08 | false | failed | 102 | 1002 |
| 9246307 | 2024-11-18 | Regional Protocol | Walter Pratt | 14.31 | true | waived | 103 | 1003 |

**View `vw_animal_control_patrol_animal_services_officer`**

```sql
CREATE VIEW vw_animal_control_patrol_animal_services_officer AS
SELECT a.animal_control_patrol_id, a.patrol_id, a.assigned_area, a.start_time, b.officer_id AS officer_officer_id, b.full_name AS officer_full_name, b.badge_number AS officer_badge_number
FROM animal_control_patrols a JOIN animal_services_officers b ON a.officer_id = b.officer_id;
```

| animal_control_patrol_id | patrol_id | assigned_area | start_time | officer_officer_id | officer_full_name | officer_badge_number |
|---|---|---|---|---|---|---|
| 1 | 10238262 | distributed-assigned-78 | 2024-03-27T14:42:00 | 103165 | Theodore Mcgrath | BAD-2782 |
| 2 | 2106715 | baseline-assigned-79 | 2025-08-11T21:59:00 | 2933464 | Account Name | BAD-2786 |
| 3 | 69444 | pilot-assigned-80 | 2022-01-22T04:16:00 | 10445622 | Saipan International Airport | BAD-2790 |
| 4 | 5243 | extended-assigned-81 | 2023-06-06T11:33:00 | 7441150 | Norma Fisher | BAD-2794 |

**View `vw_animal_control_patrol_incident_report`**

```sql
CREATE VIEW vw_animal_control_patrol_incident_report AS
SELECT a.animal_control_patrol_id, a.patrol_id, a.assigned_area, a.start_time, b.id AS report_id, b.report_id AS report_report_id, b.incident_type AS report_incident_type
FROM animal_control_patrols a JOIN incident_reports b ON a.incident_report_id = b.id;
```

| animal_control_patrol_id | patrol_id | assigned_area | start_time | report_id | report_report_id | report_incident_type |
|---|---|---|---|---|---|---|
| 1 | 10238262 | distributed-assigned-78 | 2024-03-27T14:42:00 | 1 | 1202-0008-S | bite |
| 2 | 2106715 | baseline-assigned-79 | 2025-08-11T21:59:00 | 2 | 8189500 | stray |
| 3 | 69444 | pilot-assigned-80 | 2022-01-22T04:16:00 | 3 | L355 | nuisance |
| 4 | 5243 | extended-assigned-81 | 2023-06-06T11:33:00 | 4 | 5844272 | complaint |

**View `vw_animal_services_officer_citation`**

```sql
CREATE VIEW vw_animal_services_officer_citation AS
SELECT a.officer_id, a.full_name, a.badge_number, a.certification_status, b.citation_id AS citation_citation_id, b.issue_date AS citation_issue_date, b.violation_code AS citation_violation_code
FROM animal_services_officers a JOIN citations b ON a.citation_id = b.citation_id;
```

| officer_id | full_name | badge_number | certification_status | citation_citation_id | citation_issue_date | citation_violation_code |
|---|---|---|---|---|---|---|
| 103165 | Theodore Mcgrath | BAD-2782 | certified | strategic-networking | 2023-02-01 | 3355763 |
| 2933464 | Account Name | BAD-2786 | pending | 2933470 | 2024-07-12 | 2087745 |
| 10445622 | Saipan International Airport | BAD-2790 | expired | 4447022 | 2025-12-23 | 4074 |
| 7441150 | Norma Fisher | BAD-2794 | certified | bj1 | 2022-05-07 | 2002007020220 |

**View `vw_animal_services_officer_animal`**

```sql
CREATE VIEW vw_animal_services_officer_animal AS
SELECT a.officer_id, a.full_name, a.badge_number, a.certification_status, b.id AS animal_id, b.animal_id AS animal_animal_id, b.species AS animal_species
FROM animal_services_officers a JOIN animals b ON a.animal_id = b.id;
```

| officer_id | full_name | badge_number | certification_status | animal_id | animal_animal_id | animal_species |
|---|---|---|---|---|---|---|
| 103165 | Theodore Mcgrath | BAD-2782 | certified | 100 | 6511 | pilot-species-14 |
| 2933464 | Account Name | BAD-2786 | pending | 101 | 10966216 | extended-species-15 |
| 10445622 | Saipan International Airport | BAD-2790 | expired | 102 | 5844275 | integrated-species-16 |
| 7441150 | Norma Fisher | BAD-2794 | certified | 103 | 1250199 | seasonal-species-17 |

**View `vw_animal_incident_report`**

```sql
CREATE VIEW vw_animal_incident_report AS
SELECT a.id, a.animal_id, a.species, a.breed, b.id AS report_id, b.report_id AS report_report_id, b.incident_type AS report_incident_type
FROM animals a JOIN incident_reports b ON a.incident_report_id = b.id;
```

| id | animal_id | species | breed | report_id | report_report_id | report_incident_type |
|---|---|---|---|---|---|---|
| 100 | 6511 | pilot-species-14 | compact-breed-80 | 1 | 1202-0008-S | bite |
| 101 | 10966216 | extended-species-15 | composite-breed-81 | 2 | 8189500 | stray |
| 102 | 5844275 | integrated-species-16 | primary-breed-82 | 3 | L355 | nuisance |
| 103 | 1250199 | seasonal-species-17 | adaptive-breed-83 | 4 | 5844272 | complaint |

**View `vw_animal_adoption_assessment`**

```sql
CREATE VIEW vw_animal_adoption_assessment AS
SELECT a.id, a.animal_id, a.species, a.breed, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM animals a JOIN adoption_assessments b ON a.adoption_assessment_id = b.id;
```

| id | animal_id | species | breed | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 100 | 6511 | pilot-species-14 | compact-breed-80 | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 101 | 10966216 | extended-species-15 | composite-breed-81 | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 102 | 5844275 | integrated-species-16 | primary-breed-82 | 1002 | 506000 | 2024-03-05T18:58:00 |
| 103 | 1250199 | seasonal-species-17 | adaptive-breed-83 | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

**View `vw_incident_report_animal_services_officer`**

```sql
CREATE VIEW vw_incident_report_animal_services_officer AS
SELECT a.id, a.report_id, a.incident_type, a.reported_date, b.officer_id AS officer_officer_id, b.full_name AS officer_full_name, b.badge_number AS officer_badge_number
FROM incident_reports a JOIN animal_services_officers b ON a.officer_id = b.officer_id;
```

| id | report_id | incident_type | reported_date | officer_officer_id | officer_full_name | officer_badge_number |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | bite | 2025-04-27T03:09:00 | 103165 | Theodore Mcgrath | BAD-2782 |
| 2 | 8189500 | stray | 2022-09-11T10:26:00 | 2933464 | Account Name | BAD-2786 |
| 3 | L355 | nuisance | 2023-02-22T17:43:00 | 10445622 | Saipan International Airport | BAD-2790 |
| 4 | 5844272 | complaint | 2024-07-06T00:00:00 | 7441150 | Norma Fisher | BAD-2794 |

**View `vw_incident_report_animal`**

```sql
CREATE VIEW vw_incident_report_animal AS
SELECT a.id, a.report_id, a.incident_type, a.reported_date, b.id AS animal_id, b.animal_id AS animal_animal_id, b.species AS animal_species
FROM incident_reports a JOIN animals b ON a.animal_id = b.id;
```

| id | report_id | incident_type | reported_date | animal_id | animal_animal_id | animal_species |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | bite | 2025-04-27T03:09:00 | 100 | 6511 | pilot-species-14 |
| 2 | 8189500 | stray | 2022-09-11T10:26:00 | 101 | 10966216 | extended-species-15 |
| 3 | L355 | nuisance | 2023-02-22T17:43:00 | 102 | 5844275 | integrated-species-16 |
| 4 | 5844272 | complaint | 2024-07-06T00:00:00 | 103 | 1250199 | seasonal-species-17 |

**View `vw_incident_report_citation`**

```sql
CREATE VIEW vw_incident_report_citation AS
SELECT a.id, a.report_id, a.incident_type, a.reported_date, b.citation_id AS citation_citation_id, b.issue_date AS citation_issue_date, b.violation_code AS citation_violation_code
FROM incident_reports a JOIN citations b ON a.citation_id = b.citation_id;
```

| id | report_id | incident_type | reported_date | citation_citation_id | citation_issue_date | citation_violation_code |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | bite | 2025-04-27T03:09:00 | strategic-networking | 2023-02-01 | 3355763 |
| 2 | 8189500 | stray | 2022-09-11T10:26:00 | 2933470 | 2024-07-12 | 2087745 |
| 3 | L355 | nuisance | 2023-02-22T17:43:00 | 4447022 | 2025-12-23 | 4074 |
| 4 | 5844272 | complaint | 2024-07-06T00:00:00 | bj1 | 2022-05-07 | 2002007020220 |

**View `vw_citation_animal_services_officer`**

```sql
CREATE VIEW vw_citation_animal_services_officer AS
SELECT a.citation_id, a.issue_date, a.violation_code, a.fine_amount, b.officer_id AS officer_officer_id, b.full_name AS officer_full_name, b.badge_number AS officer_badge_number
FROM citations a JOIN animal_services_officers b ON a.officer_id = b.officer_id;
```

| citation_id | issue_date | violation_code | fine_amount | officer_officer_id | officer_full_name | officer_badge_number |
|---|---|---|---|---|---|---|
| strategic-networking | 2023-02-01 | 3355763 | 29.99 | 103165 | Theodore Mcgrath | BAD-2782 |
| 2933470 | 2024-07-12 | 2087745 | 16.11 | 2933464 | Account Name | BAD-2786 |
| 4447022 | 2025-12-23 | 4074 | 32.21 | 10445622 | Saipan International Airport | BAD-2790 |
| bj1 | 2022-05-07 | 2002007020220 | 35.45 | 7441150 | Norma Fisher | BAD-2794 |

**View `vw_citation_incident_report`**

```sql
CREATE VIEW vw_citation_incident_report AS
SELECT a.citation_id, a.issue_date, a.violation_code, a.fine_amount, b.id AS report_id, b.report_id AS report_report_id, b.incident_type AS report_incident_type
FROM citations a JOIN incident_reports b ON a.incident_report_id = b.id;
```

| citation_id | issue_date | violation_code | fine_amount | report_id | report_report_id | report_incident_type |
|---|---|---|---|---|---|---|
| strategic-networking | 2023-02-01 | 3355763 | 29.99 | 1 | 1202-0008-S | bite |
| 2933470 | 2024-07-12 | 2087745 | 16.11 | 2 | 8189500 | stray |
| 4447022 | 2025-12-23 | 4074 | 32.21 | 3 | L355 | nuisance |
| bj1 | 2022-05-07 | 2002007020220 | 35.45 | 4 | 5844272 | complaint |

**View `vw_adoption_assessment_animal`**

```sql
CREATE VIEW vw_adoption_assessment_animal AS
SELECT a.id, a.assessment_id, a.assessment_date, a.temperament_score, b.id AS animal_id, b.animal_id AS animal_animal_id, b.species AS animal_species
FROM adoption_assessments a JOIN animals b ON a.animal_id = b.id;
```

| id | assessment_id | assessment_date | temperament_score | animal_id | animal_animal_id | animal_species |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 14 | 100 | 6511 | pilot-species-14 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 25 | 101 | 10966216 | extended-species-15 |
| 1002 | 506000 | 2024-03-05T18:58:00 | 36 | 102 | 5844275 | integrated-species-16 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 47 | 103 | 1250199 | seasonal-species-17 |

**View `vw_adoption_assessment_animal_services_officer`**

```sql
CREATE VIEW vw_adoption_assessment_animal_services_officer AS
SELECT a.id, a.assessment_id, a.assessment_date, a.temperament_score, b.officer_id AS officer_officer_id, b.full_name AS officer_full_name, b.badge_number AS officer_badge_number
FROM adoption_assessments a JOIN animal_services_officers b ON a.officer_id = b.officer_id;
```

| id | assessment_id | assessment_date | temperament_score | officer_officer_id | officer_full_name | officer_badge_number |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 14 | 103165 | Theodore Mcgrath | BAD-2782 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 25 | 2933464 | Account Name | BAD-2786 |
| 1002 | 506000 | 2024-03-05T18:58:00 | 36 | 10445622 | Saipan International Airport | BAD-2790 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 47 | 7441150 | Norma Fisher | BAD-2794 |

**View `vw_adoption_assessment_adoption_record`**

```sql
CREATE VIEW vw_adoption_assessment_adoption_record AS
SELECT a.id, a.assessment_id, a.assessment_date, a.temperament_score, b.adoption_id AS record_adoption_id, b.adoption_date AS record_adoption_date, b.adopter_name AS record_adopter_name
FROM adoption_assessments a JOIN adoption_records b ON a.adoption_record_adoption_id = b.adoption_id;
```

| id | assessment_id | assessment_date | temperament_score | record_adoption_id | record_adoption_date | record_adopter_name |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 14 | 726055 | 2025-08-12 | Composite Programme |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 25 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-01-23 | Compact Standard A |
| 1002 | 506000 | 2024-03-05T18:58:00 | 36 | 1152667 | 2023-06-07 | Legacy Framework |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 47 | 9246307 | 2024-11-18 | Regional Protocol |

**View `vw_adoption_record_animal`**

```sql
CREATE VIEW vw_adoption_record_animal AS
SELECT a.adoption_id, a.adoption_date, a.adopter_name, a.adopter_contact, b.id AS animal_id, b.animal_id AS animal_animal_id, b.species AS animal_species
FROM adoption_records a JOIN animals b ON a.animal_id = b.id;
```

| adoption_id | adoption_date | adopter_name | adopter_contact | animal_id | animal_animal_id | animal_species |
|---|---|---|---|---|---|---|
| 726055 | 2025-08-12 | Composite Programme | Kimberly Smith | 100 | 6511 | pilot-species-14 |
| b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-01-23 | Compact Standard A | William Sherman | 101 | 10966216 | extended-species-15 |
| 1152667 | 2023-06-07 | Legacy Framework | Walter Pratt | 102 | 5844275 | integrated-species-16 |
| 9246307 | 2024-11-18 | Regional Protocol | Walter Pratt | 103 | 1250199 | seasonal-species-17 |

**View `vw_adoption_record_adoption_assessment`**

```sql
CREATE VIEW vw_adoption_record_adoption_assessment AS
SELECT a.adoption_id, a.adoption_date, a.adopter_name, a.adopter_contact, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM adoption_records a JOIN adoption_assessments b ON a.adoption_assessment_id = b.id;
```

| adoption_id | adoption_date | adopter_name | adopter_contact | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 726055 | 2025-08-12 | Composite Programme | Kimberly Smith | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-01-23 | Compact Standard A | William Sherman | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 1152667 | 2023-06-07 | Legacy Framework | Walter Pratt | 1002 | 506000 | 2024-03-05T18:58:00 |
| 9246307 | 2024-11-18 | Regional Protocol | Walter Pratt | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |
