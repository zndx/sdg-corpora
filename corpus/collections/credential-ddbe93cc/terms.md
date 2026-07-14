# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Credential
- **genus**: `cco:ont00000995`
- **definition**: A formal recognition issued by an educational institution to a student who has successfully completed all requirements of an approved program of study.
- **attributes**: credentialId, credentialType, programName, issuingInstitution, issueDate, status, honoursNotation
- **relations**: awardedTo→Student, conferredBy→ProgramOfStudy

## Student
- **genus**: `bfo:0000040`
- **definition**: An individual enrolled in an educational program who is pursuing a credential.
- **attributes**: studentId, fullName, enrollmentStatus, startDate, residencyPercentage, financialObligationsMet, ggpa
- **relations**: enrolledIn→ProgramOfStudy, completedCredential→Credential

## Program of Study
- **genus**: `cco:ont00000995`
- **definition**: An approved curriculum or course of study leading to a specific credential, with defined requirements and standard length.
- **attributes**: programCode, programName, approvalAuthority, standardLength, completionDeadlineMultiplier, isApprenticeProgram, currentVersion
- **relations**: awards→Credential, requiresResidencyFrom→Institution

## Parchment
- **genus**: `cco:ont00000995`
- **definition**: The physical or digital document certifying the award of a credential to a graduate.
- **attributes**: parchmentId, issueDate, graduateName, programNameAtGraduation, honoursNotation, isReissued, revocationReason
- **relations**: issuedTo→Student, certifies→Credential, issuedBy→RegistrarOffice

## Graduation Eligibility Check
- **genus**: `bfo:0000015`
- **definition**: A verification process performed by the Registrar's office to determine if a student meets all requirements for graduation.
- **attributes**: checkId, checkDate, eligibilityStatus, ggpaMet, residencyMet, financialObligationsMet, completionDeadlineMet
- **relations**: evaluates→Student, verifiesFor→ProgramOfStudy, triggers→Parchment

## Exception Record
- **genus**: `cco:ont00000995`
- **definition**: A documented and formally approved deviation from the standard graduation procedure.
- **attributes**: exceptionId, exceptionDate, natureOfException, alignmentConfirmation, riskDescription, approvalStatus
- **relations**: appliesTo→Student, relatedTo→ProgramOfStudy, approvedBy→PolicyLead
