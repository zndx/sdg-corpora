The domain under examination is public procurement and fiscal compliance, where legislative statutes authorize withholding rules that govern how payments flow between governmental entities and contractors under formal contracts. Every financial transaction is traceable to its regulatory origin, its contracting parties, and its classification by type and status. The relational schema captures this provenance through a carefully normalized set of base tables, junction tables that resolve many-to-many relationships, and materialized views that reconstruct domain facts for analytical consumption.

## The Regulatory Foundation

The regulatory backbone of the system begins with the `Statute` table, which records the legislative instruments that authorize all subsequent withholding activity. Each statute carries a unique identifier such as `STA-2074`, a human-readable name like `Composite Series`, an enactment date of `2022-01-04`, a section number such as `SEC-2472`, and an `amends` field indicating which prior provision it modifies — for instance, `regional-amends-30`. The four statutes in the dataset (`STA-2074` through `STA-2086`) span enactment dates from early 2022 through mid-2025, reflecting an evolving legislative landscape.

**Table `Statute`**

| statuteId | statuteIdentifier | statuteName | enactmentDate | sectionNumber | amends |
|---|---|---|---|---|---|
| 1000 | STA-2074 | Composite Series | 2022-01-04 | SEC-2472 | regional-amends-30 |
| 1001 | STA-2078 | Compact Assessment A | 2023-06-15 | SEC-2477 | legacy-amends-31 |
| 1002 | STA-2082 | Legacy Survey | 2024-11-26 | SEC-2482 | compact-amends-32 |
| 1003 | STA-2086 | Regional Corridor | 2025-04-10 | SEC-2487 | composite-amends-33 |

Withholding rules are the operational instantiation of these statutes. The `WithholdingRule` table stores each rule's `ruleIdentifier` (e.g., `RUL-2144`), its `effectiveDate` (such as `2023-02-14`), the `withholdingRate` expressed as a decimal like `6.70`, a `paymentThreshold` of `20.45`, a `status` drawn from the values `proposed`, `final`, or `sunset`, the `issuingAgency` responsible for promulgation (e.g., `Technos Japan` or `Sanniquellie Mahn`), and a foreign key `statuteId` linking the rule to its authorizing statute. The `statuteId` column on `WithholdingRule` is a direct foreign key to `Statute.statuteId`, establishing a one-to-many relationship: each statute may authorize multiple withholding rules, but each rule traces to exactly one statute.

**Table `WithholdingRule`**

| id | ruleIdentifier | effectiveDate | withholdingRate | paymentThreshold | status | issuingAgency | statuteId |
|---|---|---|---|---|---|---|---|
| 1 | RUL-2144 | 2023-02-14 | 6.70 | 20.45 | proposed | Technos Japan | 1000 |
| 2 | RUL-2151 | 2024-07-25 | 11.40 | 22.90 | final | Sanniquellie Mahn | 1001 |
| 3 | RUL-2158 | 2025-12-09 | 16.10 | 25.35 | sunset | Greater Houston Community Foundation | 1002 |
| 4 | RUL-2165 | 2022-05-20 | 20.80 | 27.80 | proposed | Lucas Industries | 1003 |

The linkage between statutes and withholding rules is also materialized in the `StatuteWithholdingRule` junction table, which exists to support the many-to-many relationship that the schema permits. While the current data shows a single statute per rule, the junction table provides the flexibility for a statute to reference multiple rules and for rules to cite multiple statutes. The foreign keys `statuteId` and `withholdingRuleId` in `StatuteWithholdingRule` reference `Statute.statuteId` and `WithholdingRule.id` respectively.

**Table `StatuteWithholdingRule`**

| statuteId | ruleId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

## The Contracting Parties

Two distinct entity types participate in the procurement lifecycle: governmental entities and contractors. The `GovernmentalEntity` table records each government body with an `entityId` (e.g., `100`), an `entityIdentifier` such as `ENT-2129`, an `entityName` like `Regional Cluster`, a `jurisdictionLevel` drawn from `federal`, `state`, `local`, or `subdivision`, an `annualPaymentVolume` (e.g., `16.70`), and an `isInstrumentality` boolean flag. The four entities in the dataset illustrate the full range of jurisdiction levels, with `Seasonal Review D` operating at the state level and `Extended Model` at the subdivision level.

**Table `GovernmentalEntity`**

| entityId | entityIdentifier | entityName | jurisdictionLevel | annualPaymentVolume | isInstrumentality |
|---|---|---|---|---|---|
| 100 | ENT-2129 | Regional Cluster | federal | 16.70 | false |
| 101 | ENT-2135 | Seasonal Review D | state | 18.40 | true |
| 102 | ENT-2141 | Integrated Initiative | local | 20.10 | false |
| 103 | ENT-2147 | Extended Model | subdivision | 21.80 | true |

Contractors are recorded in the `Contractor` table, which stores a `contractorId` (e.g., `1`), a `contractorIdentifier` such as `CON-2420`, a `contractorName` like `Baseline Series D`, a `contractorType` of either `prime` or `subcontractor`, a `taxIdentificationNumber` (e.g., `TAX-2648`), and audit timestamps `createdAt` and `updatedAt`. The contractor data shows a mix of prime and subcontractor types, with creation dates spanning from January through April 2025.

**Table `Contractor`**

| contractorId | contractorIdentifier | contractorName | contractorType | taxIdentificationNumber | createdAt | updatedAt |
|---|---|---|---|---|---|---|
| 1 | CON-2420 | Baseline Series D | prime | TAX-2648 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | CON-2427 | Distributed Assessment | subcontractor | TAX-2653 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | CON-2434 | Adaptive Survey | prime | TAX-2658 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | CON-2441 | Primary Corridor A | subcontractor | TAX-2663 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Contracts formalize the relationship between a governmental entity and a contractor. The `Contract` table holds a `contractIdentifier` (e.g., `CON-2782`), an `executionDate` such as `2023-06-02`, a `totalValue` (e.g., `9.45`), a `contractType` drawn from `prime`, `subcontract`, `classified`, or `confidential`, an `isMateriallyModified` boolean, a `modificationDate` (e.g., `2025-08-03`), and foreign keys `entityId` and `contractorId` linking to the `GovernmentalEntity` and `Contractor` tables respectively. The `entityId` and `contractorId` columns on `Contract` are direct foreign keys, establishing that each contract involves exactly one governmental entity and exactly one contractor.

**Table `Contract`**

| id | contractIdentifier | executionDate | totalValue | contractType | isMateriallyModified | modificationDate | entityId | contractorId |
|---|---|---|---|---|---|---|---|---|
| 1 | CON-2782 | 2023-06-02 | 9.45 | prime | true | 2025-08-03 | 100 | 1 |
| 2 | CON-2786 | 2024-11-13 | 12.90 | subcontract | false | 2022-01-14 | 101 | 2 |
| 3 | CON-2790 | 2025-04-24 | 16.35 | classified | true | 2023-06-25 | 102 | 3 |
| 4 | CON-2794 | 2022-09-08 | 19.80 | confidential | false | 2024-11-09 | 103 | 4 |

The `GovernmentalEntityContract` junction table and the `ContractorContract` junction table exist to support the many-to-many relationships between entities, contractors, and contracts. The `GovernmentalEntityContract` table contains foreign keys `entityId` and `contractId` referencing `GovernmentalEntity.entityId` and `Contract.id`, while `ContractorContract` contains `contractorId` and `contractId` referencing `Contractor.contractorId` and `Contract.id`. These junction tables allow a single governmental entity to be associated with multiple contracts and a single contractor to participate in multiple contracts, reflecting the real-world complexity of procurement ecosystems.

**Table `GovernmentalEntityContract`**

| entityId | contractId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `ContractorContract`**

| contractorId | contractId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## The Payment Flow

Payments are the terminal financial events in this domain. The `Payment` table records each disbursement with a `paymentIdentifier` (e.g., `PAY-2093`), an `amount` (such as `13.49` or `40,408`), a `disbursementDate` in ISO 8601 format (e.g., `2024-03-25T14:30:00`), a `paymentType` drawn from `supply`, `service`, `interim`, or `progress`, an `isWithheld` boolean, a `withholdingAmount` (e.g., `21.11` or `434.86`), and foreign keys `entityId`, `contractorId`, and `contractId` linking the payment to its originating governmental entity, contractor, and contract respectively.

**Table `Payment`**

| id | paymentIdentifier | amount | disbursementDate | paymentType | isWithheld | withholdingAmount | entityId | contractorId | contractId |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | PAY-2093 | 13.49 | 2024-03-25T14:30:00 | supply | false | 21.11 | 100 | 1 | 1 |
| 1001 | PAY-2095 | 25.47 | 2025-08-09T21:47:00 | service | true | 434.86 | 101 | 2 | 2 |
| 1002 | PAY-2097 | 19.72 | 2022-01-20T04:04:00 | interim | false | 9.99 | 102 | 3 | 3 |
| 1003 | PAY-2099 | 12.74 | 2023-06-04T11:21:00 | progress | true | 40,408 | 103 | 4 | 4 |

The `isWithheld` column on `Payment` indicates whether the payment is subject to withholding under an applicable rule, and the `withholdingAmount` quantifies the withheld portion. Notably, payments with `isWithheld` set to `false` still carry a `withholdingAmount` value — for example, payment `PAY-2093` has `isWithheld` as `false` but a `withholdingAmount` of `21.11` — suggesting that the withholding amount is computed or recorded independently of the flag, perhaps for audit or reconciliation purposes.

The `ContractPayment` junction table links contracts to payments, with foreign keys `contractId` and `paymentId` referencing `Contract.id` and `Payment.id`. Similarly, `GovernmentalEntityPayment` links entities to payments via `entityId` and `paymentId`, and `ContractorPayment` links contractors to payments via `contractorId` and `paymentId`. These three junction tables allow a single payment to be associated with multiple contracts, entities, or contractors, and conversely allow a single contract, entity, or contractor to be associated with multiple payments.

**Table `ContractPayment`**

| contractId | paymentId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `GovernmentalEntityPayment`**

| entityId | paymentId |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `ContractorPayment`**

| contractorId | paymentId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `WithholdingRulePayment` junction table connects withholding rules to payments, with foreign keys `withholdingRuleId` and `paymentId` referencing `WithholdingRule.id` and `Payment.id`. This table materializes the relationship between a regulatory rule and the specific payments it governs. A payment may be subject to multiple withholding rules, and a withholding rule may apply to many payments.

**Table `WithholdingRulePayment`**

| ruleId | paymentId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

## Reconstructing Domain Facts Through Views

The base tables and junction tables provide a fully normalized storage layer. Views materialize the analytical relationships that domain users need, each joining the appropriate base and junction tables to reconstruct a coherent fact from the normalized fragments.

The view `v_withholding_rule_payment_detail` joins `WithholdingRule` through `WithholdingRulePayment` to `Payment`, answering the question: which payments are governed by which withholding rules, and what are the financial details of those payments? A row in this view might show rule `RUL-2144` with a withholding rate of `6.70` applied to payment `PAY-2093` of amount `13.49`, with a withholding amount of `21.11`.

**View `v_withholding_rule_payment_detail`**

```sql
CREATE VIEW v_withholding_rule_payment_detail AS
SELECT a.id, a.ruleIdentifier, a.effectiveDate, b.id AS payment_id, b.paymentIdentifier AS payment_paymentIdentifier, b.amount AS payment_amount
FROM WithholdingRule a
  JOIN WithholdingRulePayment j ON j.ruleId = a.id
  JOIN Payment b ON b.id = j.paymentId;
```

| id | ruleIdentifier | effectiveDate | payment_id | payment_paymentIdentifier | payment_amount |
|---|---|---|---|---|---|
| 1 | RUL-2144 | 2023-02-14 | 1000 | PAY-2093 | 13.49 |
| 1 | RUL-2144 | 2023-02-14 | 1001 | PAY-2095 | 25.47 |
| 2 | RUL-2151 | 2024-07-25 | 1001 | PAY-2095 | 25.47 |
| 2 | RUL-2151 | 2024-07-25 | 1002 | PAY-2097 | 19.72 |
| 3 | RUL-2158 | 2025-12-09 | 1002 | PAY-2097 | 19.72 |
| 3 | RUL-2158 | 2025-12-09 | 1003 | PAY-2099 | 12.74 |
| 4 | RUL-2165 | 2022-05-20 | 1003 | PAY-2099 | 12.74 |
| 4 | RUL-2165 | 2022-05-20 | 1000 | PAY-2093 | 13.49 |

The view `v_withholding_rule_statute` joins `WithholdingRule` through `StatuteWithholdingRule` to `Statute`, answering: which statute authorizes which withholding rule? A row might show rule `RUL-2144` issued by `Technos Japan` under statute `STA-2074` (`Composite Series`), enacted on `2022-01-04`.

**View `v_withholding_rule_statute`**

```sql
CREATE VIEW v_withholding_rule_statute AS
SELECT a.id, a.ruleIdentifier, a.effectiveDate, a.withholdingRate, b.statuteId AS statute_statuteId, b.statuteIdentifier AS statute_statuteIdentifier, b.statuteName AS statute_statuteName
FROM WithholdingRule a JOIN Statute b ON a.statuteId = b.statuteId;
```

| id | ruleIdentifier | effectiveDate | withholdingRate | statute_statuteId | statute_statuteIdentifier | statute_statuteName |
|---|---|---|---|---|---|---|
| 1 | RUL-2144 | 2023-02-14 | 6.70 | 1000 | STA-2074 | Composite Series |
| 2 | RUL-2151 | 2024-07-25 | 11.40 | 1001 | STA-2078 | Compact Assessment A |
| 3 | RUL-2158 | 2025-12-09 | 16.10 | 1002 | STA-2082 | Legacy Survey |
| 4 | RUL-2165 | 2022-05-20 | 20.80 | 1003 | STA-2086 | Regional Corridor |

The view `v_payment_governmental_entity` joins `Payment` through `GovernmentalEntityPayment` to `GovernmentalEntity`, answering: which governmental entity is associated with which payment? A row might show payment `PAY-2093` of type `supply` linked to entity `ENT-2129` (`Regional Cluster`) at the federal jurisdiction level.

**View `v_payment_governmental_entity`**

```sql
CREATE VIEW v_payment_governmental_entity AS
SELECT a.id, a.paymentIdentifier, a.amount, a.disbursementDate, b.entityId AS entity_entityId, b.entityIdentifier AS entity_entityIdentifier, b.entityName AS entity_entityName
FROM Payment a JOIN GovernmentalEntity b ON a.entityId = b.entityId;
```

| id | paymentIdentifier | amount | disbursementDate | entity_entityId | entity_entityIdentifier | entity_entityName |
|---|---|---|---|---|---|---|
| 1000 | PAY-2093 | 13.49 | 2024-03-25T14:30:00 | 100 | ENT-2129 | Regional Cluster |
| 1001 | PAY-2095 | 25.47 | 2025-08-09T21:47:00 | 101 | ENT-2135 | Seasonal Review D |
| 1002 | PAY-2097 | 19.72 | 2022-01-20T04:04:00 | 102 | ENT-2141 | Integrated Initiative |
| 1003 | PAY-2099 | 12.74 | 2023-06-04T11:21:00 | 103 | ENT-2147 | Extended Model |

The view `v_payment_contractor` joins `Payment` through `ContractorPayment` to `Contractor`, answering: which contractor received or is associated with which payment? A row might show payment `PAY-2093` linked to contractor `CON-2420` (`Baseline Series D`), a prime contractor with tax ID `TAX-2648`.

**View `v_payment_contractor`**

```sql
CREATE VIEW v_payment_contractor AS
SELECT a.id, a.paymentIdentifier, a.amount, a.disbursementDate, b.contractorId AS contractor_contractorId, b.contractorIdentifier AS contractor_contractorIdentifier, b.contractorName AS contractor_contractorName
FROM Payment a JOIN Contractor b ON a.contractorId = b.contractorId;
```

| id | paymentIdentifier | amount | disbursementDate | contractor_contractorId | contractor_contractorIdentifier | contractor_contractorName |
|---|---|---|---|---|---|---|
| 1000 | PAY-2093 | 13.49 | 2024-03-25T14:30:00 | 1 | CON-2420 | Baseline Series D |
| 1001 | PAY-2095 | 25.47 | 2025-08-09T21:47:00 | 2 | CON-2427 | Distributed Assessment |
| 1002 | PAY-2097 | 19.72 | 2022-01-20T04:04:00 | 3 | CON-2434 | Adaptive Survey |
| 1003 | PAY-2099 | 12.74 | 2023-06-04T11:21:00 | 4 | CON-2441 | Primary Corridor A |

The view `v_payment_contract` joins `Payment` through `ContractPayment` to `Contract`, answering: which contract generated which payment? A row might show payment `PAY-2093` under contract `CON-2782` with a total value of `9.45` and type `prime`.

**View `v_payment_contract`**

```sql
CREATE VIEW v_payment_contract AS
SELECT a.id, a.paymentIdentifier, a.amount, a.disbursementDate, b.id AS contract_id, b.contractIdentifier AS contract_contractIdentifier, b.executionDate AS contract_executionDate
FROM Payment a JOIN Contract b ON a.contractId = b.id;
```

| id | paymentIdentifier | amount | disbursementDate | contract_id | contract_contractIdentifier | contract_executionDate |
|---|---|---|---|---|---|---|
| 1000 | PAY-2093 | 13.49 | 2024-03-25T14:30:00 | 1 | CON-2782 | 2023-06-02 |
| 1001 | PAY-2095 | 25.47 | 2025-08-09T21:47:00 | 2 | CON-2786 | 2024-11-13 |
| 1002 | PAY-2097 | 19.72 | 2022-01-20T04:04:00 | 3 | CON-2790 | 2025-04-24 |
| 1003 | PAY-2099 | 12.74 | 2023-06-04T11:21:00 | 4 | CON-2794 | 2022-09-08 |

The view `v_contract_governmental_entity` joins `Contract` through `GovernmentalEntityContract` to `GovernmentalEntity`, answering: which governmental entity awarded which contract? A row might show contract `CON-2782` awarded by entity `ENT-2129` (`Regional Cluster`) at the federal level.

**View `v_contract_governmental_entity`**

```sql
CREATE VIEW v_contract_governmental_entity AS
SELECT a.id, a.contractIdentifier, a.executionDate, a.totalValue, b.entityId AS entity_entityId, b.entityIdentifier AS entity_entityIdentifier, b.entityName AS entity_entityName
FROM Contract a JOIN GovernmentalEntity b ON a.entityId = b.entityId;
```

| id | contractIdentifier | executionDate | totalValue | entity_entityId | entity_entityIdentifier | entity_entityName |
|---|---|---|---|---|---|---|
| 1 | CON-2782 | 2023-06-02 | 9.45 | 100 | ENT-2129 | Regional Cluster |
| 2 | CON-2786 | 2024-11-13 | 12.90 | 101 | ENT-2135 | Seasonal Review D |
| 3 | CON-2790 | 2025-04-24 | 16.35 | 102 | ENT-2141 | Integrated Initiative |
| 4 | CON-2794 | 2022-09-08 | 19.80 | 103 | ENT-2147 | Extended Model |

The view `v_contract_contractor` joins `Contract` through `ContractorContract` to `Contractor`, answering: which contractor holds which contract? A row might show contract `CON-2782` held by contractor `CON-2420` (`Baseline Series D`), a prime contractor.

**View `v_contract_contractor`**

```sql
CREATE VIEW v_contract_contractor AS
SELECT a.id, a.contractIdentifier, a.executionDate, a.totalValue, b.contractorId AS contractor_contractorId, b.contractorIdentifier AS contractor_contractorIdentifier, b.contractorName AS contractor_contractorName
FROM Contract a JOIN Contractor b ON a.contractorId = b.contractorId;
```

| id | contractIdentifier | executionDate | totalValue | contractor_contractorId | contractor_contractorIdentifier | contractor_contractorName |
|---|---|---|---|---|---|---|
| 1 | CON-2782 | 2023-06-02 | 9.45 | 1 | CON-2420 | Baseline Series D |
| 2 | CON-2786 | 2024-11-13 | 12.90 | 2 | CON-2427 | Distributed Assessment |
| 3 | CON-2790 | 2025-04-24 | 16.35 | 3 | CON-2434 | Adaptive Survey |
| 4 | CON-2794 | 2022-09-08 | 19.80 | 4 | CON-2441 | Primary Corridor A |

The view `v_contract_payment_detail` joins `Contract` through `ContractPayment` to `Payment`, answering: which payments were generated under which contracts, and what are their financial characteristics? A row might show contract `CON-2782` with payment `PAY-2093` of amount `13.49` and type `supply`, with a withholding amount of `21.11`.

**View `v_contract_payment_detail`**

```sql
CREATE VIEW v_contract_payment_detail AS
SELECT a.id, a.contractIdentifier, a.executionDate, b.id AS payment_id, b.paymentIdentifier AS payment_paymentIdentifier, b.amount AS payment_amount
FROM Contract a
  JOIN ContractPayment j ON j.contractId = a.id
  JOIN Payment b ON b.id = j.paymentId;
```

| id | contractIdentifier | executionDate | payment_id | payment_paymentIdentifier | payment_amount |
|---|---|---|---|---|---|
| 1 | CON-2782 | 2023-06-02 | 1000 | PAY-2093 | 13.49 |
| 1 | CON-2782 | 2023-06-02 | 1001 | PAY-2095 | 25.47 |
| 2 | CON-2786 | 2024-11-13 | 1001 | PAY-2095 | 25.47 |
| 2 | CON-2786 | 2024-11-13 | 1002 | PAY-2097 | 19.72 |
| 3 | CON-2790 | 2025-04-24 | 1002 | PAY-2097 | 19.72 |
| 3 | CON-2790 | 2025-04-24 | 1003 | PAY-2099 | 12.74 |
| 4 | CON-2794 | 2022-09-08 | 1003 | PAY-2099 | 12.74 |
| 4 | CON-2794 | 2022-09-08 | 1000 | PAY-2093 | 13.49 |

The view `v_governmental_entity_payment_detail` joins `GovernmentalEntity` through `GovernmentalEntityPayment` to `Payment`, answering: which payments are associated with which governmental entities, and what are their financial details? A row might show entity `ENT-2129` (`Regional Cluster`) linked to payment `PAY-2093` of amount `13.49` and type `supply`.

**View `v_governmental_entity_payment_detail`**

```sql
CREATE VIEW v_governmental_entity_payment_detail AS
SELECT a.entityId, a.entityIdentifier, a.entityName, b.id AS payment_id, b.paymentIdentifier AS payment_paymentIdentifier, b.amount AS payment_amount
FROM GovernmentalEntity a
  JOIN GovernmentalEntityPayment j ON j.entityId = a.entityId
  JOIN Payment b ON b.id = j.paymentId;
```

| entityId | entityIdentifier | entityName | payment_id | payment_paymentIdentifier | payment_amount |
|---|---|---|---|---|---|
| 100 | ENT-2129 | Regional Cluster | 1000 | PAY-2093 | 13.49 |
| 100 | ENT-2129 | Regional Cluster | 1001 | PAY-2095 | 25.47 |
| 101 | ENT-2135 | Seasonal Review D | 1001 | PAY-2095 | 25.47 |
| 101 | ENT-2135 | Seasonal Review D | 1002 | PAY-2097 | 19.72 |
| 102 | ENT-2141 | Integrated Initiative | 1002 | PAY-2097 | 19.72 |
| 102 | ENT-2141 | Integrated Initiative | 1003 | PAY-2099 | 12.74 |
| 103 | ENT-2147 | Extended Model | 1003 | PAY-2099 | 12.74 |
| 103 | ENT-2147 | Extended Model | 1000 | PAY-2093 | 13.49 |

The view `v_governmental_entity_contract_detail` joins `GovernmentalEntity` through `GovernmentalEntityContract` to `Contract`, answering: which contracts were awarded by which governmental entities, and what are their terms? A row might show entity `ENT-2129` (`Regional Cluster`) linked to contract `CON-2782` with total value `9.45` and type `prime`, materially modified on `2025-08-03`.

**View `v_governmental_entity_contract_detail`**

```sql
CREATE VIEW v_governmental_entity_contract_detail AS
SELECT a.entityId, a.entityIdentifier, a.entityName, b.id AS contract_id, b.contractIdentifier AS contract_contractIdentifier, b.executionDate AS contract_executionDate
FROM GovernmentalEntity a
  JOIN GovernmentalEntityContract j ON j.entityId = a.entityId
  JOIN Contract b ON b.id = j.contractId;
```

| entityId | entityIdentifier | entityName | contract_id | contract_contractIdentifier | contract_executionDate |
|---|---|---|---|---|---|
| 100 | ENT-2129 | Regional Cluster | 1 | CON-2782 | 2023-06-02 |
| 100 | ENT-2129 | Regional Cluster | 2 | CON-2786 | 2024-11-13 |
| 101 | ENT-2135 | Seasonal Review D | 2 | CON-2786 | 2024-11-13 |
| 101 | ENT-2135 | Seasonal Review D | 3 | CON-2790 | 2025-04-24 |
| 102 | ENT-2141 | Integrated Initiative | 3 | CON-2790 | 2025-04-24 |
| 102 | ENT-2141 | Integrated Initiative | 4 | CON-2794 | 2022-09-08 |
| 103 | ENT-2147 | Extended Model | 4 | CON-2794 | 2022-09-08 |
| 103 | ENT-2147 | Extended Model | 1 | CON-2782 | 2023-06-02 |

The view `v_contractor_payment_detail` joins `Contractor` through `ContractorPayment` to `Payment`, answering: which payments are associated with which contractors, and what are their financial characteristics? A row might show contractor `CON-2420` (`Baseline Series D`) linked to payment `PAY-2093` of amount `13.49` and type `supply`.

**View `v_contractor_payment_detail`**

```sql
CREATE VIEW v_contractor_payment_detail AS
SELECT a.contractorId, a.contractorIdentifier, a.contractorName, b.id AS payment_id, b.paymentIdentifier AS payment_paymentIdentifier, b.amount AS payment_amount
FROM Contractor a
  JOIN ContractorPayment j ON j.contractorId = a.contractorId
  JOIN Payment b ON b.id = j.paymentId;
```

| contractorId | contractorIdentifier | contractorName | payment_id | payment_paymentIdentifier | payment_amount |
|---|---|---|---|---|---|
| 1 | CON-2420 | Baseline Series D | 1000 | PAY-2093 | 13.49 |
| 1 | CON-2420 | Baseline Series D | 1001 | PAY-2095 | 25.47 |
| 2 | CON-2427 | Distributed Assessment | 1001 | PAY-2095 | 25.47 |
| 2 | CON-2427 | Distributed Assessment | 1002 | PAY-2097 | 19.72 |
| 3 | CON-2434 | Adaptive Survey | 1002 | PAY-2097 | 19.72 |
| 3 | CON-2434 | Adaptive Survey | 1003 | PAY-2099 | 12.74 |
| 4 | CON-2441 | Primary Corridor A | 1003 | PAY-2099 | 12.74 |
| 4 | CON-2441 | Primary Corridor A | 1000 | PAY-2093 | 13.49 |

The view `v_contractor_contract_detail` joins `Contractor` through `ContractorContract` to `Contract`, answering: which contracts are held by which contractors, and what are their terms? A row might show contractor `CON-2420` (`Baseline Series D`) holding contract `CON-2782` with total value `9.45` and type `prime`.

**View `v_contractor_contract_detail`**

```sql
CREATE VIEW v_contractor_contract_detail AS
SELECT a.contractorId, a.contractorIdentifier, a.contractorName, b.id AS contract_id, b.contractIdentifier AS contract_contractIdentifier, b.executionDate AS contract_executionDate
FROM Contractor a
  JOIN ContractorContract j ON j.contractorId = a.contractorId
  JOIN Contract b ON b.id = j.contractId;
```

| contractorId | contractorIdentifier | contractorName | contract_id | contract_contractIdentifier | contract_executionDate |
|---|---|---|---|---|---|
| 1 | CON-2420 | Baseline Series D | 1 | CON-2782 | 2023-06-02 |
| 1 | CON-2420 | Baseline Series D | 2 | CON-2786 | 2024-11-13 |
| 2 | CON-2427 | Distributed Assessment | 2 | CON-2786 | 2024-11-13 |
| 2 | CON-2427 | Distributed Assessment | 3 | CON-2790 | 2025-04-24 |
| 3 | CON-2434 | Adaptive Survey | 3 | CON-2790 | 2025-04-24 |
| 3 | CON-2434 | Adaptive Survey | 4 | CON-2794 | 2022-09-08 |
| 4 | CON-2441 | Primary Corridor A | 4 | CON-2794 | 2022-09-08 |
| 4 | CON-2441 | Primary Corridor A | 1 | CON-2782 | 2023-06-02 |

The view `v_statute_withholding_rule_detail` joins `Statute` through `StatuteWithholdingRule` to `WithholdingRule`, answering: which withholding rules are authorized by which statutes, and what are the rule parameters? A row might show statute `STA-2074` (`Composite Series`) authorizing rule `RUL-2144` with a withholding rate of `6.70` and payment threshold of `20.45`, issued by `Technos Japan`.

**View `v_statute_withholding_rule_detail`**

```sql
CREATE VIEW v_statute_withholding_rule_detail AS
SELECT a.statuteId, a.statuteIdentifier, a.statuteName, b.id AS rule_id, b.ruleIdentifier AS rule_ruleIdentifier, b.effectiveDate AS rule_effectiveDate
FROM Statute a
  JOIN StatuteWithholdingRule j ON j.statuteId = a.statuteId
  JOIN WithholdingRule b ON b.id = j.ruleId;
```

| statuteId | statuteIdentifier | statuteName | rule_id | rule_ruleIdentifier | rule_effectiveDate |
|---|---|---|---|---|---|
| 1000 | STA-2074 | Composite Series | 1 | RUL-2144 | 2023-02-14 |
| 1000 | STA-2074 | Composite Series | 2 | RUL-2151 | 2024-07-25 |
| 1001 | STA-2078 | Compact Assessment A | 2 | RUL-2151 | 2024-07-25 |
| 1001 | STA-2078 | Compact Assessment A | 3 | RUL-2158 | 2025-12-09 |
| 1002 | STA-2082 | Legacy Survey | 3 | RUL-2158 | 2025-12-09 |
| 1002 | STA-2082 | Legacy Survey | 4 | RUL-2165 | 2022-05-20 |
| 1003 | STA-2086 | Regional Corridor | 4 | RUL-2165 | 2022-05-20 |
| 1003 | STA-2086 | Regional Corridor | 1 | RUL-2144 | 2023-02-14 |

## Synthesis

The schema models a procurement compliance domain where legislative authority flows downward through withholding rules to payments, and contracting relationships flow laterally between governmental entities and contractors through contracts. The base tables capture each entity type with its natural attributes, while the junction tables resolve the many-to-many relationships that arise when a single payment touches multiple rules, entities, contractors, or contracts. The views reconstruct the analytical facts that domain users need — tracing a payment back to its regulatory origin, its contracting parties, and its financial characteristics — without requiring users to manually navigate the normalized join paths. Every identifier, every rate, every date in the data serves as a concrete anchor in this provenance chain, ensuring that any payment can be audited from its dollar amount all the way back to the statute that authorized the withholding rule that governs it.