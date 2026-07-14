Cancer waiting time targets form the backbone of performance management across health boards, establishing measurable commitments between patient referral and treatment initiation. These targets are not abstract benchmarks; they are operational instruments tied to specific cancer types, geographic jurisdictions, and patient cohorts. Each target carries an effective date, a tolerance percentage, and a status that signals whether it is currently enforced, superseded, or codified as a national standard. Health boards administer these targets within their regions, while patient cohorts accumulate the raw compliance data that feeds into statistical reports. The system records every layer of this chain—from the classification of a cancer type through the ICD-10 code to the final publication of a statistical report—so that auditors, clinicians, and policymakers can trace a single compliance figure back to its originating target and its governing board.

## Target Definitions and Cancer Classifications

The foundation of the waiting-time regime is the set of targets themselves, each of which specifies a time window, a tolerance band, and the population to which it applies.

**Table `CancerWaitingTimeTarget`**

| targetId | targetIdentifier | effectiveDate | tolerancePercentage | targetStatus | applicablePatientAgeMinimum | typeId | boardId |
|---|---|---|---|---|---|---|---|
| 1 | 62-day-urgent-referral | 2023-02-14 | 18.45 | active | 35 | 1 | 1 |
| 2 | 31-day-decision-to-treat | 2024-07-25 | 22.90 | legacy | 42 | 2 | 2 |
| 3 | 62-day-urgent-referral | 2025-12-09 | 27.35 | national-standard | 49 | 3 | 3 |
| 4 | 31-day-decision-to-treat | 2022-05-20 | 31.80 | active | 56 | 4 | 4 |

A target such as `62-day-urgent-referral` (target identifier `62-day-urgent-referral`, effective from 2023-02-14) carries a tolerance of 18.45 percent and applies to patients aged thirty-five and above. Its status is `active`, meaning it is currently in force. By contrast, the target `31-day-decision-to-treat` with identifier `31-day-decision-to-treat` (effective 2024-07-25) has a tolerance of 22.90 percent and a status of `legacy`, indicating it has been superseded but remains on record for historical comparison. The national-standard target `62-day-urgent-referral` (effective 2025-12-09, tolerance 27.35 percent) applies to patients aged forty-nine and above and is designated as the authoritative benchmark for its category.

Each target is associated with a cancer type through the foreign key `typeId`, linking to the cancer classification table.

**Table `CancerType`**

| id | cancerTypeName | icd10Code | isPrimaryCancer | targetId | createdAt | updatedAt |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | d65ed5c0-8fc1-11eb-924d-9cd76263cbd0 | false | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Composite Initiative | 2087750 | true | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Compact Model | 1208-0004-XL | false | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Legacy Cluster D | 505983 | true | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Cancer types in this system are identified by a human-readable name and an ICD-10 code. The code may be a standard alphanumeric classification such as `d65ed5c0-8fc1-11eb-924d-9cd76263cbd0` for Primary Review A, or a numeric code like `2087750` for Composite Initiative. The flag `isPrimaryCancer` distinguishes primary diagnoses from composite or cluster initiatives. Primary Review A is marked as non-primary (`false`), whereas Composite Initiative and Legacy Cluster D are flagged as primary (`true`). Compact Model is non-primary. Every cancer type record carries a `createdAt` and `updatedAt` timestamp, enabling auditors to track when a classification was introduced or revised.

The join between targets and cancer types produces a view that pairs each target with the cancer classification it governs.

**View `v_cancer_waiting_time_target_cancer_type`**

```sql
CREATE VIEW v_cancer_waiting_time_target_cancer_type AS
SELECT a.targetId, a.targetIdentifier, a.effectiveDate, a.tolerancePercentage, b.id AS type_id, b.cancerTypeName AS type_cancerTypeName, b.icd10Code AS type_icd10Code
FROM CancerWaitingTimeTarget a JOIN CancerType b ON a.typeId = b.id;
```

| targetId | targetIdentifier | effectiveDate | tolerancePercentage | type_id | type_cancerTypeName | type_icd10Code |
|---|---|---|---|---|---|---|
| 1 | 62-day-urgent-referral | 2023-02-14 | 18.45 | 1 | Primary Review A | d65ed5c0-8fc1-11eb-924d-9cd76263cbd0 |
| 2 | 31-day-decision-to-treat | 2024-07-25 | 22.90 | 2 | Composite Initiative | 2087750 |
| 3 | 62-day-urgent-referral | 2025-12-09 | 27.35 | 3 | Compact Model | 1208-0004-XL |
| 4 | 31-day-decision-to-treat | 2022-05-20 | 31.80 | 4 | Legacy Cluster D | 505983 |

This view answers the question: which cancer type is associated with each waiting-time target? The first row shows that target `62-day-urgent-referral` (effective 2023-02-14, tolerance 18.45 percent) is linked to cancer type `Primary Review A` with ICD-10 code `d65ed5c0-8fc1-11eb-924d-9cd76263cbd0`. The second row pairs the legacy target `31-day-decision-to-treat` with `Composite Initiative` (code `2087750`). The third row associates the national-standard target with `Compact Model` (code `1208-0004-XL`), and the fourth row links the remaining legacy target to `Legacy Cluster D` (code `505983`). Because the join condition matches `CancerWaitingTimeTarget.typeId` to `CancerType.id`, every row in this view represents a one-to-one pairing that is guaranteed to exist in the underlying data.

The reverse join—cancer type as the driving table—produces an equivalent view that starts from the cancer classification and resolves the associated target.

**View `v_cancer_type_cancer_waiting_time_target`**

```sql
CREATE VIEW v_cancer_type_cancer_waiting_time_target AS
SELECT a.id, a.cancerTypeName, a.icd10Code, a.isPrimaryCancer, b.targetId AS target_targetId, b.targetIdentifier AS target_targetIdentifier, b.effectiveDate AS target_effectiveDate
FROM CancerType a JOIN CancerWaitingTimeTarget b ON a.targetId = b.targetId;
```

| id | cancerTypeName | icd10Code | isPrimaryCancer | target_targetId | target_targetIdentifier | target_effectiveDate |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | d65ed5c0-8fc1-11eb-924d-9cd76263cbd0 | false | 1 | 62-day-urgent-referral | 2023-02-14 |
| 2 | Composite Initiative | 2087750 | true | 2 | 31-day-decision-to-treat | 2024-07-25 |
| 3 | Compact Model | 1208-0004-XL | false | 3 | 62-day-urgent-referral | 2025-12-09 |
| 4 | Legacy Cluster D | 505983 | true | 4 | 31-day-decision-to-treat | 2022-05-20 |

This view answers the complementary question: for each cancer type, what is the associated waiting-time target? The first row reads `Primary Review A` (ICD-10 `d65ed5c0-8fc1-11eb-924d-9cd76263cbd0`) and resolves to target `62-day-urgent-referral` with tolerance 18.45 percent. The second row shows `Composite Initiative` (code `2087750`) paired with the legacy target `31-day-decision-to-treat` (tolerance 22.90 percent). The third row maps `Compact Model` to the national-standard target (tolerance 27.35 percent), and the fourth row maps `Legacy Cluster D` to the remaining legacy target (tolerance 31.80 percent). The column aliases—prefixed with `type_` for cancer-type fields and unqualified for target fields—make it straightforward to distinguish which attributes belong to which entity.

## Health Board Jurisdictions

Targets are not applied uniformly across the health system; they are administered by individual NHS boards, each responsible for a defined region.

**Table `NHSBoard`**

| id | boardName | isMainland | regionCode | targetId |
|---|---|---|---|---|
| 1 | Compact Series | false | 1562837 | 1 |
| 2 | Legacy Assessment | true | 6564391 | 2 |
| 3 | Regional Survey A | false | 778560 | 3 |
| 4 | Seasonal Corridor | true | 8667ec1da10c4a0293d91388b49bc77c | 4 |

The board table records the name of each board, whether it operates on the mainland (`isMainland`), a region code, and the target it is currently administering. Compact Series (region code `1562837`) is a non-mainland board administering target `62-day-urgent-referral` (target ID 1). Legacy Assessment (region code `6564391`) is a mainland board administering the legacy target `31-day-decision-to-treat` (target ID 2). Regional Survey A (region code `778560`) is non-mainland and administers the national-standard target (target ID 3). Seasonal Corridor (region code `8667ec1da10c4a0293d91388b49bc77c`) is mainland and administers the fourth legacy target (target ID 4). The region code may be a plain integer or a hexadecimal string, reflecting the diversity of coding schemes across jurisdictions.

The join between targets and boards produces a view that reveals which board is responsible for each target.

**View `v_cancer_waiting_time_target_n_h_s_board`**

```sql
CREATE VIEW v_cancer_waiting_time_target_n_h_s_board AS
SELECT a.targetId, a.targetIdentifier, a.effectiveDate, a.tolerancePercentage, b.id AS board_id, b.boardName AS board_boardName, b.isMainland AS board_isMainland
FROM CancerWaitingTimeTarget a JOIN NHSBoard b ON a.boardId = b.id;
```

| targetId | targetIdentifier | effectiveDate | tolerancePercentage | board_id | board_boardName | board_isMainland |
|---|---|---|---|---|---|---|
| 1 | 62-day-urgent-referral | 2023-02-14 | 18.45 | 1 | Compact Series | false |
| 2 | 31-day-decision-to-treat | 2024-07-25 | 22.90 | 2 | Legacy Assessment | true |
| 3 | 62-day-urgent-referral | 2025-12-09 | 27.35 | 3 | Regional Survey A | false |
| 4 | 31-day-decision-to-treat | 2022-05-20 | 31.80 | 4 | Seasonal Corridor | true |

This view answers: which NHS board administers each waiting-time target? The first row shows that target `62-day-urgent-referral` (effective 2023-02-14, tolerance 18.45 percent) is administered by Compact Series, a non-mainland board in region `1562837`. The second row pairs the legacy target `31-day-decision-to-treat` with Legacy Assessment, a mainland board in region `6564391`. The third row associates the national-standard target with Regional Survey A (non-mainland, region `778560`), and the fourth row links the remaining legacy target to Seasonal Corridor (mainland, region `8667ec1da10c4a0293d91388b49bc77c`). The column aliases—prefixed with `n_h_s_board_` for board attributes—keep the two entity namespaces distinct.

The reverse join starts from the board and resolves the target it administers.

**View `v_n_h_s_board_cancer_waiting_time_target`**

```sql
CREATE VIEW v_n_h_s_board_cancer_waiting_time_target AS
SELECT a.id, a.boardName, a.isMainland, a.regionCode, b.targetId AS target_targetId, b.targetIdentifier AS target_targetIdentifier, b.effectiveDate AS target_effectiveDate
FROM NHSBoard a JOIN CancerWaitingTimeTarget b ON a.targetId = b.targetId;
```

| id | boardName | isMainland | regionCode | target_targetId | target_targetIdentifier | target_effectiveDate |
|---|---|---|---|---|---|---|
| 1 | Compact Series | false | 1562837 | 1 | 62-day-urgent-referral | 2023-02-14 |
| 2 | Legacy Assessment | true | 6564391 | 2 | 31-day-decision-to-treat | 2024-07-25 |
| 3 | Regional Survey A | false | 778560 | 3 | 62-day-urgent-referral | 2025-12-09 |
| 4 | Seasonal Corridor | true | 8667ec1da10c4a0293d91388b49bc77c | 4 | 31-day-decision-to-treat | 2022-05-20 |

This view answers: for each NHS board, what is the associated waiting-time target? The first row reads Compact Series (non-mainland, region `1562837`) and resolves to target `62-day-urgent-referral` (tolerance 18.45 percent, status `active`). The second row shows Legacy Assessment (mainland, region `6564391`) paired with the legacy target `31-day-decision-to-treat` (tolerance 22.90 percent). The third row maps Regional Survey A to the national-standard target (tolerance 27.35 percent), and the fourth row maps Seasonal Corridor to the remaining legacy target (tolerance 31.80 percent). As with the forward join, the one-to-one relationship between board and target is preserved in both directions.

## Patient Cohorts and Compliance Metrics

The operational heart of the system is the patient cohort, which aggregates the actual treatment data for a defined population over a specified diagnosis window.

**Table `PatientCohort`**

| cohortId | cohortIdentifier | diagnosisDateRangeStart | diagnosisDateRangeEnd | totalEligiblePatients | patientsTreatedWithinTarget | compliancePercentage | typeId | boardId | targetId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | COH-2349 | 2024-03-04 | 2025-08-15 | 5 | 37 | 3.95 | 1 | 1 | 1 |
| 2 | COH-2350 | 2025-08-15 | 2022-01-26 | 85 | 42 | 7.90 | 2 | 2 | 2 |
| 3 | COH-2351 | 2022-01-26 | 2023-06-10 | 21 | 47 | 11.85 | 3 | 3 | 3 |
| 4 | COH-2352 | 2023-06-10 | 2024-11-21 | 52 | 52 | 15.80 | 4 | 4 | 4 |

Each cohort is identified by a unique code such as `COH-2349` and spans a diagnosis date range from `diagnosisDateRangeStart` to `diagnosisDateRangeEnd`. The cohort records the total number of eligible patients, the number treated within the target window, and the resulting compliance percentage. Cohort `COH-2349` covers diagnoses from 2024-03-04 to 2025-08-15, includes 5 eligible patients, of whom 37 were treated within target, yielding a compliance percentage of 3.95. Cohort `COH-2350` spans 2025-08-15 to 2022-01-26 (a reversed range, suggesting a data entry anomaly or a cross-year reporting period), includes 85 eligible patients, of whom 42 were treated within target, with a compliance of 7.90 percent. Cohort `COH-2351` covers 2022-01-26 to 2023-06-10, includes 21 eligible patients, of whom 47 were treated within target, with a compliance of 11.85 percent. Cohort `COH-2352` covers 2023-06-10 to 2024-11-21, includes 52 eligible patients, all 52 treated within target, with a compliance of 15.80 percent.

Each cohort is linked to a cancer type (`typeId`), an NHS board (`boardId`), and a target (`targetId`), forming a three-way association that anchors the compliance data to its clinical, geographic, and regulatory context.

The join between patient cohorts and cancer types reveals the clinical classification underlying each compliance record.

**View `v_patient_cohort_cancer_type`**

```sql
CREATE VIEW v_patient_cohort_cancer_type AS
SELECT a.cohortId, a.cohortIdentifier, a.diagnosisDateRangeStart, a.diagnosisDateRangeEnd, b.id AS type_id, b.cancerTypeName AS type_cancerTypeName, b.icd10Code AS type_icd10Code
FROM PatientCohort a JOIN CancerType b ON a.typeId = b.id;
```

| cohortId | cohortIdentifier | diagnosisDateRangeStart | diagnosisDateRangeEnd | type_id | type_cancerTypeName | type_icd10Code |
|---|---|---|---|---|---|---|
| 1 | COH-2349 | 2024-03-04 | 2025-08-15 | 1 | Primary Review A | d65ed5c0-8fc1-11eb-924d-9cd76263cbd0 |
| 2 | COH-2350 | 2025-08-15 | 2022-01-26 | 2 | Composite Initiative | 2087750 |
| 3 | COH-2351 | 2022-01-26 | 2023-06-10 | 3 | Compact Model | 1208-0004-XL |
| 4 | COH-2352 | 2023-06-10 | 2024-11-21 | 4 | Legacy Cluster D | 505983 |

This view answers: which cancer type does each patient cohort relate to? The first row shows cohort `COH-2349` (5 eligible patients, 37 treated within target, compliance 3.95 percent) associated with cancer type `Primary Review A` (ICD-10 `d65ed5c0-8fc1-11eb-924d-9cd76263cbd0`). The second row links cohort `COH-2350` (85 eligible, 42 treated, compliance 7.90 percent) to `Composite Initiative` (code `2087750`). The third row associates cohort `COH-2351` (21 eligible, 47 treated, compliance 11.85 percent) with `Compact Model` (code `1208-0004-XL`), and the fourth row links cohort `COH-2352` (52 eligible, 52 treated, compliance 15.80 percent) to `Legacy Cluster D` (code `505983`). The column aliases—prefixed with `type_` for cancer-type fields—keep the namespaces clear.

The join between patient cohorts and NHS boards reveals the geographic jurisdiction for each compliance record.

**View `v_patient_cohort_n_h_s_board`**

```sql
CREATE VIEW v_patient_cohort_n_h_s_board AS
SELECT a.cohortId, a.cohortIdentifier, a.diagnosisDateRangeStart, a.diagnosisDateRangeEnd, b.id AS board_id, b.boardName AS board_boardName, b.isMainland AS board_isMainland
FROM PatientCohort a JOIN NHSBoard b ON a.boardId = b.id;
```

| cohortId | cohortIdentifier | diagnosisDateRangeStart | diagnosisDateRangeEnd | board_id | board_boardName | board_isMainland |
|---|---|---|---|---|---|---|
| 1 | COH-2349 | 2024-03-04 | 2025-08-15 | 1 | Compact Series | false |
| 2 | COH-2350 | 2025-08-15 | 2022-01-26 | 2 | Legacy Assessment | true |
| 3 | COH-2351 | 2022-01-26 | 2023-06-10 | 3 | Regional Survey A | false |
| 4 | COH-2352 | 2023-06-10 | 2024-11-21 | 4 | Seasonal Corridor | true |

This view answers: which NHS board is responsible for each patient cohort? The first row shows cohort `COH-2349` (compliance 3.95 percent) administered by Compact Series, a non-mainland board in region `1562837`. The second row links cohort `COH-2350` (compliance 7.90 percent) to Legacy Assessment, a mainland board in region `6564391`. The third row associates cohort `COH-2351` (compliance 11.85 percent) with Regional Survey A (non-mainland, region `778560`), and the fourth row links cohort `COH-2352` (compliance 15.80 percent) to Seasonal Corridor (mainland, region `8667ec1da10c4a0293d91388b49bc77c`). The column aliases—prefixed with `n_h_s_board_` for board attributes—maintain clear separation between cohort and board data.

The three-way join between patient cohorts, cancer types, and targets produces a comprehensive view that anchors compliance data to both its clinical and regulatory context.

**View `v_patient_cohort_cancer_waiting_time_target`**

```sql
CREATE VIEW v_patient_cohort_cancer_waiting_time_target AS
SELECT a.cohortId, a.cohortIdentifier, a.diagnosisDateRangeStart, a.diagnosisDateRangeEnd, b.targetId AS target_targetId, b.targetIdentifier AS target_targetIdentifier, b.effectiveDate AS target_effectiveDate
FROM PatientCohort a JOIN CancerWaitingTimeTarget b ON a.targetId = b.targetId;
```

| cohortId | cohortIdentifier | diagnosisDateRangeStart | diagnosisDateRangeEnd | target_targetId | target_targetIdentifier | target_effectiveDate |
|---|---|---|---|---|---|---|
| 1 | COH-2349 | 2024-03-04 | 2025-08-15 | 1 | 62-day-urgent-referral | 2023-02-14 |
| 2 | COH-2350 | 2025-08-15 | 2022-01-26 | 2 | 31-day-decision-to-treat | 2024-07-25 |
| 3 | COH-2351 | 2022-01-26 | 2023-06-10 | 3 | 62-day-urgent-referral | 2025-12-09 |
| 4 | COH-2352 | 2023-06-10 | 2024-11-21 | 4 | 31-day-decision-to-treat | 2022-05-20 |

This view answers: for each patient cohort, what is the associated cancer type and waiting-time target? The first row shows cohort `COH-2349` (compliance 3.95 percent) linked to cancer type `Primary Review A` (ICD-10 `d65ed5c0-8fc1-11eb-924d-9cd76263cbd0`) and target `62-day-urgent-referral` (tolerance 18.45 percent, status `active`). The second row links cohort `COH-2350` (compliance 7.90 percent) to `Composite Initiative` (code `2087750`) and the legacy target `31-day-decision-to-treat` (tolerance 22.90 percent). The third row associates cohort `COH-2351` (compliance 11.85 percent) with `Compact Model` (code `1208-0004-XL`) and the national-standard target (tolerance 27.35 percent). The fourth row links cohort `COH-2352` (compliance 15.80 percent) to `Legacy Cluster D` (code `505983`) and the remaining legacy target (tolerance 31.80 percent). This view is the primary analytical lens for comparing actual compliance against target tolerances across cancer types.

## Statistical Reports and Publication

The final layer of the system is the statistical report, which formalizes the aggregation and publication of compliance data for external consumption.

**Table `StatisticalReport`**

| reportId | reportTitle | publicationDate | reportingPeriodStart | reportingPeriodEnd | statisticsClassification | publisherName | cohortId | boardId |
|---|---|---|---|---|---|---|---|---|
| 1000 | Composite Protocol | 2025-12-01 | 2023-02-20 | 2024-03-23 | National Statistics | Regional Protocol | 1 | 1 |
| 1001 | Compact Programme A | 2022-05-12 | 2024-07-04 | 2025-08-07 | Official Statistics | Seasonal Programme D | 2 | 2 |
| 1002 | Legacy Standard | 2023-10-23 | 2025-12-15 | 2022-01-18 | Legacy | Integrated Standard | 3 | 3 |
| 1003 | Regional Framework | 2024-03-07 | 2022-05-26 | 2023-06-02 | Other | Extended Framework | 4 | 4 |

Each report carries a title, a publication date, a reporting period, a statistics classification, and a publisher name. Report `Composite Protocol` (report ID 1000) was published on 2025-12-01, covers the period from 2023-02-20 to 2024-03-23, is classified as National Statistics, and is published by Regional Protocol. It is linked to cohort `COH-2349` and board Compact Series. Report `Compact Programme A` (report ID 1001) was published on 2022-05-12, covers 2024-07-04 to 2025-08-07, is classified as Official Statistics, and is published by Seasonal Programme D. It is linked to cohort `COH-2350` and board Legacy Assessment. Report `Legacy Standard` (report ID 1002) was published on 2023-10-23, covers 2025-12-15 to 2022-01-18, is classified as Legacy, and is published by Integrated Standard. It is linked to cohort `COH-2351` and board Regional Survey A. Report `Regional Framework` (report ID 1003) was published on 2024-03-07, covers 2022-05-26 to 2023-06-02, is classified as Other, and is published by Extended Framework. It is linked to cohort `COH-2352` and board Seasonal Corridor.

The statistics classification—National Statistics, Official Statistics, Legacy, or Other—indicates the formal standing of the published data under UK statistical governance. The reporting period may span forward or backward in time relative to the publication date, reflecting the retrospective nature of compliance aggregation.

The join between statistical reports and patient cohorts reveals which cohort data underpins each published report.

**View `v_statistical_report_patient_cohort`**

```sql
CREATE VIEW v_statistical_report_patient_cohort AS
SELECT a.reportId, a.reportTitle, a.publicationDate, a.reportingPeriodStart, b.cohortId AS cohort_cohortId, b.cohortIdentifier AS cohort_cohortIdentifier, b.diagnosisDateRangeStart AS cohort_diagnosisDateRangeStart
FROM StatisticalReport a JOIN PatientCohort b ON a.cohortId = b.cohortId;
```

| reportId | reportTitle | publicationDate | reportingPeriodStart | cohort_cohortId | cohort_cohortIdentifier | cohort_diagnosisDateRangeStart |
|---|---|---|---|---|---|---|
| 1000 | Composite Protocol | 2025-12-01 | 2023-02-20 | 1 | COH-2349 | 2024-03-04 |
| 1001 | Compact Programme A | 2022-05-12 | 2024-07-04 | 2 | COH-2350 | 2025-08-15 |
| 1002 | Legacy Standard | 2023-10-23 | 2025-12-15 | 3 | COH-2351 | 2022-01-26 |
| 1003 | Regional Framework | 2024-03-07 | 2022-05-26 | 4 | COH-2352 | 2023-06-10 |

This view answers: which patient cohort does each statistical report draw from? The first row shows report `Composite Protocol` (published 2025-12-01, classification National Statistics) drawing from cohort `COH-2349` (5 eligible patients, 37 treated within target, compliance 3.95 percent). The second row links report `Compact Programme A` (published 2022-05-12, classification Official Statistics) to cohort `COH-2350` (85 eligible, 42 treated, compliance 7.90 percent). The third row associates report `Legacy Standard` (published 2023-10-23, classification Legacy) with cohort `COH-2351` (21 eligible, 47 treated, compliance 11.85 percent), and the fourth row links report `Regional Framework` (published 2024-03-07, classification Other) to cohort `COH-2352` (52 eligible, 52 treated, compliance 15.80 percent). The column aliases—prefixed with `cohort_` for cohort fields—keep the report and cohort namespaces distinct.

The join between statistical reports and NHS boards reveals the geographic jurisdiction of each published report.

**View `v_statistical_report_n_h_s_board`**

```sql
CREATE VIEW v_statistical_report_n_h_s_board AS
SELECT a.reportId, a.reportTitle, a.publicationDate, a.reportingPeriodStart, b.id AS board_id, b.boardName AS board_boardName, b.isMainland AS board_isMainland
FROM StatisticalReport a JOIN NHSBoard b ON a.boardId = b.id;
```

| reportId | reportTitle | publicationDate | reportingPeriodStart | board_id | board_boardName | board_isMainland |
|---|---|---|---|---|---|---|
| 1000 | Composite Protocol | 2025-12-01 | 2023-02-20 | 1 | Compact Series | false |
| 1001 | Compact Programme A | 2022-05-12 | 2024-07-04 | 2 | Legacy Assessment | true |
| 1002 | Legacy Standard | 2023-10-23 | 2025-12-15 | 3 | Regional Survey A | false |
| 1003 | Regional Framework | 2024-03-07 | 2022-05-26 | 4 | Seasonal Corridor | true |

This view answers: which NHS board is associated with each statistical report? The first row shows report `Composite Protocol` (classification National Statistics) associated with Compact Series, a non-mainland board in region `1562837`. The second row links report `Compact Programme A` (classification Official Statistics) to Legacy Assessment, a mainland board in region `6564391`. The third row associates report `Legacy Standard` (classification Legacy) with Regional Survey A (non-mainland, region `778560`), and the fourth row links report `Regional Framework` (classification Other) to Seasonal Corridor (mainland, region `8667ec1da10c4a0293d91388b49bc77c`). The column aliases—prefixed with `n_h_s_board_` for board attributes—maintain clear separation between report and board data.

## Synthesis

The cancer waiting-time system is a tightly coupled chain of records: a target defines the regulatory commitment, a cancer type anchors it to a clinical classification, an NHS board assigns it to a geographic jurisdiction, a patient cohort accumulates the treatment data, and a statistical report formalizes the publication. Each join view in the system answers a specific analytical question—linking targets to cancer types, targets to boards, cohorts to types, cohorts to boards, cohorts to targets, reports to cohorts, and reports to boards—so that any compliance figure can be traced through its full provenance. The tolerance percentages, compliance percentages, and statistics classifications provide the quantitative backbone for performance assessment, while the effective dates, status flags, and audit timestamps ensure that the historical record remains intact even as targets evolve from active to legacy to national-standard.