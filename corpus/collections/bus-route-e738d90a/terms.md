# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Bus Route
- **genus**: `bfo:0000015`
- **definition**: A scheduled transportation service connecting a school campus to residential pickup zones.
- **attributes**: routeCode, district, roundTripFee, singleTripFee, academicYear, status
- **relations**: serves→SchoolCampus, covers→PickupZone, operatedBy→BusOperator

## School Campus
- **genus**: `bfo:0000015`
- **definition**: An educational facility providing early childhood education and bilingual nursery services.
- **attributes**: campusName, campusCode, campusType, district, academicYear
- **relations**: receives→BusRoute, locatedIn→District

## Pickup Zone
- **genus**: `bfo:00000995`
- **definition**: A specific residential building or estate designated as a stop on a bus route.
- **attributes**: zoneName, zoneCode, district, specialInstructions
- **relations**: partOf→BusRoute, locatedIn→District

## Bus Operator
- **genus**: `bfo:00000995`
- **definition**: A commercial entity providing transportation services for school children.
- **attributes**: companyName, contactPerson, contactPhone, licenseNumber
- **relations**: operates→BusRoute

## District
- **genus**: `bfo:0000015`
- **definition**: A geographical administrative area within a city where bus routes and pickup zones are located.
- **attributes**: districtName, districtCode, region
- **relations**: contains→PickupZone, contains→SchoolCampus
