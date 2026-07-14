# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Regulatory Advisory Question
- **genus**: `cco:ont00000958`
- **definition**: A formal inquiry posed by a regulatory commission to an expert advisor regarding financial modeling assumptions and regulatory methodology.
- **attributes**: questionId, questionText, paraphrased, askedDate, respondedInReportParagraph
- **relations**: respondedBy→ExpertAdvisoryReport, addressedBy→FinancialModelingAssumption

## Expert Advisory Report
- **genus**: `cco:ont00000958`
- **definition**: A formal document containing expert analysis and responses to specific regulatory inquiries regarding financial and regulatory parameters.
- **attributes**: reportId, authorName, publicationDate, reportTitle, commissionName
- **relations**: containsResponseTo→RegulatoryAdvisoryQuestion, discusses→FinancialModelingAssumption

## Financial Modeling Assumption
- **genus**: `cco:ont00000995`
- **definition**: A specific parameter, rate, or methodological choice used in financial calculations for regulatory cost of capital and risk assessment.
- **attributes**: assumptionId, assumptionType, parameterName, valueRangeLowerBound, valueRangeUpperBound, isBenchmark, status
- **relations**: usedInCalculationOf→CostOfCapital, referencedBy→RegulatoryAdvisoryQuestion

## Cost of Capital
- **genus**: `bfo:0000015`
- **definition**: A calculated financial metric representing the opportunity cost of funding, used to discount future cash flows or losses in regulatory contexts.
- **attributes**: costId, calculationDate, discountRate, riskFreeRate, betaEstimate, methodology
- **relations**: usesAssumption→FinancialModelingAssumption, appliedTo→InvestmentProject

## Investment Project
- **genus**: `cco:ont00000995`
- **definition**: A specific infrastructure or capital investment initiative funded by a provider, subject to regulatory cost of capital calculations.
- **attributes**: projectId, providerName, fundingSource, totalValue, implementationStatus, riskCategory
- **relations**: fundedBy→CostOfCapital, subjectTo→RegulatoryAdvisoryQuestion
