# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Birth Event
- **genus**: `bfo:0000015`
- **definition**: A temporal process marking the emergence of a human individual from a parent, occurring at a specific location and time.
- **attributes**: identifier, birthDate, locationName, parentFemaleName, parentMaleName, infantName
- **relations**: occurredAt→Location, involvesInfant→Human, involvesMother→Human, involvesFather→Human

## Human
- **genus**: `bfo:0000004`
- **definition**: A biological organism of the species Homo sapiens, serving as a parent, infant, or resident within the domain.
- **attributes**: givenName, familyName, role, ancestralTown, occupation
- **relations**: residesIn→Location, participatedIn→CensusRegistration

## Location
- **genus**: `bfo:0000002`
- **definition**: A spatial region or geographical point, such as a town, stable, or manger, where events occur or entities reside.
- **attributes**: name, type, description
- **relations**: hostedEvent→BirthEvent, containsResident→Human

## Census Registration
- **genus**: `bfo:0000015`
- **definition**: A bureaucratic process of recording an individual's name and ancestral origin for tax or administrative purposes.
- **attributes**: registrationDate, mandatedBy, purpose, registrantName
- **relations**: mandatedBy→LegislativeDecree, recordsIndividual→Human, occurredAt→Location

## Legislative Decree
- **genus**: `bfo:0000015`
- **definition**: A formal command or law issued by an authority, such as an emperor, requiring specific actions from the population.
- **attributes**: issuerName, issuanceDate, mandateDescription, objective
- **relations**: triggered→CensusRegistration

## Infant Care Item
- **genus**: `cco:ont00000995`
- **definition**: A physical object used to provide comfort, warmth, or a resting place for a newborn human.
- **attributes**: itemType, material, condition
- **relations**: usedFor→BirthEvent, locatedIn→Location
