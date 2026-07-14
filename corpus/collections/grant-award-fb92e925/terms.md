# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Grant Award
- **genus**: `cco:ont00000995`
- **definition**: A formal monetary award given to an organization to fund a specific sustainability project.
- **attributes**: grantAmount, grantCurrency, awardDate, grantProgramName, grantStatus, grantReferenceId
- **relations**: awardedTo→CommunityOrganization, fundedBy→CorporateSponsor, fundsProject→SustainabilityProject

## Sustainability Project
- **genus**: `bfo:0000015`
- **definition**: A planned initiative to implement environmental improvements, such as water conservation infrastructure.
- **attributes**: projectName, projectDescription, projectStatus, startDate, endDate, projectLocation
- **relations**: locatedAt→Facility, implementedBy→CommunityOrganization, usesInfrastructure→WaterHarvestingSystem

## Water Harvesting System
- **genus**: `cco:ont00000995`
- **definition**: A physical infrastructure component designed to capture, store, and utilize rainwater.
- **attributes**: systemType, capacityLiters, installationDate, materialType, systemStatus, manufacturer
- **relations**: installedAt→Facility, suppliedBy→CorporateSponsor, connectedTo→WaterUtility

## Facility
- **genus**: `bfo:0000004`
- **definition**: A physical location or building where organizational activities take place.
- **attributes**: facilityName, facilityAddress, facilityType, constructionYear, roofCompletionDate, facilityStatus
- **relations**: managedBy→CommunityOrganization, contains→WaterHarvestingSystem, locatedIn→Municipality

## Community Organization
- **genus**: `bfo:0000040`
- **definition**: A non-profit group or association dedicated to social or environmental causes.
- **attributes**: organizationName, organizationType, registrationNumber, foundingDate, membershipCount, organizationStatus
- **relations**: manages→Facility, receivesGrant→GrantAward, implements→SustainabilityProject

## Corporate Sponsor
- **genus**: `bfo:0000040`
- **definition**: A business entity providing financial or material support for community projects.
- **attributes**: companyName, companyType, headquartersLocation, industrySector, sponsorshipProgramName, totalFundingDistributed
- **relations**: awards→GrantAward, supplies→WaterHarvestingSystem, partnersWith→CommunityOrganization

## Municipality
- **genus**: `bfo:0000004`
- **definition**: A geographic administrative division or local government area.
- **attributes**: municipalityName, municipalityCode, stateProvince, country, population, areaSqKm
- **relations**: contains→Facility, regulates→WaterUtility
