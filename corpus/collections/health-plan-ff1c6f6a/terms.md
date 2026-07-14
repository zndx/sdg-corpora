# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Health Plan
- **genus**: `cco:ont00000995`
- **definition**: An organized arrangement of health benefits and coverage terms established by an employer or insurer for eligible individuals.
- **attributes**: planIdentifier, planName, insuranceType, grandfatheredStatus, effectiveDate, terminationDate, isCafeteriaPlan, employerSize
- **relations**: hasComplianceObligation→ComplianceObligation, coversIndividual→EligibleIndividual, filesForSubsidy→ReinsuranceSubsidy, subjectToTaxCredit→EmployerTaxCredit

## Compliance Obligation
- **genus**: `bfo:0000015`
- **definition**: A regulatory requirement or action mandated by health care reform law that an employer or plan administrator must fulfill within a specified timeframe.
- **attributes**: obligationIdentifier, description, complianceDeadline, status, applicableYear, requiresAmendment, guidanceStatus
- **relations**: appliesToPlan→HealthPlan, requiresDocument→PlanDocument, triggersReporting→ReportingRequirement

## Eligible Individual
- **genus**: `bfo:0000001`
- **definition**: A person who qualifies for coverage under a specific health plan, including employees, dependents, and early retirees.
- **attributes**: individualIdentifier, firstName, lastName, dateOfBirth, relationshipToEmployee, isAdultDependent, coverageStatus
- **relations**: coveredByPlan→HealthPlan, designatesProvider→HealthcareProvider, filesClaim→InsuranceClaim

## Plan Document
- **genus**: `cco:ont00000958`
- **definition**: A formal written record that defines the terms, conditions, and modifications of a health benefit plan, including SPDs, plan documents, and notices.
- **attributes**: documentIdentifier, documentType, versionNumber, issueDate, distributionStatus, containsGrandfatherStatus, requiresAmendment
- **relations**: definesPlan→HealthPlan, supportsObligation→ComplianceObligation, distributedToIndividual→EligibleIndividual

## Reporting Requirement
- **genus**: `bfo:0000015`
- **definition**: A mandatory disclosure or data submission obligation imposed on employers or plans by health care reform regulations, such as W-2 reporting or quality of care reports.
- **attributes**: requirementIdentifier, reportType, effectiveDate, isVoluntary, applicableEntitySize, status
- **relations**: mandatedByLaw→HealthCareReformLaw, reportedByPlan→HealthPlan, requiresConsultation→TaxProfessional

## Healthcare Provider
- **genus**: `bfo:0000004`
- **definition**: A licensed medical professional or facility that delivers health services to covered individuals, such as primary care physicians or OB-GYNs.
- **attributes**: providerIdentifier, providerName, specialty, licenseNumber, acceptsNewPatients
- **relations**: designatedByIndividual→EligibleIndividual, providesServiceTo→InsuranceClaim

## Insurance Claim
- **genus**: `cco:ont00000995`
- **definition**: A formal request submitted by an individual or provider for reimbursement of covered health care expenses under a health plan.
- **attributes**: claimIdentifier, claimDate, claimAmount, claimStatus, coversOverTheCounter, requiresPreAuthorization
- **relations**: filedByIndividual→EligibleIndividual, processedByPlan→HealthPlan, relatedToProvider→HealthcareProvider
