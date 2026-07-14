# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Customer Account
- **genus**: `cco:ont00000995`
- **definition**: A financial account maintained by a clearing broker for an individual client seeking personal financial services.
- **attributes**: accountIdentifier, accountStatus, openingDate, closingDate, accountType
- **relations**: heldBy→Customer, managedBy→IntroducingFirm, hasTransaction→FinancialTransaction

## Customer
- **genus**: `bfo:0000004`
- **definition**: An individual person who seeks or obtains financial products or services primarily for personal, family, or household purposes.
- **attributes**: customerIdentifier, fullName, ssn, dateOfBirth, occupation, annualIncome, address, telephoneNumber
- **relations**: hasAccount→CustomerAccount

## Introducing Firm
- **genus**: `bfo:0000040`
- **definition**: A broker-dealer or registered investment advisor that introduces clients to a clearing broker for account servicing.
- **attributes**: firmIdentifier, firmName, registrationNumber, contactEmail, contactPhone
- **relations**: introduces→Customer, providesAccountTo→CustomerAccount

## Financial Transaction
- **genus**: `bfo:0000015`
- **definition**: An activity or event involving the exchange of financial instruments or funds within a customer account.
- **attributes**: transactionId, transactionDate, transactionType, amount, currencyCode, status
- **relations**: occursIn→CustomerAccount, executedBy→ThirdPartyService

## Third Party Service
- **genus**: `cco:ont00000995`
- **definition**: An external company or system that performs services such as data processing, securities execution, or security safeguards for the clearing broker.
- **attributes**: serviceId, serviceName, serviceType, contractStartDate, contractEndDate, securityLevel
- **relations**: providesServiceFor→CustomerAccount, handlesDataFor→Customer

## Security Safeguard
- **genus**: `cco:ont00000995`
- **definition**: A physical or electronic measure implemented to protect non-public personal information and system integrity.
- **attributes**: safeguardId, safeguardName, safeguardType, implementationDate, lastAuditDate, complianceStatus
- **relations**: protects→CustomerAccount, implementedBy→ThirdPartyService
