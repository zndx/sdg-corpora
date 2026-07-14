## Compliance Years and Credit Requirements

The attorney regulatory framework operates through defined compliance periods, each establishing the educational and professional obligations that licensed practitioners must satisfy. A compliance year is anchored by a start date and an end date, within which attorneys must accumulate a specified number of continuing legal education credits. The compliance year with identifier `1000` spans from May 2022 through May 2025 and requires forty-six credits, while year `1001` runs from January 2022 to October 2023 with a fifty-six-credit requirement. Year `1002` covers the period from June 2023 to March 2024 and demands sixty-six credits, and year `1003` extends from November 2024 to August 2025 with the highest threshold at seventy-six credits. Each year is associated with a remediation plan identifier—`505977`, `727038`, `937726`, and `1290` respectively—which serves as the bridge to deficiency tracking when attorneys fall short of their obligations.

**Table `ComplianceYear`**

| yearId | yearStart | yearEnd | creditRequirement | planId |
|---|---|---|---|---|
| 1000 | 2025-08-14 | 2022-05-02 | 46 | 505977 |
| 1001 | 2022-01-25 | 2023-10-13 | 56 | 727038 |
| 1002 | 2023-06-09 | 2024-03-24 | 66 | 937726 |
| 1003 | 2024-11-20 | 2025-08-08 | 76 | 1290 |

The credit requirements escalate across the four recorded years, reflecting a policy of increasing professional development expectations. The plan identifiers stored alongside each compliance year are not arbitrary; they correspond directly to the DeficiencyPlan records that are generated when an attorney fails to meet the credit threshold for that period. This linkage ensures that every compliance gap can be traced back to its originating year and its associated remediation framework.

## Attorney Registration and Status

Every practitioner subject to the compliance regime is registered under a unique attorney record that captures their licensing identity and current standing. The attorney table holds the bar license number, the full name on file, and the bar status, which classifies the practitioner as active, inactive, suspended, or disbarred. Theodore Mcgrath, licensed as BAR-2243, holds active status and is associated with plan `505977` and fee identifier `100`. Account Name, registered under BAR-2244, carries inactive status with plan `727038` and fee `101`. Saipan International Airport, listed under BAR-2245, is suspended and linked to plan `937726` and fee `102`. Norma Fisher, bearing license BAR-2246, is disbarred and connected to plan `1290` and fee `103`.

**Table `Attorney`**

| id | barLicenseNumber | fullName | barStatus | planId | feeId |
|---|---|---|---|---|---|
| 1 | BAR-2243 | Theodore Mcgrath | active | 505977 | 100 |
| 2 | BAR-2244 | Account Name | inactive | 727038 | 101 |
| 3 | BAR-2245 | Saipan International Airport | suspended | 937726 | 102 |
| 4 | BAR-2246 | Norma Fisher | disbarred | 1290 | 103 |

The bar status is a critical determinant of an attorney's compliance obligations. Active practitioners must submit timely reports and meet credit thresholds; inactive and suspended attorneys may be subject to different reporting requirements or exemptions; disbarred attorneys, while no longer permitted to practice, may still carry residual compliance or fee obligations. The plan identifier and fee identifier columns in the attorney record serve as foreign keys that connect the practitioner to their remediation plan and any associated late fees, ensuring that each attorney's financial and educational responsibilities are tracked in a single coherent profile.

## Compliance Reporting

The core mechanism of the compliance regime is the annual compliance report, which attorneys submit to document their earned credits and course completions. Each report carries a unique report identifier, a submission timestamp, the number of credits earned, a flag indicating whether the professionalism course was completed, and a status reflecting the regulatory review outcome. Report `1202-0008-S` was submitted on April 24, 2025, recorded 6.45 credits, did not include the professionalism course, and received a submitted status. Report `8189500`, submitted September 8, 2022, shows 10.90 credits, confirms professionalism course completion, and carries a late status. Report `L355`, filed February 19, 2023, documents 15.35 credits without the professionalism course and was approved. Report `5844272`, submitted July 3, 2024, records 19.80 credits, includes the professionalism course, and was rejected.

**Table `ComplianceReport`**

| id | reportId | submissionDate | creditsEarned | professionalismCourseCompleted | reportStatus | yearId | attorneyId | feeId |
|---|---|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2025-04-24T03:57:00 | 6.45 | false | submitted | 1000 | 1 | 100 |
| 2 | 8189500 | 2022-09-08T10:14:00 | 10.90 | true | late | 1001 | 2 | 101 |
| 3 | L355 | 2023-02-19T17:31:00 | 15.35 | false | approved | 1002 | 3 | 102 |
| 4 | 5844272 | 2024-07-03T00:48:00 | 19.80 | true | rejected | 1003 | 4 | 103 |

The report status values—submitted, late, approved, and rejected—represent distinct stages in the regulatory review pipeline. A submitted report is awaiting review; a late report indicates the submission missed the deadline but was still accepted for processing; an approved report signifies that the attorney has met the requirements for that compliance year; and a rejected report means the submission failed to satisfy the criteria, potentially triggering a deficiency plan. Each report is tied to a specific compliance year through the year identifier and to a specific attorney through the attorney identifier, creating a direct audit trail from practitioner to obligation to outcome. The fee identifier on the report links to any late fees that may have been assessed.

## Deficiency Plans and Remediation

When a compliance report is rejected or an attorney fails to meet credit requirements, a deficiency plan is generated to outline the remediation steps and deadlines. The deficiency plan table records the plan identifier, its submission date, the completion deadline, the current status, and a good cause justification code that explains the basis for the plan. Plan `505977` was submitted on April 24, 2025, with a completion deadline of February 22, 2023, carries a pending status, and cites extended-good-93 as the justification. Plan `727038`, submitted September 8, 2022, has a deadline of July 6, 2024, is approved, and references integrated-good-94. Plan `937726`, filed February 19, 2023, sets a deadline of December 17, 2025, shows completed status, and uses seasonal-good-95. Plan `1290`, submitted July 3, 2024, has a deadline of May 1, 2022, carries a failed status, and cites regional-good-96.

**Table `DeficiencyPlan`**

| planId | submissionDate | completionDeadline | planStatus | goodCauseJustification | yearId | attorneyId | feeId |
|---|---|---|---|---|---|---|---|
| 505977 | 2025-04-24T03:57:00 | 2023-02-22 | pending | extended-good-93 | 1000 | 1 | 100 |
| 727038 | 2022-09-08T10:14:00 | 2024-07-06 | approved | integrated-good-94 | 1001 | 2 | 101 |
| 937726 | 2023-02-19T17:31:00 | 2025-12-17 | completed | seasonal-good-95 | 1002 | 3 | 102 |
| 1290 | 2024-07-03T00:48:00 | 2022-05-01 | failed | regional-good-96 | 1003 | 4 | 103 |

The plan status progression—pending, approved, completed, and failed—mirrors the lifecycle of remediation efforts. A pending plan indicates that the attorney has been notified of the deficiency and is working toward compliance. An approved plan means the remediation strategy has been accepted by the regulatory body. A completed plan confirms that the attorney has fulfilled all requirements. A failed plan signifies that the attorney did not meet the remediation obligations within the stipulated timeframe, which may escalate to disciplinary action. The good cause justification codes provide a standardized taxonomy for the reasons behind each plan, enabling aggregation and analysis of deficiency patterns across the practitioner population.

## Late Fee Assessment

Non-compliance triggers financial penalties, which are tracked in the late fee table. Each fee record includes the fee identifier, the monetary amount, the fee type, the imposition date, the payment status, and foreign keys linking the fee to the responsible attorney, the associated compliance report, and the related deficiency plan. Fee `100` amounts to 38.08, is classified as a late-compliance fee, was imposed on November 26, 2024, remains pending, and is tied to attorney `1`, report `1`, and plan `505977`. Fee `101` is 18.47, categorized as a late-filing fee, imposed April 10, 2025, has been paid, and connects to attorney `2`, report `2`, and plan `727038`. Fee `102` also totals 38.08, is a late-reporting fee imposed September 21, 2022, is overdue, and links to attorney `3`, report `3`, and plan `937726`. Fee `103` is 26.25, an extension fee imposed February 5, 2023, remains pending, and associates with attorney `4`, report `4`, and plan `1290`.

**Table `LateFee`**

| feeId | feeAmount | feeType | impositionDate | paymentStatus | attorneyId | reportId | planId |
|---|---|---|---|---|---|---|---|
| 100 | 38.08 | late-compliance | 2024-11-26T10:42:00 | pending | 1 | 1 | 505977 |
| 101 | 18.47 | late-filing | 2025-04-10T17:59:00 | paid | 2 | 2 | 727038 |
| 102 | 38.08 | late-reporting | 2022-09-21T00:16:00 | overdue | 3 | 3 | 937726 |
| 103 | 26.25 | extension | 2023-02-05T07:33:00 | pending | 4 | 4 | 1290 |

The fee types distinguish between different categories of non-compliance: late-compliance fees arise from failure to meet credit requirements, late-filing fees result from missed submission deadlines, late-reporting fees are assessed for delayed reporting of specific activities, and extension fees are charged when an attorney requests additional time. The payment status—pending, paid, and overdue—provides a clear picture of revenue collection and enforcement priorities. The tripartite linkage to attorney, report, and plan ensures that every fee can be traced to its root cause and that the financial consequences are fully integrated with the educational and remediation tracks.

## Disciplinary Referrals and Commission Oversight

Serious or persistent non-compliance may result in a disciplinary referral, which is forwarded to an overseeing commission for further action. The disciplinary referral table captures the referral identifier, the date the referral was initiated, the reason for referral, the organization to which it was forwarded, and the commission identifier. Referral `9736917` was initiated on May 20, 2022, for noncompliance, was forwarded to the Office of General Counsel, and is associated with commission `1`. Referral `ChIJkzsYUIBt5kcRM6_JHx26ONk`, dated October 4, 2023, concerns a failed deficiency plan, was sent to ASB, and links to commission `2`. Referral `5844263`, created March 15, 2024, addresses a failed professionalism course, was forwarded to the Office of General Counsel, and connects to commission `3`. Referral `group_system`, dated August 26, 2025, is for noncompliance, was sent to ASB, and is tied to commission `4`.

**Table `DisciplinaryReferral`**

| id | referralId | referralDate | referralReason | forwardedTo | commissionId |
|---|---|---|---|---|---|
| 100 | 9736917 | 2022-05-20T04:48:00 | noncompliance | Office of General Counsel | 1 |
| 101 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 2023-10-04T11:05:00 | failed_deficiency_plan | ASB | 2 |
| 102 | 5844263 | 2024-03-15T18:22:00 | failed_professionalism_course | Office of General Counsel | 3 |
| 103 | group_system | 2025-08-26T01:39:00 | noncompliance | ASB | 4 |

The referral reasons—noncompliance, failed_deficiency_plan, and failed_professionalism_course—represent escalating levels of regulatory concern. The forwarding destinations, Office of General Counsel and ASB, indicate the two primary oversight bodies that handle disciplinary matters. The commission identifier on the referral links to the MCLECommission table, which provides the institutional context for each referral. The disciplinary referral also connects to attorneys through the DisciplinaryReferralAttorney cross-reference table, enabling the tracking of which practitioners are subject to which referrals.

**Table `MCLECommission`**

| id | commissionId | commissionName | executiveDirectorName | referralId | planId |
|---|---|---|---|---|---|
| 1 | 24563916 | Primary Review A | Seasonal Assessment | 100 | 505977 |
| 2 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Composite Initiative | Integrated Survey | 101 | 727038 |
| 3 | 8928502 | Compact Model | Extended Corridor D | 102 | 937726 |
| 4 | 937734 | Legacy Cluster D | Pilot Series | 103 | 1290 |

The MCLE Commission serves as the administrative body responsible for overseeing continuing legal education requirements. Each commission record provides the institutional identity that anchors the disciplinary referral process, ensuring that referrals are routed to the appropriate oversight authority based on the nature of the non-compliance and the jurisdictional framework.

## Cross-Reference Tables

The regulatory ecosystem includes several cross-reference tables that resolve many-to-many relationships and support complex queries. The ComplianceYearComplianceReport table links compliance years to their associated reports, enabling the aggregation of reporting activity by year. The AttorneyComplianceReport table connects attorneys to their submitted reports, providing a complete history of each practitioner's compliance submissions. The DisciplinaryReferralAttorney table maps disciplinary referrals to the attorneys involved, supporting the tracking of repeat offenders and the analysis of referral patterns across the practitioner population.

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

These cross-reference tables are essential for maintaining data integrity in the presence of complex relationships. An attorney may submit multiple reports across different compliance years, and a single compliance year may encompass reports from many attorneys. The DisciplinaryReferralAttorney table similarly supports the possibility that a single referral may involve multiple attorneys, such as in cases of firm-wide non-compliance.

## Analytical Views and Operational Reporting

The regulatory framework is supported by a suite of analytical views that join the base tables into operational reports. These views answer specific operational questions by combining data from multiple sources into a single, queryable result set.

The compliance_year_compliance_report_detail_view answers the question of which attorneys submitted reports during a given compliance year and how those reports performed against the credit requirements. It joins the ComplianceYear table with the ComplianceReport table and the Attorney table, producing rows that show the year identifier, the year start and end dates, the credit requirement, the report identifier, the submission date, the credits earned, and the attorney's name and bar status. For example, a row from this view might show year `1000` (requiring 46 credits) with report `1202-0008-S` (earning 6.45 credits) submitted by Theodore Mcgrath, whose active status contrasts sharply with the credit shortfall.

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

The compliance_year_deficiency_plan_view joins the ComplianceYear table with the DeficiencyPlan table to reveal which remediation plans were generated for each compliance year. This view surfaces the plan identifier, the submission date, the completion deadline, the plan status, the good cause justification, and the year's credit requirement. A representative row might show year `1000` with its 46-credit requirement alongside plan `505977`, which is still pending with a justification of extended-good-93, indicating that the remediation process is ongoing.

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

The attorney_compliance_report_detail_view provides a practitioner-centric perspective by joining the Attorney table with the ComplianceReport table. This view answers the question of what reports each attorney has submitted and how those reports were reviewed. A row from this view might display attorney BAR-2243 (Theodore Mcgrath, active status) alongside report `1202-0008-S` (submitted April 24, 2025, with 6.45 credits and a submitted status), giving regulators a clear picture of individual compliance trajectories.

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

The attorney_deficiency_plan_view joins the Attorney table with the DeficiencyPlan table to show which attorneys have deficiency plans and the status of those plans. This view is critical for monitoring remediation progress. A row might show attorney BAR-2246 (Norma Fisher, disbarred) alongside plan `1290`, which has a failed status and a regional-good-96 justification, indicating that the remediation effort did not succeed.

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

The attorney_late_fee_view connects the Attorney table with the LateFee table to reveal the financial penalties assessed against each practitioner. This view answers the question of which attorneys owe fees, how much they owe, and whether those fees have been paid. A row might show attorney BAR-2245 (Saipan International Airport, suspended) with fee `102` of 38.08, classified as a late-reporting fee, with an overdue payment status.

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

The compliance_report_compliance_year_view joins the ComplianceReport table with the ComplianceYear table to provide a report-level view of the compliance year context. This view is useful for understanding how individual reports relate to their governing year's requirements. A row might show report `8189500` (10.90 credits, late status) alongside year `1001` (56-credit requirement), highlighting the significant gap between earned and required credits.

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

The compliance_report_attorney_view joins the ComplianceReport table with the Attorney table to provide a report-level view of the submitting practitioner. This view is essential for regulatory audits that need to trace reports back to their authors. A row might show report `L355` (approved status, 15.35 credits) alongside attorney BAR-2245 (Saipan International Airport, suspended), illustrating that even suspended practitioners are subject to reporting requirements.

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

The compliance_report_late_fee_view joins the ComplianceReport table with the LateFee table to reveal the financial consequences of each report. This view answers the question of whether a given report triggered a late fee and, if so, what type and amount. A row might show report `1202-0008-S` alongside fee `100` (38.08, late-compliance, pending payment), connecting the report outcome directly to its financial impact.

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

The deficiency_plan_compliance_year_view joins the DeficiencyPlan table with the ComplianceYear table to show which compliance year each deficiency plan originated from. This view is useful for analyzing the relationship between year-level credit requirements and the resulting remediation plans. A row might show plan `727038` (approved status, integrated-good-94) alongside year `1001` (56-credit requirement), indicating that the remediation plan was generated in response to the shortfall in that year.

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

The deficiency_plan_attorney_view joins the DeficiencyPlan table with the Attorney table to show which attorney each deficiency plan is associated with. This view is critical for tracking individual remediation progress. A row might show plan `937726` (completed status, seasonal-good-95) alongside attorney BAR-2245 (Saipan International Airport, suspended), demonstrating that even suspended practitioners can complete their remediation obligations.

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

The deficiency_plan_late_fee_view joins the DeficiencyPlan table with the LateFee table to reveal the financial penalties associated with each deficiency plan. This view answers the question of whether a given plan has an associated fee and what the payment status is. A row might show plan `1290` (failed status) alongside fee `103` (26.25, extension, pending), indicating that the failed remediation effort is accompanied by an outstanding financial obligation.

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

The late_fee_attorney_view joins the LateFee table with the Attorney table to provide a fee-level view of the responsible practitioner. This view is essential for collections and enforcement activities. A row might show fee `101` (18.47, paid) alongside attorney BAR-2244 (Account Name, inactive), illustrating that even inactive practitioners are held to financial obligations.

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

The late_fee_compliance_report_view joins the LateFee table with the ComplianceReport table to show which report triggered each fee. This view is useful for understanding the causal relationship between report outcomes and financial penalties. A row might show fee `102` (overdue status) alongside report `L355` (approved status), demonstrating that a report can be approved for educational content while still incurring a late fee for procedural non-compliance.

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

The late_fee_deficiency_plan_view joins the LateFee table with the DeficiencyPlan table to reveal the connection between financial penalties and remediation plans. This view answers the question of whether a given fee is associated with a specific remediation effort. A row might show fee `100` (pending payment) alongside plan `505977` (pending status), indicating that both the financial and remediation obligations remain unresolved.

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

The disciplinary_referral_attorney_detail_view joins the DisciplinaryReferral table with the Attorney table to provide a referral-level view of the practitioners involved. This view is critical for tracking which attorneys are subject to disciplinary action. A row might show referral `9736917` (noncompliance, forwarded to Office of General Counsel) alongside attorney BAR-2243 (Theodore Mcgrath, active), illustrating that active practitioners can face disciplinary referrals.

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

The disciplinary_referral_m_c_l_e_commission_view joins the DisciplinaryReferral table with the MCLECommission table to show which commission is responsible for each referral. This view answers the question of how referrals are distributed across oversight bodies. A row might show referral `ChIJkzsYUIBt5kcRM6_JHx26ONk` (failed_deficiency_plan) alongside commission `2`, indicating that referrals for failed deficiency plans are routed to specific commissions.

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

The m_c_l_e_commission_disciplinary_referral_view joins the MCLECommission table with the DisciplinaryReferral table to provide a commission-level view of the referrals it handles. This view is useful for analyzing the workload and focus areas of each commission. A row might show commission `1` alongside referral `9736917` (noncompliance), indicating that commission `1` handles referrals related to general non-compliance.

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

The m_c_l_e_commission_deficiency_plan_view joins the MCLECommission table with the DeficiencyPlan table to show which deficiency plans are overseen by each commission. This view is essential for understanding the relationship between educational oversight and remediation efforts. A row might show commission `3` alongside plan `937726` (completed status), indicating that commission `3` has oversight of remediation plans that have been successfully completed.

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

## Closing Synthesis

The attorney compliance ecosystem is a tightly integrated system of educational requirements, reporting obligations, remediation plans, financial penalties, and disciplinary oversight. Each component—from the compliance year that sets the credit threshold to the disciplinary referral that initiates formal action—is connected through a network of foreign keys that ensure data integrity and enable comprehensive analysis. The analytical views provide the operational lens through which regulators can monitor individual practitioners, aggregate compliance patterns by year, track financial collections, and distribute disciplinary workloads across oversight commissions. The fictional practitioners and organizations in this dataset—Theodore Mcgrath, Account Name, Saipan International Airport, and Norma Fisher—illustrate the range of statuses and outcomes that the system must handle, from active practitioners meeting their obligations to disbarred attorneys with failed remediation plans. Together, these tables and views form the backbone of a regulatory framework designed to ensure that legal professionals maintain the continuing education and professional standards required of their practice.