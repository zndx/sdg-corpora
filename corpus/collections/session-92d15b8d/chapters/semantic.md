The A.R.R.A.L.D. training ecosystem orchestrates multi-day academic programs that bring together faculty members and resident physicians around structured learning sessions. Each program unfolds across a sequence of program days, and each day hosts one or more sessions that are tagged with academic topics and staffed by faculty members. Residents enroll in programs and attend sessions, producing a richly connected graph of people, places, and subjects. The relational schema captures this graph through a set of six core entity tables, nine junction tables that materialize the many-to-many relationships, and twelve detail views that reassemble the normalized facts into human-readable reports.

## Core Entity Tables

The backbone of the model consists of six base tables, each representing a distinct entity type with a stable surrogate key.

**Table `sessions`**

| session_id | session_identifier | start_time | end_time | title | status | program_day_id |
|---|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | Compact Initiative | scheduled | 1 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | Legacy Model | completed | 2 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | Regional Cluster A | cancelled | 3 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | Seasonal Review | scheduled | 4 |

The `sessions` table records individual learning events. Each row carries a `session_id` surrogate key, a human-readable `session_identifier` such as `SES-2443`, temporal bounds (`start_time` and `end_time`), a descriptive `title` like *Compact Initiative*, and a `status` column that enumerates `scheduled`, `completed`, or `cancelled` states. The foreign key `program_day_id` anchors every session to exactly one program day, enforcing a many-to-one cardinality from sessions up to the day they belong to.

**Table `program_days`**

| program_day_id | date | day_number | location | a_r_r_a_l_d_program_id |
|---|---|---|---|---|
| 1 | 2023-02-05 | 15 | extended-location-99 | 1 |
| 2 | 2024-07-16 | 21 | integrated-location-100 | 2 |
| 3 | 2025-12-27 | 27 | seasonal-location-101 | 3 |
| 4 | 2022-05-11 | 33 | regional-location-102 | 4 |

Program days are the temporal scaffolding of a program. The `program_days` table stores a `program_day_id`, the calendar `date`, an ordinal `day_number` (for example, day 15 or day 33), a `location` string such as `extended-location-99`, and a foreign key `a_r_r_a_l_d_program_id` that links the day to its parent program. A single program day can host multiple sessions, but each session belongs to one and only one day.

**Table `faculty_members`**

| faculty_member_id | faculty_id | full_name | credential | affiliation |
|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | regional-credenti-30 | baseline-affiliat-55 |
| 101 | 605968 | Account Name | legacy-credenti-31 | pilot-affiliat-56 |
| 102 | 10449508 | Saipan International Airport | compact-credenti-32 | extended-affiliat-57 |
| 103 | 2002007020230 | Norma Fisher | composite-credenti-33 | integrated-affiliat-58 |

Faculty members are the instructional staff. The `faculty_members` table holds a `faculty_member_id`, a UUID-style `faculty_id` (e.g., `98a02b9c-8fcd-11eb-924d-9cd76263cbd0`), the `full_name` (such as *Theodore Mcgrath* or *Norma Fisher*), a `credential` code like `regional-credenti-30`, and an `affiliation` string. Faculty members participate in sessions and are associated with academic topics, but neither relationship is stored directly in this table.

**Table `academic_topics`**

| academic_topic_id | topic_id | topic_name | category |
|---|---|---|---|
| 100 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | leadership |
| 101 | 8387534 | Seasonal Cluster D | communication |
| 102 | 2933463 | Integrated Review | quality_improvement |
| 103 | 2839516 | Extended Initiative | professional_development |

Academic topics define the subject matter of sessions. The `academic_topics` table contains an `academic_topic_id`, a `topic_id` string (for instance, `lu_tax_code_template_b_VB-IC-Tab`), a `topic_name` such as *Regional Model*, and a `category` that classifies the topic into `leadership`, `communication`, `quality_improvement`, or `professional_development`. Topics are linked to sessions through a junction table.

**Table `a_r_r_a_l_d_programs`**

| id | program_id | program_name | start_date | end_date | organizing_body |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2022-09-05 | 2022-09-01 | seasonal-organizi-17 |
| 2 | 2986219 | Pilot Initiative A | 2023-02-16 | 2023-02-12 | regional-organizi-18 |
| 3 | 1186079 | Baseline Model | 2024-07-27 | 2024-07-23 | legacy-organizi-19 |
| 4 | 1562855 | Distributed Cluster | 2025-12-11 | 2025-12-07 | compact-organizi-20 |

The `a_r_r_a_l_d_programs` table represents the top-level training programs. Its columns are `id`, a `program_id` (e.g., `103176`), a `program_name` like *Extended Review*, `start_date` and `end_date` defining the program window, and an `organizing_body` string such as `seasonal-organizi-17`. Programs contain multiple program days and enroll multiple residents.

**Table `residents`**

| id | resident_id | full_name | institution | year_of_training | a_r_r_a_l_d_program_id |
|---|---|---|---|---|---|
| 1 | 884366 | Theodore Mcgrath | baseline-institut-31 | 24 | 1 |
| 2 | 4011 | Account Name | pilot-institut-32 | 33 | 2 |
| 3 | 10445643 | Saipan International Airport | extended-institut-33 | 42 | 3 |
| 4 | 89445 | Norma Fisher | integrated-institut-34 | 51 | 4 |

Residents are the trainees. The `residents` table stores an `id`, a `resident_id` (e.g., `884366`), the `full_name`, an `institution` string like `baseline-institut-31`, a `year_of_training` integer (24, 33, 42, or 51 in the sample data), and an `a_r_r_a_l_d_program_id` foreign key that enrolls the resident in a specific program.

## Junction Tables and Many-to-Many Relationships

The six entity tables above are connected by nine junction tables that resolve many-to-many relationships and some one-to-many associations. Each junction table is a pair of foreign keys that materializes a relationship as a row.

**Table `sessions_members`**

| session_id | faculty_member_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `sessions_members` table links sessions to faculty members. A row in this table asserts that a particular faculty member (identified by `member_id`) participated in a particular session (identified by `session_id`). This is the canonical many-to-many bridge between the `sessions` and `faculty_members` entities.

**Table `sessions_topics`**

| session_id | academic_topic_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `sessions_topics` table associates sessions with academic topics. Each row pairs a `session_id` with a `topic_id`, allowing a session to cover multiple topics and a topic to appear across many sessions.

**Table `days_sessions`**

| program_day_id | session_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `days_sessions` table records which sessions occur on which program days. Although `sessions` already carries a `program_day_id` foreign key, this junction table provides an explicit, auditable mapping that can support additional metadata or ordering constraints without altering the core entity.

**Table `members_sessions`**

| faculty_member_id | session_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `members_sessions` table is a second bridge between faculty members and sessions, mirroring `sessions_members` but from the member's perspective. It stores `member_id` and `session_id` pairs, enabling queries that start from a faculty member and enumerate all their assigned sessions.

**Table `members_topics`**

| faculty_member_id | academic_topic_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `members_topics` table connects faculty members to academic topics, capturing the subject-matter expertise or teaching assignments of each faculty member. A row indicates that a given faculty member is associated with a particular topic.

**Table `topics_sessions`**

| academic_topic_id | session_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `topics_sessions` table is a third bridge between academic topics and sessions, complementing `sessions_topics`. It stores `topic_id` and `session_id` pairs and supports queries that begin with a topic and list all sessions that cover it.

**Table `programs_days`**

| a_r_r_a_l_d_program_id | program_day_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `programs_days` table maps programs to their constituent program days. While `program_days` already references `a_r_r_a_l_d_program_id`, this junction table provides an explicit, denormalized-friendly mapping that can carry additional scheduling metadata.

**Table `programs_residents`**

| a_r_r_a_l_d_program_id | resident_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `programs_residents` table links programs to their enrolled residents. Like the `days_sessions` and `programs_days` tables, it mirrors the foreign key present in the `residents` table (`a_r_r_a_l_d_program_id`) while offering a dedicated join surface for reporting.

**Table `residents_sessions`**

| resident_id | session_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `residents_sessions` table records which residents attended which sessions. This is the many-to-many bridge between the `residents` and `sessions` entities, capturing actual attendance or enrollment at the session level rather than just at the program level.

## Detail Views

The twelve views reassemble the normalized tables into flat, report-ready result sets. Each view performs a specific join that answers a concrete domain question.

**View `v_session_faculty_member_detail`**

```sql
CREATE VIEW v_session_faculty_member_detail AS
SELECT a.session_id, a.session_identifier, a.start_time, b.faculty_member_id AS member_faculty_member_id, b.faculty_id AS member_faculty_id, b.full_name AS member_full_name
FROM sessions a
  JOIN sessions_members j ON j.session_id = a.session_id
  JOIN faculty_members b ON b.faculty_member_id = j.faculty_member_id;
```

| session_id | session_identifier | start_time | member_faculty_member_id | member_faculty_id | member_full_name |
|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 100 | SES-2443 | 2024-03-27T14:42:00 | 101 | 605968 | Account Name |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 101 | 605968 | Account Name |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 102 | 10449508 | Saipan International Airport |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 102 | 10449508 | Saipan International Airport |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 103 | 2002007020230 | Norma Fisher |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 103 | 2002007020230 | Norma Fisher |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |

This view joins `sessions` with `faculty_members` through the `sessions_members` junction table, producing one row per session-faculty pairing. It answers the question "which faculty member taught which session?" For example, the row for session `SES-2443` (*Compact Initiative*) would be paired with faculty member *Theodore Mcgrath* (ID `98a02b9c-8fcd-11eb-924d-9cd76263cbd0`), revealing the instructional assignment for that session.

**View `v_session_program_day`**

```sql
CREATE VIEW v_session_program_day AS
SELECT a.session_id, a.session_identifier, a.start_time, a.end_time, b.program_day_id AS day_program_day_id, b.date AS day_date, b.day_number AS day_day_number
FROM sessions a JOIN program_days b ON a.program_day_id = b.program_day_id;
```

| session_id | session_identifier | start_time | end_time | day_program_day_id | day_date | day_day_number |
|---|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | 2023-02-05 | 15 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | 2024-07-16 | 21 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | 2025-12-27 | 27 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | 2022-05-11 | 33 |

By joining `sessions` to `program_days` on `program_day_id`, this view attaches the calendar date, day number, and location to each session. It answers "on which day and at what location did this session occur?" The session *Regional Cluster A* (`SES-2455`) appears on program day 3, which falls on `2025-12-27` at `seasonal-location-101`.

**View `v_session_academic_topic_detail`**

```sql
CREATE VIEW v_session_academic_topic_detail AS
SELECT a.session_id, a.session_identifier, a.start_time, b.academic_topic_id AS topic_academic_topic_id, b.topic_id AS topic_topic_id, b.topic_name AS topic_topic_name
FROM sessions a
  JOIN sessions_topics j ON j.session_id = a.session_id
  JOIN academic_topics b ON b.academic_topic_id = j.academic_topic_id;
```

| session_id | session_identifier | start_time | topic_academic_topic_id | topic_topic_id | topic_topic_name |
|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 100 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |
| 100 | SES-2443 | 2024-03-27T14:42:00 | 101 | 8387534 | Seasonal Cluster D |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 101 | 8387534 | Seasonal Cluster D |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 102 | 2933463 | Integrated Review |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 102 | 2933463 | Integrated Review |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 103 | 2839516 | Extended Initiative |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 103 | 2839516 | Extended Initiative |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 100 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |

This view joins `sessions` to `academic_topics` via `sessions_topics`, producing one row per session-topic pairing. It answers "what academic topics did this session cover?" The session *Legacy Model* (`SES-2449`) might be paired with the topic *Seasonal Cluster D* in the `communication` category, showing the subject-matter alignment for that completed session.

**View `v_program_day_session_detail`**

```sql
CREATE VIEW v_program_day_session_detail AS
SELECT a.program_day_id, a.date, a.day_number, b.session_id AS session_session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM program_days a
  JOIN days_sessions j ON j.program_day_id = a.program_day_id
  JOIN sessions b ON b.session_id = j.session_id;
```

| program_day_id | date | day_number | session_session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|
| 1 | 2023-02-05 | 15 | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 1 | 2023-02-05 | 15 | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | 2024-07-16 | 21 | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | 2024-07-16 | 21 | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | 2025-12-27 | 27 | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | 2025-12-27 | 27 | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | 2022-05-11 | 33 | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | 2022-05-11 | 33 | 100 | SES-2443 | 2024-03-27T14:42:00 |

Joining `program_days` to `sessions` through `days_sessions`, this view lists all sessions scheduled for a given program day. It answers "what sessions are on this day?" For program day 4 (date `2022-05-11`, location `regional-location-102`), the view would surface session `SES-2461` (*Seasonal Review*), giving a day-level agenda.

**View `v_program_day_a_r_r_a_l_d_program`**

```sql
CREATE VIEW v_program_day_a_r_r_a_l_d_program AS
SELECT a.program_day_id, a.date, a.day_number, a.location, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM program_days a JOIN a_r_r_a_l_d_programs b ON a.a_r_r_a_l_d_program_id = b.id;
```

| program_day_id | date | day_number | location | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 2023-02-05 | 15 | extended-location-99 | 1 | 103176 | Extended Review |
| 2 | 2024-07-16 | 21 | integrated-location-100 | 2 | 2986219 | Pilot Initiative A |
| 3 | 2025-12-27 | 27 | seasonal-location-101 | 3 | 1186079 | Baseline Model |
| 4 | 2022-05-11 | 33 | regional-location-102 | 4 | 1562855 | Distributed Cluster |

This view joins `program_days` to `a_r_r_a_l_d_programs` via `programs_days`, attaching the program name and organizing body to each day. It answers "which program does this day belong to?" Program day 2 (date `2024-07-16`, location `integrated-location-100`) maps to the program *Pilot Initiative A* (ID `2986219`), organized by `regional-organizi-18`.

**View `v_faculty_member_session_detail`**

```sql
CREATE VIEW v_faculty_member_session_detail AS
SELECT a.faculty_member_id, a.faculty_id, a.full_name, b.session_id AS session_session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM faculty_members a
  JOIN members_sessions j ON j.faculty_member_id = a.faculty_member_id
  JOIN sessions b ON b.session_id = j.session_id;
```

| faculty_member_id | faculty_id | full_name | session_session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 101 | 605968 | Account Name | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 101 | 605968 | Account Name | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 102 | 10449508 | Saipan International Airport | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 102 | 10449508 | Saipan International Airport | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 103 | 2002007020230 | Norma Fisher | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 103 | 2002007020230 | Norma Fisher | 100 | SES-2443 | 2024-03-27T14:42:00 |

By joining `faculty_members` to `sessions` through `members_sessions`, this view enumerates all sessions assigned to a given faculty member. It answers "which sessions is this faculty member teaching?" Faculty member *Saipan International Airport* (ID `10449508`, credential `compact-credenti-32`) would appear with every session they are assigned to, providing a faculty workload summary.

**View `v_faculty_member_academic_topic_detail`**

```sql
CREATE VIEW v_faculty_member_academic_topic_detail AS
SELECT a.faculty_member_id, a.faculty_id, a.full_name, b.academic_topic_id AS topic_academic_topic_id, b.topic_id AS topic_topic_id, b.topic_name AS topic_topic_name
FROM faculty_members a
  JOIN members_topics j ON j.faculty_member_id = a.faculty_member_id
  JOIN academic_topics b ON b.academic_topic_id = j.academic_topic_id;
```

| faculty_member_id | faculty_id | full_name | topic_academic_topic_id | topic_topic_id | topic_topic_name |
|---|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 100 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 101 | 8387534 | Seasonal Cluster D |
| 101 | 605968 | Account Name | 101 | 8387534 | Seasonal Cluster D |
| 101 | 605968 | Account Name | 102 | 2933463 | Integrated Review |
| 102 | 10449508 | Saipan International Airport | 102 | 2933463 | Integrated Review |
| 102 | 10449508 | Saipan International Airport | 103 | 2839516 | Extended Initiative |
| 103 | 2002007020230 | Norma Fisher | 103 | 2839516 | Extended Initiative |
| 103 | 2002007020230 | Norma Fisher | 100 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |

This view joins `faculty_members` to `academic_topics` via `members_topics`, producing one row per faculty-topic pairing. It answers "what topics is this faculty member associated with?" Faculty member *Norma Fisher* (ID `2002007020230`, credential `composite-credenti-33`) might be linked to the topic *Extended Initiative* in the `professional_development` category, revealing their area of expertise.

**View `v_academic_topic_session_detail`**

```sql
CREATE VIEW v_academic_topic_session_detail AS
SELECT a.academic_topic_id, a.topic_id, a.topic_name, b.session_id AS session_session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM academic_topics a
  JOIN topics_sessions j ON j.academic_topic_id = a.academic_topic_id
  JOIN sessions b ON b.session_id = j.session_id;
```

| academic_topic_id | topic_id | topic_name | session_session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|
| 100 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 100 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 101 | 8387534 | Seasonal Cluster D | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 101 | 8387534 | Seasonal Cluster D | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 102 | 2933463 | Integrated Review | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 102 | 2933463 | Integrated Review | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 103 | 2839516 | Extended Initiative | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 103 | 2839516 | Extended Initiative | 100 | SES-2443 | 2024-03-27T14:42:00 |

Joining `academic_topics` to `sessions` through `topics_sessions`, this view lists all sessions that cover a given topic. It answers "which sessions teach this topic?" The topic *Integrated Review* (category `quality_improvement`) would be paired with every session that includes it, enabling a topic-centric curriculum map.

**View `v_a_r_r_a_l_d_program_program_day_detail`**

```sql
CREATE VIEW v_a_r_r_a_l_d_program_program_day_detail AS
SELECT a.id, a.program_id, a.program_name, b.program_day_id AS day_program_day_id, b.date AS day_date, b.day_number AS day_day_number
FROM a_r_r_a_l_d_programs a
  JOIN programs_days j ON j.a_r_r_a_l_d_program_id = a.id
  JOIN program_days b ON b.program_day_id = j.program_day_id;
```

| id | program_id | program_name | day_program_day_id | day_date | day_day_number |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 1 | 2023-02-05 | 15 |
| 1 | 103176 | Extended Review | 2 | 2024-07-16 | 21 |
| 2 | 2986219 | Pilot Initiative A | 2 | 2024-07-16 | 21 |
| 2 | 2986219 | Pilot Initiative A | 3 | 2025-12-27 | 27 |
| 3 | 1186079 | Baseline Model | 3 | 2025-12-27 | 27 |
| 3 | 1186079 | Baseline Model | 4 | 2022-05-11 | 33 |
| 4 | 1562855 | Distributed Cluster | 4 | 2022-05-11 | 33 |
| 4 | 1562855 | Distributed Cluster | 1 | 2023-02-05 | 15 |

This view joins `a_r_r_a_l_d_programs` to `program_days` via `programs_days`, producing one row per program-day pairing. It answers "which days belong to this program?" The program *Extended Review* (ID `103176`, organized by `seasonal-organizi-17`) would be listed alongside all its program days, giving a program-level schedule.

**View `v_a_r_r_a_l_d_program_resident_detail`**

```sql
CREATE VIEW v_a_r_r_a_l_d_program_resident_detail AS
SELECT a.id, a.program_id, a.program_name, b.id AS resident_id, b.resident_id AS resident_resident_id, b.full_name AS resident_full_name
FROM a_r_r_a_l_d_programs a
  JOIN programs_residents j ON j.a_r_r_a_l_d_program_id = a.id
  JOIN residents b ON b.id = j.resident_id;
```

| id | program_id | program_name | resident_id | resident_resident_id | resident_full_name |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 1 | 884366 | Theodore Mcgrath |
| 1 | 103176 | Extended Review | 2 | 4011 | Account Name |
| 2 | 2986219 | Pilot Initiative A | 2 | 4011 | Account Name |
| 2 | 2986219 | Pilot Initiative A | 3 | 10445643 | Saipan International Airport |
| 3 | 1186079 | Baseline Model | 3 | 10445643 | Saipan International Airport |
| 3 | 1186079 | Baseline Model | 4 | 89445 | Norma Fisher |
| 4 | 1562855 | Distributed Cluster | 4 | 89445 | Norma Fisher |
| 4 | 1562855 | Distributed Cluster | 1 | 884366 | Theodore Mcgrath |

By joining `a_r_r_a_l_d_programs` to `residents` through `programs_residents`, this view enumerates all residents enrolled in a given program. It answers "which residents are in this program?" The program *Baseline Model* (ID `1186079`) would be paired with resident *Saipan International Airport* (ID `10445643`, institution `extended-institut-33`, year of training 42), showing the enrollment roster.

**View `v_resident_a_r_r_a_l_d_program`**

```sql
CREATE VIEW v_resident_a_r_r_a_l_d_program AS
SELECT a.id, a.resident_id, a.full_name, a.institution, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM residents a JOIN a_r_r_a_l_d_programs b ON a.a_r_r_a_l_d_program_id = b.id;
```

| id | resident_id | full_name | institution | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 884366 | Theodore Mcgrath | baseline-institut-31 | 1 | 103176 | Extended Review |
| 2 | 4011 | Account Name | pilot-institut-32 | 2 | 2986219 | Pilot Initiative A |
| 3 | 10445643 | Saipan International Airport | extended-institut-33 | 3 | 1186079 | Baseline Model |
| 4 | 89445 | Norma Fisher | integrated-institut-34 | 4 | 1562855 | Distributed Cluster |

This view joins `residents` to `a_r_r_a_l_d_programs` via `programs_residents`, attaching the program name and organizing body to each resident. It answers "which program is this resident enrolled in?" Resident *Theodore Mcgrath* (ID `884366`, institution `baseline-institut-31`, year of training 24) is enrolled in the program *Extended Review* (ID `103176`), organized by `seasonal-organizi-17`.

**View `v_resident_session_detail`**

```sql
CREATE VIEW v_resident_session_detail AS
SELECT a.id, a.resident_id, a.full_name, b.session_id AS session_session_id, b.session_identifier AS session_session_identifier, b.start_time AS session_start_time
FROM residents a
  JOIN residents_sessions j ON j.resident_id = a.id
  JOIN sessions b ON b.session_id = j.session_id;
```

| id | resident_id | full_name | session_session_id | session_session_identifier | session_start_time |
|---|---|---|---|---|---|
| 1 | 884366 | Theodore Mcgrath | 100 | SES-2443 | 2024-03-27T14:42:00 |
| 1 | 884366 | Theodore Mcgrath | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | 4011 | Account Name | 101 | SES-2449 | 2025-08-11T21:59:00 |
| 2 | 4011 | Account Name | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | 10445643 | Saipan International Airport | 102 | SES-2455 | 2022-01-22T04:16:00 |
| 3 | 10445643 | Saipan International Airport | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | 89445 | Norma Fisher | 103 | SES-2461 | 2023-06-06T11:33:00 |
| 4 | 89445 | Norma Fisher | 100 | SES-2443 | 2024-03-27T14:42:00 |

Joining `residents` to `sessions` through `residents_sessions`, this view lists all sessions attended by a given resident. It answers "which sessions did this resident attend?" Resident *Norma Fisher* (ID `89445`, institution `integrated-institut-34`, year of training 51) would appear with every session they attended, providing a personal learning transcript.

## Synthesis

The A.R.R.A.L.D. schema follows a clean entity-relationship pattern: six core tables capture the principal entities, nine junction tables resolve the many-to-many relationships that naturally arise when sessions, faculty, topics, and residents intersect, and twelve views reassemble the normalized data into flat, question-specific reports. The foreign keys — `sessions.program_day_id`, `program_days.a_r_r_a_l_d_program_id`, `residents.a_r_r_a_l_d_program_id` — form the backbone of the hierarchy, while the junction tables (`sessions_members`, `sessions_topics`, `members_sessions`, `members_topics`, `topics_sessions`, `days_sessions`, `programs_days`, `programs_residents`, `residents_sessions`) provide the cross-cutting connections that make the graph queryable. Each view is a single, deterministic join that reconstructs a domain fact from these normalized pieces, turning the relational model back into the narrative of who taught what, to whom, when, and where.