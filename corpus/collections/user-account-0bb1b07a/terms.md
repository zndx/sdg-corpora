# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## User Account
- **genus**: `cco:ont00000995`
- **definition**: A digital record representing a user's registered profile and authentication credentials on the Oversight Games platform.
- **attributes**: accountId, emailAddress, passwordHash, accountStatus, createdAt, lastLoginAt
- **relations**: hasSession→UserSession, consentsTo→DataProcessingConsent

## User Session
- **genus**: `bfo:0000015`
- **definition**: A temporary process instance representing a user's active interaction with the services, capturing device and network metadata.
- **attributes**: sessionId, ipAddress, userAgent, operatingSystem, deviceName, countryCode, sessionStart, sessionEnd
- **relations**: belongsToMany→UserAccount

## Data Processing Consent
- **genus**: `cco:ont00000958`
- **definition**: A formal record of a user's permission or legal basis for the processing of their personal data under specific business purposes.
- **attributes**: consentId, legalBasis, purposeDescription, grantedAt, revokedAt, isRevoked
- **relations**: grantedBy→UserAccount

## Marketing Communication
- **genus**: `cco:ont00000995`
- **definition**: A promotional message or email sent to users for business purposes, contingent upon their consent status.
- **attributes**: messageId, subjectLine, sentAt, deliveryStatus, campaignType
- **relations**: targetedBy→UserAccount, requiresConsent→DataProcessingConsent

## Cookie Identifier
- **genus**: `cco:ont00000995`
- **definition**: A unique string stored on the user's device to track usage, analytics, or marketing preferences during service navigation.
- **attributes**: cookieId, cookieName, purpose, expiryDate, isThirdParty
- **relations**: associatedWith→UserSession
