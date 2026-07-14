# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Job Application
- **genus**: `cco:ont00000958`
- **definition**: A formal record of an individual's request for employment at a specific organization, containing personal details, work history, and qualifications.
- **attributes**: applicationId, submissionDate, desiredPosition, desiredWage, availabilityStatus, overtimeEligibility, preferredShift, shiftFlexibility, earliestStartDate
- **relations**: submittedBy→Applicant, submittedTo→Organization, references→Reference, workHistory→EmploymentRecord, educationHistory→EducationRecord

## Job Applicant
- **genus**: `bfo:0000002`
- **definition**: A natural person submitting a job application, possessing personal identifiers, contact information, and legal eligibility status.
- **attributes**: ssn, firstName, lastName, middleName, homePhone, cellPhone, streetAddress, city, state, zipCode, ageEligible, employmentEligibility, hasDriversLicense, licenseState, licenseNumber, criminalHistory, currentlyEmployed, previousApplicant, lastApplicationDate
- **relations**: submittedApplication→JobApplication, currentEmployer→Organization, referredBy→Person

## Employing Organization
- **genus**: `bfo:0000040`
- **definition**: A legal entity or business unit that recruits, hires, and employs individuals, possessing contact details and operational address.
- **attributes**: organizationName, streetAddress, city, state, zipCode, telephone, fax, eopoStatus
- **relations**: receivesApplication→JobApplication, employs→Applicant

## Past Employment Record
- **genus**: `cco:ont00000995`
- **definition**: A historical record of a specific period of work performed by an applicant at a particular organization, detailing dates, role, and compensation.
- **attributes**: startDate, endDate, salary, positionTitle, reasonForLeaving, contactPermission, employerName, employerAddress, employerPhone
- **relations**: heldBy→Applicant, performedAt→Organization

## Education Record
- **genus**: `cco:ont00000995`
- **definition**: A record of formal academic or vocational training completed by an applicant, specifying the institution, duration, and credential obtained.
- **attributes**: institutionName, institutionAddress, institutionPhone, yearsAttended, courseOfStudy, degreeOrDiploma, educationLevel
- **relations**: completedBy→Applicant, awardedBy→Organization

## Employment Reference
- **genus**: `bfo:0000002`
- **definition**: A person designated by an applicant to provide verification of their character, work performance, or qualifications to a prospective employer.
- **attributes**: fullName, address, phone, relationshipType, isRelative
- **relations**: providedFor→Applicant
