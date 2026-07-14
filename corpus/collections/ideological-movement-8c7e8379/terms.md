# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Ideological Movement
- **genus**: `bfo:0000015`
- **definition**: A structured socio-political organization with a defined doctrine, strategic phases, and territorial or political objectives.
- **attributes**: movementIdentifier, foundingYear, founderName, strategicPhase, ultimateGoal, operationalTerritory, isPolitical
- **relations**: employsStrategy→StrategicOperation, operatesInRegion→GeopoliticalRegion

## Strategic Operation
- **genus**: `bfo:0000015`
- **definition**: A specific tactical activity or phase of implementation used by an ideological movement to achieve its long-term goals, such as integration or power consolidation.
- **attributes**: operationCode, operationName, description, targetRegion, implementationMethod, isCoercive
- **relations**: isPartOfMovement→IdeologicalMovement, targetsRegion→GeopoliticalRegion

## Geopolitical Region
- **genus**: `bfo:0000015`
- **definition**: A defined geographic or political area where an ideological movement operates or seeks to establish influence, such as a country or continent.
- **attributes**: regionIdentifier, regionName, regionType, currentInfluenceLevel, historicalStatus
- **relations**: hostsOperation→StrategicOperation, containsOrganization→ReligiousOrganization

## Religious Organization
- **genus**: `cco:ont00000995`
- **definition**: A formal institutional body representing a religious community, often linked to a broader ideological movement, with specific membership and leadership structures.
- **attributes**: orgIdentifier, orgName, affiliation, foundingDate, headquartersLocation, isPolitical, membershipCount
- **relations**: isAffiliatedWith→IdeologicalMovement, operatesInRegion→GeopoliticalRegion, emplocesPerson→Individual

## Individual
- **genus**: `bfo:0000040`
- **definition**: A human person who is a member, leader, or former member of a religious or ideological organization, with a specific biographical history and stance.
- **attributes**: personIdentifier, fullName, birthCountry, currentResidence, formerAffiliation, currentStance, publicationsCount
- **relations**: wasMemberOf→ReligiousOrganization, residesInRegion→GeopoliticalRegion, authoredDocument→Publication

## Publication
- **genus**: `cco:ont00000958`
- **definition**: A written work, such as a book or interview, that documents the experiences, critiques, or doctrines of an individual or organization.
- **attributes**: pubIdentifier, title, publicationDate, publisher, language, subjectMatter, isCriticalOfMovement
- **relations**: authoredBy→Individual, discussesMovement→IdeologicalMovement
