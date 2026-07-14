# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Financial Crisis
- **genus**: `bfo:0000015`
- **definition**: A systemic failure in the financial system characterized by widespread insolvency, liquidity shortages, and loss of confidence among financial institutions.
- **attributes**: startDate, endDate, severityIndex, affectedRegions, primaryTrigger
- **relations**: causedBy→EconomicCondition, triggeredByBy→PolicyDecision, resolvedBy→BailoutProgram

## Economic Condition
- **genus**: `bfo:0000015`
- **definition**: A measurable state of the macroeconomy, such as inequality, debt levels, or income stagnation, that contributes to systemic risk.
- **attributes**: conditionType, measurementValue, measurementUnit, geographicScope, timePeriod
- **relations**: contributesTo→FinancialCrisis, measuredIn→EconomicIndicator

## Bailout Program
- **genus**: `bfo:0000015`
- **definition**: A government intervention program designed to rescue failing financial institutions or stabilize the financial system during a crisis.
- **attributes**: programName, startDate, endDate, totalCost, currency, status
- **relations**: executedBy→GovernmentAgency, targets→FinancialInstitution, partOf→FinancialCrisis

## Government Agency
- **genus**: `bfo:00000995`
- **definition**: A public institution responsible for implementing monetary policy, regulating financial markets, or executing fiscal interventions.
- **attributes**: agencyName, jurisdiction, establishedDate, agencyType, legalAuthority
- **relations**: executes→BailoutProgram, regulates→FinancialInstitution, implementsPolicy→PolicyDecision

## Financial Institution
- **genus**: `bfo:00000995`
- **definition**: An entity engaged in financial activities such as banking, lending, or investment management, which may be subject to regulatory oversight and government bailouts.
- **attributes**: institutionName, institutionType, assetSize, currency, riskRating, isSystemicallyImportant
- **relations**: receivesFundingFrom→BailoutProgram, isRegulatedBy→GovernmentAgency, holdsDebtFrom→EconomicCondition

## Policy Decision
- **genus**: `bfo:0000015`
- **definition**: A formal action or regulation enacted by a government body that influences economic or financial conditions, such as deregulation or fiscal tightening.
- **attributes**: decisionTitle, effectiveDate, decisionType, issuingAuthority, legalBasis
- **relations**: influences→EconomicCondition, implementedBy→GovernmentAgency, contributesTo→FinancialCrisis
