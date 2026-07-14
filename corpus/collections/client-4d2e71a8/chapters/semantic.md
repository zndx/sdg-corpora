The financial services domain under examination models a tightly coupled ecosystem of clients, accounts, portfolios, assets, and the human and automated agents who manage them. At its core, the system tracks individual clients through their financial accounts and investment portfolios, each of which holds financial assets that are bought, sold, or transferred via trade transactions. Financial planners and financial planning assistants provide oversight and automation, while compliance records capture regulatory and audit events. The relational schema normalizes these concepts into eight base tables, with foreign keys establishing referential integrity across the model. Twenty-eight materialized views then reconstruct domain facts by joining these normalized tables, each view answering a specific analytical question about the relationships between entities.

## The Client Entity and Its Direct Relationships

**Table `Client`**

| id | clientId | fullName | dateOfBirth | contactEmail | contactPhone | residentialAddress | clientStatus | accountId | portfolioId | plannerId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Erin Olson | Theodore Mcgrath | 2025-04-02 | Christopher Wilson | Joe Tsai | compact-resident-62 | active | 100 | 1 | 1 |
| 1001 | Jorge Sullivan | Account Name | 2022-09-13 | Charles Larsen | Stephanie Collins | composite-resident-63 | inactive | 101 | 2 | 2 |
| 1002 | Kimberly Maynard | Saipan International Airport | 2023-02-24 | Mary Alvarez | Tasha Rodriguez | primary-resident-64 | pending | 102 | 3 | 3 |
| 1003 | Michelle Kelley | Norma Fisher | 2024-07-08 | April Snyder | Walter Pratt | adaptive-resident-65 | closed | 103 | 4 | 4 |

The `Client` table anchors the entire schema. Each row represents a unique client identified by the surrogate key `id` (values 1000 through 1003) and the business identifier `clientId` (Erin Olson, Jorge Sullivan, Kimberly Maynard, Michelle Kelley). Demographic and contact attributes include `fullName` (Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher), `dateOfBirth` (2025-04-02 through 2024-07-08), `contactEmail` (Christopher Wilson, Charles Larsen, Mary Alvarez, April Snyder), `contactPhone` (Joe Tsai, Stephanie Collins, Tasha Rodriguez, Walter Pratt), and `residentialAddress` (compact-resident-62, composite-resident-63, primary-resident-64, adaptive-resident-65). The `clientStatus` column constrains each client to one of four lifecycle states: `active`, `inactive`, `pending`, or `closed`. Three foreign keys embed cardinality-bounded relationships directly into the row: `accountId` references `FinancialAccount.id`, `portfolioId` references `InvestmentPortfolio.id`, and `plannerId` references `FinancialPlanner.id`. In the sample data, client 1000 holds account 100, portfolio 1, and is assigned planner 1, establishing a one-to-one alignment across the three related tables for this row.

## Financial Accounts, Investment Portfolios, and Financial Assets

**Table `FinancialAccount`**

| id | accountNumber | accountType | openDate | currentBalance | currencyCode | accountStatus | lastStatementDate | clientId | assetId | plannerId |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | ACC-2253 | checking | 2025-08-07 | 1,387 | gd_fp_eu_acc3 | active | 2025-12-06 | 1000 | 1 | 1 |
| 101 | ACC-2256 | savings | 2022-01-18 | 1,867 | managing-resources | frozen | 2022-05-17 | 1001 | 2 | 2 |
| 102 | ACC-2259 | investment | 2023-06-02 | 65.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | closed | 2023-10-01 | 1002 | 3 | 3 |
| 103 | ACC-2262 | loan | 2024-11-13 | 2,453 | 10445649 | overdrawn | 2024-03-12 | 1003 | 4 | 4 |

The `FinancialAccount` table captures banking and credit relationships. Each account is identified by `id` (100–103) and the business key `accountNumber` (ACC-2253 through ACC-2262). The `accountType` column distinguishes `checking`, `savings`, `investment`, and `loan` accounts. Monetary and temporal attributes include `openDate` (2025-08-07, 2022-01-18, 2023-06-02, 2024-11-13), `currentBalance` (1,387; 1,867; 65.72; 2,453), `currencyCode` (gd_fp_eu_acc3, managing-resources, f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3, 10445649), `accountStatus` (active, frozen, closed, overdrawn), and `lastStatementDate` (2025-12-06 through 2024-03-12). Two foreign keys link the account to its owner and its underlying asset: `clientId` references `Client.id`, and `assetId` references `FinancialAsset.id`. A third foreign key, `plannerId`, references `FinancialPlanner.id`, indicating that each account is overseen by a specific planner.

**Table `InvestmentPortfolio`**

| id | portfolioId | riskProfile | totalValue | currencyCode | lastRebalanceDate | portfolioStatus | clientId | assetId | plannerId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | coms1 | conservative | 9.45 | gd_fp_eu_acc3 | 2025-12-23 | active | 1000 | 1 | 1 |
| 2 | 89121 | moderate | 12.90 | managing-resources | 2022-05-07 | on_hold | 1001 | 2 | 2 |
| 3 | Salangin | aggressive | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-18 | liquidating | 1002 | 3 | 3 |
| 4 | 4463650 | balanced | 19.80 | 10445649 | 2024-03-02 | active | 1003 | 4 | 4 |

The `InvestmentPortfolio` table models investment holdings. The surrogate key `id` (1–4) pairs with the business identifier `portfolioId` (coms1, 89121, Salangin, 4463650). The `riskProfile` column constrains portfolios to `conservative`, `moderate`, `aggressive`, or `balanced`. Financial state is captured by `totalValue` (9.45, 12.90, 16.35, 19.80) and `currencyCode` (matching the same four codes seen in `FinancialAccount`). Temporal and lifecycle metadata include `lastRebalanceDate` (2025-12-23 through 2024-03-02) and `portfolioStatus` (active, on_hold, liquidating, active). Foreign keys `clientId`, `assetId`, and `plannerId` mirror the pattern in `FinancialAccount`, each referencing the corresponding base table's primary key. Portfolio 1, for instance, belongs to client 1000, holds asset 1, and is managed by planner 1.

**Table `FinancialAsset`**

| id | assetId | tickerSymbol | assetType | currentMarketValue | purchaseDate | purchasePrice | quantity | assetStatus | portfolioId | transactionId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 7731874 | composite-ticker-63 | equity | 17.45 | 2022-01-07 | 14.31 | 9 | held | 1 | 1 |
| 2 | 6564392 | primary-ticker-64 | bond | 19.90 | 2023-06-18 | 18.59 | 8 | sold | 2 | 2 |
| 3 | 5917296 | adaptive-ticker-65 | mutual_fund | 22.35 | 2024-11-02 | 13.13 | 0 | dividend_pending | 3 | 3 |
| 4 | 990e161e10664c5885182d95dc07e606 | distributed-ticker-66 | etf | 24.80 | 2025-04-13 | 43.25 | 12 | held | 4 | 4 |

The `FinancialAsset` table represents individual securities and investment instruments. The surrogate `id` (1–4) and business key `assetId` (7731874, 6564392, 5917296, 990e161e10664c5885182d95dc07e606) identify each asset. The `tickerSymbol` column (composite-ticker-63, primary-ticker-64, adaptive-ticker-65, distributed-ticker-66) provides a market-facing identifier, while `assetType` classifies the instrument as `equity`, `bond`, `mutual_fund`, or `etf`. Valuation data includes `currentMarketValue` (17.45, 19.90, 22.35, 24.80), `purchaseDate` (2022-01-07 through 2025-04-13), `purchasePrice` (14.31, 18.59, 13.13, 43.25), and `quantity` (9, 8, 0, 12). The `assetStatus` column tracks lifecycle states: `held`, `sold`, `dividend_pending`, and `held`. Two foreign keys anchor the asset to its container and its transaction history: `portfolioId` references `InvestmentPortfolio.id`, and `transactionId` references `TradeTransaction.transactionId`.

## Trade Transactions and the Planning Agent Layer

**Table `TradeTransaction`**

| transactionId | transactionDate | transactionType | amount | currencyCode | executionStatus | settlementDate | assetId | accountId | clientId | assistantId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2023-02-25T01:39:00 | buy | 13.49 | gd_fp_eu_acc3 | pending | 2025-12-22 | 1 | 100 | 1000 | 1 |
| 2 | 2024-07-09T08:56:00 | sell | 25.47 | managing-resources | executed | 2022-05-06 | 2 | 101 | 1001 | 2 |
| 3 | 2025-12-20T15:13:00 | dividend | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | failed | 2023-10-17 | 3 | 102 | 1002 | 3 |
| 4 | 2022-05-04T22:30:00 | transfer | 12.74 | 10445649 | reversed | 2024-03-01 | 4 | 103 | 1003 | 4 |

The `TradeTransaction` table records every market event. The surrogate key `transactionId` (1–4) identifies each transaction, while `transactionDate` (2023-02-25T01:39:00 through 2022-05-04T22:30:00) and `transactionType` (buy, sell, dividend, transfer) describe the event. The `amount` column (13.49, 25.47, 19.72, 12.74) and `currencyCode` (matching the four codes seen elsewhere) capture financial magnitude. Execution metadata includes `executionStatus` (pending, executed, failed, reversed) and `settlementDate` (2025-12-22 through 2024-03-01). Four foreign keys establish the transaction's context: `assetId` references `FinancialAsset.id`, `accountId` references `FinancialAccount.id`, `clientId` references `Client.id`, and `assistantId` references `FinancialPlanningAssistant.id`. Transaction 1, for example, is a buy order for asset 1, settled against account 100, belonging to client 1000, and processed by assistant 1.

**Table `FinancialPlanningAssistant`**

| id | employeeId | fullName | licenseStatus | licenseExpiryDate | officeLocation | employmentStatus | yearsExperience | plannerId | transactionId | clientId | recordId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Norma Fisher | Theodore Mcgrath | licensed | 2023-10-06 | composite-office-99 | active | 16 | 1 | 1 | 1000 | 10449530 |
| 2 | Tasha Rodriguez | Account Name | in_training | 2024-03-17 | primary-office-100 | on_leave | 22 | 2 | 2 | 1001 | 10445619 |
| 3 | Theodore Mcgrath | Saipan International Airport | expired | 2025-08-01 | adaptive-office-101 | terminated | 28 | 3 | 3 | 1002 | 9568457 |
| 4 | Peter Mcdowell | Norma Fisher | licensed | 2022-01-12 | distributed-office-102 | active | 34 | 4 | 4 | 1003 | 20743593 |

The `FinancialPlanningAssistant` table models the automated or semi-automated agents that execute and monitor transactions. The surrogate `id` (1–4) pairs with `employeeId` (Norma Fisher, Tasha Rodriguez, Theodore Mcgrath, Peter Mcdowell) and `fullName` (Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher). Licensing and employment metadata include `licenseStatus` (licensed, in_training, expired, licensed), `licenseExpiryDate` (2023-10-06 through 2022-01-12), `officeLocation` (composite-office-99 through distributed-office-102), `employmentStatus` (active, on_leave, terminated, active), and `yearsExperience` (16, 22, 28, 34). Three foreign keys link the assistant to its supervisory and operational context: `plannerId` references `FinancialPlanner.id`, `transactionId` references `TradeTransaction.transactionId`, and `clientId` references `Client.id`. An additional column, `recordId` (10449530, 10445619, 9568457, 20743593), appears to reference `ComplianceRecord.id`, establishing a compliance linkage.

## The Compliance and Planner Entities

**Table `FinancialPlanner`**

| id | plannerId | fullName | licenseNumber | specialization | yearsExperience | employmentStatus | portfolioId | clientId | assistantId | recordId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | id_1 | Theodore Mcgrath | LIC-2589 | retirement | 16 | active | 1 | 1000 | 1 | 10449530 |
| 2 | 20723567 | Account Name | LIC-2596 | tax_planning | 22 | on_leave | 2 | 1001 | 2 | 10445619 |
| 3 | 9085264 | Saipan International Airport | LIC-2603 | investment | 28 | terminated | 3 | 1002 | 3 | 9568457 |
| 4 | 3158146 | Norma Fisher | LIC-2610 | estate_planning | 34 | active | 4 | 1003 | 4 | 20743593 |

The `FinancialPlanner` table represents the human professionals who oversee client relationships, accounts, portfolios, and assistants. Although the sample data does not display a separate row set for this table, it is referenced as the target of `plannerId` foreign keys in `Client`, `FinancialAccount`, `InvestmentPortfolio`, and `FinancialPlanningAssistant`. The planner entity thus serves as a central hub: each client, account, portfolio, and assistant row carries a `plannerId` that points to a single planner, enforcing a many-to-one cardinality. Planner 1, for instance, is the supervisor for client 1000, account 100, portfolio 1, and assistant 1, creating a coherent chain of responsibility.

**Table `ComplianceRecord`**

| recordId | recordType | issueDate | expiryDate | issuingAuthority | verificationStatus | documentUrl | plannerId | assistantId | transactionId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 10449530 | training_certificate | 2023-02-01 | 2023-10-24 | extended-issuing-33 | verified | https://www.nature.com/articles/nphoton.2012.84 | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 10445619 | license_renewal | 2024-07-12 | 2024-03-08 | integrated-issuing-34 | pending_review | https://bugs.launchpad.net/nova/+bug/1246276 | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 9568457 | audit_report | 2025-12-23 | 2025-08-19 | seasonal-issuing-35 | expired | http://eol.org/pages/333309/overview | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 20743593 | client_disclosure | 2022-05-07 | 2022-01-03 | regional-issuing-36 | rejected | https://ecocyc.org/gene?orgid=ECOLI&id=G7564 | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `ComplianceRecord` table captures regulatory and audit events. The sample data shows `recordId` values (10449530, 10445619, 9568457, 20743593) that are referenced by `FinancialPlanningAssistant.recordId`. Compliance records are linked to the planner and assistant layers, ensuring that every compliance event can be traced to the responsible human and the responsible automated agent. The compliance table thus sits at the intersection of accountability, providing an audit trail that connects planners, assistants, and the transactions they oversee.

## Materialized Views: Reconstructing Domain Facts

Each materialized view joins two or more base tables to answer a specific analytical question. The following sections interpret the views by reading concrete rows as evidence.

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

This view reconstructs the client-to-account relationship. It answers: "Which financial account belongs to which client?" Row 1 shows client 1000 (Erin Olson) linked to account ACC-2253, a checking account with a balance of 1,387. Row 2 shows client 1001 (Jorge Sullivan) linked to account ACC-2256, a savings account with a balance of 1,867.

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

This view reconstructs the client-to-portfolio relationship. It answers: "Which investment portfolio is assigned to which client?" Row 1 shows client 1000 (Erin Olson) linked to portfolio coms1, a conservative portfolio valued at 9.45. Row 2 shows client 1001 (Jorge Sullivan) linked to portfolio 89121, a moderate portfolio valued at 12.90.

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

This view reconstructs the client-to-planner relationship. It answers: "Which financial planner is assigned to which client?" Row 1 shows client 1000 (Erin Olson) assigned to planner 1. Row 2 shows client 1001 (Jorge Sullivan) assigned to planner 2.

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

This view presents the same client-account linkage from the account's perspective. It answers: "Which client owns this financial account?" Row 1 shows account ACC-2253 (checking, balance 1,387) owned by client 1000 (Erin Olson). Row 2 shows account ACC-2256 (savings, balance 1,867) owned by client 1001 (Jorge Sullivan).

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

This view reconstructs the account-to-asset relationship. It answers: "Which financial asset is associated with this account?" Row 1 shows account ACC-2253 linked to asset 7731874 (composite-ticker-63, equity, market value 17.45). Row 2 shows account ACC-2256 linked to asset 6564392 (primary-ticker-64, bond, market value 19.90).

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

This view reconstructs the account-to-planner relationship. It answers: "Which financial planner oversees this account?" Row 1 shows account ACC-2253 overseen by planner 1. Row 2 shows account ACC-2256 overseen by planner 2.

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

This view presents the portfolio-to-client linkage from the portfolio's perspective. It answers: "Which client owns this investment portfolio?" Row 1 shows portfolio coms1 (conservative, value 9.45) owned by client 1000 (Erin Olson). Row 2 shows portfolio 89121 (moderate, value 12.90) owned by client 1001 (Jorge Sullivan).

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

This view reconstructs the portfolio-to-asset relationship. It answers: "Which financial asset is held in this investment portfolio?" Row 1 shows portfolio coms1 holding asset 7731874 (composite-ticker-63, equity). Row 2 shows portfolio 89121 holding asset 6564392 (primary-ticker-64, bond).

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

This view reconstructs the portfolio-to-planner relationship. It answers: "Which financial planner manages this investment portfolio?" Row 1 shows portfolio coms1 managed by planner 1. Row 2 shows portfolio 89121 managed by planner 2.

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

This view presents the asset-to-portfolio linkage from the asset's perspective. It answers: "In which investment portfolio is this financial asset held?" Row 1 shows asset 7731874 (composite-ticker-63, equity) held in portfolio coms1. Row 2 shows asset 6564392 (primary-ticker-64, bond) held in portfolio 89121.

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

This view reconstructs the asset-to-transaction relationship. It answers: "Which trade transaction involves this financial asset?" Row 1 shows asset 7731874 involved in transaction 1 (buy, amount 13.49). Row 2 shows asset 6564392 involved in transaction 2 (sell, amount 25.47).

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

This view presents the transaction-to-asset linkage from the transaction's perspective. It answers: "Which financial asset was traded in this transaction?" Row 1 shows transaction 1 (buy, amount 13.49) involving asset 7731874 (composite-ticker-63, equity). Row 2 shows transaction 2 (sell, amount 25.47) involving asset 6564392 (primary-ticker-64, bond).

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

This view reconstructs the transaction-to-account relationship. It answers: "Which financial account was used for this trade transaction?" Row 1 shows transaction 1 (buy, amount 13.49) settled against account ACC-2253. Row 2 shows transaction 2 (sell, amount 25.47) settled against account ACC-2256.

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

This view reconstructs the transaction-to-client relationship. It answers: "Which client initiated this trade transaction?" Row 1 shows transaction 1 (buy, amount 13.49) initiated by client 1000 (Erin Olson). Row 2 shows transaction 2 (sell, amount 25.47) initiated by client 1001 (Jorge Sullivan).

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

This view reconstructs the transaction-to-assistant relationship. It answers: "Which financial planning assistant processed this trade transaction?" Row 1 shows transaction 1 (buy, amount 13.49) processed by assistant 1 (Norma Fisher). Row 2 shows transaction 2 (sell, amount 25.47) processed by assistant 2 (Tasha Rodriguez).

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

This view reconstructs the assistant-to-planner relationship. It answers: "Which financial planner supervises this planning assistant?" Row 1 shows assistant 1 (Norma Fisher) supervised by planner 1. Row 2 shows assistant 2 (Tasha Rodriguez) supervised by planner 2.

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

This view reconstructs the assistant-to-transaction relationship. It answers: "Which trade transaction was processed by this financial planning assistant?" Row 1 shows assistant 1 (Norma Fisher) processed transaction 1 (buy, amount 13.49). Row 2 shows assistant 2 (Tasha Rodriguez) processed transaction 2 (sell, amount 25.47).

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

This view reconstructs the assistant-to-client relationship. It answers: "Which client is served by this financial planning assistant?" Row 1 shows assistant 1 (Norma Fisher) serving client 1000 (Erin Olson). Row 2 shows assistant 2 (Tasha Rodriguez) serving client 1001 (Jorge Sullivan).

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

This view reconstructs the assistant-to-compliance relationship. It answers: "Which compliance record is associated with this financial planning assistant?" Row 1 shows assistant 1 (Norma Fisher) linked to compliance record 10449530. Row 2 shows assistant 2 (Tasha Rodriguez) linked to compliance record 10445619.

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

This view reconstructs the planner-to-portfolio relationship. It answers: "Which investment portfolio is managed by this financial planner?" Row 1 shows planner 1 managing portfolio coms1 (conservative, value 9.45). Row 2 shows planner 2 managing portfolio 89121 (moderate, value 12.90).

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

This view reconstructs the planner-to-client relationship. It answers: "Which client is assigned to this financial planner?" Row 1 shows planner 1 assigned to client 1000 (Erin Olson). Row 2 shows planner 2 assigned to client 1001 (Jorge Sullivan).

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

This view reconstructs the planner-to-assistant relationship. It answers: "Which financial planning assistant is supervised by this financial planner?" Row 1 shows planner 1 supervising assistant 1 (Norma Fisher). Row 2 shows planner 2 supervising assistant 2 (Tasha Rodriguez).

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

This view reconstructs the planner-to-compliance relationship. It answers: "Which compliance record is overseen by this financial planner?" Row 1 shows planner 1 overseeing compliance record 10449530. Row 2 shows planner 2 overseeing compliance record 10445619.

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

This view presents the compliance-to-planner linkage from the compliance record's perspective. It answers: "Which financial planner is responsible for this compliance record?" Row 1 shows compliance record 10449530 overseen by planner 1. Row 2 shows compliance record 10445619 overseen by planner 2.

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

This view reconstructs the compliance-to-assistant relationship. It answers: "Which financial planning assistant is associated with this compliance record?" Row 1 shows compliance record 10449530 associated with assistant 1 (Norma Fisher). Row 2 shows compliance record 10445619 associated with assistant 2 (Tasha Rodriguez).

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

This view reconstructs the compliance-to-transaction relationship. It answers: "Which trade transaction is covered by this compliance record?" Row 1 shows compliance record 10449530 covering transaction 1 (buy, amount 13.49). Row 2 shows compliance record 10445619 covering transaction 2 (sell, amount 25.47).

## Synthesis

The schema models a financial services domain where clients, accounts, portfolios, and assets form the operational core, trade transactions capture market activity, and planners and assistants provide human and automated oversight. Compliance records close the loop by anchoring regulatory events to the agents responsible. Foreign keys enforce a many-to-one cardinality at every junction: many accounts belong to one client, many assets belong to one portfolio, many transactions belong to one account, and many assistants report to one planner. The twenty-eight materialized views materialize every pairwise relationship as a denormalized fact, enabling analytical queries without requiring the application layer to reconstruct joins. Each view answers a single question — ownership, assignment, supervision, or execution — and each row in a view is a concrete instance of a domain relationship, such as client 1000 (Erin Olson) owning account ACC-2253, or assistant 1 (Norma Fisher) processing transaction 1 (buy, 13.49). The schema is normalized to reduce redundancy while remaining fully reconstructible through its view layer.