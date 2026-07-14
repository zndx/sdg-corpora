# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Economic Recession
- **genus**: `bfo:0000015`
- **definition**: A period of significant economic decline characterized by rising unemployment and falling household incomes.
- **attributes**: startDate, endDate, peakUnemploymentRate, affectedStates, severityLevel
- **relations**: impacted→ChildPovertyMeasure, caused→HouseholdIncomeChange

## Child Poverty Measure
- **genus**: `cco:ont00000995`
- **definition**: A quantitative assessment of child poverty levels based on household income relative to a defined poverty threshold.
- **attributes**: measureType, povertyRate, year, stateCode, householdIncomePercentile
- **relations**: measuredDuring→EconomicRecession, appliedTo→Household

## Household
- **genus**: `bfo:0000017`
- **definition**: A group of individuals living together and sharing income, expenses, and resources.
- **attributes**: householdId, totalMembers, childCount, immigrantStatus, incomeLevel
- **relations**: experienced→HouseholdIncomeChange, subjectTo→SafetyNetProgram

## Safety Net Program
- **genus**: `cco:ont00000958`
- **definition**: A government or private program designed to provide financial or in-kind assistance to vulnerable populations.
- **attributes**: programName, programType, eligibilityCriteria, fundingSource
- **relations**: benefits→Household, mitigates→ChildPovertyMeasure

## Household Income Change
- **genus**: `bfo:0000015`
- **definition**: A measurable change in household income resulting from economic conditions or safety net interventions.
- **attributes**: changePercentage, direction, cause, measurementPeriod
- **relations**: resultedFrom→EconomicRecession, affected→Household
