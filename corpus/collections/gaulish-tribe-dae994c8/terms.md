# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Gaulish Tribe
- **genus**: `bfo:0000023`
- **definition**: A named social-political grouping of people in ancient Gaul, often identified by ethnonyms and settlement areas.
- **attributes**: tribeName, primaryOccupation, settlementRegion, ethnicity, isCeltic
- **relations**: inhabited→SettlementArea, usedLanguage→GaulishLanguage, leftInscription→AncientInscription

## Settlement Area
- **genus**: `bfo:0000015`
- **definition**: A geographic region or territory historically occupied by a specific Gaulish tribe or community.
- **attributes**: regionName, geographicCoordinates, historicalPeriod, isCoastal
- **relations**: occupiedBy→GaulishTribe, containsToponym→Toponym

## Toponym
- **genus**: `cco:ont00000995`
- **definition**: A named place or geographic feature in ancient Gaul, often analyzed for etymological roots.
- **attributes**: placeName, etymologicalRoot, linguisticFamily, locationReference, confidenceScore
- **relations**: locatedIn→SettlementArea, derivedFrom→LinguisticRoot

## Ancient Inscription
- **genus**: `cco:ont00000995`
- **definition**: A physical or textual record of writing found in ancient Gaul, used for linguistic and historical analysis.
- **attributes**: inscriptionID, scriptType, discoveryLocation, dateDiscovered, decipheredText, linguisticInterpretation
- **relations**: foundIn→SettlementArea, attributedTo→GaulishTribe, usesScript→WritingSystem

## Writing System
- **genus**: `bfo:0000015`
- **definition**: A system of visual representation of language used in ancient Gaul, such as Greek or Latin scripts.
- **attributes**: systemName, originRegion, usagePeriod, isAlphabetic
- **relations**: usedBy→GaulishTribe, records→AncientInscription

## Linguistic Root
- **genus**: `cco:ont00000995`
- **definition**: A foundational word or morpheme from a specific language family, used to explain the etymology of Gaulish names.
- **attributes**: rootWord, meaning, sourceLanguage, semanticField
- **relations**: explains→Toponym, explains→GaulishTribe
