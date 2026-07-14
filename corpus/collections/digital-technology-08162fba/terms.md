# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Digital Technology Platform
- **genus**: `bfo:0000040`
- **definition**: A digital platform or application operated by Principal Financial Group that collects personal information from users.
- **attributes**: platformIdentifier, platformName, platformType, effectiveDate, privacyPolicyURL
- **relations**: collects→PersonalInformation, operatedBy→PrincipalFinancialGroup

## Personal Information Record
- **genus**: `cco:ont00000995`
- **definition**: A record of data that can be used to identify an individual, collected through digital technologies.
- **attributes**: informationType, dataField, collectionMethod, isSensitive, retentionPeriod
- **relations**: collectedBy→DigitalTechnology, pertainsTo→Individual

## Individual
- **genus**: `bfo:0000004`
- **definition**: A human being to whom personal information pertains.
- **attributes**: individualID, name, dateOfBirth, nationality, gender, accountType
- **relations**: hasPersonalInformation→PersonalInformation, consentsTo→PrivacyPolicy

## Privacy Policy Document
- **genus**: `cco:ont00000958`
- **definition**: A document outlining the data collection, use, and protection practices of Principal Financial Group.
- **attributes**: policyID, policyTitle, effectiveDate, issuingEntity, jurisdiction
- **relations**: governs→DigitalTechnology, acceptedBy→Individual

## Social Media Platform
- **genus**: `bfo:0000040`
- **definition**: An external online platform where users interact and share content, which may collect personal information.
- **attributes**: platformName, platformURL, dataCollectionPolicy, isExternal
- **relations**: collectsFrom→Individual, linkedTo→DigitalTechnology

## Consent Record
- **genus**: `cco:ont00000995`
- **definition**: A record indicating an individual's agreement to the terms of a privacy policy.
- **attributes**: consentID, consentDate, consentMethod, isWithdrawable, withdrawalDate
- **relations**: givenBy→Individual, relatesTo→PrivacyPolicy
