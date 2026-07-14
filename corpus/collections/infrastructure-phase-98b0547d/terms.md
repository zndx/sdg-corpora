# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Infrastructure Construction Phase
- **genus**: `bfo:0000015`
- **definition**: A discrete temporal segment of a development project during which specific infrastructure construction and inspection activities are executed.
- **attributes**: phaseIdentifier, phaseName, startDate, endDate, status, isGuaranteed
- **relations**: contains→InspectionEvent, requires→TestSheet, requires→Drawing

## Infrastructure Inspection Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled or ad-hoc activity where a City Engineering inspector or Developer's Representative evaluates the physical state of constructed infrastructure against regulatory standards.
- **attributes**: inspectionId, inspectionType, inspectionDate, inspectorRole, deficiencyCount, punchListItems, status, notes
- **relations**: performedOn→InfrastructurePhase, identifiesDeficiency→Deficiency, verifies→TestSheet

## Sewer Main Test Sheet
- **genus**: `cco:ont00000995`
- **definition**: A standardized record or dataset documenting the results of pressure, integrity, or flow tests performed on sanitary or storm sewer mains during construction.
- **attributes**: testSheetId, testType, testDate, resultStatus, approvedBy, approvalDate, testSpecification, isElectronic
- **relations**: requiredFor→InfrastructurePhase, verifiedBy→InspectionEvent, governingRule→Regulation

## Stub-out Record Drawing
- **genus**: `cco:ont00000995`
- **definition**: An electronic designator or dataset representing the precise location and configuration of utility stub-outs connecting to municipal infrastructure.
- **attributes**: drawingId, drawingType, submissionDate, format, status, fileSize, isElectronic
- **relations**: requiredFor→InfrastructurePhase, governingRule→Regulation, references→InfrastructurePhase

## Construction Deficiency
- **genus**: `bfo:0000015`
- **definition**: A specific defect, non-compliance, or punch-list item identified during inspection that requires correction by the contractor before final acceptance.
- **attributes**: deficiencyId, description, severity, identifiedDate, correctedDate, status, requiresReInspection
- **relations**: identifiedIn→InspectionEvent, correctedBy→Contractor, verifiedBy→InspectionEvent

## Administrative Rule
- **genus**: `cco:ont00000958`
- **definition**: A formal document or dataset establishing the legal requirements, specifications, and formats for infrastructure construction, testing, and inspection.
- **attributes**: ruleId, ruleNumber, ruleTitle, effectiveDate, issuingAuthority, isElectronicRequired, scope
- **relations**: governs→TestSheet, governs→Drawing, appliesTo→InfrastructurePhase

## Construction Contractor
- **genus**: `bfo:0000015`
- **definition**: An entity or role responsible for the physical execution of infrastructure construction and the correction of identified deficiencies.
- **attributes**: contractorId, contractorName, licenseNumber, contactEmail, status
- **relations**: corrects→Deficiency, employedBy→Developer

## Project Developer
- **genus**: `bfo:0000015`
- **definition**: The entity or role responsible for overseeing the construction phase, conducting independent inspections, and certifying completion to the City.
- **attributes**: developerId, developerName, contactEmail, representativeName
- **relations**: oversees→InfrastructurePhase, employs→Contractor, submits→Drawing
