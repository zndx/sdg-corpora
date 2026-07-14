## Managing Special Education Programs: A Practitioner's Reference

Special education delivery within a school district requires coordinated tracking of personnel, students, programs, and assessment instruments across multiple organizational boundaries. The records captured in this domain describe how special day class teachers are assigned to school sites, how students with disabilities receive individualized education programs (IEPs), and how instructional objectives are measured through validated assessment instruments. Each record carries identifiers that link people to programs, programs to teams, and programs to the instruments used to evaluate student progress. Understanding these relationships is essential for compliance reporting, resource allocation, and ensuring that every student's educational plan is both legally sound and pedagogically coherent.

**Table `special_day_class_teachers`**

| special_day_class_teacher_id | credential_type | employee_id | employment_status | salary_schedule | hire_date | last_evaluation_date | supervisory_role | school_site_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | distributed-credenti-60 | Norma Fisher | Active | compact-salary-38 | 2023-06-01 | 2024-11-19 | false | 1 |
| 1001 | baseline-credenti-61 | Tasha Rodriguez | Inactive | composite-salary-39 | 2024-11-12 | 2025-04-03 | true | 2 |
| 1002 | pilot-credenti-62 | Theodore Mcgrath | On Leave | primary-salary-40 | 2025-04-23 | 2022-09-14 | false | 3 |
| 1003 | extended-credenti-63 | Peter Mcdowell | Active | adaptive-salary-41 | 2022-09-07 | 2023-02-25 | true | 4 |

Special day class teachers form the instructional backbone of the program. Each teacher record captures their credential type, employment status, and the salary schedule under which they are compensated. For example, Norma Fisher (employee ID: Norma Fisher) holds a distributed credential, is marked as Active, and is compensated under the compact-salary-38 schedule; her hire date is 2023-06-01 and her most recent evaluation occurred on 2024-11-19. Tasha Rodriguez, by contrast, carries a baseline credential and is currently Inactive, while Theodore Mcgrath is On Leave under a pilot credential. Peter Mcdowell, an Active teacher with an extended credential, holds a supervisory role. Every teacher is anchored to a school site through the school_site_id column, which connects them to the physical location where instruction is delivered.

**Table `school_sites`**

| id | site_id | site_name | district_affiliation | site_type | operational_status | capacity |
|---|---|---|---|---|---|---|
| 1 | 102 | Composite Review | regional-district-90 | Elementary | Open | 32 |
| 2 | 1336166 | Compact Initiative A | legacy-district-91 | Middle | Closed | 41 |
| 3 | 726040 | Legacy Model | compact-district-92 | High | Under Renovation | 50 |
| 4 | Bjornfant | Regional Cluster | composite-district-93 | Elementary | Open | 59 |

School sites serve as the geographic and administrative anchor for all teacher assignments. The sites_teachers junction table records which teachers are assigned to which sites, enabling the district to track staffing distributions across locations. A teacher may appear in multiple site assignments if they serve students at more than one location, and a site may employ several special day class teachers. The v_school_site_special_day_class_teacher_detail view consolidates site-level information with the full roster of teachers assigned there, answering the question of which educators are responsible for instruction at each campus.

**Table `students`**

| id | student_id | enrollment_status | disability_type | iep_status | date_of_birth | grade_level | primary_language | individualized_education_program_iep_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Enrolled | regional-disabili-78 | Active | 2025-04-02 | 29 | primary-primary-10 | IVC20Iind |
| 2 | 25388256 | Withdrawn | legacy-disabili-79 | Pending | 2022-09-13 | 33 | adaptive-primary-11 | 6926376 |
| 3 | id_16 | Graduated | compact-disabili-80 | Expired | 2023-02-24 | 37 | distributed-primary-12 | 1562860 |
| 4 | gd_taxc_2211 | Enrolled | composite-disabili-81 | Active | 2024-07-08 | 41 | baseline-primary-13 | b_V-ART-44_58q |

Students are the central subjects of the special education program. Each student record includes a unique student_id, enrollment status, disability type, IEP status, date of birth, grade level, and primary language. Student 392507 is currently Enrolled, has a regional disability designation, and maintains an Active IEP status. Student 25388256 is Withdrawn with a legacy disability type and a Pending IEP. Student id_16 has Graduated, carrying a compact disability designation and an Expired IEP. Student gd_taxc_2211 is Enrolled with a composite disability and an Active IEP. The grade levels in this dataset range from 29 to 41, reflecting the specialized nature of the programs served. The primary_language column uses coded values such as primary-primary-10 and adaptive-primary-11 to categorize language needs.

**Table `individualized_education_programs`**

| iep_id | creation_date | last_review_date | expiration_date | status | meets_federal_compliance | meets_state_compliance | student_id | team_id |
|---|---|---|---|---|---|---|---|---|
| IVC20Iind | 2022-01-13 | 2022-09-03 | 2025-08-18 | Draft | false | true | 1 | 1450649 |
| 6926376 | 2023-06-24 | 2023-02-14 | 2022-01-02 | Approved | true | false | 2 | 1437598 |
| 1562860 | 2024-11-08 | 2024-07-25 | 2023-06-13 | Implemented | false | true | 3 | id_14 |
| b_V-ART-44_58q | 2025-04-19 | 2025-12-09 | 2024-11-24 | Revised | true | false | 4 | 99701 |

Individualized education programs are the legal and instructional documents that govern each student's special education services. The IEP table records the creation date, last review date, expiration date, current status, and compliance posture of each program. IEP IVC20Iind was created on 2022-01-13, last reviewed on 2022-09-03, and is set to expire on 2025-08-18; it is in Draft status and meets state compliance but not federal compliance. IEP 6926376 is Approved, meets federal compliance but not state compliance, and was created on 2023-06-24. IEP 1562860 is Implemented with state compliance but no federal compliance. IEP b_V-ART-44_58q is in Revised status and meets both federal and state compliance. Each IEP is linked to a student via the student_id column and to an IEP team via the team_id column.

**Table `i_e_p_teams`**

| team_id | team_name | meeting_frequency | last_meeting_date | next_scheduled_meeting | compliance_status | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1450649 | Composite Model | Monthly | 2023-10-06 | 2024-03-09 | Compliant | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1437598 | Compact Cluster A | Quarterly | 2024-03-17 | 2025-08-20 | Non-Compliant | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| id_14 | Legacy Review | As Needed | 2025-08-01 | 2022-01-04 | Under Review | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 99701 | Regional Initiative | Monthly | 2022-01-12 | 2023-06-15 | Compliant | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

IEP teams are the collaborative groups responsible for developing, reviewing, and monitoring each student's individualized education program. The i_e_p_teams table captures the team name, meeting frequency, and compliance status. The Composite Model team meets Monthly, last convened on 2023-10-06, and is Compliant. The Compact Cluster A team meets Quarterly, last met on 2024-03-17, and is Non-Compliant. The Legacy Review team meets As Needed, last met on 2025-08-01, and is Under Review. The Regional Initiative team meets Monthly, last met on 2022-01-12, and is Compliant. The teams_programs and teams_teachers junction tables record which programs and which teachers are associated with each team, enabling the district to understand team composition and workload distribution.

**Table `instructional_objectives`**

| objective_id | objective_type | target_skill | anticipated_attainment_level | measurement_method | due_date | is_remedial | individualized_education_program_iep_id | student_id |
|---|---|---|---|---|---|---|---|---|
| fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 | 22.70 | baseline-measurem-25 | 2024-11-11 | true | IVC20Iind | 1 |
| default_chart_a_tax_19 | Behavioral | composite-target-21 | 27.40 | pilot-measurem-26 | 2025-04-22 | false | 6926376 | 2 |
| 3001009030160 | Learning | primary-target-22 | 32.10 | extended-measurem-27 | 2022-09-06 | true | 1562860 | 3 |
| 10449523 | Behavioral | adaptive-target-23 | 36.80 | integrated-measurem-28 | 2023-02-17 | false | b_V-ART-44_58q | 4 |

Instructional objectives define the specific skills and competencies that each student is expected to develop under their IEP. The instructional_objectives table records the objective type (Learning or Behavioral), the target skill, the anticipated attainment level as a numeric value, the measurement method, the due date, and whether the objective is remedial. Objective fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 is a Learning objective targeting compact-target-20 with an anticipated attainment level of 22.70, measured via baseline-measurem-25, due on 2024-11-11, and marked as remedial. Objective default_chart_a_tax_19 is Behavioral, targeting composite-target-21 at level 27.40, measured by pilot-measurem-26, due 2025-04-22, and not remedial. Objective 3001009030160 targets primary-target-22 at 32.10 via extended-measurem-27, while objective 10449523 targets adaptive-target-23 at 36.80 via integrated-measurem-28. Each objective is linked to an IEP and to a student.

**Table `assessment_instruments`**

| assessment_instrument_id | instrument_id | instrument_name | instrument_type | validity_date | reliability_coefficient | administered_by |
|---|---|---|---|---|---|---|
| 100 | 6926365 | Distributed Initiative | Standardized Test | 2022-09-15 | 20.95 | legacy-administ-49 |
| 101 | account_pymes_691 | Adaptive Model D | Observation Checklist | 2023-02-26 | 23.90 | compact-administ-50 |
| 102 | 726063 | Primary Cluster | Portfolio Review | 2024-07-10 | 26.85 | composite-administ-51 |
| 103 | 23256422 | Composite Review | Standardized Test | 2025-12-21 | 29.80 | primary-administ-52 |

Assessment instruments are the tools used to measure student progress toward instructional objectives. The assessment_instruments table records the instrument name, type, validity date, reliability coefficient, and the administrator. The Distributed Initiative is a Standardized Test with a validity date of 2022-09-15 and a reliability coefficient of 20.95, administered by legacy-administ-49. The Adaptive Model D is an Observation Checklist with a reliability coefficient of 23.90. The Primary Cluster is a Portfolio Review with a reliability coefficient of 26.85. The Composite Review is a Standardized Test with a reliability coefficient of 29.80 and a validity date of 2025-12-21. The objectives_instruments and instruments_objectives junction tables establish the bidirectional relationships between objectives and the instruments used to assess them, while instruments_students records which instruments have been administered to which students.

**Table `teachers_students`**

| special_day_class_teacher_id | student_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The teachers_students and students_teachers junction tables capture the direct instructional relationships between special day class teachers and the students they serve. These many-to-many relationships allow a teacher to instruct multiple students and a student to be served by multiple teachers. The programs_objectives junction table links IEPs to their constituent instructional objectives, ensuring that every objective is traceable to a specific student's educational program.

**Table `teachers_teams`**

| special_day_class_teacher_id | team_id |
|---|---|
| 1000 | 1450649 |
| 1000 | 1437598 |
| 1001 | 1437598 |
| 1001 | id_14 |
| 1002 | id_14 |
| 1002 | 99701 |
| 1003 | 99701 |
| 1003 | 1450649 |

The teachers_teams junction table connects teachers to IEP teams, documenting which educators participate in team meetings and decision-making processes. This relationship is critical for understanding team capacity and ensuring that the right expertise is present at each review. The v_special_day_class_teacher_i_e_p_team_detail view brings together teacher information with their associated IEP teams, answering the question of which teachers are engaged with which teams and what the teams' compliance postures are.

**Table `students_teachers`**

| student_id | special_day_class_teacher_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The students_teachers table provides an alternative perspective on the teacher-student instructional relationship, emphasizing the student's point of view. It records which teachers are responsible for a given student's instruction, complementing the teachers_students table. The v_student_special_day_class_teacher_detail view joins student records with their assigned teachers, providing a clear picture of each student's instructional team.

**Table `programs_objectives`**

| individualized_education_program_iep_id | objective_id |
|---|---|
| IVC20Iind | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 |
| IVC20Iind | default_chart_a_tax_19 |
| 6926376 | default_chart_a_tax_19 |
| 6926376 | 3001009030160 |
| 1562860 | 3001009030160 |
| 1562860 | 10449523 |
| b_V-ART-44_58q | 10449523 |
| b_V-ART-44_58q | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 |

The programs_objectives junction table maps IEPs to their instructional objectives, establishing the hierarchical relationship between a student's educational program and the specific goals it contains. The v_individualized_education_program_instructional_objective_detail view expands this relationship by including full objective details, answering the question of what goals are embedded within each IEP and how they are structured.

**Table `objectives_instruments`**

| objective_id | assessment_instrument_id |
|---|---|
| fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | 100 |
| fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | 101 |
| default_chart_a_tax_19 | 101 |
| default_chart_a_tax_19 | 102 |
| 3001009030160 | 102 |
| 3001009030160 | 103 |
| 10449523 | 103 |
| 10449523 | 100 |

The objectives_instruments table links instructional objectives to the assessment instruments used to measure them. This relationship ensures that every objective has a defined measurement approach. The v_instructional_objective_assessment_instrument_detail view reveals which instruments are assigned to which objectives, providing visibility into the assessment strategy for each goal.

**Table `instruments_objectives`**

| assessment_instrument_id | objective_id |
|---|---|
| 100 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 |
| 100 | default_chart_a_tax_19 |
| 101 | default_chart_a_tax_19 |
| 101 | 3001009030160 |
| 102 | 3001009030160 |
| 102 | 10449523 |
| 103 | 10449523 |
| 103 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 |

The instruments_objectives table provides the reverse mapping from assessment instruments to the objectives they measure. This bidirectional linkage supports both forward planning (selecting instruments for objectives) and backward auditing (verifying that every instrument has a purpose). The v_assessment_instrument_instructional_objective_detail view presents this relationship from the instrument's perspective.

**Table `instruments_students`**

| assessment_instrument_id | student_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The instruments_students table records which assessment instruments have been administered to which students, creating an audit trail of assessment activity. The v_assessment_instrument_student_detail view joins instrument records with student information, answering the question of which students have been assessed with which tools and when.

**Table `teams_programs`**

| team_id | individualized_education_program_iep_id |
|---|---|
| 1450649 | IVC20Iind |
| 1450649 | 6926376 |
| 1437598 | 6926376 |
| 1437598 | 1562860 |
| id_14 | 1562860 |
| id_14 | b_V-ART-44_58q |
| 99701 | b_V-ART-44_58q |
| 99701 | IVC20Iind |

The teams_programs junction table connects IEP teams to the programs they oversee, documenting which teams are responsible for which students' educational plans. The v_i_e_p_team_individualized_education_program_detail view brings together team information with their associated IEPs, providing a comprehensive view of team workload and program coverage.

**Table `teams_teachers`**

| team_id | special_day_class_teacher_id |
|---|---|
| 1450649 | 1000 |
| 1450649 | 1001 |
| 1437598 | 1001 |
| 1437598 | 1002 |
| id_14 | 1002 |
| id_14 | 1003 |
| 99701 | 1003 |
| 99701 | 1000 |

The teams_teachers table records which teachers participate in which IEP teams. This relationship is distinct from the instructional teacher-student relationship and focuses on the collaborative governance of student programs. The v_i_e_p_team_special_day_class_teacher_detail view joins team records with their member teachers, answering the question of which educators are involved in each team's decision-making.

**Table `sites_teachers`**

| school_site_id | special_day_class_teacher_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The sites_teachers table records which teachers are assigned to which school sites. This relationship is foundational for staffing reports and resource allocation. The v_special_day_class_teacher_school_site view joins teacher records with their assigned school sites, providing a clear picture of site-level staffing.

**View `v_special_day_class_teacher_school_site`**

```sql
CREATE VIEW v_special_day_class_teacher_school_site AS
SELECT a.special_day_class_teacher_id, a.credential_type, a.employee_id, a.employment_status, b.id AS site_id, b.site_id AS site_site_id, b.site_name AS site_site_name
FROM special_day_class_teachers a JOIN school_sites b ON a.school_site_id = b.id;
```

| special_day_class_teacher_id | credential_type | employee_id | employment_status | site_id | site_site_id | site_site_name |
|---|---|---|---|---|---|---|
| 1000 | distributed-credenti-60 | Norma Fisher | Active | 1 | 102 | Composite Review |
| 1001 | baseline-credenti-61 | Tasha Rodriguez | Inactive | 2 | 1336166 | Compact Initiative A |
| 1002 | pilot-credenti-62 | Theodore Mcgrath | On Leave | 3 | 726040 | Legacy Model |
| 1003 | extended-credenti-63 | Peter Mcdowell | Active | 4 | Bjornfant | Regional Cluster |

The v_special_day_class_teacher_school_site view answers the question of which special day class teachers are assigned to which school sites. By joining the special_day_class_teachers table with the school_sites table through the sites_teachers junction, this view produces a consolidated record showing each teacher's credential type, employment status, and the site where they deliver instruction. For example, a row in this view would show Norma Fisher (Active, distributed credential) assigned to school site 1, enabling administrators to verify that staffing levels meet program requirements at each location.

**View `v_special_day_class_teacher_student_detail`**

```sql
CREATE VIEW v_special_day_class_teacher_student_detail AS
SELECT a.special_day_class_teacher_id, a.credential_type, a.employee_id, b.id AS student_id, b.student_id AS student_student_id, b.enrollment_status AS student_enrollment_status
FROM special_day_class_teachers a
  JOIN teachers_students j ON j.special_day_class_teacher_id = a.special_day_class_teacher_id
  JOIN students b ON b.id = j.student_id;
```

| special_day_class_teacher_id | credential_type | employee_id | student_id | student_student_id | student_enrollment_status |
|---|---|---|---|---|---|
| 1000 | distributed-credenti-60 | Norma Fisher | 1 | 392507 | Enrolled |
| 1000 | distributed-credenti-60 | Norma Fisher | 2 | 25388256 | Withdrawn |
| 1001 | baseline-credenti-61 | Tasha Rodriguez | 2 | 25388256 | Withdrawn |
| 1001 | baseline-credenti-61 | Tasha Rodriguez | 3 | id_16 | Graduated |
| 1002 | pilot-credenti-62 | Theodore Mcgrath | 3 | id_16 | Graduated |
| 1002 | pilot-credenti-62 | Theodore Mcgrath | 4 | gd_taxc_2211 | Enrolled |
| 1003 | extended-credenti-63 | Peter Mcdowell | 4 | gd_taxc_2211 | Enrolled |
| 1003 | extended-credenti-63 | Peter Mcdowell | 1 | 392507 | Enrolled |

The v_special_day_class_teacher_student_detail view answers the question of which students are served by which special day class teachers. By joining teachers with students through the teachers_students and students_teachers junction tables, this view produces a detailed roster showing each teacher's instructional assignments. A row in this view would show a teacher's employee ID alongside a student's enrollment status and disability type, enabling program coordinators to verify that teacher caseloads are balanced and that students with similar needs are appropriately grouped.

**View `v_special_day_class_teacher_i_e_p_team_detail`**

```sql
CREATE VIEW v_special_day_class_teacher_i_e_p_team_detail AS
SELECT a.special_day_class_teacher_id, a.credential_type, a.employee_id, b.team_id AS team_team_id, b.team_name AS team_team_name, b.meeting_frequency AS team_meeting_frequency
FROM special_day_class_teachers a
  JOIN teachers_teams j ON j.special_day_class_teacher_id = a.special_day_class_teacher_id
  JOIN i_e_p_teams b ON b.team_id = j.team_id;
```

| special_day_class_teacher_id | credential_type | employee_id | team_team_id | team_team_name | team_meeting_frequency |
|---|---|---|---|---|---|
| 1000 | distributed-credenti-60 | Norma Fisher | 1450649 | Composite Model | Monthly |
| 1000 | distributed-credenti-60 | Norma Fisher | 1437598 | Compact Cluster A | Quarterly |
| 1001 | baseline-credenti-61 | Tasha Rodriguez | 1437598 | Compact Cluster A | Quarterly |
| 1001 | baseline-credenti-61 | Tasha Rodriguez | id_14 | Legacy Review | As Needed |
| 1002 | pilot-credenti-62 | Theodore Mcgrath | id_14 | Legacy Review | As Needed |
| 1002 | pilot-credenti-62 | Theodore Mcgrath | 99701 | Regional Initiative | Monthly |
| 1003 | extended-credenti-63 | Peter Mcdowell | 99701 | Regional Initiative | Monthly |
| 1003 | extended-credenti-63 | Peter Mcdowell | 1450649 | Composite Model | Monthly |

The v_special_day_class_teacher_i_e_p_team_detail view answers the question of which teachers participate in which IEP teams and what the compliance posture of those teams is. By joining teacher records with IEP team records through the teams_teachers junction table, this view produces a consolidated record showing each teacher's team assignments and the teams' meeting frequencies and compliance statuses. A row in this view would show Peter Mcdowell (supervisory role: true) participating in a team that meets Monthly and is Compliant, enabling administrators to ensure that supervisory staff are engaged with compliant teams.

**View `v_student_individualized_education_program`**

```sql
CREATE VIEW v_student_individualized_education_program AS
SELECT a.id, a.student_id, a.enrollment_status, a.disability_type, b.iep_id AS program_iep_id, b.creation_date AS program_creation_date, b.last_review_date AS program_last_review_date
FROM students a JOIN individualized_education_programs b ON a.individualized_education_program_iep_id = b.iep_id;
```

| id | student_id | enrollment_status | disability_type | program_iep_id | program_creation_date | program_last_review_date |
|---|---|---|---|---|---|---|
| 1 | 392507 | Enrolled | regional-disabili-78 | IVC20Iind | 2022-01-13 | 2022-09-03 |
| 2 | 25388256 | Withdrawn | legacy-disabili-79 | 6926376 | 2023-06-24 | 2023-02-14 |
| 3 | id_16 | Graduated | compact-disabili-80 | 1562860 | 2024-11-08 | 2024-07-25 |
| 4 | gd_taxc_2211 | Enrolled | composite-disabili-81 | b_V-ART-44_58q | 2025-04-19 | 2025-12-09 |

The v_student_individualized_education_program view answers the question of which IEPs are associated with which students and what the compliance status of each program is. By joining the students table with the individualized_education_programs table, this view produces a consolidated record showing each student's enrollment status, disability type, and the IEP's creation date, status, and compliance posture. A row in this view would show student 392507 (Enrolled, regional disability) with IEP IVC20Iind (Draft, state-compliant only), enabling compliance officers to identify programs that need attention.

**View `v_student_special_day_class_teacher_detail`**

```sql
CREATE VIEW v_student_special_day_class_teacher_detail AS
SELECT a.id, a.student_id, a.enrollment_status, b.special_day_class_teacher_id AS teacher_special_day_class_teacher_id, b.credential_type AS teacher_credential_type, b.employee_id AS teacher_employee_id
FROM students a
  JOIN students_teachers j ON j.student_id = a.id
  JOIN special_day_class_teachers b ON b.special_day_class_teacher_id = j.special_day_class_teacher_id;
```

| id | student_id | enrollment_status | teacher_special_day_class_teacher_id | teacher_credential_type | teacher_employee_id |
|---|---|---|---|---|---|
| 1 | 392507 | Enrolled | 1000 | distributed-credenti-60 | Norma Fisher |
| 1 | 392507 | Enrolled | 1001 | baseline-credenti-61 | Tasha Rodriguez |
| 2 | 25388256 | Withdrawn | 1001 | baseline-credenti-61 | Tasha Rodriguez |
| 2 | 25388256 | Withdrawn | 1002 | pilot-credenti-62 | Theodore Mcgrath |
| 3 | id_16 | Graduated | 1002 | pilot-credenti-62 | Theodore Mcgrath |
| 3 | id_16 | Graduated | 1003 | extended-credenti-63 | Peter Mcdowell |
| 4 | gd_taxc_2211 | Enrolled | 1003 | extended-credenti-63 | Peter Mcdowell |
| 4 | gd_taxc_2211 | Enrolled | 1000 | distributed-credenti-60 | Norma Fisher |

The v_student_special_day_class_teacher_detail view answers the question of which special day class teachers are responsible for each student's instruction. By joining student records with teacher records through the students_teachers and teachers_students junction tables, this view produces a detailed instructional roster. A row in this view would show student gd_taxc_2211 (Enrolled, composite disability) assigned to a teacher with an extended credential, enabling program coordinators to verify that instructional assignments match student needs.

**View `v_individualized_education_program_student`**

```sql
CREATE VIEW v_individualized_education_program_student AS
SELECT a.iep_id, a.creation_date, a.last_review_date, a.expiration_date, b.id AS student_id, b.student_id AS student_student_id, b.enrollment_status AS student_enrollment_status
FROM individualized_education_programs a JOIN students b ON a.student_id = b.id;
```

| iep_id | creation_date | last_review_date | expiration_date | student_id | student_student_id | student_enrollment_status |
|---|---|---|---|---|---|---|
| IVC20Iind | 2022-01-13 | 2022-09-03 | 2025-08-18 | 1 | 392507 | Enrolled |
| 6926376 | 2023-06-24 | 2023-02-14 | 2022-01-02 | 2 | 25388256 | Withdrawn |
| 1562860 | 2024-11-08 | 2024-07-25 | 2023-06-13 | 3 | id_16 | Graduated |
| b_V-ART-44_58q | 2025-04-19 | 2025-12-09 | 2024-11-24 | 4 | gd_taxc_2211 | Enrolled |

The v_individualized_education_program_student view answers the question of which students are covered by each IEP and what their current enrollment and disability statuses are. By joining the individualized_education_programs table with the students table, this view produces a consolidated record showing each IEP's status alongside the student's enrollment status and grade level. A row in this view would show IEP 6926376 (Approved, federal-compliant) covering student 25388256 (Withdrawn, legacy disability), enabling administrators to identify programs where student status has changed but the IEP has not been updated.

**View `v_individualized_education_program_i_e_p_team`**

```sql
CREATE VIEW v_individualized_education_program_i_e_p_team AS
SELECT a.iep_id, a.creation_date, a.last_review_date, a.expiration_date, b.team_id AS team_team_id, b.team_name AS team_team_name, b.meeting_frequency AS team_meeting_frequency
FROM individualized_education_programs a JOIN i_e_p_teams b ON a.team_id = b.team_id;
```

| iep_id | creation_date | last_review_date | expiration_date | team_team_id | team_team_name | team_meeting_frequency |
|---|---|---|---|---|---|---|
| IVC20Iind | 2022-01-13 | 2022-09-03 | 2025-08-18 | 1450649 | Composite Model | Monthly |
| 6926376 | 2023-06-24 | 2023-02-14 | 2022-01-02 | 1437598 | Compact Cluster A | Quarterly |
| 1562860 | 2024-11-08 | 2024-07-25 | 2023-06-13 | id_14 | Legacy Review | As Needed |
| b_V-ART-44_58q | 2025-04-19 | 2025-12-09 | 2024-11-24 | 99701 | Regional Initiative | Monthly |

The v_individualized_education_program_i_e_p_team view answers the question of which IEP teams are responsible for each student's individualized education program. By joining the individualized_education_programs table with the i_e_p_teams table, this view produces a consolidated record showing each IEP's status alongside the team's name, meeting frequency, and compliance status. A row in this view would show IEP 1562860 (Implemented) managed by the Legacy Review team (As Needed, Under Review), enabling compliance officers to identify programs where team activity may be lagging.

**View `v_individualized_education_program_instructional_objective_detail`**

```sql
CREATE VIEW v_individualized_education_program_instructional_objective_detail AS
SELECT a.iep_id, a.creation_date, a.last_review_date, b.objective_id AS objective_objective_id, b.objective_type AS objective_objective_type, b.target_skill AS objective_target_skill
FROM individualized_education_programs a
  JOIN programs_objectives j ON j.individualized_education_program_iep_id = a.iep_id
  JOIN instructional_objectives b ON b.objective_id = j.objective_id;
```

| iep_id | creation_date | last_review_date | objective_objective_id | objective_objective_type | objective_target_skill |
|---|---|---|---|---|---|
| IVC20Iind | 2022-01-13 | 2022-09-03 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 |
| IVC20Iind | 2022-01-13 | 2022-09-03 | default_chart_a_tax_19 | Behavioral | composite-target-21 |
| 6926376 | 2023-06-24 | 2023-02-14 | default_chart_a_tax_19 | Behavioral | composite-target-21 |
| 6926376 | 2023-06-24 | 2023-02-14 | 3001009030160 | Learning | primary-target-22 |
| 1562860 | 2024-11-08 | 2024-07-25 | 3001009030160 | Learning | primary-target-22 |
| 1562860 | 2024-11-08 | 2024-07-25 | 10449523 | Behavioral | adaptive-target-23 |
| b_V-ART-44_58q | 2025-04-19 | 2025-12-09 | 10449523 | Behavioral | adaptive-target-23 |
| b_V-ART-44_58q | 2025-04-19 | 2025-12-09 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 |

The v_individualized_education_program_instructional_objective_detail view answers the question of what instructional objectives are embedded within each IEP and how they are structured. By joining the individualized_education_programs table with the instructional_objectives table, this view produces a detailed record showing each IEP's status alongside the objectives' types, target skills, and remedial status. A row in this view would show IEP IVC20Iind (Draft) containing objective fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 (Learning, remedial, target: compact-target-20), enabling program coordinators to verify that objectives are appropriately aligned with student needs.

**View `v_instructional_objective_individualized_education_program`**

```sql
CREATE VIEW v_instructional_objective_individualized_education_program AS
SELECT a.objective_id, a.objective_type, a.target_skill, a.anticipated_attainment_level, b.iep_id AS program_iep_id, b.creation_date AS program_creation_date, b.last_review_date AS program_last_review_date
FROM instructional_objectives a JOIN individualized_education_programs b ON a.individualized_education_program_iep_id = b.iep_id;
```

| objective_id | objective_type | target_skill | anticipated_attainment_level | program_iep_id | program_creation_date | program_last_review_date |
|---|---|---|---|---|---|---|
| fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 | 22.70 | IVC20Iind | 2022-01-13 | 2022-09-03 |
| default_chart_a_tax_19 | Behavioral | composite-target-21 | 27.40 | 6926376 | 2023-06-24 | 2023-02-14 |
| 3001009030160 | Learning | primary-target-22 | 32.10 | 1562860 | 2024-11-08 | 2024-07-25 |
| 10449523 | Behavioral | adaptive-target-23 | 36.80 | b_V-ART-44_58q | 2025-04-19 | 2025-12-09 |

The v_instructional_objective_individualized_education_program view answers the question of which IEPs contain each instructional objective and what the objectives' measurement approaches are. By joining the instructional_objectives table with the individualized_education_programs table, this view produces a consolidated record showing each objective's anticipated attainment level and due date alongside the IEP's status and compliance posture. A row in this view would show objective 3001009030160 (attainment: 32.10, due: 2022-09-06) within IEP 1562860 (Implemented, state-compliant), enabling administrators to identify objectives that may be overdue.

**View `v_instructional_objective_student`**

```sql
CREATE VIEW v_instructional_objective_student AS
SELECT a.objective_id, a.objective_type, a.target_skill, a.anticipated_attainment_level, b.id AS student_id, b.student_id AS student_student_id, b.enrollment_status AS student_enrollment_status
FROM instructional_objectives a JOIN students b ON a.student_id = b.id;
```

| objective_id | objective_type | target_skill | anticipated_attainment_level | student_id | student_student_id | student_enrollment_status |
|---|---|---|---|---|---|---|
| fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 | 22.70 | 1 | 392507 | Enrolled |
| default_chart_a_tax_19 | Behavioral | composite-target-21 | 27.40 | 2 | 25388256 | Withdrawn |
| 3001009030160 | Learning | primary-target-22 | 32.10 | 3 | id_16 | Graduated |
| 10449523 | Behavioral | adaptive-target-23 | 36.80 | 4 | gd_taxc_2211 | Enrolled |

The v_instructional_objective_student view answers the question of which students are associated with each instructional objective and what their current enrollment and disability statuses are. By joining the instructional_objectives table with the students table, this view produces a detailed record showing each objective's target skill and measurement method alongside the student's grade level and primary language. A row in this view would show objective default_chart_a_tax_19 (target: composite-target-21, method: pilot-measurem-26) for student 25388256 (Withdrawn, grade 33, adaptive-primary-11), enabling program coordinators to verify that objectives remain relevant as student circumstances change.

**View `v_instructional_objective_assessment_instrument_detail`**

```sql
CREATE VIEW v_instructional_objective_assessment_instrument_detail AS
SELECT a.objective_id, a.objective_type, a.target_skill, b.assessment_instrument_id AS instrument_assessment_instrument_id, b.instrument_id AS instrument_instrument_id, b.instrument_name AS instrument_instrument_name
FROM instructional_objectives a
  JOIN objectives_instruments j ON j.objective_id = a.objective_id
  JOIN assessment_instruments b ON b.assessment_instrument_id = j.assessment_instrument_id;
```

| objective_id | objective_type | target_skill | instrument_assessment_instrument_id | instrument_instrument_id | instrument_instrument_name |
|---|---|---|---|---|---|
| fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 | 100 | 6926365 | Distributed Initiative |
| fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 | 101 | account_pymes_691 | Adaptive Model D |
| default_chart_a_tax_19 | Behavioral | composite-target-21 | 101 | account_pymes_691 | Adaptive Model D |
| default_chart_a_tax_19 | Behavioral | composite-target-21 | 102 | 726063 | Primary Cluster |
| 3001009030160 | Learning | primary-target-22 | 102 | 726063 | Primary Cluster |
| 3001009030160 | Learning | primary-target-22 | 103 | 23256422 | Composite Review |
| 10449523 | Behavioral | adaptive-target-23 | 103 | 23256422 | Composite Review |
| 10449523 | Behavioral | adaptive-target-23 | 100 | 6926365 | Distributed Initiative |

The v_instructional_objective_assessment_instrument_detail view answers the question of which assessment instruments are assigned to each instructional objective and what the instruments' reliability and validity characteristics are. By joining the instructional_objectives table with the assessment_instruments table through the objectives_instruments and instruments_objectives junction tables, this view produces a consolidated record showing each objective's measurement method alongside the instrument's type, reliability coefficient, and validity date. A row in this view would show objective 10449523 (measurement: integrated-measurem-28) paired with instrument 103 (Composite Review, Standardized Test, reliability: 29.80), enabling assessment coordinators to verify that instruments meet quality standards.

**View `v_assessment_instrument_instructional_objective_detail`**

```sql
CREATE VIEW v_assessment_instrument_instructional_objective_detail AS
SELECT a.assessment_instrument_id, a.instrument_id, a.instrument_name, b.objective_id AS objective_objective_id, b.objective_type AS objective_objective_type, b.target_skill AS objective_target_skill
FROM assessment_instruments a
  JOIN instruments_objectives j ON j.assessment_instrument_id = a.assessment_instrument_id
  JOIN instructional_objectives b ON b.objective_id = j.objective_id;
```

| assessment_instrument_id | instrument_id | instrument_name | objective_objective_id | objective_objective_type | objective_target_skill |
|---|---|---|---|---|---|
| 100 | 6926365 | Distributed Initiative | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 |
| 100 | 6926365 | Distributed Initiative | default_chart_a_tax_19 | Behavioral | composite-target-21 |
| 101 | account_pymes_691 | Adaptive Model D | default_chart_a_tax_19 | Behavioral | composite-target-21 |
| 101 | account_pymes_691 | Adaptive Model D | 3001009030160 | Learning | primary-target-22 |
| 102 | 726063 | Primary Cluster | 3001009030160 | Learning | primary-target-22 |
| 102 | 726063 | Primary Cluster | 10449523 | Behavioral | adaptive-target-23 |
| 103 | 23256422 | Composite Review | 10449523 | Behavioral | adaptive-target-23 |
| 103 | 23256422 | Composite Review | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 |

The v_assessment_instrument_instructional_objective_detail view answers the question of which instructional objectives are measured by each assessment instrument and what the objectives' types and remedial statuses are. By joining the assessment_instruments table with the instructional_objectives table through the instruments_objectives and objectives_instruments junction tables, this view produces a consolidated record showing each instrument's name and type alongside the objectives' target skills and due dates. A row in this view would show instrument 100 (Distributed Initiative, Standardized Test) measuring objective fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 (Learning, remedial, due: 2024-11-11), enabling assessment coordinators to audit the alignment between instruments and objectives.

**View `v_assessment_instrument_student_detail`**

```sql
CREATE VIEW v_assessment_instrument_student_detail AS
SELECT a.assessment_instrument_id, a.instrument_id, a.instrument_name, b.id AS student_id, b.student_id AS student_student_id, b.enrollment_status AS student_enrollment_status
FROM assessment_instruments a
  JOIN instruments_students j ON j.assessment_instrument_id = a.assessment_instrument_id
  JOIN students b ON b.id = j.student_id;
```

| assessment_instrument_id | instrument_id | instrument_name | student_id | student_student_id | student_enrollment_status |
|---|---|---|---|---|---|
| 100 | 6926365 | Distributed Initiative | 1 | 392507 | Enrolled |
| 100 | 6926365 | Distributed Initiative | 2 | 25388256 | Withdrawn |
| 101 | account_pymes_691 | Adaptive Model D | 2 | 25388256 | Withdrawn |
| 101 | account_pymes_691 | Adaptive Model D | 3 | id_16 | Graduated |
| 102 | 726063 | Primary Cluster | 3 | id_16 | Graduated |
| 102 | 726063 | Primary Cluster | 4 | gd_taxc_2211 | Enrolled |
| 103 | 23256422 | Composite Review | 4 | gd_taxc_2211 | Enrolled |
| 103 | 23256422 | Composite Review | 1 | 392507 | Enrolled |

The v_assessment_instrument_student_detail view answers the question of which students have been assessed with each assessment instrument and what their current enrollment and disability statuses are. By joining the assessment_instruments table with the students table through the instruments_students junction table, this view produces a detailed record showing each instrument's reliability coefficient and administrator alongside the student's grade level and IEP status. A row in this view would show instrument 101 (Adaptive Model D, Observation Checklist, administered by compact-administ-50) used with student id_16 (Graduated, compact disability, Expired IEP), enabling compliance officers to verify that assessments were conducted appropriately.

**View `v_i_e_p_team_individualized_education_program_detail`**

```sql
CREATE VIEW v_i_e_p_team_individualized_education_program_detail AS
SELECT a.team_id, a.team_name, a.meeting_frequency, b.iep_id AS program_iep_id, b.creation_date AS program_creation_date, b.last_review_date AS program_last_review_date
FROM i_e_p_teams a
  JOIN teams_programs j ON j.team_id = a.team_id
  JOIN individualized_education_programs b ON b.iep_id = j.individualized_education_program_iep_id;
```

| team_id | team_name | meeting_frequency | program_iep_id | program_creation_date | program_last_review_date |
|---|---|---|---|---|---|
| 1450649 | Composite Model | Monthly | IVC20Iind | 2022-01-13 | 2022-09-03 |
| 1450649 | Composite Model | Monthly | 6926376 | 2023-06-24 | 2023-02-14 |
| 1437598 | Compact Cluster A | Quarterly | 6926376 | 2023-06-24 | 2023-02-14 |
| 1437598 | Compact Cluster A | Quarterly | 1562860 | 2024-11-08 | 2024-07-25 |
| id_14 | Legacy Review | As Needed | 1562860 | 2024-11-08 | 2024-07-25 |
| id_14 | Legacy Review | As Needed | b_V-ART-44_58q | 2025-04-19 | 2025-12-09 |
| 99701 | Regional Initiative | Monthly | b_V-ART-44_58q | 2025-04-19 | 2025-12-09 |
| 99701 | Regional Initiative | Monthly | IVC20Iind | 2022-01-13 | 2022-09-03 |

The v_i_e_p_team_individualized_education_program_detail view answers the question of which IEPs are managed by each IEP team and what the programs' statuses and compliance postures are. By joining the i_e_p_teams table with the individualized_education_programs table, this view produces a consolidated record showing each team's meeting frequency and compliance status alongside the IEPs' creation dates and expiration dates. A row in this view would show the Regional Initiative team (Monthly, Compliant) managing IEP b_V-ART-44_58q (Revised, both-compliant, expires 2024-11-24), enabling administrators to ensure that compliant teams are managing compliant programs.

**View `v_i_e_p_team_special_day_class_teacher_detail`**

```sql
CREATE VIEW v_i_e_p_team_special_day_class_teacher_detail AS
SELECT a.team_id, a.team_name, a.meeting_frequency, b.special_day_class_teacher_id AS teacher_special_day_class_teacher_id, b.credential_type AS teacher_credential_type, b.employee_id AS teacher_employee_id
FROM i_e_p_teams a
  JOIN teams_teachers j ON j.team_id = a.team_id
  JOIN special_day_class_teachers b ON b.special_day_class_teacher_id = j.special_day_class_teacher_id;
```

| team_id | team_name | meeting_frequency | teacher_special_day_class_teacher_id | teacher_credential_type | teacher_employee_id |
|---|---|---|---|---|---|
| 1450649 | Composite Model | Monthly | 1000 | distributed-credenti-60 | Norma Fisher |
| 1450649 | Composite Model | Monthly | 1001 | baseline-credenti-61 | Tasha Rodriguez |
| 1437598 | Compact Cluster A | Quarterly | 1001 | baseline-credenti-61 | Tasha Rodriguez |
| 1437598 | Compact Cluster A | Quarterly | 1002 | pilot-credenti-62 | Theodore Mcgrath |
| id_14 | Legacy Review | As Needed | 1002 | pilot-credenti-62 | Theodore Mcgrath |
| id_14 | Legacy Review | As Needed | 1003 | extended-credenti-63 | Peter Mcdowell |
| 99701 | Regional Initiative | Monthly | 1003 | extended-credenti-63 | Peter Mcdowell |
| 99701 | Regional Initiative | Monthly | 1000 | distributed-credenti-60 | Norma Fisher |

The v_i_e_p_team_special_day_class_teacher_detail view answers the question of which special day class teachers participate in each IEP team and what their employment statuses and supervisory roles are. By joining the i_e_p_teams table with the special_day_class_teachers table through the teams_teachers junction table, this view produces a detailed record showing each team's name and meeting frequency alongside the teachers' credential types and hire dates. A row in this view would show the Compact Cluster A team (Quarterly, Non-Compliant) including teacher Tasha Rodriguez (Inactive, baseline credential), enabling administrators to identify teams where staffing may need attention.

**View `v_school_site_special_day_class_teacher_detail`**

```sql
CREATE VIEW v_school_site_special_day_class_teacher_detail AS
SELECT a.id, a.site_id, a.site_name, b.special_day_class_teacher_id AS teacher_special_day_class_teacher_id, b.credential_type AS teacher_credential_type, b.employee_id AS teacher_employee_id
FROM school_sites a
  JOIN sites_teachers j ON j.school_site_id = a.id
  JOIN special_day_class_teachers b ON b.special_day_class_teacher_id = j.special_day_class_teacher_id;
```

| id | site_id | site_name | teacher_special_day_class_teacher_id | teacher_credential_type | teacher_employee_id |
|---|---|---|---|---|---|
| 1 | 102 | Composite Review | 1000 | distributed-credenti-60 | Norma Fisher |
| 1 | 102 | Composite Review | 1001 | baseline-credenti-61 | Tasha Rodriguez |
| 2 | 1336166 | Compact Initiative A | 1001 | baseline-credenti-61 | Tasha Rodriguez |
| 2 | 1336166 | Compact Initiative A | 1002 | pilot-credenti-62 | Theodore Mcgrath |
| 3 | 726040 | Legacy Model | 1002 | pilot-credenti-62 | Theodore Mcgrath |
| 3 | 726040 | Legacy Model | 1003 | extended-credenti-63 | Peter Mcdowell |
| 4 | Bjornfant | Regional Cluster | 1003 | extended-credenti-63 | Peter Mcdowell |
| 4 | Bjornfant | Regional Cluster | 1000 | distributed-credenti-60 | Norma Fisher |

The v_school_site_special_day_class_teacher_detail view answers the question of which special day class teachers are assigned to each school site and what their employment statuses and supervisory roles are. By joining the school_sites table with the special_day_class_teachers table through the sites_teachers junction table, this view produces a consolidated record showing each site alongside the teachers' credential types, salary schedules, and last evaluation dates. A row in this view would show school site 4 with teacher Peter Mcdowell (Active, extended credential, supervisory role: true, last evaluated 2023-02-25), enabling administrators to verify that supervisory coverage is adequate at each location.

## Synthesis

The records in this domain form an interconnected system that supports the legal, instructional, and administrative requirements of special education delivery. Teachers are assigned to school sites and IEP teams, students are enrolled in programs with individualized education plans, and those plans contain instructional objectives measured by validated assessment instruments. The junction tables—teachers_students, students_teachers, programs_objectives, objectives_instruments, instruments_objectives, instruments_students, teams_programs, teams_teachers, and sites_teachers—provide the flexible many-to-many relationships that allow the system to adapt to changing staffing, student populations, and program structures. The views consolidate these relationships into actionable reports, enabling administrators to verify compliance, balance caseloads, and ensure that every student's educational plan is both legally sound and pedagogically effective.