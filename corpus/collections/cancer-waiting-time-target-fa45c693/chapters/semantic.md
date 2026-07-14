The chapter is complete. All 7 table markers and all 10 view markers are present exactly once, and the word count is 1,891 — within the 1,500–2,500 target range. The file has been written to `/tmp/harness_semantic_ka779dji/chapter_07_cancer_waiting_time_schema.md`.

## Data appendix

**Table `cancer_waiting_time_targets`**

| id | target_duration | triggering_clinical_event | tolerance_percentage | implementation_date | status | n_h_s_board_id |
|---|---|---|---|---|---|---|
| 1 | 24 | urgent_referral | 18.45 | 2024-11-14 | active | 100 |
| 2 | 31 | decision_to_treat | 22.90 | 2025-04-25 | legacy | 101 |
| 3 | 38 | urgent_referral | 27.35 | 2022-09-09 | national_standard | 102 |
| 4 | 45 | decision_to_treat | 31.80 | 2023-02-20 | active | 103 |

**Table `cancer_types`**

| id | cancer_name | anatomical_region | is_primary | clinical_code | cancer_waiting_time_target_id |
|---|---|---|---|---|---|
| 1 | Breast | pilot-anatomic-20 | true | 1290 | 1 |
| 2 | Colorectal | extended-anatomic-21 | false | 974944 | 2 |
| 3 | Head & Neck | integrated-anatomic-22 | true | 16121 | 3 |
| 4 | Lung | seasonal-anatomic-23 | false | 4793492 | 4 |

**Table `n_h_s_boards`**

| id | board_name | is_island_board | region | reporting_status | cancer_waiting_time_target_id |
|---|---|---|---|---|---|
| 100 | Compact Series | true | distributed-region-12 | finalised | 1 |
| 101 | Legacy Assessment | false | baseline-region-13 | preliminary | 2 |
| 102 | Regional Survey A | true | pilot-region-14 | subject_to_change | 3 |
| 103 | Seasonal Corridor | false | extended-region-15 | finalised | 4 |

**Table `waiting_time_statistics`**

| waiting_time_statistic_id | reporting_period | compliance_percentage | eligible_patient_count | treatment_start_count | percentile90 | data_quality | cancer_waiting_time_target_id | n_h_s_board_id | cancer_type_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2023-06-18 | 3.95 | 5 | 85 | 20.70 | final | 1 | 100 | 1 |
| 1001 | 2024-11-02 | 7.90 | 11 | 10 | 22.40 | provisional | 2 | 101 | 2 |
| 1002 | 2025-04-13 | 11.85 | 0 | 15 | 24.10 | final | 3 | 102 | 3 |
| 1003 | 2022-09-24 | 15.80 | 33 | 11 | 25.80 | provisional | 4 | 103 | 4 |

**Table `patient_cohorts`**

| patient_cohort_id | age_threshold | diagnosis_date | referral_route | cohort_size | cancer_type_id | n_h_s_board_id |
|---|---|---|---|---|---|---|
| 1 | 22 | 2023-10-26 | urgent | 21 | 1 | 100 |
| 2 | 26 | 2024-03-10 | screened_positive | 31 | 2 | 101 |
| 3 | 30 | 2025-08-21 | standard | 41 | 3 | 102 |
| 4 | 34 | 2022-01-05 | urgent | 51 | 4 | 103 |

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
