The sailing domain captures the operational lifecycle of organized water-based events, from scheduling and resource allocation through to crew assignment and safety compliance. At its core, the model distinguishes five principal entity types—sailing events, captains, crew members, sailboats, and docks—each persisting its own attributes in a dedicated base table. Cardinality-bounded relationships between these entities are materialized as foreign-key columns within the tables that play the dependent role, while many-to-many associations are resolved through dedicated junction tables. A layer of SQL views then reassembles the normalized facts into denormalized projections that answer the operational questions stakeholders actually ask: which captain is steering which boat at which dock, how many crew are aboard, and whether safety equipment is properly certified.

## Entity Types and Their Attributes

The central fact of the domain is a sailing event. The table `sailing_events` stores one row per scheduled occurrence, carrying both a surrogate primary key (`id`) and a business-level `event_id` that follows several formats—numeric identifiers such as `2002007020060` and `168535`, UUIDs like `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, and shorter codes such as `1186089`. The event's temporal identity lives in `event_date`, a timestamp column; for example, the introductory event `2002007020060` is scheduled for `2025-04-15T15:21:00`, while the race `168535` occurred on `2022-09-26T22:38:00`. The `event_type` column distinguishes `introductory` sessions from `race` competitions, and `status` tracks the lifecycle state—`scheduled`, `running`, `completed`, or `terminated`. Capacity management is expressed through `max_capacity` (ranging from 32 to 62 across the sample) and `actual_participants` (22, 25, 28, and 31 respectively).

**Table `sailing_events`**

| id | event_id | event_date | event_type | status | max_capacity | actual_participants | captain_id | sailboat_id | dock_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | introductory | scheduled | 32 | 22 | 1 | 100 | 100 |
| 2 | 168535 | 2022-09-26T22:38:00 | race | running | 42 | 25 | 2 | 101 | 101 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | introductory | completed | 52 | 28 | 3 | 102 | 102 |
| 4 | 1186089 | 2024-07-21T12:12:00 | race | terminated | 62 | 31 | 4 | 103 | 103 |

Three foreign-key columns anchor each event to its supporting resources: `captain_id` references the `captains` table, `sailboat_id` references `sailboats`, and `dock_id` references `docks`. This design enforces a cardinality-one constraint—each event is assigned exactly one captain, one sailboat, and one dock—by storing the referenced entity's primary key directly in the event row.

The `captains` table holds one row per licensed skipper. Its primary key is `captain_id`, and the business identifier `license_number` follows the pattern `LIC-XXXX` (e.g., `LIC-2589`, `LIC-2596`, `LIC-2603`, `LIC-2610`). The `years_experience` column records tenure—16, 22, 28, and 34 years in the sample—while `current_status` captures whether a captain is `active` or `terminated_event`. The table also carries `sailboat_id` and `sailing_event_id` as foreign keys, creating a direct link from captain to the vessel and event they are assigned to.

**Table `captains`**

| captain_id | license_number | years_experience | current_status | sailboat_id | sailing_event_id |
|---|---|---|---|---|---|
| 1 | LIC-2589 | 16 | active | 100 | 1 |
| 2 | LIC-2596 | 22 | terminated_event | 101 | 2 |
| 3 | LIC-2603 | 28 | active | 102 | 3 |
| 4 | LIC-2610 | 34 | terminated_event | 103 | 4 |

Crew members are recorded in `crew_members`, where the surrogate `id` (100–103) serves as the primary key and `crew_id` provides a business identifier that varies widely in format: alphanumeric codes like `state_et_7`, UUID fragments such as `ChIJB4i7Dqpt5kcRfEnfwsHulbU`, numeric strings like `4180964`, and free-text labels like `Cash`. The boolean columns `pfd_required` and `pfd_worn` track personal flotation device compliance—both are `true` for crew members 100 and 102, and `false` for 101 and 103. The `role` column distinguishes `helmsman` from `crew` positions. Foreign keys `sailing_event_id` and `sailboat_id` tie each crew member to the event and vessel they serve on.

**Table `crew_members`**

| id | crew_id | pfd_required | pfd_worn | role | sailing_event_id | sailboat_id |
|---|---|---|---|---|---|---|
| 100 | state_et_7 | true | true | helmsman | 1 | 100 |
| 101 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | false | false | crew | 2 | 101 |
| 102 | 4180964 | true | true | helmsman | 3 | 102 |
| 103 | Cash | false | false | crew | 4 | 103 |

Sailboats are described in `sailboats`, keyed by `id` (100–103). The business identifier `vessel_id` uses either numeric codes (`16620628`, `168538`) or UUIDs (`c9e1850d388444ca97c062544b127908`, `12570447`). The `vessel_name` column carries descriptive labels such as `Extended Model`, `Pilot Cluster A`, `Baseline Review`, and `Distributed Initiative`. Nautical attributes include `design_heel_angle` (the engineered limit, ranging from 15.70 to 20.80 degrees), `keel_material` (either `iron` or `lead`), and `current_heel_angle` (the real-time measurement, always slightly below the design limit in the sample). The `status` column tracks vessel availability—`at_dock`, `underway`, or `returned`. Foreign keys `dock_id` and `sailing_event_id` link the boat to its home berth and current event.

**Table `sailboats`**

| id | vessel_id | vessel_name | design_heel_angle | keel_material | current_heel_angle | status | dock_id | sailing_event_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 16620628 | Extended Model | 15.70 | iron | 11.70 | at_dock | 100 | 1 |
| 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | 17.40 | lead | 14.40 | underway | 101 | 2 |
| 102 | 12570447 | Baseline Review | 19.10 | iron | 17.10 | returned | 102 | 3 |
| 103 | 168538 | Distributed Initiative | 20.80 | lead | 19.80 | at_dock | 103 | 4 |

Docks are the simplest entity, stored in `docks` with primary key `id` (100–103). The business identifier `dock_id` uses numeric codes (`8387527`, `4985172`), alphanumeric labels (`PHR-101`), and UUIDs (`1366135c-8fcc-11eb-924d-9cd76263cbd0`). The `dock_name` column mirrors the vessel naming convention with labels like `Compact Model`, `Legacy Cluster`, `Regional Review A`, and `Seasonal Initiative`. The `location` column stores descriptive site names such as `extended-location-99` and `integrated-location-100`, while `capacity` records the berth limit (32, 41, 50, and 59).

**Table `docks`**

| id | dock_id | dock_name | location | capacity |
|---|---|---|---|---|
| 100 | 8387527 | Compact Model | extended-location-99 | 32 |
| 101 | PHR-101 | Legacy Cluster | integrated-location-100 | 41 |
| 102 | 4985172 | Regional Review A | seasonal-location-101 | 50 |
| 103 | 1366135c-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Initiative | regional-location-102 | 59 |

## Safety Equipment and Junction Tables

Personal flotation devices are tracked in `p_f_ds`, a table that associates a PFD specification with a crew member and a sailboat. The surrogate `id` (1–4) is the primary key, while `pfd_id` serves as the business identifier—numeric (`1290`, `9568468`), UUID (`fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3`), or descriptive (`gd_taxp_st_2_2`). The `size` column carries human-readable labels such as `adaptive-size-83`, `distributed-size-84`, `baseline-size-85`, and `pilot-size-86`. The `certification_standard` column distinguishes between `USCG` (U.S. Coast Guard) and `YRA` (Yacht Racing Association) certifications. Foreign keys `crew_member_id` and `sailboat_id` link the PFD record to the specific crew member and vessel it serves.

**Table `p_f_ds`**

| id | pfd_id | size | certification_standard | crew_member_id | sailboat_id |
|---|---|---|---|---|---|
| 1 | 1290 | adaptive-size-83 | USCG | 100 | 100 |
| 2 | fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3 | distributed-size-84 | YRA | 101 | 101 |
| 3 | 9568468 | baseline-size-85 | USCG | 102 | 102 |
| 4 | gd_taxp_st_2_2 | pilot-size-86 | YRA | 103 | 103 |

The domain also defines four junction tables that resolve many-to-many relationships between entities. The table `events_members` connects sailing events to crew members, allowing a single event to enroll multiple crew and a crew member to participate in multiple events. The table `sailboats_ds` links sailboats to docks, supporting the scenario where a vessel may be associated with multiple berths across different time periods. The table `docks_events` associates docks with events, capturing the logistical fact that a single dock hosts multiple events over time. Finally, `docks_sailboats` connects docks to sailboats, recording which vessels are assigned to which berths. These junction tables contain no additional attributes beyond the foreign-key pairs that define the association; they exist purely to enforce referential integrity and to enable efficient join-based queries across the many-to-many relationships.

**Table `events_members`**

| sailing_event_id | crew_member_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `sailboats_ds`**

| sailboat_id | p_f_d_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `docks_events`**

| dock_id | sailing_event_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `docks_sailboats`**

| dock_id | sailboat_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

## View Projections and Their Domain Questions

The view layer reassembles the normalized tables into denormalized projections that answer the operational questions stakeholders actually ask. Each view is a `SELECT` with explicit joins, and reading a row from a view is equivalent to tracing a path through the foreign-key graph of the base tables.

The view `v_sailing_event_captain` joins `sailing_events` to `captains` on `captain_id`, producing a row that pairs each event with its assigned skipper. For event `2002007020060`, the view returns captain `LIC-2589` with 16 years of experience and `active` status; for event `168535`, it returns captain `LIC-2596` with 22 years of experience and `terminated_event` status. This view answers the question: "Who is in command of each event?"

**View `v_sailing_event_captain`**

```sql
CREATE VIEW v_sailing_event_captain AS
SELECT a.id, a.event_id, a.event_date, a.event_type, b.captain_id AS captain_captain_id, b.license_number AS captain_license_number, b.years_experience AS captain_years_experience
FROM sailing_events a JOIN captains b ON a.captain_id = b.captain_id;
```

| id | event_id | event_date | event_type | captain_captain_id | captain_license_number | captain_years_experience |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | introductory | 1 | LIC-2589 | 16 |
| 2 | 168535 | 2022-09-26T22:38:00 | race | 2 | LIC-2596 | 22 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | introductory | 3 | LIC-2603 | 28 |
| 4 | 1186089 | 2024-07-21T12:12:00 | race | 4 | LIC-2610 | 34 |

The view `v_sailing_event_crew_member_detail` joins `sailing_events` to `crew_members` on `sailing_event_id`, producing a row that pairs each event with its enrolled crew. For event `2002007020060`, the view returns crew member `state_et_7` with role `helmsman`, `pfd_required = true`, and `pfd_worn = true`; for event `168535`, it returns crew member `ChIJB4i7Dqpt5kcRfEnfwsHulbU` with role `crew`, both PFD flags `false`. This view answers: "Which crew members are assigned to each event, and what is their safety compliance status?"

**View `v_sailing_event_crew_member_detail`**

```sql
CREATE VIEW v_sailing_event_crew_member_detail AS
SELECT a.id, a.event_id, a.event_date, b.id AS member_id, b.crew_id AS member_crew_id, b.pfd_required AS member_pfd_required
FROM sailing_events a
  JOIN events_members j ON j.sailing_event_id = a.id
  JOIN crew_members b ON b.id = j.crew_member_id;
```

| id | event_id | event_date | member_id | member_crew_id | member_pfd_required |
|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 100 | state_et_7 | true |
| 1 | 2002007020060 | 2025-04-15T15:21:00 | 101 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | false |
| 2 | 168535 | 2022-09-26T22:38:00 | 101 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | false |
| 2 | 168535 | 2022-09-26T22:38:00 | 102 | 4180964 | true |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 102 | 4180964 | true |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | 103 | Cash | false |
| 4 | 1186089 | 2024-07-21T12:12:00 | 103 | Cash | false |
| 4 | 1186089 | 2024-07-21T12:12:00 | 100 | state_et_7 | true |

The view `v_sailing_event_sailboat` joins `sailing_events` to `sailboats` on `sailboat_id`, producing a row that pairs each event with its assigned vessel. For event `2002007020060`, the view returns sailboat `16620628` named `Extended Model` with `design_heel_angle = 15.70`, `keel_material = iron`, and `status = at_dock`; for event `168535`, it returns sailboat `c9e1850d388444ca97c062544b127908` named `Pilot Cluster A` with `keel_material = lead` and `status = underway`. This view answers: "Which sailboat is deployed for each event, and what are its current specifications?"

**View `v_sailing_event_sailboat`**

```sql
CREATE VIEW v_sailing_event_sailboat AS
SELECT a.id, a.event_id, a.event_date, a.event_type, b.id AS sailboat_id, b.vessel_id AS sailboat_vessel_id, b.vessel_name AS sailboat_vessel_name
FROM sailing_events a JOIN sailboats b ON a.sailboat_id = b.id;
```

| id | event_id | event_date | event_type | sailboat_id | sailboat_vessel_id | sailboat_vessel_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | introductory | 100 | 16620628 | Extended Model |
| 2 | 168535 | 2022-09-26T22:38:00 | race | 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | introductory | 102 | 12570447 | Baseline Review |
| 4 | 1186089 | 2024-07-21T12:12:00 | race | 103 | 168538 | Distributed Initiative |

The view `v_sailing_event_dock` joins `sailing_events` to `docks` on `dock_id`, producing a row that pairs each event with its home berth. For event `2002007020060`, the view returns dock `8387527` named `Compact Model` at `extended-location-99` with capacity 32; for event `168535`, it returns dock `PHR-101` named `Legacy Cluster` at `integrated-location-100` with capacity 41. This view answers: "At which dock is each event berthed?"

**View `v_sailing_event_dock`**

```sql
CREATE VIEW v_sailing_event_dock AS
SELECT a.id, a.event_id, a.event_date, a.event_type, b.id AS dock_id, b.dock_id AS dock_dock_id, b.dock_name AS dock_dock_name
FROM sailing_events a JOIN docks b ON a.dock_id = b.id;
```

| id | event_id | event_date | event_type | dock_id | dock_dock_id | dock_dock_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | introductory | 100 | 8387527 | Compact Model |
| 2 | 168535 | 2022-09-26T22:38:00 | race | 101 | PHR-101 | Legacy Cluster |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | introductory | 102 | 4985172 | Regional Review A |
| 4 | 1186089 | 2024-07-21T12:12:00 | race | 103 | 1366135c-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Initiative |

The view `v_captain_sailboat` joins `captains` to `sailboats` on `sailboat_id`, producing a row that pairs each captain with their assigned vessel. For captain `LIC-2589`, the view returns sailboat `16620628` (`Extended Model`); for captain `LIC-2596`, it returns sailboat `c9e1850d388444ca97c062544b127908` (`Pilot Cluster A`). This view answers: "Which sailboat is each captain assigned to?"

**View `v_captain_sailboat`**

```sql
CREATE VIEW v_captain_sailboat AS
SELECT a.captain_id, a.license_number, a.years_experience, a.current_status, b.id AS sailboat_id, b.vessel_id AS sailboat_vessel_id, b.vessel_name AS sailboat_vessel_name
FROM captains a JOIN sailboats b ON a.sailboat_id = b.id;
```

| captain_id | license_number | years_experience | current_status | sailboat_id | sailboat_vessel_id | sailboat_vessel_name |
|---|---|---|---|---|---|---|
| 1 | LIC-2589 | 16 | active | 100 | 16620628 | Extended Model |
| 2 | LIC-2596 | 22 | terminated_event | 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 3 | LIC-2603 | 28 | active | 102 | 12570447 | Baseline Review |
| 4 | LIC-2610 | 34 | terminated_event | 103 | 168538 | Distributed Initiative |

The view `v_captain_sailing_event` joins `captains` to `sailing_events` on `sailing_event_id`, producing a row that pairs each captain with their event. For captain `LIC-2589`, the view returns event `2002007020060` of type `introductory` with status `scheduled`; for captain `LIC-2596`, it returns event `168535` of type `race` with status `running`. This view answers: "Which event is each captain commanding?"

**View `v_captain_sailing_event`**

```sql
CREATE VIEW v_captain_sailing_event AS
SELECT a.captain_id, a.license_number, a.years_experience, a.current_status, b.id AS event_id, b.event_id AS event_event_id, b.event_date AS event_event_date
FROM captains a JOIN sailing_events b ON a.sailing_event_id = b.id;
```

| captain_id | license_number | years_experience | current_status | event_id | event_event_id | event_event_date |
|---|---|---|---|---|---|---|
| 1 | LIC-2589 | 16 | active | 1 | 2002007020060 | 2025-04-15T15:21:00 |
| 2 | LIC-2596 | 22 | terminated_event | 2 | 168535 | 2022-09-26T22:38:00 |
| 3 | LIC-2603 | 28 | active | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 4 | LIC-2610 | 34 | terminated_event | 4 | 1186089 | 2024-07-21T12:12:00 |

The view `v_crew_member_sailing_event` joins `crew_members` to `sailing_events` on `sailing_event_id`, producing a row that pairs each crew member with their event. For crew member `state_et_7`, the view returns event `2002007020060` (introductory, scheduled); for crew member `Cash`, it returns event `1186089` (race, terminated). This view answers: "Which event is each crew member participating in?"

**View `v_crew_member_sailing_event`**

```sql
CREATE VIEW v_crew_member_sailing_event AS
SELECT a.id, a.crew_id, a.pfd_required, a.pfd_worn, b.id AS event_id, b.event_id AS event_event_id, b.event_date AS event_event_date
FROM crew_members a JOIN sailing_events b ON a.sailing_event_id = b.id;
```

| id | crew_id | pfd_required | pfd_worn | event_id | event_event_id | event_event_date |
|---|---|---|---|---|---|---|
| 100 | state_et_7 | true | true | 1 | 2002007020060 | 2025-04-15T15:21:00 |
| 101 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | false | false | 2 | 168535 | 2022-09-26T22:38:00 |
| 102 | 4180964 | true | true | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 103 | Cash | false | false | 4 | 1186089 | 2024-07-21T12:12:00 |

The view `v_crew_member_sailboat` joins `crew_members` to `sailboats` on `sailboat_id`, producing a row that pairs each crew member with their assigned vessel. For crew member `state_et_7`, the view returns sailboat `16620628` (`Extended Model`); for crew member `Cash`, it returns sailboat `168538` (`Distributed Initiative`). This view answers: "Which sailboat is each crew member serving on?"

**View `v_crew_member_sailboat`**

```sql
CREATE VIEW v_crew_member_sailboat AS
SELECT a.id, a.crew_id, a.pfd_required, a.pfd_worn, b.id AS sailboat_id, b.vessel_id AS sailboat_vessel_id, b.vessel_name AS sailboat_vessel_name
FROM crew_members a JOIN sailboats b ON a.sailboat_id = b.id;
```

| id | crew_id | pfd_required | pfd_worn | sailboat_id | sailboat_vessel_id | sailboat_vessel_name |
|---|---|---|---|---|---|---|
| 100 | state_et_7 | true | true | 100 | 16620628 | Extended Model |
| 101 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | false | false | 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 102 | 4180964 | true | true | 102 | 12570447 | Baseline Review |
| 103 | Cash | false | false | 103 | 168538 | Distributed Initiative |

The view `v_sailboat_dock` joins `sailboats` to `docks` on `dock_id`, producing a row that pairs each sailboat with its home berth. For sailboat `16620628` (`Extended Model`), the view returns dock `8387527` (`Compact Model`); for sailboat `c9e1850d388444ca97c062544b127908` (`Pilot Cluster A`), it returns dock `PHR-101` (`Legacy Cluster`). This view answers: "Which dock is each sailboat berthed at?"

**View `v_sailboat_dock`**

```sql
CREATE VIEW v_sailboat_dock AS
SELECT a.id, a.vessel_id, a.vessel_name, a.design_heel_angle, b.id AS dock_id, b.dock_id AS dock_dock_id, b.dock_name AS dock_dock_name
FROM sailboats a JOIN docks b ON a.dock_id = b.id;
```

| id | vessel_id | vessel_name | design_heel_angle | dock_id | dock_dock_id | dock_dock_name |
|---|---|---|---|---|---|---|
| 100 | 16620628 | Extended Model | 15.70 | 100 | 8387527 | Compact Model |
| 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | 17.40 | 101 | PHR-101 | Legacy Cluster |
| 102 | 12570447 | Baseline Review | 19.10 | 102 | 4985172 | Regional Review A |
| 103 | 168538 | Distributed Initiative | 20.80 | 103 | 1366135c-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Initiative |

The view `v_sailboat_p_f_d_detail` joins `sailboats` to `p_f_ds` on `sailboat_id`, producing a row that pairs each sailboat with its assigned PFD specification. For sailboat `16620628`, the view returns PFD `1290` with size `adaptive-size-83` and certification `USCG`; for sailboat `c9e1850d388444ca97c062544b127908`, it returns PFD `fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3` with size `distributed-size-84` and certification `YRA`. This view answers: "What PFD specification is assigned to each sailboat?"

**View `v_sailboat_p_f_d_detail`**

```sql
CREATE VIEW v_sailboat_p_f_d_detail AS
SELECT a.id, a.vessel_id, a.vessel_name, b.id AS d_id, b.pfd_id AS d_pfd_id, b.size AS d_size
FROM sailboats a
  JOIN sailboats_ds j ON j.sailboat_id = a.id
  JOIN p_f_ds b ON b.id = j.p_f_d_id;
```

| id | vessel_id | vessel_name | d_id | d_pfd_id | d_size |
|---|---|---|---|---|---|
| 100 | 16620628 | Extended Model | 1 | 1290 | adaptive-size-83 |
| 100 | 16620628 | Extended Model | 2 | fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3 | distributed-size-84 |
| 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | 2 | fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3 | distributed-size-84 |
| 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | 3 | 9568468 | baseline-size-85 |
| 102 | 12570447 | Baseline Review | 3 | 9568468 | baseline-size-85 |
| 102 | 12570447 | Baseline Review | 4 | gd_taxp_st_2_2 | pilot-size-86 |
| 103 | 168538 | Distributed Initiative | 4 | gd_taxp_st_2_2 | pilot-size-86 |
| 103 | 168538 | Distributed Initiative | 1 | 1290 | adaptive-size-83 |

The view `v_sailboat_sailing_event` joins `sailboats` to `sailing_events` on `sailing_event_id`, producing a row that pairs each sailboat with its event. For sailboat `16620628` (`Extended Model`), the view returns event `2002007020060` (introductory, scheduled); for sailboat `c9e1850d388444ca97c062544b127908` (`Pilot Cluster A`), it returns event `168535` (race, running). This view answers: "Which event is each sailboat deployed for?"

**View `v_sailboat_sailing_event`**

```sql
CREATE VIEW v_sailboat_sailing_event AS
SELECT a.id, a.vessel_id, a.vessel_name, a.design_heel_angle, b.id AS event_id, b.event_id AS event_event_id, b.event_date AS event_event_date
FROM sailboats a JOIN sailing_events b ON a.sailing_event_id = b.id;
```

| id | vessel_id | vessel_name | design_heel_angle | event_id | event_event_id | event_event_date |
|---|---|---|---|---|---|---|
| 100 | 16620628 | Extended Model | 15.70 | 1 | 2002007020060 | 2025-04-15T15:21:00 |
| 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | 17.40 | 2 | 168535 | 2022-09-26T22:38:00 |
| 102 | 12570447 | Baseline Review | 19.10 | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 103 | 168538 | Distributed Initiative | 20.80 | 4 | 1186089 | 2024-07-21T12:12:00 |

The view `v_dock_sailing_event_detail` joins `docks` to `sailing_events` on `dock_id`, producing a row that pairs each dock with its event. For dock `8387527` (`Compact Model`), the view returns event `2002007020060` (introductory, scheduled); for dock `PHR-101` (`Legacy Cluster`), it returns event `168535` (race, running). This view answers: "Which event is each dock hosting?"

**View `v_dock_sailing_event_detail`**

```sql
CREATE VIEW v_dock_sailing_event_detail AS
SELECT a.id, a.dock_id, a.dock_name, b.id AS event_id, b.event_id AS event_event_id, b.event_date AS event_event_date
FROM docks a
  JOIN docks_events j ON j.dock_id = a.id
  JOIN sailing_events b ON b.id = j.sailing_event_id;
```

| id | dock_id | dock_name | event_id | event_event_id | event_event_date |
|---|---|---|---|---|---|
| 100 | 8387527 | Compact Model | 1 | 2002007020060 | 2025-04-15T15:21:00 |
| 100 | 8387527 | Compact Model | 2 | 168535 | 2022-09-26T22:38:00 |
| 101 | PHR-101 | Legacy Cluster | 2 | 168535 | 2022-09-26T22:38:00 |
| 101 | PHR-101 | Legacy Cluster | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 102 | 4985172 | Regional Review A | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 |
| 102 | 4985172 | Regional Review A | 4 | 1186089 | 2024-07-21T12:12:00 |
| 103 | 1366135c-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Initiative | 4 | 1186089 | 2024-07-21T12:12:00 |
| 103 | 1366135c-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Initiative | 1 | 2002007020060 | 2025-04-15T15:21:00 |

The view `v_dock_sailboat_detail` joins `docks` to `sailboats` on `dock_id`, producing a row that pairs each dock with its sailboat. For dock `8387527` (`Compact Model`), the view returns sailboat `16620628` (`Extended Model`); for dock `PHR-101` (`Legacy Cluster`), it returns sailboat `c9e1850d388444ca97c062544b127908` (`Pilot Cluster A`). This view answers: "Which sailboat is berthed at each dock?"

**View `v_dock_sailboat_detail`**

```sql
CREATE VIEW v_dock_sailboat_detail AS
SELECT a.id, a.dock_id, a.dock_name, b.id AS sailboat_id, b.vessel_id AS sailboat_vessel_id, b.vessel_name AS sailboat_vessel_name
FROM docks a
  JOIN docks_sailboats j ON j.dock_id = a.id
  JOIN sailboats b ON b.id = j.sailboat_id;
```

| id | dock_id | dock_name | sailboat_id | sailboat_vessel_id | sailboat_vessel_name |
|---|---|---|---|---|---|
| 100 | 8387527 | Compact Model | 100 | 16620628 | Extended Model |
| 100 | 8387527 | Compact Model | 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 101 | PHR-101 | Legacy Cluster | 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 101 | PHR-101 | Legacy Cluster | 102 | 12570447 | Baseline Review |
| 102 | 4985172 | Regional Review A | 102 | 12570447 | Baseline Review |
| 102 | 4985172 | Regional Review A | 103 | 168538 | Distributed Initiative |
| 103 | 1366135c-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Initiative | 103 | 168538 | Distributed Initiative |
| 103 | 1366135c-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Initiative | 100 | 16620628 | Extended Model |

The view `v_p_f_d_crew_member` joins `p_f_ds` to `crew_members` on `crew_member_id`, producing a row that pairs each PFD specification with its assigned crew member. For PFD `1290` (size `adaptive-size-83`, certification `USCG`), the view returns crew member `state_et_7` with role `helmsman`; for PFD `fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3` (size `distributed-size-84`, certification `YRA`), it returns crew member `ChIJB4i7Dqpt5kcRfEnfwsHulbU` with role `crew`. This view answers: "Which crew member is assigned each PFD specification?"

**View `v_p_f_d_crew_member`**

```sql
CREATE VIEW v_p_f_d_crew_member AS
SELECT a.id, a.pfd_id, a.size, a.certification_standard, b.id AS member_id, b.crew_id AS member_crew_id, b.pfd_required AS member_pfd_required
FROM p_f_ds a JOIN crew_members b ON a.crew_member_id = b.id;
```

| id | pfd_id | size | certification_standard | member_id | member_crew_id | member_pfd_required |
|---|---|---|---|---|---|---|
| 1 | 1290 | adaptive-size-83 | USCG | 100 | state_et_7 | true |
| 2 | fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3 | distributed-size-84 | YRA | 101 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | false |
| 3 | 9568468 | baseline-size-85 | USCG | 102 | 4180964 | true |
| 4 | gd_taxp_st_2_2 | pilot-size-86 | YRA | 103 | Cash | false |

The view `v_p_f_d_sailboat` joins `p_f_ds` to `sailboats` on `sailboat_id`, producing a row that pairs each PFD specification with its assigned sailboat. For PFD `1290` (size `adaptive-size-83`, certification `USCG`), the view returns sailboat `16620628` (`Extended Model`); for PFD `gd_taxp_st_2_2` (size `pilot-size-86`, certification `YRA`), it returns sailboat `168538` (`Distributed Initiative`). This view answers: "Which sailboat is each PFD specification assigned to?"

**View `v_p_f_d_sailboat`**

```sql
CREATE VIEW v_p_f_d_sailboat AS
SELECT a.id, a.pfd_id, a.size, a.certification_standard, b.id AS sailboat_id, b.vessel_id AS sailboat_vessel_id, b.vessel_name AS sailboat_vessel_name
FROM p_f_ds a JOIN sailboats b ON a.sailboat_id = b.id;
```

| id | pfd_id | size | certification_standard | sailboat_id | sailboat_vessel_id | sailboat_vessel_name |
|---|---|---|---|---|---|---|
| 1 | 1290 | adaptive-size-83 | USCG | 100 | 16620628 | Extended Model |
| 2 | fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3 | distributed-size-84 | YRA | 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 3 | 9568468 | baseline-size-85 | USCG | 102 | 12570447 | Baseline Review |
| 4 | gd_taxp_st_2_2 | pilot-size-86 | YRA | 103 | 168538 | Distributed Initiative |

## Synthesis

The sailing domain model follows a clean normalization pattern: five entity tables store the core facts, each with a surrogate primary key and a set of descriptive attributes; foreign-key columns in `sailing_events`, `captains`, `crew_members`, `sailboats`, and `p_f_ds` encode cardinality-bounded relationships as direct column references; and four junction tables (`events_members`, `sailboats_ds`, `docks_events`, `docks_sailboats`) resolve the many-to-many associations that the cardinality-one columns cannot express. The view layer—comprising fifteen denormalized projections—traverses these foreign-key edges to reconstruct the operational facts that stakeholders need: captain-to-event assignments, crew-to-boat pairings, PFD compliance records, and dock-to-vessel berthing information. Reading any view row is equivalent to following a path through the normalized graph, and the concrete values in each row—license numbers like `LIC-2589`, vessel names like `Extended Model`, PFD sizes like `adaptive-size-83`—are the domain facts that the schema was designed to preserve.