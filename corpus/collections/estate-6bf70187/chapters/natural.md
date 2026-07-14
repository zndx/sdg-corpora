## Estate Planning and Investment Fund Management

Estate planning and investment fund management form a structured ecosystem where individuals allocate assets, designate beneficiaries, establish joint ownership arrangements, and execute withdrawal schedules across multiple financial instruments. The domain captures the full lifecycle of an estate—from initial creation through probate to settlement—while tracking the investment vehicles that hold and distribute wealth. Each estate is anchored by a person, supported by legal instruments such as wills and beneficiary designations, and operationalized through investment fund accounts that may carry systematic withdrawal obligations. The records in this system are organized around a core set of entities: estates, persons, investment fund accounts, wills, beneficiary designations, joint ownerships, systematic withdrawals, and bank accounts, with cross-reference tables linking persons to ownerships and withdrawals.

**Table `estates`**

| estate_id | identifier | owner_name | total_value | currency_code | creation_date | status | beneficiary_designation_id | joint_ownership_id | will_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Craig Childs | 9.45 | gd_fp_eu_acc3 | 2022-01-13T12:24:00 | active | 1 | 100 | 1 |
| 2 | IDE-2091 | Kimberly Smith | 12.90 | managing-resources | 2023-06-24T19:41:00 | probate | 2 | 101 | 2 |
| 3 | IDE-2096 | Michelle Kelley | 16.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-11-08T02:58:00 | settled | 3 | 102 | 3 |
| 4 | IDE-2101 | Jorge Sullivan | 19.80 | 10445649 | 2025-04-19T09:15:00 | active | 4 | 103 | 4 |

An estate represents the central container for a person's financial affairs. Each estate carries a unique identifier such as IDE-2086 or IDE-2101, an owner name like Craig Childs or Jorge Sullivan, and a total value expressed in a specific currency. The status field tracks the estate's current phase: active estates such as IDE-2086 and IDE-2101 remain in force, probate estates like IDE-2091 are undergoing legal validation, and settled estates such as IDE-2096 have completed their distribution cycle. The creation_date records when the estate was established, and each estate references a beneficiary designation, a joint ownership arrangement, and a will, forming the three pillars of estate structure.

**Table `persons`**

| id | person_id | full_name | date_of_birth | relationship_to_testator | tax_residency | generation | investment_fund_account_id | will_id | systematic_withdrawal_id | joint_ownership_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | George Bernard Shaw | Theodore Mcgrath | 2025-04-02 | regional-relation-42 | baseline-tax-25 | parent | 1 | 1 | 1 | 100 |
| 101 | Maria Rodriguez | Account Name | 2022-09-13 | legacy-relation-43 | pilot-tax-26 | child | 2 | 2 | 2 | 101 |
| 102 | Sarah Villanueva | Saipan International Airport | 2023-02-24 | compact-relation-44 | extended-tax-27 | grandchild | 3 | 3 | 3 | 102 |
| 103 | Susan Wagner | Norma Fisher | 2024-07-08 | composite-relation-45 | integrated-tax-28 | parent | 4 | 4 | 4 | 103 |

Persons are the individuals at the center of every estate record. The persons table stores personal identifiers and serves as the anchor for all relational joins across the domain. Every estate owner, will testator, beneficiary designation holder, and investment fund account owner is a person. The person_id values—100, 101, 102, 103—appear throughout the system as foreign keys linking estates, wills, beneficiary designations, and investment fund accounts to their human subjects.

**Table `beneficiary_designations`**

| id | designation_id | account_reference | named_beneficiary | percentage_share | effective_date | revocable | investment_fund_account_id | person_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 605954 | legacy-account-61 | regional-named-54 | 2.45 | 2023-02-14 | false | 1 | 100 |
| 2 | 32829 | compact-account-62 | legacy-named-55 | 4.90 | 2024-07-25 | true | 2 | 101 |
| 3 | 1202-0001-S | composite-account-63 | compact-named-56 | 7.35 | 2025-12-09 | false | 3 | 102 |
| 4 | ale | primary-account-64 | composite-named-57 | 9.80 | 2022-05-20 | true | 4 | 103 |

Beneficiary designations specify who receives assets from an estate or investment fund account. Each designation carries a designation_id such as 605954 or 32829, an account_reference like legacy-account-61, and a named_beneficiary field such as regional-named-54. The percentage_share indicates the portion of the asset allocated to that beneficiary—for example, 2.45 percent or 9.80 percent. The effective_date marks when the designation becomes operative, and the revocable flag indicates whether the designation can be altered by the account holder. A designation of false, as seen in records 1 and 3, means the beneficiary is locked in; a designation of true, as in records 2 and 4, allows the owner to change the beneficiary at any time.

**Table `joint_ownerships`**

| joint_ownership_id | ownership_id | asset_type | survivorship_right | registration_date | jurisdiction | ownership_percentage | investment_fund_account_id |
|---|---|---|---|---|---|---|---|
| 100 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | pilot-asset-86 | true | 2023-06-19 | regional-jurisdic-30 | 6.95 | 1 |
| 101 | 13734000 | extended-asset-87 | false | 2024-11-03 | legacy-jurisdic-31 | 8.90 | 2 |
| 102 | 937736 | integrated-asset-88 | true | 2025-04-14 | compact-jurisdic-32 | 10.85 | 3 |
| 103 | 10966212 | seasonal-asset-89 | false | 2022-09-25 | composite-jurisdic-33 | 12.80 | 4 |

Joint ownerships capture arrangements where two or more parties hold an asset together, with survivorship rights determining whether the surviving owner automatically inherits the deceased owner's share. Each joint ownership record includes an ownership_id such as 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0, an asset_type like pilot-asset-86, and a registration_date. The survivorship_right field—true or false—controls whether the surviving co-owner retains the asset. The jurisdiction field, such as regional-jurisdic-30 or compact-jurisdic-32, identifies the legal authority governing the arrangement, and the ownership_percentage specifies each party's stake, ranging from 6.95 percent to 12.80 percent in the current data.

**Table `wills`**

| will_id | testator_name | execution_date | probate_filed | executor_name | last_amendment_date | estate_id | person_id |
|---|---|---|---|---|---|---|---|
| 1 | Primary Standard A | 2023-06-02 | true | Integrated Series A | 2025-08-18 | 1 | 100 |
| 2 | Composite Framework | 2024-11-13 | false | Extended Assessment | 2022-01-02 | 2 | 101 |
| 3 | Compact Protocol | 2025-04-24 | true | Pilot Survey | 2023-06-13 | 3 | 102 |
| 4 | Legacy Programme D | 2022-09-08 | false | Baseline Corridor D | 2024-11-24 | 4 | 103 |

Wills are the legal instruments through which a testator directs the distribution of their estate. Each will record includes the testator_name, such as Primary Standard A or Legacy Programme D, the execution_date, and the name of the executor, such as Integrated Series A or Baseline Corridor D. The probate_filed flag indicates whether the will has been submitted to probate court; records 1 and 3 show probate_filed as true, while records 2 and 4 show false. The last_amendment_date tracks the most recent modification to the will, and each will is linked to an estate and a person.

**Table `investment_fund_accounts`**

| id | account_number | fund_type | tax_efficiency | current_balance | currency_code | account_status | person_id | systematic_withdrawal_id | beneficiary_designation_id | joint_ownership_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2253 | compact-fund-62 | false | 1,387 | gd_fp_eu_acc3 | active | 100 | 1 | 1 | 100 |
| 2 | ACC-2256 | composite-fund-63 | true | 1,867 | managing-resources | closed | 101 | 2 | 2 | 101 |
| 3 | ACC-2259 | primary-fund-64 | false | 65.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | frozen | 102 | 3 | 3 | 102 |
| 4 | ACC-2262 | adaptive-fund-65 | true | 2,453 | 10445649 | active | 103 | 4 | 4 | 103 |

Investment fund accounts are the financial instruments that hold and manage assets within the estate framework. Each account carries an account_number like ACC-2253 or ACC-2262, a fund_type such as compact-fund-62 or adaptive-fund-65, and a current_balance that reflects the account's present value. The tax_efficiency flag indicates whether the fund structure provides tax advantages. The account_status field tracks whether the account is active, closed, or frozen—ACC-2253 and ACC-2262 are active, ACC-2256 is closed, and ACC-2259 is frozen. Each investment fund account is linked to a person, a systematic withdrawal schedule, a beneficiary designation, and a joint ownership arrangement.

**Table `systematic_withdrawals`**

| id | withdrawal_id | frequency | amount | start_date | end_date | tax_liability_share | investment_fund_account_id | bank_account_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 69448 | monthly | 13.49 | 2022-09-05 | 2022-09-01 | 19.95 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 726044 | quarterly | 25.47 | 2023-02-16 | 2023-02-12 | 21.90 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 505990 | annually | 19.72 | 2024-07-27 | 2024-07-23 | 23.85 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 77ceed4d3f63425c9e06215ff5acfc8a | monthly | 12.74 | 2025-12-11 | 2025-12-07 | 25.80 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Systematic withdrawals define recurring distributions from an investment fund account to a bank account. Each withdrawal schedule specifies a frequency—monthly, quarterly, or annually—and an amount, such as 13.49 or 25.47. The start_date and end_date define the operational window of the withdrawal plan. The tax_liability_share indicates the percentage of tax responsibility assigned to the withdrawal, ranging from 19.95 to 25.80 in the current records. Each systematic withdrawal is tied to an investment fund account and a bank account, and the created_at and updated_at timestamps track when the schedule was established and last modified.

**Table `bank_accounts`**

| bank_account_id | account_number | bank_name | account_type | currency_code | open_date | status | systematic_withdrawal_id | person_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ACC-2253 | Compact Initiative | baseline-account-25 | gd_fp_eu_acc3 | 2025-08-07 | active | 1 | 100 |
| 2 | ACC-2256 | Legacy Model | pilot-account-26 | managing-resources | 2022-01-18 | closed | 2 | 101 |
| 3 | ACC-2259 | Regional Cluster A | extended-account-27 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-06-02 | dormant | 3 | 102 |
| 4 | ACC-2262 | Seasonal Review | integrated-account-28 | 10445649 | 2024-11-13 | active | 4 | 103 |

Bank accounts serve as the destination for systematic withdrawals. Each bank account record stores the account details necessary to route withdrawal funds, and is linked to a person who owns or controls the account.

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

The ownerships_persons table provides the cross-reference that links persons to joint ownership arrangements. This junction table resolves the many-to-many relationship between persons and ownerships, ensuring that each co-owner is properly recorded.

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

The withdrawals_persons table provides the cross-reference that links persons to systematic withdrawal schedules. This junction table resolves the many-to-many relationship between persons and withdrawals, ensuring that each beneficiary of a withdrawal is properly recorded.

### Estate-Level Views

The estate-level views consolidate the three pillars of estate structure—beneficiary designations, joint ownerships, and wills—into unified records that answer the question of how a specific estate is organized.

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

This view joins estates with their beneficiary designations, producing a consolidated record that shows which beneficiary is assigned to which estate. For example, estate IDE-2086 (Craig Childs) is linked to beneficiary designation 605954, which allocates 2.45 percent to regional-named-54. Estate IDE-2091 (Kimberly Smith) carries designation 32829 with a 4.90 percent share to legacy-named-55.

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

This view joins estates with their joint ownership arrangements, revealing how assets are co-held. Estate IDE-2086 is associated with joint ownership 100, which covers pilot-asset-86 under regional-jurisdic-30 with a 6.95 percent ownership share and survivorship rights enabled. Estate IDE-2091 is associated with joint ownership 101, covering extended-asset-87 under legacy-jurisdic-31 with an 8.90 percent share and no survivorship rights.

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

This view joins estates with their wills, connecting each estate to its governing legal instrument. Estate IDE-2086 is linked to will 1, executed on 2023-06-02 by testator Primary Standard A, with executor Integrated Series A and probate already filed. Estate IDE-2091 is linked to will 2, executed on 2024-11-13 by testator Composite Framework, with executor Extended Assessment and probate not yet filed.

### Beneficiary Designation Views

Beneficiary designation views answer questions about how designations relate to investment fund accounts and the persons who hold them.

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

This view joins beneficiary designations with their associated investment fund accounts, showing which fund each designation applies to. Designation 605954 is linked to investment fund account ACC-2253 (compact-fund-62), while designation ale is linked to ACC-2262 (adaptive-fund-65).

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

This view joins beneficiary designations with the persons who hold them, connecting the named beneficiary to the individual record. Designation 605954 is held by person 100, designation 32829 by person 101, designation 1202-0001-S by person 102, and designation ale by person 103.

### Joint Ownership Views

Joint ownership views answer questions about how ownership arrangements relate to investment fund accounts and the persons involved.

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

This view joins joint ownerships with their associated investment fund accounts, showing which fund each ownership arrangement applies to. Joint ownership 100 is linked to investment fund account ACC-2253, while joint ownership 103 is linked to ACC-2262.

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

This view joins joint ownerships with the persons involved in the ownership arrangement, providing the human context for each co-ownership record. Joint ownership 100 is associated with person 100, joint ownership 101 with person 101, and so on through the dataset.

### Will Views

Will views answer questions about how wills relate to estates and the persons who execute them.

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

This view joins wills with their associated estates, confirming the linkage between each legal instrument and the estate it governs. Will 1 (Primary Standard A) governs estate IDE-2086, will 2 (Composite Framework) governs estate IDE-2091, will 3 (Compact Protocol) governs estate IDE-2096, and will 4 (Legacy Programme D) governs estate IDE-2101.

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

This view joins wills with the persons who are the testators, connecting each will to its human author. Will 1 is authored by person 100, will 2 by person 101, will 3 by person 102, and will 4 by person 103.

### Investment Fund Account Views

Investment fund account views answer questions about how fund accounts relate to persons, systematic withdrawals, beneficiary designations, and joint ownerships.

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

This view joins investment fund accounts with the persons who own them, providing the human context for each fund. Account ACC-2253 is owned by person 100, ACC-2256 by person 101, ACC-2259 by person 102, and ACC-2262 by person 103.

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

This view joins investment fund accounts with their systematic withdrawal schedules, showing which withdrawal plan applies to which fund. Account ACC-2253 has withdrawal schedule 69448 (monthly, 13.49), ACC-2256 has schedule 726044 (quarterly, 25.47), ACC-2259 has schedule 505990 (annually, 19.72), and ACC-2262 has schedule 77ceed4d3f63425c9e06215ff5acfc8a (monthly, 12.74).

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

This view joins investment fund accounts with their beneficiary designations, showing which beneficiary is assigned to which fund. Account ACC-2253 carries designation 605954, ACC-2256 carries designation 32829, ACC-2259 carries designation 1202-0001-S, and ACC-2262 carries designation ale.

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

This view joins investment fund accounts with their joint ownership arrangements, showing which co-ownership structure applies to which fund. Account ACC-2253 is subject to joint ownership 100, ACC-2256 to 101, ACC-2259 to 102, and ACC-2262 to 103.

### Systematic Withdrawal Views

Systematic withdrawal views answer questions about how withdrawal schedules relate to investment fund accounts, bank accounts, and the persons involved.

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

This view joins systematic withdrawals with their source investment fund accounts, confirming which fund each withdrawal draws from. Withdrawal 69448 draws from ACC-2253, 726044 from ACC-2256, 505990 from ACC-2259, and 77ceed4d3f63425c9e06215ff5acfc8a from ACC-2262.

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

This view joins systematic withdrawals with their destination bank accounts, showing where each withdrawal is routed. Withdrawal 69448 is routed to bank account 1, 726044 to account 2, 505990 to account 3, and 77ceed4d3f63425c9e06215ff5acfc8a to account 4.

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

This view joins systematic withdrawals with the persons involved in the withdrawal schedule, providing the human context for each recurring distribution.

### Person-Centric Views

Person-centric views answer questions about how each person relates to their investment fund accounts, wills, systematic withdrawals, and joint ownerships.

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

This view joins persons with their investment fund accounts, providing a consolidated view of each person's fund holdings. Person 100 holds ACC-2253 (compact-fund-62, balance 1,387), person 101 holds ACC-2256 (composite-fund-63, balance 1,867), person 102 holds ACC-2259 (primary-fund-64, balance 65.72), and person 103 holds ACC-2262 (adaptive-fund-65, balance 2,453).

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

This view joins persons with their wills, confirming which will each person has executed. Person 100 executed will 1 (Primary Standard A), person 101 executed will 2 (Composite Framework), person 102 executed will 3 (Compact Protocol), and person 103 executed will 4 (Legacy Programme D).

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

This view joins persons with their systematic withdrawal schedules, showing which recurring distributions each person is associated with.

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

This view joins persons with their joint ownership arrangements, showing which co-ownership structures each person participates in.

### Bank Account Views

Bank account views answer questions about how bank accounts relate to systematic withdrawals and the persons who own them.

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

This view joins bank accounts with the systematic withdrawals that route funds to them, showing which withdrawal schedules deposit into which bank accounts. Bank account 1 receives withdrawal 69448, account 2 receives 726044, account 3 receives 505990, and account 4 receives 77ceed4d3f63425c9e06215ff5acfc8a.

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

This view joins bank accounts with the persons who own them, providing the human context for each bank account record.

### Synthesis

The domain of estate planning and investment fund management is a tightly interwoven system where each entity serves a distinct operational purpose. Estates provide the container, persons provide the human anchor, wills provide the legal framework, beneficiary designations provide the distribution instructions, joint ownerships provide the co-holding structure, investment fund accounts provide the financial instruments, systematic withdrawals provide the distribution mechanism, and bank accounts provide the destination. The views synthesize these entities into answerable questions: which beneficiary is assigned to which estate, which withdrawal draws from which fund, which person holds which account. The data values—IDE-2086 through IDE-2101, ACC-2253 through ACC-2262, 605954 through ale, 69448 through 77ceed4d3f63425c9e06215ff5acfc8a—represent a coherent set of fictional records that demonstrate the full range of relationships in the domain.