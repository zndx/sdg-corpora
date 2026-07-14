## The Student-Athlete Compliance Domain

The domain under examination models the administrative ecosystem surrounding student-athletes at an educational institution, where compliance with academic and athletic regulations is enforced through a network of roles and requirements. At the center of this ecosystem sits the `student_athletes` table, which captures the academic standing of each athlete through attributes such as `enrollment_status` (full-time, part-time, or inactive), `current_gpa` and `cumulative_gpa` (ranging from 11.95 to 23.80 in the sample data), `semester_hours_earned` (from 19 to 37), and identifiers for the degree program, major, and semester of enrollment. Each student-athlete record is linked to four supporting roles — a compliance coordinator, a certifying officer, a head coach, and an academic term — as well as to a degree program, forming the backbone of a normalized schema where every relationship is materialized through explicit foreign keys and junction tables.

**Table `student_athletes`**

| student_id | full_name | enrollment_status | current_gpa | cumulative_gpa | semester_hours_earned | degree_program | major_declared | semester_of_enrollment | compliance_coordinator_id | certifying_officer_id | head_coach_id | term_id | degree_program_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | full-time | 11.95 | 11.95 | 19 | baseline-degree-13 | true | 10 | 1 | 100 | 1 | model_delegation_child0 | 1 |
| 25388256 | Account Name | part-time | 15.90 | 15.90 | 25 | pilot-degree-14 | false | 17 | 2 | 101 | 2 | 2986222 | 2 |
| id_16 | Saipan International Airport | inactive | 19.85 | 19.85 | 31 | extended-degree-15 | true | 24 | 3 | 102 | 3 | id_26 | 3 |
| gd_taxc_2211 | Norma Fisher | full-time | 23.80 | 23.80 | 37 | integrated-degree-16 | false | 31 | 4 | 103 | 4 | 5006436 | 4 |

The `student_athletes` table is the primary entity. Its `student_id` column serves as the surrogate key, taking values such as `392507` for Theodore Mcgrath and `25388256` for Account Name. The `full_name` column carries the athlete's name, while `enrollment_status` constrains the record to one of three states. The GPA columns (`current_gpa` and `cumulative_gpa`) are numerically identical in the sample data, suggesting they are maintained in lockstep. The `semester_hours_earned` column tracks academic progress, and the `degree_program` and `major_declared` columns store textual identifiers like `baseline-degree-13` and `pilot-degree-14`. The boolean `major_declared` flag indicates whether the student has committed to a field of study. The foreign-key columns `compliance_coordinator_id`, `certifying_officer_id`, `head_coach_id`, `term_id`, and `degree_program_id` each point to their respective dimension tables, ensuring referential integrity.

**Table `compliance_coordinators`**

| id | employee_id | full_name | department | contact_email | last_audit_date | head_coach_id |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | adaptive-departme-89 | Christopher Wilson | 2023-10-23 | 1 |
| 2 | Tasha Rodriguez | Account Name | distributed-departme-90 | Charles Larsen | 2024-03-07 | 2 |
| 3 | Theodore Mcgrath | Saipan International Airport | baseline-departme-91 | Mary Alvarez | 2025-08-18 | 3 |
| 4 | Peter Mcdowell | Norma Fisher | pilot-departme-92 | April Snyder | 2022-01-02 | 4 |

The `compliance_coordinators` table defines the administrative role responsible for monitoring each student-athlete's regulatory compliance. Its primary key `id` (values 1 through 4) maps to an `employee_id` (e.g., `Norma Fisher`), a `full_name` (e.g., `Theodore Mcgrath`), a `department` (e.g., `adaptive-departme-89`), and a `contact_email` (e.g., `Christopher Wilson`). The `last_audit_date` column records the most recent compliance audit, with dates spanning from `2022-01-02` to `2025-08-18`. A `head_coach_id` foreign key links each coordinator to a head coach, establishing a bidirectional relationship that is also captured in the `coaches_athletes` junction table.

**Table `certifying_officers`**

| id | employee_id | full_name | office | contact_email | head_coach_id | student_athlete_student_id |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | legacy-office-55 | Christopher Wilson | 1 | 392507 |
| 101 | Tasha Rodriguez | Account Name | compact-office-56 | Charles Larsen | 2 | 25388256 |
| 102 | Theodore Mcgrath | Saipan International Airport | composite-office-57 | Mary Alvarez | 3 | id_16 |
| 103 | Peter Mcdowell | Norma Fisher | primary-office-58 | April Snyder | 4 | gd_taxc_2211 |

Certifying officers serve as the academic authority that validates each student-athlete's eligibility. The `certifying_officers` table uses `id` as its primary key (values 100 through 103), with `employee_id` and `full_name` columns carrying names such as `Norma Fisher` and `Tasha Rodriguez`. The `office` column identifies the administrative office (e.g., `legacy-office-55`, `compact-office-56`), and `contact_email` provides reachability. The `head_coach_id` foreign key ties each officer to a head coach, while the `student_athlete_student_id` column directly references the `student_id` in `student_athletes`, creating a one-to-one linkage between officer and athlete in the sample data.

**Table `head_coaches`**

| id | employee_id | full_name | sport | team_name | contact_email | compliance_coordinator_id | certifying_officer_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | pilot-sport-92 | Composite Model | Christopher Wilson | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Tasha Rodriguez | Account Name | extended-sport-93 | Compact Cluster A | Charles Larsen | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Theodore Mcgrath | Saipan International Airport | integrated-sport-94 | Legacy Review | Mary Alvarez | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Peter Mcdowell | Norma Fisher | seasonal-sport-95 | Regional Initiative | April Snyder | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Head coaches anchor the athletic side of the compliance chain. The `head_coaches` table uses `id` as its primary key (1 through 4), with `employee_id` and `full_name` columns (e.g., `Norma Fisher`, `Theodore Mcgrath`). The `sport` column identifies the sport (e.g., `pilot-sport-92`, `extended-sport-93`), and `team_name` provides the team designation (e.g., `Composite Model`, `Compact Cluster A`). The `contact_email` column stores reachability information. Two foreign keys — `compliance_coordinator_id` and `certifying_officer_id` — link each coach to their supporting administrative roles, creating a triangular relationship among coach, coordinator, and officer. The `created_at` and `updated_at` timestamp columns record the lifecycle of each coach record.

**Table `academic_terms`**

| term_id | term_name | start_date | end_date | semester_hours_required | term_type | credit_hour_requirement_id |
|---|---|---|---|---|---|---|
| model_delegation_child0 | Distributed Survey | 2022-09-05 | 2022-09-01 | 39 | fall | 1 |
| 2986222 | Adaptive Corridor D | 2023-02-16 | 2023-02-12 | 48 | spring | 2 |
| id_26 | Primary Series | 2024-07-27 | 2024-07-23 | 57 | summer | 3 |
| 5006436 | Composite Assessment | 2025-12-11 | 2025-12-07 | 66 | winter | 4 |

Academic terms define the temporal context in which student-athletes pursue their degrees. The `academic_terms` table uses `term_id` as its primary key, with values such as `model_delegation_child0`, `2986222`, `id_26`, and `5006436`. The `term_name` column provides a human-readable label (e.g., `Distributed Survey`, `Adaptive Corridor D`), while `start_date` and `end_date` delimit the term's duration. The `semester_hours_required` column specifies the credit-hour threshold for the term (values 39, 48, 57, 66), and `term_type` classifies the term as `fall`, `spring`, `summer`, or `winter`. A `credit_hour_requirement_id` foreign key links each term to its associated credit-hour requirement.

**Table `credit_hour_requirements`**

| credit_hour_requirement_id | requirement_id | credit_hours_required | requirement_type | deadline_date | status | certifying_officer_id | compliance_coordinator_id | term_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 778568 | 15 | full-time | 2024-11-24 | pending | 100 | 1 | model_delegation_child0 |
| 2 | lu_tax_code_template_b_VB-EC-0 | 25 | six-credit | 2025-04-08 | met | 101 | 2 | 2986222 |
| 3 | 99901 | 35 | cumulative | 2022-09-19 | not-met | 102 | 3 | id_26 |
| 4 | 5917277 | 45 | percentage-of-degree | 2023-02-03 | pending | 103 | 4 | 5006436 |

Credit-hour requirements encode the academic standards that student-athletes must satisfy. The `credit_hour_requirements` table uses `credit_hour_requirement_id` as its primary key (values 1 through 4), with a `requirement_id` column carrying identifiers such as `778568` and `lu_tax_code_template_b_VB-EC-0`. The `credit_hours_required` column specifies the numeric threshold (15, 25, 35, 45), and `requirement_type` classifies the requirement as `full-time`, `six-credit`, `cumulative`, or `percentage-of-degree`. The `deadline_date` column sets the compliance deadline, while `status` tracks whether the requirement is `pending`, `met`, or `not-met`. Foreign keys to `certifying_officer_id`, `compliance_coordinator_id`, and `term_id` bind each requirement to the relevant administrative roles and academic term.

**Table `degree_programs`**

| degree_program_id | program_id | program_name | total_credits_required | major_required | declaration_deadline |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2 | false | 2024-03-27 |
| 2 | 2986219 | Pilot Initiative A | 5 | true | 2025-08-11 |
| 3 | 1186079 | Baseline Model | 2 | false | 2022-01-22 |
| 4 | 1562855 | Distributed Cluster | 20 | true | 2023-06-06 |

Degree programs represent the academic pathways available to student-athletes. The `degree_programs` table uses `degree_program_id` as its primary key (values 1 through 4), with columns for `program_name`, `department`, `degree_level`, `total_credit_hours`, `start_date`, `end_date`, and `status`. The `program_name` column carries labels such as `baseline-degree-13` and `pilot-degree-14`, while `department` identifies the academic department (e.g., `baseline-departme-91`, `pilot-departme-92`). The `degree_level` column classifies the program as `bachelor`, `master`, or `doctorate`, and `total_credit_hours` specifies the credit-hour completion target (120, 150, 180). The `status` column indicates whether the program is `active` or `inactive`.

The relational schema extends beyond these seven base tables through a set of junction tables that resolve many-to-many relationships. The `coordinators_athletes` table links compliance coordinators to student-athletes, the `coordinators_requirements` table links coordinators to credit-hour requirements, and the `officers_requirements` table links certifying officers to requirements. The `coaches_athletes` table connects head coaches to athletes, while `terms_athletes` links academic terms to athletes. The `requirements_athletes` table binds credit-hour requirements to athletes, and `programs_athletes` connects degree programs to athletes. Finally, `programs_requirements` links degree programs to credit-hour requirements, completing the web of cross-references.

**Table `coordinators_athletes`**

| compliance_coordinator_id | student_athlete_student_id |
|---|---|
| 1 | 392507 |
| 1 | 25388256 |
| 2 | 25388256 |
| 2 | id_16 |
| 3 | id_16 |
| 3 | gd_taxc_2211 |
| 4 | gd_taxc_2211 |
| 4 | 392507 |
**Table `coordinators_requirements`**

| compliance_coordinator_id | credit_hour_requirement_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
**Table `officers_requirements`**

| certifying_officer_id | credit_hour_requirement_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `coaches_athletes`**

| head_coach_id | student_athlete_student_id |
|---|---|
| 1 | 392507 |
| 1 | 25388256 |
| 2 | 25388256 |
| 2 | id_16 |
| 3 | id_16 |
| 3 | gd_taxc_2211 |
| 4 | gd_taxc_2211 |
| 4 | 392507 |
**Table `terms_athletes`**

| term_id | student_athlete_student_id |
|---|---|
| model_delegation_child0 | 392507 |
| model_delegation_child0 | 25388256 |
| 2986222 | 25388256 |
| 2986222 | id_16 |
| id_26 | id_16 |
| id_26 | gd_taxc_2211 |
| 5006436 | gd_taxc_2211 |
| 5006436 | 392507 |
**Table `requirements_athletes`**

| credit_hour_requirement_id | student_athlete_student_id |
|---|---|
| 1 | 392507 |
| 1 | 25388256 |
| 2 | 25388256 |
| 2 | id_16 |
| 3 | id_16 |
| 3 | gd_taxc_2211 |
| 4 | gd_taxc_2211 |
| 4 | 392507 |
**Table `programs_athletes`**

| degree_program_id | student_athlete_student_id |
|---|---|
| 1 | 392507 |
| 1 | 25388256 |
| 2 | 25388256 |
| 2 | id_16 |
| 3 | id_16 |
| 3 | gd_taxc_2211 |
| 4 | gd_taxc_2211 |
| 4 | 392507 |
**Table `programs_requirements`**

| degree_program_id | credit_hour_requirement_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

These junction tables each contain pairs of foreign keys that reference the primary keys of the tables they connect. For example, `coordinators_athletes` contains `coordinator_id` and `student_id` columns, enabling a single coordinator to be associated with multiple athletes and vice versa. The junction tables are the materialization of the ontology's many-to-many relationships, transforming what would be ambiguous cardinality in the conceptual model into precise, queryable relational structure.

## Materialized Views: Reconstructing Domain Facts

The normalized base tables are assembled into a suite of views that answer specific domain questions by joining the relevant entities. Each view is a named query that reconstructs a domain fact from the normalized tables, presenting the data in a form that aligns with how administrators actually reason about compliance.

**View `v_student_athlete_compliance_coordinator`**

```sql
CREATE VIEW v_student_athlete_compliance_coordinator AS
SELECT a.student_id, a.full_name, a.enrollment_status, a.current_gpa, b.id AS coordinator_id, b.employee_id AS coordinator_employee_id, b.full_name AS coordinator_full_name
FROM student_athletes a JOIN compliance_coordinators b ON a.compliance_coordinator_id = b.id;
```

| student_id | full_name | enrollment_status | current_gpa | coordinator_id | coordinator_employee_id | coordinator_full_name |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | full-time | 11.95 | 1 | Norma Fisher | Theodore Mcgrath |
| 25388256 | Account Name | part-time | 15.90 | 2 | Tasha Rodriguez | Account Name |
| id_16 | Saipan International Airport | inactive | 19.85 | 3 | Theodore Mcgrath | Saipan International Airport |
| gd_taxc_2211 | Norma Fisher | full-time | 23.80 | 4 | Peter Mcdowell | Norma Fisher |

The view `v_student_athlete_compliance_coordinator` answers the question: "Which compliance coordinator is assigned to each student-athlete?" It joins `student_athletes` to `compliance_coordinators` on the coordinator foreign key, producing rows that pair a student's `student_id` and `full_name` with the coordinator's `id`, `employee_id`, `full_name`, `department`, and `contact_email`. For the student-athlete with `student_id` 392507 (Theodore Mcgrath), the view reveals that coordinator `id` 1 (Norma Fisher, department `adaptive-departme-89`, email `Christopher Wilson`) is responsible for their compliance monitoring.

**View `v_student_athlete_certifying_officer`**

```sql
CREATE VIEW v_student_athlete_certifying_officer AS
SELECT a.student_id, a.full_name, a.enrollment_status, a.current_gpa, b.id AS officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM student_athletes a JOIN certifying_officers b ON a.certifying_officer_id = b.id;
```

| student_id | full_name | enrollment_status | current_gpa | officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | full-time | 11.95 | 100 | Norma Fisher | Theodore Mcgrath |
| 25388256 | Account Name | part-time | 15.90 | 101 | Tasha Rodriguez | Account Name |
| id_16 | Saipan International Airport | inactive | 19.85 | 102 | Theodore Mcgrath | Saipan International Airport |
| gd_taxc_2211 | Norma Fisher | full-time | 23.80 | 103 | Peter Mcdowell | Norma Fisher |

The view `v_student_athlete_certifying_officer` reconstructs the officer-athlete linkage. It joins `student_athletes` to `certifying_officers`, pairing each athlete with their certifying officer's `id`, `employee_id`, `full_name`, `office`, and `contact_email`. Student-athlete `25388256` (Account Name) is certified by officer `101` (Tasha Rodriguez, office `compact-office-56`, email `Charles Larsen`), establishing the chain of academic eligibility validation.

**View `v_student_athlete_head_coach`**

```sql
CREATE VIEW v_student_athlete_head_coach AS
SELECT a.student_id, a.full_name, a.enrollment_status, a.current_gpa, b.id AS coach_id, b.employee_id AS coach_employee_id, b.full_name AS coach_full_name
FROM student_athletes a JOIN head_coaches b ON a.head_coach_id = b.id;
```

| student_id | full_name | enrollment_status | current_gpa | coach_id | coach_employee_id | coach_full_name |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | full-time | 11.95 | 1 | Norma Fisher | Theodore Mcgrath |
| 25388256 | Account Name | part-time | 15.90 | 2 | Tasha Rodriguez | Account Name |
| id_16 | Saipan International Airport | inactive | 19.85 | 3 | Theodore Mcgrath | Saipan International Airport |
| gd_taxc_2211 | Norma Fisher | full-time | 23.80 | 4 | Peter Mcdowell | Norma Fisher |

The view `v_student_athlete_head_coach` joins `student_athletes` to `head_coaches`, answering which head coach oversees each athlete. It surfaces the coach's `id`, `employee_id`, `full_name`, `sport`, `team_name`, and `contact_email`. Student-athlete `id_16` (Saipan International Airport) is associated with head coach `3` (Theodore Mcgrath, sport `integrated-sport-94`, team `Legacy Review`), linking the athlete to their athletic program.

**View `v_student_athlete_academic_term`**

```sql
CREATE VIEW v_student_athlete_academic_term AS
SELECT a.student_id, a.full_name, a.enrollment_status, a.current_gpa, b.term_id AS term_term_id, b.term_name AS term_term_name, b.start_date AS term_start_date
FROM student_athletes a JOIN academic_terms b ON a.term_id = b.term_id;
```

| student_id | full_name | enrollment_status | current_gpa | term_term_id | term_term_name | term_start_date |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | full-time | 11.95 | model_delegation_child0 | Distributed Survey | 2022-09-05 |
| 25388256 | Account Name | part-time | 15.90 | 2986222 | Adaptive Corridor D | 2023-02-16 |
| id_16 | Saipan International Airport | inactive | 19.85 | id_26 | Primary Series | 2024-07-27 |
| gd_taxc_2211 | Norma Fisher | full-time | 23.80 | 5006436 | Composite Assessment | 2025-12-11 |

The view `v_student_athlete_academic_term` joins `student_athletes` to `academic_terms`, revealing the temporal context of each athlete's enrollment. It presents the athlete's `student_id` alongside the term's `term_id`, `term_name`, `start_date`, `end_date`, `semester_hours_required`, and `term_type`. Student-athlete `gd_taxc_2211` (Norma Fisher) is enrolled in term `5006436` (Composite Assessment, winter term, requiring 66 semester hours, running from `2025-12-11` to `2025-12-07`).

**View `v_student_athlete_degree_program`**

```sql
CREATE VIEW v_student_athlete_degree_program AS
SELECT a.student_id, a.full_name, a.enrollment_status, a.current_gpa, b.degree_program_id AS program_degree_program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM student_athletes a JOIN degree_programs b ON a.degree_program_id = b.degree_program_id;
```

| student_id | full_name | enrollment_status | current_gpa | program_degree_program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | full-time | 11.95 | 1 | 103176 | Extended Review |
| 25388256 | Account Name | part-time | 15.90 | 2 | 2986219 | Pilot Initiative A |
| id_16 | Saipan International Airport | inactive | 19.85 | 3 | 1186079 | Baseline Model |
| gd_taxc_2211 | Norma Fisher | full-time | 23.80 | 4 | 1562855 | Distributed Cluster |

The view `v_student_athlete_degree_program` joins `student_athletes` to `degree_programs`, connecting each athlete to their academic pathway. It surfaces the athlete's `student_id` and `full_name` alongside the program's `degree_program_id`, `program_name`, `department`, `degree_level`, `total_credit_hours`, and `status`. Student-athlete `392507` (Theodore Mcgrath) is pursuing `degree_program_id` 1, which carries the program name `baseline-degree-13` and is classified as a `bachelor`-level program.

The remaining views pivot the perspective, presenting the data from the standpoint of each supporting role rather than the student-athlete. These role-centric views answer questions such as "Which athletes does this coordinator manage?" and "Which requirements does this officer certify?"

**View `v_compliance_coordinator_student_athlete_detail`**

```sql
CREATE VIEW v_compliance_coordinator_student_athlete_detail AS
SELECT a.id, a.employee_id, a.full_name, b.student_id AS athlete_student_id, b.full_name AS athlete_full_name, b.enrollment_status AS athlete_enrollment_status
FROM compliance_coordinators a
  JOIN coordinators_athletes j ON j.compliance_coordinator_id = a.id
  JOIN student_athletes b ON b.student_id = j.student_athlete_student_id;
```

| id | employee_id | full_name | athlete_student_id | athlete_full_name | athlete_enrollment_status |
|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | 392507 | Theodore Mcgrath | full-time |
| 1 | Norma Fisher | Theodore Mcgrath | 25388256 | Account Name | part-time |
| 2 | Tasha Rodriguez | Account Name | 25388256 | Account Name | part-time |
| 2 | Tasha Rodriguez | Account Name | id_16 | Saipan International Airport | inactive |
| 3 | Theodore Mcgrath | Saipan International Airport | id_16 | Saipan International Airport | inactive |
| 3 | Theodore Mcgrath | Saipan International Airport | gd_taxc_2211 | Norma Fisher | full-time |
| 4 | Peter Mcdowell | Norma Fisher | gd_taxc_2211 | Norma Fisher | full-time |
| 4 | Peter Mcdowell | Norma Fisher | 392507 | Theodore Mcgrath | full-time |

The view `v_compliance_coordinator_student_athlete_detail` inverts the coordinator-athlete relationship. It joins `compliance_coordinators` to `student_athletes`, answering: "Which student-athletes fall under this coordinator's purview?" Each row pairs a coordinator's `id`, `employee_id`, `full_name`, `department`, and `contact_email` with the athlete's `student_id`, `full_name`, `enrollment_status`, `current_gpa`, `cumulative_gpa`, and `semester_hours_earned`. Coordinator `id` 1 (Norma Fisher, department `adaptive-departme-89`) manages student-athlete `392507` (Theodore Mcgrath), who holds a `current_gpa` of 11.95 and has earned 19 semester hours.

**View `v_compliance_coordinator_credit_hour_requirement_detail`**

```sql
CREATE VIEW v_compliance_coordinator_credit_hour_requirement_detail AS
SELECT a.id, a.employee_id, a.full_name, b.credit_hour_requirement_id AS requirement_credit_hour_requirement_id, b.requirement_id AS requirement_requirement_id, b.credit_hours_required AS requirement_credit_hours_required
FROM compliance_coordinators a
  JOIN coordinators_requirements j ON j.compliance_coordinator_id = a.id
  JOIN credit_hour_requirements b ON b.credit_hour_requirement_id = j.credit_hour_requirement_id;
```

| id | employee_id | full_name | requirement_credit_hour_requirement_id | requirement_requirement_id | requirement_credit_hours_required |
|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | 1 | 778568 | 15 |
| 1 | Norma Fisher | Theodore Mcgrath | 2 | lu_tax_code_template_b_VB-EC-0 | 25 |
| 2 | Tasha Rodriguez | Account Name | 2 | lu_tax_code_template_b_VB-EC-0 | 25 |
| 2 | Tasha Rodriguez | Account Name | 3 | 99901 | 35 |
| 3 | Theodore Mcgrath | Saipan International Airport | 3 | 99901 | 35 |
| 3 | Theodore Mcgrath | Saipan International Airport | 4 | 5917277 | 45 |
| 4 | Peter Mcdowell | Norma Fisher | 4 | 5917277 | 45 |
| 4 | Peter Mcdowell | Norma Fisher | 1 | 778568 | 15 |

The view `v_compliance_coordinator_credit_hour_requirement_detail` joins `compliance_coordinators` to `credit_hour_requirements`, answering: "Which credit-hour requirements does this coordinator oversee?" It presents the coordinator's identifying columns alongside the requirement's `credit_hour_requirement_id`, `requirement_id`, `credit_hours_required`, `requirement_type`, `deadline_date`, and `status`. Coordinator `id` 2 (Tasha Rodriguez) is linked to requirement `2` (lu_tax_code_template_b_VB-EC-0, requiring 25 credit hours, type `six-credit`, status `met`).

**View `v_compliance_coordinator_head_coach`**

```sql
CREATE VIEW v_compliance_coordinator_head_coach AS
SELECT a.id, a.employee_id, a.full_name, a.department, b.id AS coach_id, b.employee_id AS coach_employee_id, b.full_name AS coach_full_name
FROM compliance_coordinators a JOIN head_coaches b ON a.head_coach_id = b.id;
```

| id | employee_id | full_name | department | coach_id | coach_employee_id | coach_full_name |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | adaptive-departme-89 | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | Tasha Rodriguez | Account Name | distributed-departme-90 | 2 | Tasha Rodriguez | Account Name |
| 3 | Theodore Mcgrath | Saipan International Airport | baseline-departme-91 | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | Peter Mcdowell | Norma Fisher | pilot-departme-92 | 4 | Peter Mcdowell | Norma Fisher |

The view `v_compliance_coordinator_head_coach` joins `compliance_coordinators` to `head_coaches`, revealing the coach-coordinator pairing. It surfaces the coordinator's `id`, `employee_id`, `full_name`, `department`, and `contact_email` alongside the coach's `id`, `employee_id`, `full_name`, `sport`, `team_name`, and `contact_email`. Coordinator `id` 3 (Theodore Mcgrath, department `baseline-departme-91`) is paired with head coach `3` (Theodore Mcgrath, sport `integrated-sport-94`, team `Legacy Review`).

**View `v_certifying_officer_credit_hour_requirement_detail`**

```sql
CREATE VIEW v_certifying_officer_credit_hour_requirement_detail AS
SELECT a.id, a.employee_id, a.full_name, b.credit_hour_requirement_id AS requirement_credit_hour_requirement_id, b.requirement_id AS requirement_requirement_id, b.credit_hours_required AS requirement_credit_hours_required
FROM certifying_officers a
  JOIN officers_requirements j ON j.certifying_officer_id = a.id
  JOIN credit_hour_requirements b ON b.credit_hour_requirement_id = j.credit_hour_requirement_id;
```

| id | employee_id | full_name | requirement_credit_hour_requirement_id | requirement_requirement_id | requirement_credit_hours_required |
|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | 1 | 778568 | 15 |
| 100 | Norma Fisher | Theodore Mcgrath | 2 | lu_tax_code_template_b_VB-EC-0 | 25 |
| 101 | Tasha Rodriguez | Account Name | 2 | lu_tax_code_template_b_VB-EC-0 | 25 |
| 101 | Tasha Rodriguez | Account Name | 3 | 99901 | 35 |
| 102 | Theodore Mcgrath | Saipan International Airport | 3 | 99901 | 35 |
| 102 | Theodore Mcgrath | Saipan International Airport | 4 | 5917277 | 45 |
| 103 | Peter Mcdowell | Norma Fisher | 4 | 5917277 | 45 |
| 103 | Peter Mcdowell | Norma Fisher | 1 | 778568 | 15 |

The view `v_certifying_officer_credit_hour_requirement_detail` joins `certifying_officers` to `credit_hour_requirements`, answering: "Which credit-hour requirements does this officer certify?" It presents the officer's `id`, `employee_id`, `full_name`, `office`, and `contact_email` alongside the requirement's `credit_hour_requirement_id`, `requirement_id`, `credit_hours_required`, `requirement_type`, `deadline_date`, and `status`. Officer `100` (Norma Fisher, office `legacy-office-55`) certifies requirement `1` (778568, requiring 15 credit hours, type `full-time`, status `pending`).

**View `v_certifying_officer_head_coach`**

```sql
CREATE VIEW v_certifying_officer_head_coach AS
SELECT a.id, a.employee_id, a.full_name, a.office, b.id AS coach_id, b.employee_id AS coach_employee_id, b.full_name AS coach_full_name
FROM certifying_officers a JOIN head_coaches b ON a.head_coach_id = b.id;
```

| id | employee_id | full_name | office | coach_id | coach_employee_id | coach_full_name |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | legacy-office-55 | 1 | Norma Fisher | Theodore Mcgrath |
| 101 | Tasha Rodriguez | Account Name | compact-office-56 | 2 | Tasha Rodriguez | Account Name |
| 102 | Theodore Mcgrath | Saipan International Airport | composite-office-57 | 3 | Theodore Mcgrath | Saipan International Airport |
| 103 | Peter Mcdowell | Norma Fisher | primary-office-58 | 4 | Peter Mcdowell | Norma Fisher |

The view `v_certifying_officer_head_coach` joins `certifying_officers` to `head_coaches`, revealing the officer-coach linkage. It presents the officer's identifying columns alongside the coach's `id`, `employee_id`, `full_name`, `sport`, `team_name`, and `contact_email`. Officer `101` (Tasha Rodriguez, office `compact-office-56`) is linked to head coach `2` (Tasha Rodriguez, sport `extended-sport-93`, team `Compact Cluster A`).

**View `v_certifying_officer_student_athlete`**

```sql
CREATE VIEW v_certifying_officer_student_athlete AS
SELECT a.id, a.employee_id, a.full_name, a.office, b.student_id AS athlete_student_id, b.full_name AS athlete_full_name, b.enrollment_status AS athlete_enrollment_status
FROM certifying_officers a JOIN student_athletes b ON a.student_athlete_student_id = b.student_id;
```

| id | employee_id | full_name | office | athlete_student_id | athlete_full_name | athlete_enrollment_status |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | legacy-office-55 | 392507 | Theodore Mcgrath | full-time |
| 101 | Tasha Rodriguez | Account Name | compact-office-56 | 25388256 | Account Name | part-time |
| 102 | Theodore Mcgrath | Saipan International Airport | composite-office-57 | id_16 | Saipan International Airport | inactive |
| 103 | Peter Mcdowell | Norma Fisher | primary-office-58 | gd_taxc_2211 | Norma Fisher | full-time |

The view `v_certifying_officer_student_athlete` joins `certifying_officers` to `student_athletes`, answering: "Which student-athletes does this officer certify?" It presents the officer's `id`, `employee_id`, `full_name`, `office`, and `contact_email` alongside the athlete's `student_id`, `full_name`, `enrollment_status`, `current_gpa`, `cumulative_gpa`, and `semester_hours_earned`. Officer `102` (Theodore Mcgrath, office `composite-office-57`) certifies student-athlete `id_16` (Saipan International Airport), who holds a `current_gpa` of 19.85 and has earned 31 semester hours.

**View `v_head_coach_student_athlete_detail`**

```sql
CREATE VIEW v_head_coach_student_athlete_detail AS
SELECT a.id, a.employee_id, a.full_name, b.student_id AS athlete_student_id, b.full_name AS athlete_full_name, b.enrollment_status AS athlete_enrollment_status
FROM head_coaches a
  JOIN coaches_athletes j ON j.head_coach_id = a.id
  JOIN student_athletes b ON b.student_id = j.student_athlete_student_id;
```

| id | employee_id | full_name | athlete_student_id | athlete_full_name | athlete_enrollment_status |
|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | 392507 | Theodore Mcgrath | full-time |
| 1 | Norma Fisher | Theodore Mcgrath | 25388256 | Account Name | part-time |
| 2 | Tasha Rodriguez | Account Name | 25388256 | Account Name | part-time |
| 2 | Tasha Rodriguez | Account Name | id_16 | Saipan International Airport | inactive |
| 3 | Theodore Mcgrath | Saipan International Airport | id_16 | Saipan International Airport | inactive |
| 3 | Theodore Mcgrath | Saipan International Airport | gd_taxc_2211 | Norma Fisher | full-time |
| 4 | Peter Mcdowell | Norma Fisher | gd_taxc_2211 | Norma Fisher | full-time |
| 4 | Peter Mcdowell | Norma Fisher | 392507 | Theodore Mcgrath | full-time |

The view `v_head_coach_student_athlete_detail` joins `head_coaches` to `student_athletes`, answering: "Which student-athletes does this coach oversee?" It presents the coach's `id`, `employee_id`, `full_name`, `sport`, `team_name`, and `contact_email` alongside the athlete's `student_id`, `full_name`, `enrollment_status`, `current_gpa`, `cumulative_gpa`, and `semester_hours_earned`. Head coach `4` (Peter Mcdowell, sport `seasonal-sport-95`, team `Regional Initiative`) oversees student-athlete `gd_taxc_2211` (Norma Fisher), who holds a `current_gpa` of 23.80 and has earned 37 semester hours.

**View `v_head_coach_compliance_coordinator`**

```sql
CREATE VIEW v_head_coach_compliance_coordinator AS
SELECT a.id, a.employee_id, a.full_name, a.sport, b.id AS coordinator_id, b.employee_id AS coordinator_employee_id, b.full_name AS coordinator_full_name
FROM head_coaches a JOIN compliance_coordinators b ON a.compliance_coordinator_id = b.id;
```

| id | employee_id | full_name | sport | coordinator_id | coordinator_employee_id | coordinator_full_name |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | pilot-sport-92 | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | Tasha Rodriguez | Account Name | extended-sport-93 | 2 | Tasha Rodriguez | Account Name |
| 3 | Theodore Mcgrath | Saipan International Airport | integrated-sport-94 | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | Peter Mcdowell | Norma Fisher | seasonal-sport-95 | 4 | Peter Mcdowell | Norma Fisher |

The view `v_head_coach_compliance_coordinator` joins `head_coaches` to `compliance_coordinators`, revealing the coach-coordinator pairing from the coach's perspective. It presents the coach's `id`, `employee_id`, `full_name`, `sport`, `team_name`, and `contact_email` alongside the coordinator's `id`, `employee_id`, `full_name`, `department`, and `contact_email`. Head coach `1` (Norma Fisher, sport `pilot-sport-92`, team `Composite Model`) is paired with coordinator `1` (Norma Fisher, department `adaptive-departme-89`).

**View `v_head_coach_certifying_officer`**

```sql
CREATE VIEW v_head_coach_certifying_officer AS
SELECT a.id, a.employee_id, a.full_name, a.sport, b.id AS officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM head_coaches a JOIN certifying_officers b ON a.certifying_officer_id = b.id;
```

| id | employee_id | full_name | sport | officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | pilot-sport-92 | 100 | Norma Fisher | Theodore Mcgrath |
| 2 | Tasha Rodriguez | Account Name | extended-sport-93 | 101 | Tasha Rodriguez | Account Name |
| 3 | Theodore Mcgrath | Saipan International Airport | integrated-sport-94 | 102 | Theodore Mcgrath | Saipan International Airport |
| 4 | Peter Mcdowell | Norma Fisher | seasonal-sport-95 | 103 | Peter Mcdowell | Norma Fisher |

The view `v_head_coach_certifying_officer` joins `head_coaches` to `certifying_officers`, answering: "Which certifying officer supports this coach?" It presents the coach's identifying columns alongside the officer's `id`, `employee_id`, `full_name`, `office`, and `contact_email`. Head coach `2` (Tasha Rodriguez, sport `extended-sport-93`, team `Compact Cluster A`) is supported by officer `101` (Tasha Rodriguez, office `compact-office-56`).

**View `v_academic_term_student_athlete_detail`**

```sql
CREATE VIEW v_academic_term_student_athlete_detail AS
SELECT a.term_id, a.term_name, a.start_date, b.student_id AS athlete_student_id, b.full_name AS athlete_full_name, b.enrollment_status AS athlete_enrollment_status
FROM academic_terms a
  JOIN terms_athletes j ON j.term_id = a.term_id
  JOIN student_athletes b ON b.student_id = j.student_athlete_student_id;
```

| term_id | term_name | start_date | athlete_student_id | athlete_full_name | athlete_enrollment_status |
|---|---|---|---|---|---|
| model_delegation_child0 | Distributed Survey | 2022-09-05 | 392507 | Theodore Mcgrath | full-time |
| model_delegation_child0 | Distributed Survey | 2022-09-05 | 25388256 | Account Name | part-time |
| 2986222 | Adaptive Corridor D | 2023-02-16 | 25388256 | Account Name | part-time |
| 2986222 | Adaptive Corridor D | 2023-02-16 | id_16 | Saipan International Airport | inactive |
| id_26 | Primary Series | 2024-07-27 | id_16 | Saipan International Airport | inactive |
| id_26 | Primary Series | 2024-07-27 | gd_taxc_2211 | Norma Fisher | full-time |
| 5006436 | Composite Assessment | 2025-12-11 | gd_taxc_2211 | Norma Fisher | full-time |
| 5006436 | Composite Assessment | 2025-12-11 | 392507 | Theodore Mcgrath | full-time |

The view `v_academic_term_student_athlete_detail` joins `academic_terms` to `student_athletes`, answering: "Which student-athletes are enrolled in this term?" It presents the term's `term_id`, `term_name`, `start_date`, `end_date`, `semester_hours_required`, and `term_type` alongside the athlete's `student_id`, `full_name`, `enrollment_status`, `current_gpa`, `cumulative_gpa`, and `semester_hours_earned`. Term `model_delegation_child0` (Distributed Survey, fall term, requiring 39 semester hours) contains student-athlete `392507` (Theodore Mcgrath).

**View `v_academic_term_credit_hour_requirement`**

```sql
CREATE VIEW v_academic_term_credit_hour_requirement AS
SELECT a.term_id, a.term_name, a.start_date, a.end_date, b.credit_hour_requirement_id AS requirement_credit_hour_requirement_id, b.requirement_id AS requirement_requirement_id, b.credit_hours_required AS requirement_credit_hours_required
FROM academic_terms a JOIN credit_hour_requirements b ON a.credit_hour_requirement_id = b.credit_hour_requirement_id;
```

| term_id | term_name | start_date | end_date | requirement_credit_hour_requirement_id | requirement_requirement_id | requirement_credit_hours_required |
|---|---|---|---|---|---|---|
| model_delegation_child0 | Distributed Survey | 2022-09-05 | 2022-09-01 | 1 | 778568 | 15 |
| 2986222 | Adaptive Corridor D | 2023-02-16 | 2023-02-12 | 2 | lu_tax_code_template_b_VB-EC-0 | 25 |
| id_26 | Primary Series | 2024-07-27 | 2024-07-23 | 3 | 99901 | 35 |
| 5006436 | Composite Assessment | 2025-12-11 | 2025-12-07 | 4 | 5917277 | 45 |

The view `v_academic_term_credit_hour_requirement` joins `academic_terms` to `credit_hour_requirements`, answering: "Which credit-hour requirements are associated with this term?" It presents the term's `term_id`, `term_name`, `start_date`, `end_date`, `semester_hours_required`, and `term_type` alongside the requirement's `credit_hour_requirement_id`, `requirement_id`, `credit_hours_required`, `requirement_type`, `deadline_date`, and `status`. Term `2986222` (Adaptive Corridor D, spring term, requiring 48 semester hours) is associated with requirement `2` (lu_tax_code_template_b_VB-EC-0, requiring 25 credit hours, type `six-credit`, status `met`).

**View `v_credit_hour_requirement_student_athlete_detail`**

```sql
CREATE VIEW v_credit_hour_requirement_student_athlete_detail AS
SELECT a.credit_hour_requirement_id, a.requirement_id, a.credit_hours_required, b.student_id AS athlete_student_id, b.full_name AS athlete_full_name, b.enrollment_status AS athlete_enrollment_status
FROM credit_hour_requirements a
  JOIN requirements_athletes j ON j.credit_hour_requirement_id = a.credit_hour_requirement_id
  JOIN student_athletes b ON b.student_id = j.student_athlete_student_id;
```

| credit_hour_requirement_id | requirement_id | credit_hours_required | athlete_student_id | athlete_full_name | athlete_enrollment_status |
|---|---|---|---|---|---|
| 1 | 778568 | 15 | 392507 | Theodore Mcgrath | full-time |
| 1 | 778568 | 15 | 25388256 | Account Name | part-time |
| 2 | lu_tax_code_template_b_VB-EC-0 | 25 | 25388256 | Account Name | part-time |
| 2 | lu_tax_code_template_b_VB-EC-0 | 25 | id_16 | Saipan International Airport | inactive |
| 3 | 99901 | 35 | id_16 | Saipan International Airport | inactive |
| 3 | 99901 | 35 | gd_taxc_2211 | Norma Fisher | full-time |
| 4 | 5917277 | 45 | gd_taxc_2211 | Norma Fisher | full-time |
| 4 | 5917277 | 45 | 392507 | Theodore Mcgrath | full-time |

The view `v_credit_hour_requirement_student_athlete_detail` joins `credit_hour_requirements` to `student_athletes`, answering: "Which student-athletes are subject to this requirement?" It presents the requirement's `credit_hour_requirement_id`, `requirement_id`, `credit_hours_required`, `requirement_type`, `deadline_date`, and `status` alongside the athlete's `student_id`, `full_name`, `enrollment_status`, `current_gpa`, `cumulative_gpa`, and `semester_hours_earned`. Requirement `3` (99901, requiring 35 credit hours, type `cumulative`, status `not-met`) applies to student-athlete `id_16` (Saipan International Airport).

**View `v_credit_hour_requirement_certifying_officer`**

```sql
CREATE VIEW v_credit_hour_requirement_certifying_officer AS
SELECT a.credit_hour_requirement_id, a.requirement_id, a.credit_hours_required, a.requirement_type, b.id AS officer_id, b.employee_id AS officer_employee_id, b.full_name AS officer_full_name
FROM credit_hour_requirements a JOIN certifying_officers b ON a.certifying_officer_id = b.id;
```

| credit_hour_requirement_id | requirement_id | credit_hours_required | requirement_type | officer_id | officer_employee_id | officer_full_name |
|---|---|---|---|---|---|---|
| 1 | 778568 | 15 | full-time | 100 | Norma Fisher | Theodore Mcgrath |
| 2 | lu_tax_code_template_b_VB-EC-0 | 25 | six-credit | 101 | Tasha Rodriguez | Account Name |
| 3 | 99901 | 35 | cumulative | 102 | Theodore Mcgrath | Saipan International Airport |
| 4 | 5917277 | 45 | percentage-of-degree | 103 | Peter Mcdowell | Norma Fisher |

The view `v_credit_hour_requirement_certifying_officer` joins `credit_hour_requirements` to `certifying_officers`, answering: "Which officer certifies this requirement?" It presents the requirement's identifying columns alongside the officer's `id`, `employee_id`, `full_name`, `office`, and `contact_email`. Requirement `4` (5917277, requiring 45 credit hours, type `percentage-of-degree`, status `pending`) is certified by officer `103` (Peter Mcdowell, office `primary-office-58`).

**View `v_credit_hour_requirement_compliance_coordinator`**

```sql
CREATE VIEW v_credit_hour_requirement_compliance_coordinator AS
SELECT a.credit_hour_requirement_id, a.requirement_id, a.credit_hours_required, a.requirement_type, b.id AS coordinator_id, b.employee_id AS coordinator_employee_id, b.full_name AS coordinator_full_name
FROM credit_hour_requirements a JOIN compliance_coordinators b ON a.compliance_coordinator_id = b.id;
```

| credit_hour_requirement_id | requirement_id | credit_hours_required | requirement_type | coordinator_id | coordinator_employee_id | coordinator_full_name |
|---|---|---|---|---|---|---|
| 1 | 778568 | 15 | full-time | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | lu_tax_code_template_b_VB-EC-0 | 25 | six-credit | 2 | Tasha Rodriguez | Account Name |
| 3 | 99901 | 35 | cumulative | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | 5917277 | 45 | percentage-of-degree | 4 | Peter Mcdowell | Norma Fisher |

The view `v_credit_hour_requirement_compliance_coordinator` joins `credit_hour_requirements` to `compliance_coordinators`, answering: "Which coordinator monitors this requirement?" It presents the requirement's identifying columns alongside the coordinator's `id`, `employee_id`, `full_name`, `department`, and `contact_email`. Requirement `1` (778568, requiring 15 credit hours, type `full-time`, status `pending`) is monitored by coordinator `1` (Norma Fisher, department `adaptive-departme-89`).

**View `v_credit_hour_requirement_academic_term`**

```sql
CREATE VIEW v_credit_hour_requirement_academic_term AS
SELECT a.credit_hour_requirement_id, a.requirement_id, a.credit_hours_required, a.requirement_type, b.term_id AS term_term_id, b.term_name AS term_term_name, b.start_date AS term_start_date
FROM credit_hour_requirements a JOIN academic_terms b ON a.term_id = b.term_id;
```

| credit_hour_requirement_id | requirement_id | credit_hours_required | requirement_type | term_term_id | term_term_name | term_start_date |
|---|---|---|---|---|---|---|
| 1 | 778568 | 15 | full-time | model_delegation_child0 | Distributed Survey | 2022-09-05 |
| 2 | lu_tax_code_template_b_VB-EC-0 | 25 | six-credit | 2986222 | Adaptive Corridor D | 2023-02-16 |
| 3 | 99901 | 35 | cumulative | id_26 | Primary Series | 2024-07-27 |
| 4 | 5917277 | 45 | percentage-of-degree | 5006436 | Composite Assessment | 2025-12-11 |

The view `v_credit_hour_requirement_academic_term` joins `credit_hour_requirements` to `academic_terms`, answering: "In which term does this requirement apply?" It presents the requirement's identifying columns alongside the term's `term_id`, `term_name`, `start_date`, `end_date`, `semester_hours_required`, and `term_type`. Requirement `3` (99901, requiring 35 credit hours, type `cumulative`, status `not-met`) applies in term `id_26` (Primary Series, summer term, requiring 57 semester hours).

**View `v_degree_program_student_athlete_detail`**

```sql
CREATE VIEW v_degree_program_student_athlete_detail AS
SELECT a.degree_program_id, a.program_id, a.program_name, b.student_id AS athlete_student_id, b.full_name AS athlete_full_name, b.enrollment_status AS athlete_enrollment_status
FROM degree_programs a
  JOIN programs_athletes j ON j.degree_program_id = a.degree_program_id
  JOIN student_athletes b ON b.student_id = j.student_athlete_student_id;
```

| degree_program_id | program_id | program_name | athlete_student_id | athlete_full_name | athlete_enrollment_status |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 392507 | Theodore Mcgrath | full-time |
| 1 | 103176 | Extended Review | 25388256 | Account Name | part-time |
| 2 | 2986219 | Pilot Initiative A | 25388256 | Account Name | part-time |
| 2 | 2986219 | Pilot Initiative A | id_16 | Saipan International Airport | inactive |
| 3 | 1186079 | Baseline Model | id_16 | Saipan International Airport | inactive |
| 3 | 1186079 | Baseline Model | gd_taxc_2211 | Norma Fisher | full-time |
| 4 | 1562855 | Distributed Cluster | gd_taxc_2211 | Norma Fisher | full-time |
| 4 | 1562855 | Distributed Cluster | 392507 | Theodore Mcgrath | full-time |

The view `v_degree_program_student_athlete_detail` joins `degree_programs` to `student_athletes`, answering: "Which student-athletes are enrolled in this degree program?" It presents the program's `degree_program_id`, `program_name`, `department`, `degree_level`, `total_credit_hours`, and `status` alongside the athlete's `student_id`, `full_name`, `enrollment_status`, `current_gpa`, `cumulative_gpa`, and `semester_hours_earned`. Program `2` (pilot-degree-14, department `pilot-departme-92`, bachelor level, 150 total credit hours, active) contains student-athlete `25388256` (Account Name).

**View `v_degree_program_credit_hour_requirement_detail`**

```sql
CREATE VIEW v_degree_program_credit_hour_requirement_detail AS
SELECT a.degree_program_id, a.program_id, a.program_name, b.credit_hour_requirement_id AS requirement_credit_hour_requirement_id, b.requirement_id AS requirement_requirement_id, b.credit_hours_required AS requirement_credit_hours_required
FROM degree_programs a
  JOIN programs_requirements j ON j.degree_program_id = a.degree_program_id
  JOIN credit_hour_requirements b ON b.credit_hour_requirement_id = j.credit_hour_requirement_id;
```

| degree_program_id | program_id | program_name | requirement_credit_hour_requirement_id | requirement_requirement_id | requirement_credit_hours_required |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 1 | 778568 | 15 |
| 1 | 103176 | Extended Review | 2 | lu_tax_code_template_b_VB-EC-0 | 25 |
| 2 | 2986219 | Pilot Initiative A | 2 | lu_tax_code_template_b_VB-EC-0 | 25 |
| 2 | 2986219 | Pilot Initiative A | 3 | 99901 | 35 |
| 3 | 1186079 | Baseline Model | 3 | 99901 | 35 |
| 3 | 1186079 | Baseline Model | 4 | 5917277 | 45 |
| 4 | 1562855 | Distributed Cluster | 4 | 5917277 | 45 |
| 4 | 1562855 | Distributed Cluster | 1 | 778568 | 15 |

The view `v_degree_program_credit_hour_requirement_detail` joins `degree_programs` to `credit_hour_requirements`, answering: "Which credit-hour requirements are tied to this degree program?" It presents the program's identifying columns alongside the requirement's `credit_hour_requirement_id`, `requirement_id`, `credit_hours_required`, `requirement_type`, `deadline_date`, and `status`. Program `3` (extended-degree-15, department `baseline-departme-91`, master level, 180 total credit hours, active) is associated with requirement `3` (99901, requiring 35 credit hours, type `cumulative`, status `not-met`).

## Synthesis

The schema models the student-athlete compliance domain as a star of interlocking entities, each anchored by a primary key and connected through foreign keys and junction tables that materialize the ontology's cardinality-bounded relationships. The seven base tables — `student_athletes`, `compliance_coordinators`, `certifying_officers`, `head_coaches`, `academic_terms`, `credit_hour_requirements`, and `degree_programs` — form the dimensional core, while the eight junction tables (`coordinators_athletes`, `coordinators_requirements`, `officers_requirements`, `coaches_athletes`, `terms_athletes`, `requirements_athletes`, `programs_athletes`, `programs_requirements`) resolve the many-to-many relationships that the base tables alone cannot express. The thirty views then reconstruct domain facts from this normalized foundation, each view answering a specific question by joining the relevant tables and presenting the result in a role-aligned perspective. Whether the query originates from the student-athlete's viewpoint (as in `v_student_athlete_compliance_coordinator`) or from the perspective of a supporting role (as in `v_compliance_coordinator_student_athlete_detail`), the join pattern is consistent: the view's FROM clause enumerates the participating tables, the WHERE clause specifies the join predicates on the foreign-key columns, and the SELECT clause projects the columns needed to answer the domain question. The result is a schema that is both rigorously normalized at the storage layer and richly denormalized at the presentation layer, enabling administrators to reason about compliance in the terms of their daily work.