# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Evacuation Order
- **genus**: `bfo:0000015`
- **definition**: An official directive issued by local authorities to mandate the departure of residents from a specified area due to an imminent hazard.
- **attributes**: orderIdentifier, issuanceDateTime, issuingAuthority, evacuationZone, hazardType, status, mandatory
- **relations**: triggeredBy→HazardEvent, appliesTo→GeographicZone, communicatedVia→WarningMethod

## Hazard Event
- **genus**: `bfo:0000015`
- **definition**: A dangerous natural or man-made occurrence that threatens public safety and necessitates evacuation.
- **attributes**: eventIdentifier, startTime, endTime, eventType, severityLevel, affectedArea, monitored
- **relations**: triggers→EvacuationOrder, occursIn→GeographicZone

## Geographic Zone
- **genus**: `bfo:0000015`
- **definition**: A defined spatial area subject to evacuation orders, characterized by boundaries and risk levels.
- **attributes**: zoneIdentifier, zoneName, riskLevel, populationCount, areaSize, boundaryCoordinates
- **relations**: subjectTo→EvacuationOrder, contains→EvacuationRoute, experiences→HazardEvent

## Evacuation Route
- **genus**: `bfo:0000015`
- **definition**: A designated path for safe travel out of an evacuation zone, marked on official maps and recommended by authorities.
- **attributes**: routeIdentifier, routeName, startPoint, endPoint, routeLength, roadCondition, recommended
- **relations**: locatedIn→GeographicZone, connectsTo→GeographicZone, usedBy→EvacuationOrder

## Warning Method
- **genus**: `bfo:0000015`
- **definition**: A channel or mechanism used by authorities to disseminate evacuation information and instructions to the public.
- **attributes**: methodIdentifier, methodName, reach, reliability, activeDuringPowerOutage
- **relations**: usedFor→EvacuationOrder, deliversTo→Population

## Population
- **genus**: `bfo:0000015`
- **definition**: The group of individuals residing in or visiting an evacuation zone who are subject to evacuation orders.
- **attributes**: populationIdentifier, householdCount, averageHouseholdSize, evacuationComplianceRate, transportationAccess
- **relations**: residesIn→GeographicZone, receives→WarningMethod, subjectTo→EvacuationOrder
