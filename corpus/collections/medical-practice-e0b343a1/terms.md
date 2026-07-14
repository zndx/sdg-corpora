# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Medical Practice
- **genus**: `cco:ont00000995`
- **definition**: A fixed administrative and physical facility providing primary healthcare services to a registered patient population.
- **attributes**: practiceName, registrationNumber, addressLine, postCode, telephoneNumber, websiteURL, lastUpdatedDate
- **relations**: employs→HealthcareProfessional, providesServiceTo→Patient, locatedIn→GeographicLocation, commissionedBy→HealthAuthority

## Healthcare Professional
- **genus**: `bfo:0000023`
- **definition**: A role played by an individual qualified to provide clinical, administrative, or support services within a medical practice.
- **attributes**: professionalName, jobTitle, employmentStatus, qualifications
- **relations**: worksAt→MedicalPractice, performsService→ClinicalService, manages→AdministrativeTask

## Clinical Service
- **genus**: `bfo:0000015`
- **definition**: A medical or health-related activity performed by healthcare professionals, such as examinations, treatments, or screenings.
- **attributes**: serviceName, serviceCategory, requiresAppointment, isUrgentCare
- **relations**: providedBy→HealthcareProfessional, deliveredTo→Patient, locatedAt→MedicalPractice

## Patient
- **genus**: `bfo:0000004`
- **definition**: An individual receiving healthcare services, registered with a medical practice, and maintaining a medical record.
- **attributes**: patientID, fullName, dateOfBirth, registrationStatus, hasOnlineAccess
- **relations**: registeredAt→MedicalPractice, receivesService→ClinicalService, prescribedMedication→Medication, requiresInterpreter→InterpreterService

## Medication
- **genus**: `cco:ont00000995`
- **definition**: A pharmaceutical substance prescribed to a patient for therapeutic or preventive purposes.
- **attributes**: medicationName, dosageForm, prescriptionStatus, transmissionDate
- **relations**: prescribedTo→Patient, dispensedAt→Pharmacy, reviewedBy→HealthcareProfessional

## Health Authority
- **genus**: `cco:ont00000995`
- **definition**: An administrative body responsible for commissioning and overseeing healthcare services in a specific geographic region.
- **attributes**: authorityName, contactPhone, contactEmail, regionCovered
- **relations**: commissionsServiceFrom→MedicalPractice, operatesService→ClinicalService
