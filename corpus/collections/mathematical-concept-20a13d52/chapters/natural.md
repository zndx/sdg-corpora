## Foundations of Mathematical Curriculum Architecture

Educational institutions organize learning around structured sequences of mathematical concepts, delivered through courses, supported by textbooks, and evaluated via assessments. At the core of this architecture lies a network of interdependent records: concepts carry difficulty ratings and prerequisite chains; courses bundle concepts into credit-bearing offerings; textbooks provide reference material tied to specific courses; problem-solving processes define the procedural steps students must follow; students enroll in courses and accumulate assessment results; and assessments measure mastery against defined passing thresholds. The system tracks not only what is taught but how concepts relate to one another, which textbooks support which courses, and which students have engaged with which material. Understanding this ecosystem requires examining each component in isolation and then observing how the joined views reconstruct the full picture of curriculum delivery and student progress.

**Table `mathematical_concepts`**

| id | concept_id | concept_name | concept_type | difficulty_level | prerequisite_concept_id | mathematical_concept_id | course_id |
|---|---|---|---|---|---|---|---|
| 1000 | 884350 | Pilot Cluster | skill-oriented | 22 | 778560 | 1000 | 1000 |
| 1001 | 392497 | Baseline Review | concept-oriented | 28 | 505992 | 1001 | 1001 |
| 1002 | 2106713 | Distributed Initiative A | skill-oriented | 34 | account_pymes_132 | 1002 | 1002 |
| 1003 | 4463648 | Adaptive Model | concept-oriented | 40 | 32806 | 1003 | 1003 |

Mathematical concepts form the atomic units of curriculum. Each concept carries a unique identifier, a human-readable name, and a classification as either concept-oriented or skill-oriented. The difficulty level is expressed as a numeric value, ranging from 22 for the Pilot Cluster to 40 for the Adaptive Model in the current dataset. Prerequisite relationships are captured through the `prerequisite_concept_id` column, which links a concept to the concept that must be mastered first. For instance, the Pilot Cluster (concept_id 884350) lists 778560 as its prerequisite, while the Baseline Review (concept_id 392497) depends on concept 505992. The `mathematical_concept_id` column provides a secondary identifier that may reference an external taxonomy, and the `course_id` column anchors each concept to a specific course offering. The Distributed Initiative A (concept_id 2106713) carries a difficulty level of 34 and references `account_pymes_132` as its prerequisite, illustrating that prerequisite identifiers can be alphanumeric strings rather than pure integers.

**Table `courses`**

| id | course_code | course_title | course_level | credit_hours | semester_offered | textbook_id |
|---|---|---|---|---|---|---|
| 1000 | 10238263 | Baseline Series D | elementary | 14 | integrated-semester-58 | 1 |
| 1001 | 4463667 | Distributed Assessment | intermediate | 22 | seasonal-semester-59 | 2 |
| 1002 | 24077793 | Adaptive Survey | college-level | 30 | regional-semester-60 | 3 |
| 1003 | 1204-0009-L | Primary Corridor A | elementary | 38 | legacy-semester-61 | 4 |

Courses represent the delivery vehicles for mathematical concepts. Each course has a course code, a title, a level designation, a credit-hour assignment, and a semester classification. The Baseline Series D (course code 10238263) is an elementary-level offering worth 14 credit hours, delivered during integrated-semester-58. The Distributed Assessment course (code 4463667) sits at the intermediate level with 22 credit hours and runs in seasonal-semester-59. The Adaptive Survey (code 24077793) is a college-level course carrying 30 credit hours in regional-semester-60. The Primary Corridor A course (code 1204-0009-L) is elementary-level with 38 credit hours, offered in legacy-semester-61. Each course references a textbook through the `textbook_id` column, establishing a direct link between instructional material and the course it supports.

**Table `textbooks`**

| id | isbn10 | isbn13 | title | edition | publication_date | publisher | price | course_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | composite-isbn10-99 | integrated-isbn13-16 | Compact Initiative | 34 | 2025-12-01 | pilot-publishe-50 | 12.87 | 1000 | 2025-01-01 00:14:00 |
| 2 | primary-isbn10-100 | seasonal-isbn13-17 | Legacy Model | 37 | 2022-05-12 | extended-publishe-51 | 35.45 | 1001 | 2025-02-06 03:14:00 |
| 3 | adaptive-isbn10-101 | regional-isbn13-18 | Regional Cluster A | 40 | 2023-10-23 | integrated-publishe-52 | 29.24 | 1002 | 2025-03-11 06:14:00 |
| 4 | distributed-isbn10-102 | legacy-isbn13-19 | Seasonal Review | 43 | 2024-03-07 | seasonal-publishe-53 | 29.99 | 1003 | 2025-04-16 09:14:00 |

Textbooks serve as the primary reference material for courses. Each textbook record includes ten-digit and thirteen-digit ISBNs, a title, an edition number, a publication date, a publisher name, a price, and a reference to the associated course. The Compact Initiative (edition 34, published 2025-12-01 by pilot-publishe-50) costs $12.87 and supports course 1000. The Legacy Model (edition 37, published 2022-05-12 by extended-publishe-51) is priced at $35.45 and is tied to course 1001. The Regional Cluster A textbook (edition 40, published 2023-10-23 by integrated-publishe-52) costs $29.24 and supports course 1002. The Seasonal Review (edition 43, published 2024-03-07 by seasonal-publishe-53) is priced at $29.99 and is associated with course 1003. The `created_at` timestamp records when each textbook record was entered into the system, ranging from January 2025 to April 2025.

**Table `problem_solving_processes`**

| problem_solving_process_id | process_id | step_number | step_description | is_mandatory | course_id | mathematical_concept_id |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 33 | Legacy Cluster D | true | 1000 | 1000 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 37 | Regional Review | false | 1001 | 1001 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 41 | Seasonal Initiative | true | 1002 | 1002 |
| 4 | 1205-0002-XL | 45 | Integrated Model A | false | 1003 | 1003 |

Problem-solving processes define the procedural steps that students must navigate when engaging with mathematical concepts. Each process record includes a process identifier, a step number, a step description, a mandatory flag, and references to both the course and the mathematical concept. The Legacy Cluster D step (step number 33) is part of the template_ivacode_pagata_art15 process, is marked as mandatory, and is associated with course 1000 and concept 1000. The Regional Review step (step number 37) belongs to process 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3, is not mandatory, and links course 1001 with concept 1001. The Seasonal Initiative step (step number 41) is mandatory and connects process 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 to course 1002 and concept 1002. The Integrated Model A step (step number 45) is non-mandatory and associates process 1205-0002-XL with course 1003 and concept 1003.

**Table `students`**

| student_id | first_name | last_name | enrollment_date | academic_level | course_id |
|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 2022-05-11 | elementary | 1000 |
| 2 | Janice Johnston | Heather Beasley | 2023-10-22 | intermediate | 1001 |
| 3 | Upal Saha | Audrey Taylor | 2024-03-06 | college-level | 1002 |
| 4 | Katherine Snyder | Susan Wagner | 2025-08-17 | elementary | 1003 |

Students are enrolled in courses and tracked through their academic progress. Each student record includes a student identifier, first and last names, an enrollment date, an academic level, and the course they are enrolled in. Stephanie Collins Paul Allen enrolled on 2022-05-11 at the elementary level in course 1000. Janice Johnston Heather Beasley enrolled on 2023-10-22 at the intermediate level in course 1001. Upal Saha Audrey Taylor enrolled on 2024-03-06 at the college-level in course 1002. Katherine Snyder Susan Wagner enrolled on 2025-08-17 at the elementary level in course 1003. The enrollment dates span from 2022 to 2025, reflecting a multi-year student population.

**Table `assessments`**

| id | assessment_id | assessment_type | date_given | max_score | passing_score | student_id |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | quiz | 2025-08-24 | 7.70 | 13.95 | 1 |
| 2 | 19508914 | exam | 2022-01-08 | 9.40 | 16.90 | 2 |
| 3 | 506000 | homework | 2023-06-19 | 11.10 | 19.85 | 3 |
| 4 | 1204-0009-M | project | 2024-11-03 | 12.80 | 22.80 | 4 |

Assessments capture the evaluation events through which student performance is measured. Each assessment record includes an identifier, an assessment type (quiz, exam, homework, or project), a date given, a maximum score, a passing score, and a reference to the student who took the assessment. The quiz (assessment_id template_ivacode_pagata_20det40ind) was given on 2025-08-24 with a maximum score of 7.70 and a passing score of 13.95, administered to student 1. The exam (assessment_id 19508914) was given on 2022-01-08 with a maximum score of 9.40 and a passing score of 16.90, administered to student 2. The homework (assessment_id 506000) was given on 2023-06-19 with a maximum score of 11.10 and a passing score of 19.85, administered to student 3. The project (assessment_id 1204-0009-M) was given on 2024-11-03 with a maximum score of 12.80 and a passing score of 22.80, administered to student 4. Notably, the passing scores exceed the maximum scores in every case, suggesting that the scoring system may use a scaling or normalization convention.

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

The relationship between courses and mathematical concepts is explicitly recorded in the courses_concepts table, which maps each concept to the course in which it is taught. This many-to-many linkage allows a single concept to appear across multiple courses and a single course to contain multiple concepts. The table serves as the bridge between the curriculum design layer and the delivery layer, ensuring that every concept taught in a course is traceable to both its own record and the course record.

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

Textbooks are linked to mathematical concepts through the textbooks_concepts table, establishing which concepts are covered within each textbook. This relationship ensures that instructors and students can identify which textbook resources support which mathematical topics. The linkage complements the course-textbook relationship by providing a finer-grained mapping at the concept level rather than the course level.

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

The students_concepts table records which mathematical concepts each student has engaged with. This creates a direct trace of student learning activity, linking individual students to the specific concepts they have studied. The table enables tracking of concept-level progress independent of course enrollment, allowing for analysis of which concepts students have encountered across their academic careers.

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

Assessments are connected to mathematical concepts through the assessments_concepts table, specifying which concept each assessment event evaluates. This linkage allows the system to determine whether a student has demonstrated proficiency in a particular concept based on their assessment results. The table bridges the evaluation layer with the curriculum layer, making it possible to analyze concept mastery through assessment performance.

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

The mathematical_concept_mathematical_concept_view reconstructs the self-referential structure of mathematical concepts by joining a concept to its own record and to its prerequisite concept. This view answers the question: what is the prerequisite chain for each concept? For the Pilot Cluster (id 1000), the view reveals that concept 884350 depends on prerequisite 778560, with both the concept and its prerequisite carrying the same mathematical_concept_id of 1000. The Baseline Review (id 1001) shows concept 392497 depending on prerequisite 505992, with mathematical_concept_id 1001. The Distributed Initiative A (id 1002) links concept 2106713 to prerequisite account_pymes_132, with mathematical_concept_id 1002. The Adaptive Model (id 1003) connects concept 4463648 to prerequisite 32806, with mathematical_concept_id 1003. This view makes the prerequisite topology explicit, enabling traversal of concept dependency chains.

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

The mathematical_concept_course_view joins mathematical concepts to their parent courses, answering which course each concept belongs to. For concept 884350 (Pilot Cluster), the view shows it is part of course 1000 (Baseline Series D). Concept 392497 (Baseline Review) belongs to course 1001 (Distributed Assessment). Concept 2106713 (Distributed Initiative A) is taught in course 1002 (Adaptive Survey). Concept 4463648 (Adaptive Model) is part of course 1003 (Primary Corridor A). This view provides a clean mapping from individual concepts to the courses that deliver them, supporting curriculum planning and concept-level course searches.

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

The course_mathematical_concept_detail_view enriches the course-concept relationship by including the full concept record alongside the course record. This view answers: what are the detailed properties of each concept within a course? For course 1000 (Baseline Series D), the view reveals concept 884350 (Pilot Cluster) is skill-oriented with difficulty level 22. For course 1001 (Distributed Assessment), concept 392497 (Baseline Review) is concept-oriented with difficulty level 28. For course 1002 (Adaptive Survey), concept 2106713 (Distributed Initiative A) is skill-oriented with difficulty level 34. For course 1003 (Primary Corridor A), concept 4463648 (Adaptive Model) is concept-oriented with difficulty level 40. This view supports curriculum analysis by combining course context with concept attributes, enabling comparisons of concept difficulty and type across courses.

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

The course_textbook_view joins courses to their associated textbooks, answering which textbook supports each course. For course 1000 (Baseline Series D), the view shows textbook 1 (Compact Initiative, ISBN composite-isbn10-99, edition 34, priced at $12.87). For course 1001 (Distributed Assessment), the view links to textbook 2 (Legacy Model, ISBN primary-isbn10-100, edition 37, priced at $35.45). For course 1002 (Adaptive Survey), the view connects to textbook 3 (Regional Cluster A, ISBN adaptive-isbn10-101, edition 40, priced at $29.24). For course 1003 (Primary Corridor A), the view references textbook 4 (Seasonal Review, ISBN distributed-isbn10-102, edition 43, priced at $29.99). This view supports resource planning by making the textbook-course pairing explicit, including publication details and pricing information.

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

The textbook_mathematical_concept_detail_view links textbooks to the mathematical concepts they cover, answering which concepts are addressed in each textbook. For textbook 1 (Compact Initiative), the view reveals the concepts it supports, including concept 884350 (Pilot Cluster) from course 1000. For textbook 2 (Legacy Model), the view shows concept 392497 (Baseline Review) from course 1001. For textbook 3 (Regional Cluster A), the view includes concept 2106713 (Distributed Initiative A) from course 1002. For textbook 4 (Seasonal Review), the view references concept 4463648 (Adaptive Model) from course 1003. This view enables content mapping between textbooks and concepts, supporting decisions about which textbook best covers a given mathematical topic.

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

The textbook_course_view joins textbooks to their associated courses, providing a reverse perspective on the course-textbook relationship. For textbook 1 (Compact Initiative, published by pilot-publishe-50 on 2025-12-01), the view shows it supports course 1000 (Baseline Series D, elementary level, 14 credit hours). For textbook 2 (Legacy Model, published by extended-publishe-51 on 2022-05-12), the view links to course 1001 (Distributed Assessment, intermediate level, 22 credit hours). For textbook 3 (Regional Cluster A, published by integrated-publishe-52 on 2023-10-23), the view connects to course 1002 (Adaptive Survey, college-level, 30 credit hours). For textbook 4 (Seasonal Review, published by seasonal-publishe-53 on 2024-03-07), the view references course 1003 (Primary Corridor A, elementary level, 38 credit hours). This view is useful for publishers and curriculum planners who need to understand which courses adopt each textbook.

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

The problem_solving_process_course_view joins problem-solving processes to their parent courses, answering which processes are associated with each course. For course 1000 (Baseline Series D), the view shows process template_ivacode_pagata_art15 with step 33 (Legacy Cluster D), which is mandatory. For course 1001 (Distributed Assessment), the view links to process 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 with step 37 (Regional Review), which is not mandatory. For course 1002 (Adaptive Survey), the view connects to process 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 with step 41 (Seasonal Initiative), which is mandatory. For course 1003 (Primary Corridor A), the view references process 1205-0002-XL with step 45 (Integrated Model A), which is not mandatory. This view supports procedural curriculum design by making the mandatory and optional steps explicit for each course.

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

The problem_solving_process_mathematical_concept_view joins problem-solving processes to the mathematical concepts they address, answering which concept each process step targets. For concept 884350 (Pilot Cluster), the view shows process template_ivacode_pagata_art15, step 33 (Legacy Cluster D), which is mandatory. For concept 392497 (Baseline Review), the view links to process 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3, step 37 (Regional Review), which is not mandatory. For concept 2106713 (Distributed Initiative A), the view connects to process 57e52fbc-8fcd-11eb-924d-9cd76263cbd0, step 41 (Seasonal Initiative), which is mandatory. For concept 4463648 (Adaptive Model), the view references process 1205-0002-XL, step 45 (Integrated Model A), which is not mandatory. This view enables analysis of which procedural steps are required for mastering each concept.

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

The student_course_view joins students to their enrolled courses, answering which course each student is taking. For student 1 (Stephanie Collins Paul Allen, enrolled 2022-05-11 at elementary level), the view shows enrollment in course 1000 (Baseline Series D). For student 2 (Janice Johnston Heather Beasley, enrolled 2023-10-22 at intermediate level), the view links to course 1001 (Distributed Assessment). For student 3 (Upal Saha Audrey Taylor, enrolled 2024-03-06 at college-level), the view connects to course 1002 (Adaptive Survey). For student 4 (Katherine Snyder Susan Wagner, enrolled 2025-08-17 at elementary level), the view references course 1003 (Primary Corridor A). This view provides a clear enrollment roster, combining student demographics with course information.

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

The student_mathematical_concept_detail_view links students to the mathematical concepts they have engaged with, answering which concepts each student has studied. For student 1 (Stephanie Collins Paul Allen), the view shows engagement with concept 884350 (Pilot Cluster), a skill-oriented concept at difficulty level 22 from course 1000. For student 2 (Janice Johnston Heather Beasley), the view links to concept 392497 (Baseline Review), a concept-oriented concept at difficulty level 28 from course 1001. For student 3 (Upal Saha Audrey Taylor), the view connects to concept 2106713 (Distributed Initiative A), a skill-oriented concept at difficulty level 34 from course 1002. For student 4 (Katherine Snyder Susan Wagner), the view references concept 4463648 (Adaptive Model), a concept-oriented concept at difficulty level 40 from course 1003. This view supports personalized learning analysis by combining student identity with concept-level engagement data.

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

The assessment_mathematical_concept_detail_view joins assessments to the mathematical concepts they evaluate, answering which concept each assessment targets. For assessment template_ivacode_pagata_20det40ind (quiz, given 2025-08-24, max score 7.70, passing score 13.95), the view shows it evaluates concept 884350 (Pilot Cluster) from course 1000. For assessment 19508914 (exam, given 2022-01-08, max score 9.40, passing score 16.90), the view links to concept 392497 (Baseline Review) from course 1001. For assessment 506000 (homework, given 2023-06-19, max score 11.10, passing score 19.85), the view connects to concept 2106713 (Distributed Initiative A) from course 1002. For assessment 1204-0009-M (project, given 2024-11-03, max score 12.80, passing score 22.80), the view references concept 4463648 (Adaptive Model) from course 1003. This view enables concept-level assessment analysis, revealing which concepts are being tested and through which assessment formats.

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

The assessment_student_view joins assessments to the students who took them, answering which student completed which assessment. For student 1 (Stephanie Collins Paul Allen), the view shows assessment template_ivacode_pagata_20det40ind, a quiz given on 2025-08-24 with a maximum score of 7.70 and a passing score of 13.95. For student 2 (Janice Johnston Heather Beasley), the view links to assessment 19508914, an exam given on 2022-01-08 with a maximum score of 9.40 and a passing score of 16.90. For student 3 (Upal Saha Audrey Taylor), the view connects to assessment 506000, a homework assignment given on 2023-06-19 with a maximum score of 11.10 and a passing score of 19.85. For student 4 (Katherine Snyder Susan Wagner), the view references assessment 1204-0009-M, a project given on 2024-11-03 with a maximum score of 12.80 and a passing score of 22.80. This view provides the complete assessment history for each student, combining assessment type, dates, and scoring parameters with student identity.

## Synthesis

The mathematical curriculum architecture described here operates as an integrated system of records, each serving a distinct function while remaining connected through explicit foreign-key relationships. Mathematical concepts carry the intrinsic properties of the curriculum — their names, types, difficulty levels, and prerequisite chains. Courses package these concepts into credit-bearing offerings with defined levels and semesters. Textbooks provide the reference material, each tied to a specific course and covering specific concepts. Problem-solving processes define the procedural steps students must follow, with mandatory and optional distinctions. Students enroll in courses and accumulate assessment results, creating a longitudinal record of engagement and performance. Assessments measure mastery against defined thresholds, each linked to a specific concept and student. The join views reconstruct these relationships into readable narratives: which concepts belong to which courses, which textbooks support which courses, which processes target which concepts, which students study which concepts, and which assessments evaluate which concepts for which students. Together, these tables and views form a complete operational picture of how mathematical education is organized, delivered, and evaluated.