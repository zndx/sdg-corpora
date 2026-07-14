# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Data Controller
- **genus**: `cco:ont00000995`
- **definition**: A legal entity responsible for determining the purposes and means of processing personal data.
- **attributes**: legalName, registrationNumber, registeredAddress, contactEmail, jurisdiction
- **relations**: employs→DataProcessor, designates→PrivacyRepresentative

## Data Processor
- **genus**: `cco:ont00000995`
- **definition**: A legal entity that processes personal data on behalf of the data controller.
- **attributes**: legalName, registrationNumber, registeredAddress, serviceType, contractStartDate
- **relations**: actsOnBehalfOf→DataController, processes→PersonalData

## Privacy Representative
- **genus**: `bfo:0000023`
- **definition**: A role played by an individual or entity responsible for ensuring compliance with data protection regulations.
- **attributes**: name, contactEmail, contactPhone, appointmentDate
- **relations**: represents→DataController

## Surfing Data
- **genus**: `cco:ont00000995`
- **definition**: Technical data collected during website visits, including IP addresses and browser parameters.
- **attributes**: ipAddress, domainName, operatingSystem, visitTimestamp, sessionDuration, isAnonymous
- **relations**: collectedBy→DataController, storedIn→Database

## Personal Data
- **genus**: `cco:ont00000995`
- **definition**: Information relating to an identified or identifiable natural person.
- **attributes**: dataCategory, consentStatus, collectionPurpose, retentionPeriod, isSensitive
- **relations**: processedBy→DataController, subjectOf→DataSubject

## Data Subject
- **genus**: `bfo:0000002`
- **definition**: An identified or identifiable natural person whose personal data is being processed.
- **attributes**: subjectIdentifier, consentGiven, contactMethod
- **relations**: providesDataTo→DataController, hasDataProcessedBy→DataProcessor

## Cookie
- **genus**: `cco:ont00000995`
- **definition**: A small data file stored on a user's device to enhance website functionality and track usage.
- **attributes**: cookieId, purpose, expirationDate, isEssential, thirdPartyProvider
- **relations**: deployedBy→DataController, storedOn→UserDevice

## User Device
- **genus**: `bfo:0000040`
- **definition**: A hardware device used by a data subject to access the website.
- **attributes**: deviceId, deviceType, operatingSystem, browserVersion
- **relations**: belongsToMany→DataSubject, hosts→Cookie
