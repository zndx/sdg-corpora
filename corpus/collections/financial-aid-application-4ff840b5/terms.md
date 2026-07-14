# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Financial Aid Application
- **genus**: `cco:ont00000995`
- **definition**: A formal record submitted by a graduate student to request federal financial aid eligibility and determine the Cost of Attendance for an academic year.
- **attributes**: applicationId, submissionDate, academicYear, isElectronicSignatureAccepted, hasPriorFederalAid, status
- **relations**: submittedBy→Student, coversTerm→AcademicTerm, determinesAward→FinancialAward

## Student
- **genus**: `bfo:0000040`
- **definition**: A graduate student enrolled in an eligible program, identified by a unique institutional ID and personal contact details.
- **attributes**: studentId, fullName, phone, emailAddress, isGraduateStudent
- **relations**: enrolledIn→AcademicProgram, submittedApplication→FinancialAidApplication, meetsSAP→SatisfactoryAcademicProgress

## Academic Program
- **genus**: `bfo:0000040`
- **definition**: An eligible graduate degree program for which a student is accepted and which defines the standard timeframe for degree completion.
- **attributes**: programCode, programName, standardTimeframeYears, isEligibleForFederalAid
- **relations**: hasCoordinator→AcademicCoordinator, enrollsStudent→Student

## Academic Term
- **genus**: `bfo:0000040`
- **definition**: A specific period of instruction within an academic year, used to calculate enrollment intensity and disburse financial aid.
- **attributes**: termId, termName, startDate, endDate, numberOfWeeks, isEnrollmentRequired
- **relations**: partOfAcademicYear→AcademicYear, hasPlannedCredits→EnrollmentPlan, triggersDisbursement→FinancialAward

## Enrollment Plan
- **genus**: `cco:ont00000995`
- **definition**: A record of the exact number of credits a student plans to take in a specific term, used to determine federal loan eligibility.
- **attributes**: plannedCredits, isHalfTimeMinimum, isWithdrawing, doesNotNeedAid
- **relations**: appliesToTerm→AcademicTerm, belongsToFiledBy→FinancialAidApplication

## Financial Award
- **genus**: `cco:ont00000995`
- **definition**: A specific grant or loan allocation determined by the Cost of Attendance and federal loan limits, subject to adjustment based on actual enrollment.
- **attributes**: awardId, awardType, estimatedAmount, isWithinAnnualLimit, isWithinAggregateLimit, disbursementStatus
- **relations**: awardedTo→Student, derivedFromApplication→FinancialAidApplication, offsetByOtherResource→OtherFinancialResource

## Satisfactory Academic Progress
- **genus**: `bfo:0000015`
- **definition**: A continuous process of monitoring a student's completion rate, GPA, and degree timeframe to maintain federal aid eligibility.
- **attributes**: completionRatePercent, cumulativeGPA, maxTimeframePercent, isEligible
- **relations**: monitorsStudent→Student, evaluatesCourseAttempt→CourseAttempt

## Other Financial Resource
- **genus**: `cco:ont00000995`
- **definition**: External funding sources such as scholarships, employer benefits, or veteran's assistance that must be reported and may adjust federal aid awards.
- **attributes**: resourceId, sourceType, amount, isVerified
- **relations**: receivedBy→Student, reducesAward→FinancialAward
