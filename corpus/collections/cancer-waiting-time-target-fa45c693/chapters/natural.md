## The Architecture of Waiting-Time Governance

Healthcare systems across the United Kingdom operate under a framework of waiting-time targets designed to ensure that patients receive timely cancer treatment. These targets are not abstract ideals; they are enforceable commitments tracked through a structured data ecosystem that links clinical events, regional health authorities, patient populations, and statistical reporting. At the heart of this system lies a set of interrelated records that capture who is responsible for delivering care, which cancer types are affected, how long patients should wait from specific clinical milestones, and whether those commitments are being met. The records below form the backbone of this governance architecture, each serving a distinct operational purpose while remaining tightly coupled through shared identifiers.

**Table `cancer_waiting_time_targets`**

| id | target_duration | triggering_clinical_event | tolerance_percentage | implementation_date | status | n_h_s_board_id |
|---|---|---|---|---|---|---|
| 1 | 24 | urgent_referral | 18.45 | 2024-11-14 | active | 100 |
| 2 | 31 | decision_to_treat | 22.90 | 2025-04-25 | legacy | 101 |
| 3 | 38 | urgent_referral | 27.35 | 2022-09-09 | national_standard | 102 |
| 4 | 45 | decision_to_treat | 31.80 | 2023-02-20 | active | 103 |

Each row in this table defines a waiting-time commitment for a specific NHS board. The `target_duration` column records the maximum allowable days between a triggering clinical event and the start of treatment. For instance, target record 1 specifies a 24-day window triggered by an `urgent_referral`, with a tolerance of 18.45 percent and an `active` status as of November 2024. Target record 3, by contrast, allows 38 days from the same triggering event but carries a `national_standard` status, indicating it applies across multiple boards. The `n_h_s_board_id` column anchors each target to a regional organization, establishing the first layer of accountability.

**Table `cancer_types`**

| id | cancer_name | anatomical_region | is_primary | clinical_code | cancer_waiting_time_target_id |
|---|---|---|---|---|---|
| 1 | Breast | pilot-anatomic-20 | true | 1290 | 1 |
| 2 | Colorectal | extended-anatomic-21 | false | 974944 | 2 |
| 3 | Head & Neck | integrated-anatomic-22 | true | 16121 | 3 |
| 4 | Lung | seasonal-anatomic-23 | false | 4793492 | 4 |

Cancer types are catalogued with clinical precision. The `cancer_name` column holds familiar designations such as Breast, Colorectal, Head & Neck, and Lung, while the `clinical_code` column provides machine-readable identifiers like 1290 and 974944. The `anatomical_region` column classifies each type into broader groupings—pilot-anatomic-20, extended-anatomic-21, and so on—enabling aggregation across related malignancies. The `is_primary` flag distinguishes cancers that serve as the principal diagnosis from secondary or metastatic presentations. Crucially, the `cancer_waiting_time_target_id` column links each cancer type to the waiting-time target that governs its treatment timeline, creating a direct bridge between clinical classification and operational commitment.

**Table `n_h_s_boards`**

| id | board_name | is_island_board | region | reporting_status | cancer_waiting_time_target_id |
|---|---|---|---|---|---|
| 100 | Compact Series | true | distributed-region-12 | finalised | 1 |
| 101 | Legacy Assessment | false | baseline-region-13 | preliminary | 2 |
| 102 | Regional Survey A | true | pilot-region-14 | subject_to_change | 3 |
| 103 | Seasonal Corridor | false | extended-region-15 | finalised | 4 |

NHS boards are the regional organizations responsible for delivering cancer services within their jurisdictions. The `board_name` column contains identifiers such as Compact Series, Legacy Assessment, Regional Survey A, and Seasonal Corridor. The `region` column maps each board to a geographic or administrative zone—distributed-region-12, baseline-region-13, pilot-region-14, and extended-region-15. The `is_island_board` flag distinguishes boards serving island communities, which may face unique logistical constraints. The `reporting_status` column indicates the maturity of each board's data submissions: `finalised`, `preliminary`, or `subject_to_change`. Like cancer types, NHS boards are linked to waiting-time targets through the `cancer_waiting_time_target_id` column, ensuring that every board operates under a defined performance framework.

**Table `waiting_time_statistics`**

| waiting_time_statistic_id | reporting_period | compliance_percentage | eligible_patient_count | treatment_start_count | percentile90 | data_quality | cancer_waiting_time_target_id | n_h_s_board_id | cancer_type_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2023-06-18 | 3.95 | 5 | 85 | 20.70 | final | 1 | 100 | 1 |
| 1001 | 2024-11-02 | 7.90 | 11 | 10 | 22.40 | provisional | 2 | 101 | 2 |
| 1002 | 2025-04-13 | 11.85 | 0 | 15 | 24.10 | final | 3 | 102 | 3 |
| 1003 | 2022-09-24 | 15.80 | 33 | 11 | 25.80 | provisional | 4 | 103 | 4 |

Waiting-time statistics provide the measurement layer that transforms targets into measurable outcomes. Each record is identified by a `waiting_time_statistic_id` and tied to a `reporting_period` date. The `compliance_percentage` column quantifies how well a board met its target during that period—values of 3.95, 7.90, 11.85, and 15.80 percent appear in the sample data, reflecting varying degrees of adherence. The `eligible_patient_count` and `treatment_start_count` columns capture the numerator and denominator of the compliance calculation, while the `percentile90` column records the 90th-percentile waiting time in days, offering a distributional view beyond simple compliance rates. The `data_quality` column marks each record as `final` or `provisional`, signaling whether the statistics have undergone full validation. Each statistic row is triply linked: to a cancer waiting-time target, an NHS board, and a cancer type, enabling drill-down analysis at any level of granularity.

**Table `patient_cohorts`**

| patient_cohort_id | age_threshold | diagnosis_date | referral_route | cohort_size | cancer_type_id | n_h_s_board_id |
|---|---|---|---|---|---|---|
| 1 | 22 | 2023-10-26 | urgent | 21 | 1 | 100 |
| 2 | 26 | 2024-03-10 | screened_positive | 31 | 2 | 101 |
| 3 | 30 | 2025-08-21 | standard | 41 | 3 | 102 |
| 4 | 34 | 2022-01-05 | urgent | 51 | 4 | 103 |

Patient cohorts define the populations under observation. Each cohort is identified by a `patient_cohort_id` and characterized by an `age_threshold`, a `diagnosis_date`, and a `referral_route`. The referral routes—`urgent`, `screened_positive`, and `standard`—reflect the clinical pathways through which patients enter the cancer system. The `cohort_size` column records the number of patients in each cohort, ranging from 21 to 51 in the sample data. Cohorts are linked to both a cancer type and an NHS board, establishing which patient populations are being tracked within which regional and clinical boundaries.

**Table `targets_types`**

| cancer_waiting_time_target_id | cancer_type_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The relationship between waiting-time targets and cancer types is many-to-many, captured in this junction table. Target 1, for example, applies to both cancer type 1 (Breast) and cancer type 2 (Colorectal), while target 4 spans cancer type 4 (Lung) and cancer type 1 (Breast). This structure allows a single target to govern multiple cancer types and a single cancer type to be subject to different targets under different conditions, reflecting the complexity of real-world clinical governance.

**Table `boards_statistics`**

| n_h_s_board_id | waiting_time_statistic_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

Boards statistics aggregate performance metrics at the organizational level, summarizing compliance and volume data across reporting periods. These summaries enable board-level benchmarking and longitudinal trend analysis, providing administrators with a high-level view of operational performance without requiring them to navigate the granular waiting-time statistics.

## Cross-Referenced Views for Operational Intelligence

The true analytical power of this data ecosystem emerges through its joined views, which synthesize base tables into actionable reports. Each view answers a specific operational question by combining records from multiple tables.

**View `v_cancer_waiting_time_target_cancer_type_detail`**

```sql
CREATE VIEW v_cancer_waiting_time_target_cancer_type_detail AS
SELECT a.id, a.target_duration, a.triggering_clinical_event, b.id AS type_id, b.cancer_name AS type_cancer_name, b.anatomical_region AS type_anatomical_region
FROM cancer_waiting_time_targets a
  JOIN targets_types j ON j.cancer_waiting_time_target_id = a.id
  JOIN cancer_types b ON b.id = j.cancer_type_id;
```

| id | target_duration | triggering_clinical_event | type_id | type_cancer_name | type_anatomical_region |
|---|---|---|---|---|---|
| 1 | 24 | urgent_referral | 1 | Breast | pilot-anatomic-20 |
| 1 | 24 | urgent_referral | 2 | Colorectal | extended-anatomic-21 |
| 2 | 31 | decision_to_treat | 2 | Colorectal | extended-anatomic-21 |
| 2 | 31 | decision_to_treat | 3 | Head & Neck | integrated-anatomic-22 |
| 3 | 38 | urgent_referral | 3 | Head & Neck | integrated-anatomic-22 |
| 3 | 38 | urgent_referral | 4 | Lung | seasonal-anatomic-23 |
| 4 | 45 | decision_to_treat | 4 | Lung | seasonal-anatomic-23 |
| 4 | 45 | decision_to_treat | 1 | Breast | pilot-anatomic-20 |

This view answers the question: which cancer types fall under each waiting-time target, and what are their clinical characteristics? A representative row would show target 1 (24 days, urgent referral) linked to cancer type 1 (Breast, clinical code 1290, primary diagnosis) and cancer type 2 (Colorectal, clinical code 974944, non-primary). This allows clinicians and administrators to see the full scope of a target's clinical coverage at a glance.

**View `v_cancer_waiting_time_target_n_h_s_board`**

```sql
CREATE VIEW v_cancer_waiting_time_target_n_h_s_board AS
SELECT a.id, a.target_duration, a.triggering_clinical_event, a.tolerance_percentage, b.id AS board_id, b.board_name AS board_board_name, b.is_island_board AS board_is_island_board
FROM cancer_waiting_time_targets a JOIN n_h_s_boards b ON a.n_h_s_board_id = b.id;
```

| id | target_duration | triggering_clinical_event | tolerance_percentage | board_id | board_board_name | board_is_island_board |
|---|---|---|---|---|---|---|
| 1 | 24 | urgent_referral | 18.45 | 100 | Compact Series | true |
| 2 | 31 | decision_to_treat | 22.90 | 101 | Legacy Assessment | false |
| 3 | 38 | urgent_referral | 27.35 | 102 | Regional Survey A | true |
| 4 | 45 | decision_to_treat | 31.80 | 103 | Seasonal Corridor | false |

This view maps waiting-time targets to the NHS boards responsible for their execution. A row might pair target 2 (31 days, decision to treat, legacy status) with NHS board 101 (Legacy Assessment, baseline-region-13, preliminary reporting status). This relationship is essential for accountability: it identifies exactly which organization must meet which target and under what reporting conditions.

**View `v_cancer_type_cancer_waiting_time_target`**

```sql
CREATE VIEW v_cancer_type_cancer_waiting_time_target AS
SELECT a.id, a.cancer_name, a.anatomical_region, a.is_primary, b.id AS target_id, b.target_duration AS target_target_duration, b.triggering_clinical_event AS target_triggering_clinical_event
FROM cancer_types a JOIN cancer_waiting_time_targets b ON a.cancer_waiting_time_target_id = b.id;
```

| id | cancer_name | anatomical_region | is_primary | target_id | target_target_duration | target_triggering_clinical_event |
|---|---|---|---|---|---|---|
| 1 | Breast | pilot-anatomic-20 | true | 1 | 24 | urgent_referral |
| 2 | Colorectal | extended-anatomic-21 | false | 2 | 31 | decision_to_treat |
| 3 | Head & Neck | integrated-anatomic-22 | true | 3 | 38 | urgent_referral |
| 4 | Lung | seasonal-anatomic-23 | false | 4 | 45 | decision_to_treat |

This view inverts the perspective, answering: which waiting-time targets apply to each cancer type? For cancer type 3 (Head & Neck, clinical code 16121), the view would reveal links to target 3 (38 days, national standard) and potentially others through the many-to-many relationship. This view supports clinical planning by showing the full set of targets that govern a given malignancy.

**View `v_n_h_s_board_cancer_waiting_time_target`**

```sql
CREATE VIEW v_n_h_s_board_cancer_waiting_time_target AS
SELECT a.id, a.board_name, a.is_island_board, a.region, b.id AS target_id, b.target_duration AS target_target_duration, b.triggering_clinical_event AS target_triggering_clinical_event
FROM n_h_s_boards a JOIN cancer_waiting_time_targets b ON a.cancer_waiting_time_target_id = b.id;
```

| id | board_name | is_island_board | region | target_id | target_target_duration | target_triggering_clinical_event |
|---|---|---|---|---|---|---|
| 100 | Compact Series | true | distributed-region-12 | 1 | 24 | urgent_referral |
| 101 | Legacy Assessment | false | baseline-region-13 | 2 | 31 | decision_to_treat |
| 102 | Regional Survey A | true | pilot-region-14 | 3 | 38 | urgent_referral |
| 103 | Seasonal Corridor | false | extended-region-15 | 4 | 45 | decision_to_treat |

This view presents the board-centric counterpart to the previous one, answering: which waiting-time targets does each NHS board administer? NHS board 103 (Seasonal Corridor, extended-region-15) would appear linked to target 4 (45 days, decision to treat, active status). This view is particularly useful for regional administrators who need to understand the full portfolio of targets under their jurisdiction.

**View `v_n_h_s_board_waiting_time_statistic_detail`**

```sql
CREATE VIEW v_n_h_s_board_waiting_time_statistic_detail AS
SELECT a.id, a.board_name, a.is_island_board, b.waiting_time_statistic_id AS statistic_waiting_time_statistic_id, b.reporting_period AS statistic_reporting_period, b.compliance_percentage AS statistic_compliance_percentage
FROM n_h_s_boards a
  JOIN boards_statistics j ON j.n_h_s_board_id = a.id
  JOIN waiting_time_statistics b ON b.waiting_time_statistic_id = j.waiting_time_statistic_id;
```

| id | board_name | is_island_board | statistic_waiting_time_statistic_id | statistic_reporting_period | statistic_compliance_percentage |
|---|---|---|---|---|---|
| 100 | Compact Series | true | 1000 | 2023-06-18 | 3.95 |
| 100 | Compact Series | true | 1001 | 2024-11-02 | 7.90 |
| 101 | Legacy Assessment | false | 1001 | 2024-11-02 | 7.90 |
| 101 | Legacy Assessment | false | 1002 | 2025-04-13 | 11.85 |
| 102 | Regional Survey A | true | 1002 | 2025-04-13 | 11.85 |
| 102 | Regional Survey A | true | 1003 | 2022-09-24 | 15.80 |
| 103 | Seasonal Corridor | false | 1003 | 2022-09-24 | 15.80 |
| 103 | Seasonal Corridor | false | 1000 | 2023-06-18 | 3.95 |

This view enriches board-level statistics with board metadata, answering: how is each board performing, and what are its administrative characteristics? A row might combine NHS board 102 (Regional Survey A, island board, subject-to-change status) with waiting-time statistic 1002 (reporting period 2025-04-13, 11.85 percent compliance, 0 eligible patients, final data quality). This view enables administrators to contextualize performance numbers within the board's operational profile.

**View `v_waiting_time_statistic_cancer_waiting_time_target`**

```sql
CREATE VIEW v_waiting_time_statistic_cancer_waiting_time_target AS
SELECT a.waiting_time_statistic_id, a.reporting_period, a.compliance_percentage, a.eligible_patient_count, b.id AS target_id, b.target_duration AS target_target_duration, b.triggering_clinical_event AS target_triggering_clinical_event
FROM waiting_time_statistics a JOIN cancer_waiting_time_targets b ON a.cancer_waiting_time_target_id = b.id;
```

| waiting_time_statistic_id | reporting_period | compliance_percentage | eligible_patient_count | target_id | target_target_duration | target_triggering_clinical_event |
|---|---|---|---|---|---|---|
| 1000 | 2023-06-18 | 3.95 | 5 | 1 | 24 | urgent_referral |
| 1001 | 2024-11-02 | 7.90 | 11 | 2 | 31 | decision_to_treat |
| 1002 | 2025-04-13 | 11.85 | 0 | 3 | 38 | urgent_referral |
| 1003 | 2022-09-24 | 15.80 | 33 | 4 | 45 | decision_to_treat |

This view links statistical measurements back to their governing targets, answering: which target is each statistic measuring, and how closely did performance align with the target? A row might pair waiting-time statistic 1000 (3.95 percent compliance, 85 treatments started) with target 1 (24-day target, 18.45 percent tolerance). This view is critical for compliance monitoring, as it directly compares observed performance against defined thresholds.

**View `v_waiting_time_statistic_n_h_s_board`**

```sql
CREATE VIEW v_waiting_time_statistic_n_h_s_board AS
SELECT a.waiting_time_statistic_id, a.reporting_period, a.compliance_percentage, a.eligible_patient_count, b.id AS board_id, b.board_name AS board_board_name, b.is_island_board AS board_is_island_board
FROM waiting_time_statistics a JOIN n_h_s_boards b ON a.n_h_s_board_id = b.id;
```

| waiting_time_statistic_id | reporting_period | compliance_percentage | eligible_patient_count | board_id | board_board_name | board_is_island_board |
|---|---|---|---|---|---|---|
| 1000 | 2023-06-18 | 3.95 | 5 | 100 | Compact Series | true |
| 1001 | 2024-11-02 | 7.90 | 11 | 101 | Legacy Assessment | false |
| 1002 | 2025-04-13 | 11.85 | 0 | 102 | Regional Survey A | true |
| 1003 | 2022-09-24 | 15.80 | 33 | 103 | Seasonal Corridor | false |

This view connects statistics to their responsible boards, answering: which board generated each statistic, and what is its reporting status? A row might combine waiting-time statistic 1001 (7.90 percent compliance, provisional quality) with NHS board 101 (Legacy Assessment, preliminary reporting status). This view supports data governance by allowing administrators to trace statistics back to their source organizations and assess the reliability of reported figures.

**View `v_waiting_time_statistic_cancer_type`**

```sql
CREATE VIEW v_waiting_time_statistic_cancer_type AS
SELECT a.waiting_time_statistic_id, a.reporting_period, a.compliance_percentage, a.eligible_patient_count, b.id AS type_id, b.cancer_name AS type_cancer_name, b.anatomical_region AS type_anatomical_region
FROM waiting_time_statistics a JOIN cancer_types b ON a.cancer_type_id = b.id;
```

| waiting_time_statistic_id | reporting_period | compliance_percentage | eligible_patient_count | type_id | type_cancer_name | type_anatomical_region |
|---|---|---|---|---|---|---|
| 1000 | 2023-06-18 | 3.95 | 5 | 1 | Breast | pilot-anatomic-20 |
| 1001 | 2024-11-02 | 7.90 | 11 | 2 | Colorectal | extended-anatomic-21 |
| 1002 | 2025-04-13 | 11.85 | 0 | 3 | Head & Neck | integrated-anatomic-22 |
| 1003 | 2022-09-24 | 15.80 | 33 | 4 | Lung | seasonal-anatomic-23 |

This view ties statistics to the cancer types they measure, answering: which malignancy does each statistic pertain to, and what are its clinical attributes? A row might link waiting-time statistic 1003 (15.80 percent compliance, 25.80 percentile-90) with cancer type 4 (Lung, seasonal-anatomic-23, clinical code 4793492). This view enables clinical quality improvement by isolating performance data for specific cancer types.

**View `v_patient_cohort_cancer_type`**

```sql
CREATE VIEW v_patient_cohort_cancer_type AS
SELECT a.patient_cohort_id, a.age_threshold, a.diagnosis_date, a.referral_route, b.id AS type_id, b.cancer_name AS type_cancer_name, b.anatomical_region AS type_anatomical_region
FROM patient_cohorts a JOIN cancer_types b ON a.cancer_type_id = b.id;
```

| patient_cohort_id | age_threshold | diagnosis_date | referral_route | type_id | type_cancer_name | type_anatomical_region |
|---|---|---|---|---|---|---|
| 1 | 22 | 2023-10-26 | urgent | 1 | Breast | pilot-anatomic-20 |
| 2 | 26 | 2024-03-10 | screened_positive | 2 | Colorectal | extended-anatomic-21 |
| 3 | 30 | 2025-08-21 | standard | 3 | Head & Neck | integrated-anatomic-22 |
| 4 | 34 | 2022-01-05 | urgent | 4 | Lung | seasonal-anatomic-23 |

This view connects patient cohorts to their clinical classifications, answering: which cancer type does each cohort represent, and what are its defining characteristics? A row might pair patient cohort 3 (age threshold 30, standard referral, 41 patients) with cancer type 3 (Head & Neck, integrated-anatomic-22, primary diagnosis). This view supports epidemiological analysis by aligning population data with clinical taxonomy.

**View `v_patient_cohort_n_h_s_board`**

```sql
CREATE VIEW v_patient_cohort_n_h_s_board AS
SELECT a.patient_cohort_id, a.age_threshold, a.diagnosis_date, a.referral_route, b.id AS board_id, b.board_name AS board_board_name, b.is_island_board AS board_is_island_board
FROM patient_cohorts a JOIN n_h_s_boards b ON a.n_h_s_board_id = b.id;
```

| patient_cohort_id | age_threshold | diagnosis_date | referral_route | board_id | board_board_name | board_is_island_board |
|---|---|---|---|---|---|---|
| 1 | 22 | 2023-10-26 | urgent | 100 | Compact Series | true |
| 2 | 26 | 2024-03-10 | screened_positive | 101 | Legacy Assessment | false |
| 3 | 30 | 2025-08-21 | standard | 102 | Regional Survey A | true |
| 4 | 34 | 2022-01-05 | urgent | 103 | Seasonal Corridor | false |

This view links patient cohorts to their regional administrators, answering: which NHS board is responsible for each patient cohort, and what is its operational status? A row might combine patient cohort 4 (age threshold 34, urgent referral, 51 patients) with NHS board 103 (Seasonal Corridor, extended-region-15, finalised reporting status). This view is essential for resource planning, as it shows which organizations are managing which patient populations and can inform staffing and capacity decisions.

## Synthesis

The waiting-time governance ecosystem described here operates as an integrated system of commitments, measurements, and accountability structures. Waiting-time targets define the standards; NHS boards assume responsibility for meeting them; cancer types specify the clinical scope; patient cohorts identify the populations affected; and waiting-time statistics provide the evidence of performance. The junction tables and joined views bind these elements together, enabling analysis at any level of aggregation—from individual patient cohorts to board-wide compliance trends. This architecture supports both operational management, by providing real-time visibility into target adherence, and strategic planning, by revealing patterns across cancer types, regions, and referral pathways. The data model is designed not merely to record outcomes but to illuminate the relationships between clinical priorities, organizational responsibilities, and patient experiences, ensuring that the system can adapt targets, reallocate resources, and improve care delivery with precision.