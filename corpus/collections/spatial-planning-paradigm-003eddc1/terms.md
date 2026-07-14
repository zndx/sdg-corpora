# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Spatial Planning Paradigm
- **genus**: `bfo:0000015`
- **definition**: A theoretical and methodological framework guiding the territorial organization of land use and functional relations to balance environmental protection and development.
- **attributes**: paradigmId, name, theoreticalFocus, methodologicalFocus, status
- **relations**: appliesTo→LandUse, addresses→EcologicalSystem, informs→PolicyInstrument

## Land Use
- **genus**: `bfo:0000015`
- **definition**: The human modification and utilization of land for specific purposes such as residential, commercial, agricultural, or conservation activities.
- **attributes**: landUseId, zoningDistrict, densityClass, primaryFunction, lastSurveyDate
- **relations**: locatedIn→SpatialPlanningZone, associatedWith→TransitOrientedDevelopment, influencedBy→SpatialPlanningParadigm

## Transit-Oriented Development
- **genus**: `bfo:0000015`
- **definition**: A planning strategy that maximizes the amount of residential, business, and leisure space within walking distance of public transport.
- **attributes**: todId, name, conurbation, coverageRadius, implementationStatus
- **relations**: spatiallyAssociatedWith→LandUse, locatedIn→SpatialPlanningZone

## Ecological System
- **genus**: `bfo:0000015`
- **definition**: A community of living organisms interacting with their physical environment, including urban parks and natural features.
- **attributes**: ecologicalSystemId, name, type, areaHectares, conservationStatus
- **relations**: contains→NaturalFeature, locatedIn→SpatialPlanningZone

## Natural Feature
- **genus**: `bfo:0000015`
- **definition**: A distinct physical element of the natural environment, such as a specific tree species, water body, or landform within an ecological system.
- **attributes**: featureId, name, category, perceivedValue
- **relations**: partOf→EcologicalSystem, subjectOfPerception→PublicPerception

## Public Perception
- **genus**: `cco:ont00000995`
- **definition**: Subjective views and perceptions of individuals regarding natural features or environmental conditions, often gathered through methodologies like Q methodology.
- **attributes**: perceptionId, methodology, subject, sentimentScore, surveyDate
- **relations**: about→NaturalFeature, gatheredIn→SpatialPlanningZone

## Policy Instrument
- **genus**: `bfo:0000015`
- **definition**: A tool or mechanism used by public sector entities to influence spatial distribution, land use, and environmental outcomes.
- **attributes**: policyId, name, jurisdiction, effectiveDate, status
- **relations**: informedBy→PublicPerception, targets→LandUse, appliesTo→SpatialPlanningZone

## Spatial Planning Zone
- **genus**: `bfo:0000015`
- **definition**: A defined geographical area subject to specific spatial planning regulations, zoning laws, and development guidelines.
- **attributes**: zoneId, name, region, country, areaKm2
- **relations**: contains→LandUse, contains→TransitOrientedDevelopment, contains→EcologicalSystem
