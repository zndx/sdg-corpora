# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Regulatory Inspection Event
- **genus**: `bfo:0000015`
- **definition**: A planned regulatory assessment activity conducted by a health authority to evaluate a clinical service's compliance with safety, effectiveness, and governance standards.
- **attributes**: inspectionDate, inspectionType, regulatoryBasis, overallSafetyRating, overallEffectivenessRating, overallCaringRating, overallResponsiveRating, overallWellLedRating
- **relations**: conductedAt→ClinicalService, conductedBy→RegulatoryAuthority, references→RegulatoryFinding

## Weight Management Clinic
- **genus**: `bfo:0000040`
- **definition**: A private healthcare facility providing weight reduction services, dietary advice, and prescribed medicines to adult patients.
- **attributes**: serviceId, serviceType, operatingHours, locationAddress, locationPostcode, numberOfClinicians, numberOfSupportStaff, serviceStatus
- **relations**: locatedAt→PhysicalPremises, staffedBy→Clinician, managedBy→RegisteredManager, serves→Patient

## Compliance Finding
- **genus**: `cco:ont00000995`
- **definition**: A recorded observation or determination regarding a specific aspect of a clinical service's adherence to regulatory standards.
- **attributes**: findingId, findingCategory, findingStatus, findingDescription, findingDate, priorFindingId
- **relations**: pertainsTo→ClinicalService, partOf→InspectionEvent, addresses→RegulatoryRequirement

## Service Recipient
- **genus**: `bfo:0000002`
- **definition**: An adult individual receiving weight management services, including dietary advice and prescribed medicines, from the clinic.
- **attributes**: patientId, patientAge, patientGender, consultationFrequency, feedbackRating, riskScreeningStatus
- **relations**: receivesCareFrom→ClinicalService, consultedBy→Clinician, providesFeedbackFor→RegulatoryFinding

## Medical Practitioner
- **genus**: `bfo:0000003`
- **definition**: A registered medical doctor providing clinical weight management services, including prescribing medicines and dietary advice.
- **attributes**: clinicianId, clinicianName, specialization, trainingCompleted, safeguardingAwareness, supervisionStatus
- **relations**: employedBy→ClinicalService, supervisedBy→RegisteredManager, prescribes→Medicine, consultsWith→Patient

## Prescribed Pharmaceutical
- **genus**: `cco:ont00000995`
- **definition**: A pharmaceutical product supplied to patients as part of a weight management treatment plan, including licensed and unlicensed medicines.
- **attributes**: medicineId, medicineName, medicineType, prescriptionStatus, storageCondition, clinicalNeedJustification
- **relations**: prescribedTo→Patient, prescribedBy→Clinician, storedIn→PhysicalPremises

## Legal Compliance Standard
- **genus**: `bfo:0000040`
- **definition**: A specific legal or regulatory obligation derived from the Health and Social Care Act 2008 that a clinical service must satisfy.
- **attributes**: requirementId, requirementCategory, requirementDescription, legalBasis, complianceStatus
- **relations**: governs→ClinicalService, addressedBy→RegulatoryFinding
