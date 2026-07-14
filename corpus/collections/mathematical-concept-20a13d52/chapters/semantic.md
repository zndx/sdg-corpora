## Ontology-Grounded Relational Modelling of an Academic Curriculum Domain

The domain under examination is an academic curriculum system in which mathematical concepts, courses, textbooks, problem-solving processes, students, and assessments are interrelated through a carefully normalised relational schema. The ontology behind this schema distinguishes six core entity types—`mathematical_concepts`, `courses`, `textbooks`, `problem_solving_processes`, `students`, and `assessments`—alongside four many-to-many association classes that materialise as junction tables. Every entity type is represented by a base table whose columns correspond to the ontology's attributes, while foreign-key columns encode the cardinality-bounded relationships that bind entities together. The views then reconstitute domain facts by joining these normalised tables back into denormalised projections that answer specific analytical questions.

**Table `mathematical_concepts`**

| id | concept_id | concept_name | concept_type | difficulty_level | prerequisite_concept_id | mathematical_concept_id | course_id |
|---|---|---|---|---|---|---|---|
| 1000 | 884350 | Pilot Cluster | skill-oriented | 22 | 778560 | 1000 | 1000 |
| 1001 | 392497 | Baseline Review | concept-oriented | 28 | 505992 | 1001 | 1001 |
| 1002 | 2106713 | Distributed Initiative A | skill-oriented | 34 | account_pymes_132 | 1002 | 1002 |
| 1003 | 4463648 | Adaptive Model | concept-oriented | 40 | 32806 | 1003 | 1003 |

The `mathematical_concepts` table is the conceptual anchor of the schema. Each row represents a distinct mathematical concept, identified by a surrogate `id` (e.g. `1000`) and a business-level `concept_id` (e.g. `884350`). The `concept_name` column carries human-readable labels such as *Pilot Cluster* and *Baseline Review*, while `concept_type` classifies each concept as either `skill-oriented` or `concept-oriented`. The `difficulty_level` column stores an integer measure—values in the sample data range from `22` to `40`—and `prerequisite_concept_id` encodes a self-referential ordering constraint, pointing to the `concept_id` of a concept that must be mastered first (for instance, concept `884350` lists `778560` as its prerequisite). The `mathematical_concept_id` column mirrors the surrogate key to support self-joins, and `course_id` provides a foreign-key link to the `courses` table, establishing a one-to-many relationship: a single course can contain multiple mathematical concepts, but each concept row references exactly one course. In the sample data, concept `1000` (Pilot Cluster) is associated with course `1000`, and concept `1003` (Adaptive Model) with course `1003`.

**Table `courses`**

| id | course_code | course_title | course_level | credit_hours | semester_offered | textbook_id |
|---|---|---|---|---|---|---|
| 1000 | 10238263 | Baseline Series D | elementary | 14 | integrated-semester-58 | 1 |
| 1001 | 4463667 | Distributed Assessment | intermediate | 22 | seasonal-semester-59 | 2 |
| 1002 | 24077793 | Adaptive Survey | college-level | 30 | regional-semester-60 | 3 |
| 1003 | 1204-0009-L | Primary Corridor A | elementary | 38 | legacy-semester-61 | 4 |

The `courses` table captures the structural skeleton of the curriculum. Each course is identified by a surrogate `id` and a human-readable `course_code` (e.g. `10238263` or `1204-0009-L`). The `course_title` column carries descriptive names such as *Baseline Series D* and *Distributed Assessment*, while `course_level` classifies the course as `elementary`, `intermediate`, or `college-level`. The `credit_hours` column stores an integer value—sample rows range from `14` to `38`—and `semester_offered` records the offering period using codes like `integrated-semester-58` and `legacy-semester-61`. The `textbook_id` column is a foreign key into the `textbooks` table, enforcing a one-to-one or one-to-many relationship: each course references a single textbook, but a textbook may be adopted by multiple courses. In the data, course `1000` (Baseline Series D) references textbook `1`, and course `1003` (Primary Corridor A) references textbook `4`.

**Table `textbooks`**

| id | isbn10 | isbn13 | title | edition | publication_date | publisher | price | course_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | composite-isbn10-99 | integrated-isbn13-16 | Compact Initiative | 34 | 2025-12-01 | pilot-publishe-50 | 12.87 | 1000 | 2025-01-01 00:14:00 |
| 2 | primary-isbn10-100 | seasonal-isbn13-17 | Legacy Model | 37 | 2022-05-12 | extended-publishe-51 | 35.45 | 1001 | 2025-02-06 03:14:00 |
| 3 | adaptive-isbn10-101 | regional-isbn13-18 | Regional Cluster A | 40 | 2023-10-23 | integrated-publishe-52 | 29.24 | 1002 | 2025-03-11 06:14:00 |
| 4 | distributed-isbn10-102 | legacy-isbn13-19 | Seasonal Review | 43 | 2024-03-07 | seasonal-publishe-53 | 29.99 | 1003 | 2025-04-16 09:14:00 |

The `textbooks` table stores bibliographic metadata for the course materials. Each textbook has a surrogate `id`, an `isbn10` (e.g. `composite-isbn10-99`), and an `isbn13` (e.g. `integrated-isbn13-16`). The `title` column carries names such as *Compact Initiative* and *Legacy Model*, while `edition` and `publication_date` record the edition number (values `34` through `43`) and the publication date (e.g. `2025-12-01`). The `publisher` column stores publisher identifiers like `pilot-publishe-50`, and `price` stores a decimal value (e.g. `12.87`). The `course_id` column is a foreign key back to `courses`, creating a bidirectional link: the textbook knows which course it serves, and the course knows which textbook it adopts. The `created_at` timestamp (e.g. `2025-01-01 00:14:00`) records when the textbook record was inserted.

**Table `problem_solving_processes`**

| problem_solving_process_id | process_id | step_number | step_description | is_mandatory | course_id | mathematical_concept_id |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 33 | Legacy Cluster D | true | 1000 | 1000 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 37 | Regional Review | false | 1001 | 1001 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 41 | Seasonal Initiative | true | 1002 | 1002 |
| 4 | 1205-0002-XL | 45 | Integrated Model A | false | 1003 | 1003 |

The `problem_solving_processes` table models pedagogical sequences that students follow when engaging with mathematical content. Each row represents a step within a process, identified by a composite of `process_id` (a UUID or template code such as `template_ivacode_pagata_art15`) and `step_number` (e.g. `33`). The `step_description` column carries labels like *Legacy Cluster D* and *Regional Review*, while `is_mandatory` is a boolean flag indicating whether the step is required. The `course_id` and `mathematical_concept_id` columns are foreign keys into the `courses` and `mathematical_concepts` tables respectively, creating a many-to-many relationship: a single process step can be associated with a specific course and a specific mathematical concept simultaneously. In the sample data, step `33` of process `template_ivacode_pagata_art15` is linked to course `1000` and concept `1000`, and is marked as mandatory.

**Table `students`**

| student_id | first_name | last_name | enrollment_date | academic_level | course_id |
|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2022-05-11 | elementary | 1000 |
| 2 | Janice Johnston | Heather Beasley | 2023-10-22 | intermediate | 1001 |
| 3 | Upal Saha | Audrey Taylor | 2024-03-06 | college-level | 1002 |
| 4 | Katherine Snyder | Susan Wagner | 2025-08-17 | elementary | 1003 |

The `students` table records learner enrolments. Each student is identified by a surrogate `student_id` and carries `first_name` and `last_name` columns (e.g. *Stephanie Collins* and *Paul Allen*). The `enrollment_date` column stores the date the student enrolled (e.g. `2022-05-11`), and `academic_level` mirrors the course level classification (`elementary`, `intermediate`, `college-level`). The `course_id` column is a foreign key into `courses`, establishing that each student enrolment is tied to a specific course. In the data, student `1` (Stephanie Collins / Paul Allen) is enrolled in course `1000` at the elementary level, and student `3` (Upal Saha / Audrey Taylor) is enrolled in course `1002` at the college-level.

**Table `assessments`**

| id | assessment_id | assessment_type | date_given | max_score | passing_score | student_id |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | quiz | 2025-08-24 | 7.70 | 13.95 | 1 |
| 2 | 19508914 | exam | 2022-01-08 | 9.40 | 16.90 | 2 |
| 3 | 506000 | homework | 2023-06-19 | 11.10 | 19.85 | 3 |
| 4 | 1204-0009-M | project | 2024-11-03 | 12.80 | 22.80 | 4 |

The `assessments` table captures evaluation events. Each assessment has a surrogate `id`, a business-level `assessment_id` (e.g. `template_ivacode_pagata_20det40ind`), and an `assessment_type` column that classifies the evaluation as `quiz`, `exam`, `homework`, or `project`. The `date_given` column records when the assessment was administered (e.g. `2025-08-24`), while `max_score` and `passing_score` store decimal thresholds (e.g. a maximum of `7.70` with a passing score of `13.95`). The `student_id` column is a foreign key into `students`, linking each assessment to the learner who completed it. In the sample data, assessment `1` is a quiz taken by student `1`, and assessment `4` is a project taken by student `4`.

The schema employs four junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. These association tables bridge the core entities and enable flexible, ontology-consistent modelling of cross-cutting relationships.

**Table `courses_concepts`**

| course_id | mathematical_concept_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `courses_concepts` junction table resolves the many-to-many relationship between courses and mathematical concepts. While `mathematical_concepts` already carries a `course_id` foreign key that establishes a one-to-many link, the `courses_concepts` table provides an explicit association layer that can carry additional metadata about the relationship (such as weighting or sequencing) beyond what a simple foreign key can express. This design supports the ontology's distinction between the structural containment of concepts within courses and the semantic association of concepts with courses as curricular topics.

**Table `textbooks_concepts`**

| textbook_id | mathematical_concept_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `textbooks_concepts` junction table resolves the many-to-many relationship between textbooks and mathematical concepts. A single textbook may cover multiple mathematical concepts, and a single concept may be addressed across multiple textbooks. This association table enables the curriculum system to track which concepts are taught through which materials, independent of the course-level textbook assignment.

**Table `students_concepts`**

| student_id | mathematical_concept_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `students_concepts` junction table resolves the many-to-many relationship between students and mathematical concepts. A student may study multiple concepts across their enrolled courses, and a concept may be studied by multiple students. This table enables granular tracking of which students have engaged with which concepts, supporting learning analytics and prerequisite validation.

**Table `assessments_concepts`**

| assessment_id | mathematical_concept_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `assessments_concepts` junction table resolves the many-to-many relationship between assessments and mathematical concepts. An assessment may evaluate multiple concepts, and a concept may be assessed through multiple evaluations. This association enables precise mapping of assessment coverage, ensuring that each concept is evaluated and that each assessment's scope is documented.

The views in this schema reconstitute domain facts by joining the normalised base tables into denormalised projections that answer specific analytical questions. Each view is named to indicate the primary entity it centres on and the dimension it adds.

**View `mathematical_concept_mathematical_concept_view`**

```sql
CREATE VIEW mathematical_concept_mathematical_concept_view AS
SELECT a.id, a.concept_id, a.concept_name, a.concept_type, b.id AS concept_id, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name
FROM mathematical_concepts a JOIN mathematical_concepts b ON a.mathematical_concept_id = b.id;
```

| id | concept_id | concept_name | concept_type | concept_id | concept_concept_id | concept_concept_name |
|---|---|---|---|---|---|---|
| 1000 | 884350 | Pilot Cluster | skill-oriented | 1000 | 884350 | Pilot Cluster |
| 1001 | 392497 | Baseline Review | concept-oriented | 1001 | 392497 | Baseline Review |
| 1002 | 2106713 | Distributed Initiative A | skill-oriented | 1002 | 2106713 | Distributed Initiative A |
| 1003 | 4463648 | Adaptive Model | concept-oriented | 1003 | 4463648 | Adaptive Model |

The `mathematical_concept_mathematical_concept_view` is a self-join of the `mathematical_concepts` table that exposes the prerequisite hierarchy. By joining the table to itself on the `prerequisite_concept_id` column, the view reconstructs the parent-child relationships between concepts. For example, the row for concept `1000` (Pilot Cluster) would show its prerequisite `778560` alongside its own identifier, making the dependency chain explicit. This view answers the question: "Which concept must be mastered before this one?"

**View `mathematical_concept_course_view`**

```sql
CREATE VIEW mathematical_concept_course_view AS
SELECT a.id, a.concept_id, a.concept_name, a.concept_type, b.id AS course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM mathematical_concepts a JOIN courses b ON a.course_id = b.id;
```

| id | concept_id | concept_name | concept_type | course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|---|
| 1000 | 884350 | Pilot Cluster | skill-oriented | 1000 | 10238263 | Baseline Series D |
| 1001 | 392497 | Baseline Review | concept-oriented | 1001 | 4463667 | Distributed Assessment |
| 1002 | 2106713 | Distributed Initiative A | skill-oriented | 1002 | 24077793 | Adaptive Survey |
| 1003 | 4463648 | Adaptive Model | concept-oriented | 1003 | 1204-0009-L | Primary Corridor A |

The `mathematical_concept_course_view` joins `mathematical_concepts` with `courses` on the `course_id` foreign key, producing a projection that pairs each concept with its parent course. A row from this view might show concept `884350` (Pilot Cluster) alongside course `10238263` (Baseline Series D), answering the question: "Which course teaches this concept?" The join is straightforward because `mathematical_concepts.course_id` is a direct foreign key into `courses.id`.

**View `course_mathematical_concept_detail_view`**

```sql
CREATE VIEW course_mathematical_concept_detail_view AS
SELECT a.id, a.course_code, a.course_title, b.id AS concept_id, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name
FROM courses a
  JOIN courses_concepts j ON j.course_id = a.id
  JOIN mathematical_concepts b ON b.id = j.mathematical_concept_id;
```

| id | course_code | course_title | concept_id | concept_concept_id | concept_concept_name |
|---|---|---|---|---|---|
| 1000 | 10238263 | Baseline Series D | 1000 | 884350 | Pilot Cluster |
| 1000 | 10238263 | Baseline Series D | 1001 | 392497 | Baseline Review |
| 1001 | 4463667 | Distributed Assessment | 1001 | 392497 | Baseline Review |
| 1001 | 4463667 | Distributed Assessment | 1002 | 2106713 | Distributed Initiative A |
| 1002 | 24077793 | Adaptive Survey | 1002 | 2106713 | Distributed Initiative A |
| 1002 | 24077793 | Adaptive Survey | 1003 | 4463648 | Adaptive Model |
| 1003 | 1204-0009-L | Primary Corridor A | 1003 | 4463648 | Adaptive Model |
| 1003 | 1204-0009-L | Primary Corridor A | 1000 | 884350 | Pilot Cluster |

The `course_mathematical_concept_detail_view` inverts the perspective of the previous view, joining `courses` with `mathematical_concepts` to present each course alongside the concepts it contains. A row might display course `10238263` (Baseline Series D) with concept `884350` (Pilot Cluster), answering: "Which concepts are covered in this course?" This view is particularly useful for curriculum planners who need to see the concept coverage of each course at a glance.

**View `course_textbook_view`**

```sql
CREATE VIEW course_textbook_view AS
SELECT a.id, a.course_code, a.course_title, a.course_level, b.id AS textbook_id, b.isbn10 AS textbook_isbn10, b.isbn13 AS textbook_isbn13
FROM courses a JOIN textbooks b ON a.textbook_id = b.id;
```

| id | course_code | course_title | course_level | textbook_id | textbook_isbn10 | textbook_isbn13 |
|---|---|---|---|---|---|---|
| 1000 | 10238263 | Baseline Series D | elementary | 1 | composite-isbn10-99 | integrated-isbn13-16 |
| 1001 | 4463667 | Distributed Assessment | intermediate | 2 | primary-isbn10-100 | seasonal-isbn13-17 |
| 1002 | 24077793 | Adaptive Survey | college-level | 3 | adaptive-isbn10-101 | regional-isbn13-18 |
| 1003 | 1204-0009-L | Primary Corridor A | elementary | 4 | distributed-isbn10-102 | legacy-isbn13-19 |

The `course_textbook_view` joins `courses` with `textbooks` on the `textbook_id` foreign key, producing a projection that pairs each course with its adopted textbook. A row from this view might show course `10238263` (Baseline Series D) alongside textbook `1` (Compact Initiative, ISBN `integrated-isbn13-16`, priced at `12.87`). This view answers the question: "Which textbook is used for this course?" and is essential for procurement and resource planning.

**View `textbook_mathematical_concept_detail_view`**

```sql
CREATE VIEW textbook_mathematical_concept_detail_view AS
SELECT a.id, a.isbn10, a.isbn13, b.id AS concept_id, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name
FROM textbooks a
  JOIN textbooks_concepts j ON j.textbook_id = a.id
  JOIN mathematical_concepts b ON b.id = j.mathematical_concept_id;
```

| id | isbn10 | isbn13 | concept_id | concept_concept_id | concept_concept_name |
|---|---|---|---|---|---|
| 1 | composite-isbn10-99 | integrated-isbn13-16 | 1000 | 884350 | Pilot Cluster |
| 1 | composite-isbn10-99 | integrated-isbn13-16 | 1001 | 392497 | Baseline Review |
| 2 | primary-isbn10-100 | seasonal-isbn13-17 | 1001 | 392497 | Baseline Review |
| 2 | primary-isbn10-100 | seasonal-isbn13-17 | 1002 | 2106713 | Distributed Initiative A |
| 3 | adaptive-isbn10-101 | regional-isbn13-18 | 1002 | 2106713 | Distributed Initiative A |
| 3 | adaptive-isbn10-101 | regional-isbn13-18 | 1003 | 4463648 | Adaptive Model |
| 4 | distributed-isbn10-102 | legacy-isbn13-19 | 1003 | 4463648 | Adaptive Model |
| 4 | distributed-isbn10-102 | legacy-isbn13-19 | 1000 | 884350 | Pilot Cluster |

The `textbook_mathematical_concept_detail_view` joins `textbooks` with `mathematical_concepts` through the `textbooks_concepts` junction table, producing a projection that reveals which mathematical concepts are covered by each textbook. A row might show textbook `1` (Compact Initiative) alongside concept `884350` (Pilot Cluster). This view answers: "Which concepts does this textbook address?" and supports content analysis across the curriculum.

**View `textbook_course_view`**

```sql
CREATE VIEW textbook_course_view AS
SELECT a.id, a.isbn10, a.isbn13, a.title, b.id AS course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM textbooks a JOIN courses b ON a.course_id = b.id;
```

| id | isbn10 | isbn13 | title | course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|---|
| 1 | composite-isbn10-99 | integrated-isbn13-16 | Compact Initiative | 1000 | 10238263 | Baseline Series D |
| 2 | primary-isbn10-100 | seasonal-isbn13-17 | Legacy Model | 1001 | 4463667 | Distributed Assessment |
| 3 | adaptive-isbn10-101 | regional-isbn13-18 | Regional Cluster A | 1002 | 24077793 | Adaptive Survey |
| 4 | distributed-isbn10-102 | legacy-isbn13-19 | Seasonal Review | 1003 | 1204-0009-L | Primary Corridor A |

The `textbook_course_view` joins `textbooks` with `courses` on the `course_id` foreign key within the `textbooks` table, producing a projection that shows which courses adopt each textbook. A row might display textbook `1` (Compact Initiative) alongside course `10238263` (Baseline Series D). This view answers: "Which courses use this textbook?" and is useful for understanding textbook adoption patterns.

**View `problem_solving_process_course_view`**

```sql
CREATE VIEW problem_solving_process_course_view AS
SELECT a.problem_solving_process_id, a.process_id, a.step_number, a.step_description, b.id AS course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM problem_solving_processes a JOIN courses b ON a.course_id = b.id;
```

| problem_solving_process_id | process_id | step_number | step_description | course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 33 | Legacy Cluster D | 1000 | 10238263 | Baseline Series D |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 37 | Regional Review | 1001 | 4463667 | Distributed Assessment |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 41 | Seasonal Initiative | 1002 | 24077793 | Adaptive Survey |
| 4 | 1205-0002-XL | 45 | Integrated Model A | 1003 | 1204-0009-L | Primary Corridor A |

The `problem_solving_process_course_view` joins `problem_solving_processes` with `courses` on the `course_id` foreign key, producing a projection that pairs each problem-solving process step with its parent course. A row from this view might show process step `33` (Legacy Cluster D) alongside course `10238263` (Baseline Series D). This view answers: "Which course includes this problem-solving process step?" and supports pedagogical analysis of process distribution across the curriculum.

**View `problem_solving_process_mathematical_concept_view`**

```sql
CREATE VIEW problem_solving_process_mathematical_concept_view AS
SELECT a.problem_solving_process_id, a.process_id, a.step_number, a.step_description, b.id AS concept_id, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name
FROM problem_solving_processes a JOIN mathematical_concepts b ON a.mathematical_concept_id = b.id;
```

| problem_solving_process_id | process_id | step_number | step_description | concept_id | concept_concept_id | concept_concept_name |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 33 | Legacy Cluster D | 1000 | 884350 | Pilot Cluster |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 37 | Regional Review | 1001 | 392497 | Baseline Review |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 41 | Seasonal Initiative | 1002 | 2106713 | Distributed Initiative A |
| 4 | 1205-0002-XL | 45 | Integrated Model A | 1003 | 4463648 | Adaptive Model |

The `problem_solving_process_mathematical_concept_view` joins `problem_solving_processes` with `mathematical_concepts` on the `mathematical_concept_id` foreign key, producing a projection that links each process step to the mathematical concept it addresses. A row might show process step `33` (Legacy Cluster D) alongside concept `884350` (Pilot Cluster). This view answers: "Which mathematical concept does this process step target?" and is essential for aligning pedagogical methods with conceptual content.

**View `student_course_view`**

```sql
CREATE VIEW student_course_view AS
SELECT a.student_id, a.first_name, a.last_name, a.enrollment_date, b.id AS course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM students a JOIN courses b ON a.course_id = b.id;
```

| student_id | first_name | last_name | enrollment_date | course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2022-05-11 | 1000 | 10238263 | Baseline Series D |
| 2 | Janice Johnston | Heather Beasley | 2023-10-22 | 1001 | 4463667 | Distributed Assessment |
| 3 | Upal Saha | Audrey Taylor | 2024-03-06 | 1002 | 24077793 | Adaptive Survey |
| 4 | Katherine Snyder | Susan Wagner | 2025-08-17 | 1003 | 1204-0009-L | Primary Corridor A |

The `student_course_view` joins `students` with `courses` on the `course_id` foreign key, producing a projection that pairs each student with their enrolled course. A row from this view might show student `1` (Stephanie Collins / Paul Allen) alongside course `10238263` (Baseline Series D) at the elementary level. This view answers: "Which course is this student enrolled in?" and is the foundation for all student-level analytics.

**View `student_mathematical_concept_detail_view`**

```sql
CREATE VIEW student_mathematical_concept_detail_view AS
SELECT a.student_id, a.first_name, a.last_name, b.id AS concept_id, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name
FROM students a
  JOIN students_concepts j ON j.student_id = a.student_id
  JOIN mathematical_concepts b ON b.id = j.mathematical_concept_id;
```

| student_id | first_name | last_name | concept_id | concept_concept_id | concept_concept_name |
|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 1000 | 884350 | Pilot Cluster |
| 1 | Stephanie Collins | Paul Allen | 1001 | 392497 | Baseline Review |
| 2 | Janice Johnston | Heather Beasley | 1001 | 392497 | Baseline Review |
| 2 | Janice Johnston | Heather Beasley | 1002 | 2106713 | Distributed Initiative A |
| 3 | Upal Saha | Audrey Taylor | 1002 | 2106713 | Distributed Initiative A |
| 3 | Upal Saha | Audrey Taylor | 1003 | 4463648 | Adaptive Model |
| 4 | Katherine Snyder | Susan Wagner | 1003 | 4463648 | Adaptive Model |
| 4 | Katherine Snyder | Susan Wagner | 1000 | 884350 | Pilot Cluster |

The `student_mathematical_concept_detail_view` joins `students` with `mathematical_concepts` through the `students_concepts` junction table, producing a projection that reveals which mathematical concepts each student has engaged with. A row might show student `1` (Stephanie Collins / Paul Allen) alongside concept `884350` (Pilot Cluster). This view answers: "Which concepts has this student studied?" and supports personalised learning path analysis.

**View `assessment_mathematical_concept_detail_view`**

```sql
CREATE VIEW assessment_mathematical_concept_detail_view AS
SELECT a.id, a.assessment_id, a.assessment_type, b.id AS concept_id, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name
FROM assessments a
  JOIN assessments_concepts j ON j.assessment_id = a.id
  JOIN mathematical_concepts b ON b.id = j.mathematical_concept_id;
```

| id | assessment_id | assessment_type | concept_id | concept_concept_id | concept_concept_name |
|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | quiz | 1000 | 884350 | Pilot Cluster |
| 1 | template_ivacode_pagata_20det40ind | quiz | 1001 | 392497 | Baseline Review |
| 2 | 19508914 | exam | 1001 | 392497 | Baseline Review |
| 2 | 19508914 | exam | 1002 | 2106713 | Distributed Initiative A |
| 3 | 506000 | homework | 1002 | 2106713 | Distributed Initiative A |
| 3 | 506000 | homework | 1003 | 4463648 | Adaptive Model |
| 4 | 1204-0009-M | project | 1003 | 4463648 | Adaptive Model |
| 4 | 1204-0009-M | project | 1000 | 884350 | Pilot Cluster |

The `assessment_mathematical_concept_detail_view` joins `assessments` with `mathematical_concepts` through the `assessments_concepts` junction table, producing a projection that links each assessment to the mathematical concepts it evaluates. A row might show assessment `1` (a quiz with a maximum score of `7.70`) alongside concept `884350` (Pilot Cluster). This view answers: "Which concepts does this assessment evaluate?" and is critical for ensuring comprehensive concept coverage across the assessment programme.

**View `assessment_student_view`**

```sql
CREATE VIEW assessment_student_view AS
SELECT a.id, a.assessment_id, a.assessment_type, a.date_given, b.student_id AS student_student_id, b.first_name AS student_first_name, b.last_name AS student_last_name
FROM assessments a JOIN students b ON a.student_id = b.student_id;
```

| id | assessment_id | assessment_type | date_given | student_student_id | student_first_name | student_last_name |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | quiz | 2025-08-24 | 1 | Stephanie Collins | Paul Allen |
| 2 | 19508914 | exam | 2022-01-08 | 2 | Janice Johnston | Heather Beasley |
| 3 | 506000 | homework | 2023-06-19 | 3 | Upal Saha | Audrey Taylor |
| 4 | 1204-0009-M | project | 2024-11-03 | 4 | Katherine Snyder | Susan Wagner |

The `assessment_student_view` joins `assessments` with `students` on the `student_id` foreign key, producing a projection that pairs each assessment with the student who completed it. A row from this view might show assessment `1` (quiz, date `2025-08-24`, max score `7.70`) alongside student `1` (Stephanie Collins / Paul Allen). This view answers: "Which student completed this assessment?" and is the primary view for gradebook and performance analysis.

The schema as a whole demonstrates a principled application of ontology-driven relational modelling. Six base tables capture the core entities with attributes mapped to columns and one-to-many relationships encoded as foreign keys. Four junction tables resolve many-to-many associations that the ontology identifies as first-class concepts. Twelve views reconstitute domain facts by joining these normalised tables, each view answering a specific analytical question by projecting the relevant entities and their relationships into a denormalised form. The result is a schema that is both normalised enough to avoid redundancy and denormalised enough—through its views—to support the analytical queries that the curriculum domain requires.