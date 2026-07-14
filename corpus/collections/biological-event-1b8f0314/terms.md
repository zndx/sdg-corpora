# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Biological Event
- **genus**: `bfo:0000015`
- **definition**: A process involving the emergence, spread, or impact of a biological agent on human health, economies, or security.
- **attributes**: eventIdentifier, pathogenName, infectionCount, mortalityCount, economicLossUSD, onsetDate, status
- **relations**: investigatedBy→JointAssessmentMechanism, triggeredBy→BioscienceAdvancement, fundedBy→CatalyticFinancingMechanism

## Bioscience Advancement
- **genus**: `bfo:0000015`
- **definition**: A technological or methodological progress in bioscience and biotechnology that enables new capabilities in reading, writing, or editing genetic material.
- **attributes**: advancementID, technologyType, riskLevel, implementationDate, dualUsePotential, technicalBarrierLevel
- **relations**: increasesRiskOf→BiologicalEvent, developedBy→ResearchFacility, regulatedBy→BiosecurityNorm

## Research Facility
- **genus**: `cco:ont00000995`
- **definition**: A physical or virtual location where bioscience and biotechnology research is conducted, including labs handling high-consequence pathogens.
- **attributes**: facilityID, facilityName, locationCountry, biosafetyLevel, operationalStatus, lastInspectionDate, accidentRate
- **relations**: conductsResearchOn→BioscienceAdvancement, storesPathogens→BiologicalAgent, subjectTo→BiosecurityNorm

## Biosecurity Norm
- **genus**: `cco:ont00000958`
- **definition**: A formal or informal rule, standard, or guideline established to prevent the deliberate abuse or accidental misuse of bioscience and biotechnology.
- **attributes**: normID, normName, issuingBody, effectiveDate, enforcementLevel, complianceRate
- **relations**: regulates→ResearchFacility, mitigatesRiskOf→BiologicalEvent, supportedBy→CatalyticFinancingMechanism

## Joint Assessment Mechanism
- **genus**: `bfo:0000015`
- **definition**: A UN-system capability for investigating high-consequence biological events of unknown origin to rapidly discern their source.
- **attributes**: mechanismID, mechanismName, activationDate, investigationOutcome, resourcesAllocated, participatingAgencies
- **relations**: investigates→BiologicalEvent, fundedBy→CatalyticFinancingMechanism, operatedBy→ResearchFacility

## Catalytic Financing Mechanism
- **genus**: `cco:ont00000995`
- **definition**: A funding instrument designed to finance biosecurity and pandemic preparedness capacity building in countries worldwide.
- **attributes**: mechanismID, mechanismName, totalFundingUSD, fundingStatus, targetCountries, disbursementDate
- **relations**: funds→JointAssessmentMechanism, supports→BiosecurityNorm, targets→ResearchFacility
