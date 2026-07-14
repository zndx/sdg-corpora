# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Social Service Resource
- **genus**: `cco:ont00000995`
- **definition**: A made thing or record representing a community service, facility, or program designed to assist individuals and families with needs such as food, shelter, housing, or childcare.
- **attributes**: resourceIdentifier, serviceCategory, serviceStatus, languageAvailability, operatingHours, isConfidential
- **relations**: providedBy→ServiceOrganization, servesLocation→ServiceLocation

## Service Organization
- **genus**: `cco:ont00000995`
- **definition**: An organization or administrative body responsible for managing, funding, or delivering social services, such as United Way, SAMHSA, or DHS.
- **attributes**: organizationName, jurisdictionLevel, contactPhoneNumber, websiteUrl, isTollFree
- **relations**: managesResource→SocialServiceResource, operatesHotline→HotlineService

## Hotline Service
- **genus**: `bfo:0000015`
- **definition**: A telephonic or text-based process or activity providing immediate information, treatment referral, or crisis intervention for specific social or health issues.
- **attributes**: hotlineIdentifier, phoneNumber, textKeyword, availabilitySchedule, isFree, isConfidential
- **relations**: managedBy→ServiceOrganization, addressesIssue→SocialIssue, providesReferralTo→SocialServiceResource

## Social Issue
- **genus**: `bfo:0000015`
- **definition**: A specific problem, crisis, or condition affecting individuals or families that requires intervention, treatment, or assistance.
- **attributes**: issueCategory, severityLevel, requiresLawEnforcement
- **relations**: reportedVia→HotlineService, addressedByResource→SocialServiceResource

## Service Location
- **genus**: `bfo:0000015`
- **definition**: A physical or virtual geographic area, community, or jurisdiction where social services are delivered or accessible.
- **attributes**: locationName, locationType, geographicScope, supportedLanguages
- **relations**: hostsResource→SocialServiceResource, accessibleVia→HotlineService
