# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Evacuation Order
- **genus**: `bfo:0000015`
- **definition**: An official directive issued by local authorities mandating the immediate or scheduled departure of residents from a specific geographic area due to an imminent hazard.
- **attributes**: orderIdentifier, issuingAuthority, issueDateTime, evacuationType, warningMethod, complianceStatus
- **relations**: triggeredBy→HazardEvent, appliesToZone→EvacuationZone, communicatedVia→WarningChannel

## Hazard Event
- **genus**: `bfo:0000015`
- **definition**: A specific dangerous occurrence, such as a weather condition, industrial accident, or fire, that necessitates protective action or evacuation.
- **attributes**: eventIdentifier, eventCategory, severityLevel, onsetDateTime, peakIntensityDateTime, affectedPopulationCount, isMonitored
- **relations**: causes→EvacuationOrder, impactsLocation→GeographicZone, requiresRoute→EvacuationRoute

## Evacuation Zone
- **genus**: `cco:ont00000995`
- **definition**: A defined geographic area or land parcel designated by authorities for evacuation based on proximity to a hazard or specific risk criteria.
- **attributes**: zoneIdentifier, zoneName, riskCategory, estimatedResidentCount, zoneBoundaryCoordinates, isCoastal
- **relations**: subjectToOrder→EvacuationOrder, containsProperty→Property, connectedToRoute→EvacuationRoute

## Evacuation Route
- **genus**: `cco:ont00000995`
- **definition**: A designated path or corridor used for the organized movement of people and vehicles away from a hazard zone to a safe location.
- **attributes**: routeIdentifier, routeName, routeStatus, capacityRating, isShortcut, floodRiskLevel
- **relations**: servesZone→EvacuationZone, leadsToShelter→Shelter, crossesInfrastructure→Bridge

## Property
- **genus**: `cco:ont00000995`
- **definition**: A specific residential, commercial, or institutional building and its immediate land parcel that is subject to evacuation orders.
- **attributes**: propertyIdentifier, address, propertyType, occupancyStatus, hasVehicleAccess, floodingRisk
- **relations**: locatedInZone→EvacuationZone, occupiedBy→Household, usesRoute→EvacuationRoute

## Household
- **genus**: `cco:ont00000995`
- **definition**: A group of people living together in a single dwelling unit, responsible for executing evacuation procedures and utilizing resources.
- **attributes**: householdIdentifier, vehicleCount, hasTransportationArrangement, disasterKitReady, evacuationStatus, fuelLevelPercent
- **relations**: residesAt→Property, evacuatesTo→Shelter, monitors→WarningChannel

## Shelter
- **genus**: `cco:ont00000995`
- **definition**: A designated safe location or facility where evacuees are directed to go to avoid the immediate threat of a hazard.
- **attributes**: shelterIdentifier, shelterName, shelterType, currentOccupancy, maxCapacity, operationalStatus
- **relations**: receivesFromRoute→EvacuationRoute, accommodatesHouseholds→Household, locatedInSafeZone→GeographicZone

## Warning Channel
- **genus**: `cco:ont00000995`
- **definition**: A method or medium used by authorities to disseminate evacuation instructions and hazard information to the public.
- **attributes**: channelIdentifier, channelName, channelType, powerDependency, coverageArea, isReliableDuringOutage
- **relations**: broadcastsOrder→EvacuationOrder, monitoredBy→Household
