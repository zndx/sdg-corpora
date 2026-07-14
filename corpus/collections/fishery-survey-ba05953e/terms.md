# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Fishery Survey
- **genus**: `cco:ont00000958`
- **definition**: A structured quantitative study instrument and dataset used to collect fishermen's perceptions of global warming impacts on the sea.
- **attributes**: surveyIdentifier, samplingMethod, totalRespondents, startDate, endDate, status
- **relations**: coversRegion→CoastalZone, targetsPopulation→FishermenPopulation, measuresVariable→EnvironmentalVariable

## Coastal Zone
- **genus**: `bfo:0000004`
- **definition**: A specific geographic region along the east coast of Peninsular Malaysia subject to sea-level rise and storm vulnerability.
- **attributes**: zoneIdentifier, zoneName, stateJurisdiction, latitude, longitude, floodVulnerabilityIndex
- **relations**: containsSamplingUnit→FishermenPopulation, exhibitsVariable→EnvironmentalVariable

## Fishermen Population
- **genus**: `bfo:0000004`
- **definition**: The aggregate of registered fishermen residing in or operating within a specific coastal zone, serving as the target population for impact assessment.
- **attributes**: populationIdentifier, registeredCount, primaryGearType, averageVesselSize, adaptationReadiness
- **relations**: locatedInZone→CoastalZone, respondsToSurvey→FisherySurvey, experiencesVariable→EnvironmentalVariable

## Environmental Variable
- **genus**: `bfo:0000015`
- **definition**: A measurable oceanographic or atmospheric parameter affected by global warming, such as temperature, current, or wave action.
- **attributes**: variableIdentifier, variableName, measurementUnit, trendDirection, impactSeverity, observationPeriod
- **relations**: recordedInZone→CoastalZone, assessedBySurvey→FisherySurvey, affectsPopulation→FishermenPopulation

## Adaptation Intervention
- **genus**: `bfo:0000015`
- **definition**: A planned action or training program designed to assist fishermen in adapting to the impacts of global warming.
- **attributes**: interventionIdentifier, interventionType, targetAudience, implementationDate, status, budgetAllocated
- **relations**: targetsPopulation→FishermenPopulation, mitigatesVariable→EnvironmentalVariable, implementedInZone→CoastalZone
