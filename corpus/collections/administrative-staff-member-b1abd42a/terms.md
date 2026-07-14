# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Administrative Staff Member
- **genus**: `bfo:0000040`
- **definition**: A person holding an administrative or support role within the English Department, such as Chair, Office Administrator, or Support Specialist.
- **attributes**: staffId, fullName, officeLocation, phoneNumber, roleTitle, department
- **relations**: holdsRole→AdministrativeRole, locatedIn→OfficeRoom

## Administrative Role
- **genus**: `bfo:0000023`
- **definition**: A specific functional position or title within the department's organizational structure, such as Director of Graduate Studies or Office Administrator.
- **attributes**: roleName, roleCategory, isSupervisory, reportingLine
- **relations**: heldBy→AdministrativeStaffMember

## Office Room
- **genus**: `bfo:0000002`
- **definition**: A physical room within the department building (e.g., Reavis Hall) used for administrative work, meetings, or storage.
- **attributes**: roomNumber, buildingName, floorNumber, roomType, isLocked
- **relations**: contains→OfficeEquipment, assignedTo→AdministrativeStaffMember

## Office Equipment
- **genus**: `bfo:0000002`
- **definition**: Physical machinery or devices located in department offices used for administrative tasks, such as duplicators, photocopiers, or fax machines.
- **attributes**: equipmentId, equipmentType, locationRoom, isRestricted, maintenanceStatus
- **relations**: locatedIn→OfficeRoom, operatedBy→AdministrativeStaffMember

## Travel Request
- **genus**: `cco:ont00000995`
- **definition**: A formal record or form submitted by department personnel to request funding or authorization for professional travel and attendance at meetings.
- **attributes**: requestId, submissionDate, travelPurpose, destination, fundingSource, approvalStatus, isEmergency
- **relations**: submittedBy→AdministrativeStaffMember, processedBy→AdministrativeStaffMember, relatedTo→TravelVoucher

## Travel Voucher
- **genus**: `cco:ont00000995`
- **definition**: A financial document submitted after travel is completed, detailing expenses and attaching original receipts for reimbursement.
- **attributes**: voucherId, submissionDate, totalAmount, currency, isNotarized, receiptCount
- **relations**: submittedBy→AdministrativeStaffMember, supports→TravelRequest, containsReceipt→Receipt

## Receipt
- **genus**: `cco:ont00000995`
- **definition**: An original document or digital record proving payment for an expense incurred during departmental travel.
- **attributes**: receiptId, issueDate, vendorName, expenseAmount, expenseCategory, isOriginal
- **relations**: attachedTo→TravelVoucher

## Office Service Request
- **genus**: `cco:ont00000995`
- **definition**: A formal request submitted by department members for administrative services such as duplicating, photocopying, or faxing materials.
- **attributes**: requestId, submissionDate, serviceType, pageCount, isCopyrighted, estimatedCompletionTime, isEmergency
- **relations**: submittedBy→AdministrativeStaffMember, processedBy→AdministrativeStaffMember, requiresForm→RequestForm

## Request Form
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital document that must be completed and attached to service requests to ensure proper authorization and copyright compliance.
- **attributes**: formId, formType, isComplete, copyrightInfoProvided, locationInOffice
- **relations**: usedFor→OfficeServiceRequest
