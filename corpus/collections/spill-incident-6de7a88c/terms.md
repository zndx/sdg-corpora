# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Spill Incident
- **genus**: `bfo:0000015`
- **definition**: A discrete environmental contamination event involving the release of hazardous materials from a vessel into a marine environment.
- **attributes**: incidentId, incidentName, spillNumber, incidentDateTime, incidentStatus, vesselName, vesselType, vesselLength
- **relations**: occurredAt→GeographicLocation, causedBy→Vessel, released→HazardousMaterial, affected→EcologicalResource, managedBy→ResponseAgency

## Geographic Location
- **genus**: `bfo:0000015`
- **definition**: A specific spatial coordinate or area where a spill incident occurred or where response activities are conducted.
- **attributes**: locationId, latitude, longitude, locationName, waterDepth, distanceFromShore, locationType
- **relations**: contains→SpillIncident, adjacentTo→EcologicalResource

## Hazardous Material
- **genus**: `cco:ont00000995`
- **definition**: A specific type of oil, fuel, or chemical substance released during a spill incident.
- **attributes**: materialId, materialType, estimatedQuantity, unitOfMeasure, onboardQuantity, spilledQuantity, removedQuantity
- **relations**: releasedFrom→Vessel, associatedWith→SpillIncident

## Vessel
- **genus**: `cco:ont00000995`
- **definition**: A watercraft involved in a spill incident, including its physical characteristics and operational status.
- **attributes**: vesselId, vesselName, vesselType, vesselLength, vesselStatus, ownerName, ownerLocation, totalConstructiveLoss
- **relations**: involvedIn→SpillIncident, carried→HazardousMaterial, sankAt→GeographicLocation, movedTo→GeographicLocation

## Response Agency
- **genus**: `bfo:0000015`
- **definition**: An organization or agency responsible for managing, monitoring, or responding to a spill incident.
- **attributes**: agencyId, agencyName, agencyType, contactPerson, contactPhone, contactEmail, notificationMethod
- **relations**: manages→SpillIncident, notifiedOf→SpillIncident, monitors→Vessel

## Ecological Resource
- **genus**: `bfo:0000015`
- **definition**: A natural resource or habitat area potentially affected by a spill incident, including wildlife and fisheries.
- **attributes**: resourceId, resourceName, resourceType, affectedStatus, speciesList, commercialUse
- **relations**: locatedAt→GeographicLocation, affectedBy→SpillIncident, inhabitedBy→HazardousMaterial
