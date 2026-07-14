# ESG Performance Management: Records, Relationships, and Operational Views

Environmental, Social, and Governance (ESG) performance management requires organizations to track, report, and act upon a complex web of metrics, strategies, and regulatory changes. The data model described here captures the full lifecycle of ESG operations: from the definition of individual metrics and their measurement, through the formulation of strategic targets and advisory oversight, to the publication of formal reports and the impact of external policy changes. Each record in the system carries a unique identifier, a timestamp, and a set of contextual attributes that together enable practitioners to answer questions about compliance, progress, and accountability. The tables and views below document the entities and their relationships, using representative values drawn from the operational dataset.

**Table `e_s_g_metrics`**

| id | metric_id | metric_name | standard_framework | category | unit_of_measure | is_material | report_id | e_s_g_measurement_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 9085244 | Regional Model | SASB | Environmental | regional-unit-48 | false | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 1000 |
| 1001 | 48104239 | Seasonal Cluster D | GRI | Social | legacy-unit-49 | true | 605942 | 1001 |
| 1002 | ChIJuSfgq4Ft5kcRs4OLDD3ht_s | Integrated Review | TCFD | Governance | compact-unit-50 | false | 974942 | 1002 |
| 1003 | 3717637 | Extended Initiative | CDP | Environmental | composite-unit-51 | true | account_pymes_2495 | 1003 |

The `e_s_g_metrics` table defines the individual performance indicators that an organization tracks. Each metric carries a `metric_name` such as *Regional Model*, *Seasonal Cluster D*, *Integrated Review*, or *Extended Initiative*, alongside a `standard_framework` designation—SASB, GRI, TCFD, or CDP—that anchors the metric to a recognized reporting standard. The `category` column classifies the metric as Environmental, Social, or Governance, while `unit_of_measure` describes the measurement unit, ranging from `regional-unit-48` to `legacy-unit-49`, `compact-unit-50`, and `composite-unit-51`. The `is_material` flag indicates whether the metric is considered material to the organization's impact assessment; for instance, *Seasonal Cluster D* and *Extended Initiative* are marked as material, whereas *Regional Model* and *Integrated Review* are not. Each metric is linked to a `report_id` (such as `46d50e78-8fcc-11eb-924d-9cd76263cbd0` or `account_pymes_2495`) and an `e_s_g_measurement_id` that ties the metric definition to its corresponding measurement record.

**Table `e_s_g_measurements`**

| id | measurement_id | measurement_date | numeric_value | status | data_source | e_s_g_metric_id | e_s_g_advisor_id |
|---|---|---|---|---|---|---|---|
| 1000 | 7731885 | 2023-02-07T01:39:00 | 22.45 | pending | baseline-data-85 | 1000 | 1 |
| 1001 | 739 | 2024-07-18T08:56:00 | 26.90 | in_progress | pilot-data-86 | 1001 | 2 |
| 1002 | 10782183 | 2025-12-02T15:13:00 | 31.35 | verified | extended-data-87 | 1002 | 3 |
| 1003 | 325466 | 2022-05-13T22:30:00 | 35.80 | archived | integrated-data-88 | 1003 | 4 |

Measurements capture the actual data collected for each metric at a point in time. The `e_s_g_measurements` table records a `measurement_date` (for example, `2023-02-07T01:39:00` or `2025-12-02T15:13:00`), a `numeric_value` (ranging from 22.45 to 35.80 in the sample data), and a `status` that reflects the current state of the measurement: `pending`, `in_progress`, `verified`, or `archived`. The `data_source` field identifies where the data originated—`baseline-data-85`, `pilot-data-86`, `extended-data-87`, or `integrated-data-88`—providing traceability. Each measurement is associated with an `e_s_g_metric_id` (1000 through 1003) and an `e_s_g_advisor_id` (1 through 4), establishing the link between the raw data point and both the metric it measures and the advisor responsible for its collection.

**Table `e_s_g_reports`**

| report_id | report_title | publication_date | reporting_period_start | reporting_period_end | compliance_status | e_s_g_advisor_id | e_s_g_strategy_id |
|---|---|---|---|---|---|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | Composite Programme | 2024-03-01 | 2023-02-01 | 2024-07-27 | compliant | 1 | 1 |
| 605942 | Compact Standard A | 2025-08-12 | 2024-07-12 | 2025-12-11 | non_compliant | 2 | 2 |
| 974942 | Legacy Framework | 2022-01-23 | 2025-12-23 | 2022-05-22 | partial | 3 | 3 |
| account_pymes_2495 | Regional Protocol | 2023-06-07 | 2022-05-07 | 2023-10-06 | compliant | 4 | 4 |

ESG reports are the formal outputs of the measurement and strategy process. The `e_s_g_reports` table stores each report's `report_title`—*Composite Programme*, *Compact Standard A*, *Legacy Framework*, or *Regional Protocol*—alongside its `publication_date` (such as `2024-03-01` or `2025-08-12`) and the `reporting_period_start` and `reporting_period_end` dates that define the scope of the report. The `compliance_status` column indicates whether the report is `compliant`, `non_compliant`, or `partial` with respect to regulatory requirements. Each report is assigned to an `e_s_g_advisor_id` and an `e_s_g_strategy_id`, connecting the published output to both the responsible advisor and the strategic framework under which it was produced.

**Table `e_s_g_strategies`**

| e_s_g_strategy_id | strategy_id | strategy_name | target_year | status | alignment_framework | e_s_g_advisor_id | policy_change_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | 19508914 | Integrated Protocol A | 36 | draft | SASB | 1 | state_uk_12 |
| 2 | id_5 | Extended Programme | 39 | approved | UN_SDGs | 2 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 324 | Pilot Standard | 42 | active | Paris_Agreement | 3 | 790477 |
| 4 | 3990169 | Baseline Framework D | 45 | retired | SASB | 4 | ChIJz6W-s4Ft5kcR8_b70o-7EeU |

Strategies define the organization's ESG targets and the frameworks guiding them. The `e_s_g_strategies` table includes a `strategy_name` such as *Integrated Protocol A*, *Extended Programme*, *Pilot Standard*, or *Baseline Framework D*, a `target_year` (36, 39, 42, or 45 in the sample), and a `status` of `draft`, `approved`, `active`, or `retired`. The `alignment_framework` column specifies the strategic framework—SASB, UN_SDGs, or Paris_Agreement—that the strategy adheres to. Each strategy is linked to an `e_s_g_advisor_id` and a `policy_change_policy_id` (such as `state_uk_12` or `ChIJz6W-s4Ft5kcR8_b70o-7EeU`), indicating which policy change the strategy responds to.

**Table `policy_changes`**

| policy_id | policy_title | issuing_jurisdiction | effective_date | impact_level | e_s_g_strategy_id | e_s_g_measurement_id | e_s_g_advisor_id |
|---|---|---|---|---|---|---|---|
| state_uk_12 | Seasonal Initiative | British_Columbia | 2025-04-08 | low | 1 | 1000 | 1 |
| ca398dba-8fcd-11eb-924d-9cd76263cbd0 | Integrated Model | Federal_Canada | 2022-09-19 | medium | 2 | 1001 | 2 |
| 790477 | Extended Cluster D | International | 2023-02-03 | high | 3 | 1002 | 3 |
| ChIJz6W-s4Ft5kcR8_b70o-7EeU | Pilot Review | British_Columbia | 2024-07-14 | low | 4 | 1003 | 4 |

Policy changes represent external regulatory or jurisdictional shifts that affect ESG operations. The `policy_changes` table records a `policy_title` (e.g., *Seasonal Initiative*, *Integrated Model*, *Extended Cluster D*, *Pilot Review*), the `issuing_jurisdiction` (British_Columbia, Federal_Canada, or International), an `effective_date` (ranging from `2022-09-19` to `2025-04-08`), and an `impact_level` of `low`, `medium`, or `high`. Each policy change is associated with an `e_s_g_strategy_id`, an `e_s_g_measurement_id`, and an `e_s_g_advisor_id`, establishing the operational chain from policy enactment through measurement response to advisory oversight.

**Table `e_s_g_advisors`**

| e_s_g_advisor_id | advisor_id | advisor_name | designation | years_experience | employment_status | e_s_g_strategy_id | report_id | e_s_g_measurement_id | policy_change_policy_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 394 | Regional Cluster | CPA | 43 | full_time | 1 | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 1000 | state_uk_12 |
| 2 | 08e6797f50d24712a390755cb1a3b36f | Seasonal Review D | Sustainability_Certificate | 51 | part_time | 2 | 605942 | 1001 | ca398dba-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 2639 | Integrated Initiative | None | 59 | contract | 3 | 974942 | 1002 | 790477 |
| 4 | 10445628 | Extended Model | CPA | 67 | full_time | 4 | account_pymes_2495 | 1003 | ChIJz6W-s4Ft5kcR8_b70o-7EeU |

Advisors are the individuals or entities responsible for overseeing ESG data collection, strategy execution, and reporting. The `e_s_g_advisors` table contains an `advisor_name` such as *Regional Cluster*, *Seasonal Review D*, *Integrated Initiative*, or *Extended Model*, a `designation` (CPA, Sustainability_Certificate, or None), `years_experience` (43, 51, 59, or 67), and an `employment_status` of `full_time`, `part_time`, or `contract`. Each advisor is linked to an `e_s_g_strategy_id`, a `report_id`, an `e_s_g_measurement_id`, and a `policy_change_policy_id`, reflecting the breadth of their responsibilities across the ESG lifecycle.

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

The `reports_metrics` table serves as a junction record that explicitly maps which metrics are included in which reports. This many-to-many relationship allows a single report to encompass multiple metrics and a single metric to appear across multiple reports, supporting flexible reporting structures where different subsets of metrics are relevant to different reporting periods or audiences.

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

Similarly, `strategies_metrics` is a junction table that links strategies to the metrics they target. This relationship enables practitioners to trace which metrics are driven by which strategic initiatives, providing visibility into the alignment between operational targets and the underlying performance indicators.

## Cross-Cutting Views: Interpreting Joined Results

The views in this system synthesize the base tables into joined results that answer specific operational questions. Each view combines data from two or more tables to present a coherent picture of a particular relationship.

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

This view joins metrics with their associated reports, answering the question: *Which metrics belong to which reports?* For example, the metric *Regional Model* (id 1000) is linked to the report *Composite Programme* (id `46d50e78-8fcc-11eb-924d-9cd76263cbd0`), while *Seasonal Cluster D* (id 1001) appears in *Compact Standard A* (id `605942`). This view is essential for auditors verifying that all required metrics are included in published reports.

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

By joining metrics with their measurements, this view answers: *What data has been collected for each metric?* The metric *Regional Model* (id 1000) has a measurement with a `numeric_value` of 22.45 recorded on `2023-02-07T01:39:00` with a `pending` status, while *Integrated Review* (id 1002) shows a `verified` measurement of 31.35 from `2025-12-02T15:13:00`. This view supports trend analysis and data quality assessments.

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

This is the inverse perspective of the previous view, joining measurements back to their defining metrics. It answers: *For a given measurement, what metric does it belong to?* A measurement with `numeric_value` 26.90 and status `in_progress` (id 1001) is tied to the metric *Seasonal Cluster D* under the GRI framework. This view is useful when starting from a data point and needing to understand its contextual definition.

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

This view links measurements to the advisors responsible for them, answering: *Which advisor is accountable for each measurement?* Measurement id 1000 (value 22.45, status `pending`) is overseen by advisor id 1 (*Regional Cluster*, a CPA with 43 years of experience), while measurement id 1003 (value 35.80, status `archived`) is managed by advisor id 4 (*Extended Model*, a CPA with 67 years of experience). This view supports workload analysis and accountability tracing.

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

This view enriches reports with detailed metric information, answering: *What metrics are included in each report, and what are their characteristics?* The report *Composite Programme* (id `46d50e78-8fcc-11eb-924d-9cd76263cbd0`) includes the metric *Regional Model*, which is classified as Environmental, uses `regional-unit-48` as its unit, and is marked as non-material. The report *Regional Protocol* (id `account_pymes_2495`) includes *Extended Initiative*, an Environmental metric under CDP that is material and uses `composite-unit-51`. This view is critical for report preparation and compliance verification.

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

This view connects reports to their responsible advisors, answering: *Which advisor is accountable for each published report?* The report *Compact Standard A* (id `605942`, status `non_compliant`) is overseen by advisor id 2 (*Seasonal Review D*, a part-time holder of the Sustainability_Certificate with 51 years of experience). The report *Regional Protocol* (id `account_pymes_2495`, status `compliant`) is managed by advisor id 4 (*Extended Model*, a full-time CPA with 67 years of experience). This view supports resource allocation and performance evaluation of advisory staff.

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

This view joins reports with their associated strategies, answering: *Which strategy guided the production of each report?* The report *Composite Programme* (id `46d50e78-8fcc-11eb-924d-9cd76263cbd0`) is aligned with strategy id 1 (*Integrated Protocol A*, status `draft`, aligned to SASB). The report *Legacy Framework* (id `974942`, status `partial`) corresponds to strategy id 3 (*Pilot Standard*, status `active`, aligned to Paris_Agreement). This view helps trace the strategic rationale behind each published report.

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

This view links strategies to their target metrics with full metric detail, answering: *Which metrics does each strategy target, and what are their properties?* Strategy id 1 (*Integrated Protocol A*, target year 36, SASB-aligned) targets metric id 1000 (*Regional Model*, Environmental, SASB framework, non-material). Strategy id 3 (*Pilot Standard*, target year 42, Paris_Agreement-aligned) targets metric id 1002 (*Integrated Review*, Governance, TCFD framework, non-material). This view is essential for strategic planning and gap analysis.

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

This view connects strategies to their overseeing advisors, answering: *Which advisor is responsible for each strategy?* Strategy id 1 (*Integrated Protocol A*) is overseen by advisor id 1 (*Regional Cluster*, full-time CPA, 43 years experience). Strategy id 4 (*Baseline Framework D*, retired status) is managed by advisor id 4 (*Extended Model*, full-time CPA, 67 years experience). This view supports strategic resource planning and accountability.

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

This view links strategies to the policy changes they respond to, answering: *Which policy changes have triggered which strategies?* Strategy id 1 (*Integrated Protocol A*) responds to policy change `state_uk_12` (*Seasonal Initiative*, issued by British_Columbia, effective `2025-04-08`, low impact). Strategy id 3 (*Pilot Standard*) responds to policy change `790477` (*Extended Cluster D*, issued by International, effective `2023-02-03`, high impact). This view is critical for regulatory compliance tracking and impact assessment.

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

The inverse of the previous view, this view presents policy changes with their associated strategies, answering: *For a given policy change, which strategies has it influenced?* The policy change *Integrated Model* (`ca398dba-8fcd-11eb-924d-9cd76263cbd0`, Federal_Canada, medium impact) has influenced strategy id 2 (*Extended Programme*, approved status, UN_SDGs-aligned). The policy change *Pilot Review* (`ChIJz6W-s4Ft5kcR8_b70o-7EeU`, British_Columbia, low impact) has influenced strategy id 4 (*Baseline Framework D*, retired status, SASB-aligned). This view supports regulatory impact analysis.

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

This view connects policy changes to the measurements affected by them, answering: *Which measurements have been impacted by a given policy change?* Policy change `state_uk_12` (*Seasonal Initiative*) is associated with measurement id 1000 (value 22.45, status `pending`, data source `baseline-data-85`). Policy change `790477` (*Extended Cluster D*, high impact) is associated with measurement id 1002 (value 31.35, status `verified`, data source `extended-data-87`). This view enables practitioners to assess the operational impact of regulatory changes.

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

This view links policy changes to the advisors overseeing the affected measurements, answering: *Which advisors are responsible for measurements impacted by a given policy change?* Policy change `ca398dba-8fcd-11eb-924d-9cd76263cbd0` (*Integrated Model*, medium impact) is overseen by advisor id 2 (*Seasonal Review D*, part-time, 51 years experience). Policy change `ChIJz6W-s4Ft5kcR8_b70o-7EeU` (*Pilot Review*, low impact) is overseen by advisor id 4 (*Extended Model*, full-time, 67 years experience). This view supports advisory workload management during periods of regulatory change.

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

This view presents advisors with their associated strategies, answering: *Which strategies is each advisor responsible for?* Advisor id 1 (*Regional Cluster*, full-time CPA, 43 years experience) oversees strategy id 1 (*Integrated Protocol A*, draft status, SASB-aligned). Advisor id 3 (*Integrated Initiative*, contract, 59 years experience) oversees strategy id 3 (*Pilot Standard*, active status, Paris_Agreement-aligned). This view is useful for capacity planning and strategic alignment reviews.

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

This view connects advisors to the reports they oversee, answering: *Which reports is each advisor accountable for?* Advisor id 1 (*Regional Cluster*) is responsible for report id `46d50e78-8fcc-11eb-924d-9cd76263cbd0` (*Composite Programme*, compliant status, published `2024-03-01`). Advisor id 3 (*Integrated Initiative*) is responsible for report id `974942` (*Legacy Framework*, partial status, published `2022-01-23`). This view supports reporting accountability and quality assurance.

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

This view links advisors to the measurements they manage, answering: *Which measurements is each advisor responsible for?* Advisor id 2 (*Seasonal Review D*, part-time, 51 years experience) manages measurement id 1001 (value 26.90, status `in_progress`, date `2024-07-18T08:56:00`). Advisor id 4 (*Extended Model*, full-time, 67 years experience) manages measurement id 1003 (value 35.80, status `archived`, date `2022-05-13T22:30:00`). This view supports data quality oversight and advisor performance evaluation.

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

This view connects advisors to the policy changes they oversee, answering: *Which policy changes fall under each advisor's purview?* Advisor id 1 (*Regional Cluster*) oversees policy change `state_uk_12` (*Seasonal Initiative*, British_Columbia, low impact, effective `2025-04-08`). Advisor id 3 (*Integrated Initiative*) oversees policy change `790477` (*Extended Cluster D*, International, high impact, effective `2023-02-03`). This view is essential for regulatory compliance management and advisory resource allocation.

## Closing Synthesis

The ESG performance management system described here captures a complete operational ecosystem: metrics define what is measured, measurements record the actual data, strategies set the targets, advisors provide oversight, reports deliver the formal outputs, and policy changes represent the external forces that shape everything. The base tables store the atomic facts, while the views synthesize these facts into answerable questions—linking metrics to reports, measurements to advisors, strategies to policy changes, and advisors to every other entity in the system. Together, these records and their relationships form the backbone of ESG accountability, enabling organizations to track progress, demonstrate compliance, and respond to regulatory change with clarity and precision.