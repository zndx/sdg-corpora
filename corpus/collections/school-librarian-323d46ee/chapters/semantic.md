The school library ecosystem is a network of people, spaces, tools, and strategic objectives that must be tracked, coordinated, and reported on. At its centre sits the library program — a bounded initiative with a name, a type, a date range, and a target audience. Every program is staffed by a school librarian, housed in a flexible space, powered by a digital resource, and aligned to a future-ready goal. External community partnerships extend the reach of individual librarians and digital resources beyond the library walls. Assessments close the loop by evaluating whether each future-ready goal has been met. The relational model captures this ecosystem by normalising each entity into its own table, wiring them together with foreign keys, and then reassembling them through views that answer concrete operational questions.

**Table `school_librarians`**

| librarian_id | full_name | employment_status | certification_level | years_of_experience | current_role | library_program_id |
|---|---|---|---|---|---|---|
| 1250209 | Theodore Mcgrath | employed | certified | 7 | lead | 100 |
| 7119786 | Account Name | contracted | provisional | 10 | teach | 101 |
| 4985163 | Saipan International Airport | volunteer | not_certified | 13 | support | 102 |
| b_VB-EC-15 | Norma Fisher | vacant | certified | 16 | advocate | 103 |

The `school_librarians` table is the people table. Each row represents one librarian, identified by `librarian_id` — a composite-style key that mixes integers such as `1250209` and `7119786` with alphanumeric identifiers like `b_VB-EC-15`. The column `full_name` carries the human-readable name (Theodore Mcgrath, Norma Fisher, or the placeholder Account Name). `employment_status` is a categorical column whose values in the data are `employed`, `contracted`, `vacant`, and `volunteer`. `certification_level` takes the values `certified`, `provisional`, and `not_certified`. `years_of_experience` is an integer ranging from 7 to 16 in the sample. `current_role` classifies the librarian's function as `lead`, `teach`, `support`, or `advocate`. Finally, `library_program_id` is a foreign key pointing to the `library_programs` table, establishing that each librarian is assigned to exactly one program. In the data, Theodore Mcgrath (`librarian_id` 1250209) is assigned to program 100, while Norma Fisher (`b_VB-EC-15`) is assigned to program 103.

**Table `library_programs`**

| library_program_id | program_id | program_name | program_type | start_date | end_date | is_active | target_audience | librarian_id | space_id | digital_resource_id | future_ready_goal_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | inquiry | 2022-09-05 | 2022-09-01 | true | students | 1250209 | 195344 | 1000 | 1000 |
| 101 | 2986219 | Pilot Initiative A | creativity | 2023-02-16 | 2023-02-12 | false | teachers | 7119786 | 16611019 | 1001 | 1001 |
| 102 | 1186079 | Baseline Model | collaboration | 2024-07-27 | 2024-07-23 | true | community | 4985163 | L237 | 1002 | 1002 |
| 103 | 1562855 | Distributed Cluster | community | 2025-12-11 | 2025-12-07 | false | all | b_VB-EC-15 | BjoernKW | 1003 | 1003 |

The `library_programs` table is the hub of the schema. Its primary key is `library_program_id`, and it carries a secondary `program_id` (for example, `103176` or `2986219`) that serves as an external programme identifier. The `program_name` column holds human-readable titles such as Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster. `program_type` is categorical, taking values like `inquiry`, `creativity`, `collaboration`, and `community`. The date range of each programme is captured by `start_date` and `end_date` (both `DATE` type), while `is_active` is a boolean flag — true for Extended Review and Baseline Model, false for Pilot Initiative A and Distributed Cluster. `target_audience` distinguishes whether the programme serves `students`, `teachers`, `community`, or `all`. The remaining columns are foreign keys: `librarian_id` references `school_librarians`, `space_id` references `flexible_spaces`, `digital_resource_id` references `digital_resources`, and `future_ready_goal_id` references `future_ready_goals`. This single row therefore acts as a junction that ties together one librarian, one space, one digital resource, and one strategic goal.

**Table `flexible_spaces`**

| space_id | space_name | space_type | capacity | equipment_provided | is_bookable | accessibility_compliant | library_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 195344 | Baseline Protocol D | physical | 32 | regional-equipmen-30 | false | false | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 16611019 | Distributed Programme | virtual | 41 | legacy-equipmen-31 | true | true | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| L237 | Adaptive Standard | hybrid | 50 | compact-equipmen-32 | false | false | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| BjoernKW | Primary Framework A | physical | 59 | composite-equipmen-33 | true | true | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `flexible_spaces` table models the physical, virtual, or hybrid venues where library programmes take place. Its primary key is `space_id`, which in the data includes integers like `195344` and `16611019`, a mixed identifier `L237`, and an alphanumeric code `BjoernKW`. `space_name` carries descriptive labels such as Baseline Protocol D and Distributed Programme. `space_type` is categorical with values `physical`, `virtual`, and `hybrid`. `capacity` is an integer (32, 41, 50, 59). `equipment_provided` stores a string like `regional-equipmen-30` or `compact-equipmen-32`. `is_bookable` and `accessibility_compliant` are boolean flags. The `library_program_id` column is a foreign key back to `library_programs`, creating a one-to-one linkage: each space is assigned to exactly one programme. Timestamps `created_at` and `updated_at` record the lifecycle of the space record.

**Table `digital_resources`**

| digital_resource_id | resource_id | resource_name | resource_type | access_level | cost | last_updated | is_equitable | library_program_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1167 | Adaptive Corridor | software | open | 12.87 | 2023-06-17 | true | 100 |
| 1001 | 2106708 | Primary Series | database | licensed | 29.99 | 2024-11-01 | false | 101 |
| 1002 | 4180945 | Composite Assessment D | e_book | restricted | 12.36 | 2025-04-12 | true | 102 |
| 1003 | 10238270 | Compact Survey | video | open | 37.54 | 2022-09-23 | false | 103 |

The `digital_resources` table captures the software, databases, e-books, and videos that programmes draw upon. Its primary key is `digital_resource_id` (values 1000 through 1003 in the sample). `resource_id` is a secondary identifier (1167, 2106708, 4180945, 10238270). `resource_name` holds names such as Adaptive Corridor and Compact Survey. `resource_type` is categorical: `software`, `database`, `e_book`, `video`. `access_level` takes the values `open`, `licensed`, and `restricted`. `cost` is a decimal (12.87, 29.99, 12.36, 37.54). `last_updated` is a date. `is_equitable` is a boolean. The `library_program_id` foreign key ties each resource to exactly one programme.

**Table `community_partnerships`**

| id | partnership_id | partnership_name | partner_type | start_date | end_date | is_active | focus_area | librarian_id | digital_resource_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 6564393 | Distributed Review | family | 2022-09-05 | 2022-09-01 | true | engagement | 1250209 | 1000 |
| 2 | gd_fp_eu_acc1 | Adaptive Initiative D | non_profit | 2023-02-16 | 2023-02-12 | false | lifelong_learning | 7119786 | 1001 |
| 3 | 32814 | Primary Model | government | 2024-07-27 | 2024-07-23 | true | resource_sharing | 4985163 | 1002 |
| 4 | 76a22c6ecc114448872b4c7cb5d4d087 | Composite Cluster | public_library | 2025-12-11 | 2025-12-07 | false | mentorship | b_VB-EC-15 | 1003 |

The `community_partnerships` table stands apart from the hub-and-spoke pattern. Its primary key is `id` (1, 2, 3, 4), and it carries a secondary `partnership_id` that can be a long integer, a UUID-like string (`gd_fp_eu_acc1`), or a hex identifier (`76a22c6ecc114448872b4c7cb5d4d087`). `partnership_name` holds labels such as Distributed Review and Adaptive Initiative D. `partner_type` is categorical: `family`, `non_profit`, `government`, `public_library`. `start_date` and `end_date` define the partnership window. `is_active` is a boolean. `focus_area` is categorical with values `engagement`, `lifelong_learning`, `resource_sharing`, and `mentorship`. Crucially, this table has two foreign keys: `librarian_id` references `school_librarians`, and `digital_resource_id` references `digital_resources`. A partnership is thus a bridge between a person and a tool, not a programme.

**Table `future_ready_goals`**

| future_ready_goal_id | goal_id | goal_name | goal_category | priority_level | is_met | last_assessed | library_program_id | assessment_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | Invoices | Pilot Review | space | 22 | true | 2025-12-14 | 100 | 100 |
| 1001 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Baseline Initiative | partnership | 25 | false | 2022-05-25 | 101 | 101 |
| 1002 | 52ef0c068b8f4ba5b4fcc52c95ef9e5e | Distributed Model A | digital_access | 28 | true | 2023-10-09 | 102 | 102 |
| 1003 | Invoice | Adaptive Cluster | curriculum | 31 | false | 2024-03-20 | 103 | 103 |

The `future_ready_goals` table encodes strategic objectives. Its primary key is `future_ready_goal_id` (1000–1003). `goal_id` is a secondary identifier that can be a word (`Invoices`), a UUID (`a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3`), or a hex string. `goal_name` carries titles like Pilot Review and Baseline Initiative. `goal_category` is categorical: `space`, `partnership`, `digital_access`, `curriculum`. `priority_level` is an integer (22, 25, 28, 31). `is_met` is a boolean. `last_assessed` is a date. The `library_program_id` foreign key links each goal to exactly one programme, and `assessment_id` is a foreign key to the `assessments` table, creating a one-to-one linkage between a goal and its evaluation record.

**Table `assessments`**

| id | assessment_id | assessment_name | assessment_type | target_skill | is_digital | last_administered | library_program_id | future_ready_goal_id |
|---|---|---|---|---|---|---|---|---|
| 100 | template_ivacode_pagata_20det40ind | Adaptive Series | formative | critical_thinking | false | 2023-06-14 | 100 | 1000 |
| 101 | 19508914 | Primary Assessment | summative | information_literacy | true | 2024-11-25 | 101 | 1001 |
| 102 | 506000 | Composite Survey D | diagnostic | digital_citizenship | false | 2025-04-09 | 102 | 1002 |
| 103 | 1204-0009-M | Compact Corridor | performance | creativity | true | 2022-09-20 | 103 | 1003 |

The `assessments` table stores evaluation records. Its primary key is `assessment_id`, which in the data aligns with the `future_ready_goal_id` values (100, 101, 102, 103). Each assessment is linked to exactly one future-ready goal via the `future_ready_goal_id` foreign key, and each goal is linked to exactly one assessment. The table captures the outcome of evaluating whether a strategic objective has been achieved.

The foreign-key topology of the schema can be described as a central hub with spokes and two independent bridges. The `library_programs` table is the hub: its columns `librarian_id`, `space_id`, `digital_resource_id`, and `future_ready_goal_id` are foreign keys that each point to exactly one row in the corresponding child table. Conversely, each child table (`school_librarians`, `flexible_spaces`, `digital_resources`, `future_ready_goals`) carries a `library_program_id` column that is a foreign key back to `library_programs`. This creates a strict one-to-one relationship between a programme and each of its four associated entities. The `community_partnerships` table does not follow this pattern; instead, it links `school_librarians` and `digital_resources` directly, forming a bridge that bypasses the programme hub. The `assessments` table links to `future_ready_goals`, forming a one-to-one evaluation pair.

The views in the schema are thin join layers that reconstruct domain facts from the normalised tables. Each view answers a specific question by joining two tables along their shared foreign key.

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

The view `v_school_librarian_library_program` joins `school_librarians` to `library_programs` on `librarian_id`. It answers the question: "Which programme is each librarian assigned to?" A row for Theodore Mcgrath (`librarian_id` 1250209) shows his assignment to programme 100 (Extended Review, an inquiry-type programme for students). A row for Norma Fisher (`b_VB-EC-15`) shows her assignment to programme 103 (Distributed Cluster, a community-type programme for all audiences).

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

The view `v_library_program_school_librarian` performs the same join in the opposite direction, starting from `library_programs` and attaching the librarian's details. It answers: "Who runs each programme?" Programme 100 (Extended Review) is run by Theodore Mcgrath, who is employed, certified, and serves in a lead role with 7 years of experience. Programme 102 (Baseline Model) is run by the librarian at Saipan International Airport, a volunteer with 13 years of experience and a support role.

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

The view `v_library_program_flexible_space` joins `library_programs` to `flexible_spaces` on `space_id`. It answers: "Which space hosts each programme?" Programme 100 (Extended Review) uses space 195344 (Baseline Protocol D), a physical space with capacity 32 that is not bookable and not accessibility compliant. Programme 101 (Pilot Initiative A) uses space 16611019 (Distributed Programme), a virtual space with capacity 41 that is bookable and accessibility compliant.

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

The view `v_library_program_digital_resource` joins `library_programs` to `digital_resources` on `digital_resource_id`. It answers: "Which digital resource does each programme use?" Programme 100 (Extended Review) uses resource 1000 (Adaptive Corridor), a software-type resource with open access costing 12.87, last updated on 2023-06-17, and marked as equitable. Programme 101 (Pilot Initiative A) uses resource 1001 (Primary Series), a database-type resource with licensed access costing 29.99, not marked as equitable.

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

The view `v_library_program_future_ready_goal` joins `library_programs` to `future_ready_goals` on `future_ready_goal_id`. It answers: "Which strategic goal does each programme target?" Programme 100 (Extended Review) targets goal 1000 (Pilot Review), a space-category goal with priority level 22 that is marked as met, last assessed on 2025-12-14. Programme 101 (Pilot Initiative A) targets goal 1001 (Baseline Initiative), a partnership-category goal with priority level 25 that is not yet met, last assessed on 2022-05-25.

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

The view `v_flexible_space_library_program` joins `flexible_spaces` to `library_programs` on `library_program_id`, reversing the perspective. It answers: "Which programme is each space assigned to?" Space BjoernKW (Primary Framework A), a physical space with capacity 59 and composite equipment, is assigned to programme 103 (Distributed Cluster). Space L237 (Adaptive Standard), a hybrid space with capacity 50, is assigned to programme 102 (Baseline Model).

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

The view `v_digital_resource_library_program` joins `digital_resources` to `library_programs` on `library_program_id`. It answers: "Which programme uses each digital resource?" Resource 1003 (Compact Survey), a video-type resource with open access costing 37.54, is used by programme 103 (Distributed Cluster). Resource 1002 (Composite Assessment D), an e-book with restricted access costing 12.36, is used by programme 102 (Baseline Model).

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

The view `v_community_partnership_school_librarian` joins `community_partnerships` to `school_librarians` on `librarian_id`. It answers: "Which librarian is associated with each community partnership?" Partnership 1 (Distributed Review), a family-type partnership focused on engagement, is associated with librarian 1250209 (Theodore Mcgrath). Partnership 4 (Composite Cluster), a public-library-type partnership focused on mentorship, is associated with librarian `b_VB-EC-15` (Norma Fisher).

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

The view `v_community_partnership_digital_resource` joins `community_partnerships` to `digital_resources` on `digital_resource_id`. It answers: "Which digital resource does each partnership leverage?" Partnership 1 (Distributed Review) leverages digital resource 1000 (Adaptive Corridor). Partnership 3 (Primary Model), a government-type partnership focused on resource sharing, leverages digital resource 1002 (Composite Assessment D).

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

The view `v_future_ready_goal_library_program` joins `future_ready_goals` to `library_programs` on `library_program_id`. It answers: "Which programme is each future-ready goal attached to?" Goal 1000 (Pilot Review, category space, priority 22, met) is attached to programme 100 (Extended Review). Goal 1003 (Adaptive Cluster, category curriculum, priority 31, not met) is attached to programme 103 (Distributed Cluster).

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

The view `v_future_ready_goal_assessment` joins `future_ready_goals` to `assessments` on `assessment_id`. It answers: "What is the assessment status of each future-ready goal?" Goal 1000 (Pilot Review) has assessment 100, and the goal is marked as met. Goal 1001 (Baseline Initiative) has assessment 101, and the goal is not yet met. This view provides a direct read of whether each strategic objective has been evaluated and whether it has been achieved.

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

The view `v_assessment_library_program` joins `assessments` to `library_programs` through the chain `assessments → future_ready_goals → library_programs`. It answers: "Which programme is each assessment ultimately evaluating?" Assessment 100 evaluates programme 100 (Extended Review). Assessment 103 evaluates programme 103 (Distributed Cluster). This view collapses the two-hop path into a single joinable result.

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

The view `v_assessment_future_ready_goal` joins `assessments` to `future_ready_goals` on `assessment_id`. It answers: "Which goal does each assessment correspond to?" Assessment 100 corresponds to goal 1000 (Pilot Review, space category, priority 22, met). Assessment 102 corresponds to goal 1002 (Distributed Model A, digital_access category, priority 28, met). This view is the most direct way to read the assessment-to-goal mapping.

The schema design reflects a deliberate trade-off between normalisation and query convenience. By placing foreign keys in both the hub (`library_programs`) and the spokes (each child table), the model supports bidirectional navigation without requiring multi-hop joins for the most common queries. A programme manager can look up a programme and immediately see its librarian, space, resource, and goal in a single row. A librarian can look up their profile and immediately see their assigned programme. The `community_partnerships` table, by contrast, deliberately bypasses the programme hub to model a direct person-to-resource relationship, reflecting the real-world observation that partnerships often connect individual librarians with specific digital tools regardless of which programme those tools serve. The `assessments` table forms a tight one-to-one pair with `future_ready_goals`, ensuring that every strategic objective has exactly one evaluation record and every evaluation record belongs to exactly one objective. The views materialise these relationships as flat, queryable surfaces, allowing analysts to answer questions about programme staffing, space allocation, resource usage, goal attainment, and partnership impact without writing explicit join clauses.