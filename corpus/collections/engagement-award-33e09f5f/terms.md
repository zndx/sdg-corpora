# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Engagement Award
- **genus**: `cco:ont00000995`
- **definition**: A formal funding instrument issued by PCORI to support stakeholder engagement activities in patient-centered outcomes research.
- **attributes**: awardId, awardAmount, awardDate, awardStatus, fundingProgram, reviewOutcome
- **relations**: fundedBy→FundingAgency, awardedTo→ResearchProject, evaluatedBy→ReviewPanel

## Research Project
- **genus**: `bfo:0000015`
- **definition**: A structured investigation or development activity aimed at understanding how Patient-Family Advisory Councils engage with patient-centered outcomes research.
- **attributes**: projectId, projectTitle, startDate, endDate, projectStatus, primaryObjective, deliverableCount
- **relations**: fundedBy→EngagementAward, ledBy→ResearchLead, participatedBy→AdvisoryCouncil, produced→ResearchOutput

## Patient-Family Advisory Council
- **genus**: `bfo:0000015`
- **definition**: A formal group within a healthcare organization established to engage patients and family members as partners in quality improvement and strategic alignment.
- **attributes**: councilId, councilName, organizationId, establishmentDate, councilStatus, memberCount, meetingFrequency
- **relations**: participatedIn→ResearchProject, advises→HealthcareOrganization, uses→ResearchOutput

## Healthcare Organization
- **genus**: `bfo:0000015`
- **definition**: An institutional entity providing healthcare services and employing structures like advisory councils to improve quality and process.
- **attributes**: orgId, orgName, orgType, locationCity, locationState, foundedDate, bedCount
- **relations**: hosts→AdvisoryCouncil, receives→ResearchOutput, locatedIn→GeographicRegion

## Research Output
- **genus**: `cco:ont00000995`
- **definition**: A tangible or intangible result of research activities, such as a tool, report, or dataset, intended to inform decision-making and practice.
- **attributes**: outputId, outputType, creationDate, versionNumber, status, accessLevel
- **relations**: producedBy→ResearchProject, usedBy→AdvisoryCouncil, informs→DecisionProcess

## Funding Agency
- **genus**: `bfo:0000015`
- **definition**: An independent organization authorized to fund comparative effectiveness research and stakeholder engagement activities.
- **attributes**: agencyId, agencyName, foundingYear, agencyType, authorizationSource, headquartersCity
- **relations**: issues→EngagementAward, oversees→ReviewPanel

## Review Panel
- **genus**: `bfo:0000015`
- **definition**: A group of experts convened to assess applications for funding based on established criteria and engagement goals.
- **attributes**: panelId, panelName, reviewDate, reviewCriteria, panelStatus, memberCount
- **relations**: evaluates→EngagementAward, convenedBy→FundingAgency
