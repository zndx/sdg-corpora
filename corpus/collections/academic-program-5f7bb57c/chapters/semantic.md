## Domain Modelling and Relational Materialization

The domain under examination concerns the governance of academic programs, the competencies they cultivate, the professional roles that enact those competencies, and the research activities through which both are validated. At its core, the schema captures a single institutional reality: an academic program such as the one identified by `program_code` `191` (a primary-degree offering with `enrollment_mode` `full-time` and `status` `active`) does not exist in isolation. It is anchored to a concentration, linked to a professional role, and validated through research activities that employ statistical methods. The relational model preserves this reality by decomposing it into eight base tables, two of which are junction tables that resolve many-to-many relationships, and a suite of materialized views that reassemble the normalized facts into domain-readable projections.

**Table `academic_programs`**

| academic_program_id | program_code | degree_level | concentration | total_credit_hours_required | max_advanced_standing_credits | enrollment_mode | effective_date | status | concentration_id | professional_role_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 191 | primary-degree-22 | distributed-concentr-54 | 0 | 13 | full-time | 2023-02-14 | active | 1000 | 100 |
| 2 | 1186082 | adaptive-degree-23 | baseline-concentr-55 | 28 | 23 | part-time | 2024-07-25 | pending | 1001 | 101 |
| 3 | 3990187 | distributed-degree-24 | pilot-concentr-56 | 8 | 33 | full-time | 2025-12-09 | archived | 1002 | 102 |
| 4 | flexible-thinking | baseline-degree-25 | extended-concentr-57 | 14 | 43 | part-time | 2022-05-20 | active | 1003 | 103 |

The `academic_programs` table is the central entity. Its primary key, `academic_program_id`, is a surrogate integer that uniquely identifies each program row. The natural identifier `program_code` carries domain-meaningful values: `191`, `1186082`, `3990187`, and `flexible-thinking`. The `degree_level` column distinguishes between `primary-degree-22`, `adaptive-degree-23`, `distributed-degree-24`, and `baseline-degree-25`. Credit requirements are captured in `total_credit_hours_required` (ranging from `0` to `28` in the sample) and `max_advanced_standing_credits` (values `13`, `23`, `33`, `43`). The `enrollment_mode` column is a categorical discriminator between `full-time` and `part-time` students, while `effective_date` and `status` (`active`, `pending`, `archived`) provide temporal and lifecycle context. Crucially, `academic_programs` carries two foreign keys: `concentration_id` references `concentrations(id)`, and `professional_role_id` references `professional_roles(id)`. These are cardinality-bounded relationships — each program is associated with exactly one concentration and one professional role in the current design.

**Table `concentrations`**

| id | concentration_name | focus_area | methodology_type | is_core | academic_program_id | statistical_method_id |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Corridor | pilot-focus-20 | primary-methodol-22 | false | 1 | 100 |
| 1001 | Primary Series | extended-focus-21 | adaptive-methodol-23 | true | 2 | 101 |
| 1002 | Composite Assessment D | integrated-focus-22 | distributed-methodol-24 | false | 3 | 102 |
| 1003 | Compact Survey | seasonal-focus-23 | baseline-methodol-25 | true | 4 | 103 |

The `concentrations` table defines the academic focus areas. Its surrogate key `id` (values `1000` through `1003`) is referenced by `academic_programs.concentration_id`. The `concentration_name` column holds human-readable labels such as `Adaptive Corridor`, `Primary Series`, `Composite Assessment D`, and `Compact Survey`. The `focus_area` column (`pilot-focus-20`, `extended-focus-21`, `integrated-focus-22`, `seasonal-focus-23`) and `methodology_type` column (`primary-methodol-22`, `adaptive-methodol-23`, `distributed-methodol-24`, `baseline-methodol-25`) provide categorical descriptors. The boolean `is_core` flag distinguishes core concentrations (`true` for `Primary Series` and `Compact Survey`) from elective ones. The foreign key `academic_program_id` points back to `academic_programs(academic_program_id)`, creating a bidirectional link: a concentration belongs to a program, and a program hosts a concentration. Additionally, `concentrations.statistical_method_id` references `statistical_methods(statistical_method_id)`, tying each concentration to a specific statistical method.

**Table `competencies`**

| id | competency_i_d | competency_title | competency_description | proficiency_level | assessment_type | academic_program_id | professional_role_id | research_activity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | COM-2721 | Adaptive Framework | Primary Corridor A | novice | written | 1 | 100 | 1 |
| 2 | COM-2725 | Primary Protocol | Composite Series | proficient | oral | 2 | 101 | 2 |
| 3 | COM-2729 | Composite Programme D | Compact Assessment | expert | graphical | 3 | 102 | 3 |
| 4 | COM-2733 | Compact Standard | Legacy Survey D | novice | practical | 4 | 103 | 4 |

Competencies represent the knowledge, skills, and abilities that programs are expected to develop. The `competencies` table uses `id` as its surrogate primary key and `competency_i_d` (values `COM-2721`, `COM-2725`, `COM-2729`, `COM-2733`) as a natural identifier. The `competency_title` column contains labels like `Adaptive Framework`, `Primary Protocol`, `Composite Programme D`, and `Compact Standard`, while `competency_description` provides free-text elaborations such as `Primary Corridor A` and `Legacy Survey D`. The `proficiency_level` column is an ordinal categorical field with values `novice`, `proficient`, and `expert`. The `assessment_type` column (`written`, `oral`, `graphical`, `practical`) specifies how proficiency is measured. Three foreign keys anchor competencies to their context: `academic_program_id` references `academic_programs(academic_program_id)`, `professional_role_id` references `professional_roles(id)`, and `research_activity_id` references `research_activities(id)`. This triple anchoring means each competency is simultaneously a program requirement, a role expectation, and a research deliverable.

**Table `professional_roles`**

| id | role_name | role_category | primary_responsibility | academic_program_id | research_activity_id |
|---|---|---|---|---|---|
| 100 | Seasonal Programme | Researcher | pilot-primary-26 | 1 | 1 |
| 101 | Integrated Standard | Collaborator | extended-primary-27 | 2 | 2 |
| 102 | Extended Framework D | Educator | integrated-primary-28 | 3 | 3 |
| 103 | Pilot Protocol | Researcher | seasonal-primary-29 | 4 | 4 |

The `professional_roles` table enumerates the roles through which competencies are enacted. Its surrogate key `id` (values `100` through `103`) is referenced by `academic_programs.professional_role_id` and by `competencies.professional_role_id`. The `role_name` column holds values such as `Seasonal Programme`, `Integrated Standard`, `Extended Framework D`, and `Pilot Protocol`. The `role_category` column (`Researcher`, `Collaborator`, `Educator`) provides a high-level classification, while `primary_responsibility` carries categorical descriptors like `pilot-primary-26` and `seasonal-primary-29`. Two foreign keys, `academic_program_id` and `research_activity_id`, link each role to its programmatic and research context.

**Table `research_activities`**

| id | activity_i_d | activity_type | study_design | data_source | start_date | end_date | status | statistical_method_id | competency_id | professional_role_id | involves_collaborator_professional_role_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ACT-2460 | foundational | adaptive-study-11 | pilot-data-38 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 100 | 1 | 100 | 100 |
| 2 | ACT-2464 | methodological | distributed-study-12 | extended-data-39 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | 101 | 2 | 101 | 101 |
| 3 | ACT-2468 | application | baseline-study-13 | integrated-data-40 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 102 | 3 | 102 | 102 |
| 4 | ACT-2472 | dissemination | pilot-study-14 | seasonal-data-41 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | published | 103 | 4 | 103 | 103 |

Research activities are the operational events through which competencies are demonstrated and validated. The `research_activities` table uses `id` as its surrogate key and `activity_i_d` (`ACT-2460`, `ACT-2464`, `ACT-2468`, `ACT-2472`) as a natural identifier. The `activity_type` column (`foundational`, `methodological`, `application`, `dissemination`) and `study_design` column (`adaptive-study-11`, `distributed-study-12`, `baseline-study-13`, `pilot-study-14`) describe the nature of the research. The `data_source` column (`pilot-data-38`, `extended-data-39`, `integrated-data-40`, `seasonal-data-41`) identifies where data originates. Temporal boundaries are captured in `start_date` and `end_date`, which in the sample data exhibit an interesting pattern: the `end_date` precedes the `start_date` (e.g., `2022-09-05T20:24:00` to `2022-09-01T08:00:00`), suggesting these may represent planned versus actual dates or a data-entry convention. The `status` column (`planned`, `ongoing`, `completed`, `published`) tracks lifecycle progression. Five foreign keys anchor research activities: `statistical_method_id` references `statistical_methods(statistical_method_id)`, `competency_id` references `competencies(id)`, `professional_role_id` references `professional_roles(id)`, and `involves_collaborator_professional_role_id` references `professional_roles(id)` again, enabling a role-to-role collaboration link within the same activity.

**Table `statistical_methods`**

| statistical_method_id | method_i_d | method_name | method_category | complexity_level | is_standardized | concentration_id | research_activity_id | professional_role_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | MET-2516 | Pilot Assessment | study_design | 37 | false | 1000 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | MET-2521 | Baseline Survey | data_analysis | 45 | true | 1001 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | MET-2526 | Distributed Corridor A | inference | 53 | false | 1002 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | MET-2531 | Adaptive Series | quantification | 61 | true | 1003 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Statistical methods are the analytical techniques applied within research activities and concentrations. The `statistical_methods` table uses `statistical_method_id` as its primary key (values `100` through `103`) and `method_i_d` (`MET-2516`, `MET-2521`, `MET-2526`, `MET-2531`) as a natural identifier. The `method_name` column contains labels such as `Pilot Assessment`, `Baseline Survey`, `Distributed Corridor A`, and `Adaptive Series`. The `method_category` column (`study_design`, `data_analysis`, `inference`, `quantification`) classifies the method's purpose, while `complexity_level` is a numeric attribute (`37`, `45`, `53`, `61`). The boolean `is_standardized` flag distinguishes standardized methods (`true` for `Baseline Survey` and `Adaptive Series`) from non-standardized ones. Three foreign keys — `concentration_id`, `research_activity_id`, and `professional_role_id` — each reference their respective tables, creating a hub-and-spoke pattern where statistical methods are simultaneously associated with a concentration, a research activity, and a professional role. Timestamps `created_at` and `updated_at` provide audit trails.

**Table `programs_competencies`**

| academic_program_id | competency_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `programs_competencies` junction table resolves the many-to-many relationship between academic programs and competencies. While the `competencies` table already carries an `academic_program_id` foreign key that establishes a direct link, this junction table provides an explicit, denormalization-resistant mapping layer. Its columns — `program_id` referencing `academic_programs(academic_program_id)` and `competency_id` referencing `competencies(id)` — form a composite key that allows a single program to be associated with multiple competencies and a single competency to be required by multiple programs. This design supports scenarios where competency requirements evolve over time or where a competency is shared across programs with different proficiency expectations.

**Table `roles_competencies`**

| professional_role_id | competency_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

Similarly, the `roles_competencies` junction table resolves the many-to-many relationship between professional roles and competencies. Its columns — `role_id` referencing `professional_roles(id)` and `competency_id` referencing `competencies(id)` — enable a professional role to require multiple competencies and a competency to be expected across multiple roles. This is particularly important in domains where role boundaries are fluid and competencies are portable across organizational functions.

The junction tables `programs_competencies` and `roles_competencies` are the only tables in the schema that exist purely to resolve many-to-many relationships. All other tables are entity tables with their own identity and attributes. The foreign keys embedded in the entity tables (`academic_programs.concentration_id`, `academic_programs.professional_role_id`, `concentrations.academic_program_id`, `concentrations.statistical_method_id`, `competencies.academic_program_id`, `competencies.professional_role_id`, `competencies.research_activity_id`, `professional_roles.academic_program_id`, `professional_roles.research_activity_id`, `research_activities.statistical_method_id`, `research_activities.competency_id`, `research_activities.professional_role_id`, `research_activities.involves_collaborator_professional_role_id`, `statistical_methods.concentration_id`, `statistical_methods.research_activity_id`, `statistical_methods.professional_role_id`) create a dense web of referential integrity constraints that ensure every fact in the schema is traceable to its source entity.

## View Projections

The views materialize the normalized schema into domain-readable projections. Each view performs a join across two or more base tables to answer a specific analytical question.

**View `v_academic_program_concentration`**

```sql
CREATE VIEW v_academic_program_concentration AS
SELECT a.academic_program_id, a.program_code, a.degree_level, a.concentration, b.id AS concentration_id, b.concentration_name AS concentration_concentration_name, b.focus_area AS concentration_focus_area
FROM academic_programs a JOIN concentrations b ON a.concentration_id = b.id;
```

| academic_program_id | program_code | degree_level | concentration | concentration_id | concentration_concentration_name | concentration_focus_area |
|---|---|---|---|---|---|---|
| 1 | 191 | primary-degree-22 | distributed-concentr-54 | 1000 | Adaptive Corridor | pilot-focus-20 |
| 2 | 1186082 | adaptive-degree-23 | baseline-concentr-55 | 1001 | Primary Series | extended-focus-21 |
| 3 | 3990187 | distributed-degree-24 | pilot-concentr-56 | 1002 | Composite Assessment D | integrated-focus-22 |
| 4 | flexible-thinking | baseline-degree-25 | extended-concentr-57 | 1003 | Compact Survey | seasonal-focus-23 |

This view joins `academic_programs` with `concentrations` on `academic_programs.concentration_id = concentrations.id`. It answers the question: "What concentration is associated with each academic program?" A row from this view might show `program_code` `191` paired with `concentration_name` `Adaptive Corridor` and `focus_area` `pilot-focus-20`. This projection is the most direct expression of the program-concentration relationship, collapsing the foreign key into a human-readable label.

**View `v_academic_program_competency_detail`**

```sql
CREATE VIEW v_academic_program_competency_detail AS
SELECT a.academic_program_id, a.program_code, a.degree_level, b.id AS competency_id, b.competency_i_d AS competency_competency_i_d, b.competency_title AS competency_competency_title
FROM academic_programs a
  JOIN programs_competencies j ON j.academic_program_id = a.academic_program_id
  JOIN competencies b ON b.id = j.competency_id;
```

| academic_program_id | program_code | degree_level | competency_id | competency_competency_i_d | competency_competency_title |
|---|---|---|---|---|---|
| 1 | 191 | primary-degree-22 | 1 | COM-2721 | Adaptive Framework |
| 1 | 191 | primary-degree-22 | 2 | COM-2725 | Primary Protocol |
| 2 | 1186082 | adaptive-degree-23 | 2 | COM-2725 | Primary Protocol |
| 2 | 1186082 | adaptive-degree-23 | 3 | COM-2729 | Composite Programme D |
| 3 | 3990187 | distributed-degree-24 | 3 | COM-2729 | Composite Programme D |
| 3 | 3990187 | distributed-degree-24 | 4 | COM-2733 | Compact Standard |
| 4 | flexible-thinking | baseline-degree-25 | 4 | COM-2733 | Compact Standard |
| 4 | flexible-thinking | baseline-degree-25 | 1 | COM-2721 | Adaptive Framework |

This view joins `academic_programs` with `competencies` on `academic_programs.academic_program_id = competencies.academic_program_id`. It answers: "What competencies are required by each academic program?" A representative row might display `program_code` `191` alongside `competency_title` `Adaptive Framework` and `proficiency_level` `novice`. This view is essential for curriculum mapping, as it reveals the competency landscape of each program.

**View `v_academic_program_professional_role`**

```sql
CREATE VIEW v_academic_program_professional_role AS
SELECT a.academic_program_id, a.program_code, a.degree_level, a.concentration, b.id AS role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM academic_programs a JOIN professional_roles b ON a.professional_role_id = b.id;
```

| academic_program_id | program_code | degree_level | concentration | role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 1 | 191 | primary-degree-22 | distributed-concentr-54 | 100 | Seasonal Programme | Researcher |
| 2 | 1186082 | adaptive-degree-23 | baseline-concentr-55 | 101 | Integrated Standard | Collaborator |
| 3 | 3990187 | distributed-degree-24 | pilot-concentr-56 | 102 | Extended Framework D | Educator |
| 4 | flexible-thinking | baseline-degree-25 | extended-concentr-57 | 103 | Pilot Protocol | Researcher |

This view joins `academic_programs` with `professional_roles` on `academic_programs.professional_role_id = professional_roles.id`. It answers: "Which professional role is associated with each academic program?" A row might show `program_code` `191` paired with `role_name` `Seasonal Programme` and `role_category` `Researcher`. This projection clarifies the operational context of each program.

**View `v_concentration_academic_program`**

```sql
CREATE VIEW v_concentration_academic_program AS
SELECT a.id, a.concentration_name, a.focus_area, a.methodology_type, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.degree_level AS program_degree_level
FROM concentrations a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| id | concentration_name | focus_area | methodology_type | program_academic_program_id | program_program_code | program_degree_level |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Corridor | pilot-focus-20 | primary-methodol-22 | 1 | 191 | primary-degree-22 |
| 1001 | Primary Series | extended-focus-21 | adaptive-methodol-23 | 2 | 1186082 | adaptive-degree-23 |
| 1002 | Composite Assessment D | integrated-focus-22 | distributed-methodol-24 | 3 | 3990187 | distributed-degree-24 |
| 1003 | Compact Survey | seasonal-focus-23 | baseline-methodol-25 | 4 | flexible-thinking | baseline-degree-25 |

This view joins `concentrations` with `academic_programs` on `concentrations.academic_program_id = academic_programs.academic_program_id`. It answers the inverse of `v_academic_program_concentration`: "Which academic program hosts each concentration?" A row might display `concentration_name` `Adaptive Corridor` alongside `program_code` `191` and `degree_level` `primary-degree-22`. This view is useful when starting from a concentration and tracing upward to its parent program.

**View `v_concentration_statistical_method`**

```sql
CREATE VIEW v_concentration_statistical_method AS
SELECT a.id, a.concentration_name, a.focus_area, a.methodology_type, b.statistical_method_id AS method_statistical_method_id, b.method_i_d AS method_method_i_d, b.method_name AS method_method_name
FROM concentrations a JOIN statistical_methods b ON a.statistical_method_id = b.statistical_method_id;
```

| id | concentration_name | focus_area | methodology_type | method_statistical_method_id | method_method_i_d | method_method_name |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Corridor | pilot-focus-20 | primary-methodol-22 | 100 | MET-2516 | Pilot Assessment |
| 1001 | Primary Series | extended-focus-21 | adaptive-methodol-23 | 101 | MET-2521 | Baseline Survey |
| 1002 | Composite Assessment D | integrated-focus-22 | distributed-methodol-24 | 102 | MET-2526 | Distributed Corridor A |
| 1003 | Compact Survey | seasonal-focus-23 | baseline-methodol-25 | 103 | MET-2531 | Adaptive Series |

This view joins `concentrations` with `statistical_methods` on `concentrations.statistical_method_id = statistical_methods.statistical_method_id`. It answers: "What statistical method is associated with each concentration?" A row might show `concentration_name` `Adaptive Corridor` paired with `method_name` `Pilot Assessment` and `method_category` `study_design`. This projection reveals the analytical backbone of each concentration.

**View `v_competency_academic_program`**

```sql
CREATE VIEW v_competency_academic_program AS
SELECT a.id, a.competency_i_d, a.competency_title, a.competency_description, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.degree_level AS program_degree_level
FROM competencies a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| id | competency_i_d | competency_title | competency_description | program_academic_program_id | program_program_code | program_degree_level |
|---|---|---|---|---|---|---|
| 1 | COM-2721 | Adaptive Framework | Primary Corridor A | 1 | 191 | primary-degree-22 |
| 2 | COM-2725 | Primary Protocol | Composite Series | 2 | 1186082 | adaptive-degree-23 |
| 3 | COM-2729 | Composite Programme D | Compact Assessment | 3 | 3990187 | distributed-degree-24 |
| 4 | COM-2733 | Compact Standard | Legacy Survey D | 4 | flexible-thinking | baseline-degree-25 |

This view joins `competencies` with `academic_programs` on `competencies.academic_program_id = academic_programs.academic_program_id`. It answers: "Which academic program is associated with each competency?" A row might display `competency_title` `Adaptive Framework` alongside `program_code` `191` and `enrollment_mode` `full-time`. This view is the competency-centric counterpart to `v_academic_program_competency_detail`.

**View `v_competency_professional_role`**

```sql
CREATE VIEW v_competency_professional_role AS
SELECT a.id, a.competency_i_d, a.competency_title, a.competency_description, b.id AS role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM competencies a JOIN professional_roles b ON a.professional_role_id = b.id;
```

| id | competency_i_d | competency_title | competency_description | role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 1 | COM-2721 | Adaptive Framework | Primary Corridor A | 100 | Seasonal Programme | Researcher |
| 2 | COM-2725 | Primary Protocol | Composite Series | 101 | Integrated Standard | Collaborator |
| 3 | COM-2729 | Composite Programme D | Compact Assessment | 102 | Extended Framework D | Educator |
| 4 | COM-2733 | Compact Standard | Legacy Survey D | 103 | Pilot Protocol | Researcher |

This view joins `competencies` with `professional_roles` on `competencies.professional_role_id = professional_roles.id`. It answers: "Which professional role is associated with each competency?" A row might show `competency_title` `Adaptive Framework` paired with `role_name` `Seasonal Programme` and `role_category` `Researcher`. This projection is critical for workforce planning, as it maps competencies to the roles that require them.

**View `v_competency_research_activity`**

```sql
CREATE VIEW v_competency_research_activity AS
SELECT a.id, a.competency_i_d, a.competency_title, a.competency_description, b.id AS activity_id, b.activity_i_d AS activity_activity_i_d, b.activity_type AS activity_activity_type
FROM competencies a JOIN research_activities b ON a.research_activity_id = b.id;
```

| id | competency_i_d | competency_title | competency_description | activity_id | activity_activity_i_d | activity_activity_type |
|---|---|---|---|---|---|---|
| 1 | COM-2721 | Adaptive Framework | Primary Corridor A | 1 | ACT-2460 | foundational |
| 2 | COM-2725 | Primary Protocol | Composite Series | 2 | ACT-2464 | methodological |
| 3 | COM-2729 | Composite Programme D | Compact Assessment | 3 | ACT-2468 | application |
| 4 | COM-2733 | Compact Standard | Legacy Survey D | 4 | ACT-2472 | dissemination |

This view joins `competencies` with `research_activities` on `competencies.research_activity_id = research_activities.id`. It answers: "Which research activity is associated with each competency?" A row might display `competency_title` `Adaptive Framework` alongside `activity_i_d` `ACT-2460` and `activity_type` `foundational`. This view reveals the research validation path for each competency.

**View `v_professional_role_academic_program`**

```sql
CREATE VIEW v_professional_role_academic_program AS
SELECT a.id, a.role_name, a.role_category, a.primary_responsibility, b.academic_program_id AS program_academic_program_id, b.program_code AS program_program_code, b.degree_level AS program_degree_level
FROM professional_roles a JOIN academic_programs b ON a.academic_program_id = b.academic_program_id;
```

| id | role_name | role_category | primary_responsibility | program_academic_program_id | program_program_code | program_degree_level |
|---|---|---|---|---|---|---|
| 100 | Seasonal Programme | Researcher | pilot-primary-26 | 1 | 191 | primary-degree-22 |
| 101 | Integrated Standard | Collaborator | extended-primary-27 | 2 | 1186082 | adaptive-degree-23 |
| 102 | Extended Framework D | Educator | integrated-primary-28 | 3 | 3990187 | distributed-degree-24 |
| 103 | Pilot Protocol | Researcher | seasonal-primary-29 | 4 | flexible-thinking | baseline-degree-25 |

This view joins `professional_roles` with `academic_programs` on `professional_roles.academic_program_id = academic_programs.academic_program_id`. It answers the inverse of `v_academic_program_professional_role`: "Which academic program is associated with each professional role?" A row might show `role_name` `Seasonal Programme` paired with `program_code` `191` and `status` `active`. This view is useful when starting from a role and tracing to its programmatic home.

**View `v_professional_role_competency_detail`**

```sql
CREATE VIEW v_professional_role_competency_detail AS
SELECT a.id, a.role_name, a.role_category, b.id AS competency_id, b.competency_i_d AS competency_competency_i_d, b.competency_title AS competency_competency_title
FROM professional_roles a
  JOIN roles_competencies j ON j.professional_role_id = a.id
  JOIN competencies b ON b.id = j.competency_id;
```

| id | role_name | role_category | competency_id | competency_competency_i_d | competency_competency_title |
|---|---|---|---|---|---|
| 100 | Seasonal Programme | Researcher | 1 | COM-2721 | Adaptive Framework |
| 100 | Seasonal Programme | Researcher | 2 | COM-2725 | Primary Protocol |
| 101 | Integrated Standard | Collaborator | 2 | COM-2725 | Primary Protocol |
| 101 | Integrated Standard | Collaborator | 3 | COM-2729 | Composite Programme D |
| 102 | Extended Framework D | Educator | 3 | COM-2729 | Composite Programme D |
| 102 | Extended Framework D | Educator | 4 | COM-2733 | Compact Standard |
| 103 | Pilot Protocol | Researcher | 4 | COM-2733 | Compact Standard |
| 103 | Pilot Protocol | Researcher | 1 | COM-2721 | Adaptive Framework |

This view joins `professional_roles` with `competencies` on `professional_roles.id = competencies.professional_role_id`. It answers: "What competencies are expected of each professional role?" A row might display `role_name` `Seasonal Programme` alongside `competency_title` `Adaptive Framework` and `proficiency_level` `novice`. This projection is essential for role-based competency profiling.

**View `v_professional_role_research_activity`**

```sql
CREATE VIEW v_professional_role_research_activity AS
SELECT a.id, a.role_name, a.role_category, a.primary_responsibility, b.id AS activity_id, b.activity_i_d AS activity_activity_i_d, b.activity_type AS activity_activity_type
FROM professional_roles a JOIN research_activities b ON a.research_activity_id = b.id;
```

| id | role_name | role_category | primary_responsibility | activity_id | activity_activity_i_d | activity_activity_type |
|---|---|---|---|---|---|---|
| 100 | Seasonal Programme | Researcher | pilot-primary-26 | 1 | ACT-2460 | foundational |
| 101 | Integrated Standard | Collaborator | extended-primary-27 | 2 | ACT-2464 | methodological |
| 102 | Extended Framework D | Educator | integrated-primary-28 | 3 | ACT-2468 | application |
| 103 | Pilot Protocol | Researcher | seasonal-primary-29 | 4 | ACT-2472 | dissemination |

This view joins `professional_roles` with `research_activities` on `professional_roles.id = research_activities.professional_role_id`. It answers: "Which research activities are associated with each professional role?" A row might show `role_name` `Seasonal Programme` paired with `activity_i_d` `ACT-2460` and `status` `planned`. This view clarifies the research responsibilities of each role.

**View `v_research_activity_statistical_method`**

```sql
CREATE VIEW v_research_activity_statistical_method AS
SELECT a.id, a.activity_i_d, a.activity_type, a.study_design, b.statistical_method_id AS method_statistical_method_id, b.method_i_d AS method_method_i_d, b.method_name AS method_method_name
FROM research_activities a JOIN statistical_methods b ON a.statistical_method_id = b.statistical_method_id;
```

| id | activity_i_d | activity_type | study_design | method_statistical_method_id | method_method_i_d | method_method_name |
|---|---|---|---|---|---|---|
| 1 | ACT-2460 | foundational | adaptive-study-11 | 100 | MET-2516 | Pilot Assessment |
| 2 | ACT-2464 | methodological | distributed-study-12 | 101 | MET-2521 | Baseline Survey |
| 3 | ACT-2468 | application | baseline-study-13 | 102 | MET-2526 | Distributed Corridor A |
| 4 | ACT-2472 | dissemination | pilot-study-14 | 103 | MET-2531 | Adaptive Series |

This view joins `research_activities` with `statistical_methods` on `research_activities.statistical_method_id = statistical_methods.statistical_method_id`. It answers: "What statistical method is used in each research activity?" A row might display `activity_i_d` `ACT-2460` alongside `method_name` `Pilot Assessment` and `is_standardized` `false`. This projection is critical for research methodology auditing.

**View `v_research_activity_competency`**

```sql
CREATE VIEW v_research_activity_competency AS
SELECT a.id, a.activity_i_d, a.activity_type, a.study_design, b.id AS competency_id, b.competency_i_d AS competency_competency_i_d, b.competency_title AS competency_competency_title
FROM research_activities a JOIN competencies b ON a.competency_id = b.id;
```

| id | activity_i_d | activity_type | study_design | competency_id | competency_competency_i_d | competency_competency_title |
|---|---|---|---|---|---|---|
| 1 | ACT-2460 | foundational | adaptive-study-11 | 1 | COM-2721 | Adaptive Framework |
| 2 | ACT-2464 | methodological | distributed-study-12 | 2 | COM-2725 | Primary Protocol |
| 3 | ACT-2468 | application | baseline-study-13 | 3 | COM-2729 | Composite Programme D |
| 4 | ACT-2472 | dissemination | pilot-study-14 | 4 | COM-2733 | Compact Standard |

This view joins `research_activities` with `competencies` on `research_activities.competency_id = competencies.id`. It answers: "Which competency is validated by each research activity?" A row might show `activity_i_d` `ACT-2460` paired with `competency_title` `Adaptive Framework` and `assessment_type` `written`. This view reveals the competency validation chain.

**View `v_research_activity_professional_role`**

```sql
CREATE VIEW v_research_activity_professional_role AS
SELECT a.id, a.activity_i_d, a.activity_type, a.study_design, b.id AS role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM research_activities a JOIN professional_roles b ON a.professional_role_id = b.id;
```

| id | activity_i_d | activity_type | study_design | role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 1 | ACT-2460 | foundational | adaptive-study-11 | 100 | Seasonal Programme | Researcher |
| 2 | ACT-2464 | methodological | distributed-study-12 | 101 | Integrated Standard | Collaborator |
| 3 | ACT-2468 | application | baseline-study-13 | 102 | Extended Framework D | Educator |
| 4 | ACT-2472 | dissemination | pilot-study-14 | 103 | Pilot Protocol | Researcher |

This view joins `research_activities` with `professional_roles` on `research_activities.professional_role_id = professional_roles.id`. It answers: "Which professional role is associated with each research activity?" A row might display `activity_i_d` `ACT-2460` alongside `role_name` `Seasonal Programme` and `role_category` `Researcher`. This projection clarifies role accountability for research activities.

**View `v_statistical_method_concentration`**

```sql
CREATE VIEW v_statistical_method_concentration AS
SELECT a.statistical_method_id, a.method_i_d, a.method_name, a.method_category, b.id AS concentration_id, b.concentration_name AS concentration_concentration_name, b.focus_area AS concentration_focus_area
FROM statistical_methods a JOIN concentrations b ON a.concentration_id = b.id;
```

| statistical_method_id | method_i_d | method_name | method_category | concentration_id | concentration_concentration_name | concentration_focus_area |
|---|---|---|---|---|---|---|
| 100 | MET-2516 | Pilot Assessment | study_design | 1000 | Adaptive Corridor | pilot-focus-20 |
| 101 | MET-2521 | Baseline Survey | data_analysis | 1001 | Primary Series | extended-focus-21 |
| 102 | MET-2526 | Distributed Corridor A | inference | 1002 | Composite Assessment D | integrated-focus-22 |
| 103 | MET-2531 | Adaptive Series | quantification | 1003 | Compact Survey | seasonal-focus-23 |

This view joins `statistical_methods` with `concentrations` on `statistical_methods.concentration_id = concentrations.id`. It answers the inverse of `v_concentration_statistical_method`: "Which concentration is associated with each statistical method?" A row might show `method_name` `Pilot Assessment` paired with `concentration_name` `Adaptive Corridor` and `is_core` `false`. This view is useful when starting from a method and tracing to its concentration.

**View `v_statistical_method_research_activity`**

```sql
CREATE VIEW v_statistical_method_research_activity AS
SELECT a.statistical_method_id, a.method_i_d, a.method_name, a.method_category, b.id AS activity_id, b.activity_i_d AS activity_activity_i_d, b.activity_type AS activity_activity_type
FROM statistical_methods a JOIN research_activities b ON a.research_activity_id = b.id;
```

| statistical_method_id | method_i_d | method_name | method_category | activity_id | activity_activity_i_d | activity_activity_type |
|---|---|---|---|---|---|---|
| 100 | MET-2516 | Pilot Assessment | study_design | 1 | ACT-2460 | foundational |
| 101 | MET-2521 | Baseline Survey | data_analysis | 2 | ACT-2464 | methodological |
| 102 | MET-2526 | Distributed Corridor A | inference | 3 | ACT-2468 | application |
| 103 | MET-2531 | Adaptive Series | quantification | 4 | ACT-2472 | dissemination |

This view joins `statistical_methods` with `research_activities` on `statistical_methods.statistical_method_id = research_activities.statistical_method_id`. It answers: "Which research activities use each statistical method?" A row might display `method_name` `Pilot Assessment` alongside `activity_i_d` `ACT-2460` and `study_design` `adaptive-study-11`. This projection is essential for method utilization analysis.

**View `v_statistical_method_professional_role`**

```sql
CREATE VIEW v_statistical_method_professional_role AS
SELECT a.statistical_method_id, a.method_i_d, a.method_name, a.method_category, b.id AS role_id, b.role_name AS role_role_name, b.role_category AS role_role_category
FROM statistical_methods a JOIN professional_roles b ON a.professional_role_id = b.id;
```

| statistical_method_id | method_i_d | method_name | method_category | role_id | role_role_name | role_role_category |
|---|---|---|---|---|---|---|
| 100 | MET-2516 | Pilot Assessment | study_design | 100 | Seasonal Programme | Researcher |
| 101 | MET-2521 | Baseline Survey | data_analysis | 101 | Integrated Standard | Collaborator |
| 102 | MET-2526 | Distributed Corridor A | inference | 102 | Extended Framework D | Educator |
| 103 | MET-2531 | Adaptive Series | quantification | 103 | Pilot Protocol | Researcher |

This view joins `statistical_methods` with `professional_roles` on `statistical_methods.professional_role_id = professional_roles.id`. It answers: "Which professional role is associated with each statistical method?" A row might show `method_name` `Pilot Assessment` paired with `role_name` `Seasonal Programme` and `primary_responsibility` `pilot-primary-26`. This view reveals the role-method alignment.

## Synthesis

The schema models a tightly coupled academic ecosystem where programs, concentrations, competencies, professional roles, research activities, and statistical methods are interdependent. The eight base tables decompose this ecosystem into atomic entities, with foreign keys encoding cardinality-bounded relationships and two junction tables (`programs_competencies`, `roles_competencies`) resolving many-to-many associations. The twenty-three views reassemble these normalized facts into domain-readable projections, each answering a specific analytical question by joining two or more base tables. The result is a schema that is both rigorously normalized for data integrity and richly projected for analytical accessibility. Every row in every view can be traced back through its join keys to the original entity tables, ensuring that the materialized facts are always consistent with the underlying normalized model.