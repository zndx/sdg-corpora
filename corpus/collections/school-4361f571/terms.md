# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## School
- **genus**: `bfo:0000040`
- **definition**: An educational institution providing primary education to children within a defined jurisdiction.
- **attributes**: legalName, streetAddress, postalCode, telephone, email, website
- **relations**: admits→Enrolment

## Enrolment
- **genus**: `bfo:0000002`
- **definition**: A continuant entity representing the state of a child being registered and attending a specific school.
- **attributes**: applicationDate, yearGroup, status
- **relations**: regardingChild→Child, atSchool→School, hasParent→Parent

## Child
- **genus**: `bfo:0000004`
- **definition**: A minor human being applying for or attending an educational institution.
- **attributes**: fullLegalName, dateOfBirth, gender, permanentAddress, permanentPostalCode
- **relations**: hasEnrolment→Enrolment, hasParent→Parent, hasSibling→Child

## Parent
- **genus**: `bfo:0000004`
- **definition**: An adult human holding legal parental responsibility for a child.
- **attributes**: fullLegalName, relationshipToChild, homeTelephone, mobileTelephone, workTelephone, emailAddress, residentialAddress, residentialPostalCode
- **relations**: hasChild→Child, hasEnrolment→Enrolment
