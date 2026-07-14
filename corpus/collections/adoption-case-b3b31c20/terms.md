# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Adoption Case
- **genus**: `cco:ont00000995`
- **definition**: A legal record documenting the formal adoption of an adult by a petitioner, capturing the procedural and relational data of the adoption proceeding.
- **attributes**: caseId, filingDate, status, jurisdiction, caseNotes, petitionerContactPerson, nlfRep
- **relations**: hasPetitioner→AdoptionPetitioner, hasAdultAdoptee→AdultAdoptee

## Adoption Petitioner
- **genus**: `bfo:0000023`
- **definition**: An individual who files a legal petition to adopt an adult, holding the role of petitioner in the adoption proceeding.
- **attributes**: fullName, dateOfBirth, socialSecurityNumber, streetAddress, city, state, zipCode, phoneNumber, emailAddress, dateMovedToNevada, relationshipToAdoptee, durationOfAcquaintance
- **relations**: filesPetitionFor→AdultAdoptee, residesIn→Jurisdiction

## Adult Adoptee
- **genus**: `bfo:0000023`
- **definition**: An adult individual who is the subject of an adoption petition, possessing pre-adoption and post-adoption identity attributes.
- **attributes**: fullName, dateOfBirth, socialSecurityNumber, streetAddress, city, state, zipCode, phoneNumber, emailAddress, dateMovedToNevada, birthCityState, preferredPostAdoptionName, birthMotherName, birthFatherName
- **relations**: isPetitionedBy→AdoptionPetitioner, residesIn→Jurisdiction

## Contact Information
- **genus**: `cco:ont00000995`
- **definition**: A structured record of communication details for a party involved in the adoption process, including primary and alternate contact methods.
- **attributes**: contactPerson, streetAddress, cellPhone, city, state, zipCode, alternatePhone, email
- **relations**: belongsToMany→AdoptionCase

## Jurisdiction
- **genus**: `bfo:0000015`
- **definition**: A geographic and legal territory, specifically the state of Nevada, where the adoption proceedings are filed and governed.
- **attributes**: stateCode, stateName, courtSystem
