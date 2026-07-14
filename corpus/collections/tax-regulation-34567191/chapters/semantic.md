## Ontology-Grounded Relational Modelling of the Tax Deduction Domain

The domain under consideration concerns the computation and governance of qualified business income deductions under U.S. tax law — specifically the interplay between statutory authority, regulatory implementation, deductible amounts, and the business entities that qualify. At the conceptual level, the ontology distinguishes seven entity types: regulatory instruments (`tax_regulations`), legislative statutes (`tax_statutes`), deduction rules (`tax_deductions`), business income records (`qualified_business_incomes`), operating entities (`trade_or_businesses`), wage-and-asset limitation tests (`wage_asset_tests`), and activities excluded from the deduction (`disqualified_activities`). Each entity type materialises as a relational table whose primary key is a surrogate integer identifier, while foreign keys encode the cardinality-bounded relationships that the ontology prescribes. The following sections walk through the base tables, then demonstrate how each of the eighteen derived views reconstructs a domain fact from the normalised schema.

### Base Tables and Their Attributes

The regulatory layer is captured in `tax_regulations`, which stores individual regulation records alongside their lifecycle metadata. The table's primary key is `tax_regulation_id`, and each row carries a human-readable `title` (such as "Compact Initiative" or "Seasonal Review"), a `publication_date`, a `status` drawn from the values `proposed`, `final`, and `withdrawn`, and temporal columns `effective_date` and `hearing_date`. A `federal_register_citation` column anchors the regulation to its official publication, while the foreign keys `tax_statute_id` and `tax_deduction_id` link the regulation to its enabling statute and the deduction rule it implements. For instance, row 1000 — titled "Compact Initiative" with status `proposed` — references statute 1 and deduction 1000, and bears the citation `integrated-federal-34`.

**Table `tax_regulations`**

| tax_regulation_id | regulation_id | title | publication_date | status | effective_date | hearing_date | federal_register_citation | tax_statute_id | tax_deduction_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2087741 | Compact Initiative | 2025-12-01T23:33:00 | proposed | 2023-02-14 | 2025-04-02T15:33:00 | integrated-federal-34 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 4057 | Legacy Model | 2022-05-12T06:50:00 | final | 2024-07-25 | 2022-09-13T22:50:00 | seasonal-federal-35 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5917301 | Regional Cluster A | 2023-10-23T13:07:00 | withdrawn | 2025-12-09 | 2023-02-24T05:07:00 | regional-federal-36 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 10445633 | Seasonal Review | 2024-03-07T20:24:00 | proposed | 2022-05-20 | 2024-07-08T12:24:00 | legacy-federal-37 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Legislative authority is modelled in `tax_statutes`. Its primary key `tax_statute_id` is complemented by `statute_code` and `section_number` (e.g., `SEC-2472`), an `enactment_date`, and both a `short_title` and `long_title` for human reference. The `amendment_status` column records whether the statute is `original`, `amended`, or `repealed`. Foreign keys `tax_deduction_id` and `disqualified_activity_id` connect the statute to the deduction it authorises and to any activity it disqualifies. Row 1, for example, carries statute code `17312`, section `SEC-2472`, short title "Regional Initiative", and links to deduction 1000 and disqualified activity 1000.

**Table `tax_statutes`**

| tax_statute_id | statute_code | section_number | enactment_date | short_title | long_title | amendment_status | tax_deduction_id | disqualified_activity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 17312 | SEC-2472 | 2022-01-04 | Regional Initiative | Legacy Standard D | original | 1000 | 1000 |
| 2 | 7119782 | SEC-2477 | 2023-06-15 | Seasonal Model D | Regional Framework | amended | 1001 | 1001 |
| 3 | 1562850 | SEC-2482 | 2024-11-26 | Integrated Cluster | Seasonal Protocol | repealed | 1002 | 1002 |
| 4 | 325468 | SEC-2487 | 2025-04-10 | Extended Review | Integrated Programme A | original | 1003 | 1003 |

The core deduction logic lives in `tax_deductions`. Its primary key `tax_deduction_id` is accompanied by numeric columns that define the deduction mechanics: `deduction_percentage` (ranging from 9.20 to 18.80), `max_deduction_amount` (from 4,223 to 16,254), `effective_tax_rate`, `phase_in_threshold`, and `phase_out_threshold`. Boolean flags `applies_to_a_m_t`, `affects_basis`, and `affects_n_i_i` encode whether the deduction interacts with alternative minimum tax, basis calculations, or net investment income. Foreign keys `qualified_business_income_id`, `wage_asset_test_id`, and `disqualified_activity_id` tie each deduction to its income source, its wage-and-asset limitation test, and any excluded activity. Deduction 1000, for instance, applies a 9.20% rate with a maximum of 4,437 and flags `applies_to_a_m_t` as `true`.

**Table `tax_deductions`**

| tax_deduction_id | deduction_percentage | max_deduction_amount | effective_tax_rate | phase_in_threshold | phase_out_threshold | applies_to_a_m_t | affects_basis | affects_n_i_i | qualified_business_income_id | wage_asset_test_id | disqualified_activity_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9.20 | 4,437 | 8.45 | 2.70 | 12.20 | true | false | true | 1 | 1 | 1000 |
| 1001 | 12.40 | 4,223 | 11.90 | 5.40 | 14.40 | false | true | false | 2 | 2 | 1001 |
| 1002 | 15.60 | 16,254 | 15.35 | 8.10 | 16.60 | true | false | true | 3 | 3 | 1002 |
| 1003 | 18.80 | 8,308 | 18.80 | 10.80 | 18.80 | false | true | false | 4 | 4 | 1003 |

Business income is recorded in `qualified_business_incomes`. The surrogate key `id` identifies each income record, while `income_amount`, `loss_amount`, and `net_q_b_i` capture the financial figures — row 1 shows an income of 112,506 against a loss of 19.97, yielding a net QBI of 21.45. The `source_type` column distinguishes among `tradeOrBusiness`, `REIT`, and `PTP` entities. Boolean `is_s_s_t_b` indicates whether the income qualifies as a specified service trade or business, and `calculation_year` records the tax year. The foreign key `trade_or_business_employer_id` references the employer entity (e.g., "The Hongkong and Shanghai Banking Corporation Limited"), while `wage_asset_test_id` and `disqualified_activity_id` link to the applicable test and exclusion.

**Table `qualified_business_incomes`**

| id | income_amount | loss_amount | net_q_b_i | carried_forward_loss | source_type | is_s_s_t_b | calculation_year | trade_or_business_employer_id | wage_asset_test_id | disqualified_activity_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 112,506 | 19.97 | 21.45 | 19.70 | tradeOrBusiness | true | 36 | The Hongkong and Shanghai Banking Corporation Limited | 1 | 1000 |
| 2 | 261.79 | 26.04 | 23.90 | 22.40 | REIT | false | 41 | ChargePoint Holdings. | 2 | 1001 |
| 3 | 1,228 | 30.51 | 26.35 | 25.10 | PTP | true | 46 | Intl. Business Machines | 3 | 1002 |
| 4 | 2,525 | 12.34 | 28.80 | 27.80 | tradeOrBusiness | false | 51 | Feedback Ratings | 4 | 1003 |

Operating entities are stored in `trade_or_businesses`. The table's implicit primary key is the surrogate row identifier, and the `entity_type` column enumerates business forms such as `soleProprietorship`, `partnership`, `S_Corporation`, and `LLC`. Columns `total_wages_paid` and `unadjusted_basis_of_property` record the wage and property bases used in the wage-and-asset test. The `employer_id` column names the operating entity (e.g., "ChargePoint Holdings." or "Intl. Business Machines"), and `location` provides a geographic tag. Foreign keys `qualified_business_income_id`, `wage_asset_test_id`, and `disqualified_activity_id` complete the linkage to income, test, and exclusion. Row 3, an `S_Corporation` operated by "Intl. Business Machines" at `seasonal-location-101`, carries wages of 25.60 and a property basis of 22.10.

**Table `trade_or_businesses`**

| entity_type | employer_id | location | is_s_s_t_b | total_wages_paid | unadjusted_basis_of_property | tax_year | qualified_business_income_id | wage_asset_test_id | disqualified_activity_id |
|---|---|---|---|---|---|---|---|---|---|
| soleProprietorship | The Hongkong and Shanghai Banking Corporation Limited | extended-location-99 | true | 21.20 | 18.70 | 26 | 1 | 1 | 1000 |
| partnership | ChargePoint Holdings. | integrated-location-100 | false | 23.40 | 20.40 | 36 | 2 | 2 | 1001 |
| S_Corporation | Intl. Business Machines | seasonal-location-101 | true | 25.60 | 22.10 | 46 | 3 | 3 | 1002 |
| LLC | Feedback Ratings | regional-location-102 | false | 27.80 | 23.80 | 56 | 4 | 4 | 1003 |

Wage-and-asset limitation tests are captured in `wage_asset_tests`. Its primary key `id` is paired with `wage_limit`, `asset_limit`, and `combined_limit` — numeric thresholds that determine whether the deduction is constrained. The `phase_in_percentage` column records the gradual application rate, while `is_fully_applicable` is a boolean indicating whether the test applies in full. `test_year` anchors the test to a tax year, and `trade_or_business_employer_id` names the employer. The foreign key `tax_deduction_id` connects the test to the deduction it constrains. Test 3, for example, has a wage limit of 19.97, an asset limit of 15.35, and a combined limit of 16.10, with `is_fully_applicable` set to `true`.

**Table `wage_asset_tests`**

| id | wage_limit | asset_limit | combined_limit | phase_in_percentage | is_fully_applicable | test_year | trade_or_business_employer_id | tax_deduction_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 12.72 | 10.45 | 12.70 | 6.95 | true | 28 | The Hongkong and Shanghai Banking Corporation Limited | 1000 |
| 2 | 14.31 | 12.90 | 14.40 | 10.90 | false | 34 | ChargePoint Holdings. | 1001 |
| 3 | 19.97 | 15.35 | 16.10 | 14.85 | true | 40 | Intl. Business Machines | 1002 |
| 4 | 17.41 | 17.80 | 17.80 | 18.80 | false | 46 | Feedback Ratings | 1003 |

Excluded activities are modelled in `disqualified_activities`. Although the data payload is not shown in the reference table, the ontology treats this as a first-class entity type with its own surrogate key and attributes, linked from `tax_statutes`, `tax_deductions`, `qualified_business_incomes`, and `trade_or_businesses` via the `disqualified_activity_id` foreign key. The presence of values 1000 through 1003 across the other tables confirms that each deduction, income, and business entity is associated with a specific disqualified activity record.

### Derived Views as Reconstructed Domain Facts

The eighteen views materialise the ontology's relationships as denormalised projections, each answering a specific analytical question by joining two or more base tables.

The view `tax_regulation_tax_statute_view` joins `tax_regulations` to `tax_statutes` on `tax_statute_id`, answering the question: "Which statute authorises each regulation?" A row from this view would pair regulation 1000 ("Compact Initiative") with statute 1 (section `SEC-2472`, "Regional Initiative"), making explicit the regulatory chain from statute to implementing rule.

**View `tax_regulation_tax_statute_view`**

```sql
CREATE VIEW tax_regulation_tax_statute_view AS
SELECT a.tax_regulation_id, a.regulation_id, a.title, a.publication_date, b.tax_statute_id AS statute_tax_statute_id, b.statute_code AS statute_statute_code, b.section_number AS statute_section_number
FROM tax_regulations a JOIN tax_statutes b ON a.tax_statute_id = b.tax_statute_id;
```

| tax_regulation_id | regulation_id | title | publication_date | statute_tax_statute_id | statute_statute_code | statute_section_number |
|---|---|---|---|---|---|---|
| 1000 | 2087741 | Compact Initiative | 2025-12-01T23:33:00 | 1 | 17312 | SEC-2472 |
| 1001 | 4057 | Legacy Model | 2022-05-12T06:50:00 | 2 | 7119782 | SEC-2477 |
| 1002 | 5917301 | Regional Cluster A | 2023-10-23T13:07:00 | 3 | 1562850 | SEC-2482 |
| 1003 | 10445633 | Seasonal Review | 2024-03-07T20:24:00 | 4 | 325468 | SEC-2487 |

The view `tax_regulation_tax_deduction_view` joins `tax_regulations` to `tax_deductions` on `tax_deduction_id`, answering: "Which deduction rule does each regulation implement?" Regulation 1001 ("Legacy Model", status `final`) maps to deduction 1001, which applies a 12.40% rate with a maximum of 4,223.

**View `tax_regulation_tax_deduction_view`**

```sql
CREATE VIEW tax_regulation_tax_deduction_view AS
SELECT a.tax_regulation_id, a.regulation_id, a.title, a.publication_date, b.tax_deduction_id AS deduction_tax_deduction_id, b.deduction_percentage AS deduction_deduction_percentage, b.max_deduction_amount AS deduction_max_deduction_amount
FROM tax_regulations a JOIN tax_deductions b ON a.tax_deduction_id = b.tax_deduction_id;
```

| tax_regulation_id | regulation_id | title | publication_date | deduction_tax_deduction_id | deduction_deduction_percentage | deduction_max_deduction_amount |
|---|---|---|---|---|---|---|
| 1000 | 2087741 | Compact Initiative | 2025-12-01T23:33:00 | 1000 | 9.20 | 4,437 |
| 1001 | 4057 | Legacy Model | 2022-05-12T06:50:00 | 1001 | 12.40 | 4,223 |
| 1002 | 5917301 | Regional Cluster A | 2023-10-23T13:07:00 | 1002 | 15.60 | 16,254 |
| 1003 | 10445633 | Seasonal Review | 2024-03-07T20:24:00 | 1003 | 18.80 | 8,308 |

The view `tax_statute_tax_deduction_view` joins `tax_statutes` to `tax_deductions` on `tax_deduction_id`, answering: "Which deduction is authorised by each statute?" Statute 3 ("Integrated Cluster", section `SEC-2482`, status `repealed`) authorises deduction 1002, which applies a 15.60% rate and flags `applies_to_a_m_t` as `true`.

**View `tax_statute_tax_deduction_view`**

```sql
CREATE VIEW tax_statute_tax_deduction_view AS
SELECT a.tax_statute_id, a.statute_code, a.section_number, a.enactment_date, b.tax_deduction_id AS deduction_tax_deduction_id, b.deduction_percentage AS deduction_deduction_percentage, b.max_deduction_amount AS deduction_max_deduction_amount
FROM tax_statutes a JOIN tax_deductions b ON a.tax_deduction_id = b.tax_deduction_id;
```

| tax_statute_id | statute_code | section_number | enactment_date | deduction_tax_deduction_id | deduction_deduction_percentage | deduction_max_deduction_amount |
|---|---|---|---|---|---|---|
| 1 | 17312 | SEC-2472 | 2022-01-04 | 1000 | 9.20 | 4,437 |
| 2 | 7119782 | SEC-2477 | 2023-06-15 | 1001 | 12.40 | 4,223 |
| 3 | 1562850 | SEC-2482 | 2024-11-26 | 1002 | 15.60 | 16,254 |
| 4 | 325468 | SEC-2487 | 2025-04-10 | 1003 | 18.80 | 8,308 |

The view `tax_statute_disqualified_activity_view` joins `tax_statutes` to `disqualified_activities` on `disqualified_activity_id`, answering: "Which activities does each statute disqualify?" Statute 2 ("Seasonal Model D", enacted 2023-06-15) disqualifies activity 1001.

**View `tax_statute_disqualified_activity_view`**

```sql
CREATE VIEW tax_statute_disqualified_activity_view AS
SELECT a.tax_statute_id, a.statute_code, a.section_number, a.enactment_date, b.id AS activity_id, b.activity_code AS activity_activity_code, b.activity_name AS activity_activity_name
FROM tax_statutes a JOIN disqualified_activities b ON a.disqualified_activity_id = b.id;
```

| tax_statute_id | statute_code | section_number | enactment_date | activity_id | activity_activity_code | activity_activity_name |
|---|---|---|---|---|---|---|
| 1 | 17312 | SEC-2472 | 2022-01-04 | 1000 | 12585 | Composite Programme |
| 2 | 7119782 | SEC-2477 | 2023-06-15 | 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A |
| 3 | 1562850 | SEC-2482 | 2024-11-26 | 1002 | 195368 | Legacy Framework |
| 4 | 325468 | SEC-2487 | 2025-04-10 | 1003 | 9085257 | Regional Protocol |

The view `tax_deduction_qualified_business_income_view` joins `tax_deductions` to `qualified_business_incomes` on `qualified_business_income_id`, answering: "Which business incomes fall under each deduction rule?" Deduction 1000 (9.20% rate) applies to income record 1, which reports an income of 112,506 from a `tradeOrBusiness` source operated by "The Hongkong and Shanghai Banking Corporation Limited".

**View `tax_deduction_qualified_business_income_view`**

```sql
CREATE VIEW tax_deduction_qualified_business_income_view AS
SELECT a.tax_deduction_id, a.deduction_percentage, a.max_deduction_amount, a.effective_tax_rate, b.id AS income_id, b.income_amount AS income_income_amount, b.loss_amount AS income_loss_amount
FROM tax_deductions a JOIN qualified_business_incomes b ON a.qualified_business_income_id = b.id;
```

| tax_deduction_id | deduction_percentage | max_deduction_amount | effective_tax_rate | income_id | income_income_amount | income_loss_amount |
|---|---|---|---|---|---|---|
| 1000 | 9.20 | 4,437 | 8.45 | 1 | 112,506 | 19.97 |
| 1001 | 12.40 | 4,223 | 11.90 | 2 | 261.79 | 26.04 |
| 1002 | 15.60 | 16,254 | 15.35 | 3 | 1,228 | 30.51 |
| 1003 | 18.80 | 8,308 | 18.80 | 4 | 2,525 | 12.34 |

The view `tax_deduction_wage_asset_test_view` joins `tax_deductions` to `wage_asset_tests` on `wage_asset_test_id`, answering: "Which wage-and-asset test constrains each deduction?" Deduction 1001 (12.40% rate) is constrained by test 2, which has a wage limit of 14.31 and an asset limit of 12.90, with `is_fully_applicable` set to `false`.

**View `tax_deduction_wage_asset_test_view`**

```sql
CREATE VIEW tax_deduction_wage_asset_test_view AS
SELECT a.tax_deduction_id, a.deduction_percentage, a.max_deduction_amount, a.effective_tax_rate, b.id AS test_id, b.wage_limit AS test_wage_limit, b.asset_limit AS test_asset_limit
FROM tax_deductions a JOIN wage_asset_tests b ON a.wage_asset_test_id = b.id;
```

| tax_deduction_id | deduction_percentage | max_deduction_amount | effective_tax_rate | test_id | test_wage_limit | test_asset_limit |
|---|---|---|---|---|---|---|
| 1000 | 9.20 | 4,437 | 8.45 | 1 | 12.72 | 10.45 |
| 1001 | 12.40 | 4,223 | 11.90 | 2 | 14.31 | 12.90 |
| 1002 | 15.60 | 16,254 | 15.35 | 3 | 19.97 | 15.35 |
| 1003 | 18.80 | 8,308 | 18.80 | 4 | 17.41 | 17.80 |

The view `tax_deduction_disqualified_activity_view` joins `tax_deductions` to `disqualified_activities` on `disqualified_activity_id`, answering: "Which excluded activity is associated with each deduction?" Deduction 1003 (18.80% rate, maximum 8,308) is linked to disqualified activity 1003.

**View `tax_deduction_disqualified_activity_view`**

```sql
CREATE VIEW tax_deduction_disqualified_activity_view AS
SELECT a.tax_deduction_id, a.deduction_percentage, a.max_deduction_amount, a.effective_tax_rate, b.id AS activity_id, b.activity_code AS activity_activity_code, b.activity_name AS activity_activity_name
FROM tax_deductions a JOIN disqualified_activities b ON a.disqualified_activity_id = b.id;
```

| tax_deduction_id | deduction_percentage | max_deduction_amount | effective_tax_rate | activity_id | activity_activity_code | activity_activity_name |
|---|---|---|---|---|---|---|
| 1000 | 9.20 | 4,437 | 8.45 | 1000 | 12585 | Composite Programme |
| 1001 | 12.40 | 4,223 | 11.90 | 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A |
| 1002 | 15.60 | 16,254 | 15.35 | 1002 | 195368 | Legacy Framework |
| 1003 | 18.80 | 8,308 | 18.80 | 1003 | 9085257 | Regional Protocol |

The view `qualified_business_income_trade_or_business_view` joins `qualified_business_incomes` to `trade_or_businesses` on `trade_or_business_employer_id`, answering: "Which business entity generates each qualified income?" Income record 2 (income 261.79, source `REIT`) is generated by the partnership "ChargePoint Holdings." at `integrated-location-100`.

**View `qualified_business_income_trade_or_business_view`**

```sql
CREATE VIEW qualified_business_income_trade_or_business_view AS
SELECT a.id, a.income_amount, a.loss_amount, a.net_q_b_i, b.entity_type AS business_entity_type, b.employer_id AS business_employer_id, b.location AS business_location
FROM qualified_business_incomes a JOIN trade_or_businesses b ON a.trade_or_business_employer_id = b.employer_id;
```

| id | income_amount | loss_amount | net_q_b_i | business_entity_type | business_employer_id | business_location |
|---|---|---|---|---|---|---|
| 1 | 112,506 | 19.97 | 21.45 | soleProprietorship | The Hongkong and Shanghai Banking Corporation Limited | extended-location-99 |
| 2 | 261.79 | 26.04 | 23.90 | partnership | ChargePoint Holdings. | integrated-location-100 |
| 3 | 1,228 | 30.51 | 26.35 | S_Corporation | Intl. Business Machines | seasonal-location-101 |
| 4 | 2,525 | 12.34 | 28.80 | LLC | Feedback Ratings | regional-location-102 |

The view `qualified_business_income_wage_asset_test_view` joins `qualified_business_incomes` to `wage_asset_tests` on `wage_asset_test_id`, answering: "Which wage-and-asset test applies to each income record?" Income record 3 (net QBI 26.35, source `PTP`) is tested against wage-and-asset test 3, which has a combined limit of 16.10.

**View `qualified_business_income_wage_asset_test_view`**

```sql
CREATE VIEW qualified_business_income_wage_asset_test_view AS
SELECT a.id, a.income_amount, a.loss_amount, a.net_q_b_i, b.id AS test_id, b.wage_limit AS test_wage_limit, b.asset_limit AS test_asset_limit
FROM qualified_business_incomes a JOIN wage_asset_tests b ON a.wage_asset_test_id = b.id;
```

| id | income_amount | loss_amount | net_q_b_i | test_id | test_wage_limit | test_asset_limit |
|---|---|---|---|---|---|---|
| 1 | 112,506 | 19.97 | 21.45 | 1 | 12.72 | 10.45 |
| 2 | 261.79 | 26.04 | 23.90 | 2 | 14.31 | 12.90 |
| 3 | 1,228 | 30.51 | 26.35 | 3 | 19.97 | 15.35 |
| 4 | 2,525 | 12.34 | 28.80 | 4 | 17.41 | 17.80 |

The view `qualified_business_income_disqualified_activity_view` joins `qualified_business_incomes` to `disqualified_activities` on `disqualified_activity_id`, answering: "Which excluded activity is associated with each income record?" Income record 4 (income 2,525, source `tradeOrBusiness`) is linked to disqualified activity 1003.

**View `qualified_business_income_disqualified_activity_view`**

```sql
CREATE VIEW qualified_business_income_disqualified_activity_view AS
SELECT a.id, a.income_amount, a.loss_amount, a.net_q_b_i, b.id AS activity_id, b.activity_code AS activity_activity_code, b.activity_name AS activity_activity_name
FROM qualified_business_incomes a JOIN disqualified_activities b ON a.disqualified_activity_id = b.id;
```

| id | income_amount | loss_amount | net_q_b_i | activity_id | activity_activity_code | activity_activity_name |
|---|---|---|---|---|---|---|
| 1 | 112,506 | 19.97 | 21.45 | 1000 | 12585 | Composite Programme |
| 2 | 261.79 | 26.04 | 23.90 | 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A |
| 3 | 1,228 | 30.51 | 26.35 | 1002 | 195368 | Legacy Framework |
| 4 | 2,525 | 12.34 | 28.80 | 1003 | 9085257 | Regional Protocol |

The view `trade_or_business_qualified_business_income_view` joins `trade_or_businesses` to `qualified_business_incomes` on `qualified_business_income_id`, answering: "Which income records are attributable to each business entity?" The LLC "Feedback Ratings" at `regional-location-102` is associated with income record 4, which reports an income of 2,525 and a loss of 12.34.

**View `trade_or_business_qualified_business_income_view`**

```sql
CREATE VIEW trade_or_business_qualified_business_income_view AS
SELECT a.entity_type, a.employer_id, a.location, a.is_s_s_t_b, b.id AS income_id, b.income_amount AS income_income_amount, b.loss_amount AS income_loss_amount
FROM trade_or_businesses a JOIN qualified_business_incomes b ON a.qualified_business_income_id = b.id;
```

| entity_type | employer_id | location | is_s_s_t_b | income_id | income_income_amount | income_loss_amount |
|---|---|---|---|---|---|---|
| soleProprietorship | The Hongkong and Shanghai Banking Corporation Limited | extended-location-99 | true | 1 | 112,506 | 19.97 |
| partnership | ChargePoint Holdings. | integrated-location-100 | false | 2 | 261.79 | 26.04 |
| S_Corporation | Intl. Business Machines | seasonal-location-101 | true | 3 | 1,228 | 30.51 |
| LLC | Feedback Ratings | regional-location-102 | false | 4 | 2,525 | 12.34 |

The view `trade_or_business_wage_asset_test_view` joins `trade_or_businesses` to `wage_asset_tests` on `wage_asset_test_id`, answering: "Which wage-and-asset test applies to each business entity?" The S_Corporation "Intl. Business Machines" at `seasonal-location-101` is tested against wage-and-asset test 3, with a wage limit of 19.97 and an asset limit of 15.35.

**View `trade_or_business_wage_asset_test_view`**

```sql
CREATE VIEW trade_or_business_wage_asset_test_view AS
SELECT a.entity_type, a.employer_id, a.location, a.is_s_s_t_b, b.id AS test_id, b.wage_limit AS test_wage_limit, b.asset_limit AS test_asset_limit
FROM trade_or_businesses a JOIN wage_asset_tests b ON a.wage_asset_test_id = b.id;
```

| entity_type | employer_id | location | is_s_s_t_b | test_id | test_wage_limit | test_asset_limit |
|---|---|---|---|---|---|---|
| soleProprietorship | The Hongkong and Shanghai Banking Corporation Limited | extended-location-99 | true | 1 | 12.72 | 10.45 |
| partnership | ChargePoint Holdings. | integrated-location-100 | false | 2 | 14.31 | 12.90 |
| S_Corporation | Intl. Business Machines | seasonal-location-101 | true | 3 | 19.97 | 15.35 |
| LLC | Feedback Ratings | regional-location-102 | false | 4 | 17.41 | 17.80 |

The view `trade_or_business_disqualified_activity_view` joins `trade_or_businesses` to `disqualified_activities` on `disqualified_activity_id`, answering: "Which excluded activity is associated with each business entity?" The partnership "ChargePoint Holdings." is linked to disqualified activity 1001.

**View `trade_or_business_disqualified_activity_view`**

```sql
CREATE VIEW trade_or_business_disqualified_activity_view AS
SELECT a.entity_type, a.employer_id, a.location, a.is_s_s_t_b, b.id AS activity_id, b.activity_code AS activity_activity_code, b.activity_name AS activity_activity_name
FROM trade_or_businesses a JOIN disqualified_activities b ON a.disqualified_activity_id = b.id;
```

| entity_type | employer_id | location | is_s_s_t_b | activity_id | activity_activity_code | activity_activity_name |
|---|---|---|---|---|---|---|
| soleProprietorship | The Hongkong and Shanghai Banking Corporation Limited | extended-location-99 | true | 1000 | 12585 | Composite Programme |
| partnership | ChargePoint Holdings. | integrated-location-100 | false | 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A |
| S_Corporation | Intl. Business Machines | seasonal-location-101 | true | 1002 | 195368 | Legacy Framework |
| LLC | Feedback Ratings | regional-location-102 | false | 1003 | 9085257 | Regional Protocol |

The view `wage_asset_test_trade_or_business_view` joins `wage_asset_tests` to `trade_or_businesses` on `trade_or_business_employer_id`, answering: "Which business entities are subject to each wage-and-asset test?" Test 1 (wage limit 12.72, asset limit 10.45) applies to the soleProprietorship "The Hongkong and Shanghai Banking Corporation Limited" at `extended-location-99`.

**View `wage_asset_test_trade_or_business_view`**

```sql
CREATE VIEW wage_asset_test_trade_or_business_view AS
SELECT a.id, a.wage_limit, a.asset_limit, a.combined_limit, b.entity_type AS business_entity_type, b.employer_id AS business_employer_id, b.location AS business_location
FROM wage_asset_tests a JOIN trade_or_businesses b ON a.trade_or_business_employer_id = b.employer_id;
```

| id | wage_limit | asset_limit | combined_limit | business_entity_type | business_employer_id | business_location |
|---|---|---|---|---|---|---|
| 1 | 12.72 | 10.45 | 12.70 | soleProprietorship | The Hongkong and Shanghai Banking Corporation Limited | extended-location-99 |
| 2 | 14.31 | 12.90 | 14.40 | partnership | ChargePoint Holdings. | integrated-location-100 |
| 3 | 19.97 | 15.35 | 16.10 | S_Corporation | Intl. Business Machines | seasonal-location-101 |
| 4 | 17.41 | 17.80 | 17.80 | LLC | Feedback Ratings | regional-location-102 |

The view `wage_asset_test_tax_deduction_view` joins `wage_asset_tests` to `tax_deductions` on `tax_deduction_id`, answering: "Which deduction rule is constrained by each wage-and-asset test?" Test 4 (wage limit 17.41, asset limit 17.80, `is_fully_applicable` = `false`) constrains deduction 1003, which applies an 18.80% rate.

**View `wage_asset_test_tax_deduction_view`**

```sql
CREATE VIEW wage_asset_test_tax_deduction_view AS
SELECT a.id, a.wage_limit, a.asset_limit, a.combined_limit, b.tax_deduction_id AS deduction_tax_deduction_id, b.deduction_percentage AS deduction_deduction_percentage, b.max_deduction_amount AS deduction_max_deduction_amount
FROM wage_asset_tests a JOIN tax_deductions b ON a.tax_deduction_id = b.tax_deduction_id;
```

| id | wage_limit | asset_limit | combined_limit | deduction_tax_deduction_id | deduction_deduction_percentage | deduction_max_deduction_amount |
|---|---|---|---|---|---|---|
| 1 | 12.72 | 10.45 | 12.70 | 1000 | 9.20 | 4,437 |
| 2 | 14.31 | 12.90 | 14.40 | 1001 | 12.40 | 4,223 |
| 3 | 19.97 | 15.35 | 16.10 | 1002 | 15.60 | 16,254 |
| 4 | 17.41 | 17.80 | 17.80 | 1003 | 18.80 | 8,308 |

The view `disqualified_activity_trade_or_business_view` joins `disqualified_activities` to `trade_or_businesses` on `disqualified_activity_id`, answering: "Which business entities are associated with each disqualified activity?" Disqualified activity 1002 is associated with the S_Corporation "Intl. Business Machines".

**View `disqualified_activity_trade_or_business_view`**

```sql
CREATE VIEW disqualified_activity_trade_or_business_view AS
SELECT a.id, a.activity_code, a.activity_name, a.is_de_minimis, b.entity_type AS business_entity_type, b.employer_id AS business_employer_id, b.location AS business_location
FROM disqualified_activities a JOIN trade_or_businesses b ON a.trade_or_business_employer_id = b.employer_id;
```

| id | activity_code | activity_name | is_de_minimis | business_entity_type | business_employer_id | business_location |
|---|---|---|---|---|---|---|
| 1000 | 12585 | Composite Programme | true | soleProprietorship | The Hongkong and Shanghai Banking Corporation Limited | extended-location-99 |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A | false | partnership | ChargePoint Holdings. | integrated-location-100 |
| 1002 | 195368 | Legacy Framework | true | S_Corporation | Intl. Business Machines | seasonal-location-101 |
| 1003 | 9085257 | Regional Protocol | false | LLC | Feedback Ratings | regional-location-102 |

The view `disqualified_activity_tax_deduction_view` joins `disqualified_activities` to `tax_deductions` on `disqualified_activity_id`, answering: "Which deduction rules are constrained by each disqualified activity?" Disqualified activity 1000 constrains deduction 1000, which applies a 9.20% rate and flags `affects_n_i_i` as `true`.

**View `disqualified_activity_tax_deduction_view`**

```sql
CREATE VIEW disqualified_activity_tax_deduction_view AS
SELECT a.id, a.activity_code, a.activity_name, a.is_de_minimis, b.tax_deduction_id AS deduction_tax_deduction_id, b.deduction_percentage AS deduction_deduction_percentage, b.max_deduction_amount AS deduction_max_deduction_amount
FROM disqualified_activities a JOIN tax_deductions b ON a.tax_deduction_id = b.tax_deduction_id;
```

| id | activity_code | activity_name | is_de_minimis | deduction_tax_deduction_id | deduction_deduction_percentage | deduction_max_deduction_amount |
|---|---|---|---|---|---|---|
| 1000 | 12585 | Composite Programme | true | 1000 | 9.20 | 4,437 |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A | false | 1001 | 12.40 | 4,223 |
| 1002 | 195368 | Legacy Framework | true | 1002 | 15.60 | 16,254 |
| 1003 | 9085257 | Regional Protocol | false | 1003 | 18.80 | 8,308 |

The view `disqualified_activity_tax_regulation_view` joins `disqualified_activities` to `tax_regulations` through the intermediate `tax_deductions` table (via `disqualified_activity_id` → `tax_deductions` → `tax_regulations`), answering: "Which regulations implement deductions that reference each disqualified activity?" Disqualified activity 1000 is referenced by regulation 1000 ("Compact Initiative", status `proposed`, citation `integrated-federal-34`), which implements deduction 1000.

**View `disqualified_activity_tax_regulation_view`**

```sql
CREATE VIEW disqualified_activity_tax_regulation_view AS
SELECT a.id, a.activity_code, a.activity_name, a.is_de_minimis, b.tax_regulation_id AS regulation_tax_regulation_id, b.regulation_id AS regulation_regulation_id, b.title AS regulation_title
FROM disqualified_activities a JOIN tax_regulations b ON a.tax_regulation_id = b.tax_regulation_id;
```

| id | activity_code | activity_name | is_de_minimis | regulation_tax_regulation_id | regulation_regulation_id | regulation_title |
|---|---|---|---|---|---|---|
| 1000 | 12585 | Composite Programme | true | 1000 | 2087741 | Compact Initiative |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A | false | 1001 | 4057 | Legacy Model |
| 1002 | 195368 | Legacy Framework | true | 1002 | 5917301 | Regional Cluster A |
| 1003 | 9085257 | Regional Protocol | false | 1003 | 10445633 | Seasonal Review |

### Synthesis

The schema embodies a clean normalisation of the qualified business income deduction domain. Seven base tables capture the ontology's entity types, each with a surrogate primary key and foreign keys that encode the cardinality-bounded relationships prescribed by the model. The eighteen views then denormalise these relationships into analytically useful projections: some answer regulatory traceability questions (which statute authorises which regulation), others answer computation questions (which deduction constrains which income), and still others answer entity-level questions (which business is subject to which test). Every view reconstructs a domain fact by joining the relevant base tables on their shared foreign keys, and every row in a view can be traced back to concrete values in the underlying tables — from the 9.20% deduction rate in `tax_deductions` to the 112,506 income figure in `qualified_business_incomes` to the "Compact Initiative" regulation title in `tax_regulations`. This design ensures that the relational schema is both a faithful materialisation of the ontology and a practical query surface for tax deduction analysis.

## Data appendix

**Table `disqualified_activities`**

| id | activity_code | activity_name | is_de_minimis | de_minimis_threshold | anti_abuse_rule | exclusion_status | trade_or_business_employer_id | tax_deduction_id | tax_regulation_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 12585 | Composite Programme | true | 14.95 | true | fullyExcluded | The Hongkong and Shanghai Banking Corporation Limited | 1000 | 1000 |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A | false | 18.90 | false | partiallyExcluded | ChargePoint Holdings. | 1001 | 1001 |
| 1002 | 195368 | Legacy Framework | true | 22.85 | true | eligible | Intl. Business Machines | 1002 | 1002 |
| 1003 | 9085257 | Regional Protocol | false | 26.80 | false | fullyExcluded | Feedback Ratings | 1003 | 1003 |
