# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Compliance Year
- **genus**: `bfo:0000040`
- **definition**: A temporal period (calendar year) during which an attorney must earn a specified number of MCLE credits to maintain compliance.
- **attributes**: yearStart, yearEnd, creditRequirement
- **relations**: hasComplianceReport→ComplianceReport, hasDeficiencyPlan→DeficiencyPlan

## Attorney
- **genus**: `bfo:0000004`
- **definition**: A licensed legal practitioner subject to the MCLE Commission's jurisdiction and credit requirements.
- **attributes**: barLicenseNumber, fullName, barStatus
- **relations**: submittedComplianceReport→ComplianceReport, submittedDeficiencyPlan→DeficiencyPlan, incurredLateFee→LateFee

## Compliance Report
- **genus**: `cco:ont00000995`
- **definition**: A formal record submitted by an attorney certifying their earned MCLE credits for a specific compliance year.
- **attributes**: reportId, submissionDate, creditsEarned, professionalismCourseCompleted, reportStatus
- **relations**: coversComplianceYear→ComplianceYear, submittedBy→Attorney, triggeredLateFee→LateFee

## Deficiency Plan
- **genus**: `cco:ont00000995`
- **definition**: A formal plan submitted by a noncompliant attorney detailing how they will cure their credit deficiency by a specific deadline.
- **attributes**: planId, submissionDate, completionDeadline, planStatus, goodCauseJustification
- **relations**: addressesComplianceYear→ComplianceYear, submittedBy→Attorney, triggeredLateFee→LateFee

## Late Fee
- **genus**: `bfo:0000015`
- **definition**: A monetary penalty imposed on an attorney for failing to meet MCLE compliance, filing, or reporting deadlines.
- **attributes**: feeId, feeAmount, feeType, impositionDate, paymentStatus
- **relations**: chargedTo→Attorney, associatedWithReport→ComplianceReport, associatedWithPlan→DeficiencyPlan

## Disciplinary Referral
- **genus**: `cco:ont00000995`
- **definition**: A formal list or record of attorneys who have failed to comply with MCLE rules, forwarded to the Office of General Counsel for further discipline.
- **attributes**: referralId, referralDate, referralReason, forwardedTo
- **relations**: includesAttorney→Attorney, generatedBy→MCLECommission

## MCLE Commission
- **genus**: `bfo:0000040`
- **definition**: The administrative body responsible for overseeing MCLE compliance, approving deficiency plans, and imposing sanctions.
- **attributes**: commissionId, commissionName, executiveDirectorName
- **relations**: generatesReferral→DisciplinaryReferral, approvesDeficiencyPlan→DeficiencyPlan
