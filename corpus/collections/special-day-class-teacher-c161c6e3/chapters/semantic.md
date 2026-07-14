## Ontology-Grounded Relational Modelling in Special Education Administration

The domain of special education administration revolves around the lifecycle of Individualized Education Programs (IEPs) — legally mandated plans that specify how a school will meet a student's unique learning needs. At its core, the model captures five principal entity types: the teachers who deliver instruction, the students who receive it, the IEPs that formalize the educational plan, the instructional objectives that decompose each plan into measurable targets, and the assessment instruments used to evaluate progress. These entities are anchored by two contextual dimensions — the IEP teams that convene to author and review plans, and the school sites where instruction occurs. The relational schema materialises this ontology through a combination of direct foreign-key references for one-to-many and many-to-one relationships, and junction tables for the many-to-many associations that arise when teachers, students, objectives, instruments, teams, and sites intersect in complex ways. Every view in the schema is a declarative join that reconstructs a domain fact from these normalised tables, answering a specific administrative question.

### Core Entity Tables and Their Attributes

The foundation of the schema consists of seven base tables, each representing a distinct entity type with a primary key and a set of descriptive attributes.

**Table `special_day_class_teachers`**

| special_day_class_teacher_id | credential_type | employee_id | employment_status | salary_schedule | hire_date | last_evaluation_date | supervisory_role | school_site_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | distributed-credenti-60 | Norma Fisher | Active | compact-salary-38 | 2023-06-01 | 2024-11-19 | false | 1 |
| 1001 | baseline-credenti-61 | Tasha Rodriguez | Inactive | composite-salary-39 | 2024-11-12 | 2025-04-03 | true | 2 |
| 1002 | pilot-credenti-62 | Theodore Mcgrath | On Leave | primary-salary-40 | 2025-04-23 | 2022-09-14 | false | 3 |
| 1003 | extended-credenti-63 | Peter Mcdowell | Active | adaptive-salary-41 | 2022-09-07 | 2023-02-25 | true | 4 |

The `special_day_class_teachers` table stores the employment and credentialing details of teachers assigned to special day classes. Its surrogate primary key, `special_day_class_teacher_id`, is an integer identifier (values such as `1000`, `1001`, `1002`, `1003`). The `employee_id` column carries a human-readable name — for instance, `Norma Fisher` at teacher `1000` or `Tasha Rodriguez` at teacher `1001`. The `credential_type` column encodes the teacher's qualification category, taking values like `distributed-credenti-60` or `baseline-credenti-61`. Employment metadata includes `employment_status` (`Active`, `Inactive`, `On Leave`), `salary_schedule` (`compact-salary-38`, `composite-salary-39`, `primary-salary-40`, `adaptive-salary-41`), `hire_date`, `last_evaluation_date`, and a boolean `supervisory_role` flag. The foreign key `school_site_id` links each teacher to their assigned school site, establishing a many-to-one relationship with the `school_sites` table.

**Table `students`**

| id | student_id | enrollment_status | disability_type | iep_status | date_of_birth | grade_level | primary_language | individualized_education_program_iep_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | Enrolled | regional-disabili-78 | Active | 2025-04-02 | 29 | primary-primary-10 | IVC20Iind |
| 2 | 25388256 | Withdrawn | legacy-disabili-79 | Pending | 2022-09-13 | 33 | adaptive-primary-11 | 6926376 |
| 3 | id_16 | Graduated | compact-disabili-80 | Expired | 2023-02-24 | 37 | distributed-primary-12 | 1562860 |
| 4 | gd_taxc_2211 | Enrolled | composite-disabili-81 | Active | 2024-07-08 | 41 | baseline-primary-13 | b_V-ART-44_58q |

The `students` table holds the demographic and enrollment information for each learner. Its surrogate key `id` is an integer (`1`, `2`, `3`, `4`), while `student_id` carries a distinct identifier such as `392507` or `25388256`. The `enrollment_status` column takes values like `Enrolled`, `Withdrawn`, or `Graduated`. The `disability_type` column (e.g., `regional-disabili-78`, `legacy-disabili-79`) classifies the nature of the student's disability. The `iep_status` column (`Active`, `Pending`, `Expired`) indicates the current state of the student's IEP. Demographic attributes include `date_of_birth` (e.g., `2025-04-02`), `grade_level` (values such as `29`, `33`, `37`, `41`), and `primary_language` (`primary-primary-10`, `adaptive-primary-11`). The foreign key `individualized_education_program_iep_id` references the `iep_id` in the `individualized_education_programs` table, forming a one-to-one or one-to-zero relationship between a student and their IEP.

**Table `individualized_education_programs`**

| iep_id | creation_date | last_review_date | expiration_date | status | meets_federal_compliance | meets_state_compliance | student_id | team_id |
|---|---|---|---|---|---|---|---|---|
| IVC20Iind | 2022-01-13 | 2022-09-03 | 2025-08-18 | Draft | false | true | 1 | 1450649 |
| 6926376 | 2023-06-24 | 2023-02-14 | 2022-01-02 | Approved | true | false | 2 | 1437598 |
| 1562860 | 2024-11-08 | 2024-07-25 | 2023-06-13 | Implemented | false | true | 3 | id_14 |
| b_V-ART-44_58q | 2025-04-19 | 2025-12-09 | 2024-11-24 | Revised | true | false | 4 | 99701 |

The `individualized_education_programs` table is the central planning entity. Its primary key `iep_id` is a string identifier — `IVC20Iind`, `6926376`, `1562860`, `b_V-ART-44_58q`. The table records the temporal lifecycle of each plan through `creation_date`, `last_review_date`, and `expiration_date`. The `status` column takes values such as `Draft`, `Approved`, `Implemented`, or `Revised`. Compliance is tracked via two boolean columns: `meets_federal_compliance` and `meets_state_compliance`. The foreign key `student_id` links the IEP to the `students` table, while `team_id` links it to the `i_e_p_teams` table, establishing that each IEP is authored by a specific team for a specific student.

**Table `instructional_objectives`**

| objective_id | objective_type | target_skill | anticipated_attainment_level | measurement_method | due_date | is_remedial | individualized_education_program_iep_id | student_id |
|---|---|---|---|---|---|---|---|---|
| fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Learning | compact-target-20 | 22.70 | baseline-measurem-25 | 2024-11-11 | true | IVC20Iind | 1 |
| default_chart_a_tax_19 | Behavioral | composite-target-21 | 27.40 | pilot-measurem-26 | 2025-04-22 | false | 6926376 | 2 |
| 3001009030160 | Learning | primary-target-22 | 32.10 | extended-measurem-27 | 2022-09-06 | true | 1562860 | 3 |
| 10449523 | Behavioral | adaptive-target-23 | 36.80 | integrated-measurem-28 | 2023-02-17 | false | b_V-ART-44_58q | 4 |

The `instructional_objectives` table decomposes each IEP into measurable learning targets. Its primary key `objective_id` is a string (e.g., `fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3`, `default_chart_a_tax_19`, `3001009030160`, `10449523`). The `objective_type` column distinguishes between `Learning` and `Behavioral` objectives. The `target_skill` column (e.g., `compact-target-20`, `composite-target-21`) identifies the specific skill area. The `anticipated_attainment_level` is a numeric value (`22.70`, `27.40`, `32.10`, `36.80`), and `measurement_method` encodes the assessment approach (`baseline-measurem-25`, `pilot-measurem-26`, `extended-measurem-27`, `integrated-measurem-28`). The `due_date` column specifies the target completion date, while `is_remedial` is a boolean flag. Foreign keys `individualized_education_program_iep_id` and `student_id` link each objective to its parent IEP and to the student, respectively.

**Table `assessment_instruments`**

| assessment_instrument_id | instrument_id | instrument_name | instrument_type | validity_date | reliability_coefficient | administered_by |
|---|---|---|---|---|---|---|
| 100 | 6926365 | Distributed Initiative | Standardized Test | 2022-09-15 | 20.95 | legacy-administ-49 |
| 101 | account_pymes_691 | Adaptive Model D | Observation Checklist | 2023-02-26 | 23.90 | compact-administ-50 |
| 102 | 726063 | Primary Cluster | Portfolio Review | 2024-07-10 | 26.85 | composite-administ-51 |
| 103 | 23256422 | Composite Review | Standardized Test | 2025-12-21 | 29.80 | primary-administ-52 |

The `assessment_instruments` table catalogues the tools used to measure student progress. Its surrogate key `assessment_instrument_id` is an integer (`100`, `101`, `102`, `103`). The `instrument_id` column carries a distinct identifier (`6926365`, `account_pymes_691`, `726063`, `23256422`), and `instrument_name` provides a human-readable label such as `Distributed Initiative`, `Adaptive Model D`, `Primary Cluster`, or `Composite Review`. The `instrument_type` column distinguishes between `Standardized Test`, `Observation Checklist`, and `Portfolio Review`. The `validity_date` records when the instrument was validated, `reliability_coefficient` is a numeric value (`20.95`, `23.90`, `26.85`, `29.80`), and `administered_by` identifies the administrator category (`legacy-administ-49`, `compact-administ-50`, `composite-administ-51`, `primary-administ-52`).

**Table `i_e_p_teams`**

| team_id | team_name | meeting_frequency | last_meeting_date | next_scheduled_meeting | compliance_status | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1450649 | Composite Model | Monthly | 2023-10-06 | 2024-03-09 | Compliant | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1437598 | Compact Cluster A | Quarterly | 2024-03-17 | 2025-08-20 | Non-Compliant | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| id_14 | Legacy Review | As Needed | 2025-08-01 | 2022-01-04 | Under Review | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 99701 | Regional Initiative | Monthly | 2022-01-12 | 2023-06-15 | Compliant | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `i_e_p_teams` table represents the collaborative groups that author and review IEPs. Its primary key `team_id` is a string (`1450649`, `1437598`, `id_14`, `99701`). The `team_name` column provides a descriptive label such as `Composite Model`, `Compact Cluster A`, `Legacy Review`, or `Regional Initiative`. The `meeting_frequency` column takes values like `Monthly`, `Quarterly`, or `As Needed`. Temporal tracking is handled by `last_meeting_date` and `next_scheduled_meeting`. The `compliance_status` column (`Compliant`, `Non-Compliant`, `Under Review`) indicates the team's regulatory standing, while `created_at` and `updated_at` are timestamp columns.

**Table `school_sites`**

| id | site_id | site_name | district_affiliation | site_type | operational_status | capacity |
|---|---|---|---|---|---|---|
| 1 | 102 | Composite Review | regional-district-90 | Elementary | Open | 32 |
| 2 | 1336166 | Compact Initiative A | legacy-district-91 | Middle | Closed | 41 |
| 3 | 726040 | Legacy Model | compact-district-92 | High | Under Renovation | 50 |
| 4 | Bjornfant | Regional Cluster | composite-district-93 | Elementary | Open | 59 |

The `school_sites` table provides the geographic and organisational context for all instructional activity. Each school site is identified by a `school_site_id` that serves as the target of the `school_site_id` foreign key in `special_day_class_teachers`.

### Many-to-Many Junction Tables

The domain requires several many-to-many relationships that cannot be expressed through simple foreign keys. These are materialised as junction tables, each containing two foreign keys that reference the primary keys of the participating entity tables.

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

The `teachers_students` junction table links teachers to the students they instruct. It contains a foreign key referencing `special_day_class_teacher_id` and another referencing `students.id`, enabling a teacher such as `Norma Fisher` (teacher `1000`) to be associated with multiple students, and a student to be served by multiple teachers.

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

The `teachers_teams` table associates teachers with IEP teams. It holds foreign keys to `special_day_class_teacher_id` and `i_e_p_teams.team_id`, allowing a teacher to participate in multiple teams and a team to include multiple members.

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

The `students_teachers` table provides an alternative or complementary linkage between students and teachers. Like `teachers_students`, it contains foreign keys to both `students.id` and `special_day_class_teacher_id`, potentially capturing a different semantic perspective on the teacher-student relationship.

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

The `programs_objectives` junction table connects IEPs to their constituent instructional objectives. It references `individualized_education_programs.iep_id` and `instructional_objectives.objective_id`, enabling an IEP such as `IVC20Iind` to contain multiple objectives and an objective to be shared across multiple IEPs.

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

The `objectives_instruments` table links instructional objectives to the assessment instruments used to measure them. It holds foreign keys to `instructional_objectives.objective_id` and `assessment_instruments.assessment_instrument_id`.

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

The `instruments_objectives` table provides a complementary linkage from instruments to objectives, referencing `assessment_instruments.assessment_instrument_id` and `instructional_objectives.objective_id`. This bidirectional junction structure supports queries from either direction — finding all instruments for an objective, or all objectives measured by an instrument.

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

The `instruments_students` junction table associates assessment instruments with students. It contains foreign keys to `assessment_instruments.assessment_instrument_id` and `students.id`, enabling a student to be assessed with multiple instruments and an instrument to be administered to multiple students.

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

The `teams_programs` table links IEP teams to the IEPs they author. It references `i_e_p_teams.team_id` and `individualized_education_programs.iep_id`, allowing a team such as `Composite Model` (team `1450649`) to author multiple IEPs and an IEP to be associated with multiple team members.

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

The `teams_teachers` table provides another linkage between teams and teachers, holding foreign keys to `i_e_p_teams.team_id` and `special_day_class_teacher_id`. Together with `teachers_teams`, this dual-junction structure supports queries from either direction.

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

The `sites_teachers` junction table connects school sites to the teachers assigned to them. It references `school_sites.school_site_id` and `special_day_class_teachers.special_day_class_teacher_id`, enabling a school site to employ multiple teachers and a teacher to be associated with multiple sites.

### View-Based Reconstitution of Domain Facts

The views in the schema are declarative joins that reconstruct domain facts from the normalised tables. Each view answers a specific administrative question by bringing together the relevant entity tables.

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

This view joins `special_day_class_teachers` with `school_sites` to answer the question: "Which school site is each special day class teacher assigned to?" For teacher `1000` (Norma Fisher) with `school_site_id = 1`, the view returns the teacher's credential type, employment status, and salary schedule alongside the school site's name and location.

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

This view joins `special_day_class_teachers` with `students` through the `teachers_students` junction table to answer: "Which students are served by each special day class teacher?" For teacher `1000` (Norma Fisher), the view surfaces the student's `student_id` (`392507`), `enrollment_status` (`Enrolled`), `disability_type` (`regional-disabili-78`), and `iep_status` (`Active`), providing a complete picture of the teacher's caseload.

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

This view joins `special_day_class_teachers` with `i_e_p_teams` through the `teachers_teams` or `teams_teachers` junction table to answer: "Which IEP teams does each teacher participate in?" For teacher `1000`, the view returns the team name (`Composite Model`), `meeting_frequency` (`Monthly`), and `compliance_status` (`Compliant`), enabling administrators to verify team composition and compliance.

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

This view joins `students` with `individualized_education_programs` to answer: "What is the IEP status of each student?" For student `392507` (id `1`), the view returns the `iep_id` (`IVC20Iind`), `status` (`Draft`), `creation_date` (`2022-01-13`), and compliance flags (`meets_federal_compliance = false`, `meets_state_compliance = true`), providing a snapshot of the student's planning status.

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

This view joins `students` with `special_day_class_teachers` through the `students_teachers` junction table to answer: "Which teacher is assigned to each student?" For student `392507`, the view surfaces the teacher's `employee_id` (`Norma Fisher`), `credential_type` (`distributed-credenti-60`), `employment_status` (`Active`), and `supervisory_role` (`false`), enabling administrators to verify teacher qualifications.

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

This view joins `individualized_education_programs` with `students` to answer: "Which student is associated with each IEP?" For IEP `IVC20Iind`, the view returns the student's `student_id` (`392507`), `enrollment_status` (`Enrolled`), `disability_type` (`regional-disabili-78`), and `grade_level` (`29`), providing the student context for each plan.

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

This view joins `individualized_education_programs` with `i_e_p_teams` to answer: "Which team authored each IEP?" For IEP `IVC20Iind`, the view returns the team name (`Composite Model`), `meeting_frequency` (`Monthly`), and `compliance_status` (`Compliant`), enabling administrators to verify that each IEP has an active, compliant team.

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

This view joins `individualized_education_programs` with `instructional_objectives` to answer: "What objectives are contained within each IEP?" For IEP `IVC20Iind`, the view returns the `objective_id` (`fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3`), `objective_type` (`Learning`), `target_skill` (`compact-target-20`), `anticipated_attainment_level` (`22.70`), and `due_date` (`2024-11-11`), providing a detailed breakdown of the plan's learning targets.

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

This view joins `instructional_objectives` with `individualized_education_programs` to answer: "Which IEP does each objective belong to?" For objective `fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3`, the view returns the `iep_id` (`IVC20Iind`), `status` (`Draft`), and `expiration_date` (`2025-08-18`), providing the plan context for each objective.

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

This view joins `instructional_objectives` with `students` to answer: "Which student is each objective targeting?" For objective `fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3`, the view returns the student's `student_id` (`392507`), `enrollment_status` (`Enrolled`), and `disability_type` (`regional-disabili-78`), providing the learner context for each objective.

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

This view joins `instructional_objectives` with `assessment_instruments` through the `objectives_instruments` or `instruments_objectives` junction table to answer: "Which assessment instruments are used to measure each objective?" For objective `fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3`, the view returns the `instrument_name` (`Distributed Initiative`), `instrument_type` (`Standardized Test`), `validity_date` (`2022-09-15`), and `reliability_coefficient` (`20.95`), providing the measurement context for each objective.

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

This view joins `assessment_instruments` with `instructional_objectives` to answer: "Which objectives are measured by each assessment instrument?" For instrument `100` (`Distributed Initiative`), the view returns the `objective_id` (`fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3`), `objective_type` (`Learning`), and `target_skill` (`compact-target-20`), enabling administrators to verify that each instrument is appropriately mapped to its intended objectives.

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

This view joins `assessment_instruments` with `students` through the `instruments_students` junction table to answer: "Which students are assessed with each instrument?" For instrument `100` (`Distributed Initiative`), the view returns the student's `student_id` (`392507`), `enrollment_status` (`Enrolled`), and `disability_type` (`regional-disabili-78`), providing the learner context for each assessment.

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

This view joins `i_e_p_teams` with `individualized_education_programs` to answer: "Which IEPs has each team authored?" For team `1450649` (`Composite Model`), the view returns the `iep_id` (`IVC20Iind`), `status` (`Draft`), `creation_date` (`2022-01-13`), and `expiration_date` (`2025-08-18`), providing a complete inventory of the team's authored plans.

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

This view joins `i_e_p_teams` with `special_day_class_teachers` through the `teams_teachers` or `teachers_teams` junction table to answer: "Which teachers are members of each IEP team?" For team `1450649` (`Composite Model`), the view returns the teacher's `employee_id` (`Norma Fisher`), `credential_type` (`distributed-credenti-60`), and `employment_status` (`Active`), enabling administrators to verify team composition.

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

This view joins `school_sites` with `special_day_class_teachers` to answer: "Which teachers are assigned to each school site?" For school site `1`, the view returns the teacher's `employee_id` (`Norma Fisher`), `credential_type` (`distributed-credenti-60`), `employment_status` (`Active`), and `supervisory_role` (`false`), providing a complete roster of teachers at each site.

### Synthesis

The schema models the special education domain as a network of seven core entity tables connected by a web of junction tables that materialise many-to-many relationships. The base tables capture the attributes of teachers, students, IEPs, objectives, instruments, teams, and school sites. The junction tables — `teachers_students`, `teachers_teams`, `students_teachers`, `programs_objectives`, `objectives_instruments`, `instruments_objectives`, `instruments_students`, `teams_programs`, `teams_teachers`, and `sites_teachers` — enable the complex associations that arise when a teacher serves multiple students, a team authors multiple IEPs, or an instrument measures multiple objectives. The seventeen views are declarative joins that reconstruct domain facts from these normalised tables, each answering a specific administrative question by bringing together the relevant entity tables. The result is a schema that faithfully reflects the ontology of special education administration while remaining fully normalised and queryable.