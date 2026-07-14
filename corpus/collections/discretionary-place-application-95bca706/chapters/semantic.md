# Discretionary Place Admissions: From Ontology to Relational Schema

The discretionary place admissions domain captures the end-to-end lifecycle of a student's application for a special academic placement. At its core, the model revolves around a single application event — a `discretionary_place_application` — that aggregates a student's academic history, interview performance, extracurricular achievements, and the institutional context of both the applicant's school and the reviewing committee. The relational schema normalizes this domain into nine base tables, each representing a distinct entity type, and materializes twenty-one views that reconstruct domain facts through controlled joins. This chapter walks through the entity types, their attributes, the foreign-key relationships that bind them, and the view-level joins that answer the questions admissions officers actually ask.

## The Application as the Central Entity

The domain's gravitational center is the `discretionary_place_applications` table, which records one row per application event. Each row carries a surrogate primary key (`discretionary_place_application_id`), a business-level `application_id` (such as `505997` or `IVC20det40`), a `submission_date`, the `academic_year` (e.g., `legacy-academic-43`), the current `status` (`pending`, `under_review`, `admitted`, `waitlisted`), a `total_score`, a `rank`, and an `interview_date`. Crucially, the table also holds six foreign-key columns — `student_id`, `school_id`, `admission_committee_id`, `academic_record_id`, `interview_score_id`, and `extracurricular_record_id` — that anchor the application to its constituent facts.

**Table `discretionary_place_applications`**

| discretionary_place_application_id | application_id | submission_date | academic_year | status | total_score | rank | interview_date | student_id | school_id | admission_committee_id | academic_record_id | interview_score_id | extracurricular_record_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | pending | 16.45 | 16 | 2025-08-23T19:57:00 | 1000 | 1 | 1 | 1 | 1 | 100 |
| 2 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | under_review | 19.90 | 20 | 2022-01-07T02:14:00 | 1001 | 2 | 2 | 2 | 2 | 101 |
| 3 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | admitted | 23.35 | 24 | 2023-06-18T09:31:00 | 1002 | 3 | 3 | 3 | 3 | 102 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | waitlisted | 26.80 | 28 | 2024-11-02T16:48:00 | 1003 | 4 | 4 | 4 | 4 | 103 |

Consider row 3: application `124` for academic year `composite-academic-45` has status `admitted`, a `total_score` of `23.35`, and rank `24`. Its `student_id` is `1002`, its `school_id` is `3`, its `admission_committee_id` is `3`, its `academic_record_id` is `3`, its `interview_score_id` is `3`, and its `extracurricular_record_id` is `102`. Every one of these foreign keys points to a row in a separate base table, and the views described later in this chapter reassemble these scattered facts into coherent application-level records.

## Student and School Entities

The `students` table stores one row per applicant. Its primary key is `id` (a surrogate integer such as `1000` or `1003`), and it also carries a business `student_id` (e.g., `392507` or `gd_taxc_2211`). The `full_name` column holds the applicant's name — `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher` — while `date_of_birth` and `current_grade` capture demographic and academic standing information. The `current_school` column stores a school identifier string (e.g., `legacy-current-37`), and two foreign-key columns — `discretionary_place_application_id` and `academic_record_id` — link the student back to their application and academic record.

**Table `students`**

| id | student_id | full_name | date_of_birth | current_grade | current_school | discretionary_place_application_id | academic_record_id |
|---|---|---|---|---|---|---|---|
| 1000 | 392507 | Theodore Mcgrath | 2025-04-02 | integrated-current-70 | legacy-current-37 | 1 | 1 |
| 1001 | 25388256 | Account Name | 2022-09-13 | seasonal-current-71 | compact-current-38 | 2 | 2 |
| 1002 | id_16 | Saipan International Airport | 2023-02-24 | regional-current-72 | composite-current-39 | 3 | 3 |
| 1003 | gd_taxc_2211 | Norma Fisher | 2024-07-08 | legacy-current-73 | primary-current-40 | 4 | 4 |

The `schools` table represents the applicant's current educational institution. Its primary key is `id` (integer values `1` through `4`), and it stores the school's name and type. The cardinality relationship between `schools` and `discretionary_place_applications` is one-to-many: a single school (e.g., school `1`) can have multiple applications, but each application references exactly one school via `school_id`.

**Table `schools`**

| school_id | school_code | school_name | allocated_places | office_location | website_url | discretionary_place_application_id | admission_committee_id |
|---|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m35 | Seasonal Standard | 33 | composite-office-99 | https://github.com/chiphuyen/lazynlp | 1 | 1 |
| 2 | 2763c598-9bac-11eb-a8a2-19ed5c03f8d3 | Integrated Framework | 40 | primary-office-100 | https://bugs.launchpad.net/ironic/+bug/1346406 | 2 | 2 |
| 3 | 974942 | Extended Protocol D | 47 | adaptive-office-101 | http://en.wikipedia.org/wiki/Hyla_femoralis | 3 | 3 |
| 4 | akk | Pilot Programme | 54 | distributed-office-102 | https://www.nature.com/articles/nphoton.2014.41 | 4 | 4 |

## Academic Records and Subject Grades

Academic performance is captured in two tables. The `academic_records` table holds one row per student per term, with primary key `id`. Columns include `record_id` (a business identifier such as `10449530`), `grade_level` (e.g., `adaptive-grade-65`), `term` (e.g., `P5` or `P6_Term1`), `conduct_score`, `academic_score`, `total_weighted_score`, and a `student_id` foreign key. The `created_at` timestamp records when the row was inserted.

**Table `academic_records`**

| id | record_id | grade_level | term | conduct_score | academic_score | total_weighted_score | student_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | adaptive-grade-65 | P5 | 12.70 | 19.70 | 7.20 | 1000 | 2025-01-01 00:14:00 |
| 2 | 10445619 | distributed-grade-66 | P6_Term1 | 14.40 | 24.40 | 11.40 | 1001 | 2025-02-06 03:14:00 |
| 3 | 9568457 | baseline-grade-67 | P5 | 16.10 | 29.10 | 15.60 | 1002 | 2025-03-11 06:14:00 |
| 4 | 20743593 | pilot-grade-68 | P6_Term1 | 17.80 | 33.80 | 19.80 | 1003 | 2025-04-16 09:14:00 |

The `subject_grades` table provides a finer-grained view of academic performance, with one row per subject per academic record. Its primary key is `id`, and it stores `subject_name` (e.g., `Chinese`, `English`, `Maths`), `letter_grade` (e.g., `A+`, `A`, `A-`, `B+`), `numeric_score`, and the foreign key `academic_record_id` that links back to the parent record. For example, academic record `1` (belonging to student `1000`) has a Chinese grade of `A+` with `numeric_score` `42`, while academic record `4` (student `1003`) shows a Chinese grade of `B+` with `numeric_score` `51`.

**Table `subject_grades`**

| id | subject_name | letter_grade | numeric_score | academic_record_id |
|---|---|---|---|---|
| 1 | Chinese | A+ | 42 | 1 |
| 2 | English | A | 45 | 2 |
| 3 | Maths | A- | 48 | 3 |
| 4 | Chinese | B+ | 51 | 4 |

The `records_grades` table serves as a junction or lookup table that connects academic records to their associated grades, enabling the many-to-many relationship between records and grade entries to be materialized in the relational model.

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

## Interview Scores and Extracurricular Records

Interview performance is decomposed into three component scores — `appearance_score`, `politeness_score`, and `manner_score` — plus a `total_interview_score` and an `interview_date`. The `interview_scores` table has primary key `interview_score_id` and foreign keys `student_id` and `discretionary_place_application_id`. Row `1` shows an interview with `appearance_score` `39`, `politeness_score` `17`, `manner_score` `14`, and a `total_interview_score` of `17.20` on `2025-08-23T19:57:00` for student `1000`. Row `4` shows a higher-performing interview with scores `60`, `44`, `44` and a total of `26.80` for student `1003`.

**Table `interview_scores`**

| interview_score_id | appearance_score | politeness_score | manner_score | total_interview_score | interview_date | student_id | discretionary_place_application_id |
|---|---|---|---|---|---|---|---|
| 1 | 39 | 17 | 14 | 17.20 | 2025-08-23T19:57:00 | 1000 | 1 |
| 2 | 46 | 26 | 24 | 20.40 | 2022-01-07T02:14:00 | 1001 | 2 |
| 3 | 53 | 35 | 34 | 23.60 | 2023-06-18T09:31:00 | 1002 | 3 |
| 4 | 60 | 44 | 44 | 26.80 | 2024-11-02T16:48:00 | 1003 | 4 |

Extracurricular achievements are stored in `extracurricular_records`, with primary key `extracurricular_record_id`. Columns include `activity_name` (e.g., `Composite Programme`, `Compact Standard A`, `Legacy Framework`, `Regional Protocol`), `activity_type` (`in-school` or `out-of-school`), `achievement_level` (e.g., `Championship`, `First_runner-up`, `Second_runner-up`, `Excellent`), `score_points`, and foreign keys `student_id` and `discretionary_place_application_id`. Row `100` records that student `1000` participated in the `Composite Programme` (`in-school`, `Championship`) earning `18` score points, while row `103` shows student `1003` in the `Regional Protocol` (`out-of-school`, `Excellent`) with `51` score points.

**Table `extracurricular_records`**

| extracurricular_record_id | activity_name | activity_type | achievement_level | score_points | student_id | discretionary_place_application_id |
|---|---|---|---|---|---|---|
| 100 | Composite Programme | in-school | Championship | 18 | 1000 | 1 |
| 101 | Compact Standard A | out-of-school | First_runner-up | 29 | 1001 | 2 |
| 102 | Legacy Framework | in-school | Second_runner-up | 40 | 1002 | 3 |
| 103 | Regional Protocol | out-of-school | Excellent | 51 | 1003 | 4 |

## Admission Committees

The `admission_committees` table represents the institutional bodies that review applications. Its primary key is `id`, and it stores the committee's name and type. Each application references exactly one committee via `admission_committee_id`, and each committee can review many applications — a one-to-many relationship.

**Table `admission_committees`**

| id | committee_id | evaluation_date | result_release_date | discretionary_place_application_id | school_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | PHR-98 | 2023-10-09T21:51:00 | 2025-08-05 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | L785 | 2024-03-20T04:08:00 | 2022-01-16 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 7119774 | 2025-08-04T11:25:00 | 2023-06-27 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1186094 | 2022-01-15T18:42:00 | 2024-11-11 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## View-Level Joins: Reconstructing Domain Facts

The twenty-one views in this schema are not redundant copies of data; they are controlled join projections that answer specific questions by reassembling normalized facts. Each view is named to indicate its join direction and the tables it connects.

### Application-Centric Views

The view `v_discretionary_place_application_student` joins `discretionary_place_applications` to `students` on `student_id`, producing a single-row-per-application result that combines application metadata with the applicant's name, date of birth, and grade level. For application `124` (row 3), this view would show the `admitted` status alongside student `1002`'s name (`Saipan International Airport`) and grade (`regional-current-72`).

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

The view `v_discretionary_place_application_school` joins the application table to `schools` on `school_id`, answering the question "which school does this applicant attend?" Application `1` (row 1) links to school `1`, and the view surfaces the school's name and type alongside the application's `submission_date` and `status`.

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

The view `v_discretionary_place_application_admission_committee` joins `discretionary_place_applications` to `admission_committees` on `admission_committee_id`, answering "which committee is reviewing this application?" Application `2` (row 2) references committee `2`, and the view presents the committee's details alongside the application's `total_score` of `19.90` and `status` of `under_review`.

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

The view `v_discretionary_place_application_academic_record` joins the application to `academic_records` on `academic_record_id`, reconstructing the applicant's academic performance alongside the application metadata. Application `3` (row 3) links to academic record `3`, which has a `conduct_score` of `16.10`, an `academic_score` of `29.10`, and a `total_weighted_score` of `15.60` for term `P5`.

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

The view `v_discretionary_place_application_interview_score` joins the application to `interview_scores` on `interview_score_id`, presenting the interview component scores alongside the application's overall `total_score` and `rank`. Application `4` (row 4) links to interview score `4`, which has a `total_interview_score` of `26.80` — matching the application's own `total_score` of `26.80`, suggesting the interview score is a component of the application total.

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

The view `v_discretionary_place_application_extracurricular_record` joins the application to `extracurricular_records` on `extracurricular_record_id`, surfacing the applicant's extracurricular achievements. Application `1` (row 1) links to extracurricular record `100`, which records the `Composite Programme` activity with `Championship` achievement level and `18` score points.

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

### Student-Centric Views

The view `v_student_discretionary_place_application` reverses the join direction, starting from `students` and joining to `discretionary_place_applications` on `discretionary_place_application_id`. This answers "what is this student's application status?" Student `1000` (Theodore Mcgrath) has application `1` with status `pending` and `total_score` `16.45`.

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

The view `v_student_academic_record` joins `students` to `academic_records` on `academic_record_id`, answering "what are this student's academic results?" Student `1001` (Account Name) links to academic record `2`, which has `conduct_score` `14.40`, `academic_score` `24.40`, and `total_weighted_score` `11.40` for term `P6_Term1`.

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

### Academic Record-Centric Views

The view `v_academic_record_student` joins `academic_records` to `students` on `student_id`, answering "which student does this academic record belong to?" Academic record `1` (grade level `adaptive-grade-65`, term `P5`) belongs to student `1000` (Theodore Mcgrath).

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

The view `v_academic_record_subject_grade_detail` joins `academic_records` to `subject_grades` on `academic_record_id`, answering "what are the subject-level grades for this academic record?" Academic record `3` (student `1002`, term `P5`) has a Maths grade of `A-` with `numeric_score` `48`.

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

The view `v_subject_grade_academic_record` reverses the join, starting from `subject_grades` and joining to `academic_records` on `academic_record_id`. This answers "which academic record does this subject grade belong to?" Subject grade `4` (Chinese, `B+`, `numeric_score` `51`) belongs to academic record `4` (student `1003`, term `P6_Term1`).

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

### Interview Score-Centric Views

The view `v_interview_score_student` joins `interview_scores` to `students` on `student_id`, answering "which student received this interview score?" Interview score `2` (total `20.40`) belongs to student `1001` (Account Name).

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

The view `v_interview_score_discretionary_place_application` joins `interview_scores` to `discretionary_place_applications` on `discretionary_place_application_id`, answering "which application does this interview score belong to?" Interview score `3` (total `23.60`) belongs to application `124` (row 3), which has status `admitted`.

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

### Extracurricular Record-Centric Views

The view `v_extracurricular_record_student` joins `extracurricular_records` to `students` on `student_id`, answering "which student participated in this activity?" Extracurricular record `102` (Legacy Framework, `in-school`, `Second_runner-up`, `40` score points) belongs to student `1002` (Saipan International Airport).

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

The view `v_extracurricular_record_discretionary_place_application` joins `extracurricular_records` to `discretionary_place_applications` on `discretionary_place_application_id`, answering "which application does this extracurricular record support?" Extracurricular record `101` (Compact Standard A, `out-of-school`, `First_runner-up`, `29` score points) supports application `1250196` (row 2), which has status `under_review`.

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

### School-Centric Views

The view `v_school_discretionary_place_application` joins `schools` to `discretionary_place_applications` on `school_id`, answering "which applications come from this school?" School `2` has application `1250196` (row 2) with status `under_review` and `total_score` `19.90`.

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

The view `v_school_admission_committee` joins `schools` to `admission_committees`, answering "which admission committee reviews applications from this school?" School `3` is reviewed by admission committee `3`.

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

### Admission Committee-Centric Views

The view `v_admission_committee_discretionary_place_application` joins `admission_committees` to `discretionary_place_applications` on `admission_committee_id`, answering "which applications is this committee reviewing?" Admission committee `4` reviews application `IVC20det40` (row 4), which has status `waitlisted` and `total_score` `26.80`.

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

The view `v_admission_committee_school` joins `admission_committees` to `schools`, answering "which schools does this admission committee review?" Admission committee `1` reviews school `1`.

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

## Synthesis

The discretionary place admissions schema demonstrates a classic star-adjacent normalization pattern: the `discretionary_place_applications` table serves as the central fact table, with six foreign-key relationships radiating outward to dimension tables (`students`, `schools`, `admission_committees`, `academic_records`, `interview_scores`, `extracurricular_records`), and a further one-to-many relationship from `academic_records` to `subject_grades`. The `records_grades` junction table mediates the association between academic records and their grade entries. The twenty-one views materialize every pairwise join between the application and its associated entities, plus the reverse joins from each entity back to the application, plus the cross-entity joins between schools and admission committees. This design ensures that any domain question — "what is student X's application status?" "which school does applicant Y attend?" "what are the subject grades for record Z?" — can be answered by a single view lookup without requiring the application to reconstruct joins at query time.