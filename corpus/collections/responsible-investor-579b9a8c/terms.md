# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Responsible Investor
- **genus**: `bfo:0000040`
- **definition**: An economic agent who incorporates ethical and environmental principles into investment decisions.
- **attributes**: investorId, name, wealth, diversificationOpportunities, motivationType, isGreenAgent
- **relations**: holdsSharesIn→Corporation, experiences→EnvironmentalExternality, influences→CorporatePolicy

## Corporation
- **genus**: `bfo:0000040`
- **definition**: A business entity whose production activities generate environmental externalities and are subject to shareholder activism.
- **attributes**: corporationId, name, industryType, environmentalPollutionLevel, corporateReputationScore, isSubjectOfDiversification, hasCleaningTechnology
- **relations**: generates→EnvironmentalExternality, isInvestedInBy→ResponsibleInvestor, adoptsPolicy→CorporatePolicy

## Environmental Externality
- **genus**: `bfo:0000002`
- **definition**: A negative side effect of corporate production, such as pollution, that impacts social welfare and investor utility.
- **attributes**: externalityId, pollutionSize, abatementCost, impactOnUtility, isInternalized
- **relations**: isGeneratedBy→Corporation, isMitigatedBy→CorporatePolicy

## Corporate Policy
- **genus**: `bfo:0000015`
- **definition**: A strategic decision or operational standard adopted by a corporation, such as environmental standards or production modernization.
- **attributes**: policyId, policyType, implementationDate, isEthical, targetPollutionReduction
- **relations**: isAdoptedBy→Corporation, mitigates→EnvironmentalExternality, isInfluencedBy→ResponsibleInvestor

## Responsible Investment Fund
- **genus**: `bfo:0000040`
- **definition**: A financial vehicle that pools capital from responsible investors to execute socially responsible investing strategies.
- **attributes**: fundId, fundName, jurisdiction, totalAssets, isEmpiricallyAnalyzed, focusRegion
- **relations**: investsIn→Corporation, isManagedBy→ResponsibleInvestor, isAnalyzedIn→EmpiricalStudy

## Empirical Study
- **genus**: `bfo:0000015`
- **definition**: A research activity involving the analysis of data to test theoretical models or provide recommendations for ethical economy implementation.
- **attributes**: studyId, studyTitle, region, dataSource, isTheoreticalModel, hasRecommendations
- **relations**: analyzes→ResponsibleInvestmentFund, models→EnvironmentalExternality, informs→CorporatePolicy
