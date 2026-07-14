## Domain Modelling and Relational Materialization

Animal control operations in this domain revolve around a single operational actor—the animal control officer—and the four classes of work that officer performs: vector control spraying, emergency response, safety training, and incident documentation. The ontology recognises five entity types (`AnimalControlOfficer`, `VectorControlActivity`, `AnimalEmergency`, `Animal`, `SafetyMeeting`) and one document type (`IncidentReport`), plus a many-to-many enrolment between officers and safety meetings. The relational schema normalises these concepts into seven base tables and derives thirteen analytical views that re-join the normalised facts into domain-level narratives.

**Table `animal_control_officers`**

| animal_control_officer_id | employee_id | full_name | certification_level | license_status | on_call_status | safety_coordinator_role | vector_control_activity_id | animal_emergency_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | Basic Animal Handling | Valid | Active | false | 1 | 1 |
| 101 | Tasha Rodriguez | Account Name | Euthanasia | Expired | Inactive | true | 2 | 2 |
| 102 | Theodore Mcgrath | Saipan International Airport | State of Texas Basic Animal Control | Suspended | Active | false | 3 | 3 |
| 103 | Peter Mcdowell | Norma Fisher | Basic Animal Handling | Valid | Inactive | true | 4 | 4 |

The `animal_control_officers` table is the central entity. Each row represents one officer, identified by `animal_control_officer_id` (a surrogate key such as `100` through `103`). The column `employee_id` stores the external personnel identifier—`Norma Fisher` in row `100`, `Tasha Rodriguez` in row `101`—while `full_name` carries a display name that in this dataset happens to be an organisation name (`Saipan International Airport` for officer `102`). Certification is captured in `certification_level` (`Basic Animal Handling`, `Euthanasia`, `State of Texas Basic Animal Control`), the regulatory standing in `license_status` (`Valid`, `Expired`, `Suspended`), and operational availability in `on_call_status` (`Active` or `Inactive`). The boolean `safety_coordinator_role` flags whether the officer serves as the safety lead for their unit. Two foreign-key columns, `vector_control_activity_id` and `animal_emergency_id`, point into the `vector_control_activities` and `animal_emergencies` tables respectively, encoding a one-to-one or one-to-few relationship between an officer and their assigned spraying or emergency records.

**Table `vector_control_activities`**

| id | activity_id | spray_date | treated_area | chemical_agent | calibration_status | report_status | animal_control_officer_id |
|---|---|---|---|---|---|---|---|
| 1 | 8843761 | 2025-04-06T03:33:00 | regional-treated-72 | distributed-chemical-48 | Pending | Draft | 100 |
| 2 | 4180957 | 2022-09-17T10:50:00 | legacy-treated-73 | baseline-chemical-49 | Calibrated | Submitted | 101 |
| 3 | 168545 | 2023-02-01T17:07:00 | compact-treated-74 | pilot-chemical-50 | Failed | Reviewed | 102 |
| 4 | default_chart_a_account_53 | 2024-07-12T00:24:00 | composite-treated-75 | extended-chemical-51 | Pending | Draft | 103 |

Vector control activities are captured in `vector_control_activities`, a table whose primary key is the synthetic `id` column. The column `activity_id` holds the external activity reference (`8843761`, `4180957`, `168545`, `default_chart_a_account_53`). Temporal and spatial context is stored in `spray_date` (ISO-8601 timestamps such as `2025-04-06T03:33:00`) and `treated_area` (`regional-treated-72`, `legacy-treated-73`). The chemical used is recorded in `chemical_agent` (`distributed-chemical-48`, `baseline-chemical-49`), while `calibration_status` (`Pending`, `Calibrated`, `Failed`) and `report_status` (`Draft`, `Submitted`, `Reviewed`) capture equipment readiness and document lifecycle. The foreign key `animal_control_officer_id` links each spraying event to the officer who performed it, establishing a many-to-one relationship: many vector control activities can be attributed to a single officer.

**Table `animal_emergencies`**

| id | emergency_id | incident_date_time | severity_level | location | resolution_status | requires_immobilization | animal_control_officer_id | animal_id | incident_report_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Invoice | 2022-01-08T00:48:00 | Low | extended-location-99 | Open | true | 100 | 100 | 100 |
| 2 | 4463645 | 2023-06-19T07:05:00 | Medium | integrated-location-100 | In Progress | false | 101 | 101 | 101 |
| 3 | state_uk_29 | 2024-11-03T14:22:00 | High | seasonal-location-101 | Resolved | true | 102 | 102 | 102 |
| 4 | 3012811 | 2025-04-14T21:39:00 | Critical | regional-location-102 | Closed | false | 103 | 103 | 103 |

The `animal_emergencies` table models field incidents involving animals. Its surrogate key `id` (values `1` through `4`) is distinct from the external `emergency_id` column (`Invoice`, `4463645`, `state_uk_29`, `3012811`). The incident is timestamped by `incident_date_time` (`2022-01-08T00:48:00` through `2025-04-14T21:39:00`), classified by `severity_level` (`Low`, `Medium`, `High`, `Critical`), located by `location` (`extended-location-99`, `integrated-location-100`), and tracked through `resolution_status` (`Open`, `In Progress`, `Resolved`, `Closed`). The boolean `requires_immobilization` indicates whether the animal needed sedation. Three foreign-key columns anchor the emergency to the broader operational graph: `animal_control_officer_id` (the responding officer), `animal_id` (the affected animal), and `incident_report_id` (the associated report). This table is the structural hub of the schema, connecting officers, animals, and incident documentation in a single fact record.

**Table `animals`**

| animal_id | species | breed | weight_kg | health_status | microchip_id | animal_emergency_id | animal_control_officer_id |
|---|---|---|---|---|---|---|---|
| 100 | pilot-species-14 | compact-breed-80 | 1.48 | Healthy | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 1 | 100 |
| 101 | extended-species-15 | composite-breed-81 | 0.385 | Injured | 778559 | 2 | 101 |
| 102 | integrated-species-16 | primary-breed-82 | 0.5465680900000001 | Sick | 1996925 | 3 | 102 |
| 103 | seasonal-species-17 | adaptive-breed-83 | 0.9 | Deceased | 4057 | 4 | 103 |

Individual animals are recorded in the `animals` table. The surrogate `animal_id` (`100`–`103`) is paired with biological attributes: `species` (`pilot-species-14`, `extended-species-15`), `breed` (`compact-breed-80`, `composite-breed-81`), `weight_kg` (ranging from `0.385` to `1.48`), and `health_status` (`Healthy`, `Injured`, `Sick`, `Deceased`). The `microchip_id` column stores a unique identifier such as `5f8fcc36-8fcd-11eb-924d-9cd76263cbd0` or a numeric code like `778559`. Two foreign keys, `animal_emergency_id` and `animal_control_officer_id`, link the animal to the emergency it was involved in and to the officer who handled it, respectively.

**Table `safety_meetings`**

| safety_meeting_id | meeting_id | meeting_date | facilitator | attendance_count | notes_status | concerns_raised | animal_control_officer_id |
|---|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | pilot-facilita-14 | 42 | Pending | 34 | 100 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | extended-facilita-15 | 1 | Processed | 44 | 101 |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | integrated-facilita-16 | 5 | Archived | 54 | 102 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | seasonal-facilita-17 | 30 | Pending | 64 | 103 |

Safety training is captured in `safety_meetings`. The surrogate `safety_meeting_id` (`1`–`4`) is paired with an external `meeting_id` (`20967529`, `ChIJd13ymnZu5kcRXM7jx5boJBs`, `gd_acc_763000`, `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`). The `meeting_date` column stores the timestamp (`2023-10-23T21:39:00` through `2025-08-18T11:13:00`), `facilitator` names the instructor (`pilot-facilita-14`, `extended-facilita-15`), and `attendance_count` records headcount (`42`, `1`, `5`, `30`). The `notes_status` column (`Pending`, `Processed`, `Archived`) tracks documentation progress, while `concerns_raised` is an integer count (`34`, `44`, `54`, `64`). The foreign key `animal_control_officer_id` links the meeting to its primary coordinator.

**Table `incident_reports`**

| id | report_id | report_date | report_type | injured_party | description | review_status | animal_emergency_id | animal_control_officer_id | safety_meeting_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 2024-03-02T02:54:00 | Accident | legacy-injured-13 | Extended Survey | Draft | 1 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 8189500 | 2025-08-13T09:11:00 | Injury | compact-injured-14 | Pilot Corridor A | Under Review | 2 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | L355 | 2022-01-24T16:28:00 | Emergency Response | composite-injured-15 | Baseline Series | Approved | 3 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 5844272 | 2023-06-08T23:45:00 | Accident | primary-injured-16 | Distributed Assessment | Draft | 4 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Incident documentation lives in `incident_reports`. The surrogate `id` (`100`–`103`) is distinct from the external `report_id` (`1202-0008-S`, `8189500`, `L355`, `5844272`). The `report_date` (`2024-03-02T02:54:00` through `2025-08-13T09:11:00`) and `report_type` (`Accident`, `Injury`, `Emergency Response`) classify the document. The `injured_party` column (`legacy-injured-13`, `compact-injured-14`) identifies the affected entity, while `description` provides a free-text summary (`Extended Survey`, `Pilot Corridor A`). The `review_status` (`Draft`, `Under Review`, `Approved`) tracks the approval workflow. Three foreign keys connect the report to its operational context: `animal_emergency_id` (the incident it documents), `animal_control_officer_id` (the authoring officer), and `safety_meeting_id` (the safety briefing it references). Audit timestamps `created_at` and `updated_at` record the document lifecycle.

**Table `meetings_officers`**

| safety_meeting_id | animal_control_officer_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `meetings_officers` table is a junction table that resolves a many-to-many relationship between `safety_meetings` and `animal_control_officers`. In this dataset each meeting is associated with one officer, but the schema supports multiple officers per meeting and multiple meetings per officer. The table contains foreign keys to both parent tables, enabling the database to represent any combination of officer–meeting enrolments without duplicating data.

The foreign-key topology of the schema can be summarised as follows. `animal_control_officer_id` appears as a foreign key in every other base table, making the officer the universal anchor. `vector_control_activities` references `animal_control_officers` (many activities per officer). `animal_emergencies` references `animal_control_officers`, `animals`, and `incident_reports` (one emergency per officer–animal–report triplet in this dataset, though the schema permits expansion). `animals` references `animal_emergencies` and `animal_control_officers`. `safety_meetings` references `animal_control_officers`. `incident_reports` references `animal_emergencies`, `animal_control_officers`, and `safety_meetings`. The junction table `meetings_officers` additionally links `safety_meetings` to `animal_control_officers` in a many-to-many fashion.

The materialised views reassemble these normalised facts into domain-level narratives. Each view answers a specific operational question by joining the relevant tables.

**View `vw_animal_control_officer_vector_control_activity`**

```sql
CREATE VIEW vw_animal_control_officer_vector_control_activity AS
SELECT a.animal_control_officer_id, a.employee_id, a.full_name, a.certification_level, b.id AS activity_id, b.activity_id AS activity_activity_id, b.spray_date AS activity_spray_date
FROM animal_control_officers a JOIN vector_control_activities b ON a.vector_control_activity_id = b.id;
```

| animal_control_officer_id | employee_id | full_name | certification_level | activity_id | activity_activity_id | activity_spray_date |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | Basic Animal Handling | 1 | 8843761 | 2025-04-06T03:33:00 |
| 101 | Tasha Rodriguez | Account Name | Euthanasia | 2 | 4180957 | 2022-09-17T10:50:00 |
| 102 | Theodore Mcgrath | Saipan International Airport | State of Texas Basic Animal Control | 3 | 168545 | 2023-02-01T17:07:00 |
| 103 | Peter Mcdowell | Norma Fisher | Basic Animal Handling | 4 | default_chart_a_account_53 | 2024-07-12T00:24:00 |

This view joins `animal_control_officers` with `vector_control_activities` on `animal_control_officer_id`, answering the question: "Which vector control activities did each officer perform, and what were the details of those spraying events?" A row for officer `100` (employee `Norma Fisher`) shows activity `8843761` sprayed on `2025-04-06` at `regional-treated-72` using `distributed-chemical-48` with `Pending` calibration and a `Draft` report. The view flattens the one-to-many relationship so that a single row per activity–officer pair is returned.

**View `vw_animal_control_officer_animal_emergency`**

```sql
CREATE VIEW vw_animal_control_officer_animal_emergency AS
SELECT a.animal_control_officer_id, a.employee_id, a.full_name, a.certification_level, b.id AS emergency_id, b.emergency_id AS emergency_emergency_id, b.incident_date_time AS emergency_incident_date_time
FROM animal_control_officers a JOIN animal_emergencies b ON a.animal_emergency_id = b.id;
```

| animal_control_officer_id | employee_id | full_name | certification_level | emergency_id | emergency_emergency_id | emergency_incident_date_time |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | Basic Animal Handling | 1 | Invoice | 2022-01-08T00:48:00 |
| 101 | Tasha Rodriguez | Account Name | Euthanasia | 2 | 4463645 | 2023-06-19T07:05:00 |
| 102 | Theodore Mcgrath | Saipan International Airport | State of Texas Basic Animal Control | 3 | state_uk_29 | 2024-11-03T14:22:00 |
| 103 | Peter Mcdowell | Norma Fisher | Basic Animal Handling | 4 | 3012811 | 2025-04-14T21:39:00 |

By joining `animal_control_officers` with `animal_emergencies`, this view answers: "Which emergencies did each officer respond to, and what were the severity and resolution details?" Officer `102` (employee `Theodore Mcgrath`) is linked to emergency `3` with severity `High` at `seasonal-location-101`, status `Resolved`, and `requires_immobilization` set to true. The view presents the officer's emergency response history in a single denormalised row per emergency.

**View `vw_vector_control_activity_animal_control_officer`**

```sql
CREATE VIEW vw_vector_control_activity_animal_control_officer AS
SELECT a.id, a.activity_id, a.spray_date, a.treated_area, b.animal_control_officer_id AS officer_animal_control_officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM vector_control_activities a JOIN animal_control_officers b ON a.animal_control_officer_id = b.animal_control_officer_id;
```

| id | activity_id | spray_date | treated_area | officer_animal_control_officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|---|
| 1 | 8843761 | 2025-04-06T03:33:00 | regional-treated-72 | 100 | Norma Fisher | Theodore Mcgrath |
| 2 | 4180957 | 2022-09-17T10:50:00 | legacy-treated-73 | 101 | Tasha Rodriguez | Account Name |
| 3 | 168545 | 2023-02-01T17:07:00 | compact-treated-74 | 102 | Theodore Mcgrath | Saipan International Airport |
| 4 | default_chart_a_account_53 | 2024-07-12T00:24:00 | composite-treated-75 | 103 | Peter Mcdowell | Norma Fisher |

This is the inverse perspective of the first view: it starts from the activity and asks "Which officer performed this spraying event?" The join direction is reversed, but the result set is equivalent. An activity with `id` `2` (external `4180957`, sprayed `2022-09-17` at `legacy-treated-73` with `Calibrated` equipment and `Submitted` report) is attributed to officer `101` (employee `Tasha Rodriguez`). This view is useful when querying from the activity side of the relationship.

**View `vw_animal_emergency_animal_control_officer`**

```sql
CREATE VIEW vw_animal_emergency_animal_control_officer AS
SELECT a.id, a.emergency_id, a.incident_date_time, a.severity_level, b.animal_control_officer_id AS officer_animal_control_officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM animal_emergencies a JOIN animal_control_officers b ON a.animal_control_officer_id = b.animal_control_officer_id;
```

| id | emergency_id | incident_date_time | severity_level | officer_animal_control_officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|---|
| 1 | Invoice | 2022-01-08T00:48:00 | Low | 100 | Norma Fisher | Theodore Mcgrath |
| 2 | 4463645 | 2023-06-19T07:05:00 | Medium | 101 | Tasha Rodriguez | Account Name |
| 3 | state_uk_29 | 2024-11-03T14:22:00 | High | 102 | Theodore Mcgrath | Saipan International Airport |
| 4 | 3012811 | 2025-04-14T21:39:00 | Critical | 103 | Peter Mcdowell | Norma Fisher |

This view joins `animal_emergencies` with `animal_control_officers` from the emergency's perspective, answering: "For each emergency, which officer responded and what are the officer's credentials?" Emergency `4` (external `3012811`, timestamp `2025-04-14T21:39:00`, severity `Critical`, location `regional-location-102`, status `Closed`) is linked to officer `103` (employee `Peter Mcdowell`, certification `Basic Animal Handling`, license `Valid`). The view is useful for auditing which officers handled high-severity incidents.

**View `vw_animal_emergency_animal`**

```sql
CREATE VIEW vw_animal_emergency_animal AS
SELECT a.id, a.emergency_id, a.incident_date_time, a.severity_level, b.animal_id AS animal_animal_id, b.species AS animal_species, b.breed AS animal_breed
FROM animal_emergencies a JOIN animals b ON a.animal_id = b.animal_id;
```

| id | emergency_id | incident_date_time | severity_level | animal_animal_id | animal_species | animal_breed |
|---|---|---|---|---|---|---|
| 1 | Invoice | 2022-01-08T00:48:00 | Low | 100 | pilot-species-14 | compact-breed-80 |
| 2 | 4463645 | 2023-06-19T07:05:00 | Medium | 101 | extended-species-15 | composite-breed-81 |
| 3 | state_uk_29 | 2024-11-03T14:22:00 | High | 102 | integrated-species-16 | primary-breed-82 |
| 4 | 3012811 | 2025-04-14T21:39:00 | Critical | 103 | seasonal-species-17 | adaptive-breed-83 |

This view joins `animal_emergencies` with `animals` on `animal_id`, answering: "Which animal was involved in each emergency, and what was its condition?" Emergency `1` (severity `Low`, status `Open`, requires immobilization) involved animal `100` of species `pilot-species-14`, breed `compact-breed-80`, weighing `1.48` kg, with health status `Healthy` and microchip `5f8fcc36-8fcd-11eb-924d-9cd76263cbd0`. Emergency `4` (severity `Critical`, status `Closed`) involved animal `103` of species `seasonal-species-17`, breed `adaptive-breed-83`, weighing `0.9` kg, with health status `Deceased`. This view is critical for post-incident analysis of animal outcomes.

**View `vw_animal_emergency_incident_report`**

```sql
CREATE VIEW vw_animal_emergency_incident_report AS
SELECT a.id, a.emergency_id, a.incident_date_time, a.severity_level, b.id AS report_id, b.report_id AS report_report_id, b.report_date AS report_report_date
FROM animal_emergencies a JOIN incident_reports b ON a.incident_report_id = b.id;
```

| id | emergency_id | incident_date_time | severity_level | report_id | report_report_id | report_report_date |
|---|---|---|---|---|---|---|
| 1 | Invoice | 2022-01-08T00:48:00 | Low | 100 | 1202-0008-S | 2024-03-02T02:54:00 |
| 2 | 4463645 | 2023-06-19T07:05:00 | Medium | 101 | 8189500 | 2025-08-13T09:11:00 |
| 3 | state_uk_29 | 2024-11-03T14:22:00 | High | 102 | L355 | 2022-01-24T16:28:00 |
| 4 | 3012811 | 2025-04-14T21:39:00 | Critical | 103 | 5844272 | 2023-06-08T23:45:00 |

This view joins `animal_emergencies` with `incident_reports` on `incident_report_id`, answering: "Which incident report documents each emergency, and what is the report's status?" Emergency `1` is documented by report `100` (external `1202-0008-S`, type `Accident`, date `2024-03-02`, injured party `legacy-injured-13`, description `Extended Survey`, review status `Draft`). Emergency `3` is documented by report `102` (external `L355`, type `Emergency Response`, date `2022-01-24`, injured party `composite-injured-15`, description `Baseline Series`, review status `Approved`). This view links operational incidents to their formal documentation.

**View `vw_animal_animal_emergency`**

```sql
CREATE VIEW vw_animal_animal_emergency AS
SELECT a.animal_id, a.species, a.breed, a.weight_kg, b.id AS emergency_id, b.emergency_id AS emergency_emergency_id, b.incident_date_time AS emergency_incident_date_time
FROM animals a JOIN animal_emergencies b ON a.animal_emergency_id = b.id;
```

| animal_id | species | breed | weight_kg | emergency_id | emergency_emergency_id | emergency_incident_date_time |
|---|---|---|---|---|---|---|
| 100 | pilot-species-14 | compact-breed-80 | 1.48 | 1 | Invoice | 2022-01-08T00:48:00 |
| 101 | extended-species-15 | composite-breed-81 | 0.385 | 2 | 4463645 | 2023-06-19T07:05:00 |
| 102 | integrated-species-16 | primary-breed-82 | 0.5465680900000001 | 3 | state_uk_29 | 2024-11-03T14:22:00 |
| 103 | seasonal-species-17 | adaptive-breed-83 | 0.9 | 4 | 3012811 | 2025-04-14T21:39:00 |

This view joins `animals` with `animal_emergencies` from the animal's perspective, answering: "For each animal, which emergency was it involved in, and what were the emergency's details?" Animal `101` (species `extended-species-15`, breed `composite-breed-81`, weight `0.385` kg, health `Injured`, microchip `778559`) was involved in emergency `2` (severity `Medium`, location `integrated-location-100`, status `In Progress`, does not require immobilization). Animal `102` (species `integrated-species-16`, breed `primary-breed-82`, weight `0.547` kg, health `Sick`, microchip `1996925`) was involved in emergency `3` (severity `High`, location `seasonal-location-101`, status `Resolved`, requires immobilization). This view supports animal-centric queries about incident history.

**View `vw_animal_animal_control_officer`**

```sql
CREATE VIEW vw_animal_animal_control_officer AS
SELECT a.animal_id, a.species, a.breed, a.weight_kg, b.animal_control_officer_id AS officer_animal_control_officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM animals a JOIN animal_control_officers b ON a.animal_control_officer_id = b.animal_control_officer_id;
```

| animal_id | species | breed | weight_kg | officer_animal_control_officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|---|
| 100 | pilot-species-14 | compact-breed-80 | 1.48 | 100 | Norma Fisher | Theodore Mcgrath |
| 101 | extended-species-15 | composite-breed-81 | 0.385 | 101 | Tasha Rodriguez | Account Name |
| 102 | integrated-species-16 | primary-breed-82 | 0.5465680900000001 | 102 | Theodore Mcgrath | Saipan International Airport |
| 103 | seasonal-species-17 | adaptive-breed-83 | 0.9 | 103 | Peter Mcdowell | Norma Fisher |

This view joins `animals` with `animal_control_officers` on `animal_control_officer_id`, answering: "Which officer handled each animal?" Animal `100` (species `pilot-species-14`, health `Healthy`) was handled by officer `100` (employee `Norma Fisher`, certification `Basic Animal Handling`, license `Valid`, on call `Active`). Animal `103` (species `seasonal-species-17`, health `Deceased`) was handled by officer `103` (employee `Peter Mcdowell`, certification `Basic Animal Handling`, license `Valid`, on call `Inactive`). This view is useful for workload analysis and officer performance tracking.

**View `vw_safety_meeting_animal_control_officer`**

```sql
CREATE VIEW vw_safety_meeting_animal_control_officer AS
SELECT a.safety_meeting_id, a.meeting_id, a.meeting_date, a.facilitator, b.animal_control_officer_id AS officer_animal_control_officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM safety_meetings a JOIN animal_control_officers b ON a.animal_control_officer_id = b.animal_control_officer_id;
```

| safety_meeting_id | meeting_id | meeting_date | facilitator | officer_animal_control_officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | pilot-facilita-14 | 100 | Norma Fisher | Theodore Mcgrath |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | extended-facilita-15 | 101 | Tasha Rodriguez | Account Name |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | integrated-facilita-16 | 102 | Theodore Mcgrath | Saipan International Airport |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | seasonal-facilita-17 | 103 | Peter Mcdowell | Norma Fisher |

This view joins `safety_meetings` with `animal_control_officers` on `animal_control_officer_id`, answering: "Which officer coordinated each safety meeting, and what were the meeting details?" Meeting `1` (external `20967529`, date `2023-10-23T21:39:00`, facilitator `pilot-facilita-14`, attendance `42`, notes `Pending`, concerns `34`) was coordinated by officer `100` (employee `Norma Fisher`, certification `Basic Animal Handling`). Meeting `4` (external `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`, date `2022-01-02T18:30:00`, facilitator `seasonal-facilita-17`, attendance `30`, notes `Pending`, concerns `64`) was coordinated by officer `103` (employee `Peter Mcdowell`). This view supports safety training compliance reporting.

**View `vw_safety_meeting_animal_control_officer_detail`**

```sql
CREATE VIEW vw_safety_meeting_animal_control_officer_detail AS
SELECT a.safety_meeting_id, a.meeting_id, a.meeting_date, b.animal_control_officer_id AS officer_animal_control_officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM safety_meetings a
  JOIN meetings_officers j ON j.safety_meeting_id = a.safety_meeting_id
  JOIN animal_control_officers b ON b.animal_control_officer_id = j.animal_control_officer_id;
```

| safety_meeting_id | meeting_id | meeting_date | officer_animal_control_officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | 100 | Norma Fisher | Theodore Mcgrath |
| 1 | 20967529 | 2023-10-23T21:39:00 | 101 | Tasha Rodriguez | Account Name |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | 101 | Tasha Rodriguez | Account Name |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | 102 | Theodore Mcgrath | Saipan International Airport |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | 102 | Theodore Mcgrath | Saipan International Airport |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | 103 | Peter Mcdowell | Norma Fisher |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | 103 | Peter Mcdowell | Norma Fisher |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | 100 | Norma Fisher | Theodore Mcgrath |

This view provides a detailed join between `safety_meetings` and `animal_control_officers`, likely including additional columns from the junction table `meetings_officers` to capture the many-to-many enrolment. It answers: "For each meeting–officer enrolment, what are the full meeting and officer details?" The inclusion of the junction table allows a single meeting to be associated with multiple officers, each appearing as a separate row in the view. This is the most granular view for safety training participation tracking.

**View `vw_incident_report_animal_emergency`**

```sql
CREATE VIEW vw_incident_report_animal_emergency AS
SELECT a.id, a.report_id, a.report_date, a.report_type, b.id AS emergency_id, b.emergency_id AS emergency_emergency_id, b.incident_date_time AS emergency_incident_date_time
FROM incident_reports a JOIN animal_emergencies b ON a.animal_emergency_id = b.id;
```

| id | report_id | report_date | report_type | emergency_id | emergency_emergency_id | emergency_incident_date_time |
|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 2024-03-02T02:54:00 | Accident | 1 | Invoice | 2022-01-08T00:48:00 |
| 101 | 8189500 | 2025-08-13T09:11:00 | Injury | 2 | 4463645 | 2023-06-19T07:05:00 |
| 102 | L355 | 2022-01-24T16:28:00 | Emergency Response | 3 | state_uk_29 | 2024-11-03T14:22:00 |
| 103 | 5844272 | 2023-06-08T23:45:00 | Accident | 4 | 3012811 | 2025-04-14T21:39:00 |

This view joins `incident_reports` with `animal_emergencies` on `animal_emergency_id`, answering: "For each incident report, which emergency does it document, and what were the emergency's details?" Report `100` (external `1202-0008-S`, type `Accident`, date `2024-03-02`, injured party `legacy-injured-13`, description `Extended Survey`, status `Draft`) documents emergency `1` (severity `Low`, location `extended-location-99`, status `Open`, requires immobilization). Report `102` (external `L355`, type `Emergency Response`, date `2022-01-24`, injured party `composite-injured-15`, description `Baseline Series`, status `Approved`) documents emergency `3` (severity `High`, location `seasonal-location-101`, status `Resolved`, requires immobilization). This view is essential for auditing the linkage between formal reports and field incidents.

**View `vw_incident_report_animal_control_officer`**

```sql
CREATE VIEW vw_incident_report_animal_control_officer AS
SELECT a.id, a.report_id, a.report_date, a.report_type, b.animal_control_officer_id AS officer_animal_control_officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM incident_reports a JOIN animal_control_officers b ON a.animal_control_officer_id = b.animal_control_officer_id;
```

| id | report_id | report_date | report_type | officer_animal_control_officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 2024-03-02T02:54:00 | Accident | 100 | Norma Fisher | Theodore Mcgrath |
| 101 | 8189500 | 2025-08-13T09:11:00 | Injury | 101 | Tasha Rodriguez | Account Name |
| 102 | L355 | 2022-01-24T16:28:00 | Emergency Response | 102 | Theodore Mcgrath | Saipan International Airport |
| 103 | 5844272 | 2023-06-08T23:45:00 | Accident | 103 | Peter Mcdowell | Norma Fisher |

This view joins `incident_reports` with `animal_control_officers` on `animal_control_officer_id`, answering: "Which officer authored each incident report, and what are the report details?" Report `101` (external `8189500`, type `Injury`, date `2025-08-13`, injured party `compact-injured-14`, description `Pilot Corridor A`, status `Under Review`) was authored by officer `101` (employee `Tasha Rodriguez`, certification `Euthanasia`, license `Expired`, on call `Inactive`). Report `103` (external `5844272`, type `Accident`, date `2023-06-08`, injured party `primary-injured-16`, description `Distributed Assessment`, status `Draft`) was authored by officer `103` (employee `Peter Mcdowell`). This view supports report authorship tracking and officer accountability.

**View `vw_incident_report_safety_meeting`**

```sql
CREATE VIEW vw_incident_report_safety_meeting AS
SELECT a.id, a.report_id, a.report_date, a.report_type, b.safety_meeting_id AS meeting_safety_meeting_id, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date
FROM incident_reports a JOIN safety_meetings b ON a.safety_meeting_id = b.safety_meeting_id;
```

| id | report_id | report_date | report_type | meeting_safety_meeting_id | meeting_meeting_id | meeting_meeting_date |
|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 2024-03-02T02:54:00 | Accident | 1 | 20967529 | 2023-10-23T21:39:00 |
| 101 | 8189500 | 2025-08-13T09:11:00 | Injury | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 |
| 102 | L355 | 2022-01-24T16:28:00 | Emergency Response | 3 | gd_acc_763000 | 2025-08-18T11:13:00 |
| 103 | 5844272 | 2023-06-08T23:45:00 | Accident | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 |

This view joins `incident_reports` with `safety_meetings` on `safety_meeting_id`, answering: "Which safety meeting does each incident report reference, and what were the meeting details?" Report `100` (external `1202-0008-S`, type `Accident`, description `Extended Survey`, status `Draft`) references safety meeting `1` (external `20967529`, date `2023-10-23T21:39:00`, facilitator `pilot-facilita-14`, attendance `42`, concerns `34`). Report `102` (external `L355`, type `Emergency Response`, description `Baseline Series`, status `Approved`) references safety meeting `3` (external `gd_acc_763000`, date `2025-08-18T11:13:00`, facilitator `integrated-facilita-16`, attendance `5`, concerns `54`). This view links incident documentation to the safety training context, supporting compliance audits that verify whether officers referenced appropriate safety briefings in their reports.

The schema design reflects a deliberate trade-off between normalisation and query convenience. The seven base tables eliminate redundancy: an officer's certification and license status are stored once in `animal_control_officers`, an animal's species and breed once in `animals`, and a safety meeting's date and facilitator once in `safety_meetings`. Foreign keys enforce referential integrity across the operational graph, while the junction table `meetings_officers` preserves the flexibility of many-to-many relationships. The thirteen views materialise the most common analytical queries as virtual tables, allowing analysts to ask domain-level questions—"which officer handled which animal in which emergency?" or "which incident report references which safety meeting?"—without writing explicit joins. The result is a schema that is both faithful to the underlying ontology and practical for operational reporting.