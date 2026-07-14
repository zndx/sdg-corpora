# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Admission Application
- **genus**: `cco:ont00000958`
- **definition**: A formal request record submitted by a guardian for a child to be admitted to the school for a specific academic year.
- **attributes**: applicationId, applicationDate, status, academicYear, referenceNumber
- **relations**: requestsAdmissionFor→Child, submittedBy→Guardian, targetsSchool→School

## Child
- **genus**: `bfo:0000004`
- **definition**: A minor human being for whom an admission application is being processed.
- **attributes**: childId, fullName, dateOfBirth, gender, yearGroup, birthCertificateReference
- **relations**: hasSibling→Child, wasEnrolledAt→School, livesWith→Guardian

## Guardian
- **genus**: `bfo:0000004`
- **definition**: An individual holding legal parental responsibility for a child.
- **attributes**: guardianId, fullName, relationship, homePhone, mobilePhone, workPhone, email
- **relations**: submitsApplicationFor→AdmissionApplication, residesAt→Address, hasParentalResponsibilityFor→Child

## Address
- **genus**: `bfo:0000004`
- **definition**: A physical location or postal designation where a guardian or child resides.
- **attributes**: addressId, street, city, county, postCode, addressType
- **relations**: isResidenceOf→Guardian, isResidenceOf→Child

## School
- **genus**: `bfo:0000004`
- **definition**: An educational institution providing primary education.
- **attributes**: schoolId, schoolName, streetAddress, postCode, telephone, website
- **relations**: enrollsChild→Child, isLocatedAt→Address
