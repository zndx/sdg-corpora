# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Healthcare Professional
- **genus**: `bfo:0000040`
- **definition**: A person who provides medical or health-related services to patients.
- **attributes**: professionalId, fullName, specialty, clinicId, isPrimaryCare
- **relations**: treats→Patient, worksAt→Clinic

## Patient
- **genus**: `bfo:0000004`
- **definition**: An individual receiving healthcare services, particularly regarding HIV status disclosure.
- **attributes**: patientId, dateOfBirth, diagnosisDate, status, isMinor
- **relations**: hasHealthcareProfessional→HealthcareProfessional, hasSexualPartner→Person, hasFamilyMember→Person, hasCloseFriend→Person

## Person
- **genus**: `bfo:0000004`
- **definition**: An individual who may be informed of a patient's health status, such as family, friends, or sexual partners.
- **attributes**: personId, fullName, relationshipToPatient, isTrusted
- **relations**: isRelatedTo→Patient

## Disclosure Event
- **genus**: `bfo:0000015`
- **definition**: An activity where a patient communicates their health status to another person.
- **attributes**: eventId, disclosureDate, method, isSuccessful, isNerveWracking
- **relations**: involvesPatient→Patient, involvesRecipient→Person, isSupportedBy→HealthcareProfessional

## Clinic
- **genus**: `bfo:0000040`
- **definition**: A healthcare facility providing medical services, including HIV status disclosure support.
- **attributes**: clinicId, clinicName, location, hasWorkshops
- **relations**: employs→HealthcareProfessional
