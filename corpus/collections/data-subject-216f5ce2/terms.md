# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Data Subject
- **genus**: `bfo:0000002`
- **definition**: An identified or identifiable natural person whose personal data is processed by the controller.
- **attributes**: subjectIdentifier, givenName, familyName, emailAddress, ipAddress, cookieId
- **relations**: hasDataProcessingRecord→DataProcessingRecord, hasConsentRecord→ConsentRecord

## Data Controller
- **genus**: `bfo:0000040`
- **definition**: A natural person or legal entity that determines the purposes and means of the processing of personal data.
- **attributes**: legalName, registrationNumber, registeredOffice, courtRegistry, websiteUrl
- **relations**: processesDataFor→DataProcessingRecord, grantsConsentOnBehalfOf→ConsentRecord

## Data Processing Record
- **genus**: `bfo:0000015`
- **definition**: A specific operation or set of operations performed on personal data, such as collection, storage, or transmission.
- **attributes**: processingPurpose, legalGround, dataExtent, processingPeriodStart, processingPeriodEnd, isObjectionAllowed
- **relations**: performedBy→DataController, affectsDataSubject→DataSubject, usesDataChannel→CommunicationChannel

## Communication Channel
- **genus**: `bfo:0000015`
- **definition**: A medium through which personal data is collected or communicated, such as a website, email, or social network.
- **attributes**: channelType, url, isActive
- **relations**: usedInProcessing→DataProcessingRecord

## Consent Record
- **genus**: `bfo:0000015`
- **definition**: A record of the data subject's consent to the processing of their personal data for specific purposes.
- **attributes**: consentTimestamp, consentStatus, consentScope, withdrawalTimestamp
- **relations**: givenBy→DataSubject, relatesToProcessing→DataProcessingRecord

## Business Partner
- **genus**: `bfo:0000040`
- **definition**: An external entity with which the controller shares personal data for the purpose of providing customized offers.
- **attributes**: partnerName, partnerType, dataSharingAgreementId
- **relations**: receivesDataFrom→DataController, providesOffersTo→DataSubject
