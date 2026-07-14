## Financial Aid Administration: Records, Relationships, and Operational Views

Higher education institutions manage financial aid through a structured ecosystem of applications, awards, enrollment plans, and academic terms. Each student carries a profile, a program of study, and a sequence of aid applications tied to specific academic years. The institution tracks whether a student meets satisfactory academic progress, what other financial resources they bring to the table, and how each award is disbursed. This chapter walks through the core records and the joined views that bring them together into actionable information.

The foundation begins with the student record.

**Table `Student`**

| id | studentId | fullName | phone | emailAddress | isGraduateStudent | programId | applicationId | progressId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | compact-phone-26 | primary-email-70 | false | 1 | 100 | 1000 | 2025-01-01 00:14:00 |
| 101 | 25388256 | Account Name | composite-phone-27 | adaptive-email-71 | true | 2 | 101 | 1001 | 2025-02-06 03:14:00 |
| 102 | id_16 | Saipan International Airport | primary-phone-28 | distributed-email-72 | false | 3 | 102 | 1002 | 2025-03-11 06:14:00 |
| 103 | gd_taxc_2211 | Norma Fisher | adaptive-phone-29 | baseline-email-73 | true | 4 | 103 | 1003 | 2025-04-16 09:14:00 |

A student record anchors the entire aid lifecycle. The `id` column serves as the internal surrogate key, while `studentId` holds the external identifier used in downstream systems. Names such as Theodore Mcgrath and Norma Fisher appear alongside contact details like `primary-email-70` and `adaptive-phone-29`. The boolean `isGraduateStudent` distinguishes graduate-level applicants from undergraduates; in the sample data, Account Name and Norma Fisher are flagged as graduate students, while Theodore Mcgrath and Saipan International Airport are not. The `programId` links the student to their academic program, and `applicationId` and `progressId` point to the student's current aid application and satisfactory academic progress record, respectively. Timestamps in `createdAt` show when the record was created, ranging from early January 2025 to mid-April 2025 in the sample.

Every student enrolls in an academic program that defines the scope of their study.

**Table `AcademicProgram`**

| id | programCode | programName | standardTimeframeYears | isEligibleForFederalAid | studentId |
|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 27 | true | 100 |
| 2 | 1186082 | Pilot Initiative A | 36 | false | 101 |
| 3 | 3990187 | Baseline Model | 45 | true | 102 |
| 4 | flexible-thinking | Distributed Cluster | 54 | false | 103 |

The `AcademicProgram` table stores program metadata. The `programCode` column holds identifiers such as `191` for Extended Review and `flexible-thinking` for Distributed Cluster. The `programName` provides a human-readable label, while `standardTimeframeYears` indicates the expected duration of the program — values in the sample range from 27 to 54 years, reflecting the synthetic nature of the data. The `isEligibleForFederalAid` flag determines whether students in the program can receive federal aid; Extended Review and Baseline Model are eligible, while Pilot Initiative A and Distributed Cluster are not. The `studentId` column creates a direct link back to the student who is pursuing that program.

Academic terms structure the calendar into discrete periods of instruction.

**Table `AcademicTerm`**

| termId | termName | startDate | endDate | numberOfWeeks | isEnrollmentRequired | planId | awardId |
|---|---|---|---|---|---|---|---|
| model_delegation_child0 | Distributed Survey | 2022-09-05 | 2022-09-01 | 16 | true | 1000 | 1 |
| 2986222 | Adaptive Corridor D | 2023-02-16 | 2023-02-12 | 26 | false | 1001 | 2 |
| id_26 | Primary Series | 2024-07-27 | 2024-07-23 | 36 | true | 1002 | 3 |
| 5006436 | Composite Assessment | 2025-12-11 | 2025-12-07 | 46 | false | 1003 | 4 |

Each term has a `termId`, a `termName` such as Distributed Survey or Adaptive Corridor D, and a date range defined by `startDate` and `endDate`. The `numberOfWeeks` field records the term length, with values like 16, 26, 36, and 46 weeks in the sample. The `isEnrollmentRequired` flag indicates whether enrollment is mandatory for that term. The `planId` and `awardId` columns connect the term to an enrollment plan and a financial award, respectively.

Students follow an enrollment plan that specifies their course load and aid needs.

**Table `EnrollmentPlan`**

| planId | plannedCredits | isHalfTimeMinimum | isWithdrawing | doesNotNeedAid | termId | applicationId |
|---|---|---|---|---|---|---|
| 1000 | 43 | false | true | false | model_delegation_child0 | 100 |
| 1001 | 48 | true | false | true | 2986222 | 101 |
| 1002 | 53 | false | true | false | id_26 | 102 |
| 1003 | 58 | true | false | true | 5006436 | 103 |

The `EnrollmentPlan` table captures the student's intended credit load through `plannedCredits`, which in the sample ranges from 43 to 58 credits. The `isHalfTimeMinimum` flag indicates whether the plan meets the half-time enrollment threshold required for aid eligibility. The `isWithdrawing` flag marks students who are in the process of withdrawing, and `doesNotNeedAid` flags those who have indicated they do not require financial assistance. The `termId` links the plan to a specific academic term, and `applicationId` ties it to the student's aid application.

Financial aid applications are the primary intake mechanism for aid consideration.

**Table `FinancialAidApplication`**

| id | applicationId | submissionDate | academicYear | isElectronicSignatureAccepted | hasPriorFederalAid | status | studentId | awardId |
|---|---|---|---|---|---|---|---|---|
| 100 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | true | false | pending | 100 | 1 |
| 101 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | false | true | under_review | 101 | 2 |
| 102 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | true | false | approved | 102 | 3 |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | false | true | rejected | 103 | 4 |

Each application carries an `applicationId` such as `505997` or `IVC20det40`, a `submissionDate`, and an `academicYear` identifier like `legacy-academic-43`. The `isElectronicSignatureAccepted` and `hasPriorFederalAid` booleans capture key eligibility conditions. The `status` column tracks the application's lifecycle stage — pending, under_review, approved, or rejected — with the sample data showing one record in each state. The `studentId` links the application to the applicant, and `awardId` connects it to a financial award once one has been determined.

A cross-reference table links applications to the academic terms they cover.

**Table `FinancialAidApplicationAcademicTerm`**

| applicationId | termId |
|---|---|
| 100 | model_delegation_child0 |
| 100 | 2986222 |
| 101 | 2986222 |
| 101 | id_26 |
| 102 | id_26 |
| 102 | 5006436 |
| 103 | 5006436 |
| 103 | model_delegation_child0 |

This table establishes the relationship between a financial aid application and the academic terms for which aid is being requested. It serves as a bridge between the application record and the term-level planning data.

Financial awards formalize the aid package offered to a student.

**Table `FinancialAward`**

| id | awardId | awardType | estimatedAmount | isWithinAnnualLimit | isWithinAggregateLimit | disbursementStatus | studentId | applicationId | resourceId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Direct_Unsubsidized | 13.49 | false | true | pending | 100 | 100 | 1167 |
| 2 | 3012811 | Direct_Plus | 10.72 | true | false | disbursed | 101 | 101 | 2106708 |
| 3 | 15493350 | Graduate_Assistantship | 25.36 | false | true | adjusted | 102 | 102 | 4180945 |
| 4 | state_uk_17 | Fellowship | 18.47 | true | false | pending | 103 | 103 | 10238270 |

Each award has an `awardId` (a UUID or string identifier), an `awardType` such as Direct_Unsubsidized, Direct_Plus, Graduate_Assistantship, or Fellowship, and an `estimatedAmount` — values in the sample are 13.49, 10.72, 25.36, and 18.47. The `isWithinAnnualLimit` and `isWithinAggregateLimit` flags indicate whether the award amount falls within regulatory caps. The `disbursementStatus` tracks the current state of the award — pending, disbursed, or adjusted. The `studentId`, `applicationId`, and `resourceId` columns link the award to the student, the originating application, and any other financial resource that may offset the award.

Satisfactory academic progress records track whether a student maintains the academic standing required to remain eligible for aid.

**Table `SatisfactoryAcademicProgress`**

| id | completionRatePercent | cumulativeGPA | maxTimeframePercent | isEligible | studentId |
|---|---|---|---|---|---|
| 1000 | 21.45 | 18.20 | 6.20 | true | 100 |
| 1001 | 25.90 | 21.40 | 8.40 | false | 101 |
| 1002 | 30.35 | 24.60 | 10.60 | true | 102 |
| 1003 | 34.80 | 27.80 | 12.80 | false | 103 |

This table stores the institution's determination of a student's progress toward degree completion. The specific columns and values are captured in the record itself.

Other financial resources represent external funding that may reduce the amount of institutional aid a student needs.

**Table `OtherFinancialResource`**

| resourceId | sourceType | amount | isVerified | studentId | awardId |
|---|---|---|---|---|---|
| 1167 | private_scholarship | 13.49 | true | 100 | 1 |
| 2106708 | employer_tuition_benefit | 25.47 | false | 101 | 2 |
| 4180945 | veterans_benefits | 19.72 | true | 102 | 3 |
| 10238270 | vocational_rehabilitation | 12.74 | false | 103 | 4 |

This table documents scholarships, grants, employer contributions, and other sources of funding that are not part of the institution's own financial aid program. The specific columns and values are captured in the record itself.

With the base tables established, the following views synthesize the data into operational reports.

### Application and Student Context

**View `v_financial_aid_application_student`**

```sql
CREATE VIEW v_financial_aid_application_student AS
SELECT a.id, a.applicationId, a.submissionDate, a.academicYear, b.id AS student_id, b.studentId AS student_studentId, b.fullName AS student_fullName
FROM FinancialAidApplication a JOIN Student b ON a.studentId = b.id;
```

| id | applicationId | submissionDate | academicYear | student_id | student_studentId | student_fullName |
|---|---|---|---|---|---|---|
| 100 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | 100 | 392507 | Theodore Mcgrath |
| 101 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | 101 | 25388256 | Account Name |
| 102 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | 102 | id_16 | Saipan International Airport |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | 103 | gd_taxc_2211 | Norma Fisher |

This view joins the financial aid application with the student record, answering the question: who applied for aid, and what are their contact and program details? A row for application `505997` would show Theodore Mcgrath, student ID `392507`, with the application status `pending` and the submission date `2025-04-24T03:57:00`. Another row for application `IVC20det40` would surface Norma Fisher, student ID `gd_taxc_2211`, with status `rejected`. This view is the starting point for any aid office workflow that needs to contact an applicant or verify their identity.

### Application and Term Detail

**View `v_financial_aid_application_academic_term_detail`**

```sql
CREATE VIEW v_financial_aid_application_academic_term_detail AS
SELECT a.id, a.applicationId, a.submissionDate, b.termId AS term_termId, b.termName AS term_termName, b.startDate AS term_startDate
FROM FinancialAidApplication a
  JOIN FinancialAidApplicationAcademicTerm j ON j.applicationId = a.id
  JOIN AcademicTerm b ON b.termId = j.termId;
```

| id | applicationId | submissionDate | term_termId | term_termName | term_startDate |
|---|---|---|---|---|---|
| 100 | 505997 | 2025-04-24T03:57:00 | model_delegation_child0 | Distributed Survey | 2022-09-05 |
| 100 | 505997 | 2025-04-24T03:57:00 | 2986222 | Adaptive Corridor D | 2023-02-16 |
| 101 | 1250196 | 2022-09-08T10:14:00 | 2986222 | Adaptive Corridor D | 2023-02-16 |
| 101 | 1250196 | 2022-09-08T10:14:00 | id_26 | Primary Series | 2024-07-27 |
| 102 | 124 | 2023-02-19T17:31:00 | id_26 | Primary Series | 2024-07-27 |
| 102 | 124 | 2023-02-19T17:31:00 | 5006436 | Composite Assessment | 2025-12-11 |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | 5006436 | Composite Assessment | 2025-12-11 |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | model_delegation_child0 | Distributed Survey | 2022-09-05 |

This view connects applications to the academic terms they reference, answering: for which terms is this student seeking aid? A row linking application `505997` to the term `Distributed Survey` would show the term's date range and week count alongside the application's academic year `legacy-academic-43`. This join is essential for verifying that the aid period aligns with the student's enrollment schedule.

### Application and Award Detail

**View `v_financial_aid_application_financial_award`**

```sql
CREATE VIEW v_financial_aid_application_financial_award AS
SELECT a.id, a.applicationId, a.submissionDate, a.academicYear, b.id AS award_id, b.awardId AS award_awardId, b.awardType AS award_awardType
FROM FinancialAidApplication a JOIN FinancialAward b ON a.awardId = b.id;
```

| id | applicationId | submissionDate | academicYear | award_id | award_awardId | award_awardType |
|---|---|---|---|---|---|---|
| 100 | 505997 | 2025-04-24T03:57:00 | legacy-academic-43 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Direct_Unsubsidized |
| 101 | 1250196 | 2022-09-08T10:14:00 | compact-academic-44 | 2 | 3012811 | Direct_Plus |
| 102 | 124 | 2023-02-19T17:31:00 | composite-academic-45 | 3 | 15493350 | Graduate_Assistantship |
| 103 | IVC20det40 | 2024-07-03T00:48:00 | primary-academic-46 | 4 | state_uk_17 | Fellowship |

This view pairs each application with its corresponding financial award, answering: what aid has been offered for this application? For application `124` (status `approved`), the joined row would show award type `Graduate_Assistantship` with an estimated amount of `25.36` and disbursement status `adjusted`. For application `505997` (status `pending`), the award type would be `Direct_Unsubsidized` with status `pending`. This view is the primary tool for reviewing aid offers.

### Student and Academic Program

**View `v_student_academic_program`**

```sql
CREATE VIEW v_student_academic_program AS
SELECT a.id, a.studentId, a.fullName, a.phone, b.id AS program_id, b.programCode AS program_programCode, b.programName AS program_programName
FROM Student a JOIN AcademicProgram b ON a.programId = b.id;
```

| id | studentId | fullName | phone | program_id | program_programCode | program_programName |
|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | compact-phone-26 | 1 | 191 | Extended Review |
| 101 | 25388256 | Account Name | composite-phone-27 | 2 | 1186082 | Pilot Initiative A |
| 102 | id_16 | Saipan International Airport | primary-phone-28 | 3 | 3990187 | Baseline Model |
| 103 | gd_taxc_2211 | Norma Fisher | adaptive-phone-29 | 4 | flexible-thinking | Distributed Cluster |

This view links each student to their academic program, answering: what is the student studying, and is the program eligible for federal aid? A row for Theodore Mcgrath would show program code `191` (Extended Review), a standard timeframe of 27 years, and federal eligibility set to `true`. A row for Norma Fisher would show program code `flexible-thinking` (Distributed Cluster) with federal eligibility set to `false`. This view helps the aid office quickly identify students in ineligible programs.

### Student and Financial Aid Application

**View `v_student_financial_aid_application`**

```sql
CREATE VIEW v_student_financial_aid_application AS
SELECT a.id, a.studentId, a.fullName, a.phone, b.id AS application_id, b.applicationId AS application_applicationId, b.submissionDate AS application_submissionDate
FROM Student a JOIN FinancialAidApplication b ON a.applicationId = b.id;
```

| id | studentId | fullName | phone | application_id | application_applicationId | application_submissionDate |
|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | compact-phone-26 | 100 | 505997 | 2025-04-24T03:57:00 |
| 101 | 25388256 | Account Name | composite-phone-27 | 101 | 1250196 | 2022-09-08T10:14:00 |
| 102 | id_16 | Saipan International Airport | primary-phone-28 | 102 | 124 | 2023-02-19T17:31:00 |
| 103 | gd_taxc_2211 | Norma Fisher | adaptive-phone-29 | 103 | IVC20det40 | 2024-07-03T00:48:00 |

This view joins the student record with their aid application, answering: what is the current status of this student's aid application? A row for student `392507` (Theodore Mcgrath) would show application ID `505997`, status `pending`, and submission date `2025-04-24T03:57:00`. A row for student `25388256` (Account Name) would show application ID `1250196`, status `under_review`, and prior federal aid set to `true`. This view is useful for student-facing portals and aid office dashboards.

### Student and Satisfactory Academic Progress

**View `v_student_satisfactory_academic_progress`**

```sql
CREATE VIEW v_student_satisfactory_academic_progress AS
SELECT a.id, a.studentId, a.fullName, a.phone, b.id AS progress_id, b.completionRatePercent AS progress_completionRatePercent, b.cumulativeGPA AS progress_cumulativeGPA
FROM Student a JOIN SatisfactoryAcademicProgress b ON a.progressId = b.id;
```

| id | studentId | fullName | phone | progress_id | progress_completionRatePercent | progress_cumulativeGPA |
|---|---|---|---|---|---|---|
| 100 | 392507 | Theodore Mcgrath | compact-phone-26 | 1000 | 21.45 | 18.20 |
| 101 | 25388256 | Account Name | composite-phone-27 | 1001 | 25.90 | 21.40 |
| 102 | id_16 | Saipan International Airport | primary-phone-28 | 1002 | 30.35 | 24.60 |
| 103 | gd_taxc_2211 | Norma Fisher | adaptive-phone-29 | 1003 | 34.80 | 27.80 |

This view connects each student to their satisfactory academic progress determination, answering: does this student meet the academic standards required to remain eligible for aid? The joined record surfaces the student's name, ID, and the progress status, enabling the aid office to flag students who may be at risk of losing eligibility.

### Academic Program and Student

**View `v_academic_program_student`**

```sql
CREATE VIEW v_academic_program_student AS
SELECT a.id, a.programCode, a.programName, a.standardTimeframeYears, b.id AS student_id, b.studentId AS student_studentId, b.fullName AS student_fullName
FROM AcademicProgram a JOIN Student b ON a.studentId = b.id;
```

| id | programCode | programName | standardTimeframeYears | student_id | student_studentId | student_fullName |
|---|---|---|---|---|---|---|
| 1 | 191 | Extended Review | 27 | 100 | 392507 | Theodore Mcgrath |
| 2 | 1186082 | Pilot Initiative A | 36 | 101 | 25388256 | Account Name |
| 3 | 3990187 | Baseline Model | 45 | 102 | id_16 | Saipan International Airport |
| 4 | flexible-thinking | Distributed Cluster | 54 | 103 | gd_taxc_2211 | Norma Fisher |

This view inverts the student-to-program relationship, answering: which students are enrolled in each academic program? A row for program code `191` (Extended Review) would list Theodore Mcgrath as the enrolled student. A row for program code `1186082` (Pilot Initiative A) would list Account Name. This view supports program-level reporting and capacity planning.

### Academic Term and Enrollment Plan

**View `v_academic_term_enrollment_plan`**

```sql
CREATE VIEW v_academic_term_enrollment_plan AS
SELECT a.termId, a.termName, a.startDate, a.endDate, b.planId AS plan_planId, b.plannedCredits AS plan_plannedCredits, b.isHalfTimeMinimum AS plan_isHalfTimeMinimum
FROM AcademicTerm a JOIN EnrollmentPlan b ON a.planId = b.planId;
```

| termId | termName | startDate | endDate | plan_planId | plan_plannedCredits | plan_isHalfTimeMinimum |
|---|---|---|---|---|---|---|
| model_delegation_child0 | Distributed Survey | 2022-09-05 | 2022-09-01 | 1000 | 43 | false |
| 2986222 | Adaptive Corridor D | 2023-02-16 | 2023-02-12 | 1001 | 48 | true |
| id_26 | Primary Series | 2024-07-27 | 2024-07-23 | 1002 | 53 | false |
| 5006436 | Composite Assessment | 2025-12-11 | 2025-12-07 | 1003 | 58 | true |

This view links academic terms to the enrollment plans associated with them, answering: what is the planned credit load for each term? A row for term `Distributed Survey` would show a planned credit load of `43`, with `isHalfTimeMinimum` set to `false` and `isWithdrawing` set to `true`. A row for term `Adaptive Corridor D` would show `48` planned credits, half-time minimum met, and no withdrawal flag. This view helps the registrar and aid office verify enrollment intensity.

### Academic Term and Financial Award

**View `v_academic_term_financial_award`**

```sql
CREATE VIEW v_academic_term_financial_award AS
SELECT a.termId, a.termName, a.startDate, a.endDate, b.id AS award_id, b.awardId AS award_awardId, b.awardType AS award_awardType
FROM AcademicTerm a JOIN FinancialAward b ON a.awardId = b.id;
```

| termId | termName | startDate | endDate | award_id | award_awardId | award_awardType |
|---|---|---|---|---|---|---|
| model_delegation_child0 | Distributed Survey | 2022-09-05 | 2022-09-01 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Direct_Unsubsidized |
| 2986222 | Adaptive Corridor D | 2023-02-16 | 2023-02-12 | 2 | 3012811 | Direct_Plus |
| id_26 | Primary Series | 2024-07-27 | 2024-07-23 | 3 | 15493350 | Graduate_Assistantship |
| 5006436 | Composite Assessment | 2025-12-11 | 2025-12-07 | 4 | state_uk_17 | Fellowship |

This view connects academic terms to the financial awards tied to them, answering: what aid is associated with each term? A row for term `Distributed Survey` would show award type `Direct_Unsubsidized` with an estimated amount of `13.49` and disbursement status `pending`. A row for term `Primary Series` would show `Graduate_Assistantship` with amount `25.36` and status `adjusted`. This view is useful for term-by-term budget reconciliation.

### Enrollment Plan and Academic Term

**View `v_enrollment_plan_academic_term`**

```sql
CREATE VIEW v_enrollment_plan_academic_term AS
SELECT a.planId, a.plannedCredits, a.isHalfTimeMinimum, a.isWithdrawing, b.termId AS term_termId, b.termName AS term_termName, b.startDate AS term_startDate
FROM EnrollmentPlan a JOIN AcademicTerm b ON a.termId = b.termId;
```

| planId | plannedCredits | isHalfTimeMinimum | isWithdrawing | term_termId | term_termName | term_startDate |
|---|---|---|---|---|---|---|
| 1000 | 43 | false | true | model_delegation_child0 | Distributed Survey | 2022-09-05 |
| 1001 | 48 | true | false | 2986222 | Adaptive Corridor D | 2023-02-16 |
| 1002 | 53 | false | true | id_26 | Primary Series | 2024-07-27 |
| 1003 | 58 | true | false | 5006436 | Composite Assessment | 2025-12-11 |

This view pairs each enrollment plan with its corresponding academic term, answering: which term does this enrollment plan cover? A row for plan `1000` would show term `Distributed Survey` with 16 weeks, while plan `1001` would show term `Adaptive Corridor D` with 26 weeks. This join is foundational for any report that needs to trace a plan back to its calendar context.

### Enrollment Plan and Financial Aid Application

**View `v_enrollment_plan_financial_aid_application`**

```sql
CREATE VIEW v_enrollment_plan_financial_aid_application AS
SELECT a.planId, a.plannedCredits, a.isHalfTimeMinimum, a.isWithdrawing, b.id AS application_id, b.applicationId AS application_applicationId, b.submissionDate AS application_submissionDate
FROM EnrollmentPlan a JOIN FinancialAidApplication b ON a.applicationId = b.id;
```

| planId | plannedCredits | isHalfTimeMinimum | isWithdrawing | application_id | application_applicationId | application_submissionDate |
|---|---|---|---|---|---|---|
| 1000 | 43 | false | true | 100 | 505997 | 2025-04-24T03:57:00 |
| 1001 | 48 | true | false | 101 | 1250196 | 2022-09-08T10:14:00 |
| 1002 | 53 | false | true | 102 | 124 | 2023-02-19T17:31:00 |
| 1003 | 58 | true | false | 103 | IVC20det40 | 2024-07-03T00:48:00 |

This view links enrollment plans to the financial aid applications they support, answering: which application is this enrollment plan tied to? A row for plan `1000` would show application ID `505997` with status `pending`, while plan `1003` would show application `IVC20det40` with status `rejected`. This view helps the aid office understand the relationship between enrollment intensity and aid decisions.

### Financial Award and Student

**View `v_financial_award_student`**

```sql
CREATE VIEW v_financial_award_student AS
SELECT a.id, a.awardId, a.awardType, a.estimatedAmount, b.id AS student_id, b.studentId AS student_studentId, b.fullName AS student_fullName
FROM FinancialAward a JOIN Student b ON a.studentId = b.id;
```

| id | awardId | awardType | estimatedAmount | student_id | student_studentId | student_fullName |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Direct_Unsubsidized | 13.49 | 100 | 392507 | Theodore Mcgrath |
| 2 | 3012811 | Direct_Plus | 10.72 | 101 | 25388256 | Account Name |
| 3 | 15493350 | Graduate_Assistantship | 25.36 | 102 | id_16 | Saipan International Airport |
| 4 | state_uk_17 | Fellowship | 18.47 | 103 | gd_taxc_2211 | Norma Fisher |

This view connects financial awards to the students who received them, answering: which student received which award? A row for award type `Direct_Unsubsidized` would show student Theodore Mcgrath (ID `392507`) with an estimated amount of `13.49` and disbursement status `pending`. A row for award type `Fellowship` would show student Norma Fisher (ID `gd_taxc_2211`) with amount `18.47` and status `pending`. This view is the primary tool for award-level student reporting.

### Financial Award and Financial Aid Application

**View `v_financial_award_financial_aid_application`**

```sql
CREATE VIEW v_financial_award_financial_aid_application AS
SELECT a.id, a.awardId, a.awardType, a.estimatedAmount, b.id AS application_id, b.applicationId AS application_applicationId, b.submissionDate AS application_submissionDate
FROM FinancialAward a JOIN FinancialAidApplication b ON a.applicationId = b.id;
```

| id | awardId | awardType | estimatedAmount | application_id | application_applicationId | application_submissionDate |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Direct_Unsubsidized | 13.49 | 100 | 505997 | 2025-04-24T03:57:00 |
| 2 | 3012811 | Direct_Plus | 10.72 | 101 | 1250196 | 2022-09-08T10:14:00 |
| 3 | 15493350 | Graduate_Assistantship | 25.36 | 102 | 124 | 2023-02-19T17:31:00 |
| 4 | state_uk_17 | Fellowship | 18.47 | 103 | IVC20det40 | 2024-07-03T00:48:00 |

This view pairs each financial award with its originating application, answering: which application led to this award? A row for award `e02275d4-8fd1-11eb-924d-9cd76263cbd0` would show application ID `505997` with status `pending`, while award `15493350` would show application `124` with status `approved`. This view supports audit trails and award lifecycle tracking.

### Financial Award and Other Financial Resource

**View `v_financial_award_other_financial_resource`**

```sql
CREATE VIEW v_financial_award_other_financial_resource AS
SELECT a.id, a.awardId, a.awardType, a.estimatedAmount, b.resourceId AS resource_resourceId, b.sourceType AS resource_sourceType, b.amount AS resource_amount
FROM FinancialAward a JOIN OtherFinancialResource b ON a.resourceId = b.resourceId;
```

| id | awardId | awardType | estimatedAmount | resource_resourceId | resource_sourceType | resource_amount |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Direct_Unsubsidized | 13.49 | 1167 | private_scholarship | 13.49 |
| 2 | 3012811 | Direct_Plus | 10.72 | 2106708 | employer_tuition_benefit | 25.47 |
| 3 | 15493350 | Graduate_Assistantship | 25.36 | 4180945 | veterans_benefits | 19.72 |
| 4 | state_uk_17 | Fellowship | 18.47 | 10238270 | vocational_rehabilitation | 12.74 |

This view links financial awards to other financial resources that may offset the award amount, answering: what external funding is being considered alongside this award? A row for award type `Direct_Plus` with amount `10.72` would show the associated other financial resource ID `2106708`. This view is critical for calculating net need and ensuring awards do not exceed regulatory limits.

### Satisfactory Academic Progress and Student

**View `v_satisfactory_academic_progress_student`**

```sql
CREATE VIEW v_satisfactory_academic_progress_student AS
SELECT a.id, a.completionRatePercent, a.cumulativeGPA, a.maxTimeframePercent, b.id AS student_id, b.studentId AS student_studentId, b.fullName AS student_fullName
FROM SatisfactoryAcademicProgress a JOIN Student b ON a.studentId = b.id;
```

| id | completionRatePercent | cumulativeGPA | maxTimeframePercent | student_id | student_studentId | student_fullName |
|---|---|---|---|---|---|---|
| 1000 | 21.45 | 18.20 | 6.20 | 100 | 392507 | Theodore Mcgrath |
| 1001 | 25.90 | 21.40 | 8.40 | 101 | 25388256 | Account Name |
| 1002 | 30.35 | 24.60 | 10.60 | 102 | id_16 | Saipan International Airport |
| 1003 | 34.80 | 27.80 | 12.80 | 103 | gd_taxc_2211 | Norma Fisher |

This view connects satisfactory academic progress records to the students they apply to, answering: which student does this progress determination belong to? A row would surface the student's name and ID alongside the progress status, enabling the aid office to monitor compliance across the student population.

### Other Financial Resource and Student

**View `v_other_financial_resource_student`**

```sql
CREATE VIEW v_other_financial_resource_student AS
SELECT a.resourceId, a.sourceType, a.amount, a.isVerified, b.id AS student_id, b.studentId AS student_studentId, b.fullName AS student_fullName
FROM OtherFinancialResource a JOIN Student b ON a.studentId = b.id;
```

| resourceId | sourceType | amount | isVerified | student_id | student_studentId | student_fullName |
|---|---|---|---|---|---|---|
| 1167 | private_scholarship | 13.49 | true | 100 | 392507 | Theodore Mcgrath |
| 2106708 | employer_tuition_benefit | 25.47 | false | 101 | 25388256 | Account Name |
| 4180945 | veterans_benefits | 19.72 | true | 102 | id_16 | Saipan International Airport |
| 10238270 | vocational_rehabilitation | 12.74 | false | 103 | gd_taxc_2211 | Norma Fisher |

This view links other financial resources to the students who bring them, answering: what external funding does each student have? A row would show the student's name and ID alongside the resource details, helping the aid office calculate total available resources and adjust institutional awards accordingly.

### Other Financial Resource and Financial Award

**View `v_other_financial_resource_financial_award`**

```sql
CREATE VIEW v_other_financial_resource_financial_award AS
SELECT a.resourceId, a.sourceType, a.amount, a.isVerified, b.id AS award_id, b.awardId AS award_awardId, b.awardType AS award_awardType
FROM OtherFinancialResource a JOIN FinancialAward b ON a.awardId = b.id;
```

| resourceId | sourceType | amount | isVerified | award_id | award_awardId | award_awardType |
|---|---|---|---|---|---|---|
| 1167 | private_scholarship | 13.49 | true | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Direct_Unsubsidized |
| 2106708 | employer_tuition_benefit | 25.47 | false | 2 | 3012811 | Direct_Plus |
| 4180945 | veterans_benefits | 19.72 | true | 3 | 15493350 | Graduate_Assistantship |
| 10238270 | vocational_rehabilitation | 12.74 | false | 4 | state_uk_17 | Fellowship |

This view connects other financial resources to the financial awards they offset, answering: which award is being reduced by this external resource? A row would show the resource alongside the award type and estimated amount, supporting need analysis and award packaging decisions.

### Synthesis

The financial aid domain is built on a network of interlocking records: students apply for aid, programs define eligibility, terms structure the calendar, enrollment plans specify course loads, awards formalize the aid package, and progress records ensure academic standing. The base tables capture each piece of the puzzle, while the views bring them together into reports that answer concrete operational questions — who applied, what was offered, for which term, and under what conditions. Understanding both the individual records and the joined views is essential for anyone working in financial aid administration, from aid counselors reviewing applications to data analysts building institutional reports.