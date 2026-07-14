## University Conduct Management: Records, Relationships, and Operational Views

Higher education institutions maintain rigorous systems for tracking student conduct, from the initial incident through adjudication and resolution. The records in this domain capture every facet of that lifecycle: who was involved, what occurred, where and when it happened, which board or administrator was assigned, and what the current status is. Understanding the structure of these records is essential for anyone responsible for compliance reporting, audit preparation, or operational oversight of the conduct management process.

The foundation of the system rests on three person and enrollment tables. Students are recorded with a unique identifier, a full name, enrollment status, study level, and residence status.

**Table `students`**

| id | student_id | full_name | enrollment_status | study_level | residence_status | admission_notification_date | conduct_violation_id |
|---|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | full-time | undergraduate | true | 2025-04-06 | 1 |
| 101 | 25388256 | Account Name | part-time | graduate | false | 2022-09-17 | 2 |
| 102 | id_16 | Saipan International Airport | withdrawn | professional | true | 2023-02-01 | 3 |
| 103 | gd_taxc_2211 | Norma Fisher | not_enrolled | undergraduate | false | 2024-07-12 | 4 |

The student records reveal a diverse population. Theodore Mcgrath (student_id 392507) is enrolled full-time at the undergraduate level and maintains on-campus residence, with an admission notification dated 2025-04-06. Account Name (student_id 25388256) is a part-time graduate student living off campus, admitted in September 2022. Saipan International Airport (student_id id_16) holds a withdrawn status in a professional program, while Norma Fisher (student_id gd_taxc_2211) is not currently enrolled as an undergraduate. Each student record carries a conduct_violation_id linking them to a specific incident, establishing the primary foreign-key relationship that anchors the entire conduct management workflow.

Faculty members are tracked separately, with their own identifier space, departmental assignment, and employment status.

**Table `faculty_members`**

| id | faculty_id | full_name | department | employment_status | hire_date |
|---|---|---|---|---|---|
| 100 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | adaptive-departme-89 | active | 2023-06-01 |
| 101 | 605968 | Account Name | distributed-departme-90 | inactive | 2024-11-12 |
| 102 | 10449508 | Saipan International Airport | baseline-departme-91 | on_leave | 2025-04-23 |
| 103 | 2002007020230 | Norma Fisher | pilot-departme-92 | active | 2022-09-07 |

The faculty roster includes Theodore Mcgrath (faculty_id 98a02b9c-8fcd-11eb-924d-9cd76263cbd0) in the adaptive-departme-89 department, currently active since a 2023-06-01 hire date. Account Name (faculty_id 605968) is listed as inactive within distributed-departme-90, having been hired on 2024-11-12. Saipan International Airport (faculty_id 10449508) is on leave in baseline-departme-91, and Norma Fisher (faculty_id 2002007020230) is an active member of pilot-departme-92, hired in September 2022. While faculty members occupy a parallel personnel table, the conduct management system primarily references university officials for board assignments and case administration.

University officials serve as the authoritative personnel records for those authorized to serve on conduct boards or administer cases.

**Table `university_officials`**

| official_id | full_name | role | department | employment_status | hire_date |
|---|---|---|---|---|---|
| template_ivacode_pagata_20det50ind | Theodore Mcgrath | pilot-role-20 | adaptive-departme-89 | active | 2023-06-01 |
| ChIJn_8lvThu5kcRAqnJZyb12qA | Account Name | extended-role-21 | distributed-departme-90 | inactive | 2024-11-12 |
| 9424922 | Saipan International Airport | integrated-role-22 | baseline-departme-91 | on_leave | 2025-04-23 |
| 8189502 | Norma Fisher | seasonal-role-23 | pilot-departme-92 | active | 2022-09-07 |

Each official carries a role designation, department, and employment status. Theodore Mcgrath holds the pilot-role-20 position in adaptive-departme-89 and is active. Account Name serves in extended-role-21 within distributed-departme-90 and is currently inactive. Saipan International Airport fills the integrated-role-22 role in baseline-departme-91 on a leave status, while Norma Fisher occupies seasonal-role-23 in pilot-departme-92 as an active official hired in 2022. The official_id column is the key referenced by both conduct boards and conduct administrators, creating the bridge between personnel authorization and case assignment.

At the center of the conduct management domain sits the conduct_violations table, which records every reported incident.

**Table `conduct_violations`**

| id | violation_id | description | date_of_incident | location | severity_level | status | student_id | student_conduct_board_id | student_conduct_administrator_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | 2023-06-17T17:39:00 | extended-location-99 | 29 | pending | 100 | 1000 | 1000 | 2025-01-01 00:14:00 |
| 2 | m16 | Pilot Corridor A | 2024-11-01T00:56:00 | integrated-location-100 | 40 | under_review | 101 | 1001 | 1001 | 2025-02-06 03:14:00 |
| 3 | 7731883 | Baseline Series | 2025-04-12T07:13:00 | seasonal-location-101 | 51 | resolved | 102 | 1002 | 1002 | 2025-03-11 06:14:00 |
| 4 | 325461 | Distributed Assessment | 2022-09-23T14:30:00 | regional-location-102 | 62 | appealed | 103 | 1003 | 1003 | 2025-04-16 09:14:00 |

Each violation record captures a comprehensive picture of the incident. Violation 1 (violation_id 3990166) is described as an "Extended Survey" that occurred on 2023-06-17 at extended-location-99, carrying a severity level of 29 and currently pending status. Violation 2 (violation_id m16), labeled "Pilot Corridor A," took place on 2024-11-01 at integrated-location-100 with a higher severity of 40 and is under review. Violation 3 (violation_id 7731883), the "Baseline Series" incident, occurred on 2025-04-12 at seasonal-location-101 with severity 51 and has been resolved. Violation 4 (violation_id 325461), a "Distributed Assessment" at regional-location-102 on 2022-09-23, carries the highest severity at 62 and is currently appealed. The student_id column links each violation to the responsible student, while student_conduct_board_id and student_conduct_administrator_id reference the assigned adjudication entities.

Student conduct boards are the formal adjudication bodies assigned to review violations.

**Table `student_conduct_boards`**

| id | board_id | composition | authorization_date | status | conduct_violation_id | official_id |
|---|---|---|---|---|---|---|
| 1000 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | composite-composit-21 | 2022-05-19 | active | 1 | template_ivacode_pagata_20det50ind |
| 1001 | 168553 | primary-composit-22 | 2023-10-03 | inactive | 2 | ChIJn_8lvThu5kcRAqnJZyb12qA |
| 1002 | 5006454 | adaptive-composit-23 | 2024-03-14 | active | 3 | 9424922 |
| 1003 | 1437585 | distributed-composit-24 | 2025-08-25 | inactive | 4 | 8189502 |

Board 1000 (board_id ChIJH2V4UYBt5kcR5doeFwuU7Ns) has a composite-composit-21 composition, was authorized on 2022-05-19, is active, and is assigned to conduct violation 1. Board 1001 (board_id 168553) with primary-composit-22 composition was authorized on 2023-10-03, is inactive, and handles violation 2. Board 1002 (board_id 5006454) carries adaptive-composit-23 composition, was authorized on 2024-03-14, is active, and is linked to violation 3. Board 1003 (board_id 1437585) has distributed-composit-24 composition, was authorized on 2025-08-25, is inactive, and manages violation 4. The official_id column in this table references the university official who chairs or oversees the board, creating the personnel-to-board relationship.

Student conduct administrators are the individuals authorized to manage specific cases, distinct from the board composition.

**Table `student_conduct_administrators`**

| student_conduct_administrator_id | administrator_id | authorization_date | case_authorization | status | conduct_violation_id | official_id |
|---|---|---|---|---|---|---|
| 1000 | 10449535 | 2022-05-19 | false | active | 1 | template_ivacode_pagata_20det50ind |
| 1001 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | 2023-10-03 | true | inactive | 2 | ChIJn_8lvThu5kcRAqnJZyb12qA |
| 1002 | artemyarulin | 2024-03-14 | false | active | 3 | 9424922 |
| 1003 | gd_taxc_1121 | 2025-08-25 | true | inactive | 4 | 8189502 |

Administrator 1000 (administrator_id 10449535) was authorized on 2022-05-19, has case_authorization set to false, is active, and is assigned to conduct violation 1. Administrator 1001 (administrator_id df2e3438-8fcc-11eb-924d-9cd76263cbd0) was authorized on 2023-10-03, has case_authorization set to true, is inactive, and handles violation 2. Administrator 1002 (administrator_id artemyarulin) was authorized on 2024-03-14, has case_authorization set to false, is active, and manages violation 3. Administrator 1003 (administrator_id gd_taxc_1121) was authorized on 2025-08-25, has case_authorization set to true, is inactive, and is assigned to violation 4. Like the boards, each administrator record references a university official through official_id.

University premises provide the location context for conduct incidents.

**Table `university_premiseses`**

| university_premises_id | premises_id | name | type | location | conduct_violation_id |
|---|---|---|---|---|---|
| 1 | 7021001070160 | Extended Review | building | extended-location-99 | 1 |
| 2 | 8350037 | Pilot Initiative A | land | integrated-location-100 | 2 |
| 3 | 8350027 | Baseline Model | facility | seasonal-location-101 | 3 |
| 4 | L441 | Distributed Cluster | street | regional-location-102 | 4 |

The premises table catalogs the physical locations across the institution where conduct incidents may occur. Each location record provides the geographic and facility context necessary for incident documentation, reporting, and spatial analysis of conduct patterns across campus.

With the base tables established, the system provides a series of joined views that answer specific operational questions by combining records across tables.

The view v_student_conduct_violation joins student enrollment data with conduct violation records, answering the question: what is the full profile of the student involved in each reported incident?

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

This view reveals, for example, that Theodore Mcgrath (student_id 392507), a full-time undergraduate with on-campus residence, is associated with violation 3990166, an "Extended Survey" incident with severity level 29 that remains pending. Account Name (student_id 25388256), a part-time graduate student living off campus, is linked to violation m16, "Pilot Corridor A," with severity 40 and under_review status. The joined view enables administrators to see at a glance whether a student's enrollment context—full-time versus part-time, undergraduate versus graduate, on-campus versus off-campus—correlates with the nature or severity of reported violations.

The view v_conduct_violation_student reverses the perspective, presenting each violation alongside the complete student record.

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

Reading this view, one finds that violation 3990166 ("Extended Survey," severity 29, pending) is associated with student Theodore Mcgrath, enrolled full-time at the undergraduate level with residence_status true. Violation m16 ("Pilot Corridor A," severity 40, under_review) corresponds to Account Name, a part-time graduate student with residence_status false. This orientation is particularly useful for conduct administrators who need to verify student identity and enrollment standing before proceeding with case management.

The view v_conduct_violation_student_conduct_board brings together violation details, student information, and the assigned conduct board.

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

This joined result answers: which conduct board is responsible for adjudicating each violation, and what are the board's characteristics? For instance, violation 3990166 is assigned to board 1000 (ChIJH2V4UYBt5kcR5doeFwuU7Ns), a composite-composit-21 composition authorized on 2022-05-19 and currently active. Violation m16 is assigned to board 1001 (board_id 168553), a primary-composit-22 composition authorized on 2023-10-03 and currently inactive. The view makes it immediately apparent that some violations are handled by inactive boards, which may indicate historical cases or boards that have been decommissioned.

The view v_conduct_violation_student_conduct_administrator combines violation, student, and administrator records.

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

This view reveals the case administration chain. Violation 3990166 is administered by administrator 1000 (administrator_id 10449535), authorized on 2022-05-19 with case_authorization false and active status. Violation m16 is administered by administrator 1001 (administrator_id df2e3438-8fcc-11eb-924d-9cd76263cbd0), authorized on 2023-10-03 with case_authorization true and inactive status. The case_authorization flag provides a binary indicator of whether the administrator has been granted full case management privileges, and the status field indicates whether the administrator is currently available for new assignments.

The view v_student_conduct_board_conduct_violation presents the conduct board as the primary entity, with its assigned violations joined in.

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

From this board-centric perspective, board 1000 (ChIJH2V4UYBt5kcR5doeFwuU7Ns, composite-composit-21, active) is linked to violation 3990166 ("Extended Survey," severity 29, pending). Board 1001 (168553, primary-composit-22, inactive) is linked to violation m16 ("Pilot Corridor A," severity 40, under_review). This orientation is valuable for board coordinators who need to see the full caseload of their assigned board, including the severity levels and current statuses of all pending matters.

The view v_student_conduct_board_university_official connects conduct boards to the university officials who oversee them.

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

This view answers: which official is responsible for each conduct board? Board 1000 (ChIJH2V4UYBt5kcR5doeFwuU7Ns) is overseen by the official with official_id template_ivacode_pagata_20det50ind, who holds the pilot-role-20 position in adaptive-departme-89 and is active. Board 1001 (168553) is overseen by the official with official_id ChIJn_8lvThu5kcRAqnJZyb12qA, who holds extended-role-21 in distributed-departme-90 and is inactive. The view enables compliance officers to verify that each board is properly staffed by an authorized official and to identify boards whose overseeing officials are inactive or on leave.

The view v_student_conduct_administrator_conduct_violation presents the administrator as the primary entity with their assigned violations.

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

From this perspective, administrator 1000 (administrator_id 10449535, authorized 2022-05-19, case_authorization false, active) is assigned to violation 3990166 ("Extended Survey," severity 29, pending). Administrator 1001 (administrator_id df2e3438-8fcc-11eb-924d-9cd76263cbd0, authorized 2023-10-03, case_authorization true, inactive) is assigned to violation m16 ("Pilot Corridor A," severity 40, under_review). This view is useful for workload analysis, allowing supervisors to assess how cases are distributed among administrators and to identify whether case_authorization status aligns with current employment status.

The view v_student_conduct_administrator_university_official links conduct administrators to their overseeing university officials.

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

This view reveals the personnel chain for case administration. Administrator 1000 (administrator_id 10449535) is overseen by the official with official_id template_ivacode_pagata_20det50ind (pilot-role-20, adaptive-departme-89, active). Administrator 1001 (administrator_id df2e3438-8fcc-11eb-924d-9cd76263cbd0) is overseen by the official with official_id ChIJn_8lvThu5kcRAqnJZyb12qA (extended-role-21, distributed-departme-90, inactive). The view ensures that the authorization chain is traceable from the administrator level up through the official hierarchy, which is critical for audit compliance and accountability.

The view v_university_premises_conduct_violation joins location records with the violations that occurred at those locations.

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

This view answers: where did each incident occur, and what are the details of the violation at that location? Violation 3990166 ("Extended Survey," severity 29, pending) occurred at extended-location-99. Violation m16 ("Pilot Corridor A," severity 40, under_review) occurred at integrated-location-100. Violation 7731883 ("Baseline Series," severity 51, resolved) occurred at seasonal-location-101. Violation 325461 ("Distributed Assessment," severity 62, appealed) occurred at regional-location-102. This spatial join supports pattern analysis, enabling administrators to identify whether certain locations have higher incident rates or whether severity levels cluster around particular facilities.

The conduct management system integrates student enrollment records, personnel rosters, incident documentation, adjudication bodies, and location data into a coherent operational framework. The foreign-key relationships—students linked to violations, violations linked to boards and administrators, boards and administrators linked to university officials, and violations linked to premises—create a fully navigable graph of accountability. Each view serves a distinct operational purpose: some orient around the student, others around the violation, the board, the administrator, or the location. Together, they provide the comprehensive visibility required for effective conduct management, compliance reporting, and institutional accountability.