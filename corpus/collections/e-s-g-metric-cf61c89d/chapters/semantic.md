## The ESG Reporting Data Model

Environmental, Social, and Governance (ESG) reporting sits at the intersection of regulatory compliance, strategic planning, and independent advisory oversight. An organization must track discrete metrics across environmental, social, and governance categories; record time-stamped measurements against those metrics; compile those measurements into formal reports; align reports and metrics to long-term strategies; and attribute every action to the advisors who guide the process. Policy changes issued by external jurisdictions further perturb the model, linking back to strategies, measurements, and advisors. The relational schema below captures this ecosystem in a normalized form, with junction tables resolving many-to-many associations and a suite of views reconstructing the domain facts that analysts and auditors need.

**Table `e_s_g_metrics`**

| id | metric_id | metric_name | standard_framework | category | unit_of_measure | is_material | report_id | e_s_g_measurement_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 9085244 | Regional Model | SASB | Environmental | regional-unit-48 | false | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 1000 |
| 1001 | 48104239 | Seasonal Cluster D | GRI | Social | legacy-unit-49 | true | 605942 | 1001 |
| 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review | TCFD | Governance | compact-unit-50 | false | 974942 | 1002 |
| 1003 | 3717637 | Extended Initiative | CDP | Environmental | composite-unit-51 | true | account_pymes_2495 | 1003 |

The `e_s_g_metrics` table is the conceptual anchor of the model. Each row represents a single ESG metric identified by a surrogate primary key `id` (values 1000–1003) and a business-level `metric_id` (for example, `9085244` or the opaque identifier `ChIJuSfgq4Ft5kcRs4OLDD3ht_s`). The `metric_name` column carries human-readable labels such as *Regional Model*, *Seasonal Cluster D*, *Integrated Review*, and *Extended Initiative*. The `standard_framework` column constrains the metric to a recognized reporting standard—SASB, GRI, TCFD, or CDP—while `category` classifies it as Environmental, Social, or Governance. The `unit_of_measure` column stores descriptive units like `regional-unit-48` or `compact-unit-50`, and `is_material` is a boolean flag indicating whether the metric is material to the organization's impact assessment. Two foreign keys, `report_id` and `e_s_g_measurement_id`, link the metric to its parent report and to a measurement record, respectively. The UUID `46d50e78-8fcc-11eb-924d-9cd76263cbd0` in the first row, for instance, points to the report titled *Composite Programme*.

**Table `e_s_g_measurements`**

| id | measurement_id | measurement_date | numeric_value | status | data_source | e_s_g_metric_id | e_s_g_advisor_id |
|---|---|---|---|---|---|---|---|
| 1000 | 7731885 | 2023-02-07T01:39:00 | 22.45 | pending | baseline-data-85 | 1000 | 1 |
| 1001 | 739 | 2024-07-18T08:56:00 | 26.90 | in_progress | pilot-data-86 | 1001 | 2 |
| 1002 | 10782183 | 2025-12-02T15:13:00 | 31.35 | verified | extended-data-87 | 1002 | 3 |
| 1003 | 325466 | 2022-05-13T22:30:00 | 35.80 | archived | integrated-data-88 | 1003 | 4 |

Measurements capture the temporal dimension of ESG tracking. The `e_s_g_measurements` table stores each observation with its own surrogate `id`, a business `measurement_id`, and a `measurement_date` timestamp (e.g., `2023-02-07T01:39:00` or `2024-07-18T08:56:00`). The `numeric_value` column holds the quantitative reading—`22.45`, `26.90`, `31.35`, `35.80` in the sample data—while `status` records the lifecycle stage of the measurement: `pending`, `in_progress`, `verified`, or `archived`. The `data_source` column identifies provenance, with values such as `baseline-data-85` and `pilot-data-86`. Two foreign keys anchor each measurement: `e_s_g_metric_id` references the metric being measured, and `e_s_g_advisor_id` attributes the measurement to a specific advisor. This dual foreign-key design ensures that every numeric observation is traceable to both the metric definition and the advisor responsible for its collection.

**Table `e_s_g_reports`**

| report_id | report_title | publication_date | reporting_period_start | reporting_period_end | compliance_status | e_s_g_advisor_id | e_s_g_strategy_id |
|---|---|---|---|---|---|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | Composite Programme | 2024-03-01 | 2023-02-01 | 2024-07-27 | compliant | 1 | 1 |
| 605942 | Compact Standard A | 2025-08-12 | 2024-07-12 | 2025-12-11 | non_compliant | 2 | 2 |
| 974942 | Legacy Framework | 2022-01-23 | 2025-12-23 | 2022-05-22 | partial | 3 | 3 |
| account_pymes_2495 | Regional Protocol | 2023-06-07 | 2022-05-07 | 2023-10-06 | compliant | 4 | 4 |

Reports aggregate metrics and measurements into formal compliance documents. The `e_s_g_reports` table uses `report_id` as its primary key, which is a UUID in the sample data (`46d50e78-8fcc-11eb-924d-9cd76263cbd0`, `605942`, `974942`, `account_pymes_2495`). The `report_title` column carries descriptive names like *Composite Programme*, *Compact Standard A*, *Legacy Framework*, and *Regional Protocol*. Temporal scope is captured by `publication_date`, `reporting_period_start`, and `reporting_period_end`. The `compliance_status` column constrains the report to one of three states: `compliant`, `non_compliant`, or `partial`. Foreign keys `e_s_g_advisor_id` and `e_s_g_strategy_id` link the report to the advisor who prepared it and to the strategy it supports.

**Table `e_s_g_strategies`**

| e_s_g_strategy_id | strategy_id | strategy_name | target_year | status | alignment_framework | e_s_g_advisor_id | policy_change_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | 19508914 | Integrated Protocol A | 36 | draft | SASB | 1 | state_uk_12 |
| 2 | id_5 | Extended Programme | 39 | approved | UN_SDGs | 2 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 324 | Pilot Standard | 42 | active | Paris_Agreement | 3 | 790477 |
| 4 | 3990169 | Baseline Framework D | 45 | retired | SASB | 4 | ChIJz6W-s4Ft5kcR8_b70o-7EeU |

Strategies represent the long-term ESG planning horizon. The `e_s_g_strategies` table uses `e_s_g_strategy_id` as its surrogate primary key (values 1–4) and `strategy_id` as a business identifier (`19508914`, `id_5`, `324`, `3990169`). The `strategy_name` column holds labels such as *Integrated Protocol A*, *Extended Programme*, *Pilot Standard*, and *Baseline Framework D*. The `target_year` column stores an integer offset (36, 39, 42, 45), while `status` constrains the strategy to `draft`, `approved`, `active`, or `retired`. The `alignment_framework` column mirrors the metric-level standard, with values SASB, UN_SDGs, and Paris_Agreement. Foreign keys `e_s_g_advisor_id` and `policy_change_policy_id` link the strategy to its overseeing advisor and to an external policy change.

**Table `policy_changes`**

| policy_id | policy_title | issuing_jurisdiction | effective_date | impact_level | e_s_g_strategy_id | e_s_g_measurement_id | e_s_g_advisor_id |
|---|---|---|---|---|---|---|---|
| state_uk_12 | Seasonal Initiative | British_Columbia | 2025-04-08 | low | 1 | 1000 | 1 |
| ca398dba-8fcd-11eb-924d-9cd76263cbd0 | Integrated Model | Federal_Canada | 2022-09-19 | medium | 2 | 1001 | 2 |
| 790477 | Extended Cluster D | International | 2023-02-03 | high | 3 | 1002 | 3 |
| ChIJz6W-s4Ft5kcR8_b70o-7EeU | Pilot Review | British_Columbia | 2024-07-14 | low | 4 | 1003 | 4 |

Policy changes capture external regulatory events that influence the ESG program. The `policy_changes` table uses `policy_id` as its primary key, with values ranging from jurisdictional identifiers like `state_uk_12` to UUIDs such as `ca398dba-8fcd-11eb-924d-9cd76263cbd0`. The `policy_title` column carries names like *Seasonal Initiative*, *Integrated Model*, *Extended Cluster D*, and *Pilot Review*. The `issuing_jurisdiction` column records the source—`British_Columbia`, `Federal_Canada`, or `International`—while `effective_date` and `impact_level` (constrained to `low`, `medium`, or `high`) describe the timing and severity of the change. Three foreign keys (`e_s_g_strategy_id`, `e_s_g_measurement_id`, `e_s_g_advisor_id`) tie each policy change to the strategy it affects, the measurement it influences, and the advisor who monitors it.

**Table `e_s_g_advisors`**

| e_s_g_advisor_id | advisor_id | advisor_name | designation | years_experience | employment_status | e_s_g_strategy_id | report_id | e_s_g_measurement_id | policy_change_policy_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 394 | Regional Cluster | CPA | 43 | full_time | 1 | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 1000 | state_uk_12 |
| 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D | Sustainability_Certificate | 51 | part_time | 2 | 605942 | 1001 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 2639 | Integrated Initiative | None | 59 | contract | 3 | 974942 | 1002 | 790477 |
| 4 | 10445628 | Extended Model | CPA | 67 | full_time | 4 | account_pymes_2495 | 1003 | ChIJz6W-s4Ft5kcR8_b70o-7EeU |

Advisors are the human (or organizational) actors in the ESG ecosystem. The `e_s_g_advisors` table uses `e_s_g_advisor_id` as its surrogate key (values 1–4) and `advisor_id` as a business identifier (`394`, `08e6797f50d24712a390755cb1a3b36f`, `2639`, `10445628`). The `advisor_name` column holds labels such as *Regional Cluster*, *Seasonal Review D*, *Integrated Initiative*, and *Extended Model*. The `designation` column records professional credentials (CPA, Sustainability_Certificate, or None), `years_experience` stores an integer (43, 51, 59, 67), and `employment_status` constrains the engagement to `full_time`, `part_time`, or `contract`. Four foreign keys (`e_s_g_strategy_id`, `report_id`, `e_s_g_measurement_id`, `policy_change_policy_id`) link each advisor to the strategy, report, measurement, and policy change they oversee.

**Table `reports_metrics`**

| report_id | e_s_g_metric_id |
|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 1000 |
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 1001 |
| 605942 | 1001 |
| 605942 | 1002 |
| 974942 | 1002 |
| 974942 | 1003 |
| account_pymes_2495 | 1003 |
| account_pymes_2495 | 1000 |

The `reports_metrics` junction table resolves the many-to-many relationship between reports and metrics. A report may reference multiple metrics, and a metric may appear in multiple reports. This table exists to decouple the direct foreign keys that would otherwise create circular dependencies between `e_s_g_reports` and `e_s_g_metrics`.

**Table `strategies_metrics`**

| e_s_g_strategy_id | e_s_g_metric_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Similarly, `strategies_metrics` resolves the many-to-many relationship between strategies and metrics. A strategy may encompass multiple metrics, and a metric may be aligned to multiple strategies. This junction table prevents circular foreign-key constraints between `e_s_g_strategies` and `e_s_g_metrics`.

**View `vw_e_s_g_metric_e_s_g_report`**

```sql
CREATE VIEW vw_e_s_g_metric_e_s_g_report AS
SELECT a.id, a.metric_id, a.metric_name, a.standard_framework, b.report_id AS report_report_id, b.report_title AS report_report_title, b.publication_date AS report_publication_date
FROM e_s_g_metrics a JOIN e_s_g_reports b ON a.report_id = b.report_id;
```

| id | metric_id | metric_name | standard_framework | report_report_id | report_report_title | report_publication_date |
|---|---|---|---|---|---|---|
| 1000 | 9085244 | Regional Model | SASB | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | Composite Programme | 2024-03-01 |
| 1001 | 48104239 | Seasonal Cluster D | GRI | 605942 | Compact Standard A | 2025-08-12 |
| 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review | TCFD | 974942 | Legacy Framework | 2022-01-23 |
| 1003 | 3717637 | Extended Initiative | CDP | account_pymes_2495 | Regional Protocol | 2023-06-07 |

The view `vw_e_s_g_metric_e_s_g_report` joins `e_s_g_metrics` to `e_s_g_reports` on the `report_id` foreign key, answering the question: *Which metrics belong to which reports?* The first row reveals that the metric *Regional Model* (id 1000, framework SASB) is associated with the report *Composite Programme* (UUID `46d50e78-8fcc-11eb-924d-9cd76263cbd0`, status `compliant`). This join reconstructs the metric-to-report assignment that is stored as a direct foreign key in `e_s_g_metrics`.

**View `vw_e_s_g_metric_e_s_g_measurement`**

```sql
CREATE VIEW vw_e_s_g_metric_e_s_g_measurement AS
SELECT a.id, a.metric_id, a.metric_name, a.standard_framework, b.id AS measurement_id, b.measurement_id AS measurement_measurement_id, b.measurement_date AS measurement_measurement_date
FROM e_s_g_metrics a JOIN e_s_g_measurements b ON a.e_s_g_measurement_id = b.id;
```

| id | metric_id | metric_name | standard_framework | measurement_id | measurement_measurement_id | measurement_measurement_date |
|---|---|---|---|---|---|---|
| 1000 | 9085244 | Regional Model | SASB | 1000 | 7731885 | 2023-02-07T01:39:00 |
| 1001 | 48104239 | Seasonal Cluster D | GRI | 1001 | 739 | 2024-07-18T08:56:00 |
| 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review | TCFD | 1002 | 10782183 | 2025-12-02T15:13:00 |
| 1003 | 3717637 | Extended Initiative | CDP | 1003 | 325466 | 2022-05-13T22:30:00 |

The view `vw_e_s_g_metric_e_s_g_measurement` joins `e_s_g_metrics` to `e_s_g_measurements` on `e_s_g_metric_id`, answering: *What measurements have been recorded for each metric?* The first row pairs the metric *Regional Model* (id 1000) with the measurement dated `2023-02-07T01:39:00` carrying a `numeric_value` of `22.45` and status `pending`. This join materializes the metric-measurement association stored as a foreign key in `e_s_g_measurements`.

**View `vw_e_s_g_measurement_e_s_g_metric`**

```sql
CREATE VIEW vw_e_s_g_measurement_e_s_g_metric AS
SELECT a.id, a.measurement_id, a.measurement_date, a.numeric_value, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name
FROM e_s_g_measurements a JOIN e_s_g_metrics b ON a.e_s_g_metric_id = b.id;
```

| id | measurement_id | measurement_date | numeric_value | metric_id | metric_metric_id | metric_metric_name |
|---|---|---|---|---|---|---|
| 1000 | 7731885 | 2023-02-07T01:39:00 | 22.45 | 1000 | 9085244 | Regional Model |
| 1001 | 739 | 2024-07-18T08:56:00 | 26.90 | 1001 | 48104239 | Seasonal Cluster D |
| 1002 | 10782183 | 2025-12-02T15:13:00 | 31.35 | 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review |
| 1003 | 325466 | 2022-05-13T22:30:00 | 35.80 | 1003 | 3717637 | Extended Initiative |

The view `vw_e_s_g_measurement_e_s_g_metric` performs the same join as the previous view but from the measurement side, answering: *Which metric does each measurement belong to?* The first row shows that measurement id 1000 (value `22.45`, source `baseline-data-85`) belongs to the metric *Regional Model* (framework SASB, category Environmental). This perspective is useful for auditors who start from a measurement record and need to trace it back to its metric definition.

**View `vw_e_s_g_measurement_e_s_g_advisor`**

```sql
CREATE VIEW vw_e_s_g_measurement_e_s_g_advisor AS
SELECT a.id, a.measurement_id, a.measurement_date, a.numeric_value, b.e_s_g_advisor_id AS advisor_e_s_g_advisor_id, b.advisor_id AS advisor_advisor_id, b.advisor_name AS advisor_advisor_name
FROM e_s_g_measurements a JOIN e_s_g_advisors b ON a.e_s_g_advisor_id = b.e_s_g_advisor_id;
```

| id | measurement_id | measurement_date | numeric_value | advisor_e_s_g_advisor_id | advisor_advisor_id | advisor_advisor_name |
|---|---|---|---|---|---|---|
| 1000 | 7731885 | 2023-02-07T01:39:00 | 22.45 | 1 | 394 | Regional Cluster |
| 1001 | 739 | 2024-07-18T08:56:00 | 26.90 | 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D |
| 1002 | 10782183 | 2025-12-02T15:13:00 | 31.35 | 3 | 2639 | Integrated Initiative |
| 1003 | 325466 | 2022-05-13T22:30:00 | 35.80 | 4 | 10445628 | Extended Model |

The view `vw_e_s_g_measurement_e_s_g_advisor` joins `e_s_g_measurements` to `e_s_g_advisors` on `e_s_g_advisor_id`, answering: *Which advisor is responsible for each measurement?* The first row links measurement id 1000 (value `22.45`, status `pending`) to advisor id 1 (*Regional Cluster*, CPA, 43 years experience, full_time). This join reconstructs the advisor-attribution stored as a foreign key in `e_s_g_measurements`.

**View `vw_e_s_g_report_e_s_g_metric_detail`**

```sql
CREATE VIEW vw_e_s_g_report_e_s_g_metric_detail AS
SELECT a.report_id, a.report_title, a.publication_date, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name
FROM e_s_g_reports a
  JOIN reports_metrics j ON j.report_id = a.report_id
  JOIN e_s_g_metrics b ON b.id = j.e_s_g_metric_id;
```

| report_id | report_title | publication_date | metric_id | metric_metric_id | metric_metric_name |
|---|---|---|---|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | Composite Programme | 2024-03-01 | 1000 | 9085244 | Regional Model |
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | Composite Programme | 2024-03-01 | 1001 | 48104239 | Seasonal Cluster D |
| 605942 | Compact Standard A | 2025-08-12 | 1001 | 48104239 | Seasonal Cluster D |
| 605942 | Compact Standard A | 2025-08-12 | 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review |
| 974942 | Legacy Framework | 2022-01-23 | 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review |
| 974942 | Legacy Framework | 2022-01-23 | 1003 | 3717637 | Extended Initiative |
| account_pymes_2495 | Regional Protocol | 2023-06-07 | 1003 | 3717637 | Extended Initiative |
| account_pymes_2495 | Regional Protocol | 2023-06-07 | 1000 | 9085244 | Regional Model |

The view `vw_e_s_g_report_e_s_g_metric_detail` joins `e_s_g_reports` to `e_s_g_metrics` on `report_id`, answering: *What is the detailed metric composition of each report?* The first row reveals that the report *Composite Programme* (publication date `2024-03-01`, period `2023-02-01` to `2024-07-27`, status `compliant`) contains the metric *Regional Model* (framework SASB, unit `regional-unit-48`, non-material). This join reconstructs the report-metric relationship from the `report_id` foreign key in `e_s_g_metrics`.

**View `vw_e_s_g_report_e_s_g_advisor`**

```sql
CREATE VIEW vw_e_s_g_report_e_s_g_advisor AS
SELECT a.report_id, a.report_title, a.publication_date, a.reporting_period_start, b.e_s_g_advisor_id AS advisor_e_s_g_advisor_id, b.advisor_id AS advisor_advisor_id, b.advisor_name AS advisor_advisor_name
FROM e_s_g_reports a JOIN e_s_g_advisors b ON a.e_s_g_advisor_id = b.e_s_g_advisor_id;
```

| report_id | report_title | publication_date | reporting_period_start | advisor_e_s_g_advisor_id | advisor_advisor_id | advisor_advisor_name |
|---|---|---|---|---|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | Composite Programme | 2024-03-01 | 2023-02-01 | 1 | 394 | Regional Cluster |
| 605942 | Compact Standard A | 2025-08-12 | 2024-07-12 | 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D |
| 974942 | Legacy Framework | 2022-01-23 | 2025-12-23 | 3 | 2639 | Integrated Initiative |
| account_pymes_2495 | Regional Protocol | 2023-06-07 | 2022-05-07 | 4 | 10445628 | Extended Model |

The view `vw_e_s_g_report_e_s_g_advisor` joins `e_s_g_reports` to `e_s_g_advisors` on `e_s_g_advisor_id`, answering: *Which advisor prepared each report?* The first row shows that the report *Composite Programme* (UUID `46d50e78-8fcc-11eb-924d-9cd76263cbd0`, status `compliant`) was prepared by advisor id 1 (*Regional Cluster*, CPA, 43 years experience). This join materializes the advisor-report assignment stored as a foreign key in `e_s_g_reports`.

**View `vw_e_s_g_report_e_s_g_strategy`**

```sql
CREATE VIEW vw_e_s_g_report_e_s_g_strategy AS
SELECT a.report_id, a.report_title, a.publication_date, a.reporting_period_start, b.e_s_g_strategy_id AS strategy_e_s_g_strategy_id, b.strategy_id AS strategy_strategy_id, b.strategy_name AS strategy_strategy_name
FROM e_s_g_reports a JOIN e_s_g_strategies b ON a.e_s_g_strategy_id = b.e_s_g_strategy_id;
```

| report_id | report_title | publication_date | reporting_period_start | strategy_e_s_g_strategy_id | strategy_strategy_id | strategy_strategy_name |
|---|---|---|---|---|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | Composite Programme | 2024-03-01 | 2023-02-01 | 1 | 19508914 | Integrated Protocol A |
| 605942 | Compact Standard A | 2025-08-12 | 2024-07-12 | 2 | id_5 | Extended Programme |
| 974942 | Legacy Framework | 2022-01-23 | 2025-12-23 | 3 | 324 | Pilot Standard |
| account_pymes_2495 | Regional Protocol | 2023-06-07 | 2022-05-07 | 4 | 3990169 | Baseline Framework D |

The view `vw_e_s_g_report_e_s_g_strategy` joins `e_s_g_reports` to `e_s_g_strategies` on `e_s_g_strategy_id`, answering: *Which strategy does each report support?* The first row links the report *Composite Programme* (status `compliant`) to strategy id 1 (*Integrated Protocol A*, target year 36, status `draft`, framework SASB). This join reconstructs the report-strategy relationship from the `e_s_g_strategy_id` foreign key in `e_s_g_reports`.

**View `vw_e_s_g_strategy_e_s_g_metric_detail`**

```sql
CREATE VIEW vw_e_s_g_strategy_e_s_g_metric_detail AS
SELECT a.e_s_g_strategy_id, a.strategy_id, a.strategy_name, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_name AS metric_metric_name
FROM e_s_g_strategies a
  JOIN strategies_metrics j ON j.e_s_g_strategy_id = a.e_s_g_strategy_id
  JOIN e_s_g_metrics b ON b.id = j.e_s_g_metric_id;
```

| e_s_g_strategy_id | strategy_id | strategy_name | metric_id | metric_metric_id | metric_metric_name |
|---|---|---|---|---|---|
| 1 | 19508914 | Integrated Protocol A | 1000 | 9085244 | Regional Model |
| 1 | 19508914 | Integrated Protocol A | 1001 | 48104239 | Seasonal Cluster D |
| 2 | id_5 | Extended Programme | 1001 | 48104239 | Seasonal Cluster D |
| 2 | id_5 | Extended Programme | 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review |
| 3 | 324 | Pilot Standard | 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review |
| 3 | 324 | Pilot Standard | 1003 | 3717637 | Extended Initiative |
| 4 | 3990169 | Baseline Framework D | 1003 | 3717637 | Extended Initiative |
| 4 | 3990169 | Baseline Framework D | 1000 | 9085244 | Regional Model |

The view `vw_e_s_g_strategy_e_s_g_metric_detail` joins `e_s_g_strategies` to `e_s_g_metrics` through the `strategies_metrics` junction table, answering: *What metrics are aligned to each strategy?* The first row connects strategy id 1 (*Integrated Protocol A*, status `draft`, framework SASB) to the metric *Regional Model* (framework SASB, category Environmental). This join reconstructs the strategy-metric association that is stored in the junction table rather than as a direct foreign key.

**View `vw_e_s_g_strategy_e_s_g_advisor`**

```sql
CREATE VIEW vw_e_s_g_strategy_e_s_g_advisor AS
SELECT a.e_s_g_strategy_id, a.strategy_id, a.strategy_name, a.target_year, b.e_s_g_advisor_id AS advisor_e_s_g_advisor_id, b.advisor_id AS advisor_advisor_id, b.advisor_name AS advisor_advisor_name
FROM e_s_g_strategies a JOIN e_s_g_advisors b ON a.e_s_g_advisor_id = b.e_s_g_advisor_id;
```

| e_s_g_strategy_id | strategy_id | strategy_name | target_year | advisor_e_s_g_advisor_id | advisor_advisor_id | advisor_advisor_name |
|---|---|---|---|---|---|---|
| 1 | 19508914 | Integrated Protocol A | 36 | 1 | 394 | Regional Cluster |
| 2 | id_5 | Extended Programme | 39 | 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D |
| 3 | 324 | Pilot Standard | 42 | 3 | 2639 | Integrated Initiative |
| 4 | 3990169 | Baseline Framework D | 45 | 4 | 10445628 | Extended Model |

The view `vw_e_s_g_strategy_e_s_g_advisor` joins `e_s_g_strategies` to `e_s_g_advisors` on `e_s_g_advisor_id`, answering: *Which advisor oversees each strategy?* The first row links strategy id 1 (*Integrated Protocol A*, status `draft`) to advisor id 1 (*Regional Cluster*, CPA, 43 years experience, full_time). This join materializes the advisor-strategy assignment stored as a foreign key in `e_s_g_strategies`.

**View `vw_e_s_g_strategy_policy_change`**

```sql
CREATE VIEW vw_e_s_g_strategy_policy_change AS
SELECT a.e_s_g_strategy_id, a.strategy_id, a.strategy_name, a.target_year, b.policy_id AS change_policy_id, b.policy_title AS change_policy_title, b.issuing_jurisdiction AS change_issuing_jurisdiction
FROM e_s_g_strategies a JOIN policy_changes b ON a.policy_change_policy_id = b.policy_id;
```

| e_s_g_strategy_id | strategy_id | strategy_name | target_year | change_policy_id | change_policy_title | change_issuing_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 19508914 | Integrated Protocol A | 36 | state_uk_12 | Seasonal Initiative | British_Columbia |
| 2 | id_5 | Extended Programme | 39 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 | Integrated Model | Federal_Canada |
| 3 | 324 | Pilot Standard | 42 | 790477 | Extended Cluster D | International |
| 4 | 3990169 | Baseline Framework D | 45 | ChIJz6W-s4Ft5kcR8_b70o-7EeU | Pilot Review | British_Columbia |

The view `vw_e_s_g_strategy_policy_change` joins `e_s_g_strategies` to `policy_changes` on `e_s_g_strategy_id`, answering: *Which policy changes affect each strategy?* The first row shows that strategy id 1 (*Integrated Protocol A*, status `draft`) is affected by policy change `state_uk_12` (*Seasonal Initiative*, jurisdiction `British_Columbia`, effective `2025-04-08`, impact level `low`). This join reconstructs the strategy-policy relationship from the `policy_change_policy_id` foreign key in `e_s_g_strategies`.

**View `vw_policy_change_e_s_g_strategy`**

```sql
CREATE VIEW vw_policy_change_e_s_g_strategy AS
SELECT a.policy_id, a.policy_title, a.issuing_jurisdiction, a.effective_date, b.e_s_g_strategy_id AS strategy_e_s_g_strategy_id, b.strategy_id AS strategy_strategy_id, b.strategy_name AS strategy_strategy_name
FROM policy_changes a JOIN e_s_g_strategies b ON a.e_s_g_strategy_id = b.e_s_g_strategy_id;
```

| policy_id | policy_title | issuing_jurisdiction | effective_date | strategy_e_s_g_strategy_id | strategy_strategy_id | strategy_strategy_name |
|---|---|---|---|---|---|---|
| state_uk_12 | Seasonal Initiative | British_Columbia | 2025-04-08 | 1 | 19508914 | Integrated Protocol A |
| ca398dba-8fcd-11eb-924d-9cd76263cbd0 | Integrated Model | Federal_Canada | 2022-09-19 | 2 | id_5 | Extended Programme |
| 790477 | Extended Cluster D | International | 2023-02-03 | 3 | 324 | Pilot Standard |
| ChIJz6W-s4Ft5kcR8_b70o-7EeU | Pilot Review | British_Columbia | 2024-07-14 | 4 | 3990169 | Baseline Framework D |

The view `vw_policy_change_e_s_g_strategy` performs the same join as the previous view but from the policy change side, answering: *Which strategy is affected by each policy change?* The first row reveals that policy change `state_uk_12` (*Seasonal Initiative*, jurisdiction `British_Columbia`, impact level `low`) affects strategy id 1 (*Integrated Protocol A*, status `draft`, framework SASB). This perspective is useful for compliance officers who start from a policy change and need to identify the impacted strategies.

**View `vw_policy_change_e_s_g_measurement`**

```sql
CREATE VIEW vw_policy_change_e_s_g_measurement AS
SELECT a.policy_id, a.policy_title, a.issuing_jurisdiction, a.effective_date, b.id AS measurement_id, b.measurement_id AS measurement_measurement_id, b.measurement_date AS measurement_measurement_date
FROM policy_changes a JOIN e_s_g_measurements b ON a.e_s_g_measurement_id = b.id;
```

| policy_id | policy_title | issuing_jurisdiction | effective_date | measurement_id | measurement_measurement_id | measurement_measurement_date |
|---|---|---|---|---|---|---|
| state_uk_12 | Seasonal Initiative | British_Columbia | 2025-04-08 | 1000 | 7731885 | 2023-02-07T01:39:00 |
| ca398dba-8fcd-11eb-924d-9cd76263cbd0 | Integrated Model | Federal_Canada | 2022-09-19 | 1001 | 739 | 2024-07-18T08:56:00 |
| 790477 | Extended Cluster D | International | 2023-02-03 | 1002 | 10782183 | 2025-12-02T15:13:00 |
| ChIJz6W-s4Ft5kcR8_b70o-7EeU | Pilot Review | British_Columbia | 2024-07-14 | 1003 | 325466 | 2022-05-13T22:30:00 |

The view `vw_policy_change_e_s_g_measurement` joins `policy_changes` to `e_s_g_measurements` on `e_s_g_measurement_id`, answering: *Which measurements are influenced by each policy change?* The first row links policy change `state_uk_12` (*Seasonal Initiative*, impact level `low`) to measurement id 1000 (value `22.45`, status `pending`, source `baseline-data-85`). This join reconstructs the policy-measurement relationship stored as a foreign key in `policy_changes`.

**View `vw_policy_change_e_s_g_advisor`**

```sql
CREATE VIEW vw_policy_change_e_s_g_advisor AS
SELECT a.policy_id, a.policy_title, a.issuing_jurisdiction, a.effective_date, b.e_s_g_advisor_id AS advisor_e_s_g_advisor_id, b.advisor_id AS advisor_advisor_id, b.advisor_name AS advisor_advisor_name
FROM policy_changes a JOIN e_s_g_advisors b ON a.e_s_g_advisor_id = b.e_s_g_advisor_id;
```

| policy_id | policy_title | issuing_jurisdiction | effective_date | advisor_e_s_g_advisor_id | advisor_advisor_id | advisor_advisor_name |
|---|---|---|---|---|---|---|
| state_uk_12 | Seasonal Initiative | British_Columbia | 2025-04-08 | 1 | 394 | Regional Cluster |
| ca398dba-8fcd-11eb-924d-9cd76263cbd0 | Integrated Model | Federal_Canada | 2022-09-19 | 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D |
| 790477 | Extended Cluster D | International | 2023-02-03 | 3 | 2639 | Integrated Initiative |
| ChIJz6W-s4Ft5kcR8_b70o-7EeU | Pilot Review | British_Columbia | 2024-07-14 | 4 | 10445628 | Extended Model |

The view `vw_policy_change_e_s_g_advisor` joins `policy_changes` to `e_s_g_advisors` on `e_s_g_advisor_id`, answering: *Which advisor monitors each policy change?* The first row shows that policy change `state_uk_12` (*Seasonal Initiative*, jurisdiction `British_Columbia`) is monitored by advisor id 1 (*Regional Cluster*, CPA, 43 years experience, full_time). This join materializes the advisor-policy relationship stored as a foreign key in `policy_changes`.

**View `vw_e_s_g_advisor_e_s_g_strategy`**

```sql
CREATE VIEW vw_e_s_g_advisor_e_s_g_strategy AS
SELECT a.e_s_g_advisor_id, a.advisor_id, a.advisor_name, a.designation, b.e_s_g_strategy_id AS strategy_e_s_g_strategy_id, b.strategy_id AS strategy_strategy_id, b.strategy_name AS strategy_strategy_name
FROM e_s_g_advisors a JOIN e_s_g_strategies b ON a.e_s_g_strategy_id = b.e_s_g_strategy_id;
```

| e_s_g_advisor_id | advisor_id | advisor_name | designation | strategy_e_s_g_strategy_id | strategy_strategy_id | strategy_strategy_name |
|---|---|---|---|---|---|---|
| 1 | 394 | Regional Cluster | CPA | 1 | 19508914 | Integrated Protocol A |
| 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D | Sustainability_Certificate | 2 | id_5 | Extended Programme |
| 3 | 2639 | Integrated Initiative | None | 3 | 324 | Pilot Standard |
| 4 | 10445628 | Extended Model | CPA | 4 | 3990169 | Baseline Framework D |

The view `vw_e_s_g_advisor_e_s_g_strategy` joins `e_s_g_advisors` to `e_s_g_strategies` on `e_s_g_strategy_id`, answering: *Which strategies does each advisor oversee?* The first row links advisor id 1 (*Regional Cluster*, CPA, 43 years experience, full_time) to strategy id 1 (*Integrated Protocol A*, status `draft`, framework SASB). This join reconstructs the advisor-strategy assignment from the `e_s_g_strategy_id` foreign key in `e_s_g_advisors`.

**View `vw_e_s_g_advisor_e_s_g_report`**

```sql
CREATE VIEW vw_e_s_g_advisor_e_s_g_report AS
SELECT a.e_s_g_advisor_id, a.advisor_id, a.advisor_name, a.designation, b.report_id AS report_report_id, b.report_title AS report_report_title, b.publication_date AS report_publication_date
FROM e_s_g_advisors a JOIN e_s_g_reports b ON a.report_id = b.report_id;
```

| e_s_g_advisor_id | advisor_id | advisor_name | designation | report_report_id | report_report_title | report_publication_date |
|---|---|---|---|---|---|---|
| 1 | 394 | Regional Cluster | CPA | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | Composite Programme | 2024-03-01 |
| 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D | Sustainability_Certificate | 605942 | Compact Standard A | 2025-08-12 |
| 3 | 2639 | Integrated Initiative | None | 974942 | Legacy Framework | 2022-01-23 |
| 4 | 10445628 | Extended Model | CPA | account_pymes_2495 | Regional Protocol | 2023-06-07 |

The view `vw_e_s_g_advisor_e_s_g_report` joins `e_s_g_advisors` to `e_s_g_reports` on `report_id`, answering: *Which reports has each advisor prepared?* The first row shows that advisor id 1 (*Regional Cluster*, CPA, 43 years experience, full_time) prepared the report *Composite Programme* (UUID `46d50e78-8fcc-11eb-924d-9cd76263cbd0`, status `compliant`). This join materializes the advisor-report relationship stored as a foreign key in `e_s_g_advisors`.

**View `vw_e_s_g_advisor_e_s_g_measurement`**

```sql
CREATE VIEW vw_e_s_g_advisor_e_s_g_measurement AS
SELECT a.e_s_g_advisor_id, a.advisor_id, a.advisor_name, a.designation, b.id AS measurement_id, b.measurement_id AS measurement_measurement_id, b.measurement_date AS measurement_measurement_date
FROM e_s_g_advisors a JOIN e_s_g_measurements b ON a.e_s_g_measurement_id = b.id;
```

| e_s_g_advisor_id | advisor_id | advisor_name | designation | measurement_id | measurement_measurement_id | measurement_measurement_date |
|---|---|---|---|---|---|---|
| 1 | 394 | Regional Cluster | CPA | 1000 | 7731885 | 2023-02-07T01:39:00 |
| 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D | Sustainability_Certificate | 1001 | 739 | 2024-07-18T08:56:00 |
| 3 | 2639 | Integrated Initiative | None | 1002 | 10782183 | 2025-12-02T15:13:00 |
| 4 | 10445628 | Extended Model | CPA | 1003 | 325466 | 2022-05-13T22:30:00 |

The view `vw_e_s_g_advisor_e_s_g_measurement` joins `e_s_g_advisors` to `e_s_g_measurements` on `e_s_g_measurement_id`, answering: *Which measurements has each advisor collected?* The first row links advisor id 1 (*Regional Cluster*, CPA, 43 years experience, full_time) to measurement id 1000 (value `22.45`, status `pending`, source `baseline-data-85`). This join reconstructs the advisor-measurement relationship from the `e_s_g_measurement_id` foreign key in `e_s_g_advisors`.

**View `vw_e_s_g_advisor_policy_change`**

```sql
CREATE VIEW vw_e_s_g_advisor_policy_change AS
SELECT a.e_s_g_advisor_id, a.advisor_id, a.advisor_name, a.designation, b.policy_id AS change_policy_id, b.policy_title AS change_policy_title, b.issuing_jurisdiction AS change_issuing_jurisdiction
FROM e_s_g_advisors a JOIN policy_changes b ON a.policy_change_policy_id = b.policy_id;
```

| e_s_g_advisor_id | advisor_id | advisor_name | designation | change_policy_id | change_policy_title | change_issuing_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 394 | Regional Cluster | CPA | state_uk_12 | Seasonal Initiative | British_Columbia |
| 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D | Sustainability_Certificate | ca398dba-8fcd-11eb-924d-9cd76263cbd0 | Integrated Model | Federal_Canada |
| 3 | 2639 | Integrated Initiative | None | 790477 | Extended Cluster D | International |
| 4 | 10445628 | Extended Model | CPA | ChIJz6W-s4Ft5kcR8_b70o-7EeU | Pilot Review | British_Columbia |

The view `vw_e_s_g_advisor_policy_change` joins `e_s_g_advisors` to `policy_changes` on `policy_change_policy_id`, answering: *Which policy changes does each advisor monitor?* The first row shows that advisor id 1 (*Regional Cluster*, CPA, 43 years experience, full_time) monitors policy change `state_uk_12` (*Seasonal Initiative*, jurisdiction `British_Columbia`, effective `2025-04-08`, impact level `low`). This join materializes the advisor-policy relationship stored as a foreign key in `e_s_g_advisors`.

## Synthesis

The ESG reporting schema models a tightly coupled ecosystem where metrics, measurements, reports, strategies, policy changes, and advisors form a web of interdependent relationships. Six base tables capture the core entities in normalized form, with surrogate primary keys and business-level identifiers coexisting to support both system integrity and human readability. Two junction tables (`reports_metrics` and `strategies_metrics`) resolve many-to-many associations that cannot be expressed through direct foreign keys. The twenty views collectively reconstruct every domain fact from the normalized tables, each answering a specific analytical question by joining the appropriate pair of entities. The sample data—spanning frameworks like SASB, GRI, TCFD, and CDP; statuses ranging from `pending` to `archived`; jurisdictions from `British_Columbia` to `International`; and advisors with experience levels from 43 to 67 years—demonstrates a model designed for both regulatory compliance and strategic ESG management.