## Animal Control Operations: Records, Response, and Accountability

Municipal animal control agencies manage a complex web of field operations, regulatory compliance, and public safety incidents. Officers patrol designated zones, conduct vector control treatments, respond to animal emergencies, document injuries and accidents, and participate in mandatory safety meetings. Every action generates a record, and every record ties back to a specific officer, a specific animal, or a specific incident. The following reference describes the data structures that capture these operations, the relationships that link them, and the analytical views that bring them together for oversight and decision-making.

**Table `animal_control_officers`**

| animal_control_officer_id | employee_id | full_name | certification_level | license_status | on_call_status | safety_coordinator_role | vector_control_activity_id | animal_emergency_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | Basic Animal Handling | Valid | Active | false | 1 | 1 |
| 101 | Tasha Rodriguez | Account Name | Euthanasia | Expired | Inactive | true | 2 | 2 |
| 102 | Theodore Mcgrath | Saipan International Airport | State of Texas Basic Animal Control | Suspended | Active | false | 3 | 3 |
| 103 | Peter Mcdowell | Norma Fisher | Basic Animal Handling | Valid | Inactive | true | 4 | 4 |

The animal control officers table forms the personnel backbone of the operation. Each row represents a single officer, identified by a unique `animal_control_officer_id` and cross-referenced by an `employee_id`. The `full_name` column stores the officer's name, while `certification_level` records their training tier — ranging from Basic Animal Handling to Euthanasia to State of Texas Basic Animal Control. The `license_status` field tracks whether the officer's license is Valid, Expired, or Suspended, and `on_call_status` indicates whether they are currently Active or Inactive for dispatch. The `safety_coordinator_role` boolean flags officers who hold additional safety oversight responsibilities. In the current roster, officer 100 (Norma Fisher) holds a Basic Animal Handling certification with a valid license and active on-call status, while officer 101 (Tasha Rodriguez) has an expired license and inactive status but serves as a safety coordinator. Officer 103 (Peter Mcdowell) also holds the safety coordinator role. Each officer is linked to at least one vector control activity and one animal emergency through foreign key columns, establishing the operational assignments that drive the rest of the system.

**Table `vector_control_activities`**

| id | activity_id | spray_date | treated_area | chemical_agent | calibration_status | report_status | animal_control_officer_id |
|---|---|---|---|---|---|---|---|
| 1 | 8843761 | 2025-04-06T03:33:00 | regional-treated-72 | distributed-chemical-48 | Pending | Draft | 100 |
| 2 | 4180957 | 2022-09-17T10:50:00 | legacy-treated-73 | baseline-chemical-49 | Calibrated | Submitted | 101 |
| 3 | 168545 | 2023-02-01T17:07:00 | compact-treated-74 | pilot-chemical-50 | Failed | Reviewed | 102 |
| 4 | default_chart_a_account_53 | 2024-07-12T00:24:00 | composite-treated-75 | extended-chemical-51 | Pending | Draft | 103 |

Vector control activities document the pesticide and chemical treatment operations conducted by officers to manage disease-carrying pests. Each record carries an `id`, a system-generated `activity_id`, and a `spray_date` timestamp indicating when the treatment occurred. The `treated_area` field describes the zone — for example, regional-treated-72 or compact-treated-74 — while `chemical_agent` identifies the substance used, such as distributed-chemical-48 or pilot-chemical-50. Calibration status (`calibration_status`) tracks whether the application equipment was Calibrated, Pending calibration, or had a Failed calibration check. The `report_status` column records the documentation stage: Draft, Submitted, or Reviewed. Critically, each activity is assigned to an `animal_control_officer_id`, creating a direct link between the field work and the responsible officer. Activity 1, conducted on 2025-04-06 by officer 100, used distributed-chemical-48 on regional-treated-72 with a pending calibration and a draft report. Activity 3, performed by officer 102 on 2023-02-01, involved pilot-chemical-50 on compact-treated-74 and recorded a failed calibration alongside a reviewed report, signaling a compliance concern that warrants follow-up.

**Table `animal_emergencies`**

| id | emergency_id | incident_date_time | severity_level | location | resolution_status | requires_immobilization | animal_control_officer_id | animal_id | incident_report_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Invoice | 2022-01-08T00:48:00 | Low | extended-location-99 | Open | true | 100 | 100 | 100 |
| 2 | 4463645 | 2023-06-19T07:05:00 | Medium | integrated-location-100 | In Progress | false | 101 | 101 | 101 |
| 3 | state_uk_29 | 2024-11-03T14:22:00 | High | seasonal-location-101 | Resolved | true | 102 | 102 | 102 |
| 4 | 3012811 | 2025-04-14T21:39:00 | Critical | regional-location-102 | Closed | false | 103 | 103 | 103 |

Animal emergencies capture the incidents that trigger officer dispatches. Each emergency record includes an `id`, an `emergency_id`, an `incident_date_time`, and a `severity_level` ranging from Low to Critical. The `location` field names the incident site — extended-location-99, integrated-location-100, seasonal-location-101, or regional-location-102 — and `resolution_status` tracks the case lifecycle: Open, In Progress, Resolved, or Closed. The boolean `requires_immobilization` indicates whether the animal involved needed sedation or physical restraint. Each emergency is assigned to an `animal_control_officer_id`, and may also reference a specific `animal_id` and an `incident_report_id`, weaving the emergency into the broader incident documentation chain. Emergency 1, logged on 2022-01-08 at extended-location-99, carried a Low severity, remained Open, and required immobilization. Emergency 4, recorded on 2025-04-14 at regional-location-102, reached a Critical severity level and achieved a Closed resolution, assigned to officer 103.

**Table `animals`**

| animal_id | species | breed | weight_kg | health_status | microchip_id | animal_emergency_id | animal_control_officer_id |
|---|---|---|---|---|---|---|---|
| 100 | pilot-species-14 | compact-breed-80 | 1.48 | Healthy | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 1 | 100 |
| 101 | extended-species-15 | composite-breed-81 | 0.385 | Injured | 778559 | 2 | 101 |
| 102 | integrated-species-16 | primary-breed-82 | 0.5465680900000001 | Sick | 1996925 | 3 | 102 |
| 103 | seasonal-species-17 | adaptive-breed-83 | 0.9 | Deceased | 4057 | 4 | 103 |

The animals table maintains individual records for animals involved in emergencies or under officer care. Each entry specifies a `species` (pilot-species-14, extended-species-15, integrated-species-16, seasonal-species-17), a `breed` (compact-breed-80, composite-breed-81, primary-breed-82, adaptive-breed-83), and a `weight_kg` measurement. The `health_status` column classifies the animal as Healthy, Injured, Sick, or Deceased. A `microchip_id` provides a unique identifier for tracking and reunification purposes. Each animal record links to an `animal_emergency_id` and an `animal_control_officer_id`, anchoring the animal to both the incident and the responding officer. Animal 100, weighing 1.48 kg, was classified as Healthy and linked to emergency 1 and officer 100. Animal 103, weighing 0.9 kg, was recorded as Deceased and associated with emergency 4 and officer 103.

**Table `safety_meetings`**

| safety_meeting_id | meeting_id | meeting_date | facilitator | attendance_count | notes_status | concerns_raised | animal_control_officer_id |
|---|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | pilot-facilita-14 | 42 | Pending | 34 | 100 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | extended-facilita-15 | 1 | Processed | 44 | 101 |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | integrated-facilita-16 | 5 | Archived | 54 | 102 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | seasonal-facilita-17 | 30 | Pending | 64 | 103 |

Safety meetings document the mandatory compliance and training sessions that officers attend. Each meeting record contains a `safety_meeting_id`, a system-generated `meeting_id`, a `meeting_date`, and the `facilitator` who led the session. The `attendance_count` records how many officers were present, while `notes_status` tracks the documentation state: Pending, Processed, or Archived. The `concerns_raised` integer quantifies safety issues or topics discussed during the meeting. Each meeting is assigned to an `animal_control_officer_id`, indicating the officer for whom the meeting record was created. Meeting 1, facilitated by pilot-facilita-14 on 2023-10-23, drew 42 attendees and logged 34 concerns raised, with notes still in Pending status. Meeting 3, facilitated by integrated-facilita-16 on 2025-08-18, had 5 attendees, 54 concerns raised, and notes in Archived status.

**Table `incident_reports`**

| id | report_id | report_date | report_type | injured_party | description | review_status | animal_emergency_id | animal_control_officer_id | safety_meeting_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 2024-03-02T02:54:00 | Accident | legacy-injured-13 | Extended Survey | Draft | 1 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 8189500 | 2025-08-13T09:11:00 | Injury | compact-injured-14 | Pilot Corridor A | Under Review | 2 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | L355 | 2022-01-24T16:28:00 | Emergency Response | composite-injured-15 | Baseline Series | Approved | 3 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 5844272 | 2023-06-08T23:45:00 | Accident | primary-injured-16 | Distributed Assessment | Draft | 4 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Incident reports provide formal documentation of accidents, injuries, and emergency responses. Each report includes an `id`, a `report_id` (such as 1202-0008-S or L355), a `report_date`, and a `report_type` — Accident, Injury, or Emergency Response. The `injured_party` field names the affected individual or entity, and `description` provides a narrative summary, such as Extended Survey or Pilot Corridor A. The `review_status` column tracks the report's approval workflow: Draft, Under Review, or Approved. Each report links to an `animal_emergency_id`, an `animal_control_officer_id`, and a `safety_meeting_id`, creating a three-way connection between the incident, the responding officer, and the relevant safety meeting. Report 100, dated 2024-03-02, classified as an Accident involving legacy-injured-13, remains in Draft status. Report 102, dated 2022-01-24 and classified as Emergency Response involving composite-injured-15, has achieved Approved status.

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

The meetings_officers table serves as a junction record linking safety meetings to the officers who attended them. This many-to-many relationship allows a single meeting to be associated with multiple officers and, conversely, allows an officer to attend multiple meetings over time. The table captures the administrative linkage that ensures attendance is properly recorded and auditable.

The base tables above store the raw operational data. To answer practical oversight questions — which officers handled which emergencies, which animals were involved in which incidents, which safety meetings correlate with which reports — the system provides a set of joined views. Each view answers a specific analytical question by combining data from two or more tables.

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

This view joins animal control officers with their assigned vector control activities, answering the question: which officer conducted which chemical treatment, and what was the status of that treatment? The joined result surfaces the officer's name, certification level, and license status alongside the activity's spray date, treated area, chemical agent, and calibration and report statuses. An officer with an expired license conducting a treatment with a failed calibration would immediately stand out for compliance review.

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

This view links officers to the animal emergencies they responded to, answering: which officer handled which emergency, and what was the severity and resolution status? The joined record includes the officer's full name and on-call status alongside the emergency's incident date, severity level, location, and whether immobilization was required. This view supports workload analysis and response-time auditing.

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

This view presents the same officer-activity relationship from the vector control side, answering: for a given spray operation, who was the responsible officer and what are their current credentials? The joined result surfaces the activity's chemical agent and calibration status alongside the officer's certification level and license status, enabling quick verification that the assigned officer was properly credentialed at the time of treatment.

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

This view presents the emergency-officer relationship from the emergency side, answering: for a given emergency incident, which officer was dispatched and what is their current operational status? The joined record includes the emergency's severity level and resolution status alongside the officer's name, certification, and on-call status, supporting post-incident review and resource allocation analysis.

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

This view joins animal emergencies with the animals involved, answering: which animal was associated with which emergency, and what was its health status? The joined result surfaces the emergency's severity level and location alongside the animal's species, breed, weight, and health classification. An emergency with a Critical severity linked to a Deceased animal would flag a high-priority case for review.

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

This view connects animal emergencies with their corresponding incident reports, answering: which emergency generated which formal report, and what is the report's review status? The joined record includes the emergency's severity and resolution status alongside the report's type, description, and review status. An emergency in Resolved status paired with a report still in Draft status would indicate incomplete documentation that needs attention.

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

This view presents the animal-emergency relationship from the animal side, answering: for a given animal, which emergency was it involved in and what were the emergency's circumstances? The joined result surfaces the animal's species, breed, weight, and health status alongside the emergency's incident date, severity level, and resolution status, supporting animal-level case tracking and outcome analysis.

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

This view links animals directly to the officers who cared for them, answering: which officer was assigned to which animal? The joined record includes the animal's species, breed, and health status alongside the officer's name, certification level, and license status, enabling accountability tracking for animal welfare outcomes.

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

This view joins safety meetings with the officers they are associated with, answering: which officer attended which meeting, and how many concerns were raised? The joined result surfaces the meeting's date, facilitator, attendance count, and concerns raised alongside the officer's name and certification level, supporting compliance auditing and training record verification.

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

This view provides a detailed officer-meeting join, answering the same question with additional context. The joined record includes the full meeting metadata — meeting ID, facilitator, notes status — alongside the officer's complete profile, enabling supervisors to verify that each officer has attended the required number of safety meetings and that meeting notes have been properly processed.

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

This view joins incident reports with their associated animal emergencies, answering: which report corresponds to which emergency, and how do their statuses align? The joined record includes the report's type, description, and review status alongside the emergency's severity level, location, and resolution status. This view is essential for ensuring that every emergency has a corresponding, properly reviewed incident report.

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

This view links incident reports to the officers who filed them, answering: which officer documented which incident, and what is the report's current review status? The joined result surfaces the report's type, description, and review status alongside the officer's name, certification level, and license status, supporting accountability and quality assurance for incident documentation.

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

This view connects incident reports with safety meetings, answering: which safety meeting is associated with which incident report? The joined record includes the report's type, description, and review status alongside the meeting's date, facilitator, attendance count, and concerns raised. This view supports the analysis of whether safety meeting topics correlate with subsequent incident patterns, enabling data-driven improvements to training and protocols.

The animal control data ecosystem captures a complete operational lifecycle: officers are credentialed and assigned, they conduct vector control treatments, respond to animal emergencies involving specific animals, document incidents through formal reports, and participate in safety meetings that track compliance and concerns. The base tables store each layer of this process, while the joined views synthesize the relationships that matter for oversight — linking personnel to their work, animals to their incidents, and meetings to the reports they help prevent. Together, these records form an auditable trail that supports accountability, resource planning, and continuous improvement in municipal animal control operations.