# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Advertising Rule
- **genus**: `cco:ont00000958`
- **definition**: A regulatory provision within the Rules Regulating The Florida Bar that governs the content and format of lawyer advertisements.
- **attributes**: ruleNumber, ruleTitle, effectiveDate, status, sectionIdentifier
- **relations**: contains→AdvertisingRequirement, governs→Advertisement

## Advertisement
- **genus**: `cco:ont00000995`
- **definition**: A communicative record or media instance created to promote legal services, subject to regulatory compliance.
- **attributes**: adIdentifier, mediaType, publicationDate, complianceStatus, language, feeOffered, feeValidityDays
- **relations**: createdBy→Lawyer, governedBy→AdvertisingRule, mentions→LegalClaim, includes→Disclaimer

## Lawyer
- **genus**: `bfo:0000023`
- **definition**: A legal professional holding a role within The Florida Bar or providing legal services in Florida, subject to advertising regulations.
- **attributes**: barMembershipNumber, lawyerName, firmName, officeLocation, certificationStatus, isOutofState, practiceAreas
- **relations**: employs→Lawyer, creates→Advertisement, providesReferralTo→Lawyer

## Legal Claim
- **genus**: `cco:ont00000995`
- **definition**: A factual assertion or representation made within an advertisement regarding legal services, results, or qualifications.
- **attributes**: claimText, claimType, isVerifiable, isMisleading, requiresDisclaimer, disclaimerText
- **relations**: appearsIn→Advertisement, evaluatedBy→AdvertisingRule

## Disclaimer
- **genus**: `cco:ont00000995`
- **definition**: A mandatory textual or visual statement included in an advertisement to clarify context, limit liability, or identify non-lawyer participants.
- **attributes**: disclaimerText, disclaimerType, prominenceLevel, isMandatory
- **relations**: attachedTo→Advertisement, requiredBy→AdvertisingRule

## Advertising Requirement
- **genus**: `bfo:0000015`
- **definition**: A specific procedural or content obligation imposed by a regulatory rule that must be satisfied for an advertisement to be compliant.
- **attributes**: requirementText, requirementCategory, isSafeHarbor, appliesToMedia
- **relations**: specifiedIn→AdvertisingRule, appliesTo→Advertisement
