# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Office Staff Role
- **genus**: `bfo:0000023`
- **definition**: A role played by a person within the English Department's administrative structure, defining their specific responsibilities and access privileges.
- **attributes**: roleTitle, officeLocation, phoneExtension, isAuthorizedOperator, hasEmergencyAuthority
- **relations**: performedBy→Person, manages→OfficeProcess

## Person
- **genus**: `bfo:0000004`
- **definition**: A human being associated with the department, either as staff, faculty, or student.
- **attributes**: fullName, employeeId, emailAddress, departmentAffiliation, hasUniversityCarAccess
- **relations**: holdsRole→OfficeStaffRole, submits→TravelRequest, submits→CopyRequest

## Office Process
- **genus**: `bfo:0000015`
- **definition**: An administrative activity conducted within the department office, such as handling mail, processing copies, or managing travel.
- **attributes**: processType, operatingHoursStart, operatingHoursEnd, isLunchBreakIncluded, lunchBreakStart, lunchBreakEnd, semesterRestriction
- **relations**: performedBy→OfficeStaffRole, handles→Document, requires→AuthorizationForm

## Document
- **genus**: `cco:ont00000995`
- **definition**: A physical or digital record created, processed, or stored by the department, including papers, forms, and mail.
- **attributes**: documentType, creationDate, isCopyrighted, hasOriginalPages, hasCopyCount, isEmergency, dropBoxLocation
- **relations**: submittedBy→Person, processedBy→OfficeProcess, requiresForm→CopyRequestForm, sentTo→PostalAddress

## Copy Request Form
- **genus**: `cco:ont00000995`
- **definition**: A specific administrative form required for all duplicating and photocopying requests, containing copyright and page count details.
- **attributes**: formId, copyrightInfo, originalPageCount, copyCount, isProperlyFilled, locationInOffice
- **relations**: attachedTo→Document, completedBy→Person

## Travel Request
- **genus**: `cco:ont00000995`
- **definition**: A formal request for supplemental support for professional travel, submitted by personnel to attend meetings or conferences.
- **attributes**: requestId, submissionDate, meetingName, requiresAbsenceAuthorization, requiresUniversityCar, isSubmittedEarly
- **relations**: submittedBy→Person, reviewedBy→OfficeStaffRole, generates→TravelVoucher, requires→AuthorizationForm

## Travel Voucher
- **genus**: `cco:ont00000995`
- **definition**: A detailed financial record submitted after travel is completed, including original receipts for expense reimbursement.
- **attributes**: voucherId, submissionDate, totalAmount, hasAllReceipts, missingReceiptsCount, isNotarized
- **relations**: generatedFrom→TravelRequest, submittedBy→Person, attachedTo→Receipt

## Postal Address
- **genus**: `cco:ont00000995`
- **definition**: A physical location used for mail sorting, delivery, and pickup within the department or university.
- **attributes**: buildingCode, roomNumber, streetAddress, isMailPickupLocation, mailSortDeadline
- **relations**: usedBy→Document, locatedIn→Building
