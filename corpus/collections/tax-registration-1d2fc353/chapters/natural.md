## Tax Administration and Compliance Infrastructure

Modern tax administration relies on a structured ecosystem of registered traders, territorial jurisdictions, supply records, and credit mechanisms, all coordinated through government agencies and training programmes. The records in this system capture the lifecycle of a trader from initial registration through ongoing compliance, the flow of taxable supplies across jurisdictions, the accumulation and utilisation of input tax credits, and the institutional framework of government missions and agencies that deliver training and oversight. Understanding how these entities interrelate requires examining each record type and the composite views that join them into operational narratives.

**Table `tax_registrations`**

| registration_id | issue_date | expiry_date | status | turnover_threshold | state_of_registration | application_submission_date | is_exempted | trader_id | jurisdiction_code | input_tax_credit_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 2106693 | 2023-02-01 | 2023-10-24 | active | 8.95 | composite-state-51 | 2023-06-12T17:51:00 | true | 1 | 5917299 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 778572 | 2024-07-12 | 2024-03-08 | pending | 11.90 | primary-state-52 | 2024-11-23T00:08:00 | false | 2 | id_25 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 8387538 | 2025-12-23 | 2025-08-19 | cancelled | 14.85 | adaptive-state-53 | 2025-04-07T07:25:00 | true | 3 | 7731856 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4277008 | 2022-05-07 | 2022-01-03 | provisional | 17.80 | distributed-state-54 | 2022-09-18T14:42:00 | false | 4 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Tax registrations form the foundational ledger of the system. Each registration carries a unique identifier, an issue date, and an expiry date that together define the validity window. The status field tracks the current standing—active, pending, cancelled, or provisional—while the turnover threshold establishes the revenue level at which registration becomes mandatory. The state of registration categorises the administrative posture, and the is_exempted flag marks entities that operate outside standard obligations. Registration 2106693, issued on 2023-02-01 and expiring on 2023-10-24, sits in active status with a turnover threshold of 8.95 and is marked exempted. By contrast, registration 778572 remains in pending status, submitted on 2024-11-23, with a higher threshold of 11.90 and no exemption. The registration 8387538 carries a cancelled status despite being exempted, while registration 4277008 holds a provisional classification with the highest threshold of 17.80.

**Table `traders`**

| id | trader_id | legal_name | pan_number | contact_email | contact_mobile | annual_aggregate_turnover | is_special_category_state | registration_status | registration_id | jurisdiction_code | taxable_supply_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020080 | Adaptive Model | PAN-2559 | Christopher Wilson | Joshua Torres | 13.20 | true | registered | 2106693 | 5917299 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2986247 | Primary Cluster | PAN-2565 | Charles Larsen | Susan Levy | 16.40 | false | not_registered | 778572 | id_25 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D | PAN-2571 | Mary Alvarez | Dana Nguyen | 19.60 | true | liable | 8387538 | 7731856 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 392491 | Compact Initiative | PAN-2577 | April Snyder | Roberta Anderson | 22.80 | false | registered | 4277008 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Traders are the commercial entities subject to registration and compliance. Each trader record holds an internal identifier, a legal name, and a PAN number for tax identification. Contact details—email and mobile—enable communication, while the annual aggregate turnover quantifies the entity's revenue scale. The is_special_category_state flag distinguishes traders operating under special regulatory provisions, and the registration_status field reflects the trader's current standing relative to the tax authority. Trader 2002007020080, legally named "Adaptive Model," reports an annual aggregate turnover of 13.20, operates in a special category state, and holds registered status linked to registration 2106693. Trader 2986247, "Primary Cluster," carries a turnover of 16.40, is not in a special category state, and currently holds not_registered status. The trader identified as 98a02b9c-8fcd-11eb-924d-9cd76263cbd0, "Composite Review D," has a turnover of 19.60, is in a special category state, and is classified as liable. Trader 392491, "Compact Initiative," reports the highest turnover at 22.80 and holds registered status.

**Table `jurisdictions`**

| jurisdiction_code | jurisdiction_name | jurisdiction_type | is_special_category | turnover_threshold | trader_id | registration_id |
|---|---|---|---|---|---|---|
| 5917299 | Pilot Cluster | State | true | 8.95 | 1 | 2106693 |
| id_25 | Baseline Review | Union Territory | false | 11.90 | 2 | 778572 |
| 7731856 | Distributed Initiative A | State | true | 14.85 | 3 | 8387538 |
| 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory | false | 17.80 | 4 | 4277008 |

Jurisdictions define the territorial and administrative boundaries within which tax obligations are assessed and collected. Each jurisdiction carries a code, a name, and a type—State or Union Territory—that determines the applicable regulatory framework. The is_special_category flag mirrors the trader-level designation, and the turnover_threshold establishes the revenue floor for that territory. Jurisdiction 5917299, named "Pilot Cluster," is a State with special category status and a threshold of 8.95. Jurisdiction id_25, "Baseline Review," is a Union Territory without special category designation and a threshold of 11.90. Jurisdiction 7731856, "Distributed Initiative A," is a State with special category status and a threshold of 14.85. Jurisdiction 7c692762-8fcd-11eb-924d-9cd76263cbd0, "Adaptive Model," is a Union Territory without special category status and the highest threshold of 17.80.

**Table `taxable_supplies`**

| id | supply_id | supply_date | supply_type | is_exempted | value | tax_rate | trader_id | received_by_trader_id | jurisdiction_code | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 | goods | true | 19.95 | 22.45 | 1 | 1 | 5917299 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2839510 | 2024-11-04 | services | false | 21.90 | 26.90 | 2 | 2 | id_25 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3001009030100 | 2025-04-15 | both | true | 23.85 | 31.35 | 3 | 3 | 7731856 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 3001009030060 | 2022-09-26 | goods | false | 25.80 | 35.80 | 4 | 4 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Taxable supplies record the individual transactions that generate tax liability. Each supply carries a unique identifier, a date, and a type—goods, services, or both. The is_exempted flag indicates whether the supply falls outside the tax net, while the value and tax_rate fields quantify the financial dimensions of the transaction. Supply 57e47252-8fcd-11eb-924d-9cd76263cbd0, dated 2023-06-20, involves goods, is exempted, carries a value of 19.95, and is subject to a tax rate of 22.45. Supply 2839510, dated 2024-11-04, involves services, is not exempted, has a value of 21.90, and carries a tax rate of 26.90. Supply 3001009030100, dated 2025-04-15, covers both goods and services, is exempted, has a value of 23.85, and a tax rate of 31.35. Supply 3001009030060, dated 2022-09-26, involves goods, is not exempted, has a value of 25.80, and carries the highest tax rate of 35.80.

**Table `input_tax_credits`**

| id | credit_id | credit_amount | credit_date | status | linked_supply_id | trader_id | taxable_supply_id | registration_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 7119786 | 2,821 | 2024-11-10 | available | 974924 | 1 | 1 | 2106693 |
| 101 | gd_fp_ne_acc1 | 105,297 | 2025-04-21 | utilized | 5082985 | 2 | 2 | 778572 |
| 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 | 2022-09-05 | expired | ChIJpfaaVfpt5kcRJ6dswRM-WVY | 3 | 3 | 8387538 |
| 103 | 2933471 | 27.32 | 2023-02-16 | available | analytical-thinking | 4 | 4 | 4277008 |

Input tax credits represent the mechanism by which traders recover tax paid on purchases against their output liability. Each credit record carries a credit identifier, an amount, and a date. The status field tracks whether the credit is available for utilisation, has been consumed, or has expired. The linked_supply_id connects the credit to its originating supply. Credit 7119786, dated 2024-11-10, carries an amount of 2,821 and is in available status, linked to supply 974924. Credit gd_fp_ne_acc1, dated 2025-04-21, carries the largest amount of 105,297 and is marked as utilized, linked to supply 5082985. Credit ChIJd13ymnZu5kcRXM7jx5boJBs, dated 2022-09-05, carries an amount of 16,949 and has expired, linked to supply ChIJpfaaVfpt5kcRJ6dswRM-WVY. Credit 2933471, dated 2023-02-16, carries a modest amount of 27.32 and remains available, linked to supply analytical-thinking.

**Table `training_centres`**

| training_centre_id | centre_id | centre_name | centre_type | inauguration_date | location | capacity | government_agency_id | government_mission_id |
|---|---|---|---|---|---|---|---|---|
| 100 | BJewellGraham | Regional Cluster | GST | 2025-04-14 | extended-location-99 | 32 | 100 | 100 |
| 101 | 4447025 | Seasonal Review D | Pradhan Mantri Kaushal Kendra | 2022-09-25 | integrated-location-100 | 41 | 101 | 101 |
| 102 | 209220 | Integrated Initiative | Yoga | 2023-02-09 | seasonal-location-101 | 50 | 102 | 102 |
| 103 | 9568439 | Extended Model | GST | 2024-07-20 | regional-location-102 | 59 | 103 | 103 |

Training centres deliver capacity-building programmes under government missions and agencies. Each centre carries an identifier, a name, and a type—GST, Pradhan Mantri Kaushal Kendra, or Yoga—that reflects the programme focus. The inauguration date marks when the centre became operational, the location provides geographic context, and the capacity indicates the maximum number of trainees. Centre BJewellGraham, a Regional Cluster of GST type, was inaugurated on 2025-04-14 at extended-location-99 with a capacity of 32. Centre 4447025, a Seasonal Review D of Pradhan Mantri Kaushal Kendra type, was inaugurated on 2022-09-25 at integrated-location-100 with a capacity of 41. Centre 209220, an Integrated Initiative of Yoga type, was inaugurated on 2023-02-09 at seasonal-location-101 with a capacity of 50. Centre 9568439, an Extended Model of GST type, was inaugurated on 2024-07-20 at regional-location-102 with a capacity of 59.

**Table `government_missions`**

| id | mission_id | mission_name | launch_date | anniversary_year | objective | government_agency_id | training_centre_id |
|---|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | 2022-05-17 | 32 | distributed-objectiv-36 | 100 | 100 |
| 101 | 82869 | Pilot Protocol A | 2023-10-01 | 43 | baseline-objectiv-37 | 101 | 101 |
| 102 | 8928505 | Baseline Programme | 2024-03-12 | 54 | pilot-objectiv-38 | 102 | 102 |
| 103 | 4716411 | Distributed Standard | 2025-08-23 | 65 | extended-objectiv-39 | 103 | 103 |

Government missions provide the strategic programmes under which training and compliance initiatives are organised. Each mission carries an identifier, a name, and a type that categorises its focus area. The start_date and end_date define the operational window, while the status field indicates whether the mission is active, completed, or suspended.

**Table `government_agencies`**

| id | agency_id | agency_name | ministry | established_date | government_mission_id | training_centre_id | registration_id |
|---|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | primary-ministry-94 | 2024-03-27 | 100 | 100 | 2106693 |
| 101 | Nikola Corporation | Whirlpool Corporation | adaptive-ministry-95 | 2025-08-11 | 101 | 101 | 778572 |
| 102 | Oberthur Technologies | Education Writers Association | distributed-ministry-96 | 2022-01-22 | 102 | 102 | 8387538 |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | baseline-ministry-97 | 2023-06-06 | 103 | 103 | 4277008 |

Government agencies are the implementing bodies that execute mission directives and oversee training centres. Each agency carries an identifier, a name, and a type. The head_office location identifies the agency's primary base, and the status field reflects its current operational standing.

The power of this system emerges not from individual tables but from the joined views that connect entities across organisational boundaries. Each view answers a specific operational question by combining records from two or more tables.

**View `tax_registration_trader_view`**

```sql
CREATE VIEW tax_registration_trader_view AS
SELECT a.registration_id, a.issue_date, a.expiry_date, a.status, b.id AS trader_id, b.trader_id AS trader_trader_id, b.legal_name AS trader_legal_name
FROM tax_registrations a JOIN traders b ON a.trader_id = b.id;
```

| registration_id | issue_date | expiry_date | status | trader_id | trader_trader_id | trader_legal_name |
|---|---|---|---|---|---|---|
| 2106693 | 2023-02-01 | 2023-10-24 | active | 1 | 2002007020080 | Adaptive Model |
| 778572 | 2024-07-12 | 2024-03-08 | pending | 2 | 2986247 | Primary Cluster |
| 8387538 | 2025-12-23 | 2025-08-19 | cancelled | 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D |
| 4277008 | 2022-05-07 | 2022-01-03 | provisional | 4 | 392491 | Compact Initiative |

This view links each tax registration to its corresponding trader, answering which commercial entity holds which registration. Registration 2106693 maps to trader 2002007020080 ("Adaptive Model"), showing an active registration with a turnover threshold of 8.95 and an annual aggregate turnover of 13.20. Registration 778572 maps to trader 2986247 ("Primary Cluster"), revealing a pending registration paired with a not_registered trader status—a discrepancy that warrants review.

**View `tax_registration_jurisdiction_view`**

```sql
CREATE VIEW tax_registration_jurisdiction_view AS
SELECT a.registration_id, a.issue_date, a.expiry_date, a.status, b.jurisdiction_code AS jurisdiction_jurisdiction_code, b.jurisdiction_name AS jurisdiction_jurisdiction_name, b.jurisdiction_type AS jurisdiction_jurisdiction_type
FROM tax_registrations a JOIN jurisdictions b ON a.jurisdiction_code = b.jurisdiction_code;
```

| registration_id | issue_date | expiry_date | status | jurisdiction_jurisdiction_code | jurisdiction_jurisdiction_name | jurisdiction_jurisdiction_type |
|---|---|---|---|---|---|---|
| 2106693 | 2023-02-01 | 2023-10-24 | active | 5917299 | Pilot Cluster | State |
| 778572 | 2024-07-12 | 2024-03-08 | pending | id_25 | Baseline Review | Union Territory |
| 8387538 | 2025-12-23 | 2025-08-19 | cancelled | 7731856 | Distributed Initiative A | State |
| 4277008 | 2022-05-07 | 2022-01-03 | provisional | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory |

This view associates each registration with its governing jurisdiction, answering which territorial authority oversees each registration. Registration 2106693 falls under jurisdiction 5917299 ("Pilot Cluster"), a State with special category status and a threshold of 8.95. Registration 778572 falls under jurisdiction id_25 ("Baseline Review"), a Union Territory without special category status and a threshold of 11.90.

**View `tax_registration_input_tax_credit_view`**

```sql
CREATE VIEW tax_registration_input_tax_credit_view AS
SELECT a.registration_id, a.issue_date, a.expiry_date, a.status, b.id AS credit_id, b.credit_id AS credit_credit_id, b.credit_amount AS credit_credit_amount
FROM tax_registrations a JOIN input_tax_credits b ON a.input_tax_credit_id = b.id;
```

| registration_id | issue_date | expiry_date | status | credit_id | credit_credit_id | credit_credit_amount |
|---|---|---|---|---|---|---|
| 2106693 | 2023-02-01 | 2023-10-24 | active | 100 | 7119786 | 2,821 |
| 778572 | 2024-07-12 | 2024-03-08 | pending | 101 | gd_fp_ne_acc1 | 105,297 |
| 8387538 | 2025-12-23 | 2025-08-19 | cancelled | 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 |
| 4277008 | 2022-05-07 | 2022-01-03 | provisional | 103 | 2933471 | 27.32 |

This view connects registrations to their associated input tax credits, answering which credits are attributable to which registration. Registration 2106693 is linked to credit 7119786 with an amount of 2,821 in available status. Registration 778572 is linked to credit gd_fp_ne_acc1 with the largest amount of 105,297, already utilised.

**View `trader_tax_registration_view`**

```sql
CREATE VIEW trader_tax_registration_view AS
SELECT a.id, a.trader_id, a.legal_name, a.pan_number, b.registration_id AS registration_registration_id, b.issue_date AS registration_issue_date, b.expiry_date AS registration_expiry_date
FROM traders a JOIN tax_registrations b ON a.registration_id = b.registration_id;
```

| id | trader_id | legal_name | pan_number | registration_registration_id | registration_issue_date | registration_expiry_date |
|---|---|---|---|---|---|---|
| 1 | 2002007020080 | Adaptive Model | PAN-2559 | 2106693 | 2023-02-01 | 2023-10-24 |
| 2 | 2986247 | Primary Cluster | PAN-2565 | 778572 | 2024-07-12 | 2024-03-08 |
| 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D | PAN-2571 | 8387538 | 2025-12-23 | 2025-08-19 |
| 4 | 392491 | Compact Initiative | PAN-2577 | 4277008 | 2022-05-07 | 2022-01-03 |

The inverse of the registration-to-trader link, this view answers which registrations are held by each trader. Trader 2002007020080 holds registration 2106693, which is active and exempted. Trader 2986247 holds registration 778572, which is pending and not exempted.

**View `trader_jurisdiction_view`**

```sql
CREATE VIEW trader_jurisdiction_view AS
SELECT a.id, a.trader_id, a.legal_name, a.pan_number, b.jurisdiction_code AS jurisdiction_jurisdiction_code, b.jurisdiction_name AS jurisdiction_jurisdiction_name, b.jurisdiction_type AS jurisdiction_jurisdiction_type
FROM traders a JOIN jurisdictions b ON a.jurisdiction_code = b.jurisdiction_code;
```

| id | trader_id | legal_name | pan_number | jurisdiction_jurisdiction_code | jurisdiction_jurisdiction_name | jurisdiction_jurisdiction_type |
|---|---|---|---|---|---|---|
| 1 | 2002007020080 | Adaptive Model | PAN-2559 | 5917299 | Pilot Cluster | State |
| 2 | 2986247 | Primary Cluster | PAN-2565 | id_25 | Baseline Review | Union Territory |
| 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D | PAN-2571 | 7731856 | Distributed Initiative A | State |
| 4 | 392491 | Compact Initiative | PAN-2577 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory |

This view maps traders to their governing jurisdictions, answering which territorial authority has regulatory oversight of each trader. Trader 2002007020080 is governed by jurisdiction 5917299 ("Pilot Cluster"), a State with special category status. Trader 2986247 is governed by jurisdiction id_25 ("Baseline Review"), a Union Territory without special category status.

**View `trader_taxable_supply_view`**

```sql
CREATE VIEW trader_taxable_supply_view AS
SELECT a.id, a.trader_id, a.legal_name, a.pan_number, b.id AS supply_id, b.supply_id AS supply_supply_id, b.supply_date AS supply_supply_date
FROM traders a JOIN taxable_supplies b ON a.taxable_supply_id = b.id;
```

| id | trader_id | legal_name | pan_number | supply_id | supply_supply_id | supply_supply_date |
|---|---|---|---|---|---|---|
| 1 | 2002007020080 | Adaptive Model | PAN-2559 | 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 |
| 2 | 2986247 | Primary Cluster | PAN-2565 | 2 | 2839510 | 2024-11-04 |
| 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D | PAN-2571 | 3 | 3001009030100 | 2025-04-15 |
| 4 | 392491 | Compact Initiative | PAN-2577 | 4 | 3001009030060 | 2022-09-26 |

This view connects traders to their taxable supplies, answering which transactions are attributable to each trader. Trader 2002007020080 is associated with supply 57e47252-8fcd-11eb-924d-9cd76263cbd0, an exempted goods supply valued at 19.95 with a tax rate of 22.45. Trader 2986247 is associated with supply 2839510, a non-exempted services supply valued at 21.90 with a tax rate of 26.90.

**View `jurisdiction_trader_view`**

```sql
CREATE VIEW jurisdiction_trader_view AS
SELECT a.jurisdiction_code, a.jurisdiction_name, a.jurisdiction_type, a.is_special_category, b.id AS trader_id, b.trader_id AS trader_trader_id, b.legal_name AS trader_legal_name
FROM jurisdictions a JOIN traders b ON a.trader_id = b.id;
```

| jurisdiction_code | jurisdiction_name | jurisdiction_type | is_special_category | trader_id | trader_trader_id | trader_legal_name |
|---|---|---|---|---|---|---|
| 5917299 | Pilot Cluster | State | true | 1 | 2002007020080 | Adaptive Model |
| id_25 | Baseline Review | Union Territory | false | 2 | 2986247 | Primary Cluster |
| 7731856 | Distributed Initiative A | State | true | 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D |
| 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory | false | 4 | 392491 | Compact Initiative |

This view answers which traders operate within each jurisdiction. Jurisdiction 5917299 ("Pilot Cluster") contains trader 2002007020080 ("Adaptive Model"), a special category trader with registered status. Jurisdiction id_25 ("Baseline Review") contains trader 2986247 ("Primary Cluster"), a non-special category trader with not_registered status.

**View `jurisdiction_tax_registration_view`**

```sql
CREATE VIEW jurisdiction_tax_registration_view AS
SELECT a.jurisdiction_code, a.jurisdiction_name, a.jurisdiction_type, a.is_special_category, b.registration_id AS registration_registration_id, b.issue_date AS registration_issue_date, b.expiry_date AS registration_expiry_date
FROM jurisdictions a JOIN tax_registrations b ON a.registration_id = b.registration_id;
```

| jurisdiction_code | jurisdiction_name | jurisdiction_type | is_special_category | registration_registration_id | registration_issue_date | registration_expiry_date |
|---|---|---|---|---|---|---|
| 5917299 | Pilot Cluster | State | true | 2106693 | 2023-02-01 | 2023-10-24 |
| id_25 | Baseline Review | Union Territory | false | 778572 | 2024-07-12 | 2024-03-08 |
| 7731856 | Distributed Initiative A | State | true | 8387538 | 2025-12-23 | 2025-08-19 |
| 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory | false | 4277008 | 2022-05-07 | 2022-01-03 |

This view answers which registrations fall under each jurisdiction's authority. Jurisdiction 5917299 ("Pilot Cluster") oversees registration 2106693, an active exempted registration. Jurisdiction id_25 ("Baseline Review") oversees registration 778572, a pending non-exempted registration.

**View `taxable_supply_trader_view`**

```sql
CREATE VIEW taxable_supply_trader_view AS
SELECT a.id, a.supply_id, a.supply_date, a.supply_type, b.id AS trader_id, b.trader_id AS trader_trader_id, b.legal_name AS trader_legal_name
FROM taxable_supplies a JOIN traders b ON a.trader_id = b.id;
```

| id | supply_id | supply_date | supply_type | trader_id | trader_trader_id | trader_legal_name |
|---|---|---|---|---|---|---|
| 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 | goods | 1 | 2002007020080 | Adaptive Model |
| 2 | 2839510 | 2024-11-04 | services | 2 | 2986247 | Primary Cluster |
| 3 | 3001009030100 | 2025-04-15 | both | 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D |
| 4 | 3001009030060 | 2022-09-26 | goods | 4 | 392491 | Compact Initiative |

This view answers which trader is responsible for each taxable supply. Supply 57e47252-8fcd-11eb-924d-9cd76263cbd0 is attributable to trader 2002007020080 ("Adaptive Model"), an exempted goods supply. Supply 2839510 is attributable to trader 2986247 ("Primary Cluster"), a non-exempted services supply.

**View `taxable_supply_jurisdiction_view`**

```sql
CREATE VIEW taxable_supply_jurisdiction_view AS
SELECT a.id, a.supply_id, a.supply_date, a.supply_type, b.jurisdiction_code AS jurisdiction_jurisdiction_code, b.jurisdiction_name AS jurisdiction_jurisdiction_name, b.jurisdiction_type AS jurisdiction_jurisdiction_type
FROM taxable_supplies a JOIN jurisdictions b ON a.jurisdiction_code = b.jurisdiction_code;
```

| id | supply_id | supply_date | supply_type | jurisdiction_jurisdiction_code | jurisdiction_jurisdiction_name | jurisdiction_jurisdiction_type |
|---|---|---|---|---|---|---|
| 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 | goods | 5917299 | Pilot Cluster | State |
| 2 | 2839510 | 2024-11-04 | services | id_25 | Baseline Review | Union Territory |
| 3 | 3001009030100 | 2025-04-15 | both | 7731856 | Distributed Initiative A | State |
| 4 | 3001009030060 | 2022-09-26 | goods | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Model | Union Territory |

This view answers which jurisdiction governs each taxable supply. Supply 57e47252-8fcd-11eb-924d-9cd76263cbd0 falls under jurisdiction 5917299 ("Pilot Cluster"), a State with special category status. Supply 2839510 falls under jurisdiction id_25 ("Baseline Review"), a Union Territory without special category status.

**View `input_tax_credit_trader_view`**

```sql
CREATE VIEW input_tax_credit_trader_view AS
SELECT a.id, a.credit_id, a.credit_amount, a.credit_date, b.id AS trader_id, b.trader_id AS trader_trader_id, b.legal_name AS trader_legal_name
FROM input_tax_credits a JOIN traders b ON a.trader_id = b.id;
```

| id | credit_id | credit_amount | credit_date | trader_id | trader_trader_id | trader_legal_name |
|---|---|---|---|---|---|---|
| 100 | 7119786 | 2,821 | 2024-11-10 | 1 | 2002007020080 | Adaptive Model |
| 101 | gd_fp_ne_acc1 | 105,297 | 2025-04-21 | 2 | 2986247 | Primary Cluster |
| 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 | 2022-09-05 | 3 | 98a02b9c-8fcd-11eb-924d-9cd76263cbd0 | Composite Review D |
| 103 | 2933471 | 27.32 | 2023-02-16 | 4 | 392491 | Compact Initiative |

This view answers which trader holds each input tax credit. Credit 7119786, amounting to 2,821 and in available status, is held by trader 2002007020080 ("Adaptive Model"). Credit gd_fp_ne_acc1, amounting to 105,297 and in utilised status, is held by trader 2986247 ("Primary Cluster").

**View `input_tax_credit_taxable_supply_view`**

```sql
CREATE VIEW input_tax_credit_taxable_supply_view AS
SELECT a.id, a.credit_id, a.credit_amount, a.credit_date, b.id AS supply_id, b.supply_id AS supply_supply_id, b.supply_date AS supply_supply_date
FROM input_tax_credits a JOIN taxable_supplies b ON a.taxable_supply_id = b.id;
```

| id | credit_id | credit_amount | credit_date | supply_id | supply_supply_id | supply_supply_date |
|---|---|---|---|---|---|---|
| 100 | 7119786 | 2,821 | 2024-11-10 | 1 | 57e47252-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-20 |
| 101 | gd_fp_ne_acc1 | 105,297 | 2025-04-21 | 2 | 2839510 | 2024-11-04 |
| 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 | 2022-09-05 | 3 | 3001009030100 | 2025-04-15 |
| 103 | 2933471 | 27.32 | 2023-02-16 | 4 | 3001009030060 | 2022-09-26 |

This view answers which taxable supply generated each input tax credit. Credit 7119786 is linked to supply 974924. Credit gd_fp_ne_acc1 is linked to supply 5082985. Credit ChIJd13ymnZu5kcRXM7jx5boJBs is linked to supply ChIJpfaaVfpt5kcRJ6dswRM-WVY. Credit 2933471 is linked to supply analytical-thinking.

**View `input_tax_credit_tax_registration_view`**

```sql
CREATE VIEW input_tax_credit_tax_registration_view AS
SELECT a.id, a.credit_id, a.credit_amount, a.credit_date, b.registration_id AS registration_registration_id, b.issue_date AS registration_issue_date, b.expiry_date AS registration_expiry_date
FROM input_tax_credits a JOIN tax_registrations b ON a.registration_id = b.registration_id;
```

| id | credit_id | credit_amount | credit_date | registration_registration_id | registration_issue_date | registration_expiry_date |
|---|---|---|---|---|---|---|
| 100 | 7119786 | 2,821 | 2024-11-10 | 2106693 | 2023-02-01 | 2023-10-24 |
| 101 | gd_fp_ne_acc1 | 105,297 | 2025-04-21 | 778572 | 2024-07-12 | 2024-03-08 |
| 102 | ChIJd13ymnZu5kcRXM7jx5boJBs | 16,949 | 2022-09-05 | 8387538 | 2025-12-23 | 2025-08-19 |
| 103 | 2933471 | 27.32 | 2023-02-16 | 4277008 | 2022-05-07 | 2022-01-03 |

This view answers which tax registration is associated with each input tax credit. Credit 7119786 is associated with registration 2106693. Credit gd_fp_ne_acc1 is associated with registration 778572. Credit ChIJd13ymnZu5kcRXM7jx5boJBs is associated with registration 8387538. Credit 2933471 is associated with registration 4277008.

**View `training_centre_government_agency_view`**

```sql
CREATE VIEW training_centre_government_agency_view AS
SELECT a.training_centre_id, a.centre_id, a.centre_name, a.centre_type, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM training_centres a JOIN government_agencies b ON a.government_agency_id = b.id;
```

| training_centre_id | centre_id | centre_name | centre_type | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | BJewellGraham | Regional Cluster | GST | 100 | U.S. Steel | FSG Social Impact Advisors |
| 101 | 4447025 | Seasonal Review D | Pradhan Mantri Kaushal Kendra | 101 | Nikola Corporation | Whirlpool Corporation |
| 102 | 209220 | Integrated Initiative | Yoga | 102 | Oberthur Technologies | Education Writers Association |
| 103 | 9568439 | Extended Model | GST | 103 | General Telephone & Electronics | Switch Card Services Ltd. |

This view answers which government agency oversees each training centre. Centre BJewellGraham ("Regional Cluster") is overseen by agency 100. Centre 4447025 ("Seasonal Review D") is overseen by agency 101. Centre 209220 ("Integrated Initiative") is overseen by agency 102. Centre 9568439 ("Extended Model") is overseen by agency 103.

**View `training_centre_government_mission_view`**

```sql
CREATE VIEW training_centre_government_mission_view AS
SELECT a.training_centre_id, a.centre_id, a.centre_name, a.centre_type, b.id AS mission_id, b.mission_id AS mission_mission_id, b.mission_name AS mission_mission_name
FROM training_centres a JOIN government_missions b ON a.government_mission_id = b.id;
```

| training_centre_id | centre_id | centre_name | centre_type | mission_id | mission_mission_id | mission_mission_name |
|---|---|---|---|---|---|---|
| 100 | BJewellGraham | Regional Cluster | GST | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework |
| 101 | 4447025 | Seasonal Review D | Pradhan Mantri Kaushal Kendra | 101 | 82869 | Pilot Protocol A |
| 102 | 209220 | Integrated Initiative | Yoga | 102 | 8928505 | Baseline Programme |
| 103 | 9568439 | Extended Model | GST | 103 | 4716411 | Distributed Standard |

This view answers which government mission each training centre supports. Centre BJewellGraham supports mission 100. Centre 4447025 supports mission 101. Centre 209220 supports mission 102. Centre 9568439 supports mission 103.

**View `government_mission_government_agency_view`**

```sql
CREATE VIEW government_mission_government_agency_view AS
SELECT a.id, a.mission_id, a.mission_name, a.launch_date, b.id AS agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM government_missions a JOIN government_agencies b ON a.government_agency_id = b.id;
```

| id | mission_id | mission_name | launch_date | agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | 2022-05-17 | 100 | U.S. Steel | FSG Social Impact Advisors |
| 101 | 82869 | Pilot Protocol A | 2023-10-01 | 101 | Nikola Corporation | Whirlpool Corporation |
| 102 | 8928505 | Baseline Programme | 2024-03-12 | 102 | Oberthur Technologies | Education Writers Association |
| 103 | 4716411 | Distributed Standard | 2025-08-23 | 103 | General Telephone & Electronics | Switch Card Services Ltd. |

This view answers which government agencies execute each government mission. Mission 100 is executed by agency 100. Mission 101 is executed by agency 101. Mission 102 is executed by agency 102. Mission 103 is executed by agency 103.

**View `government_mission_training_centre_view`**

```sql
CREATE VIEW government_mission_training_centre_view AS
SELECT a.id, a.mission_id, a.mission_name, a.launch_date, b.training_centre_id AS centre_training_centre_id, b.centre_id AS centre_centre_id, b.centre_name AS centre_centre_name
FROM government_missions a JOIN training_centres b ON a.training_centre_id = b.training_centre_id;
```

| id | mission_id | mission_name | launch_date | centre_training_centre_id | centre_centre_id | centre_centre_name |
|---|---|---|---|---|---|---|
| 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework | 2022-05-17 | 100 | BJewellGraham | Regional Cluster |
| 101 | 82869 | Pilot Protocol A | 2023-10-01 | 101 | 4447025 | Seasonal Review D |
| 102 | 8928505 | Baseline Programme | 2024-03-12 | 102 | 209220 | Integrated Initiative |
| 103 | 4716411 | Distributed Standard | 2025-08-23 | 103 | 9568439 | Extended Model |

This view answers which training centres are deployed under each government mission. Mission 100 deploys centre BJewellGraham. Mission 101 deploys centre 4447025. Mission 102 deploys centre 209220. Mission 103 deploys centre 9568439.

**View `government_agency_government_mission_view`**

```sql
CREATE VIEW government_agency_government_mission_view AS
SELECT a.id, a.agency_id, a.agency_name, a.ministry, b.id AS mission_id, b.mission_id AS mission_mission_id, b.mission_name AS mission_mission_name
FROM government_agencies a JOIN government_missions b ON a.government_mission_id = b.id;
```

| id | agency_id | agency_name | ministry | mission_id | mission_mission_id | mission_mission_name |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | primary-ministry-94 | 100 | 57da7384-8fcc-11eb-924d-9cd76263cbd0 | Extended Framework |
| 101 | Nikola Corporation | Whirlpool Corporation | adaptive-ministry-95 | 101 | 82869 | Pilot Protocol A |
| 102 | Oberthur Technologies | Education Writers Association | distributed-ministry-96 | 102 | 8928505 | Baseline Programme |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | baseline-ministry-97 | 103 | 4716411 | Distributed Standard |

This view answers which government missions each agency is responsible for executing. Agency 100 executes mission 100. Agency 101 executes mission 101. Agency 102 executes mission 102. Agency 103 executes mission 103.

**View `government_agency_training_centre_view`**

```sql
CREATE VIEW government_agency_training_centre_view AS
SELECT a.id, a.agency_id, a.agency_name, a.ministry, b.training_centre_id AS centre_training_centre_id, b.centre_id AS centre_centre_id, b.centre_name AS centre_centre_name
FROM government_agencies a JOIN training_centres b ON a.training_centre_id = b.training_centre_id;
```

| id | agency_id | agency_name | ministry | centre_training_centre_id | centre_centre_id | centre_centre_name |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | primary-ministry-94 | 100 | BJewellGraham | Regional Cluster |
| 101 | Nikola Corporation | Whirlpool Corporation | adaptive-ministry-95 | 101 | 4447025 | Seasonal Review D |
| 102 | Oberthur Technologies | Education Writers Association | distributed-ministry-96 | 102 | 209220 | Integrated Initiative |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | baseline-ministry-97 | 103 | 9568439 | Extended Model |

This view answers which training centres each government agency oversees. Agency 100 oversees centre BJewellGraham. Agency 101 oversees centre 4447025. Agency 102 oversees centre 209220. Agency 103 oversees centre 9568439.

**View `government_agency_tax_registration_view`**

```sql
CREATE VIEW government_agency_tax_registration_view AS
SELECT a.id, a.agency_id, a.agency_name, a.ministry, b.registration_id AS registration_registration_id, b.issue_date AS registration_issue_date, b.expiry_date AS registration_expiry_date
FROM government_agencies a JOIN tax_registrations b ON a.registration_id = b.registration_id;
```

| id | agency_id | agency_name | ministry | registration_registration_id | registration_issue_date | registration_expiry_date |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | primary-ministry-94 | 2106693 | 2023-02-01 | 2023-10-24 |
| 101 | Nikola Corporation | Whirlpool Corporation | adaptive-ministry-95 | 778572 | 2024-07-12 | 2024-03-08 |
| 102 | Oberthur Technologies | Education Writers Association | distributed-ministry-96 | 8387538 | 2025-12-23 | 2025-08-19 |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | baseline-ministry-97 | 4277008 | 2022-05-07 | 2022-01-03 |

This view answers which tax registrations fall under the oversight of each government agency. Agency 100 oversees registration 2106693. Agency 101 oversees registration 778572. Agency 102 oversees registration 8387538. Agency 103 oversees registration 4277008.

The interlocking structure of these records and views creates a comprehensive picture of tax administration. Traders register within jurisdictions, generate taxable supplies, accumulate input tax credits, and receive training through government missions and agencies. The status fields—active, pending, cancelled, provisional for registrations; registered, not_registered, liable for traders; available, utilised, expired for credits—provide real-time signals about the health of compliance. The turnover thresholds and tax rates quantify the financial dimensions, while the institutional framework of missions, agencies, and training centres ensures that capacity and oversight keep pace with regulatory complexity. Together, these records form the operational backbone of a modern tax administration system.