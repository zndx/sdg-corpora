## Organizational Governance and Consolidation Analysis

Public-sector and quasi-public organizations operate within a complex matrix of statutory mandates, staffing architectures, and administrative structures. When entities merge, restructure, or consolidate, decision-makers must trace the ripple effects across mission definitions, workforce plans, and operational units. The records below capture that ecosystem: statutory agencies anchor the structure, each carrying a mission statement, a staffing plan, and one or more administrative units. Consolidation events are logged separately and linked to the agencies they touch, enabling analysts to quantify cost savings, position changes, and infrastructure requirements before committing to structural change.

**Table `statutory_agencies`**

| id | agency_identifier | agency_name | parent_department | statutory_reference | fiscal_year | is_consolidated | staffing_plan_id | mission_statement_id | administrative_unit_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | compact-parent-98 | legacy-statutor-13 | 17 | false | 100 | 100 | 1 |
| 101 | Arcimoto Inc. | Whirlpool Corporation | composite-parent-99 | compact-statutor-14 | 20 | true | 101 | 101 | 2 |
| 102 | McDonnell Douglas | Education Writers Association | primary-parent-100 | composite-statutor-15 | 23 | false | 102 | 102 | 3 |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | adaptive-parent-101 | primary-statutor-16 | 26 | true | 103 | 103 | 4 |

The statutory agencies table forms the backbone of the governance model. Each row represents a legally recognized entity identified by a human-readable `agency_identifier` such as *Hinduja Group* or *Arcimoto Inc.*, alongside a formal `agency_name` like *FSG Social Impact Advisors* or *Whirlpool Corporation*. The `parent_department` column places the agency within a broader organizational hierarchy—values range from `compact-parent-98` to `adaptive-parent-101`—while `statutory_reference` provides the regulatory citation, for example `legacy-statutor-13` or `primary-statutor-16`. The `fiscal_year` field (17 through 26) anchors each record to a budget cycle, and the boolean `is_consolidated` flag distinguishes entities that have already undergone structural merger (rows 101 and 103) from those that have not (rows 100 and 102). Foreign keys `staffing_plan_id`, `mission_statement_id`, and `administrative_unit_id` tie each agency to its operational plan, mission definition, and administrative home, respectively.

**Table `mission_statements`**

| id | mission_id | mission_text | is_subset_of | requires_specialized_expertise | funding_mechanism | statutory_agency_id |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | primary-mission-52 | seasonal-is-53 | false | distributed-funding-66 | 100 |
| 101 | 82869 | adaptive-mission-53 | regional-is-54 | true | baseline-funding-67 | 101 |
| 102 | 8928505 | distributed-mission-54 | legacy-is-55 | false | pilot-funding-68 | 102 |
| 103 | 4716411 | baseline-mission-55 | compact-is-56 | true | extended-funding-69 | 103 |

Mission statements give each statutory agency its operational purpose. The `mission_id` column stores a unique identifier—either a UUID such as `57da7384-8fcc-11eb-924d-9cd76263cbd0` or a numeric code like `82869`—while `mission_text` holds a short descriptor such as `primary-mission-52` or `baseline-mission-55`. The `is_subset_of` column expresses hierarchical relationships between missions; for instance, `seasonal-is-53` and `regional-is-54` indicate that one mission nests within another. The boolean `requires_specialized_expertise` flag (true for rows 101 and 103) signals whether the mission demands niche competencies, and `funding_mechanism` describes how the work is financed—`distributed-funding-66`, `baseline-funding-67`, `pilot-funding-68`, and `extended-funding-69` appear across the four records. The `statutory_agency_id` column links each mission back to its parent agency, ensuring that every mission can be traced to a legally accountable entity.

**Table `staffing_plans`**

| id | plan_id | position_title | full_time_equivalent | salary_range | is_executive | requires_specialized_skills | statutory_agency_id | administrative_unit_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 505977 | Extended Model | 7.20 | distributed-salary-96 | false | true | 100 | 1 |
| 101 | 727038 | Pilot Cluster A | 9.40 | baseline-salary-97 | true | false | 101 | 2 |
| 102 | 937726 | Baseline Review | 11.60 | pilot-salary-98 | false | true | 102 | 3 |
| 103 | 1290 | Distributed Initiative | 13.80 | extended-salary-99 | true | false | 103 | 4 |

Staffing plans translate mission requirements into workforce architecture. Each plan carries a `plan_id` (e.g., `505977` for the Extended Model, `1290` for the Distributed Initiative) and a `position_title` that describes the role family. The `full_time_equivalent` (FTE) column quantifies headcount on a continuous scale—values range from 7.20 FTE for the Extended Model to 13.80 FTE for the Distributed Initiative. The `salary_range` column uses coded descriptors such as `distributed-salary-96` or `extended-salary-99`. Boolean flags `is_executive` and `requires_specialized_skills` differentiate leadership positions and specialized roles; notably, the Extended Model and Baseline Review positions require specialized skills, while the Pilot Cluster A and Distributed Initiative positions are classified as executive roles. The `administrative_unit_id` column connects each plan to the operational unit that houses it, and `statutory_agency_id` anchors the plan to its governing agency.

**Table `administrative_units`**

| id | unit_code | unit_name | support_type | staff_count | budget_allocation | statutory_agency_id | staffing_plan_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 16375765 | Compact Series | in-house | 21 | 446.22 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 43197173 | Legacy Assessment | shared | 40 | 763.46 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1186104 | Regional Survey A | outsourced | 3 | 12.34 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 69419 | Seasonal Corridor | in-house | 8 | 1,737 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Administrative units are the operational containers where work gets done. Each unit has a `unit_code` (e.g., `16375765` for Compact Series, `69419` for Seasonal Corridor) and a `unit_name` that provides a human-readable label. The `support_type` column classifies how the unit delivers its function—`in-house`, `shared`, or `outsourced`—with Compact Series and Seasonal Corridor operating in-house, Legacy Assessment as a shared resource, and Regional Survey A as outsourced. The `staff_count` column records headcount (ranging from 3 for Regional Survey A to 40 for Legacy Assessment), and `budget_allocation` captures the unit's financial envelope, from 12.34 for Regional Survey A to 1,737 for Seasonal Corridor. Timestamps `created_at` and `updated_at` track the unit's lifecycle, with entries spanning from January 2025 through April 2025. The `statutory_agency_id` and `staffing_plan_id` columns link each unit to its governing agency and its associated workforce plan.

**Table `consolidation_impacts`**

| consolidation_impact_id | impact_id | cost_savings | salary_savings | position_count_change | efficiency_gain | requires_new_infrastructure | mission_statement_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | gd_taxc_1123 | 8,753 | 48,467 | 1 | true | true | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | 0.22 | 51,001 | 12 | false | false | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5844275 | 8,598 | 16,639 | 1 | true | true | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 605949 | 9,957 | 4.44 | 8 | false | false | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Consolidation events are recorded in the consolidation_impacts table, which quantifies the financial and operational consequences of merging or restructuring agencies. Each impact carries a `consolidation_impact_id` (e.g., `1000` through `1003`) and an `impact_id` that may be a UUID such as `gd_taxc_1123` or a numeric code like `5844275`. The `cost_savings` and `salary_savings` columns measure the monetary benefit of the consolidation—impact 1000 yields 8,753 in cost savings and 48,467 in salary savings, while impact 1003 delivers 9,957 in cost savings but only 4.44 in salary savings. The `position_count_change` column records how many positions are added or removed (values of 1, 12, 1, and 8 across the four impacts). Boolean flags `requires_new_infrastructure` and `mission_statement_id` indicate whether the consolidation demands new facilities and link the impact to the affected mission statement. Timestamps track when each impact was recorded.

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

The impacts_agencies table resolves the many-to-many relationship between consolidation events and statutory agencies. A single consolidation can affect multiple agencies simultaneously. For example, consolidation impact 1000 touches both agency 100 (FSG Social Impact Advisors) and agency 101 (Whirlpool Corporation), while impact 1001 links agencies 101 and 102. Impact 1002 connects agencies 102 and 103, and impact 1003 creates a cross-link between agencies 103 and 100. This junction table enables analysts to answer questions such as "which agencies are affected by a given consolidation?" and "which consolidations involve a particular agency?" without duplicating data in the main consolidation_impacts table.

### Consolidation and Staffing Views

The analytical power of this data model emerges in the joined views, which combine base tables to answer specific operational questions. Each view is designed around a single analytical lens, pulling together the statutory agency's identity with its staffing plan, mission statement, administrative unit, or consolidation impact.

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

This view joins statutory agencies with their staffing plans, answering the question: what workforce plan supports each statutory agency? A row for agency 100 (FSG Social Impact Advisors) would show the Extended Model plan with 7.20 FTE, while agency 103 (Switch Card Services Ltd.) would surface the Distributed Initiative plan at 13.80 FTE. The join ensures that every statutory agency, regardless of its consolidation status, has an associated staffing plan visible in a single query result.

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

By linking statutory agencies to their mission statements, this view answers: what is the operational purpose of each agency? Agency 100's row would display the mission `primary-mission-52` with distributed funding and no specialized expertise requirement, while agency 101's row would show `adaptive-mission-53` requiring specialized expertise and funded through baseline mechanisms. The view makes it straightforward to audit whether every statutory agency has a defined mission and to compare funding mechanisms across the portfolio.

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

This view connects statutory agencies to their administrative units, answering: where does the work physically or functionally reside? Agency 100 maps to the Compact Series unit (in-house support, 21 staff, budget of 446.22), while agency 103 maps to the Seasonal Corridor unit (in-house, 8 staff, budget of 1,737). The view supports capacity planning by surfacing staff counts and budget allocations alongside agency identity, enabling comparisons of operational scale across the statutory portfolio.

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

The inverse of the agency-to-mission view, this perspective starts from the mission statement and asks: which statutory agency owns this mission? This orientation is useful for mission-centric audits, where an analyst begins with a specific mission descriptor—such as `baseline-mission-55`—and traces it back to agency 103 (Switch Card Services Ltd.) to verify accountability and funding alignment.

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

Starting from the staffing plan, this view answers: which statutory agency is responsible for this workforce plan? The Extended Model plan (plan_id 505977) resolves to agency 100, while the Pilot Cluster A plan (plan_id 727038) resolves to agency 101. This orientation supports workforce audits, where a planner begins with a position title or FTE figure and traces it to the governing agency for budgetary or compliance review.

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

This view joins staffing plans with administrative units, answering: which operational unit houses which workforce plan? The Extended Model plan resides in the Compact Series unit (unit_code 16375765), and the Distributed Initiative plan resides in the Seasonal Corridor unit (unit_code 69419). The view supports resource allocation analysis by surfacing the relationship between position-level planning and unit-level execution.

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

Starting from the administrative unit, this view answers: which statutory agency governs this operational unit? The Compact Series unit (support type in-house, 21 staff) maps to agency 100, while the Regional Survey A unit (support type outsourced, 3 staff) maps to agency 102. This orientation is valuable for compliance reviews, where an auditor begins with a specific unit and traces it back to its statutory parent.

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

This view links administrative units to their staffing plans, answering: what workforce plan is executed within each operational unit? The Compact Series unit executes the Extended Model plan at 7.20 FTE, and the Legacy Assessment unit executes the Pilot Cluster A plan at 9.40 FTE. The view supports operational efficiency analysis by comparing FTE levels against unit budgets and staff counts.

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

This view joins consolidation impacts with the statutory agencies they affect, answering: which agencies are impacted by each consolidation event, and what are the financial consequences? Impact 1000 affects agency 100 and yields 8,753 in cost savings and 48,467 in salary savings, while impact 1003 affects agency 103 and yields 9,957 in cost savings but only 4.44 in salary savings. The view surfaces the `requires_new_infrastructure` flag alongside the financial figures, enabling decision-makers to weigh monetary benefits against capital requirements.

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

This view links consolidation impacts to their associated mission statements, answering: which missions are affected by each consolidation? Impact 1000 is tied to mission statement 100 (`primary-mission-52`), impact 1001 to mission statement 101 (`adaptive-mission-53`), and so on. The view ensures that mission-level stakeholders can see the consolidation events that touch their operational mandate, supporting change management and communication planning.

### Synthesis

The data model presented here captures the full lifecycle of organizational governance: from statutory mandate through mission definition, workforce planning, and operational execution, to the financial and structural consequences of consolidation. The base tables establish the entities and their direct relationships, while the junction table `impacts_agencies` resolves the many-to-many connections between consolidation events and the agencies they touch. The views provide analytical lenses that answer specific operational questions without requiring ad-hoc joins, enabling practitioners to audit staffing levels, trace mission accountability, compare administrative unit capacity, and evaluate consolidation impacts in a single query. Together, these records form a coherent reference framework for organizations navigating structural change, where every decision can be traced back to its statutory roots and forward to its operational consequences.