## Foundations of Student Readiness Assessment

Educational institutions rely on structured assessment frameworks to evaluate whether incoming students possess the foundational skills required for college-level coursework. This domain captures the full lifecycle of readiness evaluation: from the definition of benchmarks and learning outcomes, through the administration of assessment instruments, to the recording of individual student performance and the mapping of results back to institutional requirements. The data model organizes these activities around six core entities—readiness benchmarks, course levels, assessment instruments, learning outcomes, student profiles, and assessment records—supplemented by junction tables that encode the many-to-many relationships between them. Together, these records support queries that answer questions such as which students have met the English benchmark for a given course level, or how a specific assessment instrument correlates with institutional readiness targets.

The backbone of the framework is the set of readiness benchmarks, which define the minimum performance thresholds students must achieve across distinct assessment domains.

**Table `readiness_benchmarks`**

| id | benchmark_id | assessment_domain | minimum_score | assessment_type | effective_date | expiration_months | is_mandatory | score_scale | instrument_code |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 7441141 | English | 6.20 | ACT | 2023-02-14 | 38 | true | seasonal-score-47 | 5006445 |
| 2 | default_chart_a_tax_code_21 | Reading | 8.40 | SAT | 2024-07-25 | 41 | false | regional-score-48 | 6564383 |
| 3 | 3717629 | Mathematics_General | 10.60 | COMPASS | 2025-12-09 | 44 | true | legacy-score-49 | 476 |
| 4 | gd_taxr_2 | Mathematics_CollegeAlgebra | 12.80 | Asset | 2022-05-20 | 47 | false | compact-score-50 | 12300298 |

Each benchmark carries a unique identifier, an assessment domain such as English, Reading, Mathematics_General, or Mathematics_CollegeAlgebra, and a minimum score that serves as the pass line. The benchmark identified as 7441141 targets the English domain with a minimum score of 6.20 on the ACT instrument, is marked mandatory, and uses a seasonal-score-47 scale with an effective date of 2023-02-14 and a 38-month validity window. The default_chart_a_tax_code_21 benchmark governs Reading, requires a score of 8.40 on the SAT, and is not mandatory. The Mathematics_General benchmark (id 3717629) sets the bar at 10.60 for the COMPASS instrument, while the Mathematics_CollegeAlgebra benchmark (gd_taxr_2) requires 12.80 on the Asset test. The instrument_code column links each benchmark to a specific assessment tool, creating the first bridge between policy and practice.

Course levels represent the academic programs and curricular structures to which these benchmarks apply.

**Table `course_levels`**

| course_level_id | course_code | institution_code | course_title | credit_hours | is_developmental | is_credit_bearing | department | semester_offered |
|---|---|---|---|---|---|---|---|---|
| 1 | 10238263 | 4092 | Baseline Series D | 14 | false | false | adaptive-departme-89 | integrated-semester-58 |
| 2 | 4463667 | 82873 | Distributed Assessment | 22 | true | true | distributed-departme-90 | seasonal-semester-59 |
| 3 | 24077793 | state_uk_20 | Adaptive Survey | 30 | false | false | baseline-departme-91 | regional-semester-60 |
| 4 | 1204-0009-L | 8928518 | Primary Corridor A | 38 | true | true | pilot-departme-92 | legacy-semester-61 |

A course level such as Baseline Series D (code 10238263) at institution 4092 carries 14 credit hours, is not developmental, and is offered during an integrated-semester-58 cycle under the adaptive-departme-89 department. The Distributed Assessment course (4463667) at institution 82873 is both developmental and credit-bearing, with 22 credit hours. The Adaptive Survey (24077793) at state_uk_20 is non-credit and non-developmental, while Primary Corridor A (1204-0009-L) at 8928518 is a fully credit-bearing developmental offering. These course-level records establish the academic context against which student readiness is measured.

Assessment instruments are the standardized tools through which student performance is evaluated.

**Table `assessment_instruments`**

| instrument_code | instrument_name | format | administering_body | validity_period_months | is_deprecated | version_number |
|---|---|---|---|---|---|---|
| 5006445 | ACT | Computer | seasonal-administ-83 | 33 | true | VER-2245 |
| 6564383 | SAT | Paper | regional-administ-84 | 37 | false | VER-2249 |
| 476 | COMPASS | Adaptive | legacy-administ-85 | 41 | true | VER-2253 |
| 12300298 | Asset | Computer | compact-administ-86 | 45 | false | VER-2257 |

The ACT instrument (code 5006445) is delivered in Computer format by seasonal-administ-83, carries version VER-2245, has a 33-month validity period, and is currently deprecated. The SAT (6564383) uses Paper format, is administered by regional-administ-84, remains active, and has a 37-month validity window. COMPASS (476) is an Adaptive instrument managed by legacy-administ-85 with a 41-month validity, and Asset (12300298) is a Computer-based tool from compact-administ-86 with a 45-month validity period. The is_deprecated flag signals whether an instrument has been retired from active use, a critical detail for interpreting historical assessment data.

Learning outcomes articulate the specific competencies that students are expected to demonstrate.

**Table `learning_outcomes`**

| outcome_id | domain | objective_text | proficiency_level | assessment_method | is_mandatory | last_reviewed_date | readiness_benchmark_id |
|---|---|---|---|---|---|---|---|
| 2618555 | Writing | compact-objectiv-56 | 28 | Essay | true | 2024-11-22 | 1 |
| lu_tax_code_template_m46 | Reading | composite-objectiv-57 | 33 | Project | false | 2025-04-06 | 2 |
| 168561 | Writing | primary-objectiv-58 | 38 | Exam | true | 2022-09-17 | 3 |
| 1210-0007-M | Reading | adaptive-objectiv-59 | 43 | Portfolio | false | 2023-02-01 | 4 |

Outcome 2618555 targets the Writing domain with objective compact-objectiv-56 at proficiency level 28, assessed via Essay, and is mandatory. It is linked to readiness benchmark 1 and was last reviewed on 2024-11-22. The outcome lu_tax_code_template_m46 addresses Reading with objective composite-objectiv-57 at proficiency level 33, assessed through Project work, and is not mandatory. Outcome 168561 covers Writing with objective primary-objectiv-58 at proficiency level 38, assessed by Exam, and is mandatory. Outcome 1210-0007-M focuses on Reading with objective adaptive-objectiv-59 at proficiency level 43, assessed via Portfolio, and is not mandatory. Each outcome references a readiness_benchmark_id, anchoring the competency to a specific performance threshold.

Student profiles capture the enrollment and demographic context for each learner.

**Table `student_profiles`**

| student_profile_id | student_id | admission_status | high_school_g_p_a | class_rank | has_g_e_d | enrollment_date | institution_code | is_developmental_required | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 392507 | Pending | 6.45 | 8 | false | 2022-05-11 | 4092 | false | 2025-01-01 00:14:00 |
| 1001 | 25388256 | Admitted | 8.90 | 14 | true | 2023-10-22 | 82873 | true | 2025-02-06 03:14:00 |
| 1002 | id_16 | Enrolled | 11.35 | 20 | false | 2024-03-06 | state_uk_20 | false | 2025-03-11 06:14:00 |
| 1003 | gd_taxc_2211 | Deferred | 13.80 | 26 | true | 2025-08-17 | 8928518 | true | 2025-04-16 09:14:00 |

Profile 1000 corresponds to student 392507, who has a Pending admission status, a high school GPA of 6.45, a class rank of 8, no GED, and enrolled at institution 4092 on 2022-05-11. Profile 1001 belongs to student 25388256, who is Admitted with an 8.90 GPA, rank 14, holds a GED, and enrolled at institution 82873 on 2023-10-22. Profile 1002 covers student id_16, who is Enrolled with an 11.35 GPA, rank 20, no GED, and enrolled at state_uk_20 on 2024-03-06. Profile 1003 documents student gd_taxc_2211, who is Deferred with a 13.80 GPA, rank 26, holds a GED, and enrolled at institution 8928518 on 2025-08-17. The is_developmental_required flag indicates whether the student must complete developmental coursework before advancing.

Student assessment records document the actual test events, linking individual students to the instruments they took and the scores they achieved.

**Table `student_assessment_records`**

| student_assessment_record_id | record_id | student_id | test_date | score | percentile | is_expired | testing_center | score_report_id | instrument_code | student_profile_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 392507 | 2024-11-13T22:42:00 | 9.20 | 41 | true | pilot-testing-26 | id_2 | 5006445 | 1000 |
| 2 | 10445619 | 25388256 | 2025-04-24T05:59:00 | 13.40 | 45 | false | extended-testing-27 | delivery | 6564383 | 1001 |
| 3 | 9568457 | id_16 | 2022-09-08T12:16:00 | 17.60 | 49 | true | integrated-testing-28 | 10207159 | 476 | 1002 |
| 4 | 20743593 | gd_taxc_2211 | 2023-02-19T19:33:00 | 21.80 | 53 | false | seasonal-testing-29 | 21387421 | 12300298 | 1003 |

Record 1 (id 10449530) belongs to student 392507, was administered on 2024-11-13, yielded a score of 9.20 at the 41st percentile, is marked expired, was taken at pilot-testing-26, and used instrument 5006445 (ACT). Record 2 (id 10445619) is for student 25388256, tested on 2025-04-24, scored 13.40 at the 45th percentile, is not expired, administered at extended-testing-27, and used instrument 6564383 (SAT). Record 3 (id 9568457) covers student id_16, tested on 2022-09-08, scored 17.60 at the 49th percentile, is expired, taken at integrated-testing-28, and used instrument 476 (COMPASS). Record 4 (id 20743593) documents student gd_taxc_2211, tested on 2023-02-19, scored 21.80 at the 53rd percentile, is not expired, administered at seasonal-testing-29, and used instrument 12300298 (Asset). The student_profile_id column ties each record to the learner's enrollment profile.

The relational model extends beyond these core entities through a set of junction tables that encode the complex many-to-many relationships inherent in educational assessment. The benchmarks_levels and levels_benchmarks tables establish bidirectional mappings between readiness benchmarks and course levels, enabling queries that determine which benchmarks apply to which academic programs.

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

The levels_outcomes and outcomes_levels tables similarly link course levels to learning outcomes, creating the curriculum-to-competency bridge.

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

The instruments_benchmarks table connects assessment instruments to the benchmarks they are designed to measure, ensuring that each instrument is traceable to its intended performance standard.

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

The instruments_records table associates individual assessment records with their corresponding instruments, providing an audit trail from test event to tool.

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

The records_benchmarks table links assessment records directly to benchmarks, enabling compliance checks that determine whether a student's score meets the required threshold.

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

The profiles_records table connects student profiles to their assessment records, forming the primary link between learner identity and test performance.

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

The profiles_levels table maps student profiles to course levels, indicating which programs a student is associated with or required to complete.

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

Finally, the profiles_benchmarks table establishes direct relationships between student profiles and readiness benchmarks, supporting eligibility and placement decisions.

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

These junction tables collectively enable a rich set of analytical views that synthesize data across the domain. The view v_readiness_benchmark_course_level_detail joins readiness benchmarks with course levels to answer which benchmarks are relevant to which academic programs.

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

For instance, this view might reveal that the English benchmark (id 7441141, minimum score 6.20) applies to the Baseline Series D course (10238263), indicating that students in that program must achieve at least a 6.20 on the ACT to demonstrate readiness.

The view v_readiness_benchmark_assessment_instrument connects benchmarks to the instruments used to measure them, clarifying the instrument-benchmark pairing.

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

This view shows, for example, that the English benchmark (id 7441141) is measured using the ACT instrument (code 5006445), confirming the alignment between the benchmark's instrument_code and the actual assessment tool deployed.

The view v_course_level_readiness_benchmark_detail provides the reverse perspective, showing course levels alongside their associated benchmarks.

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

A row in this view might pair the Distributed Assessment course (4463667) with the Reading benchmark (default_chart_a_tax_code_21, minimum score 8.40), indicating that students in this developmental, credit-bearing course must meet the Reading readiness threshold.

The view v_course_level_learning_outcome_detail maps course levels to the learning outcomes they are designed to achieve.

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

This view could show that the Baseline Series D course (10238263) is associated with the Writing outcome 2618555 (objective compact-objectiv-56, proficiency level 28), establishing the competency target for that program.

The view v_assessment_instrument_readiness_benchmark_detail presents assessment instruments alongside the benchmarks they serve.

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

This view might display the SAT instrument (6564383) alongside the Reading benchmark (default_chart_a_tax_code_21, minimum score 8.40), confirming that the SAT is the designated tool for measuring Reading readiness.

The view v_assessment_instrument_student_assessment_record_detail links assessment instruments to the actual student records they generated.

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

This view could show the ACT instrument (5006445) associated with assessment record 10449530, where student 392507 achieved a score of 9.20, providing a direct instrument-to-performance trace.

The view v_learning_outcome_course_level_detail presents learning outcomes alongside the course levels they support.

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

This view might reveal that outcome 2618555 (Writing, proficiency level 28) is supported by course level 10238263 (Baseline Series D), clarifying the curriculum-outcome alignment.

The view v_learning_outcome_readiness_benchmark connects learning outcomes to their parent readiness benchmarks.

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

This view could show outcome 2618555 linked to readiness benchmark 7441141 (English, minimum score 6.20), establishing the competency-to-threshold relationship.

The view v_student_assessment_record_assessment_instrument presents assessment records alongside their instruments.

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

This view might display record 10449530 (score 9.20, student 392507) alongside instrument 5006445 (ACT), confirming the tool used for that test event.

The view v_student_assessment_record_readiness_benchmark_detail links assessment records to the benchmarks they are evaluated against.

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

This view could show record 10449530 (score 9.20) evaluated against benchmark 7441141 (minimum score 6.20), revealing that the student exceeded the English readiness threshold.

The view v_student_assessment_record_student_profile connects assessment records to the student profiles of the test-takers.

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

This view might pair record 10449530 with profile 1000 (student 392507, GPA 6.45, Pending admission), providing the enrollment context for the test performance.

The view v_student_profile_student_assessment_record_detail presents student profiles alongside their assessment records.

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

This view could show profile 1000 (student 392507, institution 4092) alongside record 10449530 (score 9.20, ACT), offering a complete learner-assessment snapshot.

The view v_student_profile_course_level_detail maps student profiles to the course levels they are associated with.

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

This view might reveal that profile 1000 (student 392507) is linked to course level 10238263 (Baseline Series D), indicating the program to which the student is assigned.

The view v_student_profile_readiness_benchmark_detail connects student profiles to the readiness benchmarks that apply to them.

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

This view could show profile 1000 (student 392507, Deferred status) alongside benchmark 7441141 (English, minimum score 6.20), establishing the readiness target for that student's placement evaluation.

The integrity of this assessment ecosystem depends on the precise alignment between its components. Readiness benchmarks define the thresholds, assessment instruments provide the measurement mechanism, learning outcomes specify the competencies, and course levels establish the academic context. Student profiles and assessment records capture the individual performance data, while the junction tables and analytical views weave these elements into a coherent framework for institutional decision-making. When a student such as 392507 achieves a score of 9.20 on the ACT, the system can trace that result through the assessment record to the English benchmark (minimum 6.20), confirm the student's profile context (Pending admission, GPA 6.45), and determine whether the student is prepared for the associated course level. This end-to-end traceability ensures that readiness assessments are not isolated test events but integral components of a structured educational placement and progression system.