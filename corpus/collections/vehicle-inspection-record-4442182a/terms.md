# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Vehicle Inspection Record
- **genus**: `cco:ont00000995`
- **definition**: A formal assessment document recording the operational condition of a vehicle at a specific point in time, completed by a qualified mechanic.
- **attributes**: inspectionDate, reviewDueDate, odometerReading, registrationNumber, mechanicName, mechanicSignature, businessName, businessAddress
- **relations**: assesses→Vehicle, conductedBy→QualifiedMechanic, records→InspectionItem

## Vehicle
- **genus**: `cco:ont00000995`
- **definition**: A registered motor vehicle subject to safety and operational inspection, characterized by its make, model, and registration details.
- **attributes**: makeModel, registrationNumber, ownerName, odometerReading, inspectionStatus
- **relations**: hasInspectionRecord→VehicleInspectionRecord, contains→InspectionItem

## Inspection Item
- **genus**: `cco:ont00000995`
- **definition**: A specific component or system of a vehicle evaluated for safety and operational compliance during a vehicle inspection.
- **attributes**: itemName, systemCategory, complianceStatus, defectDescription, rectificationDate
- **relations**: partOf→Vehicle, recordedIn→VehicleInspectionRecord, linkedTo→NonComplianceIssue

## Non-Compliance Issue
- **genus**: `cco:ont00000995`
- **definition**: A documented instance of a vehicle component failing to meet safety or operational standards, requiring rectification.
- **attributes**: issueNumber, description, dateRectified, severity
- **relations**: affects→InspectionItem, resolvedBy→QualifiedMechanic

## Qualified Mechanic
- **genus**: `bfo:0000023`
- **definition**: A person holding the necessary qualifications and authority to perform vehicle safety inspections and certify compliance.
- **attributes**: full_name, businessName, businessAddress, phone, fax
- **relations**: conducts→VehicleInspectionRecord, resolves→NonComplianceIssue
