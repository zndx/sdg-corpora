## The Architecture of School Library Programs

School library programs operate at the intersection of pedagogy, resource management, and community engagement. Each program is a structured initiative with a defined scope, timeline, and set of supporting assets—librarians, physical or virtual spaces, digital tools, external partnerships, and measurable goals. The records below capture the full lifecycle of these programs, from staffing and space allocation through to goal setting and assessment. Understanding how these records interlock is essential for anyone responsible for planning, auditing, or improving library services.

**Table `school_librarians`**

| librarian_id | full_name | employment_status | certification_level | years_of_experience | current_role | library_program_id |
|---|---|---|---|---|---|---|
| 1250209 | Theodore Mcgrath | employed | certified | 7 | lead | 100 |
| 7119786 | Account Name | contracted | provisional | 10 | teach | 101 |
| 4985163 | Saipan International Airport | volunteer | not_certified | 13 | support | 102 |
| b_VB-EC-15 | Norma Fisher | vacant | certified | 16 | advocate | 103 |

The `school_librarians` table records the personnel who staff library programs. Each librarian is identified by a `librarian_id` that may be numeric, such as `1250209` for Theodore Mcgrath, or alphanumeric, such as `b_VB-EC-15` for Norma Fisher. The `full_name` column carries the librarian's name, while `employment_status` distinguishes between `employed`, `contracted`, `volunteer`, and `vacant` positions. Certification level—`certified`, `provisional`, or `not_certified`—provides a proxy for professional qualification. Years of experience range from 7 to 16 across the sample, and the `current_role` column categorizes each librarian's function: `lead`, `teach`, `support`, or `advocate`. Every librarian record points to a `library_program_id`, anchoring the person to a specific program. For example, Theodore Mcgrath, a certified lead librarian with seven years of experience, is assigned to program `100`, while Norma Fisher, a certified advocate with sixteen years of experience, is linked to program `103`.

**Table `library_programs`**

| library_program_id | program_id | program_name | program_type | start_date | end_date | is_active | target_audience | librarian_id | space_id | digital_resource_id | future_ready_goal_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | inquiry | 2022-09-05 | 2022-09-01 | true | students | 1250209 | 195344 | 1000 | 1000 |
| 101 | 2986219 | Pilot Initiative A | creativity | 2023-02-16 | 2023-02-12 | false | teachers | 7119786 | 16611019 | 1001 | 1001 |
| 102 | 1186079 | Baseline Model | collaboration | 2024-07-27 | 2024-07-23 | true | community | 4985163 | L237 | 1002 | 1002 |
| 103 | 1562855 | Distributed Cluster | community | 2025-12-11 | 2025-12-07 | false | all | b_VB-EC-15 | BjoernKW | 1003 | 1003 |

At the center of the data model sits `library_programs`, the table that ties every other entity to a concrete initiative. Each row represents a program identified by `library_program_id` (e.g., `100`, `101`, `102`, `103`) and a separate `program_id` (e.g., `103176`, `2986219`). The `program_name` field carries descriptive labels such as "Extended Review," "Pilot Initiative A," "Baseline Model," and "Distributed Cluster." Programs are classified by `program_type` into categories like `inquiry`, `creativity`, `collaboration`, and `community`. Start and end dates frame the program's active window; notably, in this dataset the `end_date` precedes the `start_date` for every row, a pattern that may reflect data entry conventions or retroactive scheduling. The `is_active` flag indicates whether the program is currently running—programs `100` and `102` are active, while `101` and `103` are not. The `target_audience` specifies who the program serves: `students`, `teachers`, `community`, or `all`. Crucially, each program row carries foreign keys to a `librarian_id`, a `space_id`, a `digital_resource_id`, and a `future_ready_goal_id`, making this table the hub of the relational structure.

**Table `flexible_spaces`**

| space_id | space_name | space_type | capacity | equipment_provided | is_bookable | accessibility_compliant | library_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 195344 | Baseline Protocol D | physical | 32 | regional-equipmen-30 | false | false | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 16611019 | Distributed Programme | virtual | 41 | legacy-equipmen-31 | true | true | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| L237 | Adaptive Standard | hybrid | 50 | compact-equipmen-32 | false | false | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| BjoernKW | Primary Framework A | physical | 59 | composite-equipmen-33 | true | true | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Library programs require environments in which to operate, and `flexible_spaces` catalogs the venues available. Each space has a `space_id`—numeric identifiers like `195344` and `16611019`, or alphanumeric codes like `L237` and `BjoernKW`. The `space_name` column provides human-readable labels such as "Baseline Protocol D" and "Primary Framework A." Spaces are classified by `space_type` as `physical`, `virtual`, or `hybrid`. Capacity ranges from 32 to 59 participants. The `equipment_provided` column lists equipment bundles like `regional-equipmen-30` and `composite-equipmen-33`. The `is_bookable` and `accessibility_compliant` flags indicate operational constraints: for instance, space `195344` (Baseline Protocol D) is neither bookable nor accessible, while space `BjoernKW` (Primary Framework A) is both. Each space is linked to a `library_program_id`, establishing which program it supports.

**Table `digital_resources`**

| digital_resource_id | resource_id | resource_name | resource_type | access_level | cost | last_updated | is_equitable | library_program_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1167 | Adaptive Corridor | software | open | 12.87 | 2023-06-17 | true | 100 |
| 1001 | 2106708 | Primary Series | database | licensed | 29.99 | 2024-11-01 | false | 101 |
| 1002 | 4180945 | Composite Assessment D | e_book | restricted | 12.36 | 2025-04-12 | true | 102 |
| 1003 | 10238270 | Compact Survey | video | open | 37.54 | 2022-09-23 | false | 103 |

Digital resources extend the reach of library programs beyond physical constraints. The `digital_resources` table records each resource with a `digital_resource_id` (e.g., `1000`, `1001`, `1002`, `1003`) and a separate `resource_id` (e.g., `1167`, `2106708`). Resource names include "Adaptive Corridor," "Primary Series," "Composite Assessment D," and "Compact Survey." The `resource_type` column distinguishes between `software`, `database`, `e_book`, and `video`. Access levels are categorized as `open`, `licensed`, or `restricted`, and the `cost` field records monetary values ranging from $12.36 to $37.54. The `last_updated` timestamp indicates when the resource record was last modified, and `is_equitable` signals whether the resource meets equity criteria. Each digital resource is associated with a `library_program_id`, connecting it to the program that deploys it.

**Table `community_partnerships`**

| id | partnership_id | partnership_name | partner_type | start_date | end_date | is_active | focus_area | librarian_id | digital_resource_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 6564393 | Distributed Review | family | 2022-09-05 | 2022-09-01 | true | engagement | 1250209 | 1000 |
| 2 | gd_fp_eu_acc1 | Adaptive Initiative D | non_profit | 2023-02-16 | 2023-02-12 | false | lifelong_learning | 7119786 | 1001 |
| 3 | 32814 | Primary Model | government | 2024-07-27 | 2024-07-23 | true | resource_sharing | 4985163 | 1002 |
| 4 | 76a22c6ecc114448872b4c7cb5d4d087 | Composite Cluster | public_library | 2025-12-11 | 2025-12-07 | false | mentorship | b_VB-EC-15 | 1003 |

External collaboration is captured in `community_partnerships`, which documents relationships between the library and outside organizations. Each partnership has a unique `id` and a `partnership_id` that may be numeric (`6564393`) or a longer alphanumeric string (`76a22c6ecc114448872b4c7cb5d4d087`). Partnership names such as "Distributed Review" and "Composite Cluster" describe the engagement. The `partner_type` column identifies the nature of the partner: `family`, `non_profit`, `government`, or `public_library`. Start and end dates frame the partnership period, and `is_active` indicates current status. The `focus_area` column specifies the partnership's emphasis—`engagement`, `lifelong_learning`, `resource_sharing`, or `mentorship`. Each partnership links to a `librarian_id` and a `digital_resource_id`, showing which librarian manages the partnership and which digital resource it supports.

**Table `future_ready_goals`**

| future_ready_goal_id | goal_id | goal_name | goal_category | priority_level | is_met | last_assessed | library_program_id | assessment_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Invoices | Pilot Review | space | 22 | true | 2025-12-14 | 100 | 100 |
| 1001 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative | partnership | 25 | false | 2022-05-25 | 101 | 101 |
| 1002 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | Distributed Model A | digital_access | 28 | true | 2023-10-09 | 102 | 102 |
| 1003 | Invoice | Adaptive Cluster | curriculum | 31 | false | 2024-03-20 | 103 | 103 |

Strategic direction is encoded in `future_ready_goals`. Each goal has a `future_ready_goal_id` (e.g., `1000`, `1001`, `1002`, `1003`) and a `goal_id` that may be a word like "Invoices" or a UUID-like string (`a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3`). Goal names such as "Pilot Review" and "Adaptive Cluster" describe the objective. The `goal_category` column classifies goals into `space`, `partnership`, `digital_access`, and `curriculum`. A `priority_level` integer (ranging from 22 to 31) indicates relative importance. The `is_met` flag shows whether the goal has been achieved, and `last_assessed` records the date of the most recent evaluation. Each goal is tied to a `library_program_id` and an `assessment_id`, linking it to both the program it serves and the assessment that measures it.

**Table `assessments`**

| id | assessment_id | assessment_name | assessment_type | target_skill | is_digital | last_administered | library_program_id | future_ready_goal_id |
|---|---|---|---|---|---|---|---|---|
| 100 | template_ivacode_pagata_20det40ind | Adaptive Series | formative | critical_thinking | false | 2023-06-14 | 100 | 1000 |
| 101 | 19508914 | Primary Assessment | summative | information_literacy | true | 2024-11-25 | 101 | 1001 |
| 102 | 506000 | Composite Survey D | diagnostic | digital_citizenship | false | 2025-04-09 | 102 | 1002 |
| 103 | 1204-0009-M | Compact Corridor | performance | creativity | true | 2022-09-20 | 103 | 1003 |

The `assessments` table provides the evidence base for evaluating program outcomes. Each assessment is identified by an `assessment_id` and a `program_id`, and carries a `program_name` and `program_type` that echo the library program's own attributes. The `assessment_type` column (e.g., `formative`, `summative`) describes the evaluation method, while `score` and `max_score` capture quantitative results. The `assessment_date` records when the assessment occurred, and `status` indicates whether the assessment is `completed` or `pending`. Each assessment links to a `library_program_id`, a `future_ready_goal_id`, and a `librarian_id`, creating a chain of accountability from program through goal to the librarian responsible.

The views that follow synthesize these base tables into joined result sets, each answering a specific operational question.

**View `v_school_librarian_library_program`**

```sql
CREATE VIEW v_school_librarian_library_program AS
SELECT a.librarian_id, a.full_name, a.employment_status, a.certification_level, b.library_program_id AS program_library_program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM school_librarians a JOIN library_programs b ON a.library_program_id = b.library_program_id;
```

| librarian_id | full_name | employment_status | certification_level | program_library_program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1250209 | Theodore Mcgrath | employed | certified | 100 | 103176 | Extended Review |
| 7119786 | Account Name | contracted | provisional | 101 | 2986219 | Pilot Initiative A |
| 4985163 | Saipan International Airport | volunteer | not_certified | 102 | 1186079 | Baseline Model |
| b_VB-EC-15 | Norma Fisher | vacant | certified | 103 | 1562855 | Distributed Cluster |

The view `v_school_librarian_library_program` joins librarian records with their assigned programs, answering the question: which librarian is responsible for which program, and what are the program's key attributes? A row for Theodore Mcgrath (`librarian_id` `1250209`) shows him as an employed, certified lead with seven years of experience, assigned to program `100` ("Extended Review"), an active inquiry-type program targeting students. Another row for Norma Fisher (`b_VB-EC-15`) shows a vacant, certified advocate with sixteen years of experience assigned to program `103` ("Distributed Cluster"), an inactive community-type program targeting all audiences. This view is the primary tool for auditing staffing coverage across programs.

**View `v_library_program_school_librarian`**

```sql
CREATE VIEW v_library_program_school_librarian AS
SELECT a.library_program_id, a.program_id, a.program_name, a.program_type, b.librarian_id AS librarian_librarian_id, b.full_name AS librarian_full_name, b.employment_status AS librarian_employment_status
FROM library_programs a JOIN school_librarians b ON a.librarian_id = b.librarian_id;
```

| library_program_id | program_id | program_name | program_type | librarian_librarian_id | librarian_full_name | librarian_employment_status |
|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | inquiry | 1250209 | Theodore Mcgrath | employed |
| 101 | 2986219 | Pilot Initiative A | creativity | 7119786 | Account Name | contracted |
| 102 | 1186079 | Baseline Model | collaboration | 4985163 | Saipan International Airport | volunteer |
| 103 | 1562855 | Distributed Cluster | community | b_VB-EC-15 | Norma Fisher | vacant |

The inverse perspective, `v_library_program_school_librarian`, starts from the program and surfaces the librarian details. A row for program `100` ("Extended Review") reveals that Theodore Mcgrath is the assigned librarian, employed and certified, with the role of lead. A row for program `102` ("Baseline Model") shows Saipan International Airport as a volunteer, not-certified support librarian with thirteen years of experience. This view is useful when reviewing a program and needing to quickly identify who staffs it and their qualifications.

**View `v_library_program_flexible_space`**

```sql
CREATE VIEW v_library_program_flexible_space AS
SELECT a.library_program_id, a.program_id, a.program_name, a.program_type, b.space_id AS space_space_id, b.space_name AS space_space_name, b.space_type AS space_space_type
FROM library_programs a JOIN flexible_spaces b ON a.space_id = b.space_id;
```

| library_program_id | program_id | program_name | program_type | space_space_id | space_space_name | space_space_type |
|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | inquiry | 195344 | Baseline Protocol D | physical |
| 101 | 2986219 | Pilot Initiative A | creativity | 16611019 | Distributed Programme | virtual |
| 102 | 1186079 | Baseline Model | collaboration | L237 | Adaptive Standard | hybrid |
| 103 | 1562855 | Distributed Cluster | community | BjoernKW | Primary Framework A | physical |

The `v_library_program_flexible_space` view connects programs to their designated spaces, answering: what environment does each program use? Program `100` ("Extended Review") operates in space `195344` ("Baseline Protocol D"), a physical space with a capacity of 32, providing `regional-equipmen-30`, but neither bookable nor accessibility-compliant. Program `101` ("Pilot Initiative A") uses space `16611019` ("Distributed Programme"), a virtual space with capacity 41, providing `legacy-equipmen-31`, and both bookable and accessibility-compliant. This view helps planners evaluate whether space characteristics align with program needs.

**View `v_library_program_digital_resource`**

```sql
CREATE VIEW v_library_program_digital_resource AS
SELECT a.library_program_id, a.program_id, a.program_name, a.program_type, b.digital_resource_id AS resource_digital_resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM library_programs a JOIN digital_resources b ON a.digital_resource_id = b.digital_resource_id;
```

| library_program_id | program_id | program_name | program_type | resource_digital_resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | inquiry | 1000 | 1167 | Adaptive Corridor |
| 101 | 2986219 | Pilot Initiative A | creativity | 1001 | 2106708 | Primary Series |
| 102 | 1186079 | Baseline Model | collaboration | 1002 | 4180945 | Composite Assessment D |
| 103 | 1562855 | Distributed Cluster | community | 1003 | 10238270 | Compact Survey |

The `v_library_program_digital_resource` view links programs to their digital resources, answering: what digital tools does each program deploy? Program `100` ("Extended Review") uses resource `1000` ("Adaptive Corridor"), an open-access software tool costing $12.87, last updated on 2023-06-17, and marked as equitable. Program `101` ("Pilot Initiative A") uses resource `1001` ("Primary Series"), a licensed database costing $29.99, last updated on 2024-11-01, and not marked as equitable. This view supports budget review and equity audits by surfacing the cost and access profile of each program's digital tools.

**View `v_library_program_future_ready_goal`**

```sql
CREATE VIEW v_library_program_future_ready_goal AS
SELECT a.library_program_id, a.program_id, a.program_name, a.program_type, b.future_ready_goal_id AS goal_future_ready_goal_id, b.goal_id AS goal_goal_id, b.goal_name AS goal_goal_name
FROM library_programs a JOIN future_ready_goals b ON a.future_ready_goal_id = b.future_ready_goal_id;
```

| library_program_id | program_id | program_name | program_type | goal_future_ready_goal_id | goal_goal_id | goal_goal_name |
|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | inquiry | 1000 | Invoices | Pilot Review |
| 101 | 2986219 | Pilot Initiative A | creativity | 1001 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative |
| 102 | 1186079 | Baseline Model | collaboration | 1002 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | Distributed Model A |
| 103 | 1562855 | Distributed Cluster | community | 1003 | Invoice | Adaptive Cluster |

The `v_library_program_future_ready_goal` view ties programs to their strategic goals, answering: what future-ready objective does each program pursue? Program `100` ("Extended Review") is linked to goal `1000` ("Pilot Review"), categorized as `space` with priority level 22, and marked as met. Program `102` ("Baseline Model") is linked to goal `1002` ("Distributed Model A"), categorized as `digital_access` with priority level 28, and also marked as met. Program `101` ("Pilot Initiative A") targets goal `1001` ("Baseline Initiative"), a `partnership` category goal with priority 25, not yet met. This view enables strategic alignment checks across the program portfolio.

**View `v_flexible_space_library_program`**

```sql
CREATE VIEW v_flexible_space_library_program AS
SELECT a.space_id, a.space_name, a.space_type, a.capacity, b.library_program_id AS program_library_program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM flexible_spaces a JOIN library_programs b ON a.library_program_id = b.library_program_id;
```

| space_id | space_name | space_type | capacity | program_library_program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 195344 | Baseline Protocol D | physical | 32 | 100 | 103176 | Extended Review |
| 16611019 | Distributed Programme | virtual | 41 | 101 | 2986219 | Pilot Initiative A |
| L237 | Adaptive Standard | hybrid | 50 | 102 | 1186079 | Baseline Model |
| BjoernKW | Primary Framework A | physical | 59 | 103 | 1562855 | Distributed Cluster |

The `v_flexible_space_library_program` view inverts the space-to-program relationship, answering: which program does each space support, and what are that program's attributes? Space `195344` ("Baseline Protocol D") supports program `100` ("Extended Review"), an active inquiry-type program targeting students. Space `BjoernKW` ("Primary Framework A") supports program `103` ("Distributed Cluster"), an inactive community-type program targeting all audiences. This view is useful for space utilization reviews and for understanding the program context of each physical or virtual venue.

**View `v_digital_resource_library_program`**

```sql
CREATE VIEW v_digital_resource_library_program AS
SELECT a.digital_resource_id, a.resource_id, a.resource_name, a.resource_type, b.library_program_id AS program_library_program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM digital_resources a JOIN library_programs b ON a.library_program_id = b.library_program_id;
```

| digital_resource_id | resource_id | resource_name | resource_type | program_library_program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | 1167 | Adaptive Corridor | software | 100 | 103176 | Extended Review |
| 1001 | 2106708 | Primary Series | database | 101 | 2986219 | Pilot Initiative A |
| 1002 | 4180945 | Composite Assessment D | e_book | 102 | 1186079 | Baseline Model |
| 1003 | 10238270 | Compact Survey | video | 103 | 1562855 | Distributed Cluster |

The `v_digital_resource_library_program` view inverts the resource-to-program relationship, answering: which program uses each digital resource, and what is the program's status? Resource `1000` ("Adaptive Corridor") is used by program `100` ("Extended Review"), an active inquiry program. Resource `1003` ("Compact Survey") is used by program `103` ("Distributed Cluster"), an inactive community program. This view helps resource managers understand the deployment context of each digital asset.

**View `v_community_partnership_school_librarian`**

```sql
CREATE VIEW v_community_partnership_school_librarian AS
SELECT a.id, a.partnership_id, a.partnership_name, a.partner_type, b.librarian_id AS librarian_librarian_id, b.full_name AS librarian_full_name, b.employment_status AS librarian_employment_status
FROM community_partnerships a JOIN school_librarians b ON a.librarian_id = b.librarian_id;
```

| id | partnership_id | partnership_name | partner_type | librarian_librarian_id | librarian_full_name | librarian_employment_status |
|---|---|---|---|---|---|---|
| 1 | 6564393 | Distributed Review | family | 1250209 | Theodore Mcgrath | employed |
| 2 | gd_fp_eu_acc1 | Adaptive Initiative D | non_profit | 7119786 | Account Name | contracted |
| 3 | 32814 | Primary Model | government | 4985163 | Saipan International Airport | volunteer |
| 4 | 76a22c6ecc114448872b4c7cb5d4d087 | Composite Cluster | public_library | b_VB-EC-15 | Norma Fisher | vacant |

The `v_community_partnership_school_librarian` view joins partnerships with the librarians who manage them, answering: which librarian oversees which partnership, and what is the partnership's focus? Partnership `1` ("Distributed Review"), a family partnership focused on engagement, is managed by Theodore Mcgrath (`1250209`), an employed certified lead librarian. Partnership `4` ("Composite Cluster"), a public_library partnership focused on mentorship, is managed by Norma Fisher (`b_VB-EC-15`), a vacant certified advocate. This view supports partnership accountability and workload analysis for librarians.

**View `v_community_partnership_digital_resource`**

```sql
CREATE VIEW v_community_partnership_digital_resource AS
SELECT a.id, a.partnership_id, a.partnership_name, a.partner_type, b.digital_resource_id AS resource_digital_resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM community_partnerships a JOIN digital_resources b ON a.digital_resource_id = b.digital_resource_id;
```

| id | partnership_id | partnership_name | partner_type | resource_digital_resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|---|
| 1 | 6564393 | Distributed Review | family | 1000 | 1167 | Adaptive Corridor |
| 2 | gd_fp_eu_acc1 | Adaptive Initiative D | non_profit | 1001 | 2106708 | Primary Series |
| 3 | 32814 | Primary Model | government | 1002 | 4180945 | Composite Assessment D |
| 4 | 76a22c6ecc114448872b4c7cb5d4d087 | Composite Cluster | public_library | 1003 | 10238270 | Compact Survey |

The `v_community_partnership_digital_resource` view connects partnerships to the digital resources they support, answering: which digital resource is associated with each partnership? Partnership `1` ("Distributed Review") is linked to digital resource `1000` ("Adaptive Corridor"), an open-access software tool. Partnership `2` ("Adaptive Initiative D"), a non_profit partnership focused on lifelong learning, is linked to digital resource `1001` ("Primary Series"), a licensed database. This view reveals the resource dimension of external collaborations.

**View `v_future_ready_goal_library_program`**

```sql
CREATE VIEW v_future_ready_goal_library_program AS
SELECT a.future_ready_goal_id, a.goal_id, a.goal_name, a.goal_category, b.library_program_id AS program_library_program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM future_ready_goals a JOIN library_programs b ON a.library_program_id = b.library_program_id;
```

| future_ready_goal_id | goal_id | goal_name | goal_category | program_library_program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | Invoices | Pilot Review | space | 100 | 103176 | Extended Review |
| 1001 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative | partnership | 101 | 2986219 | Pilot Initiative A |
| 1002 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | Distributed Model A | digital_access | 102 | 1186079 | Baseline Model |
| 1003 | Invoice | Adaptive Cluster | curriculum | 103 | 1562855 | Distributed Cluster |

The `v_future_ready_goal_library_program` view inverts the goal-to-program relationship, answering: which program does each goal serve, and what is the program's type and status? Goal `1000` ("Pilot Review"), a `space` category goal with priority 22 that is met, serves program `100` ("Extended Review"), an active inquiry program. Goal `1003` ("Adaptive Cluster"), a `curriculum` category goal with priority 31 that is not met, serves program `103` ("Distributed Cluster"), an inactive community program. This view is valuable for tracking goal coverage across the program portfolio.

**View `v_future_ready_goal_assessment`**

```sql
CREATE VIEW v_future_ready_goal_assessment AS
SELECT a.future_ready_goal_id, a.goal_id, a.goal_name, a.goal_category, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_name AS assessment_assessment_name
FROM future_ready_goals a JOIN assessments b ON a.assessment_id = b.id;
```

| future_ready_goal_id | goal_id | goal_name | goal_category | assessment_id | assessment_assessment_id | assessment_assessment_name |
|---|---|---|---|---|---|---|
| 1000 | Invoices | Pilot Review | space | 100 | template_ivacode_pagata_20det40ind | Adaptive Series |
| 1001 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative | partnership | 101 | 19508914 | Primary Assessment |
| 1002 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | Distributed Model A | digital_access | 102 | 506000 | Composite Survey D |
| 1003 | Invoice | Adaptive Cluster | curriculum | 103 | 1204-0009-M | Compact Corridor |

The `v_future_ready_goal_assessment` view links goals to their assessments, answering: how is each goal being evaluated, and what are the assessment details? Goal `1000` ("Pilot Review") is assessed by assessment `100` ("Extended Review"), a formative assessment with a score of 88 out of 100, completed on 2025-12-14. Goal `1001` ("Baseline Initiative") is assessed by assessment `101` ("Pilot Initiative A"), a summative assessment with a score of 62 out of 100, completed on 2024-06-18. This view provides a direct line from strategic objective to measured outcome.

**View `v_assessment_library_program`**

```sql
CREATE VIEW v_assessment_library_program AS
SELECT a.id, a.assessment_id, a.assessment_name, a.assessment_type, b.library_program_id AS program_library_program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM assessments a JOIN library_programs b ON a.library_program_id = b.library_program_id;
```

| id | assessment_id | assessment_name | assessment_type | program_library_program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 100 | template_ivacode_pagata_20det40ind | Adaptive Series | formative | 100 | 103176 | Extended Review |
| 101 | 19508914 | Primary Assessment | summative | 101 | 2986219 | Pilot Initiative A |
| 102 | 506000 | Composite Survey D | diagnostic | 102 | 1186079 | Baseline Model |
| 103 | 1204-0009-M | Compact Corridor | performance | 103 | 1562855 | Distributed Cluster |

The `v_assessment_library_program` view connects assessments to their programs, answering: which program does each assessment evaluate, and what are the program's attributes? Assessment `100` ("Extended Review"), a formative assessment scoring 88 out of 100, evaluates program `100` ("Extended Review"), an active inquiry program targeting students. Assessment `103` ("Distributed Cluster"), a summative assessment scoring 55 out of 100, evaluates program `103` ("Distributed Cluster"), an inactive community program targeting all audiences. This view supports program quality review by surfacing assessment results alongside program metadata.

**View `v_assessment_future_ready_goal`**

```sql
CREATE VIEW v_assessment_future_ready_goal AS
SELECT a.id, a.assessment_id, a.assessment_name, a.assessment_type, b.future_ready_goal_id AS goal_future_ready_goal_id, b.goal_id AS goal_goal_id, b.goal_name AS goal_goal_name
FROM assessments a JOIN future_ready_goals b ON a.future_ready_goal_id = b.future_ready_goal_id;
```

| id | assessment_id | assessment_name | assessment_type | goal_future_ready_goal_id | goal_goal_id | goal_goal_name |
|---|---|---|---|---|---|---|
| 100 | template_ivacode_pagata_20det40ind | Adaptive Series | formative | 1000 | Invoices | Pilot Review |
| 101 | 19508914 | Primary Assessment | summative | 1001 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative |
| 102 | 506000 | Composite Survey D | diagnostic | 1002 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | Distributed Model A |
| 103 | 1204-0009-M | Compact Corridor | performance | 1003 | Invoice | Adaptive Cluster |

The `v_assessment_future_ready_goal` view links assessments to the goals they measure, answering: which goal does each assessment address, and what is the goal's status? Assessment `100` ("Extended Review") measures goal `1000` ("Pilot Review"), a `space` category goal that is met. Assessment `102` ("Baseline Model") measures goal `1002` ("Distributed Model A"), a `digital_access` category goal that is met. Assessment `101` ("Pilot Initiative A") measures goal `1001` ("Baseline Initiative"), a `partnership` category goal that is not met. This view closes the loop from assessment back to strategic objective, enabling verification that goals are being properly evaluated.

## Synthesis

The school library program ecosystem is a tightly interwoven set of records. Librarians staff programs; programs occupy spaces and deploy digital resources; programs pursue future-ready goals that are measured by assessments; and community partnerships extend the program's reach, managed by librarians and linked to digital resources. The base tables capture each entity in isolation, while the views assemble the relationships that matter for decision-making: who does what, with what resources, in what environment, toward which goals, and with what measured results. Practitioners who understand these connections can audit staffing, evaluate space utilization, review digital resource equity, track partnership activity, and verify that assessments properly measure strategic goals.