Academic administration at scale demands a disciplined architecture for tracking student progress across degree programs, course requirements, and transfer evaluations. Every institution faces the same fundamental challenge: maintaining a coherent record of who is studying what, under whose advisement, and against which curriculum standards. The system described here organizes that complexity into a set of interlocking records—students, advisors, degree programs, courses, curriculum requirements, and transfer credit evaluations—each anchored by stable identifiers and linked through explicit foreign-key relationships. Practitioners rely on these relationships to answer operational questions: Which advisor is responsible for a given student? Which courses satisfy a curriculum requirement? How do transfer credits map to degree progress? The following chapter walks through the domain's entities, their interconnections, and the analytical views that synthesize them into actionable information.

## Student Records and Advising Assignments

At the center of the academic record is the student. Each student carries a unique identifier, an institutional ID number, a full name, and a signature date marking their formal enrollment or agreement. The student record also anchors three critical foreign keys: the academic advisor assigned to them, the degree program they are pursuing, and the transfer credit record associated with their current standing.

**Table `students`**

| id | id_number | name | signature_date | academic_advisor_id | degree_program_id | transfer_credit_record_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | 611508 | Extended Review | 2022-09-20T08:48:00 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 974919 | Pilot Initiative A | 2023-02-04T15:05:00 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | b2b12b6c-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 2024-07-15T22:22:00 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | 6b79636f-5851-491d-aa2f-815615d61cff | Distributed Cluster | 2025-12-26T05:39:00 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

Consider the student with ID number `611508`, named Extended Review, who signed on 2022-09-20. This student is enrolled in degree program 100 and is advised by advisor ID 1. Their transfer credit record is ID 1. The second student, Pilot Initiative A (ID number `974919`), signed more recently on 2023-02-04 and is associated with degree program 101 and advisor ID 2. The third and fourth students—Baseline Model and Distributed Cluster—carry UUID-style identifiers and were enrolled in 2024 and 2025 respectively, each linked to their own advisor, degree program, and transfer credit record. The `created_at` timestamps show when each record entered the system, ranging from January 2025 through April 2025.

The advising relationship is captured in a dedicated table that pairs advisor names with the students they counsel.

**Table `academic_advisors`**

| id | name | student_id |
|---|---|---|
| 1 | Extended Review | 1 |
| 2 | Pilot Initiative A | 2 |
| 3 | Baseline Model | 3 |
| 4 | Distributed Cluster | 4 |

Advisor ID 1, named Extended Review, is assigned to student ID 1. Advisor ID 2, named Pilot Initiative A, counsels student ID 2. The naming convention here mirrors the student names, which is a data characteristic worth noting: the advisor and student records share identical names within each pairing. This one-to-one mapping between advisors and students in the current dataset simplifies the advising structure, though the design supports more complex many-to-many relationships through the views described later.

## Degree Programs and Their Requirements

Degree programs define the academic pathways students follow. Each program has a name, a level designation, a total credit requirement, a minimum GPA threshold, and a requirement for upper-division credits.

**Table `degree_programs`**

| id | name | level | total_credits_required | minimum_g_p_a | upper_division_credits_required |
|---|---|---|---|---|---|
| 100 | Extended Review | seasonal-level-71 | 2 | 17.20 | 28 |
| 101 | Pilot Initiative A | regional-level-72 | 5 | 20.40 | 38 |
| 102 | Baseline Model | legacy-level-73 | 2 | 23.60 | 48 |
| 103 | Distributed Cluster | compact-level-74 | 20 | 26.80 | 58 |

Program 100, named Extended Review, operates at the seasonal-level-71 tier and requires 2 total credits with a minimum GPA of 17.20 and 28 upper-division credits. Program 101, Pilot Initiative A, sits at regional-level-72, demands 5 total credits, a 20.40 minimum GPA, and 38 upper-division credits. Program 102, Baseline Model, is classified as legacy-level-73 with 2 total credits, a 23.60 GPA floor, and 48 upper-division credits. Program 103, Distributed Cluster, represents compact-level-74, requiring 20 total credits, a 26.80 minimum GPA, and 58 upper-division credits. The level designations and credit thresholds vary considerably across programs, reflecting the diversity of academic tracks available.

## Courses and Curriculum Mapping

Courses are the building blocks of degree completion. Each course carries a course ID, a prefix, a title, a credit value, and flags indicating whether it counts as upper-division and whether it has been waived.

**Table `courses`**

| course_id | prefix | title | credits | is_upper_division | is_waived | curriculum_requirement_id |
|---|---|---|---|---|---|---|
| 100 | distributed-prefix-18 | Compact Initiative | 28 | false | false | 1 |
| 101 | baseline-prefix-19 | Legacy Model | 33 | true | true | 2 |
| 102 | pilot-prefix-20 | Regional Cluster A | 38 | false | false | 3 |
| 103 | extended-prefix-21 | Seasonal Review | 43 | true | true | 4 |

Course 100, prefixed distributed-prefix-18 and titled Compact Initiative, carries 28 credits and is not classified as upper-division; it has not been waived. Course 101, baseline-prefix-19 (Legacy Model), carries 33 credits, is upper-division, and has been waived. Course 102, pilot-prefix-20 (Regional Cluster A), carries 38 credits and is not upper-division. Course 103, extended-prefix-21 (Seasonal Review), carries 43 credits, is upper-division, and has been waived. Each course is also linked to a curriculum requirement through the `curriculum_requirement_id` column, establishing the bridge between individual courses and broader curricular goals.

Curriculum requirements themselves define the structured learning objectives within each degree program.

**Table `curriculum_requirements`**

| id | name | required_credits | status | degree_program_id |
|---|---|---|---|---|
| 1 | Extended Review | 27 | COMPLETE | 100 |
| 2 | Pilot Initiative A | 36 | IN PROGRESS | 101 |
| 3 | Baseline Model | 45 | WAIVED | 102 |
| 4 | Distributed Cluster | 54 | NOT STARTED | 103 |

Requirement ID 1, named Extended Review, requires 27 credits and is marked COMPLETE for degree program 100. Requirement ID 2, Pilot Initiative A, requires 36 credits, is IN PROGRESS, and belongs to program 101. Requirement ID 3, Baseline Model, requires 45 credits, is WAIVED, and maps to program 102. Requirement ID 4, Distributed Cluster, requires 54 credits, is NOT STARTED, and is associated with program 103. The status field—COMPLETE, IN PROGRESS, WAIVED, NOT STARTED—provides a real-time snapshot of curricular fulfillment across programs.

## Transfer Credit Evaluations

Transfer credit records document credits earned at other institutions and their current evaluation status.

**Table `transfer_credit_records`**

| id | source_institution | credits_applied | evaluation_status | student_id | curriculum_requirement_id |
|---|---|---|---|---|---|
| 1 | regional-source-66 | 38 | PENDING | 1 | 1 |
| 2 | legacy-source-67 | 49 | EVALUATED | 2 | 2 |
| 3 | compact-source-68 | 60 | POSTED | 3 | 3 |
| 4 | composite-source-69 | 71 | PENDING | 4 | 4 |

Record ID 1 originates from regional-source-66, applied 38 credits, and is currently PENDING evaluation for student ID 1 against curriculum requirement ID 1. Record ID 2 comes from legacy-source-67, applied 49 credits, and has been EVALUATED for student ID 2 against requirement ID 2. Record ID 3, from compact-source-68, applied 60 credits, is POSTED for student ID 3 against requirement ID 3. Record ID 4, from composite-source-69, applied 71 credits, is PENDING for student ID 4 against requirement ID 4. The evaluation_status field—PENDING, EVALUATED, POSTED—tracks the lifecycle of transfer credit processing from initial submission through final posting to the student's record.

## Junction Tables and Program-Course Relationships

The relationship between degree programs and courses is mediated through a junction table that explicitly links programs to the courses they contain.

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

This table establishes which courses are offered within which degree programs, enabling the system to answer questions about program composition and course availability.

Similarly, the relationship between curriculum requirements and courses is captured in a dedicated junction table.

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

This table maps curriculum requirements to the specific courses that satisfy them, forming the basis for degree audit and progress tracking.

## Analytical Views: Student-Centric Perspectives

The system provides several views that join base tables to answer common operational questions. The first set of views centers on the student record.

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

This view joins the student table with the academic advisors table, answering the question: which advisor is assigned to each student? Reading the first row, student ID 1 (Extended Review, ID number 611508) is advised by advisor ID 1 (Extended Review). The second row shows student ID 2 (Pilot Initiative A, ID number 974919) advised by advisor ID 2 (Pilot Initiative A). This view is essential for advising offices that need to generate rosters of assigned students.

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

This view links students to their degree programs, answering: which program is each student enrolled in? The first row connects student ID 1 to degree program 100 (Extended Review, seasonal-level-71, requiring 2 total credits with a 17.20 minimum GPA). The second row links student ID 2 to program 101 (Pilot Initiative A, regional-level-72, requiring 5 total credits with a 20.40 minimum GPA). This view supports enrollment reporting and program-level analytics.

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

This view joins students with their transfer credit records, answering: what transfer credits is each student currently processing? The first row shows student ID 1 with transfer record ID 1 from regional-source-66, carrying 38 applied credits in PENDING status. The second row links student ID 2 to record ID 2 from legacy-source-67, with 49 applied credits in EVALUATED status. This view is critical for transfer credit offices tracking evaluation pipelines.

## Analytical Views: Advisor and Program Perspectives

The next set of views supports advisor and program-level analysis.

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

This view reverses the advising relationship, answering: which students are assigned to each advisor? The first row shows advisor ID 1 (Extended Review) with student ID 1 (Extended Review, ID number 611508). The second row links advisor ID 2 (Pilot Initiative A) to student ID 2 (Pilot Initiative A, ID number 974919). This perspective is useful for workload balancing and advising effectiveness studies.

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

This view connects degree programs to their constituent courses, answering: which courses belong to which degree programs? The first row links degree program 100 (Extended Review) to course 100 (Compact Initiative, 28 credits, distributed-prefix-18). The second row connects program 101 (Pilot Initiative A) to course 101 (Legacy Model, 33 credits, baseline-prefix-19). This view supports curriculum planning and course catalog management.

## Analytical Views: Curriculum and Requirement Perspectives

The curriculum-focused views provide deeper insight into how courses satisfy requirements and how requirements fit within programs.

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

This view joins courses with their associated curriculum requirements, answering: which curriculum requirement does each course satisfy? The first row links course 100 (Compact Initiative) to curriculum requirement ID 1 (Extended Review, requiring 27 credits, status COMPLETE). The second row connects course 101 (Legacy Model) to requirement ID 2 (Pilot Initiative A, requiring 36 credits, status IN PROGRESS). This view is essential for understanding course-to-requirement alignment.

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

This view provides the reverse perspective: for each curriculum requirement, which courses satisfy it? The first row shows requirement ID 1 (Extended Review, 27 required credits, COMPLETE) satisfied by course 100 (Compact Initiative, 28 credits, distributed-prefix-18). The second row links requirement ID 2 (Pilot Initiative A, 36 required credits, IN PROGRESS) to course 101 (Legacy Model, 33 credits, baseline-prefix-19). This view supports degree audit systems that verify whether a student has completed the courses needed for each requirement.

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

This view connects curriculum requirements to their parent degree programs, answering: which degree program does each curriculum requirement belong to? The first row shows requirement ID 1 (Extended Review, 27 required credits, COMPLETE) belonging to degree program 100 (Extended Review, seasonal-level-71). The second row links requirement ID 2 (Pilot Initiative A, 36 required credits, IN PROGRESS) to program 101 (Pilot Initiative A, regional-level-72). This view is fundamental for program-level curriculum reporting.

## Analytical Views: Transfer Credit Perspectives

The final set of views supports transfer credit analysis from multiple angles.

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

This view joins transfer credit records with their associated students, answering: which student is each transfer credit record associated with? The first row links transfer record ID 1 (from regional-source-66, 38 applied credits, PENDING) to student ID 1 (Extended Review, ID number 611508). The second row connects record ID 2 (from legacy-source-67, 49 applied credits, EVALUATED) to student ID 2 (Pilot Initiative A, ID number 974919). This view is used by transfer credit offices to generate student-specific transfer summaries.

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

This view connects transfer credit records to their associated curriculum requirements, answering: which curriculum requirement is each transfer credit record being applied toward? The first row links transfer record ID 1 (from regional-source-66, 38 applied credits, PENDING) to curriculum requirement ID 1 (Extended Review, 27 required credits, COMPLETE). The second row connects record ID 2 (from legacy-source-67, 49 applied credits, EVALUATED) to requirement ID 2 (Pilot Initiative A, 36 required credits, IN PROGRESS). This view enables analysis of how transfer credits contribute to specific curricular goals and helps identify requirements that are over- or under-served by transfer credit volume.

## Synthesis

The academic administration domain described here is built on a foundation of clear entity boundaries and explicit relationships. Students are the central actors, each linked to an advisor, a degree program, and a transfer credit record. Degree programs define the academic structure, specifying credit requirements, GPA thresholds, and upper-division expectations. Courses and curriculum requirements form the instructional backbone, with junction tables mediating the many-to-many relationships between programs, courses, and requirements. Transfer credit records capture the external academic history of students, tracking the evaluation pipeline from PENDING through EVALUATED to POSTED.

The analytical views synthesize these base tables into operational perspectives: student-centric views support advising and enrollment workflows, advisor and program views support resource allocation and curriculum planning, and curriculum and transfer views support degree audit and credit evaluation processes. Together, these records and views form a coherent information architecture that enables institutions to manage student progress, track curriculum fulfillment, and process transfer credits with precision and accountability.