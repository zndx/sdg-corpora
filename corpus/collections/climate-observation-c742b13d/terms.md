# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Climate Observation
- **genus**: `bfo:0000015`
- **definition**: A measurement or recorded instance of a climatic or oceanographic variable at a specific location and time.
- **attributes**: observationId, recordedAt, variableType, value, unit, status
- **relations**: recordedIn→SpatialZone, measuredBy→FishermanReport

## Spatial Zone
- **genus**: `bfo:0000002`
- **definition**: A geographically defined area, such as a coastal region or state, subject to environmental monitoring.
- **attributes**: zoneId, zoneName, region, country, zoneType
- **relations**: containsObservation→ClimateObservation, containsFisherman→Fisherman

## Fisherman
- **genus**: `bfo:0000004`
- **definition**: A registered individual engaged in fishing activities within a specific coastal zone.
- **attributes**: fishermanId, name, registrationNumber, state, yearsOfExperience, status
- **relations**: residesIn→SpatialZone, providesReport→FishermanReport

## Fisherman Report
- **genus**: `cco:ont00000995`
- **definition**: A structured record of a fisherman's observations and perceptions regarding environmental changes.
- **attributes**: reportId, submissionDate, surveyMethod, responseCount, dataQuality
- **relations**: submittedBy→Fisherman, coversZone→SpatialZone, includesObservation→ClimateObservation

## Adaptation Intervention
- **genus**: `bfo:0000015`
- **definition**: A planned action or program designed to assist fishermen in coping with the impacts of global warming.
- **attributes**: interventionId, interventionType, startDate, endDate, status, budget
- **relations**: targetsZone→SpatialZone, benefitsFisherman→Fisherman
