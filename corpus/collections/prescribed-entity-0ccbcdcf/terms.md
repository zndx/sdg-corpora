# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Prescribed Entity
- **genus**: `cco:ont00000958`
- **definition**: An organization or entity prescribed under the Personal Health Information Protection Act to receive personal health information without consent for analysis, statistical compilation, or health system management.
- **attributes**: entityIdentifier, entityName, prescriptionDate, approvalStatus, reviewCycle
- **relations**: hasReview→PrivacyReview, receivesDataFrom→HealthInformationCustodian, maintainsRegistry→HealthRegistry

## Privacy Review
- **genus**: `bfo:0000015`
- **definition**: A statutory review process conducted by the Information and Privacy Commissioner to evaluate whether a prescribed entity's practices and procedures meet privacy protection requirements.
- **attributes**: reviewId, reviewDate, reviewType, reviewOutcome, reviewerName
- **relations**: evaluatesEntity→PrescribedEntity, documentsRecommendations→ComplianceRecommendation, triggersApproval→PrivacyApproval

## Health Information Custodian
- **genus**: `cco:ont00000958`
- **definition**: A person or organization that has custody or control of personal health information and is authorized to disclose it to prescribed entities under the Act.
- **attributes**: custodianId, custodianName, custodianType, registrationDate, complianceStatus
- **relations**: disclosesTo→PrescribedEntity, submitsDocumentation→ComplianceDocumentation

## Compliance Recommendation
- **genus**: `cco:ont00000958`
- **definition**: A formal recommendation issued by the IPC to a prescribed entity to enhance privacy protection practices and procedures.
- **attributes**: recommendationId, issueDate, priorityLevel, status, description
- **relations**: issuedByReview→PrivacyReview, targetedAtEntity→PrescribedEntity

## Health Registry
- **genus**: `cco:ont00000995`
- **definition**: A structured collection of personal health information maintained by a prescribed entity for analysis, statistical compilation, or health system management.
- **attributes**: registryId, registryName, dataCategory, lastUpdated, recordCount
- **relations**: maintainedBy→PrescribedEntity, storesPatientData→PatientRecord

## Patient Record
- **genus**: `cco:ont00000995`
- **definition**: A structured record containing personal health information about an individual, stored within a health registry.
- **attributes**: recordId, patientId, diagnosisCode, treatmentDate, consentStatus
- **relations**: partOfRegistry→HealthRegistry, linkedToPatient→Patient

## Patient
- **genus**: `bfo:0000002`
- **definition**: An individual who is the subject of personal health information and whose data is collected, used, or disclosed by health information custodians and prescribed entities.
- **attributes**: patientId, dateOfBirth, gender, residenceCode
- **relations**: hasRecord→PatientRecord
