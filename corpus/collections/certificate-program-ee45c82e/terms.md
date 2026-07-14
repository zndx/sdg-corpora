# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Graduate Certificate Program
- **genus**: `bfo:0000040`
- **definition**: A structured educational program leading to a graduate certificate in Nursing Administration and Health Systems Leadership.
- **attributes**: programId, programName, deliveryMode, effectiveDate, minimumGPA, wordLimit
- **relations**: requires→AdmissionRequirement, awards→Credential

## Admission Requirement
- **genus**: `bfo:0000040`
- **definition**: A specific condition or document required for admission to the certificate program.
- **attributes**: requirementId, requirementType, description, isMandatory, validFrom
- **relations**: appliesTo→CertificateProgram, hasAlternative→AdmissionRequirement

## Academic Credential
- **genus**: `bfo:0000040`
- **definition**: A formal qualification awarded upon completion of a program, such as a degree or license.
- **attributes**: credentialId, credentialType, issuingInstitution, issueDate, status
- **relations**: requiredFor→AdmissionRequirement, awardedBy→Institution

## English Language Proficiency Test
- **genus**: `bfo:0000040`
- **definition**: A standardized test used to assess English language proficiency for international applicants.
- **attributes**: testId, testName, minScore, testFormat
- **relations**: satisfies→AdmissionRequirement, hasScore→TestScore

## Test Score Record
- **genus**: `bfo:0000040`
- **definition**: A recorded result from an English language proficiency test.
- **attributes**: scoreId, scoreValue, testDate, validUntil
- **relations**: belongs_to→EnglishProficiencyTest, submittedBy→Applicant

## Program Applicant
- **genus**: `bfo:0000040`
- **definition**: An individual applying for admission to the graduate certificate program.
- **attributes**: applicantId, fullName, nationality, applicationStatus, submissionDate
- **relations**: submits→AdmissionRequirement, holds→Credential
