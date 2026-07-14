# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Adult Adoption Case
- **genus**: `cco:ont00000958`
- **definition**: A legal record documenting the petition and processing of an adult adoption proceeding within a specific jurisdiction.
- **attributes**: caseIdentifier, filingDate, jurisdictionCode, caseStatus, courtDocketNumber
- **relations**: involvesPetitioner→AdoptionPetitioner, involvesAdultToBeAdopted→AdultToBeAdopted, managedByNLFRep→NLFRepresentative

## Adult Adoption Petitioner
- **genus**: `bfo:0000040`
- **definition**: The individual who initiates the legal petition to adopt an adult, possessing specific residency and relationship qualifications.
- **attributes**: fullLegalName, dateOfBirth, socialSecurityNumber, residencyStartDate, relationshipToAdult, durationOfAcquaintance
- **relations**: residesAt→ResidentialAddress, contactedBy→ContactMethod, filesPetitionFor→AdoptionCase

## Adult Subject of Adoption
- **genus**: `bfo:0000040`
- **definition**: The adult individual who is the subject of the adoption petition and whose legal status is being altered.
- **attributes**: fullLegalName, dateOfBirth, socialSecurityNumber, residencyStartDate, birthCity, birthState, preferredPostAdoptionName
- **relations**: residesAt→ResidentialAddress, contactedBy→ContactMethod, subjectOfAdoptionCase→AdoptionCase, hasBirthMother→Person, hasBirthFather→Person

## Residential Address
- **genus**: `bfo:0000004`
- **definition**: A physical location entity comprising street, city, state, and postal code components used for jurisdictional and contact purposes.
- **attributes**: streetAddress, city, stateCode, zipCode
- **relations**: occupiedBy→AdoptionPetitioner, occupiedBy→AdultToBeAdopted

## Contact Method
- **genus**: `bfo:0000004`
- **definition**: A specific communication channel or device identifier (phone or email) associated with a party in the adoption proceeding.
- **attributes**: contactValue, contactType, isPrimary
- **relations**: belongsToMany→AdoptionPetitioner, belongsToMany→AdultToBeAdopted

## NLF Representative
- **genus**: `bfo:0000040`
- **definition**: An internal staff member or agent assigned to manage and track the progress of an adoption case.
- **attributes**: repIdentifier, repName
- **relations**: manages→AdoptionCase

## Person
- **genus**: `bfo:0000040`
- **definition**: A human being, used here to represent birth parents or other named individuals referenced in the adoption records.
- **attributes**: fullName
- **relations**: isBirthMotherOf→AdultToBeAdopted, isBirthFatherOf→AdultToBeAdopted
