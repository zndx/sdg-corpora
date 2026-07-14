# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Universal Periodic Review Cycle
- **genus**: `bfo:0000015`
- **definition**: A periodic assessment process conducted by the UN Human Rights Council to review the human rights records of member states.
- **attributes**: cycleId, sessionDate, reviewingState, reviewStatus, reviewOutcome
- **relations**: includesRecommendation→UPRRecommendation, conductedForState→State

## UPR Recommendation
- **genus**: `cco:ont00000995`
- **definition**: A formal suggestion or directive issued during a UPR review to improve human rights practices in a specific area.
- **attributes**: recommendationId, recommendationText, topicArea, acceptanceStatus, priorityLevel
- **relations**: issuedDuringReview→UPRReviewCycle, targetsState→State, addressesVulnerableGroup→VulnerableGroup

## State
- **genus**: `bfo:0000015`
- **definition**: A sovereign political entity subject to UPR review and responsible for implementing human rights obligations.
- **attributes**: stateCode, stateName, governmentType, hrcMembershipStatus, lastReviewDate
- **relations**: undergoesReview→UPRReviewCycle, implementsRecommendation→UPRRecommendation, hasVulnerablePopulation→VulnerableGroup

## Vulnerable Group
- **genus**: `bfo:0000004`
- **definition**: A demographic population facing systemic discrimination or barriers to rights realization, such as indigenous children or girls.
- **attributes**: groupIdentifier, groupName, riskCategory, geographicDistribution, populationSize
- **relations**: affectedByRecommendation→UPRRecommendation, residesInState→State, experiencesBarrier→RightsBarrier

## Rights Barrier
- **genus**: `bfo:0000015`
- **definition**: A systemic obstacle preventing a vulnerable group from accessing or exercising their fundamental rights, such as discrimination or funding disparities.
- **attributes**: barrierId, barrierType, severityLevel, documentedEvidence, mitigationStatus
- **relations**: impactsGroup→VulnerableGroup, addressedByRecommendation→UPRRecommendation, occursInState→State

## NGO Coalition
- **genus**: `cco:ont00000995`
- **definition**: A formal alliance of non-governmental organizations submitting joint statements or recommendations during UPR processes.
- **attributes**: coalitionId, coalitionName, submissionDate, submissionType, signatoryCount
- **relations**: submitsToReview→UPRReviewCycle, includesMemberOrg→NGOMember, addressesTopic→UPRRecommendation

## NGO Member
- **genus**: `cco:ont00000995`
- **definition**: An individual non-governmental organization that is part of a coalition submitting UPR recommendations.
- **attributes**: orgId, orgName, orgType, focusArea, registrationCountry
- **relations**: memberOfCoalition→NGOCoalition, submitsRecommendation→UPRRecommendation, operatesInState→State
