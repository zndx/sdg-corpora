# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Traffic Control Sign
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital device placed or erected by the state or city to regulate, warn, or guide traffic participants.
- **attributes**: signIdentifier, signType, installationDate, lastInspectionDate, complianceStatus, manualRevision
- **relations**: locatedOn→StreetSegment, regulates→TrafficRule

## Traffic Rule
- **genus**: `bfo:0000015`
- **definition**: A legally binding regulation governing the operation of vehicles and pedestrians within the municipal jurisdiction.
- **attributes**: ruleCode, ruleDescription, enforcementLevel, effectiveDate, repealDate
- **relations**: governedBy→MunicipalCode, appliesTo→VehicleClass, enforcedBy→PoliceOfficer

## Street Segment
- **genus**: `bfo:0000015`
- **definition**: A defined portion of a roadway within the municipal limits, characterized by its physical boundaries and traffic control features.
- **attributes**: segmentId, streetName, laneCount, isOneWay, isClosedForRepairs, surfaceType
- **relations**: contains→TrafficControlSign, hasTrafficRule→TrafficRule

## Vehicle Class
- **genus**: `cco:ont00000995`
- **definition**: A category of motor vehicles defined by their operational characteristics and regulatory requirements.
- **attributes**: vehicleClassCode, classDescription, requiresMuffler, requiresBrakes, requiresLights
- **relations**: subjectTo→TrafficRule, operatedBy→VehicleOperator

## Vehicle Operator
- **genus**: `bfo:0000015`
- **definition**: A person who operates a motor vehicle within the municipal jurisdiction.
- **attributes**: operatorId, licenseNumber, licenseStatus, lastViolationDate
- **relations**: operates→VehicleClass, violates→TrafficRule

## Municipal Code
- **genus**: `cco:ont00000958`
- **definition**: The codified set of laws and regulations enacted by the municipality governing traffic and parking.
- **attributes**: codeTitle, codeChapter, codeSection, enactmentDate, amendmentDate
- **relations**: contains→TrafficRule
