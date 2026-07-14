## Domain Modelling and Relational Materialisation

Parade management is a coordination problem at its core: municipalities host events, organisations register to participate, and each registration bundles a vehicle and an operator into a single entry. The domain model captures three concentric layers of concern. The outermost layer is the event itself—when and where it happens, what rules apply. The middle layer is the participating organisation, which carries identity, contact, and authorisation data. The innermost layer is the parade entry, the atomic unit of participation that ties an organisation to a vehicle and an operator. This chapter explains how those concepts are modelled in an ontology-grounded relational schema, how foreign keys and junction tables encode the cardinality-bounded relationships, and how each view materialises a domain fact by joining the normalised tables back together.

### The Event Layer

The event is the anchor of the entire schema. Every parade entry, every participating organisation, and every vehicle operator ultimately traces back to a single `parade_events` row.

**Table `parade_events`**

| parade_event_id | event_date | start_time | location_city | location_state | location_zip | organizing_municipality | is_diesel_powered_allowed | candy_throwing_prohibited |
|---|---|---|---|---|---|---|---|---|
| 1 | 2025-04-15 | 2024-03-27T14:42:00 | seasonal-location-23 | composite-location-93 | distributed-location-36 | integrated-organizi-82 | true | true |
| 2 | 2022-09-26 | 2025-08-11T21:59:00 | regional-location-24 | primary-location-94 | baseline-location-37 | seasonal-organizi-83 | false | false |
| 3 | 2023-02-10 | 2022-01-22T04:16:00 | legacy-location-25 | adaptive-location-95 | pilot-location-38 | regional-organizi-84 | true | true |
| 4 | 2024-07-21 | 2023-06-06T11:33:00 | compact-location-26 | distributed-location-96 | extended-location-39 | legacy-organizi-85 | false | false |

The `parade_events` table stores one row per parade. The primary key `parade_event_id` is a surrogate integer (1 through 4 in the sample data). The `event_date` column holds the calendar date of the parade, while `start_time` records the scheduled start as a timestamp. Location is captured in three columns—`location_city`, `location_state`, and `location_zip`—which together form a composite address. The `organizing_municipality` column names the host municipality. Two boolean flags, `is_diesel_powered_allowed` and `candy_throwing_prohibited`, encode event-level policy constraints that propagate down to entries and vehicles. For instance, event 1 (2025-04-15) permits diesel power and prohibits candy throwing, whereas event 2 (2022-09-26) disallows both.

Events and organisations are not bound one-to-one. An event may host many organisations, and an organisation may participate in many events. This many-to-many relationship is materialised by the junction table `events_organizations`, which stores pairs of `parade_event_id` and `participating_organization_id`.

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

The eight rows in `events_organizations` reveal the participation graph: organisation 1 (Staples Inc.) appears in events 1 and 4; organisation 2 (Oscar Health Inc.) appears in events 1 and 2; organisation 3 (Atlantic Richfield) appears in events 2 and 3; and organisation 4 (Port Loko) appears in events 3 and 4. The junction table has no surrogate key of its own—its composite primary key is the pair `(parade_event_id, participating_organization_id)`, and each column is a foreign key referencing its parent table.

### The Organisation Layer

The `participating_organizations` table holds the identity and contact information for every entity that registers to participate.

**Table `participating_organizations`**

| participating_organization_id | organization_name | contact_person_name | contact_phone | contact_email | street_address | city | state | zip_code | authorization_signature | submission_status | parade_entry_id | vehicle_operator_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Staples Inc. | Terri Patterson | Joe Tsai | Christopher Wilson | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | integrated-authoriz-22 | pending | 1 | 1000 |
| 2 | Oscar Health Inc. | Kelly Andrews | Stephanie Collins | Charles Larsen | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | seasonal-authoriz-23 | confirmed | 2 | 1001 |
| 3 | Atlantic Richfield | Rg Labs | Tasha Rodriguez | Mary Alvarez | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | regional-authoriz-24 | withdrawn | 3 | 1002 |
| 4 | Port Loko | Alfred Tennyson | Walter Pratt | April Snyder | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | legacy-authoriz-25 | pending | 4 | 1003 |

The primary key is `participating_organization_id`. The `organization_name` column carries the legal or trade name—Staples Inc., Oscar Health Inc., Atlantic Richfield, Port Loko. Contact details are split across `contact_person_name`, `contact_phone`, and `contact_email`. The physical address is normalised into `street_address`, `city`, `state`, and `zip_code`. The `authorization_signature` column stores a reference to a signed document, and `submission_status` tracks the registration lifecycle with values such as `pending`, `confirmed`, and `withdrawn`.

Two columns in `participating_organizations` deserve special attention: `parade_entry_id` and `vehicle_operator_id`. These are foreign keys that create a direct link from the organisation to its entry and to the operator assigned to that entry. In the sample data, organisation 1 references entry 1 and operator 1000; organisation 2 references entry 2 and operator 1001, and so on. This design choice means that, for the current data model, each organisation is associated with at most one entry and one operator—a cardinality constraint enforced by the schema rather than by a separate junction table.

### The Entry, Vehicle, and Operator Layers

The `parade_entries` table is the central hub of the participation model. Each row represents a single registration to parade in a specific event.

**Table `parade_entries`**

| parade_entry_id | entry_type | number_of_participants | is_diesel_powered | give_away_method | entry_status | participating_organization_id | parade_vehicle_id | vehicle_operator_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | float | 16 | false | hand-to-hand | registered | 1 | 1000 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | marching unit | 19 | true | prohibited | confirmed | 2 | 1001 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | animals | 22 | false | hand-to-hand | cancelled | 3 | 1002 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | musical group/band | 25 | true | prohibited | registered | 4 | 1003 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The primary key is `parade_entry_id`. The `entry_type` column distinguishes between `float`, `marching unit`, `animals`, and `musical group/band`. The `number_of_participants` column is an integer count (16, 19, 22, 25 in the sample). The `is_diesel_powered` boolean mirrors the event-level policy but is stored at the entry level, allowing per-entry overrides or confirmations. The `give_away_method` column records how the entry plans to distribute items—`hand-to-hand` or `prohibited`. The `entry_status` column tracks the registration state with values such as `registered`, `confirmed`, and `cancelled`.

Three foreign keys anchor the entry to other entities: `participating_organization_id` references `participating_organizations`, `parade_vehicle_id` references `parade_vehicles`, and `vehicle_operator_id` references `vehicle_operators`. In the sample data, entry 1 belongs to organisation 1, uses vehicle 1000, and is operated by operator 1000. The `created_at` and `updated_at` columns provide audit timestamps.

The `parade_vehicles` table stores vehicle-level metadata.

**Table `parade_vehicles`**

| parade_vehicle_id | vehicle_type | is_diesel_powered | vehicle_identifier | vehicle_status | parade_entry_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | float | false | VEH-2163 | approved | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | specialty vehicle | true | VEH-2166 | pending inspection | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | military vehicle | false | VEH-2169 | rejected | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | other | true | VEH-2172 | approved | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The primary key is `parade_vehicle_id`. The `vehicle_type` column distinguishes between `float`, `specialty vehicle`, `military vehicle`, and `other`. The `is_diesel_powered` boolean records the vehicle's fuel type. The `vehicle_identifier` column holds a human-readable code such as `VEH-2163`. The `vehicle_status` column tracks inspection and approval states with values like `approved`, `pending inspection`, and `rejected`. The `parade_entry_id` foreign key links the vehicle to its parent entry, and the audit columns record creation and update times.

The `vehicle_operators` table stores the human (or organisational) operator responsible for driving the vehicle.

**Table `vehicle_operators`**

| id | full_name | drivers_license_number | operator_signature | operator_status | parade_entry_id | participating_organization_id |
|---|---|---|---|---|---|---|
| 1000 | Theodore Mcgrath | DRI-2255 | legacy-operator-31 | verified | 1 | 1 |
| 1001 | Account Name | DRI-2256 | compact-operator-32 | pending verification | 2 | 2 |
| 1002 | Saipan International Airport | DRI-2257 | composite-operator-33 | verified | 3 | 3 |
| 1003 | Norma Fisher | DRI-2258 | primary-operator-34 | pending verification | 4 | 4 |

The primary key is `id`. The `full_name` column holds the operator's name—Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher. The `drivers_license_number` column stores the licence identifier (e.g., `DRI-2255`). The `operator_signature` column references a signed document, and `operator_status` tracks verification state with values such as `verified` and `pending verification`. Two foreign keys anchor the operator: `parade_entry_id` links to the entry, and `participating_organization_id` links to the organisation. In the sample data, operator 1000 is associated with entry 1 and organisation 1.

The `events_entries` table is the second junction table in the schema, linking events directly to parade entries.

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

This table stores pairs of `parade_event_id` and `parade_entry_id`, forming a many-to-many relationship between events and entries. Its composite primary key is the pair `(parade_event_id, parade_entry_id)`, and each column is a foreign key referencing its parent table. This junction table allows the schema to support scenarios where an entry might be associated with multiple events, or where the event-to-entry mapping is managed independently of the organisation-to-event mapping.

### View Materialisation

The views in this schema are denormalised projections that join the base tables to answer specific domain questions. Each view reconstructs a fact from the normalised tables by following the foreign key paths.

#### Event-to-Organisation Detail

The view `v_parade_event_participating_organization_detail` joins `parade_events` to `events_organizations` and then to `participating_organizations`, producing one row per event-organisation pair enriched with full organisation contact data.

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

This view answers the question: "Which organisations are participating in which events, and how do I contact them?" A row with event 1 and organisation 1 (Staples Inc.) would show the event's date (2025-04-15), location (seasonal-location-23), and the organisation's contact person (Terri Patterson) along with phone and email.

#### Event-to-Entry Detail

The view `v_parade_event_parade_entry_detail` joins `parade_events` to `events_entries` and then to `parade_entries`, producing one row per event-entry pair enriched with entry metadata.

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

This view answers: "What entries are registered for which events, and what are their characteristics?" A row with event 1 and entry 1 would show the event's policy flags (diesel allowed, candy prohibited) alongside the entry's type (float), participant count (16), and status (registered).

#### Organisation-to-Entry Detail

The view `v_participating_organization_parade_entry` joins `participating_organizations` to `parade_entries` on `participating_organization_id`, producing one row per organisation-entry pair.

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

This view answers: "What entries has a given organisation registered, and what are the entry details?" A row with organisation 1 (Staples Inc.) and entry 1 would show the organisation's name and contact alongside the entry's type (float), participant count (16), and give-away method (hand-to-hand).

#### Organisation-to-Operator Detail

The view `v_participating_organization_vehicle_operator` joins `participating_organizations` to `vehicle_operators` on `participating_organization_id`, producing one row per organisation-operator pair.

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

This view answers: "Which operator is assigned to which organisation?" A row with organisation 1 and operator 1000 (Theodore Mcgrath) would show the organisation's name alongside the operator's licence number (DRI-2255) and verification status (verified).

#### Entry-to-Organisation Detail

The view `v_parade_entry_participating_organization` joins `parade_entries` to `participating_organizations` on `participating_organization_id`, producing one row per entry-organisation pair.

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

This view answers: "Which organisation is behind a given entry?" A row with entry 1 and organisation 1 would show the entry's type (float) and status (registered) alongside the organisation's name (Staples Inc.) and submission status (pending).

#### Entry-to-Vehicle Detail

The view `v_parade_entry_parade_vehicle` joins `parade_entries` to `parade_vehicles` on `parade_vehicle_id`, producing one row per entry-vehicle pair.

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

This view answers: "What vehicle is assigned to a given entry, and what is its status?" A row with entry 1 and vehicle 1000 would show the entry's type (float) alongside the vehicle's type (float), identifier (VEH-2163), and status (approved).

#### Entry-to-Operator Detail

The view `v_parade_entry_vehicle_operator` joins `parade_entries` to `vehicle_operators` on `vehicle_operator_id`, producing one row per entry-operator pair.

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

This view answers: "Who is operating the vehicle for a given entry?" A row with entry 1 and operator 1000 would show the entry's type (float) alongside the operator's name (Theodore Mcgrath) and verification status (verified).

#### Vehicle-to-Entry Detail

The view `v_parade_vehicle_parade_entry` joins `parade_vehicles` to `parade_entries` on `parade_entry_id`, producing one row per vehicle-entry pair.

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

This view answers: "Which entry is associated with a given vehicle?" A row with vehicle 1000 and entry 1 would show the vehicle's type (float) and identifier (VEH-2163) alongside the entry's type (float) and participant count (16).

#### Operator-to-Entry Detail

The view `v_vehicle_operator_parade_entry` joins `vehicle_operators` to `parade_entries` on `parade_entry_id`, producing one row per operator-entry pair.

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

This view answers: "Which entry is assigned to a given operator?" A row with operator 1000 and entry 1 would show the operator's name (Theodore Mcgrath) and licence number (DRI-2255) alongside the entry's type (float) and status (registered).

#### Operator-to-Organisation Detail

The view `v_vehicle_operator_participating_organization` joins `vehicle_operators` to `participating_organizations` on `participating_organization_id`, producing one row per operator-organisation pair.

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

This view answers: "Which organisation is associated with a given operator?" A row with operator 1000 and organisation 1 would show the operator's name (Theodore Mcgrath) and verification status (verified) alongside the organisation's name (Staples Inc.) and submission status (pending).

### Synthesis

The schema models parade management as a network of entities connected by foreign keys and junction tables. The `parade_events` table anchors the domain, with the `events_organizations` and `events_entries` junction tables providing many-to-many relationships between events and their participants. The `participating_organizations`, `parade_entries`, `parade_vehicles`, and `vehicle_operators` tables form a chain of one-to-one and one-to-many relationships that capture the full participation record: an organisation registers an entry, which is associated with a vehicle and an operator. The ten views materialise every pairwise relationship between these entities, allowing queries to reconstruct domain facts without requiring the application layer to perform joins. This design separates the normalised storage model from the denormalised query model, providing both data integrity through foreign key constraints and query convenience through pre-joined views.