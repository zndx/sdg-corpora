# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Activation Key
- **genus**: `cco:ont00000958`
- **definition**: A unique alphanumeric string issued by Agena to a customer that authorizes use of the Licensed Software and encodes license parameters.
- **attributes**: keyString, issuedDate, licenseType, licensePeriodStart, licensePeriodEnd, maxConcurrentSessions
- **relations**: grantsAccessTo→LicensedSoftware, issuedTo→Customer

## Licensed Software
- **genus**: `cco:ont00000995`
- **definition**: The Agena.ai Modeller application and/or API, including updates and upgrades, licensed to a customer for computational modeling.
- **attributes**: softwareName, versionNumber, isCloudService, lastUpdated
- **relations**: activatedBy→ActivationKey, usedBy→AuthorisedUser

## Customer
- **genus**: `bfo:0000040`
- **definition**: An individual or legal entity that has entered into a license agreement with Agena to use the Licensed Software.
- **attributes**: customerType, legalName, registrationNumber, registeredAddress
- **relations**: holdsActivationKey→ActivationKey, employsOrEnrolls→AuthorisedUser

## Authorised User
- **genus**: `bfo:0000002`
- **definition**: A named individual authorized by the Customer to install and use the Licensed Software on a designated machine.
- **attributes**: userName, userRole, isConcurrent
- **relations**: authorizedBy→Customer, usesSoftware→LicensedSoftware, occupiesSession→UserSession

## Concurrent Authorised User Session
- **genus**: `bfo:0000155`
- **definition**: A real-time instance of an Authorised User actively using the Licensed Software, counted towards the Concurrent Authorised User Sessions limit.
- **attributes**: sessionStart, sessionEnd, isCurrent
- **relations**: belongsToMany→AuthorisedUser, countsTowards→ActivationKey
