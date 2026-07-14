# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Organization
- **genus**: `bfo:0000040`
- **definition**: A legally recognized entity, such as a nonprofit, fraternal, religious, or veterans organization, authorized to conduct lawful gambling activities.
- **attributes**: organizationId, organizationName, registrationStatus, organizationType, contactPhoneNumber, websiteUrl
- **relations**: conducts→GamblingActivity, registeredWith→GovernmentAgency

## Gambling Activity
- **genus**: `bfo:0000015`
- **definition**: A structured process or event involving chance and consideration, such as a raffle, drawing, pull-tab, bingo, or paddlewheel, regulated under state law.
- **attributes**: activityId, activityName, isConsiderationRequired, legalStatus, startDate, endDate
- **relations**: conductedBy→Organization, generatesFunds→GamblingFund, regulatedBy→RegulatoryStatute

## Gambling Fund
- **genus**: `bfo:0000040`
- **definition**: Monetary proceeds or assets derived from lawful gambling activities, subject to legal restrictions on their use.
- **attributes**: fundId, fundAmount, currencyCode, sourceActivityId, restrictionStatus
- **relations**: derivedFrom→GamblingActivity, allocatedTo→Campaign

## Political Campaign
- **genus**: `bfo:0000015`
- **definition**: An organized effort to influence the nomination, election, or defeat of a candidate for public office or to promote or defeat a ballot question.
- **attributes**: campaignId, campaignName, candidateName, officeSought, ballotQuestion, status
- **relations**: receivesFunds→GamblingFund, regulatedBy→RegulatoryStatute

## Regulatory Statute
- **genus**: `bfo:0000040`
- **definition**: A legal provision or code section that defines permissible activities, restrictions, and enforcement mechanisms for gambling and political financing.
- **attributes**: statuteId, statuteTitle, jurisdiction, effectiveDate, restrictionType
- **relations**: governs→GamblingActivity, governs→Campaign
