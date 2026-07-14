## School Safety Operations: Surveillance, Zones, and Search Protocols

Educational institutions manage a complex ecosystem of physical spaces, monitoring infrastructure, and procedural policies designed to maintain safety while respecting student rights. At the core of this system are surveillance cameras deployed across defined zones, student search events that document when and how searches are conducted, and the policies that govern each action. Understanding how these elements interrelate requires examining the data records that capture every camera installation, zone classification, search event, student profile, and policy document. The following reference describes the operational relationships between these records, drawing on concrete examples from the system's current state.

Surveillance cameras form the physical monitoring layer of the campus. Each camera record captures its unique identifier, geographic location within the facility, the date it was installed, whether it remains active, the type of coverage it provides, and its resolution class.

**Table `surveillance_cameras`**

| id | camera_id | location | installation_date | is_active | coverage_area | resolution | school_zone_id |
|---|---|---|---|---|---|---|---|
| 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 | 2022-01-10 | true | extended-coverage-87 | regional-resoluti-30 | 100 |
| 1001 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 | 2023-06-21 | false | integrated-coverage-88 | legacy-resoluti-31 | 101 |
| 1002 | 1450647 | seasonal-location-101 | 2024-11-05 | true | seasonal-coverage-89 | compact-resoluti-32 | 102 |
| 1003 | 2839509 | regional-location-102 | 2025-04-16 | false | regional-coverage-90 | composite-resoluti-33 | 103 |

The camera at identifier `98a0473a-8fcd-11eb-924d-9cd76263cbd0`, located at `extended-location-99`, has been active since its installation on January 10, 2022, and provides extended coverage at regional resolution. By contrast, the camera `4e383924-8fcc-11eb-924d-9cd76263cbd0` at `integrated-location-100` was installed more recently on June 21, 2023, but is currently inactive, offering legacy-resolution imaging over its integrated coverage area. The system also tracks cameras with numeric identifiers such as `1450647` and `2839509`, demonstrating that the platform supports heterogeneous identification schemes. Each camera is assigned to a specific school zone, establishing the spatial relationship between monitoring hardware and the areas it observes.

School zones define the physical and regulatory boundaries within which surveillance and search activities occur. Every zone carries a zone identifier, a type classification, a privacy level, an indoor or outdoor designation, a capacity figure, and timestamps for when the zone record was created and last updated.

**Table `school_zones`**

| school_zone_id | zone_id | zone_type | privacy_level | is_indoor | capacity | surveillance_camera_id | student_search_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 937724 | classroom | high | false | 32 | 1000 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 99504 | locker_room | medium | true | 41 | 1001 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 10207142 | hallway | low | false | 50 | 1002 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | bus | high | true | 59 | 1003 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Zone `937724` is classified as a classroom with a high privacy level, is located outdoors, and holds a capacity of 32 occupants. Zone `99504`, a locker room, carries a medium privacy level and is situated indoors with a capacity of 41. The hallway zone `10207142` has a low privacy level, is outdoors, and accommodates 50 people. The bus zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3` presents a high privacy level, is indoors, and has a capacity of 59. Privacy levels range from low to high, reflecting the sensitivity of activities conducted within each space. The zone records also reference a surveillance camera and a student search event, anchoring each zone to both its monitoring infrastructure and its operational history.

Student search events document every instance in which a search was initiated, providing a comprehensive audit trail of safety interventions. Each event record includes a search identifier, a timestamp, the initiation method, assessments of reasonableness at inception and scope, an intrusiveness classification, the outcome, and references to the student involved, the zone where the search occurred, and the governing policy.

**Table `student_search_events`**

| student_search_event_id | search_id | timestamp | initiated_by | reasonableness_inception | reasonableness_scope | intrusiveness_level | outcome | student_id | school_zone_id | school_policy_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ea9700d4-8fd1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | distributed-initiate-42 | false | false | minimal | contraband_found | 1 | 100 | 100 |
| 1001 | 1208-0004-M | 2025-12-19T01:35:00 | baseline-initiate-43 | true | true | moderate | no_violation | 2 | 101 | 101 |
| 1002 | ca9ccc68-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-03T08:52:00 | pilot-initiate-44 | false | false | excessive | inconclusive | 3 | 102 | 102 |
| 1003 | 1996926 | 2023-10-14T15:09:00 | extended-initiate-45 | true | true | minimal | contraband_found | 4 | 103 | 103 |

The search event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0` occurred on July 8, 2024, at 18:18 UTC. It was initiated through the `distributed-initiate-42` method, was deemed unreasonable at inception and in scope, carried a minimal intrusiveness level, and resulted in contraband being found. The student involved was assigned to zone 100 under policy 100. Another event, identified as `1208-0004-M`, took place on December 19, 2025, at 01:35 UTC. This search was initiated via `baseline-initiate-43`, was considered reasonable both at inception and in scope, had a moderate intrusiveness level, and resulted in no violation. The search event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0` from May 3, 2022, was initiated through `pilot-initiate-44`, was unreasonable at both inception and scope, carried an excessive intrusiveness level, and produced an inconclusive outcome. The final event `1996926` occurred on October 14, 2023, at 15:09 UTC, was initiated via `extended-initiate-45`, was reasonable at both stages, had minimal intrusiveness, and also resulted in contraband being found.

Students are the individuals at the center of these operations. Each student record contains their identifier, age, sex, grade level, enrollment status, and references to the search event and zone associated with them.

**Table `students`**

| id | student_id | age | sex | grade_level | enrollment_status | student_search_event_id | school_zone_id |
|---|---|---|---|---|---|---|---|
| 1 | 392507 | 35 | male | 29 | active | 1000 | 100 |
| 2 | 25388256 | 40 | female | 33 | suspended | 1001 | 101 |
| 3 | id_16 | 45 | other | 37 | expelled | 1002 | 102 |
| 4 | gd_taxc_2211 | 50 | male | 41 | withdrawn | 1003 | 103 |

Student `392507` is 35 years old, male, in grade level 29, and holds an active enrollment status. This student was associated with search event 1000 and zone 100. Student `25388256` is 40 years old, female, in grade level 33, and has a suspended enrollment status, linked to search event 1001 and zone 101. Student `id_16` is 45 years old, identifies as other, is in grade level 37, and has an expelled status, connected to search event 1002 and zone 102. Student `gd_taxc_2211` is 50 years old, male, in grade level 41, and has a withdrawn status, tied to search event 1003 and zone 103. Enrollment statuses span the full spectrum from active to suspended, expelled, and withdrawn, reflecting the diverse circumstances under which students interact with the safety system.

School policies establish the regulatory framework within which search events are authorized and evaluated. Each policy record includes its identifier, a policy identifier, a title, an effective date, a last-reviewed date, an approval status, a jurisdiction, and references to the search event, surveillance camera, and policy it governs.

**Table `school_policies`**

| id | policy_id | title | effective_date | last_reviewed | approval_status | jurisdiction | student_search_event_id | surveillance_camera_id | school_policy_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 5844252 | Compact Initiative | 2023-02-14 | 2022-05-27 | draft | regional-jurisdic-30 | 1000 | 1000 | 100 |
| 101 | 10207142 | Legacy Model | 2024-07-25 | 2023-10-11 | pending | legacy-jurisdic-31 | 1001 | 1001 | 101 |
| 102 | 1562847 | Regional Cluster A | 2025-12-09 | 2024-03-22 | approved | compact-jurisdic-32 | 1002 | 1002 | 102 |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Seasonal Review | 2022-05-20 | 2025-08-06 | rejected | composite-jurisdic-33 | 1003 | 1003 | 103 |

The policy `5844252`, titled "Compact Initiative," became effective on February 14, 2023, was last reviewed on May 27, 2022, and holds a draft approval status under the jurisdiction `regional-jurisdic-30`. It is linked to search event 1000, camera 1000, and policy 100. The policy `10207142`, titled "Legacy Model," took effect on July 25, 2024, was last reviewed on October 11, 2023, and is in pending status under `legacy-jurisdic-31`, associated with search event 1001, camera 1001, and policy 101. The policy `1562847`, titled "Regional Cluster A," became effective on December 9, 2025, was last reviewed on March 22, 2024, and has an approved status under `compact-jurisdic-32`, connected to search event 1002, camera 1002, and policy 102. The policy `ChIJkzsYUIBt5kcRM6_JHx26ONk`, titled "Seasonal Review," became effective on May 20, 2022, was last reviewed on August 6, 2025, and holds a rejected status under `composite-jurisdic-33`, linked to search event 1003, camera 1003, and policy 103. Approval statuses range from draft through pending, approved, and rejected, providing a clear lifecycle for policy governance.

The relationship between surveillance cameras and school zones is captured in a dedicated view that joins the two base tables on the school zone identifier. This view answers the question of which cameras are assigned to which zones and what type each zone represents.

**View `vw_surveillance_camera_school_zone`**

```sql
CREATE VIEW vw_surveillance_camera_school_zone AS
SELECT a.id, a.camera_id, a.location, a.installation_date, b.school_zone_id AS zone_school_zone_id, b.zone_id AS zone_zone_id, b.zone_type AS zone_zone_type
FROM surveillance_cameras a JOIN school_zones b ON a.school_zone_id = b.school_zone_id;
```

| id | camera_id | location | installation_date | zone_school_zone_id | zone_zone_id | zone_zone_type |
|---|---|---|---|---|---|---|
| 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 | 2022-01-10 | 100 | 937724 | classroom |
| 1001 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 | 2023-06-21 | 101 | 99504 | locker_room |
| 1002 | 1450647 | seasonal-location-101 | 2024-11-05 | 102 | 10207142 | hallway |
| 1003 | 2839509 | regional-location-102 | 2025-04-16 | 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | bus |

In the joined result, camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0` at `extended-location-99` is paired with zone `937724`, a classroom zone. Camera `4e383924-8fcc-11eb-924d-9cd76263cbd0` at `integrated-location-100` maps to zone `99504`, classified as a locker room. The camera `1450647` at `seasonal-location-101` corresponds to zone `10207142`, a hallway. Finally, camera `2839509` at `regional-location-102` is associated with zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`, a bus zone. This one-to-one mapping ensures that every camera has a clearly defined area of responsibility.

The inverse relationship, from school zones to surveillance cameras, is expressed through a complementary view that joins school zones to their assigned cameras. This perspective is useful when auditing zone coverage or determining which camera feeds to review for a given area.

**View `vw_school_zone_surveillance_camera`**

```sql
CREATE VIEW vw_school_zone_surveillance_camera AS
SELECT a.school_zone_id, a.zone_id, a.zone_type, a.privacy_level, b.id AS camera_id, b.camera_id AS camera_camera_id, b.location AS camera_location
FROM school_zones a JOIN surveillance_cameras b ON a.surveillance_camera_id = b.id;
```

| school_zone_id | zone_id | zone_type | privacy_level | camera_id | camera_camera_id | camera_location |
|---|---|---|---|---|---|---|
| 100 | 937724 | classroom | high | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 |
| 101 | 99504 | locker_room | medium | 1001 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 |
| 102 | 10207142 | hallway | low | 1002 | 1450647 | seasonal-location-101 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | bus | high | 1003 | 2839509 | regional-location-102 |

The zone `937724` (classroom) references camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0` at `extended-location-99`. The locker room zone `99504` references camera `4e383924-8fcc-11eb-924d-9cd76263cbd0` at `integrated-location-100`. The hallway zone `10207142` references camera `1450647` at `seasonal-location-101`. The bus zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3` references camera `2839509` at `regional-location-102`. This bidirectional linkage ensures that neither cameras nor zones exist in isolation.

The connection between school zones and student search events is captured in a view that joins zones to the search events that occurred within them. This view answers the question of which searches took place in which zones and under what circumstances.

**View `vw_school_zone_student_search_event`**

```sql
CREATE VIEW vw_school_zone_student_search_event AS
SELECT a.school_zone_id, a.zone_id, a.zone_type, a.privacy_level, b.student_search_event_id AS event_student_search_event_id, b.search_id AS event_search_id, b.timestamp AS event_timestamp
FROM school_zones a JOIN student_search_events b ON a.student_search_event_id = b.student_search_event_id;
```

| school_zone_id | zone_id | zone_type | privacy_level | event_student_search_event_id | event_search_id | event_timestamp |
|---|---|---|---|---|---|---|
| 100 | 937724 | classroom | high | 1000 | ea9700d4-8fd1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 |
| 101 | 99504 | locker_room | medium | 1001 | 1208-0004-M | 2025-12-19T01:35:00 |
| 102 | 10207142 | hallway | low | 1002 | ca9ccc68-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-03T08:52:00 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | bus | high | 1003 | 1996926 | 2023-10-14T15:09:00 |

Zone `937724` (classroom) is linked to search event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0`, which found contraband. Zone `99504` (locker room) is linked to search event `1208-0004-M`, which found no violation. Zone `10207142` (hallway) is linked to search event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0`, which was inconclusive. Zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3` (bus) is linked to search event `1996926`, which found contraband. This view enables administrators to analyze search patterns by zone type and privacy level.

The relationship between student search events and students is expressed through a view that joins search events to the students involved. This view answers the question of which students were subject to which searches and under what conditions.

**View `vw_student_search_event_student`**

```sql
CREATE VIEW vw_student_search_event_student AS
SELECT a.student_search_event_id, a.search_id, a.timestamp, a.initiated_by, b.id AS student_id, b.student_id AS student_student_id, b.age AS student_age
FROM student_search_events a JOIN students b ON a.student_id = b.id;
```

| student_search_event_id | search_id | timestamp | initiated_by | student_id | student_student_id | student_age |
|---|---|---|---|---|---|---|
| 1000 | ea9700d4-8fd1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | distributed-initiate-42 | 1 | 392507 | 35 |
| 1001 | 1208-0004-M | 2025-12-19T01:35:00 | baseline-initiate-43 | 2 | 25388256 | 40 |
| 1002 | ca9ccc68-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-03T08:52:00 | pilot-initiate-44 | 3 | id_16 | 45 |
| 1003 | 1996926 | 2023-10-14T15:09:00 | extended-initiate-45 | 4 | gd_taxc_2211 | 50 |

Search event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0` is linked to student `392507`, a 35-year-old male in active status. Search event `1208-0004-M` is linked to student `25388256`, a 40-year-old female with suspended status. Search event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0` is linked to student `id_16`, a 45-year-old of other sex with expelled status. Search event `1996926` is linked to student `gd_taxc_2211`, a 50-year-old male with withdrawn status. This view supports demographic analysis of search events and helps identify patterns across student populations.

The connection between student search events and school zones is captured in a view that joins search events to the zones where they occurred. This view answers the question of which searches took place in which zones and what the zone characteristics were.

**View `vw_student_search_event_school_zone`**

```sql
CREATE VIEW vw_student_search_event_school_zone AS
SELECT a.student_search_event_id, a.search_id, a.timestamp, a.initiated_by, b.school_zone_id AS zone_school_zone_id, b.zone_id AS zone_zone_id, b.zone_type AS zone_zone_type
FROM student_search_events a JOIN school_zones b ON a.school_zone_id = b.school_zone_id;
```

| student_search_event_id | search_id | timestamp | initiated_by | zone_school_zone_id | zone_zone_id | zone_zone_type |
|---|---|---|---|---|---|---|
| 1000 | ea9700d4-8fd1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | distributed-initiate-42 | 100 | 937724 | classroom |
| 1001 | 1208-0004-M | 2025-12-19T01:35:00 | baseline-initiate-43 | 101 | 99504 | locker_room |
| 1002 | ca9ccc68-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-03T08:52:00 | pilot-initiate-44 | 102 | 10207142 | hallway |
| 1003 | 1996926 | 2023-10-14T15:09:00 | extended-initiate-45 | 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | bus |

Search event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0` occurred in zone `937724`, a classroom with high privacy. Search event `1208-0004-M` occurred in zone `99504`, a locker room with medium privacy. Search event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0` occurred in zone `10207142`, a hallway with low privacy. Search event `1996926` occurred in zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`, a bus with high privacy. This view is essential for evaluating whether search intrusiveness levels are appropriate for the privacy characteristics of the zone.

The relationship between student search events and school policies is expressed through a view that joins search events to the policies that governed them. This view answers the question of which policies were applied to which searches and whether those policies were approved.

**View `vw_student_search_event_school_policy`**

```sql
CREATE VIEW vw_student_search_event_school_policy AS
SELECT a.student_search_event_id, a.search_id, a.timestamp, a.initiated_by, b.id AS policy_id, b.policy_id AS policy_policy_id, b.title AS policy_title
FROM student_search_events a JOIN school_policies b ON a.school_policy_id = b.id;
```

| student_search_event_id | search_id | timestamp | initiated_by | policy_id | policy_policy_id | policy_title |
|---|---|---|---|---|---|---|
| 1000 | ea9700d4-8fd1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | distributed-initiate-42 | 100 | 5844252 | Compact Initiative |
| 1001 | 1208-0004-M | 2025-12-19T01:35:00 | baseline-initiate-43 | 101 | 10207142 | Legacy Model |
| 1002 | ca9ccc68-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-03T08:52:00 | pilot-initiate-44 | 102 | 1562847 | Regional Cluster A |
| 1003 | 1996926 | 2023-10-14T15:09:00 | extended-initiate-45 | 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Seasonal Review |

Search event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0` was governed by policy `5844252` (Compact Initiative), which is in draft status. Search event `1208-0004-M` was governed by policy `10207142` (Legacy Model), which is pending. Search event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0` was governed by policy `1562847` (Regional Cluster A), which is approved. Search event `1996926` was governed by policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` (Seasonal Review), which is rejected. This view enables compliance auditing by revealing whether searches were conducted under approved policies.

The inverse relationship, from students to their search events, is captured in a view that joins students to the search events they were involved in. This perspective is useful for reviewing a student's complete search history.

**View `vw_student_student_search_event`**

```sql
CREATE VIEW vw_student_student_search_event AS
SELECT a.id, a.student_id, a.age, a.sex, b.student_search_event_id AS event_student_search_event_id, b.search_id AS event_search_id, b.timestamp AS event_timestamp
FROM students a JOIN student_search_events b ON a.student_search_event_id = b.student_search_event_id;
```

| id | student_id | age | sex | event_student_search_event_id | event_search_id | event_timestamp |
|---|---|---|---|---|---|---|
| 1 | 392507 | 35 | male | 1000 | ea9700d4-8fd1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 |
| 2 | 25388256 | 40 | female | 1001 | 1208-0004-M | 2025-12-19T01:35:00 |
| 3 | id_16 | 45 | other | 1002 | ca9ccc68-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-03T08:52:00 |
| 4 | gd_taxc_2211 | 50 | male | 1003 | 1996926 | 2023-10-14T15:09:00 |

Student `392507` is linked to search event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0`, which found contraband. Student `25388256` is linked to search event `1208-0004-M`, which found no violation. Student `id_16` is linked to search event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0`, which was inconclusive. Student `gd_taxc_2211` is linked to search event `1996926`, which found contraband. This view supports individual student reviews and helps track recurring search patterns for specific students.

The connection between students and school zones is expressed through a view that joins students to the zones they are associated with. This view answers the question of which students are assigned to which zones and what the zone characteristics are.

**View `vw_student_school_zone`**

```sql
CREATE VIEW vw_student_school_zone AS
SELECT a.id, a.student_id, a.age, a.sex, b.school_zone_id AS zone_school_zone_id, b.zone_id AS zone_zone_id, b.zone_type AS zone_zone_type
FROM students a JOIN school_zones b ON a.school_zone_id = b.school_zone_id;
```

| id | student_id | age | sex | zone_school_zone_id | zone_zone_id | zone_zone_type |
|---|---|---|---|---|---|---|
| 1 | 392507 | 35 | male | 100 | 937724 | classroom |
| 2 | 25388256 | 40 | female | 101 | 99504 | locker_room |
| 3 | id_16 | 45 | other | 102 | 10207142 | hallway |
| 4 | gd_taxc_2211 | 50 | male | 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | bus |

Student `392507` is associated with zone `937724`, a classroom with high privacy and a capacity of 32. Student `25388256` is associated with zone `99504`, a locker room with medium privacy and a capacity of 41. Student `id_16` is associated with zone `10207142`, a hallway with low privacy and a capacity of 50. Student `gd_taxc_2211` is associated with zone `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`, a bus with high privacy and a capacity of 59. This view supports zone assignment audits and helps ensure that students are placed in appropriate zones.

The relationship between school policies and student search events is captured in a view that joins policies to the search events they govern. This view answers the question of which policies were applied to which searches and provides a policy-centric perspective on search compliance.

**View `vw_school_policy_student_search_event`**

```sql
CREATE VIEW vw_school_policy_student_search_event AS
SELECT a.id, a.policy_id, a.title, a.effective_date, b.student_search_event_id AS event_student_search_event_id, b.search_id AS event_search_id, b.timestamp AS event_timestamp
FROM school_policies a JOIN student_search_events b ON a.student_search_event_id = b.student_search_event_id;
```

| id | policy_id | title | effective_date | event_student_search_event_id | event_search_id | event_timestamp |
|---|---|---|---|---|---|---|
| 100 | 5844252 | Compact Initiative | 2023-02-14 | 1000 | ea9700d4-8fd1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 |
| 101 | 10207142 | Legacy Model | 2024-07-25 | 1001 | 1208-0004-M | 2025-12-19T01:35:00 |
| 102 | 1562847 | Regional Cluster A | 2025-12-09 | 1002 | ca9ccc68-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-03T08:52:00 |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Seasonal Review | 2022-05-20 | 1003 | 1996926 | 2023-10-14T15:09:00 |

Policy `5844252` (Compact Initiative, draft status) governs search event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0`. Policy `10207142` (Legacy Model, pending status) governs search event `1208-0004-M`. Policy `1562847` (Regional Cluster A, approved status) governs search event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0`. Policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` (Seasonal Review, rejected status) governs search event `1996926`. This view is particularly valuable for policy administrators who need to assess the impact of each policy across all governed search events.

The relationship between school policies and surveillance cameras is expressed through a view that joins policies to the cameras they reference. This view answers the question of which cameras are associated with which policies and helps establish the monitoring infrastructure supporting each policy.

**View `vw_school_policy_surveillance_camera`**

```sql
CREATE VIEW vw_school_policy_surveillance_camera AS
SELECT a.id, a.policy_id, a.title, a.effective_date, b.id AS camera_id, b.camera_id AS camera_camera_id, b.location AS camera_location
FROM school_policies a JOIN surveillance_cameras b ON a.surveillance_camera_id = b.id;
```

| id | policy_id | title | effective_date | camera_id | camera_camera_id | camera_location |
|---|---|---|---|---|---|---|
| 100 | 5844252 | Compact Initiative | 2023-02-14 | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 |
| 101 | 10207142 | Legacy Model | 2024-07-25 | 1001 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 |
| 102 | 1562847 | Regional Cluster A | 2025-12-09 | 1002 | 1450647 | seasonal-location-101 |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Seasonal Review | 2022-05-20 | 1003 | 2839509 | regional-location-102 |

Policy `5844252` (Compact Initiative) references camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0` at `extended-location-99`. Policy `10207142` (Legacy Model) references camera `4e383924-8fcc-11eb-924d-9cd76263cbd0` at `integrated-location-100`. Policy `1562847` (Regional Cluster A) references camera `1450647` at `seasonal-location-101`. Policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` (Seasonal Review) references camera `2839509` at `regional-location-102`. This view supports infrastructure audits by revealing the camera-to-policy mapping.

Finally, the self-referential relationship within school policies is captured in a view that joins policies to themselves, enabling policy-to-policy comparisons and hierarchical analysis.

**View `vw_school_policy_school_policy`**

```sql
CREATE VIEW vw_school_policy_school_policy AS
SELECT a.id, a.policy_id, a.title, a.effective_date, b.id AS policy_id, b.policy_id AS policy_policy_id, b.title AS policy_title
FROM school_policies a JOIN school_policies b ON a.school_policy_id = b.id;
```

| id | policy_id | title | effective_date | policy_id | policy_policy_id | policy_title |
|---|---|---|---|---|---|---|
| 100 | 5844252 | Compact Initiative | 2023-02-14 | 100 | 5844252 | Compact Initiative |
| 101 | 10207142 | Legacy Model | 2024-07-25 | 101 | 10207142 | Legacy Model |
| 102 | 1562847 | Regional Cluster A | 2025-12-09 | 102 | 1562847 | Regional Cluster A |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Seasonal Review | 2022-05-20 | 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Seasonal Review |

Policy `5844252` (Compact Initiative) is linked to itself, as are policies `10207142` (Legacy Model), `1562847` (Regional Cluster A), and `ChIJkzsYUIBt5kcRM6_JHx26ONk` (Seasonal Review). This self-referential structure supports policy versioning, cross-referencing, and the tracking of policy evolution over time.

The data records described above form an integrated framework for school safety operations. Surveillance cameras provide the physical monitoring layer, school zones define the spatial and regulatory boundaries, student search events document safety interventions, students are the individuals at the center of these operations, and school policies establish the governance framework. The views tie these records together, enabling administrators to answer complex questions about camera coverage, zone assignments, search patterns, student demographics, and policy compliance. Together, they provide a comprehensive operational picture that supports both day-to-day management and long-term strategic planning for school safety.