# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## User Account
- **genus**: `cco:ont00000995`
- **definition**: A persistent digital record representing a user's identity and access profile on the Housing Authorities' web platform.
- **attributes**: accountId, emailAddress, fullName, homeAddress, workAddress, telephoneNumber, accountStatus, dateCreated
- **relations**: initiatedBy→WebSession, receives→SurveyResponse, provides→DemographicProfile

## Web Session
- **genus**: `bfo:0000015`
- **definition**: A discrete period of user interaction with the Housing Authorities' website, capturing technical and behavioral telemetry.
- **attributes**: sessionId, ipAddress, browserType, domainName, accessTimestamp, referringUrl, sessionDurationSeconds, isSecure
- **relations**: belongs_to→UserAccount, generates→PageViewEvent, uses→CookieRecord

## Demographic Profile
- **genus**: `cco:ont00000995`
- **definition**: An anonymous, non-unique statistical record of user attributes such as age, gender, and interests.
- **attributes**: profileId, zipCode, ageGroup, gender, primaryInterest, favoriteCategory, isAnonymized
- **relations**: linked_to→UserAccount

## Survey Response
- **genus**: `cco:ont00000995`
- **definition**: A recorded user submission regarding opinions on current or potential Housing Authorities services.
- **attributes**: responseId, surveyTopic, ratingScore, feedbackText, submissionDate, isAnonymous
- **relations**: submitted_by→UserAccount, pertains_to→ServiceOffering

## Service Offering
- **genus**: `cco:ont00000995`
- **definition**: A specific housing-related service or product provided by the Housing Authorities or its affiliates.
- **attributes**: serviceId, serviceName, serviceType, isCurrent, isPotential
- **relations**: evaluated_in→SurveyResponse, delivered_via→WebSession

## Cookie Record
- **genus**: `cco:ont00000995`
- **definition**: A text file placed on a user's device to personalize online experience and track session state.
- **attributes**: cookieId, cookieName, contentHash, expirationDate, isEssential
- **relations**: read_by→WebSession, assigned_to→UserAccount
