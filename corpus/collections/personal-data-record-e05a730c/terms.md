# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Personal Data Record
- **genus**: `cco:ont00000995`
- **definition**: A data record containing personal information about an individual or household collected by Monro through its digital platforms and physical stores.
- **attributes**: recordId, collectionDate, dataCategory, isSensitive, retentionPeriodMonths, disclosureStatus
- **relations**: collectedVia→DigitalPlatform, linkedTo→CustomerProfile, sharedWith→ThirdPartyVendor

## Digital Platform
- **genus**: `cco:ont00000995`
- **definition**: A digital interface, such as a website or mobile application, through which user interactions and data collection occur.
- **attributes**: platformId, platformName, platformType, url, cookieEnabled, analyticsProvider
- **relations**: collectsDataFrom→PersonalDataRecord, usesTrackingTool→TrackingSoftware

## Tracking Software
- **genus**: `cco:ont00000995`
- **definition**: Third-party software utilities used to collect visitor behavior data and provide measurement services for digital platforms.
- **attributes**: softwareId, softwareName, providerName, functionType, dataCollected
- **relations**: installedOn→DigitalPlatform, processesDataFor→PersonalDataRecord

## Customer Profile
- **genus**: `cco:ont00000995`
- **definition**: An aggregated representation of a customer's preferences and history derived from collected personal data and commercial records.
- **attributes**: profileId, customerName, householdId, profileStatus, lastUpdated, preferenceTags
- **relations**: composedOf→PersonalDataRecord, linkedTo→PurchaseTransaction

## Purchase Transaction
- **genus**: `cco:ont00000995`
- **definition**: A commercial record detailing the purchase of goods or services by a customer, including payment and product information.
- **attributes**: transactionId, transactionDate, totalAmount, paymentMethod, storeLocation, itemsPurchased
- **relations**: associatedWith→CustomerProfile, processedBy→ThirdPartyVendor

## Third Party Vendor
- **genus**: `cco:ont00000995`
- **definition**: An external entity or service provider that receives personal data for specific purposes such as payment processing, analytics, or advertising.
- **attributes**: vendorId, vendorName, serviceType, dataAccessLevel, contractStartDate
- **relations**: receivesDataFrom→PersonalDataRecord, processesTransactionFor→PurchaseTransaction

## Vehicle Identification Record
- **genus**: `cco:ont00000995`
- **definition**: A record containing vehicle details extracted from license plate images via optical character recognition software in the mobile app.
- **attributes**: recordId, licensePlateNumber, stateIssued, vehicleMake, vehicleModel, captureTimestamp, ocrConfidenceScore
- **relations**: linkedTo→CustomerProfile, derivedFrom→PersonalDataRecord
