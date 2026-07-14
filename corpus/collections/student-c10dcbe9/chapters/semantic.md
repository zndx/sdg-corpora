The university conduct management domain captures the lifecycle of student disciplinary incidents from initial report through adjudication, mapping every actor, location, and procedural step into a disciplined relational model. At its core, the schema distinguishes three categories of people — students, faculty members, and university officials — each with its own identifier namespace and attribute profile, and then binds them to conduct violations through a set of governance tables that record which board or administrator was authorized to handle each case. The resulting design normalizes entities to avoid redundancy while preserving the many-to-many relationships that arise when a single official serves on multiple boards or when a violation is reviewed across several administrative layers. This chapter walks through the entity types, their columns, the foreign-key scaffolding that connects them, and the materialized views that reconstruct domain facts for reporting and audit.

## The People Tables

The schema begins with three parallel person tables, each anchored by a distinct primary key and a shared `full_name` attribute that allows cross-referencing despite the different identifier schemes. The `students` table uses a surrogate integer `id` alongside a human-readable `student_id` (such as `392507` for Theodore Mcgrath or `25388256` for Account Name) and captures enrollment metadata: `enrollment_status` takes values like `full-time`, `part-time`, `withdrawn`, and `not_enrolled`; `study_level` distinguishes `undergraduate` from `graduate` and `professional`; `residence_status` is a boolean flag; and `admission_notification_date` records the date the student was admitted. The `faculty_members` table mirrors this structure with its own surrogate `id`, a `faculty_id` that can be a UUID (`98a02b9c-8fcd-11eb-924d-9cd76263cbd0`) or an integer (`605968`), a `department` column (e.g., `adaptive-departme-89`, `distributed-departme-90`), an `employment_status` (`active`, `inactive`, `on_leave`), and a `hire_date`. The `university_officials` table similarly uses a string `official_id` (such as `template_ivacode_pagata_20det50ind` or `ChIJn_8lvThu5kcRAqnJZyb12qA`), a `role` column (`pilot-role-20`, `extended-role-21`, etc.), and the same `department`, `employment_status`, and `hire_date` attributes. All three tables store the same set of people under different identifier conventions, reflecting the fact that a person may hold multiple roles within the university — Theodore Mcgrath appears as both a student and a faculty member and as a university official, each with a different identifier.

**Table `students`**

| id | student_id | full_name | enrollment_status | study_level | residence_status | admission_notification_date | conduct_violation_id |
|---|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | full-time | undergraduate | true | 2025-04-06 | 1 |
| 101 | 25388256 | Account Name | part-time | graduate | false | 2022-09-17 | 2 |
| 102 | id_16 | Saipan International Airport | withdrawn | professional | true | 2023-02-01 | 3 |
| 103 | gd_taxc_2211 | Norma Fisher | not_enrolled | undergraduate | false | 2024-07-12 | 4 |

**Table `faculty_members`**

| id | faculty_id | full_name | department | employment_status | hire_date |
|---|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | adaptive-departme-89 | active | 2023-06-01 |
| 101 | 605968 | Account Name | distributed-departme-90 | inactive | 2024-11-12 |
| 102 | 10449508 | Saipan International Airport | baseline-departme-91 | on_leave | 2025-04-23 |
| 103 | 2002007020230 | Norma Fisher | pilot-departme-92 | active | 2022-09-07 |

**Table `university_officials`**

| official_id | full_name | role | department | employment_status | hire_date |
|---|---|---|---|---|---|
| template_ivacode_pagata_20det50ind | Theodore Mcgrath | pilot-role-20 | adaptive-departme-89 | active | 2023-06-01 |
| ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name | extended-role-21 | distributed-departme-90 | inactive | 2024-11-12 |
| 9424922 | Saipan International Airport | integrated-role-22 | baseline-departme-91 | on_leave | 2025-04-23 |
| 8189502 | Norma Fisher | seasonal-role-23 | pilot-departme-92 | active | 2022-09-07 |

## The Conduct Violations Table

The `conduct_violations` table is the central fact table of the domain. Each row represents a single disciplinary incident and carries a rich set of attributes: a surrogate `id`, a business `violation_id` (e.g., `3990166`, `m16`, `7731883`, `325461`), a free-text `description` (`Extended Survey`, `Pilot Corridor A`, `Baseline Series`, `Distributed Assessment`), a `date_of_incident` timestamp (`2023-06-17T17:39:00`, `2024-11-01T00:56:00`, etc.), a `location` string (`extended-location-99`, `integrated-location-100`, `seasonal-location-101`, `regional-location-102`), a numeric `severity_level` (ranging from `29` to `62` in the sample data), a `status` (`pending`, `under_review`, `resolved`, `appealed`), and a `created_at` timestamp. Crucially, this table also holds three foreign-key columns — `student_id`, `student_conduct_board_id`, and `student_conduct_administrator_id` — that link the violation to the relevant people and governance entities. In the sample data, violation `1` (student `100`, board `1000`, administrator `1000`) is `pending` with severity `29`, while violation `4` (student `103`, board `1003`, administrator `1003`) is `appealed` with severity `62`.

**Table `conduct_violations`**

| id | violation_id | description | date_of_incident | location | severity_level | status | student_id | student_conduct_board_id | student_conduct_administrator_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | 2023-06-17T17:39:00 | extended-location-99 | 29 | pending | 100 | 1000 | 1000 | 2025-01-01 00:14:00 |
| 2 | m16 | Pilot Corridor A | 2024-11-01T00:56:00 | integrated-location-100 | 40 | under_review | 101 | 1001 | 1001 | 2025-02-06 03:14:00 |
| 3 | 7731883 | Baseline Series | 2025-04-12T07:13:00 | seasonal-location-101 | 51 | resolved | 102 | 1002 | 1002 | 2025-03-11 06:14:00 |
| 4 | 325461 | Distributed Assessment | 2022-09-23T14:30:00 | regional-location-102 | 62 | appealed | 103 | 1003 | 1003 | 2025-04-16 09:14:00 |

## Governance Tables: Boards and Administrators

The conduct process involves two distinct governance entities: student conduct boards and student conduct administrators. The `student_conduct_boards` table records each board's composition and authorization. It uses a surrogate `id` (e.g., `1000`, `1001`, `1002`, `1003`), a `board_id` that can be a UUID-like string (`ChIJH2V4UYBt5kcR5doeFwuU7Ns`) or an integer (`168553`), a `composition` descriptor (`composite-composit-21`, `primary-composit-22`, `adaptive-composit-23`, `distributed-composit-24`), an `authorization_date`, a `status` (`active` or `inactive`), a `conduct_violation_id` foreign key, and an `official_id` foreign key pointing to `university_officials`. Board `1000` is `active`, authorized on `2022-05-19`, and linked to official `template_ivacode_pagata_20det50ind` (Theodore Mcgrath). Board `1001` is `inactive`, authorized on `2023-10-03`, and linked to official `ChIJn_8lvThu5kcRAqnJZyb12qA` (Account Name).

The `student_conduct_administrators` table mirrors this structure for individual administrators. It uses `student_conduct_administrator_id` as its surrogate key, `administrator_id` as the business identifier (e.g., `10449535`, `df2e3438-8fcc-11eb-924d-9cd76263cbd0`, `artemyarulin`, `gd_taxc_1121`), an `authorization_date`, a `case_authorization` boolean (`true` or `false`), a `status`, a `conduct_violation_id` foreign key, and an `official_id` foreign key. Administrator `1000` is `active` with `case_authorization = false`, while administrator `1001` is `inactive` with `case_authorization = true`.

**Table `student_conduct_boards`**

| id | board_id | composition | authorization_date | status | conduct_violation_id | official_id |
|---|---|---|---|---|---|---|
| 1000 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | composite-composit-21 | 2022-05-19 | active | 1 | template_ivacode_pagata_20det50ind |
| 1001 | 168553 | primary-composit-22 | 2023-10-03 | inactive | 2 | ChIJn_8lvThu5kcRAqnJZyb12qA |
| 1002 | 5006454 | adaptive-composit-23 | 2024-03-14 | active | 3 | 9424922 |
| 1003 | 1437585 | distributed-composit-24 | 2025-08-25 | inactive | 4 | 8189502 |

**Table `student_conduct_administrators`**

| student_conduct_administrator_id | administrator_id | authorization_date | case_authorization | status | conduct_violation_id | official_id |
|---|---|---|---|---|---|---|
| 1000 | 10449535 | 2022-05-19 | false | active | 1 | template_ivacode_pagata_20det50ind |
| 1001 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | 2023-10-03 | true | inactive | 2 | ChIJn_8lvThu5kcRAqnJZyb12qA |
| 1002 | artemyarulin | 2024-03-14 | false | active | 3 | 9424922 |
| 1003 | gd_taxc_1121 | 2025-08-25 | true | inactive | 4 | 8189502 |

The `university_premiseses` table, though not populated in the sample data, represents the physical locations where violations occur and is linked to `conduct_violations` through a foreign key, enabling location-based queries and reporting.

**Table `university_premiseses`**

| university_premises_id | premises_id | name | type | location | conduct_violation_id |
|---|---|---|---|---|---|
| 1 | 7021001070160 | Extended Review | building | extended-location-99 | 1 |
| 2 | 8350037 | Pilot Initiative A | land | integrated-location-100 | 2 |
| 3 | 8350027 | Baseline Model | facility | seasonal-location-101 | 3 |
| 4 | L441 | Distributed Cluster | street | regional-location-102 | 4 |

## Materialized Views: Reconstructing Domain Facts

The normalized schema requires joins to answer common domain questions. The materialized views pre-compute these joins, presenting denormalized result sets that directly support reporting, audit, and administrative review.

### The Student–Violation Join

The view `v_student_conduct_violation` joins `conduct_violations` with `students` on the student identifier, producing a single row per violation that includes the student's full name, enrollment status, study level, and admission date alongside the violation's description, severity, and status. This view answers the question: "What violation is associated with each student, and what is that student's current enrollment standing?" For example, a row might show Theodore Mcgrath (student `100`, full-time undergraduate) with violation `3990166` (`Extended Survey`, severity `29`, `pending`), or Account Name (student `101`, part-time graduate) with violation `m16` (`Pilot Corridor A`, severity `40`, `under_review`).

**View `v_student_conduct_violation`**

```sql
CREATE VIEW v_student_conduct_violation AS
SELECT a.id, a.student_id, a.full_name, a.enrollment_status, b.id AS violation_id, b.violation_id AS violation_violation_id, b.description AS violation_description
FROM students a JOIN conduct_violations b ON a.conduct_violation_id = b.id;
```

| id | student_id | full_name | enrollment_status | violation_id | violation_violation_id | violation_description |
|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | full-time | 1 | 3990166 | Extended Survey |
| 101 | 25388256 | Account Name | part-time | 2 | m16 | Pilot Corridor A |
| 102 | id_16 | Saipan International Airport | withdrawn | 3 | 7731883 | Baseline Series |
| 103 | gd_taxc_2211 | Norma Fisher | not_enrolled | 4 | 325461 | Distributed Assessment |

### The Violation–Student Join

The view `v_conduct_violation_student` performs the same join but from the violation's perspective, emphasizing the violation's attributes first and the student's attributes second. This ordering is useful when administrators start from a violation record and need to look up the student's details. The data is identical to `v_student_conduct_violation` but the column ordering reflects a different query intent: "Given a violation, who is the student and what is their profile?"

**View `v_conduct_violation_student`**

```sql
CREATE VIEW v_conduct_violation_student AS
SELECT a.id, a.violation_id, a.description, a.date_of_incident, b.id AS student_id, b.student_id AS student_student_id, b.full_name AS student_full_name
FROM conduct_violations a JOIN students b ON a.student_id = b.id;
```

| id | violation_id | description | date_of_incident | student_id | student_student_id | student_full_name |
|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | 2023-06-17T17:39:00 | 100 | 392507 | Theodore Mcgrath |
| 2 | m16 | Pilot Corridor A | 2024-11-01T00:56:00 | 101 | 25388256 | Account Name |
| 3 | 7731883 | Baseline Series | 2025-04-12T07:13:00 | 102 | id_16 | Saipan International Airport |
| 4 | 325461 | Distributed Assessment | 2022-09-23T14:30:00 | 103 | gd_taxc_2211 | Norma Fisher |

### The Violation–Board Join

The view `v_conduct_violation_student_conduct_board` joins `conduct_violations` with `student_conduct_boards` on `conduct_violation_id`, producing rows that pair each violation with its assigned board's composition, authorization date, status, and the overseeing official. This view answers: "Which board is handling each violation, and what is the board's authorization status?" A sample row links violation `1` (`Extended Survey`) to board `1000` (`composite-composit-21`, `active`, authorized `2022-05-19`) overseen by official `template_ivacode_pagata_20det50ind`.

**View `v_conduct_violation_student_conduct_board`**

```sql
CREATE VIEW v_conduct_violation_student_conduct_board AS
SELECT a.id, a.violation_id, a.description, a.date_of_incident, b.id AS board_id, b.board_id AS board_board_id, b.composition AS board_composition
FROM conduct_violations a JOIN student_conduct_boards b ON a.student_conduct_board_id = b.id;
```

| id | violation_id | description | date_of_incident | board_id | board_board_id | board_composition |
|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | 2023-06-17T17:39:00 | 1000 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | composite-composit-21 |
| 2 | m16 | Pilot Corridor A | 2024-11-01T00:56:00 | 1001 | 168553 | primary-composit-22 |
| 3 | 7731883 | Baseline Series | 2025-04-12T07:13:00 | 1002 | 5006454 | adaptive-composit-23 |
| 4 | 325461 | Distributed Assessment | 2022-09-23T14:30:00 | 1003 | 1437585 | distributed-composit-24 |

### The Violation–Administrator Join

The view `v_conduct_violation_student_conduct_administrator` joins `conduct_violations` with `student_conduct_administrators` on `conduct_violation_id`, pairing each violation with its assigned administrator's ID, authorization date, case authorization flag, status, and overseeing official. This view answers: "Which administrator is responsible for each violation, and are they authorized to act on it?" For instance, violation `2` (`Pilot Corridor A`) is handled by administrator `1001` (`df2e3438-8fcc-11eb-924d-9cd76263cbd0`, `case_authorization = true`, `inactive`) overseen by official `ChIJn_8lvThu5kcRAqnJZyb12qA`.

**View `v_conduct_violation_student_conduct_administrator`**

```sql
CREATE VIEW v_conduct_violation_student_conduct_administrator AS
SELECT a.id, a.violation_id, a.description, a.date_of_incident, b.student_conduct_administrator_id AS administrator_student_conduct_administrator_id, b.administrator_id AS administrator_administrator_id, b.authorization_date AS administrator_authorization_date
FROM conduct_violations a JOIN student_conduct_administrators b ON a.student_conduct_administrator_id = b.student_conduct_administrator_id;
```

| id | violation_id | description | date_of_incident | administrator_student_conduct_administrator_id | administrator_administrator_id | administrator_authorization_date |
|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | 2023-06-17T17:39:00 | 1000 | 10449535 | 2022-05-19 |
| 2 | m16 | Pilot Corridor A | 2024-11-01T00:56:00 | 1001 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | 2023-10-03 |
| 3 | 7731883 | Baseline Series | 2025-04-12T07:13:00 | 1002 | artemyarulin | 2024-03-14 |
| 4 | 325461 | Distributed Assessment | 2022-09-23T14:30:00 | 1003 | gd_taxc_1121 | 2025-08-25 |

### The Board–Violation Join

The view `v_student_conduct_board_conduct_violation` reverses the board-to-violation direction, starting from the board and listing the violations it handles. This supports board-level reporting: "What violations is this board currently managing?" A row might show board `1000` (`composite-composit-21`, `active`) overseeing violation `1` (`Extended Survey`, severity `29`, `pending`).

**View `v_student_conduct_board_conduct_violation`**

```sql
CREATE VIEW v_student_conduct_board_conduct_violation AS
SELECT a.id, a.board_id, a.composition, a.authorization_date, b.id AS violation_id, b.violation_id AS violation_violation_id, b.description AS violation_description
FROM student_conduct_boards a JOIN conduct_violations b ON a.conduct_violation_id = b.id;
```

| id | board_id | composition | authorization_date | violation_id | violation_violation_id | violation_description |
|---|---|---|---|---|---|---|
| 1000 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | composite-composit-21 | 2022-05-19 | 1 | 3990166 | Extended Survey |
| 1001 | 168553 | primary-composit-22 | 2023-10-03 | 2 | m16 | Pilot Corridor A |
| 1002 | 5006454 | adaptive-composit-23 | 2024-03-14 | 3 | 7731883 | Baseline Series |
| 1003 | 1437585 | distributed-composit-24 | 2025-08-25 | 4 | 325461 | Distributed Assessment |

### The Board–Official Join

The view `v_student_conduct_board_university_official` joins `student_conduct_boards` with `university_officials` on `official_id`, producing rows that pair each board with the official who oversees it, including the official's role, department, employment status, and hire date. This view answers: "Which official is responsible for each board?" Board `1000` is overseen by official `template_ivacode_pagata_20det50ind` (Theodore Mcgrath, `pilot-role-20`, `adaptive-departme-89`, `active`, hired `2023-06-01`).

**View `v_student_conduct_board_university_official`**

```sql
CREATE VIEW v_student_conduct_board_university_official AS
SELECT a.id, a.board_id, a.composition, a.authorization_date, b.official_id AS official_official_id, b.full_name AS official_full_name, b.role AS official_role
FROM student_conduct_boards a JOIN university_officials b ON a.official_id = b.official_id;
```

| id | board_id | composition | authorization_date | official_official_id | official_full_name | official_role |
|---|---|---|---|---|---|---|
| 1000 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | composite-composit-21 | 2022-05-19 | template_ivacode_pagata_20det50ind | Theodore Mcgrath | pilot-role-20 |
| 1001 | 168553 | primary-composit-22 | 2023-10-03 | ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name | extended-role-21 |
| 1002 | 5006454 | adaptive-composit-23 | 2024-03-14 | 9424922 | Saipan International Airport | integrated-role-22 |
| 1003 | 1437585 | distributed-composit-24 | 2025-08-25 | 8189502 | Norma Fisher | seasonal-role-23 |

### The Administrator–Violation Join

The view `v_student_conduct_administrator_conduct_violation` joins `student_conduct_administrators` with `conduct_violations` on `conduct_violation_id`, listing the violations assigned to each administrator. This supports workload and caseload reporting: "What violations is this administrator handling?" Administrator `1000` handles violation `1` (`Extended Survey`), while administrator `1002` (`artemyarulin`, `active`, `case_authorization = false`) handles violation `3` (`Baseline Series`, severity `51`, `resolved`).

**View `v_student_conduct_administrator_conduct_violation`**

```sql
CREATE VIEW v_student_conduct_administrator_conduct_violation AS
SELECT a.student_conduct_administrator_id, a.administrator_id, a.authorization_date, a.case_authorization, b.id AS violation_id, b.violation_id AS violation_violation_id, b.description AS violation_description
FROM student_conduct_administrators a JOIN conduct_violations b ON a.conduct_violation_id = b.id;
```

| student_conduct_administrator_id | administrator_id | authorization_date | case_authorization | violation_id | violation_violation_id | violation_description |
|---|---|---|---|---|---|---|
| 1000 | 10449535 | 2022-05-19 | false | 1 | 3990166 | Extended Survey |
| 1001 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | 2023-10-03 | true | 2 | m16 | Pilot Corridor A |
| 1002 | artemyarulin | 2024-03-14 | false | 3 | 7731883 | Baseline Series |
| 1003 | gd_taxc_1121 | 2025-08-25 | true | 4 | 325461 | Distributed Assessment |

### The Administrator–Official Join

The view `v_student_conduct_administrator_university_official` joins `student_conduct_administrators` with `university_officials` on `official_id`, pairing each administrator with their overseeing official's role, department, and employment details. This view answers: "Which official supervises each administrator?" Administrator `1000` is overseen by official `template_ivacode_pagata_20det50ind` (Theodore Mcgrath, `pilot-role-20`), while administrator `1003` (`gd_taxc_1121`, `inactive`, `case_authorization = true`) is overseen by official `8189502` (Norma Fisher, `seasonal-role-23`, `pilot-departme-92`, `active`, hired `2022-09-07`).

**View `v_student_conduct_administrator_university_official`**

```sql
CREATE VIEW v_student_conduct_administrator_university_official AS
SELECT a.student_conduct_administrator_id, a.administrator_id, a.authorization_date, a.case_authorization, b.official_id AS official_official_id, b.full_name AS official_full_name, b.role AS official_role
FROM student_conduct_administrators a JOIN university_officials b ON a.official_id = b.official_id;
```

| student_conduct_administrator_id | administrator_id | authorization_date | case_authorization | official_official_id | official_full_name | official_role |
|---|---|---|---|---|---|---|
| 1000 | 10449535 | 2022-05-19 | false | template_ivacode_pagata_20det50ind | Theodore Mcgrath | pilot-role-20 |
| 1001 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | 2023-10-03 | true | ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name | extended-role-21 |
| 1002 | artemyarulin | 2024-03-14 | false | 9424922 | Saipan International Airport | integrated-role-22 |
| 1003 | gd_taxc_1121 | 2025-08-25 | true | 8189502 | Norma Fisher | seasonal-role-23 |

### The Premises–Violation Join

The view `v_university_premises_conduct_violation` joins `university_premiseses` with `conduct_violations` on the location foreign key, producing rows that pair each physical premises with the violations that occurred there. This view answers: "Which violations occurred at each location?" Although the sample data does not populate `university_premiseses`, the join structure supports location-based analytics once premises records are created for locations like `extended-location-99`, `integrated-location-100`, `seasonal-location-101`, and `regional-location-102`.

**View `v_university_premises_conduct_violation`**

```sql
CREATE VIEW v_university_premises_conduct_violation AS
SELECT a.university_premises_id, a.premises_id, a.name, a.type, b.id AS violation_id, b.violation_id AS violation_violation_id, b.description AS violation_description
FROM university_premiseses a JOIN conduct_violations b ON a.conduct_violation_id = b.id;
```

| university_premises_id | premises_id | name | type | violation_id | violation_violation_id | violation_description |
|---|---|---|---|---|---|---|
| 1 | 7021001070160 | Extended Review | building | 1 | 3990166 | Extended Survey |
| 2 | 8350037 | Pilot Initiative A | land | 2 | m16 | Pilot Corridor A |
| 3 | 8350027 | Baseline Model | facility | 3 | 7731883 | Baseline Series |
| 4 | L441 | Distributed Cluster | street | 4 | 325461 | Distributed Assessment |

## Synthesis

The university conduct schema models a domain where people hold multiple roles, violations are tracked through a structured lifecycle, and governance is distributed across boards and administrators. The three person tables (`students`, `faculty_members`, `university_officials`) use disjoint identifier namespaces but share a `full_name` attribute, enabling cross-role lookups without forcing a single unified identity. The `conduct_violations` table serves as the central fact table, with foreign keys to `students`, `student_conduct_boards`, and `student_conduct_administrators` that encode the assignment of each case. The governance tables (`student_conduct_boards`, `student_conduct_administrators`) each carry their own `official_id` foreign key to `university_officials`, creating a two-level hierarchy: officials oversee boards and administrators, who in turn handle violations. The nine materialized views pre-compute the joins between these tables, presenting denormalized result sets that answer specific administrative questions — from "which student committed this violation" to "which official oversees this board" — without requiring ad-hoc query construction. This design balances normalization (avoiding redundant person data) with query convenience (views that present complete domain facts in a single read), making it suitable for both transactional processing and analytical reporting.