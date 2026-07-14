# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Credit Union
- **genus**: `cco:ont00000995`
- **definition**: A member-owned financial cooperative providing financial services to a defined group of individuals.
- **attributes**: identifier, legalName, foundingDate, headquartersCity, headquartersState, memberEligibilityCriteria, regulatoryStatus
- **relations**: hasChiefExecutiveOfficer→ExecutiveRole, serves→MemberGroup, awarded→Award

## Executive Role
- **genus**: `bfo:0000023`
- **definition**: A leadership position within a credit union responsible for strategic direction and operations.
- **attributes**: roleTitle, appointmentDate, terminationDate, reportingTo, compensationBand, isCurrent
- **relations**: heldBy→Person, atOrganization→CreditUnion, previouslyHeld→ExecutiveRole

## Person
- **genus**: `bfo:0000004`
- **definition**: A human individual with professional and personal attributes.
- **attributes**: firstName, lastName, dateOfBirth, residenceCity, residenceState, maritalStatus, numberOfDependents
- **relations**: holdsRole→ExecutiveRole, educatedAt→EducationalInstitution, licensedIn→Jurisdiction, awarded→Award

## Educational Institution
- **genus**: `cco:ont00000995`
- **definition**: An organization providing formal education and academic degrees.
- **attributes**: institutionName, locationCity, locationState, accreditationStatus, foundingYear
- **relations**: awardedDegreeTo→Person, offersProgram→DegreeProgram

## Degree Program
- **genus**: `cco:ont00000995`
- **definition**: A structured course of study leading to an academic qualification.
- **attributes**: programName, degreeType, durationYears, fieldOfStudy
- **relations**: conferredBy→EducationalInstitution, completedBy→Person

## Award
- **genus**: `cco:ont00000995`
- **definition**: A recognition or honor given for achievement or contribution.
- **attributes**: awardName, awardYear, presentedBy, citationText, isLifetimeAchievement
- **relations**: givenTo→Person, presentedByOrganization→Organization

## Organization
- **genus**: `cco:ont00000995`
- **definition**: A structured group of people with a particular purpose, such as a foundation or association.
- **attributes**: organizationName, organizationType, foundingYear, headquartersLocation
- **relations**: presentsAward→Award, createdFundFor→ScholarshipFund

## Scholarship Fund
- **genus**: `cco:ont00000995`
- **definition**: A financial resource established to provide scholarships for training and career development.
- **attributes**: fundName, establishedYear, targetBeneficiaries, fundingSource
- **relations**: createdBy→Organization, honors→Person, awardedTo→Person
