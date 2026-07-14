## The Information Logistics Schema

The domain under examination concerns the governance of information logistics strategies within multi-departmental organizations, where strategic planning, empirical validation, and analytical infrastructure intersect to produce measurable organizational outcomes. At its core, the model captures how a strategy—identified by a code such as `STR-2614` or `STR-2617`—is formulated on a specific date, assigned to an organizational unit, linked to an empirical study, and ultimately evaluated against performance metrics. The relational schema materializes this domain through six base tables, two junction tables that resolve many-to-many relationships, and fourteen derived views that reconstruct domain facts from the normalized structure. Every table and view name appears in backtick throughout this chapter.

**Table `information_logistics_strategies`**

| id | strategy_identifier | formulation_date | implementation_status | target_organizational_scope | alignment_with_i_t_strategy | alignment_with_business_strategy | empirical_study_id | organizational_unit_id |
|---|---|---|---|---|---|---|---|---|
| 1 | STR-2614 | 2025-08-01T19:57:00 | planned | regional-target-66 | false | true | 1 | 1 |
| 2 | STR-2615 | 2022-01-12T02:14:00 | implementing | legacy-target-67 | true | false | 2 | 2 |
| 3 | STR-2616 | 2023-06-23T09:31:00 | implemented | compact-target-68 | false | true | 3 | 3 |
| 4 | STR-2617 | 2024-11-07T16:48:00 | abandoned | composite-target-69 | true | false | 4 | 4 |

The `information_logistics_strategies` table is the central entity of the model. Each row represents a discrete strategy with a surrogate primary key `id`, a business identifier `strategy_identifier` (for example, `STR-2614` through `STR-2617`), and a `formulation_date` that records when the strategy was drafted—`2025-08-01T19:57:00` for the first row, `2022-01-12T02:14:00` for the second, and so on. The `implementation_status` column constrains the lifecycle stage to values such as `planned`, `implementing`, `implemented`, or `abandoned`, while `target_organizational_scope` describes the geographic or functional reach with codes like `regional-target-66` and `legacy-target-67`. Two boolean columns, `alignment_with_i_t_strategy` and `alignment_with_business_strategy`, encode whether the strategy aligns with IT and business strategy respectively; in the sample data, row 1 has IT alignment disabled but business alignment enabled, whereas row 2 shows the opposite pattern. Two foreign keys anchor the strategy to other entities: `empirical_study_id` references `empirical_studies.id`, and `organizational_unit_id` references `organizational_units.organizational_unit_id`. These foreign keys establish that each strategy is associated with exactly one empirical study and one organizational unit, enforcing a one-to-one cardinality from the strategy's perspective.

**Table `success_factors`**

| success_factor_id | factor_name | factor_category | validation_status | influence_strength | measurement_method | information_logistics_strategy_id | empirical_study_id |
|---|---|---|---|---|---|---|---|
| 1 | Legacy Cluster D | comprehensiveness | validated | 20.70 | baseline-measurem-25 | 1 | 1 |
| 2 | Regional Review | flexibility | not validated | 25.40 | pilot-measurem-26 | 2 | 2 |
| 3 | Seasonal Initiative | support | pending | 30.10 | extended-measurem-27 | 3 | 3 |
| 4 | Integrated Model A | communication | validated | 34.80 | integrated-measurem-28 | 4 | 4 |

The `success_factors` table captures the conditions that contribute to a strategy's effectiveness. Its primary key is `success_factor_id`, and each factor carries a descriptive `factor_name` such as `Legacy Cluster D` or `Integrated Model A`, a `factor_category` drawn from `comprehensiveness`, `flexibility`, `support`, and `communication`, and a `validation_status` of `validated`, `not validated`, or `pending`. The numeric column `influence_strength` quantifies the factor's impact (values range from 20.70 to 34.80 in the sample), while `measurement_method` records the evaluation approach, with entries like `baseline-measurem-25` and `integrated-measurem-28`. Two foreign keys, `information_logistics_strategy_id` and `empirical_study_id`, link each success factor to a strategy and a study respectively. The presence of both foreign keys on the same table indicates that a success factor is evaluated within the context of a particular strategy and a particular empirical study, forming a composite association that the junction tables later generalize.

**Table `empirical_studies`**

| id | study_identifier | conducted_date | methodology | sample_size | publication_status | journal_name | information_logistics_strategy_id | organizational_performance_id |
|---|---|---|---|---|---|---|---|---|
| 1 | STU-2431 | 2023-06-03T17:51:00 | structural equation modeling | 31 | published | Extended Standard | 1 | 1 |
| 2 | STU-2434 | 2024-11-14T00:08:00 | causal analysis | 38 | in press | Pilot Framework A | 2 | 2 |
| 3 | STU-2437 | 2025-04-25T07:25:00 | survey | 45 | submitted | Baseline Protocol | 3 | 3 |
| 4 | STU-2440 | 2022-09-09T14:42:00 | structural equation modeling | 52 | published | Distributed Programme | 4 | 4 |

Empirical studies serve as the evidence base for strategy evaluation. The `empirical_studies` table stores each study under a surrogate `id`, a `study_identifier` such as `STU-2431` or `STU-2440`, and a `conducted_date` ranging from `2022-09-09T14:42:00` to `2025-04-25T07:25:00`. The `methodology` column records the research approach—`structural equation modeling`, `causal analysis`, or `survey`—while `sample_size` provides the study's scope (values of 31, 38, 45, and 52). The `publication_status` column constrains the study to `published`, `in press`, or `submitted`, and `journal_name` names the venue, such as `Extended Standard` or `Pilot Framework A`. Two foreign keys, `information_logistics_strategy_id` and `organizational_performance_id`, tie the study to a strategy and a performance metric respectively, ensuring that every empirical study is grounded in a specific strategic context and a measurable outcome.

**Table `organizational_performances`**

| id | metric_name | measurement_date | value | unit_of_measure | performance_category | information_logistics_strategy_id | empirical_study_id |
|---|---|---|---|---|---|---|---|
| 1 | Primary Programme A | 2024-07-01T18:54:00 | 19.95 | composite-unit-69 | effectiveness | 1 | 1 |
| 2 | Composite Standard | 2025-12-12T01:11:00 | 21.90 | primary-unit-70 | efficiency | 2 | 2 |
| 3 | Compact Framework | 2022-05-23T08:28:00 | 23.85 | adaptive-unit-71 | synergy exploitation | 3 | 3 |
| 4 | Legacy Protocol D | 2023-10-07T15:45:00 | 25.80 | distributed-unit-72 | effectiveness | 4 | 4 |

The `organizational_performances` table quantifies the results of strategy implementation. Each row carries an `id`, a `metric_name` like `Primary Programme A` or `Legacy Protocol D`, and a `measurement_date`. The `value` column holds the numeric result (19.95, 21.90, 23.85, 25.80), and `unit_of_measure` describes the scale, with codes such as `composite-unit-69` and `distributed-unit-72`. The `performance_category` column classifies the metric into `effectiveness`, `efficiency`, or `synergy exploitation`. Two foreign keys, `information_logistics_strategy_id` and `empirical_study_id`, link each performance record to the strategy it measures and the study that validated it, creating a triangulated relationship among strategy, evidence, and outcome.

**Table `organizational_units`**

| organizational_unit_id | unit_identifier | unit_name | department_type | implementation_role | information_logistics_strategy_id | analytical_information_system_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | UNI-2580 | Compact Series | finance | planner | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | UNI-2584 | Legacy Assessment | operations | implementer | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | UNI-2588 | Regional Survey A | IT | user | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | UNI-2592 | Seasonal Corridor | HR | governor | 4 | 4 | 2025-04-16 09:14:00 |

Organizational units represent the departments or teams responsible for executing strategies. The `organizational_units` table uses `organizational_unit_id` as its primary key, with `unit_identifier` values like `UNI-2580` and `UNI-2592`, and `unit_name` entries such as `Compact Series` and `Seasonal Corridor`. The `department_type` column distinguishes `finance`, `operations`, `IT`, and `HR`, while `implementation_role` assigns each unit a function—`planner`, `implementer`, `user`, or `governor`. The `created_at` timestamp records when the unit was established. Two foreign keys, `information_logistics_strategy_id` and `analytical_information_system_id`, associate each unit with a strategy and an analytical system, respectively.

**Table `analytical_information_systems`**

| analytical_information_system_id | system_identifier | system_name | system_type | deployment_date | coverage_scope | organizational_unit_id | extends_analytical_information_system_id |
|---|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | business intelligence | 2023-02-14 | local | 1 | 1 |
| 2 | SYS-2051 | Regional Standard | data warehousing | 2024-07-25 | enterprise-wide | 2 | 2 |
| 3 | SYS-2052 | Seasonal Framework | information logistics | 2025-12-09 | cross-boundary | 3 | 3 |
| 4 | SYS-2053 | Integrated Protocol A | decision support | 2022-05-20 | local | 4 | 4 |

The `analytical_information_systems` table catalogs the software infrastructure supporting organizational units. Its primary key is `analytical_information_system_id`, and each system has a `system_identifier` (e.g., `SYS-2050` through `SYS-2053`), a `system_name` such as `Legacy Programme D` or `Integrated Protocol A`, and a `system_type` drawn from `business intelligence`, `data warehousing`, `information logistics`, and `decision support`. The `deployment_date` records when the system went live, `coverage_scope` describes its reach (`local`, `enterprise-wide`, `cross-boundary`), and `organizational_unit_id` links the system to the unit it serves. The column `extends_analytical_information_system_id` is a self-referencing foreign key that allows one system to extend another, enabling a hierarchical or inheritance relationship among analytical systems.

The many-to-many relationships between strategies and success factors, and between empirical studies and success factors, are resolved through two junction tables. The `strategies_factors` table links `information_logistics_strategies` to `success_factors`, allowing a single strategy to be associated with multiple success factors and a single factor to apply across multiple strategies. Similarly, the `studies_factors` table links `empirical_studies` to `success_factors`, enabling each empirical study to validate multiple factors and each factor to be assessed across multiple studies. These junction tables eliminate the redundancy that would arise from placing both foreign keys directly on the `success_factors` table and instead model the relationships as first-class associations.

**Table `strategies_factors`**

| information_logistics_strategy_id | success_factor_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `studies_factors`**

| empirical_study_id | success_factor_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The fourteen views materialize the normalized schema into denormalized result sets that answer specific domain questions. Each view is a `SELECT` with joins that reconstruct a coherent fact from the underlying tables.

**View `v_information_logistics_strategy_success_factor_detail`**

```sql
CREATE VIEW v_information_logistics_strategy_success_factor_detail AS
SELECT a.id, a.strategy_identifier, a.formulation_date, b.success_factor_id AS factor_success_factor_id, b.factor_name AS factor_factor_name, b.factor_category AS factor_factor_category
FROM information_logistics_strategies a
  JOIN strategies_factors j ON j.information_logistics_strategy_id = a.id
  JOIN success_factors b ON b.success_factor_id = j.success_factor_id;
```

| id | strategy_identifier | formulation_date | factor_success_factor_id | factor_factor_name | factor_factor_category |
|---|---|---|---|---|---|
| 1 | STR-2614 | 2025-08-01T19:57:00 | 1 | Legacy Cluster D | comprehensiveness |
| 1 | STR-2614 | 2025-08-01T19:57:00 | 2 | Regional Review | flexibility |
| 2 | STR-2615 | 2022-01-12T02:14:00 | 2 | Regional Review | flexibility |
| 2 | STR-2615 | 2022-01-12T02:14:00 | 3 | Seasonal Initiative | support |
| 3 | STR-2616 | 2023-06-23T09:31:00 | 3 | Seasonal Initiative | support |
| 3 | STR-2616 | 2023-06-23T09:31:00 | 4 | Integrated Model A | communication |
| 4 | STR-2617 | 2024-11-07T16:48:00 | 4 | Integrated Model A | communication |
| 4 | STR-2617 | 2024-11-07T16:48:00 | 1 | Legacy Cluster D | comprehensiveness |

The view `v_information_logistics_strategy_success_factor_detail` joins `information_logistics_strategies` to `success_factors` through the `strategies_factors` junction table. It answers the question: "Which success factors are associated with each information logistics strategy?" Reading row 1 of the result, one would see strategy `STR-2614` paired with the success factor `Legacy Cluster D` in the `comprehensiveness` category, with an influence strength of 20.70. This view enables analysts to assess the factor composition of each strategy.

**View `v_information_logistics_strategy_empirical_study`**

```sql
CREATE VIEW v_information_logistics_strategy_empirical_study AS
SELECT a.id, a.strategy_identifier, a.formulation_date, a.implementation_status, b.id AS study_id, b.study_identifier AS study_study_identifier, b.conducted_date AS study_conducted_date
FROM information_logistics_strategies a JOIN empirical_studies b ON a.empirical_study_id = b.id;
```

| id | strategy_identifier | formulation_date | implementation_status | study_id | study_study_identifier | study_conducted_date |
|---|---|---|---|---|---|---|
| 1 | STR-2614 | 2025-08-01T19:57:00 | planned | 1 | STU-2431 | 2023-06-03T17:51:00 |
| 2 | STR-2615 | 2022-01-12T02:14:00 | implementing | 2 | STU-2434 | 2024-11-14T00:08:00 |
| 3 | STR-2616 | 2023-06-23T09:31:00 | implemented | 3 | STU-2437 | 2025-04-25T07:25:00 |
| 4 | STR-2617 | 2024-11-07T16:48:00 | abandoned | 4 | STU-2440 | 2022-09-09T14:42:00 |

The view `v_information_logistics_strategy_empirical_study` joins `information_logistics_strategies` to `empirical_studies` via the `information_logistics_strategy_id` foreign key. It answers: "Which empirical study supports each strategy?" Row 1 shows strategy `STR-2614` linked to study `STU-2431`, conducted on `2023-06-03T17:51:00` using structural equation modeling with a sample size of 31. This view provides a direct mapping from strategy to its evidentiary basis.

**View `v_information_logistics_strategy_organizational_unit`**

```sql
CREATE VIEW v_information_logistics_strategy_organizational_unit AS
SELECT a.id, a.strategy_identifier, a.formulation_date, a.implementation_status, b.organizational_unit_id AS unit_organizational_unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM information_logistics_strategies a JOIN organizational_units b ON a.organizational_unit_id = b.organizational_unit_id;
```

| id | strategy_identifier | formulation_date | implementation_status | unit_organizational_unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | STR-2614 | 2025-08-01T19:57:00 | planned | 1 | UNI-2580 | Compact Series |
| 2 | STR-2615 | 2022-01-12T02:14:00 | implementing | 2 | UNI-2584 | Legacy Assessment |
| 3 | STR-2616 | 2023-06-23T09:31:00 | implemented | 3 | UNI-2588 | Regional Survey A |
| 4 | STR-2617 | 2024-11-07T16:48:00 | abandoned | 4 | UNI-2592 | Seasonal Corridor |

The view `v_information_logistics_strategy_organizational_unit` joins `information_logistics_strategies` to `organizational_units` on `organizational_unit_id`. It answers: "Which organizational unit is responsible for each strategy?" Row 1 reveals that strategy `STR-2614` is assigned to unit `UNI-2580` (Compact Series) in the finance department, with the unit acting as a `planner`. This view clarifies organizational accountability.

**View `v_success_factor_information_logistics_strategy`**

```sql
CREATE VIEW v_success_factor_information_logistics_strategy AS
SELECT a.success_factor_id, a.factor_name, a.factor_category, a.validation_status, b.id AS strategy_id, b.strategy_identifier AS strategy_strategy_identifier, b.formulation_date AS strategy_formulation_date
FROM success_factors a JOIN information_logistics_strategies b ON a.information_logistics_strategy_id = b.id;
```

| success_factor_id | factor_name | factor_category | validation_status | strategy_id | strategy_strategy_identifier | strategy_formulation_date |
|---|---|---|---|---|---|---|
| 1 | Legacy Cluster D | comprehensiveness | validated | 1 | STR-2614 | 2025-08-01T19:57:00 |
| 2 | Regional Review | flexibility | not validated | 2 | STR-2615 | 2022-01-12T02:14:00 |
| 3 | Seasonal Initiative | support | pending | 3 | STR-2616 | 2023-06-23T09:31:00 |
| 4 | Integrated Model A | communication | validated | 4 | STR-2617 | 2024-11-07T16:48:00 |

The view `v_success_factor_information_logistics_strategy` joins `success_factors` to `information_logistics_strategies` through the `strategies_factors` junction table, effectively reversing the perspective of the first view. It answers: "For each success factor, which strategy does it belong to?" Row 1 shows factor `Legacy Cluster D` associated with strategy `STR-2614`. This view is useful when starting from a factor and tracing back to its strategic context.

**View `v_success_factor_empirical_study`**

```sql
CREATE VIEW v_success_factor_empirical_study AS
SELECT a.success_factor_id, a.factor_name, a.factor_category, a.validation_status, b.id AS study_id, b.study_identifier AS study_study_identifier, b.conducted_date AS study_conducted_date
FROM success_factors a JOIN empirical_studies b ON a.empirical_study_id = b.id;
```

| success_factor_id | factor_name | factor_category | validation_status | study_id | study_study_identifier | study_conducted_date |
|---|---|---|---|---|---|---|
| 1 | Legacy Cluster D | comprehensiveness | validated | 1 | STU-2431 | 2023-06-03T17:51:00 |
| 2 | Regional Review | flexibility | not validated | 2 | STU-2434 | 2024-11-14T00:08:00 |
| 3 | Seasonal Initiative | support | pending | 3 | STU-2437 | 2025-04-25T07:25:00 |
| 4 | Integrated Model A | communication | validated | 4 | STU-2440 | 2022-09-09T14:42:00 |

The view `v_success_factor_empirical_study` joins `success_factors` to `empirical_studies` via the `studies_factors` junction table. It answers: "Which empirical study validated each success factor?" Row 1 links factor `Legacy Cluster D` to study `STU-2431`. This view supports traceability from factor to evidence.

**View `v_empirical_study_information_logistics_strategy`**

```sql
CREATE VIEW v_empirical_study_information_logistics_strategy AS
SELECT a.id, a.study_identifier, a.conducted_date, a.methodology, b.id AS strategy_id, b.strategy_identifier AS strategy_strategy_identifier, b.formulation_date AS strategy_formulation_date
FROM empirical_studies a JOIN information_logistics_strategies b ON a.information_logistics_strategy_id = b.id;
```

| id | study_identifier | conducted_date | methodology | strategy_id | strategy_strategy_identifier | strategy_formulation_date |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | 2023-06-03T17:51:00 | structural equation modeling | 1 | STR-2614 | 2025-08-01T19:57:00 |
| 2 | STU-2434 | 2024-11-14T00:08:00 | causal analysis | 2 | STR-2615 | 2022-01-12T02:14:00 |
| 3 | STU-2437 | 2025-04-25T07:25:00 | survey | 3 | STR-2616 | 2023-06-23T09:31:00 |
| 4 | STU-2440 | 2022-09-09T14:42:00 | structural equation modeling | 4 | STR-2617 | 2024-11-07T16:48:00 |

The view `v_empirical_study_information_logistics_strategy` joins `empirical_studies` to `information_logistics_strategies` on `information_logistics_strategy_id`. It answers: "Which strategy does each empirical study evaluate?" Row 1 shows study `STU-2431` evaluating strategy `STR-2614`. This view provides the reverse mapping from evidence to strategy.

**View `v_empirical_study_success_factor_detail`**

```sql
CREATE VIEW v_empirical_study_success_factor_detail AS
SELECT a.id, a.study_identifier, a.conducted_date, b.success_factor_id AS factor_success_factor_id, b.factor_name AS factor_factor_name, b.factor_category AS factor_factor_category
FROM empirical_studies a
  JOIN studies_factors j ON j.empirical_study_id = a.id
  JOIN success_factors b ON b.success_factor_id = j.success_factor_id;
```

| id | study_identifier | conducted_date | factor_success_factor_id | factor_factor_name | factor_factor_category |
|---|---|---|---|---|---|
| 1 | STU-2431 | 2023-06-03T17:51:00 | 1 | Legacy Cluster D | comprehensiveness |
| 1 | STU-2431 | 2023-06-03T17:51:00 | 2 | Regional Review | flexibility |
| 2 | STU-2434 | 2024-11-14T00:08:00 | 2 | Regional Review | flexibility |
| 2 | STU-2434 | 2024-11-14T00:08:00 | 3 | Seasonal Initiative | support |
| 3 | STU-2437 | 2025-04-25T07:25:00 | 3 | Seasonal Initiative | support |
| 3 | STU-2437 | 2025-04-25T07:25:00 | 4 | Integrated Model A | communication |
| 4 | STU-2440 | 2022-09-09T14:42:00 | 4 | Integrated Model A | communication |
| 4 | STU-2440 | 2022-09-09T14:42:00 | 1 | Legacy Cluster D | comprehensiveness |

The view `v_empirical_study_success_factor_detail` joins `empirical_studies` to `success_factors` through the `studies_factors` junction table. It answers: "Which success factors were assessed in each empirical study?" Row 1 reveals that study `STU-2431` assessed factor `Legacy Cluster D`. This view enables analysts to review the factor coverage of each study.

**View `v_empirical_study_organizational_performance`**

```sql
CREATE VIEW v_empirical_study_organizational_performance AS
SELECT a.id, a.study_identifier, a.conducted_date, a.methodology, b.id AS performance_id, b.metric_name AS performance_metric_name, b.measurement_date AS performance_measurement_date
FROM empirical_studies a JOIN organizational_performances b ON a.organizational_performance_id = b.id;
```

| id | study_identifier | conducted_date | methodology | performance_id | performance_metric_name | performance_measurement_date |
|---|---|---|---|---|---|---|
| 1 | STU-2431 | 2023-06-03T17:51:00 | structural equation modeling | 1 | Primary Programme A | 2024-07-01T18:54:00 |
| 2 | STU-2434 | 2024-11-14T00:08:00 | causal analysis | 2 | Composite Standard | 2025-12-12T01:11:00 |
| 3 | STU-2437 | 2025-04-25T07:25:00 | survey | 3 | Compact Framework | 2022-05-23T08:28:00 |
| 4 | STU-2440 | 2022-09-09T14:42:00 | structural equation modeling | 4 | Legacy Protocol D | 2023-10-07T15:45:00 |

The view `v_empirical_study_organizational_performance` joins `empirical_studies` to `organizational_performances` on `empirical_study_id`. It answers: "What performance metrics were measured in each empirical study?" Row 1 shows study `STU-2431` measuring metric `Primary Programme A` with a value of 19.95 in the `effectiveness` category. This view connects evidence to outcomes.

**View `v_organizational_performance_information_logistics_strategy`**

```sql
CREATE VIEW v_organizational_performance_information_logistics_strategy AS
SELECT a.id, a.metric_name, a.measurement_date, a.value, b.id AS strategy_id, b.strategy_identifier AS strategy_strategy_identifier, b.formulation_date AS strategy_formulation_date
FROM organizational_performances a JOIN information_logistics_strategies b ON a.information_logistics_strategy_id = b.id;
```

| id | metric_name | measurement_date | value | strategy_id | strategy_strategy_identifier | strategy_formulation_date |
|---|---|---|---|---|---|---|
| 1 | Primary Programme A | 2024-07-01T18:54:00 | 19.95 | 1 | STR-2614 | 2025-08-01T19:57:00 |
| 2 | Composite Standard | 2025-12-12T01:11:00 | 21.90 | 2 | STR-2615 | 2022-01-12T02:14:00 |
| 3 | Compact Framework | 2022-05-23T08:28:00 | 23.85 | 3 | STR-2616 | 2023-06-23T09:31:00 |
| 4 | Legacy Protocol D | 2023-10-07T15:45:00 | 25.80 | 4 | STR-2617 | 2024-11-07T16:48:00 |

The view `v_organizational_performance_information_logistics_strategy` joins `organizational_performances` to `information_logistics_strategies` on `information_logistics_strategy_id`. It answers: "Which strategy does each performance metric evaluate?" Row 1 reveals that metric `Primary Programme A` evaluates strategy `STR-2614`. This view traces performance back to its strategic driver.

**View `v_organizational_performance_empirical_study`**

```sql
CREATE VIEW v_organizational_performance_empirical_study AS
SELECT a.id, a.metric_name, a.measurement_date, a.value, b.id AS study_id, b.study_identifier AS study_study_identifier, b.conducted_date AS study_conducted_date
FROM organizational_performances a JOIN empirical_studies b ON a.empirical_study_id = b.id;
```

| id | metric_name | measurement_date | value | study_id | study_study_identifier | study_conducted_date |
|---|---|---|---|---|---|---|
| 1 | Primary Programme A | 2024-07-01T18:54:00 | 19.95 | 1 | STU-2431 | 2023-06-03T17:51:00 |
| 2 | Composite Standard | 2025-12-12T01:11:00 | 21.90 | 2 | STU-2434 | 2024-11-14T00:08:00 |
| 3 | Compact Framework | 2022-05-23T08:28:00 | 23.85 | 3 | STU-2437 | 2025-04-25T07:25:00 |
| 4 | Legacy Protocol D | 2023-10-07T15:45:00 | 25.80 | 4 | STU-2440 | 2022-09-09T14:42:00 |

The view `v_organizational_performance_empirical_study` joins `organizational_performances` to `empirical_studies` on `empirical_study_id`. It answers: "Which empirical study measured each performance metric?" Row 1 shows metric `Primary Programme A` was measured in study `STU-2431`. This view completes the evidence-to-outcome linkage.

**View `v_organizational_unit_information_logistics_strategy`**

```sql
CREATE VIEW v_organizational_unit_information_logistics_strategy AS
SELECT a.organizational_unit_id, a.unit_identifier, a.unit_name, a.department_type, b.id AS strategy_id, b.strategy_identifier AS strategy_strategy_identifier, b.formulation_date AS strategy_formulation_date
FROM organizational_units a JOIN information_logistics_strategies b ON a.information_logistics_strategy_id = b.id;
```

| organizational_unit_id | unit_identifier | unit_name | department_type | strategy_id | strategy_strategy_identifier | strategy_formulation_date |
|---|---|---|---|---|---|---|
| 1 | UNI-2580 | Compact Series | finance | 1 | STR-2614 | 2025-08-01T19:57:00 |
| 2 | UNI-2584 | Legacy Assessment | operations | 2 | STR-2615 | 2022-01-12T02:14:00 |
| 3 | UNI-2588 | Regional Survey A | IT | 3 | STR-2616 | 2023-06-23T09:31:00 |
| 4 | UNI-2592 | Seasonal Corridor | HR | 4 | STR-2617 | 2024-11-07T16:48:00 |

The view `v_organizational_unit_information_logistics_strategy` joins `organizational_units` to `information_logistics_strategies` on `information_logistics_strategy_id`. It answers: "Which strategy is each organizational unit executing?" Row 1 shows unit `UNI-2580` (Compact Series) executing strategy `STR-2614`. This view provides a unit-centric perspective on strategy execution.

**View `v_organizational_unit_analytical_information_system`**

```sql
CREATE VIEW v_organizational_unit_analytical_information_system AS
SELECT a.organizational_unit_id, a.unit_identifier, a.unit_name, a.department_type, b.analytical_information_system_id AS system_analytical_information_system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM organizational_units a JOIN analytical_information_systems b ON a.analytical_information_system_id = b.analytical_information_system_id;
```

| organizational_unit_id | unit_identifier | unit_name | department_type | system_analytical_information_system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|---|
| 1 | UNI-2580 | Compact Series | finance | 1 | SYS-2050 | Legacy Programme D |
| 2 | UNI-2584 | Legacy Assessment | operations | 2 | SYS-2051 | Regional Standard |
| 3 | UNI-2588 | Regional Survey A | IT | 3 | SYS-2052 | Seasonal Framework |
| 4 | UNI-2592 | Seasonal Corridor | HR | 4 | SYS-2053 | Integrated Protocol A |

The view `v_organizational_unit_analytical_information_system` joins `organizational_units` to `analytical_information_systems` on `analytical_information_system_id`. It answers: "Which analytical system supports each organizational unit?" Row 1 reveals that unit `UNI-2580` is supported by system `SYS-2050` (Legacy Programme D), a business intelligence system with local coverage. This view clarifies the technology stack per unit.

**View `v_analytical_information_system_organizational_unit`**

```sql
CREATE VIEW v_analytical_information_system_organizational_unit AS
SELECT a.analytical_information_system_id, a.system_identifier, a.system_name, a.system_type, b.organizational_unit_id AS unit_organizational_unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM analytical_information_systems a JOIN organizational_units b ON a.organizational_unit_id = b.organizational_unit_id;
```

| analytical_information_system_id | system_identifier | system_name | system_type | unit_organizational_unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | business intelligence | 1 | UNI-2580 | Compact Series |
| 2 | SYS-2051 | Regional Standard | data warehousing | 2 | UNI-2584 | Legacy Assessment |
| 3 | SYS-2052 | Seasonal Framework | information logistics | 3 | UNI-2588 | Regional Survey A |
| 4 | SYS-2053 | Integrated Protocol A | decision support | 4 | UNI-2592 | Seasonal Corridor |

The view `v_analytical_information_system_organizational_unit` joins `analytical_information_systems` to `organizational_units` on `organizational_unit_id`, reversing the perspective of the previous view. It answers: "Which organizational unit does each analytical system serve?" Row 1 shows system `SYS-2050` serving unit `UNI-2580`. This view is useful when starting from the technology and tracing to its consumer.

**View `v_analytical_information_system_analytical_information_system`**

```sql
CREATE VIEW v_analytical_information_system_analytical_information_system AS
SELECT a.analytical_information_system_id, a.system_identifier, a.system_name, a.system_type, b.analytical_information_system_id AS system_analytical_information_system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM analytical_information_systems a JOIN analytical_information_systems b ON a.extends_analytical_information_system_id = b.analytical_information_system_id;
```

| analytical_information_system_id | system_identifier | system_name | system_type | system_analytical_information_system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | business intelligence | 1 | SYS-2050 | Legacy Programme D |
| 2 | SYS-2051 | Regional Standard | data warehousing | 2 | SYS-2051 | Regional Standard |
| 3 | SYS-2052 | Seasonal Framework | information logistics | 3 | SYS-2052 | Seasonal Framework |
| 4 | SYS-2053 | Integrated Protocol A | decision support | 4 | SYS-2053 | Integrated Protocol A |

The view `v_analytical_information_system_analytical_information_system` performs a self-join on `analytical_information_systems` using the `extends_analytical_information_system_id` foreign key. It answers: "Which analytical system extends which other system?" Row 1 indicates that system `SYS-2050` extends itself (a self-reference in the sample data), while other rows would show hierarchical relationships such as `SYS-2051` extending `SYS-2050`. This view exposes the inheritance or extension topology among analytical systems.

The schema as a whole models information logistics strategy governance as a network of interdependent entities: strategies are formulated, assigned to units, validated by studies, and measured against performance metrics, while success factors provide the explanatory variables and analytical systems supply the technological substrate. The six base tables capture the core entities with their attributes and one-to-one or one-to-many relationships encoded as foreign keys. The two junction tables, `strategies_factors` and `studies_factors`, resolve the many-to-many associations that arise because strategies and studies both relate to success factors in a non-exclusive manner. The fourteen views then reconstruct these relationships into denormalized result sets, each answering a specific analytical question by joining the appropriate tables. Reading any view's rows—such as strategy `STR-2614` paired with factor `Legacy Cluster D`, study `STU-2431`, unit `UNI-2580`, and metric `Primary Programme A`—reveals a complete picture of one strategy's context: its evidence base, its responsible department, its supporting technology, and its measured outcome. This normalization-to-view pipeline ensures data integrity at the base level while providing flexible, question-specific projections for analysis.