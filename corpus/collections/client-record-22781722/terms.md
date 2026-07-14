# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Client Record
- **genus**: `cco:ont00000995`
- **definition**: A structured record containing personal and health information collected about a client for service provision and compliance.
- **attributes**: clientIdentifier, fullName, dateOfBirth, homeAddress, phoneNumber, emailAddress, healthHistorySummary, emergencyContactName, emergencyContactPhone
- **relations**: hasRecord→ClientRecord, receivesService→ServiceDelivery, providesConsent→ConsentRecord

## Service Delivery
- **genus**: `bfo:0000015`
- **definition**: A process or activity through which personal care, transportation, counseling, or other support services are provided to a client.
- **attributes**: serviceType, deliveryDate, serviceStatus, providerStaffId, interactionNotes
- **relations**: deliveredTo→ClientRecord, performedBy→StaffRecord

## Staff Record
- **genus**: `cco:ont00000995`
- **definition**: A structured record containing personal, employment, and credential information for CCS employees.
- **attributes**: staffIdentifier, fullName, homeAddress, dateOfBirth, socialInsuranceNumber, bankAccountNumber, employmentStatus, performanceRating
- **relations**: performsService→ServiceDelivery, holdsRole→StaffRole

## Donor Record
- **genus**: `cco:ont00000995`
- **definition**: A structured record containing personal information of individuals who have made donations to CCS.
- **attributes**: donorIdentifier, fullName, homeAddress, emailAddress, totalDonationAmount, taxReceiptIssued
- **relations**: makesDonation→DonationTransaction

## Donation Transaction
- **genus**: `bfo:0000015`
- **definition**: A financial process representing the collection and processing of a donation from a donor.
- **attributes**: transactionId, transactionDate, amount, paymentMethod, taxReceiptNumber
- **relations**: fromDonor→DonorRecord, processedBy→StaffRecord

## Consent Record
- **genus**: `cco:ont00000995`
- **definition**: A formal record documenting a client's permission for the collection, use, or disclosure of their personal health information.
- **attributes**: consentId, consentDate, consentStatus, scopeOfConsent
- **relations**: givenBy→ClientRecord, relatesTo→ServiceDelivery
