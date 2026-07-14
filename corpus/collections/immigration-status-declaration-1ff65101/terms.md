# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Immigration Status Declaration
- **genus**: `cco:ont00000958`
- **definition**: A formal record certifying the lawful presence or citizenship status of a housing applicant or household member.
- **attributes**: declarationId, declarationDate, revisionDate, formVersion, certificationStatus, perjuryAcknowledged
- **relations**: submittedBy→HouseholdMember, coversMinor→MinorDependent

## Household Member
- **genus**: `bfo:0000004`
- **definition**: An adult individual who is part of a housing household, serving as either the head or a non-head member.
- **attributes**: memberId, fullName, ssn, role, age, isSenior
- **relations**: declaresStatusIn→ImmigrationStatusDeclaration, residesIn→HousingUnit

## Minor Dependent
- **genus**: `bfo:0000004`
- **definition**: A child or dependent under the age of majority residing in the household whose immigration status is declared by an adult.
- **attributes**: minorId, fullName, age, citizenshipStatus
- **relations**: declaredIn→ImmigrationStatusDeclaration, verifiedBy→LeasingOfficer

## Immigration Document
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital record issued by U.S. immigration authorities (e.g., INS/USCIS) verifying legal status.
- **attributes**: documentId, formCode, issuingAgency, annotation, issueDate, expiryDate, documentType
- **relations**: supportsDeclaration→ImmigrationStatusDeclaration, attachedTo→VerificationConsentForm

## Verification Consent Form
- **genus**: `cco:ont00000958`
- **definition**: A signed authorization allowing the housing authority to verify the applicant's immigration status with federal agencies.
- **attributes**: consentId, signedDate, isSigned, verificationMethod
- **relations**: linkedToDeclaration→ImmigrationStatusDeclaration, signedBy→HouseholdMember

## Leasing Officer
- **genus**: `bfo:0000004`
- **definition**: A housing authority employee responsible for processing applications and verifying immigration documentation.
- **attributes**: officerId, fullName, employeeId, department
- **relations**: verifiesDeclaration→ImmigrationStatusDeclaration, verifiesMinor→MinorDependent

## Housing Unit
- **genus**: `bfo:0000040`
- **definition**: A physical residential dwelling or apartment unit allocated to a household by the housing authority.
- **attributes**: unitId, address, bedrooms, monthlyRent, occupancyStatus
- **relations**: occupiedBy→HouseholdMember
