# Chapter 7 — The Qualified Business Income Deduction Framework

The modern tax compliance ecosystem rests on a layered architecture of statutes, regulations, and operational tests that together determine whether a taxpayer qualifies for the qualified business income deduction. At its core, the framework tracks a single economic question: how much income derived from a trade or business is eligible for a percentage-based deduction, and under what conditions is that deduction reduced or eliminated? Answering it requires correlating legislative authority with regulatory implementation, mapping deductions to specific income streams, and applying wage-and-asset thresholds alongside activity-based disqualifications. The records in this system capture every stage of that determination—from the enactment of a statute through the publication of a regulation, through the calculation of a deduction percentage, and finally through the application of tests that can override or constrain the benefit.

## Legislative and Regulatory Foundations

The outermost layer of the framework consists of the statutory provisions and the regulations that implement them. Statutes establish the legal authority; regulations translate that authority into actionable guidance with defined effective dates, publication citations, and procedural milestones such as hearing dates.

**Table `tax_regulations`**

| tax_regulation_id | regulation_id | title | publication_date | status | effective_date | hearing_date | federal_register_citation | tax_statute_id | tax_deduction_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2087741 | Compact Initiative | 2025-12-01T23:33:00 | proposed | 2023-02-14 | 2025-04-02T15:33:00 | integrated-federal-34 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 4057 | Legacy Model | 2022-05-12T06:50:00 | final | 2024-07-25 | 2022-09-13T22:50:00 | seasonal-federal-35 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5917301 | Regional Cluster A | 2023-10-23T13:07:00 | withdrawn | 2025-12-09 | 2023-02-24T05:07:00 | regional-federal-36 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 10445633 | Seasonal Review | 2024-03-07T20:24:00 | proposed | 2022-05-20 | 2024-07-08T12:24:00 | legacy-federal-37 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Each regulation record carries a lifecycle: it begins as a proposed rule, may become final, or can be withdrawn. The publication date marks when the rule entered the public record, while the effective date determines when its provisions actually govern taxpayer behavior. Consider the regulation titled "Compact Initiative" (ID 1000), published on 2025-12-01 under the citation `integrated-federal-34`. It was issued in proposed status with an effective date of 2023-02-14, meaning the rule's substantive requirements applied retroactively relative to its publication. By contrast, the "Legacy Model" regulation (ID 1001) reached final status and carries the citation `seasonal-federal-35`, with an effective date of 2024-07-25. The "Regional Cluster A" entry (ID 1002) was withdrawn entirely, illustrating that not every regulatory proposal survives to implementation.

These regulations do not exist in isolation. Each one references a governing statute through `tax_statute_id` and a specific deduction through `tax_deduction_id`, creating a direct lineage from legislative text to regulatory rule to the numerical deduction parameters that taxpayers apply.

**Table `tax_statutes`**

| tax_statute_id | statute_code | section_number | enactment_date | short_title | long_title | amendment_status | tax_deduction_id | disqualified_activity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 17312 | SEC-2472 | 2022-01-04 | Regional Initiative | Legacy Standard D | original | 1000 | 1000 |
| 2 | 7119782 | SEC-2477 | 2023-06-15 | Seasonal Model D | Regional Framework | amended | 1001 | 1001 |
| 3 | 1562850 | SEC-2482 | 2024-11-26 | Integrated Cluster | Seasonal Protocol | repealed | 1002 | 1002 |
| 4 | 325468 | SEC-2487 | 2025-04-10 | Extended Review | Integrated Programme A | original | 1003 | 1003 |

Statutes provide the statutory code and section number that anchor the entire framework. The statute with code `17312` and section `SEC-2472`, enacted on 2022-01-04, carries the short title "Regional Initiative" and the long title "Legacy Standard D." It remains in original amendment status and governs deduction 1000. The statute `7119782` (section `SEC-2477`), titled "Seasonal Model D," has been amended and applies to deduction 1001. The statute `1562850` (section `SEC-2482`) bears the title "Integrated Cluster" and is marked as repealed, meaning its provisions no longer carry forward authority for deduction 1002. The most recently enacted statute, `325468` (section `SEC-2487"), titled "Extended Review," remains in original status and applies to deduction 1003.

Every statute also references a deduction and a disqualified activity, embedding the disqualification logic directly into the legislative text rather than leaving it as a separate regulatory concern.

## The Deduction Calculation Engine

At the heart of the framework sits the deduction record, which encodes the numerical parameters that determine the actual benefit. The deduction percentage, maximum deduction amount, effective tax rate, and phase-in and phase-out thresholds form the arithmetic core of the calculation.

**Table `tax_deductions`**

| tax_deduction_id | deduction_percentage | max_deduction_amount | effective_tax_rate | phase_in_threshold | phase_out_threshold | applies_to_a_m_t | affects_basis | affects_n_i_i | qualified_business_income_id | wage_asset_test_id | disqualified_activity_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9.20 | 4,437 | 8.45 | 2.70 | 12.20 | true | false | true | 1 | 1 | 1000 |
| 1001 | 12.40 | 4,223 | 11.90 | 5.40 | 14.40 | false | true | false | 2 | 2 | 1001 |
| 1002 | 15.60 | 16,254 | 15.35 | 8.10 | 16.60 | true | false | true | 3 | 3 | 1002 |
| 1003 | 18.80 | 8,308 | 18.80 | 10.80 | 18.80 | false | true | false | 4 | 4 | 1003 |

Deduction 1000 applies a rate of 9.20% with a maximum deduction of $4,437. Its effective tax rate is 8.45%, and it phases in at a threshold of 2.70 and phases out at 12.20. The flags `applies_to_a_m_t`, `affects_basis`, and `affects_n_i_i` indicate that this deduction applies to an alternative minimum tax scenario, does not affect basis, and does affect net investment income. Deduction 1001 raises the rate to 12.40% with a maximum of $4,223, an effective tax rate of 11.90%, and reverses the basis and NII flags—here it does not apply to AMT but does affect basis and does not affect NII. Deduction 1002 pushes the rate to 15.60% with a substantially higher maximum of $16,254, while deduction 1003 reaches 18.80% with a maximum of $8,308 and an effective tax rate that exactly matches the deduction percentage, suggesting a simplified or capped calculation structure.

Each deduction record points to a qualified business income source, a wage-asset test, and a disqualified activity, meaning the deduction does not operate in a vacuum—it is constrained by the income that generates it, the tests that limit it, and the activities that can disqualify it entirely.

## Qualified Business Income and Its Sources

The qualified business income table captures the income streams that feed into the deduction calculation. Each record represents a distinct source of income, with fields for income amount, loss amount, net QBI, and any carried-forward loss.

**Table `qualified_business_incomes`**

| id | income_amount | loss_amount | net_q_b_i | carried_forward_loss | source_type | is_s_s_t_b | calculation_year | trade_or_business_employer_id | wage_asset_test_id | disqualified_activity_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 112,506 | 19.97 | 21.45 | 19.70 | tradeOrBusiness | true | 36 | The Hongkong and Shanghai Banking Corporation Limited | 1 | 1000 |
| 2 | 261.79 | 26.04 | 23.90 | 22.40 | REIT | false | 41 | ChargePoint Holdings. | 2 | 1001 |
| 3 | 1,228 | 30.51 | 26.35 | 25.10 | PTP | true | 46 | Intl. Business Machines | 3 | 1002 |
| 4 | 2,525 | 12.34 | 28.80 | 27.80 | tradeOrBusiness | false | 51 | Feedback Ratings | 4 | 1003 |

Income record 1 reports an income amount of $112,506 against a loss of $19.97, yielding a net QBI of $21.45. It originates from a trade-or-business source, is flagged as an SSTB (specified service trade or business), and was calculated in year 36. The associated employer is "The Hongkong and Shanghai Banking Corporation Limited." Income record 2, by contrast, shows a much smaller income of $261.79 with a loss of $26.04, netting $23.90. It comes from a REIT source, is not an SSTB, and was calculated in year 41, with "ChargePoint Holdings." as the employer. Income record 3 (PTP source, $1,228 income, net QBI of $26.35) is an SSTB calculated in year 46 under "Intl. Business Machines." Income record 4 (tradeOrBusiness source, $2,525 income, net QBI of $28.80) is not an SSTB and was calculated in year 51 under "Feedback Ratings."

The `is_s_s_t_b` flag is critical: SSTB status can trigger phase-outs or complete disqualifications for high-income taxpayers, making this field a key determinant of whether the deduction survives the activity-based tests.

## Trade or Business Entities

The trade or businesses table describes the legal entities through which the qualified business income is earned. Each record specifies the entity type, employer identifier, location, SSTB status, total wages paid, and the unadjusted basis of property.

**Table `trade_or_businesses`**

| entity_type | employer_id | location | is_s_s_t_b | total_wages_paid | unadjusted_basis_of_property | tax_year | qualified_business_income_id | wage_asset_test_id | disqualified_activity_id |
|---|---|---|---|---|---|---|---|---|---|
| soleProprietorship | The Hongkong and Shanghai Banking Corporation Limited | extended-location-99 | true | 21.20 | 18.70 | 26 | 1 | 1 | 1000 |
| partnership | ChargePoint Holdings. | integrated-location-100 | false | 23.40 | 20.40 | 36 | 2 | 2 | 1001 |
| S_Corporation | Intl. Business Machines | seasonal-location-101 | true | 25.60 | 22.10 | 46 | 3 | 3 | 1002 |
| LLC | Feedback Ratings | regional-location-102 | false | 27.80 | 23.80 | 56 | 4 | 4 | 1003 |

Entity record 1 is a sole proprietorship operated by "The Hongkong and Shanghai Banking Corporation Limited" at `extended-location-99`. It is an SSTB, has paid $21.20 in total wages, holds property with an unadjusted basis of $18.70, and operates in tax year 26. Entity record 2 is a partnership run by "ChargePoint Holdings." at `integrated-location-100`, not an SSTB, with $23.40 in wages and $20.40 in property basis, in tax year 36. Entity record 3 is an S Corporation operated by "Intl. Business Machines" at `seasonal-location-101`, an SSTB with $25.60 in wages and $22.10 in basis, in tax year 46. Entity record 4 is an LLC run by "Feedback Ratings" at `regional-location-102`, not an SSTB, with $27.80 in wages and $23.80 in basis, in tax year 56.

The entity type and SSTB status interact with the wage-asset tests and disqualified activity flags to determine the final deduction eligibility. A sole proprietorship that is an SSTB faces different constraints than an LLC that is not.

## Wage and Asset Tests

The wage-asset tests table encodes the numerical thresholds that can reduce or eliminate the deduction based on the business's wage payments and property basis.

**Table `wage_asset_tests`**

| id | wage_limit | asset_limit | combined_limit | phase_in_percentage | is_fully_applicable | test_year | trade_or_business_employer_id | tax_deduction_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 12.72 | 10.45 | 12.70 | 6.95 | true | 28 | The Hongkong and Shanghai Banking Corporation Limited | 1000 |
| 2 | 14.31 | 12.90 | 14.40 | 10.90 | false | 34 | ChargePoint Holdings. | 1001 |
| 3 | 19.97 | 15.35 | 16.10 | 14.85 | true | 40 | Intl. Business Machines | 1002 |
| 4 | 17.41 | 17.80 | 17.80 | 18.80 | false | 46 | Feedback Ratings | 1003 |

Test record 1 has a wage limit of 12.72, an asset limit of 10.45, and a combined limit of 12.70. Its phase-in percentage is 6.95, it is fully applicable, and it was tested in year 28 against "The Hongkong and Shanghai Banking Corporation Limited." Test record 2 raises the wage limit to 14.31 and the asset limit to 12.90, with a combined limit of 14.40 and a phase-in percentage of 10.90; it is not fully applicable and was tested in year 34 against "ChargePoint Holdings." Test record 3 pushes the wage limit to 19.97, the asset limit to 15.35, and the combined limit to 16.10, with a phase-in percentage of 14.85, fully applicable, tested in year 40. Test record 4 has a wage limit of 17.41, an asset limit of 17.80, and a combined limit of 17.80, with a phase-in percentage of 18.80, not fully applicable, tested in year 46.

The `is_fully_applicable` flag indicates whether the test applies without partial phase-in. When a test is not fully applicable, the phase-in percentage determines how much of the wage-asset limitation is in effect.

## Disqualified Activities

The disqualified activities table captures the business activities that can entirely preclude the deduction, regardless of income levels or wage-asset positions.

**Table `disqualified_activities`**

| id | activity_code | activity_name | is_de_minimis | de_minimis_threshold | anti_abuse_rule | exclusion_status | trade_or_business_employer_id | tax_deduction_id | tax_regulation_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 12585 | Composite Programme | true | 14.95 | true | fullyExcluded | The Hongkong and Shanghai Banking Corporation Limited | 1000 | 1000 |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | Compact Standard A | false | 18.90 | false | partiallyExcluded | ChargePoint Holdings. | 1001 | 1001 |
| 1002 | 195368 | Legacy Framework | true | 22.85 | true | eligible | Intl. Business Machines | 1002 | 1002 |
| 1003 | 9085257 | Regional Protocol | false | 26.80 | false | fullyExcluded | Feedback Ratings | 1003 | 1003 |

Activity record 1000 through 1003 represent the disqualification categories linked to each deduction. The specific activity names and descriptions are stored in this table and are referenced by the deduction, statute, trade-or-business, and qualified business income records. When a taxpayer's income derives from a disqualified activity, the deduction is generally reduced to zero, subject to phase-in rules.

## Cross-Reference Views

The framework's power lies in its ability to join these records into coherent views that answer specific compliance questions. Each view correlates two or more base tables to reveal relationships that are not visible in any single table alone.

### Statute–Regulation and Statute–Deduction Correlations

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

This view joins regulations to their governing statutes, answering the question: which regulation implements which statute? A row linking regulation 1000 ("Compact Initiative") to statute 1 (code `17312`, section `SEC-2472`) shows that the proposed regulation implements the "Regional Initiative" statute. The view preserves the regulation's status, effective date, and federal register citation alongside the statute's enactment date and amendment status, enabling a practitioner to trace the regulatory lineage from legislative text to published rule.

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

This view connects regulations directly to the deductions they govern. Regulation 1001 ("Legacy Model," final status, citation `seasonal-federal-35`) maps to deduction 1001, which carries a 12.40% rate and a maximum of $4,223. The view allows a practitioner to see, at a glance, which regulatory instrument controls which set of deduction parameters, bypassing the intermediate statute layer when only the regulation-to-deduction relationship matters.

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

This view pairs statutes with their corresponding deductions. Statute 3 (section `SEC-2482`, titled "Integrated Cluster," status repealed) maps to deduction 1002, which has a 15.60% rate and a maximum of $16,254. The repealed status of the statute is critical context: even though the deduction record exists, the legislative authority behind it has been withdrawn, which may affect whether the deduction remains enforceable.

### Deduction–Income, Deduction–Test, and Deduction–Disqualification Links

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

This view links each deduction to the qualified business income that generates it. Deduction 1000 (9.20% rate) connects to income record 1, which reports $112,506 in income from a trade-or-business SSTB source. The view answers: what income stream feeds into this deduction? The net QBI of $21.45 is the figure that the 9.20% rate is applied to, subject to the maximum of $4,437 and the phase-in/phase-out thresholds.

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

This view associates deductions with the wage-asset tests that can limit them. Deduction 1001 (12.40% rate, maximum $4,223) is paired with test 2, which has a wage limit of 14.31, an asset limit of 12.90, and a combined limit of 14.40. The test is not fully applicable, meaning the phase-in percentage of 10.90 determines the extent of the limitation. The view reveals how the deduction's arithmetic interacts with the business's wage and property positions.

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

This view connects deductions to the disqualified activities that can nullify them. Deduction 1002 (15.60% rate, maximum $16,254) is linked to activity 1002. If the taxpayer's income derives from this activity, the deduction is subject to complete disqualification, regardless of the favorable rate and high maximum.

### Income–Entity, Income–Test, and Income–Disqualification Links

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

This view ties qualified business income to the trade-or-business entity that produced it. Income record 1 (net QBI of $21.45, SSTB, tradeOrBusiness source) is linked to entity 1, a sole proprietorship operated by "The Hongkong and Shanghai Banking Corporation Limited" at `extended-location-99`. The view answers: which legal entity generated this income? The entity's SSTB status, wage payments, and property basis all feed into the subsequent tests.

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

This view connects income records to the wage-asset tests that apply to their source entities. Income record 2 (net QBI of $23.90, REIT source, not SSTB) is linked to test 2 (wage limit 14.31, asset limit 12.90, not fully applicable). The view reveals that even a non-SSTB income stream like a REIT is subject to wage-asset constraints, though the test's applicability and phase-in percentage determine the practical impact.

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

This view maps income records to the disqualified activities that could preclude the deduction. Income record 3 (net QBI of $26.35, PTP source, SSTB) is linked to activity 1002. The practitioner must determine whether the PTP classification combined with SSTB status triggers the disqualification, or whether the PTP structure provides an alternative path.

### Entity–Income, Entity–Test, and Entity–Disqualification Links

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

This view reverses the income-to-entity relationship, showing which income records belong to which trade-or-business entity. Entity 3 (S Corporation, "Intl. Business Machines," SSTB, $25.60 wages, $22.10 basis, tax year 46) is linked to income record 3 (net QBI of $26.35). The view confirms that the S Corporation structure produced the PTP-sourced income and that the entity's wage and property positions are the inputs to the wage-asset test.

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

This view pairs entities with the wage-asset tests that apply to them. Entity 4 (LLC, "Feedback Ratings," not SSTB, $27.80 wages, $23.80 basis, tax year 56) is linked to test 4 (wage limit 17.41, asset limit 17.80, combined limit 17.80, phase-in 18.80, not fully applicable). The view shows that the LLC's relatively high wage and property positions are measured against a test that is not fully applicable, meaning the phase-in percentage of 18.80 determines the extent of any limitation.

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

This view connects entities to the disqualified activities that could block their deduction. Entity 2 (partnership, "ChargePoint Holdings.", not SSTB, tax year 36) is linked to activity 1001. The practitioner evaluates whether the partnership's operations fall within the scope of the disqualified activity, even though the entity is not an SSTB.

### Test–Entity, Test–Deduction, and Disqualification Cross-Links

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

This view links wage-asset tests back to the entities they constrain. Test 1 (wage limit 12.72, asset limit 10.45, fully applicable, year 28) is connected to entity 1 (sole proprietorship, "The Hongkong and Shanghai Banking Corporation Limited"). The view confirms that the test's fully applicable status means the wage and asset limits are in full effect, with no phase-in reduction.

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

This view associates wage-asset tests with the deductions they can limit. Test 3 (wage limit 19.97, asset limit 15.35, combined limit 16.10, fully applicable, year 40) is linked to deduction 1002 (15.60% rate, maximum $16,254). The view reveals that the test's combined limit of 16.10 interacts with the deduction's maximum of $16,254, potentially capping the benefit even when the deduction percentage would otherwise allow a larger amount.

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

This view connects disqualified activities to the entities they can disqualify. Activity 1003 is linked to entity 4 (LLC, "Feedback Ratings"). The practitioner must determine whether the LLC's operations in tax year 56 fall within the scope of activity 1003, which would eliminate the deduction entirely.

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

This view maps disqualified activities to the deductions they can nullify. Activity 1000 is linked to deduction 1000 (9.20% rate, maximum $4,437). The view shows that even a modest deduction rate is subject to complete disqualification if the underlying income derives from the associated activity.

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

This final view connects disqualified activities to the regulations that implement them. Activity 1003 is linked to regulation 1003 ("Seasonal Review," proposed status, citation `legacy-federal-37`). The view answers: which regulatory instrument defines the scope of this disqualification? The regulation's proposed status and its effective date of 2022-05-20 provide the temporal context for when the disqualification became operative.

## Synthesis

The qualified business income deduction framework operates as an integrated system of legislative authority, regulatory implementation, numerical calculation, and activity-based constraints. Statutes establish the legal foundation; regulations translate them into actionable rules with defined lifecycles; deductions encode the arithmetic of the benefit; qualified business incomes represent the income streams that feed the calculation; trade-or-business entities provide the legal and operational context; wage-asset tests impose numerical limits based on wages and property; and disqualified activities can eliminate the deduction entirely. The views described above demonstrate that no single table tells the complete story—compliance requires correlating records across the entire structure, tracing income from its source entity through the applicable deduction, test, and disqualification filters, and ultimately determining the net benefit that the taxpayer is entitled to claim.

## Data appendix

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
