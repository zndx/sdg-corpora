# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Healthcare Organization
- **genus**: `bfo:0000040`
- **definition**: A material entity that provides healthcare services, such as hospitals or clinics.
- **attributes**: organizationId, name, location, establishedDate, operatingMargin, isSustainable
- **relations**: collectsDataFrom→ElectronicHealthRecord, emplores→HealthcareProfessional, uses→AnalyticsSolution

## Electronic Health Record
- **genus**: `cco:ont00000995`
- **definition**: A digital record of a patient's health information collected by a healthcare organization.
- **attributes**: ehrId, patientId, collectionDate, dataVolume, dataVariety, status
- **relations**: storedIn→HealthcareOrganization, contains→ClinicalDataPoint

## Clinical Data Point
- **genus**: `bfo:0000015`
- **definition**: A single measurement or observation recorded in an electronic health record.
- **attributes**: dataPointId, measurementType, value, unit, timestamp, isAnomalous
- **relations**: partOf→ElectronicHealthRecord, measuredBy→HealthcareProfessional

## Healthcare Professional
- **genus**: `bfo:0000004`
- **definition**: An individual who provides healthcare services, such as doctors or nurses.
- **attributes**: professionalId, name, specialty, licenseNumber, employmentStatus
- **relations**: employedBy→HealthcareOrganization, measures→ClinicalDataPoint

## Analytics Solution
- **genus**: `cco:ont00000958`
- **definition**: A software tool or system used to transform healthcare data into actionable insights.
- **attributes**: solutionId, name, type, provider, deploymentDate, isWebBased
- **relations**: usedBy→HealthcareOrganization, processes→ElectronicHealthRecord

## Clinical Decision Support
- **genus**: `bfo:0000015`
- **definition**: A process or system that provides healthcare professionals with knowledge and patient-specific information to aid in decision-making.
- **attributes**: cdsId, triggerCondition, recommendation, effectivenessScore, lastUpdated, isProactive
- **relations**: derivedFrom→AnalyticsSolution, supports→HealthcareProfessional
