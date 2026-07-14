## Compliance Governance in Collegiate Athletics

Collegiate athletic programs operate under a dense web of academic and regulatory obligations. Student athletes must simultaneously satisfy enrollment thresholds, maintain minimum grade-point averages, and accumulate credit hours within defined academic terms. The infrastructure that tracks these obligations consists of interlocking records: individual athletes, the administrators who monitor their progress, the coaches who oversee their participation, and the policy definitions that establish what counts as compliant. This chapter documents the entities, measurements, and operational relationships that constitute the compliance management domain, drawing on representative records to illustrate how the system functions in practice.

**Table `student_athletes`**

| student_id | full_name | enrollment_status | current_gpa | cumulative_gpa | semester_hours_earned | degree_program | major_declared | semester_of_enrollment | compliance_coordinator_id | certifying_officer_id | head_coach_id | term_id | degree_program_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 392507 | Theodore Mcgrath | full-time | 11.95 | 11.95 | 19 | baseline-degree-13 | true | 10 | 1 | 100 | 1 | model_delegation_child0 | 1 |
| 25388256 | Account Name | part-time | 15.90 | 15.90 | 25 | pilot-degree-14 | false | 17 | 2 | 101 | 2 | 2986222 | 2 |
| id_16 | Saipan International Airport | inactive | 19.85 | 19.85 | 31 | extended-degree-15 | true | 24 | 3 | 102 | 3 | id_26 | 3 |
| gd_taxc_2211 | Norma Fisher | full-time | 23.80 | 23.80 | 37 | integrated-degree-16 | false | 31 | 4 | 103 | 4 | 5006436 | 4 |

The student_athletes table forms the central registry of individuals subject to compliance review. Each record captures a student's enrollment status, academic standing, and the administrative chain of responsibility. Theodore Mcgrath (student_id 392507) is enrolled full-time with a cumulative GPA of 11.95 and 19 semester hours earned, assigned to the baseline-degree-13 program under compliance coordinator 1, certifying officer 100, head coach 1, and academic term model_delegation_child0. Account Name (student_id 25388256) carries a part-time status, a cumulative GPA of 15.90, and 25 semester hours in the pilot-degree-14 program. Saipan International Airport (student_id id_16) holds an inactive status with 31 semester hours and 19.85 cumulative GPA, while Norma Fisher (student_id gd_taxc_2211) is full-time with 37 semester hours and a cumulative GPA of 23.80. The degree_program column stores program identifiers such as baseline-degree-13 and pilot-degree-14, and the major_declared column uses boolean flags to indicate whether a major has been formally declared.

**Table `compliance_coordinators`**

| id | employee_id | full_name | department | contact_email | last_audit_date | head_coach_id |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | adaptive-departme-89 | Christopher Wilson | 2023-10-23 | 1 |
| 2 | Tasha Rodriguez | Account Name | distributed-departme-90 | Charles Larsen | 2024-03-07 | 2 |
| 3 | Theodore Mcgrath | Saipan International Airport | baseline-departme-91 | Mary Alvarez | 2025-08-18 | 3 |
| 4 | Peter Mcdowell | Norma Fisher | pilot-departme-92 | April Snyder | 2022-01-02 | 4 |

Compliance coordinators serve as the primary administrative contacts for student athletes. The compliance_coordinators table records each coordinator's identity, departmental affiliation, and audit history. Coordinator 1, identified by employee_id Norma Fisher and full_name Theodore Mcgrath, operates within adaptive-departme-89 and was last audited on 2023-10-23. Coordinator 2 (employee_id Tasha Rodriguez, full_name Account Name) is based in distributed-departme-90 with a last audit date of 2024-03-07. Coordinator 3 (Theodore Mcgrath / Saipan International Airport) works in baseline-departme-91 and was last audited on 2025-08-18. Coordinator 4 (Peter Mcdowell / Norma Fisher) resides in pilot-departme-92 with a last audit date of 2022-01-02. The contact_email column stores the names Christopher Wilson, Charles Larsen, Mary Alvarez, and April Snyder, which function as the coordinators' communication channels.

**Table `certifying_officers`**

| id | employee_id | full_name | office | contact_email | head_coach_id | student_athlete_student_id |
|---|---|---|---|---|---|---|
| 100 | Norma Fisher | Theodore Mcgrath | legacy-office-55 | Christopher Wilson | 1 | 392507 |
| 101 | Tasha Rodriguez | Account Name | compact-office-56 | Charles Larsen | 2 | 25388256 |
| 102 | Theodore Mcgrath | Saipan International Airport | composite-office-57 | Mary Alvarez | 3 | id_16 |
| 103 | Peter Mcdowell | Norma Fisher | primary-office-58 | April Snyder | 4 | gd_taxc_2211 |

Certifying officers provide the formal validation layer for compliance determinations. The certifying_officers table links each officer to a specific office, a head coach, and a student athlete. Officer 100 (employee_id Norma Fisher, full_name Theodore Mcgrath) is stationed in legacy-office-55, reports to head coach 1, and certifies student athlete 392507. Officer 101 (Tasha Rodriguez / Account Name) operates from compact-office-56 under head coach 2 for student athlete 25388256. Officer 102 (Theodore Mcgrath / Saipan International Airport) is based in composite-office-57, associated with head coach 3 and student athlete id_16. Officer 103 (Peter Mcdowell / Norma Fisher) works in primary-office-58, serving head coach 4 and student athlete gd_taxc_2211. The contact_email column again holds the names Christopher Wilson, Charles Larsen, Mary Alvarez, and April Snyder.

**Table `head_coaches`**

| id | employee_id | full_name | sport | team_name | contact_email | compliance_coordinator_id | certifying_officer_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | pilot-sport-92 | Composite Model | Christopher Wilson | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Tasha Rodriguez | Account Name | extended-sport-93 | Compact Cluster A | Charles Larsen | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Theodore Mcgrath | Saipan International Airport | integrated-sport-94 | Legacy Review | Mary Alvarez | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Peter Mcdowell | Norma Fisher | seasonal-sport-95 | Regional Initiative | April Snyder | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Head coaches anchor the athletic side of the compliance chain. The head_coaches table records each coach's sport, team name, and the administrative personnel they work with. Head coach 1 (employee_id Norma Fisher, full_name Theodore Mcgrath) oversees pilot-sport-92 and the team named Composite Model, working with compliance coordinator 1 and certifying officer 100; the record was created on 2025-01-01 and last updated on 2025-01-02. Head coach 2 (Tasha Rodriguez / Account Name) manages extended-sport-93 and Compact Cluster A, linked to coordinator 2 and officer 101, with a creation date of 2025-02-06. Head coach 3 (Theodore Mcgrath / Saipan International Airport) directs integrated-sport-94 and the Legacy Review team, associated with coordinator 3 and officer 102, created on 2025-03-11. Head coach 4 (Peter Mcdowell / Norma Fisher) leads seasonal-sport-95 and the Regional Initiative, paired with coordinator 4 and officer 103, created on 2025-04-16.

**Table `academic_terms`**

| term_id | term_name | start_date | end_date | semester_hours_required | term_type | credit_hour_requirement_id |
|---|---|---|---|---|---|---|
| model_delegation_child0 | Distributed Survey | 2022-09-05 | 2022-09-01 | 39 | fall | 1 |
| 2986222 | Adaptive Corridor D | 2023-02-16 | 2023-02-12 | 48 | spring | 2 |
| id_26 | Primary Series | 2024-07-27 | 2024-07-23 | 57 | summer | 3 |
| 5006436 | Composite Assessment | 2025-12-11 | 2025-12-07 | 66 | winter | 4 |

Academic terms define the temporal boundaries within which credit-hour obligations are measured. The academic_terms table stores each term's name, date range, required credit hours, and type. Term model_delegation_child0, named Distributed Survey, runs from 2022-09-05 to 2022-09-01 (a fall term) and requires 39 semester hours. Term 2986222, Adaptive Corridor D, spans 2023-02-16 to 2023-02-12 (spring) with a requirement of 48 hours. Term id_26, Primary Series, covers 2024-07-27 to 2024-07-23 (summer) and requires 57 hours. Term 5006436, Composite Assessment, extends from 2025-12-11 to 2025-12-07 (winter) with a 66-hour requirement. Each term references a credit_hour_requirement_id to tie the temporal window to a specific policy definition.

**Table `credit_hour_requirements`**

| credit_hour_requirement_id | requirement_id | credit_hours_required | requirement_type | deadline_date | status | certifying_officer_id | compliance_coordinator_id | term_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 778568 | 15 | full-time | 2024-11-24 | pending | 100 | 1 | model_delegation_child0 |
| 2 | lu_tax_code_template_b_VB-EC-0 | 25 | six-credit | 2025-04-08 | met | 101 | 2 | 2986222 |
| 3 | 99901 | 35 | cumulative | 2022-09-19 | not-met | 102 | 3 | id_26 |
| 4 | 5917277 | 45 | percentage-of-degree | 2023-02-03 | pending | 103 | 4 | 5006436 |

Credit hour requirements encode the policy rules that determine whether a student athlete is on track. The credit_hour_requirements table captures the numeric threshold, the type of requirement, its deadline, and its current status. Requirement 1 (requirement_id 778568) mandates 15 credit hours under a full-time classification, with a deadline of 2024-11-24 and a status of pending; it is overseen by certifying officer 100, compliance coordinator 1, and term model_delegation_child0. Requirement 2 (requirement_id lu_tax_code_template_b_VB-EC-0) requires 25 credit hours under a six-credit classification, deadline 2025-04-08, status met, linked to officer 101, coordinator 2, and term 2986222. Requirement 3 (requirement_id 99901) demands 35 cumulative credit hours, deadline 2022-09-19, status not-met, under officer 102, coordinator 3, and term id_26. Requirement 4 (requirement_id 5917277) specifies 45 credit hours as a percentage-of-degree measure, deadline 2023-02-03, status pending, tied to officer 103, coordinator 4, and term 5006436.

**Table `degree_programs`**

| degree_program_id | program_id | program_name | total_credits_required | major_required | declaration_deadline |
|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2 | false | 2024-03-27 |
| 2 | 2986219 | Pilot Initiative A | 5 | true | 2025-08-11 |
| 3 | 1186079 | Baseline Model | 2 | false | 2022-01-22 |
| 4 | 1562855 | Distributed Cluster | 20 | true | 2023-06-06 |

Degree programs define the academic pathways through which student athletes progress. The degree_programs table stores program identifiers and their associated metadata, providing the structural context for the degree_program column found in student_athletes. Programs such as baseline-degree-13, pilot-degree-14, extended-degree-15, and integrated-degree-16 represent distinct curricular tracks. The boolean major_declared field indicates whether a student has formally declared a major within their program.

The compliance domain relies on a set of associative tables that link entities across the primary registries. The coordinators_athletes table maps which compliance coordinator is responsible for which student athlete, establishing the direct supervisory relationship. The coordinators_requirements table connects compliance coordinators to specific credit hour requirements, indicating which policies each coordinator monitors. The officers_requirements table ties certifying officers to the requirements they certify, ensuring accountability for validation decisions. The coaches_athletes table associates head coaches with the student athletes on their teams, reflecting the athletic chain of command. The terms_athletes table links student athletes to the academic terms in which they are actively enrolled, grounding their progress within a specific temporal window. The requirements_athletes table connects student athletes to the credit hour requirements that apply to them, specifying which policy thresholds govern their standing. The programs_athletes table maps student athletes to their degree programs, and the programs_requirements table links degree programs to the credit hour requirements that define progression within those programs.

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

The view v_student_athlete_compliance_coordinator answers the question of which compliance coordinator is assigned to each student athlete. It joins student_athletes with compliance_coordinators on the coordinator identifier, producing rows that pair a student's academic profile with their coordinator's departmental and audit information. For student 392507 (Theodore Mcgrath, full-time, GPA 11.95), the view reveals coordinator 1 (Theodore Mcgrath / adaptive-departme-89, last audited 2023-10-23). For student 25388256 (Account Name, part-time, GPA 15.90), the view shows coordinator 2 (Account Name / distributed-departme-90, last audited 2024-03-07).

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

The view v_student_athlete_certifying_officer joins student_athletes with certifying_officers to reveal the formal validation chain for each athlete. Student 392507 is certified by officer 100 (Theodore Mcgrath / legacy-office-55, head coach 1). Student 25388256 is certified by officer 101 (Account Name / compact-office-56, head coach 2). Student id_16 is certified by officer 102 (Saipan International Airport / composite-office-57, head coach 3). Student gd_taxc_2211 is certified by officer 103 (Norma Fisher / primary-office-58, head coach 4).

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

The view v_student_athlete_head_coach links student_athletes with head_coaches to show the athletic oversight structure. Student 392507 falls under head coach 1 (Theodore Mcgrath / pilot-sport-92 / Composite Model). Student 25388256 is under head coach 2 (Account Name / extended-sport-93 / Compact Cluster A). Student id_16 reports to head coach 3 (Theodore Mcgrath / integrated-sport-94 / Legacy Review). Student gd_taxc_2211 is on the team of head coach 4 (Norma Fisher / seasonal-sport-95 / Regional Initiative).

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

The view v_student_athlete_academic_term connects student_athletes with academic_terms to establish the temporal context of each athlete's enrollment. Student 392507 is enrolled in term model_delegation_child0 (Distributed Survey, fall, 39 hours required). Student 25388256 is in term 2986222 (Adaptive Corridor D, spring, 48 hours required). Student id_16 is in term id_26 (Primary Series, summer, 57 hours required). Student gd_taxc_2211 is in term 5006436 (Composite Assessment, winter, 66 hours required).

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

The view v_student_athlete_degree_program joins student_athletes with degree_programs to present the academic pathway for each athlete. Student 392507 is in baseline-degree-13 with major_declared true. Student 25388256 is in pilot-degree-14 with major_declared false. Student id_16 is in extended-degree-15 with major_declared true. Student gd_taxc_2211 is in integrated-degree-16 with major_declared false.

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

The view v_compliance_coordinator_student_athlete_detail provides the compliance coordinator's perspective on the athletes under their supervision. Coordinator 1 (Theodore Mcgrath / adaptive-departme-89) oversees student 392507 (Theodore Mcgrath, full-time, GPA 11.95, 19 hours earned). Coordinator 2 (Account Name / distributed-departme-90) oversees student 25388256 (Account Name, part-time, GPA 15.90, 25 hours earned). Coordinator 3 (Theodore Mcgrath / baseline-departme-91) oversees student id_16 (Saipan International Airport, inactive, GPA 19.85, 31 hours earned). Coordinator 4 (Norma Fisher / pilot-departme-92) oversees student gd_taxc_2211 (Norma Fisher, full-time, GPA 23.80, 37 hours earned).

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

The view v_compliance_coordinator_credit_hour_requirement_detail shows which credit hour requirements each compliance coordinator monitors. Coordinator 1 monitors requirement 1 (15 full-time hours, deadline 2024-11-24, status pending). Coordinator 2 monitors requirement 2 (25 six-credit hours, deadline 2025-04-08, status met). Coordinator 3 monitors requirement 3 (35 cumulative hours, deadline 2022-09-19, status not-met). Coordinator 4 monitors requirement 4 (45 percentage-of-degree hours, deadline 2023-02-03, status pending).

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

The view v_compliance_coordinator_head_coach links compliance coordinators with the head coaches they work alongside. Coordinator 1 (Theodore Mcgrath / adaptive-departme-89) works with head coach 1 (Theodore Mcgrath / pilot-sport-92 / Composite Model). Coordinator 2 (Account Name / distributed-departme-90) works with head coach 2 (Account Name / extended-sport-93 / Compact Cluster A). Coordinator 3 (Theodore Mcgrath / baseline-departme-91) works with head coach 3 (Theodore Mcgrath / integrated-sport-94 / Legacy Review). Coordinator 4 (Norma Fisher / pilot-departme-92) works with head coach 4 (Norma Fisher / seasonal-sport-95 / Regional Initiative).

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

The view v_certifying_officer_credit_hour_requirement_detail presents the certifying officer's view of the requirements they validate. Officer 100 (Theodore Mcgrath / legacy-office-55) validates requirement 1 (15 full-time hours, pending, deadline 2024-11-24). Officer 101 (Account Name / compact-office-56) validates requirement 2 (25 six-credit hours, met, deadline 2025-04-08). Officer 102 (Theodore Mcgrath / composite-office-57) validates requirement 3 (35 cumulative hours, not-met, deadline 2022-09-19). Officer 103 (Norma Fisher / primary-office-58) validates requirement 4 (45 percentage-of-degree hours, pending, deadline 2023-02-03).

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

The view v_certifying_officer_head_coach connects certifying officers with the head coaches whose teams they certify. Officer 100 (legacy-office-55) is paired with head coach 1 (pilot-sport-92 / Composite Model). Officer 101 (compact-office-56) is paired with head coach 2 (extended-sport-93 / Compact Cluster A). Officer 102 (composite-office-57) is paired with head coach 3 (integrated-sport-94 / Legacy Review). Officer 103 (primary-office-58) is paired with head coach 4 (seasonal-sport-95 / Regional Initiative).

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

The view v_certifying_officer_student_athlete links certifying officers to the student athletes they formally certify. Officer 100 certifies student 392507 (Theodore Mcgrath, full-time, GPA 11.95). Officer 101 certifies student 25388256 (Account Name, part-time, GPA 15.90). Officer 102 certifies student id_16 (Saipan International Airport, inactive, GPA 19.85). Officer 103 certifies student gd_taxc_2211 (Norma Fisher, full-time, GPA 23.80).

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

The view v_head_coach_student_athlete_detail gives head coaches a roster of the athletes on their teams with full academic detail. Head coach 1 (Theodore Mcgrath / pilot-sport-92 / Composite Model) has student 392507 (Theodore Mcgrath, full-time, GPA 11.95, 19 hours, baseline-degree-13). Head coach 2 (Account Name / extended-sport-93 / Compact Cluster A) has student 25388256 (Account Name, part-time, GPA 15.90, 25 hours, pilot-degree-14). Head coach 3 (Theodore Mcgrath / integrated-sport-94 / Legacy Review) has student id_16 (Saipan International Airport, inactive, GPA 19.85, 31 hours, extended-degree-15). Head coach 4 (Norma Fisher / seasonal-sport-95 / Regional Initiative) has student gd_taxc_2211 (Norma Fisher, full-time, GPA 23.80, 37 hours, integrated-degree-16).

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

The view v_head_coach_compliance_coordinator shows the compliance coordinators that each head coach collaborates with. Head coach 1 (Composite Model) works with coordinator 1 (Theodore Mcgrath / adaptive-departme-89, last audited 2023-10-23). Head coach 2 (Compact Cluster A) works with coordinator 2 (Account Name / distributed-departme-90, last audited 2024-03-07). Head coach 3 (Legacy Review) works with coordinator 3 (Theodore Mcgrath / baseline-departme-91, last audited 2025-08-18). Head coach 4 (Regional Initiative) works with coordinator 4 (Norma Fisher / pilot-departme-92, last audited 2022-01-02).

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

The view v_head_coach_certifying_officer links head coaches to the certifying officers who validate their athletes' compliance. Head coach 1 (Composite Model) is supported by officer 100 (Theodore Mcgrath / legacy-office-55). Head coach 2 (Compact Cluster A) is supported by officer 101 (Account Name / compact-office-56). Head coach 3 (Legacy Review) is supported by officer 102 (Theodore Mcgrath / composite-office-57). Head coach 4 (Regional Initiative) is supported by officer 103 (Norma Fisher / primary-office-58).

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

The view v_academic_term_student_athlete_detail provides the academic term's perspective on the athletes enrolled within it. Term model_delegation_child0 (Distributed Survey, fall, 39 hours required) contains student 392507 (Theodore Mcgrath, full-time, GPA 11.95, 19 hours earned). Term 2986222 (Adaptive Corridor D, spring, 48 hours required) contains student 25388256 (Account Name, part-time, GPA 15.90, 25 hours earned). Term id_26 (Primary Series, summer, 57 hours required) contains student id_16 (Saipan International Airport, inactive, GPA 19.85, 31 hours earned). Term 5006436 (Composite Assessment, winter, 66 hours required) contains student gd_taxc_2211 (Norma Fisher, full-time, GPA 23.80, 37 hours earned).

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

The view v_academic_term_credit_hour_requirement connects academic terms to the credit hour requirements that define the threshold for each term. Term model_delegation_child0 (Distributed Survey) is governed by requirement 1 (15 full-time hours, pending, deadline 2024-11-24). Term 2986222 (Adaptive Corridor D) is governed by requirement 2 (25 six-credit hours, met, deadline 2025-04-08). Term id_26 (Primary Series) is governed by requirement 3 (35 cumulative hours, not-met, deadline 2022-09-19). Term 5006436 (Composite Assessment) is governed by requirement 4 (45 percentage-of-degree hours, pending, deadline 2023-02-03).

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

The view v_credit_hour_requirement_student_athlete_detail shows which student athletes are subject to each credit hour requirement. Requirement 1 (15 full-time hours, pending) applies to student 392507 (Theodore Mcgrath, full-time, GPA 11.95, 19 hours earned). Requirement 2 (25 six-credit hours, met) applies to student 25388256 (Account Name, part-time, GPA 15.90, 25 hours earned). Requirement 3 (35 cumulative hours, not-met) applies to student id_16 (Saipan International Airport, inactive, GPA 19.85, 31 hours earned). Requirement 4 (45 percentage-of-degree hours, pending) applies to student gd_taxc_2211 (Norma Fisher, full-time, GPA 23.80, 37 hours earned).

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

The view v_credit_hour_requirement_certifying_officer links credit hour requirements to the certifying officers responsible for validating them. Requirement 1 (15 full-time hours, pending) is validated by officer 100 (Theodore Mcgrath / legacy-office-55). Requirement 2 (25 six-credit hours, met) is validated by officer 101 (Account Name / compact-office-56). Requirement 3 (35 cumulative hours, not-met) is validated by officer 102 (Theodore Mcgrath / composite-office-57). Requirement 4 (45 percentage-of-degree hours, pending) is validated by officer 103 (Norma Fisher / primary-office-58).

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

The view v_credit_hour_requirement_compliance_coordinator connects credit hour requirements to the compliance coordinators who monitor them. Requirement 1 (15 full-time hours, pending) is monitored by coordinator 1 (Theodore Mcgrath / adaptive-departme-89, last audited 2023-10-23). Requirement 2 (25 six-credit hours, met) is monitored by coordinator 2 (Account Name / distributed-departme-90, last audited 2024-03-07). Requirement 3 (35 cumulative hours, not-met) is monitored by coordinator 3 (Theodore Mcgrath / baseline-departme-91, last audited 2025-08-18). Requirement 4 (45 percentage-of-degree hours, pending) is monitored by coordinator 4 (Norma Fisher / pilot-departme-92, last audited 2022-01-02).

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

The view v_credit_hour_requirement_academic_term ties credit hour requirements to the academic terms in which they are measured. Requirement 1 (15 full-time hours, pending, deadline 2024-11-24) is measured in term model_delegation_child0 (Distributed Survey, fall, 39 hours required). Requirement 2 (25 six-credit hours, met, deadline 2025-04-08) is measured in term 2986222 (Adaptive Corridor D, spring, 48 hours required). Requirement 3 (35 cumulative hours, not-met, deadline 2022-09-19) is measured in term id_26 (Primary Series, summer, 57 hours required). Requirement 4 (45 percentage-of-degree hours, pending, deadline 2023-02-03) is measured in term 5006436 (Composite Assessment, winter, 66 hours required).

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

The view v_degree_program_student_athlete_detail presents the degree program's perspective on the athletes enrolled within it. Program baseline-degree-13 contains student 392507 (Theodore Mcgrath, full-time, GPA 11.95, 19 hours earned, major_declared true). Program pilot-degree-14 contains student 25388256 (Account Name, part-time, GPA 15.90, 25 hours earned, major_declared false). Program extended-degree-15 contains student id_16 (Saipan International Airport, inactive, GPA 19.85, 31 hours earned, major_declared true). Program integrated-degree-16 contains student gd_taxc_2211 (Norma Fisher, full-time, GPA 23.80, 37 hours earned, major_declared false).

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

The view v_degree_program_credit_hour_requirement_detail links degree programs to the credit hour requirements that define progression within them. Program baseline-degree-13 is associated with requirement 1 (15 full-time hours, pending, deadline 2024-11-24). Program pilot-degree-14 is associated with requirement 2 (25 six-credit hours, met, deadline 2025-04-08). Program extended-degree-15 is associated with requirement 3 (35 cumulative hours, not-met, deadline 2022-09-19). Program integrated-degree-16 is associated with requirement 4 (45 percentage-of-degree hours, pending, deadline 2023-02-03).

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

The compliance management domain for collegiate athletics is built on a foundation of interdependent records that together track every dimension of an athlete's academic and regulatory standing. Student athletes are anchored by their enrollment status, GPA, and credit-hour accumulation, while compliance coordinators, certifying officers, and head coaches form a three-pronged oversight structure. Academic terms provide the temporal framework, and credit hour requirements encode the specific thresholds that determine compliance. Degree programs sit at the intersection of academic planning and policy, linking curricular pathways to the requirements that govern progression. The associative tables weave these registries into a coherent operational graph, and the views translate that graph into role-specific perspectives — each stakeholder seeing the data relevant to their function. In this system, compliance is not a single determination but a continuous alignment of people, policies, and progress.