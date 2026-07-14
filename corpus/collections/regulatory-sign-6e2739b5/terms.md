# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Regulatory Sign
- **genus**: `cco:ont00000995`
- **definition**: A physical traffic sign erected to inform highway users of traffic laws or regulations.
- **attributes**: signIdentifier, signMessage, signShape, signColor, isRetroreflectorized, isIlluminated, installationDate, status
- **relations**: appliesTo→TrafficRegulation, locatedAt→RoadwaySegment, specifies→SignStandard

## Traffic Regulation
- **genus**: `bfo:0000015`
- **definition**: A legal rule or requirement imposed on highway users, such as speed limits or right-of-way rules.
- **attributes**: regulationCode, regulationType, effectiveDate, jurisdiction, penaltyAmount, isActive
- **relations**: enforcedBy→RegulatorySign, appliesTo→RoadwaySegment

## Roadway Segment
- **genus**: `bfo:0000015`
- **definition**: A continuous stretch of highway or road where traffic regulations apply and signs are erected.
- **attributes**: segmentIdentifier, roadName, startMileMarker, endMileMarker, surfaceType, laneCount, speedLimit
- **relations**: hasRegulatorySign→RegulatorySign, governs→TrafficRegulation

## Sign Standard
- **genus**: `cco:ont00000958`
- **definition**: A documented specification from the Arizona Manual of Approved Signs defining the required size, legend, and visibility for regulatory signs.
- **attributes**: standardCode, standardVersion, requiredSize, requiredLegend, retroreflectivityLevel, illuminationRequirement
- **relations**: specifies→RegulatorySign
