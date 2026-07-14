```bash
write_file(
    path="/tmp/harness_semantic_wkmn6_86/chapter.md",
    content="The National Health Service in this domain tracks cancer care performance through a structured registry of waiting-time targets, disease classifications, regional boards, patient cohorts, and statistical reports. At the core of the model sits the `CancerWaitingTimeTarget` table, which anchors every compliance measurement to a named policy instrument such as `62-day-urgent-referral` or `31-day-decision-to-treat`. Each target carries an `effectiveDate` (for instance `2023-02-14`), a `tolerancePercentage` (like `18.45`), a `targetStatus` (`active`, `legacy`, or `national-standard`), and an `applicablePatientAgeMinimum` (ranging from `35` to `56`). The target is scoped to a single `CancerType` via `typeId` and a single `NHSBoard` via `boardId`, forming the spine of a three-way relationship between policy, disease, and geography.\n\n\n\nThe `CancerType` table classifies oncological entities with a `cancerTypeName` such as `Primary Review A` or `Composite Initiative`, an `icd10Code` that may be a UUID-style string like `d65ed5c0-8fc1-11eb-924d-9cd76263cbd0` or a short numeric code like `2087750`, and a boolean `isPrimaryCancer` flag. The `createdAt` and `updatedAt` timestamps record the lifecycle of each classification. The `targetId` column in `CancerType` points back to `CancerWaitingTimeTarget`, establishing a foreign-key relationship that binds each disease classification to exactly one waiting-time target.\n\n\n\nRegional delivery is captured in `NHSBoard`, which stores a `boardName` (e.g. `Compact Series`, `Legacy Assessment`), a boolean `isMainland` flag, a `regionCode` (ranging from short integers like `1562837` to longer hex strings like `8667ec1da10c4a0293d91388b49bc77c`), and a `targetId` foreign key that links the board to a single waiting-time target. This design means each board is responsible for enforcing one target at a time, and the cardinality is bounded: one board, one target.\n\n\n\nPatient-level compliance is aggregated in `PatientCohort`, which records a `cohortIdentifier` such as `COH-2349`, a `diagnosisDateRangeStart` and `diagnosisDateRangeEnd` (for example `2024-03-04` through `2025-08-15`), a `totalEligiblePatients` count, a `patientsTreatedWithinTarget` count, and a `compliancePercentage` (values like `3.95`, `7.90`, `11.85`, `15.80`). The cohort is linked to its disease classification via `typeId`, to its regional board via `boardId`, and to the governing policy via `targetId`. This triple foreign-key structure means every cohort row is a fact about a specific disease, in a specific region, under a specific target.\n\n\n\nThe `StatisticalReport` table publishes formal documents with a `reportTitle` (e.g. `Composite Protocol`, `Compact Programme A`), a `publicationDate`, a `reportingPeriodStart` and `reportingPeriodEnd`, a `statisticsClassification` (`National Statistics`, `Official Statistics`, `Legacy`, `Other`), and a `publisherName`. Each report is attributed to a single `PatientCohort` via `cohortId` and a single `NHSBoard` via `boardId`, forming a two-hop join path from report back to the underlying compliance data.\n\n\n\nThe materialised views in this schema serve as denormalised lenses that reconstruct domain facts from the normalised base tables. The view `v_cancer_waiting_time_target_cancer_type` joins `CancerWaitingTimeTarget` to `CancerType` on the equality `CancerWaitingTimeTarget.typeId = CancerType.id`, projecting the target's `targetId`, `targetIdentifier`, `effectiveDate`, and `tolerancePercentage` alongside the type's `id` (aliased as `type_id`), `cancerTypeName`, and `icd10Code`. This view answers the question: \"which cancer types are governed by which waiting-time targets?\" A row such as target `62-day-urgent-referral` (effective `2023-02-14`, tolerance `18.45`) paired with cancer type `Primary Review A` (ICD-10 code `d65ed5c0-8fc1-11eb-924d-9cd76263cbd0`) demonstrates the one-to-one binding between a policy instrument and a disease classification.\n\n\n\nThe view `v_cancer_waiting_time_target_n_h_s_board` performs the symmetric join between `CancerWaitingTimeTarget` and `NHSBoard`, linking targets to the regional boards responsible for their enforcement. It projects the target's identifying columns alongside the board's `id`, `boardName`, `isMainland`, and `regionCode`. The row showing target `31-day-decision-to-treat` (effective `2024-07-25`, tolerance `22.90`) bound to board `Legacy Assessment` (mainland, region code `6564391`) illustrates how geographic accountability is materialised.\n\n\n\nThe view `v_cancer_type_cancer_waiting_time_target` reverses the join direction of the first view, starting from `CancerType` and joining to `CancerWaitingTimeTarget`. This orientation answers the complementary question: \"which waiting-time target governs each cancer type?\" The row for `Composite Initiative` (ICD-10 code `2087750`, `isPrimaryCancer = true`) joined to target `31-day-decision-to-treat` (effective `2024-07-25`, tolerance `22.90`) confirms the same binding from the disease's perspective.\n\n\n\nThe view `v_n_h_s_board_cancer_waiting_time_target` similarly reverses the board-to-target join, projecting the board's `id`, `boardName`, `isMainland`, `regionCode`, and `targetId` alongside the target's `targetIdentifier`, `effectiveDate`, `tolerancePercentage`, `targetStatus`, and `applicablePatientAgeMinimum`. The row for board `Regional Survey A` (non-mainland, region code `778560`) bound to target `62-day-urgent-referral` (effective `2025-12-09`, tolerance `27.35`, minimum age `49`) shows how the full policy specification is available alongside the board's identity.\n\n\n\nThe view `v_patient_cohort_cancer_type` joins `PatientCohort` to `CancerType` on `PatientCohort.typeId = CancerType.id`, reconstructing the disease context for each cohort. It projects the cohort's `cohortId`, `cohortIdentifier`, `diagnosisDateRangeStart`, `diagnosisDateRangeEnd`, `totalEligiblePatients`, `patientsTreatedWithinTarget`, `compliancePercentage`, and `targetId`, alongside the type's `cancerTypeName` and `icd10Code`. The row for cohort `COH-2349` (range `2024-03-04` to `2025-08-15`, `5` eligible, `37` treated, `3.95%` compliance) paired with cancer type `Primary Review A` (ICD-10 `d65ed5c0-8fc1-11eb-924d-9cd76263cbd0`) demonstrates how compliance metrics are always interpreted in the context of a specific disease classification.\n\n\n\nThe view `v_patient_cohort_n_h_s_board` joins `PatientCohort` to `NHSBoard` on `PatientCohort.boardId = NHSBoard.id`, attaching geographic accountability to each cohort's compliance data. It projects the cohort's core metrics alongside the board's `boardName`, `isMainland`, and `regionCode`. The row for cohort `COH-2352` (range `2023-06-10` to `2024-11-21`, `52` eligible, `52` treated, `15.80%` compliance) bound to board `Seasonal Corridor` (mainland, region code `8667ec1da10c4a0293d91388b49bc77c`) shows how a perfect treatment count is attributed to a specific regional authority.\n\n\n\nThe view `v_patient_cohort_cancer_waiting_time_target` performs the most comprehensive join, linking `PatientCohort` to `CancerWaitingTimeTarget` on `PatientCohort.targetId = CancerWaitingTimeTarget.targetId`. This view reconstructs the full policy context for each cohort, projecting the cohort's identifiers and compliance figures alongside the target's `targetIdentifier`, `effectiveDate`, `tolerancePercentage`, `targetStatus`, and `applicablePatientAgeMinimum`. The row for cohort `COH-2351` (range `2022-01-26` to `2023-06-10`, `21` eligible, `47` treated, `11.85%` compliance) bound to target `62-day-urgent-referral` (effective `2025-12-09`, tolerance `27.35`, status `national-standard`, minimum age `49`) illustrates how a cohort's performance is evaluated against the tolerance threshold and age eligibility of its governing policy.\n\n\n\nThe view `v_statistical_report_patient_cohort` joins `StatisticalReport` to `PatientCohort` on `StatisticalReport.cohortId = PatientCohort.cohortId`, attaching the underlying compliance data to each published report. It projects the report's `reportId`, `reportTitle`, `publicationDate`, `reportingPeriodStart`, `reportingPeriodEnd`, `statisticsClassification`, and `publisherName`, alongside the cohort's `cohortIdentifier`, `diagnosisDateRangeStart`, `diagnosisDateRangeEnd`, `totalEligiblePatients`, `patientsTreatedWithinTarget`, `compliancePercentage`, and `targetId`. The row for report `Composite Protocol` (published `2025-12-01`, period `2023-02-20` to `2024-03-23`, classification `National Statistics`, publisher `Regional Protocol`) linked to cohort `COH-2349` (compliance `3.95%`) shows how a formal publication inherits the compliance figures of its source cohort.\n\n\n\nThe view `v_statistical_report_n_h_s_board` joins `StatisticalReport` to `NHSBoard` on `StatisticalReport.boardId = NHSBoard.id`, attributing each report to the regional board that produced it. It projects the report's identifying columns alongside the board's `boardName`, `isMainland`, `regionCode`, and `targetId`. The row for report `Compact Programme A` (published `2022-05-12`, period `2024-07-04` to `2025-08-07`, classification `Official Statistics`, publisher `Seasonal Programme D`) bound to board `Legacy Assessment` (mainland, region code `6564391`) demonstrates how geographic provenance is recorded at the report level.\n\n\n\nThe relational model described here follows a star-like normalisation pattern: `CancerWaitingTimeTarget` acts as the central fact table, with `CancerType` and `NHSBoard` as dimension tables linked by foreign keys. `PatientCohort` extends the fact table with additional foreign keys to both dimensions and to the target itself, creating a multi-fact structure where compliance metrics are always contextualised by disease, geography, and policy. `StatisticalReport` sits one hop further out, referencing `PatientCohort` and `NHSBoard` to anchor formal publications to their underlying data. The views materialise the join paths that would otherwise require explicit SQL at query time, providing pre-joined lenses for each pairwise relationship. Together, the five base tables and nine views form a complete ontology-grounded schema for tracking cancer care waiting-time compliance across diseases, regions, and policy instruments."
)
```

## Data appendix

**Table `CancerWaitingTimeTarget`**

| targetId | targetIdentifier | effectiveDate | tolerancePercentage | targetStatus | applicablePatientAgeMinimum | typeId | boardId |
|---|---|---|---|---|---|---|---|
| 1 | 62-day-urgent-referral | 2023-02-14 | 18.45 | active | 35 | 1 | 1 |
| 2 | 31-day-decision-to-treat | 2024-07-25 | 22.90 | legacy | 42 | 2 | 2 |
| 3 | 62-day-urgent-referral | 2025-12-09 | 27.35 | national-standard | 49 | 3 | 3 |
| 4 | 31-day-decision-to-treat | 2022-05-20 | 31.80 | active | 56 | 4 | 4 |

**Table `CancerType`**

| id | cancerTypeName | icd10Code | isPrimaryCancer | targetId | createdAt | updatedAt |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | d65ed5c0-8fc1-11eb-924d-9cd76263cbd0 | false | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Composite Initiative | 2087750 | true | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Compact Model | 1208-0004-XL | false | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Legacy Cluster D | 505983 | true | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `NHSBoard`**

| id | boardName | isMainland | regionCode | targetId |
|---|---|---|---|---|
| 1 | Compact Series | false | 1562837 | 1 |
| 2 | Legacy Assessment | true | 6564391 | 2 |
| 3 | Regional Survey A | false | 778560 | 3 |
| 4 | Seasonal Corridor | true | 8667ec1da10c4a0293d91388b49bc77c | 4 |

**Table `PatientCohort`**

| cohortId | cohortIdentifier | diagnosisDateRangeStart | diagnosisDateRangeEnd | totalEligiblePatients | patientsTreatedWithinTarget | compliancePercentage | typeId | boardId | targetId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | COH-2349 | 2024-03-04 | 2025-08-15 | 5 | 37 | 3.95 | 1 | 1 | 1 |
| 2 | COH-2350 | 2025-08-15 | 2022-01-26 | 85 | 42 | 7.90 | 2 | 2 | 2 |
| 3 | COH-2351 | 2022-01-26 | 2023-06-10 | 21 | 47 | 11.85 | 3 | 3 | 3 |
| 4 | COH-2352 | 2023-06-10 | 2024-11-21 | 52 | 52 | 15.80 | 4 | 4 | 4 |

**Table `StatisticalReport`**

| reportId | reportTitle | publicationDate | reportingPeriodStart | reportingPeriodEnd | statisticsClassification | publisherName | cohortId | boardId |
|---|---|---|---|---|---|---|---|---|
| 1000 | Composite Protocol | 2025-12-01 | 2023-02-20 | 2024-03-23 | National Statistics | Regional Protocol | 1 | 1 |
| 1001 | Compact Programme A | 2022-05-12 | 2024-07-04 | 2025-08-07 | Official Statistics | Seasonal Programme D | 2 | 2 |
| 1002 | Legacy Standard | 2023-10-23 | 2025-12-15 | 2022-01-18 | Legacy | Integrated Standard | 3 | 3 |
| 1003 | Regional Framework | 2024-03-07 | 2022-05-26 | 2023-06-02 | Other | Extended Framework | 4 | 4 |

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
