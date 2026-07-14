## The Architecture of OTC Derivative Risk Management

Over-the-counter derivative markets operate at the intersection of contractual obligation, regulatory oversight, and collateral governance. Every trade carries notional exposure, settlement mechanics, and a web of supporting agreements that determine how risk is allocated between parties. The records that capture this ecosystem span regulatory instruments that define the rules of engagement, financial counterparties that assume positions, derivative trades that quantify exposure, netting agreements that aggregate obligations, collateral that mitigates loss, and credit support annexes that bind the collateral framework to the underlying agreements. Understanding how these elements interlock is essential for practitioners who monitor counterparty risk, ensure regulatory compliance, and manage the liquidity implications of derivative portfolios.

The foundation of this domain rests on six core record types, each capturing a distinct dimension of the trading lifecycle.

**Table `regulatory_instruments`**

| regulatory_instrument_id | instrument_identifier | title | issuing_authority | adoption_date | publication_date | entry_into_force_date | status | supersedes_regulatory_instrument_id | amends_regulatory_instrument_id | financial_counterparty_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | INS-2453 | Compact Initiative | extended-issuing-33 | 2025-08-12T07:09:00 | 2025-12-01T23:33:00 | 2022-05-16T04:00:00 | adopted | 100 | 100 | 1000 |
| 101 | INS-2455 | Legacy Model | integrated-issuing-34 | 2022-01-23T14:26:00 | 2022-05-12T06:50:00 | 2023-10-27T11:17:00 | published | 101 | 101 | 1001 |
| 102 | INS-2457 | Regional Cluster A | seasonal-issuing-35 | 2023-06-07T21:43:00 | 2023-10-23T13:07:00 | 2024-03-11T18:34:00 | inForce | 102 | 102 | 1002 |
| 103 | INS-2459 | Seasonal Review | regional-issuing-36 | 2024-11-18T04:00:00 | 2024-03-07T20:24:00 | 2025-08-22T01:51:00 | amended | 103 | 103 | 1003 |

Regulatory instruments establish the legal and supervisory framework within which derivatives are originated, documented, and settled. Each instrument carries a unique identifier such as `INS-2453` or `INS-2459`, a title that signals its scope, and an issuing authority like `extended-issuing-33` or `regional-issuing-36`. The lifecycle of a regulatory instrument is tracked through multiple dates: the adoption date marks when the authority formally approved the instrument, the publication date indicates when it became publicly available, and the entry-into-force date determines when its provisions became legally binding. Status values such as `adopted`, `published`, `inForce`, and `amended` reflect the current standing of each instrument. Instruments may also reference one another through `supersedes_regulatory_instrument_id` and `amends_regulatory_instrument_id` fields, creating a lineage of regulatory evolution. In the data, instrument `INS-2453` (Compact Initiative) was adopted on 2025-08-12 but entered into force retroactively on 2022-05-16, illustrating the gap between formal approval and operational applicability.

**Table `financial_counterparties`**

| financial_counterparty_id | counterparty_identifier | legal_name | entity_type | jurisdiction | registration_status | clearing_threshold_exceeded | regulatory_instrument_id | collateral_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | COU-2085 | Adaptive Model | UCITS | regional-jurisdic-30 | authorised | true | 100 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | COU-2092 | Primary Cluster | AIF | legacy-jurisdic-31 | registered | false | 101 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | COU-2099 | Composite Review D | FinancialCounterparty | compact-jurisdic-32 | unregistered | true | 102 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | COU-2106 | Compact Initiative | UCITS | composite-jurisdic-33 | authorised | false | 103 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Financial counterparties are the institutional actors that enter into derivative transactions. Each counterparty record includes an identifier such as `COU-2085`, a legal name like `Adaptive Model` or `Primary Cluster`, and an entity type classification—`UCITS`, `AIF`, or `FinancialCounterparty`—that determines the regulatory regime applicable to the entity. The jurisdiction field, with values such as `regional-jurisdic-30` or `legacy-jurisdic-31`, anchors the counterparty to a specific legal territory, while the registration status (`authorised`, `registered`, `unregistered`) signals its compliance posture. A critical operational flag, `clearing_threshold_exceeded`, indicates whether the counterparty's aggregate exposure has crossed the threshold requiring central clearing. Counterparties are linked to the regulatory instruments that govern their activities and to the collateral arrangements that secure their obligations.

**Table `o_t_c_derivative_trades`**

| id | trade_identifier | trade_date | trade_type | settlement_type | notional_amount | currency | maturity_date | status | netting_agreement_id | collateral_id | regulatory_instrument_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | TRA-2009 | 2025-12-04T23:09:00 | FX Forward | physically settled | 0.12 | seasonal-currency-71 | 2024-11-20T10:30:00 | active | 1000 | 1000 | 100 |
| 2 | TRA-2011 | 2022-05-15T06:26:00 | Swap | cash settled | 8.31 | regional-currency-72 | 2025-04-04T17:47:00 | settled | 1001 | 1001 | 101 |
| 3 | TRA-2013 | 2023-10-26T13:43:00 | Option | physically settled | 40,694 | legacy-currency-73 | 2022-09-15T00:04:00 | terminated | 1002 | 1002 | 102 |
| 4 | TRA-2015 | 2024-03-10T20:00:00 | FX Forward | cash settled | 112.11 | compact-currency-74 | 2023-02-26T07:21:00 | active | 1003 | 1003 | 103 |

OTC derivative trades are the primary units of market exposure. Each trade record carries an identifier such as `TRA-2009` or `TRA-2015`, a trade date, and a trade type—`FX Forward`, `Swap`, or `Option`—that defines the instrument's structure. Settlement type (`physically settled` or `cash settled`) determines how obligations are discharged at maturity. The notional amount, ranging from modest values like `0.12` to substantial exposures such as `40,694`, quantifies the scale of the position. Currency codes like `seasonal-currency-71` or `compact-currency-74` specify the denomination, while the maturity date marks when the trade expires. The status field (`active`, `settled`, `terminated`) reflects the trade's current lifecycle phase. Each trade is associated with a netting agreement that aggregates its obligations, a collateral arrangement that mitigates counterparty risk, and a regulatory instrument that provides the governing framework.

**Table `netting_agreements`**

| id | agreement_identifier | agreement_type | enforceability_review_status | reviewed_by | effective_date | termination_date | regulatory_instrument_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | AGR-2766 | ISDA Master Agreement | pending | internal | 2023-02-14T13:27:00 | 2022-09-11T20:24:00 | 100 | 2025-01-01 00:14:00 |
| 1001 | AGR-2771 | Custom Netting Agreement | completed | third party | 2024-07-25T20:44:00 | 2023-02-22T03:41:00 | 101 | 2025-02-06 03:14:00 |
| 1002 | AGR-2776 | ISDA Master Agreement | failed | internal | 2025-12-09T03:01:00 | 2024-07-06T10:58:00 | 102 | 2025-03-11 06:14:00 |
| 1003 | AGR-2781 | Custom Netting Agreement | pending | third party | 2022-05-20T10:18:00 | 2025-12-17T17:15:00 | 103 | 2025-04-16 09:14:00 |

Netting agreements serve as the contractual backbone that aggregates multiple derivative trades into a single enforceable obligation. An agreement such as `AGR-2766` (an ISDA Master Agreement) or `AGR-2771` (a Custom Netting Agreement) defines the terms under which trades are netted. The enforceability review status—`pending`, `completed`, or `failed`—indicates whether the agreement has undergone legal validation, and the reviewer (`internal` or `third party`) identifies who performed the assessment. Effective and termination dates bound the agreement's operational window. These agreements are themselves governed by regulatory instruments, ensuring that the netting framework complies with applicable supervisory requirements.

**Table `collaterals`**

| id | collateral_identifier | asset_type | issuing_entity | credit_quality_rating | denomination | eligibility_status | wrong_way_risk | financial_counterparty_id | o_t_c_derivative_trade_id | regulatory_instrument_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | COL-2403 | cash | pilot-issuing-14 | distributed-credit-90 | distributed-denomina-24 | eligible | false | 1000 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | COL-2406 | gold | extended-issuing-15 | baseline-credit-91 | baseline-denomina-25 | ineligible | true | 1001 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | COL-2409 | debt security | integrated-issuing-16 | pilot-credit-92 | pilot-denomina-26 | pending review | false | 1002 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | COL-2412 | corporate bond | seasonal-issuing-17 | extended-credit-93 | extended-denomina-27 | eligible | true | 1003 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Collateral arrangements provide the risk mitigation layer that protects counterparties against default. Each collateral record, identified by codes such as `COL-2403` or `COL-2412`, specifies the asset type—`cash`, `gold`, `debt security`, or `corporate bond`—and the issuing entity, such as `pilot-issuing-14` or `seasonal-issuing-17`. The credit quality rating (`distributed-credit-90`, `baseline-credit-91`, etc.) and denomination (`distributed-denomina-24`, `extended-denomina-27`) characterize the collateral's risk profile. The eligibility status (`eligible`, `ineligible`, `pending review`) determines whether the collateral can be posted against obligations, while the `wrong_way_risk` flag signals whether the collateral's value moves in the same direction as the exposure, amplifying risk rather than reducing it. Collateral is linked to a specific financial counterparty, an OTC derivative trade, and a regulatory instrument, creating a three-way dependency that ensures risk mitigation is properly scoped and governed.

**Table `credit_support_annexes`**

| credit_support_annex_id | csa_identifier | netting_set | amendment_status | effective_date | termination_date | netting_agreement_id | regulatory_instrument_id |
|---|---|---|---|---|---|---|---|
| 100 | CSA-2141 | legacy | original | 2023-02-14T13:27:00 | 2022-09-11T20:24:00 | 1000 | 100 |
| 101 | CSA-2142 | new trades | amended | 2024-07-25T20:44:00 | 2023-02-22T03:41:00 | 1001 | 101 |
| 102 | CSA-2143 | custom | pending amendment | 2025-12-09T03:01:00 | 2024-07-06T10:58:00 | 1002 | 102 |
| 103 | CSA-2144 | legacy | original | 2022-05-20T10:18:00 | 2025-12-17T17:15:00 | 1003 | 103 |

Credit support annexes (CSAs) are the contractual instruments that operationalize collateral posting requirements. Each CSA, identified by codes such as `CSA-2141` or `CSA-2144`, defines the netting set it covers—`legacy`, `new trades`, or `custom`—and its amendment status (`original`, `amended`, `pending amendment`). The effective and termination dates bound the CSA's applicability. Critically, each CSA is tied to a netting agreement and a regulatory instrument, ensuring that the collateral framework is both contractually grounded and regulatorily compliant.

Beyond these core records, the data model includes junction tables that capture the many-to-many relationships inherent in derivative markets.

**Table `counterparties_trades`**

| financial_counterparty_id | o_t_c_derivative_trade_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `trades_counterparties`**

| o_t_c_derivative_trade_id | financial_counterparty_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `agreements_trades`**

| netting_agreement_id | o_t_c_derivative_trade_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `annexes_collaterals`**

| credit_support_annex_id | collateral_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

These junction tables resolve the complex web of associations between counterparties, trades, agreements, and collateral arrangements. They enable the model to represent scenarios where a single counterparty participates in multiple trades, where a trade spans multiple netting agreements, and where collateral posted under one annex secures obligations under another.

## Regulatory Oversight and Counterparty Classification

The relationship between regulatory instruments and financial counterparties determines which supervisory regime applies to each entity. The regulatory instrument view reveals how instruments are distributed across counterparties, while the financial counterparty view shows which regulatory frameworks govern each entity's activities.

**View `regulatory_instrument_regulatory_instrument_view`**

```sql
CREATE VIEW regulatory_instrument_regulatory_instrument_view AS
SELECT a.regulatory_instrument_id, a.instrument_identifier, a.title, a.issuing_authority, b.regulatory_instrument_id AS instrument_regulatory_instrument_id, b.instrument_identifier AS instrument_instrument_identifier, b.title AS instrument_title
FROM regulatory_instruments a JOIN regulatory_instruments b ON a.supersedes_regulatory_instrument_id = b.regulatory_instrument_id;
```

| regulatory_instrument_id | instrument_identifier | title | issuing_authority | instrument_regulatory_instrument_id | instrument_instrument_identifier | instrument_title |
|---|---|---|---|---|---|---|
| 100 | INS-2453 | Compact Initiative | extended-issuing-33 | 100 | INS-2453 | Compact Initiative |
| 101 | INS-2455 | Legacy Model | integrated-issuing-34 | 101 | INS-2455 | Legacy Model |
| 102 | INS-2457 | Regional Cluster A | seasonal-issuing-35 | 102 | INS-2457 | Regional Cluster A |
| 103 | INS-2459 | Seasonal Review | regional-issuing-36 | 103 | INS-2459 | Seasonal Review |

This self-referential view on regulatory instruments captures the lineage and supersession relationships between instruments. When instrument `INS-2453` references itself through both `supersedes_regulatory_instrument_id` and `amends_regulatory_instrument_id`, it indicates a self-referential state that may represent a transitional configuration or a placeholder awaiting proper lineage assignment.

**View `regulatory_instrument_financial_counterparty_view`**

```sql
CREATE VIEW regulatory_instrument_financial_counterparty_view AS
SELECT a.regulatory_instrument_id, a.instrument_identifier, a.title, a.issuing_authority, b.financial_counterparty_id AS counterparty_financial_counterparty_id, b.counterparty_identifier AS counterparty_counterparty_identifier, b.legal_name AS counterparty_legal_name
FROM regulatory_instruments a JOIN financial_counterparties b ON a.financial_counterparty_id = b.financial_counterparty_id;
```

| regulatory_instrument_id | instrument_identifier | title | issuing_authority | counterparty_financial_counterparty_id | counterparty_counterparty_identifier | counterparty_legal_name |
|---|---|---|---|---|---|---|
| 100 | INS-2453 | Compact Initiative | extended-issuing-33 | 1000 | COU-2085 | Adaptive Model |
| 101 | INS-2455 | Legacy Model | integrated-issuing-34 | 1001 | COU-2092 | Primary Cluster |
| 102 | INS-2457 | Regional Cluster A | seasonal-issuing-35 | 1002 | COU-2099 | Composite Review D |
| 103 | INS-2459 | Seasonal Review | regional-issuing-36 | 1003 | COU-2106 | Compact Initiative |

This join between regulatory instruments and financial counterparties answers the question of which entities operate under which regulatory frameworks. In the data, instrument `INS-2453` (Compact Initiative, issued by `extended-issuing-33`) is associated with counterparty `COU-2085` (Adaptive Model, a UCITS entity). Similarly, `INS-2459` (Seasonal Review, from `regional-issuing-36`) governs counterparty `COU-2106` (Compact Initiative, also a UCITS). The view makes explicit the mapping between regulatory authority and counterparty jurisdiction, enabling compliance teams to verify that each entity's registration status aligns with its governing instrument.

**View `financial_counterparty_regulatory_instrument_view`**

```sql
CREATE VIEW financial_counterparty_regulatory_instrument_view AS
SELECT a.financial_counterparty_id, a.counterparty_identifier, a.legal_name, a.entity_type, b.regulatory_instrument_id AS instrument_regulatory_instrument_id, b.instrument_identifier AS instrument_instrument_identifier, b.title AS instrument_title
FROM financial_counterparties a JOIN regulatory_instruments b ON a.regulatory_instrument_id = b.regulatory_instrument_id;
```

| financial_counterparty_id | counterparty_identifier | legal_name | entity_type | instrument_regulatory_instrument_id | instrument_instrument_identifier | instrument_title |
|---|---|---|---|---|---|---|
| 1000 | COU-2085 | Adaptive Model | UCITS | 100 | INS-2453 | Compact Initiative |
| 1001 | COU-2092 | Primary Cluster | AIF | 101 | INS-2455 | Legacy Model |
| 1002 | COU-2099 | Composite Review D | FinancialCounterparty | 102 | INS-2457 | Regional Cluster A |
| 1003 | COU-2106 | Compact Initiative | UCITS | 103 | INS-2459 | Seasonal Review |

The reverse perspective—grouping by counterparty to reveal their regulatory instruments—confirms the one-to-one mapping in this dataset. Counterparty `COU-2092` (Composite Review D, a `FinancialCounterparty` entity with `authorised` status and `clearing_threshold_exceeded` set to `true`) is governed by instrument `INS-2457` (Regional Cluster A). This alignment ensures that entities exceeding clearing thresholds are subject to the appropriate supervisory provisions.

## Trade Detail and Counterparty Exposure

Understanding the composition of derivative portfolios requires joining trades with their counterparties, netting agreements, collateral arrangements, and regulatory frameworks. These views answer operational questions about exposure concentration, settlement mechanics, and risk mitigation adequacy.

**View `financial_counterparty_o_t_c_derivative_trade_detail_view`**

```sql
CREATE VIEW financial_counterparty_o_t_c_derivative_trade_detail_view AS
SELECT a.financial_counterparty_id, a.counterparty_identifier, a.legal_name, b.id AS trade_id, b.trade_identifier AS trade_trade_identifier, b.trade_date AS trade_trade_date
FROM financial_counterparties a
  JOIN counterparties_trades j ON j.financial_counterparty_id = a.financial_counterparty_id
  JOIN o_t_c_derivative_trades b ON b.id = j.o_t_c_derivative_trade_id;
```

| financial_counterparty_id | counterparty_identifier | legal_name | trade_id | trade_trade_identifier | trade_trade_date |
|---|---|---|---|---|---|
| 1000 | COU-2085 | Adaptive Model | 1 | TRA-2009 | 2025-12-04T23:09:00 |
| 1000 | COU-2085 | Adaptive Model | 2 | TRA-2011 | 2022-05-15T06:26:00 |
| 1001 | COU-2092 | Primary Cluster | 2 | TRA-2011 | 2022-05-15T06:26:00 |
| 1001 | COU-2092 | Primary Cluster | 3 | TRA-2013 | 2023-10-26T13:43:00 |
| 1002 | COU-2099 | Composite Review D | 3 | TRA-2013 | 2023-10-26T13:43:00 |
| 1002 | COU-2099 | Composite Review D | 4 | TRA-2015 | 2024-03-10T20:00:00 |
| 1003 | COU-2106 | Compact Initiative | 4 | TRA-2015 | 2024-03-10T20:00:00 |
| 1003 | COU-2106 | Compact Initiative | 1 | TRA-2009 | 2025-12-04T23:09:00 |

This view links financial counterparties to their derivative trades, revealing the exposure profile of each entity. Counterparty `COU-2085` (Adaptive Model) is associated with trade `TRA-2009`, an `FX Forward` with a notional of `0.12` in `seasonal-currency-71`, physically settled and currently `active`. Counterparty `COU-2099` (Composite Review D) holds trade `TRA-2013`, an `Option` with a substantially larger notional of `40,694` in `legacy-currency-73`, which has reached `terminated` status. The view enables risk managers to assess which counterparties carry the largest open exposures and whether those exposures are concentrated in specific trade types or currencies.

**View `o_t_c_derivative_trade_financial_counterparty_detail_view`**

```sql
CREATE VIEW o_t_c_derivative_trade_financial_counterparty_detail_view AS
SELECT a.id, a.trade_identifier, a.trade_date, b.financial_counterparty_id AS counterparty_financial_counterparty_id, b.counterparty_identifier AS counterparty_counterparty_identifier, b.legal_name AS counterparty_legal_name
FROM o_t_c_derivative_trades a
  JOIN trades_counterparties j ON j.o_t_c_derivative_trade_id = a.id
  JOIN financial_counterparties b ON b.financial_counterparty_id = j.financial_counterparty_id;
```

| id | trade_identifier | trade_date | counterparty_financial_counterparty_id | counterparty_counterparty_identifier | counterparty_legal_name |
|---|---|---|---|---|---|
| 1 | TRA-2009 | 2025-12-04T23:09:00 | 1000 | COU-2085 | Adaptive Model |
| 1 | TRA-2009 | 2025-12-04T23:09:00 | 1001 | COU-2092 | Primary Cluster |
| 2 | TRA-2011 | 2022-05-15T06:26:00 | 1001 | COU-2092 | Primary Cluster |
| 2 | TRA-2011 | 2022-05-15T06:26:00 | 1002 | COU-2099 | Composite Review D |
| 3 | TRA-2013 | 2023-10-26T13:43:00 | 1002 | COU-2099 | Composite Review D |
| 3 | TRA-2013 | 2023-10-26T13:43:00 | 1003 | COU-2106 | Compact Initiative |
| 4 | TRA-2015 | 2024-03-10T20:00:00 | 1003 | COU-2106 | Compact Initiative |
| 4 | TRA-2015 | 2024-03-10T20:00:00 | 1000 | COU-2085 | Adaptive Model |

The inverse join—grouping trades by their counterparties—provides the same information from the trade perspective. Trade `TRA-2011`, a `Swap` with notional `8.31` in `regional-currency-72`, is cash settled and has reached `settled` status, associated with counterparty `COU-2092` (Primary Cluster, an `AIF` entity). Trade `TRA-2015`, an `FX Forward` with notional `112.11` in `compact-currency-74`, remains `active` and is linked to counterparty `COU-2106` (Compact Initiative). This perspective is particularly useful for trade confirmation teams verifying that each trade is correctly attributed to its counterparty.

**View `o_t_c_derivative_trade_netting_agreement_view`**

```sql
CREATE VIEW o_t_c_derivative_trade_netting_agreement_view AS
SELECT a.id, a.trade_identifier, a.trade_date, a.trade_type, b.id AS agreement_id, b.agreement_identifier AS agreement_agreement_identifier, b.agreement_type AS agreement_agreement_type
FROM o_t_c_derivative_trades a JOIN netting_agreements b ON a.netting_agreement_id = b.id;
```

| id | trade_identifier | trade_date | trade_type | agreement_id | agreement_agreement_identifier | agreement_agreement_type |
|---|---|---|---|---|---|---|
| 1 | TRA-2009 | 2025-12-04T23:09:00 | FX Forward | 1000 | AGR-2766 | ISDA Master Agreement |
| 2 | TRA-2011 | 2022-05-15T06:26:00 | Swap | 1001 | AGR-2771 | Custom Netting Agreement |
| 3 | TRA-2013 | 2023-10-26T13:43:00 | Option | 1002 | AGR-2776 | ISDA Master Agreement |
| 4 | TRA-2015 | 2024-03-10T20:00:00 | FX Forward | 1003 | AGR-2781 | Custom Netting Agreement |

This join between OTC derivative trades and netting agreements reveals how individual trades are aggregated into enforceable netting sets. Trade `TRA-2009` is grouped under netting agreement `AGR-2766` (an `ISDA Master Agreement` with `pending` enforceability review), while trade `TRA-2013` falls under `AGR-2776` (also an `ISDA Master Agreement`, but with `failed` enforceability review). The enforceability status is critical: trades under agreements with `failed` reviews may not be legally enforceable in a default scenario, creating unmitigated counterparty risk. Trade `TRA-2011` is associated with `AGR-2771` (a `Custom Netting Agreement` with `completed` review), indicating a validated netting framework.

**View `o_t_c_derivative_trade_collateral_view`**

```sql
CREATE VIEW o_t_c_derivative_trade_collateral_view AS
SELECT a.id, a.trade_identifier, a.trade_date, a.trade_type, b.id AS collateral_id, b.collateral_identifier AS collateral_collateral_identifier, b.asset_type AS collateral_asset_type
FROM o_t_c_derivative_trades a JOIN collaterals b ON a.collateral_id = b.id;
```

| id | trade_identifier | trade_date | trade_type | collateral_id | collateral_collateral_identifier | collateral_asset_type |
|---|---|---|---|---|---|---|
| 1 | TRA-2009 | 2025-12-04T23:09:00 | FX Forward | 1000 | COL-2403 | cash |
| 2 | TRA-2011 | 2022-05-15T06:26:00 | Swap | 1001 | COL-2406 | gold |
| 3 | TRA-2013 | 2023-10-26T13:43:00 | Option | 1002 | COL-2409 | debt security |
| 4 | TRA-2015 | 2024-03-10T20:00:00 | FX Forward | 1003 | COL-2412 | corporate bond |

This view connects trades to their collateral arrangements, answering the question of how much risk mitigation backs each position. Trade `TRA-2009` is secured by collateral `COL-2403`, a `cash` asset issued by `pilot-issuing-14` with `distributed-credit-90` quality rating and `eligible` status. Trade `TRA-2011` is backed by `COL-2406`, a `gold` asset with `baseline-credit-91` rating but marked `ineligible` and flagged for `wrong_way_risk`. The wrong-way risk flag on `COL-2406` is particularly concerning: gold prices may move in tandem with the counterparty's credit deterioration, providing little actual protection. Trade `TRA-2015` is associated with `COL-2412`, a `corporate bond` with `extended-credit-93` rating, `eligible` status, but also flagged for `wrong_way_risk`.

**View `o_t_c_derivative_trade_regulatory_instrument_view`**

```sql
CREATE VIEW o_t_c_derivative_trade_regulatory_instrument_view AS
SELECT a.id, a.trade_identifier, a.trade_date, a.trade_type, b.regulatory_instrument_id AS instrument_regulatory_instrument_id, b.instrument_identifier AS instrument_instrument_identifier, b.title AS instrument_title
FROM o_t_c_derivative_trades a JOIN regulatory_instruments b ON a.regulatory_instrument_id = b.regulatory_instrument_id;
```

| id | trade_identifier | trade_date | trade_type | instrument_regulatory_instrument_id | instrument_instrument_identifier | instrument_title |
|---|---|---|---|---|---|---|
| 1 | TRA-2009 | 2025-12-04T23:09:00 | FX Forward | 100 | INS-2453 | Compact Initiative |
| 2 | TRA-2011 | 2022-05-15T06:26:00 | Swap | 101 | INS-2455 | Legacy Model |
| 3 | TRA-2013 | 2023-10-26T13:43:00 | Option | 102 | INS-2457 | Regional Cluster A |
| 4 | TRA-2015 | 2024-03-10T20:00:00 | FX Forward | 103 | INS-2459 | Seasonal Review |

This join reveals the regulatory framework governing each trade. Trade `TRA-2009` (FX Forward, `active`) is governed by instrument `INS-2453` (Compact Initiative, `adopted` status), while trade `TRA-2013` (Option, `terminated`) falls under `INS-2457` (Regional Cluster A, `inForce`). The regulatory instrument determines the reporting, clearing, and documentation requirements applicable to each trade, making this view essential for compliance monitoring.

## Netting Agreement and Trade Composition

Netting agreements aggregate multiple trades into single enforceable obligations. Understanding the composition of each agreement is essential for assessing legal enforceability and concentration risk.

**View `netting_agreement_o_t_c_derivative_trade_detail_view`**

```sql
CREATE VIEW netting_agreement_o_t_c_derivative_trade_detail_view AS
SELECT a.id, a.agreement_identifier, a.agreement_type, b.id AS trade_id, b.trade_identifier AS trade_trade_identifier, b.trade_date AS trade_trade_date
FROM netting_agreements a
  JOIN agreements_trades j ON j.netting_agreement_id = a.id
  JOIN o_t_c_derivative_trades b ON b.id = j.o_t_c_derivative_trade_id;
```

| id | agreement_identifier | agreement_type | trade_id | trade_trade_identifier | trade_trade_date |
|---|---|---|---|---|---|
| 1000 | AGR-2766 | ISDA Master Agreement | 1 | TRA-2009 | 2025-12-04T23:09:00 |
| 1000 | AGR-2766 | ISDA Master Agreement | 2 | TRA-2011 | 2022-05-15T06:26:00 |
| 1001 | AGR-2771 | Custom Netting Agreement | 2 | TRA-2011 | 2022-05-15T06:26:00 |
| 1001 | AGR-2771 | Custom Netting Agreement | 3 | TRA-2013 | 2023-10-26T13:43:00 |
| 1002 | AGR-2776 | ISDA Master Agreement | 3 | TRA-2013 | 2023-10-26T13:43:00 |
| 1002 | AGR-2776 | ISDA Master Agreement | 4 | TRA-2015 | 2024-03-10T20:00:00 |
| 1003 | AGR-2781 | Custom Netting Agreement | 4 | TRA-2015 | 2024-03-10T20:00:00 |
| 1003 | AGR-2781 | Custom Netting Agreement | 1 | TRA-2009 | 2025-12-04T23:09:00 |

This view groups trades by their netting agreements, revealing the composition and risk profile of each netting set. Agreement `AGR-2766` (ISDA Master Agreement, `pending` review) contains trade `TRA-2009`, an `FX Forward` with notional `0.12`. Agreement `AGR-2771` (Custom Netting Agreement, `completed` review) holds trade `TRA-2011`, a `Swap` with notional `8.31`. Agreement `AGR-2776` (ISDA Master Agreement, `failed` review) contains trade `TRA-2013`, an `Option` with the largest notional in the dataset at `40,694`. The fact that the trade with the highest notional falls under an agreement with `failed` enforceability review represents a significant concentration of unmitigated risk. Agreement `AGR-2781` (Custom Netting Agreement, `pending` review) is associated with trade `TRA-2015`, an `FX Forward` with notional `112.11`.

**View `netting_agreement_regulatory_instrument_view`**

```sql
CREATE VIEW netting_agreement_regulatory_instrument_view AS
SELECT a.id, a.agreement_identifier, a.agreement_type, a.enforceability_review_status, b.regulatory_instrument_id AS instrument_regulatory_instrument_id, b.instrument_identifier AS instrument_instrument_identifier, b.title AS instrument_title
FROM netting_agreements a JOIN regulatory_instruments b ON a.regulatory_instrument_id = b.regulatory_instrument_id;
```

| id | agreement_identifier | agreement_type | enforceability_review_status | instrument_regulatory_instrument_id | instrument_instrument_identifier | instrument_title |
|---|---|---|---|---|---|---|
| 1000 | AGR-2766 | ISDA Master Agreement | pending | 100 | INS-2453 | Compact Initiative |
| 1001 | AGR-2771 | Custom Netting Agreement | completed | 101 | INS-2455 | Legacy Model |
| 1002 | AGR-2776 | ISDA Master Agreement | failed | 102 | INS-2457 | Regional Cluster A |
| 1003 | AGR-2781 | Custom Netting Agreement | pending | 103 | INS-2459 | Seasonal Review |

This join links netting agreements to their governing regulatory instruments. Agreement `AGR-2766` is governed by instrument `INS-2453` (Compact Initiative), while `AGR-2771` falls under `INS-2455` (Legacy Model). Agreement `AGR-2776` is governed by `INS-2457` (Regional Cluster A), and `AGR-2781` by `INS-2459` (Seasonal Review). This mapping ensures that each netting set operates within a defined regulatory boundary.

## Collateral Governance and Counterparty Risk Mitigation

Collateral arrangements are the primary mechanism for mitigating counterparty credit risk in OTC derivatives. Understanding which counterparties post which types of collateral, and under what regulatory frameworks, is essential for risk assessment.

**View `collateral_financial_counterparty_view`**

```sql
CREATE VIEW collateral_financial_counterparty_view AS
SELECT a.id, a.collateral_identifier, a.asset_type, a.issuing_entity, b.financial_counterparty_id AS counterparty_financial_counterparty_id, b.counterparty_identifier AS counterparty_counterparty_identifier, b.legal_name AS counterparty_legal_name
FROM collaterals a JOIN financial_counterparties b ON a.financial_counterparty_id = b.financial_counterparty_id;
```

| id | collateral_identifier | asset_type | issuing_entity | counterparty_financial_counterparty_id | counterparty_counterparty_identifier | counterparty_legal_name |
|---|---|---|---|---|---|---|
| 1000 | COL-2403 | cash | pilot-issuing-14 | 1000 | COU-2085 | Adaptive Model |
| 1001 | COL-2406 | gold | extended-issuing-15 | 1001 | COU-2092 | Primary Cluster |
| 1002 | COL-2409 | debt security | integrated-issuing-16 | 1002 | COU-2099 | Composite Review D |
| 1003 | COL-2412 | corporate bond | seasonal-issuing-17 | 1003 | COU-2106 | Compact Initiative |

This view links collateral to the financial counterparties that post it. Collateral `COL-2403` (cash, `eligible`) is posted by counterparty `COU-2085` (Adaptive Model, a `UCITS` entity). Collateral `COL-2406` (gold, `ineligible`, `wrong_way_risk`) is posted by `COU-2092` (Primary Cluster, an `AIF`). Collateral `COL-2409` (debt security, `pending review`) is posted by `COU-2099` (Composite Review D). Collateral `COL-2412` (corporate bond, `eligible`, `wrong_way_risk`) is posted by `COU-2106` (Compact Initiative, a `UCITS`). The view highlights that not all posted collateral is eligible for recognition, and that some eligible collateral carries wrong-way risk, reducing its effective risk mitigation value.

**View `collateral_o_t_c_derivative_trade_view`**

```sql
CREATE VIEW collateral_o_t_c_derivative_trade_view AS
SELECT a.id, a.collateral_identifier, a.asset_type, a.issuing_entity, b.id AS trade_id, b.trade_identifier AS trade_trade_identifier, b.trade_date AS trade_trade_date
FROM collaterals a JOIN o_t_c_derivative_trades b ON a.o_t_c_derivative_trade_id = b.id;
```

| id | collateral_identifier | asset_type | issuing_entity | trade_id | trade_trade_identifier | trade_trade_date |
|---|---|---|---|---|---|---|
| 1000 | COL-2403 | cash | pilot-issuing-14 | 1 | TRA-2009 | 2025-12-04T23:09:00 |
| 1001 | COL-2406 | gold | extended-issuing-15 | 2 | TRA-2011 | 2022-05-15T06:26:00 |
| 1002 | COL-2409 | debt security | integrated-issuing-16 | 3 | TRA-2013 | 2023-10-26T13:43:00 |
| 1003 | COL-2412 | corporate bond | seasonal-issuing-17 | 4 | TRA-2015 | 2024-03-10T20:00:00 |

This join connects collateral to the specific trades it secures. Collateral `COL-2403` secures trade `TRA-2009` (FX Forward, notional `0.12`), while `COL-2406` secures `TRA-2011` (Swap, notional `8.31`). Collateral `COL-2409` is linked to `TRA-2013` (Option, notional `40,694`), and `COL-2412` to `TRA-2015` (FX Forward, notional `112.11`). The view enables practitioners to assess whether the type and quality of collateral posted is adequate relative to the notional exposure it secures.

**View `collateral_regulatory_instrument_view`**

```sql
CREATE VIEW collateral_regulatory_instrument_view AS
SELECT a.id, a.collateral_identifier, a.asset_type, a.issuing_entity, b.regulatory_instrument_id AS instrument_regulatory_instrument_id, b.instrument_identifier AS instrument_instrument_identifier, b.title AS instrument_title
FROM collaterals a JOIN regulatory_instruments b ON a.regulatory_instrument_id = b.regulatory_instrument_id;
```

| id | collateral_identifier | asset_type | issuing_entity | instrument_regulatory_instrument_id | instrument_instrument_identifier | instrument_title |
|---|---|---|---|---|---|---|
| 1000 | COL-2403 | cash | pilot-issuing-14 | 100 | INS-2453 | Compact Initiative |
| 1001 | COL-2406 | gold | extended-issuing-15 | 101 | INS-2455 | Legacy Model |
| 1002 | COL-2409 | debt security | integrated-issuing-16 | 102 | INS-2457 | Regional Cluster A |
| 1003 | COL-2412 | corporate bond | seasonal-issuing-17 | 103 | INS-2459 | Seasonal Review |

This view links collateral to the regulatory instruments that govern its eligibility and treatment. Collateral `COL-2403` is governed by instrument `INS-2453` (Compact Initiative), `COL-2406` by `INS-2455` (Legacy Model), `COL-2409` by `INS-2457` (Regional Cluster A), and `COL-2412` by `INS-2459` (Seasonal Review). This ensures that collateral recognition criteria are consistent with the applicable regulatory framework.

## Credit Support Annex Governance

Credit support annexes bind the collateral framework to the netting agreements and regulatory instruments that govern derivative trading. Their configuration determines how and when collateral must be posted.

**View `credit_support_annex_netting_agreement_view`**

```sql
CREATE VIEW credit_support_annex_netting_agreement_view AS
SELECT a.credit_support_annex_id, a.csa_identifier, a.netting_set, a.amendment_status, b.id AS agreement_id, b.agreement_identifier AS agreement_agreement_identifier, b.agreement_type AS agreement_agreement_type
FROM credit_support_annexes a JOIN netting_agreements b ON a.netting_agreement_id = b.id;
```

| credit_support_annex_id | csa_identifier | netting_set | amendment_status | agreement_id | agreement_agreement_identifier | agreement_agreement_type |
|---|---|---|---|---|---|---|
| 100 | CSA-2141 | legacy | original | 1000 | AGR-2766 | ISDA Master Agreement |
| 101 | CSA-2142 | new trades | amended | 1001 | AGR-2771 | Custom Netting Agreement |
| 102 | CSA-2143 | custom | pending amendment | 1002 | AGR-2776 | ISDA Master Agreement |
| 103 | CSA-2144 | legacy | original | 1003 | AGR-2781 | Custom Netting Agreement |

This join links credit support annexes to their underlying netting agreements. Annex `CSA-2141` (covering the `legacy` netting set, `original` status) is associated with netting agreement `AGR-2766`. Annex `CSA-2142` (covering `new trades`, `amended` status) is linked to `AGR-2771`. Annex `CSA-2143` (covering `custom` netting set, `pending amendment` status) is associated with `AGR-2776`. Annex `CSA-2144` (covering `legacy` netting set, `original` status) is linked to `AGR-2781`. The amendment status of each CSA is critical: `pending amendment` annexes may require renegotiation, potentially affecting the enforceability of collateral obligations.

**View `credit_support_annex_collateral_detail_view`**

```sql
CREATE VIEW credit_support_annex_collateral_detail_view AS
SELECT a.credit_support_annex_id, a.csa_identifier, a.netting_set, b.id AS collateral_id, b.collateral_identifier AS collateral_collateral_identifier, b.asset_type AS collateral_asset_type
FROM credit_support_annexes a
  JOIN annexes_collaterals j ON j.credit_support_annex_id = a.credit_support_annex_id
  JOIN collaterals b ON b.id = j.collateral_id;
```

| credit_support_annex_id | csa_identifier | netting_set | collateral_id | collateral_collateral_identifier | collateral_asset_type |
|---|---|---|---|---|---|
| 100 | CSA-2141 | legacy | 1000 | COL-2403 | cash |
| 100 | CSA-2141 | legacy | 1001 | COL-2406 | gold |
| 101 | CSA-2142 | new trades | 1001 | COL-2406 | gold |
| 101 | CSA-2142 | new trades | 1002 | COL-2409 | debt security |
| 102 | CSA-2143 | custom | 1002 | COL-2409 | debt security |
| 102 | CSA-2143 | custom | 1003 | COL-2412 | corporate bond |
| 103 | CSA-2144 | legacy | 1003 | COL-2412 | corporate bond |
| 103 | CSA-2144 | legacy | 1000 | COL-2403 | cash |

This view connects credit support annexes to the collateral arrangements they govern. Annex `CSA-2141` governs collateral `COL-2403` (cash, `eligible`), while `CSA-2142` governs `COL-2406` (gold, `ineligible`). Annex `CSA-2143` is linked to `COL-2409` (debt security, `pending review`), and `CSA-2144` to `COL-2412` (corporate bond, `eligible`). The view enables practitioners to verify that the collateral posted under each annex meets the eligibility criteria specified in the CSA terms.

**View `credit_support_annex_regulatory_instrument_view`**

```sql
CREATE VIEW credit_support_annex_regulatory_instrument_view AS
SELECT a.credit_support_annex_id, a.csa_identifier, a.netting_set, a.amendment_status, b.regulatory_instrument_id AS instrument_regulatory_instrument_id, b.instrument_identifier AS instrument_instrument_identifier, b.title AS instrument_title
FROM credit_support_annexes a JOIN regulatory_instruments b ON a.regulatory_instrument_id = b.regulatory_instrument_id;
```

| credit_support_annex_id | csa_identifier | netting_set | amendment_status | instrument_regulatory_instrument_id | instrument_instrument_identifier | instrument_title |
|---|---|---|---|---|---|---|
| 100 | CSA-2141 | legacy | original | 100 | INS-2453 | Compact Initiative |
| 101 | CSA-2142 | new trades | amended | 101 | INS-2455 | Legacy Model |
| 102 | CSA-2143 | custom | pending amendment | 102 | INS-2457 | Regional Cluster A |
| 103 | CSA-2144 | legacy | original | 103 | INS-2459 | Seasonal Review |

This final join links credit support annexes to the regulatory instruments that govern their terms. Annex `CSA-2141` is governed by instrument `INS-2453` (Compact Initiative), `CSA-2142` by `INS-2455` (Legacy Model), `CSA-2143` by `INS-2457` (Regional Cluster A), and `CSA-2144` by `INS-2459` (Seasonal Review). This ensures that the collateral posting requirements embedded in each CSA are consistent with the applicable regulatory framework.

## Synthesis

The OTC derivative ecosystem is defined by the interlocking relationships between regulatory instruments, financial counterparties, derivative trades, netting agreements, collateral arrangements, and credit support annexes. Each trade carries notional exposure that is aggregated through netting agreements, mitigated by collateral, and governed by regulatory instruments. Credit support annexes operationalize the collateral framework, binding it to the underlying agreements. The views presented in this chapter demonstrate how these records can be joined to answer critical operational questions: which counterparties carry the largest exposures, which netting agreements have failed enforceability reviews, which collateral is ineligible or carries wrong-way risk, and which trades are governed by which regulatory frameworks. Practitioners who understand these relationships can identify concentration risks, ensure regulatory compliance, and manage the liquidity implications of their derivative portfolios with precision.

## Data appendix

**View `financial_counterparty_collateral_view`**

```sql
CREATE VIEW financial_counterparty_collateral_view AS
SELECT a.financial_counterparty_id, a.counterparty_identifier, a.legal_name, a.entity_type, b.id AS collateral_id, b.collateral_identifier AS collateral_collateral_identifier, b.asset_type AS collateral_asset_type
FROM financial_counterparties a JOIN collaterals b ON a.collateral_id = b.id;
```

| financial_counterparty_id | counterparty_identifier | legal_name | entity_type | collateral_id | collateral_collateral_identifier | collateral_asset_type |
|---|---|---|---|---|---|---|
| 1000 | COU-2085 | Adaptive Model | UCITS | 1000 | COL-2403 | cash |
| 1001 | COU-2092 | Primary Cluster | AIF | 1001 | COL-2406 | gold |
| 1002 | COU-2099 | Composite Review D | FinancialCounterparty | 1002 | COL-2409 | debt security |
| 1003 | COU-2106 | Compact Initiative | UCITS | 1003 | COL-2412 | corporate bond |
