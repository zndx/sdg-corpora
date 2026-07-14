# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Regulated Person
- **genus**: `cco:ont00000995`
- **definition**: A legal entity or individual authorized by a regulatory commission to conduct financial or professional activities under a specific certificate or licence.
- **attributes**: certificateNumber, legalName, registeredAddress, status, registrationDate
- **relations**: employs→Applicant, holds→Application

## Regulatory Approval Application
- **genus**: `cco:ont00000958`
- **definition**: A formal submission to a regulatory commission seeking approval for an individual to hold a specific regulated position within a regulated entity.
- **attributes**: applicationId, submissionDate, status, applicationType, processingOffice
- **relations**: submittedBy→RegulatedPerson, concerns→Applicant, seeksPosition→RegulatedPosition

## Applicant
- **genus**: `bfo:0000040`
- **definition**: An individual person applying for regulatory approval to assume a specific role within a regulated entity.
- **attributes**: passportNumber, socialSecurityNumber, dateOfBirth, placeOfBirth, nationality, currentResidence, residenceDuration
- **relations**: hasEducation→Qualification, hasMembership→ProfessionalMembership, holdsInterestIn→RegulatedPerson

## Regulated Position
- **genus**: `bfo:0000023`
- **definition**: A specific role within a regulated entity that requires formal regulatory approval, such as Director, Compliance Officer, or Senior Officer.
- **attributes**: positionTitle, proposedStartDate, isMoneyLaunderingReportingOfficer, employmentType
- **relations**: heldBy→Applicant, within→RegulatedPerson

## Educational Qualification
- **genus**: `cco:ont00000995`
- **definition**: A degree, diploma, or other academic credential obtained by an applicant from an educational institution.
- **attributes**: institutionName, qualificationType, completionDate
- **relations**: earnedBy→Applicant

## Professional Body Membership
- **genus**: `cco:ont00000995`
- **definition**: An active or inactive membership status in a recognized professional organization or association.
- **attributes**: organizationName, membershipStatus, memberSince, membershipNumber
- **relations**: heldBy→Applicant
