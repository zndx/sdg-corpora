# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Client
- **genus**: `bfo:0000040`
- **definition**: A natural person or legal entity that holds financial accounts and receives planning services from the credit union.
- **attributes**: clientId, fullName, dateOfBirth, contactEmail, contactPhone, residentialAddress, clientStatus
- **relations**: hasAccount→FinancialAccount, hasPortfolio→InvestmentPortfolio, receivesServiceFrom→FinancialPlanner, hasReferral→Referral

## Financial Account
- **genus**: `bfo:0000040`
- **definition**: A formal record of a monetary relationship between the credit union and a client, encompassing deposits, loans, or investment holdings.
- **attributes**: accountNumber, accountType, openDate, currentBalance, currencyCode, accountStatus, lastStatementDate
- **relations**: belongsToOneClient→Client, holdsAsset→FinancialAsset, isManagedBy→FinancialPlanner

## Investment Portfolio
- **genus**: `bfo:0000040`
- **definition**: A collection of financial assets held by a client for the purpose of wealth management and financial planning.
- **attributes**: portfolioId, riskProfile, totalValue, currencyCode, lastRebalanceDate, portfolioStatus
- **relations**: ownedByClient→Client, containsAsset→FinancialAsset, plannedBy→FinancialPlanner

## Financial Asset
- **genus**: `bfo:0000040`
- **definition**: A tangible or intangible item of economic value owned by the credit union or its clients, such as stocks, bonds, or mutual funds.
- **attributes**: assetId, tickerSymbol, assetType, currentMarketValue, purchaseDate, purchasePrice, quantity, assetStatus
- **relations**: heldInPortfolio→InvestmentPortfolio, tradedInTransaction→TradeTransaction

## Trade Transaction
- **genus**: `bfo:0000015`
- **definition**: A discrete financial event involving the buying or selling of a financial asset, executed through the credit union's systems.
- **attributes**: transactionId, transactionDate, transactionType, amount, currencyCode, executionStatus, settlementDate
- **relations**: affectsAsset→FinancialAsset, linkedToAccount→FinancialAccount, initiatedByClient→Client, processedByAssistant→FinancialPlanningAssistant

## Financial Planning Assistant
- **genus**: `bfo:0000002`
- **definition**: A staff member responsible for supporting financial planners, managing client inquiries, processing transactions, and maintaining compliance records.
- **attributes**: employeeId, fullName, licenseStatus, licenseExpiryDate, officeLocation, employmentStatus, yearsExperience
- **relations**: supportsPlanner→FinancialPlanner, processesTransaction→TradeTransaction, servesClient→Client, filesComplianceRecord→ComplianceRecord

## Financial Planner
- **genus**: `bfo:0000002`
- **definition**: A licensed professional who provides strategic financial advice, develops investment strategies, and manages complex client relationships.
- **attributes**: plannerId, fullName, licenseNumber, specialization, yearsExperience, employmentStatus
- **relations**: managesPortfolio→InvestmentPortfolio, advisesClient→Client, supervisedByAssistant→FinancialPlanningAssistant, filesComplianceRecord→ComplianceRecord

## Compliance Record
- **genus**: `bfo:0000040`
- **definition**: A documented artifact required by regulatory authorities to verify adherence to financial industry standards, training, and licensing.
- **attributes**: recordId, recordType, issueDate, expiryDate, issuingAuthority, verificationStatus, documentUrl
- **relations**: belongsToOnePlanner→FinancialPlanner, belongsToOneAssistant→FinancialPlanningAssistant, relatedToTransaction→TradeTransaction
