The institutional operations domain under study spans the physical infrastructure of a campus, the people who inhabit it, and the instructional activities that animate it. A single institution maintains several buildings, each containing classrooms equipped for teaching. Within those rooms, faculty members deliver instructional sessions to enrolled students, while students submit feedback surveys and, for international enrollees, maintain immigration-related documentation. The relational model captures this ecosystem through a carefully normalised set of base tables, junction tables that resolve many-to-many associations, and a family of materialised views that reassemble domain facts for reporting. The following chapter walks through the entity types, their attributes, the cardinality-bounded relationships that bind them, and the view-level joins that reconstruct the stories the data tells.

## Entity Types and Base Tables

The foundation of the schema consists of eight base tables, each representing a distinct entity type with a stable identifier and a set of descriptive attributes. The `physical_locations` table anchors the spatial dimension of the domain. Its primary key `id` is an integer surrogate, while the remaining columns capture the address and footprint of each site. A row such as `id = 1` carries `street_address = 'composite-street-15'`, `city = 'integrated-city-34'`, `state = 'distributed-state-84'`, `postal_code = '9125611'`, `country = 'compact-country-26'`, `building_floors = 35`, and `total_area_sq_ft = 11.70`. The second row (`id = 2`) sits at `primary-street-16` in `seasonal-city-35` with `building_floors = 45` and `total_area_sq_ft = 14.40`; the third and fourth rows follow the same pattern, with `id = 3` at `adaptive-street-17` in `regional-city-36` and `id = 4` at `distributed-street-18` in `legacy-city-37`.

**Table `physical_locations`**

| id | street_address | city | state | postal_code | country | building_floors | total_area_sq_ft |
|---|---|---|---|---|---|---|---|
| 1 | composite-street-15 | integrated-city-34 | distributed-state-84 | 9125611 | compact-country-26 | 35 | 11.70 |
| 2 | primary-street-16 | seasonal-city-35 | baseline-state-85 | ChIJt4hBkzhu5kcRJJDUNqGUpso | composite-country-27 | 45 | 14.40 |
| 3 | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3001009030200 | primary-country-28 | 55 | 17.10 |
| 4 | distributed-street-18 | legacy-city-37 | extended-state-87 | 4060635 | adaptive-country-29 | 65 | 19.80 |

Classrooms are modelled in the `classrooms` table, which stores a surrogate `classroom_id` as primary key, a human-readable `room_identifier` (for example, `ROO-2647`), a numeric `capacity`, an `equipment_inventory` string such as `integrated-equipmen-58`, and a foreign key `physical_location_id` that references `physical_locations.id`. The foreign key enforces the constraint that every classroom must belong to exactly one physical location, while a location may contain zero or more classrooms — a one-to-many relationship materialised as a column-level FK. The four sample rows map `classroom_id` 1 through 4 to `room_identifier` values `ROO-2647` through `ROO-2668`, with capacities ranging from 32 to 59 and `physical_location_id` values 1 through 4 respectively.

**Table `classrooms`**

| classroom_id | room_identifier | capacity | equipment_inventory | physical_location_id |
|---|---|---|---|---|
| 1 | ROO-2647 | 32 | integrated-equipmen-58 | 1 |
| 2 | ROO-2654 | 41 | seasonal-equipmen-59 | 2 |
| 3 | ROO-2661 | 50 | regional-equipmen-60 | 3 |
| 4 | ROO-2668 | 59 | legacy-equipmen-61 | 4 |

Instructional sessions are the central event entity, stored in `instructional_sessions`. Its primary key `id` is an integer, and the table carries a `session_identifier` (e.g. `SES-2443`), `start_date` and `end_date` timestamps, a `status` column with values such as `scheduled`, `running`, `completed`, or `cancelled`, and two foreign keys: `classroom_id` pointing to `classrooms.classroom_id` and `faculty_member_id` pointing to `faculty_members.id`. The sample data shows four sessions, `SES-2443` through `SES-2461`, each assigned to a distinct classroom and faculty member, with statuses spanning the full lifecycle.

**Table `instructional_sessions`**

| id | session_identifier | start_date | end_date | status | classroom_id | faculty_member_id |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | scheduled | 1 | 1 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | running | 2 | 2 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | 3 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 4 | 4 |

Faculty members reside in the `faculty_members` table, keyed by integer `id`. The columns include `employee_id` (a string such as `Norma Fisher`), `full_name` (e.g. `Theodore Mcgrath`), `native_language` (e.g. `compact-native-98`), `qualification_level` (values like `Bachelor`, `Master`, or `Doctorate`), `certification_type` (such as `TESOL`, `TEFL`, or `CELTA`), and `employment_status` (one of `active`, `inactive`, or `on_leave`). The four sample faculty rows demonstrate the range of qualification levels and certification types present in the domain.

**Table `faculty_members`**

| id | employee_id | full_name | native_language | qualification_level | certification_type | employment_status |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | compact-native-98 | Bachelor | TESOL | active |
| 2 | Tasha Rodriguez | Account Name | composite-native-99 | Master | TEFL | inactive |
| 3 | Theodore Mcgrath | Saipan International Airport | primary-native-100 | Doctorate | CELTA | on_leave |
| 4 | Peter Mcdowell | Norma Fisher | adaptive-native-101 | Bachelor | Other | active |

Students are captured in the `students` table, with `student_id` as primary key. Attributes include `full_name`, `nationality` (e.g. `composite-national-39`), `visa_status` (values `F1`, `J1`, or `Other`), `enrollment_date`, `current_level` (one of `Beginner`, `Intermediate`, or `Advanced`), and a foreign key `i20_form_id` that references the `i20_forms` table. The sample rows show students with visa statuses `F1` and `J1`, enrollment dates spanning 2022 to 2025, and current levels from Beginner to Advanced.

**Table `students`**

| student_id | full_name | nationality | visa_status | enrollment_date | current_level | i20_form_id |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | composite-national-39 | F1 | 2022-05-11 | Beginner | 1 |
| 2 | Account Name | primary-national-40 | J1 | 2023-10-22 | Intermediate | 2 |
| 3 | Saipan International Airport | adaptive-national-41 | Other | 2024-03-06 | Advanced | 3 |
| 4 | Norma Fisher | distributed-national-42 | F1 | 2025-08-17 | Beginner | 4 |

Student feedback is recorded in `student_surveys`, a table whose primary key is `id`. Each survey row carries a `survey_id` (which may be a UUID such as `b83e028a-8fcd-11eb-924d-9cd76263cbd0` or an integer like `21005921`), a `collection_date` timestamp, a `feedback_category` (one of `Program`, `Teacher`, or `Facilities`), a numeric `satisfaction_score`, free-text `comments` (e.g. `primary-comments-52`), and three foreign keys: `student_id` referencing `students.student_id`, `faculty_member_id` referencing `faculty_members.id`, and `instructional_session_id` referencing `instructional_sessions.id`. This table thus links a single survey to a student, a faculty member, and an instructional session simultaneously.

**Table `student_surveys`**

| id | survey_id | collection_date | feedback_category | satisfaction_score | comments | student_id | faculty_member_id | instructional_session_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | 2025-12-17T11:57:00 | Program | 5 | primary-comments-52 | 1 | 1 | 1 |
| 2 | 726059 | 2022-05-01T18:14:00 | Teacher | 8 | adaptive-comments-53 | 2 | 2 | 2 |
| 3 | 32814 | 2023-10-12T01:31:00 | Facilities | 11 | distributed-comments-54 | 3 | 3 | 3 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-23T08:48:00 | Program | 14 | baseline-comments-55 | 4 | 4 | 4 |

The `accreditations` table and the `i20_forms` table round out the base schema. The `i20_forms` table stores immigration documentation associated with students; its primary key is referenced by `students.i20_form_id`. The `accreditations` table captures institutional accreditation records. Both tables participate in the view layer through joins that surface their attributes alongside the entities they relate to.

**Table `accreditations`**

| id | accreditation_id | issuing_agency | start_date | end_date | status |
|---|---|---|---|---|---|
| 1 | 22386325 | Technos Japan | 2022-09-05 | 2022-09-01 | active |
| 2 | L150 | Sanniquellie Mahn | 2023-02-16 | 2023-02-12 | expired |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Greater Houston Community Foundation | 2024-07-27 | 2024-07-23 | pending |
| 4 | 1450655 | Lucas Industries | 2025-12-11 | 2025-12-07 | active |

**Table `i20_forms`**

| i20_form_id | form_id | issue_date | sevis_id | program_start_date | program_end_date | funding_source | student_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | template_impcode_pagata_20det10 | 2023-02-01 | 1889789 | 2022-09-22 | 2022-09-03 | baseline-funding-73 | 1 | 2025-01-01 00:14:00 |
| 2 | 937744 | 2024-07-12 | 9246330 | 2023-02-06 | 2023-02-14 | pilot-funding-74 | 2 | 2025-02-06 03:14:00 |
| 3 | 1250195 | 2025-12-23 | 32824 | 2024-07-17 | 2024-07-25 | extended-funding-75 | 3 | 2025-03-11 06:14:00 |
| 4 | 3355762 | 2022-05-07 | 3990177 | 2025-12-01 | 2025-12-09 | integrated-funding-76 | 4 | 2025-04-16 09:14:00 |

## Junction Tables and Many-to-Many Relationships

Several entity pairs exhibit many-to-many cardinality, which the model resolves through explicit junction tables. The `locations_classrooms` junction table links `physical_locations` to `classrooms`, allowing a single location to be associated with multiple classrooms and, in principle, a classroom to be associated with multiple locations (though the FK in `classrooms` already constrains the relationship to one location per classroom in practice). The `classrooms_sessions` junction table connects `classrooms` to `instructional_sessions`, decoupling the session-to-classroom association from the session row itself and enabling a classroom to host multiple sessions over time and a session to be associated with multiple rooms.

**Table `locations_classrooms`**

| physical_location_id | classroom_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `classrooms_sessions`**

| classroom_id | instructional_session_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The relationship between students and instructional sessions is modelled through two junction tables: `sessions_students` and `students_sessions`. Both serve the same logical purpose — linking a student to a session they attend — and their coexistence may reflect different access patterns or historical design choices. Similarly, the `members_sessions` junction table links `faculty_members` to `instructional_sessions`, providing an alternative path to the FK-based association already present in `instructional_sessions.faculty_member_id`.

**Table `sessions_students`**

| instructional_session_id | student_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `students_sessions`**

| student_id | instructional_session_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `members_sessions`**

| faculty_member_id | instructional_session_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `students_surveys` junction table connects `students` to `student_surveys`, mirroring the FK relationship already embedded in `student_surveys.student_id`. Its presence suggests a design where survey-to-student associations can be managed independently, perhaps to support audit trails or soft-deletion patterns.

**Table `students_surveys`**

| student_id | student_survey_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Views: Reconstructing Domain Facts

The view layer reassembles normalised data into denormalised result sets that answer specific analytical questions. Each view is a `SELECT` with explicit `JOIN` clauses that traverse foreign keys to bring together attributes from multiple base or junction tables. The following sections interpret each view by describing the question it answers and citing concrete rows as evidence.

The view `v_physical_location_classroom_detail` joins `physical_locations` to `classrooms` on `physical_locations.id = classrooms.physical_location_id`. It answers the question: "Which classrooms reside in which physical locations, and what are their capacities?" A row from this view might combine `street_address = 'composite-street-15'` and `city = 'integrated-city-34'` from `physical_locations` with `room_identifier = 'ROO-2647'` and `capacity = 32` from `classrooms`, giving a facility manager a single-row summary of a room's location and size.

**View `v_physical_location_classroom_detail`**

```sql
CREATE VIEW v_physical_location_classroom_detail AS
SELECT a.id, a.street_address, a.city, b.classroom_id AS classroom_classroom_id, b.room_identifier AS classroom_room_identifier, b.capacity AS classroom_capacity
FROM physical_locations a
  JOIN locations_classrooms j ON j.physical_location_id = a.id
  JOIN classrooms b ON b.classroom_id = j.classroom_id;
```

| id | street_address | city | classroom_classroom_id | classroom_room_identifier | classroom_capacity |
|---|---|---|---|---|---|
| 1 | composite-street-15 | integrated-city-34 | 1 | ROO-2647 | 32 |
| 1 | composite-street-15 | integrated-city-34 | 2 | ROO-2654 | 41 |
| 2 | primary-street-16 | seasonal-city-35 | 2 | ROO-2654 | 41 |
| 2 | primary-street-16 | seasonal-city-35 | 3 | ROO-2661 | 50 |
| 3 | adaptive-street-17 | regional-city-36 | 3 | ROO-2661 | 50 |
| 3 | adaptive-street-17 | regional-city-36 | 4 | ROO-2668 | 59 |
| 4 | distributed-street-18 | legacy-city-37 | 4 | ROO-2668 | 59 |
| 4 | distributed-street-18 | legacy-city-37 | 1 | ROO-2647 | 32 |

The view `v_classroom_physical_location` performs the same join in the opposite logical direction, presenting `classrooms` as the driving table and attaching location attributes. It answers: "For each classroom, what is its physical address and footprint?" A row might show `classroom_id = 2` with `room_identifier = 'ROO-2654'` alongside `city = 'seasonal-city-35'` and `building_floors = 45`, enabling a query that lists all classrooms in a given city.

**View `v_classroom_physical_location`**

```sql
CREATE VIEW v_classroom_physical_location AS
SELECT a.classroom_id, a.room_identifier, a.capacity, a.equipment_inventory, b.id AS location_id, b.street_address AS location_street_address, b.city AS location_city
FROM classrooms a JOIN physical_locations b ON a.physical_location_id = b.id;
```

| classroom_id | room_identifier | capacity | equipment_inventory | location_id | location_street_address | location_city |
|---|---|---|---|---|---|---|
| 1 | ROO-2647 | 32 | integrated-equipmen-58 | 1 | composite-street-15 | integrated-city-34 |
| 2 | ROO-2654 | 41 | seasonal-equipmen-59 | 2 | primary-street-16 | seasonal-city-35 |
| 3 | ROO-2661 | 50 | regional-equipmen-60 | 3 | adaptive-street-17 | regional-city-36 |
| 4 | ROO-2668 | 59 | legacy-equipmen-61 | 4 | distributed-street-18 | legacy-city-37 |

The view `v_classroom_instructional_session_detail` joins `classrooms` to `instructional_sessions` on `classrooms.classroom_id = instructional_sessions.classroom_id`. It answers: "Which sessions are held in which classrooms, and what are their dates and statuses?" A row might combine `room_identifier = 'ROO-2647'` with `session_identifier = 'SES-2443'`, `start_date = '2022-09-05T20:24:00'`, and `status = 'scheduled'`, allowing a scheduler to see all sessions booked in a room.

**View `v_classroom_instructional_session_detail`**

```sql
CREATE VIEW v_classroom_instructional_session_detail AS
SELECT a.classroom_id, a.room_identifier, a.capacity, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM classrooms a
  JOIN classrooms_sessions j ON j.classroom_id = a.classroom_id
  JOIN instructional_sessions b ON b.id = j.instructional_session_id;
```

| classroom_id | room_identifier | capacity | session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|
| 1 | ROO-2647 | 32 | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 1 | ROO-2647 | 32 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | ROO-2654 | 41 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | ROO-2654 | 41 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | ROO-2661 | 50 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | ROO-2661 | 50 | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | ROO-2668 | 59 | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | ROO-2668 | 59 | 1 | SES-2443 | 2022-09-05T20:24:00 |

The view `v_instructional_session_classroom` reverses the perspective, driving from `instructional_sessions` and attaching classroom attributes. It answers: "For each session, which room hosts it and what is that room's capacity?" A row might show `session_identifier = 'SES-2449'` with `status = 'running'` alongside `room_identifier = 'ROO-2654'` and `capacity = 41`, useful for verifying that a room's capacity is adequate for the enrolled student count.

**View `v_instructional_session_classroom`**

```sql
CREATE VIEW v_instructional_session_classroom AS
SELECT a.id, a.session_identifier, a.start_date, a.end_date, b.classroom_id AS classroom_classroom_id, b.room_identifier AS classroom_room_identifier, b.capacity AS classroom_capacity
FROM instructional_sessions a JOIN classrooms b ON a.classroom_id = b.classroom_id;
```

| id | session_identifier | start_date | end_date | classroom_classroom_id | classroom_room_identifier | classroom_capacity |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | ROO-2647 | 32 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | ROO-2654 | 41 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | ROO-2661 | 50 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | ROO-2668 | 59 |

The view `v_instructional_session_faculty_member` joins `instructional_sessions` to `faculty_members` on `instructional_sessions.faculty_member_id = faculty_members.id`. It answers: "Which faculty member is assigned to each session?" A row might combine `session_identifier = 'SES-2455'` with `full_name = 'Theodore Mcgrath'`, `qualification_level = 'Doctorate'`, and `employment_status = 'on_leave'`, alerting an administrator that a session is assigned to a faculty member who is currently on leave.

**View `v_instructional_session_faculty_member`**

```sql
CREATE VIEW v_instructional_session_faculty_member AS
SELECT a.id, a.session_identifier, a.start_date, a.end_date, b.id AS member_id, b.employee_id AS member_employee_id, b.full_name AS member_full_name
FROM instructional_sessions a JOIN faculty_members b ON a.faculty_member_id = b.id;
```

| id | session_identifier | start_date | end_date | member_id | member_employee_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | Tasha Rodriguez | Account Name |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | Peter Mcdowell | Norma Fisher |

The view `v_instructional_session_student_detail` joins `instructional_sessions` to `students` through the session-student junction tables. It answers: "Which students are enrolled in which sessions?" A row might show `session_identifier = 'SES-2461'` with `status = 'cancelled'` alongside `full_name = 'Norma Fisher'`, `visa_status = 'F1'`, and `current_level = 'Beginner'`, enabling a report on student demographics per session.

**View `v_instructional_session_student_detail`**

```sql
CREATE VIEW v_instructional_session_student_detail AS
SELECT a.id, a.session_identifier, a.start_date, b.student_id AS student_student_id, b.full_name AS student_full_name, b.nationality AS student_nationality
FROM instructional_sessions a
  JOIN sessions_students j ON j.instructional_session_id = a.id
  JOIN students b ON b.student_id = j.student_id;
```

| id | session_identifier | start_date | student_student_id | student_full_name | student_nationality |
|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 1 | Theodore Mcgrath | composite-national-39 |
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2 | Account Name | primary-national-40 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2 | Account Name | primary-national-40 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 3 | Saipan International Airport | adaptive-national-41 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 3 | Saipan International Airport | adaptive-national-41 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 4 | Norma Fisher | distributed-national-42 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 4 | Norma Fisher | distributed-national-42 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 1 | Theodore Mcgrath | composite-national-39 |

The view `v_faculty_member_instructional_session_detail` joins `faculty_members` to `instructional_sessions`, presenting faculty as the driving entity. It answers: "What sessions is each faculty member teaching?" A row might combine `full_name = 'Tasha Rodriguez'` with `qualification_level = 'Master'` and `certification_type = 'TEFL'` alongside `session_identifier = 'SES-2449'` and `status = 'running'`, giving a department head a roster of each faculty member's teaching load.

**View `v_faculty_member_instructional_session_detail`**

```sql
CREATE VIEW v_faculty_member_instructional_session_detail AS
SELECT a.id, a.employee_id, a.full_name, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM faculty_members a
  JOIN members_sessions j ON j.faculty_member_id = a.id
  JOIN instructional_sessions b ON b.id = j.instructional_session_id;
```

| id | employee_id | full_name | session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 1 | Norma Fisher | Theodore Mcgrath | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | Tasha Rodriguez | Account Name | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | Tasha Rodriguez | Account Name | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | Theodore Mcgrath | Saipan International Airport | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | Theodore Mcgrath | Saipan International Airport | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | Peter Mcdowell | Norma Fisher | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | Peter Mcdowell | Norma Fisher | 1 | SES-2443 | 2022-09-05T20:24:00 |

The view `v_student_instructional_session_detail` joins `students` to `instructional_sessions`, answering: "Which sessions is each student attending?" A row might show `full_name = 'Theodore Mcgrath'` with `nationality = 'composite-national-39'` and `visa_status = 'F1'` alongside `session_identifier = 'SES-2443'` and `start_date = '2022-09-05T20:24:00'`, supporting queries on student session participation by nationality or visa category.

**View `v_student_instructional_session_detail`**

```sql
CREATE VIEW v_student_instructional_session_detail AS
SELECT a.student_id, a.full_name, a.nationality, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM students a
  JOIN students_sessions j ON j.student_id = a.student_id
  JOIN instructional_sessions b ON b.id = j.instructional_session_id;
```

| student_id | full_name | nationality | session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | composite-national-39 | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 1 | Theodore Mcgrath | composite-national-39 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | Account Name | primary-national-40 | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 2 | Account Name | primary-national-40 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | Saipan International Airport | adaptive-national-41 | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 3 | Saipan International Airport | adaptive-national-41 | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | Norma Fisher | distributed-national-42 | 4 | SES-2461 | 2025-12-11T17:15:00 |
| 4 | Norma Fisher | distributed-national-42 | 1 | SES-2443 | 2022-09-05T20:24:00 |

The view `v_student_student_survey_detail` joins `students` to `student_surveys` on `students.student_id = student_surveys.student_id`. It answers: "What feedback has each student submitted?" A row might combine `full_name = 'Account Name'` with `survey_id = '726059'`, `feedback_category = 'Teacher'`, `satisfaction_score = 8`, and `comments = 'adaptive-comments-53'`, enabling a dean to review all feedback from a particular student.

**View `v_student_student_survey_detail`**

```sql
CREATE VIEW v_student_student_survey_detail AS
SELECT a.student_id, a.full_name, a.nationality, b.id AS survey_id, b.survey_id AS survey_survey_id, b.collection_date AS survey_collection_date
FROM students a
  JOIN students_surveys j ON j.student_id = a.student_id
  JOIN student_surveys b ON b.id = j.student_survey_id;
```

| student_id | full_name | nationality | survey_id | survey_survey_id | survey_collection_date |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | composite-national-39 | 1 | 21005921 | 2025-12-17T11:57:00 |
| 1 | Theodore Mcgrath | composite-national-39 | 2 | 726059 | 2022-05-01T18:14:00 |
| 2 | Account Name | primary-national-40 | 2 | 726059 | 2022-05-01T18:14:00 |
| 2 | Account Name | primary-national-40 | 3 | 32814 | 2023-10-12T01:31:00 |
| 3 | Saipan International Airport | adaptive-national-41 | 3 | 32814 | 2023-10-12T01:31:00 |
| 3 | Saipan International Airport | adaptive-national-41 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-23T08:48:00 |
| 4 | Norma Fisher | distributed-national-42 | 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-23T08:48:00 |
| 4 | Norma Fisher | distributed-national-42 | 1 | 21005921 | 2025-12-17T11:57:00 |

The view `v_student_i20_form` joins `students` to `i20_forms` on `students.i20_form_id = i20_forms.id`. It answers: "Which students have which I-20 forms, and what are the form details?" A row might show `full_name = 'Saipan International Airport'` with `visa_status = 'Other'` alongside I-20 form attributes, supporting compliance reporting for international students.

**View `v_student_i20_form`**

```sql
CREATE VIEW v_student_i20_form AS
SELECT a.student_id, a.full_name, a.nationality, a.visa_status, b.i20_form_id AS form_i20_form_id, b.form_id AS form_form_id, b.issue_date AS form_issue_date
FROM students a JOIN i20_forms b ON a.i20_form_id = b.i20_form_id;
```

| student_id | full_name | nationality | visa_status | form_i20_form_id | form_form_id | form_issue_date |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | composite-national-39 | F1 | 1 | template_impcode_pagata_20det10 | 2023-02-01 |
| 2 | Account Name | primary-national-40 | J1 | 2 | 937744 | 2024-07-12 |
| 3 | Saipan International Airport | adaptive-national-41 | Other | 3 | 1250195 | 2025-12-23 |
| 4 | Norma Fisher | distributed-national-42 | F1 | 4 | 3355762 | 2022-05-07 |

The view `v_student_survey_student` joins `student_surveys` to `students`, presenting surveys as the driving entity. It answers: "For each survey, who submitted it and what are their details?" A row might show `survey_id = '21005921'` with `collection_date = '2025-12-17T11:57:00'` and `feedback_category = 'Program'` alongside `full_name = 'Theodore Mcgrath'` and `current_level = 'Beginner'`, useful for analysing satisfaction by student level.

**View `v_student_survey_student`**

```sql
CREATE VIEW v_student_survey_student AS
SELECT a.id, a.survey_id, a.collection_date, a.feedback_category, b.student_id AS student_student_id, b.full_name AS student_full_name, b.nationality AS student_nationality
FROM student_surveys a JOIN students b ON a.student_id = b.student_id;
```

| id | survey_id | collection_date | feedback_category | student_student_id | student_full_name | student_nationality |
|---|---|---|---|---|---|---|
| 1 | 21005921 | 2025-12-17T11:57:00 | Program | 1 | Theodore Mcgrath | composite-national-39 |
| 2 | 726059 | 2022-05-01T18:14:00 | Teacher | 2 | Account Name | primary-national-40 |
| 3 | 32814 | 2023-10-12T01:31:00 | Facilities | 3 | Saipan International Airport | adaptive-national-41 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-23T08:48:00 | Program | 4 | Norma Fisher | distributed-national-42 |

The view `v_student_survey_faculty_member` joins `student_surveys` to `faculty_members` on `student_surveys.faculty_member_id = faculty_members.id`. It answers: "Which faculty members are being evaluated, and what are the survey results?" A row might combine `survey_id = '726059'` with `feedback_category = 'Teacher'` and `satisfaction_score = 8` alongside `full_name = 'Tasha Rodriguez'` and `employment_status = 'inactive'`, enabling an HR review of feedback for faculty who are no longer active.

**View `v_student_survey_faculty_member`**

```sql
CREATE VIEW v_student_survey_faculty_member AS
SELECT a.id, a.survey_id, a.collection_date, a.feedback_category, b.id AS member_id, b.employee_id AS member_employee_id, b.full_name AS member_full_name
FROM student_surveys a JOIN faculty_members b ON a.faculty_member_id = b.id;
```

| id | survey_id | collection_date | feedback_category | member_id | member_employee_id | member_full_name |
|---|---|---|---|---|---|---|
| 1 | 21005921 | 2025-12-17T11:57:00 | Program | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | 726059 | 2022-05-01T18:14:00 | Teacher | 2 | Tasha Rodriguez | Account Name |
| 3 | 32814 | 2023-10-12T01:31:00 | Facilities | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-23T08:48:00 | Program | 4 | Peter Mcdowell | Norma Fisher |

The view `v_student_survey_instructional_session` joins `student_surveys` to `instructional_sessions` on `student_surveys.instructional_session_id = instructional_sessions.id`. It answers: "Which sessions received feedback, and what were the scores?" A row might show `survey_id = '32814'` with `feedback_category = 'Facilities'` and `satisfaction_score = 11` alongside `session_identifier = 'SES-2455'` and `status = 'completed'`, allowing a quality assurance team to correlate session status with feedback quality.

**View `v_student_survey_instructional_session`**

```sql
CREATE VIEW v_student_survey_instructional_session AS
SELECT a.id, a.survey_id, a.collection_date, a.feedback_category, b.id AS session_id, b.session_identifier AS session_session_identifier, b.start_date AS session_start_date
FROM student_surveys a JOIN instructional_sessions b ON a.instructional_session_id = b.id;
```

| id | survey_id | collection_date | feedback_category | session_id | session_session_identifier | session_start_date |
|---|---|---|---|---|---|---|
| 1 | 21005921 | 2025-12-17T11:57:00 | Program | 1 | SES-2443 | 2022-09-05T20:24:00 |
| 2 | 726059 | 2022-05-01T18:14:00 | Teacher | 2 | SES-2449 | 2023-02-16T03:41:00 |
| 3 | 32814 | 2023-10-12T01:31:00 | Facilities | 3 | SES-2455 | 2024-07-27T10:58:00 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-23T08:48:00 | Program | 4 | SES-2461 | 2025-12-11T17:15:00 |

The view `v_i20_form_student` joins `i20_forms` to `students`, presenting the I-20 form as the driving entity. It answers: "Which students are associated with each I-20 form?" A row might show an I-20 form identifier alongside `full_name = 'Norma Fisher'`, `visa_status = 'F1'`, and `enrollment_date = '2025-08-17'`, supporting immigration compliance audits by form.

**View `v_i20_form_student`**

```sql
CREATE VIEW v_i20_form_student AS
SELECT a.i20_form_id, a.form_id, a.issue_date, a.sevis_id, b.student_id AS student_student_id, b.full_name AS student_full_name, b.nationality AS student_nationality
FROM i20_forms a JOIN students b ON a.student_id = b.student_id;
```

| i20_form_id | form_id | issue_date | sevis_id | student_student_id | student_full_name | student_nationality |
|---|---|---|---|---|---|---|
| 1 | template_impcode_pagata_20det10 | 2023-02-01 | 1889789 | 1 | Theodore Mcgrath | composite-national-39 |
| 2 | 937744 | 2024-07-12 | 9246330 | 2 | Account Name | primary-national-40 |
| 3 | 1250195 | 2025-12-23 | 32824 | 3 | Saipan International Airport | adaptive-national-41 |
| 4 | 3355762 | 2022-05-07 | 3990177 | 4 | Norma Fisher | distributed-national-42 |

## Closing Synthesis

The schema models an educational institution as a network of entities — locations, classrooms, sessions, people, and documents — connected by foreign keys and junction tables that enforce referential integrity while preserving the flexibility to express many-to-many relationships. Each base table captures a single entity type with its intrinsic attributes; each junction table resolves a relationship that cannot be expressed as a simple column-level FK; and each view reassembles the normalised fragments into a denormalised fact that answers a specific operational question. The concrete rows — `ROO-2647` in `integrated-city-34`, `SES-2443` with status `scheduled`, `Theodore Mcgrath` at `Beginner` level with an `F1` visa — are not merely sample data; they are the instances that the joins traverse, the values that surface in the view results, and the evidence that validates the model against the domain it represents.