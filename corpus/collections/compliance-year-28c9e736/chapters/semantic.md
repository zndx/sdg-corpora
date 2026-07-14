```bash
write_file(
    path="/tmp/harness_semantic_ep11xul3/chapter_04_relational_schema.md",
    content="## Chapter 4 — From Ontology to Relational Schema: The Attorney Compliance Management Domain

The attorney compliance management domain tracks the lifecycle of mandatory continuing-education reporting for licensed attorneys across successive compliance years. Each compliance year defines a reporting window — a start date, an end date, and a credit requirement — within which every attorney must file a compliance report, complete a professionalism course if required, and satisfy any remedial obligations. When an attorney falls short, the system generates a deficiency plan with a completion deadline and a good-cause justification; when deadlines are missed, late fees accrue. Persistent non-compliance triggers disciplinary referrals that are forwarded to MCLE commissions for adjudication. This chapter explains how the conceptual model of attorneys, compliance years, reports, deficiency plans, fees, and disciplinary actions materialises as a set of normalised relational tables, how junction tables resolve many-to-many associations, and how a family of twelve views reassembles the normalised facts into domain-meaningful projections.

### Core Entity Types and Their Attributes

The domain centres on seven base tables that capture the principal entity types. The `ComplianceYear` table anchors the temporal dimension of the model. Each row represents a distinct compliance period identified by a surrogate `yearId` and bounded by `yearStart` and `yearEnd` timestamps. The `creditRequirement` column stores the number of continuing-education credits an attorney must accumulate during that period. A `planId` column on `ComplianceYear` points to a corresponding `DeficiencyPlan`, establishing a one-to-one linkage between a compliance year and its remedial plan. In the data, year `1000` spans from `2022-05-02` to `2025-08-14` with a credit requirement of `46` credits and is associated with plan `505977`; year `1003` runs from `2025-08-08` to `2024-11-20` with a requirement of `76` credits and plan `1290`.

**Table `ComplianceYear`**

| yearId | yearStart | yearEnd | creditRequirement | planId |
|---|---|---|---|---|
| 1000 | 2025-08-14 | 2022-05-02 | 46 | 505977 |
| 1001 | 2022-01-25 | 2023-10-13 | 56 | 727038 |
| 1002 | 2023-06-09 | 2024-03-24 | 66 | 937726 |
| 1003 | 2024-11-20 | 2025-08-08 | 76 | 1290 |

The `Attorney` table stores the roster of licensed practitioners. Each attorney is identified by a surrogate `id` and carries a human-readable `barLicenseNumber` such as `BAR-2243` for Theodore Mcgrath. The `fullName` column holds the attorney's name, while `barStatus` records the current standing — `active`, `inactive`, `suspended`, or `disbarred`. The `planId` and `feeId` columns on `Attorney` are foreign keys that respectively reference a `DeficiencyPlan` and a `LateFee`, binding the attorney to their remedial plan and any outstanding penalty. Attorney `1` (Theodore Mcgrath, `BAR-2243`) is `active` and linked to plan `505977` and fee `100`; attorney `4` (Norma Fisher, `BAR-2246`) is `disbarred` and linked to plan `1290` and fee `103`.

**Table `Attorney`**

| id | barLicenseNumber | fullName | barStatus | planId | feeId |
|---|---|---|---|---|---|
| 1 | BAR-2243 | Theodore Mcgrath | active | 505977 | 100 |
| 2 | BAR-2244 | Account Name | inactive | 727038 | 101 |
| 3 | BAR-2245 | Saipan International Airport | suspended | 937726 | 102 |
| 4 | BAR-2246 | Norma Fisher | disbarred | 1290 | 103 |

The `ComplianceReport` table records each attorney's submission for a given compliance year. Its primary key is `id`, and the `reportId` column carries a human-readable identifier such as `1202-0008-S` or `L355`. The `submissionDate` timestamp captures when the report was filed, while `creditsEarned` stores the number of continuing-education credits the attorney claims. The boolean `professionalismCourseCompleted` indicates whether the mandatory professionalism course was finished. The `reportStatus` column enumerates the processing state — `submitted`, `late`, `approved`, or `rejected`. Foreign keys `yearId` and `attorneyId` tie the report to its compliance year and the filing attorney, and `feeId` links to any associated late fee. Report `1` (`1202-0008-S`) was submitted on `2025-04-24T03:57:00` with `6.45` credits, the professionalism course marked `false`, status `submitted`, for year `1000` and attorney `1`.

**Table `ComplianceReport`**

| id | reportId | submissionDate | creditsEarned | professionalismCourseCompleted | reportStatus | yearId | attorneyId | feeId |
|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-24T03:57:00 | 6.45 | false | submitted | 1000 | 1 | 100 |
| 2 | 8189500 | 2022-09-08T10:14:00 | 10.90 | true | late | 1001 | 2 | 101 |
| 3 | L355 | 2023-02-19T17:31:00 | 15.35 | false | approved | 1002 | 3 | 102 |
| 4 | 5844272 | 2024-07-03T00:48:00 | 19.80 | true | rejected | 1003 | 4 | 103 |

The `DeficiencyPlan` table captures remedial plans imposed when an attorney fails to meet compliance requirements. The primary key is `planId`, and the table records a `submissionDate`, a `completionDeadline`, and a `planStatus` (`pending`, `approved`, `completed`, or `failed`). The `goodCauseJustification` column stores a coded reason such as `extended-good-93` or `seasonal-good-95`. Like `ComplianceReport`, it carries `yearId`, `attorneyId`, and `feeId` foreign keys. Plan `505977` was submitted on `2025-04-24T03:57:00` with a deadline of `2023-02-22`, status `pending`, justification `extended-good-93`, for year `1000` and attorney `1`.

**Table `DeficiencyPlan`**

| planId | submissionDate | completionDeadline | planStatus | goodCauseJustification | yearId | attorneyId | feeId |
|---|---|---|---|---|---|---|---|
| 505977 | 2025-04-24T03:57:00 | 2023-02-22 | pending | extended-good-93 | 1000 | 1 | 100 |
| 727038 | 2022-09-08T10:14:00 | 2024-07-06 | approved | integrated-good-94 | 1001 | 2 | 101 |
| 937726 | 2023-02-19T17:31:00 | 2025-12-17 | completed | seasonal-good-95 | 1002 | 3 | 102 |
| 1290 | 2024-07-03T00:48:00 | 2022-05-01 | failed | regional-good-96 | 1003 | 4 | 103 |

The `LateFee` table tracks monetary penalties. Its primary key is `feeId`, and each row records a `feeAmount` (e.g., `38.08` or `18.47`), a `feeType` (`late-compliance`, `late-filing`, `late-reporting`, or `extension`), an `impositionDate`, and a `paymentStatus` (`pending`, `paid`, or `overdue`). The `attorneyId`, `reportId`, and `planId` columns are foreign keys that associate the fee with a specific attorney, compliance report, and deficiency plan. Fee `100` is for `38.08`, type `late-compliance`, imposed on `2024-11-26T10:42:00`, status `pending`, linked to attorney `1`, report `1`, and plan `505977`.

**Table `LateFee`**

| feeId | feeAmount | feeType | impositionDate | paymentStatus | attorneyId | reportId | planId |
|---|---|---|---|---|---|---|---|
| 100 | 38.08 | late-compliance | 2024-11-26T10:42:00 | pending | 1 | 1 | 505977 |
| 101 | 18.47 | late-filing | 2025-04-10T17:59:00 | paid | 2 | 2 | 727038 |
| 102 | 38.08 | late-reporting | 2022-09-21T00:16:00 | overdue | 3 | 3 | 937726 |
| 103 | 26.25 | extension | 2023-02-05T07:33:00 | pending | 4 | 4 | 1290 |

The `DisciplinaryReferral` table records formal referrals to regulatory bodies. Its primary key is `id`, and each row carries a `referralId` (a UUID-like string such as `ChIJkzsYUIBt5kcRM6_JHx26ONk`), a `referralDate`, a `referralReason` (`noncompliance`, `failed_deficiency_plan`, or `failed_professionalism_course`), a `forwardedTo` destination (`Office of General Counsel` or `ASB`), and a `commissionId` foreign key pointing to an `MCLECommission`. Referral `101` has ID `ChIJkzsYUIBt5kcRM6_JHx26ONk`, reason `failed_deficiency_plan`, forwarded to `ASB`, and commission `2`.

**Table `DisciplinaryReferral`**

| id | referralId | referralDate | referralReason | forwardedTo | commissionId |
|---|---|---|---|---|---|
| 100 | 9736917 | 2022-05-20T04:48:00 | noncompliance | Office of General Counsel | 1 |
| 101 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | failed_deficiency_plan | ASB | 2 |
| 102 | 5844263 | 2024-03-15T18:22:00 | failed_professionalism_course | Office of General Counsel | 3 |
| 103 | group_system | 2025-08-26T01:39:00 | noncompliance | ASB | 4 |

The `MCLECommission` table stores the regulatory commissions that receive disciplinary referrals. Although its full column set is not enumerated here, the `commissionId` foreign key on `DisciplinaryReferral` establishes the many-to-one relationship between referrals and commissions.

**Table `MCLECommission`**

| id | commissionId | commissionName | executiveDirectorName | referralId | planId |
|---|---|---|---|---|---|
| 1 | 24563916 | Primary Review A | Seasonal Assessment | 100 | 505977 |
| 2 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Initiative | Integrated Survey | 101 | 727038 |
| 3 | 8928502 | Compact Model | Extended Corridor D | 102 | 937726 |
| 4 | 937734 | Legacy Cluster D | Pilot Series | 103 | 1290 |

### Junction Tables and Many-to-Many Relationships

Three junction tables resolve many-to-many associations that cannot be expressed through simple foreign keys. The `ComplianceYearComplianceReport` junction table links compliance years to their associated compliance reports, enabling a single year to be associated with multiple reports and a report to span multiple years. The `AttorneyComplianceReport` junction table similarly decouples attorneys from their reports, allowing an attorney to file multiple reports across different years and a report to be attributed to multiple attorneys (for example, in firm-level filings). The `DisciplinaryReferralAttorney` junction table connects disciplinary referrals to the attorneys involved, supporting scenarios where a single referral concerns multiple practitioners.

**Table `ComplianceYearComplianceReport`**

| yearId | reportId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `AttorneyComplianceReport`**

| attorneyId | reportId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `DisciplinaryReferralAttorney`**

| referralId | attorneyId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

### Foreign-Key Topology and Referential Integrity

The referential structure of the schema forms a directed acyclic graph. `ComplianceReport` references `ComplianceYear` (via `yearId`) and `Attorney` (via `attorneyId`), and also `LateFee` (via `feeId`). `DeficiencyPlan` references `ComplianceYear`, `Attorney`, and `LateFee` through the same column names, creating parallel foreign-key paths. `LateFee` references `Attorney`, `ComplianceReport`, and `DeficiencyPlan`, forming a triangular dependency that ensures every fee is traceable to its originating entity. `DisciplinaryReferral` references `MCLECommission` via `commissionId`. The `Attorney` table itself carries `planId` and `feeId` foreign keys, creating a direct attachment of each attorney to their current deficiency plan and outstanding fee. This topology guarantees that any query joining these tables will produce rows that are consistent with the domain's business rules: a report cannot exist without a year and an attorney, a fee cannot exist without its originating entities, and a disciplinary referral cannot exist without a commission.

### View-Based Reassembly of Domain Facts

The base tables are highly normalised, which is appropriate for write-heavy operational workloads but suboptimal for analytical queries. A family of views reassembles the normalised facts into domain-meaningful projections. Each view performs a specific join pattern that answers a concrete business question.

The `compliance_year_compliance_report_detail_view` joins `ComplianceYear` with `ComplianceReport` to produce a detailed listing of every report filed within each compliance year. It answers the question: "For each compliance year, what reports were submitted, by whom, and what were the outcomes?" A row from this view might show year `1000` (credit requirement `46`) with report `1202-0008-S` submitted by attorney `1` (Theodore Mcgrath), showing `6.45` credits earned and status `submitted`.

**View `compliance_year_compliance_report_detail_view`**

```sql
CREATE VIEW compliance_year_compliance_report_detail_view AS
SELECT a.yearId, a.yearStart, a.yearEnd, b.id AS report_id, b.reportId AS report_reportId, b.submissionDate AS report_submissionDate
FROM ComplianceYear a
  JOIN ComplianceYearComplianceReport j ON j.yearId = a.yearId
  JOIN ComplianceReport b ON b.id = j.reportId;
```

| yearId | yearStart | yearEnd | report_id | report_reportId | report_submissionDate |
|---|---|---|---|---|---|
| 1000 | 2025-08-14 | 2022-05-02 | 1 | 1202-0008-S | 2025-04-24T03:57:00 |
| 1000 | 2025-08-14 | 2022-05-02 | 2 | 8189500 | 2022-09-08T10:14:00 |
| 1001 | 2022-01-25 | 2023-10-13 | 2 | 8189500 | 2022-09-08T10:14:00 |
| 1001 | 2022-01-25 | 2023-10-13 | 3 | L355 | 2023-02-19T17:31:00 |
| 1002 | 2023-06-09 | 2024-03-24 | 3 | L355 | 2023-02-19T17:31:00 |
| 1002 | 2023-06-09 | 2024-03-24 | 4 | 5844272 | 2024-07-03T00:48:00 |
| 1003 | 2024-11-20 | 2025-08-08 | 4 | 5844272 | 2024-07-03T00:48:00 |
| 1003 | 2024-11-20 | 2025-08-08 | 1 | 1202-0008-S | 2025-04-24T03:57:00 |

The `compliance_year_deficiency_plan_view` joins `ComplianceYear` with `DeficiencyPlan` to surface the remedial plan associated with each compliance year. It answers: "What deficiency plan was imposed for each compliance year, and what is its current status?" A representative row shows year `1000` with plan `505977`, status `pending`, deadline `2023-02-22`, and justification `extended-good-93`.

**View `compliance_year_deficiency_plan_view`**

```sql
CREATE VIEW compliance_year_deficiency_plan_view AS
SELECT a.yearId, a.yearStart, a.yearEnd, a.creditRequirement, b.planId AS plan_planId, b.submissionDate AS plan_submissionDate, b.completionDeadline AS plan_completionDeadline
FROM ComplianceYear a JOIN DeficiencyPlan b ON a.planId = b.planId;
```

| yearId | yearStart | yearEnd | creditRequirement | plan_planId | plan_submissionDate | plan_completionDeadline |
|---|---|---|---|---|---|---|
| 1000 | 2025-08-14 | 2022-05-02 | 46 | 505977 | 2025-04-24T03:57:00 | 2023-02-22 |
| 1001 | 2022-01-25 | 2023-10-13 | 56 | 727038 | 2022-09-08T10:14:00 | 2024-07-06 |
| 1002 | 2023-06-09 | 2024-03-24 | 66 | 937726 | 2023-02-19T17:31:00 | 2025-12-17 |
| 1003 | 2024-11-20 | 2025-08-08 | 76 | 1290 | 2024-07-03T00:48:00 | 2022-05-01 |

The `attorney_compliance_report_detail_view` joins `Attorney` with `ComplianceReport` to produce a per-attorney report history. It answers: "What compliance reports has each attorney filed, and how did they fare?" A row might show attorney `1` (Theodore Mcgrath, `BAR-2243`, status `active`) with report `1202-0008-S`, `6.45` credits, professionalism course `false`, and status `submitted`.

**View `attorney_compliance_report_detail_view`**

```sql
CREATE VIEW attorney_compliance_report_detail_view AS
SELECT a.id, a.barLicenseNumber, a.fullName, b.id AS report_id, b.reportId AS report_reportId, b.submissionDate AS report_submissionDate
FROM Attorney a
  JOIN AttorneyComplianceReport j ON j.attorneyId = a.id
  JOIN ComplianceReport b ON b.id = j.reportId;
```

| id | barLicenseNumber | fullName | report_id | report_reportId | report_submissionDate |
|---|---|---|---|---|---|
| 1 | BAR-2243 | Theodore Mcgrath | 1 | 1202-0008-S | 2025-04-24T03:57:00 |
| 1 | BAR-2243 | Theodore Mcgrath | 2 | 8189500 | 2022-09-08T10:14:00 |
| 2 | BAR-2244 | Account Name | 2 | 8189500 | 2022-09-08T10:14:00 |
| 2 | BAR-2244 | Account Name | 3 | L355 | 2023-02-19T17:31:00 |
| 3 | BAR-2245 | Saipan International Airport | 3 | L355 | 2023-02-19T17:31:00 |
| 3 | BAR-2245 | Saipan International Airport | 4 | 5844272 | 2024-07-03T00:48:00 |
| 4 | BAR-2246 | Norma Fisher | 4 | 5844272 | 2024-07-03T00:48:00 |
| 4 | BAR-2246 | Norma Fisher | 1 | 1202-0008-S | 2025-04-24T03:57:00 |

The `attorney_deficiency_plan_view` joins `Attorney` with `DeficiencyPlan` to show each attorney's current remedial plan. It answers: "What deficiency plan is each attorney subject to, and what is its status?" A row shows attorney `1` (Theodore Mcgrath) with plan `505977`, status `pending`, deadline `2023-02-22`, and justification `extended-good-93`.

**View `attorney_deficiency_plan_view`**

```sql
CREATE VIEW attorney_deficiency_plan_view AS
SELECT a.id, a.barLicenseNumber, a.fullName, a.barStatus, b.planId AS plan_planId, b.submissionDate AS plan_submissionDate, b.completionDeadline AS plan_completionDeadline
FROM Attorney a JOIN DeficiencyPlan b ON a.planId = b.planId;
```

| id | barLicenseNumber | fullName | barStatus | plan_planId | plan_submissionDate | plan_completionDeadline |
|---|---|---|---|---|---|---|
| 1 | BAR-2243 | Theodore Mcgrath | active | 505977 | 2025-04-24T03:57:00 | 2023-02-22 |
| 2 | BAR-2244 | Account Name | inactive | 727038 | 2022-09-08T10:14:00 | 2024-07-06 |
| 3 | BAR-2245 | Saipan International Airport | suspended | 937726 | 2023-02-19T17:31:00 | 2025-12-17 |
| 4 | BAR-2246 | Norma Fisher | disbarred | 1290 | 2024-07-03T00:48:00 | 2022-05-01 |

The `attorney_late_fee_view` joins `Attorney` with `LateFee` to list all penalties owed by each attorney. It answers: "What late fees has each attorney incurred, and what is their payment status?" A row shows attorney `1` (Theodore Mcgrath) with fee `100` of amount `38.08`, type `late-compliance`, imposed on `2024-11-26T10:42:00`, status `pending`.

**View `attorney_late_fee_view`**

```sql
CREATE VIEW attorney_late_fee_view AS
SELECT a.id, a.barLicenseNumber, a.fullName, a.barStatus, b.feeId AS fee_feeId, b.feeAmount AS fee_feeAmount, b.feeType AS fee_feeType
FROM Attorney a JOIN LateFee b ON a.feeId = b.feeId;
```

| id | barLicenseNumber | fullName | barStatus | fee_feeId | fee_feeAmount | fee_feeType |
|---|---|---|---|---|---|---|
| 1 | BAR-2243 | Theodore Mcgrath | active | 100 | 38.08 | late-compliance |
| 2 | BAR-2244 | Account Name | inactive | 101 | 18.47 | late-filing |
| 3 | BAR-2245 | Saipan International Airport | suspended | 102 | 38.08 | late-reporting |
| 4 | BAR-2246 | Norma Fisher | disbarred | 103 | 26.25 | extension |

The `compliance_report_compliance_year_view` joins `ComplianceReport` with `ComplianceYear` to present each report alongside its governing compliance year. It answers: "For each compliance report, which compliance year does it belong to, and what was the credit requirement?" A row shows report `1202-0008-S` (submitted `2025-04-24T03:57:00`, `6.45` credits, status `submitted`) under year `1000` (start `2022-05-02`, end `2025-08-14`, requirement `46`).

**View `compliance_report_compliance_year_view`**

```sql
CREATE VIEW compliance_report_compliance_year_view AS
SELECT a.id, a.reportId, a.submissionDate, a.creditsEarned, b.yearId AS year_yearId, b.yearStart AS year_yearStart, b.yearEnd AS year_yearEnd
FROM ComplianceReport a JOIN ComplianceYear b ON a.yearId = b.yearId;
```

| id | reportId | submissionDate | creditsEarned | year_yearId | year_yearStart | year_yearEnd |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-24T03:57:00 | 6.45 | 1000 | 2025-08-14 | 2022-05-02 |
| 2 | 8189500 | 2022-09-08T10:14:00 | 10.90 | 1001 | 2022-01-25 | 2023-10-13 |
| 3 | L355 | 2023-02-19T17:31:00 | 15.35 | 1002 | 2023-06-09 | 2024-03-24 |
| 4 | 5844272 | 2024-07-03T00:48:00 | 19.80 | 1003 | 2024-11-20 | 2025-08-08 |

The `compliance_report_attorney_view` joins `ComplianceReport` with `Attorney` to present each report alongside the filing attorney's details. It answers: "Who filed each compliance report, and what is their current bar status?" A row shows report `1202-0008-S` filed by attorney `1` (Theodore Mcgrath, `BAR-2243`, status `active`).

**View `compliance_report_attorney_view`**

```sql
CREATE VIEW compliance_report_attorney_view AS
SELECT a.id, a.reportId, a.submissionDate, a.creditsEarned, b.id AS attorney_id, b.barLicenseNumber AS attorney_barLicenseNumber, b.fullName AS attorney_fullName
FROM ComplianceReport a JOIN Attorney b ON a.attorneyId = b.id;
```

| id | reportId | submissionDate | creditsEarned | attorney_id | attorney_barLicenseNumber | attorney_fullName |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-24T03:57:00 | 6.45 | 1 | BAR-2243 | Theodore Mcgrath |
| 2 | 8189500 | 2022-09-08T10:14:00 | 10.90 | 2 | BAR-2244 | Account Name |
| 3 | L355 | 2023-02-19T17:31:00 | 15.35 | 3 | BAR-2245 | Saipan International Airport |
| 4 | 5844272 | 2024-07-03T00:48:00 | 19.80 | 4 | BAR-2246 | Norma Fisher |

The `compliance_report_late_fee_view` joins `ComplianceReport` with `LateFee` to surface any penalties associated with a report. It answers: "What late fees, if any, are tied to each compliance report?" A row shows report `1202-0008-S` with fee `100` of amount `38.08`, type `late-compliance`, status `pending`.

**View `compliance_report_late_fee_view`**

```sql
CREATE VIEW compliance_report_late_fee_view AS
SELECT a.id, a.reportId, a.submissionDate, a.creditsEarned, b.feeId AS fee_feeId, b.feeAmount AS fee_feeAmount, b.feeType AS fee_feeType
FROM ComplianceReport a JOIN LateFee b ON a.feeId = b.feeId;
```

| id | reportId | submissionDate | creditsEarned | fee_feeId | fee_feeAmount | fee_feeType |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-24T03:57:00 | 6.45 | 100 | 38.08 | late-compliance |
| 2 | 8189500 | 2022-09-08T10:14:00 | 10.90 | 101 | 18.47 | late-filing |
| 3 | L355 | 2023-02-19T17:31:00 | 15.35 | 102 | 38.08 | late-reporting |
| 4 | 5844272 | 2024-07-03T00:48:00 | 19.80 | 103 | 26.25 | extension |

The `deficiency_plan_compliance_year_view` joins `DeficiencyPlan` with `ComplianceYear` to present each remedial plan alongside its governing compliance year. It answers: "Which compliance year does each deficiency plan relate to, and what are the plan's deadlines?" A row shows plan `505977` (status `pending`, deadline `2023-02-22`, justification `extended-good-93`) under year `1000` (start `2022-05-02`, end `2025-08-14`, requirement `46`).

**View `deficiency_plan_compliance_year_view`**

```sql
CREATE VIEW deficiency_plan_compliance_year_view AS
SELECT a.planId, a.submissionDate, a.completionDeadline, a.planStatus, b.yearId AS year_yearId, b.yearStart AS year_yearStart, b.yearEnd AS year_yearEnd
FROM DeficiencyPlan a JOIN ComplianceYear b ON a.yearId = b.yearId;
```

| planId | submissionDate | completionDeadline | planStatus | year_yearId | year_yearStart | year_yearEnd |
|---|---|---|---|---|---|---|
| 505977 | 2025-04-24T03:57:00 | 2023-02-22 | pending | 1000 | 2025-08-14 | 2022-05-02 |
| 727038 | 2022-09-08T10:14:00 | 2024-07-06 | approved | 1001 | 2022-01-25 | 2023-10-13 |
| 937726 | 2023-02-19T17:31:00 | 2025-12-17 | completed | 1002 | 2023-06-09 | 2024-03-24 |
| 1290 | 2024-07-03T00:48:00 | 2022-05-01 | failed | 1003 | 2024-11-20 | 2025-08-08 |

The `deficiency_plan_attorney_view` joins `DeficiencyPlan` with `Attorney` to show each attorney's remedial plan. It answers: "Which attorney is subject to each deficiency plan, and what is their bar status?" A row shows plan `505977` (status `pending`, deadline `2023-02-22`) for attorney `1` (Theodore Mcgrath, `BAR-2243`, status `active`).

**View `deficiency_plan_attorney_view`**

```sql
CREATE VIEW deficiency_plan_attorney_view AS
SELECT a.planId, a.submissionDate, a.completionDeadline, a.planStatus, b.id AS attorney_id, b.barLicenseNumber AS attorney_barLicenseNumber, b.fullName AS attorney_fullName
FROM DeficiencyPlan a JOIN Attorney b ON a.attorneyId = b.id;
```

| planId | submissionDate | completionDeadline | planStatus | attorney_id | attorney_barLicenseNumber | attorney_fullName |
|---|---|---|---|---|---|---|
| 505977 | 2025-04-24T03:57:00 | 2023-02-22 | pending | 1 | BAR-2243 | Theodore Mcgrath |
| 727038 | 2022-09-08T10:14:00 | 2024-07-06 | approved | 2 | BAR-2244 | Account Name |
| 937726 | 2023-02-19T17:31:00 | 2025-12-17 | completed | 3 | BAR-2245 | Saipan International Airport |
| 1290 | 2024-07-03T00:48:00 | 2022-05-01 | failed | 4 | BAR-2246 | Norma Fisher |

The `deficiency_plan_late_fee_view` joins `DeficiencyPlan` with `LateFee` to surface any penalties associated with a deficiency plan. It answers: "What late fees are tied to each deficiency plan?" A row shows plan `505977` (status `pending`, deadline `2023-02-22`) with fee `100` of amount `38.08`, type `late-compliance`, status `pending`.

**View `deficiency_plan_late_fee_view`**

```sql
CREATE VIEW deficiency_plan_late_fee_view AS
SELECT a.planId, a.submissionDate, a.completionDeadline, a.planStatus, b.feeId AS fee_feeId, b.feeAmount AS fee_feeAmount, b.feeType AS fee_feeType
FROM DeficiencyPlan a JOIN LateFee b ON a.feeId = b.feeId;
```

| planId | submissionDate | completionDeadline | planStatus | fee_feeId | fee_feeAmount | fee_feeType |
|---|---|---|---|---|---|---|
| 505977 | 2025-04-24T03:57:00 | 2023-02-22 | pending | 100 | 38.08 | late-compliance |
| 727038 | 2022-09-08T10:14:00 | 2024-07-06 | approved | 101 | 18.47 | late-filing |
| 937726 | 2023-02-19T17:31:00 | 2025-12-17 | completed | 102 | 38.08 | late-reporting |
| 1290 | 2024-07-03T00:48:00 | 2022-05-01 | failed | 103 | 26.25 | extension |

The `late_fee_attorney_view` joins `LateFee` with `Attorney` to present each penalty alongside the responsible attorney. It answers: "Which attorney owes each late fee, and what is their bar status?" A row shows fee `100` (amount `38.08`, type `late-compliance`, imposed `2024-11-26T10:42:00`, status `pending`) owed by attorney `1` (Theodore Mcgrath, `BAR-2243`, status `active`).

**View `late_fee_attorney_view`**

```sql
CREATE VIEW late_fee_attorney_view AS
SELECT a.feeId, a.feeAmount, a.feeType, a.impositionDate, b.id AS attorney_id, b.barLicenseNumber AS attorney_barLicenseNumber, b.fullName AS attorney_fullName
FROM LateFee a JOIN Attorney b ON a.attorneyId = b.id;
```

| feeId | feeAmount | feeType | impositionDate | attorney_id | attorney_barLicenseNumber | attorney_fullName |
|---|---|---|---|---|---|---|
| 100 | 38.08 | late-compliance | 2024-11-26T10:42:00 | 1 | BAR-2243 | Theodore Mcgrath |
| 101 | 18.47 | late-filing | 2025-04-10T17:59:00 | 2 | BAR-2244 | Account Name |
| 102 | 38.08 | late-reporting | 2022-09-21T00:16:00 | 3 | BAR-2245 | Saipan International Airport |
| 103 | 26.25 | extension | 2023-02-05T07:33:00 | 4 | BAR-2246 | Norma Fisher |

The `late_fee_compliance_report_view` joins `LateFee` with `ComplianceReport` to present each penalty alongside the originating report. It answers: "Which compliance report triggered each late fee?" A row shows fee `100` (amount `38.08`, type `late-compliance`) associated with report `1202-0008-S` (submitted `2025-04-24T03:57:00`, `6.45` credits, status `submitted`).

**View `late_fee_compliance_report_view`**

```sql
CREATE VIEW late_fee_compliance_report_view AS
SELECT a.feeId, a.feeAmount, a.feeType, a.impositionDate, b.id AS report_id, b.reportId AS report_reportId, b.submissionDate AS report_submissionDate
FROM LateFee a JOIN ComplianceReport b ON a.reportId = b.id;
```

| feeId | feeAmount | feeType | impositionDate | report_id | report_reportId | report_submissionDate |
|---|---|---|---|---|---|---|
| 100 | 38.08 | late-compliance | 2024-11-26T10:42:00 | 1 | 1202-0008-S | 2025-04-24T03:57:00 |
| 101 | 18.47 | late-filing | 2025-04-10T17:59:00 | 2 | 8189500 | 2022-09-08T10:14:00 |
| 102 | 38.08 | late-reporting | 2022-09-21T00:16:00 | 3 | L355 | 2023-02-19T17:31:00 |
| 103 | 26.25 | extension | 2023-02-05T07:33:00 | 4 | 5844272 | 2024-07-03T00:48:00 |

The `late_fee_deficiency_plan_view` joins `LateFee` with `DeficiencyPlan` to present each penalty alongside its remedial plan. It answers: "Which deficiency plan is associated with each late fee?" A row shows fee `100` (amount `38.08`, type `late-compliance`) associated with plan `505977` (status `pending`, deadline `2023-02-22`, justification `extended-good-93`).

**View `late_fee_deficiency_plan_view`**

```sql
CREATE VIEW late_fee_deficiency_plan_view AS
SELECT a.feeId, a.feeAmount, a.feeType, a.impositionDate, b.planId AS plan_planId, b.submissionDate AS plan_submissionDate, b.completionDeadline AS plan_completionDeadline
FROM LateFee a JOIN DeficiencyPlan b ON a.planId = b.planId;
```

| feeId | feeAmount | feeType | impositionDate | plan_planId | plan_submissionDate | plan_completionDeadline |
|---|---|---|---|---|---|---|
| 100 | 38.08 | late-compliance | 2024-11-26T10:42:00 | 505977 | 2025-04-24T03:57:00 | 2023-02-22 |
| 101 | 18.47 | late-filing | 2025-04-10T17:59:00 | 727038 | 2022-09-08T10:14:00 | 2024-07-06 |
| 102 | 38.08 | late-reporting | 2022-09-21T00:16:00 | 937726 | 2023-02-19T17:31:00 | 2025-12-17 |
| 103 | 26.25 | extension | 2023-02-05T07:33:00 | 1290 | 2024-07-03T00:48:00 | 2022-05-01 |

The `disciplinary_referral_attorney_detail_view` joins `DisciplinaryReferral` with `Attorney` (via the `DisciplinaryReferralAttorney` junction table) to present each referral alongside the involved attorney's details. It answers: "Which attorneys are subject to each disciplinary referral, and what is their bar status?" A row shows referral `100` (ID `9736917`, reason `noncompliance`, forwarded to `Office of General Counsel`) involving attorney `1` (Theodore Mcgrath, `BAR-2243`, status `active`).

**View `disciplinary_referral_attorney_detail_view`**

```sql
CREATE VIEW disciplinary_referral_attorney_detail_view AS
SELECT a.id, a.referralId, a.referralDate, b.id AS attorney_id, b.barLicenseNumber AS attorney_barLicenseNumber, b.fullName AS attorney_fullName
FROM DisciplinaryReferral a
  JOIN DisciplinaryReferralAttorney j ON j.referralId = a.id
  JOIN Attorney b ON b.id = j.attorneyId;
```

| id | referralId | referralDate | attorney_id | attorney_barLicenseNumber | attorney_fullName |
|---|---|---|---|---|---|
| 100 | 9736917 | 2022-05-20T04:48:00 | 1 | BAR-2243 | Theodore Mcgrath |
| 100 | 9736917 | 2022-05-20T04:48:00 | 2 | BAR-2244 | Account Name |
| 101 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | 2 | BAR-2244 | Account Name |
| 101 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | 3 | BAR-2245 | Saipan International Airport |
| 102 | 5844263 | 2024-03-15T18:22:00 | 3 | BAR-2245 | Saipan International Airport |
| 102 | 5844263 | 2024-03-15T18:22:00 | 4 | BAR-2246 | Norma Fisher |
| 103 | group_system | 2025-08-26T01:39:00 | 4 | BAR-2246 | Norma Fisher |
| 103 | group_system | 2025-08-26T01:39:00 | 1 | BAR-2243 | Theodore Mcgrath |

The `disciplinary_referral_m_c_l_e_commission_view` joins `DisciplinaryReferral` with `MCLECommission` to present each referral alongside the receiving commission. It answers: "Which MCLE commission receives each disciplinary referral?" A row shows referral `100` (ID `9736917`, reason `noncompliance`, forwarded to `Office of General Counsel`) received by commission `1`.

**View `disciplinary_referral_m_c_l_e_commission_view`**

```sql
CREATE VIEW disciplinary_referral_m_c_l_e_commission_view AS
SELECT a.id, a.referralId, a.referralDate, a.referralReason, b.id AS commission_id, b.commissionId AS commission_commissionId, b.commissionName AS commission_commissionName
FROM DisciplinaryReferral a JOIN MCLECommission b ON a.commissionId = b.id;
```

| id | referralId | referralDate | referralReason | commission_id | commission_commissionId | commission_commissionName |
|---|---|---|---|---|---|---|
| 100 | 9736917 | 2022-05-20T04:48:00 | noncompliance | 1 | 24563916 | Primary Review A |
| 101 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | failed_deficiency_plan | 2 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Initiative |
| 102 | 5844263 | 2024-03-15T18:22:00 | failed_professionalism_course | 3 | 8928502 | Compact Model |
| 103 | group_system | 2025-08-26T01:39:00 | noncompliance | 4 | 937734 | Legacy Cluster D |

The `m_c_l_e_commission_disciplinary_referral_view` joins `MCLECommission` with `DisciplinaryReferral` to present each commission alongside the referrals it has received. It answers: "Which disciplinary referrals has each MCLE commission received?" A row shows commission `1` receiving referral `100` (ID `9736917`, reason `noncompliance`, forwarded to `Office of General Counsel`).

**View `m_c_l_e_commission_disciplinary_referral_view`**

```sql
CREATE VIEW m_c_l_e_commission_disciplinary_referral_view AS
SELECT a.id, a.commissionId, a.commissionName, a.executiveDirectorName, b.id AS referral_id, b.referralId AS referral_referralId, b.referralDate AS referral_referralDate
FROM MCLECommission a JOIN DisciplinaryReferral b ON a.referralId = b.id;
```

| id | commissionId | commissionName | executiveDirectorName | referral_id | referral_referralId | referral_referralDate |
|---|---|---|---|---|---|---|
| 1 | 24563916 | Primary Review A | Seasonal Assessment | 100 | 9736917 | 2022-05-20T04:48:00 |
| 2 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Initiative | Integrated Survey | 101 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 |
| 3 | 8928502 | Compact Model | Extended Corridor D | 102 | 5844263 | 2024-03-15T18:22:00 |
| 4 | 937734 | Legacy Cluster D | Pilot Series | 103 | group_system | 2025-08-26T01:39:00 |

The `m_c_l_e_commission_deficiency_plan_view` joins `MCLECommission` with `DeficiencyPlan` to present each commission alongside the deficiency plans that may have triggered referrals to it. It answers: "Which deficiency plans are associated with referrals received by each MCLE commission?" A row shows commission `1` associated with plan `505977` (status `pending`, deadline `2023-02-22`, justification `extended-good-93`).

**View `m_c_l_e_commission_deficiency_plan_view`**

```sql
CREATE VIEW m_c_l_e_commission_deficiency_plan_view AS
SELECT a.id, a.commissionId, a.commissionName, a.executiveDirectorName, b.planId AS plan_planId, b.submissionDate AS plan_submissionDate, b.completionDeadline AS plan_completionDeadline
FROM MCLECommission a JOIN DeficiencyPlan b ON a.planId = b.planId;
```

| id | commissionId | commissionName | executiveDirectorName | plan_planId | plan_submissionDate | plan_completionDeadline |
|---|---|---|---|---|---|---|
| 1 | 24563916 | Primary Review A | Seasonal Assessment | 505977 | 2025-04-24T03:57:00 | 2023-02-22 |
| 2 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Initiative | Integrated Survey | 727038 | 2022-09-08T10:14:00 | 2024-07-06 |
| 3 | 8928502 | Compact Model | Extended Corridor D | 937726 | 2023-02-19T17:31:00 | 2025-12-17 |
| 4 | 937734 | Legacy Cluster D | Pilot Series | 1290 | 2024-07-03T00:48:00 | 2022-05-01 |

### Synthesis

The attorney compliance management schema demonstrates a disciplined approach to normalisation: each entity type occupies its own table with a surrogate primary key, foreign keys encode the directional dependencies between entities, and junction tables resolve the many-to-many associations that arise when a single compliance year, attorney, or report can participate in multiple relationships. The twelve views then reassemble these normalised facts into projections that answer specific business questions — listing reports by year, surfacing attorney-specific report histories, tracing late fees to their originating entities, and connecting disciplinary referrals to both the attorneys involved and the MCLE commissions that receive them. Every view is a deterministic join over the base tables, and every row in a view corresponds to a coherent domain fact: a report filed by an attorney in a given year, a fee imposed on an attorney for a specific report, a referral forwarded to a commission because of a failed deficiency plan. The schema thus achieves both write optimality through normalisation and read optimality through carefully constructed views, embodying the principle that a well-designed relational model should make the domain's structure visible in its tables and its meaning visible in its views."
)
```