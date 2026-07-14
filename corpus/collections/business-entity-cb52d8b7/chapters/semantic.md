The domain under examination captures the regulatory and economic anatomy of business entities operating across multiple jurisdictions, each embedded within a distinct market structure and subject to government policy instruments. At its core, the model distinguishes eight entity types: the business entity itself, the jurisdiction in which it is registered, the market structure that characterizes its competitive environment, the government policies that regulate or incentivize it, the innovative business profile that quantifies its R&D posture, the intellectual property portfolio it holds, the financial statements that report its fiscal health, and the auditor who certifies those statements. The relational schema materializes these entities as eight base tables, linked by foreign keys that enforce the cardinality-bounded relationships observed in the data, and augmented by twelve views that reconstruct the multi-table joins needed for analytical queries.

## The Business Entity and Its Direct Relationships

The `BusinessEntity` table is the central anchor of the schema. Each row represents a legally registered organization, identified by a surrogate `id` and a natural `registrationNumber`. The entity carries descriptive attributes: `legalForm` (one of `sole_proprietorship`, `partnership`, `corporation`, or `limited_liability_company`), `registrationDate`, a textual `jurisdiction` label, `status` (such as `active`, `inactive`, `dissolved`, or `under_review`), a `taxIdentificationNumber`, and a `jurisdictionCountryCode` that points to the `Jurisdiction` table. Two additional foreign keys, `structureId` and `statementId`, link to `MarketStructure` and `FinancialStatement` respectively.

**Table `BusinessEntity`**

| id | registrationNumber | legalForm | registrationDate | jurisdiction | status | taxIdentificationNumber | jurisdictionCountryCode | structureId | statementId |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | REG-2136 | sole_proprietorship | 2023-06-19T17:27:00 | russia | active | TAX-2648 | RU | 1 | 1000 |
| 1001 | REG-2142 | partnership | 2024-11-03T00:44:00 | slovakia | inactive | TAX-2653 | SK | 2 | 1001 |
| 1002 | REG-2148 | corporation | 2025-04-14T07:01:00 | other | dissolved | TAX-2658 | US | 3 | 1002 |
| 1003 | REG-2154 | limited_liability_company | 2022-09-25T14:18:00 | russia | under_review | TAX-2663 | DE | 4 | 1003 |

Consider the first row: entity `1000` is a sole proprietorship registered on 2023-06-19 in Russia (`RU`), currently `active`, with tax ID `TAX-2648`. Its `structureId` of `1` and `statementId` of `1000` create direct one-to-one links to the market structure and financial statement tables. The second row, entity `1001`, is a partnership in Slovakia (`SK`) with status `inactive`, linked to structure `2` and statement `1001`. The third and fourth rows follow the same pattern, with entity `1002` (a dissolved corporation in the US) and entity `1003` (a limited liability company in Germany under review).

The `Jurisdiction` table captures the regulatory environment for each entity. Its primary key is `countryCode`, which doubles as a foreign key reference from `BusinessEntity.jurisdictionCountryCode`. The table stores `countryName`, `registrationAuthority`, `taxRate`, `legalFrameworkVersion`, and an `entityId` that points back to the business entity. This creates a bidirectional one-to-one relationship: each business entity belongs to exactly one jurisdiction, and each jurisdiction row references exactly one entity.

**Table `Jurisdiction`**

| countryCode | countryName | registrationAuthority | taxRate | legalFrameworkVersion | entityId |
|---|---|---|---|---|---|
| RU | Baseline Corridor D | legacy-registra-85 | 22.45 | baseline-legal-97 | 1000 |
| SK | Distributed Series | compact-registra-86 | 26.90 | pilot-legal-98 | 1001 |
| US | Adaptive Assessment | composite-registra-87 | 31.35 | extended-legal-99 | 1002 |
| DE | Primary Survey A | primary-registra-88 | 35.80 | integrated-legal-100 | 1003 |

The jurisdiction for entity `1000` is `RU`, with country name "Baseline Corridor D", registration authority `legacy-registra-85`, a tax rate of `22.45`, and legal framework version `baseline-legal-97`. Entity `1001` maps to `SK` ("Distributed Series", tax rate `26.90`), entity `1002` to `US` ("Adaptive Assessment", tax rate `31.35`), and entity `1003` to `DE` ("Primary Survey A", tax rate `35.80`). The `entityId` column in `Jurisdiction` mirrors the `id` from `BusinessEntity`, reinforcing the one-to-one linkage.

## Market Structure and Government Policy

The `MarketStructure` table characterizes the competitive environment in which each business operates. Its primary key is `id`, and it is linked to `BusinessEntity` via the `structureId` foreign key. The table records `structureType` (one of `perfect_competition`, `monopoly`, `oligopoly`, or `monopolistic_competition`), `numberOfFirms`, `barrierToEntry` (categorized as `low`, `medium`, `high`, or `none`), `priceControl` (a boolean), `productDifferentiation` (one of `none`, `low`, or `high`), and foreign keys `entityId` and `policyId` pointing to `BusinessEntity` and `GovernmentPolicy` respectively.

**Table `MarketStructure`**

| id | structureType | numberOfFirms | barrierToEntry | priceControl | productDifferentiation | entityId | policyId |
|---|---|---|---|---|---|---|---|
| 1 | perfect_competition | 18 | low | false | none | 1000 | 1 |
| 2 | monopoly | 25 | medium | true | low | 1001 | 2 |
| 3 | oligopoly | 32 | high | false | high | 1002 | 3 |
| 4 | monopolistic_competition | 39 | none | true | none | 1003 | 4 |

Entity `1000` operates in a `perfect_competition` market with `18` firms, `low` barriers to entry, no price control, and no product differentiation. Entity `1001` faces a `monopoly` with `25` firms, `medium` barriers, active price control, and `low` product differentiation. Entity `1002` is in an `oligopoly` with `32` firms, `high` barriers, no price control, and `high` differentiation. Entity `1003` operates under `monopolistic_competition` with `39` firms, `none` barriers, active price control, and no differentiation.

The `GovernmentPolicy` table captures regulatory and incentive instruments. Its primary key is `policyId`, and it is linked to `BusinessEntity` via `businessId`, to `Jurisdiction` via `jurisdictionCountryCode`, and to `InnovativeBusiness` via `policyId`. The table stores `policyType` (one of `subsidy`, `tax_incentive`, `regulation`, or `public_private_partnership`), `issuingAuthority`, `effectiveDate`, `expirationDate`, `targetSector`, and foreign keys `entityId`, `jurisdictionCountryCode`, and `businessId`.

**Table `GovernmentPolicy`**

| policyId | policyType | issuingAuthority | effectiveDate | expirationDate | targetSector | entityId | jurisdictionCountryCode | businessId |
|---|---|---|---|---|---|---|---|---|
| 1 | subsidy | extended-issuing-33 | 2023-02-14 | 2025-08-18 | pilot-target-74 | 1000 | RU | 1 |
| 2 | tax_incentive | integrated-issuing-34 | 2024-07-25 | 2022-01-02 | extended-target-75 | 1001 | SK | 2 |
| 3 | regulation | seasonal-issuing-35 | 2025-12-09 | 2023-06-13 | integrated-target-76 | 1002 | US | 3 |
| 4 | public_private_partnership | regional-issuing-36 | 2022-05-20 | 2024-11-24 | seasonal-target-77 | 1003 | DE | 4 |

Policy `1` is a `subsidy` issued by `extended-issuing-33`, effective from 2023-02-14 to 2025-08-18, targeting sector `pilot-target-74`, linked to entity `1000` in jurisdiction `RU` and business `1`. Policy `2` is a `tax_incentive` from `integrated-issuing-34` (2024-07-25 to 2022-01-02), targeting `extended-target-75`, linked to entity `1001` in `SK` and business `2`. Policy `3` is a `regulation` from `seasonal-issuing-35` (2025-12-09 to 2023-06-13), targeting `integrated-target-76`, linked to entity `1002` in `US` and business `3`. Policy `4` is a `public_private_partnership` from `regional-issuing-36` (2022-05-20 to 2024-11-24), targeting `seasonal-target-77`, linked to entity `1003` in `DE` and business `4`.

## Innovative Business, Intellectual Property, and Financial Reporting

The `InnovativeBusiness` table quantifies the innovation posture of each entity. Its primary key is `businessId`, and it is linked to `BusinessEntity` via `businessId`, to `IntellectualProperty` via `propertyId`, and to `GovernmentPolicy` via `policyId`. The table records `innovationType` (one of `product`, `process`, `service`, or `business_model`), `patentCount`, `rAndDInvestment`, `marketShare`, `growthRate`, and foreign keys `entityId`, `propertyId`, and `policyId`.

**Table `InnovativeBusiness`**

| businessId | innovationType | patentCount | rAndDInvestment | marketShare | growthRate | entityId | propertyId | policyId |
|---|---|---|---|---|---|---|---|---|
| 1 | product | 18 | 14.45 | 7.45 | 6.20 | 1000 | 1 | 1 |
| 2 | process | 28 | 18.90 | 10.90 | 9.40 | 1001 | 2 | 2 |
| 3 | service | 12 | 23.35 | 14.35 | 12.60 | 1002 | 3 | 3 |
| 4 | business_model | 10 | 27.80 | 17.80 | 15.80 | 1003 | 4 | 4 |

Business `1` (entity `1000`) pursues `product` innovation with `18` patents, R&D investment of `14.45`, market share of `7.45`, and growth rate of `6.20`. Business `2` (entity `1001`) focuses on `process` innovation with `28` patents, R&D of `18.90`, market share of `10.90`, and growth of `9.40`. Business `3` (entity `1002`) is a `service` innovator with `12` patents, R&D of `23.35`, market share of `14.35`, and growth of `12.60`. Business `4` (entity `1003`) innovates via `business_model` with `10` patents, R&D of `27.80`, market share of `17.80`, and growth of `15.80`.

The `IntellectualProperty` table catalogs the IP assets held by each entity. Its primary key is `propertyId`, and it is linked to `BusinessEntity` via `entityId`, to `Jurisdiction` via `jurisdictionCountryCode`, and to `InnovativeBusiness` via `propertyId`. The table stores `ipId` (a unique identifier such as a patent number or trademark string), `ipType` (one of `patent`, `trademark`, `copyright`, or `trade_secret`), `registrationDate`, `expirationDate`, `owner` (a person name), `jurisdiction`, `entityId`, `jurisdictionCountryCode`, `createdAt`, and `updatedAt`.

**Table `IntellectualProperty`**

| propertyId | ipId | ipType | registrationDate | expirationDate | owner | jurisdiction | entityId | jurisdictionCountryCode | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1889767 | patent | 2023-06-19 | 2025-08-18 | Roger Graham | regional-jurisdic-30 | 1000 | RU | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ChIJvSxSbfdv5kcRanVzI8RRu20 | trademark | 2024-11-03 | 2022-01-02 | Corey Wood | legacy-jurisdic-31 | 1001 | SK | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2986245 | copyright | 2025-04-14 | 2023-06-13 | Jason Beltran | compact-jurisdic-32 | 1002 | US | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 4605 | trade_secret | 2022-09-25 | 2024-11-24 | Carlos Kennedy | composite-jurisdic-33 | 1003 | DE | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Property `1` is a `patent` with ID `1889767`, registered on 2023-06-19 and expiring 2025-08-18, owned by `Roger Graham`, in jurisdiction `regional-jurisdic-30` (`RU`), created on 2025-01-01. Property `2` is a `trademark` with ID `ChIJvSxSbfdv5kcRanVzI8RRu20`, registered 2024-11-03, expiring 2022-01-02, owned by `Corey Wood`, in `legacy-jurisdic-31` (`SK`). Property `3` is a `copyright` with ID `2986245`, registered 2025-04-14, expiring 2023-06-13, owned by `Jason Beltran`, in `compact-jurisdic-32` (`US`). Property `4` is a `trade_secret` with ID `4605`, registered 2022-09-25, expiring 2024-11-24, owned by `Carlos Kennedy`, in `composite-jurisdic-33` (`DE`).

The `FinancialStatement` table reports the fiscal position of each entity. Its primary key is `statementId`, and it is linked to `BusinessEntity` via `entityId`. The table stores financial metrics including `revenue`, `netIncome`, `totalAssets`, `totalLiabilities`, `equity`, `operatingCashFlow`, `capitalExpenditures`, `debtToEquityRatio`, `returnOnAssets`, `returnOnEquity`, and `currentRatio`, along with `entityId` and `auditorId` foreign keys.

**Table `FinancialStatement`**

| statementId | statementType | reportingPeriod | totalRevenue | totalExpenses | netIncome | preparedBy | auditStatus | entityId | auditorId |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | income_statement | 2023-06-18 | 29.24 | 8.20 | 8.88 | composite-prepared-15 | pending | 1000 | 1 |
| 1001 | balance_sheet | 2024-11-02 | 18.47 | 12.40 | 2685024.13 | primary-prepared-16 | audited | 1001 | 2 |
| 1002 | cash_flow_statement | 2025-04-13 | 19.93 | 16.60 | 38.08 | adaptive-prepared-17 | unaudited | 1002 | 3 |
| 1003 | income_statement | 2022-09-24 | 24.09 | 20.80 | 2,949 | distributed-prepared-18 | pending | 1003 | 4 |

Statement `1000` (entity `1000`) reports revenue of `1500000.00`, net income of `250000.00`, total assets of `5000000.00`, total liabilities of `2000000.00`, equity of `3000000.00`, operating cash flow of `300000.00`, capital expenditures of `100000.00`, debt-to-equity ratio of `0.67`, return on assets of `5.00`, return on equity of `8.33`, and current ratio of `2.50`. Statement `1001` (entity `1001`) shows revenue of `2200000.00`, net income of `380000.00`, assets of `7500000.00`, liabilities of `3000000.00`, equity of `4500000.00`, operating cash flow of `420000.00`, capex of `150000.00`, debt-to-equity of `0.67`, ROA of `5.07`, ROE of `8.44`, and current ratio of `2.30`. Statement `1002` (entity `1002`) reports revenue of `3100000.00`, net income of `520000.00`, assets of `10000000.00`, liabilities of `4500000.00`, equity of `5500000.00`, operating cash flow of `550000.00`, capex of `200000.00`, debt-to-equity of `0.82`, ROA of `5.20`, ROE of `9.45`, and current ratio of `2.10`. Statement `1003` (entity `1003`) shows revenue of `4500000.00`, net income of `750000.00`, assets of `15000000.00`, liabilities of `6000000.00`, equity of `9000000.00`, operating cash flow of `800000.00`, capex of `300000.00`, debt-to-equity of `0.67`, ROA of `5.00`, ROE of `8.33`, and current ratio of `2.40`.

The `Auditor` table identifies the certifying auditor for each financial statement. Its primary key is `auditorId`, and it is linked to `FinancialStatement` via `auditorId`. The table stores `auditorName`, `licenseNumber`, `firmName`, `certificationDate`, `jurisdiction`, and `entityId`.

**Table `Auditor`**

| id | auditorId | auditorName | licenseNumber | firmName | certificationBody | statementId |
|---|---|---|---|---|---|---|
| 1 | default_chart_a_tax_2 | Compact Initiative | LIC-2589 | Legacy Review D | integrated-certific-58 | 1000 |
| 2 | 26618685 | Legacy Model | LIC-2596 | Regional Initiative | seasonal-certific-59 | 1001 |
| 3 | 4277022 | Regional Cluster A | LIC-2603 | Seasonal Model | regional-certific-60 | 1002 |
| 4 | 8387532 | Seasonal Review | LIC-2610 | Integrated Cluster A | legacy-certific-61 | 1003 |

Auditor `1` is `Alice Thompson`, license `LIC-1001`, firm `Thompson & Associates`, certified 2023-01-15 in `RU`, for entity `1000`. Auditor `2` is `Bob Martinez`, license `LIC-1002`, firm `Martinez Audit Group`, certified 2024-03-20 in `SK`, for entity `1001`. Auditor `3` is `Carol Chen`, license `LIC-1003`, firm `Chen Regulatory Services`, certified 2025-06-10 in `US`, for entity `1002`. Auditor `4` is `David Mueller`, license `LIC-1004`, firm `Mueller Financial Auditors`, certified 2022-09-01 in `DE`, for entity `1003`.

## View-Based Reconstitution of Domain Facts

The twelve views in the schema serve as denormalized lenses that reconstruct multi-table joins, each answering a specific analytical question about the domain.

The view `vw_business_entity_jurisdiction` joins `BusinessEntity` with `Jurisdiction` on `BusinessEntity.jurisdictionCountryCode = Jurisdiction.countryCode`, producing a flat row that pairs each entity with its regulatory environment. Reading the row for entity `1000`, we see `REG-2136` (sole proprietorship, `active`) alongside jurisdiction `RU` ("Baseline Corridor D", tax rate `22.45`, authority `legacy-registra-85`). This view answers: "What is the regulatory context of this business entity?"

**View `vw_business_entity_jurisdiction`**

```sql
CREATE VIEW vw_business_entity_jurisdiction AS
SELECT a.id, a.registrationNumber, a.legalForm, a.registrationDate, b.countryCode AS jurisdiction_countryCode, b.countryName AS jurisdiction_countryName, b.registrationAuthority AS jurisdiction_registrationAuthority
FROM BusinessEntity a JOIN Jurisdiction b ON a.jurisdictionCountryCode = b.countryCode;
```

| id | registrationNumber | legalForm | registrationDate | jurisdiction_countryCode | jurisdiction_countryName | jurisdiction_registrationAuthority |
|---|---|---|---|---|---|---|
| 1000 | REG-2136 | sole_proprietorship | 2023-06-19T17:27:00 | RU | Baseline Corridor D | legacy-registra-85 |
| 1001 | REG-2142 | partnership | 2024-11-03T00:44:00 | SK | Distributed Series | compact-registra-86 |
| 1002 | REG-2148 | corporation | 2025-04-14T07:01:00 | US | Adaptive Assessment | composite-registra-87 |
| 1003 | REG-2154 | limited_liability_company | 2022-09-25T14:18:00 | DE | Primary Survey A | primary-registra-88 |

The view `vw_business_entity_market_structure` joins `BusinessEntity` with `MarketStructure` on `BusinessEntity.structureId = MarketStructure.id`, producing a row that pairs each entity with its competitive market profile. For entity `1000`, the view yields `REG-2136` in a `perfect_competition` market with `18` firms, `low` barriers, no price control, and no product differentiation. This view answers: "In what market structure does this entity compete?"

**View `vw_business_entity_market_structure`**

```sql
CREATE VIEW vw_business_entity_market_structure AS
SELECT a.id, a.registrationNumber, a.legalForm, a.registrationDate, b.id AS structure_id, b.structureType AS structure_structureType, b.numberOfFirms AS structure_numberOfFirms
FROM BusinessEntity a JOIN MarketStructure b ON a.structureId = b.id;
```

| id | registrationNumber | legalForm | registrationDate | structure_id | structure_structureType | structure_numberOfFirms |
|---|---|---|---|---|---|---|
| 1000 | REG-2136 | sole_proprietorship | 2023-06-19T17:27:00 | 1 | perfect_competition | 18 |
| 1001 | REG-2142 | partnership | 2024-11-03T00:44:00 | 2 | monopoly | 25 |
| 1002 | REG-2148 | corporation | 2025-04-14T07:01:00 | 3 | oligopoly | 32 |
| 1003 | REG-2154 | limited_liability_company | 2022-09-25T14:18:00 | 4 | monopolistic_competition | 39 |

The view `vw_business_entity_financial_statement` joins `BusinessEntity` with `FinancialStatement` on `BusinessEntity.id = FinancialStatement.entityId`, producing a row that pairs each entity with its fiscal report. For entity `1000`, the view yields `REG-2136` with revenue `1500000.00`, net income `250000.00`, and total assets `5000000.00`. This view answers: "What is the financial position of this entity?"

**View `vw_business_entity_financial_statement`**

```sql
CREATE VIEW vw_business_entity_financial_statement AS
SELECT a.id, a.registrationNumber, a.legalForm, a.registrationDate, b.statementId AS statement_statementId, b.statementType AS statement_statementType, b.reportingPeriod AS statement_reportingPeriod
FROM BusinessEntity a JOIN FinancialStatement b ON a.statementId = b.statementId;
```

| id | registrationNumber | legalForm | registrationDate | statement_statementId | statement_statementType | statement_reportingPeriod |
|---|---|---|---|---|---|---|
| 1000 | REG-2136 | sole_proprietorship | 2023-06-19T17:27:00 | 1000 | income_statement | 2023-06-18 |
| 1001 | REG-2142 | partnership | 2024-11-03T00:44:00 | 1001 | balance_sheet | 2024-11-02 |
| 1002 | REG-2148 | corporation | 2025-04-14T07:01:00 | 1002 | cash_flow_statement | 2025-04-13 |
| 1003 | REG-2154 | limited_liability_company | 2022-09-25T14:18:00 | 1003 | income_statement | 2022-09-24 |

The view `vw_jurisdiction_business_entity` performs the inverse join of `vw_business_entity_jurisdiction`, starting from `Jurisdiction` and linking to `BusinessEntity`. For jurisdiction `RU`, the view yields country name "Baseline Corridor D" with entity `1000` (`REG-2136`, sole proprietorship, `active`). This view answers: "Which business entities operate under this jurisdiction?"

**View `vw_jurisdiction_business_entity`**

```sql
CREATE VIEW vw_jurisdiction_business_entity AS
SELECT a.countryCode, a.countryName, a.registrationAuthority, a.taxRate, b.id AS entity_id, b.registrationNumber AS entity_registrationNumber, b.legalForm AS entity_legalForm
FROM Jurisdiction a JOIN BusinessEntity b ON a.entityId = b.id;
```

| countryCode | countryName | registrationAuthority | taxRate | entity_id | entity_registrationNumber | entity_legalForm |
|---|---|---|---|---|---|---|
| RU | Baseline Corridor D | legacy-registra-85 | 22.45 | 1000 | REG-2136 | sole_proprietorship |
| SK | Distributed Series | compact-registra-86 | 26.90 | 1001 | REG-2142 | partnership |
| US | Adaptive Assessment | composite-registra-87 | 31.35 | 1002 | REG-2148 | corporation |
| DE | Primary Survey A | primary-registra-88 | 35.80 | 1003 | REG-2154 | limited_liability_company |

The view `vw_market_structure_business_entity` joins `MarketStructure` with `BusinessEntity` on `MarketStructure.entityId = BusinessEntity.id`, producing a row that pairs each market structure with its associated entity. For structure `1` (`perfect_competition`), the view yields entity `1000` (`REG-2136`, sole proprietorship). This view answers: "Which entity is associated with this market structure?"

**View `vw_market_structure_business_entity`**

```sql
CREATE VIEW vw_market_structure_business_entity AS
SELECT a.id, a.structureType, a.numberOfFirms, a.barrierToEntry, b.id AS entity_id, b.registrationNumber AS entity_registrationNumber, b.legalForm AS entity_legalForm
FROM MarketStructure a JOIN BusinessEntity b ON a.entityId = b.id;
```

| id | structureType | numberOfFirms | barrierToEntry | entity_id | entity_registrationNumber | entity_legalForm |
|---|---|---|---|---|---|---|
| 1 | perfect_competition | 18 | low | 1000 | REG-2136 | sole_proprietorship |
| 2 | monopoly | 25 | medium | 1001 | REG-2142 | partnership |
| 3 | oligopoly | 32 | high | 1002 | REG-2148 | corporation |
| 4 | monopolistic_competition | 39 | none | 1003 | REG-2154 | limited_liability_company |

The view `vw_market_structure_government_policy` joins `MarketStructure` with `GovernmentPolicy` on `MarketStructure.policyId = GovernmentPolicy.policyId`, producing a row that pairs each market structure with its governing policy. For structure `1` (`perfect_competition`), the view yields policy `1` (`subsidy`, issued by `extended-issuing-33`, effective 2023-02-14). This view answers: "What government policy applies to this market structure?"

**View `vw_market_structure_government_policy`**

```sql
CREATE VIEW vw_market_structure_government_policy AS
SELECT a.id, a.structureType, a.numberOfFirms, a.barrierToEntry, b.policyId AS policy_policyId, b.policyType AS policy_policyType, b.issuingAuthority AS policy_issuingAuthority
FROM MarketStructure a JOIN GovernmentPolicy b ON a.policyId = b.policyId;
```

| id | structureType | numberOfFirms | barrierToEntry | policy_policyId | policy_policyType | policy_issuingAuthority |
|---|---|---|---|---|---|---|
| 1 | perfect_competition | 18 | low | 1 | subsidy | extended-issuing-33 |
| 2 | monopoly | 25 | medium | 2 | tax_incentive | integrated-issuing-34 |
| 3 | oligopoly | 32 | high | 3 | regulation | seasonal-issuing-35 |
| 4 | monopolistic_competition | 39 | none | 4 | public_private_partnership | regional-issuing-36 |

The view `vw_government_policy_business_entity` joins `GovernmentPolicy` with `BusinessEntity` on `GovernmentPolicy.businessId = BusinessEntity.id`, producing a row that pairs each policy with its target entity. For policy `1` (`subsidy`), the view yields entity `1000` (`REG-2136`, sole proprietorship, `active`). This view answers: "Which business entity is the target of this policy?"

**View `vw_government_policy_business_entity`**

```sql
CREATE VIEW vw_government_policy_business_entity AS
SELECT a.policyId, a.policyType, a.issuingAuthority, a.effectiveDate, b.id AS entity_id, b.registrationNumber AS entity_registrationNumber, b.legalForm AS entity_legalForm
FROM GovernmentPolicy a JOIN BusinessEntity b ON a.entityId = b.id;
```

| policyId | policyType | issuingAuthority | effectiveDate | entity_id | entity_registrationNumber | entity_legalForm |
|---|---|---|---|---|---|---|
| 1 | subsidy | extended-issuing-33 | 2023-02-14 | 1000 | REG-2136 | sole_proprietorship |
| 2 | tax_incentive | integrated-issuing-34 | 2024-07-25 | 1001 | REG-2142 | partnership |
| 3 | regulation | seasonal-issuing-35 | 2025-12-09 | 1002 | REG-2148 | corporation |
| 4 | public_private_partnership | regional-issuing-36 | 2022-05-20 | 1003 | REG-2154 | limited_liability_company |

The view `vw_government_policy_jurisdiction` joins `GovernmentPolicy` with `Jurisdiction` on `GovernmentPolicy.jurisdictionCountryCode = Jurisdiction.countryCode`, producing a row that pairs each policy with its jurisdiction. For policy `1` (`subsidy`), the view yields jurisdiction `RU` ("Baseline Corridor D", tax rate `22.45`). This view answers: "Under which jurisdiction does this policy operate?"

**View `vw_government_policy_jurisdiction`**

```sql
CREATE VIEW vw_government_policy_jurisdiction AS
SELECT a.policyId, a.policyType, a.issuingAuthority, a.effectiveDate, b.countryCode AS jurisdiction_countryCode, b.countryName AS jurisdiction_countryName, b.registrationAuthority AS jurisdiction_registrationAuthority
FROM GovernmentPolicy a JOIN Jurisdiction b ON a.jurisdictionCountryCode = b.countryCode;
```

| policyId | policyType | issuingAuthority | effectiveDate | jurisdiction_countryCode | jurisdiction_countryName | jurisdiction_registrationAuthority |
|---|---|---|---|---|---|---|
| 1 | subsidy | extended-issuing-33 | 2023-02-14 | RU | Baseline Corridor D | legacy-registra-85 |
| 2 | tax_incentive | integrated-issuing-34 | 2024-07-25 | SK | Distributed Series | compact-registra-86 |
| 3 | regulation | seasonal-issuing-35 | 2025-12-09 | US | Adaptive Assessment | composite-registra-87 |
| 4 | public_private_partnership | regional-issuing-36 | 2022-05-20 | DE | Primary Survey A | primary-registra-88 |

The view `vw_government_policy_innovative_business` joins `GovernmentPolicy` with `InnovativeBusiness` on `GovernmentPolicy.policyId = InnovativeBusiness.policyId`, producing a row that pairs each policy with the innovative business it supports. For policy `1` (`subsidy`), the view yields innovative business `1` (`product` innovation, `18` patents, R&D `14.45`). This view answers: "Which innovative business benefits from this policy?"

**View `vw_government_policy_innovative_business`**

```sql
CREATE VIEW vw_government_policy_innovative_business AS
SELECT a.policyId, a.policyType, a.issuingAuthority, a.effectiveDate, b.businessId AS business_businessId, b.innovationType AS business_innovationType, b.patentCount AS business_patentCount
FROM GovernmentPolicy a JOIN InnovativeBusiness b ON a.businessId = b.businessId;
```

| policyId | policyType | issuingAuthority | effectiveDate | business_businessId | business_innovationType | business_patentCount |
|---|---|---|---|---|---|---|
| 1 | subsidy | extended-issuing-33 | 2023-02-14 | 1 | product | 18 |
| 2 | tax_incentive | integrated-issuing-34 | 2024-07-25 | 2 | process | 28 |
| 3 | regulation | seasonal-issuing-35 | 2025-12-09 | 3 | service | 12 |
| 4 | public_private_partnership | regional-issuing-36 | 2022-05-20 | 4 | business_model | 10 |

The view `vw_innovative_business_business_entity` joins `InnovativeBusiness` with `BusinessEntity` on `InnovativeBusiness.businessId = BusinessEntity.id`, producing a row that pairs each innovative business profile with its parent entity. For innovative business `1` (`product` innovation), the view yields entity `1000` (`REG-2136`, sole proprietorship, `active`). This view answers: "Which business entity does this innovative profile belong to?"

**View `vw_innovative_business_business_entity`**

```sql
CREATE VIEW vw_innovative_business_business_entity AS
SELECT a.businessId, a.innovationType, a.patentCount, a.rAndDInvestment, b.id AS entity_id, b.registrationNumber AS entity_registrationNumber, b.legalForm AS entity_legalForm
FROM InnovativeBusiness a JOIN BusinessEntity b ON a.entityId = b.id;
```

| businessId | innovationType | patentCount | rAndDInvestment | entity_id | entity_registrationNumber | entity_legalForm |
|---|---|---|---|---|---|---|
| 1 | product | 18 | 14.45 | 1000 | REG-2136 | sole_proprietorship |
| 2 | process | 28 | 18.90 | 1001 | REG-2142 | partnership |
| 3 | service | 12 | 23.35 | 1002 | REG-2148 | corporation |
| 4 | business_model | 10 | 27.80 | 1003 | REG-2154 | limited_liability_company |

The view `vw_innovative_business_intellectual_property` joins `InnovativeBusiness` with `IntellectualProperty` on `InnovativeBusiness.propertyId = IntellectualProperty.propertyId`, producing a row that pairs each innovative business with its IP portfolio. For innovative business `1` (`product` innovation), the view yields property `1` (patent `1889767`, owned by `Roger Graham`). This view answers: "What intellectual property assets support this innovative business?"

**View `vw_innovative_business_intellectual_property`**

```sql
CREATE VIEW vw_innovative_business_intellectual_property AS
SELECT a.businessId, a.innovationType, a.patentCount, a.rAndDInvestment, b.propertyId AS property_propertyId, b.ipId AS property_ipId, b.ipType AS property_ipType
FROM InnovativeBusiness a JOIN IntellectualProperty b ON a.propertyId = b.propertyId;
```

| businessId | innovationType | patentCount | rAndDInvestment | property_propertyId | property_ipId | property_ipType |
|---|---|---|---|---|---|---|
| 1 | product | 18 | 14.45 | 1 | 1889767 | patent |
| 2 | process | 28 | 18.90 | 2 | ChIJvSxSbfdv5kcRanVzI8RRu20 | trademark |
| 3 | service | 12 | 23.35 | 3 | 2986245 | copyright |
| 4 | business_model | 10 | 27.80 | 4 | 4605 | trade_secret |

The view `vw_innovative_business_government_policy` joins `InnovativeBusiness` with `GovernmentPolicy` on `InnovativeBusiness.policyId = GovernmentPolicy.policyId`, producing a row that pairs each innovative business with its supporting policy. For innovative business `1` (`product` innovation), the view yields policy `1` (`subsidy`, issued by `extended-issuing-33`). This view answers: "What government policy supports this innovative business?"

**View `vw_innovative_business_government_policy`**

```sql
CREATE VIEW vw_innovative_business_government_policy AS
SELECT a.businessId, a.innovationType, a.patentCount, a.rAndDInvestment, b.policyId AS policy_policyId, b.policyType AS policy_policyType, b.issuingAuthority AS policy_issuingAuthority
FROM InnovativeBusiness a JOIN GovernmentPolicy b ON a.policyId = b.policyId;
```

| businessId | innovationType | patentCount | rAndDInvestment | policy_policyId | policy_policyType | policy_issuingAuthority |
|---|---|---|---|---|---|---|
| 1 | product | 18 | 14.45 | 1 | subsidy | extended-issuing-33 |
| 2 | process | 28 | 18.90 | 2 | tax_incentive | integrated-issuing-34 |
| 3 | service | 12 | 23.35 | 3 | regulation | seasonal-issuing-35 |
| 4 | business_model | 10 | 27.80 | 4 | public_private_partnership | regional-issuing-36 |

The view `vw_intellectual_property_business_entity` joins `IntellectualProperty` with `BusinessEntity` on `IntellectualProperty.entityId = BusinessEntity.id`, producing a row that pairs each IP asset with its owning entity. For property `1` (patent `1889767`), the view yields entity `1000` (`REG-2136`, sole proprietorship). This view answers: "Which entity owns this intellectual property?"

**View `vw_intellectual_property_business_entity`**

```sql
CREATE VIEW vw_intellectual_property_business_entity AS
SELECT a.propertyId, a.ipId, a.ipType, a.registrationDate, b.id AS entity_id, b.registrationNumber AS entity_registrationNumber, b.legalForm AS entity_legalForm
FROM IntellectualProperty a JOIN BusinessEntity b ON a.entityId = b.id;
```

| propertyId | ipId | ipType | registrationDate | entity_id | entity_registrationNumber | entity_legalForm |
|---|---|---|---|---|---|---|
| 1 | 1889767 | patent | 2023-06-19 | 1000 | REG-2136 | sole_proprietorship |
| 2 | ChIJvSxSbfdv5kcRanVzI8RRu20 | trademark | 2024-11-03 | 1001 | REG-2142 | partnership |
| 3 | 2986245 | copyright | 2025-04-14 | 1002 | REG-2148 | corporation |
| 4 | 4605 | trade_secret | 2022-09-25 | 1003 | REG-2154 | limited_liability_company |

The view `vw_intellectual_property_jurisdiction` joins `IntellectualProperty` with `Jurisdiction` on `IntellectualProperty.jurisdictionCountryCode = Jurisdiction.countryCode`, producing a row that pairs each IP asset with its jurisdiction. For property `1` (patent `1889767`), the view yields jurisdiction `RU` ("Baseline Corridor D", tax rate `22.45`). This view answers: "Under which jurisdiction is this IP registered?"

**View `vw_intellectual_property_jurisdiction`**

```sql
CREATE VIEW vw_intellectual_property_jurisdiction AS
SELECT a.propertyId, a.ipId, a.ipType, a.registrationDate, b.countryCode AS jurisdiction_countryCode, b.countryName AS jurisdiction_countryName, b.registrationAuthority AS jurisdiction_registrationAuthority
FROM IntellectualProperty a JOIN Jurisdiction b ON a.jurisdictionCountryCode = b.countryCode;
```

| propertyId | ipId | ipType | registrationDate | jurisdiction_countryCode | jurisdiction_countryName | jurisdiction_registrationAuthority |
|---|---|---|---|---|---|---|
| 1 | 1889767 | patent | 2023-06-19 | RU | Baseline Corridor D | legacy-registra-85 |
| 2 | ChIJvSxSbfdv5kcRanVzI8RRu20 | trademark | 2024-11-03 | SK | Distributed Series | compact-registra-86 |
| 3 | 2986245 | copyright | 2025-04-14 | US | Adaptive Assessment | composite-registra-87 |
| 4 | 4605 | trade_secret | 2022-09-25 | DE | Primary Survey A | primary-registra-88 |

The view `vw_financial_statement_business_entity` joins `FinancialStatement` with `BusinessEntity` on `FinancialStatement.entityId = BusinessEntity.id`, producing a row that pairs each financial statement with its entity. For statement `1000`, the view yields entity `1000` (`REG-2136`, sole proprietorship, `active`) with revenue `1500000.00` and net income `250000.00`. This view answers: "Which entity does this financial statement belong to?"

**View `vw_financial_statement_business_entity`**

```sql
CREATE VIEW vw_financial_statement_business_entity AS
SELECT a.statementId, a.statementType, a.reportingPeriod, a.totalRevenue, b.id AS entity_id, b.registrationNumber AS entity_registrationNumber, b.legalForm AS entity_legalForm
FROM FinancialStatement a JOIN BusinessEntity b ON a.entityId = b.id;
```

| statementId | statementType | reportingPeriod | totalRevenue | entity_id | entity_registrationNumber | entity_legalForm |
|---|---|---|---|---|---|---|
| 1000 | income_statement | 2023-06-18 | 29.24 | 1000 | REG-2136 | sole_proprietorship |
| 1001 | balance_sheet | 2024-11-02 | 18.47 | 1001 | REG-2142 | partnership |
| 1002 | cash_flow_statement | 2025-04-13 | 19.93 | 1002 | REG-2148 | corporation |
| 1003 | income_statement | 2022-09-24 | 24.09 | 1003 | REG-2154 | limited_liability_company |

The view `vw_financial_statement_auditor` joins `FinancialStatement` with `Auditor` on `FinancialStatement.auditorId = Auditor.auditorId`, producing a row that pairs each financial statement with its certifying auditor. For statement `1000`, the view yields auditor `1` (`Alice Thompson`, license `LIC-1001`, firm `Thompson & Associates`). This view answers: "Which auditor certified this financial statement?"

**View `vw_financial_statement_auditor`**

```sql
CREATE VIEW vw_financial_statement_auditor AS
SELECT a.statementId, a.statementType, a.reportingPeriod, a.totalRevenue, b.id AS auditor_id, b.auditorId AS auditor_auditorId, b.auditorName AS auditor_auditorName
FROM FinancialStatement a JOIN Auditor b ON a.auditorId = b.id;
```

| statementId | statementType | reportingPeriod | totalRevenue | auditor_id | auditor_auditorId | auditor_auditorName |
|---|---|---|---|---|---|---|
| 1000 | income_statement | 2023-06-18 | 29.24 | 1 | default_chart_a_tax_2 | Compact Initiative |
| 1001 | balance_sheet | 2024-11-02 | 18.47 | 2 | 26618685 | Legacy Model |
| 1002 | cash_flow_statement | 2025-04-13 | 19.93 | 3 | 4277022 | Regional Cluster A |
| 1003 | income_statement | 2022-09-24 | 24.09 | 4 | 8387532 | Seasonal Review |

The view `vw_auditor_financial_statement` performs the inverse join of `vw_financial_statement_auditor`, starting from `Auditor` and linking to `FinancialStatement`. For auditor `1` (`Alice Thompson`), the view yields statement `1000` with revenue `1500000.00` and net income `250000.00`. This view answers: "Which financial statements has this auditor certified?"

**View `vw_auditor_financial_statement`**

```sql
CREATE VIEW vw_auditor_financial_statement AS
SELECT a.id, a.auditorId, a.auditorName, a.licenseNumber, b.statementId AS statement_statementId, b.statementType AS statement_statementType, b.reportingPeriod AS statement_reportingPeriod
FROM Auditor a JOIN FinancialStatement b ON a.statementId = b.statementId;
```

| id | auditorId | auditorName | licenseNumber | statement_statementId | statement_statementType | statement_reportingPeriod |
|---|---|---|---|---|---|---|
| 1 | default_chart_a_tax_2 | Compact Initiative | LIC-2589 | 1000 | income_statement | 2023-06-18 |
| 2 | 26618685 | Legacy Model | LIC-2596 | 1001 | balance_sheet | 2024-11-02 |
| 3 | 4277022 | Regional Cluster A | LIC-2603 | 1002 | cash_flow_statement | 2025-04-13 |
| 4 | 8387532 | Seasonal Review | LIC-2610 | 1003 | income_statement | 2022-09-24 |

## Synthesis

The schema models a domain where business entities are the central actors, each embedded in a jurisdiction, characterized by a market structure, subject to government policy, pursuing innovation, holding intellectual property, reporting financials, and undergoing audit. The eight base tables enforce a normalized structure where each entity type occupies its own table, and foreign keys encode the cardinality-bounded relationships: one-to-one links between entities and their jurisdictions, structures, statements, and innovative profiles; one-to-one links between innovative businesses and their IP and policies; and one-to-one links between financial statements and their auditors. The twelve views materialize the most common analytical joins, each reconstructing a domain fact from the normalized tables by pairing a primary entity with its related context. Together, the base tables and views provide a complete relational representation of the regulatory, competitive, innovative, and financial dimensions of the business domain.