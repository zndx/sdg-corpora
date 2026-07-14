# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Healthcare Provider
- **genus**: `bfo:0000040`
- **definition**: A real-world entity that provides medical or health-related services to a patient.
- **attributes**: providerId, providerName, specialty, contactInfo

## Patient
- **genus**: `bfo:0000004`
- **definition**: An individual receiving healthcare services, particularly regarding HIV status disclosure.
- **attributes**: patientId, patientName, diagnosisDate, ageAtDiagnosis
- **relations**: receivesCareFrom→HealthcareProvider

## Disclosure Event
- **genus**: `bfo:0000015`
- **definition**: A process where a patient communicates their HIV status to another individual or group.
- **attributes**: eventId, disclosureDate, disclosureMethod, disclosureOutcome
- **relations**: initiatedBy→Patient, disclosedTo→Recipient

## Recipient
- **genus**: `bfo:0000004`
- **definition**: An individual who receives information about a patient's HIV status.
- **attributes**: recipientId, recipientName, relationshipType, trustLevel
- **relations**: receivesDisclosureFrom→Patient

## Support Resource
- **genus**: `cco:ont00000995`
- **definition**: A resource or service provided to assist patients in disclosing their HIV status.
- **attributes**: resourceId, resourceName, resourceType, availabilityStatus
- **relations**: supportsDisclosureFor→Patient
