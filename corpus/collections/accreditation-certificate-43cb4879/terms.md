# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Accreditation Certificate
- **genus**: `cco:ont00000958`
- **definition**: A formal document issued by an accreditation body attesting that an organization fulfills specific standards for calibration services.
- **attributes**: certificateNumber, issueDate, expiryDate, accreditationBody, status
- **relations**: issuedTo→CalibrationLaboratory, certifiesComplianceWith→CalibrationStandard

## Calibration Laboratory
- **genus**: `bfo:0000040`
- **definition**: A physical facility and organizational entity equipped to perform calibration measurements against defined standards.
- **attributes**: laboratoryName, address, contactPhone, contactPerson, facilityType
- **relations**: holdsCertificate→AccreditationCertificate, performsCalibrationFor→CalibrationParameter

## Calibration Standard
- **genus**: `cco:ont00000995`
- **definition**: A recognized normative document or technical specification that defines the requirements for calibration competence.
- **attributes**: standardIdentifier, standardName, publicationYear, issuingOrganization
- **relations**: requiredBy→AccreditationCertificate

## Calibration Parameter
- **genus**: `bfo:0000015`
- **definition**: A specific physical quantity or measurement capability that a laboratory is accredited to calibrate, including its range and uncertainty.
- **attributes**: parameterName, measurementRange, expandedUncertainty, uncertaintyUnit, frequencyRange, coverageFactor
- **relations**: performedBy→CalibrationLaboratory, requiresStandard→CalibrationStandard

## Measurement Equipment
- **genus**: `cco:ont00000995`
- **definition**: A physical instrument or device used to perform or verify calibration measurements within a specific parameter domain.
- **attributes**: equipmentType, equipmentModel, serialNumber, manufacturer, calibrationStatus
- **relations**: usedForParameter→CalibrationParameter, maintainedBy→CalibrationLaboratory
