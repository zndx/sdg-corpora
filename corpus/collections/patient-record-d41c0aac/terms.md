# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Patient Record
- **genus**: `cco:ont00000995`
- **definition**: A composite record of a patient's medical and billing information maintained by the healthcare practice.
- **attributes**: recordId, patientName, dateOfService, recordStatus, accessLevel
- **relations**: hasRecord→Patient, contains→BillingRecord, contains→TreatmentEvent

## Patient
- **genus**: `bfo:0000002`
- **definition**: An individual receiving medical treatment and services from the healthcare practice.
- **attributes**: patientId, preferredContactMethod, preferredContactLocation, consentStatus
- **relations**: hasRecord→PatientRecord, undergoes→TreatmentEvent

## Treatment Event
- **genus**: `bfo:0000015`
- **definition**: A specific instance of medical treatment or service provided to a patient.
- **attributes**: eventId, eventDate, serviceCode, eventStatus
- **relations**: involves→Patient, performedBy→HealthcareProvider, generates→BillingRecord

## Healthcare Provider
- **genus**: `bfo:0000002`
- **definition**: A professional or associate involved in the patient's care or practice operations.
- **attributes**: providerId, providerName, role, accessPermission
- **relations**: performs→TreatmentEvent, disclosesTo→DisclosureRecord

## Billing Record
- **genus**: `cco:ont00000995`
- **definition**: A financial record detailing the costs and payment status for medical services provided.
- **attributes**: billingId, amount, paymentStatus, billingDate
- **relations**: linkedTo→TreatmentEvent, belongsToMany→PatientRecord

## Disclosure Record
- **genus**: `cco:ont00000995`
- **definition**: A log entry documenting the use or disclosure of medical information for specific purposes.
- **attributes**: disclosureId, disclosureDate, purpose, recipient
- **relations**: references→PatientRecord, initiatedBy→HealthcareProvider
