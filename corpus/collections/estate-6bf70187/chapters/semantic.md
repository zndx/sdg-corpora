The estate management domain captures the lifecycle of financial assets from accumulation through distribution, modelling how individuals hold investment fund accounts, designate beneficiaries, share ownership with others, execute wills, and orchestrate systematic withdrawals to bank accounts. At the heart of the model sit ten base tables that normalise these concepts into a relational schema, and twenty-two views that reassemble the normalised facts into domain-level narratives. Each table stores a single entity type; foreign keys encode cardinality-bounded relationships; and junction tables resolve many-to-many associations between persons and the ownership or withdrawal events they participate in.

## The estate as the central fact

The `estates` table anchors the domain. Each row represents a discrete estate with a surrogate primary key `estate_id`, a human-readable `identifier` such as `IDE-2086`, and an `owner_name` like `Craig Childs`. The `total_value` column holds a numeric measure — `9.45` for the first estate, `12.90` for the second — while `currency_code` stores a code such as `gd_fp_eu_acc3` or `managing-resources`. The `creation_date` is a timestamp (`2022-01-13T12:24:00`), and `status` classifies the estate as `active`, `probate`, or `settled`. Three foreign keys — `beneficiary_designation_id`, `joint_ownership_id`, and `will_id` — point into the `beneficiary_designations`, `joint_ownerships`, and `wills` tables respectively, establishing that every estate carries exactly one beneficiary designation, one joint ownership record, and one will.

**Table `estates`**

| estate_id | identifier | owner_name | total_value | currency_code | creation_date | status | beneficiary_designation_id | joint_ownership_id | will_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Craig Childs | 9.45 | gd_fp_eu_acc3 | 2022-01-13T12:24:00 | active | 1 | 100 | 1 |
| 2 | IDE-2091 | Kimberly Smith | 12.90 | managing-resources | 2023-06-24T19:41:00 | probate | 2 | 101 | 2 |
| 3 | IDE-2096 | Michelle Kelley | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-11-08T02:58:00 | settled | 3 | 102 | 3 |
| 4 | IDE-2101 | Jorge Sullivan | 19.80 | 10445649 | 2025-04-19T09:15:00 | active | 4 | 103 | 4 |

The one-to-one cardinality of these relationships means the foreign keys in `estates` are non-nullable and unique per estate. The data confirms this: estate `IDE-2086` references beneficiary designation `1`, joint ownership `100`, and will `1` in a single coherent row.

## Beneficiary designations and their account linkage

The `beneficiary_designations` table stores the legal instruction that names a beneficiary and assigns a percentage share of an investment fund account. Its primary key is `id`, and it carries a business identifier `designation_id` (values such as `605954`, `32829`, `1202-0001-S`, and `ale`). The `account_reference` column (`legacy-account-61`, `compact-account-62`, etc.) provides a human-readable alias, while `named_beneficiary` holds a code like `regional-named-54`. The `percentage_share` is a decimal (`2.45`, `4.90`, `7.35`, `9.80`), and `effective_date` records when the designation took effect. The `revocable` flag (`true` or `false`) indicates whether the designation can be altered.

**Table `beneficiary_designations`**

| id | designation_id | account_reference | named_beneficiary | percentage_share | effective_date | revocable | investment_fund_account_id | person_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 605954 | legacy-account-61 | regional-named-54 | 2.45 | 2023-02-14 | false | 1 | 100 |
| 2 | 32829 | compact-account-62 | legacy-named-55 | 4.90 | 2024-07-25 | true | 2 | 101 |
| 3 | 1202-0001-S | composite-account-63 | compact-named-56 | 7.35 | 2025-12-09 | false | 3 | 102 |
| 4 | ale | primary-account-64 | composite-named-57 | 9.80 | 2022-05-20 | true | 4 | 103 |

Two foreign keys bind this table to the rest of the schema: `investment_fund_account_id` points to `investment_fund_accounts.id`, and `person_id` points to `persons.person_id`. In the data, designation `1` links to investment fund account `1` and person `100`, forming a tight triplet of account → beneficiary → person.

## Joint ownerships and survivorship

The `joint_ownerships` table models shared ownership of an investment fund account. Its primary key is `joint_ownership_id` (values `100` through `103`), and it carries a UUID-style `ownership_id` (`9bb5de9a-8fcc-11eb-924d-9cd76263cbd0`, `13734000`, etc.). The `asset_type` column (`pilot-asset-86`, `extended-asset-87`, `integrated-asset-88`, `seasonal-asset-89`) classifies the shared asset, while `survivorship_right` is a boolean indicating whether the surviving co-owner inherits the share. `registration_date` (`2023-06-19`, `2024-11-03`, etc.), `jurisdiction` (`regional-jurisdic-30`, `legacy-jurisdic-31`, etc.), and `ownership_percentage` (`6.95`, `8.90`, `10.85`, `12.80`) complete the record. A single foreign key, `investment_fund_account_id`, ties the joint ownership to exactly one investment fund account.

**Table `joint_ownerships`**

| joint_ownership_id | ownership_id | asset_type | survivorship_right | registration_date | jurisdiction | ownership_percentage | investment_fund_account_id |
|---|---|---|---|---|---|---|---|
| 100 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | pilot-asset-86 | true | 2023-06-19 | regional-jurisdic-30 | 6.95 | 1 |
| 101 | 13734000 | extended-asset-87 | false | 2024-11-03 | legacy-jurisdic-31 | 8.90 | 2 |
| 102 | 937736 | integrated-asset-88 | true | 2025-04-14 | compact-jurisdic-32 | 10.85 | 3 |
| 103 | 10966212 | seasonal-asset-89 | false | 2022-09-25 | composite-jurisdic-33 | 12.80 | 4 |

## Wills and their testators

The `wills` table stores testamentary instruments. Its primary key is `will_id`, and it records the `testator_name` (`Primary Standard A`, `Composite Framework`, `Compact Protocol`, `Legacy Programme D`), the `execution_date`, and a `probate_filed` boolean. The `executor_name` (`Integrated Series A`, `Extended Assessment`, `Pilot Survey`, `Baseline Corridor D`) names the person responsible for administering the estate, while `last_amendment_date` tracks the most recent revision. Two foreign keys anchor the will: `estate_id` points to `estates.estate_id`, and `person_id` points to `persons.person_id`, identifying the testator.

**Table `wills`**

| will_id | testator_name | execution_date | probate_filed | executor_name | last_amendment_date | estate_id | person_id |
|---|---|---|---|---|---|---|---|
| 1 | Primary Standard A | 2023-06-02 | true | Integrated Series A | 2025-08-18 | 1 | 100 |
| 2 | Composite Framework | 2024-11-13 | false | Extended Assessment | 2022-01-02 | 2 | 101 |
| 3 | Compact Protocol | 2025-04-24 | true | Pilot Survey | 2023-06-13 | 3 | 102 |
| 4 | Legacy Programme D | 2022-09-08 | false | Baseline Corridor D | 2024-11-24 | 4 | 103 |

## Investment fund accounts as the asset hub

The `investment_fund_accounts` table is the most heavily connected entity. Its primary key is `id`, and each row carries an `account_number` (`ACC-2253`, `ACC-2256`, `ACC-2259`, `ACC-2262`), a `fund_type` (`compact-fund-62`, `composite-fund-63`, `primary-fund-64`, `adaptive-fund-65`), and a `tax_efficiency` boolean. The `current_balance` column holds values such as `1,387`, `1,867`, `65.72`, and `2,453`. The `currency_code` (`gd_fp_eu_acc3`, `managing-resources`, etc.) and `account_status` (`active`, `closed`, `frozen`) describe the account's financial state.

**Table `investment_fund_accounts`**

| id | account_number | fund_type | tax_efficiency | current_balance | currency_code | account_status | person_id | systematic_withdrawal_id | beneficiary_designation_id | joint_ownership_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2253 | compact-fund-62 | false | 1,387 | gd_fp_eu_acc3 | active | 100 | 1 | 1 | 100 |
| 2 | ACC-2256 | composite-fund-63 | true | 1,867 | managing-resources | closed | 101 | 2 | 2 | 101 |
| 3 | ACC-2259 | primary-fund-64 | false | 65.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | frozen | 102 | 3 | 3 | 102 |
| 4 | ACC-2262 | adaptive-fund-65 | true | 2,453 | 10445649 | active | 103 | 4 | 4 | 103 |

Four foreign keys make this table the hub of the schema: `person_id` links to the account holder in `persons`; `systematic_withdrawal_id` links to the associated withdrawal plan in `systematic_withdrawals`; `beneficiary_designation_id` links to the designation in `beneficiary_designations`; and `joint_ownership_id` links to the joint ownership in `joint_ownerships`. The data shows account `ACC-2253` (person `100`, withdrawal `1`, designation `1`, joint ownership `100`) as a fully connected example.

## Systematic withdrawals and bank destinations

The `systematic_withdrawals` table models recurring distributions from an investment fund account to a bank account. Its primary key is `id`, and it carries a `withdrawal_id` (`69448`, `726044`, `505990`, `77ceed4d3f63425c9e06215ff5acfc8a`). The `frequency` column (`monthly`, `quarterly`, `annually`) specifies the payout cadence, while `amount` records the per-payment value (`13.49`, `25.47`, `19.72`, `12.74`). The `start_date` and `end_date` define the withdrawal window, and `tax_liability_share` (`19.95`, `21.90`, `23.85`, `25.80`) allocates tax responsibility. Two foreign keys bind the withdrawal: `investment_fund_account_id` points to the source account, and `bank_account_id` points to the destination in `bank_accounts`. Timestamps `created_at` and `updated_at` (`2025-01-01 00:14:00`, `2025-01-02 00:41:00`) track the record's lifecycle.

**Table `systematic_withdrawals`**

| id | withdrawal_id | frequency | amount | start_date | end_date | tax_liability_share | investment_fund_account_id | bank_account_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 69448 | monthly | 13.49 | 2022-09-05 | 2022-09-01 | 19.95 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 726044 | quarterly | 25.47 | 2023-02-16 | 2023-02-12 | 21.90 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 505990 | annually | 19.72 | 2024-07-27 | 2024-07-23 | 23.85 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly | 12.74 | 2025-12-11 | 2025-12-07 | 25.80 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Persons and bank accounts as reference entities

The `persons` table stores individual-level data with primary key `person_id`. In the data, person identifiers run from `100` to `103`, and each person is referenced by multiple other tables — beneficiary designations, wills, investment fund accounts, and the junction tables. The `bank_accounts` table stores financial institution accounts with primary key `bank_account_id` (values `1` through `4`), and is referenced by `systematic_withdrawals` as the destination for payouts.

**Table `persons`**

| id | person_id | full_name | date_of_birth | relationship_to_testator | tax_residency | generation | investment_fund_account_id | will_id | systematic_withdrawal_id | joint_ownership_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | Theodore Mcgrath | 2025-04-02 | regional-relation-42 | baseline-tax-25 | parent | 1 | 1 | 1 | 100 |
| 101 | Maria Rodriguez | Account Name | 2022-09-13 | legacy-relation-43 | pilot-tax-26 | child | 2 | 2 | 2 | 101 |
| 102 | Sarah Villanueva | Saipan International Airport | 2023-02-24 | compact-relation-44 | extended-tax-27 | grandchild | 3 | 3 | 3 | 102 |
| 103 | Susan Wagner | Norma Fisher | 2024-07-08 | composite-relation-45 | integrated-tax-28 | parent | 4 | 4 | 4 | 103 |

**Table `bank_accounts`**

| bank_account_id | account_number | bank_name | account_type | currency_code | open_date | status | systematic_withdrawal_id | person_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2253 | Compact Initiative | baseline-account-25 | gd_fp_eu_acc3 | 2025-08-07 | active | 1 | 100 |
| 2 | ACC-2256 | Legacy Model | pilot-account-26 | managing-resources | 2022-01-18 | closed | 2 | 101 |
| 3 | ACC-2259 | Regional Cluster A | extended-account-27 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-02 | dormant | 3 | 102 |
| 4 | ACC-2262 | Seasonal Review | integrated-account-28 | 10445649 | 2024-11-13 | active | 4 | 103 |

## Junction tables for many-to-many associations

Two junction tables resolve many-to-many relationships that cannot be expressed through single foreign keys. The `ownerships_persons` table links persons to joint ownerships, with composite foreign keys `ownership_id` and `person_id`. Each row states that a particular person participates in a particular joint ownership. Similarly, the `withdrawals_persons` table links persons to systematic withdrawals, with composite foreign keys `withdrawal_id` and `person_id`. These tables allow a single person to appear in multiple ownerships or withdrawals, and a single ownership or withdrawal to involve multiple persons.

**Table `ownerships_persons`**

| joint_ownership_id | person_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `withdrawals_persons`**

| systematic_withdrawal_id | person_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

## Reconstructing domain facts through views

The twenty-two views reassemble the normalised tables into domain-level perspectives. Each view is a `SELECT` with explicit `JOIN` clauses that trace foreign key paths back to the base tables.

### Estate-level views

The view `vw_estate_beneficiary_designation` joins `estates` to `beneficiary_designations` on `estates.beneficiary_designation_id = beneficiary_designations.id`, producing a row that pairs an estate identifier with its beneficiary designation details. For estate `IDE-2086` (owner `Craig Childs`, value `9.45`), the view yields the designation `605954` with a `2.45` percent share and named beneficiary `regional-named-54`.

**View `vw_estate_beneficiary_designation`**

```sql
CREATE VIEW vw_estate_beneficiary_designation AS
SELECT a.estate_id, a.identifier, a.owner_name, a.total_value, b.id AS designation_id, b.designation_id AS designation_designation_id, b.account_reference AS designation_account_reference
FROM estates a JOIN beneficiary_designations b ON a.beneficiary_designation_id = b.id;
```

| estate_id | identifier | owner_name | total_value | designation_id | designation_designation_id | designation_account_reference |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Craig Childs | 9.45 | 1 | 605954 | legacy-account-61 |
| 2 | IDE-2091 | Kimberly Smith | 12.90 | 2 | 32829 | compact-account-62 |
| 3 | IDE-2096 | Michelle Kelley | 16.35 | 3 | 1202-0001-S | composite-account-63 |
| 4 | IDE-2101 | Jorge Sullivan | 19.80 | 4 | ale | primary-account-64 |

The view `vw_estate_joint_ownership` joins `estates` to `joint_ownerships` on `estates.joint_ownership_id = joint_ownerships.joint_ownership_id`. Estate `IDE-2091` (owner `Kimberly Smith`, value `12.90`, status `probate`) appears with joint ownership `101`, asset type `extended-asset-87`, survivorship right `false`, and ownership percentage `8.90`.

**View `vw_estate_joint_ownership`**

```sql
CREATE VIEW vw_estate_joint_ownership AS
SELECT a.estate_id, a.identifier, a.owner_name, a.total_value, b.joint_ownership_id AS ownership_joint_ownership_id, b.ownership_id AS ownership_ownership_id, b.asset_type AS ownership_asset_type
FROM estates a JOIN joint_ownerships b ON a.joint_ownership_id = b.joint_ownership_id;
```

| estate_id | identifier | owner_name | total_value | ownership_joint_ownership_id | ownership_ownership_id | ownership_asset_type |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Craig Childs | 9.45 | 100 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | pilot-asset-86 |
| 2 | IDE-2091 | Kimberly Smith | 12.90 | 101 | 13734000 | extended-asset-87 |
| 3 | IDE-2096 | Michelle Kelley | 16.35 | 102 | 937736 | integrated-asset-88 |
| 4 | IDE-2101 | Jorge Sullivan | 19.80 | 103 | 10966212 | seasonal-asset-89 |

The view `vw_estate_will` joins `estates` to `wills` on `estates.will_id = wills.will_id`. Estate `IDE-2096` (owner `Michelle Kelley`, value `16.35`, status `settled`) pairs with will `3` (testator `Compact Protocol`, probate filed `true`, executor `Pilot Survey`).

**View `vw_estate_will`**

```sql
CREATE VIEW vw_estate_will AS
SELECT a.estate_id, a.identifier, a.owner_name, a.total_value, b.will_id AS will_will_id, b.testator_name AS will_testator_name, b.execution_date AS will_execution_date
FROM estates a JOIN wills b ON a.will_id = b.will_id;
```

| estate_id | identifier | owner_name | total_value | will_will_id | will_testator_name | will_execution_date |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Craig Childs | 9.45 | 1 | Primary Standard A | 2023-06-02 |
| 2 | IDE-2091 | Kimberly Smith | 12.90 | 2 | Composite Framework | 2024-11-13 |
| 3 | IDE-2096 | Michelle Kelley | 16.35 | 3 | Compact Protocol | 2025-04-24 |
| 4 | IDE-2101 | Jorge Sullivan | 19.80 | 4 | Legacy Programme D | 2022-09-08 |

### Beneficiary designation views

The view `vw_beneficiary_designation_investment_fund_account` joins `beneficiary_designations` to `investment_fund_accounts` on `beneficiary_designations.investment_fund_account_id = investment_fund_accounts.id`. Designation `1` (named beneficiary `regional-named-54`, share `2.45`) links to account `ACC-2253` (fund type `compact-fund-62`, balance `1,387`, status `active`).

**View `vw_beneficiary_designation_investment_fund_account`**

```sql
CREATE VIEW vw_beneficiary_designation_investment_fund_account AS
SELECT a.id, a.designation_id, a.account_reference, a.named_beneficiary, b.id AS account_id, b.account_number AS account_account_number, b.fund_type AS account_fund_type
FROM beneficiary_designations a JOIN investment_fund_accounts b ON a.investment_fund_account_id = b.id;
```

| id | designation_id | account_reference | named_beneficiary | account_id | account_account_number | account_fund_type |
|---|---|---|---|---|---|---|
| 1 | 605954 | legacy-account-61 | regional-named-54 | 1 | ACC-2253 | compact-fund-62 |
| 2 | 32829 | compact-account-62 | legacy-named-55 | 2 | ACC-2256 | composite-fund-63 |
| 3 | 1202-0001-S | composite-account-63 | compact-named-56 | 3 | ACC-2259 | primary-fund-64 |
| 4 | ale | primary-account-64 | composite-named-57 | 4 | ACC-2262 | adaptive-fund-65 |

The view `vw_beneficiary_designation_person` joins `beneficiary_designations` to `persons` on `beneficiary_designations.person_id = persons.person_id`. Designation `2` (named beneficiary `legacy-named-55`, share `4.90`) links to person `101`.

**View `vw_beneficiary_designation_person`**

```sql
CREATE VIEW vw_beneficiary_designation_person AS
SELECT a.id, a.designation_id, a.account_reference, a.named_beneficiary, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM beneficiary_designations a JOIN persons b ON a.person_id = b.id;
```

| id | designation_id | account_reference | named_beneficiary | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1 | 605954 | legacy-account-61 | regional-named-54 | 100 | George Bernard Shaw | Theodore Mcgrath |
| 2 | 32829 | compact-account-62 | legacy-named-55 | 101 | Maria Rodriguez | Account Name |
| 3 | 1202-0001-S | composite-account-63 | compact-named-56 | 102 | Sarah Villanueva | Saipan International Airport |
| 4 | ale | primary-account-64 | composite-named-57 | 103 | Susan Wagner | Norma Fisher |

### Joint ownership views

The view `vw_joint_ownership_investment_fund_account` joins `joint_ownerships` to `investment_fund_accounts` on `joint_ownerships.investment_fund_account_id = investment_fund_accounts.id`. Joint ownership `100` (asset type `pilot-asset-86`, survivorship `true`, percentage `6.95`) links to account `ACC-2253` (balance `1,387`).

**View `vw_joint_ownership_investment_fund_account`**

```sql
CREATE VIEW vw_joint_ownership_investment_fund_account AS
SELECT a.joint_ownership_id, a.ownership_id, a.asset_type, a.survivorship_right, b.id AS account_id, b.account_number AS account_account_number, b.fund_type AS account_fund_type
FROM joint_ownerships a JOIN investment_fund_accounts b ON a.investment_fund_account_id = b.id;
```

| joint_ownership_id | ownership_id | asset_type | survivorship_right | account_id | account_account_number | account_fund_type |
|---|---|---|---|---|---|---|
| 100 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | pilot-asset-86 | true | 1 | ACC-2253 | compact-fund-62 |
| 101 | 13734000 | extended-asset-87 | false | 2 | ACC-2256 | composite-fund-63 |
| 102 | 937736 | integrated-asset-88 | true | 3 | ACC-2259 | primary-fund-64 |
| 103 | 10966212 | seasonal-asset-89 | false | 4 | ACC-2262 | adaptive-fund-65 |

The view `vw_joint_ownership_person_detail` joins `joint_ownerships` through the `ownerships_persons` junction table to `persons`. This view answers the question "which persons participate in which joint ownerships?" by tracing the composite foreign key path.

**View `vw_joint_ownership_person_detail`**

```sql
CREATE VIEW vw_joint_ownership_person_detail AS
SELECT a.joint_ownership_id, a.ownership_id, a.asset_type, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM joint_ownerships a
  JOIN ownerships_persons j ON j.joint_ownership_id = a.joint_ownership_id
  JOIN persons b ON b.id = j.person_id;
```

| joint_ownership_id | ownership_id | asset_type | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|
| 100 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | pilot-asset-86 | 100 | George Bernard Shaw | Theodore Mcgrath |
| 100 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | pilot-asset-86 | 101 | Maria Rodriguez | Account Name |
| 101 | 13734000 | extended-asset-87 | 101 | Maria Rodriguez | Account Name |
| 101 | 13734000 | extended-asset-87 | 102 | Sarah Villanueva | Saipan International Airport |
| 102 | 937736 | integrated-asset-88 | 102 | Sarah Villanueva | Saipan International Airport |
| 102 | 937736 | integrated-asset-88 | 103 | Susan Wagner | Norma Fisher |
| 103 | 10966212 | seasonal-asset-89 | 103 | Susan Wagner | Norma Fisher |
| 103 | 10966212 | seasonal-asset-89 | 100 | George Bernard Shaw | Theodore Mcgrath |

### Will views

The view `vw_will_estate` joins `wills` to `estates` on `wills.estate_id = estates.estate_id`. Will `1` (testator `Primary Standard A`, probate filed `true`, executor `Integrated Series A`) links to estate `IDE-2086` (owner `Craig Childs`, value `9.45`).

**View `vw_will_estate`**

```sql
CREATE VIEW vw_will_estate AS
SELECT a.will_id, a.testator_name, a.execution_date, a.probate_filed, b.estate_id AS estate_estate_id, b.identifier AS estate_identifier, b.owner_name AS estate_owner_name
FROM wills a JOIN estates b ON a.estate_id = b.estate_id;
```

| will_id | testator_name | execution_date | probate_filed | estate_estate_id | estate_identifier | estate_owner_name |
|---|---|---|---|---|---|---|
| 1 | Primary Standard A | 2023-06-02 | true | 1 | IDE-2086 | Craig Childs |
| 2 | Composite Framework | 2024-11-13 | false | 2 | IDE-2091 | Kimberly Smith |
| 3 | Compact Protocol | 2025-04-24 | true | 3 | IDE-2096 | Michelle Kelley |
| 4 | Legacy Programme D | 2022-09-08 | false | 4 | IDE-2101 | Jorge Sullivan |

The view `vw_will_person` joins `wills` to `persons` on `wills.person_id = persons.person_id`. Will `2` (testator `Composite Framework`, probate filed `false`) links to person `101`.

**View `vw_will_person`**

```sql
CREATE VIEW vw_will_person AS
SELECT a.will_id, a.testator_name, a.execution_date, a.probate_filed, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM wills a JOIN persons b ON a.person_id = b.id;
```

| will_id | testator_name | execution_date | probate_filed | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1 | Primary Standard A | 2023-06-02 | true | 100 | George Bernard Shaw | Theodore Mcgrath |
| 2 | Composite Framework | 2024-11-13 | false | 101 | Maria Rodriguez | Account Name |
| 3 | Compact Protocol | 2025-04-24 | true | 102 | Sarah Villanueva | Saipan International Airport |
| 4 | Legacy Programme D | 2022-09-08 | false | 103 | Susan Wagner | Norma Fisher |

### Investment fund account hub views

The view `vw_investment_fund_account_person` joins `investment_fund_accounts` to `persons` on `investment_fund_accounts.person_id = persons.person_id`. Account `ACC-2253` (fund type `compact-fund-62`, balance `1,387`, status `active`) links to person `100`.

**View `vw_investment_fund_account_person`**

```sql
CREATE VIEW vw_investment_fund_account_person AS
SELECT a.id, a.account_number, a.fund_type, a.tax_efficiency, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM investment_fund_accounts a JOIN persons b ON a.person_id = b.id;
```

| id | account_number | fund_type | tax_efficiency | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1 | ACC-2253 | compact-fund-62 | false | 100 | George Bernard Shaw | Theodore Mcgrath |
| 2 | ACC-2256 | composite-fund-63 | true | 101 | Maria Rodriguez | Account Name |
| 3 | ACC-2259 | primary-fund-64 | false | 102 | Sarah Villanueva | Saipan International Airport |
| 4 | ACC-2262 | adaptive-fund-65 | true | 103 | Susan Wagner | Norma Fisher |

The view `vw_investment_fund_account_systematic_withdrawal` joins `investment_fund_accounts` to `systematic_withdrawals` on `investment_fund_accounts.systematic_withdrawal_id = systematic_withdrawals.id`. Account `ACC-2253` links to withdrawal `69448` (frequency `monthly`, amount `13.49`).

**View `vw_investment_fund_account_systematic_withdrawal`**

```sql
CREATE VIEW vw_investment_fund_account_systematic_withdrawal AS
SELECT a.id, a.account_number, a.fund_type, a.tax_efficiency, b.id AS withdrawal_id, b.withdrawal_id AS withdrawal_withdrawal_id, b.frequency AS withdrawal_frequency
FROM investment_fund_accounts a JOIN systematic_withdrawals b ON a.systematic_withdrawal_id = b.id;
```

| id | account_number | fund_type | tax_efficiency | withdrawal_id | withdrawal_withdrawal_id | withdrawal_frequency |
|---|---|---|---|---|---|---|
| 1 | ACC-2253 | compact-fund-62 | false | 1 | 69448 | monthly |
| 2 | ACC-2256 | composite-fund-63 | true | 2 | 726044 | quarterly |
| 3 | ACC-2259 | primary-fund-64 | false | 3 | 505990 | annually |
| 4 | ACC-2262 | adaptive-fund-65 | true | 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly |

The view `vw_investment_fund_account_beneficiary_designation` joins `investment_fund_accounts` to `beneficiary_designations` on `investment_fund_accounts.beneficiary_designation_id = beneficiary_designations.id`. Account `ACC-2253` links to designation `1` (named beneficiary `regional-named-54`, share `2.45`).

**View `vw_investment_fund_account_beneficiary_designation`**

```sql
CREATE VIEW vw_investment_fund_account_beneficiary_designation AS
SELECT a.id, a.account_number, a.fund_type, a.tax_efficiency, b.id AS designation_id, b.designation_id AS designation_designation_id, b.account_reference AS designation_account_reference
FROM investment_fund_accounts a JOIN beneficiary_designations b ON a.beneficiary_designation_id = b.id;
```

| id | account_number | fund_type | tax_efficiency | designation_id | designation_designation_id | designation_account_reference |
|---|---|---|---|---|---|---|
| 1 | ACC-2253 | compact-fund-62 | false | 1 | 605954 | legacy-account-61 |
| 2 | ACC-2256 | composite-fund-63 | true | 2 | 32829 | compact-account-62 |
| 3 | ACC-2259 | primary-fund-64 | false | 3 | 1202-0001-S | composite-account-63 |
| 4 | ACC-2262 | adaptive-fund-65 | true | 4 | ale | primary-account-64 |

The view `vw_investment_fund_account_joint_ownership` joins `investment_fund_accounts` to `joint_ownerships` on `investment_fund_accounts.joint_ownership_id = joint_ownerships.joint_ownership_id`. Account `ACC-2253` links to joint ownership `100` (asset type `pilot-asset-86`, survivorship `true`).

**View `vw_investment_fund_account_joint_ownership`**

```sql
CREATE VIEW vw_investment_fund_account_joint_ownership AS
SELECT a.id, a.account_number, a.fund_type, a.tax_efficiency, b.joint_ownership_id AS ownership_joint_ownership_id, b.ownership_id AS ownership_ownership_id, b.asset_type AS ownership_asset_type
FROM investment_fund_accounts a JOIN joint_ownerships b ON a.joint_ownership_id = b.joint_ownership_id;
```

| id | account_number | fund_type | tax_efficiency | ownership_joint_ownership_id | ownership_ownership_id | ownership_asset_type |
|---|---|---|---|---|---|---|
| 1 | ACC-2253 | compact-fund-62 | false | 100 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | pilot-asset-86 |
| 2 | ACC-2256 | composite-fund-63 | true | 101 | 13734000 | extended-asset-87 |
| 3 | ACC-2259 | primary-fund-64 | false | 102 | 937736 | integrated-asset-88 |
| 4 | ACC-2262 | adaptive-fund-65 | true | 103 | 10966212 | seasonal-asset-89 |

### Systematic withdrawal views

The view `vw_systematic_withdrawal_investment_fund_account` joins `systematic_withdrawals` to `investment_fund_accounts` on `systematic_withdrawals.investment_fund_account_id = investment_fund_accounts.id`. Withdrawal `69448` (frequency `monthly`, amount `13.49`, tax liability `19.95`) links to account `ACC-2253` (balance `1,387`).

**View `vw_systematic_withdrawal_investment_fund_account`**

```sql
CREATE VIEW vw_systematic_withdrawal_investment_fund_account AS
SELECT a.id, a.withdrawal_id, a.frequency, a.amount, b.id AS account_id, b.account_number AS account_account_number, b.fund_type AS account_fund_type
FROM systematic_withdrawals a JOIN investment_fund_accounts b ON a.investment_fund_account_id = b.id;
```

| id | withdrawal_id | frequency | amount | account_id | account_account_number | account_fund_type |
|---|---|---|---|---|---|---|
| 1 | 69448 | monthly | 13.49 | 1 | ACC-2253 | compact-fund-62 |
| 2 | 726044 | quarterly | 25.47 | 2 | ACC-2256 | composite-fund-63 |
| 3 | 505990 | annually | 19.72 | 3 | ACC-2259 | primary-fund-64 |
| 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly | 12.74 | 4 | ACC-2262 | adaptive-fund-65 |

The view `vw_systematic_withdrawal_bank_account` joins `systematic_withdrawals` to `bank_accounts` on `systematic_withdrawals.bank_account_id = bank_accounts.bank_account_id`. Withdrawal `69448` links to bank account `1`.

**View `vw_systematic_withdrawal_bank_account`**

```sql
CREATE VIEW vw_systematic_withdrawal_bank_account AS
SELECT a.id, a.withdrawal_id, a.frequency, a.amount, b.bank_account_id AS account_bank_account_id, b.account_number AS account_account_number, b.bank_name AS account_bank_name
FROM systematic_withdrawals a JOIN bank_accounts b ON a.bank_account_id = b.bank_account_id;
```

| id | withdrawal_id | frequency | amount | account_bank_account_id | account_account_number | account_bank_name |
|---|---|---|---|---|---|---|
| 1 | 69448 | monthly | 13.49 | 1 | ACC-2253 | Compact Initiative |
| 2 | 726044 | quarterly | 25.47 | 2 | ACC-2256 | Legacy Model |
| 3 | 505990 | annually | 19.72 | 3 | ACC-2259 | Regional Cluster A |
| 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly | 12.74 | 4 | ACC-2262 | Seasonal Review |

The view `vw_systematic_withdrawal_person_detail` joins `systematic_withdrawals` through the `withdrawals_persons` junction table to `persons`. This view answers "which persons are associated with which systematic withdrawals?" by tracing the composite foreign key path.

**View `vw_systematic_withdrawal_person_detail`**

```sql
CREATE VIEW vw_systematic_withdrawal_person_detail AS
SELECT a.id, a.withdrawal_id, a.frequency, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM systematic_withdrawals a
  JOIN withdrawals_persons j ON j.systematic_withdrawal_id = a.id
  JOIN persons b ON b.id = j.person_id;
```

| id | withdrawal_id | frequency | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|
| 1 | 69448 | monthly | 100 | George Bernard Shaw | Theodore Mcgrath |
| 1 | 69448 | monthly | 101 | Maria Rodriguez | Account Name |
| 2 | 726044 | quarterly | 101 | Maria Rodriguez | Account Name |
| 2 | 726044 | quarterly | 102 | Sarah Villanueva | Saipan International Airport |
| 3 | 505990 | annually | 102 | Sarah Villanueva | Saipan International Airport |
| 3 | 505990 | annually | 103 | Susan Wagner | Norma Fisher |
| 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly | 103 | Susan Wagner | Norma Fisher |
| 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly | 100 | George Bernard Shaw | Theodore Mcgrath |

### Person-centric hub views

The view `vw_person_investment_fund_account` joins `persons` to `investment_fund_accounts` on `persons.person_id = investment_fund_accounts.person_id`. Person `100` links to account `ACC-2253` (fund type `compact-fund-62`, balance `1,387`).

**View `vw_person_investment_fund_account`**

```sql
CREATE VIEW vw_person_investment_fund_account AS
SELECT a.id, a.person_id, a.full_name, a.date_of_birth, b.id AS account_id, b.account_number AS account_account_number, b.fund_type AS account_fund_type
FROM persons a JOIN investment_fund_accounts b ON a.investment_fund_account_id = b.id;
```

| id | person_id | full_name | date_of_birth | account_id | account_account_number | account_fund_type |
|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | Theodore Mcgrath | 2025-04-02 | 1 | ACC-2253 | compact-fund-62 |
| 101 | Maria Rodriguez | Account Name | 2022-09-13 | 2 | ACC-2256 | composite-fund-63 |
| 102 | Sarah Villanueva | Saipan International Airport | 2023-02-24 | 3 | ACC-2259 | primary-fund-64 |
| 103 | Susan Wagner | Norma Fisher | 2024-07-08 | 4 | ACC-2262 | adaptive-fund-65 |

The view `vw_person_will` joins `persons` to `wills` on `persons.person_id = wills.person_id`. Person `100` links to will `1` (testator `Primary Standard A`, probate filed `true`).

**View `vw_person_will`**

```sql
CREATE VIEW vw_person_will AS
SELECT a.id, a.person_id, a.full_name, a.date_of_birth, b.will_id AS will_will_id, b.testator_name AS will_testator_name, b.execution_date AS will_execution_date
FROM persons a JOIN wills b ON a.will_id = b.will_id;
```

| id | person_id | full_name | date_of_birth | will_will_id | will_testator_name | will_execution_date |
|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | Theodore Mcgrath | 2025-04-02 | 1 | Primary Standard A | 2023-06-02 |
| 101 | Maria Rodriguez | Account Name | 2022-09-13 | 2 | Composite Framework | 2024-11-13 |
| 102 | Sarah Villanueva | Saipan International Airport | 2023-02-24 | 3 | Compact Protocol | 2025-04-24 |
| 103 | Susan Wagner | Norma Fisher | 2024-07-08 | 4 | Legacy Programme D | 2022-09-08 |

The view `vw_person_systematic_withdrawal` joins `persons` through the `withdrawals_persons` junction table to `systematic_withdrawals`. This view answers "which persons participate in which systematic withdrawals?"

**View `vw_person_systematic_withdrawal`**

```sql
CREATE VIEW vw_person_systematic_withdrawal AS
SELECT a.id, a.person_id, a.full_name, a.date_of_birth, b.id AS withdrawal_id, b.withdrawal_id AS withdrawal_withdrawal_id, b.frequency AS withdrawal_frequency
FROM persons a JOIN systematic_withdrawals b ON a.systematic_withdrawal_id = b.id;
```

| id | person_id | full_name | date_of_birth | withdrawal_id | withdrawal_withdrawal_id | withdrawal_frequency |
|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | Theodore Mcgrath | 2025-04-02 | 1 | 69448 | monthly |
| 101 | Maria Rodriguez | Account Name | 2022-09-13 | 2 | 726044 | quarterly |
| 102 | Sarah Villanueva | Saipan International Airport | 2023-02-24 | 3 | 505990 | annually |
| 103 | Susan Wagner | Norma Fisher | 2024-07-08 | 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly |

The view `vw_person_joint_ownership` joins `persons` through the `ownerships_persons` junction table to `joint_ownerships`. This view answers "which persons participate in which joint ownerships?"

**View `vw_person_joint_ownership`**

```sql
CREATE VIEW vw_person_joint_ownership AS
SELECT a.id, a.person_id, a.full_name, a.date_of_birth, b.joint_ownership_id AS ownership_joint_ownership_id, b.ownership_id AS ownership_ownership_id, b.asset_type AS ownership_asset_type
FROM persons a JOIN joint_ownerships b ON a.joint_ownership_id = b.joint_ownership_id;
```

| id | person_id | full_name | date_of_birth | ownership_joint_ownership_id | ownership_ownership_id | ownership_asset_type |
|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | Theodore Mcgrath | 2025-04-02 | 100 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | pilot-asset-86 |
| 101 | Maria Rodriguez | Account Name | 2022-09-13 | 101 | 13734000 | extended-asset-87 |
| 102 | Sarah Villanueva | Saipan International Airport | 2023-02-24 | 102 | 937736 | integrated-asset-88 |
| 103 | Susan Wagner | Norma Fisher | 2024-07-08 | 103 | 10966212 | seasonal-asset-89 |

### Bank account views

The view `vw_bank_account_systematic_withdrawal` joins `bank_accounts` to `systematic_withdrawals` on `bank_accounts.bank_account_id = systematic_withdrawals.bank_account_id`. Bank account `1` links to withdrawal `69448` (frequency `monthly`, amount `13.49`).

**View `vw_bank_account_systematic_withdrawal`**

```sql
CREATE VIEW vw_bank_account_systematic_withdrawal AS
SELECT a.bank_account_id, a.account_number, a.bank_name, a.account_type, b.id AS withdrawal_id, b.withdrawal_id AS withdrawal_withdrawal_id, b.frequency AS withdrawal_frequency
FROM bank_accounts a JOIN systematic_withdrawals b ON a.systematic_withdrawal_id = b.id;
```

| bank_account_id | account_number | bank_name | account_type | withdrawal_id | withdrawal_withdrawal_id | withdrawal_frequency |
|---|---|---|---|---|---|---|
| 1 | ACC-2253 | Compact Initiative | baseline-account-25 | 1 | 69448 | monthly |
| 2 | ACC-2256 | Legacy Model | pilot-account-26 | 2 | 726044 | quarterly |
| 3 | ACC-2259 | Regional Cluster A | extended-account-27 | 3 | 505990 | annually |
| 4 | ACC-2262 | Seasonal Review | integrated-account-28 | 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly |

The view `vw_bank_account_person` joins `bank_accounts` to `persons` on `bank_accounts.owner_person_id = persons.person_id`. Bank account `1` links to person `100`.

**View `vw_bank_account_person`**

```sql
CREATE VIEW vw_bank_account_person AS
SELECT a.bank_account_id, a.account_number, a.bank_name, a.account_type, b.id AS person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM bank_accounts a JOIN persons b ON a.person_id = b.id;
```

| bank_account_id | account_number | bank_name | account_type | person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1 | ACC-2253 | Compact Initiative | baseline-account-25 | 100 | George Bernard Shaw | Theodore Mcgrath |
| 2 | ACC-2256 | Legacy Model | pilot-account-26 | 101 | Maria Rodriguez | Account Name |
| 3 | ACC-2259 | Regional Cluster A | extended-account-27 | 102 | Sarah Villanueva | Saipan International Airport |
| 4 | ACC-2262 | Seasonal Review | integrated-account-28 | 103 | Susan Wagner | Norma Fisher |

## Synthesis

The schema follows a hub-and-spoke pattern centred on `investment_fund_accounts`, which carries four foreign keys linking it to the other core entities. The `estates` table sits at the top level, each row pointing to exactly one beneficiary designation, one joint ownership, and one will. The `persons` table is referenced by beneficiary designations, wills, investment fund accounts, and the two junction tables, making it the universal participant entity. The junction tables `ownerships_persons` and `withdrawals_persons` resolve the many-to-many relationships that the single foreign key model cannot express. The twenty-two views trace these foreign key paths in both directions, allowing a query to start from any entity and reconstruct the full domain fact — for example, joining `estates` → `beneficiary_designations` → `investment_fund_accounts` → `systematic_withdrawals` → `bank_accounts` to answer "which bank account receives the systematic withdrawal from the investment fund account designated as beneficiary of estate IDE-2086?" The normalised base tables enforce referential integrity at the storage layer; the views provide the denormalised narratives that domain users and analysts need.