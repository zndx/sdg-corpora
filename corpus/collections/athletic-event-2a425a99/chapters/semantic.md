## Modelling Athletic Event Operations: From Ontology to Relational Schema

The athletic event management domain captures the lifecycle of organized sporting activities — from scheduling and facility allocation through participant registration, equipment provisioning, and post-event disciplinary oversight. At the conceptual level, the domain revolves around five core entity types: events, facilities, participants, equipment, and discipline reports — interconnected by transactional registrations and many-to-many associations that the relational schema materialises through a combination of foreign-key columns, junction tables, and denormalised views. The following sections walk through each base table, explain how attributes and cardinality-bounded relationships become columns and keys, and then interpret every view as a reconstructed domain fact.

**Table `athletic_events`**

| id | event_identifier | event_name | scheduled_start | scheduled_end | status | sport_type | facility_id |
|---|---|---|---|---|---|---|---|
| 1 | EVE-2706 | Seasonal Standard | 2025-12-07T11:45:00 | 2023-10-10T09:15:00 | scheduled | adaptive-sport-83 | 1 |
| 2 | EVE-2707 | Integrated Framework | 2022-05-18T18:02:00 | 2024-03-21T16:32:00 | in_progress | distributed-sport-84 | 2 |
| 3 | EVE-2708 | Extended Protocol D | 2023-10-02T01:19:00 | 2025-08-05T23:49:00 | completed | baseline-sport-85 | 3 |
| 4 | EVE-2709 | Pilot Programme | 2024-03-13T08:36:00 | 2022-01-16T06:06:00 | cancelled | pilot-sport-86 | 4 |

The `athletic_events` table is the central event entity. Its primary key `id` is an auto-incrementing surrogate, while the business-identifying column `event_identifier` carries human-readable codes such as `EVE-2706` through `EVE-2709`. The `event_name` column stores descriptive labels — `Seasonal Standard`, `Integrated Framework`, `Extended Protocol D`, and `Pilot Programme` — and the temporal window of each event is captured by `scheduled_start` and `scheduled_end`, both stored as ISO-8601 timestamps. The `status` column constrains events to a finite lifecycle: `scheduled`, `in_progress`, `completed`, or `cancelled`. The `sport_type` column encodes the discipline, with values like `adaptive-sport-83`, `distributed-sport-84`, `baseline-sport-85`, and `pilot-sport-86`. Finally, the foreign key `facility_id` binds each event to exactly one facility, enforcing a many-to-one relationship: multiple events may share a facility, but each event is hosted at a single location. Row 1 (`EVE-2706`, `Seasonal Standard`, status `scheduled`, sport `adaptive-sport-83`) is anchored to facility 1; row 4 (`EVE-2709`, `Pilot Programme`, status `cancelled`) is anchored to facility 4.

**Table `facilities`**

| id | facility_identifier | facility_name | location_address | capacity | is_secured | last_inspection_date | athletic_event_id | equipment_id |
|---|---|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | baseline-location-61 | 32 | false | 2025-04-12 | 1 | 1000 |
| 2 | FAC-2067 | Extended Programme | pilot-location-62 | 41 | true | 2022-09-23 | 2 | 1001 |
| 3 | FAC-2068 | Pilot Standard | extended-location-63 | 50 | false | 2023-02-07 | 3 | 1002 |
| 4 | FAC-2069 | Baseline Framework D | integrated-location-64 | 59 | true | 2024-07-18 | 4 | 1003 |

The `facilities` table models the physical venues. Its surrogate primary key `id` is paired with the business identifier `facility_identifier` (`FAC-2066` through `FAC-2069`) and the human-readable `facility_name` (`Integrated Protocol A`, `Extended Programme`, `Pilot Standard`, `Baseline Framework D`). The `location_address` column holds descriptive location strings such as `baseline-location-61` and `pilot-location-62`. Capacity is stored as an integer — values range from 32 to 59 across the sample data — and `is_secured` is a boolean flag indicating whether the venue is restricted. The `last_inspection_date` column records the most recent safety audit. Unusually for a facilities table, this schema embeds two foreign keys directly: `athletic_event_id` links a facility to the event it is currently hosting, and `equipment_id` links it to the primary equipment inventory assigned to it. This design choice collapses what might otherwise be a junction table into a cardinality-bounded one-to-one or one-to-few relationship, reflecting the operational assumption that each facility is dedicated to a single event at a time and equipped with a single primary equipment set.

**Table `participants`**

| id | participant_id | full_name | age | is_c_p_r_certified | drug_screen_status | criminal_check_status | athletic_event_id | discipline_report_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 3990185 | Theodore Mcgrath | 35 | true | cleared | cleared | 1 | 1 |
| 101 | 4716387 | Account Name | 40 | false | pending | pending | 2 | 2 |
| 102 | 69430 | Saipan International Airport | 45 | true | failed | flagged | 3 | 3 |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 50 | false | cleared | cleared | 4 | 4 |

The `participants` table stores the people who attend events. Its surrogate primary key `id` is distinct from the business-level `participant_id`, which carries identifiers such as `3990185`, `4716387`, `69430`, and the UUID `c7460a44-8fcc-11eb-924d-9cd76263cbd0`. The `full_name` column holds names like `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher`. Demographic and compliance attributes follow: `age` is an integer (35, 40, 45, 50 in the sample), `is_c_p_r_certified` is a boolean, and the two status columns `drug_screen_status` and `criminal_check_status` take values from the domain `{cleared, pending, failed, flagged}`. The foreign key `athletic_event_id` binds each participant to the event they are attending, while `discipline_report_id` links them to their most recent disciplinary record. Participant 100 (`Theodore Mcgrath`, age 35, CPR certified, drug screen `cleared`, criminal check `cleared`) is associated with event 1 and discipline report 1; participant 103 (`Norma Fisher`, age 50) is associated with event 4 and discipline report 4.

**Table `equipments`**

| equipment_id | equipment_name | condition | quantity | last_maintenance_date | athletic_event_id | facility_id |
|---|---|---|---|---|---|---|
| 1000 | Legacy Review D | good | 9 | 2024-03-27 | 1 | 1 |
| 1001 | Regional Initiative | damaged | 8 | 2025-08-11 | 2 | 2 |
| 1002 | Seasonal Model | lost | 0 | 2022-01-22 | 3 | 3 |
| 1003 | Integrated Cluster A | good | 12 | 2023-06-06 | 4 | 4 |

The `equipments` table models the physical gear deployed at events. Its primary key `equipment_id` carries values `1000` through `1003`, and the `equipment_name` column stores labels such as `Legacy Review D`, `Regional Initiative`, `Seasonal Model`, and `Integrated Cluster A`. The `condition` column constrains items to `{good, damaged, lost}`, while `quantity` is a non-negative integer (0 to 12 in the sample). The `last_maintenance_date` column records the most recent service date. Two foreign keys anchor equipment to the operational context: `athletic_event_id` links equipment to the event it serves, and `facility_id` links it to the venue where it is stored. Equipment 1000 (`Legacy Review D`, condition `good`, quantity 9) is assigned to event 1 and facility 1; equipment 1003 (`Integrated Cluster A`, condition `good`, quantity 12) is assigned to event 4 and facility 4.

**Table `discipline_reports`**

| id | report_id | incident_date | incident_type | severity_level | resolved | forwarded_to_coordinator | participant_id | athletic_event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2022-09-26T20:48:00 | injury | 29 | true | true | 100 | 1 |
| 2 | 8189500 | 2023-02-10T03:05:00 | misconduct | 40 | false | false | 101 | 2 |
| 3 | L355 | 2024-07-21T10:22:00 | dispute | 51 | true | true | 102 | 3 |
| 4 | 5844272 | 2025-12-05T17:39:00 | injury | 62 | false | false | 103 | 4 |

The `discipline_reports` table captures post-incident records. Its surrogate primary key `id` is paired with the business identifier `report_id`, which carries codes such as `1202-0008-S`, `8189500`, `L355`, and `5844272`. The `incident_date` column stores when the incident occurred, `incident_type` constrains to `{injury, misconduct, dispute}`, and `severity_level` is an integer (29, 40, 51, 62 in the sample). The boolean columns `resolved` and `forwarded_to_coordinator` track the administrative workflow. Two foreign keys bind a report to its context: `participant_id` links the report to the person involved, and `athletic_event_id` links it to the event where the incident took place. Report 1 (`1202-0008-S`, incident type `injury`, severity 29, resolved and forwarded) involves participant 100 at event 1; report 4 (`5844272`, incident type `injury`, severity 62, unresolved and not forwarded) involves participant 103 at event 4.

**Table `registrations`**

| registration_id | registration_date | fee_amount | payment_status | roster_number | athletic_event_id | participant_id |
|---|---|---|---|---|---|---|
| 2106693 | 2023-06-19T17:27:00 | 38.08 | pending | ROS-2324 | 1 | 100 |
| 778572 | 2024-11-03T00:44:00 | 18.47 | paid | ROS-2327 | 2 | 101 |
| 8387538 | 2025-04-14T07:01:00 | 38.08 | refunded | ROS-2330 | 3 | 102 |
| 4277008 | 2022-09-25T14:18:00 | 26.25 | pending | ROS-2333 | 4 | 103 |

The `registrations` table records the transactional act of enrolling a participant in an event. Its primary key `registration_id` carries large integers such as `2106693`, `778572`, `8387538`, and `4277008`. The `registration_date` column stores the timestamp of enrolment, `fee_amount` is a decimal (38.08, 18.47, 26.25 in the sample), and `payment_status` constrains to `{pending, paid, refunded}`. The `roster_number` column holds human-readable identifiers like `ROS-2324` through `ROS-2333`. Two foreign keys enforce the many-to-many relationship between participants and events: `athletic_event_id` and `participant_id`. Registration 2106693 (`ROS-2324`, fee 38.08, status `pending`) links event 1 to participant 100; registration 8387538 (`ROS-2330`, fee 38.08, status `refunded`) links event 3 to participant 102.

**Table `events_participants`**

| athletic_event_id | participant_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `events_participants` junction table materialises the many-to-many relationship between `athletic_events` and `participants` that the `registrations` table also captures through its dual foreign keys. This table exists as a dedicated association entity, likely to support additional metadata or audit trails beyond the registration transaction itself. Each row pairs an `event_id` with a `participant_id`, forming the combinatorial backbone that allows any participant to attend any event and any event to host any number of participants.

**Table `events_registrations`**

| athletic_event_id | registration_id |
|---|---|
| 1 | 2106693 |
| 1 | 778572 |
| 2 | 778572 |
| 2 | 8387538 |
| 3 | 8387538 |
| 3 | 4277008 |
| 4 | 4277008 |
| 4 | 2106693 |

The `events_registrations` junction table similarly materialises the many-to-many relationship between `athletic_events` and `registrations`. While the `registrations` table already carries an `athletic_event_id` foreign key, this junction table provides an explicit association layer, enabling the schema to track registration-to-event mappings independently of the registration's own attributes. Each row pairs a `registration_id` with an `event_id`.

With the base tables and junction tables defined, the schema provides a suite of views that denormalise the normalised structure into domain-meaningful facts. Each view joins two or more base tables to answer a specific operational question.

**View `v_athletic_event_facility`**

```sql
CREATE VIEW v_athletic_event_facility AS
SELECT a.id, a.event_identifier, a.event_name, a.scheduled_start, b.id AS facility_id, b.facility_identifier AS facility_facility_identifier, b.facility_name AS facility_facility_name
FROM athletic_events a JOIN facilities b ON a.facility_id = b.id;
```

| id | event_identifier | event_name | scheduled_start | facility_id | facility_facility_identifier | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | EVE-2706 | Seasonal Standard | 2025-12-07T11:45:00 | 1 | FAC-2066 | Integrated Protocol A |
| 2 | EVE-2707 | Integrated Framework | 2022-05-18T18:02:00 | 2 | FAC-2067 | Extended Programme |
| 3 | EVE-2708 | Extended Protocol D | 2023-10-02T01:19:00 | 3 | FAC-2068 | Pilot Standard |
| 4 | EVE-2709 | Pilot Programme | 2024-03-13T08:36:00 | 4 | FAC-2069 | Baseline Framework D |

The view `v_athletic_event_facility` joins `athletic_events` to `facilities` on the event-to-facility foreign key, reconstructing the fact of which venue hosts which event. It answers the question: "For each event, what is the hosting facility and its capacity?" Row 1 of the view would show `EVE-2706` (`Seasonal Standard`) hosted at `FAC-2066` (`Integrated Protocol A`) with capacity 32; row 4 would show `EVE-2709` (`Pilot Programme`) at `FAC-2069` (`Baseline Framework D`) with capacity 59. This view is the primary read model for event logistics planning.

**View `v_athletic_event_participant_detail`**

```sql
CREATE VIEW v_athletic_event_participant_detail AS
SELECT a.id, a.event_identifier, a.event_name, b.id AS participant_id, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name
FROM athletic_events a
  JOIN events_participants j ON j.athletic_event_id = a.id
  JOIN participants b ON b.id = j.participant_id;
```

| id | event_identifier | event_name | participant_id | participant_participant_id | participant_full_name |
|---|---|---|---|---|---|
| 1 | EVE-2706 | Seasonal Standard | 100 | 3990185 | Theodore Mcgrath |
| 1 | EVE-2706 | Seasonal Standard | 101 | 4716387 | Account Name |
| 2 | EVE-2707 | Integrated Framework | 101 | 4716387 | Account Name |
| 2 | EVE-2707 | Integrated Framework | 102 | 69430 | Saipan International Airport |
| 3 | EVE-2708 | Extended Protocol D | 102 | 69430 | Saipan International Airport |
| 3 | EVE-2708 | Extended Protocol D | 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 4 | EVE-2709 | Pilot Programme | 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 4 | EVE-2709 | Pilot Programme | 100 | 3990185 | Theodore Mcgrath |

The view `v_athletic_event_participant_detail` joins `athletic_events` to `participants` through the participant's `athletic_event_id` foreign key, producing a denormalised roster of who is attending which event along with their compliance status. It answers: "Which participants are enrolled in which events, and what are their clearance statuses?" Row 1 would show `EVE-2706` attended by `Theodore Mcgrath` (age 35, CPR certified, drug screen `cleared`, criminal check `cleared`); row 3 would show `EVE-2708` attended by `Saipan International Airport` (age 45, drug screen `failed`, criminal check `flagged`). This view supports eligibility screening and roster management.

**View `v_athletic_event_registration_detail`**

```sql
CREATE VIEW v_athletic_event_registration_detail AS
SELECT a.id, a.event_identifier, a.event_name, b.registration_id AS registration_registration_id, b.registration_date AS registration_registration_date, b.fee_amount AS registration_fee_amount
FROM athletic_events a
  JOIN events_registrations j ON j.athletic_event_id = a.id
  JOIN registrations b ON b.registration_id = j.registration_id;
```

| id | event_identifier | event_name | registration_registration_id | registration_registration_date | registration_fee_amount |
|---|---|---|---|---|---|
| 1 | EVE-2706 | Seasonal Standard | 2106693 | 2023-06-19T17:27:00 | 38.08 |
| 1 | EVE-2706 | Seasonal Standard | 778572 | 2024-11-03T00:44:00 | 18.47 |
| 2 | EVE-2707 | Integrated Framework | 778572 | 2024-11-03T00:44:00 | 18.47 |
| 2 | EVE-2707 | Integrated Framework | 8387538 | 2025-04-14T07:01:00 | 38.08 |
| 3 | EVE-2708 | Extended Protocol D | 8387538 | 2025-04-14T07:01:00 | 38.08 |
| 3 | EVE-2708 | Extended Protocol D | 4277008 | 2022-09-25T14:18:00 | 26.25 |
| 4 | EVE-2709 | Pilot Programme | 4277008 | 2022-09-25T14:18:00 | 26.25 |
| 4 | EVE-2709 | Pilot Programme | 2106693 | 2023-06-19T17:27:00 | 38.08 |

The view `v_athletic_event_registration_detail` joins `athletic_events` to `registrations` on the event identifier, reconstructing the financial and administrative record of each enrolment. It answers: "What fees have been collected for each event, and what is the payment status?" Row 1 would show `EVE-2706` with registration `2106693` (`ROS-2324`), fee 38.08, status `pending`; row 3 would show `EVE-2708` with registration `8387538` (`ROS-2330`), fee 38.08, status `refunded`. This view is the operational dashboard for finance reconciliation.

**View `v_facility_athletic_event`**

```sql
CREATE VIEW v_facility_athletic_event AS
SELECT a.id, a.facility_identifier, a.facility_name, a.location_address, b.id AS event_id, b.event_identifier AS event_event_identifier, b.event_name AS event_event_name
FROM facilities a JOIN athletic_events b ON a.athletic_event_id = b.id;
```

| id | facility_identifier | facility_name | location_address | event_id | event_event_identifier | event_event_name |
|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | baseline-location-61 | 1 | EVE-2706 | Seasonal Standard |
| 2 | FAC-2067 | Extended Programme | pilot-location-62 | 2 | EVE-2707 | Integrated Framework |
| 3 | FAC-2068 | Pilot Standard | extended-location-63 | 3 | EVE-2708 | Extended Protocol D |
| 4 | FAC-2069 | Baseline Framework D | integrated-location-64 | 4 | EVE-2709 | Pilot Programme |

The view `v_facility_athletic_event` joins `facilities` to `athletic_events` on the facility's `athletic_event_id` foreign key, inverting the perspective of `v_athletic_event_facility`. It answers: "For each facility, which event is currently scheduled there?" Row 1 would show `FAC-2066` (`Integrated Protocol A`) hosting `EVE-2706` (`Seasonal Standard`); row 2 would show `FAC-2067` (`Extended Programme`) hosting `EVE-2707` (`Integrated Framework`). This view supports facility scheduling and resource allocation.

**View `v_facility_equipment`**

```sql
CREATE VIEW v_facility_equipment AS
SELECT a.id, a.facility_identifier, a.facility_name, a.location_address, b.equipment_id AS equipment_equipment_id, b.equipment_name AS equipment_equipment_name, b.condition AS equipment_condition
FROM facilities a JOIN equipments b ON a.equipment_id = b.equipment_id;
```

| id | facility_identifier | facility_name | location_address | equipment_equipment_id | equipment_equipment_name | equipment_condition |
|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | baseline-location-61 | 1000 | Legacy Review D | good |
| 2 | FAC-2067 | Extended Programme | pilot-location-62 | 1001 | Regional Initiative | damaged |
| 3 | FAC-2068 | Pilot Standard | extended-location-63 | 1002 | Seasonal Model | lost |
| 4 | FAC-2069 | Baseline Framework D | integrated-location-64 | 1003 | Integrated Cluster A | good |

The view `v_facility_equipment` joins `facilities` to `equipments` on the facility's `equipment_id` foreign key, reconstructing the fact of which equipment inventory is assigned to which venue. It answers: "What equipment is deployed at each facility?" Row 1 would show `FAC-2066` (`Integrated Protocol A`) equipped with `Legacy Review D` (condition `good`, quantity 9); row 4 would show `FAC-2069` (`Baseline Framework D`) equipped with `Integrated Cluster A` (condition `good`, quantity 12). This view supports inventory management and maintenance scheduling.

**View `v_registration_athletic_event`**

```sql
CREATE VIEW v_registration_athletic_event AS
SELECT a.registration_id, a.registration_date, a.fee_amount, a.payment_status, b.id AS event_id, b.event_identifier AS event_event_identifier, b.event_name AS event_event_name
FROM registrations a JOIN athletic_events b ON a.athletic_event_id = b.id;
```

| registration_id | registration_date | fee_amount | payment_status | event_id | event_event_identifier | event_event_name |
|---|---|---|---|---|---|---|
| 2106693 | 2023-06-19T17:27:00 | 38.08 | pending | 1 | EVE-2706 | Seasonal Standard |
| 778572 | 2024-11-03T00:44:00 | 18.47 | paid | 2 | EVE-2707 | Integrated Framework |
| 8387538 | 2025-04-14T07:01:00 | 38.08 | refunded | 3 | EVE-2708 | Extended Protocol D |
| 4277008 | 2022-09-25T14:18:00 | 26.25 | pending | 4 | EVE-2709 | Pilot Programme |

The view `v_registration_athletic_event` joins `registrations` to `athletic_events` on the registration's `athletic_event_id` foreign key, providing the event context for each registration transaction. It answers: "Which event does each registration belong to, and what are the event's temporal details?" Row 1 would show registration `2106693` (`ROS-2324`) for `EVE-2706` (`Seasonal Standard`), scheduled from `2025-12-07T11:45:00`; row 4 would show registration `4277008` (`ROS-2333`) for `EVE-2709` (`Pilot Programme`), status `cancelled`. This view supports event-specific financial reporting.

**View `v_registration_participant`**

```sql
CREATE VIEW v_registration_participant AS
SELECT a.registration_id, a.registration_date, a.fee_amount, a.payment_status, b.id AS participant_id, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name
FROM registrations a JOIN participants b ON a.participant_id = b.id;
```

| registration_id | registration_date | fee_amount | payment_status | participant_id | participant_participant_id | participant_full_name |
|---|---|---|---|---|---|---|
| 2106693 | 2023-06-19T17:27:00 | 38.08 | pending | 100 | 3990185 | Theodore Mcgrath |
| 778572 | 2024-11-03T00:44:00 | 18.47 | paid | 101 | 4716387 | Account Name |
| 8387538 | 2025-04-14T07:01:00 | 38.08 | refunded | 102 | 69430 | Saipan International Airport |
| 4277008 | 2022-09-25T14:18:00 | 26.25 | pending | 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |

The view `v_registration_participant` joins `registrations` to `participants` on the registration's `participant_id` foreign key, reconstructing the participant-level detail for each enrolment. It answers: "Who registered for what, and what are their personal and compliance attributes?" Row 1 would show registration `2106693` (`ROS-2324`) by `Theodore Mcgrath` (age 35, CPR certified); row 3 would show registration `8387538` (`ROS-2330`) by `Saipan International Airport` (age 45, drug screen `failed`). This view is the primary read model for participant management and compliance auditing.

**View `v_participant_athletic_event`**

```sql
CREATE VIEW v_participant_athletic_event AS
SELECT a.id, a.participant_id, a.full_name, a.age, b.id AS event_id, b.event_identifier AS event_event_identifier, b.event_name AS event_event_name
FROM participants a JOIN athletic_events b ON a.athletic_event_id = b.id;
```

| id | participant_id | full_name | age | event_id | event_event_identifier | event_event_name |
|---|---|---|---|---|---|---|
| 100 | 3990185 | Theodore Mcgrath | 35 | 1 | EVE-2706 | Seasonal Standard |
| 101 | 4716387 | Account Name | 40 | 2 | EVE-2707 | Integrated Framework |
| 102 | 69430 | Saipan International Airport | 45 | 3 | EVE-2708 | Extended Protocol D |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 50 | 4 | EVE-2709 | Pilot Programme |

The view `v_participant_athletic_event` joins `participants` to `athletic_events` on the participant's `athletic_event_id` foreign key, producing a denormalised view of each participant's event assignment. It answers: "Which event is each participant attending?" Row 1 would show `Theodore Mcgrath` attending `EVE-2706` (`Seasonal Standard`, sport `adaptive-sport-83`); row 4 would show `Norma Fisher` attending `EVE-2709` (`Pilot Programme`, sport `pilot-sport-86`). This view supports participant scheduling and event-specific communications.

**View `v_participant_discipline_report`**

```sql
CREATE VIEW v_participant_discipline_report AS
SELECT a.id, a.participant_id, a.full_name, a.age, b.id AS report_id, b.report_id AS report_report_id, b.incident_date AS report_incident_date
FROM participants a JOIN discipline_reports b ON a.discipline_report_id = b.id;
```

| id | participant_id | full_name | age | report_id | report_report_id | report_incident_date |
|---|---|---|---|---|---|---|
| 100 | 3990185 | Theodore Mcgrath | 35 | 1 | 1202-0008-S | 2022-09-26T20:48:00 |
| 101 | 4716387 | Account Name | 40 | 2 | 8189500 | 2023-02-10T03:05:00 |
| 102 | 69430 | Saipan International Airport | 45 | 3 | L355 | 2024-07-21T10:22:00 |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 50 | 4 | 5844272 | 2025-12-05T17:39:00 |

The view `v_participant_discipline_report` joins `participants` to `discipline_reports` on the participant's `discipline_report_id` foreign key, reconstructing the compliance record for each participant. It answers: "What is the latest disciplinary status of each participant?" Row 1 would show `Theodore Mcgrath` with report `1202-0008-S` (incident type `injury`, severity 29, resolved); row 2 would show `Account Name` with report `8189500` (incident type `misconduct`, severity 40, unresolved). This view is critical for eligibility decisions and risk management.

**View `v_equipment_athletic_event`**

```sql
CREATE VIEW v_equipment_athletic_event AS
SELECT a.equipment_id, a.equipment_name, a.condition, a.quantity, b.id AS event_id, b.event_identifier AS event_event_identifier, b.event_name AS event_event_name
FROM equipments a JOIN athletic_events b ON a.athletic_event_id = b.id;
```

| equipment_id | equipment_name | condition | quantity | event_id | event_event_identifier | event_event_name |
|---|---|---|---|---|---|---|
| 1000 | Legacy Review D | good | 9 | 1 | EVE-2706 | Seasonal Standard |
| 1001 | Regional Initiative | damaged | 8 | 2 | EVE-2707 | Integrated Framework |
| 1002 | Seasonal Model | lost | 0 | 3 | EVE-2708 | Extended Protocol D |
| 1003 | Integrated Cluster A | good | 12 | 4 | EVE-2709 | Pilot Programme |

The view `v_equipment_athletic_event` joins `equipments` to `athletic_events` on the equipment's `athletic_event_id` foreign key, reconstructing the fact of which equipment is deployed at which event. It answers: "What gear is assigned to each event?" Row 1 would show `EVE-2706` (`Seasonal Standard`) equipped with `Legacy Review D` (condition `good`, quantity 9); row 3 would show `EVE-2708` (`Extended Protocol D`) equipped with `Seasonal Model` (condition `lost`, quantity 0). This view supports event logistics and equipment readiness checks.

**View `v_equipment_facility`**

```sql
CREATE VIEW v_equipment_facility AS
SELECT a.equipment_id, a.equipment_name, a.condition, a.quantity, b.id AS facility_id, b.facility_identifier AS facility_facility_identifier, b.facility_name AS facility_facility_name
FROM equipments a JOIN facilities b ON a.facility_id = b.id;
```

| equipment_id | equipment_name | condition | quantity | facility_id | facility_facility_identifier | facility_facility_name |
|---|---|---|---|---|---|---|
| 1000 | Legacy Review D | good | 9 | 1 | FAC-2066 | Integrated Protocol A |
| 1001 | Regional Initiative | damaged | 8 | 2 | FAC-2067 | Extended Programme |
| 1002 | Seasonal Model | lost | 0 | 3 | FAC-2068 | Pilot Standard |
| 1003 | Integrated Cluster A | good | 12 | 4 | FAC-2069 | Baseline Framework D |

The view `v_equipment_facility` joins `equipments` to `facilities` on the equipment's `facility_id` foreign key, reconstructing the venue-level equipment assignment. It answers: "Which facility stores which equipment?" Row 1 would show `FAC-2066` (`Integrated Protocol A`) storing `Legacy Review D` (condition `good`); row 4 would show `FAC-2069` (`Baseline Framework D`) storing `Integrated Cluster A` (condition `good`, quantity 12). This view supports facility-level inventory audits.

**View `v_discipline_report_participant`**

```sql
CREATE VIEW v_discipline_report_participant AS
SELECT a.id, a.report_id, a.incident_date, a.incident_type, b.id AS participant_id, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name
FROM discipline_reports a JOIN participants b ON a.participant_id = b.id;
```

| id | report_id | incident_date | incident_type | participant_id | participant_participant_id | participant_full_name |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2022-09-26T20:48:00 | injury | 100 | 3990185 | Theodore Mcgrath |
| 2 | 8189500 | 2023-02-10T03:05:00 | misconduct | 101 | 4716387 | Account Name |
| 3 | L355 | 2024-07-21T10:22:00 | dispute | 102 | 69430 | Saipan International Airport |
| 4 | 5844272 | 2025-12-05T17:39:00 | injury | 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |

The view `v_discipline_report_participant` joins `discipline_reports` to `participants` on the report's `participant_id` foreign key, reconstructing the person-level context for each incident record. It answers: "Which participant is associated with each disciplinary report?" Row 1 would show report `1202-0008-S` (incident type `injury`, severity 29) involving `Theodore Mcgrath` (age 35, CPR certified); row 4 would show report `5844272` (incident type `injury`, severity 62) involving `Norma Fisher` (age 50). This view supports incident investigation and participant risk profiling.

**View `v_discipline_report_athletic_event`**

```sql
CREATE VIEW v_discipline_report_athletic_event AS
SELECT a.id, a.report_id, a.incident_date, a.incident_type, b.id AS event_id, b.event_identifier AS event_event_identifier, b.event_name AS event_event_name
FROM discipline_reports a JOIN athletic_events b ON a.athletic_event_id = b.id;
```

| id | report_id | incident_date | incident_type | event_id | event_event_identifier | event_event_name |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2022-09-26T20:48:00 | injury | 1 | EVE-2706 | Seasonal Standard |
| 2 | 8189500 | 2023-02-10T03:05:00 | misconduct | 2 | EVE-2707 | Integrated Framework |
| 3 | L355 | 2024-07-21T10:22:00 | dispute | 3 | EVE-2708 | Extended Protocol D |
| 4 | 5844272 | 2025-12-05T17:39:00 | injury | 4 | EVE-2709 | Pilot Programme |

The view `v_discipline_report_athletic_event` joins `discipline_reports` to `athletic_events` on the report's `athletic_event_id` foreign key, reconstructing the event-level context for each incident. It answers: "At which event did each incident occur?" Row 1 would show report `1202-0008-S` (incident type `injury`, severity 29) at `EVE-2706` (`Seasonal Standard`, sport `adaptive-sport-83`); row 3 would show report `L355` (incident type `dispute`, severity 51) at `EVE-2708` (`Extended Protocol D`, sport `baseline-sport-85`). This view supports event safety analysis and post-event review.

The schema as a whole demonstrates a disciplined approach to normalisation: core entities are stored once in their own tables with surrogate primary keys, relationships are expressed through explicit foreign keys or dedicated junction tables, and denormalised views provide read-optimised projections that answer specific operational questions without requiring ad-hoc joins. The cardinality-bounded design — where facilities, participants, equipment, and discipline reports each carry a direct foreign key to `athletic_events` — reflects the domain assumption that these entities are event-centric: they exist in relation to a specific event instance. The junction tables `events_participants` and `events_registrations` provide an additional association layer for scenarios where the many-to-many relationship requires independent metadata. Together, the base tables and views form a complete, queryable representation of the athletic event management domain, where every row in every view can be traced back to a precise combination of normalised facts.