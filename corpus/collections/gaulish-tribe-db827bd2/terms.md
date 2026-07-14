# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Gaulish Tribe
- **genus**: `bfo:0000015`
- **definition**: A distinct social and political grouping of people identified by a specific ethnonym and settlement area in ancient Gaul.
- **attributes**: ethnonym, primaryOccupation, settlementArea, isCelticOrigin, slavicEtymology
- **relations**: hasToponym→Toponym, hasInscription→EpigraphicInscription, inhabitsRegion→HistoricalRegion

## Historical Toponym
- **genus**: `bfo:0000015`
- **definition**: A named geographical location, settlement, or feature in ancient Gaul, often analyzed for Slavic linguistic roots.
- **attributes**: name, region, slavicRoot, sourceMap, confidenceLevel
- **relations**: locatedIn→HistoricalRegion, associatedWithTribe→GaulishTribe, recordedIn→HistoricalDocument

## Epigraphic Inscription
- **genus**: `bfo:00000995`
- **definition**: A physical or textual record of writing in Greek or Latin characters found in Gaul, interpreted through Slavic linguistic analysis.
- **attributes**: inscriptionText, scriptType, discoveryLocation, decipheredMeaning, sourceReference
- **relations**: foundInRegion→HistoricalRegion, analyzedBy→LinguisticAnalysis, associatedWithTribe→GaulishTribe

## Linguistic Analysis
- **genus**: `bfo:0000015`
- **definition**: A scholarly interpretation or decipherment of ancient names or texts based on Slavic linguistic correspondences.
- **attributes**: methodology, slavicLanguageBasis, interpretationResult, author, publicationYear
- **relations**: analyzesInscription→EpigraphicInscription, analyzesToponym→Toponym, citesSource→HistoricalDocument

## Historical Region
- **genus**: `bfo:0000015`
- **definition**: A defined geographical area in ancient Europe, such as Armorica or Gaul, characterized by specific settlement patterns and cultural influences.
- **attributes**: regionName, geographicalBounds, dominantCulture, slavicInfluenceLevel, historicalPeriod
- **relations**: containsToponyms→Toponym, containsTribe→GaulishTribe, containsInscription→EpigraphicInscription

## Historical Document
- **genus**: `bfo:00000958`
- **definition**: A recorded source, such as a map, itinerary, or scholarly book, used to identify and analyze ancient toponyms and inscriptions.
- **attributes**: documentTitle, author, publicationYear, documentType, contentSummary
- **relations**: citedByAnalysis→LinguisticAnalysis, recordsToponym→Toponym, recordsInscription→EpigraphicInscription
