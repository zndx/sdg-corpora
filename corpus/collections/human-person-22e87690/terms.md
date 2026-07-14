# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Human Person
- **genus**: `bfo:0000004`
- **definition**: A living human individual who exists as a biological organism and social agent.
- **attributes**: hasGivenName, hasFamilyName, hasOccupationRole, hasResidenceLocation, hasAncestralOriginLocation
- **relations**: hasBiologicalParent→HumanPerson, hasSpouse→HumanPerson, hasResidenceIn→Settlement, participatedIn→CensusRegistration

## Settlement
- **genus**: `bfo:0000040`
- **definition**: A human habitation, town, or city where people reside and conduct civic activities.
- **attributes**: hasSettlementName, hasGeographicRegion, hasPopulationDensity
- **relations**: contains→Building, hostedEvent→CensusRegistration

## Building
- **genus**: `bfo:0000040`
- **definition**: A constructed physical structure providing shelter, such as a stable or dwelling.
- **attributes**: hasBuildingType, hasMaterialComposition, hasOccupancyStatus, hasAnimalOccupants
- **relations**: locatedIn→Settlement, hostedBirth→BirthEvent

## Birth Event
- **genus**: `bfo:0000015`
- **definition**: The biological process of a human infant coming into existence.
- **attributes**: hasEventDate, hasBirthLocation
- **relations**: occurredAt→Building, hasMother→HumanPerson, hasFather→HumanPerson, hasChild→HumanPerson

## Census Registration
- **genus**: `bfo:0000015`
- **definition**: The administrative process of recording a person's identity and location for taxation or population tracking.
- **attributes**: hasRegistrationDate, hasRegistrationLocation, hasMandatingAuthority, hasPurpose
- **relations**: mandatedBy→GovernmentDecree, recordedPerson→HumanPerson, tookPlaceIn→Settlement

## Government Decree
- **genus**: `bfo:0000015`
- **definition**: An official law or command issued by a ruling authority to enforce civic compliance.
- **attributes**: hasDecreeTitle, hasIssuingEmperor, hasEnforcementDate, hasLegalRequirement
- **relations**: issuedBy→HumanPerson, caused→CensusRegistration

## Infant Care Item
- **genus**: `cco:ont00000995`
- **definition**: A physical object or material used to provide comfort, warmth, or bedding for a newborn.
- **attributes**: hasItemName, hasMaterialType, hasPhysicalCondition
- **relations**: usedFor→BirthEvent, locatedIn→Building
