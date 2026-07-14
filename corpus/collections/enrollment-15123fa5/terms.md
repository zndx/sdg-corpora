# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Enrollment
- **genus**: `cco:ont00000995`
- **definition**: A contractual record of a student's participation in the April Rain Chinese Dance & Education program, capturing fee obligations and parental consent.
- **attributes**: enrollmentId, registrationFee, monthlyTuition, lateFee, enrollmentDate, programPeriodStart, programPeriodEnd, isRefundable
- **relations**: covers→Student, authorizedBy→Parent, documentsConsentFor→MediaRelease

## Student
- **genus**: `bfo:0000040`
- **definition**: A person enrolled in the dance education program, identified by personal and academic details.
- **attributes**: studentId, firstName, chineseName, birthDate, schoolName, enrollmentStatus
- **relations**: hasEnrollment→Enrollment, hasParent→Parent

## Parent
- **genus**: `bfo:0000040`
- **definition**: A guardian or legal parent of a student who provides consent and contact information for the program.
- **attributes**: parentId, firstName, chineseName, homePhone, cellPhone, email, homeAddress, city, zipCode
- **relations**: authorizes→Enrollment, hasChild→Student

## MediaRelease
- **genus**: `cco:ont00000958`
- **definition**: A legal authorization document granting the organization permission to record and use media of participants for promotional purposes.
- **attributes**: releaseId, allowsVideoRecording, allowsAudioRecording, allowsPhotography, allowsPromotionalUse, waivesRightToSue, holdHarmlessAgreement, signedDate
- **relations**: linkedTo→Enrollment, signedBy→Parent

## ReferralSource
- **genus**: `bfo:0000040`
- **definition**: The channel or method through which a prospective student or parent learned about the dance program.
- **attributes**: sourceId, sourceName, otherDetails
- **relations**: attributedTo→Enrollment
