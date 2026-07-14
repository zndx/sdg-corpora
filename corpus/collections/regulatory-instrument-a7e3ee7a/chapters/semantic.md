In the domain of over-the-counter (OTC) derivative markets, regulatory oversight, contractual netting, and collateral management converge into a tightly coupled data model. The schema captures six core entity types—regulatory instruments, financial counterparties, OTC derivative trades, netting agreements, collaterals, and credit support annexes—alongside four junction tables that materialize many-to-many associations. Each entity is normalised into its own table with a surrogate primary key, and foreign-key columns bind the tables into a directed graph of dependencies. Views then reassemble the normalised facts into denormalised rows that answer concrete business questions, such as "which trades does a given counterparty hold?" or "what collateral secures a particular netting agreement?"

## Regulatory Instruments

**Table `regulatory_instruments`**

| regulatory_instrument_id | instrument_identifier | title | issuing_authority | adoption_date | publication_date | entry_into_force_date | status | supersedes_regulatory_instrument_id | amends_regulatory_instrument_id | financial_counterparty_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | INS-2453 | Compact Initiative | extended-issuing-33 | 2025-08-12T07:09:00 | 2025-12-01T23:33:00 | 2022-05-16T04:00:00 | adopted | 100 | 100 | 1000 |
| 101 | INS-2455 | Legacy Model | integrated-issuing-34 | 2022-01-23T14:26:00 | 2022-05-12T06:50:00 | 2023-10-27T11:17:00 | published | 101 | 101 | 1001 |
| 102 | INS-2457 | Regional Cluster A | seasonal-issuing-35 | 2023-06-07T21:43:00 | 2023-10-23T13:07:00 | 2024-03-11T18:34:00 | inForce | 102 | 102 | 1002 |
| 103 | INS-2459 | Seasonal Review | regional-issuing-36 | 2024-11-18T04:00:00 | 2024-03-07T20:24:00 | 2025-08-22T01:51:00 | amended | 103 | 103 | 1003 |

The `regulatory_instruments` table is the regulatory anchor of the domain. Each row represents a formal instrument—such as a directive, standard, or initiative—issued by a named authority. The surrogate key `regulatory_instrument_id` (values 100 through 103) is the primary key; the business-facing `instrument_identifier` carries human-readable codes like `INS-2453` and `INS-2459`. Descriptive columns `title` ("Compact Initiative", "Legacy Model", "Regional Cluster A", "Seasonal Review"), `issuing_authority` ("extended-issuing-33", "integrated-issuing-34", "seasonal-issuing-35", "regional-issuing-36"), and `status` ("adopted", "published", "inForce", "amended") give each instrument a clear lifecycle. Temporal precision is captured through three date columns: `adoption_date`, `publication_date`, and `entry_into_force_date`. Self-referential foreign keys `supersedes_regulatory_instrument_id` and `amends_regulatory_instrument_id` allow instruments to form a version chain—row 100, for instance, both supersedes and amends itself, modelling a self-referential revision. The column `financial_counterparty_id` links each instrument to a single counterparty, establishing a one-to-many relationship from counterparties to instruments.

## Financial Counterparties

**Table `financial_counterparties`**

| financial_counterparty_id | counterparty_identifier | legal_name | entity_type | jurisdiction | registration_status | clearing_threshold_exceeded | regulatory_instrument_id | collateral_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | COU-2085 | Adaptive Model | UCITS | regional-jurisdic-30 | authorised | true | 100 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | COU-2092 | Primary Cluster | AIF | legacy-jurisdic-31 | registered | false | 101 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | COU-2099 | Composite Review D | FinancialCounterparty | compact-jurisdic-32 | unregistered | true | 102 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | COU-2106 | Compact Initiative | UCITS | composite-jurisdic-33 | authorised | false | 103 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `financial_counterparties` table models the market participants themselves. Its primary key `financial_counterparty_id` (1000–1003) identifies each entity, while `counterparty_identifier` provides a business key such as `COU-2085` or `COU-2106`. The `legal_name` column carries names like "Adaptive Model" and "Compact Initiative"; `entity_type` distinguishes categories such as `UCITS`, `AIF`, and `FinancialCounterparty`. Jurisdictional context is stored in `jurisdiction` ("regional-jurisdic-30", "legacy-jurisdic-31", "compact-jurisdic-32", "composite-jurisdic-33") and `registration_status` ("authorised", "registered", "unregistered"). A boolean flag `clearing_threshold_exceeded` records whether the counterparty has breached clearing thresholds. The foreign key `regulatory_instrument_id` ties each counterparty to the regulatory instrument under which it operates, and `collateral_id` links to a specific collateral record. Audit timestamps `created_at` and `updated_at` (e.g., `2025-01-01 00:14:00` through `2025-04-23 15:41:00`) track the lifecycle of each counterparty record.

## OTC Derivative Trades

**Table `o_t_c_derivative_trades`**

| id | trade_identifier | trade_date | trade_type | settlement_type | notional_amount | currency | maturity_date | status | netting_agreement_id | collateral_id | regulatory_instrument_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | TRA-2009 | 2025-12-04T23:09:00 | FX Forward | physically settled | 0.12 | seasonal-currency-71 | 2024-11-20T10:30:00 | active | 1000 | 1000 | 100 |
| 2 | TRA-2011 | 2022-05-15T06:26:00 | Swap | cash settled | 8.31 | regional-currency-72 | 2025-04-04T17:47:00 | settled | 1001 | 1001 | 101 |
| 3 | TRA-2013 | 2023-10-26T13:43:00 | Option | physically settled | 40,694 | legacy-currency-73 | 2022-09-15T00:04:00 | terminated | 1002 | 1002 | 102 |
| 4 | TRA-2015 | 2024-03-10T20:00:00 | FX Forward | cash settled | 112.11 | compact-currency-74 | 2023-02-26T07:21:00 | active | 1003 | 1003 | 103 |

The `o_t_c_derivative_trades` table is the transactional heart of the schema. Its primary key `id` (1–4) is a surrogate identifier; the business key `trade_identifier` carries values like `TRA-2009` and `TRA-2015`. The `trade_date` and `maturity_date` columns frame the trade's temporal horizon, while `trade_type` enumerates product categories ("FX Forward", "Swap", "Option"). Settlement mechanics are captured in `settlement_type` ("physically settled", "cash settled"), and `notional_amount` stores the trade size (ranging from 0.12 to 40,694). The `currency` column uses codes such as "seasonal-currency-71" and "compact-currency-74". The `status` column ("active", "settled", "terminated") reflects the trade lifecycle. Three foreign keys bind the trade to its contractual and regulatory context: `netting_agreement_id` (1000–1003) links to the governing netting agreement, `collateral_id` (1000–1003) references the associated collateral, and `regulatory_instrument_id` (100–103) ties the trade to the applicable regulatory framework.

## Netting Agreements

**Table `netting_agreements`**

| id | agreement_identifier | agreement_type | enforceability_review_status | reviewed_by | effective_date | termination_date | regulatory_instrument_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | AGR-2766 | ISDA Master Agreement | pending | internal | 2023-02-14T13:27:00 | 2022-09-11T20:24:00 | 100 | 2025-01-01 00:14:00 |
| 1001 | AGR-2771 | Custom Netting Agreement | completed | third party | 2024-07-25T20:44:00 | 2023-02-22T03:41:00 | 101 | 2025-02-06 03:14:00 |
| 1002 | AGR-2776 | ISDA Master Agreement | failed | internal | 2025-12-09T03:01:00 | 2024-07-06T10:58:00 | 102 | 2025-03-11 06:14:00 |
| 1003 | AGR-2781 | Custom Netting Agreement | pending | third party | 2022-05-20T10:18:00 | 2025-12-17T17:15:00 | 103 | 2025-04-16 09:14:00 |

Netting agreements define the legal frameworks under which trades are grouped for offset purposes. The `netting_agreements` table uses `id` (1000–1003) as its primary key, with `agreement_identifier` providing business keys like `AGR-2766` and `AGR-2781`. The `agreement_type` column distinguishes between "ISDA Master Agreement" and "Custom Netting Agreement". Legal enforceability is tracked through `enforceability_review_status` ("pending", "completed", "failed") and `reviewed_by` ("internal", "third party"). Temporal boundaries are set by `effective_date` and `termination_date`. The `regulatory_instrument_id` foreign key links each agreement to its governing regulatory instrument, and `created_at` records when the agreement was registered in the system.

## Collaterals

**Table `collaterals`**

| id | collateral_identifier | asset_type | issuing_entity | credit_quality_rating | denomination | eligibility_status | wrong_way_risk | financial_counterparty_id | o_t_c_derivative_trade_id | regulatory_instrument_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | COL-2403 | cash | pilot-issuing-14 | distributed-credit-90 | distributed-denomina-24 | eligible | false | 1000 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | COL-2406 | gold | extended-issuing-15 | baseline-credit-91 | baseline-denomina-25 | ineligible | true | 1001 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | COL-2409 | debt security | integrated-issuing-16 | pilot-credit-92 | pilot-denomina-26 | pending review | false | 1002 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | COL-2412 | corporate bond | seasonal-issuing-17 | extended-credit-93 | extended-denomina-27 | eligible | true | 1003 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `collaterals` table models the assets posted to mitigate counterparty credit risk. Its primary key `id` (1000–1003) is a surrogate; `collateral_identifier` carries business keys such as `COL-2403` and `COL-2412`. The `asset_type` column enumerates collateral forms: "cash", "gold", "debt security", and "corporate bond". Issuing entities are recorded in `issuing_entity` ("pilot-issuing-14" through "seasonal-issuing-17"), and `credit_quality_rating` ("distributed-credit-90", "baseline-credit-91", "pilot-credit-92", "extended-credit-93") captures the creditworthiness of the collateral. The `denomination` column ("distributed-denomina-24" through "extended-denomina-27") specifies the denomination type. Eligibility is tracked via `eligibility_status` ("eligible", "ineligible", "pending review"), and `wrong_way_risk` is a boolean flag. Three foreign keys bind collateral to the broader model: `financial_counterparty_id` links to the posting counterparty, `o_t_c_derivative_trade_id` references the trade it secures, and `regulatory_instrument_id` ties it to the applicable regulation. Audit columns `created_at` and `updated_at` complete the record.

## Credit Support Annexes

**Table `credit_support_annexes`**

| credit_support_annex_id | csa_identifier | netting_set | amendment_status | effective_date | termination_date | netting_agreement_id | regulatory_instrument_id |
|---|---|---|---|---|---|---|---|
| 100 | CSA-2141 | legacy | original | 2023-02-14T13:27:00 | 2022-09-11T20:24:00 | 1000 | 100 |
| 101 | CSA-2142 | new trades | amended | 2024-07-25T20:44:00 | 2023-02-22T03:41:00 | 1001 | 101 |
| 102 | CSA-2143 | custom | pending amendment | 2025-12-09T03:01:00 | 2024-07-06T10:58:00 | 1002 | 102 |
| 103 | CSA-2144 | legacy | original | 2022-05-20T10:18:00 | 2025-12-17T17:15:00 | 1003 | 103 |

Credit support annexes (CSAs) are contractual addenda to netting agreements that specify collateral requirements. The `credit_support_annexes` table uses `credit_support_annex_id` (100–103) as its primary key, with `csa_identifier` providing business keys like `CSA-2141` and `CSA-2144`. The `netting_set` column ("legacy", "new trades", "custom") identifies the netting set covered by the annex. The `amendment_status` column ("original", "amended", "pending amendment") tracks the annex's revision state. Temporal boundaries are captured in `effective_date` and `termination_date`. Two foreign keys bind the annex to its context: `netting_agreement_id` (1000–1003) links to the parent netting agreement, and `regulatory_instrument_id` (100–103) ties it to the governing regulatory instrument.

## Junction Tables

The schema includes four junction tables that materialize many-to-many relationships between the core entities. The `counterparties_trades` table links `financial_counterparties` to `o_t_c_derivative_trades`, enabling a single counterparty to be associated with multiple trades and a single trade to involve multiple counterparties. The `trades_counterparties` table serves the same logical purpose from the trade's perspective, providing a symmetric join path. The `agreements_trades` junction connects `netting_agreements` to `o_t_c_derivative_trades`, allowing a netting agreement to encompass multiple trades and a trade to be referenced by multiple agreements. Finally, the `annexes_collaterals` table links `credit_support_annexes` to `collaterals`, enabling a CSA to govern multiple collateral postings and a single collateral to be covered by multiple annexes. These junction tables ensure that the relational model faithfully represents the domain's inherently many-to-many relationships without data duplication.

## Regulatory Instrument Views

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

The `regulatory_instrument_regulatory_instrument_view` reconstructs the self-referential version chain of regulatory instruments. By joining `regulatory_instruments` to itself on `supersedes_regulatory_instrument_id` and `amends_regulatory_instrument_id`, the view answers the question: "which instrument supersedes or amends which?" Row 100, for instance, appears alongside itself, indicating a self-referential revision where "Compact Initiative" supersedes and amends its own prior version. This view is essential for regulatory audit trails, allowing analysts to trace the evolution of any instrument through its revision history.

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

The `regulatory_instrument_financial_counterparty_view` joins `regulatory_instruments` to `financial_counterparties` on `regulatory_instrument_id`, answering: "which counterparties operate under which regulatory instruments?" The join produces rows such as the instrument "Compact Initiative" (INS-2453) linked to the counterparty "Adaptive Model" (COU-2085), a UCITS entity authorised in "regional-jurisdic-30". This view is the primary lens for regulatory compliance reporting, enabling auditors to verify that each counterparty is operating under the correct regulatory framework.

## Financial Counterparty Views

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

The `financial_counterparty_regulatory_instrument_view` reverses the join direction, presenting each counterparty alongside its governing instrument. Row 1000 ("Adaptive Model", entity type UCITS, registration status authorised) is linked to instrument 100 ("Compact Initiative", status adopted). This perspective is useful for counterparty onboarding workflows, where the system must display the applicable regulatory instrument alongside the counterparty's details.

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

The `financial_counterparty_o_t_c_derivative_trade_detail_view` joins `financial_counterparties` to `o_t_c_derivative_trades` through the `counterparties_trades` junction table, answering: "which trades does a given counterparty hold?" The join reconstructs rows such as counterparty 1000 ("Adaptive Model") associated with trade 1 ("TRA-2009", an FX Forward with notional 0.12, status active). This view is critical for position reporting and risk aggregation, as it brings together counterparty identity with trade-level detail in a single denormalised row.

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

The `financial_counterparty_collateral_view` joins `financial_counterparties` to `collaterals` on `financial_counterparty_id`, answering: "what collateral has a counterparty posted?" Row 1000 ("Adaptive Model") is linked to collateral 1000 ("COL-2403", asset type cash, credit quality rating distributed-credit-90, eligibility status eligible). This view supports collateral management workflows, enabling risk teams to assess the quality and eligibility of posted collateral for each counterparty.

## OTC Derivative Trade Views

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

The `o_t_c_derivative_trade_financial_counterparty_detail_view` joins `o_t_c_derivative_trades` to `financial_counterparties` through the `trades_counterparties` junction, answering: "which counterparty is associated with a given trade?" Trade 1 ("TRA-2009", FX Forward, physically settled, notional 0.12) is linked to counterparty 1000 ("Adaptive Model"). This view provides a trade-centric perspective on counterparty exposure, useful for trade confirmation and settlement workflows.

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

The `o_t_c_derivative_trade_netting_agreement_view` joins `o_t_c_derivative_trades` to `netting_agreements` on `netting_agreement_id`, answering: "under which netting agreement does a trade fall?" Trade 1 ("TRA-2009") is linked to agreement 1000 ("AGR-2766", ISDA Master Agreement, enforceability review status pending). This view is essential for netting analysis, enabling legal and risk teams to verify that trades are properly grouped under enforceable netting frameworks.

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

The `o_t_c_derivative_trade_collateral_view` joins `o_t_c_derivative_trades` to `collaterals` on `collateral_id`, answering: "what collateral secures a given trade?" Trade 1 ("TRA-2009") is linked to collateral 1000 ("COL-2403", cash, eligible, wrong-way risk false). This view supports collateral optimisation and margin call calculations by bringing trade and collateral details together.

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

The `o_t_c_derivative_trade_regulatory_instrument_view` joins `o_t_c_derivative_trades` to `regulatory_instruments` on `regulatory_instrument_id`, answering: "under which regulatory instrument does a trade fall?" Trade 1 ("TRA-2009") is linked to instrument 100 ("Compact Initiative", status adopted). This view is used for regulatory reporting, ensuring that each trade is associated with the correct regulatory framework.

## Netting Agreement Views

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

The `netting_agreement_o_t_c_derivative_trade_detail_view` joins `netting_agreements` to `o_t_c_derivative_trades` on `netting_agreement_id`, answering: "which trades are governed by a given netting agreement?" Agreement 1000 ("AGR-2766", ISDA Master Agreement) is linked to trade 1 ("TRA-2009", FX Forward, notional 0.12). This view supports netting set analysis, enabling risk teams to calculate the aggregate exposure within each netting agreement.

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

The `netting_agreement_regulatory_instrument_view` joins `netting_agreements` to `regulatory_instruments` on `regulatory_instrument_id`, answering: "under which regulatory instrument does a netting agreement operate?" Agreement 1000 ("AGR-2766") is linked to instrument 100 ("Compact Initiative"). This view is used for legal compliance verification, ensuring that each netting agreement is governed by an appropriate regulatory framework.

## Collateral Views

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

The `collateral_financial_counterparty_view` joins `collaterals` to `financial_counterparties` on `financial_counterparty_id`, answering: "which counterparty posted a given collateral?" Collateral 1000 ("COL-2403", cash, eligible) is linked to counterparty 1000 ("Adaptive Model", UCITS, authorised). This view supports collateral attribution and recovery analysis, enabling risk teams to trace collateral back to its posting counterparty.

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

The `collateral_o_t_c_derivative_trade_view` joins `collaterals` to `o_t_c_derivative_trades` on `o_t_c_derivative_trade_id`, answering: "which trade does a given collateral secure?" Collateral 1000 ("COL-2403", cash) is linked to trade 1 ("TRA-2009", FX Forward, notional 0.12). This view is critical for margin call calculations and collateral optimisation, as it directly links posted assets to the trades they mitigate.

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

The `collateral_regulatory_instrument_view` joins `collaterals` to `regulatory_instruments` on `regulatory_instrument_id`, answering: "under which regulatory instrument does a collateral posting fall?" Collateral 1000 ("COL-2403", gold, ineligible, wrong-way risk true) is linked to instrument 100 ("Compact Initiative"). This view supports regulatory compliance for collateral management, ensuring that collateral postings adhere to the applicable regulatory framework.

## Credit Support Annex Views

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

The `credit_support_annex_netting_agreement_view` joins `credit_support_annexes` to `netting_agreements` on `netting_agreement_id`, answering: "which netting agreement does a given CSA amend?" Annex 100 ("CSA-2141", netting set legacy, amendment status original) is linked to agreement 1000 ("AGR-2766", ISDA Master Agreement). This view supports legal document management, enabling teams to trace the relationship between CSAs and their parent netting agreements.

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

The `credit_support_annex_collateral_detail_view` joins `credit_support_annexes` to `collaterals` through the `annexes_collaterals` junction table, answering: "which collateral is governed by a given CSA?" Annex 100 ("CSA-2141") is linked to collateral 1000 ("COL-2403", cash, eligible). This view is essential for collateral eligibility verification, ensuring that posted collateral meets the requirements specified in the governing CSA.

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

The `credit_support_annex_regulatory_instrument_view` joins `credit_support_annexes` to `regulatory_instruments` on `regulatory_instrument_id`, answering: "under which regulatory instrument does a given CSA operate?" Annex 100 ("CSA-2141", netting set legacy) is linked to instrument 100 ("Compact Initiative", status adopted). This view supports regulatory compliance for CSA documentation, ensuring that each annex is governed by an appropriate regulatory framework.

## Synthesis

The schema models the OTC derivatives domain as a directed acyclic graph of entities, with `regulatory_instruments` at the apex and `o_t_c_derivative_trades` at the centre of transactional activity. Foreign keys propagate regulatory context downward: counterparties, trades, netting agreements, collaterals, and credit support annexes all reference the regulatory instrument layer. Junction tables (`counterparties_trades`, `trades_counterparties`, `agreements_trades`, `annexes_collaterals`) materialise the many-to-many relationships that the core entities cannot express through simple foreign keys. The twenty-seven views then reassemble these normalised facts into denormalised rows that answer concrete business questions—from counterparty position reporting to collateral eligibility verification—without requiring analysts to write joins manually. Each view is a materialised interpretation of a domain fact, ensuring that the relational schema faithfully reflects the ontology of OTC derivative markets.

## Data appendix

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
