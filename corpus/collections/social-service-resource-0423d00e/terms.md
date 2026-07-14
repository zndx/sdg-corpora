# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Social Service Resource
- **genus**: `cco:ont00000995`
- **definition**: A made thing or record representing a community service, facility, or program designed to assist individuals and families with needs such as food, housing, childcare, and emergency shelter.
- **attributes**: resourceIdentifier, resourceName, serviceCategory, isConfidential, isFree, operatingHours
- **relations**: providesTo→Beneficiary, managedBy→ServiceOrganization, accessedVia→AccessChannel

## Service Organization
- **genus**: `cco:ont00000995`
- **definition**: A made thing or record representing an entity, such as United Way, SAMHSA, or ICE, that administers, funds, or operates social services and hotlines.
- **attributes**: organizationIdentifier, organizationName, jurisdiction, isGovernmentAgency, websiteUrl
- **relations**: operates→SocialServiceResource, operates→Hotline

## Hotline
- **genus**: `cco:ont00000995`
- **definition**: A made thing or record representing a dedicated telephonic or text-based communication channel for reporting, referral, or information regarding specific social or health issues.
- **attributes**: phoneNumber, smsKeyword, hotlineType, isAvailable24_7, isConfidential
- **relations**: operatedBy→ServiceOrganization, handlesReportFor→Incident, providesReferralFor→SocialServiceResource

## Incident
- **genus**: `bfo:0000015`
- **definition**: A process or activity representing a specific event of human trafficking, sexual assault, or substance abuse that requires reporting, investigation, or intervention.
- **attributes**: incidentIdentifier, incidentType, reportedDateTime, isConfirmed, severityLevel
- **relations**: reportedVia→Hotline, involvesVictim→Beneficiary, investigatedBy→ServiceOrganization

## Beneficiary
- **genus**: `bfo:0000002`
- **definition**: A real entity representing an individual or family receiving assistance, information, or protection from social services, hotlines, or incident interventions.
- **attributes**: beneficiaryIdentifier, primaryLanguage, immigrationStatus, needsAssistance, requiresInterpreter
- **relations**: receivesServiceFrom→SocialServiceResource, contactedByVia→Hotline, involvedIn→Incident

## Access Channel
- **genus**: `cco:ont00000995`
- **definition**: A made thing or record representing a digital or physical medium through which beneficiaries access information about or apply for social services.
- **attributes**: channelIdentifier, channelType, urlOrEndpoint, supportsMultilingual, isFree
- **relations**: providesAccessTo→SocialServiceResource, maintainedBy→ServiceOrganization
