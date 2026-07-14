The statutory-agency ecosystem captures how public-sector bodies are governed, resourced, and restructured over time. Each agency carries a statutory reference, a fiscal year, and a consolidation flag; its mission, staffing plan, and administrative unit are linked through foreign keys that anchor the normalized design. Consolidation events—recorded in `consolidation_impacts` and mediated by the many-to-many `impacts_agencies` junction—quantify cost savings, salary reductions, and position-count shifts, while also tying back to the mission statements that define each agency's mandate. The following sections walk through the base tables, the junction that resolves the impact-agency many-to-many, and the twelve materialized views that reconstruct domain facts from the normalized schema.

## The Core Entity Tables

The `statutory_agencies` table is the central hub of the model. Every row represents a distinct public body identified by `agency_identifier` (e.g. `Hinduja Group` or `Arcimoto Inc.`) and `agency_name` (e.g. `FSG Social Impact Advisors` or `Whirlpool Corporation`). The column `parent_department` records the supervisory department such as `compact-parent-98` or `adaptive-parent-101`, while `statutory_reference` (e.g. `legacy-statutor-13`) anchors the legal basis. The `fiscal_year` column (values 17, 20, 23, 26) and the boolean `is_consolidated` flag (true for `Arcimoto Inc.` and `Sa Proton World International N.V.`, false for the others) capture temporal and structural state. Three foreign keys—`staffing_plan_id`, `mission_statement_id`, and `administrative_unit_id`—link each agency to its operational plan, its mission text, and its administrative unit respectively.

**Table `statutory_agencies`**

| id | agency_identifier | agency_name | parent_department | statutory_reference | fiscal_year | is_consolidated | staffing_plan_id | mission_statement_id | administrative_unit_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | compact-parent-98 | legacy-statutor-13 | 17 | false | 100 | 100 | 1 |
| 101 | Arcimoto Inc. | Whirlpool Corporation | composite-parent-99 | compact-statutor-14 | 20 | true | 101 | 101 | 2 |
| 102 | McDonnell Douglas | Education Writers Association | primary-parent-100 | composite-statutor-15 | 23 | false | 102 | 102 | 3 |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | adaptive-parent-101 | primary-statutor-16 | 26 | true | 103 | 103 | 4 |

The `mission_statements` table stores the textual mandate of each agency. The `mission_id` column holds a mix of UUIDs (e.g. `57da7384-8fcc-11eb-924d-9cd76263cbd0`) and short numeric codes (e.g. `82869`). The `mission_text` column contains a human-readable label such as `primary-mission-52` or `adaptive-mission-53`. The `is_subset_of` column (values like `seasonal-is-53`, `regional-is-54`) encodes hierarchical relationships between missions. Boolean flags `requires_specialized_expertise` and the categorical `funding_mechanism` (e.g. `distributed-funding-66`, `baseline-funding-67`) describe operational constraints. The foreign key `statutory_agency_id` ties each mission back to its parent agency.

**Table `mission_statements`**

| id | mission_id | mission_text | is_subset_of | requires_specialized_expertise | funding_mechanism | statutory_agency_id |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | primary-mission-52 | seasonal-is-53 | false | distributed-funding-66 | 100 |
| 101 | 82869 | adaptive-mission-53 | regional-is-54 | true | baseline-funding-67 | 101 |
| 102 | 8928505 | distributed-mission-54 | legacy-is-55 | false | pilot-funding-68 | 102 |
| 103 | 4716411 | baseline-mission-55 | compact-is-56 | true | extended-funding-69 | 103 |

Staffing plans are captured in `staffing_plans`, where each row describes a position or a cluster of positions. The `plan_id` column mixes integers and short codes (e.g. `505977`, `1290`). The `position_title` column holds descriptive labels such as `Extended Model`, `Pilot Cluster A`, `Baseline Review`, and `Distributed Initiative`. The `full_time_equivalent` column (7.20, 9.40, 11.60, 13.80) quantifies headcount in FTE terms, while `salary_range` (e.g. `distributed-salary-96`) provides a categorical salary band. Boolean flags `is_executive` and `requires_specialized_skills` distinguish seniority and skill requirements. The foreign keys `statutory_agency_id` and `administrative_unit_id` link each plan to its owning agency and its host administrative unit.

**Table `staffing_plans`**

| id | plan_id | position_title | full_time_equivalent | salary_range | is_executive | requires_specialized_skills | statutory_agency_id | administrative_unit_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 505977 | Extended Model | 7.20 | distributed-salary-96 | false | true | 100 | 1 |
| 101 | 727038 | Pilot Cluster A | 9.40 | baseline-salary-97 | true | false | 101 | 2 |
| 102 | 937726 | Baseline Review | 11.60 | pilot-salary-98 | false | true | 102 | 3 |
| 103 | 1290 | Distributed Initiative | 13.80 | extended-salary-99 | true | false | 103 | 4 |

The `administrative_units` table models the operational units that house staff and budgets. The `unit_code` column (e.g. `16375765`, `69419`) and `unit_name` column (e.g. `Compact Series`, `Seasonal Corridor`) identify each unit. The `support_type` column takes values `in-house`, `shared`, or `outsourced`. The `staff_count` column (21, 40, 3, 8) and `budget_allocation` column (446.22, 763.46, 12.34, 1,737) quantify resources. Timestamps `created_at` and `updated_at` track lifecycle events. Foreign keys `statutory_agency_id` and `staffing_plan_id` anchor the unit to its parent agency and its associated staffing plan.

**Table `administrative_units`**

| id | unit_code | unit_name | support_type | staff_count | budget_allocation | statutory_agency_id | staffing_plan_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 16375765 | Compact Series | in-house | 21 | 446.22 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 43197173 | Legacy Assessment | shared | 40 | 763.46 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1186104 | Regional Survey A | outsourced | 3 | 12.34 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 69419 | Seasonal Corridor | in-house | 8 | 1,737 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Consolidation events are recorded in `consolidation_impacts`. Each row represents a consolidation action identified by `consolidation_impact_id` (1000–1003) and `impact_id` (a mix of UUIDs and short codes such as `gd_taxc_1123` or `57e54d62-8fcd-11eb-924d-9cd76263cbd0`). The columns `cost_savings` and `salary_savings` quantify financial impact (e.g. 8,753 and 48,467 for impact 1000; 0.22 and 51,001 for impact 1001). The `position_count_change` column (1, 12, 1, 8) records net position shifts. Boolean flags `efficiency_gain`, `requires_new_infrastructure` capture structural implications. The foreign key `mission_statement_id` links the impact to the mission being consolidated, and timestamps `created_at` and `updated_at` track the event lifecycle.

**Table `consolidation_impacts`**

| consolidation_impact_id | impact_id | cost_savings | salary_savings | position_count_change | efficiency_gain | requires_new_infrastructure | mission_statement_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | gd_taxc_1123 | 8,753 | 48,467 | 1 | true | true | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 0.22 | 51,001 | 12 | false | false | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5844275 | 8,598 | 16,639 | 1 | true | true | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 605949 | 9,957 | 4.44 | 8 | false | false | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The many-to-many relationship between consolidation impacts and statutory agencies is resolved by the junction table `impacts_agencies`. Each row pairs a `consolidation_impact_id` with a `statutory_agency_id`, allowing a single consolidation event to affect multiple agencies and vice versa. For example, impact 1000 affects agencies 100 and 101, while impact 1003 affects agencies 103 and 100. This design avoids repeating cost-savings data across agency rows and keeps the impact metrics centralized.

**Table `impacts_agencies`**

| consolidation_impact_id | statutory_agency_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

## Materialized Views: Reconstructing Domain Facts

The twelve views materialize common join patterns so that analysts can query domain facts without writing joins manually. Each view is described below with its join logic and representative rows.

The view `vw_statutory_agency_staffing_plan` joins `statutory_agencies` to `staffing_plans` on `staffing_plan_id`, producing one row per agency with its staffing plan details. For agency 100 (`FSG Social Impact Advisors`), the view returns `plan_id` 505977, `position_title` `Extended Model`, and `full_time_equivalent` 7.20. For agency 101 (`Whirlpool Corporation`), it returns `plan_id` 727038, `position_title` `Pilot Cluster A`, and `full_time_equivalent` 9.40.

**View `vw_statutory_agency_staffing_plan`**

```sql
CREATE VIEW vw_statutory_agency_staffing_plan AS
SELECT a.id, a.agency_identifier, a.agency_name, a.parent_department, b.id AS plan_id, b.plan_id AS plan_plan_id, b.position_title AS plan_position_title
FROM statutory_agencies a JOIN staffing_plans b ON a.staffing_plan_id = b.id;
```

| id | agency_identifier | agency_name | parent_department | plan_id | plan_plan_id | plan_position_title |
|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | compact-parent-98 | 100 | 505977 | Extended Model |
| 101 | Arcimoto Inc. | Whirlpool Corporation | composite-parent-99 | 101 | 727038 | Pilot Cluster A |
| 102 | McDonnell Douglas | Education Writers Association | primary-parent-100 | 102 | 937726 | Baseline Review |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | adaptive-parent-101 | 103 | 1290 | Distributed Initiative |

The view `vw_statutory_agency_mission_statement` joins `statutory_agencies` to `mission_statements` on `mission_statement_id`, surfacing each agency's mission alongside its statutory metadata. Agency 100 (`FSG Social Impact Advisors`) appears with `mission_id` `57da7384-8fcc-11eb-924d-9cd76263cbd0`, `mission_text` `primary-mission-52`, and `funding_mechanism` `distributed-funding-66`. Agency 101 (`Whirlpool Corporation`) appears with `mission_id` `82869`, `mission_text` `adaptive-mission-53`, and `requires_specialized_expertise` true.

**View `vw_statutory_agency_mission_statement`**

```sql
CREATE VIEW vw_statutory_agency_mission_statement AS
SELECT a.id, a.agency_identifier, a.agency_name, a.parent_department, b.id AS statement_id, b.mission_id AS statement_mission_id, b.mission_text AS statement_mission_text
FROM statutory_agencies a JOIN mission_statements b ON a.mission_statement_id = b.id;
```

| id | agency_identifier | agency_name | parent_department | statement_id | statement_mission_id | statement_mission_text |
|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | compact-parent-98 | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | primary-mission-52 |
| 101 | Arcimoto Inc. | Whirlpool Corporation | composite-parent-99 | 101 | 82869 | adaptive-mission-53 |
| 102 | McDonnell Douglas | Education Writers Association | primary-parent-100 | 102 | 8928505 | distributed-mission-54 |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | adaptive-parent-101 | 103 | 4716411 | baseline-mission-55 |

The view `vw_statutory_agency_administrative_unit` joins `statutory_agencies` to `administrative_units` on `administrative_unit_id`, presenting each agency with its operational unit's support type, staff count, and budget. Agency 100 (`FSG Social Impact Advisors`) is paired with `unit_code` `16375765`, `unit_name` `Compact Series`, `support_type` `in-house`, `staff_count` 21, and `budget_allocation` 446.22. Agency 103 (`Switch Card Services Ltd.`) is paired with `unit_code` `69419`, `unit_name` `Seasonal Corridor`, `support_type` `in-house`, `staff_count` 8, and `budget_allocation` 1,737.

**View `vw_statutory_agency_administrative_unit`**

```sql
CREATE VIEW vw_statutory_agency_administrative_unit AS
SELECT a.id, a.agency_identifier, a.agency_name, a.parent_department, b.id AS unit_id, b.unit_code AS unit_unit_code, b.unit_name AS unit_unit_name
FROM statutory_agencies a JOIN administrative_units b ON a.administrative_unit_id = b.id;
```

| id | agency_identifier | agency_name | parent_department | unit_id | unit_unit_code | unit_unit_name |
|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | compact-parent-98 | 1 | 16375765 | Compact Series |
| 101 | Arcimoto Inc. | Whirlpool Corporation | composite-parent-99 | 2 | 43197173 | Legacy Assessment |
| 102 | McDonnell Douglas | Education Writers Association | primary-parent-100 | 3 | 1186104 | Regional Survey A |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | adaptive-parent-101 | 4 | 69419 | Seasonal Corridor |

The view `vw_mission_statement_statutory_agency` reverses the join direction, starting from `mission_statements` and joining to `statutory_agencies`. This orientation is useful when querying from the mission side. Mission `57da7384-8fcc-11eb-924d-9cd76263cbd0` (`primary-mission-52`) resolves to agency 100 (`FSG Social Impact Advisors`) with `parent_department` `compact-parent-98` and `fiscal_year` 17. Mission `82869` (`adaptive-mission-53`) resolves to agency 101 (`Whirlpool Corporation`) with `parent_department` `composite-parent-99` and `fiscal_year` 20.

**View `vw_mission_statement_statutory_agency`**

```sql
CREATE VIEW vw_mission_statement_statutory_agency AS
SELECT a.id, a.mission_id, a.mission_text, a.is_subset_of, b.id AS agency_id, b.agency_identifier AS agency_agency_identifier, b.agency_name AS agency_agency_name
FROM mission_statements a JOIN statutory_agencies b ON a.statutory_agency_id = b.id;
```

| id | mission_id | mission_text | is_subset_of | agency_id | agency_agency_identifier | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | primary-mission-52 | seasonal-is-53 | 100 | Hinduja Group | FSG Social Impact Advisors |
| 101 | 82869 | adaptive-mission-53 | regional-is-54 | 101 | Arcimoto Inc. | Whirlpool Corporation |
| 102 | 8928505 | distributed-mission-54 | legacy-is-55 | 102 | McDonnell Douglas | Education Writers Association |
| 103 | 4716411 | baseline-mission-55 | compact-is-56 | 103 | Sa Proton World International N.V. | Switch Card Services Ltd. |

The view `vw_staffing_plan_statutory_agency` joins `staffing_plans` to `statutory_agencies`, enabling queries that start from a staffing plan and resolve to the owning agency. Plan `505977` (`Extended Model`, FTE 7.20) resolves to agency 100 (`FSG Social Impact Advisors`) with `is_consolidated` false. Plan `727038` (`Pilot Cluster A`, FTE 9.40) resolves to agency 101 (`Whirlpool Corporation`) with `is_consolidated` true.

**View `vw_staffing_plan_statutory_agency`**

```sql
CREATE VIEW vw_staffing_plan_statutory_agency AS
SELECT a.id, a.plan_id, a.position_title, a.full_time_equivalent, b.id AS agency_id, b.agency_identifier AS agency_agency_identifier, b.agency_name AS agency_agency_name
FROM staffing_plans a JOIN statutory_agencies b ON a.statutory_agency_id = b.id;
```

| id | plan_id | position_title | full_time_equivalent | agency_id | agency_agency_identifier | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | 505977 | Extended Model | 7.20 | 100 | Hinduja Group | FSG Social Impact Advisors |
| 101 | 727038 | Pilot Cluster A | 9.40 | 101 | Arcimoto Inc. | Whirlpool Corporation |
| 102 | 937726 | Baseline Review | 11.60 | 102 | McDonnell Douglas | Education Writers Association |
| 103 | 1290 | Distributed Initiative | 13.80 | 103 | Sa Proton World International N.V. | Switch Card Services Ltd. |

The view `vw_staffing_plan_administrative_unit` joins `staffing_plans` to `administrative_units` on `administrative_unit_id`, connecting position plans to their host units. Plan `505977` (`Extended Model`) is linked to unit `16375765` (`Compact Series`, `in-house`, staff count 21). Plan `727038` (`Pilot Cluster A`) is linked to unit `43197173` (`Legacy Assessment`, `shared`, staff count 40).

**View `vw_staffing_plan_administrative_unit`**

```sql
CREATE VIEW vw_staffing_plan_administrative_unit AS
SELECT a.id, a.plan_id, a.position_title, a.full_time_equivalent, b.id AS unit_id, b.unit_code AS unit_unit_code, b.unit_name AS unit_unit_name
FROM staffing_plans a JOIN administrative_units b ON a.administrative_unit_id = b.id;
```

| id | plan_id | position_title | full_time_equivalent | unit_id | unit_unit_code | unit_unit_name |
|---|---|---|---|---|---|---|
| 100 | 505977 | Extended Model | 7.20 | 1 | 16375765 | Compact Series |
| 101 | 727038 | Pilot Cluster A | 9.40 | 2 | 43197173 | Legacy Assessment |
| 102 | 937726 | Baseline Review | 11.60 | 3 | 1186104 | Regional Survey A |
| 103 | 1290 | Distributed Initiative | 13.80 | 4 | 69419 | Seasonal Corridor |

The view `vw_administrative_unit_statutory_agency` joins `administrative_units` to `statutory_agencies`, presenting each unit with its parent agency's metadata. Unit `16375765` (`Compact Series`, `in-house`, budget 446.22) resolves to agency 100 (`FSG Social Impact Advisors`, `compact-parent-98`, fiscal year 17). Unit `43197173` (`Legacy Assessment`, `shared`, budget 763.46) resolves to agency 101 (`Whirlpool Corporation`, `composite-parent-99`, fiscal year 20).

**View `vw_administrative_unit_statutory_agency`**

```sql
CREATE VIEW vw_administrative_unit_statutory_agency AS
SELECT a.id, a.unit_code, a.unit_name, a.support_type, b.id AS agency_id, b.agency_identifier AS agency_agency_identifier, b.agency_name AS agency_agency_name
FROM administrative_units a JOIN statutory_agencies b ON a.statutory_agency_id = b.id;
```

| id | unit_code | unit_name | support_type | agency_id | agency_agency_identifier | agency_agency_name |
|---|---|---|---|---|---|---|
| 1 | 16375765 | Compact Series | in-house | 100 | Hinduja Group | FSG Social Impact Advisors |
| 2 | 43197173 | Legacy Assessment | shared | 101 | Arcimoto Inc. | Whirlpool Corporation |
| 3 | 1186104 | Regional Survey A | outsourced | 102 | McDonnell Douglas | Education Writers Association |
| 4 | 69419 | Seasonal Corridor | in-house | 103 | Sa Proton World International N.V. | Switch Card Services Ltd. |

The view `vw_administrative_unit_staffing_plan` joins `administrative_units` to `staffing_plans`, connecting operational units to their associated position plans. Unit `16375765` (`Compact Series`) is linked to plan `505977` (`Extended Model`, FTE 7.20, `requires_specialized_skills` true). Unit `43197173` (`Legacy Assessment`) is linked to plan `727038` (`Pilot Cluster A`, FTE 9.40, `is_executive` true).

**View `vw_administrative_unit_staffing_plan`**

```sql
CREATE VIEW vw_administrative_unit_staffing_plan AS
SELECT a.id, a.unit_code, a.unit_name, a.support_type, b.id AS plan_id, b.plan_id AS plan_plan_id, b.position_title AS plan_position_title
FROM administrative_units a JOIN staffing_plans b ON a.staffing_plan_id = b.id;
```

| id | unit_code | unit_name | support_type | plan_id | plan_plan_id | plan_position_title |
|---|---|---|---|---|---|---|
| 1 | 16375765 | Compact Series | in-house | 100 | 505977 | Extended Model |
| 2 | 43197173 | Legacy Assessment | shared | 101 | 727038 | Pilot Cluster A |
| 3 | 1186104 | Regional Survey A | outsourced | 102 | 937726 | Baseline Review |
| 4 | 69419 | Seasonal Corridor | in-house | 103 | 1290 | Distributed Initiative |

The view `vw_consolidation_impact_statutory_agency_detail` joins `consolidation_impacts` to `impacts_agencies` and then to `statutory_agencies`, producing a row for each impact-agency pair enriched with the impact's financial metrics. Impact 1000 (`gd_taxc_1123`, cost savings 8,753, salary savings 48,467) affects agency 100 (`FSG Social Impact Advisors`) and agency 101 (`Whirlpool Corporation`). Impact 1001 (`57e54d62-8fcd-11eb-924d-9cd76263cbd0`, cost savings 0.22, salary savings 51,001) affects agency 101 (`Whirlpool Corporation`) and agency 102 (`Education Writers Association`).

**View `vw_consolidation_impact_statutory_agency_detail`**

```sql
CREATE VIEW vw_consolidation_impact_statutory_agency_detail AS
SELECT a.consolidation_impact_id, a.impact_id, a.cost_savings, b.id AS agency_id, b.agency_identifier AS agency_agency_identifier, b.agency_name AS agency_agency_name
FROM consolidation_impacts a
  JOIN impacts_agencies j ON j.consolidation_impact_id = a.consolidation_impact_id
  JOIN statutory_agencies b ON b.id = j.statutory_agency_id;
```

| consolidation_impact_id | impact_id | cost_savings | agency_id | agency_agency_identifier | agency_agency_name |
|---|---|---|---|---|---|
| 1000 | gd_taxc_1123 | 8,753 | 100 | Hinduja Group | FSG Social Impact Advisors |
| 1000 | gd_taxc_1123 | 8,753 | 101 | Arcimoto Inc. | Whirlpool Corporation |
| 1001 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 0.22 | 101 | Arcimoto Inc. | Whirlpool Corporation |
| 1001 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 0.22 | 102 | McDonnell Douglas | Education Writers Association |
| 1002 | 5844275 | 8,598 | 102 | McDonnell Douglas | Education Writers Association |
| 1002 | 5844275 | 8,598 | 103 | Sa Proton World International N.V. | Switch Card Services Ltd. |
| 1003 | 605949 | 9,957 | 103 | Sa Proton World International N.V. | Switch Card Services Ltd. |
| 1003 | 605949 | 9,957 | 100 | Hinduja Group | FSG Social Impact Advisors |

The view `vw_consolidation_impact_mission_statement` joins `consolidation_impacts` to `mission_statements` on `mission_statement_id`, linking each consolidation event to the mission it affects. Impact 1000 (`gd_taxc_1123`, cost savings 8,753) is linked to mission `57da7384-8fcc-11eb-924d-9cd76263cbd0` (`primary-mission-52`, `distributed-funding-66`). Impact 1001 (`57e54d62-8fcd-11eb-924d-9cd76263cbd0`, cost savings 0.22) is linked to mission `82869` (`adaptive-mission-53`, `baseline-funding-67`).

**View `vw_consolidation_impact_mission_statement`**

```sql
CREATE VIEW vw_consolidation_impact_mission_statement AS
SELECT a.consolidation_impact_id, a.impact_id, a.cost_savings, a.salary_savings, b.id AS statement_id, b.mission_id AS statement_mission_id, b.mission_text AS statement_mission_text
FROM consolidation_impacts a JOIN mission_statements b ON a.mission_statement_id = b.id;
```

| consolidation_impact_id | impact_id | cost_savings | salary_savings | statement_id | statement_mission_id | statement_mission_text |
|---|---|---|---|---|---|---|
| 1000 | gd_taxc_1123 | 8,753 | 48,467 | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | primary-mission-52 |
| 1001 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 0.22 | 51,001 | 101 | 82869 | adaptive-mission-53 |
| 1002 | 5844275 | 8,598 | 16,639 | 102 | 8928505 | distributed-mission-54 |
| 1003 | 605949 | 9,957 | 4.44 | 103 | 4716411 | baseline-mission-55 |

## Synthesis

The schema models a statutory-agency domain through six base tables and one junction table, with foreign keys forming a star-like topology around `statutory_agencies`. Each agency row carries three foreign keys that point to its mission, staffing plan, and administrative unit—enforcing a one-to-one operational profile per agency. The `consolidation_impacts` table stands apart as an event log, with the `impacts_agencies` junction resolving the many-to-many relationship between consolidation events and agencies. The twelve views materialize the most common join paths, allowing analysts to query from any entity's perspective—agency, mission, staffing plan, administrative unit, or consolidation impact—without writing joins manually. Together, the base tables and views provide a complete, normalized representation of how public-sector bodies are governed, resourced, and restructured.