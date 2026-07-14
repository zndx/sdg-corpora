# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Equity Research Report
- **genus**: `cco:ont00000995`
- **definition**: A published analytical document containing investment recommendations and financial analysis produced by the research firm.
- **attributes**: reportId, publishDate, tickerSymbol, recommendation, performanceVsIndex, isBoldCall
- **relations**: deliveredTo→ClientAccount, generatedBy→Analyst

## Client Account
- **genus**: `cco:ont00000995`
- **definition**: A registered commercial entity or individual portfolio that subscribes to the research firm's services.
- **attributes**: accountId, clientType, region, accountStatus, revenueGenerated
- **relations**: assignedTo→AccountManager, subscribesTo→ResearchReport

## Equity Research Account Manager
- **genus**: `bfo:0000023`
- **definition**: A staff member responsible for managing client relationships, driving revenue growth, and coordinating sales initiatives.
- **attributes**: managerId, employeeName, salesTarget, crmUsageLevel, complianceStatus
- **relations**: manages→ClientAccount, reportsTo→Executive, executes→SalesCampaign

## Marketing and Sales Campaign
- **genus**: `bfo:0000015`
- **definition**: A coordinated series of marketing activities such as seminars, webinars, and email initiatives designed to generate leads and revenue.
- **attributes**: campaignId, campaignType, openRate, startDate, endDate
- **relations**: targets→ClientAccount, executedBy→AccountManager

## Research Executive
- **genus**: `bfo:0000023`
- **definition**: A senior leader within the firm who sets strategic direction, reviews performance, and oversees product development.
- **attributes**: executiveId, executiveName, title, decisionAuthority
- **relations**: oversees→AccountManager, reviews→SalesReport

## Sales and Strategy Report
- **genus**: `cco:ont00000995`
- **definition**: A documented record of sales observations, client feedback, and strategic recommendations submitted to executive leadership.
- **attributes**: reportId, submissionDate, observationType, priorityLevel, isActionable
- **relations**: submittedBy→AccountManager, reviewedBy→Executive
