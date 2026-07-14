# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Accreditation Certificate
- **genus**: `cco:ont00000958`
- **definition**: A formal record issued by an accreditation body attesting that an organization meets specified standards for a defined scope of activities.
- **attributes**: certificateNumber, issueDate, expiryDate, status, issuingBodyName
- **relations**: accredits→AccreditedOrganization, coversScope→AccreditationScope, mandatedBy→AccreditationStandard

## Accredited Organization
- **genus**: `bfo:0000040`
- **definition**: A legal entity or facility authorized to perform specific calibration activities under an accreditation scheme.
- **attributes**: legalName, streetAddress, city, state, postalCode, contactPhone
- **relations**: holdsCertificate→AccreditationCertificate, performsCalibration→CalibrationActivity

## Accreditation Scope
- **genus**: `cco:ont00000958`
- **definition**: A detailed specification of the specific technical parameters, ranges, and equipment types an organization is authorized to calibrate.
- **attributes**: scopeTitle, technicalDomain, isOnSiteAvailable, scopeVersion
- **relations**: partOfCertificate→AccreditationCertificate, definesCapability→CalibrationCapability

## Calibration Capability
- **genus**: `bfo:0000040`
- **definition**: A specific, authorized technical ability to calibrate a particular parameter within a defined range with a stated uncertainty.
- **attributes**: parameterName, equipmentType, measurementRangeMin, measurementRangeMax, unitOfMeasurement, expandedUncertaintyValue, coverageFactor
- **relations**: definedInScope→AccreditationScope, usesStandard→MeasurementStandard

## Measurement Standard
- **genus**: `bfo:0000040`
- **definition**: A physical artifact, reference material, or reference software used to realize a unit of measurement or to calibrate other devices.
- **attributes**: standardIdentifier, standardType, manufacturer, calibrationDueDate, status
- **relations**: supportsCapability→CalibrationCapability

## Accreditation Standard
- **genus**: `cco:ont00000958`
- **definition**: A published normative document specifying requirements for competence, impartiality, and consistent operation of calibration laboratories.
- **attributes**: standardNumber, standardTitle, publicationYear, issuingOrganization
- **relations**: mandatesCertificate→AccreditationCertificate
