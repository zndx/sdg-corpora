# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Healthcare Organization
- **genus**: `bfo:0000040`
- **definition**: A material entity that provides healthcare services, including hospitals, clinics, and health systems.
- **attributes**: organizationId, name, locationCity, locationState, locationCountry, operatingMargin, isSustainable
- **relations**: collectsDataFrom→ElectronicHealthRecord, implements→HealthcareAnalyticsSolution, employs→ClinicalDecisionSupport

## Electronic Health Record
- **genus**: `cco:ont00000995`
- **definition**: A digital record of a patient's health information collected and stored by a healthcare organization.
- **attributes**: ehrId, patientId, collectionDate, dataVolume, dataFormat, isComplete, storageLocation
- **relations**: generatedBy→HealthcareOrganization, contains→ClinicalDataPoint

## Clinical Data Point
- **genus**: `bfo:0000015`
- **definition**: A single measured or recorded clinical observation or metric derived from patient data.
- **attributes**: dataPointId, metricName, metricValue, measurementUnit, timestamp, dataQuality
- **relations**: partOf→ElectronicHealthRecord, measuredBy→HealthcareAnalyticsSolution

## Healthcare Analytics Solution
- **genus**: `cco:ont00000958`
- **definition**: A technology solution or tool used to transform healthcare data into information and wisdom for decision-making.
- **attributes**: solutionId, solutionName, solutionType, vendor, isWebBased, supportsBigData, deploymentDate
- **relations**: usedBy→HealthcareOrganization, processes→ElectronicHealthRecord, enables→ClinicalDecisionSupport

## Clinical Decision Support
- **genus**: `bfo:0000015`
- **definition**: A process or system that provides clinicians with knowledge and patient-specific information to enhance health and healthcare.
- **attributes**: cdsId, cdsName, cdsType, effectiveness, isProactive, isPredictive
- **relations**: enabledBy→HealthcareAnalyticsSolution, appliedTo→ElectronicHealthRecord, improves→HealthcareOrganization
