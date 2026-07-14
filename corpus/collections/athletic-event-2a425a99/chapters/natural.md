## The Athletic Events Management Domain

Organizations that coordinate multi-sport competitions, adaptive athletic programs, and pilot training initiatives rely on a structured information ecosystem to track events, facilities, participants, equipment, and compliance records. The domain centers on athletic events—each identified by a unique event code such as EVE-2706 or EVE-2707—and spans the full lifecycle from scheduling through completion or cancellation. Within this ecosystem, facilities serve as the physical anchor for events, participants carry individual credentials and compliance statuses, equipment is tracked by condition and quantity, and discipline reports capture incidents that arise during competition or training. The following reference describes how these entities interrelate, what measurements matter, and how joined views surface actionable information for operations staff.

## Event Infrastructure and Scheduling

Every athletic event is a first-class record with a structured identifier, a human-readable name, a scheduled start and end window, a current status, and a sport-type classification. The event roster includes entries such as EVE-2706, named "Seasonal Standard," classified as adaptive-sport-83, and EVE-2709, named "Pilot Programme," classified as pilot-sport-86 and carrying a cancelled status. Status values observed across the dataset are scheduled, in_progress, completed, and cancelled, each reflecting a distinct phase of the event lifecycle. Sport-type categories include adaptive-sport-83, distributed-sport-84, baseline-sport-85, and pilot-sport-86, providing a taxonomy for operational planning.

**Table `athletic_events`**

| id | event_identifier | event_name | scheduled_start | scheduled_end | status | sport_type | facility_id |
|---|---|---|---|---|---|---|---|
| 1 | EVE-2706 | Seasonal Standard | 2025-12-07T11:45:00 | 2023-10-10T09:15:00 | scheduled | adaptive-sport-83 | 1 |
| 2 | EVE-2707 | Integrated Framework | 2022-05-18T18:02:00 | 2024-03-21T16:32:00 | in_progress | distributed-sport-84 | 2 |
| 3 | EVE-2708 | Extended Protocol D | 2023-10-02T01:19:00 | 2025-08-05T23:49:00 | completed | baseline-sport-85 | 3 |
| 4 | EVE-2709 | Pilot Programme | 2024-03-13T08:36:00 | 2022-01-16T06:06:00 | cancelled | pilot-sport-86 | 4 |

Facilities provide the physical venue for events. Each facility record carries a facility identifier (FAC-2066 through FAC-2069), a facility name such as "Integrated Protocol A" or "Baseline Framework D," a location address drawn from categories like baseline-location-61 or integrated-location-64, a numeric capacity ranging from 32 to 59, a boolean flag indicating whether the facility is secured, and a last inspection date. The facility table also stores a foreign reference to an athletic event and to an equipment record, establishing a direct link between venue, event, and the gear deployed there.

**Table `facilities`**

| id | facility_identifier | facility_name | location_address | capacity | is_secured | last_inspection_date | athletic_event_id | equipment_id |
|---|---|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | baseline-location-61 | 32 | false | 2025-04-12 | 1 | 1000 |
| 2 | FAC-2067 | Extended Programme | pilot-location-62 | 41 | true | 2022-09-23 | 2 | 1001 |
| 3 | FAC-2068 | Pilot Standard | extended-location-63 | 50 | false | 2023-02-07 | 3 | 1002 |
| 4 | FAC-2069 | Baseline Framework D | integrated-location-64 | 59 | true | 2024-07-18 | 4 | 1003 |

The view v_athletic_event_facility joins athletic events to their assigned facilities, answering the question of which venue hosts which event and under what conditions. A row from this view might show EVE-2706 ("Seasonal Standard") mapped to FAC-2066 ("Integrated Protocol A"), a facility with a capacity of 32 that is not secured and was last inspected on 2025-04-12. Another row could pair EVE-2709 ("Pilot Programme") with FAC-2069 ("Baseline Framework D"), a secured facility with a capacity of 59 and an inspection date of 2024-07-18. This join is essential for logistics coordinators who need to verify venue readiness against event requirements.

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

The inverse perspective, captured by v_facility_athletic_event, starts from the facility and surfaces the event it hosts. This orientation is useful for facility managers who need to know what event is scheduled at their site. For instance, FAC-2067 ("Extended Programme") maps to EVE-2707 ("Integrated Framework"), a distributed-sport-84 event currently in progress, with the facility holding a capacity of 41 and a secured status. The view also carries the associated equipment identifier, enabling a quick cross-check of gear availability.

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

## Participant Management and Registration

Participants are the human core of the athletic events domain. Each participant record includes a numeric or UUID-based identifier (3990185, 4716387, 69430, or c7460a44-8fcc-11eb-924d-9cd76263cbd0), a full name such as Theodore Mcgrath or Norma Fisher, an age ranging from 35 to 50, a boolean flag indicating CPR certification, and two compliance statuses: drug_screen_status and criminal_check_status. These statuses take values of cleared, pending, or failed/flagged, and they determine whether a participant is eligible for competition. The participant table also references an athletic event and a discipline report, linking the individual to both the event they are entering and any incident record associated with them.

**Table `participants`**

| id | participant_id | full_name | age | is_c_p_r_certified | drug_screen_status | criminal_check_status | athletic_event_id | discipline_report_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 3990185 | Theodore Mcgrath | 35 | true | cleared | cleared | 1 | 1 |
| 101 | 4716387 | Account Name | 40 | false | pending | pending | 2 | 2 |
| 102 | 69430 | Saipan International Airport | 45 | true | failed | flagged | 3 | 3 |
| 103 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 50 | false | cleared | cleared | 4 | 4 |

Registrations formalize a participant's entry into an event. Each registration record carries a registration ID (2106693, 778572, 8387538, 4277008), a registration date, a fee amount (observed values include 38.08, 18.47, and 26.25), a payment status of pending, paid, or refunded, a roster number (ROS-2324 through ROS-2333), and foreign keys to both the athletic event and the participant. The registration is the transactional bridge between a person and an event, and its payment status directly affects roster finalization.

**Table `registrations`**

| registration_id | registration_date | fee_amount | payment_status | roster_number | athletic_event_id | participant_id |
|---|---|---|---|---|---|---|
| 2106693 | 2023-06-19T17:27:00 | 38.08 | pending | ROS-2324 | 1 | 100 |
| 778572 | 2024-11-03T00:44:00 | 18.47 | paid | ROS-2327 | 2 | 101 |
| 8387538 | 2025-04-14T07:01:00 | 38.08 | refunded | ROS-2330 | 3 | 102 |
| 4277008 | 2022-09-25T14:18:00 | 26.25 | pending | ROS-2333 | 4 | 103 |

The view v_athletic_event_participant_detail joins participants to their events, providing a consolidated picture of who is registered for which event and what their compliance standing is. A sample row might show participant 3990185 (Theodore Mcgrath, age 35, CPR-certified, drug screen cleared, criminal check cleared) associated with athletic event EVE-2706 ("Seasonal Standard"). Another row could display participant 69430 (Saipan International Airport, age 45, CPR-certified, drug screen failed, criminal check flagged) linked to EVE-2708 ("Extended Protocol D"). This view is critical for eligibility verification before an event begins.

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

The view v_registration_participant connects registration records to the participants they belong to, answering the question of which person has paid (or not paid) for a given event entry. A row from this view might show registration 778572, dated 2024-11-03, with a fee of 18.47 and a paid status, linked to participant 4716387 (Account Name, age 40, not CPR-certified). Another row could pair registration 8387538, dated 2025-04-14, with a refunded fee of 38.08, linked to participant 69430. This join supports financial reconciliation and roster management.

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

The view v_participant_athletic_event provides a direct mapping from participants to the events they are enrolled in, stripping away registration transactional detail to focus on the person-event relationship. For example, participant 100 (Theodore Mcgrath) is linked to event EVE-2706 ("Seasonal Standard"), while participant 103 (Norma Fisher) is linked to event EVE-2709 ("Pilot Programme"). This view is useful for generating participant rosters and verifying event-level attendance.

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

## Equipment and Resource Tracking

Equipment records track the physical gear deployed at events and facilities. Each equipment record carries an equipment ID (1000 through 1003), an equipment name such as "Legacy Review D" or "Integrated Cluster A," a condition value of good, damaged, or lost, a quantity (ranging from 0 to 12), a last maintenance date, and foreign keys to both the athletic event and the facility where the equipment is deployed. The condition field is a key operational indicator: equipment marked as lost or damaged may require replacement or repair before the next event cycle.

**Table `equipments`**

| equipment_id | equipment_name | condition | quantity | last_maintenance_date | athletic_event_id | facility_id |
|---|---|---|---|---|---|---|
| 1000 | Legacy Review D | good | 9 | 2024-03-27 | 1 | 1 |
| 1001 | Regional Initiative | damaged | 8 | 2025-08-11 | 2 | 2 |
| 1002 | Seasonal Model | lost | 0 | 2022-01-22 | 3 | 3 |
| 1003 | Integrated Cluster A | good | 12 | 2023-06-06 | 4 | 4 |

The view v_equipment_athletic_event joins equipment records to their associated events, answering the question of what gear is allocated to which event. A row from this view might show equipment 1000 ("Legacy Review D"), in good condition with a quantity of 9 and last maintained on 2024-03-27, deployed to event EVE-2706 ("Seasonal Standard"). Another row could display equipment 1002 ("Seasonal Model"), marked as lost with a quantity of 0 and last maintained on 2022-01-22, deployed to event EVE-2708 ("Extended Protocol D"). This view supports pre-event equipment audits and replacement planning.

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

The view v_equipment_facility joins equipment records to their assigned facilities, providing a facility-level inventory view. For instance, equipment 1001 ("Regional Initiative"), in damaged condition with a quantity of 8 and last maintained on 2025-08-11, is associated with facility FAC-2067 ("Extended Programme"). This join is essential for facility managers who need to know what equipment is on-site and whether any items require attention before the next event.

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

## Discipline and Incident Reporting

Discipline reports capture incidents that occur during athletic events. Each report carries an internal ID, a report identifier (1202-0008-S, 8189500, L355, 5844272), an incident date, an incident type of injury, misconduct, or dispute, a severity level (observed values range from 29 to 62), a boolean flag indicating whether the incident is resolved, a boolean flag indicating whether the report has been forwarded to a coordinator, and foreign keys to the participant involved and the athletic event where the incident occurred. The severity level is a numeric measure that likely corresponds to an internal scale, with higher values indicating more serious incidents.

**Table `discipline_reports`**

| id | report_id | incident_date | incident_type | severity_level | resolved | forwarded_to_coordinator | participant_id | athletic_event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2022-09-26T20:48:00 | injury | 29 | true | true | 100 | 1 |
| 2 | 8189500 | 2023-02-10T03:05:00 | misconduct | 40 | false | false | 101 | 2 |
| 3 | L355 | 2024-07-21T10:22:00 | dispute | 51 | true | true | 102 | 3 |
| 4 | 5844272 | 2025-12-05T17:39:00 | injury | 62 | false | false | 103 | 4 |

The view v_participant_discipline_report joins discipline reports to the participants they concern, answering the question of which participant has been associated with which incident. A row from this view might show report 1202-0008-S, an injury incident with severity level 29, resolved and forwarded to coordinator, linked to participant 100 (Theodore Mcgrath). Another row could display report 8189500, a misconduct incident with severity level 40, unresolved and not forwarded, linked to participant 101 (Account Name). This view supports participant accountability tracking and compliance review.

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

The view v_discipline_report_participant provides the inverse mapping, starting from the discipline report and surfacing the participant involved. This orientation is useful for incident investigators who need to quickly identify the person associated with a given report. For example, report L355, a dispute incident with severity level 51 that is resolved and forwarded, is linked to participant 102 (Saipan International Airport). The view also carries the athletic event context, enabling investigators to understand the event environment in which the incident occurred.

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

The view v_discipline_report_athletic_event joins discipline reports to their associated events, providing an event-level incident summary. A row from this view might show report 5844272, an injury incident with severity level 62, unresolved and not forwarded, linked to event EVE-2709 ("Pilot Programme"). This join is essential for event managers who need to assess the incident load on a given event and determine whether additional safety measures are needed.

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

## Cross-Reference and Enrollment Views

The domain includes two associative tables—events_participants and events_registrations—that serve as join tables between events and their related entities. These tables enable many-to-many relationships where a single participant may be enrolled in multiple events and a single event may host multiple participants. The events_participants table links event identifiers to participant identifiers, while events_registrations links event identifiers to registration identifiers, providing a layered enrollment model that separates the conceptual participation from the transactional registration.

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

The view v_athletic_event_registration_detail joins athletic events to their registrations, providing a comprehensive view of the enrollment status for each event. A row from this view might show event EVE-2706 ("Seasonal Standard") with registration 2106693, dated 2023-06-19, a fee of 38.08, and a pending payment status. Another row could pair event EVE-2708 ("Extended Protocol D") with registration 8387538, dated 2025-04-14, a fee of 38.08, and a refunded status. This view is critical for financial oversight and roster finalization.

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

The view v_registration_athletic_event provides the inverse mapping, starting from the registration and surfacing the event it belongs to. This orientation is useful for registration administrators who need to verify which event a given registration entry corresponds to. For instance, registration 4277008, dated 2022-09-25, with a fee of 26.25 and a pending status, is linked to event EVE-2709 ("Pilot Programme"). The view also carries the participant context, enabling a full trace from registration through participant to event.

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

The view v_facility_equipment joins facilities to their associated equipment, providing a facility-level equipment inventory. A row from this view might show facility FAC-2066 ("Integrated Protocol A") with equipment 1000 ("Legacy Review D"), in good condition with a quantity of 9. Another row could pair facility FAC-2068 ("Pilot Standard") with equipment 1002 ("Seasonal Model"), marked as lost with a quantity of 0. This view supports facility-level resource planning and equipment audits.

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

## Closing Synthesis

The athletic events management domain is a tightly coupled system of events, facilities, participants, equipment, registrations, and discipline reports. Each entity carries its own set of identifiers, attributes, and status flags, and the foreign-key relationships between them form a network that supports both operational queries and analytical reporting. Views such as v_athletic_event_facility, v_athletic_event_participant_detail, and v_discipline_report_athletic_event surface the joined relationships that matter most to different roles—logistics coordinators, eligibility verifiers, incident investigators, and facility managers. The data values observed across the tables, from event identifiers like EVE-2706 to severity levels like 62, reflect a domain where precision in identification and clarity in status tracking are essential to safe and effective event operations.