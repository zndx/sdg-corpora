# Operational Architecture of the ARRALD Training Program

The ARRALD (Advanced Research and Resident Learning and Development) program operates as a multi-day, multi-session academic initiative designed to advance the professional growth of trainees across diverse medical institutions. Each program unfolds across discrete program days, where structured sessions deliver targeted academic content under the guidance of credentialed faculty members. The operational backbone of this enterprise rests on a disciplined separation of concerns: programs define the overarching scope and timeline, program days anchor activities to specific dates and locations, sessions constitute the individual instructional events, and the associative tables track which faculty, residents, and academic topics participate in which sessions. Understanding how these entities interlock is essential for program administrators, faculty coordinators, and institutional stakeholders who must plan, execute, and evaluate each cycle of training.

## Foundational Entities

At the highest level, an **ARRALD program** establishes the temporal and organizational boundaries of a training cycle. The `a_r_r_a_l_d_programs` table records each program's identifier, name, start and end dates, and the organizing body responsible for its execution. For instance, program ID 1, titled "Extended Review," spans from 2022-09-05 to 2022-09-01 and is organized under the body labeled seasonal-organizi-17. Program ID 2, "Pilot Initiative A," runs from 2023-02-16 to 2023-02-12 under regional-organizi-18. Program ID 3, "Baseline Model," covers 2024-07-27 through 2024-07-23 with legacy-organizi-19, while program ID 4, "Distributed Cluster," extends from 2025-12-11 to 2025-12-07 under compact-organizi-20. These date ranges, some of which appear to run backward, reflect the raw scheduling data as entered and are subject to validation during operational review.

**Table `a_r_r_a_l_d_programs`**

| id | program_id | program_name | start_date | end_date | organizing_body |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2022-09-05 | 2022-09-01 | seasonal-organizi-17 |
| 2 | 2986219 | Pilot Initiative A | 2023-02-16 | 2023-02-12 | regional-organizi-18 |
| 3 | 1186079 | Baseline Model | 2024-07-27 | 2024-07-23 | legacy-organizi-19 |
| 4 | 1562855 | Distributed Cluster | 2025-12-11 | 2025-12-07 | compact-organizi-20 |

Within each program, training activities are distributed across **program days**. The `program_days` table captures the date, sequential day number, physical or virtual location, and the parent program to which each day belongs. Program day 1 falls on 2023-02-05, is the 15th day of its program, takes place at extended-location-99, and belongs to program ID 1. Program day 2 occurs on 2024-07-16 (day 21), is held at integrated-location-100, and is associated with program ID 2. Program day 3 is scheduled for 2025-12-27 (day 27) at seasonal-location-101 under program ID 3, and program day 4 lands on 2022-05-11 (day 33) at regional-location-102 under program ID 4. The `programs_days` join table explicitly links programs to their constituent days, enabling flexible scheduling where a single program may span many days or a day may serve multiple programs.

**Table `program_days`**

| program_day_id | date | day_number | location | a_r_r_a_l_d_program_id |
|---|---|---|---|---|
| 1 | 2023-02-05 | 15 | extended-location-99 | 1 |
| 2 | 2024-07-16 | 21 | integrated-location-100 | 2 |
| 3 | 2025-12-27 | 27 | seasonal-location-101 | 3 |
| 4 | 2022-05-11 | 33 | regional-location-102 | 4 |

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

Sessions are the primary instructional units within a program day. The `sessions` table records each session's unique identifier, a human-readable session identifier, start and end times, a descriptive title, and a status indicating whether the session is scheduled, completed, or cancelled. Session 100, identified as SES-2443 and titled "Compact Initiative," is scheduled to begin at 2024-03-27T14:42:00 and end at 2023-02-26T13:27:00, and is assigned to program day 1. Session 101 (SES-2449, "Legacy Model") is marked completed, with a start of 2025-08-11T21:59:00 and an end of 2024-07-10T20:44:00, linked to program day 2. Session 102 (SES-2455, "Regional Cluster A") carries a cancelled status, running from 2022-01-22T04:16:00 to 2025-12-21T03:01:00 on program day 3. Session 103 (SES-2461, "Seasonal Review") is scheduled for 2023-06-06T11:33:00 through 2022-05-05T10:18:00 on program day 4. The `days_sessions` table formalizes the relationship between program days and their sessions, while `sessions_members` and `residents_sessions` track which individuals participate in which sessions.

**Table `sessions`**

| session_id | session_identifier | start_time | end_time | title | status | program_day_id |
|---|---|---|---|---|---|---|
| 100 | SES-2443 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | Compact Initiative | scheduled | 1 |
| 101 | SES-2449 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | Legacy Model | completed | 2 |
| 102 | SES-2455 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | Regional Cluster A | cancelled | 3 |
| 103 | SES-2461 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | Seasonal Review | scheduled | 4 |

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

## Faculty and Academic Content

Faculty members serve as the instructional core of each session. The `faculty_members` table stores each faculty member's internal ID, a UUID-style faculty identifier, full name, credential designation, and institutional affiliation. Faculty member 100 is Theodore Mcgrath, holding regional-credenti-30 and affiliated with baseline-affiliat-55. Faculty member 101 is listed as Account Name with legacy-credenti-31 at pilot-affiliat-56. Faculty member 102, Saipan International Airport, carries compact-credenti-32 and is associated with extended-affiliat-57. Faculty member 103, Norma Fisher, holds composite-credenti-33 and is linked to integrated-affiliat-58. The `members_sessions` and `members_topics` tables record which faculty members lead which sessions and which academic topics they are associated with, respectively.

**Table `faculty_members`**

| faculty_member_id | faculty_id | full_name | credential | affiliation |
|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | regional-credenti-30 | baseline-affiliat-55 |
| 101 | 605968 | Account Name | legacy-credenti-31 | pilot-affiliat-56 |
| 102 | 10449508 | Saipan International Airport | compact-credenti-32 | extended-affiliat-57 |
| 103 | 2002007020230 | Norma Fisher | composite-credenti-33 | integrated-affiliat-58 |

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

Academic topics define the subject matter delivered during sessions. The `academic_topics` table contains the topic's internal ID, a topic identifier, the topic name, and a category classification. Topic 100, identified as lu_tax_code_template_b_VB-IC-Tab, is named "Regional Model" and falls under the leadership category. Topic 101, with identifier 8387534, is "Seasonal Cluster D" in the communication category. Topic 102, 2933463, is "Integrated Review" classified as quality_improvement. Topic 103, 2839516, is "Extended Initiative" in the professional_development category. The `sessions_topics` and `topics_sessions` tables capture the bidirectional relationships between sessions and the academic topics they cover.

**Table `academic_topics`**

| academic_topic_id | topic_id | topic_name | category |
|---|---|---|---|
| 100 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | leadership |
| 101 | 8387534 | Seasonal Cluster D | communication |
| 102 | 2933463 | Integrated Review | quality_improvement |
| 103 | 2839516 | Extended Initiative | professional_development |

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

## Resident Participation

Residents are the trainees who participate in the program. The `residents` table records each resident's internal ID, a numeric resident identifier, full name, institution, year of training, and the ARRALD program to which they are assigned. Resident 1, Theodore Mcgrath (resident ID 884366), is at baseline-institut-31 in year 24 of training and is enrolled in program ID 1. Resident 2, Account Name (resident ID 4011), is at pilot-institut-32 in year 33 and belongs to program ID 2. Resident 3, Saipan International Airport (resident ID 10445643), is at extended-institut-33 in year 42 under program ID 3. Resident 4, Norma Fisher (resident ID 89445), is at integrated-institut-34 in year 51 and is assigned to program ID 4. The `programs_residents` table explicitly links residents to their programs, and `residents_sessions` tracks which sessions each resident attends.

**Table `residents`**

| id | resident_id | full_name | institution | year_of_training | a_r_r_a_l_d_program_id |
|---|---|---|---|---|---|
| 1 | 884366 | Theodore Mcgrath | baseline-institut-31 | 24 | 1 |
| 2 | 4011 | Account Name | pilot-institut-32 | 33 | 2 |
| 3 | 10445643 | Saipan International Airport | extended-institut-33 | 42 | 3 |
| 4 | 89445 | Norma Fisher | integrated-institut-34 | 51 | 4 |

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

## Interrogating the Program Through Views

The relational structure of the ARRALD program becomes most actionable through its derived views, which join the base tables into coherent, query-ready records that answer specific operational questions.

The view `v_session_faculty_member_detail` answers the question of which faculty member is assigned to which session, combining session metadata with faculty credentials and affiliations. A row from this view might show session SES-2443 ("Compact Initiative") led by Theodore Mcgrath of baseline-affiliat-55, providing program coordinators with a clear roster of instructional assignments.

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

The view `v_session_program_day` joins sessions to their parent program days, revealing the temporal and locational context of each instructional event. For example, a row could display session SES-2449 ("Legacy Model") occurring on program day 2, which took place on 2024-07-16 at integrated-location-100 under program ID 2. This view is essential for scheduling audits and location-based resource allocation.

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

The view `v_session_academic_topic_detail` connects sessions to the academic topics they cover, pairing session titles with topic names and categories. A representative row might show session SES-2455 ("Regional Cluster A") covering the topic "Integrated Review" in the quality_improvement category, enabling curriculum analysts to verify that session content aligns with intended learning objectives.

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

The view `v_program_day_session_detail` inverts the perspective, presenting all sessions scheduled for a given program day alongside the day's date and location. This view supports daily operational planning by consolidating the full agenda for any single program day into a single record set.

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

The view `v_program_day_a_r_r_a_l_d_program` links program days back to their parent ARRALD programs, providing a clear lineage from individual days to the overarching program. A row might show program day 3 (dated 2025-12-27 at seasonal-location-101) belonging to the "Baseline Model" program (program ID 3), which is useful for program-level reporting and budget attribution.

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

The view `v_faculty_member_session_detail` aggregates all sessions led by a given faculty member, presenting each session's identifier, title, status, and the program day on which it occurs. This view supports faculty workload analysis and credentialing verification.

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

The view `v_faculty_member_academic_topic_detail` maps faculty members to the academic topics they are associated with, combining faculty names and credentials with topic names and categories. A row might show Norma Fisher (composite-credenti-33) linked to the topic "Extended Initiative" in the professional_development category, helping administrators ensure that topic expertise is distributed appropriately across the faculty roster.

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

The view `v_academic_topic_session_detail` presents all sessions that cover a particular academic topic, pairing the topic name and category with session identifiers, titles, and statuses. This view is valuable for curriculum mapping and for identifying which sessions contribute to a given learning domain.

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

The view `v_a_r_r_a_l_d_program_program_day_detail` expands each program to show all its constituent program days with full date, day number, and location information. A row might display the "Extended Review" program (program ID 1) with program day 1 occurring on 2023-02-05 (day 15) at extended-location-99, providing a comprehensive program itinerary.

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

The view `v_a_r_r_a_l_d_program_resident_detail` links residents to their parent ARRALD programs, presenting resident names, institutions, years of training, and the program name they are enrolled in. A row could show Theodore Mcgrath from baseline-institut-31 (year 24) enrolled in the "Extended Review" program, supporting enrollment tracking and institutional reporting.

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

The view `v_resident_a_r_r_a_l_d_program` provides a direct mapping of residents to their assigned programs, consolidating resident identifiers, names, institutions, and program details into a single record. This view is the primary tool for enrollment management and for verifying that residents are correctly assigned to their intended training cycles.

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

The view `v_resident_session_detail` connects residents to the sessions they attend, combining resident information with session identifiers, titles, statuses, and the program day on which each session occurs. A row might show Account Name (resident ID 4011) attending session SES-2449 ("Legacy Model"), which is marked completed and took place on program day 2. This view is critical for attendance tracking, completion verification, and individualized progress reporting.

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

## Synthesis

The ARRALD training program's data model reflects a carefully layered approach to managing complex, multi-day academic initiatives. At its foundation, the base tables capture discrete entities—programs, days, sessions, faculty, topics, and residents—each with its own set of attributes and identifiers. The associative tables (`sessions_members`, `sessions_topics`, `days_sessions`, `members_sessions`, `members_topics`, `topics_sessions`, `programs_days`, `programs_residents`, `residents_sessions`) weave these entities into a coherent network of participation and assignment, ensuring that every session can be traced back to its faculty leader, its academic content, its resident attendees, and its place within the broader program schedule.

The derived views translate this relational complexity into actionable intelligence. Each view answers a specific operational question: which faculty teaches which session, which sessions belong to which program day, which topics are covered in which sessions, and which residents are enrolled in which programs and attending which sessions. Together, these views form the operational dashboard of the ARRALD program, enabling administrators to plan schedules, verify assignments, track attendance, and evaluate curriculum alignment without navigating the underlying join complexity themselves.

The data itself—fictional organizations like seasonal-organizi-17 and baseline-institut-31, faculty members such as Theodore Mcgrath and Norma Fisher, and sessions ranging from "Compact Initiative" to "Seasonal Review"—illustrates the breadth of the program's scope. Whether a session is scheduled, completed, or cancelled, whether a topic falls under leadership, communication, quality_improvement, or professional_development, the system captures the full state of each training cycle. This completeness is what allows the ARRALD program to scale across multiple programs, multiple days, and multiple institutions while maintaining a single source of truth for all operational decisions.