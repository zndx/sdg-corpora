# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Workplace Survey
- **genus**: `bfo:0000015`
- **definition**: A structured employee feedback survey administered by a research firm to assess organizational health and workplace culture.
- **attributes**: surveyId, administeredBy, surveyDate, totalEmployees, organizationalHealthScore, alignmentScore, executionScore, connectionScore, status
- **relations**: conductedBy→ResearchFirm, assesses→Organization, produces→WorkplaceAward

## Research Firm
- **genus**: `bfo:0000015`
- **definition**: An organization that specializes in organizational health research, employee feedback surveys, and workplace improvement consulting.
- **attributes**: firmId, firmName, headquartersLocation, foundingYear, bCorpMember, specialization, consultingServices
- **relations**: administers→WorkplaceSurvey, partnersWith→MediaPartner, providesConsultingTo→Organization

## Organization
- **genus**: `bfo:0000015`
- **definition**: A business entity that participates in workplace surveys, receives awards, and employs staff whose feedback is collected.
- **attributes**: orgId, orgName, establishedYear, industry, employeeCount, platinumMember, parentOrg, acquisitionDate
- **relations**: participatesIn→WorkplaceSurvey, receivesAward→WorkplaceAward, acquired→Organization, employs→Employee, serves→ClientSector

## Workplace Award
- **genus**: `bfo:00000995`
- **definition**: A recognition given to organizations that meet strict standards for organizational health based on employee feedback surveys.
- **attributes**: awardId, awardName, awardYear, rank, issuingBody, criteriaMet, awardDescription
- **relations**: awardedTo→Organization, basedOn→WorkplaceSurvey, issuedBy→MediaPartner

## Media Partner
- **genus**: `bfo:00000958`
- **definition**: A media organization that partners with a research firm to conduct and publish workplace awards campaigns.
- **attributes**: partnerId, partnerName, country, prestigeLevel, campaignParticipation
- **relations**: publishes→WorkplaceAward, partnersWith→ResearchFirm, conductsCampaignIn→Country

## Employee
- **genus**: `bfo:0000015`
- **definition**: An individual who works for an organization and provides feedback in workplace surveys, contributing to organizational health assessments.
- **attributes**: employeeId, employeeName, department, yearsEmployed, feedbackSubmitted, professionalismRating, teamworkRating
- **relations**: worksFor→Organization, submitsFeedbackFor→WorkplaceSurvey, buildsRelationships→ClientSector

## Client Sector
- **genus**: `bfo:0000015`
- **definition**: A specific industry or public sector category that an organization serves through its services and implementations.
- **attributes**: sectorId, sectorName, sectorType, serviceLevel, implementationComplexity
- **relations**: servedBy→Organization, receivesServices→Employee
