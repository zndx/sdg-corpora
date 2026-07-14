# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Building Permit
- **genus**: `cco:ont00000995`
- **definition**: An administrative authorization record issued by the municipal Building Inspections Division permitting construction, alteration, or occupancy of a structure.
- **attributes**: permitId, issueDate, expiryDate, projectTypeCode, projectTypeDescription, ownershipType, totalUnits, contractedSquareFeet, status
- **relations**: covers→PropertyParcel, issuedBy→BuildingInspectionsDivision, includes→InspectionEvent

## Property Parcel
- **genus**: `bfo:0000040`
- **definition**: A distinct real estate parcel or lot identified by a street address and municipal jurisdiction, serving as the physical location for construction activities.
- **attributes**: streetAddress, municipality, parcelId, zoningDistrict, landUseCategory
- **relations**: hasPermit→BuildingPermit, hosts→InspectionEvent

## Inspection Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled or ad-hoc physical examination of a construction site or structure conducted by municipal inspectors to verify code compliance.
- **attributes**: inspectionId, scheduledDate, completionDate, inspectionType, resultStatus, completedWithin24Hours, inspectorBadgeNumber
- **relations**: pertainsTo→BuildingPermit, occursAt→PropertyParcel, verifies→ProjectSegment

## Project Segment
- **genus**: `cco:ont00000995`
- **definition**: A specific category of construction work or permit type (e.g., Electrical, Plumbing, Carport) with associated valuation and fee calculations.
- **attributes**: segmentCode, segmentDescription, valuationAmount, feeAmount, segmentCount
- **relations**: partOf→BuildingPermit, verifiedBy→InspectionEvent

## Certificate of Occupancy
- **genus**: `cco:ont00000995`
- **definition**: A formal document issued by the municipality certifying that a building complies with applicable building codes and is suitable for occupancy.
- **attributes**: cOfOId, issueDate, reason, buildingSquareFootage, occupancyStatus
- **relations**: covers→PropertyParcel, subsequentTo→BuildingPermit, issuedBy→BuildingInspectionsDivision

## Building Inspections Division
- **genus**: `bfo:0000002`
- **definition**: The municipal administrative body responsible for issuing permits, conducting inspections, and enforcing building codes within the City of Cleburne.
- **attributes**: divisionCode, jurisdictionName, reportingPeriodStart, reportingPeriodEnd, totalPermitFeesCollected, performanceTarget
- **relations**: issues→BuildingPermit, issues→CertificateOfOccupancy, conducts→InspectionEvent
