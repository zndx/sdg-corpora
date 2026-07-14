## Physical Infrastructure and Space Management

Educational institutions manage complex physical infrastructures where buildings, rooms, and instructional activities must be tracked with precision. The foundation of this management begins with the geographic and architectural records that define where learning occurs.

**Table `physical_locations`**

| id | street_address | city | state | postal_code | country | building_floors | total_area_sq_ft |
|---|---|---|---|---|---|---|---|
| 1 | composite-street-15 | integrated-city-34 | distributed-state-84 | 9125611 | compact-country-26 | 35 | 11.70 |
| 2 | primary-street-16 | seasonal-city-35 | baseline-state-85 | ChIJt4hBkzhu5kcRJJDUNqGUpso | composite-country-27 | 45 | 14.40 |
| 3 | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3001009030200 | primary-country-28 | 55 | 17.10 |
| 4 | distributed-street-18 | legacy-city-37 | extended-state-87 | 4060635 | adaptive-country-29 | 65 | 19.80 |

Each physical location entry anchors a building within a broader geographic context. A location record captures the street address, city, state, postal code, and country, alongside structural attributes such as the number of building floors and total area in square feet. For example, the location at composite-street-15 in integrated-city-34 spans 35 floors with a total area of 11.70 square feet, while the facility at primary-street-16 in seasonal-city-35 rises 45 floors across 14.40 square feet. These attributes enable administrators to assess capacity constraints, plan maintenance schedules, and allocate resources across a distributed campus network.

**Table `classrooms`**

| classroom_id | room_identifier | capacity | equipment_inventory | physical_location_id |
|---|---|---|---|---|
| 1 | ROO-2647 | 32 | integrated-equipmen-58 | 1 |
| 2 | ROO-2654 | 41 | seasonal-equipmen-59 | 2 |
| 3 | ROO-2661 | 50 | regional-equipmen-60 | 3 |
| 4 | ROO-2668 | 59 | legacy-equipmen-61 | 4 |

Within each building, individual classrooms are catalogued with a room identifier, seating capacity, equipment inventory, and a reference to their parent physical location. The classroom at ROO-2647 accommodates 32 occupants and carries the equipment inventory integrated-equipmen-58, residing within the first physical location. The classroom ROO-2668, by contrast, holds 59 students and is equipped with legacy-equipmen-61, situated in the fourth location. Classroom capacity directly influences scheduling decisions: larger rooms serve cohort-based instruction, while smaller rooms support specialized or intensive sessions.

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

The linkage between buildings and rooms is explicit in the locations_classrooms table, which records which classrooms belong to which physical locations. This join table ensures that every classroom can be traced back to its building, enabling queries that aggregate room counts per location or identify underutilized buildings.

## Instructional Delivery and Session Management

Instructional sessions represent the core operational activity of the institution — scheduled periods of teaching that connect faculty, students, and physical space.

**Table `instructional_sessions`**

| id | session_identifier | start_date | end_date | status | classroom_id | faculty_member_id |
|---|---|---|---|---|---|---|
| 1 | SES-2443 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | scheduled | 1 | 1 |
| 2 | SES-2449 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | running | 2 | 2 |
| 3 | SES-2455 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | 3 |
| 4 | SES-2461 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 4 | 4 |

Each instructional session carries a unique session identifier, a start and end date, a status indicating its current state, and references to the classroom and faculty member responsible. Session SES-2443, for instance, is scheduled to begin on 2022-09-05 and conclude on 2022-09-01, taking place in classroom 1 under faculty member 1. The status field distinguishes between four states: scheduled, running, completed, and cancelled. Session SES-2449 is currently running with a start date of 2023-02-16, while SES-2461 has been cancelled and was slated for 2025-12-11. The temporal range of sessions — spanning from 2022 through 2025 — supports long-term academic planning and historical reporting.

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

The classrooms_sessions table maps sessions to their assigned rooms, allowing the institution to detect scheduling conflicts and optimize room utilization. A single classroom may host multiple sessions across different time periods, and this join table captures those assignments explicitly.

## Faculty and Staff Records

Faculty members are the instructional workforce, and their records encode professional qualifications, certifications, and employment status.

**Table `faculty_members`**

| id | employee_id | full_name | native_language | qualification_level | certification_type | employment_status |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | compact-native-98 | Bachelor | TESOL | active |
| 2 | Tasha Rodriguez | Account Name | composite-native-99 | Master | TEFL | inactive |
| 3 | Theodore Mcgrath | Saipan International Airport | primary-native-100 | Doctorate | CELTA | on_leave |
| 4 | Peter Mcdowell | Norma Fisher | adaptive-native-101 | Bachelor | Other | active |

Each faculty member record includes an employee identifier, full name, native language, qualification level, certification type, and current employment status. The qualification levels range from Bachelor to Master to Doctorate, reflecting the academic hierarchy within the institution. Certification types such as TESOL, TEFL, and CELTA indicate specialized teaching credentials. Employment status distinguishes between active, inactive, and on_leave faculty. For example, faculty member 1, Norma Fisher, holds a Bachelor qualification with TESOL certification and is currently active, while faculty member 3, Theodore Mcgrath, holds a Doctorate with CELTA certification and is on leave.

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

The members_sessions table connects faculty members to the instructional sessions they lead. This relationship enables the institution to track teaching loads, identify faculty availability, and ensure that each session has an assigned instructor.

## Student Enrollment and Identification

Students form the learner population, and their records capture enrollment details, academic levels, and immigration documentation for international students.

**Table `students`**

| student_id | full_name | nationality | visa_status | enrollment_date | current_level | i20_form_id |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | composite-national-39 | F1 | 2022-05-11 | Beginner | 1 |
| 2 | Account Name | primary-national-40 | J1 | 2023-10-22 | Intermediate | 2 |
| 3 | Saipan International Airport | adaptive-national-41 | Other | 2024-03-06 | Advanced | 3 |
| 4 | Norma Fisher | distributed-national-42 | F1 | 2025-08-17 | Beginner | 4 |

Each student record includes a student identifier, full name, nationality, visa status, enrollment date, current academic level, and a reference to their I-20 form. Visa statuses include F1 and J1, the two most common categories for international students in the United States, as well as an Other category for non-standard cases. Academic levels span Beginner, Intermediate, and Advanced, providing a clear progression framework. Student 1, Theodore Mcgrath, is a Beginner-level learner with F1 visa status enrolled on 2022-05-11, while student 3, Saipan International Airport, is at the Advanced level with an Other visa status enrolled on 2024-03-06.

**Table `i20_forms`**

| i20_form_id | form_id | issue_date | sevis_id | program_start_date | program_end_date | funding_source | student_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | template_impcode_pagata_20det10 | 2023-02-01 | 1889789 | 2022-09-22 | 2022-09-03 | baseline-funding-73 | 1 | 2025-01-01 00:14:00 |
| 2 | 937744 | 2024-07-12 | 9246330 | 2023-02-06 | 2023-02-14 | pilot-funding-74 | 2 | 2025-02-06 03:14:00 |
| 3 | 1250195 | 2025-12-23 | 32824 | 2024-07-17 | 2024-07-25 | extended-funding-75 | 3 | 2025-03-11 06:14:00 |
| 4 | 3355762 | 2022-05-07 | 3990177 | 2025-12-01 | 2025-12-09 | integrated-funding-76 | 4 | 2025-04-16 09:14:00 |

The I-20 form is a critical document for F-1 visa holders, and the i20_forms table tracks these records. Each student's I-20 form is linked through the i20_form_id field in the students table, ensuring that immigration documentation is traceable to individual learners.

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

The students_sessions table records which students are enrolled in which instructional sessions, forming the enrollment roster for each class. This join table supports attendance tracking, cohort analysis, and session capacity management.

## Feedback and Quality Assessment

Student surveys provide structured feedback on instructional quality, program effectiveness, and facility conditions.

**Table `student_surveys`**

| id | survey_id | collection_date | feedback_category | satisfaction_score | comments | student_id | faculty_member_id | instructional_session_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 21005921 | 2025-12-17T11:57:00 | Program | 5 | primary-comments-52 | 1 | 1 | 1 |
| 2 | 726059 | 2022-05-01T18:14:00 | Teacher | 8 | adaptive-comments-53 | 2 | 2 | 2 |
| 3 | 32814 | 2023-10-12T01:31:00 | Facilities | 11 | distributed-comments-54 | 3 | 3 | 3 |
| 4 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-23T08:48:00 | Program | 14 | baseline-comments-55 | 4 | 4 | 4 |

Each survey record includes a survey identifier, collection date, feedback category, satisfaction score, free-text comments, and references to the student, faculty member, and instructional session involved. Feedback categories include Program, Teacher, and Facilities, enabling targeted quality improvement. Satisfaction scores vary across the dataset, with scores of 5, 8, 11, and 14 appearing in the sample. Survey 21005921, collected on 2025-12-17, falls under the Program category with a satisfaction score of 5 and comment primary-comments-52, submitted by student 1 for session 1 and faculty member 1. The multi-dimensional linkage — connecting a survey to a specific student, faculty member, and session — allows the institution to correlate feedback with instructional contexts.

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

The sessions_students table provides an alternative perspective on the student-session enrollment relationship, supporting queries that start from the session side and enumerate enrolled learners.

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

The students_surveys table records the relationship between students and their submitted surveys, enabling aggregation of feedback by student and analysis of individual participation patterns.

## Accreditations

**Table `accreditations`**

| id | accreditation_id | issuing_agency | start_date | end_date | status |
|---|---|---|---|---|---|
| 1 | 22386325 | Technos Japan | 2022-09-05 | 2022-09-01 | active |
| 2 | L150 | Sanniquellie Mahn | 2023-02-16 | 2023-02-12 | expired |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Greater Houston Community Foundation | 2024-07-27 | 2024-07-23 | pending |
| 4 | 1450655 | Lucas Industries | 2025-12-11 | 2025-12-07 | active |

Accreditation records document the institution's compliance with external quality standards. These records are essential for regulatory reporting, institutional credibility, and student eligibility for federal financial aid and visa programs.

## Analytical Views

The institution provides a suite of analytical views that join base tables to answer specific operational questions. Each view serves a distinct reporting purpose.

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

This view combines physical location data with classroom information to answer the question: which classrooms exist within each building, and what are their capacities and equipment profiles? A row in this view might show that classroom ROO-2647, with a capacity of 32 and equipment integrated-equipmen-58, is located at composite-street-15 in integrated-city-34. This view supports facility audits and space planning.

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

Reversing the perspective, this view answers: given a classroom, where is it physically located? It joins classrooms to their parent physical locations, producing rows that pair room identifiers like ROO-2654 with their building addresses. This is useful for wayfinding, maintenance dispatch, and emergency evacuation planning.

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

This view joins classrooms with their scheduled sessions, answering: which sessions are assigned to each classroom, and what are their temporal and status attributes? A representative row might show that classroom ROO-2647 hosts session SES-2443, which is in scheduled status with a start date of 2022-09-05. This view is essential for room scheduling conflict detection.

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

The inverse of the previous view, this one answers: for a given session, which classroom is it assigned to? It produces rows linking session identifiers like SES-2449 to classroom identifiers, supporting session-centric reporting and student orientation materials.

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

This view connects instructional sessions to their assigned faculty members, answering: which faculty member is teaching which session? A row might pair session SES-2443 with faculty member Norma Fisher. This view supports teaching load analysis and faculty availability tracking.

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

This view joins sessions with their enrolled students, answering: which students are enrolled in each session? A representative row might show that session SES-2443 includes student Theodore Mcgrath. This view underpins attendance reporting and cohort management.

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

This view aggregates sessions by faculty member, answering: what sessions is each faculty member teaching? A row might show that faculty member Norma Fisher is teaching session SES-2443. This view supports workload balancing and performance evaluation.

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

This view aggregates sessions by student, answering: which sessions is each student enrolled in? A row might show that student Theodore Mcgrath is enrolled in session SES-2443. This view supports academic progress tracking and schedule management.

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

This view joins students with their submitted surveys, answering: which surveys has each student submitted, and what are the feedback details? A row might show that student Theodore Mcgrath submitted survey 21005921 in the Program category with a satisfaction score of 5. This view supports individual student feedback history analysis.

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

This view links students to their I-20 forms, answering: which international students have I-20 documentation on file? A row might show that student Theodore Mcgrath has I-20 form 1 associated with their record. This view is critical for immigration compliance monitoring.

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

This view provides a student-centric perspective on surveys, answering: for each survey submission, who is the student and what are their enrollment details? A row might pair survey 21005921 with student Theodore Mcgrath, an F1 visa holder at the Beginner level. This view supports demographic analysis of survey respondents.

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

This view connects survey submissions to the faculty members being evaluated, answering: which faculty members are receiving feedback, and from which sessions? A row might show that faculty member Norma Fisher received survey 21005921 for session SES-2443. This view supports faculty performance review and professional development planning.

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

This view links surveys to their associated instructional sessions, answering: which sessions are receiving feedback, and what are the session-level details? A row might show that session SES-2443 received survey 21005921 with a satisfaction score of 5. This view supports session-level quality assessment.

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

The inverse of the student I-20 view, this one answers: for each I-20 form, which student is it associated with? A row might show that I-20 form 1 belongs to student Theodore Mcgrath. This view supports immigration document audits and compliance verification.

## Closing Synthesis

The institutional data model captures the full lifecycle of educational operations — from the physical buildings that house instruction, through the scheduling of sessions and assignment of faculty and students, to the feedback mechanisms that drive continuous improvement. The base tables store discrete records of locations, classrooms, sessions, people, and documents, while the join tables and analytical views synthesize these records into actionable intelligence. Together, they form a coherent operational framework that supports space management, instructional delivery, student services, and quality assurance across a distributed educational enterprise.