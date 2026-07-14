## Discretionary Place Admissions: A Practitioner's Reference

The discretionary place admissions process governs how exceptional candidates are evaluated, scored, and positioned for placement across an educational network. At its core, the system tracks applications from initial submission through final adjudication, aggregating academic performance, interview assessments, and extracurricular achievements into a unified scoring framework. Each application carries a unique identifier, a submission timestamp, an academic year designation, and a status reflecting its current stage in the review pipeline. The process involves students, schools, admission committees, and a layered record structure that captures academic history, subject-level grades, interview evaluations, and extracurricular participation. Understanding how these records interlock is essential for practitioners who manage admissions workflows, audit scoring pipelines, or generate reports for institutional stakeholders.

**Table `discretionary_place_applications`**

| discretionary_place_application_id | application_id | submission_date | academic_year | status | total_score | rank | interview_date | student_id | school_id | admission_committee_id | academic_record_id | interview_score_id | extracurricular_record_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | pending | 16.45 | 16 | 2025-08-23T19:57:00 | 1000 | 1 | 1 | 1 | 1 | 100 |
| 2 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | under_review | 19.90 | 20 | 2022-01-07T02:14:00 | 1001 | 2 | 2 | 2 | 2 | 101 |
| 3 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | admitted | 23.35 | 24 | 2023-06-18T09:31:00 | 1002 | 3 | 3 | 3 | 3 | 102 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | waitlisted | 26.80 | 28 | 2024-11-02T16:48:00 | 1003 | 4 | 4 | 4 | 4 | 103 |

The discretionary place applications table serves as the central hub of the admissions process. Each row represents a single application, identified by a composite key that includes both a system-generated `discretionary_place_application_id` and a human-facing `application_id`. The `submission_date` records when the application entered the pipeline, while the `academic_year` field categorizes the cohort—values such as `legacy-academic-43`, `compact-academic-44`, and `composite-academic-45` distinguish intake cycles. The `status` column tracks the application's lifecycle stage, with observed values including `pending`, `under_review`, `admitted`, and `waitlisted`. The `total_score` and `rank` fields aggregate the candidate's overall standing, with scores ranging from 16.45 to 26.80 and ranks from 16 to 28 in the sample data. The `interview_date` marks when the candidate was assessed, and the remaining foreign-key columns (`student_id`, `school_id`, `admission_committee_id`, `academic_record_id`, `interview_score_id`, `extracurricular_record_id`) anchor the application to its supporting records.

**Table `students`**

| id | student_id | full_name | date_of_birth | current_grade | current_school | discretionary_place_application_id | academic_record_id |
|---|---|---|---|---|---|---|---|
| 1000 | 392507 | Theodore Mcgrath | 2025-04-02 | integrated-current-70 | legacy-current-37 | 1 | 1 |
| 1001 | 25388256 | Account Name | 2022-09-13 | seasonal-current-71 | compact-current-38 | 2 | 2 |
| 1002 | id_16 | Saipan International Airport | 2023-02-24 | regional-current-72 | composite-current-39 | 3 | 3 |
| 1003 | gd_taxc_2211 | Norma Fisher | 2024-07-08 | legacy-current-73 | primary-current-40 | 4 | 4 |

The students table provides the demographic and enrollment context for each applicant. The primary key `id` is a numeric identifier, while `student_id` carries a secondary reference that may differ from the primary key—a pattern visible in entries like `392507` for Theodore Mcgrath and `25388256` for Account Name. The `full_name` field holds the candidate's name, and `date_of_birth` provides the birth date in ISO format. The `current_grade` and `current_school` fields describe the student's present academic standing, with grade designations such as `integrated-current-70` and school designations like `legacy-current-37`. The `discretionary_place_application_id` and `academic_record_id` columns create the bidirectional linkage back to the application and academic record tables, ensuring that a student's profile can be navigated from either direction.

**Table `academic_records`**

| id | record_id | grade_level | term | conduct_score | academic_score | total_weighted_score | student_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | adaptive-grade-65 | P5 | 12.70 | 19.70 | 7.20 | 1000 | 2025-01-01 00:14:00 |
| 2 | 10445619 | distributed-grade-66 | P6_Term1 | 14.40 | 24.40 | 11.40 | 1001 | 2025-02-06 03:14:00 |
| 3 | 9568457 | baseline-grade-67 | P5 | 16.10 | 29.10 | 15.60 | 1002 | 2025-03-11 06:14:00 |
| 4 | 20743593 | pilot-grade-68 | P6_Term1 | 17.80 | 33.80 | 19.80 | 1003 | 2025-04-16 09:14:00 |

Academic records capture the scholastic performance of each student at a granular level. The `id` column is the primary key, while `record_id` serves as a secondary reference. The `grade_level` field uses coded values such as `adaptive-grade-65` and `distributed-grade-66` to denote the student's academic tier. The `term` field specifies the reporting period, with values like `P5` and `P6_Term1` indicating primary school year and term designations. The `conduct_score`, `academic_score`, and `total_weighted_score` columns quantify behavioral and scholastic performance, with total weighted scores ranging from 7.20 to 19.80 in the sample. The `student_id` links the record to the student, and `created_at` timestamps the record's creation.

**Table `subject_grades`**

| id | subject_name | letter_grade | numeric_score | academic_record_id |
|---|---|---|---|---|
| 1 | Chinese | A+ | 42 | 1 |
| 2 | English | A | 45 | 2 |
| 3 | Maths | A- | 48 | 3 |
| 4 | Chinese | B+ | 51 | 4 |

Subject grades break down academic performance into individual course-level results. Each row represents a single subject assessment, identified by `id`, with `subject_name` indicating the discipline—Chinese, English, and Maths appear in the sample data. The `letter_grade` column provides a qualitative assessment (A+, A, A-, B+), while `numeric_score` offers the corresponding quantitative measure, ranging from 42 to 51. The `academic_record_id` foreign key ties each subject grade to its parent academic record, enabling roll-up calculations for the `academic_score` and `total_weighted_score` fields in the academic records table.

**Table `interview_scores`**

| interview_score_id | appearance_score | politeness_score | manner_score | total_interview_score | interview_date | student_id | discretionary_place_application_id |
|---|---|---|---|---|---|---|---|
| 1 | 39 | 17 | 14 | 17.20 | 2025-08-23T19:57:00 | 1000 | 1 |
| 2 | 46 | 26 | 24 | 20.40 | 2022-01-07T02:14:00 | 1001 | 2 |
| 3 | 53 | 35 | 34 | 23.60 | 2023-06-18T09:31:00 | 1002 | 3 |
| 4 | 60 | 44 | 44 | 26.80 | 2024-11-02T16:48:00 | 1003 | 4 |

Interview scores document the candidate's performance during the admissions interview. The `interview_score_id` is the primary key, and the table captures three dimension scores—`appearance_score`, `politeness_score`, and `manner_score`—alongside a `total_interview_score` that aggregates them. In the sample data, total interview scores range from 17.20 to 26.80, with individual dimension scores scaling proportionally. The `interview_date` records when the assessment occurred, and the `student_id` and `discretionary_place_application_id` columns link the score to both the student and the specific application under review.

**Table `extracurricular_records`**

| extracurricular_record_id | activity_name | activity_type | achievement_level | score_points | student_id | discretionary_place_application_id |
|---|---|---|---|---|---|---|
| 100 | Composite Programme | in-school | Championship | 18 | 1000 | 1 |
| 101 | Compact Standard A | out-of-school | First_runner-up | 29 | 1001 | 2 |
| 102 | Legacy Framework | in-school | Second_runner-up | 40 | 1002 | 3 |
| 103 | Regional Protocol | out-of-school | Excellent | 51 | 1003 | 4 |

Extracurricular records catalog the candidate's activities outside the classroom. The `extracurricular_record_id` is the primary key, and each row describes a single activity with `activity_name`, `activity_type`, and `achievement_level`. Activity types include `in-school` and `out-of-school`, while achievement levels range from `Championship` to `Excellent`, with intermediate designations such as `First_runner-up` and `Second_runner-up`. The `score_points` column quantifies the activity's contribution to the overall evaluation, with values from 18 to 51 in the sample. The `student_id` and `discretionary_place_application_id` columns provide dual linkage to the student and the application.

**Table `schools`**

| school_id | school_code | school_name | allocated_places | office_location | website_url | discretionary_place_application_id | admission_committee_id |
|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Seasonal Standard | 33 | composite-office-99 | https://github.com/chiphuyen/lazynlp | 1 | 1 |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Integrated Framework | 40 | primary-office-100 | https://bugs.launchpad.net/ironic/+bug/1346406 | 2 | 2 |
| 3 | 974942 | Extended Protocol D | 47 | adaptive-office-101 | http://en.wikipedia.org/wiki/Hyla_femoralis | 3 | 3 |
| 4 | akk | Pilot Programme | 54 | distributed-office-102 | https://www.nature.com/articles/nphoton.2014.41 | 4 | 4 |

The schools table defines the educational institutions involved in the admissions process. Each school is identified by a primary key and carries institutional metadata including name, type, and contact information. Schools serve as the organizational home for students and as the entity that may submit or endorse discretionary place applications. The `school_id` in the applications table references this table, establishing the institutional context for each candidate's application.

**Table `admission_committees`**

| id | committee_id | evaluation_date | result_release_date | discretionary_place_application_id | school_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-09T21:51:00 | 2025-08-05 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | L785 | 2024-03-20T04:08:00 | 2022-01-16 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 7119774 | 2025-08-04T11:25:00 | 2023-06-27 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1186094 | 2022-01-15T18:42:00 | 2024-11-11 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Admission committees are the decision-making bodies that review and adjudicate applications. Each committee is identified by `admission_committee_id` and carries metadata about its composition, jurisdiction, and operational parameters. The `admission_committee_id` in the applications table links each application to the committee responsible for its review, creating an audit trail from application through decision.

**Table `records_grades`**

| academic_record_id | subject_grade_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The records_grades table provides an additional layer of grade tracking, potentially capturing standardized or supplementary assessments that complement the subject-level grades in the subject_grades table. Its structure supports cross-referencing between institutional grade records and the detailed subject performance data, ensuring that all grading sources are accounted for in the final evaluation.

## Application-Centric Views

The application-centric views present the admissions process from the perspective of a single application, joining all supporting records into a unified profile.

**View `v_discretionary_place_application_student`**

```sql
CREATE VIEW v_discretionary_place_application_student AS
SELECT a.discretionary_place_application_id, a.application_id, a.submission_date, a.academic_year, b.id AS student_id, b.student_id AS student_student_id, b.full_name AS student_full_name
FROM discretionary_place_applications a JOIN students b ON a.student_id = b.id;
```

| discretionary_place_application_id | application_id | submission_date | academic_year | student_id | student_student_id | student_full_name |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | 1000 | 392507 | Theodore Mcgrath |
| 2 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | 1001 | 25388256 | Account Name |
| 3 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | 1002 | id_16 | Saipan International Airport |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | 1003 | gd_taxc_2211 | Norma Fisher |

This view joins the discretionary place applications table with the students table, answering the question: "Who is this application for, and what is their current enrollment status?" For application 505997, the view reveals that Theodore Mcgrath (student ID 1000, currently in grade `integrated-current-70` at school `legacy-current-37`) submitted a pending application with a total score of 16.45 and rank 16. For application 124, the view shows that the candidate associated with student ID 1002 has been admitted, with a total score of 23.35 and rank 24.

**View `v_discretionary_place_application_school`**

```sql
CREATE VIEW v_discretionary_place_application_school AS
SELECT a.discretionary_place_application_id, a.application_id, a.submission_date, a.academic_year, b.school_id AS school_school_id, b.school_code AS school_school_code, b.school_name AS school_school_name
FROM discretionary_place_applications a JOIN schools b ON a.school_id = b.school_id;
```

| discretionary_place_application_id | application_id | submission_date | academic_year | school_school_id | school_school_code | school_school_name |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | 1 | lu_tax_code_template_m35 | Seasonal Standard |
| 2 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Integrated Framework |
| 3 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | 3 | 974942 | Extended Protocol D |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | 4 | akk | Pilot Programme |

This view joins applications with the schools table, answering: "Which school is associated with this application, and what are its institutional characteristics?" Application IVC20det40, for instance, is linked to school ID 4, and the view surfaces the school's name, type, and contact details alongside the application's waitlisted status and total score of 26.80.

**View `v_discretionary_place_application_admission_committee`**

```sql
CREATE VIEW v_discretionary_place_application_admission_committee AS
SELECT a.discretionary_place_application_id, a.application_id, a.submission_date, a.academic_year, b.id AS committee_id, b.committee_id AS committee_committee_id, b.evaluation_date AS committee_evaluation_date
FROM discretionary_place_applications a JOIN admission_committees b ON a.admission_committee_id = b.id;
```

| discretionary_place_application_id | application_id | submission_date | academic_year | committee_id | committee_committee_id | committee_evaluation_date |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | 1 | PHR-98 | 2023-10-09T21:51:00 |
| 2 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | 2 | L785 | 2024-03-20T04:08:00 |
| 3 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | 3 | 7119774 | 2025-08-04T11:25:00 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | 4 | 1186094 | 2022-01-15T18:42:00 |

This view joins applications with the admission committees table, answering: "Which committee is reviewing this application?" Application 1250196, currently under review with a total score of 19.90, is assigned to admission committee ID 2. The view surfaces the committee's composition and jurisdiction, enabling practitioners to trace accountability for each decision.

**View `v_discretionary_place_application_academic_record`**

```sql
CREATE VIEW v_discretionary_place_application_academic_record AS
SELECT a.discretionary_place_application_id, a.application_id, a.submission_date, a.academic_year, b.id AS record_id, b.record_id AS record_record_id, b.grade_level AS record_grade_level
FROM discretionary_place_applications a JOIN academic_records b ON a.academic_record_id = b.id;
```

| discretionary_place_application_id | application_id | submission_date | academic_year | record_id | record_record_id | record_grade_level |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | 1 | 10449530 | adaptive-grade-65 |
| 2 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | 2 | 10445619 | distributed-grade-66 |
| 3 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | 3 | 9568457 | baseline-grade-67 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | 4 | 20743593 | pilot-grade-68 |

This view joins applications with the academic records table, answering: "What is the academic performance profile of the candidate behind this application?" Application 124 (status: admitted, total score: 23.35) is linked to academic record ID 3, which shows a conduct score of 16.10, an academic score of 29.10, and a total weighted score of 15.60 for the baseline-grade-67 tier in term P5.

**View `v_discretionary_place_application_interview_score`**

```sql
CREATE VIEW v_discretionary_place_application_interview_score AS
SELECT a.discretionary_place_application_id, a.application_id, a.submission_date, a.academic_year, b.interview_score_id AS score_interview_score_id, b.appearance_score AS score_appearance_score, b.politeness_score AS score_politeness_score
FROM discretionary_place_applications a JOIN interview_scores b ON a.interview_score_id = b.interview_score_id;
```

| discretionary_place_application_id | application_id | submission_date | academic_year | score_interview_score_id | score_appearance_score | score_politeness_score |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | 1 | 39 | 17 |
| 2 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | 2 | 46 | 26 |
| 3 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | 3 | 53 | 35 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | 4 | 60 | 44 |

This view joins applications with the interview scores table, answering: "How did the candidate perform in the admissions interview?" Application IVC20det40 (waitlisted, total score: 26.80) is linked to interview score ID 103, which records appearance, politeness, and manner scores of 60, 44, and 44 respectively, yielding a total interview score of 26.80.

**View `v_discretionary_place_application_extracurricular_record`**

```sql
CREATE VIEW v_discretionary_place_application_extracurricular_record AS
SELECT a.discretionary_place_application_id, a.application_id, a.submission_date, a.academic_year, b.extracurricular_record_id AS record_extracurricular_record_id, b.activity_name AS record_activity_name, b.activity_type AS record_activity_type
FROM discretionary_place_applications a JOIN extracurricular_records b ON a.extracurricular_record_id = b.extracurricular_record_id;
```

| discretionary_place_application_id | application_id | submission_date | academic_year | record_extracurricular_record_id | record_activity_name | record_activity_type |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | 100 | Composite Programme | in-school |
| 2 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | 101 | Compact Standard A | out-of-school |
| 3 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | 102 | Legacy Framework | in-school |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | 103 | Regional Protocol | out-of-school |

This view joins applications with the extracurricular records table, answering: "What extracurricular activities contributed to this application's evaluation?" Application 1250196 (under review, total score: 19.90) is linked to extracurricular record 101, which documents participation in "Compact Standard A" as an out-of-school activity at the First_runner-up achievement level, contributing 29 score points.

## Student-Centric Views

The student-centric views present the admissions process from the perspective of the individual candidate, aggregating all records associated with a student.

**View `v_student_discretionary_place_application`**

```sql
CREATE VIEW v_student_discretionary_place_application AS
SELECT a.id, a.student_id, a.full_name, a.date_of_birth, b.discretionary_place_application_id AS application_discretionary_place_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM students a JOIN discretionary_place_applications b ON a.discretionary_place_application_id = b.discretionary_place_application_id;
```

| id | student_id | full_name | date_of_birth | application_discretionary_place_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|---|
| 1000 | 392507 | Theodore Mcgrath | 2025-04-02 | 1 | 505997 | 2025-04-24T03:57:00 |
| 1001 | 25388256 | Account Name | 2022-09-13 | 2 | 1250196 | 2022-09-08T10:14:00 |
| 1002 | id_16 | Saipan International Airport | 2023-02-24 | 3 | 124 | 2023-02-19T17:31:00 |
| 1003 | gd_taxc_2211 | Norma Fisher | 2024-07-08 | 4 | IVC20det40 | 2024-07-03T00:48:00 |

This view joins the students table with the discretionary place applications table, answering: "What applications has this student submitted, and what is their current status?" Student 1000 (Theodore Mcgrath) has application 1, which is pending with a total score of 16.45 and rank 16. Student 1003 (Norma Fisher) has application 4, which is waitlisted with a total score of 26.80 and rank 28.

**View `v_student_academic_record`**

```sql
CREATE VIEW v_student_academic_record AS
SELECT a.id, a.student_id, a.full_name, a.date_of_birth, b.id AS record_id, b.record_id AS record_record_id, b.grade_level AS record_grade_level
FROM students a JOIN academic_records b ON a.academic_record_id = b.id;
```

| id | student_id | full_name | date_of_birth | record_id | record_record_id | record_grade_level |
|---|---|---|---|---|---|---|
| 1000 | 392507 | Theodore Mcgrath | 2025-04-02 | 1 | 10449530 | adaptive-grade-65 |
| 1001 | 25388256 | Account Name | 2022-09-13 | 2 | 10445619 | distributed-grade-66 |
| 1002 | id_16 | Saipan International Airport | 2023-02-24 | 3 | 9568457 | baseline-grade-67 |
| 1003 | gd_taxc_2211 | Norma Fisher | 2024-07-08 | 4 | 20743593 | pilot-grade-68 |

This view joins the students table with the academic records table, answering: "What is the academic history of this student?" Student 1001 (Account Name) has academic record 2, which covers the distributed-grade-66 tier in term P6_Term1, with a conduct score of 14.40, an academic score of 24.40, and a total weighted score of 11.40.

## Academic Record-Centric Views

The academic record-centric views drill into the scholastic performance data, connecting academic records to their constituent subject grades and student profiles.

**View `v_academic_record_student`**

```sql
CREATE VIEW v_academic_record_student AS
SELECT a.id, a.record_id, a.grade_level, a.term, b.id AS student_id, b.student_id AS student_student_id, b.full_name AS student_full_name
FROM academic_records a JOIN students b ON a.student_id = b.id;
```

| id | record_id | grade_level | term | student_id | student_student_id | student_full_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | adaptive-grade-65 | P5 | 1000 | 392507 | Theodore Mcgrath |
| 2 | 10445619 | distributed-grade-66 | P6_Term1 | 1001 | 25388256 | Account Name |
| 3 | 9568457 | baseline-grade-67 | P5 | 1002 | id_16 | Saipan International Airport |
| 4 | 20743593 | pilot-grade-68 | P6_Term1 | 1003 | gd_taxc_2211 | Norma Fisher |

This view joins the academic records table with the students table, answering: "Which student does this academic record belong to, and what are their demographic details?" Academic record 1 (grade level: adaptive-grade-65, term: P5) belongs to student 1000 (Theodore Mcgrath, date of birth: 2025-04-02, current grade: integrated-current-70).

**View `v_academic_record_subject_grade_detail`**

```sql
CREATE VIEW v_academic_record_subject_grade_detail AS
SELECT a.id, a.record_id, a.grade_level, b.id AS grade_id, b.subject_name AS grade_subject_name, b.letter_grade AS grade_letter_grade
FROM academic_records a
  JOIN records_grades j ON j.academic_record_id = a.id
  JOIN subject_grades b ON b.id = j.subject_grade_id;
```

| id | record_id | grade_level | grade_id | grade_subject_name | grade_letter_grade |
|---|---|---|---|---|---|
| 1 | 10449530 | adaptive-grade-65 | 1 | Chinese | A+ |
| 1 | 10449530 | adaptive-grade-65 | 2 | English | A |
| 2 | 10445619 | distributed-grade-66 | 2 | English | A |
| 2 | 10445619 | distributed-grade-66 | 3 | Maths | A- |
| 3 | 9568457 | baseline-grade-67 | 3 | Maths | A- |
| 3 | 9568457 | baseline-grade-67 | 4 | Chinese | B+ |
| 4 | 20743593 | pilot-grade-68 | 4 | Chinese | B+ |
| 4 | 20743593 | pilot-grade-68 | 1 | Chinese | A+ |

This view joins the academic records table with the subject grades table, answering: "What subject-level grades compose this academic record?" Academic record 1 includes a Chinese subject grade with letter grade A+ and numeric score 42. Academic record 4 includes a Chinese subject grade with letter grade B+ and numeric score 51.

## Subject Grade-Centric Views

**View `v_subject_grade_academic_record`**

```sql
CREATE VIEW v_subject_grade_academic_record AS
SELECT a.id, a.subject_name, a.letter_grade, a.numeric_score, b.id AS record_id, b.record_id AS record_record_id, b.grade_level AS record_grade_level
FROM subject_grades a JOIN academic_records b ON a.academic_record_id = b.id;
```

| id | subject_name | letter_grade | numeric_score | record_id | record_record_id | record_grade_level |
|---|---|---|---|---|---|---|
| 1 | Chinese | A+ | 42 | 1 | 10449530 | adaptive-grade-65 |
| 2 | English | A | 45 | 2 | 10445619 | distributed-grade-66 |
| 3 | Maths | A- | 48 | 3 | 9568457 | baseline-grade-67 |
| 4 | Chinese | B+ | 51 | 4 | 20743593 | pilot-grade-68 |

This view joins the subject grades table with the academic records table, answering: "Which academic record does this subject grade belong to, and what is the broader academic context?" Subject grade 3 (Maths, letter grade A-, numeric score 48) belongs to academic record 3, which covers the baseline-grade-67 tier in term P5 with a total weighted score of 15.60.

## Interview Score-Centric Views

**View `v_interview_score_student`**

```sql
CREATE VIEW v_interview_score_student AS
SELECT a.interview_score_id, a.appearance_score, a.politeness_score, a.manner_score, b.id AS student_id, b.student_id AS student_student_id, b.full_name AS student_full_name
FROM interview_scores a JOIN students b ON a.student_id = b.id;
```

| interview_score_id | appearance_score | politeness_score | manner_score | student_id | student_student_id | student_full_name |
|---|---|---|---|---|---|---|
| 1 | 39 | 17 | 14 | 1000 | 392507 | Theodore Mcgrath |
| 2 | 46 | 26 | 24 | 1001 | 25388256 | Account Name |
| 3 | 53 | 35 | 34 | 1002 | id_16 | Saipan International Airport |
| 4 | 60 | 44 | 44 | 1003 | gd_taxc_2211 | Norma Fisher |

This view joins the interview scores table with the students table, answering: "Which student was assessed in this interview, and what are their demographic details?" Interview score 3 (total interview score: 23.60, interview date: 2023-06-18) was conducted for student 1002 (Saipan International Airport, date of birth: 2023-02-24, current grade: regional-current-72).

**View `v_interview_score_discretionary_place_application`**

```sql
CREATE VIEW v_interview_score_discretionary_place_application AS
SELECT a.interview_score_id, a.appearance_score, a.politeness_score, a.manner_score, b.discretionary_place_application_id AS application_discretionary_place_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM interview_scores a JOIN discretionary_place_applications b ON a.discretionary_place_application_id = b.discretionary_place_application_id;
```

| interview_score_id | appearance_score | politeness_score | manner_score | application_discretionary_place_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|---|
| 1 | 39 | 17 | 14 | 1 | 505997 | 2025-04-24T03:57:00 |
| 2 | 46 | 26 | 24 | 2 | 1250196 | 2022-09-08T10:14:00 |
| 3 | 53 | 35 | 34 | 3 | 124 | 2023-02-19T17:31:00 |
| 4 | 60 | 44 | 44 | 4 | IVC20det40 | 2024-07-03T00:48:00 |

This view joins the interview scores table with the discretionary place applications table, answering: "Which application does this interview score support, and what is the application's current status?" Interview score 4 (total interview score: 26.80) supports application 4 (IVC20det40), which is in waitlisted status with a total score of 26.80 and rank 28.

## Extracurricular Record-Centric Views

**View `v_extracurricular_record_student`**

```sql
CREATE VIEW v_extracurricular_record_student AS
SELECT a.extracurricular_record_id, a.activity_name, a.activity_type, a.achievement_level, b.id AS student_id, b.student_id AS student_student_id, b.full_name AS student_full_name
FROM extracurricular_records a JOIN students b ON a.student_id = b.id;
```

| extracurricular_record_id | activity_name | activity_type | achievement_level | student_id | student_student_id | student_full_name |
|---|---|---|---|---|---|---|
| 100 | Composite Programme | in-school | Championship | 1000 | 392507 | Theodore Mcgrath |
| 101 | Compact Standard A | out-of-school | First_runner-up | 1001 | 25388256 | Account Name |
| 102 | Legacy Framework | in-school | Second_runner-up | 1002 | id_16 | Saipan International Airport |
| 103 | Regional Protocol | out-of-school | Excellent | 1003 | gd_taxc_2211 | Norma Fisher |

This view joins the extracurricular records table with the students table, answering: "Which student participated in this activity?" Extracurricular record 102 (Legacy Framework, in-school, Second_runner-up, 40 score points) was participated in by student 1002 (Saipan International Airport).

**View `v_extracurricular_record_discretionary_place_application`**

```sql
CREATE VIEW v_extracurricular_record_discretionary_place_application AS
SELECT a.extracurricular_record_id, a.activity_name, a.activity_type, a.achievement_level, b.discretionary_place_application_id AS application_discretionary_place_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM extracurricular_records a JOIN discretionary_place_applications b ON a.discretionary_place_application_id = b.discretionary_place_application_id;
```

| extracurricular_record_id | activity_name | activity_type | achievement_level | application_discretionary_place_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|---|
| 100 | Composite Programme | in-school | Championship | 1 | 505997 | 2025-04-24T03:57:00 |
| 101 | Compact Standard A | out-of-school | First_runner-up | 2 | 1250196 | 2022-09-08T10:14:00 |
| 102 | Legacy Framework | in-school | Second_runner-up | 3 | 124 | 2023-02-19T17:31:00 |
| 103 | Regional Protocol | out-of-school | Excellent | 4 | IVC20det40 | 2024-07-03T00:48:00 |

This view joins the extracurricular records table with the discretionary place applications table, answering: "Which application does this extracurricular record support?" Extracurricular record 103 (Regional Protocol, out-of-school, Excellent, 51 score points) supports application 4 (IVC20det40), which is waitlisted with a total score of 26.80.

## School-Centric Views

**View `v_school_discretionary_place_application`**

```sql
CREATE VIEW v_school_discretionary_place_application AS
SELECT a.school_id, a.school_code, a.school_name, a.allocated_places, b.discretionary_place_application_id AS application_discretionary_place_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM schools a JOIN discretionary_place_applications b ON a.discretionary_place_application_id = b.discretionary_place_application_id;
```

| school_id | school_code | school_name | allocated_places | application_discretionary_place_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Seasonal Standard | 33 | 1 | 505997 | 2025-04-24T03:57:00 |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Integrated Framework | 40 | 2 | 1250196 | 2022-09-08T10:14:00 |
| 3 | 974942 | Extended Protocol D | 47 | 3 | 124 | 2023-02-19T17:31:00 |
| 4 | akk | Pilot Programme | 54 | 4 | IVC20det40 | 2024-07-03T00:48:00 |

This view joins the schools table with the discretionary place applications table, answering: "Which applications are associated with this school, and what is their status?" School 1 is associated with application 1 (505997), which is pending with a total score of 16.45 and rank 16.

**View `v_school_admission_committee`**

```sql
CREATE VIEW v_school_admission_committee AS
SELECT a.school_id, a.school_code, a.school_name, a.allocated_places, b.id AS committee_id, b.committee_id AS committee_committee_id, b.evaluation_date AS committee_evaluation_date
FROM schools a JOIN admission_committees b ON a.admission_committee_id = b.id;
```

| school_id | school_code | school_name | allocated_places | committee_id | committee_committee_id | committee_evaluation_date |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Seasonal Standard | 33 | 1 | PHR-98 | 2023-10-09T21:51:00 |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Integrated Framework | 40 | 2 | L785 | 2024-03-20T04:08:00 |
| 3 | 974942 | Extended Protocol D | 47 | 3 | 7119774 | 2025-08-04T11:25:00 |
| 4 | akk | Pilot Programme | 54 | 4 | 1186094 | 2022-01-15T18:42:00 |

This view joins the schools table with the admission committees table, answering: "Which admission committees have jurisdiction over this school's applications?" School 1 is linked to admission committee 1, establishing the review authority for applications originating from that institution.

## Admission Committee-Centric Views

**View `v_admission_committee_discretionary_place_application`**

```sql
CREATE VIEW v_admission_committee_discretionary_place_application AS
SELECT a.id, a.committee_id, a.evaluation_date, a.result_release_date, b.discretionary_place_application_id AS application_discretionary_place_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM admission_committees a JOIN discretionary_place_applications b ON a.discretionary_place_application_id = b.discretionary_place_application_id;
```

| id | committee_id | evaluation_date | result_release_date | application_discretionary_place_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-09T21:51:00 | 2025-08-05 | 1 | 505997 | 2025-04-24T03:57:00 |
| 2 | L785 | 2024-03-20T04:08:00 | 2022-01-16 | 2 | 1250196 | 2022-09-08T10:14:00 |
| 3 | 7119774 | 2025-08-04T11:25:00 | 2023-06-27 | 3 | 124 | 2023-02-19T17:31:00 |
| 4 | 1186094 | 2022-01-15T18:42:00 | 2024-11-11 | 4 | IVC20det40 | 2024-07-03T00:48:00 |

This view joins the admission committees table with the discretionary place applications table, answering: "Which applications is this committee responsible for reviewing?" Admission committee 1 reviews application 1 (505997), which is in pending status with a total score of 16.45.

**View `v_admission_committee_school`**

```sql
CREATE VIEW v_admission_committee_school AS
SELECT a.id, a.committee_id, a.evaluation_date, a.result_release_date, b.school_id AS school_school_id, b.school_code AS school_school_code, b.school_name AS school_school_name
FROM admission_committees a JOIN schools b ON a.school_id = b.school_id;
```

| id | committee_id | evaluation_date | result_release_date | school_school_id | school_school_code | school_school_name |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-09T21:51:00 | 2025-08-05 | 1 | lu_tax_code_template_m35 | Seasonal Standard |
| 2 | L785 | 2024-03-20T04:08:00 | 2022-01-16 | 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Integrated Framework |
| 3 | 7119774 | 2025-08-04T11:25:00 | 2023-06-27 | 3 | 974942 | Extended Protocol D |
| 4 | 1186094 | 2022-01-15T18:42:00 | 2024-11-11 | 4 | akk | Pilot Programme |

This view joins the admission committees table with the schools table, answering: "Which schools fall under this committee's jurisdiction?" Admission committee 1 has jurisdiction over school 1, establishing the organizational mapping between review bodies and educational institutions.

## Synthesis

The discretionary place admissions system is a multi-layered evaluation framework that connects individual candidates to their academic histories, interview performances, extracurricular contributions, institutional affiliations, and the committees that adjudicate their applications. The base tables capture discrete facets of the process—applications as the central event, students as the candidates, academic records and subject grades as scholastic evidence, interview scores as interpersonal assessment, extracurricular records as holistic evaluation, schools as organizational context, and admission committees as decision-making authority. The views synthesize these facets into question-specific lenses: application-centric views answer "what is this application's full profile?", student-centric views answer "what is this candidate's complete record?", and the remaining views provide drill-down capability into academic, interview, extracurricular, institutional, and committee dimensions. Together, they form a navigable structure that supports auditing, reporting, and operational management of the discretionary place admissions process.