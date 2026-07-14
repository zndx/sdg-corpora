# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Quality Improvement Program
- **genus**: `cco:ont00000995`
- **definition**: A structured organizational initiative designed to evaluate and enhance clinical performance and patient outcomes through systematic data analysis and iterative improvement cycles.
- **attributes**: programIdentifier, programName, startDate, status, methodology
- **relations**: implementedBy→Organization, evaluates→ClinicalPerformanceData, governedBy→PolicyInstrument

## Clinical Performance Data
- **genus**: `cco:ont00000995`
- **definition**: Quantitative records of individual and system-level clinical activities, outcomes, and process metrics used to assess healthcare delivery effectiveness.
- **attributes**: dataRecordId, collectionDate, metricType, value, unitOfMeasure, dataQualityScore
- **relations**: collectedBy→MeasurementActivity, associatedWith→PatientEncounter, analyzedBy→AnalyticTool

## Measurement Activity
- **genus**: `bfo:0000015`
- **definition**: A systematic process of gathering, recording, and validating clinical performance metrics through defined protocols and instruments.
- **attributes**: activityId, startTime, endTime, protocolVersion, instrumentUsed, status
- **relations**: performedBy→HealthcareProfessional, generates→ClinicalPerformanceData, partOf→QualityImprovementProgram

## Healthcare Professional
- **genus**: `bfo:0000002`
- **definition**: A licensed or certified individual providing clinical care, quality oversight, or research coordination within an emergency medical services or healthcare organization.
- **attributes**: professionalId, fullName, role, yearsOfExperience, certificationStatus, organizationAffiliation
- **relations**: employedBy→Organization, performs→MeasurementActivity, supervises→QualityImprovementProgram

## Organization
- **genus**: `bfo:0000040`
- **definition**: A structured entity such as an emergency medical services authority, hospital system, or first-responder agency that employs healthcare professionals and implements quality improvement initiatives.
- **attributes**: orgId, orgName, orgType, jurisdiction, establishedDate, status
- **relations**: implements→QualityImprovementProgram, employs→HealthcareProfessional, participatesIn→QualityImprovementProgram

## Policy Instrument
- **genus**: `cco:ont00000958`
- **definition**: A formal document, guideline, or regulatory framework that establishes standards, protocols, or requirements for clinical practice and quality improvement activities.
- **attributes**: policyId, policyTitle, effectiveDate, issuingAuthority, policyType, version, status
- **relations**: governs→QualityImprovementProgram, references→ClinicalPerformanceData, issuedBy→Organization

## Analytic Tool
- **genus**: `cco:ont00000995`
- **definition**: A software application, statistical method, or computational framework used to process, analyze, and interpret clinical performance data for quality improvement purposes.
- **attributes**: toolId, toolName, toolType, version, lastUpdated, validationStatus
- **relations**: analyzes→ClinicalPerformanceData, usedBy→HealthcareProfessional, supports→QualityImprovementProgram
