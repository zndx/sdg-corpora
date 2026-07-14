# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Staff Position
- **genus**: `cco:ont00000995`
- **definition**: A designated role within an organization that specifies responsibilities, required qualifications, and reporting relationships for a specific job function.
- **attributes**: positionId, title, department, supervisorTitle, educationRequired, experienceRequired, status
- **relations**: heldBy→StaffMember, reportsTo→StaffPosition

## Staff Member
- **genus**: `bfo:0000002`
- **definition**: A human being employed by the organization who performs duties associated with one or more staff positions.
- **attributes**: staffId, firstName, lastName, hireDate, employmentStatus, contactEmail
- **relations**: holdsPosition→StaffPosition, assignedToDepartment→Department

## Patient Appointment
- **genus**: `bfo:0000015`
- **definition**: A scheduled interaction between a patient and a healthcare provider at a specific time and location for medical consultation or service.
- **attributes**: appointmentId, scheduledDateTime, status, providerId, patientId, serviceType, reminderSent
- **relations**: confirmedBy→StaffMember, relatedToPatient→PatientRecord, relatedToProvider→ProviderRecord

## Patient Record
- **genus**: `cco:ont00000958`
- **definition**: A structured document containing demographic, insurance, and medical history data for an individual receiving care.
- **attributes**: recordId, dateOfBirth, insuranceProvider, policyNumber, lastUpdated, hipaaCompliant
- **relations**: hasAppointment→PatientAppointment, hasPaymentRecord→PaymentTransaction

## Payment Transaction
- **genus**: `bfo:0000015`
- **definition**: A financial exchange event recording the receipt of payment from a patient or insurance company for services rendered.
- **attributes**: transactionId, amount, transactionDate, paymentMethod, status, processedBy
- **relations**: linkedToPatient→PatientRecord, linkedToAppointment→PatientAppointment

## Inventory Item
- **genus**: `cco:ont00000995`
- **definition**: A physical good or supply managed within the office, such as medical contacts, office supplies, or cleaning materials.
- **attributes**: itemId, itemName, category, quantityOnHand, reorderLevel, lastRestocked
- **relations**: managedBy→StaffMember, usedInAppointment→PatientAppointment
