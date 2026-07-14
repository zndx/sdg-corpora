# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Planning Application
- **genus**: `cco:ont00000958`
- **definition**: A formal proposal submitted to a local authority for the development or change of use of land or buildings.
- **attributes**: applicationId, status, submissionDate, proposalType, totalFloorArea, totalHeight
- **relations**: targets→LandParcel, submittedBy→Developer, assessedBy→LocalAuthority, hasObjection→PublicObjection

## Land Parcel
- **genus**: `bfo:0000040`
- **definition**: A specific, bounded area of land designated for a particular planning purpose or development.
- **attributes**: parcelId, zoningDistrict, areaHectares, currentLandUse, topography
- **relations**: locatedIn→Municipality, subjectTo→PlanningApplication, contains→GreenSpace

## Housing Unit
- **genus**: `bfo:0000040`
- **definition**: A residential dwelling unit, either a standalone house or a flat within a multi-story building.
- **attributes**: unitId, unitType, bedrooms, hasGarden, floorLevel, buildingHeight
- **relations**: partOf→DevelopmentProject, requires→ParkingSpace, adjacentTo→GreenSpace

## Development Project
- **genus**: `bfo:0000015`
- **definition**: The planned construction and assembly of housing units and associated infrastructure on a specific site.
- **attributes**: projectId, projectName, totalUnits, totalFloors, estimatedCost, startDate
- **relations**: locatedOn→LandParcel, includes→HousingUnit, requires→Infrastructure, drives→TrafficFlow

## Infrastructure
- **genus**: `bfo:0000040`
- **definition**: Physical systems and facilities required to support the population and operations of a development area.
- **attributes**: infraId, infraType, capacity, currentUtilization, condition
- **relations**: serves→Municipality, supports→DevelopmentProject, locatedIn→LandParcel

## Public Objection
- **genus**: `cco:ont00000958`
- **definition**: A formal or informal expression of opposition to a proposed development plan by residents or stakeholders.
- **attributes**: objectionId, submissionDate, objectionReason, severity, isFormal
- **relations**: targets→PlanningApplication, raisedBy→Resident, citesConcern→Infrastructure

## Municipality
- **genus**: `bfo:0000040`
- **definition**: A defined geographic area governed by a local authority, containing residential, commercial, and green zones.
- **attributes**: municipalityId, name, population, density, gardenCityStatus
- **relations**: contains→LandParcel, governedBy→LocalAuthority, hosts→Infrastructure

## Local Authority
- **genus**: `bfo:0000023`
- **definition**: A governmental body responsible for planning, zoning, and regulating development within a municipality.
- **attributes**: authorityId, authorityName, jurisdiction, decision
- **relations**: regulates→PlanningApplication, governs→Municipality, collaboratesWith→Government
