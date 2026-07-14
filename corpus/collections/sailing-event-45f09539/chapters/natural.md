# Chapter 7 — The Sailing Operations Registry

A sailing fleet operates as a tightly coupled system of vessels, personnel, moorings, and scheduled events. Every race, every introductory outing, and every routine departure leaves a trail of records: which captain steered which boat, which crew members wore life jackets, which dock hosted the departure, and which safety equipment was assigned. The sailing operations registry captures all of this activity in a structured set of tables and derived views, enabling fleet managers to answer questions about compliance, capacity, vessel readiness, and personnel assignments at a glance.

The core of the registry consists of five base tables that describe the primary entities: sailing events, captains, crew members, sailboats, and docks. Supporting tables record the many-to-many relationships between these entities—events and crew, sailboats and docks, docks and events, and the personal flotation device (PFD) assignments that link crew members to specific vessels. Together, these tables form the operational backbone of the fleet management system.

**Table `sailing_events`**

| id | event_id | event_date | event_type | status | max_capacity | actual_participants | captain_id | sailboat_id | dock_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | 2025-04-15T15:21:00 | introductory | scheduled | 32 | 22 | 1 | 100 | 100 |
| 2 | 168535 | 2022-09-26T22:38:00 | race | running | 42 | 25 | 2 | 101 | 101 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | 2023-02-10T05:55:00 | introductory | completed | 52 | 28 | 3 | 102 | 102 |
| 4 | 1186089 | 2024-07-21T12:12:00 | race | terminated | 62 | 31 | 4 | 103 | 103 |

The `sailing_events` table is the central scheduling ledger. Each row represents a single sailing event identified by a unique `event_id`, which may be a numeric string such as `2002007020060` or a UUID like `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`. The `event_date` column records the scheduled start time in ISO 8601 format, while `event_type` distinguishes between `introductory` sessions and `race` competitions. The `status` column tracks the lifecycle of each event: `scheduled` events have not yet begun, `running` events are underway, `completed` events have finished successfully, and `terminated` events were aborted before completion. Capacity is tracked with `max_capacity` (the maximum number of participants allowed) and `actual_participants` (the number who signed up). For example, event `2002007020060` on 2025-04-15 is an introductory session scheduled for up to 32 participants, with 22 currently enrolled. Event `1186089`, a race on 2024-07-21, was terminated despite having 31 participants registered against a capacity of 62. Each event also carries foreign keys to its assigned `captain_id`, `sailboat_id`, and `dock_id`, anchoring the event to the specific resources deployed.

**Table `captains`**

| captain_id | license_number | years_experience | current_status | sailboat_id | sailing_event_id |
|---|---|---|---|---|---|
| 1 | LIC-2589 | 16 | active | 100 | 1 |
| 2 | LIC-2596 | 22 | terminated_event | 101 | 2 |
| 3 | LIC-2603 | 28 | active | 102 | 3 |
| 4 | LIC-2610 | 34 | terminated_event | 103 | 4 |

Captains are the licensed operators responsible for each vessel during an event. The `captains` table stores their `license_number` (e.g., `LIC-2589`), `years_experience` (ranging from 16 to 34 in the sample data), and `current_status`, which can be `active` or `terminated_event`. The `terminated_event` status indicates a captain whose license was suspended or revoked for a specific event rather than permanently. Each captain record includes a `sailboat_id` and `sailing_event_id`, linking the operator to the vessel and event they are assigned to. Captain 1, with license `LIC-2589` and 16 years of experience, is currently active and assigned to sailboat 100 for event 1. Captain 2, with 22 years of experience and license `LIC-2596`, holds a `terminated_event` status for event 2, suggesting a compliance issue during that particular race.

**Table `crew_members`**

| id | crew_id | pfd_required | pfd_worn | role | sailing_event_id | sailboat_id |
|---|---|---|---|---|---|---|
| 100 | state_et_7 | true | true | helmsman | 1 | 100 |
| 101 | ChIJB4i7Dqpt5kcRfEnfwsHulbU | false | false | crew | 2 | 101 |
| 102 | 4180964 | true | true | helmsman | 3 | 102 |
| 103 | Cash | false | false | crew | 4 | 103 |

Crew members form the operational backbone of each sailing event. The `crew_members` table records each crew member's `crew_id` (which may be a state-based identifier like `state_et_7` or a UUID), their assigned `role` (`helmsman` or `crew`), and their sailing event and sailboat assignments. Safety compliance is tracked through two boolean columns: `pfd_required` indicates whether the crew member was mandated to wear a personal flotation device, and `pfd_worn` records whether they actually did. In the sample data, crew member `state_et_7` (id 100) served as helmsman on event 1, was required to wear a PFD, and complied. By contrast, crew member `ChIJB4i7Dqpt5kcRfEnfwsHulbU` (id 101) served as crew on event 2, was not required to wear a PFD, and accordingly did not wear one.

**Table `sailboats`**

| id | vessel_id | vessel_name | design_heel_angle | keel_material | current_heel_angle | status | dock_id | sailing_event_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 16620628 | Extended Model | 15.70 | iron | 11.70 | at_dock | 100 | 1 |
| 101 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | 17.40 | lead | 14.40 | underway | 101 | 2 |
| 102 | 12570447 | Baseline Review | 19.10 | iron | 17.10 | returned | 102 | 3 |
| 103 | 168538 | Distributed Initiative | 20.80 | lead | 19.80 | at_dock | 103 | 4 |

The `sailboats` table catalogs the fleet's vessels. Each boat has a `vessel_id` (a numeric string or UUID), a `vessel_name` (such as "Extended Model" or "Pilot Cluster A"), and technical specifications including `design_heel_angle` (the maximum safe heel angle, ranging from 15.70 to 20.80 degrees) and `keel_material` (either `iron` or `lead`). The `current_heel_angle` records the boat's measured heel at the time of the last check, while `status` indicates whether the vessel is `at_dock`, `underway`, or `returned`. Sailboat 100, named "Extended Model" with an iron keel and a design heel angle of 15.70 degrees, is currently at dock 100 with a measured heel of 11.70 degrees. Sailboat 101, "Pilot Cluster A" with a lead keel, is currently underway at dock 101 with a heel of 14.40 degrees against a design limit of 17.40 degrees.

**Table `docks`**

| id | dock_id | dock_name | location | capacity |
|---|---|---|---|---|
| 100 | 8387527 | Compact Model | extended-location-99 | 32 |
| 101 | PHR-101 | Legacy Cluster | integrated-location-100 | 41 |
| 102 | 4985172 | Regional Review A | seasonal-location-101 | 50 |
| 103 | 1366135c-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Initiative | regional-location-102 | 59 |

Docks serve as the mooring and staging infrastructure for the fleet. The `docks` table records each dock's `dock_id`, `dock_name` (e.g., "Compact Model" or "Legacy Cluster"), `location` (a descriptive string such as `extended-location-99`), and `capacity` (the maximum number of vessels the dock can accommodate). Dock 100, named "Compact Model" at `extended-location-99`, can hold 32 vessels. Dock 103, "Seasonal Initiative" at `regional-location-102`, has the largest capacity at 59 vessels.

**Table `p_f_ds`**

| id | pfd_id | size | certification_standard | crew_member_id | sailboat_id |
|---|---|---|---|---|---|
| 1 | 1290 | adaptive-size-83 | USCG | 100 | 100 |
| 2 | fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3 | distributed-size-84 | YRA | 101 | 101 |
| 3 | 9568468 | baseline-size-85 | USCG | 102 | 102 |
| 4 | gd_taxp_st_2_2 | pilot-size-86 | YRA | 103 | 103 |

Personal flotation devices are tracked in the `p_f_ds` table, which links each PFD to a specific crew member and sailboat. The `pfd_id` identifies the device (e.g., `1290` or `fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3`), `size` describes its fit (such as `adaptive-size-83` or `pilot-size-86`), and `certification_standard` indicates the governing body (`USCG` or `YRA`). Each row connects a `crew_member_id` to a `sailboat_id`, ensuring that every crew member on a vessel has a documented, certified PFD assigned. PFD `1290` (size `adaptive-size-83`, USCG-certified) is assigned to crew member 100 on sailboat 100. PFD `gd_taxp_st_2_2` (size `pilot-size-86`, YRA-certified) is assigned to crew member 103 on sailboat 103.

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

The `events_members` table resolves the many-to-many relationship between sailing events and crew members. A single event may involve numerous crew members, and a crew member may participate in multiple events. This table records each assignment, ensuring that event organizers can determine exactly who was scheduled for each outing.

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

The `sailboats_ds` table captures the relationship between sailboats and their assigned sailing events. A vessel may participate in multiple events over its operational lifetime, and this table logs each deployment, providing a historical record of vessel utilization.

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

The `docks_events` table links docks to the sailing events that used them as departure or return points. This relationship enables fleet managers to track dock utilization patterns, identify peak usage periods, and plan maintenance windows around periods of low demand.

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

The `docks_sailboats` table records which sailboats are moored at which docks. This relationship is dynamic—boats move between docks as events are scheduled and completed—and serves as the basis for real-time fleet positioning queries.

With the base tables established, the registry provides a suite of derived views that join these entities into actionable reports. Each view answers a specific operational question by combining data from multiple tables.

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

The `v_sailing_event_captain` view joins sailing events with their assigned captains, producing a single-row-per-event report that includes the captain's license number, years of experience, and current status alongside the event's date, type, and status. This view answers the question: "Who is operating each event, and are they qualified and active?" For event `2002007020060`, the view would show captain 1 (license `LIC-2589`, 16 years experience, active status) steering an introductory event scheduled for 2025-04-15. For event `1186089`, it would reveal captain 4 (license `LIC-2610`, 34 years experience, terminated_event status) on a terminated race—prompting a compliance review.

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

The `v_sailing_event_crew_member_detail` view expands each event to include all its crew members with full safety compliance data. It answers: "For each event, who was on board, what role did they play, and did they comply with PFD requirements?" A row for crew member `state_et_7` on event 1 would show the helmsman role, a required PFD, and confirmation that it was worn. A row for crew member `Cash` on event 4 would show the crew role, no PFD requirement, and no PFD worn—consistent with the safety protocol.

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

The `v_sailing_event_sailboat` view links each sailing event to its assigned sailboat, including the vessel's name, design heel angle, keel material, current heel angle, and status. This view answers: "Which vessel is deployed for each event, and is it in suitable condition?" For event `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, the view would show sailboat 102 ("Baseline Review", iron keel, design heel 19.10°, current heel 17.10°, status `returned`), indicating the vessel has completed its event and returned to dock.

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

The `v_sailing_event_dock` view associates each event with its departure/return dock, including the dock's name, location, and capacity. This view answers: "Where did each event take place, and was the dock adequate for the operation?" Event `168535` would be linked to dock 101 ("Legacy Cluster" at `integrated-location-100`, capacity 41), providing context for logistics and resource planning.

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

The `v_captain_sailboat` view pairs captains with their assigned sailboats, showing the captain's license, experience, status, and the vessel's name, keel material, and current status. This view answers: "Which captain-vessel pairings exist, and are they operationally sound?" Captain 1 (active, 16 years experience) paired with sailboat 100 ("Extended Model", iron keel, at_dock) represents a standard active assignment. Captain 2 (terminated_event, 22 years experience) paired with sailboat 101 ("Pilot Cluster A", lead keel, underway) flags a potential concern: a captain with a terminated status is associated with a vessel currently underway.

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

The `v_captain_sailing_event` view combines captain records with their sailing events, presenting license number, experience, status, event date, event type, event status, and participant counts. This view answers: "What events has each captain been assigned to, and how did those events conclude?" Captain 3 (active, 28 years experience, license `LIC-2603`) is linked to event 3 (introductory, completed, 28 of 52 participants), representing a successful, fully documented outing.

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

The `v_crew_member_sailing_event` view joins crew members with their sailing events, including the event date, type, status, and participant counts. This view answers: "Which events did each crew member participate in, and what was the outcome?" Crew member `state_et_7` (helmsman, PFD required and worn) on event 1 (introductory, scheduled, 22 of 32 participants) provides a complete picture of that crew member's participation and compliance record.

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

The `v_crew_member_sailboat` view links crew members to their assigned sailboats, showing the crew member's role, PFD compliance, and the vessel's name, keel material, and status. This view answers: "Which crew members served on which vessels, and under what conditions?" Crew member `ChIJB4i7Dqpt5kcRfEnfwsHulbU` (crew, no PFD required) on sailboat 101 ("Pilot Cluster A", lead keel, underway) documents a standard non-PFD-assigned crew assignment on an active vessel.

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

The `v_sailboat_dock` view pairs sailboats with their home docks, including the vessel's name, keel material, current heel angle, and the dock's name, location, and capacity. This view answers: "Where is each vessel moored, and is the dock appropriate for the vessel's needs?" Sailboat 100 ("Extended Model", iron keel, current heel 11.70°) at dock 100 ("Compact Model", `extended-location-99`, capacity 32) shows a vessel properly stationed at a dock with sufficient capacity.

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

The `v_sailboat_p_f_d_detail` view connects sailboats to their assigned PFDs and the crew members who use them, including the PFD size, certification standard, crew role, and PFD compliance. This view answers: "For each vessel, what safety equipment is assigned, and is it being used correctly?" Sailboat 100 is linked to PFD `1290` (size `adaptive-size-83`, USCG-certified) assigned to crew member 100 (helmsman, PFD required and worn), demonstrating full compliance on that vessel.

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

The `v_sailboat_sailing_event` view joins sailboats with their sailing events, showing the vessel's name, keel material, current heel angle, and the event's date, type, status, and participant counts. This view answers: "Which events has each vessel participated in, and how did those events proceed?" Sailboat 102 ("Baseline Review", iron keel, returned) linked to event 3 (introductory, completed, 28 of 52 participants) shows a vessel that successfully completed an event and returned to service.

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

The `v_dock_sailing_event_detail` view associates docks with their sailing events, including the dock's name, location, capacity, and the event's date, type, status, and participant counts. This view answers: "Which events used each dock, and how fully were those events populated?" Dock 101 ("Legacy Cluster", `integrated-location-100`, capacity 41) linked to event `168535` (race, running, 25 of 42 participants) shows a dock supporting an active race with moderate participation.

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

The `v_dock_sailboat_detail` view combines dock records with their moored sailboats, presenting the dock's name, location, capacity, and the vessel's name, keel material, current heel angle, and status. This view answers: "Which vessels are currently at each dock, and what is their operational state?" Dock 103 ("Seasonal Initiative", `regional-location-102`, capacity 59) linked to sailboat 103 ("Distributed Initiative", lead keel, current heel 19.80°, at_dock) shows a vessel properly moored at a high-capacity dock.

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

The `v_p_f_d_crew_member` view links PFDs to their assigned crew members, showing the PFD size, certification standard, crew role, and PFD compliance status. This view answers: "Which crew members have certified PFDs assigned, and are they compliant?" PFD `9568468` (size `baseline-size-85`, USCG-certified) assigned to crew member 102 (helmsman, PFD required and worn) confirms that a USCG-certified device is properly deployed on a required-wear crew member.

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

The `v_p_f_d_sailboat` view connects PFDs to their assigned sailboats, including the PFD size, certification standard, and the vessel's name, keel material, and status. This view answers: "Which vessels have certified PFDs assigned, and are those devices appropriate?" PFD `fbbc40e0-9bac-11eb-a8a2-19ed5c03f8d3` (size `distributed-size-84`, YRA-certified) on sailboat 101 ("Pilot Cluster A", lead keel, underway) shows a YRA-certified device deployed on an active vessel, ensuring regulatory compliance during operations.

## Synthesis

The sailing operations registry transforms a complex web of vessels, personnel, moorings, and events into a coherent operational picture. The five base tables capture the fundamental entities and their relationships, while the derived views synthesize these records into actionable reports. Fleet managers can use the captain-event views to verify operator qualifications, the crew-member views to audit safety compliance, the sailboat-dock views to track vessel positioning, and the PFD views to ensure regulatory adherence. Every row in every table and view tells a part of the story: which captain steered which boat, which crew member wore their life jacket, which dock hosted the departure, and which event succeeded or was terminated. Together, these records form the operational memory of the fleet, enabling continuous improvement in safety, efficiency, and regulatory compliance.