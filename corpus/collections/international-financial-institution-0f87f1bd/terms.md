# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## International Financial Institution
- **genus**: `cco:ont00000958`
- **definition**: A multilateral development institution that provides financing and policy advice for development projects, such as the World Bank Group.
- **attributes**: institutionId, name, foundingYear, governanceStructure, primaryMission
- **relations**: establishedAccountabilityMechanism→AccountabilityMechanism, financesProject→DevelopmentProject

## Accountability Mechanism
- **genus**: `bfo:0000015`
- **definition**: An independent process or body established to investigate public concerns, ensure transparency, and provide redress for impacts of development projects.
- **attributes**: mechanismId, mechanismName, establishmentYear, independenceLevel, scopeOfAuthority, currentStatus
- **relations**: belongsToInstitution→InternationalFinancialInstitution, investigatesProject→DevelopmentProject, servesAffectedCommunity→AffectedCommunity

## Development Project
- **genus**: `bfo:0000015`
- **definition**: A funded infrastructure or social initiative implemented in a developing region, subject to environmental and social safeguards.
- **attributes**: projectId, projectName, projectType, locationCountry, fundingInstitution, startDate, endDate, totalBudget
- **relations**: fundedBy→InternationalFinancialInstitution, impactsCommunity→AffectedCommunity, subjectToReview→AccountabilityMechanism

## Affected Community
- **genus**: `cco:ont00000995`
- **definition**: A local population group directly impacted by the social, environmental, or economic consequences of a development project.
- **attributes**: communityId, communityName, region, populationSize, vulnerabilityIndex, primaryLanguage
- **relations**: impactedByProject→DevelopmentProject, raisesConcernVia→AccountabilityMechanism

## Policy Reform
- **genus**: `bfo:0000015`
- **definition**: A structural or procedural change proposed or enacted to enhance transparency, accountability, or responsiveness within an international financial institution.
- **attributes**: reformId, reformTitle, proposedYear, targetMechanism, reformType, implementationStatus
- **relations**: targetsInstitution→InternationalFinancialInstitution, enhancesMechanism→AccountabilityMechanism
