## Academic Program Architecture and Curriculum Governance

Higher education institutions structure their academic offerings through a layered architecture of degree programs, concentrations, courses, and the requirements that bind them together. At the foundation sit individual courses—discrete units of instruction identified by codes such as `10238263` (Compact Initiative, 24 credits) and `1204-0009-L` (Seasonal Review, 42 credits)—each carrying a credit value and a categorical classification. Some courses serve as prerequisites for others, a relationship captured by the `is_prerequisite` flag on records like the Legacy Model course (code `4463667`, 30 credits), which is marked as a prerequisite. These courses are organized into categories such as Business Core, Professional Development, and Elective, forming the building blocks of academic planning.

**Table `courses`**

| id | course_code | title | credit_value | is_prerequisite | category | course_id | degree_requirement_id |
|---|---|---|---|---|---|---|---|
| 1 | 10238263 | Compact Initiative | 24 | false | Business Core | 1 | 1 |
| 2 | 4463667 | Legacy Model | 30 | true | Professional Development | 2 | 2 |
| 3 | 24077793 | Regional Cluster A | 36 | false | Elective | 3 | 3 |
| 4 | 1204-0009-L | Seasonal Review | 42 | true | Business Core | 4 | 4 |

Degree programs represent the primary organizational unit through which students pursue credentials. Each program carries a code and a name—Extended Review (code `191`) and Pilot Initiative A (code `1186082`) are two examples—and specifies a total credit requirement for completion. Programs exist in one of two states: active or deprecated. The Baseline Model program (code `3990187`) is currently active with a total of 1 required credit, while the Distributed Cluster program (code `flexible-thinking`) is deprecated, having required 8 credits during its operational period. Each program is associated with a concentration, which provides a specialized focus area within the broader program.

**Table `degree_programs`**

| id | program_code | program_name | total_required_credits | effective_date | status | concentration_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 10 | 2023-02-14T13:27:00 | active | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1186082 | Pilot Initiative A | 3 | 2024-07-25T20:44:00 | deprecated | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3990187 | Baseline Model | 1 | 2025-12-09T03:01:00 | active | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | flexible-thinking | Distributed Cluster | 8 | 2022-05-20T10:18:00 | deprecated | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Concentrations function as sub-specializations nested within degree programs. The Extended Review concentration (identifier `10445632`) requires 8 electives and maintains an active status, whereas the Pilot Initiative A concentration (identifier `3744015`) requires 13 electives and is marked inactive. Concentrations also carry their own credit and elective requirements, and each is linked to a specific degree program, creating a hierarchical structure where programs contain concentrations that in turn shape the course selections available to students.

**Table `concentrations`**

| id | concentration_id | name | required_electives | status | course_id | degree_program_id |
|---|---|---|---|---|---|---|
| 1 | 10445632 | Extended Review | 8 | active | 1 | 1 |
| 2 | 3744015 | Pilot Initiative A | 13 | inactive | 2 | 2 |
| 3 | 5f937da4-8fcd-11eb-924d-9cd76263cbd0 | Baseline Model | 18 | active | 3 | 3 |
| 4 | 8843763 | Distributed Cluster | 23 | inactive | 4 | 4 |

The bridge between programs and their constituent requirements is the programs_requirements junction table. This table establishes which degree requirements apply to which programs. Program `1` (Extended Review) is associated with requirements `1` and `2`, while program `4` (Distributed Cluster) is linked to requirements `4` and `1`. This many-to-many relationship allows requirements to be shared across programs and programs to accumulate requirements from multiple sources, providing flexibility in curriculum design.

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

Degree requirements define the specific academic obligations within a program. Each requirement has a category—Business Core, Professional Development, or Elective—and specifies a required credit count. The requirement with identifier `778568` falls under Business Core and mandates 27 credits, while the requirement identified by `lu_tax_code_template_b_VB-EC-0` belongs to Professional Development and requires 36 credits. Some requirements are optional (those with `is_optional` set to true, such as requirement `778568`), while others are mandatory. Each requirement also carries an effective date, enabling historical tracking of when particular requirements came into force.

**Table `degree_requirements`**

| id | requirement_id | category | required_credits | is_optional | effective_date | course_id | degree_program_id |
|---|---|---|---|---|---|---|---|
| 1 | 778568 | Business Core | 27 | true | 2023-02-14T13:27:00 | 1 | 1 |
| 2 | lu_tax_code_template_b_VB-EC-0 | Professional Development | 36 | false | 2024-07-25T20:44:00 | 2 | 2 |
| 3 | 99901 | Elective | 45 | true | 2025-12-09T03:01:00 | 3 | 3 |
| 4 | 5917277 | Business Core | 54 | false | 2022-05-20T10:18:00 | 4 | 4 |

### Course Self-Reference and Prerequisite Mapping

The view `vw_course_course` reveals how courses reference other courses through the `course_id` column, creating a self-referential structure that models prerequisite relationships and course dependencies. When a course has its `course_id` pointing to another course's `id`, the join produces a row where both the primary and referenced course appear side by side. For instance, the Compact Initiative course (id `1`, code `10238263`) joins with itself in the view, producing a row where `course_id` equals `1` and `course_course_code` equals `10238263`. This pattern holds for all four courses in the dataset: Legacy Model (id `2`) references course `2`, Regional Cluster A (id `3`) references course `3`, and Seasonal Review (id `4`) references course `4`. The view effectively surfaces the prerequisite graph by aligning each course with the course it points to, making it straightforward to audit which courses depend on which others.

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

### Course-to-Requirement Alignment

The view `vw_course_degree_requirement` connects individual courses to the degree requirements they satisfy. This join answers the question: which courses fulfill which requirements? By matching the `course_id` in courses to the `course_id` in degree_requirements, the view produces rows that pair course metadata with requirement metadata. Course `1` (Compact Initiative) maps to requirement `1`, course `2` (Legacy Model) maps to requirement `2`, and so on through all four records. This alignment is critical for curriculum planners who need to verify that the available courses adequately cover the credit requirements of each category.

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

### Requirement-to-Course Traceability

Reversing the perspective, `vw_degree_requirement_course` provides a requirement-centric view of the same relationship. Here, the question becomes: which courses are assigned to satisfy a given requirement? The join aligns degree_requirements with courses through the shared `course_id` field, producing rows where each requirement is paired with its designated course. Requirement `1` (Business Core, 27 required credits) is served by course `1` (Compact Initiative), while requirement `2` (Professional Development, 36 required credits) is served by course `2` (Legacy Model). This orientation is particularly useful when auditing whether a requirement's credit threshold can be met by its assigned courses.

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

### Requirement-to-Program Association

The view `vw_degree_requirement_degree_program` links degree requirements to the programs they belong to. Through the `degree_program_id` column in degree_requirements, each requirement is associated with a specific program. Requirement `1` connects to program `1` (Extended Review), requirement `2` to program `2` (Pilot Initiative A), requirement `3` to program `3` (Baseline Model), and requirement `4` to program `4` (Distributed Cluster). This view clarifies the program-level scope of each requirement, showing which programs have adopted which requirements and enabling planners to trace the impact of requirement changes across the institution's portfolio.

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

### Program Requirement Detail

The view `vw_degree_program_degree_requirement_detail` provides a comprehensive detail view of program-requirement relationships, combining information from degree_programs, programs_requirements, and degree_requirements. This join answers the operational question: what are the full details of each requirement as it applies to a specific program? The view surfaces the program's code and name alongside the requirement's category, required credits, and optional status. For example, program `1` (Extended Review) is linked to requirement `1` (Business Core, 27 credits, optional), and program `1` is also linked to requirement `2` (Professional Development, 36 credits, not optional). This detail view is the primary instrument for generating program-specific curriculum checklists.

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

### Program-Concentration Linkage

The view `vw_degree_program_concentration` establishes the relationship between degree programs and their associated concentrations. Each row pairs a program with the concentration that defines its specialized focus. Program `1` (Extended Review, code `191`) is linked to concentration `1` (Extended Review, identifier `10445632`), program `2` (Pilot Initiative A, code `1186082`) to concentration `2`, and so forth. The view also carries the concentration's required elective count and status, enabling planners to see at a glance how many electives a concentration demands and whether that concentration is currently active or inactive.

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

### Concentration-to-Course Mapping

The view `vw_concentration_course` connects concentrations to the courses that serve their elective or core requirements. By joining concentrations with courses through the `course_id` field, the view reveals which courses are available to fulfill a concentration's credit needs. Concentration `1` (Extended Review, requiring 8 electives) is associated with course `1` (Compact Initiative), concentration `2` (Pilot Initiative A, requiring 13 electives) with course `2` (Legacy Model), concentration `3` (Baseline Model, requiring 18 electives) with course `3` (Regional Cluster A), and concentration `4` (Distributed Cluster, requiring 23 electives) with course `4` (Seasonal Review). This mapping is essential for students and advisors navigating which courses count toward a concentration's elective requirements.

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

### Concentration-to-Program Association

Finally, `vw_concentration_degree_program` provides a program-centric view of concentration relationships. This join links each concentration to its parent degree program through the `degree_program_id` column, answering the question: which program does this concentration belong to? Concentration `1` (Extended Review) belongs to program `1` (Extended Review), concentration `2` (Pilot Initiative A) to program `2` (Pilot Initiative A), concentration `3` (Baseline Model) to program `3` (Baseline Model), and concentration `4` (Distributed Cluster) to program `4` (Distributed Cluster). The view carries the program's code, name, total required credits, and status alongside the concentration's identifier, name, and elective requirements, providing a consolidated reference for understanding how concentrations fit within the broader program structure.

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

### Synthesis

The academic program architecture described here operates through a network of interlocking relationships: courses feed into requirements, requirements are assigned to programs, and concentrations provide specialized pathways within programs. The self-referential structure of courses enables prerequisite tracking, while the many-to-many relationship between programs and requirements allows for flexible curriculum composition. Concentrations add a layer of specialization, each with its own elective requirements and course mappings. Together, these tables and views form a coherent system for managing curriculum governance, ensuring that every student's path through a degree program can be traced from individual courses up through requirements, concentrations, and programs. The effective dates on requirements and the status flags on programs and concentrations provide temporal awareness, allowing institutions to manage transitions between curriculum versions and to deactivate offerings that are no longer in use.