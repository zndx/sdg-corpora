# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Study Protocol
- **genus**: `bfo:0000015`
- **definition**: A planned research activity defining the enrollment criteria, imaging procedures, and data capture methods for the IDEAS Study.
- **attributes**: studyIdentifier, studyTitle, targetEnrollmentCount, startDate, fundingSource, coveragePolicy
- **relations**: enrolls→PatientEnrollment, specifiesImaging→ImagingProcedure, governs→ReimbursementRecord

## Patient Enrollment
- **genus**: `bfo:0000015`
- **definition**: The process of registering a Medicare beneficiary with mild cognitive impairment or uncertain dementia into the research study for longitudinal follow-up.
- **attributes**: enrollmentId, patientAge, clinicalDiagnosis, enrollmentDate, referringPhysicianId, medicareBeneficiaryId
- **relations**: initiates→ImagingProcedure, recordedIn→StudyProtocol, hasOutcome→ScanResult

## Imaging Procedure
- **genus**: `bfo:0000015`
- **definition**: A brain positron emission tomography (PET) scan performed to detect amyloid accumulation in patients with diagnostic uncertainty.
- **attributes**: procedureId, procedureDate, modality, anatomicalRegion, tracerAgent, facilityId
- **relations**: performedAt→ImagingFacility, orderedBy→Physician, interpretedBy→Physician, generatesResult→ScanResult

## Scan Result
- **genus**: `cco:ont00000995`
- **definition**: A diagnostic record capturing the presence or absence of amyloid accumulation and the clinical interpretation provided by a nuclear medicine physician or radiologist.
- **attributes**: resultId, amyloidStatus, interpretationText, resultDate, clinicalImpact
- **relations**: derivedFrom→ImagingProcedure, disclosedTo→PatientEnrollment

## Imaging Facility
- **genus**: `bfo:0000004`
- **definition**: A physical location or organization authorized to perform amyloid PET scans and receive reimbursement under the CED policy.
- **attributes**: facilityId, facilityName, location, certificationStatus
- **relations**: hosts→ImagingProcedure

## Physician
- **genus**: `bfo:0000040`
- **definition**: A medical professional (neurologist, psychiatrist, geriatrician, radiologist, or nuclear medicine specialist) who refers, orders, or interprets scans within the study.
- **attributes**: physicianId, specialty, boardCertified, roleInStudy
- **relations**: enrolls→PatientEnrollment, orders→ImagingProcedure, interprets→ScanResult

## Reimbursement Record
- **genus**: `cco:ont00000995`
- **definition**: A financial record documenting the payment made to a PET facility or interpreting physician under the CMS Coverage with Evidence Development (CED) policy.
- **attributes**: reimbursementId, amount, paymentDate, payer, policyCode
- **relations**: covers→ImagingProcedure, paidTo→ImagingFacility
