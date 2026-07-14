# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Quality Improvement Program
- **genus**: `bfo:0000015`
- **definition**: A structured organizational activity designed to evaluate and enhance clinical performance and patient outcomes using systematic improvement models.
- **attributes**: programIdentifier, programName, startDate, status, methodology, targetPopulation
- **relations**: operatedBy→FirstResponderOrganization, evaluates→ClinicalPerformanceData, improves→PatientOutcome

## First Responder Organization
- **genus**: `bfo:0000015`
- **definition**: A municipal or organizational entity providing emergency medical services and first-response capabilities within a defined jurisdiction.
- **attributes**: organizationID, organizationName, jurisdiction, establishedDate, serviceType, participationStatus
- **relations**: participatesIn→QualityImprovementProgram, employs→Paramedic, serves→Municipality

## Municipality
- **genus**: `bfo:0000015`
- **definition**: A defined geographic and administrative jurisdiction within which first responder organizations operate and provide emergency services.
- **attributes**: municipalityID, municipalityName, state, population, areaSqKm, incorporationDate
- **relations**: hosts→FirstResponderOrganization, participatesIn→QualityImprovementProgram

## Clinical Performance Data
- **genus**: `cco:ont00000995`
- **definition**: Quantitative records and metrics capturing individual and system-level clinical performance indicators used for evaluation and improvement.
- **attributes**: dataRecordID, collectionDate, metricType, value, unitOfMeasure, dataQuality
- **relations**: collectedBy→FirstResponderOrganization, analyzedBy→QuantitativeAnalyticTool, usedIn→QualityImprovementProgram

## Quantitative Analytic Tool
- **genus**: `cco:ont00000995`
- **definition**: A software or methodological instrument used to process, evaluate, and derive insights from clinical performance and patient outcome data.
- **attributes**: toolID, toolName, toolType, version, lastUpdated, validationStatus
- **relations**: processes→ClinicalPerformanceData, generates→PatientOutcome, supports→QualityImprovementProgram

## Patient Outcome
- **genus**: `bfo:0000015`
- **definition**: A measurable result or effect on a patient's health status resulting from clinical interventions or system-level care improvements.
- **attributes**: outcomeID, measurementDate, outcomeType, value, unitOfMeasure, improvementDirection
- **relations**: influencedBy→QualityImprovementProgram, measuredBy→QuantitativeAnalyticTool, associatedWith→FirstResponderOrganization
