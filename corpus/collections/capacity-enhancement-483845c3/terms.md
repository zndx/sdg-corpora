# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Capacity Enhancement Event
- **genus**: `bfo:0000015`
- **definition**: A planned process of increasing the manufacturing output capacity of a facility over a specific period.
- **attributes**: plannedCapacityMW, actualCapacityMW, planningPeriod, effectiveDate, status
- **relations**: targetedAt→ManufacturingFacility, executedBy→Enterprise

## Manufacturing Facility
- **genus**: `bfo:0000040`
- **definition**: A physical site or complex dedicated to the production of specific industrial goods.
- **attributes**: facilityName, location, facilityType, operationalStatus
- **relations**: locatedIn→GeographicRegion, produces→ProductLine

## Product Line
- **genus**: `bfo:0000040`
- **definition**: A specific category of manufactured goods or technology developed by an enterprise.
- **attributes**: productCategory, technologyReadinessLevel, targetOutputMW, isStrategic
- **relations**: developedBy→Enterprise, manufacturedAt→ManufacturingFacility

## Enterprise
- **genus**: `bfo:0000002`
- **definition**: A corporate entity or organization engaged in industrial or commercial activities.
- **attributes**: enterpriseName, ownershipType, registrationNumber, regulatoryAuthority
- **relations**: owns→ManufacturingFacility, develops→ProductLine, partnersWith→Enterprise

## Geographic Region
- **genus**: `bfo:0000004`
- **definition**: A defined spatial area or jurisdiction where facilities are located.
- **attributes**: regionName, countryCode, stateProvince, regionType
- **relations**: contains→ManufacturingFacility
