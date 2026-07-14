# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Treatment Program
- **genus**: `bfo:0000040`
- **definition**: A structured clinical intervention program providing substance use treatment for juvenile offenders, delivered via outpatient modalities.
- **attributes**: programId, programName, deliveryMode, riskLevel, status, accreditationBody
- **relations**: deliversService→ClinicalService, servesPopulation→PatientPopulation, locatedAt→Facility, fundedBy→PaymentSource

## Clinical Service
- **genus**: `bfo:0000040`
- **definition**: A specific therapeutic or diagnostic intervention provided within a treatment program, such as therapy or drug screening.
- **attributes**: serviceCode, serviceName, serviceType, frequency, duration, status
- **relations**: providedBy→TreatmentProgram, performedOn→Patient, usesAssessment→RiskAssessment

## Patient
- **genus**: `bfo:0000004`
- **definition**: A juvenile offender receiving substance use treatment services, characterized by risk level and demographic attributes.
- **attributes**: patientId, admissionDate, dischargeDate, riskCategory, substanceHistory, offenseHistory, priorityStatus, demographicGroup
- **relations**: enrolledIn→TreatmentProgram, receivesService→ClinicalService, subjectToAssessment→RiskAssessment, coveredBy→PaymentSource

## Risk Assessment
- **genus**: `bfo:0000040`
- **definition**: A clinical evaluation determining a patient's risk level and appropriate treatment intensity based on substance use and offense history.
- **attributes**: assessmentId, assessmentDate, riskScore, assessmentType, result, assessorId
- **relations**: appliedTo→Patient, informsProgram→TreatmentProgram, triggersService→ClinicalService

## Facility
- **genus**: `bfo:0000040`
- **definition**: A physical location where treatment services are delivered, including address and accessibility features.
- **attributes**: facilityId, facilityName, streetAddress, city, state, zipCode, busAccessible, eveningHours, admissionsHours
- **relations**: hostsProgram→TreatmentProgram, providesService→ClinicalService

## Payment Source
- **genus**: `bfo:0000040`
- **definition**: A financial mechanism or funding stream covering the cost of treatment services for patients.
- **attributes**: sourceId, sourceName, sourceType, coverageStatus, effectiveDate
- **relations**: coversPatient→Patient, paysForService→ClinicalService
