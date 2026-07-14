# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student
- **genus**: `bfo:0000004`
- **definition**: A person enrolled in the dance and education program.
- **attributes**: givenName, chineseName, birthDate, schoolName
- **relations**: hasParent→Parent, hasEnrollment→Enrollment

## Parent
- **genus**: `bfo:0000004`
- **definition**: A guardian or legal parent of a student who provides consent and contact information.
- **attributes**: givenName, chineseName, homePhone, cellPhone, email, homeAddress, city, zipCode
- **relations**: hasChild→Student, hasEmergencyContact→EmergencyContact

## Emergency Contact
- **genus**: `bfo:0000004`
- **definition**: A person designated to be contacted in case of an emergency involving the student.
- **attributes**: contactName, contactPhone
- **relations**: isContactFor→Parent

## Enrollment
- **genus**: `bfo:0000004`
- **definition**: A record of a student's registration and financial agreement for the dance program.
- **attributes**: registrationFee, monthlyTuition, lateFeeAmount, paymentDueDay, lateFeeDeadlineDay, programMonths, consentGiven, waiverSigned, enrollmentDate
- **relations**: enrollsStudent→Student, hasParent→Parent, hasAcquisitionSource→AcquisitionSource

## Acquisition Source
- **genus**: `bfo:0000004`
- **definition**: The channel or method through which a parent or student learned about the program.
- **attributes**: sourceType, otherDetails
- **relations**: isSourceFor→Enrollment
