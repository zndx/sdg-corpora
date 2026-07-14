# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Board Member
- **genus**: `bfo:0000023`
- **definition**: A role played by an individual who serves on the governance board of an organization.
- **attributes**: memberId, roleType, appointmentDate, terminationDate, isCurrentMember
- **relations**: servesOn→GovernanceBoard, heldBy→Person, holdsPosition→LeadershipPosition

## Governance Board
- **genus**: `bfo:0000023`
- **definition**: A collective body of individuals responsible for the oversight and strategic direction of an organization.
- **attributes**: boardId, boardName, organizationId, establishedDate, status
- **relations**: oversees→Organization, hasMember→BoardMember

## Person
- **genus**: `bfo:0000004`
- **definition**: A human being who holds professional roles, qualifications, and employment history.
- **attributes**: personId, firstName, lastName, professionalTitle, yearsOfExperience
- **relations**: employedBy→Organization, holdsQualification→AcademicQualification, servesOn→GovernanceBoard, directs→BusinessVenture

## Organization
- **genus**: `bfo:0000040`
- **definition**: A social or legal entity such as a company, council, or institution that employs individuals and holds assets.
- **attributes**: orgId, orgName, orgType, headquartersLocation, listingStatus
- **relations**: employs→Person, owns→BusinessVenture, isOverseenBy→GovernanceBoard

## Academic Qualification
- **genus**: `cco:ont00000995`
- **definition**: A formal credential or degree awarded by an educational institution to an individual.
- **attributes**: qualId, degreeType, fieldOfStudy, awardingInstitution, graduationYear, distinction
- **relations**: heldBy→Person, awardedBy→Organization

## Business Venture
- **genus**: `bfo:0000040`
- **definition**: A specific commercial enterprise, project, or asset with operational activities and financial outcomes.
- **attributes**: ventureId, ventureName, industrySector, operationalStatus, geographicScope
- **relations**: ownedBy→Organization, directedBy→Person, locatedIn→Location

## Leadership Position
- **genus**: `bfo:0000023`
- **definition**: A specific role of authority or management held within an organization or professional sector.
- **attributes**: positionId, positionTitle, sector, startDate, endDate, isCurrent
- **relations**: heldBy→Person, associatedWith→Organization
