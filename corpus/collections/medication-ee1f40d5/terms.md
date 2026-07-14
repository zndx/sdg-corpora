# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Medication
- **genus**: `bfo:0000040`
- **definition**: A pharmaceutical substance administered to a patient for therapeutic or diagnostic purposes.
- **attributes**: medicationId, brandName, genericName, dosageForm, strength, administrationRoute
- **relations**: hasFactSheet→MedicationFactSheet, administeredTo→Patient

## Medication Fact Sheet
- **genus**: `cco:ont00000995`
- **definition**: A structured educational document providing essential information about a specific medication, such as indications, side effects, and administration instructions.
- **attributes**: factSheetId, title, lastUpdated, sourceSystem, language, readabilityLevel
- **relations**: coversMedication→Medication, deliveredVia→DisplayEndpoint

## Patient
- **genus**: `bfo:0000004`
- **definition**: An individual receiving healthcare services within a hospital or clinical setting.
- **attributes**: patientId, admissionDate, dischargeDate, roomNumber, bedNumber, hcahpsScore
- **relations**: receivesMedication→Medication, viewsFactSheet→MedicationFactSheet, locatedIn→DisplayEndpoint

## Display Endpoint
- **genus**: `bfo:0000040`
- **definition**: A physical or virtual device used to present medication information and patient education content at the point of care.
- **attributes**: endpointId, deviceType, ipAddress, status, locationRoom, lastHeartbeat
- **relations**: displaysFactSheet→MedicationFactSheet, servesPatient→Patient

## HCAHPS Metric
- **genus**: `cco:ont00000995`
- **definition**: A standardized measurement of patient perception of care, specifically tracking medication-related communication and understanding.
- **attributes**: metricId, surveyDate, category, score, benchmark, trend
- **relations**: linkedToPatient→Patient, influencedBy→MedicationFactSheet
