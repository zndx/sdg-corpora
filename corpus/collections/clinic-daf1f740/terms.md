# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Clinic
- **genus**: `bfo:0000004`
- **definition**: A physical and organizational entity that provides nutritional counseling and medical services to patients.
- **attributes**: clinicId, clinicName, branchOf, address, city, state, hasTelehealth
- **relations**: employs→Provider, hosts→Program, uses→ChartingSoftware

## Provider
- **genus**: `bfo:0000040`
- **definition**: A professional individual (e.g., RDN, CN) who provides clinical nutrition services and counseling to patients.
- **attributes**: providerId, fullName, credential, stateLicense, employmentStatus, yearsExperience, edExperienceYears, residesInState
- **relations**: worksAt→Clinic, treats→Patient, collaboratesWith→Provider, leads→Program

## Patient
- **genus**: `bfo:0000004`
- **definition**: An individual receiving nutritional counseling, treatment, or support for eating disorders or other health conditions.
- **attributes**: patientId, fullName, ageGroup, diagnosis, insuranceProvider, hasCaregiver, enrolledInProgram
- **relations**: treatedBy→Provider, hasCaregiver→Provider, participatesIn→Program

## Program
- **genus**: `bfo:0000040`
- **definition**: A structured clinical intervention, support group, or educational initiative developed and delivered by the clinic.
- **attributes**: programId, programName, programType, startDate, endDate, isOnline, isReadyMade
- **relations**: deliveredBy→Provider, serves→Patient, partOf→Clinic

## Clinical Documentation
- **genus**: `cco:ont00000995`
- **definition**: A record or dataset created by a provider to document patient care, treatment plans, and insurance requirements.
- **attributes**: docId, docType, creationDate, status, containsSupplementReview, isPublicFacing
- **relations**: createdBy→Provider, pertainsTo→Patient, storedIn→ChartingSoftware

## Charting Software
- **genus**: `bfo:0000040`
- **definition**: A digital system or application used by the clinic to manage patient records, scheduling, and billing.
- **attributes**: softwareId, softwareName, version, hasBillingModule, hasSchedulingModule, isCloudBased
- **relations**: stores→ClinicalDocumentation, usedBy→Provider
