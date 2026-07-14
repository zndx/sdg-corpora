## Financial Services Data Architecture

A modern financial services organization manages a complex ecosystem of client relationships, account structures, investment holdings, and transactional activity. At the core of this ecosystem are individual clients whose identities, contact information, and engagement status form the foundation of every subsequent operation. Each client maintains one or more financial accounts, holds positions within investment portfolios, and participates in trade transactions that move assets across those accounts. Financial planners oversee these relationships, supported by planning assistants who facilitate execution, while compliance records ensure every interaction meets regulatory standards. The data model captures this entire lifecycle through a set of interconnected tables and derived views that answer specific operational questions about how clients, accounts, assets, and personnel relate to one another.

**Table `Client`**

| id | clientId | fullName | dateOfBirth | contactEmail | contactPhone | residentialAddress | clientStatus | accountId | portfolioId | plannerId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Erin Olson | Theodore Mcgrath | 2025-04-02 | Christopher Wilson | Joe Tsai | compact-resident-62 | active | 100 | 1 | 1 |
| 1001 | Jorge Sullivan | Account Name | 2022-09-13 | Charles Larsen | Stephanie Collins | composite-resident-63 | inactive | 101 | 2 | 2 |
| 1002 | Kimberly Maynard | Saipan International Airport | 2023-02-24 | Mary Alvarez | Tasha Rodriguez | primary-resident-64 | pending | 102 | 3 | 3 |
| 1003 | Michelle Kelley | Norma Fisher | 2024-07-08 | April Snyder | Walter Pratt | adaptive-resident-65 | closed | 103 | 4 | 4 |

The Client table stores the primary identity records for every individual or entity served by the organization. Each row carries a unique identifier, a full name, a date of birth, and contact details including email and phone number. The residential address field uses coded location identifiers such as `compact-resident-62` and `adaptive-resident-65`. Client status tracks the engagement lifecycle with values like `active`, `inactive`, `pending`, and `closed`. For example, Theodore Mcgrath (client ID 1000) is an active client whose account, portfolio, and planner assignments all reference identifier 1, while Michelle Kelley (client ID 1003) holds a closed status, indicating a terminated relationship. The table also embeds foreign-key references to the client's primary financial account, investment portfolio, and assigned financial planner, establishing the first layer of relational structure.

**Table `FinancialAccount`**

| id | accountNumber | accountType | openDate | currentBalance | currencyCode | accountStatus | lastStatementDate | clientId | assetId | plannerId |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | ACC-2253 | checking | 2025-08-07 | 1,387 | gd_fp_eu_acc3 | active | 2025-12-06 | 1000 | 1 | 1 |
| 101 | ACC-2256 | savings | 2022-01-18 | 1,867 | managing-resources | frozen | 2022-05-17 | 1001 | 2 | 2 |
| 102 | ACC-2259 | investment | 2023-06-02 | 65.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | closed | 2023-10-01 | 1002 | 3 | 3 |
| 103 | ACC-2262 | loan | 2024-11-13 | 2,453 | 10445649 | overdrawn | 2024-03-12 | 1003 | 4 | 4 |

Financial accounts represent the operational containers through which clients hold cash, extend credit, or manage liquidity. Each account is identified by a human-readable account number such as `ACC-2253` or `ACC-2262`, and classified by type: `checking`, `savings`, `investment`, or `loan`. The open date records when the account was established, while the current balance reflects the present monetary position — values range from a modest 65.72 on an investment account to 2,453 on a loan account. Currency codes vary across accounts, including identifiers like `gd_fp_eu_acc3` and `managing-resources`. Account status captures the operational state: `active`, `frozen`, `closed`, or `overdrawn`. The last statement date provides an audit trail of the most recent account summary. Each account row links back to its owning client, the associated financial asset, and the financial planner responsible for oversight.

**Table `InvestmentPortfolio`**

| id | portfolioId | riskProfile | totalValue | currencyCode | lastRebalanceDate | portfolioStatus | clientId | assetId | plannerId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | coms1 | conservative | 9.45 | gd_fp_eu_acc3 | 2025-12-23 | active | 1000 | 1 | 1 |
| 2 | 89121 | moderate | 12.90 | managing-resources | 2022-05-07 | on_hold | 1001 | 2 | 2 |
| 3 | Salangin | aggressive | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-18 | liquidating | 1002 | 3 | 3 |
| 4 | 4463650 | balanced | 19.80 | 10445649 | 2024-03-02 | active | 1003 | 4 | 4 |

Investment portfolios aggregate a client's securities and asset holdings under a unified risk framework. Each portfolio carries a portfolio identifier, a risk profile classification, and a total value that reflects the aggregate market position. Risk profiles span the spectrum from `conservative` to `moderate`, `aggressive`, and `balanced`, with corresponding total values ranging from 9.45 to 19.80. The currency code field mirrors the account-level currency identifiers, and the last rebalance date records the most recent portfolio adjustment. Portfolio status indicates the current operational posture: `active`, `on_hold`, `liquidating`, or `closed`. Portfolio 1, assigned to client 1000, carries a conservative profile with a total value of 9.45 and an active status, while portfolio 3, linked to client 1002, is classified as aggressive and currently liquidating. Like accounts, portfolios reference their owning client, the primary asset held, and the supervising planner.

**Table `FinancialAsset`**

| id | assetId | tickerSymbol | assetType | currentMarketValue | purchaseDate | purchasePrice | quantity | assetStatus | portfolioId | transactionId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 7731874 | composite-ticker-63 | equity | 17.45 | 2022-01-07 | 14.31 | 9 | held | 1 | 1 |
| 2 | 6564392 | primary-ticker-64 | bond | 19.90 | 2023-06-18 | 18.59 | 8 | sold | 2 | 2 |
| 3 | 5917296 | adaptive-ticker-65 | mutual_fund | 22.35 | 2024-11-02 | 13.13 | 0 | dividend_pending | 3 | 3 |
| 4 | 990e161e10664c5885182d95dc07e606 | distributed-ticker-66 | etf | 24.80 | 2025-04-13 | 43.25 | 12 | held | 4 | 4 |

Financial assets represent the individual securities and investment instruments held within portfolios. Each asset is identified by a unique asset ID and a ticker symbol such as `composite-ticker-63` or `distributed-ticker-66`. Asset types include `equity`, `bond`, `mutual_fund`, and `etf`, each with a current market value, a purchase date, a purchase price, and a quantity held. The asset status field tracks the lifecycle position of each holding: `held`, `sold`, `dividend_pending`, or `closed`. For instance, asset 1 is an equity position with a market value of 17.45, purchased at 14.31, with 9 units currently held. Asset 3, a mutual fund, shows a quantity of 0 and a status of `dividend_pending`, indicating a distribution event awaiting processing. Each asset row connects to its parent portfolio and the trade transaction that initiated or modified the position.

**Table `TradeTransaction`**

| transactionId | transactionDate | transactionType | amount | currencyCode | executionStatus | settlementDate | assetId | accountId | clientId | assistantId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2023-02-25T01:39:00 | buy | 13.49 | gd_fp_eu_acc3 | pending | 2025-12-22 | 1 | 100 | 1000 | 1 |
| 2 | 2024-07-09T08:56:00 | sell | 25.47 | managing-resources | executed | 2022-05-06 | 2 | 101 | 1001 | 2 |
| 3 | 2025-12-20T15:13:00 | dividend | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | failed | 2023-10-17 | 3 | 102 | 1002 | 3 |
| 4 | 2022-05-04T22:30:00 | transfer | 12.74 | 10445649 | reversed | 2024-03-01 | 4 | 103 | 1003 | 4 |

Trade transactions record every movement of value across the financial ecosystem. Each transaction carries a unique transaction ID, a timestamp, and a type classification: `buy`, `sell`, `dividend`, or `transfer`. The amount field captures the monetary value of the transaction, ranging from 12.74 to 25.47 across the sample data. Execution status tracks the lifecycle of each trade: `pending`, `executed`, `failed`, or `reversed`. The settlement date records when the transaction is expected to finalize. Each transaction links to the underlying asset, the financial account through which it was processed, the client who initiated it, and the planning assistant who facilitated it. Transaction 1, for example, is a pending buy order for 13.49 that references asset 1, account 100, client 1000, and assistant 1.

**Table `FinancialPlanningAssistant`**

| id | employeeId | fullName | licenseStatus | licenseExpiryDate | officeLocation | employmentStatus | yearsExperience | plannerId | transactionId | clientId | recordId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | licensed | 2023-10-06 | composite-office-99 | active | 16 | 1 | 1 | 1000 | 10449530 |
| 2 | Tasha Rodriguez | Account Name | in_training | 2024-03-17 | primary-office-100 | on_leave | 22 | 2 | 2 | 1001 | 10445619 |
| 3 | Theodore Mcgrath | Saipan International Airport | expired | 2025-08-01 | adaptive-office-101 | terminated | 28 | 3 | 3 | 1002 | 9568457 |
| 4 | Peter Mcdowell | Norma Fisher | licensed | 2022-01-12 | distributed-office-102 | active | 34 | 4 | 4 | 1003 | 20743593 |

Financial planning assistants serve as the operational support layer within the organization. Each assistant record includes an employee identifier, a full name, a license status (`licensed`, `in_training`, `expired`), and a license expiry date. Office locations are coded as `composite-office-99`, `primary-office-100`, and similar identifiers. Employment status tracks the assistant's current standing: `active`, `on_leave`, or `terminated`. Years of experience range from 16 to 34, with Peter Mcdowell (employee 4) being the most experienced at 34 years. Each assistant is assigned to a supervising financial planner and may be associated with specific transactions, clients, and compliance records.

**Table `FinancialPlanner`**

| id | plannerId | fullName | licenseNumber | specialization | yearsExperience | employmentStatus | portfolioId | clientId | assistantId | recordId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | id_1 | Theodore Mcgrath | LIC-2589 | retirement | 16 | active | 1 | 1000 | 1 | 10449530 |
| 2 | 20723567 | Account Name | LIC-2596 | tax_planning | 22 | on_leave | 2 | 1001 | 2 | 10445619 |
| 3 | 9085264 | Saipan International Airport | LIC-2603 | investment | 28 | terminated | 3 | 1002 | 3 | 9568457 |
| 4 | 3158146 | Norma Fisher | LIC-2610 | estate_planning | 34 | active | 4 | 1003 | 4 | 20743593 |

Financial planners provide the strategic oversight layer, managing client relationships, approving investment strategies, and ensuring regulatory compliance. Each planner is linked to the clients they serve, the portfolios they oversee, the assistants who report to them, and the compliance records that document their regulatory standing. Planners form the central coordination point between client-facing operations and back-office compliance functions.

**Table `ComplianceRecord`**

| recordId | recordType | issueDate | expiryDate | issuingAuthority | verificationStatus | documentUrl | plannerId | assistantId | transactionId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 10449530 | training_certificate | 2023-02-01 | 2023-10-24 | extended-issuing-33 | verified | https://www.nature.com/articles/nphoton.2012.84 | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 10445619 | license_renewal | 2024-07-12 | 2024-03-08 | integrated-issuing-34 | pending_review | https://bugs.launchpad.net/nova/+bug/1246276 | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 9568457 | audit_report | 2025-12-23 | 2025-08-19 | seasonal-issuing-35 | expired | http://eol.org/pages/333309/overview | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 20743593 | client_disclosure | 2022-05-07 | 2022-01-03 | regional-issuing-36 | rejected | https://ecocyc.org/gene?orgid=ECOLI&id=G7564 | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Compliance records document regulatory adherence, audit findings, and enforcement actions. Each record is associated with a specific financial planner, a planning assistant, and the trade transactions under review. These records ensure that every transaction, portfolio adjustment, and client interaction meets the organization's regulatory obligations.

The relational structure of the data model becomes most apparent through its derived views, which join base tables to answer specific operational questions. Each view represents a particular analytical lens on the financial ecosystem.

**View `client_financial_account_view`**

```sql
CREATE VIEW client_financial_account_view AS
SELECT a.id, a.clientId, a.fullName, a.dateOfBirth, b.id AS account_id, b.accountNumber AS account_accountNumber, b.accountType AS account_accountType
FROM Client a JOIN FinancialAccount b ON a.accountId = b.id;
```

| id | clientId | fullName | dateOfBirth | account_id | account_accountNumber | account_accountType |
|---|---|---|---|---|---|---|
| 1000 | Erin Olson | Theodore Mcgrath | 2025-04-02 | 100 | ACC-2253 | checking |
| 1001 | Jorge Sullivan | Account Name | 2022-09-13 | 101 | ACC-2256 | savings |
| 1002 | Kimberly Maynard | Saipan International Airport | 2023-02-24 | 102 | ACC-2259 | investment |
| 1003 | Michelle Kelley | Norma Fisher | 2024-07-08 | 103 | ACC-2262 | loan |

This view joins the Client table with the FinancialAccount table to answer the question: which financial accounts belong to which clients? It produces a consolidated record showing the client's identity alongside their account details. For client 1000 (Theodore Mcgrath), the view reveals account `ACC-2253`, a checking account opened on 2025-08-07 with a current balance of 1,387 and an active status. For client 1003 (Michelle Kelley), the view shows account `ACC-2262`, a loan account with an overdrawn status and a balance of 2,453. This view is essential for customer service representatives who need a complete picture of a client's account holdings.

**View `client_investment_portfolio_view`**

```sql
CREATE VIEW client_investment_portfolio_view AS
SELECT a.id, a.clientId, a.fullName, a.dateOfBirth, b.id AS portfolio_id, b.portfolioId AS portfolio_portfolioId, b.riskProfile AS portfolio_riskProfile
FROM Client a JOIN InvestmentPortfolio b ON a.portfolioId = b.id;
```

| id | clientId | fullName | dateOfBirth | portfolio_id | portfolio_portfolioId | portfolio_riskProfile |
|---|---|---|---|---|---|---|
| 1000 | Erin Olson | Theodore Mcgrath | 2025-04-02 | 1 | coms1 | conservative |
| 1001 | Jorge Sullivan | Account Name | 2022-09-13 | 2 | 89121 | moderate |
| 1002 | Kimberly Maynard | Saipan International Airport | 2023-02-24 | 3 | Salangin | aggressive |
| 1003 | Michelle Kelley | Norma Fisher | 2024-07-08 | 4 | 4463650 | balanced |

By joining Client with InvestmentPortfolio, this view answers: which investment portfolios does each client hold? It combines personal identity data with portfolio-level metrics including risk profile, total value, and rebalancing history. Client 1001 (Jorge Sullivan) appears with portfolio 89121, a moderate-risk portfolio valued at 12.90 that is currently on hold. Client 1002 (Kimberly Maynard) holds portfolio Salangin, an aggressive portfolio valued at 16.35 that is in the process of liquidation. This view supports portfolio managers who need to assess the aggregate investment exposure of each client.

**View `client_financial_planner_view`**

```sql
CREATE VIEW client_financial_planner_view AS
SELECT a.id, a.clientId, a.fullName, a.dateOfBirth, b.id AS planner_id, b.plannerId AS planner_plannerId, b.fullName AS planner_fullName
FROM Client a JOIN FinancialPlanner b ON a.plannerId = b.id;
```

| id | clientId | fullName | dateOfBirth | planner_id | planner_plannerId | planner_fullName |
|---|---|---|---|---|---|---|
| 1000 | Erin Olson | Theodore Mcgrath | 2025-04-02 | 1 | id_1 | Theodore Mcgrath |
| 1001 | Jorge Sullivan | Account Name | 2022-09-13 | 2 | 20723567 | Account Name |
| 1002 | Kimberly Maynard | Saipan International Airport | 2023-02-24 | 3 | 9085264 | Saipan International Airport |
| 1003 | Michelle Kelley | Norma Fisher | 2024-07-08 | 4 | 3158146 | Norma Fisher |

This view links Client with FinancialPlanner to answer: which financial planner is assigned to which client? It produces a direct mapping of client-to-planner relationships, showing the planner's credentials and the client's engagement status. Theodore Mcgrath (client 1000) is assigned to planner 1, while Michelle Kelley (client 1003) is assigned to planner 4. This view is critical for organizational reporting and for identifying which planners carry the highest client loads.

**View `financial_account_client_view`**

```sql
CREATE VIEW financial_account_client_view AS
SELECT a.id, a.accountNumber, a.accountType, a.openDate, b.id AS client_id, b.clientId AS client_clientId, b.fullName AS client_fullName
FROM FinancialAccount a JOIN Client b ON a.clientId = b.id;
```

| id | accountNumber | accountType | openDate | client_id | client_clientId | client_fullName |
|---|---|---|---|---|---|---|
| 100 | ACC-2253 | checking | 2025-08-07 | 1000 | Erin Olson | Theodore Mcgrath |
| 101 | ACC-2256 | savings | 2022-01-18 | 1001 | Jorge Sullivan | Account Name |
| 102 | ACC-2259 | investment | 2023-06-02 | 1002 | Kimberly Maynard | Saipan International Airport |
| 103 | ACC-2262 | loan | 2024-11-13 | 1003 | Michelle Kelley | Norma Fisher |

The inverse of the client-to-account relationship, this view joins FinancialAccount with Client to answer: which client owns each financial account? It presents the account as the primary entity with client details as supporting information. Account `ACC-2253` (ID 100) is shown as belonging to client 1000 (Theodore Mcgrath), with the account type listed as checking and the status as active. Account `ACC-2256` (ID 101) belongs to client 1001 (Jorge Sullivan) and carries a frozen status. This perspective is useful for account-level operations where the account is the primary subject of inquiry.

**View `financial_account_financial_asset_view`**

```sql
CREATE VIEW financial_account_financial_asset_view AS
SELECT a.id, a.accountNumber, a.accountType, a.openDate, b.id AS asset_id, b.assetId AS asset_assetId, b.tickerSymbol AS asset_tickerSymbol
FROM FinancialAccount a JOIN FinancialAsset b ON a.assetId = b.id;
```

| id | accountNumber | accountType | openDate | asset_id | asset_assetId | asset_tickerSymbol |
|---|---|---|---|---|---|---|
| 100 | ACC-2253 | checking | 2025-08-07 | 1 | 7731874 | composite-ticker-63 |
| 101 | ACC-2256 | savings | 2022-01-18 | 2 | 6564392 | primary-ticker-64 |
| 102 | ACC-2259 | investment | 2023-06-02 | 3 | 5917296 | adaptive-ticker-65 |
| 103 | ACC-2262 | loan | 2024-11-13 | 4 | 990e161e10664c5885182d95dc07e606 | distributed-ticker-66 |

This view joins FinancialAccount with FinancialAsset to answer: which financial assets are associated with each financial account? It connects the account container with the securities it holds. Account 100 is linked to asset 1 (ticker `composite-ticker-63`), an equity position with a market value of 17.45. Account 101 is linked to asset 2 (ticker `primary-ticker-64`), a bond with a market value of 19.90. This view supports asset allocation analysis at the account level.

**View `financial_account_financial_planner_view`**

```sql
CREATE VIEW financial_account_financial_planner_view AS
SELECT a.id, a.accountNumber, a.accountType, a.openDate, b.id AS planner_id, b.plannerId AS planner_plannerId, b.fullName AS planner_fullName
FROM FinancialAccount a JOIN FinancialPlanner b ON a.plannerId = b.id;
```

| id | accountNumber | accountType | openDate | planner_id | planner_plannerId | planner_fullName |
|---|---|---|---|---|---|---|
| 100 | ACC-2253 | checking | 2025-08-07 | 1 | id_1 | Theodore Mcgrath |
| 101 | ACC-2256 | savings | 2022-01-18 | 2 | 20723567 | Account Name |
| 102 | ACC-2259 | investment | 2023-06-02 | 3 | 9085264 | Saipan International Airport |
| 103 | ACC-2262 | loan | 2024-11-13 | 4 | 3158146 | Norma Fisher |

By joining FinancialAccount with FinancialPlanner, this view answers: which financial planner oversees each financial account? It combines account-level details with planner credentials. Account `ACC-2253` (100) is overseen by planner 1, while account `ACC-2262` (103) is overseen by planner 4. This view is essential for accountability reporting and for understanding the distribution of account oversight across the planning team.

**View `investment_portfolio_client_view`**

```sql
CREATE VIEW investment_portfolio_client_view AS
SELECT a.id, a.portfolioId, a.riskProfile, a.totalValue, b.id AS client_id, b.clientId AS client_clientId, b.fullName AS client_fullName
FROM InvestmentPortfolio a JOIN Client b ON a.clientId = b.id;
```

| id | portfolioId | riskProfile | totalValue | client_id | client_clientId | client_fullName |
|---|---|---|---|---|---|---|
| 1 | coms1 | conservative | 9.45 | 1000 | Erin Olson | Theodore Mcgrath |
| 2 | 89121 | moderate | 12.90 | 1001 | Jorge Sullivan | Account Name |
| 3 | Salangin | aggressive | 16.35 | 1002 | Kimberly Maynard | Saipan International Airport |
| 4 | 4463650 | balanced | 19.80 | 1003 | Michelle Kelley | Norma Fisher |

The inverse of the portfolio-to-client relationship, this view joins InvestmentPortfolio with Client to answer: which client holds each investment portfolio? It presents the portfolio as the primary entity with client identity as context. Portfolio 1 (identifier `coms1`) is held by client 1000 (Theodore Mcgrath), carries a conservative risk profile, and has a total value of 9.45. Portfolio 4 (identifier `4463650`) is held by client 1003 (Michelle Kelley), carries a balanced risk profile, and has a total value of 19.80. This view supports portfolio-level reporting and client attribution analysis.

**View `investment_portfolio_financial_asset_view`**

```sql
CREATE VIEW investment_portfolio_financial_asset_view AS
SELECT a.id, a.portfolioId, a.riskProfile, a.totalValue, b.id AS asset_id, b.assetId AS asset_assetId, b.tickerSymbol AS asset_tickerSymbol
FROM InvestmentPortfolio a JOIN FinancialAsset b ON a.assetId = b.id;
```

| id | portfolioId | riskProfile | totalValue | asset_id | asset_assetId | asset_tickerSymbol |
|---|---|---|---|---|---|---|
| 1 | coms1 | conservative | 9.45 | 1 | 7731874 | composite-ticker-63 |
| 2 | 89121 | moderate | 12.90 | 2 | 6564392 | primary-ticker-64 |
| 3 | Salangin | aggressive | 16.35 | 3 | 5917296 | adaptive-ticker-65 |
| 4 | 4463650 | balanced | 19.80 | 4 | 990e161e10664c5885182d95dc07e606 | distributed-ticker-66 |

This view joins InvestmentPortfolio with FinancialAsset to answer: which financial assets are held within each investment portfolio? It connects the portfolio container with its constituent securities. Portfolio 1 holds asset 1 (`composite-ticker-63`), an equity with 9 units at a market value of 17.45. Portfolio 4 holds asset 4 (`distributed-ticker-66`), an ETF with 12 units at a market value of 24.80. This view is fundamental for portfolio construction analysis and concentration risk assessment.

**View `investment_portfolio_financial_planner_view`**

```sql
CREATE VIEW investment_portfolio_financial_planner_view AS
SELECT a.id, a.portfolioId, a.riskProfile, a.totalValue, b.id AS planner_id, b.plannerId AS planner_plannerId, b.fullName AS planner_fullName
FROM InvestmentPortfolio a JOIN FinancialPlanner b ON a.plannerId = b.id;
```

| id | portfolioId | riskProfile | totalValue | planner_id | planner_plannerId | planner_fullName |
|---|---|---|---|---|---|---|
| 1 | coms1 | conservative | 9.45 | 1 | id_1 | Theodore Mcgrath |
| 2 | 89121 | moderate | 12.90 | 2 | 20723567 | Account Name |
| 3 | Salangin | aggressive | 16.35 | 3 | 9085264 | Saipan International Airport |
| 4 | 4463650 | balanced | 19.80 | 4 | 3158146 | Norma Fisher |

By joining InvestmentPortfolio with FinancialPlanner, this view answers: which financial planner manages each investment portfolio? It links portfolio-level metrics with planner credentials. Portfolio 1 (conservative, value 9.45) is managed by planner 1, while portfolio 3 (aggressive, value 16.35) is managed by planner 3. This view supports performance attribution and planner workload analysis.

**View `financial_asset_investment_portfolio_view`**

```sql
CREATE VIEW financial_asset_investment_portfolio_view AS
SELECT a.id, a.assetId, a.tickerSymbol, a.assetType, b.id AS portfolio_id, b.portfolioId AS portfolio_portfolioId, b.riskProfile AS portfolio_riskProfile
FROM FinancialAsset a JOIN InvestmentPortfolio b ON a.portfolioId = b.id;
```

| id | assetId | tickerSymbol | assetType | portfolio_id | portfolio_portfolioId | portfolio_riskProfile |
|---|---|---|---|---|---|---|
| 1 | 7731874 | composite-ticker-63 | equity | 1 | coms1 | conservative |
| 2 | 6564392 | primary-ticker-64 | bond | 2 | 89121 | moderate |
| 3 | 5917296 | adaptive-ticker-65 | mutual_fund | 3 | Salangin | aggressive |
| 4 | 990e161e10664c5885182d95dc07e606 | distributed-ticker-66 | etf | 4 | 4463650 | balanced |

The inverse of the asset-to-portfolio relationship, this view joins FinancialAsset with InvestmentPortfolio to answer: which investment portfolio contains each financial asset? It presents the asset as the primary entity with portfolio context. Asset 1 (`composite-ticker-63`), an equity with a market value of 17.45, is contained within portfolio 1 (`coms1`). Asset 4 (`distributed-ticker-66`), an ETF with a market value of 24.80, is contained within portfolio 4 (`4463650`). This view is useful for asset-level reporting and cross-portfolio concentration analysis.

**View `financial_asset_trade_transaction_view`**

```sql
CREATE VIEW financial_asset_trade_transaction_view AS
SELECT a.id, a.assetId, a.tickerSymbol, a.assetType, b.transactionId AS transaction_transactionId, b.transactionDate AS transaction_transactionDate, b.transactionType AS transaction_transactionType
FROM FinancialAsset a JOIN TradeTransaction b ON a.transactionId = b.transactionId;
```

| id | assetId | tickerSymbol | assetType | transaction_transactionId | transaction_transactionDate | transaction_transactionType |
|---|---|---|---|---|---|---|
| 1 | 7731874 | composite-ticker-63 | equity | 1 | 2023-02-25T01:39:00 | buy |
| 2 | 6564392 | primary-ticker-64 | bond | 2 | 2024-07-09T08:56:00 | sell |
| 3 | 5917296 | adaptive-ticker-65 | mutual_fund | 3 | 2025-12-20T15:13:00 | dividend |
| 4 | 990e161e10664c5885182d95dc07e606 | distributed-ticker-66 | etf | 4 | 2022-05-04T22:30:00 | transfer |

This view joins FinancialAsset with TradeTransaction to answer: which trade transactions involve each financial asset? It connects the security with the transactions that created, modified, or liquidated its positions. Asset 1 is associated with transaction 1, a pending buy order for 13.49. Asset 2 is associated with transaction 2, an executed sell order for 25.47. This view supports transaction analysis at the asset level and helps identify which securities are most actively traded.

**View `trade_transaction_financial_asset_view`**

```sql
CREATE VIEW trade_transaction_financial_asset_view AS
SELECT a.transactionId, a.transactionDate, a.transactionType, a.amount, b.id AS asset_id, b.assetId AS asset_assetId, b.tickerSymbol AS asset_tickerSymbol
FROM TradeTransaction a JOIN FinancialAsset b ON a.assetId = b.id;
```

| transactionId | transactionDate | transactionType | amount | asset_id | asset_assetId | asset_tickerSymbol |
|---|---|---|---|---|---|---|
| 1 | 2023-02-25T01:39:00 | buy | 13.49 | 1 | 7731874 | composite-ticker-63 |
| 2 | 2024-07-09T08:56:00 | sell | 25.47 | 2 | 6564392 | primary-ticker-64 |
| 3 | 2025-12-20T15:13:00 | dividend | 19.72 | 3 | 5917296 | adaptive-ticker-65 |
| 4 | 2022-05-04T22:30:00 | transfer | 12.74 | 4 | 990e161e10664c5885182d95dc07e606 | distributed-ticker-66 |

The inverse of the transaction-to-asset relationship, this view joins TradeTransaction with FinancialAsset to answer: which financial asset is involved in each trade transaction? It presents the transaction as the primary entity with asset details as context. Transaction 1 (a pending buy for 13.49) involves asset 1 (`composite-ticker-63`), an equity. Transaction 3 (a failed dividend for 19.72) involves asset 3 (`adaptive-ticker-65`), a mutual fund. This view is essential for transaction reporting and settlement tracking.

**View `trade_transaction_financial_account_view`**

```sql
CREATE VIEW trade_transaction_financial_account_view AS
SELECT a.transactionId, a.transactionDate, a.transactionType, a.amount, b.id AS account_id, b.accountNumber AS account_accountNumber, b.accountType AS account_accountType
FROM TradeTransaction a JOIN FinancialAccount b ON a.accountId = b.id;
```

| transactionId | transactionDate | transactionType | amount | account_id | account_accountNumber | account_accountType |
|---|---|---|---|---|---|---|
| 1 | 2023-02-25T01:39:00 | buy | 13.49 | 100 | ACC-2253 | checking |
| 2 | 2024-07-09T08:56:00 | sell | 25.47 | 101 | ACC-2256 | savings |
| 3 | 2025-12-20T15:13:00 | dividend | 19.72 | 102 | ACC-2259 | investment |
| 4 | 2022-05-04T22:30:00 | transfer | 12.74 | 103 | ACC-2262 | loan |

By joining TradeTransaction with FinancialAccount, this view answers: which financial account processes each trade transaction? It links transaction details with the account through which the trade was executed. Transaction 1 (pending buy, 13.49) was processed through account 100 (`ACC-2253`), a checking account. Transaction 4 (reversed transfer, 12.74) was processed through account 103 (`ACC-2262`), a loan account. This view supports account-level transaction analysis and settlement reconciliation.

**View `trade_transaction_client_view`**

```sql
CREATE VIEW trade_transaction_client_view AS
SELECT a.transactionId, a.transactionDate, a.transactionType, a.amount, b.id AS client_id, b.clientId AS client_clientId, b.fullName AS client_fullName
FROM TradeTransaction a JOIN Client b ON a.clientId = b.id;
```

| transactionId | transactionDate | transactionType | amount | client_id | client_clientId | client_fullName |
|---|---|---|---|---|---|---|
| 1 | 2023-02-25T01:39:00 | buy | 13.49 | 1000 | Erin Olson | Theodore Mcgrath |
| 2 | 2024-07-09T08:56:00 | sell | 25.47 | 1001 | Jorge Sullivan | Account Name |
| 3 | 2025-12-20T15:13:00 | dividend | 19.72 | 1002 | Kimberly Maynard | Saipan International Airport |
| 4 | 2022-05-04T22:30:00 | transfer | 12.74 | 1003 | Michelle Kelley | Norma Fisher |

This view joins TradeTransaction with Client to answer: which client initiated each trade transaction? It connects transaction execution details with client identity. Transaction 1 (pending buy, 13.49) was initiated by client 1000 (Theodore Mcgrath). Transaction 3 (failed dividend, 19.72) was initiated by client 1002 (Kimberly Maynard). This view is critical for client activity reporting and for identifying which clients are most actively trading.

**View `trade_transaction_financial_planning_assistant_view`**

```sql
CREATE VIEW trade_transaction_financial_planning_assistant_view AS
SELECT a.transactionId, a.transactionDate, a.transactionType, a.amount, b.id AS assistant_id, b.employeeId AS assistant_employeeId, b.fullName AS assistant_fullName
FROM TradeTransaction a JOIN FinancialPlanningAssistant b ON a.assistantId = b.id;
```

| transactionId | transactionDate | transactionType | amount | assistant_id | assistant_employeeId | assistant_fullName |
|---|---|---|---|---|---|---|
| 1 | 2023-02-25T01:39:00 | buy | 13.49 | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | 2024-07-09T08:56:00 | sell | 25.47 | 2 | Tasha Rodriguez | Account Name |
| 3 | 2025-12-20T15:13:00 | dividend | 19.72 | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | 2022-05-04T22:30:00 | transfer | 12.74 | 4 | Peter Mcdowell | Norma Fisher |

By joining TradeTransaction with FinancialPlanningAssistant, this view answers: which planning assistant facilitated each trade transaction? It links transaction execution with the assistant who supported the trade. Transaction 1 was facilitated by assistant 1 (Norma Fisher, licensed, 16 years experience). Transaction 4 was facilitated by assistant 4 (Peter Mcdowell, licensed, 34 years experience). This view supports assistant performance analysis and workload distribution.

**View `financial_planning_assistant_financial_planner_view`**

```sql
CREATE VIEW financial_planning_assistant_financial_planner_view AS
SELECT a.id, a.employeeId, a.fullName, a.licenseStatus, b.id AS planner_id, b.plannerId AS planner_plannerId, b.fullName AS planner_fullName
FROM FinancialPlanningAssistant a JOIN FinancialPlanner b ON a.plannerId = b.id;
```

| id | employeeId | fullName | licenseStatus | planner_id | planner_plannerId | planner_fullName |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | licensed | 1 | id_1 | Theodore Mcgrath |
| 2 | Tasha Rodriguez | Account Name | in_training | 2 | 20723567 | Account Name |
| 3 | Theodore Mcgrath | Saipan International Airport | expired | 3 | 9085264 | Saipan International Airport |
| 4 | Peter Mcdowell | Norma Fisher | licensed | 4 | 3158146 | Norma Fisher |

This view joins FinancialPlanningAssistant with FinancialPlanner to answer: which financial planner supervises each planning assistant? It establishes the supervisory hierarchy within the planning organization. Assistant 1 (Norma Fisher) reports to planner 1, while assistant 4 (Peter Mcdowell) reports to planner 4. This view is essential for organizational structure reporting and for understanding the chain of responsibility within the planning team.

**View `financial_planning_assistant_trade_transaction_view`**

```sql
CREATE VIEW financial_planning_assistant_trade_transaction_view AS
SELECT a.id, a.employeeId, a.fullName, a.licenseStatus, b.transactionId AS transaction_transactionId, b.transactionDate AS transaction_transactionDate, b.transactionType AS transaction_transactionType
FROM FinancialPlanningAssistant a JOIN TradeTransaction b ON a.transactionId = b.transactionId;
```

| id | employeeId | fullName | licenseStatus | transaction_transactionId | transaction_transactionDate | transaction_transactionType |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | licensed | 1 | 2023-02-25T01:39:00 | buy |
| 2 | Tasha Rodriguez | Account Name | in_training | 2 | 2024-07-09T08:56:00 | sell |
| 3 | Theodore Mcgrath | Saipan International Airport | expired | 3 | 2025-12-20T15:13:00 | dividend |
| 4 | Peter Mcdowell | Norma Fisher | licensed | 4 | 2022-05-04T22:30:00 | transfer |

By joining FinancialPlanningAssistant with TradeTransaction, this view answers: which trade transactions were facilitated by each planning assistant? It connects assistant identity with their transactional activity. Assistant 1 facilitated transaction 1 (a pending buy for 13.49). Assistant 2 facilitated transaction 2 (an executed sell for 25.47). This view supports assistant productivity metrics and transaction volume analysis.

**View `financial_planning_assistant_client_view`**

```sql
CREATE VIEW financial_planning_assistant_client_view AS
SELECT a.id, a.employeeId, a.fullName, a.licenseStatus, b.id AS client_id, b.clientId AS client_clientId, b.fullName AS client_fullName
FROM FinancialPlanningAssistant a JOIN Client b ON a.clientId = b.id;
```

| id | employeeId | fullName | licenseStatus | client_id | client_clientId | client_fullName |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | licensed | 1000 | Erin Olson | Theodore Mcgrath |
| 2 | Tasha Rodriguez | Account Name | in_training | 1001 | Jorge Sullivan | Account Name |
| 3 | Theodore Mcgrath | Saipan International Airport | expired | 1002 | Kimberly Maynard | Saipan International Airport |
| 4 | Peter Mcdowell | Norma Fisher | licensed | 1003 | Michelle Kelley | Norma Fisher |

This view joins FinancialPlanningAssistant with Client to answer: which clients are served by each planning assistant? It links assistant identity with the clients they support. Assistant 1 serves client 1000 (Theodore Mcgrath), while assistant 4 serves client 1003 (Michelle Kelley). This view is useful for client satisfaction analysis and for understanding the distribution of client support across the assistant team.

**View `financial_planning_assistant_compliance_record_view`**

```sql
CREATE VIEW financial_planning_assistant_compliance_record_view AS
SELECT a.id, a.employeeId, a.fullName, a.licenseStatus, b.recordId AS record_recordId, b.recordType AS record_recordType, b.issueDate AS record_issueDate
FROM FinancialPlanningAssistant a JOIN ComplianceRecord b ON a.recordId = b.recordId;
```

| id | employeeId | fullName | licenseStatus | record_recordId | record_recordType | record_issueDate |
|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | licensed | 10449530 | training_certificate | 2023-02-01 |
| 2 | Tasha Rodriguez | Account Name | in_training | 10445619 | license_renewal | 2024-07-12 |
| 3 | Theodore Mcgrath | Saipan International Airport | expired | 9568457 | audit_report | 2025-12-23 |
| 4 | Peter Mcdowell | Norma Fisher | licensed | 20743593 | client_disclosure | 2022-05-07 |

By joining FinancialPlanningAssistant with ComplianceRecord, this view answers: which compliance records are associated with each planning assistant? It connects assistant identity with their regulatory standing. Assistant 1 is associated with compliance record 10449530, while assistant 2 is associated with compliance record 10445619. This view supports compliance monitoring and regulatory reporting.

**View `financial_planner_investment_portfolio_view`**

```sql
CREATE VIEW financial_planner_investment_portfolio_view AS
SELECT a.id, a.plannerId, a.fullName, a.licenseNumber, b.id AS portfolio_id, b.portfolioId AS portfolio_portfolioId, b.riskProfile AS portfolio_riskProfile
FROM FinancialPlanner a JOIN InvestmentPortfolio b ON a.portfolioId = b.id;
```

| id | plannerId | fullName | licenseNumber | portfolio_id | portfolio_portfolioId | portfolio_riskProfile |
|---|---|---|---|---|---|---|
| 1 | id_1 | Theodore Mcgrath | LIC-2589 | 1 | coms1 | conservative |
| 2 | 20723567 | Account Name | LIC-2596 | 2 | 89121 | moderate |
| 3 | 9085264 | Saipan International Airport | LIC-2603 | 3 | Salangin | aggressive |
| 4 | 3158146 | Norma Fisher | LIC-2610 | 4 | 4463650 | balanced |

This view joins FinancialPlanner with InvestmentPortfolio to answer: which investment portfolios are managed by each financial planner? It links planner credentials with the portfolios under their management. Planner 1 manages portfolio 1 (`coms1`), a conservative portfolio with a total value of 9.45. Planner 3 manages portfolio 3 (Salangin), an aggressive portfolio valued at 16.35. This view is fundamental for portfolio performance attribution and planner accountability.

**View `financial_planner_client_view`**

```sql
CREATE VIEW financial_planner_client_view AS
SELECT a.id, a.plannerId, a.fullName, a.licenseNumber, b.id AS client_id, b.clientId AS client_clientId, b.fullName AS client_fullName
FROM FinancialPlanner a JOIN Client b ON a.clientId = b.id;
```

| id | plannerId | fullName | licenseNumber | client_id | client_clientId | client_fullName |
|---|---|---|---|---|---|---|
| 1 | id_1 | Theodore Mcgrath | LIC-2589 | 1000 | Erin Olson | Theodore Mcgrath |
| 2 | 20723567 | Account Name | LIC-2596 | 1001 | Jorge Sullivan | Account Name |
| 3 | 9085264 | Saipan International Airport | LIC-2603 | 1002 | Kimberly Maynard | Saipan International Airport |
| 4 | 3158146 | Norma Fisher | LIC-2610 | 1003 | Michelle Kelley | Norma Fisher |

By joining FinancialPlanner with Client, this view answers: which clients are served by each financial planner? It establishes the client-to-planner assignment at the planner level. Planner 1 serves client 1000 (Theodore Mcgrath), while planner 4 serves client 1003 (Michelle Kelley). This view supports client load balancing and planner capacity planning.

**View `financial_planner_financial_planning_assistant_view`**

```sql
CREATE VIEW financial_planner_financial_planning_assistant_view AS
SELECT a.id, a.plannerId, a.fullName, a.licenseNumber, b.id AS assistant_id, b.employeeId AS assistant_employeeId, b.fullName AS assistant_fullName
FROM FinancialPlanner a JOIN FinancialPlanningAssistant b ON a.assistantId = b.id;
```

| id | plannerId | fullName | licenseNumber | assistant_id | assistant_employeeId | assistant_fullName |
|---|---|---|---|---|---|---|
| 1 | id_1 | Theodore Mcgrath | LIC-2589 | 1 | Norma Fisher | Theodore Mcgrath |
| 2 | 20723567 | Account Name | LIC-2596 | 2 | Tasha Rodriguez | Account Name |
| 3 | 9085264 | Saipan International Airport | LIC-2603 | 3 | Theodore Mcgrath | Saipan International Airport |
| 4 | 3158146 | Norma Fisher | LIC-2610 | 4 | Peter Mcdowell | Norma Fisher |

This view joins FinancialPlanner with FinancialPlanningAssistant to answer: which planning assistants report to each financial planner? It establishes the supervisory structure from the planner's perspective. Planner 1 supervises assistant 1 (Norma Fisher), while planner 4 supervises assistant 4 (Peter Mcdowell). This view is essential for organizational reporting and for understanding the span of control within the planning team.

**View `financial_planner_compliance_record_view`**

```sql
CREATE VIEW financial_planner_compliance_record_view AS
SELECT a.id, a.plannerId, a.fullName, a.licenseNumber, b.recordId AS record_recordId, b.recordType AS record_recordType, b.issueDate AS record_issueDate
FROM FinancialPlanner a JOIN ComplianceRecord b ON a.recordId = b.recordId;
```

| id | plannerId | fullName | licenseNumber | record_recordId | record_recordType | record_issueDate |
|---|---|---|---|---|---|---|
| 1 | id_1 | Theodore Mcgrath | LIC-2589 | 10449530 | training_certificate | 2023-02-01 |
| 2 | 20723567 | Account Name | LIC-2596 | 10445619 | license_renewal | 2024-07-12 |
| 3 | 9085264 | Saipan International Airport | LIC-2603 | 9568457 | audit_report | 2025-12-23 |
| 4 | 3158146 | Norma Fisher | LIC-2610 | 20743593 | client_disclosure | 2022-05-07 |

By joining FinancialPlanner with ComplianceRecord, this view answers: which compliance records are associated with each financial planner? It links planner identity with their regulatory standing. Planner 1 is associated with compliance record 10449530, while planner 2 is associated with compliance record 10445619. This view supports regulatory compliance monitoring and audit preparation.

**View `compliance_record_financial_planner_view`**

```sql
CREATE VIEW compliance_record_financial_planner_view AS
SELECT a.recordId, a.recordType, a.issueDate, a.expiryDate, b.id AS planner_id, b.plannerId AS planner_plannerId, b.fullName AS planner_fullName
FROM ComplianceRecord a JOIN FinancialPlanner b ON a.plannerId = b.id;
```

| recordId | recordType | issueDate | expiryDate | planner_id | planner_plannerId | planner_fullName |
|---|---|---|---|---|---|---|
| 10449530 | training_certificate | 2023-02-01 | 2023-10-24 | 1 | id_1 | Theodore Mcgrath |
| 10445619 | license_renewal | 2024-07-12 | 2024-03-08 | 2 | 20723567 | Account Name |
| 9568457 | audit_report | 2025-12-23 | 2025-08-19 | 3 | 9085264 | Saipan International Airport |
| 20743593 | client_disclosure | 2022-05-07 | 2022-01-03 | 4 | 3158146 | Norma Fisher |

The inverse of the planner-to-compliance relationship, this view joins ComplianceRecord with FinancialPlanner to answer: which financial planner is responsible for each compliance record? It presents the compliance record as the primary entity with planner context. Compliance record 10449530 is attributable to planner 1, while compliance record 10445619 is attributable to planner 2. This view is essential for compliance reporting and regulatory audit trails.

**View `compliance_record_financial_planning_assistant_view`**

```sql
CREATE VIEW compliance_record_financial_planning_assistant_view AS
SELECT a.recordId, a.recordType, a.issueDate, a.expiryDate, b.id AS assistant_id, b.employeeId AS assistant_employeeId, b.fullName AS assistant_fullName
FROM ComplianceRecord a JOIN FinancialPlanningAssistant b ON a.assistantId = b.id;
```

| recordId | recordType | issueDate | expiryDate | assistant_id | assistant_employeeId | assistant_fullName |
|---|---|---|---|---|---|---|
| 10449530 | training_certificate | 2023-02-01 | 2023-10-24 | 1 | Norma Fisher | Theodore Mcgrath |
| 10445619 | license_renewal | 2024-07-12 | 2024-03-08 | 2 | Tasha Rodriguez | Account Name |
| 9568457 | audit_report | 2025-12-23 | 2025-08-19 | 3 | Theodore Mcgrath | Saipan International Airport |
| 20743593 | client_disclosure | 2022-05-07 | 2022-01-03 | 4 | Peter Mcdowell | Norma Fisher |

By joining ComplianceRecord with FinancialPlanningAssistant, this view answers: which planning assistant is associated with each compliance record? It links compliance findings with the assistants involved. Compliance record 10449530 is associated with assistant 1 (Norma Fisher), while compliance record 10445619 is associated with assistant 2 (Tasha Rodriguez). This view supports assistant-level compliance monitoring and training needs assessment.

**View `compliance_record_trade_transaction_view`**

```sql
CREATE VIEW compliance_record_trade_transaction_view AS
SELECT a.recordId, a.recordType, a.issueDate, a.expiryDate, b.transactionId AS transaction_transactionId, b.transactionDate AS transaction_transactionDate, b.transactionType AS transaction_transactionType
FROM ComplianceRecord a JOIN TradeTransaction b ON a.transactionId = b.transactionId;
```

| recordId | recordType | issueDate | expiryDate | transaction_transactionId | transaction_transactionDate | transaction_transactionType |
|---|---|---|---|---|---|---|
| 10449530 | training_certificate | 2023-02-01 | 2023-10-24 | 1 | 2023-02-25T01:39:00 | buy |
| 10445619 | license_renewal | 2024-07-12 | 2024-03-08 | 2 | 2024-07-09T08:56:00 | sell |
| 9568457 | audit_report | 2025-12-23 | 2025-08-19 | 3 | 2025-12-20T15:13:00 | dividend |
| 20743593 | client_disclosure | 2022-05-07 | 2022-01-03 | 4 | 2022-05-04T22:30:00 | transfer |

This view joins ComplianceRecord with TradeTransaction to answer: which trade transactions are covered by each compliance record? It connects compliance findings with the specific transactions under review. Compliance record 10449530 covers transaction 1 (a pending buy for 13.49), while compliance record 10445619 covers transaction 2 (an executed sell for 25.47). This view is critical for transaction-level compliance verification and regulatory reporting.

The financial services data model presents a comprehensive framework for managing the full lifecycle of client relationships, from initial onboarding through ongoing account management, investment oversight, transaction execution, and regulatory compliance. Each base table captures a distinct dimension of the financial ecosystem, while the derived views provide the analytical lenses necessary to answer specific operational questions about how these dimensions interconnect. The relational structure ensures that every transaction can be traced back through its asset, account, portfolio, client, planner, and assistant, creating an auditable chain of custody that supports both operational efficiency and regulatory accountability.