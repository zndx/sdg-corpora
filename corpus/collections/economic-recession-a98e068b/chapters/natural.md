## Economic Recessions and Their Measurement

The study of economic downturns and their downstream effects on vulnerable populations requires a structured approach to tracking both macroeconomic indicators and household-level outcomes. At the foundation of this analytical framework lies the recording of economic recessions—defined periods of significant economic contraction characterized by rising unemployment, declining household incomes, and measurable impacts on child welfare. Each recession event is captured with precise temporal boundaries, severity classifications, and associated state-level impact designations. The records establish a chronological ledger of downturns, each linked to specific child poverty measurements and household income change data, enabling analysts to trace how macroeconomic shocks propagate through family units.

**Table `economic_recessions`**

| economic_recession_id | start_date | end_date | peak_unemployment_rate | affected_states | severity_level | child_poverty_measure_id | household_income_change_id |
|---|---|---|---|---|---|---|---|
| 1000 | 2022-09-05 | 2022-09-01 | 14.20 | legacy-affected-85 | mild | 1 | 1 |
| 1001 | 2023-02-16 | 2023-02-12 | 17.40 | compact-affected-86 | moderate | 2 | 2 |
| 1002 | 2024-07-27 | 2024-07-23 | 20.60 | composite-affected-87 | severe | 3 | 3 |
| 1003 | 2025-12-11 | 2025-12-07 | 23.80 | primary-affected-88 | critical | 4 | 4 |

The recession records span from late 2022 through late 2025, with each entry documenting a distinct economic contraction. Recession 1000, beginning on 2022-09-05 and ending on 2022-09-01, registered a peak unemployment rate of 14.20 percent and was classified as mild, affecting the legacy-affected-85 region. As the timeline progresses, the severity escalates: recession 1001 (moderate, 17.40 percent peak unemployment), recession 1002 (severe, 20.60 percent), and recession 1003 (critical, 23.80 percent). The affected_states field uses coded identifiers—legacy-affected-85, compact-affected-86, composite-affected-87, and primary-affected-88—to denote the geographic scope of each downturn. Each recession is cross-referenced to a child_poverty_measure_id and a household_income_change_id, anchoring the macroeconomic event to micro-level outcomes.

## Child Poverty Measures

Child poverty is quantified through two distinct measurement approaches: private_income, which assesses poverty based on market earnings alone, and after_tax_and_transfer, which accounts for government interventions such as tax credits and cash transfers. These measures are recorded alongside the year of observation, state code, and the household income percentile, providing a multidimensional view of child welfare conditions during each recession period.

**Table `child_poverty_measures`**

| id | measure_type | poverty_rate | year | state_code | household_income_percentile | economic_recession_id | household_id |
|---|---|---|---|---|---|---|---|
| 1 | private_income | 15.45 | 12 | 17788643 | 0.21 | 1000 | 1 |
| 2 | after_tax_and_transfer | 18.90 | 21 | 8350031 | 13.13 | 1001 | 2 |
| 3 | private_income | 22.35 | 30 | 790483 | 89.53 | 1002 | 3 |
| 4 | after_tax_and_transfer | 25.80 | 39 | 8387549 | 9.91 | 1003 | 4 |

Measure 1, recorded in year 12 for state 17788643, shows a private_income poverty rate of 15.45 percent, with the household positioned at the 0.21 income percentile. This measure is tied to recession 1000. Measure 2, from year 21 in state 8350031, reports an after_tax_and_transfer rate of 18.90 percent, with the household at percentile 13.13, linked to recession 1001. The private_income measure for recession 1002 (measure 3) rises to 22.35 percent in year 30 for state 790483, with the household at the 89.53 percentile. Finally, measure 4, an after_tax_and_transfer reading of 25.80 percent in year 39 for state 8387549, corresponds to the critical recession 1003, with the household at the 9.91 percentile. The divergence between private_income and after_tax_and_transfer rates reveals the protective effect—or lack thereof—of social transfers across recession severity levels.

## Household Composition and Income Dynamics

Households serve as the primary unit of analysis for understanding how economic shocks translate into material hardship. Each household record captures demographic structure through total_members and child_count, along with immigrant_status and income_level, providing a snapshot of vulnerability and resilience. Household income changes are tracked separately, recording the direction and magnitude of income shifts, their causal factors, and the measurement period.

**Table `households`**

| household_id | total_members | child_count | immigrant_status | income_level | household_income_change_id | safety_net_program_id |
|---|---|---|---|---|---|---|
| 1 | 31 | 6 | false | 12.74 | 1 | 100 |
| 2 | 77 | 5 | true | 24.09 | 2 | 101 |
| 3 | 2 | 13 | false | 35.57 | 3 | 102 |
| 4 | 20 | 2 | true | 14.31 | 4 | 103 |

Household 1 comprises 31 members with 6 children, is non-immigrant, and reports an income level of 12.74. Household 2, with 77 members and 5 children, has immigrant_status set to true and an income level of 24.09. Household 3 is the smallest in total size with 2 members but has the largest child_count at 13, with an income level of 35.57. Household 4 has 20 members, 2 children, immigrant_status true, and an income level of 14.31. Each household is linked to a specific household_income_change_id and safety_net_program_id, connecting demographic characteristics to economic trajectories and support program participation.

**Table `household_income_changes`**

| household_income_change_id | change_percentage | direction | cause | measurement_period | economic_recession_id | household_id |
|---|---|---|---|---|---|---|
| 1 | 17.45 | increase | regional-cause-42 | 2024-07-11T06:18:00 | 1000 | 1 |
| 2 | 20.90 | decrease | legacy-cause-43 | 2025-12-22T13:35:00 | 1001 | 2 |
| 3 | 24.35 | increase | compact-cause-44 | 2022-05-06T20:52:00 | 1002 | 3 |
| 4 | 27.80 | decrease | composite-cause-45 | 2023-10-17T03:09:00 | 1003 | 4 |

Income change records reveal divergent trajectories across the recession period. Household 1 experienced a 17.45 percent increase, attributed to regional-cause-42, measured on 2024-07-11T06:18:00, during recession 1000. Household 2 saw a 20.90 percent decrease linked to legacy-cause-43, measured on 2025-12-22T13:35:00, during recession 1001. Household 3 recorded a 24.35 percent increase driven by compact-cause-44, measured on 2022-05-06T20:52:00, during recession 1002. Household 4 experienced the largest decline at 27.80 percent, caused by composite-cause-45, measured on 2023-10-17T03:09:00, during recession 1003. The alternating pattern of increases and decreases suggests that household-level responses to recession are heterogeneous, shaped by local economic conditions and individual circumstances.

## Safety Net Programs

Safety net programs provide the institutional response to economic hardship, and their design varies by program_type, eligibility_criteria, and funding_source. The four recorded programs—Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster—represent a spectrum of intervention strategies, from cash assistance to in-kind support and tax credits. Each program is associated with a specific household and child poverty measure, enabling analysts to evaluate how different program structures correlate with poverty outcomes.

**Table `safety_net_programs`**

| id | program_name | program_type | eligibility_criteria | funding_source | household_id | child_poverty_measure_id |
|---|---|---|---|---|---|---|
| 100 | Extended Review | cash | composite-eligibil-57 | baseline-funding-73 | 1 | 1 |
| 101 | Pilot Initiative A | in-kind | primary-eligibil-58 | pilot-funding-74 | 2 | 2 |
| 102 | Baseline Model | tax_credit | adaptive-eligibil-59 | extended-funding-75 | 3 | 3 |
| 103 | Distributed Cluster | cash | distributed-eligibil-60 | integrated-funding-76 | 4 | 4 |

Program 100, Extended Review, is a cash-based program with composite-eligibil-57 criteria and baseline-funding-73 as its funding source, serving household 1 and measure 1. Program 101, Pilot Initiative A, delivers in-kind support under primary-eligibil-58 criteria, funded through pilot-funding-74, and is linked to household 2 and measure 2. Program 102, Baseline Model, operates as a tax_credit program with adaptive-eligibil-59 eligibility and extended-funding-75, serving household 3 and measure 3. Program 103, Distributed Cluster, provides cash assistance under distributed-eligibil-60 criteria with integrated-funding-76, connected to household 4 and measure 4. The variation in program_type and funding_source allows for comparative analysis of which intervention models are most effective under different recession severities.

## Cross-Domain Analytical Views

The analytical power of this framework emerges through joined views that connect recession events to poverty measures, household characteristics, income changes, and safety net participation. Each view answers a specific analytical question by synthesizing data across the base tables.

**View `v_economic_recession_child_poverty_measure`**

```sql
CREATE VIEW v_economic_recession_child_poverty_measure AS
SELECT a.economic_recession_id, a.start_date, a.end_date, a.peak_unemployment_rate, b.id AS measure_id, b.measure_type AS measure_measure_type, b.poverty_rate AS measure_poverty_rate
FROM economic_recessions a JOIN child_poverty_measures b ON a.child_poverty_measure_id = b.id;
```

| economic_recession_id | start_date | end_date | peak_unemployment_rate | measure_id | measure_measure_type | measure_poverty_rate |
|---|---|---|---|---|---|---|
| 1000 | 2022-09-05 | 2022-09-01 | 14.20 | 1 | private_income | 15.45 |
| 1001 | 2023-02-16 | 2023-02-12 | 17.40 | 2 | after_tax_and_transfer | 18.90 |
| 1002 | 2024-07-27 | 2024-07-23 | 20.60 | 3 | private_income | 22.35 |
| 1003 | 2025-12-11 | 2025-12-07 | 23.80 | 4 | after_tax_and_transfer | 25.80 |

This view joins economic_recessions with child_poverty_measures on the child_poverty_measure_id foreign key, producing a direct mapping between recession severity and child poverty rates. The result shows that as peak_unemployment_rate rises from 14.20 to 23.80 across the four recession entries, the corresponding measure_poverty_rate increases from 15.45 to 25.80. For recession 1000 with a 14.20 peak unemployment rate, the private_income measure records a 15.45 percent child poverty rate. For recession 1003, classified as critical with a 23.80 peak unemployment rate, the after_tax_and_transfer measure reaches 25.80 percent. This positive correlation between unemployment severity and child poverty rates underscores the transmission mechanism from macroeconomic distress to family-level deprivation.

**View `v_economic_recession_household_income_change`**

```sql
CREATE VIEW v_economic_recession_household_income_change AS
SELECT a.economic_recession_id, a.start_date, a.end_date, a.peak_unemployment_rate, b.household_income_change_id AS change_household_income_change_id, b.change_percentage AS change_change_percentage, b.direction AS change_direction
FROM economic_recessions a JOIN household_income_changes b ON a.household_income_change_id = b.household_income_change_id;
```

| economic_recession_id | start_date | end_date | peak_unemployment_rate | change_household_income_change_id | change_change_percentage | change_direction |
|---|---|---|---|---|---|---|
| 1000 | 2022-09-05 | 2022-09-01 | 14.20 | 1 | 17.45 | increase |
| 1001 | 2023-02-16 | 2023-02-12 | 17.40 | 2 | 20.90 | decrease |
| 1002 | 2024-07-27 | 2024-07-23 | 20.60 | 3 | 24.35 | increase |
| 1003 | 2025-12-11 | 2025-12-07 | 23.80 | 4 | 27.80 | decrease |

This view links economic_recessions to household_income_changes, revealing how income trajectories respond to recession conditions. The join produces rows that pair each recession's temporal and severity data with the corresponding household income change percentage, direction, and cause. Recession 1000 (mild, 14.20 peak unemployment) is associated with a 17.45 percent income increase driven by regional-cause-42. Recession 1001 (moderate, 17.40 peak unemployment) corresponds to a 20.90 percent decrease caused by legacy-cause-43. Recession 1002 (severe, 20.60 peak unemployment) aligns with a 24.35 percent increase from compact-cause-44. Recession 1003 (critical, 23.80 peak unemployment) matches a 27.80 percent decrease attributed to composite-cause-45. The alternating directions of income change across recession severity levels indicate that household income responses are not uniformly negative during downturns, suggesting that local economic conditions and household-specific factors mediate the impact of recession.

**View `v_child_poverty_measure_economic_recession`**

```sql
CREATE VIEW v_child_poverty_measure_economic_recession AS
SELECT a.id, a.measure_type, a.poverty_rate, a.year, b.economic_recession_id AS recession_economic_recession_id, b.start_date AS recession_start_date, b.end_date AS recession_end_date
FROM child_poverty_measures a JOIN economic_recessions b ON a.economic_recession_id = b.economic_recession_id;
```

| id | measure_type | poverty_rate | year | recession_economic_recession_id | recession_start_date | recession_end_date |
|---|---|---|---|---|---|---|
| 1 | private_income | 15.45 | 12 | 1000 | 2022-09-05 | 2022-09-01 |
| 2 | after_tax_and_transfer | 18.90 | 21 | 1001 | 2023-02-16 | 2023-02-12 |
| 3 | private_income | 22.35 | 30 | 1002 | 2024-07-27 | 2024-07-23 |
| 4 | after_tax_and_transfer | 25.80 | 39 | 1003 | 2025-12-11 | 2025-12-07 |

This view reverses the join direction, starting from child_poverty_measures and linking to economic_recessions through the economic_recession_id foreign key. It answers the question of which recession conditions correspond to each poverty measurement. Measure 1 (private_income, 15.45 percent rate, year 12, state 17788643) connects to recession 1000 with a 14.20 peak unemployment rate. Measure 2 (after_tax_and_transfer, 18.90 percent, year 21, state 8350031) links to recession 1001 at 17.40 percent peak unemployment. Measure 3 (private_income, 22.35 percent, year 30, state 790483) maps to recession 1002 at 20.60 percent. Measure 4 (after_tax_and_transfer, 25.80 percent, year 39, state 8387549) corresponds to recession 1003 at 23.80 percent. This perspective is useful for poverty analysts who begin with a poverty rate observation and seek to contextualize it within the broader recession environment.

**View `v_child_poverty_measure_household`**

```sql
CREATE VIEW v_child_poverty_measure_household AS
SELECT a.id, a.measure_type, a.poverty_rate, a.year, b.household_id AS household_household_id, b.total_members AS household_total_members, b.child_count AS household_child_count
FROM child_poverty_measures a JOIN households b ON a.household_id = b.household_id;
```

| id | measure_type | poverty_rate | year | household_household_id | household_total_members | household_child_count |
|---|---|---|---|---|---|---|
| 1 | private_income | 15.45 | 12 | 1 | 31 | 6 |
| 2 | after_tax_and_transfer | 18.90 | 21 | 2 | 77 | 5 |
| 3 | private_income | 22.35 | 30 | 3 | 2 | 13 |
| 4 | after_tax_and_transfer | 25.80 | 39 | 4 | 20 | 2 |

This view connects child_poverty_measures to households via the household_id foreign key, enabling analysts to examine the demographic context of each poverty measurement. Measure 1 (private_income, 15.45 percent) is associated with household 1, which has 31 members, 6 children, non-immigrant status, and an income level of 12.74. Measure 2 (after_tax_and_transfer, 18.90 percent) links to household 2, comprising 77 members, 5 children, immigrant status, and an income level of 24.09. Measure 3 (private_income, 22.35 percent) connects to household 3, with 2 total members, 13 children, non-immigrant status, and an income level of 35.57. Measure 4 (after_tax_and_transfer, 25.80 percent) maps to household 4, which has 20 members, 2 children, immigrant status, and an income level of 14.31. The view reveals that higher child poverty rates do not necessarily correlate with lower household income levels; for instance, household 3 has the highest income level at 35.57 yet is associated with a 22.35 percent child poverty rate, suggesting that child_count and household composition may be significant confounding factors.

**View `v_household_household_income_change`**

```sql
CREATE VIEW v_household_household_income_change AS
SELECT a.household_id, a.total_members, a.child_count, a.immigrant_status, b.household_income_change_id AS change_household_income_change_id, b.change_percentage AS change_change_percentage, b.direction AS change_direction
FROM households a JOIN household_income_changes b ON a.household_income_change_id = b.household_income_change_id;
```

| household_id | total_members | child_count | immigrant_status | change_household_income_change_id | change_change_percentage | change_direction |
|---|---|---|---|---|---|---|
| 1 | 31 | 6 | false | 1 | 17.45 | increase |
| 2 | 77 | 5 | true | 2 | 20.90 | decrease |
| 3 | 2 | 13 | false | 3 | 24.35 | increase |
| 4 | 20 | 2 | true | 4 | 27.80 | decrease |

This view joins households with household_income_changes on the household_income_change_id foreign key, providing a unified record of household demographics alongside their income trajectory. Household 1 (31 members, 6 children, non-immigrant, income level 12.74) is paired with a 17.45 percent income increase from regional-cause-42. Household 2 (77 members, 5 children, immigrant, income level 24.09) is paired with a 20.90 percent decrease from legacy-cause-43. Household 3 (2 members, 13 children, non-immigrant, income level 35.57) is paired with a 24.35 percent increase from compact-cause-44. Household 4 (20 members, 2 children, immigrant, income level 14.31) is paired with a 27.80 percent decrease from composite-cause-45. This joined perspective is essential for identifying whether household characteristics such as immigrant_status or child_count predict income change direction.

**View `v_household_safety_net_program`**

```sql
CREATE VIEW v_household_safety_net_program AS
SELECT a.household_id, a.total_members, a.child_count, a.immigrant_status, b.id AS program_id, b.program_name AS program_program_name, b.program_type AS program_program_type
FROM households a JOIN safety_net_programs b ON a.safety_net_program_id = b.id;
```

| household_id | total_members | child_count | immigrant_status | program_id | program_program_name | program_program_type |
|---|---|---|---|---|---|---|
| 1 | 31 | 6 | false | 100 | Extended Review | cash |
| 2 | 77 | 5 | true | 101 | Pilot Initiative A | in-kind |
| 3 | 2 | 13 | false | 102 | Baseline Model | tax_credit |
| 4 | 20 | 2 | true | 103 | Distributed Cluster | cash |

This view links households to safety_net_programs through the safety_net_program_id foreign key, showing which program each household participates in. Household 1 (31 members, 6 children, income level 12.74) participates in Extended Review (program 100), a cash program with composite-eligibil-57 criteria. Household 2 (77 members, 5 children, immigrant, income level 24.09) participates in Pilot Initiative A (program 101), an in-kind program with primary-eligibil-58 criteria. Household 3 (2 members, 13 children, income level 35.57) participates in Baseline Model (program 102), a tax_credit program with adaptive-eligibil-59 criteria. Household 4 (20 members, 2 children, immigrant, income level 14.31) participates in Distributed Cluster (program 103), a cash program with distributed-eligibil-60 criteria. The view enables evaluation of whether certain program types are more prevalent among households with specific demographic profiles.

**View `v_safety_net_program_household`**

```sql
CREATE VIEW v_safety_net_program_household AS
SELECT a.id, a.program_name, a.program_type, a.eligibility_criteria, b.household_id AS household_household_id, b.total_members AS household_total_members, b.child_count AS household_child_count
FROM safety_net_programs a JOIN households b ON a.household_id = b.household_id;
```

| id | program_name | program_type | eligibility_criteria | household_household_id | household_total_members | household_child_count |
|---|---|---|---|---|---|---|
| 100 | Extended Review | cash | composite-eligibil-57 | 1 | 31 | 6 |
| 101 | Pilot Initiative A | in-kind | primary-eligibil-58 | 2 | 77 | 5 |
| 102 | Baseline Model | tax_credit | adaptive-eligibil-59 | 3 | 2 | 13 |
| 103 | Distributed Cluster | cash | distributed-eligibil-60 | 4 | 20 | 2 |

This view reverses the household-to-program join, starting from safety_net_programs and linking to households. It answers the question of which households are served by each program. Program 100 (Extended Review, cash, composite-eligibil-57, baseline-funding-73) serves household 1, which has 31 members, 6 children, non-immigrant status, and income level 12.74. Program 101 (Pilot Initiative A, in-kind, primary-eligibil-58, pilot-funding-74) serves household 2, with 77 members, 5 children, immigrant status, and income level 24.09. Program 102 (Baseline Model, tax_credit, adaptive-eligibil-59, extended-funding-75) serves household 3, with 2 members, 13 children, non-immigrant status, and income level 35.57. Program 103 (Distributed Cluster, cash, distributed-eligibil-60, integrated-funding-76) serves household 4, with 20 members, 2 children, immigrant status, and income level 14.31. This perspective is valuable for program administrators assessing the demographic reach of their interventions.

**View `v_safety_net_program_child_poverty_measure`**

```sql
CREATE VIEW v_safety_net_program_child_poverty_measure AS
SELECT a.id, a.program_name, a.program_type, a.eligibility_criteria, b.id AS measure_id, b.measure_type AS measure_measure_type, b.poverty_rate AS measure_poverty_rate
FROM safety_net_programs a JOIN child_poverty_measures b ON a.child_poverty_measure_id = b.id;
```

| id | program_name | program_type | eligibility_criteria | measure_id | measure_measure_type | measure_poverty_rate |
|---|---|---|---|---|---|---|
| 100 | Extended Review | cash | composite-eligibil-57 | 1 | private_income | 15.45 |
| 101 | Pilot Initiative A | in-kind | primary-eligibil-58 | 2 | after_tax_and_transfer | 18.90 |
| 102 | Baseline Model | tax_credit | adaptive-eligibil-59 | 3 | private_income | 22.35 |
| 103 | Distributed Cluster | cash | distributed-eligibil-60 | 4 | after_tax_and_transfer | 25.80 |

This view connects safety_net_programs to child_poverty_measures through the child_poverty_measure_id foreign key, enabling analysts to evaluate whether participation in specific programs correlates with particular poverty measurement outcomes. Program 100 (Extended Review, cash) is linked to measure 1 (private_income, 15.45 percent rate, year 12, state 17788643). Program 101 (Pilot Initiative A, in-kind) connects to measure 2 (after_tax_and_transfer, 18.90 percent, year 21, state 8350031). Program 102 (Baseline Model, tax_credit) links to measure 3 (private_income, 22.35 percent, year 30, state 790483). Program 103 (Distributed Cluster, cash) connects to measure 4 (after_tax_and_transfer, 25.80 percent, year 39, state 8387549). The view allows comparison of poverty rates across program types, revealing that cash programs (100 and 103) are associated with both the lowest (15.45) and highest (25.80) poverty rates, while in-kind (18.90) and tax_credit (22.35) programs fall in between.

**View `v_household_income_change_economic_recession`**

```sql
CREATE VIEW v_household_income_change_economic_recession AS
SELECT a.household_income_change_id, a.change_percentage, a.direction, a.cause, b.economic_recession_id AS recession_economic_recession_id, b.start_date AS recession_start_date, b.end_date AS recession_end_date
FROM household_income_changes a JOIN economic_recessions b ON a.economic_recession_id = b.economic_recession_id;
```

| household_income_change_id | change_percentage | direction | cause | recession_economic_recession_id | recession_start_date | recession_end_date |
|---|---|---|---|---|---|---|
| 1 | 17.45 | increase | regional-cause-42 | 1000 | 2022-09-05 | 2022-09-01 |
| 2 | 20.90 | decrease | legacy-cause-43 | 1001 | 2023-02-16 | 2023-02-12 |
| 3 | 24.35 | increase | compact-cause-44 | 1002 | 2024-07-27 | 2024-07-23 |
| 4 | 27.80 | decrease | composite-cause-45 | 1003 | 2025-12-11 | 2025-12-07 |

This view joins household_income_changes with economic_recessions on the economic_recession_id foreign key, providing a direct mapping between recession conditions and household income outcomes. The result pairs each recession's severity and temporal data with the corresponding income change percentage, direction, and cause. Recession 1000 (mild, 14.20 peak unemployment, legacy-affected-85) is associated with a 17.45 percent income increase from regional-cause-42. Recession 1001 (moderate, 17.40 peak unemployment, compact-affected-86) corresponds to a 20.90 percent decrease from legacy-cause-43. Recession 1002 (severe, 20.60 peak unemployment, composite-affected-87) aligns with a 24.35 percent increase from compact-cause-44. Recession 1003 (critical, 23.80 peak unemployment, primary-affected-88) matches a 27.80 percent decrease from composite-cause-45. This view is particularly useful for forecasting household income responses under different recession severity scenarios.

**View `v_household_income_change_household`**

```sql
CREATE VIEW v_household_income_change_household AS
SELECT a.household_income_change_id, a.change_percentage, a.direction, a.cause, b.household_id AS household_household_id, b.total_members AS household_total_members, b.child_count AS household_child_count
FROM household_income_changes a JOIN households b ON a.household_id = b.household_id;
```

| household_income_change_id | change_percentage | direction | cause | household_household_id | household_total_members | household_child_count |
|---|---|---|---|---|---|---|
| 1 | 17.45 | increase | regional-cause-42 | 1 | 31 | 6 |
| 2 | 20.90 | decrease | legacy-cause-43 | 2 | 77 | 5 |
| 3 | 24.35 | increase | compact-cause-44 | 3 | 2 | 13 |
| 4 | 27.80 | decrease | composite-cause-45 | 4 | 20 | 2 |

This view links household_income_changes to households via the household_id foreign key, combining income trajectory data with household demographic characteristics. Income change 1 (17.45 percent increase, regional-cause-42, measured 2024-07-11T06:18:00) is associated with household 1 (31 members, 6 children, non-immigrant, income level 12.74). Income change 2 (20.90 percent decrease, legacy-cause-43, measured 2025-12-22T13:35:00) links to household 2 (77 members, 5 children, immigrant, income level 24.09). Income change 3 (24.35 percent increase, compact-cause-44, measured 2022-05-06T20:52:00) connects to household 3 (2 members, 13 children, non-immigrant, income level 35.57). Income change 4 (27.80 percent decrease, composite-cause-45, measured 2023-10-17T03:09:00) maps to household 4 (20 members, 2 children, immigrant, income level 14.31). This joined perspective enables analysts to test whether household size, child count, or immigrant status predicts the direction and magnitude of income changes during recession periods.

## Synthesis

The analytical framework presented here integrates five interconnected data domains—economic recessions, child poverty measures, household demographics, safety net programs, and household income changes—into a cohesive structure for studying the propagation of macroeconomic shocks through family-level outcomes. The base tables establish the foundational records, while the analytical views synthesize these records into actionable insights. The data reveal that child poverty rates increase with recession severity, that household income responses to recession are heterogeneous rather than uniformly negative, and that safety net program participation varies across household types. The cross-domain joins enable analysts to move fluidly between perspectives: from recession to poverty, from household to income change, and from program to outcome. This multi-layered approach supports evidence-based policy evaluation and helps identify which households and which program designs offer the greatest protection during periods of economic contraction.