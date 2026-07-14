# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Daily Hunting Rate
- **genus**: `cco:ont00000995`
- **definition**: A recorded daily fee for a specific hunting configuration or service.
- **attributes**: rateId, rateType, dailyFee, currency, validFrom, validTo
- **relations**: appliesTo→HuntingPackage

## Hunting Service Package
- **genus**: `cco:ont00000995`
- **definition**: A bundled offering of hunting services, accommodations, and logistics.
- **attributes**: packageId, packageName, totalPrice, currency, durationNights, durationDays, status
- **relations**: includesService→HuntingService, includesAccommodation→Accommodation

## Hunting Service Component
- **genus**: `cco:ont00000995`
- **definition**: A discrete service component within a hunting package, such as shooting, transport, or staffing.
- **attributes**: serviceId, serviceName, serviceType, unitPrice, unitType, quantity
- **relations**: partOfPackage→HuntingPackage, requiresLicense→HuntingLicense

## Government Hunting License
- **genus**: `cco:ont00000995`
- **definition**: A mandatory government-issued permit required for legal hunting activities.
- **attributes**: licenseId, licenseType, issuingAuthority, feeAmount, issueDate, expiryDate, status
- **relations**: requiredBy→HuntingService

## Trophy Scoring Surcharge
- **genus**: `cco:ont00000995`
- **definition**: An additional charge applied for trophies that meet specific scoring criteria.
- **attributes**: feeId, scoringRange, surchargeAmount, currency, appliesToTrophy
- **relations**: appliesTo→HuntingService

## Hunting Accommodation
- **genus**: `cco:ont00000995`
- **definition**: Lodging facilities provided as part of the hunting experience.
- **attributes**: accommodationId, accommodationType, location, nightsIncluded, mealPlan
- **relations**: includedIn→HuntingPackage
