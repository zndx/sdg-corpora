# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Client Engagement
- **genus**: `bfo:0000015`
- **definition**: A business accounting consultancy engagement where financial services are provided to a specific client organization over a defined period.
- **attributes**: engagementId, clientName, industrySector, startDate, endDate, status
- **relations**: assignedTo→FinancialController, reportsTo→ManagementAccount, manages→ComplianceTask

## Financial Controller
- **genus**: `bfo:0000015`
- **definition**: A senior accounting professional responsible for managing a portfolio of client engagements, overseeing financial reporting, and ensuring compliance.
- **attributes**: controllerId, fullName, qualificationStatus, employmentType, daysPerWeek, baseLocation, hasDriverLicense
- **relations**: manages→ClientEngagement, supervises→JuniorAccountant, performs→FinancialAnalysis

## Management Account
- **genus**: `cco:ont00000995`
- **definition**: A periodic financial report (typically monthly) detailing a client's financial performance, including profit and loss and balance sheet summaries.
- **attributes**: accountId, reportingPeriod, totalRevenue, totalExpenses, netProfit, status, reviewDate
- **relations**: belongsToMany→ClientEngagement, preparedBy→FinancialController, includes→BalanceSheetValidation

## Compliance Task
- **genus**: `bfo:0000015`
- **definition**: A specific regulatory or statutory obligation managed for a client, such as VAT, Corporation Tax, PAYE, or statutory accounts preparation.
- **attributes**: taskId, taskType, dueDate, filingDeadline, status, externalAdvisorId
- **relations**: assignedTo→FinancialController, linkedTo→ClientEngagement, supports→ManagementAccount

## Financial Forecast
- **genus**: `cco:ont00000995`
- **definition**: A projection of future financial performance, including profit and cash-flow forecasts, used for strategic planning and client advisory.
- **attributes**: forecastId, forecastType, projectionPeriod, projectedRevenue, projectedExpenses, projectedNetCash, confidenceLevel
- **relations**: createdFor→ClientEngagement, preparedBy→FinancialController, informs→ManagementAccount

## Junior Accountant
- **genus**: `bfo:0000015`
- **definition**: A trainee or junior accounting professional who supports senior controllers in delivering accounting services and learning technical skills.
- **attributes**: accountantId, fullName, qualificationLevel, specialization, hoursAllocated
- **relations**: supervisedBy→FinancialController, worksOn→ClientEngagement, contributesTo→ManagementAccount
