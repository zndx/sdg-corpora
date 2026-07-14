## Field Operations and Case Management in Animal Services

Animal services departments operate at the intersection of public safety, animal welfare, and municipal regulation. Every day, officers respond to bite incidents, stray animal reports, and citizen complaints, documenting each encounter through a structured workflow that spans patrol assignment, incident investigation, citation issuance, and, where applicable, animal intake and adoption. The records captured across this workflow form a coherent narrative: a patrol is dispatched to an area, an officer investigates, an animal is identified, a citation may be issued, and the animal's fate is determined through assessment and adoption. Understanding how these records interlock is essential for any practitioner responsible for case management, compliance tracking, or operational oversight.

**Table `animal_control_patrols`**

| animal_control_patrol_id | patrol_id | assigned_area | start_time | end_time | patrol_type | weather_conditions | officer_badge_number | officer_id | incident_report_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10238262 | distributed-assigned-78 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | emergency | distributed-weather-42 | OFF-2116 | 103165 | 1 |
| 2 | 2106715 | baseline-assigned-79 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | non-emergency | baseline-weather-43 | OFF-2118 | 2933464 | 2 |
| 3 | 69444 | pilot-assigned-80 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | routine | pilot-weather-44 | OFF-2120 | 10445622 | 3 |
| 4 | 5243 | extended-assigned-81 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | emergency | extended-weather-45 | OFF-2122 | 7441150 | 4 |

Patrol assignments form the operational backbone of animal control work. Each patrol record captures when and where an officer was deployed, the nature of the deployment, and the environmental conditions under which it occurred. Patrol identifiers such as `10238262` and `2106715` anchor each assignment to a specific window of activity. The `assigned_area` column encodes the geographic or administrative zone—values like `distributed-assigned-78` and `baseline-assigned-79` distinguish between zones that receive different levels of coverage. The `patrol_type` field separates routine monitoring from emergency response; in the sample data, patrols are classified as `routine`, `emergency`, or `non-emergency`. Weather conditions are recorded alongside each patrol, with values such as `distributed-weather-42` and `pilot-weather-44` providing context for how environmental factors may have influenced officer effectiveness. The `officer_badge_number` and `officer_id` columns tie each patrol to a specific individual, while the `incident_report_id` links the patrol to the case it was intended to address.

**Table `animal_services_officers`**

| officer_id | full_name | badge_number | certification_status | driver_license_status | drug_test_status | criminal_history_status | citation_id | animal_id |
|---|---|---|---|---|---|---|---|---|
| 103165 | Theodore Mcgrath | BAD-2782 | certified | valid | pass | clear | strategic-networking | 100 |
| 2933464 | Account Name | BAD-2786 | pending | suspended | fail | flagged | 2933470 | 101 |
| 10445622 | Saipan International Airport | BAD-2790 | expired | revoked | pending | pending | 4447022 | 102 |
| 7441150 | Norma Fisher | BAD-2794 | certified | valid | pass | clear | bj1 | 103 |

The officers who execute these patrols carry a range of certifications and clearances that determine their operational readiness. The `animal_services_officers` table records each officer's full name, badge number, and a series of status flags. Certification status, for instance, takes values such as `certified`, `pending`, and `expired`—officer `Theodore Mcgrath` (badge `BAD-2782`) holds a `certified` status, while `Saipan International Airport` (badge `BAD-2790`) has an `expired` certification, which may restrict the types of cases they can handle. Driver license status ranges from `valid` to `suspended` to `revoked`, and drug test results are recorded as `pass`, `fail`, or `pending`. The `criminal_history_status` column uses values like `clear`, `flagged`, and `pending` to indicate background-check outcomes. These status fields collectively determine whether an officer is fit for field duty, and they are referenced whenever an officer is assigned to a patrol, incident, citation, or assessment.

**Table `animals`**

| id | animal_id | species | breed | age | weight | health_status | temperament | impound_status | incident_report_id | adoption_assessment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 6511 | pilot-species-14 | compact-breed-80 | 35 | 1.02669 | healthy | aggressive | free | 1 | 1000 |
| 101 | 10966216 | extended-species-15 | composite-breed-81 | 40 | 0.6 | injured | friendly | impounded | 2 | 1001 |
| 102 | 5844275 | integrated-species-16 | primary-breed-82 | 45 | 0.48410348 | ill | fearful | adopted | 3 | 1002 |
| 103 | 1250199 | seasonal-species-17 | adaptive-breed-83 | 50 | 0.6000001 | deceased | neutral | euthanized | 4 | 1003 |

Animals enter the system through incident response or direct intake, and each animal record captures its identifying information, physical characteristics, and current disposition. The `animals` table uses an internal `id` alongside a secondary `animal_id` for cross-referencing. Species and breed are encoded with values such as `pilot-species-14` and `compact-breed-80`, while age and weight provide physical context—an animal with `id` `100` is recorded at age `35` and weight `1.02669`, whereas an animal with `id` `103` is age `50` and weight `0.6000001`. Health status ranges across `healthy`, `injured`, `ill`, and `deceased`, and temperament is classified as `aggressive`, `friendly`, `fearful`, or `neutral`. The `impound_status` column tracks the animal's current placement: `free`, `impounded`, `adopted`, or `euthanized`. Each animal record is linked to an incident report and an adoption assessment, anchoring it within the broader case workflow.

**Table `incident_reports`**

| id | report_id | incident_type | reported_date | location | severity | resolution_status | citizen_complaint_id | officer_id | animal_id | citation_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | bite | 2025-04-27T03:09:00 | extended-location-99 | low | open | 407 | 103165 | 100 | strategic-networking |
| 2 | 8189500 | stray | 2022-09-11T10:26:00 | integrated-location-100 | medium | investigating | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | 2933464 | 101 | 2933470 |
| 3 | L355 | nuisance | 2023-02-22T17:43:00 | seasonal-location-101 | high | closed | 2087733 | 10445622 | 102 | 4447022 |
| 4 | 5844272 | complaint | 2024-07-06T00:00:00 | regional-location-102 | critical | escalated | 8350037 | 7441150 | 103 | bj1 |

Incident reports are the central case files of animal services operations. Each report is assigned a unique identifier—`1202-0008-S`, `8189500`, `L355`, and `5844272` in the sample data—and records the type of incident, the date it was reported, the location, and its severity. Incident types include `bite`, `stray`, `nuisance`, and `complaint`, each triggering different investigative protocols. Severity levels span `low`, `medium`, `high`, and `critical`, with higher severities often requiring escalated response. The `resolution_status` column tracks case progression through stages such as `open`, `investigating`, `closed`, and `escalated`. Each report is associated with a specific officer and animal, and may reference a citizen complaint and a citation, forming the connective tissue between field activity and administrative follow-up.

**Table `citations`**

| citation_id | issue_date | violation_code | fine_amount | court_date | payment_status | officer_notes | officer_id | incident_report_id |
|---|---|---|---|---|---|---|---|---|
| strategic-networking | 2023-02-01 | 3355763 | 29.99 | 2025-04-25 | unpaid | adaptive-officer-59 | 103165 | 1 |
| 2933470 | 2024-07-12 | 2087745 | 16.11 | 2022-09-09 | paid | distributed-officer-60 | 2933464 | 2 |
| 4447022 | 2025-12-23 | 4074 | 32.21 | 2023-02-20 | disputed | baseline-officer-61 | 10445622 | 3 |
| bj1 | 2022-05-07 | 2002007020220 | 35.45 | 2024-07-04 | dismissed | pilot-officer-62 | 7441150 | 4 |

When an incident warrants formal enforcement, a citation is issued. The `citations` table records the citation identifier, the date of issuance, the violation code, the fine amount, and the court date. Fine amounts in the sample data range from `16.11` to `35.45`, and payment status is tracked as `unpaid`, `paid`, `disputed`, or `dismissed`. Officer notes provide qualitative context—entries such as `adaptive-officer-59` and `pilot-officer-62` capture the responding officer's observations. Each citation is tied to a specific officer and incident report, ensuring that enforcement actions are traceable to the underlying case.

**Table `adoption_assessments`**

| id | assessment_id | assessment_date | temperament_score | health_score | adoptability_rating | special_needs | assessor_id | animal_id | officer_id | adoption_record_adoption_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 14 | 23 | highly_adoptable | false | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | 100 | 103165 | 726055 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 25 | 34 | moderately_adoptable | true | 4060646 | 101 | 2933464 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 |
| 1002 | 506000 | 2024-03-05T18:58:00 | 36 | 45 | low_adoptability | false | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | 102 | 10445622 | 1152667 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 47 | 56 | not_adoptable | true | 2933475 | 103 | 7441150 | 9246307 |

For animals entering the shelter system, an adoption assessment evaluates their suitability for placement. The `adoption_assessments` table records the assessment date, temperament and health scores, and an overall adoptability rating. Scores are numeric—temperament scores range from `14` to `47`, and health scores from `23` to `56`—while adoptability ratings take values such as `highly_adoptable`, `moderately_adoptable`, `low_adoptability`, and `not_adoptable`. The `special_needs` flag indicates whether the animal requires additional care or accommodation. Each assessment is linked to an assessor, an animal, and an officer, and it may reference an adoption record, completing the chain from intake to placement.

**Table `adoption_records`**

| adoption_id | adoption_date | adopter_name | adopter_contact | adoption_fee | follow_up_required | follow_up_status | animal_id | adoption_assessment_id |
|---|---|---|---|---|---|---|---|---|
| 726055 | 2025-08-12 | Composite Programme | Kimberly Smith | 19.97 | false | scheduled | 100 | 1000 |
| b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2022-01-23 | Compact Standard A | William Sherman | 43.48 | true | completed | 101 | 1001 |
| 1152667 | 2023-06-07 | Legacy Framework | Walter Pratt | 38.08 | false | failed | 102 | 1002 |
| 9246307 | 2024-11-18 | Regional Protocol | Walter Pratt | 14.31 | true | waived | 103 | 1003 |

Adoption records formalize the transfer of an animal from shelter to adopter. Each record carries an adoption identifier and is linked to the corresponding adoption assessment, creating a verifiable trail from evaluation to placement. The adoption record serves as the final administrative step in the animal's journey through the system, and its association with the assessment ensures that the adoptability rating and any special-needs requirements are documented at the point of transfer.

The power of the animal services data model lies not in individual tables but in the relationships that connect them. Views synthesize these relationships into actionable summaries, each answering a specific operational question.

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

This view joins patrol assignments with officer records, answering the question of which officer was deployed to which area under what conditions. A row linking patrol `10238262` to officer `Theodore Mcgrath` (badge `BAD-2782`) reveals that a certified officer with a valid driver's license and a clear criminal history was assigned to the `distributed-assigned-78` area during an `emergency` patrol. This join is essential for staffing audits and for verifying that the right officer was on duty for a given deployment.

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

By connecting patrols to incident reports, this view clarifies whether a patrol was dispatched in response to a specific case. The row pairing patrol `10238262` with incident report `1202-0008-S` (a `bite` incident of `low` severity) demonstrates how patrol records serve as the operational trigger for case investigation. Supervisors use this join to verify that every incident report has a corresponding patrol assignment and to analyze response times.

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

This view links officers to the citations they have issued, providing a direct measure of enforcement activity. Officer `Theodore Mcgrath` (officer ID `103165`) is associated with citation `strategic-networking`, which carries a fine of `29.99` and an `unpaid` status. The `officer_notes` field (`adaptive-officer-59`) adds qualitative detail. This join supports workload balancing, citation trend analysis, and compliance reviews.

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

Connecting officers to animals reveals which animals each officer has encountered or processed. Officer `Theodore Mcgrath` (ID `103165`) is linked to animal `100`, a `pilot-species-14` with `aggressive` temperament and `healthy` status. This relationship is critical for tracking officer expertise, managing caseloads, and ensuring continuity when animals move through multiple stages of the workflow.

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

This view ties animals directly to the incidents that brought them into the system. Animal `100` is associated with incident report `1202-0008-S`, a `bite` incident of `low` severity. The join clarifies the causal chain: an incident occurred, an animal was involved, and the animal's record was created or updated as a result. Case managers rely on this view to trace the origin of each animal intake.

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

Linking animals to their adoption assessments answers the question of how each animal was evaluated for placement. Animal `100` has assessment `template_ivacode_pagata_20det40ind`, with a temperament score of `14`, a health score of `23`, and a `highly_adoptable` rating. The `special_needs` flag is `false`, indicating no additional requirements. This join is the primary tool for adoption coordinators reviewing which animals are ready for placement and which need further intervention.

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

This view associates incident reports with the officers who investigated them. Incident `1202-0008-S` (a `bite` report) is linked to officer `Theodore Mcgrath` (ID `103165`). The join ensures accountability by documenting which officer was responsible for each case and enables supervisors to review officer performance across incident types and severity levels.

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

By connecting incident reports to the animals involved, this view reconstructs the full picture of each case. Incident `1202-0008-S` involved animal `100`, a `pilot-species-14` with `aggressive` temperament. This join is indispensable for risk assessment, as it allows analysts to correlate incident types and severities with animal characteristics such as species, temperament, and health status.

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

This view links incident reports to the citations issued as a result. Incident `1202-0008-S` is associated with citation `strategic-networking`, which carries a fine of `29.99` and an `unpaid` payment status. The join reveals the enforcement outcome of each incident and supports analysis of citation rates by incident type, severity, and location.

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

Reversing the officer-citation relationship, this view presents citations grouped by the issuing officer. Citation `strategic-networking` is attributed to officer `Theodore Mcgrath` (ID `103165`), who holds a `certified` status and a `valid` driver's license. This perspective is useful for individual officer performance reviews and for identifying patterns in citation issuance across the department.

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

This view connects citations back to their originating incident reports. Citation `strategic-networking` stems from incident `1202-0008-S`, a `bite` incident of `low` severity. The join provides a complete enforcement trail: the incident occurred, the officer responded, and the citation was issued. Legal and compliance teams use this view to verify that all citations are properly documented and linked to their underlying cases.

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

This view presents adoption assessments alongside the animals they evaluate. Assessment `template_ivacode_pagata_20det40ind` corresponds to animal `100`, a `pilot-species-14` with `aggressive` temperament. The assessment's `highly_adoptable` rating and `false` special-needs flag indicate that, despite its temperament, the animal is considered suitable for placement. Adoption coordinators use this join to prioritize animals for matching with potential adopters.

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

Linking assessments to the officers who conducted them reveals the human element of the evaluation process. Assessment `template_ivacode_pagata_20det40ind` was conducted by officer `Theodore Mcgrath` (ID `103165`). This join supports quality assurance by allowing supervisors to review assessor consistency and to identify training needs based on assessment outcomes.

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

This view connects adoption assessments to the adoption records that follow from them. Assessment `template_ivacode_pagata_20det40ind` is linked to adoption record `726055`. The join completes the adoption workflow, demonstrating how an assessment's rating directly informs the decision to proceed with placement. This relationship is the foundation for tracking adoption success rates and for auditing the intake-to-placement pipeline.

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

By linking adoption records to the animals they concern, this view provides a clear picture of which animals have been successfully placed. Adoption record `726055` corresponds to animal `100`, a `pilot-species-14` with `aggressive` temperament and `healthy` status. This join is the primary metric for adoption program performance, enabling managers to track placement volumes and timelines.

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

This view reverses the adoption record relationship, presenting each record alongside its originating assessment. Adoption record `726055` is tied to assessment `template_ivacode_pagata_20det40ind`, which rated the animal as `highly_adoptable` with a temperament score of `14` and a health score of `23`. The join ensures that every adoption is grounded in a documented evaluation, providing the audit trail required for regulatory compliance and for continuous improvement of the assessment process.

The animal services data model captures a complete operational lifecycle: patrols are dispatched, officers respond to incidents, animals are identified and assessed, citations are issued where warranted, and animals are placed through adoption. Each table records a distinct phase of this workflow, and each view synthesizes two or more phases into a coherent narrative. For practitioners, the value of this structure is not merely in storing data but in making the relationships between field activity, case management, and animal outcomes transparent and queryable. When a supervisor needs to know which officer handled the most `high`-severity incidents, or when an adoption coordinator needs to identify animals rated `highly_adoptable` that have not yet been placed, the interconnected records provide the answers. The system, as a whole, transforms individual encounters into institutional knowledge.