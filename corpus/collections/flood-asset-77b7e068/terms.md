# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Flood Infrastructure Asset
- **genus**: `bfo:0000040`
- **definition**: A material object representing a physical component of the flood defence system, such as a levee, embankment, or pumping station.
- **attributes**: assetId, assetName, assetType, constructionYear, designCapacity, isCritical
- **relations**: hasConditionRecord→ConditionRecord, locatedIn→GeographicZone, subjectTo→FloodHazard

## Flood Asset Condition Record
- **genus**: `cco:ont00000995`
- **definition**: A record documenting the physical state, vulnerability, or integrity of a specific flood asset at a given time.
- **attributes**: recordId, assessmentDate, conditionScore, vulnerabilityLevel, defectType, isVerified
- **relations**: describesAsset→FloodAsset, derivedFrom→EarthObservationData, measuredBy→MeasurementMethod

## Earth Observation Data Product
- **genus**: `cco:ont00000958`
- **definition**: A dataset or image product derived from satellite or aerial sensors, such as ESA's Copernicus programme, used to monitor flood infrastructure.
- **attributes**: dataProductId, acquisitionDate, sensorType, spatialResolution, coverageArea, dataQualityIndex, isCopernicusSource
- **relations**: informs→ConditionRecord, coversZone→GeographicZone, generatedBy→SatelliteMission

## Flood Risk Geographic Zone
- **genus**: `bfo:0000004`
- **definition**: A defined spatial area, such as a catchment, district, or asset location, subject to flood risk assessment.
- **attributes**: zoneId, zoneName, zoneType, areaSize, populationDensity, isCoastal
- **relations**: containsAssets→FloodAsset, experiences→FloodHazard, monitoredBy→EarthObservationData

## Flood Hazard Event
- **genus**: `bfo:0000015`
- **definition**: A process or event involving the overflow or inundation of water that poses a risk to flood infrastructure and surrounding areas.
- **attributes**: hazardId, eventDate, peakWaterLevel, duration, hazardSeverity, causeType
- **relations**: affectsAssets→FloodAsset, occursIn→GeographicZone, triggers→ConditionRecord

## Earth Observation Satellite Mission
- **genus**: `bfo:0000040`
- **definition**: A specific satellite programme or mission, such as ESA's Copernicus, that generates earth observation data products.
- **attributes**: missionId, missionName, operator, launchYear, orbitType, isCopernicusMission
- **relations**: generates→EarthObservationData, monitorsZone→GeographicZone

## Condition Assessment Method
- **genus**: `bfo:0000015`
- **definition**: A standardized procedure or technique used to evaluate the physical condition and vulnerability of flood infrastructure.
- **attributes**: methodId, methodName, methodType, accuracyLevel, costIndex, isAutomated
- **relations**: usedFor→ConditionRecord, appliesTo→FloodAsset
