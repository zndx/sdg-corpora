# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Workplace Award
- **genus**: `bfo:0000015`
- **definition**: A recognition event where an organization is ranked among top employers based on employee feedback surveys.
- **attributes**: awardId, awardYear, rank, category, issuingOrganization, surveyMethodology, isRepeatWinner
- **relations**: awardedTo→Organization, basedOnSurvey→EmployeeFeedbackSurvey, publishedBy→MediaOutlet

## Employee Feedback Survey
- **genus**: `bfo:0000015`
- **definition**: A structured questionnaire administered to employees to measure organizational health and workplace culture.
- **attributes**: surveyId, administeredBy, numberOfEmployees, numberOfOrganizations, measurementAspects, surveyDate, responseRate
- **relations**: measures→WorkplaceCultureDimension, conductedFor→Organization, usedInAward→WorkplaceAward

## Workplace Culture Dimension
- **genus**: `bfo:00000995`
- **definition**: A specific aspect of organizational culture measured in employee feedback surveys.
- **attributes**: dimensionId, dimensionName, description, measurementScale, isCoreMetric
- **relations**: measuredBy→EmployeeFeedbackSurvey, contributesTo→OrganizationalHealth

## Organizational Health
- **genus**: `bfo:0000015`
- **definition**: A composite measure of an organization's internal effectiveness and employee well-being.
- **attributes**: healthId, organizationId, healthScore, assessmentDate, healthStatus, improvementAreas
- **relations**: assessedFor→Organization, influencedBy→WorkplaceCultureDimension, evaluatedIn→WorkplaceAward

## Organization
- **genus**: `bfo:0000040`
- **definition**: A structured entity such as a corporation, non-profit, or government agency engaged in business or service activities.
- **attributes**: orgId, orgName, foundingYear, headquartersLocation, industrySector, membershipLevel, isBCorp
- **relations**: receivedAward→WorkplaceAward, participatedInSurvey→EmployeeFeedbackSurvey, hasHealthRecord→OrganizationalHealth, partneredWith→PartnerOrganization

## Partner Organization
- **genus**: `bfo:0000040`
- **definition**: An external entity that has a formal partnership or membership relationship with another organization.
- **attributes**: partnerId, partnerName, partnershipType, membershipLevel, startDate
- **relations**: partnersWith→Organization, providesServiceTo→IndustrySector

## Industry Sector
- **genus**: `bfo:0000002`
- **definition**: A category of economic activity or business domain served by an organization.
- **attributes**: sectorId, sectorName, description, isPublicSector
- **relations**: servedBy→Organization, targetedBy→PartnerOrganization
