# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Retirement Plan Member
- **genus**: `cco:ont00000995`
- **definition**: A person who is enrolled in the Timber Operators Council Retirement Plan and Trust and is eligible for retirement benefits.
- **attributes**: memberId, fullName, ssn, dateOfBirth, gender, address, telephone, emailAddress
- **relations**: hasApplication→RetirementBenefitApplication, hasBeneficiary→Beneficiary, hasSpouse→RetirementPlanMember, isEmployedBy→ParticipatingEmployer

## Retirement Benefit Application
- **genus**: `cco:ont00000958`
- **definition**: A formal request submitted by a plan member to commence the payment of retirement benefits under a specific benefit option.
- **attributes**: applicationId, applicationDate, benefitType, benefitOption, benefitStartDate, maritalStatus, spouseConsentStatus, applicationStatus
- **relations**: submittedBy→RetirementPlanMember, referencesBenefitOption→BenefitOption, hasSpousalConsent→SpousalConsent

## Benefit Option
- **genus**: `cco:ont00000995`
- **definition**: A defined structure for the payment of retirement benefits, specifying duration, survivorship, and guarantee periods.
- **attributes**: optionId, optionName, paymentDuration, hasGuaranteePeriod, guaranteeMonths, survivorBenefitPercentage
- **relations**: isElectedBy→RetirementBenefitApplication

## Beneficiary
- **genus**: `cco:ont00000995`
- **definition**: A person designated to receive remaining or contingent benefit payments upon the death of the plan member.
- **attributes**: beneficiaryId, fullName, relationship, ssn, dateOfBirth, address, telephone, emailAddress, beneficiaryType
- **relations**: designatedBy→RetirementPlanMember, receivesFrom→BenefitOption

## Spousal Consent
- **genus**: `cco:ont00000958`
- **definition**: A legally binding declaration by a spouse consenting to the member's chosen benefit option and beneficiary designation.
- **attributes**: consentId, consentDate, spouseSsn, notaryName, notaryCommissionExpiry, witnessedByPlanRep
- **relations**: pertainsToApplication→RetirementBenefitApplication, givenBy→RetirementPlanMember

## Participating Employer
- **genus**: `cco:ont00000995`
- **definition**: An organization that participates in the Timber Operators Council Retirement Plan and Trust, employing members eligible for benefits.
- **attributes**: employerId, employerName, ein, planStartDate
- **relations**: employsMember→RetirementPlanMember
