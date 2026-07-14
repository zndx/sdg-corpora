# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Pastoral Territory
- **genus**: `bfo:0000040`
- **definition**: A spatially bounded socio-ecological domain defined by pastoralist communities through historical land-use, resource access, and cultural practices.
- **attributes**: territoryIdentifier, territoryName, primaryEthnicGroup, areaHectares, establishmentDate, currentStatus
- **relations**: contains→WaterSource, inhabitedBy→PastoralCommunity, locatedIn→GeographicRegion

## Water Source
- **genus**: `bfo:0000040`
- **definition**: A natural or engineered hydrological feature providing water access, ranging from traditional wells to modern boreholes and underground aquifers.
- **attributes**: sourceIdentifier, sourceName, sourceType, depthMeters, flowRateLitersPerSecond, waterQualityIndex, discoveryDate, isModernInvention
- **relations**: locatedIn→PastoralTerritory, serves→PastoralCommunity, partOf→HydrologicalBasin

## Pastoral Community
- **genus**: `bfo:0000004`
- **definition**: A social group organized around livestock herding, characterized by shared cultural practices, territorial claims, and adaptive strategies to arid environments.
- **attributes**: communityIdentifier, communityName, populationSize, primaryLivelihood, herdSize, decimationEvent, adaptationStrategy
- **relations**: inhabits→PastoralTerritory, uses→WaterSource, locatedIn→GeographicRegion

## Hydrological Event
- **genus**: `bfo:0000015`
- **definition**: A discrete hydrological occurrence affecting water availability, such as drought, flooding, or aquifer discovery, impacting pastoral livelihoods.
- **attributes**: eventIdentifier, eventType, startDate, endDate, severityIndex, affectedAreaHectares, causedHerdDecimation
- **relations**: impacts→PastoralCommunity, affects→WaterSource, occursIn→GeographicRegion

## Geographic Region
- **genus**: `bfo:0000040`
- **definition**: A defined geographical area characterized by specific ecological, climatic, and administrative features relevant to pastoral land-use.
- **attributes**: regionIdentifier, regionName, regionType, areaHectares, averageAnnualRainfall, climateClassification, elevationMeters
- **relations**: contains→PastoralTerritory, contains→WaterSource, contains→PastoralCommunity
