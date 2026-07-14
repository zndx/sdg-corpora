The domain of information logistics management captures how organizations plan, deploy, and evaluate information systems in service of strategic objectives. At its core, the model distinguishes five entity types: information logistics strategies, success factors, analytical information systems, organizational units, and decision makers. Each entity carries a set of descriptive attributes and participates in a network of many-to-many relationships that are materialized through junction tables. The resulting relational schema normalizes the domain into six base tables and seventeen association tables, while a suite of twenty-one views reconstructs the most common analytical joins for reporting.

**Table `information_logistics_strategies`**

| information_logistics_strategy_id | strategy_identifier | formulation_date | implementation_status | target_scope | alignment_level |
|---|---|---|---|---|---|
| 1 | STR-2614 | 2025-08-01 | planned | enterprise-wide | 8.20 |
| 2 | STR-2615 | 2022-01-12 | implementing | departmental | 10.40 |
| 3 | STR-2616 | 2023-06-23 | implemented | cross-organizational | 12.60 |
| 4 | STR-2617 | 2024-11-07 | abandoned | enterprise-wide | 14.80 |

The `information_logistics_strategies` table anchors the entire model. Each row represents a strategic initiative governing how information flows across the enterprise. The primary key `information_logistics_strategy_id` is a surrogate integer, while the business key `strategy_identifier` carries human-readable codes such as `STR-2614`. The `formulation_date` records when the strategy was drafted, `implementation_status` classifies the current lifecycle stage (`planned`, `implementing`, `implemented`, or `abandoned`), `target_scope` indicates the breadth of coverage (`enterprise-wide`, `departmental`, or `cross-organizational`), and `alignment_level` is a numeric score — for instance, strategy `STR-2614` scores 8.20 while `STR-2617` scores 14.80. This table is referenced by several other entities through foreign keys, establishing it as the central axis around which the rest of the model orbits.

**Table `success_factors`**

| id | factor_identifier | factor_name | validation_status | impact_coefficient | measurement_method | performance_metric_id | organizational_unit_id |
|---|---|---|---|---|---|---|---|
| 1 | FAC-2476 | Legacy Cluster D | validated | 11.70 | structural_equation_modeling | 1 | 100 |
| 2 | FAC-2478 | Regional Review | not_validated | 14.40 | survey | 2 | 101 |
| 3 | FAC-2480 | Seasonal Initiative | pending | 17.10 | expert_interview | 3 | 102 |
| 4 | FAC-2482 | Integrated Model A | validated | 19.80 | structural_equation_modeling | 4 | 103 |

Success factors capture the conditions that enable or impede strategy execution. The table `success_factors` uses a surrogate primary key `id` and a business key `factor_identifier` (e.g., `FAC-2476`). The `factor_name` column stores descriptive labels such as "Legacy Cluster D" or "Regional Review". The `validation_status` enum (`validated`, `not_validated`, `pending`) indicates whether the factor has been empirically verified. The `impact_coefficient` is a numeric weight — factor `FAC-2476` carries 11.70, while `FAC-2482` carries 19.80. The `measurement_method` column records the analytical technique used (`structural_equation_modeling`, `survey`, or `expert_interview`). Two foreign keys link success factors to other entities: `performance_metric_id` points to `performance_metrics.id`, and `organizational_unit_id` points to `organizational_units.organizational_unit_id`. For example, factor `FAC-2476` is associated with performance metric 1 and organizational unit 100.

**Table `analytical_information_systems`**

| id | system_identifier | system_name | deployment_date | system_type | uptime_percentage | organizational_unit_id | information_logistics_strategy_id |
|---|---|---|---|---|---|---|---|
| 1000 | SYS-2050 | Legacy Programme D | 2023-02-14 | business_intelligence | 16.45 | 100 | 1 |
| 1001 | SYS-2051 | Regional Standard | 2024-07-25 | data_warehousing | 18.90 | 101 | 2 |
| 1002 | SYS-2052 | Seasonal Framework | 2025-12-09 | decision_support | 21.35 | 102 | 3 |
| 1003 | SYS-2053 | Integrated Protocol A | 2022-05-20 | business_intelligence | 23.80 | 103 | 4 |

The `analytical_information_systems` table models the software and infrastructure that support decision-making. Its surrogate primary key is `id`, and the business key `system_identifier` carries codes like `SYS-2050`. The `system_name` provides a human-readable label ("Legacy Programme D", "Regional Standard"), while `deployment_date` records when the system went live. The `system_type` enum (`business_intelligence`, `data_warehousing`, `decision_support`) classifies the system's purpose. The `uptime_percentage` column stores availability metrics — system `SYS-2050` reports 16.45%, and `SYS-2053` reports 23.80%. Two foreign keys anchor this table: `organizational_unit_id` references `organizational_units.organizational_unit_id`, and `information_logistics_strategy_id` references `information_logistics_strategies.information_logistics_strategy_id`. System `SYS-2050` belongs to organizational unit 100 and is aligned with strategy 1.

**Table `organizational_units`**

| organizational_unit_id | unit_identifier | unit_name | department_code | head_count | budget_allocation | information_logistics_strategy_id | reports_to_organizational_unit_id |
|---|---|---|---|---|---|---|---|
| 100 | UNI-2580 | Compact Series | 605962 | 49 | 446.22 | 1 | 100 |
| 101 | UNI-2584 | Legacy Assessment | 10449510 | 0 | 763.46 | 2 | 101 |
| 102 | UNI-2588 | Regional Survey A | 2002007020080 | 12 | 12.34 | 3 | 102 |
| 103 | UNI-2592 | Seasonal Corridor | drafting-skills | 1 | 1,737 | 4 | 103 |

Organizational units represent the structural divisions within which strategies are executed and systems are deployed. The primary key is `organizational_unit_id`, and the business key `unit_identifier` carries codes such as `UNI-2580`. The `unit_name` column stores labels like "Compact Series" or "Seasonal Corridor". The `department_code` is a numeric identifier (e.g., `605962`), `head_count` records staffing levels (ranging from 0 to 49 in the sample data), and `budget_allocation` stores financial resources (values such as 446.22 or 1,737). The foreign key `information_logistics_strategy_id` links the unit to a strategy, while `reports_to_organizational_unit_id` creates a self-referencing hierarchy — unit `UNI-2580` reports to itself in the sample, and `UNI-2584` reports to unit 101.

**Table `decision_makers`**

| decision_maker_id | stakeholder_identifier | role_title | decision_frequency | information_requirement_level | satisfaction_score | organizational_unit_id | performance_metric_id |
|---|---|---|---|---|---|---|---|
| 100 | STA-2350 | Distributed Standard | daily | strategic | 4.45 | 100 | 1 |
| 101 | STA-2352 | Adaptive Framework D | weekly | tactical | 6.90 | 101 | 2 |
| 102 | STA-2354 | Primary Protocol | monthly | operational | 9.35 | 102 | 3 |
| 103 | STA-2356 | Composite Programme | quarterly | strategic | 11.80 | 103 | 4 |

Decision makers represent the human stakeholders who consume information and drive organizational choices. The primary key is `decision_maker_id`, and the business key `stakeholder_identifier` carries codes such as `STA-2350`. The `role_title` column stores descriptive titles ("Distributed Standard", "Adaptive Framework D"). The `decision_frequency` enum (`daily`, `weekly`, `monthly`, `quarterly`) captures how often the stakeholder makes decisions, while `information_requirement_level` classifies the strategic depth needed (`strategic`, `tactical`, or `operational`). The `satisfaction_score` is a numeric rating — stakeholder `STA-2350` scores 4.45, and `STA-2356` scores 11.80. Two foreign keys link decision makers to other entities: `organizational_unit_id` references `organizational_units.organizational_unit_id`, and `performance_metric_id` references `performance_metrics.id`. Stakeholder `STA-2350` belongs to organizational unit 100 and is associated with performance metric 1.

**Table `performance_metrics`**

| id | metric_identifier | metric_name | measurement_date | target_value | actual_value | status | success_factor_id | analytical_information_system_id |
|---|---|---|---|---|---|---|---|---|
| 1 | MET-2589 | Primary Programme A | 2024-07-01T18:54:00 | 13.45 | 13.45 | on_target | 1 | 1000 |
| 2 | MET-2595 | Composite Standard | 2025-12-12T01:11:00 | 15.90 | 15.90 | below_target | 2 | 1001 |
| 3 | MET-2601 | Compact Framework | 2022-05-23T08:28:00 | 18.35 | 18.35 | above_target | 3 | 1002 |
| 4 | MET-2607 | Legacy Protocol D | 2023-10-07T15:45:00 | 20.80 | 20.80 | pending | 4 | 1003 |

Performance metrics quantify the outcomes of information logistics initiatives. The primary key is `id`, and the business key `metric_identifier` carries codes such as `MET-2589`. The `metric_name` column stores labels like "Primary Programme A" or "Compact Framework". The `measurement_date` is a timestamp (e.g., `2024-07-01T18:54:00`). The `target_value` and `actual_value` columns store numeric targets and observed results — metric `MET-2589` has both target and actual at 13.45, while `MET-2595` shows target 15.90 and actual 15.90. The `status` enum (`on_target`, `below_target`, `above_target`, `pending`) summarizes performance. Two foreign keys link metrics to other entities: `success_factor_id` references `success_factors.id`, and `analytical_information_system_id` references `analytical_information_systems.id`. Metric `MET-2589` is linked to success factor 1 and analytical system 1000.

The six base tables above form the entity backbone. However, the domain requires many-to-many relationships between several pairs of entities. These are materialized through seventeen junction tables, each containing two foreign key columns that reference the primary keys of the participating entities.

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

The `strategies_factors` junction table links information logistics strategies to success factors. Its two columns are `information_logistics_strategy_id` (referencing `information_logistics_strategies`) and `success_factor_id` (referencing `success_factors`). This table enables a single strategy to be associated with multiple success factors and vice versa.

**Table `strategies_systems`**

| information_logistics_strategy_id | analytical_information_system_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `strategies_systems` junction table connects information logistics strategies to analytical information systems. Its columns are `information_logistics_strategy_id` (referencing `information_logistics_strategies`) and `system_id` (referencing `analytical_information_systems`).

**Table `strategies_metrics`**

| information_logistics_strategy_id | performance_metric_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `strategies_metrics` junction table associates information logistics strategies with performance metrics. Its columns are `information_logistics_strategy_id` (referencing `information_logistics_strategies`) and `metric_id` (referencing `performance_metrics`).

**Table `factors_strategies`**

| success_factor_id | information_logistics_strategy_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `factors_strategies` junction table provides the inverse linkage from success factors to information logistics strategies. Its columns are `success_factor_id` (referencing `success_factors`) and `information_logistics_strategy_id` (referencing `information_logistics_strategies`). This table is structurally symmetric to `strategies_factors`, allowing queries to start from either entity.

**Table `systems_makers`**

| analytical_information_system_id | decision_maker_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `systems_makers` junction table links analytical information systems to decision makers. Its columns are `system_id` (referencing `analytical_information_systems`) and `decision_maker_id` (referencing `decision_makers`).

**Table `units_systems`**

| organizational_unit_id | analytical_information_system_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `units_systems` junction table connects organizational units to analytical information systems. Its columns are `organizational_unit_id` (referencing `organizational_units`) and `system_id` (referencing `analytical_information_systems`).

**Table `units_makers`**

| organizational_unit_id | decision_maker_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The `units_makers` junction table associates organizational units with decision makers. Its columns are `organizational_unit_id` (referencing `organizational_units`) and `decision_maker_id` (referencing `decision_makers`).

**Table `makers_systems`**

| decision_maker_id | analytical_information_system_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `makers_systems` junction table provides the inverse linkage from decision makers to analytical information systems. Its columns are `decision_maker_id` (referencing `decision_makers`) and `system_id` (referencing `analytical_information_systems`).

**Table `makers_factors`**

| decision_maker_id | success_factor_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `makers_factors` junction table links decision makers to success factors. Its columns are `decision_maker_id` (referencing `decision_makers`) and `success_factor_id` (referencing `success_factors`).

**Table `metrics_strategies`**

| performance_metric_id | information_logistics_strategy_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `metrics_strategies` junction table provides the inverse linkage from performance metrics to information logistics strategies. Its columns are `metric_id` (referencing `performance_metrics`) and `information_logistics_strategy_id` (referencing `information_logistics_strategies`).

**Table `metrics_makers`**

| performance_metric_id | decision_maker_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `metrics_makers` junction table associates performance metrics with decision makers. Its columns are `metric_id` (referencing `performance_metrics`) and `decision_maker_id` (referencing `decision_makers`).

With the base tables and junction tables in place, the model supports a rich set of analytical views. Each view performs a specific join across the normalized tables to answer a domain question. The following sections describe each view and interpret its result.

**View `v_information_logistics_strategy_success_factor_detail`**

```sql
CREATE VIEW v_information_logistics_strategy_success_factor_detail AS
SELECT a.information_logistics_strategy_id, a.strategy_identifier, a.formulation_date, b.id AS factor_id, b.factor_identifier AS factor_factor_identifier, b.factor_name AS factor_factor_name
FROM information_logistics_strategies a
  JOIN strategies_factors j ON j.information_logistics_strategy_id = a.information_logistics_strategy_id
  JOIN success_factors b ON b.id = j.success_factor_id;
```

| information_logistics_strategy_id | strategy_identifier | formulation_date | factor_id | factor_factor_identifier | factor_factor_name |
|---|---|---|---|---|---|
| 1 | STR-2614 | 2025-08-01 | 1 | FAC-2476 | Legacy Cluster D |
| 1 | STR-2614 | 2025-08-01 | 2 | FAC-2478 | Regional Review |
| 2 | STR-2615 | 2022-01-12 | 2 | FAC-2478 | Regional Review |
| 2 | STR-2615 | 2022-01-12 | 3 | FAC-2480 | Seasonal Initiative |
| 3 | STR-2616 | 2023-06-23 | 3 | FAC-2480 | Seasonal Initiative |
| 3 | STR-2616 | 2023-06-23 | 4 | FAC-2482 | Integrated Model A |
| 4 | STR-2617 | 2024-11-07 | 4 | FAC-2482 | Integrated Model A |
| 4 | STR-2617 | 2024-11-07 | 1 | FAC-2476 | Legacy Cluster D |

This view joins `information_logistics_strategies` with `success_factors` through the `strategies_factors` junction table. It answers the question: "Which success factors are associated with each information logistics strategy?" The result includes the strategy's identifier, formulation date, and implementation status alongside the factor's name, validation status, and impact coefficient. For instance, a row might show strategy `STR-2614` (status `planned`, scope `enterprise-wide`) linked to factor `FAC-2476` ("Legacy Cluster D", impact coefficient 11.70, validated via structural equation modeling). This view enables strategy managers to audit the factor coverage of each initiative.

**View `v_information_logistics_strategy_analytical_information_system_detail`**

```sql
CREATE VIEW v_information_logistics_strategy_analytical_information_system_detail AS
SELECT a.information_logistics_strategy_id, a.strategy_identifier, a.formulation_date, b.id AS system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM information_logistics_strategies a
  JOIN strategies_systems j ON j.information_logistics_strategy_id = a.information_logistics_strategy_id
  JOIN analytical_information_systems b ON b.id = j.analytical_information_system_id;
```

| information_logistics_strategy_id | strategy_identifier | formulation_date | system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|
| 1 | STR-2614 | 2025-08-01 | 1000 | SYS-2050 | Legacy Programme D |
| 1 | STR-2614 | 2025-08-01 | 1001 | SYS-2051 | Regional Standard |
| 2 | STR-2615 | 2022-01-12 | 1001 | SYS-2051 | Regional Standard |
| 2 | STR-2615 | 2022-01-12 | 1002 | SYS-2052 | Seasonal Framework |
| 3 | STR-2616 | 2023-06-23 | 1002 | SYS-2052 | Seasonal Framework |
| 3 | STR-2616 | 2023-06-23 | 1003 | SYS-2053 | Integrated Protocol A |
| 4 | STR-2617 | 2024-11-07 | 1003 | SYS-2053 | Integrated Protocol A |
| 4 | STR-2617 | 2024-11-07 | 1000 | SYS-2050 | Legacy Programme D |

This view joins `information_logistics_strategies` with `analytical_information_systems` through the `strategies_systems` junction table. It answers: "Which analytical systems support each information logistics strategy?" The result includes the strategy's alignment level and the system's type, deployment date, and uptime percentage. A representative row might pair strategy `STR-2615` (alignment 10.40, status `implementing`) with system `SYS-2051` ("Regional Standard", type `data_warehousing`, uptime 18.90%). This view helps IT governance teams verify that every strategy has adequate system support.

**View `v_information_logistics_strategy_performance_metric_detail`**

```sql
CREATE VIEW v_information_logistics_strategy_performance_metric_detail AS
SELECT a.information_logistics_strategy_id, a.strategy_identifier, a.formulation_date, b.id AS metric_id, b.metric_identifier AS metric_metric_identifier, b.metric_name AS metric_metric_name
FROM information_logistics_strategies a
  JOIN strategies_metrics j ON j.information_logistics_strategy_id = a.information_logistics_strategy_id
  JOIN performance_metrics b ON b.id = j.performance_metric_id;
```

| information_logistics_strategy_id | strategy_identifier | formulation_date | metric_id | metric_metric_identifier | metric_metric_name |
|---|---|---|---|---|---|
| 1 | STR-2614 | 2025-08-01 | 1 | MET-2589 | Primary Programme A |
| 1 | STR-2614 | 2025-08-01 | 2 | MET-2595 | Composite Standard |
| 2 | STR-2615 | 2022-01-12 | 2 | MET-2595 | Composite Standard |
| 2 | STR-2615 | 2022-01-12 | 3 | MET-2601 | Compact Framework |
| 3 | STR-2616 | 2023-06-23 | 3 | MET-2601 | Compact Framework |
| 3 | STR-2616 | 2023-06-23 | 4 | MET-2607 | Legacy Protocol D |
| 4 | STR-2617 | 2024-11-07 | 4 | MET-2607 | Legacy Protocol D |
| 4 | STR-2617 | 2024-11-07 | 1 | MET-2589 | Primary Programme A |

This view joins `information_logistics_strategies` with `performance_metrics` through the `strategies_metrics` junction table. It answers: "Which performance metrics track each information logistics strategy?" The result includes the strategy's scope and the metric's target value, actual value, and status. A row might show strategy `STR-2616` (scope `cross-organizational`) linked to metric `MET-2601` ("Compact Framework", target 18.35, actual 18.35, status `above_target`). This view supports executive dashboards that correlate strategic intent with measured outcomes.

**View `v_success_factor_information_logistics_strategy_detail`**

```sql
CREATE VIEW v_success_factor_information_logistics_strategy_detail AS
SELECT a.id, a.factor_identifier, a.factor_name, b.information_logistics_strategy_id AS strategy_information_logistics_strategy_id, b.strategy_identifier AS strategy_strategy_identifier, b.formulation_date AS strategy_formulation_date
FROM success_factors a
  JOIN factors_strategies j ON j.success_factor_id = a.id
  JOIN information_logistics_strategies b ON b.information_logistics_strategy_id = j.information_logistics_strategy_id;
```

| id | factor_identifier | factor_name | strategy_information_logistics_strategy_id | strategy_strategy_identifier | strategy_formulation_date |
|---|---|---|---|---|---|
| 1 | FAC-2476 | Legacy Cluster D | 1 | STR-2614 | 2025-08-01 |
| 1 | FAC-2476 | Legacy Cluster D | 2 | STR-2615 | 2022-01-12 |
| 2 | FAC-2478 | Regional Review | 2 | STR-2615 | 2022-01-12 |
| 2 | FAC-2478 | Regional Review | 3 | STR-2616 | 2023-06-23 |
| 3 | FAC-2480 | Seasonal Initiative | 3 | STR-2616 | 2023-06-23 |
| 3 | FAC-2480 | Seasonal Initiative | 4 | STR-2617 | 2024-11-07 |
| 4 | FAC-2482 | Integrated Model A | 4 | STR-2617 | 2024-11-07 |
| 4 | FAC-2482 | Integrated Model A | 1 | STR-2614 | 2025-08-01 |

This view joins `success_factors` with `information_logistics_strategies` through the `factors_strategies` junction table. It answers: "Which information logistics strategies does each success factor influence?" The result inverts the perspective of the previous view, starting from the factor. A row might show factor `FAC-2478` ("Regional Review", not validated, impact 14.40) linked to strategy `STR-2615` (status `implementing`, alignment 10.40). This view is useful for risk assessment — factors that are `not_validated` or `pending` can be flagged for review.

**View `v_success_factor_performance_metric`**

```sql
CREATE VIEW v_success_factor_performance_metric AS
SELECT a.id, a.factor_identifier, a.factor_name, a.validation_status, b.id AS metric_id, b.metric_identifier AS metric_metric_identifier, b.metric_name AS metric_metric_name
FROM success_factors a JOIN performance_metrics b ON a.performance_metric_id = b.id;
```

| id | factor_identifier | factor_name | validation_status | metric_id | metric_metric_identifier | metric_metric_name |
|---|---|---|---|---|---|---|
| 1 | FAC-2476 | Legacy Cluster D | validated | 1 | MET-2589 | Primary Programme A |
| 2 | FAC-2478 | Regional Review | not_validated | 2 | MET-2595 | Composite Standard |
| 3 | FAC-2480 | Seasonal Initiative | pending | 3 | MET-2601 | Compact Framework |
| 4 | FAC-2482 | Integrated Model A | validated | 4 | MET-2607 | Legacy Protocol D |

This view joins `success_factors` with `performance_metrics` through the `performance_metrics.success_factor_id` foreign key. It answers: "Which performance metrics are associated with each success factor?" The result includes the factor's measurement method and the metric's measurement date and status. A row might pair factor `FAC-2480` ("Seasonal Initiative", measured via `expert_interview`) with metric `MET-2601` ("Compact Framework", measured on `2022-05-23T08:28:00`, status `above_target`). This view supports the validation pipeline by showing which metrics have been used to assess each factor.

**View `v_success_factor_organizational_unit`**

```sql
CREATE VIEW v_success_factor_organizational_unit AS
SELECT a.id, a.factor_identifier, a.factor_name, a.validation_status, b.organizational_unit_id AS unit_organizational_unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM success_factors a JOIN organizational_units b ON a.organizational_unit_id = b.organizational_unit_id;
```

| id | factor_identifier | factor_name | validation_status | unit_organizational_unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | FAC-2476 | Legacy Cluster D | validated | 100 | UNI-2580 | Compact Series |
| 2 | FAC-2478 | Regional Review | not_validated | 101 | UNI-2584 | Legacy Assessment |
| 3 | FAC-2480 | Seasonal Initiative | pending | 102 | UNI-2588 | Regional Survey A |
| 4 | FAC-2482 | Integrated Model A | validated | 103 | UNI-2592 | Seasonal Corridor |

This view joins `success_factors` with `organizational_units` through the `success_factors.organizational_unit_id` foreign key. It answers: "Which organizational units are responsible for each success factor?" The result includes the factor's impact coefficient and the unit's head count and budget allocation. A row might show factor `FAC-2476` (impact 11.70) linked to unit `UNI-2580` ("Compact Series", head count 49, budget 446.22). This view enables resource planning by showing which units own which factors.

**View `v_analytical_information_system_organizational_unit`**

```sql
CREATE VIEW v_analytical_information_system_organizational_unit AS
SELECT a.id, a.system_identifier, a.system_name, a.deployment_date, b.organizational_unit_id AS unit_organizational_unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM analytical_information_systems a JOIN organizational_units b ON a.organizational_unit_id = b.organizational_unit_id;
```

| id | system_identifier | system_name | deployment_date | unit_organizational_unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1000 | SYS-2050 | Legacy Programme D | 2023-02-14 | 100 | UNI-2580 | Compact Series |
| 1001 | SYS-2051 | Regional Standard | 2024-07-25 | 101 | UNI-2584 | Legacy Assessment |
| 1002 | SYS-2052 | Seasonal Framework | 2025-12-09 | 102 | UNI-2588 | Regional Survey A |
| 1003 | SYS-2053 | Integrated Protocol A | 2022-05-20 | 103 | UNI-2592 | Seasonal Corridor |

This view joins `analytical_information_systems` with `organizational_units` through the `analytical_information_systems.organizational_unit_id` foreign key. It answers: "Which organizational units host each analytical information system?" The result includes the system's uptime percentage and the unit's department code. A row might pair system `SYS-2050` ("Legacy Programme D", uptime 16.45%) with unit `UNI-2580` ("Compact Series", department code 605962). This view supports infrastructure audits and capacity planning.

**View `v_analytical_information_system_decision_maker_detail`**

```sql
CREATE VIEW v_analytical_information_system_decision_maker_detail AS
SELECT a.id, a.system_identifier, a.system_name, b.decision_maker_id AS maker_decision_maker_id, b.stakeholder_identifier AS maker_stakeholder_identifier, b.role_title AS maker_role_title
FROM analytical_information_systems a
  JOIN systems_makers j ON j.analytical_information_system_id = a.id
  JOIN decision_makers b ON b.decision_maker_id = j.decision_maker_id;
```

| id | system_identifier | system_name | maker_decision_maker_id | maker_stakeholder_identifier | maker_role_title |
|---|---|---|---|---|---|
| 1000 | SYS-2050 | Legacy Programme D | 100 | STA-2350 | Distributed Standard |
| 1000 | SYS-2050 | Legacy Programme D | 101 | STA-2352 | Adaptive Framework D |
| 1001 | SYS-2051 | Regional Standard | 101 | STA-2352 | Adaptive Framework D |
| 1001 | SYS-2051 | Regional Standard | 102 | STA-2354 | Primary Protocol |
| 1002 | SYS-2052 | Seasonal Framework | 102 | STA-2354 | Primary Protocol |
| 1002 | SYS-2052 | Seasonal Framework | 103 | STA-2356 | Composite Programme |
| 1003 | SYS-2053 | Integrated Protocol A | 103 | STA-2356 | Composite Programme |
| 1003 | SYS-2053 | Integrated Protocol A | 100 | STA-2350 | Distributed Standard |

This view joins `analytical_information_systems` with `decision_makers` through the `systems_makers` junction table. It answers: "Which decision makers consume each analytical information system?" The result includes the system's type and the stakeholder's role title and decision frequency. A row might show system `SYS-2052` ("Seasonal Framework", type `decision_support`) linked to stakeholder `STA-2354` ("Primary Protocol", frequency `monthly`, requirement level `operational`). This view helps system owners understand their user base.

**View `v_analytical_information_system_information_logistics_strategy`**

```sql
CREATE VIEW v_analytical_information_system_information_logistics_strategy AS
SELECT a.id, a.system_identifier, a.system_name, a.deployment_date, b.information_logistics_strategy_id AS strategy_information_logistics_strategy_id, b.strategy_identifier AS strategy_strategy_identifier, b.formulation_date AS strategy_formulation_date
FROM analytical_information_systems a JOIN information_logistics_strategies b ON a.information_logistics_strategy_id = b.information_logistics_strategy_id;
```

| id | system_identifier | system_name | deployment_date | strategy_information_logistics_strategy_id | strategy_strategy_identifier | strategy_formulation_date |
|---|---|---|---|---|---|---|
| 1000 | SYS-2050 | Legacy Programme D | 2023-02-14 | 1 | STR-2614 | 2025-08-01 |
| 1001 | SYS-2051 | Regional Standard | 2024-07-25 | 2 | STR-2615 | 2022-01-12 |
| 1002 | SYS-2052 | Seasonal Framework | 2025-12-09 | 3 | STR-2616 | 2023-06-23 |
| 1003 | SYS-2053 | Integrated Protocol A | 2022-05-20 | 4 | STR-2617 | 2024-11-07 |

This view joins `analytical_information_systems` with `information_logistics_strategies` through the `analytical_information_systems.information_logistics_strategy_id` foreign key. It answers: "Which information logistics strategy does each analytical system support?" The result includes the system's deployment date and the strategy's formulation date and alignment level. A row might pair system `SYS-2053` ("Integrated Protocol A", deployed `2022-05-20`) with strategy `STR-2617` (formulated `2024-11-07`, alignment 14.80, status `abandoned`). This view reveals potential misalignments — for instance, a system deployed before its supporting strategy was formulated.

**View `v_organizational_unit_analytical_information_system_detail`**

```sql
CREATE VIEW v_organizational_unit_analytical_information_system_detail AS
SELECT a.organizational_unit_id, a.unit_identifier, a.unit_name, b.id AS system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM organizational_units a
  JOIN units_systems j ON j.organizational_unit_id = a.organizational_unit_id
  JOIN analytical_information_systems b ON b.id = j.analytical_information_system_id;
```

| organizational_unit_id | unit_identifier | unit_name | system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|
| 100 | UNI-2580 | Compact Series | 1000 | SYS-2050 | Legacy Programme D |
| 100 | UNI-2580 | Compact Series | 1001 | SYS-2051 | Regional Standard |
| 101 | UNI-2584 | Legacy Assessment | 1001 | SYS-2051 | Regional Standard |
| 101 | UNI-2584 | Legacy Assessment | 1002 | SYS-2052 | Seasonal Framework |
| 102 | UNI-2588 | Regional Survey A | 1002 | SYS-2052 | Seasonal Framework |
| 102 | UNI-2588 | Regional Survey A | 1003 | SYS-2053 | Integrated Protocol A |
| 103 | UNI-2592 | Seasonal Corridor | 1003 | SYS-2053 | Integrated Protocol A |
| 103 | UNI-2592 | Seasonal Corridor | 1000 | SYS-2050 | Legacy Programme D |

This view joins `organizational_units` with `analytical_information_systems` through the `units_systems` junction table. It answers: "Which analytical information systems are deployed within each organizational unit?" The result includes the unit's head count and the system's uptime percentage. A row might show unit `UNI-2584` ("Legacy Assessment", head count 0) linked to system `SYS-2051` ("Regional Standard", uptime 18.90%). This view supports infrastructure-to-organization mapping for cost allocation.

**View `v_organizational_unit_decision_maker_detail`**

```sql
CREATE VIEW v_organizational_unit_decision_maker_detail AS
SELECT a.organizational_unit_id, a.unit_identifier, a.unit_name, b.decision_maker_id AS maker_decision_maker_id, b.stakeholder_identifier AS maker_stakeholder_identifier, b.role_title AS maker_role_title
FROM organizational_units a
  JOIN units_makers j ON j.organizational_unit_id = a.organizational_unit_id
  JOIN decision_makers b ON b.decision_maker_id = j.decision_maker_id;
```

| organizational_unit_id | unit_identifier | unit_name | maker_decision_maker_id | maker_stakeholder_identifier | maker_role_title |
|---|---|---|---|---|---|
| 100 | UNI-2580 | Compact Series | 100 | STA-2350 | Distributed Standard |
| 100 | UNI-2580 | Compact Series | 101 | STA-2352 | Adaptive Framework D |
| 101 | UNI-2584 | Legacy Assessment | 101 | STA-2352 | Adaptive Framework D |
| 101 | UNI-2584 | Legacy Assessment | 102 | STA-2354 | Primary Protocol |
| 102 | UNI-2588 | Regional Survey A | 102 | STA-2354 | Primary Protocol |
| 102 | UNI-2588 | Regional Survey A | 103 | STA-2356 | Composite Programme |
| 103 | UNI-2592 | Seasonal Corridor | 103 | STA-2356 | Composite Programme |
| 103 | UNI-2592 | Seasonal Corridor | 100 | STA-2350 | Distributed Standard |

This view joins `organizational_units` with `decision_makers` through the `units_makers` junction table. It answers: "Which decision makers belong to each organizational unit?" The result includes the unit's budget allocation and the stakeholder's satisfaction score and information requirement level. A row might pair unit `UNI-2588` ("Regional Survey A", budget 12.34) with stakeholder `STA-2352` ("Adaptive Framework D", satisfaction 6.90, requirement `tactical`). This view enables workforce analytics and satisfaction benchmarking.

**View `v_organizational_unit_information_logistics_strategy`**

```sql
CREATE VIEW v_organizational_unit_information_logistics_strategy AS
SELECT a.organizational_unit_id, a.unit_identifier, a.unit_name, a.department_code, b.information_logistics_strategy_id AS strategy_information_logistics_strategy_id, b.strategy_identifier AS strategy_strategy_identifier, b.formulation_date AS strategy_formulation_date
FROM organizational_units a JOIN information_logistics_strategies b ON a.information_logistics_strategy_id = b.information_logistics_strategy_id;
```

| organizational_unit_id | unit_identifier | unit_name | department_code | strategy_information_logistics_strategy_id | strategy_strategy_identifier | strategy_formulation_date |
|---|---|---|---|---|---|---|
| 100 | UNI-2580 | Compact Series | 605962 | 1 | STR-2614 | 2025-08-01 |
| 101 | UNI-2584 | Legacy Assessment | 10449510 | 2 | STR-2615 | 2022-01-12 |
| 102 | UNI-2588 | Regional Survey A | 2002007020080 | 3 | STR-2616 | 2023-06-23 |
| 103 | UNI-2592 | Seasonal Corridor | drafting-skills | 4 | STR-2617 | 2024-11-07 |

This view joins `organizational_units` with `information_logistics_strategies` through the `organizational_units.information_logistics_strategy_id` foreign key. It answers: "Which information logistics strategy is each organizational unit aligned with?" The result includes the unit's department code and the strategy's implementation status and target scope. A row might show unit `UNI-2592` ("Seasonal Corridor", department code `drafting-skills`) linked to strategy `STR-2617` (status `abandoned`, scope `enterprise-wide`). This view supports strategic alignment audits.

**View `v_organizational_unit_organizational_unit`**

```sql
CREATE VIEW v_organizational_unit_organizational_unit AS
SELECT a.organizational_unit_id, a.unit_identifier, a.unit_name, a.department_code, b.organizational_unit_id AS unit_organizational_unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM organizational_units a JOIN organizational_units b ON a.reports_to_organizational_unit_id = b.organizational_unit_id;
```

| organizational_unit_id | unit_identifier | unit_name | department_code | unit_organizational_unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 100 | UNI-2580 | Compact Series | 605962 | 100 | UNI-2580 | Compact Series |
| 101 | UNI-2584 | Legacy Assessment | 10449510 | 101 | UNI-2584 | Legacy Assessment |
| 102 | UNI-2588 | Regional Survey A | 2002007020080 | 102 | UNI-2588 | Regional Survey A |
| 103 | UNI-2592 | Seasonal Corridor | drafting-skills | 103 | UNI-2592 | Seasonal Corridor |

This view joins `organizational_units` with itself through the `organizational_units.reports_to_organizational_unit_id` self-referencing foreign key. It answers: "Which organizational unit does each unit report to?" The result includes both the child unit's name and the parent unit's name, enabling hierarchical traversal. A row might show unit `UNI-2584` ("Legacy Assessment") reporting to unit `UNI-2584` itself in the sample data. This view supports org-chart generation and span-of-control analysis.

**View `v_decision_maker_analytical_information_system_detail`**

```sql
CREATE VIEW v_decision_maker_analytical_information_system_detail AS
SELECT a.decision_maker_id, a.stakeholder_identifier, a.role_title, b.id AS system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM decision_makers a
  JOIN makers_systems j ON j.decision_maker_id = a.decision_maker_id
  JOIN analytical_information_systems b ON b.id = j.analytical_information_system_id;
```

| decision_maker_id | stakeholder_identifier | role_title | system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|
| 100 | STA-2350 | Distributed Standard | 1000 | SYS-2050 | Legacy Programme D |
| 100 | STA-2350 | Distributed Standard | 1001 | SYS-2051 | Regional Standard |
| 101 | STA-2352 | Adaptive Framework D | 1001 | SYS-2051 | Regional Standard |
| 101 | STA-2352 | Adaptive Framework D | 1002 | SYS-2052 | Seasonal Framework |
| 102 | STA-2354 | Primary Protocol | 1002 | SYS-2052 | Seasonal Framework |
| 102 | STA-2354 | Primary Protocol | 1003 | SYS-2053 | Integrated Protocol A |
| 103 | STA-2356 | Composite Programme | 1003 | SYS-2053 | Integrated Protocol A |
| 103 | STA-2356 | Composite Programme | 1000 | SYS-2050 | Legacy Programme D |

This view joins `decision_makers` with `analytical_information_systems` through the `makers_systems` junction table. It answers: "Which analytical information systems does each decision maker use?" The result includes the stakeholder's role title and the system's system type and uptime percentage. A row might show stakeholder `STA-2350` ("Distributed Standard") linked to system `SYS-2050` ("Legacy Programme D", type `business_intelligence`, uptime 16.45%). This view supports user-system matching and training needs analysis.

**View `v_decision_maker_organizational_unit`**

```sql
CREATE VIEW v_decision_maker_organizational_unit AS
SELECT a.decision_maker_id, a.stakeholder_identifier, a.role_title, a.decision_frequency, b.organizational_unit_id AS unit_organizational_unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM decision_makers a JOIN organizational_units b ON a.organizational_unit_id = b.organizational_unit_id;
```

| decision_maker_id | stakeholder_identifier | role_title | decision_frequency | unit_organizational_unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 100 | STA-2350 | Distributed Standard | daily | 100 | UNI-2580 | Compact Series |
| 101 | STA-2352 | Adaptive Framework D | weekly | 101 | UNI-2584 | Legacy Assessment |
| 102 | STA-2354 | Primary Protocol | monthly | 102 | UNI-2588 | Regional Survey A |
| 103 | STA-2356 | Composite Programme | quarterly | 103 | UNI-2592 | Seasonal Corridor |

This view joins `decision_makers` with `organizational_units` through the `decision_makers.organizational_unit_id` foreign key. It answers: "Which organizational unit does each decision maker belong to?" The result includes the stakeholder's decision frequency and the unit's head count and budget allocation. A row might pair stakeholder `STA-2356` ("Composite Programme", frequency `quarterly`) with unit `UNI-2592` ("Seasonal Corridor", head count 1, budget 1,737). This view supports organizational reporting lines and resource allocation.

**View `v_decision_maker_success_factor_detail`**

```sql
CREATE VIEW v_decision_maker_success_factor_detail AS
SELECT a.decision_maker_id, a.stakeholder_identifier, a.role_title, b.id AS factor_id, b.factor_identifier AS factor_factor_identifier, b.factor_name AS factor_factor_name
FROM decision_makers a
  JOIN makers_factors j ON j.decision_maker_id = a.decision_maker_id
  JOIN success_factors b ON b.id = j.success_factor_id;
```

| decision_maker_id | stakeholder_identifier | role_title | factor_id | factor_factor_identifier | factor_factor_name |
|---|---|---|---|---|---|
| 100 | STA-2350 | Distributed Standard | 1 | FAC-2476 | Legacy Cluster D |
| 100 | STA-2350 | Distributed Standard | 2 | FAC-2478 | Regional Review |
| 101 | STA-2352 | Adaptive Framework D | 2 | FAC-2478 | Regional Review |
| 101 | STA-2352 | Adaptive Framework D | 3 | FAC-2480 | Seasonal Initiative |
| 102 | STA-2354 | Primary Protocol | 3 | FAC-2480 | Seasonal Initiative |
| 102 | STA-2354 | Primary Protocol | 4 | FAC-2482 | Integrated Model A |
| 103 | STA-2356 | Composite Programme | 4 | FAC-2482 | Integrated Model A |
| 103 | STA-2356 | Composite Programme | 1 | FAC-2476 | Legacy Cluster D |

This view joins `decision_makers` with `success_factors` through the `makers_factors` junction table. It answers: "Which success factors does each decision maker influence or depend on?" The result includes the stakeholder's satisfaction score and the factor's validation status and impact coefficient. A row might show stakeholder `STA-2354` (satisfaction 9.35) linked to factor `FAC-2480` ("Seasonal Initiative", status `pending`, impact 17.10). This view supports stakeholder engagement analysis.

**View `v_decision_maker_performance_metric`**

```sql
CREATE VIEW v_decision_maker_performance_metric AS
SELECT a.decision_maker_id, a.stakeholder_identifier, a.role_title, a.decision_frequency, b.id AS metric_id, b.metric_identifier AS metric_metric_identifier, b.metric_name AS metric_metric_name
FROM decision_makers a JOIN performance_metrics b ON a.performance_metric_id = b.id;
```

| decision_maker_id | stakeholder_identifier | role_title | decision_frequency | metric_id | metric_metric_identifier | metric_metric_name |
|---|---|---|---|---|---|---|
| 100 | STA-2350 | Distributed Standard | daily | 1 | MET-2589 | Primary Programme A |
| 101 | STA-2352 | Adaptive Framework D | weekly | 2 | MET-2595 | Composite Standard |
| 102 | STA-2354 | Primary Protocol | monthly | 3 | MET-2601 | Compact Framework |
| 103 | STA-2356 | Composite Programme | quarterly | 4 | MET-2607 | Legacy Protocol D |

This view joins `decision_makers` with `performance_metrics` through the `metrics_makers` junction table. It answers: "Which performance metrics does each decision maker track?" The result includes the stakeholder's information requirement level and the metric's target value, actual value, and status. A row might pair stakeholder `STA-2352` (requirement `tactical`) with metric `MET-2595` ("Composite Standard", target 15.90, actual 15.90, status `below_target`). This view supports performance accountability and metric ownership.

**View `v_performance_metric_information_logistics_strategy_detail`**

```sql
CREATE VIEW v_performance_metric_information_logistics_strategy_detail AS
SELECT a.id, a.metric_identifier, a.metric_name, b.information_logistics_strategy_id AS strategy_information_logistics_strategy_id, b.strategy_identifier AS strategy_strategy_identifier, b.formulation_date AS strategy_formulation_date
FROM performance_metrics a
  JOIN metrics_strategies j ON j.performance_metric_id = a.id
  JOIN information_logistics_strategies b ON b.information_logistics_strategy_id = j.information_logistics_strategy_id;
```

| id | metric_identifier | metric_name | strategy_information_logistics_strategy_id | strategy_strategy_identifier | strategy_formulation_date |
|---|---|---|---|---|---|
| 1 | MET-2589 | Primary Programme A | 1 | STR-2614 | 2025-08-01 |
| 1 | MET-2589 | Primary Programme A | 2 | STR-2615 | 2022-01-12 |
| 2 | MET-2595 | Composite Standard | 2 | STR-2615 | 2022-01-12 |
| 2 | MET-2595 | Composite Standard | 3 | STR-2616 | 2023-06-23 |
| 3 | MET-2601 | Compact Framework | 3 | STR-2616 | 2023-06-23 |
| 3 | MET-2601 | Compact Framework | 4 | STR-2617 | 2024-11-07 |
| 4 | MET-2607 | Legacy Protocol D | 4 | STR-2617 | 2024-11-07 |
| 4 | MET-2607 | Legacy Protocol D | 1 | STR-2614 | 2025-08-01 |

This view joins `performance_metrics` with `information_logistics_strategies` through the `metrics_strategies` junction table. It answers: "Which information logistics strategy does each performance metric evaluate?" The result includes the metric's measurement date and the strategy's formulation date and alignment level. A row might show metric `MET-2607` ("Legacy Protocol D", measured `2023-10-07T15:45:00`) linked to strategy `STR-2614` (formulated `2025-08-01`, alignment 8.20). This view supports retrospective strategy evaluation.

**View `v_performance_metric_success_factor`**

```sql
CREATE VIEW v_performance_metric_success_factor AS
SELECT a.id, a.metric_identifier, a.metric_name, a.measurement_date, b.id AS factor_id, b.factor_identifier AS factor_factor_identifier, b.factor_name AS factor_factor_name
FROM performance_metrics a JOIN success_factors b ON a.success_factor_id = b.id;
```

| id | metric_identifier | metric_name | measurement_date | factor_id | factor_factor_identifier | factor_factor_name |
|---|---|---|---|---|---|---|
| 1 | MET-2589 | Primary Programme A | 2024-07-01T18:54:00 | 1 | FAC-2476 | Legacy Cluster D |
| 2 | MET-2595 | Composite Standard | 2025-12-12T01:11:00 | 2 | FAC-2478 | Regional Review |
| 3 | MET-2601 | Compact Framework | 2022-05-23T08:28:00 | 3 | FAC-2480 | Seasonal Initiative |
| 4 | MET-2607 | Legacy Protocol D | 2023-10-07T15:45:00 | 4 | FAC-2482 | Integrated Model A |

This view joins `performance_metrics` with `success_factors` through the `performance_metrics.success_factor_id` foreign key. It answers: "Which success factor does each performance metric validate?" The result includes the metric's status and the factor's measurement method and impact coefficient. A row might pair metric `MET-2589` (status `on_target`) with factor `FAC-2476` ("Legacy Cluster D", method `structural_equation_modeling`, impact 11.70). This view supports the factor validation lifecycle.

**View `v_performance_metric_decision_maker_detail`**

```sql
CREATE VIEW v_performance_metric_decision_maker_detail AS
SELECT a.id, a.metric_identifier, a.metric_name, b.decision_maker_id AS maker_decision_maker_id, b.stakeholder_identifier AS maker_stakeholder_identifier, b.role_title AS maker_role_title
FROM performance_metrics a
  JOIN metrics_makers j ON j.performance_metric_id = a.id
  JOIN decision_makers b ON b.decision_maker_id = j.decision_maker_id;
```

| id | metric_identifier | metric_name | maker_decision_maker_id | maker_stakeholder_identifier | maker_role_title |
|---|---|---|---|---|---|
| 1 | MET-2589 | Primary Programme A | 100 | STA-2350 | Distributed Standard |
| 1 | MET-2589 | Primary Programme A | 101 | STA-2352 | Adaptive Framework D |
| 2 | MET-2595 | Composite Standard | 101 | STA-2352 | Adaptive Framework D |
| 2 | MET-2595 | Composite Standard | 102 | STA-2354 | Primary Protocol |
| 3 | MET-2601 | Compact Framework | 102 | STA-2354 | Primary Protocol |
| 3 | MET-2601 | Compact Framework | 103 | STA-2356 | Composite Programme |
| 4 | MET-2607 | Legacy Protocol D | 103 | STA-2356 | Composite Programme |
| 4 | MET-2607 | Legacy Protocol D | 100 | STA-2350 | Distributed Standard |

This view joins `performance_metrics` with `decision_makers` through the `decision_makers.performance_metric_id` foreign key. It answers: "Which decision makers are responsible for each performance metric?" The result includes the metric's actual value and the stakeholder's role title and satisfaction score. A row might show metric `MET-2601` (actual 18.35) linked to stakeholder `STA-2354` ("Primary Protocol", satisfaction 9.35). This view supports metric ownership and accountability.

**View `v_performance_metric_analytical_information_system`**

```sql
CREATE VIEW v_performance_metric_analytical_information_system AS
SELECT a.id, a.metric_identifier, a.metric_name, a.measurement_date, b.id AS system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM performance_metrics a JOIN analytical_information_systems b ON a.analytical_information_system_id = b.id;
```

| id | metric_identifier | metric_name | measurement_date | system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|---|
| 1 | MET-2589 | Primary Programme A | 2024-07-01T18:54:00 | 1000 | SYS-2050 | Legacy Programme D |
| 2 | MET-2595 | Composite Standard | 2025-12-12T01:11:00 | 1001 | SYS-2051 | Regional Standard |
| 3 | MET-2601 | Compact Framework | 2022-05-23T08:28:00 | 1002 | SYS-2052 | Seasonal Framework |
| 4 | MET-2607 | Legacy Protocol D | 2023-10-07T15:45:00 | 1003 | SYS-2053 | Integrated Protocol A |

This view joins `performance_metrics` with `analytical_information_systems` through the `performance_metrics.analytical_information_system_id` foreign key. It answers: "Which analytical information system generates each performance metric?" The result includes the metric's measurement date and the system's system type and uptime percentage. A row might pair metric `MET-2607` (measured `2023-10-07T15:45:00`) with system `SYS-2053` ("Integrated Protocol A", type `business_intelligence`, uptime 23.80%). This view supports data lineage and system quality assessment.

The schema presented here demonstrates a deliberate trade-off between normalization and analytical convenience. The six base tables capture the core entities with minimal redundancy, while the seventeen junction tables encode the many-to-many relationships that are intrinsic to the information logistics domain. The twenty-one views then reconstruct the most common analytical joins, allowing downstream tools to query the model without requiring users to understand the underlying join paths. Together, the tables and views form a coherent representation of how strategies, factors, systems, units, and decision makers interact in the fictional enterprise — a model that is both structurally sound and analytically expressive.