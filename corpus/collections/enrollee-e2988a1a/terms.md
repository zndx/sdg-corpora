# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Health Plan Enrollee
- **genus**: `bfo:0000040`
- **definition**: An individual who has been enrolled in the AmeriHealth Caritas District of Columbia health plan and is eligible for covered services.
- **attributes**: enrolleeId, enrollmentDate, planName, status
- **relations**: hasPrescription→Prescription, receivesReminder→ReminderLetter

## Prescription Record
- **genus**: `cco:ont00000995`
- **definition**: A formal written instruction from a provider for a patient to be administered a specific medication, including dosage and quantity details.
- **attributes**: prescriptionId, fillDate, quantity, dosage, requiresPriorAuthorization, isNonFormulary, schedule
- **relations**: prescribedBy→Provider, forMedication→Medication, forEnrollee→Enrollee, triggersReminder→ReminderLetter

## Pharmaceutical Medication
- **genus**: `bfo:0000040`
- **definition**: A chemical substance used in the diagnosis, cure, mitigation, treatment, or prevention of disease, which may be subject to formulary restrictions or quantity limits.
- **attributes**: medicationId, brandName, genericName, isFormulary, mmeLimit, controlledSubstanceSchedule
- **relations**: hasPrescription→Prescription

## Healthcare Provider
- **genus**: `bfo:0000040`
- **definition**: A licensed healthcare professional authorized to prescribe medications and manage patient care for enrollees.
- **attributes**: providerId, specialty, contactNumber
- **relations**: prescribes→Prescription

## Prior Authorization Reminder
- **genus**: `cco:ont00000958`
- **definition**: A communication sent to an enrollee to remind them to contact their provider for prior authorization of a medication during the transition period.
- **attributes**: letterId, sentDate, reminderType
- **relations**: sentToEnrollee→Enrollee, relatedToPrescription→Prescription

## Enrollee Transition Window
- **genus**: `bfo:0000015`
- **definition**: A 90-day coverage window during which new enrollees can continue receiving medications for existing therapy without prior authorization.
- **attributes**: periodId, startDate, endDate, durationDays, status
- **relations**: appliesToEnrollee→Enrollee, governsPrescription→Prescription
