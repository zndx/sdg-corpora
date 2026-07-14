## Ontology-Grounded Relational Modelling of School Surveillance and Search Governance

The domain under examination concerns the governance of student searches within school environments, where physical surveillance infrastructure, spatial zones, student records, and policy frameworks intersect to form a tightly constrained operational model. Every search event is anchored to a student, a location, and a policy, while surveillance cameras are deployed within zones that also host search events. The relational schema captures this multi-dimensional reality through five base tables and eleven materialized views, each view reconstructing a domain fact by joining normalized tables along foreign-key edges. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that become columns and foreign keys, and the joins that each view materializes.

### Base Tables and Entity Types

The schema centres on five entity types, each persisted in its own table. The first entity, `surveillance_cameras`, records the physical monitoring infrastructure deployed across school grounds.

**Table `surveillance_cameras`**

| id | camera_id | location | installation_date | is_active | coverage_area | resolution | school_zone_id |
|---|---|---|---|---|---|---|---|
| 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | extended-location-99 | 2022-01-10 | true | extended-coverage-87 | regional-resoluti-30 | 100 |
| 1001 | 4e383924-8fcc-11eb-924d-9cd76263cbd0 | integrated-location-100 | 2023-06-21 | false | integrated-coverage-88 | legacy-resoluti-31 | 101 |
| 1002 | 1450647 | seasonal-location-101 | 2024-11-05 | true | seasonal-coverage-89 | compact-resoluti-32 | 102 |
| 1003 | 2839509 | regional-location-102 | 2025-04-16 | false | regional-coverage-90 | composite-resoluti-33 | 103 |

Each row in `surveillance_cameras` carries a surrogate primary key `id` (values 1000 through 1003), a business identifier `camera_id` that uses either UUIDs such as `98a0473a-8fcd-11eb-924d-9cd76263cbd0` or short numeric codes like `1450647`, and descriptive attributes `location` (e.g. `extended-location-99`), `installation_date` (spanning 2022 to 2025), `is_active` (a boolean flag), `coverage_area` (e.g. `extended-coverage-87`), and `resolution` (e.g. `regional-resoluti-30`). The critical relationship column is `school_zone_id`, a foreign key that binds each camera to exactly one zone in the `school_zones` table. This is a many-to-one relationship: multiple cameras can be assigned to the same zone, but each camera belongs to one zone.

The second entity, `school_zones`, models the physical and regulatory spaces within a school.

**Table `school_zones`**

| school_zone_id | zone_id | zone_type | privacy_level | is_indoor | capacity | surveillance_camera_id | student_search_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 937724 | classroom | high | false | 32 | 1000 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 99504 | locker_room | medium | true | 41 | 1001 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 10207142 | hallway | low | false | 50 | 1002 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | bus | high | true | 59 | 1003 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The primary key is `school_zone_id` (values 100–103), and each zone carries a business `zone_id` (ranging from numeric `937724` to UUID `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`), a categorical `zone_type` (classroom, locker_room, hallway, bus), a `privacy_level` (high, medium, low), a boolean `is_indoor` flag, a numeric `capacity` (32–59), and two timestamp columns `created_at` and `updated_at`. The table also contains two foreign keys: `surveillance_camera_id` references `surveillance_cameras.id`, and `student_search_event_id` references `student_search_events.student_search_event_id`. These create bidirectional association edges — a zone can reference a camera, and a camera references a zone through its own `school_zone_id` column — forming a mutually linked pair that captures the deployment topology.

The third entity, `student_search_events`, is the operational core of the schema.

**Table `student_search_events`**

| student_search_event_id | search_id | timestamp | initiated_by | reasonableness_inception | reasonableness_scope | intrusiveness_level | outcome | student_id | school_zone_id | school_policy_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ea9700d4-8fd1-11eb-924d-9cd76263cbd0 | 2024-07-08T18:18:00 | distributed-initiate-42 | false | false | minimal | contraband_found | 1 | 100 | 100 |
| 1001 | 1208-0004-M | 2025-12-19T01:35:00 | baseline-initiate-43 | true | true | moderate | no_violation | 2 | 101 | 101 |
| 1002 | ca9ccc68-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-03T08:52:00 | pilot-initiate-44 | false | false | excessive | inconclusive | 3 | 102 | 102 |
| 1003 | 1996926 | 2023-10-14T15:09:00 | extended-initiate-45 | true | true | minimal | contraband_found | 4 | 103 | 103 |

Each row represents a discrete search event, identified by `student_search_event_id` (1000–1003) and a business `search_id` (UUIDs like `ea9700d4-8fd1-11eb-924d-9cd76263cbd0` or codes like `1208-0004-M`). The event carries a `timestamp` (e.g. `2024-07-08T18:18:00`), an `initiated_by` field (e.g. `distributed-initiate-42`), two boolean flags `reasonableness_inception` and `reasonableness_scope`, an `intrusiveness_level` (minimal, moderate, excessive), an `outcome` (contraband_found, no_violation, inconclusive), and three foreign keys: `student_id` pointing to `students.id`, `school_zone_id` pointing to `school_zones.school_zone_id`, and `school_policy_id` pointing to `school_policies.id`. This table is the hub of the schema, connecting students, zones, and policies in a single fact record.

The fourth entity, `students`, stores individual learner records.

**Table `students`**

| id | student_id | age | sex | grade_level | enrollment_status | student_search_event_id | school_zone_id |
|---|---|---|---|---|---|---|---|
| 1 | 392507 | 35 | male | 29 | active | 1000 | 100 |
| 2 | 25388256 | 40 | female | 33 | suspended | 1001 | 101 |
| 3 | id_16 | 45 | other | 37 | expelled | 1002 | 102 |
| 4 | gd_taxc_2211 | 50 | male | 41 | withdrawn | 1003 | 103 |

The primary key is `id` (1–4), with a business `student_id` (e.g. `392507`, `gd_taxc_2211`), demographic attributes `age` (35–50), `sex` (male, female, other), `grade_level` (29–41), and `enrollment_status` (active, suspended, expelled, withdrawn). The table includes two foreign keys: `student_search_event_id` links back to `student_search_events`, and `school_zone_id` links to `school_zones`. This creates a reverse association from student to their most recent search event and zone.

The fifth entity, `school_policies`, codifies the regulatory framework.

**Table `school_policies`**

| id | policy_id | title | effective_date | last_reviewed | approval_status | jurisdiction | student_search_event_id | surveillance_camera_id | school_policy_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 5844252 | Compact Initiative | 2023-02-14 | 2022-05-27 | draft | regional-jurisdic-30 | 1000 | 1000 | 100 |
| 101 | 10207142 | Legacy Model | 2024-07-25 | 2023-10-11 | pending | legacy-jurisdic-31 | 1001 | 1001 | 101 |
| 102 | 1562847 | Regional Cluster A | 2025-12-09 | 2024-03-22 | approved | compact-jurisdic-32 | 1002 | 1002 | 102 |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Seasonal Review | 2022-05-20 | 2025-08-06 | rejected | composite-jurisdic-33 | 1003 | 1003 | 103 |

Each policy has a surrogate `id` (100–103), a business `policy_id` (e.g. `5844252`, `ChIJkzsYUIBt5kcRM6_JHx26ONk`), a `title` (Compact Initiative, Legacy Model, Regional Cluster A, Seasonal Review), date fields `effective_date` and `last_reviewed`, an `approval_status` (draft, pending, approved, rejected), a `jurisdiction` (e.g. `regional-jurisdic-30`), and three foreign keys: `student_search_event_id` references the search event the policy governs, `surveillance_camera_id` references a camera, and `school_policy_id` creates a self-referencing link to another policy (enabling hierarchical or cross-referencing policy structures).

### Foreign-Key Topology and Cardinality

The foreign-key graph forms a star with `student_search_events` at the centre. Each search event references one student, one zone, and one policy — a 1:1 or 1:N cardinality from the perspective of the referencing table. Conversely, a student can appear in multiple search events (1:N from students to events), a zone can host multiple events (1:N from zones to events), and a policy can govern multiple events (1:N from policies to events). The `surveillance_cameras` table sits slightly off-centre: it links to `school_zones` via `school_zone_id`, and `school_policies` links back to cameras via `surveillance_camera_id`, creating a camera–zone–policy triangle. The `school_zones` table itself contains `surveillance_camera_id` and `student_search_event_id` foreign keys, adding reverse edges that allow zone-centric queries to reach into camera and event tables without traversing the event hub.

### View-Based Fact Reconstruction

Views materialize domain questions by joining these normalized tables. Each view answers a specific analytical query by denormalizing the relevant entities into a single flat result set.

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

This view joins `surveillance_cameras` to `school_zones` on `surveillance_cameras.school_zone_id = school_zones.school_zone_id`, producing a camera-centric view of zone metadata. The result shows, for example, that camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0` at `extended-location-99` (installed 2022-01-10) covers zone `937724`, a `classroom`-type zone. The view answers the question: "Which zone does each camera monitor?" It is a direct projection of the camera-to-zone foreign key.

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

This is the inverse perspective: it joins `school_zones` to `surveillance_cameras` on the same key, answering "Which camera monitors each zone?" The row for zone `99504` (a `locker_room` with `medium` privacy) shows it is monitored by camera `4e383924-8fcc-11eb-924d-9cd76263cbd0` at `integrated-location-100`. The column aliases (`zone_school_zone_id`, `zone_zone_id`, `zone_zone_type`) disambiguate the zone columns from the camera columns in the projection.

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

This view joins `school_zones` to `student_search_events` on `school_zone_id`, answering "Which search events occurred in each zone?" The row for zone `102` (a `hallway` with `low` privacy) shows search event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0`, which had an `excessive` intrusiveness level and an `inconclusive` outcome. This view is useful for auditing search frequency and severity by location type.

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

This view joins `student_search_events` to `students` on `student_search_events.student_id = students.id`, answering "Which student was subject to each search event?" The row for event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0` shows student `392507`, a 35-year-old male in grade level 29 with `active` enrollment status, who was searched for `contraband_found`. This view reconstructs the student-level view of search history.

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

This view joins `student_search_events` to `school_zones` on `school_zone_id`, answering "In which zone did each search event take place?" The row for event `1208-0004-M` shows it occurred in zone `99504`, a `locker_room` with `medium` privacy and `is_indoor = true`. This view is essential for spatial analysis of search events, correlating zone characteristics (privacy level, indoor/outdoor) with event attributes (intrusiveness, outcome).

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

This view joins `student_search_events` to `school_policies` on `student_search_events.school_policy_id = school_policies.id`, answering "Which policy governed each search event?" The row for event `ca9ccc68-8fcd-11eb-924d-9cd76263cbd0` shows it was governed by policy `1562847`, titled "Regional Cluster A", with `approved` status and `compact-jurisdic-32` jurisdiction. This view enables compliance auditing by linking events to their regulatory basis.

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

This view joins `students` to `student_search_events` on `students.id = student_search_events.student_id`, answering "Which search events involve each student?" The row for student `392507` shows search event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0`, initiated by `distributed-initiate-42` with `minimal` intrusiveness. This view reconstructs a student-centric timeline of search events.

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

This view joins `students` to `school_zones` on `students.school_zone_id = school_zones.school_zone_id`, answering "Which zone is each student associated with?" The row for student `gd_taxc_2211` shows association with zone `103`, a `bus`-type zone with `high` privacy and `is_indoor = true`. This view supports zone-level enrollment and assignment analysis.

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

This view joins `school_policies` to `student_search_events` on `school_policies.id = student_search_events.school_policy_id`, answering "Which search events are governed by each policy?" The row for policy `5844252` ("Compact Initiative", `draft` status) shows it governs event `ea9700d4-8fd1-11eb-924d-9cd76263cbd0`, which resulted in `contraband_found`. This view is critical for policy effectiveness analysis, correlating policy status with event outcomes.

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

This view joins `school_policies` to `surveillance_cameras` on `school_policies.surveillance_camera_id = surveillance_cameras.id`, answering "Which cameras are associated with each policy?" The row for policy `5844252` ("Compact Initiative") shows association with camera `98a0473a-8fcd-11eb-924d-9cd76263cbd0` at `extended-location-99`. This view supports infrastructure-policy alignment audits.

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

This self-joining view links `school_policies` to itself on `school_policies.school_policy_id = school_policies.id`, answering "Which policies reference or depend on other policies?" The row for policy `5844252` ("Compact Initiative") shows it references itself (self-loop), indicating a policy that may serve as its own parent or cross-reference. This view enables hierarchical policy analysis, revealing policy dependency chains.

### Synthesis

The schema models school search governance as a network of five entities connected by foreign keys that encode cardinality-bounded relationships. The `student_search_events` table serves as the central fact table, linking students, zones, and policies in a single operational record. Surveillance cameras are deployed within zones, and policies govern both cameras and search events, creating a rich web of associations. The eleven views denormalize these relationships along specific axes — camera-to-zone, zone-to-camera, zone-to-event, event-to-student, event-to-zone, event-to-policy, student-to-event, student-to-zone, policy-to-event, policy-to-camera, and policy-to-policy — each answering a distinct analytical question. Together, the base tables and views provide a complete relational representation of the domain, where every row in every view can be traced back to a join of normalized tables along well-defined foreign-key edges.