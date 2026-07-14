The academic catalog of a fictional university can be understood as a network of interlocking obligations: courses exist as atomic units of instruction, grouped into categories, and aggregated into degree requirements that in turn compose degree programs. Concentrations carve specializations within programs, and the `programs_requirements` junction table binds programs to the requirements they mandate. The relational schema below captures this hierarchy in normalized form, with foreign keys and a many-to-many bridge table ensuring that every enrollment path can be traced from a student's program choice back to the individual courses they must complete.

## Base Tables and Their Attributes

The foundation of the schema rests on four entity tables, each representing a distinct concept in the academic domain.

**Table `courses`**

| id | course_code | title | credit_value | is_prerequisite | category | course_id | degree_requirement_id |
|---|---|---|---|---|---|---|---|
| 1 | 10238263 | Compact Initiative | 24 | false | Business Core | 1 | 1 |
| 2 | 4463667 | Legacy Model | 30 | true | Professional Development | 2 | 2 |
| 3 | 24077793 | Regional Cluster A | 36 | false | Elective | 3 | 3 |
| 4 | 1204-0009-L | Seasonal Review | 42 | true | Business Core | 4 | 4 |

The `courses` table stores atomic course records. Its primary key is `id`, an integer surrogate. The `course_code` column carries the human-readable identifier—values such as `10238263` for "Compact Initiative" and `1204-0009-L` for "Seasonal Review" illustrate the mix of purely numeric and alphanumeric codes in use. The `title` column holds the course name, while `credit_value` quantifies the workload in credit units, ranging from 24 to 42 in the sample data. The boolean `is_prerequisite` flag marks whether the course serves as a prerequisite for other courses. The `category` column classifies courses into groups like `Business Core`, `Professional Development`, and `Elective`. Two additional columns, `course_id` and `degree_requirement_id`, act as foreign keys: `course_id` points to another row in `courses` (enabling self-referencing prerequisite chains), and `degree_requirement_id` links the course to a specific requirement in the `degree_requirements` table.

**Table `degree_requirements`**

| id | requirement_id | category | required_credits | is_optional | effective_date | course_id | degree_program_id |
|---|---|---|---|---|---|---|---|
| 1 | 778568 | Business Core | 27 | true | 2023-02-14T13:27:00 | 1 | 1 |
| 2 | lu_tax_code_template_b_VB-EC-0 | Professional Development | 36 | false | 2024-07-25T20:44:00 | 2 | 2 |
| 3 | 99901 | Elective | 45 | true | 2025-12-09T03:01:00 | 3 | 3 |
| 4 | 5917277 | Business Core | 54 | false | 2022-05-20T10:18:00 | 4 | 4 |

The `degree_requirements` table defines the credit obligations that programs impose. Its primary key is `id`. The `requirement_id` column carries a secondary identifier—note the heterogeneity of values such as the numeric `778568`, the alphanumeric `lu_tax_code_template_b_VB-EC-0`, and the short string `5917277`. The `category` column mirrors the course categories (`Business Core`, `Professional Development`, `Elective`), and `required_credits` specifies how many credits the requirement demands, with sample values of 27, 36, 45, and 54. The `is_optional` boolean indicates whether the requirement is mandatory or elective, while `effective_date` records when the requirement took effect, using ISO 8601 timestamps like `2023-02-14T13:27:00`. The foreign keys `course_id` and `degree_program_id` connect the requirement to a specific course and to the degree program it belongs to, respectively.

**Table `degree_programs`**

| id | program_code | program_name | total_required_credits | effective_date | status | concentration_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 10 | 2023-02-14T13:27:00 | active | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1186082 | Pilot Initiative A | 3 | 2024-07-25T20:44:00 | deprecated | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3990187 | Baseline Model | 1 | 2025-12-09T03:01:00 | active | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | flexible-thinking | Distributed Cluster | 8 | 2022-05-20T10:18:00 | deprecated | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `degree_programs` table enumerates the academic programs themselves. Its primary key is `id`. The `program_code` column holds the program's short code—examples include `191` for "Extended Review" and the string `flexible-thinking` for "Distributed Cluster." The `program_name` column provides the full name, while `total_required_credits` states the total credits needed for graduation, ranging from 1 to 10 in the data. The `effective_date` and `status` columns track when the program became active and whether it is currently `active` or `deprecated`. The foreign key `concentration_id` links the program to its parent concentration, and the audit columns `created_at` and `updated_at` record the timestamps of the program's creation and last modification.

**Table `concentrations`**

| id | concentration_id | name | required_electives | status | course_id | degree_program_id |
|---|---|---|---|---|---|---|
| 1 | 10445632 | Extended Review | 8 | active | 1 | 1 |
| 2 | 3744015 | Pilot Initiative A | 13 | inactive | 2 | 2 |
| 3 | 5f937da4-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 18 | active | 3 | 3 |
| 4 | 8843763 | Distributed Cluster | 23 | inactive | 4 | 4 |

The `concentrations` table defines specializations within the academic structure. Its primary key is `id`. The `concentration_id` column carries a secondary identifier, which in the sample data includes both numeric values like `10445632` and UUIDs such as `5f937da4-8fcd-11eb-924d-9cd76263cbd0`. The `name` column holds the concentration's name, which in the data coincides with the program name (e.g., "Extended Review," "Pilot Initiative A"). The `required_electives` column specifies how many elective courses a student must complete within the concentration, with values ranging from 8 to 23. The `status` column indicates whether the concentration is `active` or `inactive`. Foreign keys `course_id` and `degree_program_id` link the concentration to a course and to the degree program it belongs to.

## The Junction Table

The many-to-many relationship between degree programs and degree requirements is resolved through the `programs_requirements` junction table.

**Table `programs_requirements`**

| degree_program_id | degree_requirement_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This table contains only two columns: `degree_program_id` and `degree_requirement_id`. Each row asserts that a particular degree program mandates a particular degree requirement. The sample data shows that program 1 ("Extended Review") requires both requirement 1 and requirement 2, while program 4 ("Distributed Cluster") requires requirements 4 and 1. This bridge table enables any program to reference any number of requirements and any requirement to be referenced by any number of programs, without duplicating data.

## Materialized Views

The schema includes eight views that materialize common join patterns, allowing analysts to reconstruct domain facts without writing joins explicitly. Each view is described below.

**View `vw_course_course`**

```sql
CREATE VIEW vw_course_course AS
SELECT a.id, a.course_code, a.title, a.credit_value, b.id AS course_id, b.course_code AS course_course_code, b.title AS course_title
FROM courses a JOIN courses b ON a.course_id = b.id;
```

| id | course_code | title | credit_value | course_id | course_course_code | course_title |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Compact Initiative | 24 | 1 | 10238263 | Compact Initiative |
| 2 | 4463667 | Legacy Model | 30 | 2 | 4463667 | Legacy Model |
| 3 | 24077793 | Regional Cluster A | 36 | 3 | 24077793 | Regional Cluster A |
| 4 | 1204-0009-L | Seasonal Review | 42 | 4 | 1204-0009-L | Seasonal Review |

The `vw_course_course` view performs a self-join on the `courses` table, pairing each course with the course it references via `course_id`. The result reproduces the course's own attributes alongside aliased columns from the referenced course (`course_course_code`, `course_title`). In the sample data, every row maps a course to itself because `course_id` equals `id` for all four rows. This view would become meaningful when `course_id` points to a different course, revealing prerequisite relationships—for instance, if course 2 ("Legacy Model") referenced course 1, the view would show that "Legacy Model" depends on "Compact Initiative."

**View `vw_course_degree_requirement`**

```sql
CREATE VIEW vw_course_degree_requirement AS
SELECT a.id, a.course_code, a.title, a.credit_value, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.category AS requirement_category
FROM courses a JOIN degree_requirements b ON a.degree_requirement_id = b.id;
```

| id | course_code | title | credit_value | requirement_id | requirement_requirement_id | requirement_category |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Compact Initiative | 24 | 1 | 778568 | Business Core |
| 2 | 4463667 | Legacy Model | 30 | 2 | lu_tax_code_template_b_VB-EC-0 | Professional Development |
| 3 | 24077793 | Regional Cluster A | 36 | 3 | 99901 | Elective |
| 4 | 1204-0009-L | Seasonal Review | 42 | 4 | 5917277 | Business Core |

The `vw_course_degree_requirement` view joins `courses` to `degree_requirements` on the shared `degree_requirement_id` foreign key. It answers the question: "Which degree requirement does this course satisfy?" Each row in the result pairs a course with the requirement it fulfills. For example, course 1 ("Compact Initiative") satisfies requirement 1, which is a `Business Core` requirement demanding 27 credits. This view makes it straightforward to audit which courses contribute to which requirements.

**View `vw_degree_requirement_course`**

```sql
CREATE VIEW vw_degree_requirement_course AS
SELECT a.id, a.requirement_id, a.category, a.required_credits, b.id AS course_id, b.course_code AS course_course_code, b.title AS course_title
FROM degree_requirements a JOIN courses b ON a.course_id = b.id;
```

| id | requirement_id | category | required_credits | course_id | course_course_code | course_title |
|---|---|---|---|---|---|---|
| 1 | 778568 | Business Core | 27 | 1 | 10238263 | Compact Initiative |
| 2 | lu_tax_code_template_b_VB-EC-0 | Professional Development | 36 | 2 | 4463667 | Legacy Model |
| 3 | 99901 | Elective | 45 | 3 | 24077793 | Regional Cluster A |
| 4 | 5917277 | Business Core | 54 | 4 | 1204-0009-L | Seasonal Review |

The `vw_degree_requirement_course` view performs the inverse join of `vw_course_degree_requirement`, starting from `degree_requirements` and joining to `courses` via `course_id`. It answers: "Which course is associated with this degree requirement?" In the sample data, requirement 1 ("Business Core," 27 credits) is linked to course 1 ("Compact Initiative"), and requirement 2 ("Professional Development," 36 credits) is linked to course 2 ("Legacy Model"). This perspective is useful when a curriculum designer wants to see which courses are assigned to a given requirement.

**View `vw_degree_requirement_degree_program`**

```sql
CREATE VIEW vw_degree_requirement_degree_program AS
SELECT a.id, a.requirement_id, a.category, a.required_credits, b.id AS program_id, b.program_code AS program_program_code, b.program_name AS program_program_name
FROM degree_requirements a JOIN degree_programs b ON a.degree_program_id = b.id;
```

| id | requirement_id | category | required_credits | program_id | program_program_code | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 778568 | Business Core | 27 | 1 | 191 | Extended Review |
| 2 | lu_tax_code_template_b_VB-EC-0 | Professional Development | 36 | 2 | 1186082 | Pilot Initiative A |
| 3 | 99901 | Elective | 45 | 3 | 3990187 | Baseline Model |
| 4 | 5917277 | Business Core | 54 | 4 | flexible-thinking | Distributed Cluster |

The `vw_degree_requirement_degree_program` view joins `degree_requirements` to `degree_programs` on `degree_program_id`. It answers: "Which degree program does this requirement belong to?" The sample data shows that requirement 1 ("Business Core") belongs to program 1 ("Extended Review"), requirement 2 ("Professional Development") belongs to program 2 ("Pilot Initiative A"), and so on. This view provides a direct mapping from requirements to the programs that enforce them.

**View `vw_degree_program_degree_requirement_detail`**

```sql
CREATE VIEW vw_degree_program_degree_requirement_detail AS
SELECT a.id, a.program_code, a.program_name, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.category AS requirement_category
FROM degree_programs a
  JOIN programs_requirements j ON j.degree_program_id = a.id
  JOIN degree_requirements b ON b.id = j.degree_requirement_id;
```

| id | program_code | program_name | requirement_id | requirement_requirement_id | requirement_category |
|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 1 | 778568 | Business Core |
| 1 | 191 | Extended Review | 2 | lu_tax_code_template_b_VB-EC-0 | Professional Development |
| 2 | 1186082 | Pilot Initiative A | 2 | lu_tax_code_template_b_VB-EC-0 | Professional Development |
| 2 | 1186082 | Pilot Initiative A | 3 | 99901 | Elective |
| 3 | 3990187 | Baseline Model | 3 | 99901 | Elective |
| 3 | 3990187 | Baseline Model | 4 | 5917277 | Business Core |
| 4 | flexible-thinking | Distributed Cluster | 4 | 5917277 | Business Core |
| 4 | flexible-thinking | Distributed Cluster | 1 | 778568 | Business Core |

The `vw_degree_program_degree_requirement_detail` view joins `degree_programs` to `degree_requirements` through the `programs_requirements` junction table. It answers: "Which requirements does this degree program mandate?" Unlike `vw_degree_requirement_degree_program`, which links requirements to programs via a direct foreign key, this view traverses the explicit many-to-many relationship. Program 1 ("Extended Review") appears with both requirement 1 and requirement 2, confirming that the junction table correctly captures the program's dual obligations.

**View `vw_degree_program_concentration`**

```sql
CREATE VIEW vw_degree_program_concentration AS
SELECT a.id, a.program_code, a.program_name, a.total_required_credits, b.id AS concentration_id, b.concentration_id AS concentration_concentration_id, b.name AS concentration_name
FROM degree_programs a JOIN concentrations b ON a.concentration_id = b.id;
```

| id | program_code | program_name | total_required_credits | concentration_id | concentration_concentration_id | concentration_name |
|---|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 10 | 1 | 10445632 | Extended Review |
| 2 | 1186082 | Pilot Initiative A | 3 | 2 | 3744015 | Pilot Initiative A |
| 3 | 3990187 | Baseline Model | 1 | 3 | 5f937da4-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model |
| 4 | flexible-thinking | Distributed Cluster | 8 | 4 | 8843763 | Distributed Cluster |

The `vw_degree_program_concentration` view joins `degree_programs` to `concentrations` on `concentration_id`. It answers: "Which concentration does this degree program belong to?" In the sample data, program 1 ("Extended Review") is linked to concentration 1 ("Extended Review"), and program 2 ("Pilot Initiative A") is linked to concentration 2 ("Pilot Initiative A"). This view clarifies the hierarchical relationship between programs and their parent concentrations.

**View `vw_concentration_course`**

```sql
CREATE VIEW vw_concentration_course AS
SELECT a.id, a.concentration_id, a.name, a.required_electives, b.id AS course_id, b.course_code AS course_course_code, b.title AS course_title
FROM concentrations a JOIN courses b ON a.course_id = b.id;
```

| id | concentration_id | name | required_electives | course_id | course_course_code | course_title |
|---|---|---|---|---|---|---|
| 1 | 10445632 | Extended Review | 8 | 1 | 10238263 | Compact Initiative |
| 2 | 3744015 | Pilot Initiative A | 13 | 2 | 4463667 | Legacy Model |
| 3 | 5f937da4-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 18 | 3 | 24077793 | Regional Cluster A |
| 4 | 8843763 | Distributed Cluster | 23 | 4 | 1204-0009-L | Seasonal Review |

The `vw_concentration_course` view joins `concentrations` to `courses` on `course_id`. It answers: "Which course is associated with this concentration?" The sample data shows that concentration 1 ("Extended Review") is linked to course 1 ("Compact Initiative"), and concentration 2 ("Pilot Initiative A") is linked to course 2 ("Legacy Model"). This view supports curriculum analysis at the concentration level, revealing which courses feed into each specialization.

**View `vw_concentration_degree_program`**

```sql
CREATE VIEW vw_concentration_degree_program AS
SELECT a.id, a.concentration_id, a.name, a.required_electives, b.id AS program_id, b.program_code AS program_program_code, b.program_name AS program_program_name
FROM concentrations a JOIN degree_programs b ON a.degree_program_id = b.id;
```

| id | concentration_id | name | required_electives | program_id | program_program_code | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 10445632 | Extended Review | 8 | 1 | 191 | Extended Review |
| 2 | 3744015 | Pilot Initiative A | 13 | 2 | 1186082 | Pilot Initiative A |
| 3 | 5f937da4-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 18 | 3 | 3990187 | Baseline Model |
| 4 | 8843763 | Distributed Cluster | 23 | 4 | flexible-thinking | Distributed Cluster |

The `vw_concentration_degree_program` view joins `concentrations` to `degree_programs` on `degree_program_id`. It answers: "Which degree program is associated with this concentration?" In the sample data, concentration 1 ("Extended Review") is linked to program 1 ("Extended Review"), and concentration 4 ("Distributed Cluster") is linked to program 4 ("Distributed Cluster"). This view provides a direct mapping from concentrations to their child programs, completing the hierarchical chain from specialization down to program.

## Synthesis

The schema models the academic domain as a hierarchy of entities—concentrations contain degree programs, which mandate degree requirements, which are satisfied by courses. The `programs_requirements` junction table is the only many-to-many bridge, reflecting the fact that a program can require multiple requirements and a requirement can belong to multiple programs. All other relationships are one-to-many, enforced through foreign keys in the base tables. The eight views materialize the most common join paths, allowing analysts to reconstruct domain facts—such as which courses satisfy which requirements, or which requirements a program mandates—without writing explicit joins. The sample data, while small, demonstrates the full breadth of the schema: numeric and alphanumeric identifiers coexist, boolean flags distinguish mandatory from optional elements, and timestamps track the lifecycle of programs and requirements. Together, the tables and views provide a complete, queryable representation of the academic catalog.