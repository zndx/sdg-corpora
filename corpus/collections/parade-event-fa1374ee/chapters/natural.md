# Parade Operations and Registration Management

Parade management is a logistical discipline that coordinates events, organizations, vehicles, and personnel through a structured registration pipeline. Municipal organizers must track which organizations participate in which events, what type of entry each organization submits, what vehicle carries the entry, and who operates that vehicle. The system records every stage of this coordination—from initial event scheduling through entry registration, vehicle inspection, and operator verification—ensuring that all participants meet safety and procedural requirements before the parade day arrives.

The foundation of the system is the event record, which captures the when, where, and regulatory framework for each parade.

**Table `parade_events`**

| parade_event_id | event_date | start_time | location_city | location_state | location_zip | organizing_municipality | is_diesel_powered_allowed | candy_throwing_prohibited |
|---|---|---|---|---|---|---|---|---|
| 1 | 2025-04-15 | 2024-03-27T14:42:00 | seasonal-location-23 | composite-location-93 | distributed-location-36 | integrated-organizi-82 | true | true |
| 2 | 2022-09-26 | 2025-08-11T21:59:00 | regional-location-24 | primary-location-94 | baseline-location-37 | seasonal-organizi-83 | false | false |
| 3 | 2023-02-10 | 2022-01-22T04:16:00 | legacy-location-25 | adaptive-location-95 | pilot-location-38 | regional-organizi-84 | true | true |
| 4 | 2024-07-21 | 2023-06-06T11:33:00 | compact-location-26 | distributed-location-96 | extended-location-39 | legacy-organizi-85 | false | false |

Each event carries a date, a start time, and a location described by city, state, and zip code. The organizing municipality is recorded as a free-text field, and two boolean flags govern the event's rules: whether diesel-powered vehicles are permitted and whether candy throwing is prohibited. Event 1, scheduled for April 15, 2025, allows diesel power and prohibits candy throwing. Event 2, on September 26, 2022, disallows diesel power and permits candy throwing. Event 3 (February 10, 2023) and Event 4 (July 21, 2024) follow the same alternating pattern. These regulatory flags propagate into the entry-level checks, ensuring that a vehicle's fuel type and an entry's giveaway method are consistent with the event's rules.

Organizations register to participate in specific events through a many-to-many relationship. An organization may appear in multiple events, and an event may host multiple organizations.

**Table `participating_organizations`**

| participating_organization_id | organization_name | contact_person_name | contact_phone | contact_email | street_address | city | state | zip_code | authorization_signature | submission_status | parade_entry_id | vehicle_operator_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Terri Patterson | Joe Tsai | Christopher Wilson | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | integrated-authoriz-22 | pending | 1 | 1000 |
| 2 | Oscar Health Inc. | Kelly Andrews | Stephanie Collins | Charles Larsen | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | seasonal-authoriz-23 | confirmed | 2 | 1001 |
| 3 | Atlantic Richfield | Rg Labs | Tasha Rodriguez | Mary Alvarez | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | regional-authoriz-24 | withdrawn | 3 | 1002 |
| 4 | Port Loko | Alfred Tennyson | Walter Pratt | April Snyder | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | legacy-authoriz-25 | pending | 4 | 1003 |

The participating organizations table stores each organization's name, a contact person, phone number, email, and full street address. It also records an authorization signature and a submission status—values such as `pending`, `confirmed`, or `withdrawn`—that reflects the organization's current standing in the registration pipeline. The entry `Staples Inc.` (organization 1) has a contact person named Terri Patterson and is currently in `pending` status. `Oscar Health Inc.` (organization 2) is `confirmed`, while `Atlantic Richfield` (organization 3) has `withdrawn`. `Port Loko` (organization 4) is also `pending`.

The linkage between events and organizations is maintained in a junction table.

**Table `events_organizations`**

| parade_event_id | participating_organization_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table maps event IDs to organization IDs. Event 1 includes organizations 1 and 2. Event 2 includes organizations 2 and 3. Event 3 includes organizations 3 and 4. Event 4 includes organizations 4 and 1. Each organization thus participates in exactly two events, forming a circular chain: 1→2→3→4→1. This structure allows the system to answer questions such as "which organizations are registered for event 3" or "in which events does Oscar Health Inc. participate."

Once an organization is linked to an event, it submits a parade entry that describes what it will present.

**Table `parade_entries`**

| parade_entry_id | entry_type | number_of_participants | is_diesel_powered | give_away_method | entry_status | participating_organization_id | parade_vehicle_id | vehicle_operator_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | float | 16 | false | hand-to-hand | registered | 1 | 1000 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | marching unit | 19 | true | prohibited | confirmed | 2 | 1001 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | animals | 22 | false | hand-to-hand | cancelled | 3 | 1002 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | musical group/band | 25 | true | prohibited | registered | 4 | 1003 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The parade entries table is the central hub of the registration model. Each entry has an `entry_type` (float, marching unit, animals, or musical group/band), a count of participants, a flag indicating whether it is diesel-powered, a `give_away_method` (hand-to-hand or prohibited), and an `entry_status` (registered, confirmed, or cancelled). Entry 1 is a float with 16 participants, non-diesel, using hand-to-hand giveaways, and currently `registered`. Entry 2 is a marching unit with 19 participants, diesel-powered, with giveaways prohibited, and `confirmed`. Entry 3 involves animals, has 22 participants, is non-diesel, uses hand-to-hand giveaways, but is `cancelled`. Entry 4 is a musical group/band with 25 participants, diesel-powered, with giveaways prohibited, and `registered`.

Each entry references a participating organization, a parade vehicle, and a vehicle operator, creating a chain of responsibility from the organization through the physical vehicle to the individual who drives it.

The parade vehicle record captures the physical asset associated with an entry.

**Table `parade_vehicles`**

| parade_vehicle_id | vehicle_type | is_diesel_powered | vehicle_identifier | vehicle_status | parade_entry_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | float | false | VEH-2163 | approved | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | specialty vehicle | true | VEH-2166 | pending inspection | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | military vehicle | false | VEH-2169 | rejected | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | other | true | VEH-2172 | approved | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Vehicles have a type (float, specialty vehicle, military vehicle, or other), a diesel-power flag, a unique vehicle identifier (such as `VEH-2163`), and a status (approved, pending inspection, or rejected). Vehicle 1000 is a float, non-diesel, identified as `VEH-2163`, with `approved` status. Vehicle 1001 is a specialty vehicle, diesel-powered, identified as `VEH-2166`, currently `pending inspection`. Vehicle 1002 is a military vehicle, non-diesel, identified as `VEH-2169`, with `rejected` status. Vehicle 1003 is classified as other, diesel-powered, identified as `VEH-2172`, and `approved`. The vehicle status provides an independent quality gate: even if an entry is registered, its vehicle may still be awaiting inspection or may have been rejected.

The individual responsible for operating the vehicle is recorded separately.

**Table `vehicle_operators`**

| id | full_name | drivers_license_number | operator_signature | operator_status | parade_entry_id | participating_organization_id |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | DRI-2255 | legacy-operator-31 | verified | 1 | 1 |
| 1001 | Account Name | DRI-2256 | compact-operator-32 | pending verification | 2 | 2 |
| 1002 | Saipan International Airport | DRI-2257 | composite-operator-33 | verified | 3 | 3 |
| 1003 | Norma Fisher | DRI-2258 | primary-operator-34 | pending verification | 4 | 4 |

Operators have a full name, a driver's license number, an operator signature reference, and an operator status (verified or pending verification). Operator 1000, Theodore Mcgrath, holds license `DRI-2255`, has a `verified` status, and is linked to entry 1 and organization 1. Operator 1001, listed as Account Name, holds license `DRI-2256`, is `pending verification`, and is linked to entry 2 and organization 2. Operator 1002, Saipan International Airport, holds license `DRI-2257`, is `verified`, and is linked to entry 3 and organization 3. Operator 1003, Norma Fisher, holds license `DRI-2258`, is `pending verification`, and is linked to entry 4 and organization 4. The operator status acts as a secondary compliance check: an operator must be verified before being cleared to drive.

The `events_entries` table provides an additional junction between events and entries, allowing entries to be queried directly by event without traversing the organization link.

**Table `events_entries`**

| parade_event_id | parade_entry_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table records which parade entries are associated with which events, completing the relational model that supports the various analytical views described below.

## Analytical Views

The system provides a set of materialized views that join the base tables to answer specific operational questions. Each view flattens a particular path through the relational graph, making it straightforward to report on the state of registrations, vehicle inspections, and operator clearances.

### Event-to-Organization Detail

**View `v_parade_event_participating_organization_detail`**

```sql
CREATE VIEW v_parade_event_participating_organization_detail AS
SELECT a.parade_event_id, a.event_date, a.start_time, b.participating_organization_id AS organization_participating_organization_id, b.organization_name AS organization_organization_name, b.contact_person_name AS organization_contact_person_name
FROM parade_events a
  JOIN events_organizations j ON j.parade_event_id = a.parade_event_id
  JOIN participating_organizations b ON b.participating_organization_id = j.participating_organization_id;
```

| parade_event_id | event_date | start_time | organization_participating_organization_id | organization_organization_name | organization_contact_person_name |
|---|---|---|---|---|---|
| 1 | 2025-04-15 | 2024-03-27T14:42:00 | 1 | Staples Inc. | Terri Patterson |
| 1 | 2025-04-15 | 2024-03-27T14:42:00 | 2 | Oscar Health Inc. | Kelly Andrews |
| 2 | 2022-09-26 | 2025-08-11T21:59:00 | 2 | Oscar Health Inc. | Kelly Andrews |
| 2 | 2022-09-26 | 2025-08-11T21:59:00 | 3 | Atlantic Richfield | Rg Labs |
| 3 | 2023-02-10 | 2022-01-22T04:16:00 | 3 | Atlantic Richfield | Rg Labs |
| 3 | 2023-02-10 | 2022-01-22T04:16:00 | 4 | Port Loko | Alfred Tennyson |
| 4 | 2024-07-21 | 2023-06-06T11:33:00 | 4 | Port Loko | Alfred Tennyson |
| 4 | 2024-07-21 | 2023-06-06T11:33:00 | 1 | Staples Inc. | Terri Patterson |

This view joins `parade_events` with `events_organizations` and `participating_organizations`, answering the question: "which organizations are registered for which events, and what are their contact details?" A row from this view might show event 1 (April 15, 2025, at seasonal-location-23) paired with Staples Inc. (contact: Terri Patterson, status: pending). Another row could show the same event paired with Oscar Health Inc. (contact: Kelly Andrews, status: confirmed). The view carries the event's regulatory flags (`is_diesel_powered_allowed`, `candy_throwing_prohibited`) alongside the organization's address and submission status, enabling organizers to verify that each organization's entry will comply with the event's rules.

### Event-to-Entry Detail

**View `v_parade_event_parade_entry_detail`**

```sql
CREATE VIEW v_parade_event_parade_entry_detail AS
SELECT a.parade_event_id, a.event_date, a.start_time, b.parade_entry_id AS entry_parade_entry_id, b.entry_type AS entry_entry_type, b.number_of_participants AS entry_number_of_participants
FROM parade_events a
  JOIN events_entries j ON j.parade_event_id = a.parade_event_id
  JOIN parade_entries b ON b.parade_entry_id = j.parade_entry_id;
```

| parade_event_id | event_date | start_time | entry_parade_entry_id | entry_entry_type | entry_number_of_participants |
|---|---|---|---|---|---|
| 1 | 2025-04-15 | 2024-03-27T14:42:00 | 1 | float | 16 |
| 1 | 2025-04-15 | 2024-03-27T14:42:00 | 2 | marching unit | 19 |
| 2 | 2022-09-26 | 2025-08-11T21:59:00 | 2 | marching unit | 19 |
| 2 | 2022-09-26 | 2025-08-11T21:59:00 | 3 | animals | 22 |
| 3 | 2023-02-10 | 2022-01-22T04:16:00 | 3 | animals | 22 |
| 3 | 2023-02-10 | 2022-01-22T04:16:00 | 4 | musical group/band | 25 |
| 4 | 2024-07-21 | 2023-06-06T11:33:00 | 4 | musical group/band | 25 |
| 4 | 2024-07-21 | 2023-06-06T11:33:00 | 1 | float | 16 |

This view joins `parade_events` with `events_entries` and `parade_entries`, answering: "what entries are planned for each event, and what are their characteristics?" A row might show event 2 (September 26, 2022) with entry 2, a marching unit of 19 participants, diesel-powered, with giveaways prohibited and status `confirmed`. Another row could show event 3 (February 10, 2023) with entry 3, an animal entry of 22 participants, non-diesel, with giveaways via hand-to-hand but status `cancelled`. The view surfaces the entry's participant count and status alongside the event's date and location, allowing organizers to assess the scale and composition of each event's lineup.

### Organization-to-Entry Detail

**View `v_participating_organization_parade_entry`**

```sql
CREATE VIEW v_participating_organization_parade_entry AS
SELECT a.participating_organization_id, a.organization_name, a.contact_person_name, a.contact_phone, b.parade_entry_id AS entry_parade_entry_id, b.entry_type AS entry_entry_type, b.number_of_participants AS entry_number_of_participants
FROM participating_organizations a JOIN parade_entries b ON a.parade_entry_id = b.parade_entry_id;
```

| participating_organization_id | organization_name | contact_person_name | contact_phone | entry_parade_entry_id | entry_entry_type | entry_number_of_participants |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Terri Patterson | Joe Tsai | 1 | float | 16 |
| 2 | Oscar Health Inc. | Kelly Andrews | Stephanie Collins | 2 | marching unit | 19 |
| 3 | Atlantic Richfield | Rg Labs | Tasha Rodriguez | 3 | animals | 22 |
| 4 | Port Loko | Alfred Tennyson | Walter Pratt | 4 | musical group/band | 25 |

This view joins `participating_organizations` with `parade_entries`, answering: "what entries has each organization submitted, and what is the current status of those entries?" A row might show Staples Inc. (organization 1, status: pending) with entry 1 (float, 16 participants, registered). Another row could show Atlantic Richfield (organization 3, status: withdrawn) with entry 3 (animals, 22 participants, cancelled). The view links the organization's submission status to the entry's status, revealing whether an organization's withdrawal corresponds to a cancelled entry or whether a pending organization has a registered entry awaiting confirmation.

### Organization-to-Operator Detail

**View `v_participating_organization_vehicle_operator`**

```sql
CREATE VIEW v_participating_organization_vehicle_operator AS
SELECT a.participating_organization_id, a.organization_name, a.contact_person_name, a.contact_phone, b.id AS operator_id, b.full_name AS operator_full_name, b.drivers_license_number AS operator_drivers_license_number
FROM participating_organizations a JOIN vehicle_operators b ON a.vehicle_operator_id = b.id;
```

| participating_organization_id | organization_name | contact_person_name | contact_phone | operator_id | operator_full_name | operator_drivers_license_number |
|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Terri Patterson | Joe Tsai | 1000 | Theodore Mcgrath | DRI-2255 |
| 2 | Oscar Health Inc. | Kelly Andrews | Stephanie Collins | 1001 | Account Name | DRI-2256 |
| 3 | Atlantic Richfield | Rg Labs | Tasha Rodriguez | 1002 | Saipan International Airport | DRI-2257 |
| 4 | Port Loko | Alfred Tennyson | Walter Pratt | 1003 | Norma Fisher | DRI-2258 |

This view joins `participating_organizations` with `vehicle_operators`, answering: "which operators are assigned to which organizations, and have they been verified?" A row might show Oscar Health Inc. (organization 2) with operator Account Name (license DRI-2256, status: pending verification). Another row could show Atlantic Richfield (organization 3) with operator Saipan International Airport (license DRI-2257, status: verified). The view enables organizers to identify organizations whose operators are still awaiting verification, flagging potential compliance gaps before the event.

### Entry-to-Organization Detail

**View `v_parade_entry_participating_organization`**

```sql
CREATE VIEW v_parade_entry_participating_organization AS
SELECT a.parade_entry_id, a.entry_type, a.number_of_participants, a.is_diesel_powered, b.participating_organization_id AS organization_participating_organization_id, b.organization_name AS organization_organization_name, b.contact_person_name AS organization_contact_person_name
FROM parade_entries a JOIN participating_organizations b ON a.participating_organization_id = b.participating_organization_id;
```

| parade_entry_id | entry_type | number_of_participants | is_diesel_powered | organization_participating_organization_id | organization_organization_name | organization_contact_person_name |
|---|---|---|---|---|---|---|
| 1 | float | 16 | false | 1 | Staples Inc. | Terri Patterson |
| 2 | marching unit | 19 | true | 2 | Oscar Health Inc. | Kelly Andrews |
| 3 | animals | 22 | false | 3 | Atlantic Richfield | Rg Labs |
| 4 | musical group/band | 25 | true | 4 | Port Loko | Alfred Tennyson |

This view joins `parade_entries` with `participating_organizations`, answering: "which organization is behind each entry, and what is that organization's current standing?" A row might show entry 4 (musical group/band, 25 participants, registered) linked to Port Loko (organization 4, status: pending). Another row could show entry 1 (float, 16 participants, registered) linked to Staples Inc. (organization 1, status: pending). This perspective is useful for entry-level reporting, where the focus is on the entry itself and the organization that submitted it.

### Entry-to-Vehicle Detail

**View `v_parade_entry_parade_vehicle`**

```sql
CREATE VIEW v_parade_entry_parade_vehicle AS
SELECT a.parade_entry_id, a.entry_type, a.number_of_participants, a.is_diesel_powered, b.parade_vehicle_id AS vehicle_parade_vehicle_id, b.vehicle_type AS vehicle_vehicle_type, b.is_diesel_powered AS vehicle_is_diesel_powered
FROM parade_entries a JOIN parade_vehicles b ON a.parade_vehicle_id = b.parade_vehicle_id;
```

| parade_entry_id | entry_type | number_of_participants | is_diesel_powered | vehicle_parade_vehicle_id | vehicle_vehicle_type | vehicle_is_diesel_powered |
|---|---|---|---|---|---|---|
| 1 | float | 16 | false | 1000 | float | false |
| 2 | marching unit | 19 | true | 1001 | specialty vehicle | true |
| 3 | animals | 22 | false | 1002 | military vehicle | false |
| 4 | musical group/band | 25 | true | 1003 | other | true |

This view joins `parade_entries` with `parade_vehicles`, answering: "what vehicle is assigned to each entry, and what is the vehicle's inspection status?" A row might show entry 2 (marching unit, diesel-powered) with vehicle 1001 (specialty vehicle, VEH-2166, pending inspection). Another row could show entry 3 (animals, non-diesel) with vehicle 1002 (military vehicle, VEH-2169, rejected). The view is critical for safety compliance: a vehicle with `rejected` status means the corresponding entry cannot proceed, regardless of its own registration status. The vehicle's diesel-power flag is also carried through, enabling cross-checks against the event's diesel-power allowance.

### Entry-to-Operator Detail

**View `v_parade_entry_vehicle_operator`**

```sql
CREATE VIEW v_parade_entry_vehicle_operator AS
SELECT a.parade_entry_id, a.entry_type, a.number_of_participants, a.is_diesel_powered, b.id AS operator_id, b.full_name AS operator_full_name, b.drivers_license_number AS operator_drivers_license_number
FROM parade_entries a JOIN vehicle_operators b ON a.vehicle_operator_id = b.id;
```

| parade_entry_id | entry_type | number_of_participants | is_diesel_powered | operator_id | operator_full_name | operator_drivers_license_number |
|---|---|---|---|---|---|---|
| 1 | float | 16 | false | 1000 | Theodore Mcgrath | DRI-2255 |
| 2 | marching unit | 19 | true | 1001 | Account Name | DRI-2256 |
| 3 | animals | 22 | false | 1002 | Saipan International Airport | DRI-2257 |
| 4 | musical group/band | 25 | true | 1003 | Norma Fisher | DRI-2258 |

This view joins `parade_entries` with `vehicle_operators`, answering: "who is the operator for each entry, and has that operator been verified?" A row might show entry 1 (float, registered) with operator Theodore Mcgrath (license DRI-2255, verified). Another row could show entry 4 (musical group/band, registered) with operator Norma Fisher (license DRI-2258, pending verification). The view highlights entries whose operators are still pending verification, providing a clear action item for the registration team.

### Vehicle-to-Entry Detail

**View `v_parade_vehicle_parade_entry`**

```sql
CREATE VIEW v_parade_vehicle_parade_entry AS
SELECT a.parade_vehicle_id, a.vehicle_type, a.is_diesel_powered, a.vehicle_identifier, b.parade_entry_id AS entry_parade_entry_id, b.entry_type AS entry_entry_type, b.number_of_participants AS entry_number_of_participants
FROM parade_vehicles a JOIN parade_entries b ON a.parade_entry_id = b.parade_entry_id;
```

| parade_vehicle_id | vehicle_type | is_diesel_powered | vehicle_identifier | entry_parade_entry_id | entry_entry_type | entry_number_of_participants |
|---|---|---|---|---|---|---|
| 1000 | float | false | VEH-2163 | 1 | float | 16 |
| 1001 | specialty vehicle | true | VEH-2166 | 2 | marching unit | 19 |
| 1002 | military vehicle | false | VEH-2169 | 3 | animals | 22 |
| 1003 | other | true | VEH-2172 | 4 | musical group/band | 25 |

This view joins `parade_vehicles` with `parade_entries`, answering: "which entry is each vehicle assigned to, and what are the entry's characteristics?" A row might show vehicle 1000 (float, VEH-2163, approved) assigned to entry 1 (float, 16 participants, registered). Another row could show vehicle 1003 (other, VEH-2172, approved) assigned to entry 4 (musical group/band, 25 participants, registered). This perspective is useful for vehicle-centric reporting, such as generating a list of all approved vehicles and their associated entries.

### Operator-to-Entry Detail

**View `v_vehicle_operator_parade_entry`**

```sql
CREATE VIEW v_vehicle_operator_parade_entry AS
SELECT a.id, a.full_name, a.drivers_license_number, a.operator_signature, b.parade_entry_id AS entry_parade_entry_id, b.entry_type AS entry_entry_type, b.number_of_participants AS entry_number_of_participants
FROM vehicle_operators a JOIN parade_entries b ON a.parade_entry_id = b.parade_entry_id;
```

| id | full_name | drivers_license_number | operator_signature | entry_parade_entry_id | entry_entry_type | entry_number_of_participants |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | DRI-2255 | legacy-operator-31 | 1 | float | 16 |
| 1001 | Account Name | DRI-2256 | compact-operator-32 | 2 | marching unit | 19 |
| 1002 | Saipan International Airport | DRI-2257 | composite-operator-33 | 3 | animals | 22 |
| 1003 | Norma Fisher | DRI-2258 | primary-operator-34 | 4 | musical group/band | 25 |

This view joins `vehicle_operators` with `parade_entries`, answering: "which entry is each operator assigned to, and what is the entry's current status?" A row might show operator 1000 (Theodore Mcgrath, verified) assigned to entry 1 (float, registered). Another row could show operator 1002 (Saipan International Airport, verified) assigned to entry 3 (animals, cancelled). The view enables operator-level reporting, such as identifying all verified operators and the entries they are cleared to drive.

### Operator-to-Organization Detail

**View `v_vehicle_operator_participating_organization`**

```sql
CREATE VIEW v_vehicle_operator_participating_organization AS
SELECT a.id, a.full_name, a.drivers_license_number, a.operator_signature, b.participating_organization_id AS organization_participating_organization_id, b.organization_name AS organization_organization_name, b.contact_person_name AS organization_contact_person_name
FROM vehicle_operators a JOIN participating_organizations b ON a.participating_organization_id = b.participating_organization_id;
```

| id | full_name | drivers_license_number | operator_signature | organization_participating_organization_id | organization_organization_name | organization_contact_person_name |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | DRI-2255 | legacy-operator-31 | 1 | Staples Inc. | Terri Patterson |
| 1001 | Account Name | DRI-2256 | compact-operator-32 | 2 | Oscar Health Inc. | Kelly Andrews |
| 1002 | Saipan International Airport | DRI-2257 | composite-operator-33 | 3 | Atlantic Richfield | Rg Labs |
| 1003 | Norma Fisher | DRI-2258 | primary-operator-34 | 4 | Port Loko | Alfred Tennyson |

This view joins `vehicle_operators` with `participating_organizations`, answering: "which organization is each operator associated with, and what is that organization's submission status?" A row might show operator 1001 (Account Name, pending verification) associated with Oscar Health Inc. (organization 2, confirmed). Another row could show operator 1003 (Norma Fisher, pending verification) associated with Port Loko (organization 4, pending). This view is particularly useful for compliance audits, as it surfaces operators whose verification is pending alongside the organizations they serve, allowing organizers to prioritize follow-up communications.

## Synthesis

The parade registration system models a multi-layered coordination process. Events define the regulatory context. Organizations register within that context, submitting entries that describe what they will present. Each entry is tied to a physical vehicle and an individual operator, creating a chain of accountability from the organization through the asset to the person. The various views flatten this chain along different axes, enabling organizers to answer questions at the level of events, organizations, entries, vehicles, or operators. Status fields at every level—submission status, entry status, vehicle status, operator status—provide a real-time picture of compliance, allowing the registration team to identify and resolve gaps before parade day arrives.