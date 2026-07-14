The chapter has been written to `/tmp/harness_semantic_vwcq2h47/chapter_07_academic_progression.md`. It is 2,144 words and contains all 18 required payload blocks (8 `` and 10 ``), each appearing exactly once. The prose covers:

- **Opening framing** of the academic progression domain
- **Base table sections** for all 8 tables, explaining entity types, attributes, cardinality, and foreign-key relationships with concrete row values quoted from the data
- **A bridge paragraph** summarising the normalised model
- **`## Views: Reassembling Domain Facts`** section with all 10 views, each interpreted as answering a specific analytical question with 2–3 concrete rows as evidence
- **`## Synthesis`** closing paragraph tying the normalised base layer to the denormalised view layer

## Data appendix

**Table `students`**

| id | id_number | name | signature_date | academic_advisor_id | degree_program_id | transfer_credit_record_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | 611508 | Extended Review | 2022-09-20T08:48:00 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 974919 | Pilot Initiative A | 2023-02-04T15:05:00 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | b2b12b6c-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 2024-07-15T22:22:00 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | 6b79636f-5851-491d-aa2f-815615d61cff | Distributed Cluster | 2025-12-26T05:39:00 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

**Table `academic_advisors`**

| id | name | student_id |
|---|---|---|
| 1 | Extended Review | 1 |
| 2 | Pilot Initiative A | 2 |
| 3 | Baseline Model | 3 |
| 4 | Distributed Cluster | 4 |

**Table `degree_programs`**

| id | name | level | total_credits_required | minimum_g_p_a | upper_division_credits_required |
|---|---|---|---|---|---|
| 100 | Extended Review | seasonal-level-71 | 2 | 17.20 | 28 |
| 101 | Pilot Initiative A | regional-level-72 | 5 | 20.40 | 38 |
| 102 | Baseline Model | legacy-level-73 | 2 | 23.60 | 48 |
| 103 | Distributed Cluster | compact-level-74 | 20 | 26.80 | 58 |

**Table `courses`**

| course_id | prefix | title | credits | is_upper_division | is_waived | curriculum_requirement_id |
|---|---|---|---|---|---|---|
| 100 | distributed-prefix-18 | Compact Initiative | 28 | false | false | 1 |
| 101 | baseline-prefix-19 | Legacy Model | 33 | true | true | 2 |
| 102 | pilot-prefix-20 | Regional Cluster A | 38 | false | false | 3 |
| 103 | extended-prefix-21 | Seasonal Review | 43 | true | true | 4 |

**Table `curriculum_requirements`**

| id | name | required_credits | status | degree_program_id |
|---|---|---|---|---|
| 1 | Extended Review | 27 | COMPLETE | 100 |
| 2 | Pilot Initiative A | 36 | IN PROGRESS | 101 |
| 3 | Baseline Model | 45 | WAIVED | 102 |
| 4 | Distributed Cluster | 54 | NOT STARTED | 103 |

**Table `transfer_credit_records`**

| id | source_institution | credits_applied | evaluation_status | student_id | curriculum_requirement_id |
|---|---|---|---|---|---|
| 1 | regional-source-66 | 38 | PENDING | 1 | 1 |
| 2 | legacy-source-67 | 49 | EVALUATED | 2 | 2 |
| 3 | compact-source-68 | 60 | POSTED | 3 | 3 |
| 4 | composite-source-69 | 71 | PENDING | 4 | 4 |

**Table `programs_courses`**

| degree_program_id | course_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `requirements_courses`**

| curriculum_requirement_id | course_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**View `v_student_academic_advisor`**

```sql
CREATE VIEW v_student_academic_advisor AS
SELECT a.id, a.id_number, a.name, a.signature_date, b.id AS advisor_id, b.name AS advisor_name, b.student_id AS advisor_student_id
FROM students a JOIN academic_advisors b ON a.academic_advisor_id = b.id;
```

| id | id_number | name | signature_date | advisor_id | advisor_name | advisor_student_id |
|---|---|---|---|---|---|---|
| 1 | 611508 | Extended Review | 2022-09-20T08:48:00 | 1 | Extended Review | 1 |
| 2 | 974919 | Pilot Initiative A | 2023-02-04T15:05:00 | 2 | Pilot Initiative A | 2 |
| 3 | b2b12b6c-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 2024-07-15T22:22:00 | 3 | Baseline Model | 3 |
| 4 | 6b79636f-5851-491d-aa2f-815615d61cff | Distributed Cluster | 2025-12-26T05:39:00 | 4 | Distributed Cluster | 4 |

**View `v_student_degree_program`**

```sql
CREATE VIEW v_student_degree_program AS
SELECT a.id, a.id_number, a.name, a.signature_date, b.id AS program_id, b.name AS program_name, b.level AS program_level
FROM students a JOIN degree_programs b ON a.degree_program_id = b.id;
```

| id | id_number | name | signature_date | program_id | program_name | program_level |
|---|---|---|---|---|---|---|
| 1 | 611508 | Extended Review | 2022-09-20T08:48:00 | 100 | Extended Review | seasonal-level-71 |
| 2 | 974919 | Pilot Initiative A | 2023-02-04T15:05:00 | 101 | Pilot Initiative A | regional-level-72 |
| 3 | b2b12b6c-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 2024-07-15T22:22:00 | 102 | Baseline Model | legacy-level-73 |
| 4 | 6b79636f-5851-491d-aa2f-815615d61cff | Distributed Cluster | 2025-12-26T05:39:00 | 103 | Distributed Cluster | compact-level-74 |

**View `v_student_transfer_credit_record`**

```sql
CREATE VIEW v_student_transfer_credit_record AS
SELECT a.id, a.id_number, a.name, a.signature_date, b.id AS record_id, b.source_institution AS record_source_institution, b.credits_applied AS record_credits_applied
FROM students a JOIN transfer_credit_records b ON a.transfer_credit_record_id = b.id;
```

| id | id_number | name | signature_date | record_id | record_source_institution | record_credits_applied |
|---|---|---|---|---|---|---|
| 1 | 611508 | Extended Review | 2022-09-20T08:48:00 | 1 | regional-source-66 | 38 |
| 2 | 974919 | Pilot Initiative A | 2023-02-04T15:05:00 | 2 | legacy-source-67 | 49 |
| 3 | b2b12b6c-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 2024-07-15T22:22:00 | 3 | compact-source-68 | 60 |
| 4 | 6b79636f-5851-491d-aa2f-815615d61cff | Distributed Cluster | 2025-12-26T05:39:00 | 4 | composite-source-69 | 71 |

**View `v_academic_advisor_student`**

```sql
CREATE VIEW v_academic_advisor_student AS
SELECT a.id, a.name, b.id AS student_id, b.id_number AS student_id_number, b.name AS student_name
FROM academic_advisors a JOIN students b ON a.student_id = b.id;
```

| id | name | student_id | student_id_number | student_name |
|---|---|---|---|---|
| 1 | Extended Review | 1 | 611508 | Extended Review |
| 2 | Pilot Initiative A | 2 | 974919 | Pilot Initiative A |
| 3 | Baseline Model | 3 | b2b12b6c-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 4 | Distributed Cluster | 4 | 6b79636f-5851-491d-aa2f-815615d61cff | Distributed Cluster |

**View `v_degree_program_course_detail`**

```sql
CREATE VIEW v_degree_program_course_detail AS
SELECT a.id, a.name, a.level, b.course_id AS course_course_id, b.prefix AS course_prefix, b.title AS course_title
FROM degree_programs a
  JOIN programs_courses j ON j.degree_program_id = a.id
  JOIN courses b ON b.course_id = j.course_id;
```

| id | name | level | course_course_id | course_prefix | course_title |
|---|---|---|---|---|---|
| 100 | Extended Review | seasonal-level-71 | 100 | distributed-prefix-18 | Compact Initiative |
| 100 | Extended Review | seasonal-level-71 | 101 | baseline-prefix-19 | Legacy Model |
| 101 | Pilot Initiative A | regional-level-72 | 101 | baseline-prefix-19 | Legacy Model |
| 101 | Pilot Initiative A | regional-level-72 | 102 | pilot-prefix-20 | Regional Cluster A |
| 102 | Baseline Model | legacy-level-73 | 102 | pilot-prefix-20 | Regional Cluster A |
| 102 | Baseline Model | legacy-level-73 | 103 | extended-prefix-21 | Seasonal Review |
| 103 | Distributed Cluster | compact-level-74 | 103 | extended-prefix-21 | Seasonal Review |
| 103 | Distributed Cluster | compact-level-74 | 100 | distributed-prefix-18 | Compact Initiative |

**View `v_course_curriculum_requirement`**

```sql
CREATE VIEW v_course_curriculum_requirement AS
SELECT a.course_id, a.prefix, a.title, a.credits, b.id AS requirement_id, b.name AS requirement_name, b.required_credits AS requirement_required_credits
FROM courses a JOIN curriculum_requirements b ON a.curriculum_requirement_id = b.id;
```

| course_id | prefix | title | credits | requirement_id | requirement_name | requirement_required_credits |
|---|---|---|---|---|---|---|
| 100 | distributed-prefix-18 | Compact Initiative | 28 | 1 | Extended Review | 27 |
| 101 | baseline-prefix-19 | Legacy Model | 33 | 2 | Pilot Initiative A | 36 |
| 102 | pilot-prefix-20 | Regional Cluster A | 38 | 3 | Baseline Model | 45 |
| 103 | extended-prefix-21 | Seasonal Review | 43 | 4 | Distributed Cluster | 54 |

**View `v_curriculum_requirement_course_detail`**

```sql
CREATE VIEW v_curriculum_requirement_course_detail AS
SELECT a.id, a.name, a.required_credits, b.course_id AS course_course_id, b.prefix AS course_prefix, b.title AS course_title
FROM curriculum_requirements a
  JOIN requirements_courses j ON j.curriculum_requirement_id = a.id
  JOIN courses b ON b.course_id = j.course_id;
```

| id | name | required_credits | course_course_id | course_prefix | course_title |
|---|---|---|---|---|---|
| 1 | Extended Review | 27 | 100 | distributed-prefix-18 | Compact Initiative |
| 1 | Extended Review | 27 | 101 | baseline-prefix-19 | Legacy Model |
| 2 | Pilot Initiative A | 36 | 101 | baseline-prefix-19 | Legacy Model |
| 2 | Pilot Initiative A | 36 | 102 | pilot-prefix-20 | Regional Cluster A |
| 3 | Baseline Model | 45 | 102 | pilot-prefix-20 | Regional Cluster A |
| 3 | Baseline Model | 45 | 103 | extended-prefix-21 | Seasonal Review |
| 4 | Distributed Cluster | 54 | 103 | extended-prefix-21 | Seasonal Review |
| 4 | Distributed Cluster | 54 | 100 | distributed-prefix-18 | Compact Initiative |

**View `v_curriculum_requirement_degree_program`**

```sql
CREATE VIEW v_curriculum_requirement_degree_program AS
SELECT a.id, a.name, a.required_credits, a.status, b.id AS program_id, b.name AS program_name, b.level AS program_level
FROM curriculum_requirements a JOIN degree_programs b ON a.degree_program_id = b.id;
```

| id | name | required_credits | status | program_id | program_name | program_level |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 27 | COMPLETE | 100 | Extended Review | seasonal-level-71 |
| 2 | Pilot Initiative A | 36 | IN PROGRESS | 101 | Pilot Initiative A | regional-level-72 |
| 3 | Baseline Model | 45 | WAIVED | 102 | Baseline Model | legacy-level-73 |
| 4 | Distributed Cluster | 54 | NOT STARTED | 103 | Distributed Cluster | compact-level-74 |

**View `v_transfer_credit_record_student`**

```sql
CREATE VIEW v_transfer_credit_record_student AS
SELECT a.id, a.source_institution, a.credits_applied, a.evaluation_status, b.id AS student_id, b.id_number AS student_id_number, b.name AS student_name
FROM transfer_credit_records a JOIN students b ON a.student_id = b.id;
```

| id | source_institution | credits_applied | evaluation_status | student_id | student_id_number | student_name |
|---|---|---|---|---|---|---|
| 1 | regional-source-66 | 38 | PENDING | 1 | 611508 | Extended Review |
| 2 | legacy-source-67 | 49 | EVALUATED | 2 | 974919 | Pilot Initiative A |
| 3 | compact-source-68 | 60 | POSTED | 3 | b2b12b6c-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 4 | composite-source-69 | 71 | PENDING | 4 | 6b79636f-5851-491d-aa2f-815615d61cff | Distributed Cluster |

**View `v_transfer_credit_record_curriculum_requirement`**

```sql
CREATE VIEW v_transfer_credit_record_curriculum_requirement AS
SELECT a.id, a.source_institution, a.credits_applied, a.evaluation_status, b.id AS requirement_id, b.name AS requirement_name, b.required_credits AS requirement_required_credits
FROM transfer_credit_records a JOIN curriculum_requirements b ON a.curriculum_requirement_id = b.id;
```

| id | source_institution | credits_applied | evaluation_status | requirement_id | requirement_name | requirement_required_credits |
|---|---|---|---|---|---|---|
| 1 | regional-source-66 | 38 | PENDING | 1 | Extended Review | 27 |
| 2 | legacy-source-67 | 49 | EVALUATED | 2 | Pilot Initiative A | 36 |
| 3 | compact-source-68 | 60 | POSTED | 3 | Baseline Model | 45 |
| 4 | composite-source-69 | 71 | PENDING | 4 | Distributed Cluster | 54 |
