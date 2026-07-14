## Academic Program Architecture and Course Governance

Higher education institutions organize their curricula through a layered architecture of academic programs, degree requirements, course lists, and subfields. Each program defines a degree type—Bachelor of Arts, Bachelor of Science, Master of Arts, or Doctor of Philosophy—and carries an effective date from which its structure becomes operative. Within each program, degree requirements establish the academic obligations students must satisfy, categorized as major, track, breadth, or elective. These requirements are fulfilled by courses, which are themselves grouped into course lists and associated with academic subfields that reflect disciplinary orientations. The following reference describes how these entities interrelate, how their attributes govern curricular decisions, and how joined views surface the relationships that administrators and advisors rely on daily.

**Table `academic_programs`**

| academic_program_id | program_code | title | degree_type | effective_date | status |
|---|---|---|---|---|---|
| 1 | 191 | Compact Initiative | B.A. | 2023-02-14T13:27:00 | active |
| 2 | 1186082 | Legacy Model | B.S. | 2024-07-25T20:44:00 | inactive |
| 3 | 3990187 | Regional Cluster A | M.A. | 2025-12-09T03:01:00 | active |
| 4 | flexible-thinking | Seasonal Review | Ph.D. | 2022-05-20T10:18:00 | inactive |

The `academic_programs` table anchors the entire curricular structure. Each row represents a distinct program of study identified by a unique `academic_program_id` and a human-readable `program_code`. The `title` field carries the program name, while `degree_type` specifies the credential awarded. The `effective_date` marks when the program's curriculum took effect, and `status` indicates whether the program is currently active or has been retired. Consider program 191, titled "Compact Initiative," which confers a B.A. degree and has been active since February 2023. By contrast, program code "flexible-thinking" (ID 4) offers a Ph.D. but carries an inactive status, suggesting it has been superseded or paused. The `academic_program_id` serves as the primary key and appears as a foreign key in both `degree_requirements` and `subfields`, establishing the top-down hierarchy: programs contain requirements and subfields.

**Table `degree_requirements`**

| degree_requirement_id | requirement_id | title | category | min_courses | status | academic_program_id |
|---|---|---|---|---|---|---|
| 100 | 778568 | Compact Initiative | major | 44 | active | 1 |
| 101 | lu_tax_code_template_b_VB-EC-0 | Legacy Model | track | 50 | inactive | 2 |
| 102 | 99901 | Regional Cluster A | breadth | 56 | active | 3 |
| 103 | 5917277 | Seasonal Review | elective | 62 | inactive | 4 |

Degree requirements translate program-level goals into concrete academic obligations. The `degree_requirement_id` uniquely identifies each requirement, while `requirement_id` provides an external or legacy identifier. The `title` mirrors the requirement's name, and `category` classifies it as major, track, breadth, or elective—each category carrying distinct weight in a student's degree plan. The `min_courses` field specifies the minimum number of courses a student must complete within that requirement, and `status` tracks whether the requirement is currently enforced. Requirement 100, "Compact Initiative," is a major requirement under program 1 that mandates at least 44 courses. Requirement 102, "Regional Cluster A," is an active breadth requirement under program 3 requiring a minimum of 56 courses. The `academic_program_id` column links each requirement back to its parent program, ensuring that requirements are scoped to the correct degree structure.

**Table `courses`**

| id | course_code | title | units | level | status | degree_requirement_id | course_list_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10238263 | Compact Initiative | 6 | lower | active | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 4463667 | Legacy Model | 8 | upper | inactive | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 24077793 | Regional Cluster A | 1 | lower | active | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 1204-0009-L | Seasonal Review | 9 | upper | inactive | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Courses are the fundamental instructional units. Each course carries a numeric or alphanumeric `course_code`, a descriptive `title`, and a `units` value indicating its credit weight. The `level` attribute distinguishes lower-division from upper-division offerings, while `status` indicates whether the course is currently active or inactive. Course 10238263, "Compact Initiative," is a lower-division course worth 6 units and is currently active. Course 1204-0009-L, "Seasonal Review," is an upper-division course carrying 9 units but is marked inactive. The `degree_requirement_id` and `course_list_id` columns on the courses table create direct associations: each course can belong to a degree requirement and to a course list simultaneously, enabling multiple organizational lenses on the same instructional offering.

**Table `course_lists`**

| id | list_id | title | selection_count | status | degree_requirement_id |
|---|---|---|---|---|---|
| 1 | 3001009030140 | Compact Initiative | 2 | active | 100 |
| 2 | 338543 | Legacy Model | 2 | inactive | 101 |
| 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | Regional Cluster A | 8 | active | 102 |
| 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | Seasonal Review | 2 | inactive | 103 |

Course lists provide an alternative organizational structure for grouping courses independently of degree requirements. Each list has a `list_id` (a UUID or numeric identifier), a `title`, and a `selection_count` indicating how many courses have been assigned to it. The `status` field tracks whether the list is active, and `degree_requirement_id` links the list to a specific requirement, creating a bridge between the list-based and requirement-based views of the curriculum. List 3001009030140, "Compact Initiative," is active and contains 2 courses linked to requirement 100. List eb56fb15-2499-4b47-b59d-8319ca5ad273, "Regional Cluster A," is active and contains 8 courses linked to requirement 102. The `id` column serves as the primary key for the table.

**Table `subfields`**

| id | subfield_code | title | discipline | status | academic_program_id |
|---|---|---|---|---|---|
| 1 | 1437575 | Compact Initiative | adaptive-discipli-53 | active | 1 |
| 2 | 6564384 | Legacy Model | distributed-discipli-54 | inactive | 2 |
| 3 | 13061773 | Regional Cluster A | baseline-discipli-55 | active | 3 |
| 4 | 5917272 | Seasonal Review | pilot-discipli-56 | inactive | 4 |

Subfields represent disciplinary or thematic specializations within academic programs. Each subfield has a `subfield_code`, a `title`, and a `discipline` field that describes its academic orientation—values such as "adaptive-discipli-53" or "distributed-discipli-54" indicate the specific disciplinary classification. The `status` field tracks whether the subfield is currently recognized, and `academic_program_id` ties it to its parent program. Subfield 1437575, "Compact Initiative," belongs to program 1 and carries the discipline label "adaptive-discipli-53." Subfield 13061773, "Regional Cluster A," is an active subfield within program 3 classified under "baseline-discipli-55." The `id` column is the primary key and is referenced by the junction table `subfields_courses`.

The relational structure extends beyond these five core tables through three junction tables that resolve many-to-many relationships. The `requirements_courses` table links degree requirements to the courses that satisfy them. The `programs_requirements` table links academic programs to their degree requirements. The `lists_courses` table links course lists to their member courses. The `subfields_courses` table links subfields to the courses that fall within their disciplinary scope.

**Table `requirements_courses`**

| degree_requirement_id | course_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `requirements_courses` junction table establishes which courses fulfill which degree requirements. Each row pairs a `degree_requirement_id` with a `course_id`. Requirement 100 includes courses 1 and 2; requirement 101 includes courses 2 and 3; requirement 102 includes courses 3 and 4; and requirement 103 includes courses 4 and 1. This creates a web of cross-references where a single course may satisfy multiple requirements and a single requirement may be satisfied by multiple courses. The table has no primary key of its own—its composite key is the pair (`degree_requirement_id`, `course_id`).

**Table `programs_requirements`**

| academic_program_id | degree_requirement_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `programs_requirements` table links academic programs to their constituent degree requirements. This table ensures that every requirement is scoped to exactly one program, even though a program may contain many requirements. The foreign keys reference `academic_program_id` and `degree_requirement_id`, forming a composite relationship that enforces referential integrity across the program-requirement boundary.

**Table `lists_courses`**

| course_list_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `lists_courses` table connects course lists to their member courses. Each row pairs a `list_id` with a `course_id`, enabling a course to appear in multiple lists and a list to contain multiple courses. This structure supports flexible curricular organization where the same course can be grouped under different thematic or administrative umbrellas.

**Table `subfields_courses`**

| subfield_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `subfields_courses` table associates subfields with courses, allowing courses to be classified under one or more disciplinary specializations. Each row pairs a `subfield_id` with a `course_id`, creating a many-to-many relationship that supports courses spanning multiple subfields and subfields encompassing multiple courses.

With the base tables established, the following views provide pre-joined perspectives that answer specific operational questions. Each view collapses multiple tables into a single result set, enabling administrators to query relationships without constructing joins manually.

**View `v_course_degree_requirement`**

```sql
CREATE VIEW v_course_degree_requirement AS
SELECT a.id, a.course_code, a.title, a.units, b.degree_requirement_id AS requirement_degree_requirement_id, b.requirement_id AS requirement_requirement_id, b.title AS requirement_title
FROM courses a JOIN degree_requirements b ON a.degree_requirement_id = b.degree_requirement_id;
```

| id | course_code | title | units | requirement_degree_requirement_id | requirement_requirement_id | requirement_title |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Compact Initiative | 6 | 100 | 778568 | Compact Initiative |
| 2 | 4463667 | Legacy Model | 8 | 101 | lu_tax_code_template_b_VB-EC-0 | Legacy Model |
| 3 | 24077793 | Regional Cluster A | 1 | 102 | 99901 | Regional Cluster A |
| 4 | 1204-0009-L | Seasonal Review | 9 | 103 | 5917277 | Seasonal Review |

The view `v_course_degree_requirement` joins courses with their associated degree requirements, answering the question: "Which degree requirement does each course satisfy?" This view is essential for advisors verifying that a student's completed courses map to the correct requirement categories. For example, course 10238263 ("Compact Initiative") appears in this view linked to requirement 100, which is categorized as a major requirement under program 1. Course 1204-0009-L ("Seasonal Review") maps to requirement 103, an elective requirement under program 4. The view surfaces the course's `course_code`, `title`, `units`, and `level` alongside the requirement's `title`, `category`, and `min_courses`, providing a complete picture of the course's role within the degree structure.

**View `v_course_course_list`**

```sql
CREATE VIEW v_course_course_list AS
SELECT a.id, a.course_code, a.title, a.units, b.id AS list_id, b.list_id AS list_list_id, b.title AS list_title
FROM courses a JOIN course_lists b ON a.course_list_id = b.id;
```

| id | course_code | title | units | list_id | list_list_id | list_title |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Compact Initiative | 6 | 1 | 3001009030140 | Compact Initiative |
| 2 | 4463667 | Legacy Model | 8 | 2 | 338543 | Legacy Model |
| 3 | 24077793 | Regional Cluster A | 1 | 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | Regional Cluster A |
| 4 | 1204-0009-L | Seasonal Review | 9 | 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | Seasonal Review |

The view `v_course_course_list` joins courses with their associated course lists, answering: "Which course list contains each course?" This supports curricular planning by revealing how courses are grouped under thematic or administrative lists. Course 10238263 ("Compact Initiative") appears in list 3001009030140, which is active and contains 2 courses. Course 4463667 ("Legacy Model") appears in list 338543, which is inactive. The view presents the course's identifying attributes alongside the list's `list_id`, `title`, `selection_count`, and `status`, enabling administrators to audit list membership and identify courses that may need reassignment if a list is being retired.

**View `v_degree_requirement_course_detail`**

```sql
CREATE VIEW v_degree_requirement_course_detail AS
SELECT a.degree_requirement_id, a.requirement_id, a.title, b.id AS course_id, b.course_code AS course_course_code, b.title AS course_title
FROM degree_requirements a
  JOIN requirements_courses j ON j.degree_requirement_id = a.degree_requirement_id
  JOIN courses b ON b.id = j.course_id;
```

| degree_requirement_id | requirement_id | title | course_id | course_course_code | course_title |
|---|---|---|---|---|---|
| 100 | 778568 | Compact Initiative | 1 | 10238263 | Compact Initiative |
| 100 | 778568 | Compact Initiative | 2 | 4463667 | Legacy Model |
| 101 | lu_tax_code_template_b_VB-EC-0 | Legacy Model | 2 | 4463667 | Legacy Model |
| 101 | lu_tax_code_template_b_VB-EC-0 | Legacy Model | 3 | 24077793 | Regional Cluster A |
| 102 | 99901 | Regional Cluster A | 3 | 24077793 | Regional Cluster A |
| 102 | 99901 | Regional Cluster A | 4 | 1204-0009-L | Seasonal Review |
| 103 | 5917277 | Seasonal Review | 4 | 1204-0009-L | Seasonal Review |
| 103 | 5917277 | Seasonal Review | 1 | 10238263 | Compact Initiative |

The view `v_degree_requirement_course_detail` joins degree requirements with the courses that fulfill them, answering: "What courses are available to satisfy each degree requirement?" This is the inverse of `v_course_degree_requirement` and is particularly useful when designing new requirements or auditing whether existing requirements have sufficient course coverage. Requirement 100 ("Compact Initiative") appears with courses 1 and 2, both of which are linked through `requirements_courses`. The view surfaces the requirement's `category`, `min_courses`, and `status` alongside each course's `course_code`, `title`, `units`, and `level`, allowing planners to verify that the available courses meet the minimum course count and span appropriate academic levels.

**View `v_degree_requirement_academic_program`**

```sql
CREATE VIEW v_degree_requirement_academic_program AS
SELECT a.degree_requirement_id, a.requirement_id, a.title, a.category, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.title AS program_title
FROM degree_requirements a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| degree_requirement_id | requirement_id | title | category | program_academic_program_id | program_program_code | program_title |
|---|---|---|---|---|---|---|
| 100 | 778568 | Compact Initiative | major | 1 | 191 | Compact Initiative |
| 101 | lu_tax_code_template_b_VB-EC-0 | Legacy Model | track | 2 | 1186082 | Legacy Model |
| 102 | 99901 | Regional Cluster A | breadth | 3 | 3990187 | Regional Cluster A |
| 103 | 5917277 | Seasonal Review | elective | 4 | flexible-thinking | Seasonal Review |

The view `v_degree_requirement_academic_program` joins degree requirements with their parent academic programs, answering: "Which academic program does each degree requirement belong to?" This view is critical for program-level reporting and for ensuring that requirements are correctly scoped. Requirement 100 ("Compact Initiative") is linked to program 191 ("Compact Initiative"), a B.A. program that is currently active. Requirement 101 ("Legacy Model") is linked to program 1186082 ("Legacy Model"), a B.S. program that is inactive. The view presents the requirement's `category`, `min_courses`, and `status` alongside the program's `program_code`, `degree_type`, `effective_date`, and `status`, enabling administrators to identify requirements that belong to retired programs and may need migration or deprecation.

**View `v_academic_program_degree_requirement_detail`**

```sql
CREATE VIEW v_academic_program_degree_requirement_detail AS
SELECT a.academic_program_id, a.program_code, a.title, b.degree_requirement_id AS requirement_degree_requirement_id, b.requirement_id AS requirement_requirement_id, b.title AS requirement_title
FROM academic_programs a
  JOIN programs_requirements j ON j.academic_program_id = a.academic_program_id
  JOIN degree_requirements b ON b.degree_requirement_id = j.degree_requirement_id;
```

| academic_program_id | program_code | title | requirement_degree_requirement_id | requirement_requirement_id | requirement_title |
|---|---|---|---|---|---|
| 1 | 191 | Compact Initiative | 100 | 778568 | Compact Initiative |
| 1 | 191 | Compact Initiative | 101 | lu_tax_code_template_b_VB-EC-0 | Legacy Model |
| 2 | 1186082 | Legacy Model | 101 | lu_tax_code_template_b_VB-EC-0 | Legacy Model |
| 2 | 1186082 | Legacy Model | 102 | 99901 | Regional Cluster A |
| 3 | 3990187 | Regional Cluster A | 102 | 99901 | Regional Cluster A |
| 3 | 3990187 | Regional Cluster A | 103 | 5917277 | Seasonal Review |
| 4 | flexible-thinking | Seasonal Review | 103 | 5917277 | Seasonal Review |
| 4 | flexible-thinking | Seasonal Review | 100 | 778568 | Compact Initiative |

The view `v_academic_program_degree_requirement_detail` joins academic programs with their degree requirements, answering: "What degree requirements define each academic program?" This is the program-centric counterpart to `v_degree_requirement_academic_program` and is essential for generating program catalogs and degree audits. Program 191 ("Compact Initiative") appears with requirement 100, a major requirement mandating 44 courses. Program 3990187 ("Regional Cluster A") appears with requirement 102, a breadth requirement mandating 56 courses. The view surfaces the program's `degree_type`, `effective_date`, and `status` alongside each requirement's `title`, `category`, `min_courses`, and `status`, providing a comprehensive view of a program's curricular obligations.

**View `v_course_list_course_detail`**

```sql
CREATE VIEW v_course_list_course_detail AS
SELECT a.id, a.list_id, a.title, b.id AS course_id, b.course_code AS course_course_code, b.title AS course_title
FROM course_lists a
  JOIN lists_courses j ON j.course_list_id = a.id
  JOIN courses b ON b.id = j.course_id;
```

| id | list_id | title | course_id | course_course_code | course_title |
|---|---|---|---|---|---|
| 1 | 3001009030140 | Compact Initiative | 1 | 10238263 | Compact Initiative |
| 1 | 3001009030140 | Compact Initiative | 2 | 4463667 | Legacy Model |
| 2 | 338543 | Legacy Model | 2 | 4463667 | Legacy Model |
| 2 | 338543 | Legacy Model | 3 | 24077793 | Regional Cluster A |
| 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | Regional Cluster A | 3 | 24077793 | Regional Cluster A |
| 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | Regional Cluster A | 4 | 1204-0009-L | Seasonal Review |
| 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | Seasonal Review | 4 | 1204-0009-L | Seasonal Review |
| 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | Seasonal Review | 1 | 10238263 | Compact Initiative |

The view `v_course_list_course_detail` joins course lists with their member courses, answering: "What courses belong to each course list?" This view supports list-level auditing and helps administrators understand the composition of each list. List 3001009030140 ("Compact Initiative") contains course 10238263 ("Compact Initiative"), a lower-division course worth 6 units. List eb56fb15-2499-4b47-b59d-8319ca5ad273 ("Regional Cluster A") contains course 24077793 ("Regional Cluster A"), a lower-division course worth 1 unit. The view presents the list's `list_id`, `title`, `selection_count`, and `status` alongside each course's `course_code`, `title`, `units`, `level`, and `status`, enabling administrators to verify that list membership aligns with the recorded `selection_count` and that inactive courses are properly flagged.

**View `v_course_list_degree_requirement`**

```sql
CREATE VIEW v_course_list_degree_requirement AS
SELECT a.id, a.list_id, a.title, a.selection_count, b.degree_requirement_id AS requirement_degree_requirement_id, b.requirement_id AS requirement_requirement_id, b.title AS requirement_title
FROM course_lists a JOIN degree_requirements b ON a.degree_requirement_id = b.degree_requirement_id;
```

| id | list_id | title | selection_count | requirement_degree_requirement_id | requirement_requirement_id | requirement_title |
|---|---|---|---|---|---|---|
| 1 | 3001009030140 | Compact Initiative | 2 | 100 | 778568 | Compact Initiative |
| 2 | 338543 | Legacy Model | 2 | 101 | lu_tax_code_template_b_VB-EC-0 | Legacy Model |
| 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | Regional Cluster A | 8 | 102 | 99901 | Regional Cluster A |
| 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | Seasonal Review | 2 | 103 | 5917277 | Seasonal Review |

The view `v_course_list_degree_requirement` joins course lists with their associated degree requirements, answering: "Which degree requirement is each course list tied to?" This view bridges the list-based and requirement-based organizational structures, revealing how lists serve as supplementary groupings within the broader requirement framework. List 3001009030140 ("Compact Initiative") is linked to requirement 100, a major requirement under program 1. List ChIJEcyftPtt5kcRrhHB9SZ21dE ("Seasonal Review") is linked to requirement 103, an elective requirement under program 4. The view presents the list's `list_id`, `title`, `selection_count`, and `status` alongside the requirement's `title`, `category`, `min_courses`, and `status`, enabling administrators to assess whether lists are properly aligned with their parent requirements and whether any orphaned lists exist.

**View `v_subfield_course_detail`**

```sql
CREATE VIEW v_subfield_course_detail AS
SELECT a.id, a.subfield_code, a.title, b.id AS course_id, b.course_code AS course_course_code, b.title AS course_title
FROM subfields a
  JOIN subfields_courses j ON j.subfield_id = a.id
  JOIN courses b ON b.id = j.course_id;
```

| id | subfield_code | title | course_id | course_course_code | course_title |
|---|---|---|---|---|---|
| 1 | 1437575 | Compact Initiative | 1 | 10238263 | Compact Initiative |
| 1 | 1437575 | Compact Initiative | 2 | 4463667 | Legacy Model |
| 2 | 6564384 | Legacy Model | 2 | 4463667 | Legacy Model |
| 2 | 6564384 | Legacy Model | 3 | 24077793 | Regional Cluster A |
| 3 | 13061773 | Regional Cluster A | 3 | 24077793 | Regional Cluster A |
| 3 | 13061773 | Regional Cluster A | 4 | 1204-0009-L | Seasonal Review |
| 4 | 5917272 | Seasonal Review | 4 | 1204-0009-L | Seasonal Review |
| 4 | 5917272 | Seasonal Review | 1 | 10238263 | Compact Initiative |

The view `v_subfield_course_detail` joins subfields with their associated courses, answering: "What courses fall within each subfield's disciplinary scope?" This view is essential for disciplinary reporting and for understanding how courses are classified under academic specializations. Subfield 1437575 ("Compact Initiative"), classified under "adaptive-discipli-53," is linked to course 10238263 ("Compact Initiative"), a lower-division course worth 6 units. Subfield 13061773 ("Regional Cluster A"), classified under "baseline-discipli-55," is linked to course 24077793 ("Regional Cluster A"), a lower-division course worth 1 unit. The view presents the subfield's `subfield_code`, `title`, `discipline`, and `status` alongside each course's `course_code`, `title`, `units`, `level`, and `status`, enabling department chairs to verify that course assignments align with disciplinary expectations.

**View `v_subfield_academic_program`**

```sql
CREATE VIEW v_subfield_academic_program AS
SELECT a.id, a.subfield_code, a.title, a.discipline, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.title AS program_title
FROM subfields a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| id | subfield_code | title | discipline | program_academic_program_id | program_program_code | program_title |
|---|---|---|---|---|---|---|
| 1 | 1437575 | Compact Initiative | adaptive-discipli-53 | 1 | 191 | Compact Initiative |
| 2 | 6564384 | Legacy Model | distributed-discipli-54 | 2 | 1186082 | Legacy Model |
| 3 | 13061773 | Regional Cluster A | baseline-discipli-55 | 3 | 3990187 | Regional Cluster A |
| 4 | 5917272 | Seasonal Review | pilot-discipli-56 | 4 | flexible-thinking | Seasonal Review |

The view `v_subfield_academic_program` joins subfields with their parent academic programs, answering: "Which academic program does each subfield belong to?" This view is critical for understanding the disciplinary structure within each program and for ensuring that subfields are correctly scoped. Subfield 1437575 ("Compact Initiative") belongs to program 191 ("Compact Initiative"), a B.A. program that is active. Subfield 6564384 ("Legacy Model") belongs to program 1186082 ("Legacy Model"), a B.S. program that is inactive. The view presents the subfield's `subfield_code`, `title`, `discipline`, and `status` alongside the program's `program_code`, `degree_type`, `effective_date`, and `status`, enabling administrators to identify subfields that belong to retired programs and may need to be reassigned or deprecated.

## Synthesis

The academic program architecture described here operates as a coherent system of nested and cross-cutting relationships. Academic programs sit at the top of the hierarchy, containing degree requirements and subfields. Degree requirements define the academic obligations students must meet, and they are fulfilled by courses organized through the `requirements_courses` junction table. Course lists provide an alternative grouping mechanism, linked to courses through `lists_courses` and to requirements through the `degree_requirement_id` column on the `course_lists` table. Subfields offer a disciplinary lens, connecting courses through `subfields_courses` and programs through the `academic_program_id` column. The nine views presented above collapse these relationships into queryable forms, each answering a distinct operational question about the curriculum. Together, the base tables and views form a complete record of how courses, requirements, lists, and subfields interlock to define an institution's academic offerings.