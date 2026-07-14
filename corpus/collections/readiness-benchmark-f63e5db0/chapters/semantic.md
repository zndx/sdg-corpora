## Schema Architecture for Academic Readiness Assessment

The academic readiness assessment domain captures the interplay between institutional learning standards, student preparation, and the instruments used to measure proficiency. At its core, the model tracks what students must know (readiness benchmarks), how that knowledge is organized into course levels, which assessment instruments are deployed to evaluate them, and what learning outcomes each course level targets. Student assessment records bind individual learners to this framework, recording scores, percentiles, and testing metadata. The relational schema materializes this domain through six base tables holding entity data, ten junction tables enforcing many-to-many relationships, and fourteen denormalized views that reconstruct domain facts for reporting.

**Table `readiness_benchmarks`**

| id | benchmark_id | assessment_domain | minimum_score | assessment_type | effective_date | expiration_months | is_mandatory | score_scale | instrument_code |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7441141 | English | 6.20 | ACT | 2023-02-14 | 38 | true | seasonal-score-47 | 5006445 |
| 2 | default_chart_a_tax_code_21 | Reading | 8.40 | SAT | 2024-07-25 | 41 | false | regional-score-48 | 6564383 |
| 3 | 3717629 | Mathematics_General | 10.60 | COMPASS | 2025-12-09 | 44 | true | legacy-score-49 | 476 |
| 4 | gd_taxr_2 | Mathematics_CollegeAlgebra | 12.80 | Asset | 2022-05-20 | 47 | false | compact-score-50 | 12300298 |

The `readiness_benchmarks` table anchors the standards layer. Each row defines a minimum-score threshold for a particular assessment domain — English, Reading, Mathematics_General, or Mathematics_CollegeAlgebra — along with the assessment type (ACT, SAT, COMPASS, or Asset), an effective date, an expiration window in months, and a mandatory flag. The `benchmark_id` column carries identifiers such as `7441141` and `default_chart_a_tax_code_21`, while `score_scale` values like `seasonal-score-47` and `compact-score-50` describe the scoring convention. The `instrument_code` column links each benchmark to a specific assessment instrument, establishing the first foreign-key relationship in the schema.

**Table `course_levels`**

| course_level_id | course_code | institution_code | course_title | credit_hours | is_developmental | is_credit_bearing | department | semester_offered |
|---|---|---|---|---|---|---|---|---|
| 1 | 10238263 | 4092 | Baseline Series D | 14 | false | false | adaptive-departme-89 | integrated-semester-58 |
| 2 | 4463667 | 82873 | Distributed Assessment | 22 | true | true | distributed-departme-90 | seasonal-semester-59 |
| 3 | 24077793 | state_uk_20 | Adaptive Survey | 30 | false | false | baseline-departme-91 | regional-semester-60 |
| 4 | 1204-0009-L | 8928518 | Primary Corridor A | 38 | true | true | pilot-departme-92 | legacy-semester-61 |

Course levels represent the curricular structure. The `course_level_id` column holds values like `10238263` and `1204-0009-L`, while `course_code` and `institution_code` (e.g., `4092`, `82873`, `state_uk_20`) identify the course and its home institution. The `course_title` — "Baseline Series D", "Distributed Assessment", "Adaptive Survey", "Primary Corridor A" — describes the offering. Boolean flags `is_developmental` and `is_credit_bearing` distinguish remedial from credit-bearing courses, and `credit_hours` quantifies the workload. The `department` and `semester_offered` columns (e.g., `adaptive-departme-89`, `integrated-semester-58`) provide organizational context.

**Table `assessment_instruments`**

| instrument_code | instrument_name | format | administering_body | validity_period_months | is_deprecated | version_number |
|---|---|---|---|---|---|---|
| 5006445 | ACT | Computer | seasonal-administ-83 | 33 | true | VER-2245 |
| 6564383 | SAT | Paper | regional-administ-84 | 37 | false | VER-2249 |
| 476 | COMPASS | Adaptive | legacy-administ-85 | 41 | true | VER-2253 |
| 12300298 | Asset | Computer | compact-administ-86 | 45 | false | VER-2257 |

The `assessment_instruments` table catalogs the testing tools. The `instrument_code` (5006445, 6564383, 476, 12300298) serves as the primary key and is referenced by `readiness_benchmarks` and `student_assessment_records`. The `instrument_name` repeats the short name (ACT, SAT, COMPASS, Asset), while `format` records Computer, Paper, or Adaptive delivery. The `administering_body` (e.g., `seasonal-administ-83`, `regional-administ-84`) identifies the organization, `validity_period_months` constrains how long results remain valid, `is_deprecated` flags retired instruments, and `version_number` (VER-2245 through VER-2257) tracks revisions.

**Table `learning_outcomes`**

| outcome_id | domain | objective_text | proficiency_level | assessment_method | is_mandatory | last_reviewed_date | readiness_benchmark_id |
|---|---|---|---|---|---|---|---|
| 2618555 | Writing | compact-objectiv-56 | 28 | Essay | true | 2024-11-22 | 1 |
| lu_tax_code_template_m46 | Reading | composite-objectiv-57 | 33 | Project | false | 2025-04-06 | 2 |
| 168561 | Writing | primary-objectiv-58 | 38 | Exam | true | 2022-09-17 | 3 |
| 1210-0007-M | Reading | adaptive-objectiv-59 | 43 | Portfolio | false | 2023-02-01 | 4 |

Learning outcomes define what students should achieve. The `outcome_id` column carries identifiers such as `2618555`, `lu_tax_code_template_m46`, `168561`, and `1210-0007-M`. The `domain` (Writing or Reading), `objective_text` (compact-objectiv-56, composite-objectiv-57, primary-objectiv-58, adaptive-objectiv-59), and `proficiency_level` (28, 33, 38, 43) describe the target. The `assessment_method` (Essay, Project, Exam, Portfolio) specifies how proficiency is measured. The `is_mandatory` flag and `last_reviewed_date` (2024-11-22 through 2023-02-01) provide governance metadata. The `readiness_benchmark_id` column creates a direct foreign-key link to `readiness_benchmarks`, binding each outcome to a minimum-score standard.

**Table `student_assessment_records`**

| student_assessment_record_id | record_id | student_id | test_date | score | percentile | is_expired | testing_center | score_report_id | instrument_code | student_profile_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 392507 | 2024-11-13T22:42:00 | 9.20 | 41 | true | pilot-testing-26 | id_2 | 5006445 | 1000 |
| 2 | 10445619 | 25388256 | 2025-04-24T05:59:00 | 13.40 | 45 | false | extended-testing-27 | delivery | 6564383 | 1001 |
| 3 | 9568457 | id_16 | 2022-09-08T12:16:00 | 17.60 | 49 | true | integrated-testing-28 | 10207159 | 476 | 1002 |
| 4 | 20743593 | gd_taxc_2211 | 2023-02-19T19:33:00 | 21.80 | 53 | false | seasonal-testing-29 | 21387421 | 12300298 | 1003 |

Student assessment records are the transactional heart of the schema. Each row records a single test event: the `student_assessment_record_id` (1, 2, 3, 4) is the surrogate key, `record_id` (10449530, 10445619, 9568457, 20743593) is a business identifier, and `student_id` (392507, 25388256, id_16, gd_taxc_2211) identifies the test-taker. The `test_date` timestamps the event (2024-11-13T22:42:00 through 2023-02-19T19:33:00), `score` (9.20, 13.40, 17.60, 21.80) and `percentile` (41, 45, 49, 53) capture performance, and `is_expired` flags stale results. The `testing_center` (pilot-testing-26, extended-testing-27, integrated-testing-28, seasonal-testing-29) and `score_report_id` (id_2, delivery, 10207159, 21387421) provide provenance. The `instrument_code` column references `assessment_instruments`, and `student_profile_id` references `student_profiles`, establishing two critical foreign-key relationships.

**Table `student_profiles`**

| student_profile_id | student_id | admission_status | high_school_g_p_a | class_rank | has_g_e_d | enrollment_date | institution_code | is_developmental_required | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 392507 | Pending | 6.45 | 8 | false | 2022-05-11 | 4092 | false | 2025-01-01 00:14:00 |
| 1001 | 25388256 | Admitted | 8.90 | 14 | true | 2023-10-22 | 82873 | true | 2025-02-06 03:14:00 |
| 1002 | id_16 | Enrolled | 11.35 | 20 | false | 2024-03-06 | state_uk_20 | false | 2025-03-11 06:14:00 |
| 1003 | gd_taxc_2211 | Deferred | 13.80 | 26 | true | 2025-08-17 | 8928518 | true | 2025-04-16 09:14:00 |

Student profiles hold the enrollment context. The `student_profile_id` (1000, 1001, 1002, 1003) is the primary key, `student_id` matches the identifier in assessment records, and `admission_status` (Pending, Admitted, Enrolled, Deferred) tracks the applicant pipeline. The `high_school_g_p_a` (6.45, 8.90, 11.35, 13.80) and `class_rank` (8, 14, 20, 26) provide prior academic context. Boolean flags `has_g_e_d` and `is_developmental_required` indicate remedial needs, `enrollment_date` (2022-05-11 through 2025-08-17) records when the student enrolled, `institution_code` (4092, 82873, state_uk_20, 8928518) identifies the institution, and `created_at` timestamps the profile creation.

The six base tables above form the entity layer. The many-to-many relationships between them are materialized through ten junction tables, each encoding a composite foreign key.

**Table `benchmarks_levels`**

| readiness_benchmark_id | course_level_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `benchmarks_levels` junction table links readiness benchmarks to course levels. A row here asserts that a particular benchmark applies to a particular course level, enabling a course to be evaluated against multiple standards and a standard to span multiple courses.

**Table `levels_benchmarks`**

| course_level_id | readiness_benchmark_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `levels_benchmarks` table provides the inverse perspective of the same relationship, linking course levels back to readiness benchmarks. Together, `benchmarks_levels` and `levels_benchmarks` support bidirectional traversal of the benchmark-to-course-level association.

**Table `levels_outcomes`**

| course_level_id | outcome_id |
|---|---|
| 1 | 2618555 |
| 1 | lu_tax_code_template_m46 |
| 2 | lu_tax_code_template_m46 |
| 2 | 168561 |
| 3 | 168561 |
| 3 | 1210-0007-M |
| 4 | 1210-0007-M |
| 4 | 2618555 |

The `levels_outcomes` table connects course levels to learning outcomes, asserting that a given course level is designed to achieve specific outcomes. This is the curriculum-to-outcome mapping.

**Table `instruments_benchmarks`**

| instrument_code | readiness_benchmark_id |
|---|---|
| 5006445 | 1 |
| 5006445 | 2 |
| 6564383 | 2 |
| 6564383 | 3 |
| 476 | 3 |
| 476 | 4 |
| 12300298 | 4 |
| 12300298 | 1 |

The `instruments_benchmarks` junction links assessment instruments to readiness benchmarks, reinforcing the instrument-to-benchmark relationship that is also partially captured by the `instrument_code` foreign key in `readiness_benchmarks`.

**Table `instruments_records`**

| instrument_code | student_assessment_record_id |
|---|---|
| 5006445 | 1 |
| 5006445 | 2 |
| 6564383 | 2 |
| 6564383 | 3 |
| 476 | 3 |
| 476 | 4 |
| 12300298 | 4 |
| 12300298 | 1 |

The `instruments_records` table associates assessment instruments with student assessment records, providing an additional join path between the instrument catalog and the transactional assessment data.

**Table `outcomes_levels`**

| outcome_id | course_level_id |
|---|---|
| 2618555 | 1 |
| 2618555 | 2 |
| lu_tax_code_template_m46 | 2 |
| lu_tax_code_template_m46 | 3 |
| 168561 | 3 |
| 168561 | 4 |
| 1210-0007-M | 4 |
| 1210-0007-M | 1 |

The `outcomes_levels` table mirrors `levels_outcomes`, offering the inverse mapping from learning outcomes back to the course levels that target them.

**Table `records_benchmarks`**

| student_assessment_record_id | readiness_benchmark_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `records_benchmarks` junction connects student assessment records to readiness benchmarks, enabling queries that ask which benchmarks a student's test results satisfy or violate.

**Table `profiles_records`**

| student_profile_id | student_assessment_record_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `profiles_records` table links student profiles to their assessment records, providing a many-to-many bridge between the enrollment context and the transactional test data.

**Table `profiles_levels`**

| student_profile_id | course_level_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `profiles_levels` junction associates student profiles with course levels, indicating which courses a student is enrolled in or has completed.

**Table `profiles_benchmarks`**

| student_profile_id | readiness_benchmark_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `profiles_benchmarks` table connects student profiles to readiness benchmarks, capturing which standards apply to a given student's academic trajectory.

With the entity and junction layers established, the fourteen views materialize denormalized result sets that answer specific analytical questions by joining across the normalized tables.

**View `v_readiness_benchmark_course_level_detail`**

```sql
CREATE VIEW v_readiness_benchmark_course_level_detail AS
SELECT a.id, a.benchmark_id, a.assessment_domain, b.course_level_id AS level_course_level_id, b.course_code AS level_course_code, b.institution_code AS level_institution_code
FROM readiness_benchmarks a
  JOIN benchmarks_levels j ON j.readiness_benchmark_id = a.id
  JOIN course_levels b ON b.course_level_id = j.course_level_id;
```

| id | benchmark_id | assessment_domain | level_course_level_id | level_course_code | level_institution_code |
|---|---|---|---|---|---|
| 1 | 7441141 | English | 1 | 10238263 | 4092 |
| 1 | 7441141 | English | 2 | 4463667 | 82873 |
| 2 | default_chart_a_tax_code_21 | Reading | 2 | 4463667 | 82873 |
| 2 | default_chart_a_tax_code_21 | Reading | 3 | 24077793 | state_uk_20 |
| 3 | 3717629 | Mathematics_General | 3 | 24077793 | state_uk_20 |
| 3 | 3717629 | Mathematics_General | 4 | 1204-0009-L | 8928518 |
| 4 | gd_taxr_2 | Mathematics_CollegeAlgebra | 4 | 1204-0009-L | 8928518 |
| 4 | gd_taxr_2 | Mathematics_CollegeAlgebra | 1 | 10238263 | 4092 |

This view joins `readiness_benchmarks` to `course_levels` through the `benchmarks_levels` junction, answering the question: "Which course levels are governed by which readiness benchmarks?" A row from this view would show a benchmark's assessment domain and minimum score alongside the course level's title and credit hours, enabling administrators to audit curriculum alignment.

**View `v_readiness_benchmark_assessment_instrument`**

```sql
CREATE VIEW v_readiness_benchmark_assessment_instrument AS
SELECT a.id, a.benchmark_id, a.assessment_domain, a.minimum_score, b.instrument_code AS instrument_instrument_code, b.instrument_name AS instrument_instrument_name, b.format AS instrument_format
FROM readiness_benchmarks a JOIN assessment_instruments b ON a.instrument_code = b.instrument_code;
```

| id | benchmark_id | assessment_domain | minimum_score | instrument_instrument_code | instrument_instrument_name | instrument_format |
|---|---|---|---|---|---|---|
| 1 | 7441141 | English | 6.20 | 5006445 | ACT | Computer |
| 2 | default_chart_a_tax_code_21 | Reading | 8.40 | 6564383 | SAT | Paper |
| 3 | 3717629 | Mathematics_General | 10.60 | 476 | COMPASS | Adaptive |
| 4 | gd_taxr_2 | Mathematics_CollegeAlgebra | 12.80 | 12300298 | Asset | Computer |

By joining `readiness_benchmarks` to `assessment_instruments` via `instruments_benchmarks`, this view answers: "Which assessment instruments are associated with which readiness benchmarks?" It surfaces the instrument's format, administering body, and deprecation status alongside the benchmark's domain and minimum score.

**View `v_course_level_readiness_benchmark_detail`**

```sql
CREATE VIEW v_course_level_readiness_benchmark_detail AS
SELECT a.course_level_id, a.course_code, a.institution_code, b.id AS benchmark_id, b.benchmark_id AS benchmark_benchmark_id, b.assessment_domain AS benchmark_assessment_domain
FROM course_levels a
  JOIN levels_benchmarks j ON j.course_level_id = a.course_level_id
  JOIN readiness_benchmarks b ON b.id = j.readiness_benchmark_id;
```

| course_level_id | course_code | institution_code | benchmark_id | benchmark_benchmark_id | benchmark_assessment_domain |
|---|---|---|---|---|---|
| 1 | 10238263 | 4092 | 1 | 7441141 | English |
| 1 | 10238263 | 4092 | 2 | default_chart_a_tax_code_21 | Reading |
| 2 | 4463667 | 82873 | 2 | default_chart_a_tax_code_21 | Reading |
| 2 | 4463667 | 82873 | 3 | 3717629 | Mathematics_General |
| 3 | 24077793 | state_uk_20 | 3 | 3717629 | Mathematics_General |
| 3 | 24077793 | state_uk_20 | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |
| 4 | 1204-0009-L | 8928518 | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |
| 4 | 1204-0009-L | 8928518 | 1 | 7441141 | English |

This view reverses the perspective of the first view, joining `course_levels` to `readiness_benchmarks` through `levels_benchmarks`. It answers: "For a given course level, what are the applicable readiness benchmarks?" A concrete row would pair a course title like "Distributed Assessment" with a benchmark domain such as "English" and its minimum score of 6.20.

**View `v_course_level_learning_outcome_detail`**

```sql
CREATE VIEW v_course_level_learning_outcome_detail AS
SELECT a.course_level_id, a.course_code, a.institution_code, b.outcome_id AS outcome_outcome_id, b.domain AS outcome_domain, b.objective_text AS outcome_objective_text
FROM course_levels a
  JOIN levels_outcomes j ON j.course_level_id = a.course_level_id
  JOIN learning_outcomes b ON b.outcome_id = j.outcome_id;
```

| course_level_id | course_code | institution_code | outcome_outcome_id | outcome_domain | outcome_objective_text |
|---|---|---|---|---|---|
| 1 | 10238263 | 4092 | 2618555 | Writing | compact-objectiv-56 |
| 1 | 10238263 | 4092 | lu_tax_code_template_m46 | Reading | composite-objectiv-57 |
| 2 | 4463667 | 82873 | lu_tax_code_template_m46 | Reading | composite-objectiv-57 |
| 2 | 4463667 | 82873 | 168561 | Writing | primary-objectiv-58 |
| 3 | 24077793 | state_uk_20 | 168561 | Writing | primary-objectiv-58 |
| 3 | 24077793 | state_uk_20 | 1210-0007-M | Reading | adaptive-objectiv-59 |
| 4 | 1204-0009-L | 8928518 | 1210-0007-M | Reading | adaptive-objectiv-59 |
| 4 | 1204-0009-L | 8928518 | 2618555 | Writing | compact-objectiv-56 |

Joining `course_levels` to `learning_outcomes` through `levels_outcomes`, this view answers: "What learning outcomes does a specific course level target?" A row would show a course level's department and credit hours alongside an outcome's objective text, proficiency level, and assessment method — for example, linking "Baseline Series D" to an outcome assessed by Essay with proficiency level 28.

**View `v_assessment_instrument_readiness_benchmark_detail`**

```sql
CREATE VIEW v_assessment_instrument_readiness_benchmark_detail AS
SELECT a.instrument_code, a.instrument_name, a.format, b.id AS benchmark_id, b.benchmark_id AS benchmark_benchmark_id, b.assessment_domain AS benchmark_assessment_domain
FROM assessment_instruments a
  JOIN instruments_benchmarks j ON j.instrument_code = a.instrument_code
  JOIN readiness_benchmarks b ON b.id = j.readiness_benchmark_id;
```

| instrument_code | instrument_name | format | benchmark_id | benchmark_benchmark_id | benchmark_assessment_domain |
|---|---|---|---|---|---|
| 5006445 | ACT | Computer | 1 | 7441141 | English |
| 5006445 | ACT | Computer | 2 | default_chart_a_tax_code_21 | Reading |
| 6564383 | SAT | Paper | 2 | default_chart_a_tax_code_21 | Reading |
| 6564383 | SAT | Paper | 3 | 3717629 | Mathematics_General |
| 476 | COMPASS | Adaptive | 3 | 3717629 | Mathematics_General |
| 476 | COMPASS | Adaptive | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |
| 12300298 | Asset | Computer | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |
| 12300298 | Asset | Computer | 1 | 7441141 | English |

This view joins `assessment_instruments` to `readiness_benchmarks` via `instruments_benchmarks`, answering: "Which readiness benchmarks are measured by a given assessment instrument?" A row would pair an instrument's format and version (e.g., ACT, Computer, VER-2245) with the benchmark's assessment domain and minimum score.

**View `v_assessment_instrument_student_assessment_record_detail`**

```sql
CREATE VIEW v_assessment_instrument_student_assessment_record_detail AS
SELECT a.instrument_code, a.instrument_name, a.format, b.student_assessment_record_id AS record_student_assessment_record_id, b.record_id AS record_record_id, b.student_id AS record_student_id
FROM assessment_instruments a
  JOIN instruments_records j ON j.instrument_code = a.instrument_code
  JOIN student_assessment_records b ON b.student_assessment_record_id = j.student_assessment_record_id;
```

| instrument_code | instrument_name | format | record_student_assessment_record_id | record_record_id | record_student_id |
|---|---|---|---|---|---|
| 5006445 | ACT | Computer | 1 | 10449530 | 392507 |
| 5006445 | ACT | Computer | 2 | 10445619 | 25388256 |
| 6564383 | SAT | Paper | 2 | 10445619 | 25388256 |
| 6564383 | SAT | Paper | 3 | 9568457 | id_16 |
| 476 | COMPASS | Adaptive | 3 | 9568457 | id_16 |
| 476 | COMPASS | Adaptive | 4 | 20743593 | gd_taxc_2211 |
| 12300298 | Asset | Computer | 4 | 20743593 | gd_taxc_2211 |
| 12300298 | Asset | Computer | 1 | 10449530 | 392507 |

By joining `assessment_instruments` to `student_assessment_records` through `instruments_records`, this view answers: "What are the assessment results for a given instrument?" A concrete row would show the instrument name (COMPASS) alongside a student's score (17.60), percentile (49), and testing center (integrated-testing-28).

**View `v_learning_outcome_course_level_detail`**

```sql
CREATE VIEW v_learning_outcome_course_level_detail AS
SELECT a.outcome_id, a.domain, a.objective_text, b.course_level_id AS level_course_level_id, b.course_code AS level_course_code, b.institution_code AS level_institution_code
FROM learning_outcomes a
  JOIN outcomes_levels j ON j.outcome_id = a.outcome_id
  JOIN course_levels b ON b.course_level_id = j.course_level_id;
```

| outcome_id | domain | objective_text | level_course_level_id | level_course_code | level_institution_code |
|---|---|---|---|---|---|
| 2618555 | Writing | compact-objectiv-56 | 1 | 10238263 | 4092 |
| 2618555 | Writing | compact-objectiv-56 | 2 | 4463667 | 82873 |
| lu_tax_code_template_m46 | Reading | composite-objectiv-57 | 2 | 4463667 | 82873 |
| lu_tax_code_template_m46 | Reading | composite-objectiv-57 | 3 | 24077793 | state_uk_20 |
| 168561 | Writing | primary-objectiv-58 | 3 | 24077793 | state_uk_20 |
| 168561 | Writing | primary-objectiv-58 | 4 | 1204-0009-L | 8928518 |
| 1210-0007-M | Reading | adaptive-objectiv-59 | 4 | 1204-0009-L | 8928518 |
| 1210-0007-M | Reading | adaptive-objectiv-59 | 1 | 10238263 | 4092 |

This view joins `learning_outcomes` to `course_levels` via `outcomes_levels`, answering: "Which course levels are designed to achieve a specific learning outcome?" A row would pair an outcome's domain (Writing) and assessment method (Exam) with the course level's title and credit hours.

**View `v_learning_outcome_readiness_benchmark`**

```sql
CREATE VIEW v_learning_outcome_readiness_benchmark AS
SELECT a.outcome_id, a.domain, a.objective_text, a.proficiency_level, b.id AS benchmark_id, b.benchmark_id AS benchmark_benchmark_id, b.assessment_domain AS benchmark_assessment_domain
FROM learning_outcomes a JOIN readiness_benchmarks b ON a.readiness_benchmark_id = b.id;
```

| outcome_id | domain | objective_text | proficiency_level | benchmark_id | benchmark_benchmark_id | benchmark_assessment_domain |
|---|---|---|---|---|---|---|
| 2618555 | Writing | compact-objectiv-56 | 28 | 1 | 7441141 | English |
| lu_tax_code_template_m46 | Reading | composite-objectiv-57 | 33 | 2 | default_chart_a_tax_code_21 | Reading |
| 168561 | Writing | primary-objectiv-58 | 38 | 3 | 3717629 | Mathematics_General |
| 1210-0007-M | Reading | adaptive-objectiv-59 | 43 | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |

Joining `learning_outcomes` to `readiness_benchmarks` through the `readiness_benchmark_id` foreign key in `learning_outcomes`, this view answers: "Which readiness benchmark does a learning outcome reference?" A row would show an outcome's objective text (primary-objectiv-58) alongside the benchmark's assessment domain (Mathematics_General) and minimum score (10.60).

**View `v_student_assessment_record_assessment_instrument`**

```sql
CREATE VIEW v_student_assessment_record_assessment_instrument AS
SELECT a.student_assessment_record_id, a.record_id, a.student_id, a.test_date, b.instrument_code AS instrument_instrument_code, b.instrument_name AS instrument_instrument_name, b.format AS instrument_format
FROM student_assessment_records a JOIN assessment_instruments b ON a.instrument_code = b.instrument_code;
```

| student_assessment_record_id | record_id | student_id | test_date | instrument_instrument_code | instrument_instrument_name | instrument_format |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 392507 | 2024-11-13T22:42:00 | 5006445 | ACT | Computer |
| 2 | 10445619 | 25388256 | 2025-04-24T05:59:00 | 6564383 | SAT | Paper |
| 3 | 9568457 | id_16 | 2022-09-08T12:16:00 | 476 | COMPASS | Adaptive |
| 4 | 20743593 | gd_taxc_2211 | 2023-02-19T19:33:00 | 12300298 | Asset | Computer |

This view joins `student_assessment_records` to `assessment_instruments` via `instruments_records`, answering: "What instrument was used for a specific assessment record?" A row would show the record's score (21.80) and test date (2023-02-19T19:33:00) alongside the instrument's name (Asset) and format (Computer).

**View `v_student_assessment_record_readiness_benchmark_detail`**

```sql
CREATE VIEW v_student_assessment_record_readiness_benchmark_detail AS
SELECT a.student_assessment_record_id, a.record_id, a.student_id, b.id AS benchmark_id, b.benchmark_id AS benchmark_benchmark_id, b.assessment_domain AS benchmark_assessment_domain
FROM student_assessment_records a
  JOIN records_benchmarks j ON j.student_assessment_record_id = a.student_assessment_record_id
  JOIN readiness_benchmarks b ON b.id = j.readiness_benchmark_id;
```

| student_assessment_record_id | record_id | student_id | benchmark_id | benchmark_benchmark_id | benchmark_assessment_domain |
|---|---|---|---|---|---|
| 1 | 10449530 | 392507 | 1 | 7441141 | English |
| 1 | 10449530 | 392507 | 2 | default_chart_a_tax_code_21 | Reading |
| 2 | 10445619 | 25388256 | 2 | default_chart_a_tax_code_21 | Reading |
| 2 | 10445619 | 25388256 | 3 | 3717629 | Mathematics_General |
| 3 | 9568457 | id_16 | 3 | 3717629 | Mathematics_General |
| 3 | 9568457 | id_16 | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |
| 4 | 20743593 | gd_taxc_2211 | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |
| 4 | 20743593 | gd_taxc_2211 | 1 | 7441141 | English |

By joining `student_assessment_records` to `readiness_benchmarks` through `records_benchmarks`, this view answers: "Which readiness benchmarks are relevant to a student's assessment record?" A row would pair a student's score (9.20) and percentile (41) with the benchmark's domain (English) and minimum score (6.20), enabling direct comparison of performance against standards.

**View `v_student_assessment_record_student_profile`**

```sql
CREATE VIEW v_student_assessment_record_student_profile AS
SELECT a.student_assessment_record_id, a.record_id, a.student_id, a.test_date, b.student_profile_id AS profile_student_profile_id, b.student_id AS profile_student_id, b.admission_status AS profile_admission_status
FROM student_assessment_records a JOIN student_profiles b ON a.student_profile_id = b.student_profile_id;
```

| student_assessment_record_id | record_id | student_id | test_date | profile_student_profile_id | profile_student_id | profile_admission_status |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 392507 | 2024-11-13T22:42:00 | 1000 | 392507 | Pending |
| 2 | 10445619 | 25388256 | 2025-04-24T05:59:00 | 1001 | 25388256 | Admitted |
| 3 | 9568457 | id_16 | 2022-09-08T12:16:00 | 1002 | id_16 | Enrolled |
| 4 | 20743593 | gd_taxc_2211 | 2023-02-19T19:33:00 | 1003 | gd_taxc_2211 | Deferred |

This view joins `student_assessment_records` to `student_profiles` via `profiles_records`, answering: "What is the enrollment context for a student's assessment record?" A row would show the record's score (13.40) alongside the profile's admission status (Admitted), high school GPA (8.90), and whether developmental coursework is required.

**View `v_student_profile_student_assessment_record_detail`**

```sql
CREATE VIEW v_student_profile_student_assessment_record_detail AS
SELECT a.student_profile_id, a.student_id, a.admission_status, b.student_assessment_record_id AS record_student_assessment_record_id, b.record_id AS record_record_id, b.student_id AS record_student_id
FROM student_profiles a
  JOIN profiles_records j ON j.student_profile_id = a.student_profile_id
  JOIN student_assessment_records b ON b.student_assessment_record_id = j.student_assessment_record_id;
```

| student_profile_id | student_id | admission_status | record_student_assessment_record_id | record_record_id | record_student_id |
|---|---|---|---|---|---|
| 1000 | 392507 | Pending | 1 | 10449530 | 392507 |
| 1000 | 392507 | Pending | 2 | 10445619 | 25388256 |
| 1001 | 25388256 | Admitted | 2 | 10445619 | 25388256 |
| 1001 | 25388256 | Admitted | 3 | 9568457 | id_16 |
| 1002 | id_16 | Enrolled | 3 | 9568457 | id_16 |
| 1002 | id_16 | Enrolled | 4 | 20743593 | gd_taxc_2211 |
| 1003 | gd_taxc_2211 | Deferred | 4 | 20743593 | gd_taxc_2211 |
| 1003 | gd_taxc_2211 | Deferred | 1 | 10449530 | 392507 |

Joining `student_profiles` to `student_assessment_records` through `profiles_records`, this view answers: "What assessment records belong to a specific student profile?" A row would show the profile's enrollment date (2024-03-06) and institution (state_uk_20) alongside the record's test date, score, and percentile.

**View `v_student_profile_course_level_detail`**

```sql
CREATE VIEW v_student_profile_course_level_detail AS
SELECT a.student_profile_id, a.student_id, a.admission_status, b.course_level_id AS level_course_level_id, b.course_code AS level_course_code, b.institution_code AS level_institution_code
FROM student_profiles a
  JOIN profiles_levels j ON j.student_profile_id = a.student_profile_id
  JOIN course_levels b ON b.course_level_id = j.course_level_id;
```

| student_profile_id | student_id | admission_status | level_course_level_id | level_course_code | level_institution_code |
|---|---|---|---|---|---|
| 1000 | 392507 | Pending | 1 | 10238263 | 4092 |
| 1000 | 392507 | Pending | 2 | 4463667 | 82873 |
| 1001 | 25388256 | Admitted | 2 | 4463667 | 82873 |
| 1001 | 25388256 | Admitted | 3 | 24077793 | state_uk_20 |
| 1002 | id_16 | Enrolled | 3 | 24077793 | state_uk_20 |
| 1002 | id_16 | Enrolled | 4 | 1204-0009-L | 8928518 |
| 1003 | gd_taxc_2211 | Deferred | 4 | 1204-0009-L | 8928518 |
| 1003 | gd_taxc_2211 | Deferred | 1 | 10238263 | 4092 |

This view joins `student_profiles` to `course_levels` via `profiles_levels`, answering: "Which course levels is a student enrolled in?" A row would pair a student's admission status (Deferred) and GPA (13.80) with a course level's title (Primary Corridor A) and credit hours (38).

**View `v_student_profile_readiness_benchmark_detail`**

```sql
CREATE VIEW v_student_profile_readiness_benchmark_detail AS
SELECT a.student_profile_id, a.student_id, a.admission_status, b.id AS benchmark_id, b.benchmark_id AS benchmark_benchmark_id, b.assessment_domain AS benchmark_assessment_domain
FROM student_profiles a
  JOIN profiles_benchmarks j ON j.student_profile_id = a.student_profile_id
  JOIN readiness_benchmarks b ON b.id = j.readiness_benchmark_id;
```

| student_profile_id | student_id | admission_status | benchmark_id | benchmark_benchmark_id | benchmark_assessment_domain |
|---|---|---|---|---|---|
| 1000 | 392507 | Pending | 1 | 7441141 | English |
| 1000 | 392507 | Pending | 2 | default_chart_a_tax_code_21 | Reading |
| 1001 | 25388256 | Admitted | 2 | default_chart_a_tax_code_21 | Reading |
| 1001 | 25388256 | Admitted | 3 | 3717629 | Mathematics_General |
| 1002 | id_16 | Enrolled | 3 | 3717629 | Mathematics_General |
| 1002 | id_16 | Enrolled | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |
| 1003 | gd_taxc_2211 | Deferred | 4 | gd_taxr_2 | Mathematics_CollegeAlgebra |
| 1003 | gd_taxc_2211 | Deferred | 1 | 7441141 | English |

By joining `student_profiles` to `readiness_benchmarks` through `profiles_benchmarks`, this view answers: "Which readiness benchmarks apply to a specific student?" A row would show the student's enrollment date and institution alongside the benchmark's assessment domain and minimum score, providing a holistic view of the standards against which the student is measured.

The schema's design reflects a deliberate separation between entity data (the six base tables), relationship data (the ten junction tables), and analytical projections (the fourteen views). The base tables enforce normalization: each entity type has a single source of truth, and many-to-many associations are decomposed into binary relationships. The junction tables — `benchmarks_levels`, `levels_benchmarks`, `levels_outcomes`, `instruments_benchmarks`, `instruments_records`, `outcomes_levels`, `records_benchmarks`, `profiles_records`, `profiles_levels`, and `profiles_benchmarks` — materialize these associations as composite foreign keys, ensuring referential integrity while allowing flexible cardinality. The views then reconstruct the domain facts that matter to stakeholders: curriculum alignment, instrument coverage, student performance against standards, and enrollment context. Each view's join path is deterministic and traceable back to the normalized tables, making the schema both analytically powerful and structurally sound.