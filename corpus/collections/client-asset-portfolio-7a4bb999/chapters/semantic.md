# Relational Modelling of Financial Oversight and Asset Protection

The financial services domain under examination centres on the interlocking obligations between asset-holding clients, the institutions that manage their portfolios, the insurance policies that backstop those holdings, and the regulatory and audit apparatus that monitors compliance. At the heart of the model sit seven base tables: `client_asset_portfolios`, `insurance_policies`, `financial_institutions`, `regulatory_frameworks`, `audit_reports`, `insurance_underwriters`, and `rating_agencies`. Each table captures a distinct entity type from the domain, and their columns encode both intrinsic attributes and foreign-key relationships that bind the entities into a coherent graph. The foreign keys are deliberately redundant — a portfolio row carries references to its policy, institution, and framework; an institution row carries references back to its portfolio, policy, framework, and audit report. This symmetric referencing pattern ensures that every relationship can be traversed from either end, and it is precisely this symmetry that the materialised views exploit to reconstruct domain facts in a single read.

**Table `client_asset_portfolios`**

| client_asset_portfolio_id | portfolio_identifier | total_value_u_s_d | asset_type | segregation_status | custodian_entity | last_valuation_date | risk_rating | insurance_policy_id | financial_institution_id | regulatory_framework_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | POR-2268 | 7.20 | securities | segregated | adaptive-custodia-23 | 2025-08-03T07:09:00 | compact-risk-68 | 1 | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | POR-2271 | 10.40 | cash | commingled | distributed-custodia-24 | 2022-01-14T14:26:00 | composite-risk-69 | 2 | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | POR-2274 | 13.60 | mixed | pending | baseline-custodia-25 | 2023-06-25T21:43:00 | primary-risk-70 | 3 | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | POR-2277 | 16.80 | securities | segregated | pilot-custodia-26 | 2024-11-09T04:00:00 | adaptive-risk-71 | 4 | 4 | 103 | 2025-04-16 09:14:00 |

The `client_asset_portfolios` table is the primary asset-holding entity. Each row represents a discrete portfolio belonging to a client, identified by a surrogate key `client_asset_portfolio_id` and a human-readable `portfolio_identifier` such as `POR-2268` or `POR-2277`. The portfolio's financial substance is captured in `total_value_u_s_d` — values like `7.20`, `10.40`, `13.60`, and `16.80` — and its composition is classified by `asset_type`, which takes values `securities`, `cash`, or `mixed`. Custodial arrangements are described by `segregation_status` (`segregated`, `commingled`, `pending`) and the `custodian_entity` name (`adaptive-custodia-23`, `distributed-custodia-24`, `baseline-custodia-25`, `pilot-custodia-26`). Risk exposure is summarised in `risk_rating` (`compact-risk-68`, `composite-risk-69`, `primary-risk-70`, `adaptive-risk-71`), and the `last_valuation_date` and `created_at` timestamps anchor the portfolio in time. Crucially, three foreign-key columns — `insurance_policy_id`, `financial_institution_id`, and `regulatory_framework_id` — tie each portfolio to its insurance coverage, its managing institution, and the regulatory regime under which it operates. Portfolio `POR-2268` (id `1`) references policy `1`, institution `1`, and framework `100`; portfolio `POR-2277` (id `4`) references policy `4`, institution `4`, and framework `103`.

**Table `insurance_policies`**

| insurance_policy_id | policy_identifier | provider_name | coverage_limit_u_s_d | effective_date | expiration_date | rating_agency | credit_rating | policy_type | client_asset_portfolio_id | insurance_underwriter_id | supersedes_insurance_policy_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | POL-2480 | Primary Initiative A | 13.20 | 2023-02-14 | 2025-08-18 | Luddic Path | composite-credit-45 | SIPC | 1 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | POL-2486 | Composite Model | 16.40 | 2024-07-25 | 2022-01-02 | Council Of The Great City Schools | primary-credit-46 | excess_SIPC | 2 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | POL-2492 | Compact Cluster | 19.60 | 2025-12-09 | 2023-06-13 | American Institutes for Research | adaptive-credit-47 | other | 3 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | POL-2498 | Legacy Review D | 22.80 | 2022-05-20 | 2024-11-24 | Taito Corporation Japan | distributed-credit-48 | SIPC | 4 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Insurance policies form the second pillar. The `insurance_policies` table stores each policy's surrogate key `insurance_policy_id`, a human-readable `policy_identifier` (`POL-2480`, `POL-2486`, `POL-2492`, `POL-2498`), and the `provider_name` (`Primary Initiative A`, `Composite Model`, `Compact Cluster`, `Legacy Review D`). Financial protection is quantified by `coverage_limit_u_s_d` (`13.20`, `16.40`, `19.60`, `22.80`) and bounded by `effective_date` and `expiration_date`. The `rating_agency` column names the agency that assigned the credit rating (`Luddic Path`, `Council Of The Great City Schools`, `American Institutes for Research`, `Taito Corporation Japan`), while `credit_rating` holds the rating value (`composite-credit-45`, `primary-credit-46`, `adaptive-credit-47`, `distributed-credit-48`). The `policy_type` distinguishes `SIPC`, `excess_SIPC`, and `other` policies. Foreign keys `client_asset_portfolio_id` and `insurance_underwriter_id` link the policy to its host portfolio and the underwriter that issued it. A self-referential column `supersedes_insurance_policy_id` encodes policy lineage — policy `1` supersedes itself in the sample data, as do policies `2`, `3`, and `4`, indicating a one-to-one or one-to-many supersession chain. The `created_at` and `updated_at` timestamps track the policy's lifecycle.

**Table `financial_institutions`**

| financial_institution_id | institution_identifier | legal_name | registration_status | net_capital_u_s_d | total_assets_u_s_d | shareholders_equity_u_s_d | market_capitalization_u_s_d | parent_company | client_asset_portfolio_id | insurance_policy_id | regulatory_framework_id | audit_report_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | INS-2717 | Adaptive Model | registered | 19.95 | 5.95 | 18.95 | 13.45 | Atlantic Richfield | 1 | 1 | 100 | 100 | 2025-01-01 00:14:00 |
| 2 | INS-2718 | Primary Cluster | pending | 23.90 | 9.90 | 20.90 | 17.90 | Diners Club Switzerland Ltd | 2 | 2 | 101 | 101 | 2025-02-06 03:14:00 |
| 3 | INS-2719 | Composite Review D | suspended | 27.85 | 13.85 | 22.85 | 22.35 | AFLAC Inc | 3 | 3 | 102 | 102 | 2025-03-11 06:14:00 |
| 4 | INS-2720 | Compact Initiative | registered | 31.80 | 17.80 | 24.80 | 26.80 | Maze Vietnam | 4 | 4 | 103 | 103 | 2025-04-16 09:14:00 |

The `financial_institutions` table captures the organisations that manage client assets. Each row carries `financial_institution_id`, an `institution_identifier` (`INS-2717` through `INS-2720`), and a `legal_name` (`Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`). The `registration_status` column takes values `registered`, `pending`, or `suspended`. Financial health is described by `net_capital_u_s_d` (`19.95`, `23.90`, `27.85`, `31.80`), `total_assets_u_s_d` (`5.95`, `9.90`, `13.85`, `17.80`), `shareholders_equity_u_s_d` (`18.95`, `20.90`, `22.85`, `24.80`), and `market_capitalization_u_s_d` (`13.45`, `17.90`, `22.35`, `26.80`). The `parent_company` column names the ultimate parent (`Atlantic Richfield`, `Diners Club Switzerland Ltd`, `AFLAC Inc`, `Maze Vietnam`). Four foreign-key columns — `client_asset_portfolio_id`, `insurance_policy_id`, `regulatory_framework_id`, and `audit_report_id` — anchor the institution to its portfolio, its insurance coverage, its regulatory regime, and its most recent audit. Institution `INS-2717` (id `1`) links to portfolio `1`, policy `1`, framework `100`, and audit `100`.

**Table `regulatory_frameworks`**

| id | framework_identifier | issuing_authority | jurisdiction | compliance_status | last_audit_date | regulatory_type | financial_institution_id | client_asset_portfolio_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | FRA-2787 | extended-issuing-33 | regional-jurisdic-30 | compliant | 2023-10-23 | securities | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | FRA-2788 | integrated-issuing-34 | legacy-jurisdic-31 | non_compliant | 2024-03-07 | banking | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | FRA-2789 | seasonal-issuing-35 | compact-jurisdic-32 | under_review | 2025-08-18 | insurance | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | FRA-2790 | regional-issuing-36 | composite-jurisdic-33 | compliant | 2022-01-02 | mixed | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Regulatory frameworks define the legal regimes under which institutions and portfolios operate. The table's surrogate key is `id` (values `100` through `103`), with `framework_identifier` (`FRA-2787` through `FRA-2790`), `issuing_authority` (`extended-issuing-33`, `integrated-issuing-34`, `seasonal-issuing-35`, `regional-issuing-36`), and `jurisdiction` (`regional-jurisdic-30`, `legacy-jurisdic-31`, `compact-jurisdic-32`, `composite-jurisdic-33`). The `compliance_status` column records `compliant`, `non_compliant`, or `under_review`, and `last_audit_date` marks the most recent audit. The `regulatory_type` distinguishes `securities`, `banking`, `insurance`, and `mixed` regimes. Foreign keys `financial_institution_id` and `client_asset_portfolio_id` tie the framework to its institution and portfolio. Framework `FRA-2787` (id `100`) applies to institution `1` and portfolio `1`; framework `FRA-2790` (id `103`) applies to institution `4` and portfolio `4`.

**Table `audit_reports`**

| id | report_identifier | audit_firm | report_date | audit_type | findings_summary | compliance_rating | scope_description | financial_institution_id | client_asset_portfolio_id | regulatory_framework_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | REP-2544 | legacy-audit-85 | 2024-03-02 | annual | pilot-findings-32 | integrated-complian-94 | Integrated Model A | 1 | 1 | 100 |
| 101 | REP-2545 | compact-audit-86 | 2025-08-13 | quarterly | extended-findings-33 | seasonal-complian-95 | Extended Cluster | 2 | 2 | 101 |
| 102 | REP-2546 | composite-audit-87 | 2022-01-24 | special | integrated-findings-34 | regional-complian-96 | Pilot Review | 3 | 3 | 102 |
| 103 | REP-2547 | primary-audit-88 | 2023-06-08 | annual | seasonal-findings-35 | legacy-complian-97 | Baseline Initiative D | 4 | 4 | 103 |

Audit reports document the compliance examinations of financial institutions. The surrogate key is `id` (`100` through `103`), with `report_identifier` (`REP-2544` through `REP-2547`), `audit_firm` (`legacy-audit-85`, `compact-audit-86`, `composite-audit-87`, `primary-audit-88`), and `report_date` (`2024-03-02`, `2025-08-13`, `2022-01-24`, `2023-06-08`). The `audit_type` takes values `annual`, `quarterly`, or `special`. Findings are summarised in `findings_summary` (`pilot-findings-32`, `extended-findings-33`, `integrated-findings-34`, `seasonal-findings-35`) and scored by `compliance_rating` (`integrated-complian-94`, `seasonal-complian-95`, `regional-complian-96`, `legacy-complian-97`). The `scope_description` provides a human label (`Integrated Model A`, `Extended Cluster`, `Pilot Review`, `Baseline Initiative D`). Three foreign-key columns — `financial_institution_id`, `client_asset_portfolio_id`, and `regulatory_framework_id` — link the audit to its subject institution, portfolio, and regulatory regime. Audit `REP-2544` (id `100`) examines institution `1`, portfolio `1`, under framework `100`.

**Table `insurance_underwriters`**

| id | underwriter_identifier | legal_name | location | credit_rating_s_p | credit_rating_a_m_best | credit_rating_fitch | rating_date | insurance_policy_id | rating_agency_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | UND-2760 | Adaptive Model | extended-location-99 | distributed-credit-66 | primary-credit-70 | regional-credit-18 | 2025-04-11 | 1 | 100 | 2025-01-01 00:14:00 |
| 1001 | UND-2762 | Primary Cluster | integrated-location-100 | baseline-credit-67 | adaptive-credit-71 | legacy-credit-19 | 2022-09-22 | 2 | 101 | 2025-02-06 03:14:00 |
| 1002 | UND-2764 | Composite Review D | seasonal-location-101 | pilot-credit-68 | distributed-credit-72 | compact-credit-20 | 2023-02-06 | 3 | 102 | 2025-03-11 06:14:00 |
| 1003 | UND-2766 | Compact Initiative | regional-location-102 | extended-credit-69 | baseline-credit-73 | composite-credit-21 | 2024-07-17 | 4 | 103 | 2025-04-16 09:14:00 |

Insurance underwriters are the organisations that issue and manage insurance policies. The table uses `id` as its surrogate key (`1000` through `1003`), with `underwriter_identifier` (`UND-2760`, `UND-2762`, `UND-2764`, `UND-2766`), `legal_name` (`Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`), and `location` (`extended-location-99`, `integrated-location-100`, `seasonal-location-101`, `regional-location-102`). Credit ratings from three agencies are stored in `credit_rating_s_p` (`distributed-credit-66`, `baseline-credit-67`, `pilot-credit-68`, `extended-credit-69`), `credit_rating_a_m_best` (`primary-credit-70`, `adaptive-credit-71`, `distributed-credit-72`, `baseline-credit-73`), and `credit_rating_fitch` (`regional-credit-18`, `legacy-credit-19`, `compact-credit-20`, `composite-credit-21`). The `rating_date` (`2025-04-11`, `2022-09-22`, `2023-02-06`, `2024-07-17`) records when the ratings were assigned. Foreign keys `insurance_policy_id` and `rating_agency_id` link the underwriter to its policy and the rating agency that issued the ratings. Underwriter `UND-2760` (id `1000`) issued policy `1` and was rated by agency `100`.

The seventh base table, `rating_agencies`, is referenced by `insurance_underwriters.rating_agency_id` and by `insurance_policies.rating_agency` (which stores the agency name as a string rather than a foreign key). The rating agencies — `Luddic Path`, `Council Of The Great City Schools`, `American Institutes for Research`, and `Taito Corporation Japan` — provide the credit assessments that appear on both policies and underwriters.

## From Entity Types to Normalised Columns

The materialisation of this domain into relational tables follows a straightforward normalisation pattern. Each entity type becomes a table whose primary key is a surrogate integer identifier. Non-key attributes — identifiers like `POR-2268`, monetary values like `7.20`, categorical values like `securities` or `compliant`, and timestamps — become columns of appropriate types. The cardinality of relationships is encoded through foreign-key columns placed on the "many" side of each relationship. In this schema, the relationships are deliberately many-to-one in both directions: a portfolio references one policy, one institution, and one framework; a policy references one portfolio and one underwriter; an institution references one portfolio, one policy, one framework, and one audit; an underwriter references one policy and one rating agency. The result is a set of tables where every row carries its own set of foreign keys, enabling bidirectional traversal without junction tables.

This design choice has a clear trade-off. The redundancy of foreign keys across multiple tables means that the same relationship is stored in several places — the link between portfolio `1` and institution `1` appears in both `client_asset_portfolios.financial_institution_id` and `financial_institutions.client_asset_portfolio_id`. However, it eliminates the need for junction tables for these one-to-one or one-to-many relationships, simplifying queries that need to traverse from either end. The views that follow demonstrate how this redundancy is leveraged to reconstruct domain facts.

## View-Based Reconstruction of Domain Facts

Each materialised view joins two base tables and projects a subset of their columns to answer a specific question about the relationship between the two entities. The views come in symmetric pairs: for every relationship from entity A to entity B, there is a view starting from A and a view starting from B. This symmetry ensures that any relationship can be queried from either perspective.

**View `client_asset_portfolio_insurance_policy_view`**

```sql
CREATE VIEW client_asset_portfolio_insurance_policy_view AS
SELECT a.client_asset_portfolio_id, a.portfolio_identifier, a.total_value_u_s_d, a.asset_type, b.insurance_policy_id AS policy_insurance_policy_id, b.policy_identifier AS policy_policy_identifier, b.provider_name AS policy_provider_name
FROM client_asset_portfolios a JOIN insurance_policies b ON a.insurance_policy_id = b.insurance_policy_id;
```

| client_asset_portfolio_id | portfolio_identifier | total_value_u_s_d | asset_type | policy_insurance_policy_id | policy_policy_identifier | policy_provider_name |
|---|---|---|---|---|---|---|
| 1 | POR-2268 | 7.20 | securities | 1 | POL-2480 | Primary Initiative A |
| 2 | POR-2271 | 10.40 | cash | 2 | POL-2486 | Composite Model |
| 3 | POR-2274 | 13.60 | mixed | 3 | POL-2492 | Compact Cluster |
| 4 | POR-2277 | 16.80 | securities | 4 | POL-2498 | Legacy Review D |

The `client_asset_portfolio_insurance_policy_view` answers the question: "Which insurance policy covers which portfolio, and what are their key identifiers and values?" It joins `client_asset_portfolios` to `insurance_policies` on `client_asset_portfolio_id = insurance_policy_id` and projects the portfolio's `client_asset_portfolio_id`, `portfolio_identifier`, and `total_value_u_s_d` alongside the policy's `insurance_policy_id`, `policy_identifier`, and `coverage_limit_u_s_d`. A row with portfolio `POR-2268` (value `7.20`) linked to policy `POL-2480` (coverage `13.20`) tells us that the portfolio's total value is well within the policy's coverage limit — a fact of direct relevance to risk assessment.

**View `client_asset_portfolio_financial_institution_view`**

```sql
CREATE VIEW client_asset_portfolio_financial_institution_view AS
SELECT a.client_asset_portfolio_id, a.portfolio_identifier, a.total_value_u_s_d, a.asset_type, b.financial_institution_id AS institution_financial_institution_id, b.institution_identifier AS institution_institution_identifier, b.legal_name AS institution_legal_name
FROM client_asset_portfolios a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| client_asset_portfolio_id | portfolio_identifier | total_value_u_s_d | asset_type | institution_financial_institution_id | institution_institution_identifier | institution_legal_name |
|---|---|---|---|---|---|---|
| 1 | POR-2268 | 7.20 | securities | 1 | INS-2717 | Adaptive Model |
| 2 | POR-2271 | 10.40 | cash | 2 | INS-2718 | Primary Cluster |
| 3 | POR-2274 | 13.60 | mixed | 3 | INS-2719 | Composite Review D |
| 4 | POR-2277 | 16.80 | securities | 4 | INS-2720 | Compact Initiative |

The `client_asset_portfolio_financial_institution_view` answers: "Which financial institution manages which portfolio?" It joins `client_asset_portfolios` to `financial_institutions` and projects the portfolio's `client_asset_portfolio_id`, `portfolio_identifier`, and `total_value_u_s_d` alongside the institution's `financial_institution_id`, `institution_identifier`, and `legal_name`. The row showing portfolio `POR-2268` managed by institution `INS-2717` (`Adaptive Model`) with net capital of `19.95` provides a quick snapshot of the managing entity's financial health relative to the portfolio's value.

**View `client_asset_portfolio_regulatory_framework_view`**

```sql
CREATE VIEW client_asset_portfolio_regulatory_framework_view AS
SELECT a.client_asset_portfolio_id, a.portfolio_identifier, a.total_value_u_s_d, a.asset_type, b.id AS framework_id, b.framework_identifier AS framework_framework_identifier, b.issuing_authority AS framework_issuing_authority
FROM client_asset_portfolios a JOIN regulatory_frameworks b ON a.regulatory_framework_id = b.id;
```

| client_asset_portfolio_id | portfolio_identifier | total_value_u_s_d | asset_type | framework_id | framework_framework_identifier | framework_issuing_authority |
|---|---|---|---|---|---|---|
| 1 | POR-2268 | 7.20 | securities | 100 | FRA-2787 | extended-issuing-33 |
| 2 | POR-2271 | 10.40 | cash | 101 | FRA-2788 | integrated-issuing-34 |
| 3 | POR-2274 | 13.60 | mixed | 102 | FRA-2789 | seasonal-issuing-35 |
| 4 | POR-2277 | 16.80 | securities | 103 | FRA-2790 | regional-issuing-36 |

The `client_asset_portfolio_regulatory_framework_view` answers: "Under which regulatory framework does each portfolio operate?" It joins `client_asset_portfolios` to `regulatory_frameworks` and projects the portfolio's `client_asset_portfolio_id`, `portfolio_identifier`, and `total_value_u_s_d` alongside the framework's `id`, `framework_identifier`, and `issuing_authority`. The row linking portfolio `POR-2268` to framework `FRA-2787` issued by `extended-issuing-33` tells us the regulatory jurisdiction and the authority responsible for oversight.

**View `insurance_policy_client_asset_portfolio_view`**

```sql
CREATE VIEW insurance_policy_client_asset_portfolio_view AS
SELECT a.insurance_policy_id, a.policy_identifier, a.provider_name, a.coverage_limit_u_s_d, b.client_asset_portfolio_id AS portfolio_client_asset_portfolio_id, b.portfolio_identifier AS portfolio_portfolio_identifier, b.total_value_u_s_d AS portfolio_total_value_u_s_d
FROM insurance_policies a JOIN client_asset_portfolios b ON a.client_asset_portfolio_id = b.client_asset_portfolio_id;
```

| insurance_policy_id | policy_identifier | provider_name | coverage_limit_u_s_d | portfolio_client_asset_portfolio_id | portfolio_portfolio_identifier | portfolio_total_value_u_s_d |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | Primary Initiative A | 13.20 | 1 | POR-2268 | 7.20 |
| 2 | POL-2486 | Composite Model | 16.40 | 2 | POR-2271 | 10.40 |
| 3 | POL-2492 | Compact Cluster | 19.60 | 3 | POR-2274 | 13.60 |
| 4 | POL-2498 | Legacy Review D | 22.80 | 4 | POR-2277 | 16.80 |

The `insurance_policy_client_asset_portfolio_view` reverses the perspective: "Which portfolio is covered by which insurance policy?" It joins `insurance_policies` to `client_asset_portfolios` and projects the policy's `insurance_policy_id`, `policy_identifier`, and `coverage_limit_u_s_d` alongside the portfolio's `client_asset_portfolio_id`, `portfolio_identifier`, and `total_value_u_s_d`. The row showing policy `POL-2480` (coverage `13.20`) covering portfolio `POR-2268` (value `7.20`) confirms the same coverage relationship from the policy's perspective.

**View `insurance_policy_insurance_underwriter_view`**

```sql
CREATE VIEW insurance_policy_insurance_underwriter_view AS
SELECT a.insurance_policy_id, a.policy_identifier, a.provider_name, a.coverage_limit_u_s_d, b.id AS underwriter_id, b.underwriter_identifier AS underwriter_underwriter_identifier, b.legal_name AS underwriter_legal_name
FROM insurance_policies a JOIN insurance_underwriters b ON a.insurance_underwriter_id = b.id;
```

| insurance_policy_id | policy_identifier | provider_name | coverage_limit_u_s_d | underwriter_id | underwriter_underwriter_identifier | underwriter_legal_name |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | Primary Initiative A | 13.20 | 1000 | UND-2760 | Adaptive Model |
| 2 | POL-2486 | Composite Model | 16.40 | 1001 | UND-2762 | Primary Cluster |
| 3 | POL-2492 | Compact Cluster | 19.60 | 1002 | UND-2764 | Composite Review D |
| 4 | POL-2498 | Legacy Review D | 22.80 | 1003 | UND-2766 | Compact Initiative |

The `insurance_policy_insurance_underwriter_view` answers: "Which underwriter issued which policy, and what are their credit ratings?" It joins `insurance_policies` to `insurance_underwriters` and projects the policy's `insurance_policy_id`, `policy_identifier`, and `coverage_limit_u_s_d` alongside the underwriter's `id`, `underwriter_identifier`, and `legal_name`. The row linking policy `POL-2480` to underwriter `UND-2760` (`Adaptive Model`) connects the policy to the organisation that issued it and, by extension, to the underwriter's credit ratings from S&P, A.M. Best, and Fitch.

**View `insurance_policy_insurance_policy_view`**

```sql
CREATE VIEW insurance_policy_insurance_policy_view AS
SELECT a.insurance_policy_id, a.policy_identifier, a.provider_name, a.coverage_limit_u_s_d, b.insurance_policy_id AS policy_insurance_policy_id, b.policy_identifier AS policy_policy_identifier, b.provider_name AS policy_provider_name
FROM insurance_policies a JOIN insurance_policies b ON a.supersedes_insurance_policy_id = b.insurance_policy_id;
```

| insurance_policy_id | policy_identifier | provider_name | coverage_limit_u_s_d | policy_insurance_policy_id | policy_policy_identifier | policy_provider_name |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | Primary Initiative A | 13.20 | 1 | POL-2480 | Primary Initiative A |
| 2 | POL-2486 | Composite Model | 16.40 | 2 | POL-2486 | Composite Model |
| 3 | POL-2492 | Compact Cluster | 19.60 | 3 | POL-2492 | Compact Cluster |
| 4 | POL-2498 | Legacy Review D | 22.80 | 4 | POL-2498 | Legacy Review D |

The `insurance_policy_insurance_policy_view` is a self-join on `insurance_policies` that answers: "Which policy supersedes which other policy?" It joins the table to itself on `supersedes_insurance_policy_id = insurance_policy_id` and projects both the superseding and superseded policy's `insurance_policy_id`, `policy_identifier`, and `coverage_limit_u_s_d`. The row showing policy `POL-2480` (id `1`) superseding itself (id `1`) indicates a self-referential entry in the sample data, which in production would typically show a chain like policy `2` superseding policy `1`.

**View `financial_institution_client_asset_portfolio_view`**

```sql
CREATE VIEW financial_institution_client_asset_portfolio_view AS
SELECT a.financial_institution_id, a.institution_identifier, a.legal_name, a.registration_status, b.client_asset_portfolio_id AS portfolio_client_asset_portfolio_id, b.portfolio_identifier AS portfolio_portfolio_identifier, b.total_value_u_s_d AS portfolio_total_value_u_s_d
FROM financial_institutions a JOIN client_asset_portfolios b ON a.client_asset_portfolio_id = b.client_asset_portfolio_id;
```

| financial_institution_id | institution_identifier | legal_name | registration_status | portfolio_client_asset_portfolio_id | portfolio_portfolio_identifier | portfolio_total_value_u_s_d |
|---|---|---|---|---|---|---|
| 1 | INS-2717 | Adaptive Model | registered | 1 | POR-2268 | 7.20 |
| 2 | INS-2718 | Primary Cluster | pending | 2 | POR-2271 | 10.40 |
| 3 | INS-2719 | Composite Review D | suspended | 3 | POR-2274 | 13.60 |
| 4 | INS-2720 | Compact Initiative | registered | 4 | POR-2277 | 16.80 |

The `financial_institution_client_asset_portfolio_view` answers: "Which portfolio is managed by which financial institution?" It joins `financial_institutions` to `client_asset_portfolios` and projects the institution's `financial_institution_id`, `institution_identifier`, and `legal_name` alongside the portfolio's `client_asset_portfolio_id`, `portfolio_identifier`, and `total_value_u_s_d`. The row showing institution `INS-2717` (`Adaptive Model`) managing portfolio `POR-2268` (value `7.20`) provides the same relationship from the institution's perspective.

**View `financial_institution_insurance_policy_view`**

```sql
CREATE VIEW financial_institution_insurance_policy_view AS
SELECT a.financial_institution_id, a.institution_identifier, a.legal_name, a.registration_status, b.insurance_policy_id AS policy_insurance_policy_id, b.policy_identifier AS policy_policy_identifier, b.provider_name AS policy_provider_name
FROM financial_institutions a JOIN insurance_policies b ON a.insurance_policy_id = b.insurance_policy_id;
```

| financial_institution_id | institution_identifier | legal_name | registration_status | policy_insurance_policy_id | policy_policy_identifier | policy_provider_name |
|---|---|---|---|---|---|---|
| 1 | INS-2717 | Adaptive Model | registered | 1 | POL-2480 | Primary Initiative A |
| 2 | INS-2718 | Primary Cluster | pending | 2 | POL-2486 | Composite Model |
| 3 | INS-2719 | Composite Review D | suspended | 3 | POL-2492 | Compact Cluster |
| 4 | INS-2720 | Compact Initiative | registered | 4 | POL-2498 | Legacy Review D |

The `financial_institution_insurance_policy_view` answers: "Which insurance policy is associated with which financial institution?" It joins `financial_institutions` to `insurance_policies` and projects the institution's `financial_institution_id`, `institution_identifier`, and `legal_name` alongside the policy's `insurance_policy_id`, `policy_identifier`, and `coverage_limit_u_s_d`. The row linking institution `INS-2717` to policy `POL-2480` (coverage `13.20`) shows the insurance coverage that backs the institution's operations.

**View `financial_institution_regulatory_framework_view`**

```sql
CREATE VIEW financial_institution_regulatory_framework_view AS
SELECT a.financial_institution_id, a.institution_identifier, a.legal_name, a.registration_status, b.id AS framework_id, b.framework_identifier AS framework_framework_identifier, b.issuing_authority AS framework_issuing_authority
FROM financial_institutions a JOIN regulatory_frameworks b ON a.regulatory_framework_id = b.id;
```

| financial_institution_id | institution_identifier | legal_name | registration_status | framework_id | framework_framework_identifier | framework_issuing_authority |
|---|---|---|---|---|---|---|
| 1 | INS-2717 | Adaptive Model | registered | 100 | FRA-2787 | extended-issuing-33 |
| 2 | INS-2718 | Primary Cluster | pending | 101 | FRA-2788 | integrated-issuing-34 |
| 3 | INS-2719 | Composite Review D | suspended | 102 | FRA-2789 | seasonal-issuing-35 |
| 4 | INS-2720 | Compact Initiative | registered | 103 | FRA-2790 | regional-issuing-36 |

The `financial_institution_regulatory_framework_view` answers: "Under which regulatory framework does each financial institution operate?" It joins `financial_institutions` to `regulatory_frameworks` and projects the institution's `financial_institution_id`, `institution_identifier`, and `legal_name` alongside the framework's `id`, `framework_identifier`, and `issuing_authority`. The row linking institution `INS-2717` to framework `FRA-2787` (issued by `extended-issuing-33`) identifies the regulatory regime governing the institution.

**View `financial_institution_audit_report_view`**

```sql
CREATE VIEW financial_institution_audit_report_view AS
SELECT a.financial_institution_id, a.institution_identifier, a.legal_name, a.registration_status, b.id AS report_id, b.report_identifier AS report_report_identifier, b.audit_firm AS report_audit_firm
FROM financial_institutions a JOIN audit_reports b ON a.audit_report_id = b.id;
```

| financial_institution_id | institution_identifier | legal_name | registration_status | report_id | report_report_identifier | report_audit_firm |
|---|---|---|---|---|---|---|
| 1 | INS-2717 | Adaptive Model | registered | 100 | REP-2544 | legacy-audit-85 |
| 2 | INS-2718 | Primary Cluster | pending | 101 | REP-2545 | compact-audit-86 |
| 3 | INS-2719 | Composite Review D | suspended | 102 | REP-2546 | composite-audit-87 |
| 4 | INS-2720 | Compact Initiative | registered | 103 | REP-2547 | primary-audit-88 |

The `financial_institution_audit_report_view` answers: "Which audit report covers which financial institution?" It joins `financial_institutions` to `audit_reports` and projects the institution's `financial_institution_id`, `institution_identifier`, and `legal_name` alongside the audit's `id`, `report_identifier`, and `audit_firm`. The row linking institution `INS-2717` to audit `REP-2544` (conducted by `legacy-audit-85`) identifies the most recent compliance examination of the institution.

**View `regulatory_framework_financial_institution_view`**

```sql
CREATE VIEW regulatory_framework_financial_institution_view AS
SELECT a.id, a.framework_identifier, a.issuing_authority, a.jurisdiction, b.financial_institution_id AS institution_financial_institution_id, b.institution_identifier AS institution_institution_identifier, b.legal_name AS institution_legal_name
FROM regulatory_frameworks a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| id | framework_identifier | issuing_authority | jurisdiction | institution_financial_institution_id | institution_institution_identifier | institution_legal_name |
|---|---|---|---|---|---|---|
| 100 | FRA-2787 | extended-issuing-33 | regional-jurisdic-30 | 1 | INS-2717 | Adaptive Model |
| 101 | FRA-2788 | integrated-issuing-34 | legacy-jurisdic-31 | 2 | INS-2718 | Primary Cluster |
| 102 | FRA-2789 | seasonal-issuing-35 | compact-jurisdic-32 | 3 | INS-2719 | Composite Review D |
| 103 | FRA-2790 | regional-issuing-36 | composite-jurisdic-33 | 4 | INS-2720 | Compact Initiative |

The `regulatory_framework_financial_institution_view` reverses the regulatory perspective: "Which financial institutions are governed by which regulatory framework?" It joins `regulatory_frameworks` to `financial_institutions` and projects the framework's `id`, `framework_identifier`, and `issuing_authority` alongside the institution's `financial_institution_id`, `institution_identifier`, and `legal_name`. The row showing framework `FRA-2787` (issued by `extended-issuing-33`) governing institution `INS-2717` (`Adaptive Model`) lists all institutions subject to that framework.

**View `regulatory_framework_client_asset_portfolio_view`**

```sql
CREATE VIEW regulatory_framework_client_asset_portfolio_view AS
SELECT a.id, a.framework_identifier, a.issuing_authority, a.jurisdiction, b.client_asset_portfolio_id AS portfolio_client_asset_portfolio_id, b.portfolio_identifier AS portfolio_portfolio_identifier, b.total_value_u_s_d AS portfolio_total_value_u_s_d
FROM regulatory_frameworks a JOIN client_asset_portfolios b ON a.client_asset_portfolio_id = b.client_asset_portfolio_id;
```

| id | framework_identifier | issuing_authority | jurisdiction | portfolio_client_asset_portfolio_id | portfolio_portfolio_identifier | portfolio_total_value_u_s_d |
|---|---|---|---|---|---|---|
| 100 | FRA-2787 | extended-issuing-33 | regional-jurisdic-30 | 1 | POR-2268 | 7.20 |
| 101 | FRA-2788 | integrated-issuing-34 | legacy-jurisdic-31 | 2 | POR-2271 | 10.40 |
| 102 | FRA-2789 | seasonal-issuing-35 | compact-jurisdic-32 | 3 | POR-2274 | 13.60 |
| 103 | FRA-2790 | regional-issuing-36 | composite-jurisdic-33 | 4 | POR-2277 | 16.80 |

The `regulatory_framework_client_asset_portfolio_view` answers: "Which portfolios fall under which regulatory framework?" It joins `regulatory_frameworks` to `client_asset_portfolios` and projects the framework's `id`, `framework_identifier`, and `issuing_authority` alongside the portfolio's `client_asset_portfolio_id`, `portfolio_identifier`, and `total_value_u_s_d`. The row linking framework `FRA-2787` to portfolio `POR-2268` (value `7.20`) identifies the portfolios subject to that framework's rules.

**View `audit_report_financial_institution_view`**

```sql
CREATE VIEW audit_report_financial_institution_view AS
SELECT a.id, a.report_identifier, a.audit_firm, a.report_date, b.financial_institution_id AS institution_financial_institution_id, b.institution_identifier AS institution_institution_identifier, b.legal_name AS institution_legal_name
FROM audit_reports a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| id | report_identifier | audit_firm | report_date | institution_financial_institution_id | institution_institution_identifier | institution_legal_name |
|---|---|---|---|---|---|---|
| 100 | REP-2544 | legacy-audit-85 | 2024-03-02 | 1 | INS-2717 | Adaptive Model |
| 101 | REP-2545 | compact-audit-86 | 2025-08-13 | 2 | INS-2718 | Primary Cluster |
| 102 | REP-2546 | composite-audit-87 | 2022-01-24 | 3 | INS-2719 | Composite Review D |
| 103 | REP-2547 | primary-audit-88 | 2023-06-08 | 4 | INS-2720 | Compact Initiative |

The `audit_report_financial_institution_view` answers: "Which financial institution was examined by which audit report?" It joins `audit_reports` to `financial_institutions` and projects the audit's `id`, `report_identifier`, and `audit_firm` alongside the institution's `financial_institution_id`, `institution_identifier`, and `legal_name`. The row showing audit `REP-2544` (by `legacy-audit-85`) examining institution `INS-2717` (`Adaptive Model`) identifies the subject of the audit.

**View `audit_report_client_asset_portfolio_view`**

```sql
CREATE VIEW audit_report_client_asset_portfolio_view AS
SELECT a.id, a.report_identifier, a.audit_firm, a.report_date, b.client_asset_portfolio_id AS portfolio_client_asset_portfolio_id, b.portfolio_identifier AS portfolio_portfolio_identifier, b.total_value_u_s_d AS portfolio_total_value_u_s_d
FROM audit_reports a JOIN client_asset_portfolios b ON a.client_asset_portfolio_id = b.client_asset_portfolio_id;
```

| id | report_identifier | audit_firm | report_date | portfolio_client_asset_portfolio_id | portfolio_portfolio_identifier | portfolio_total_value_u_s_d |
|---|---|---|---|---|---|---|
| 100 | REP-2544 | legacy-audit-85 | 2024-03-02 | 1 | POR-2268 | 7.20 |
| 101 | REP-2545 | compact-audit-86 | 2025-08-13 | 2 | POR-2271 | 10.40 |
| 102 | REP-2546 | composite-audit-87 | 2022-01-24 | 3 | POR-2274 | 13.60 |
| 103 | REP-2547 | primary-audit-88 | 2023-06-08 | 4 | POR-2277 | 16.80 |

The `audit_report_client_asset_portfolio_view` answers: "Which portfolio was examined by which audit report?" It joins `audit_reports` to `client_asset_portfolios` and projects the audit's `id`, `report_identifier`, and `audit_firm` alongside the portfolio's `client_asset_portfolio_id`, `portfolio_identifier`, and `total_value_u_s_d`. The row linking audit `REP-2544` to portfolio `POR-2268` (value `7.20`) shows that the audit's scope extended to the portfolio level.

**View `audit_report_regulatory_framework_view`**

```sql
CREATE VIEW audit_report_regulatory_framework_view AS
SELECT a.id, a.report_identifier, a.audit_firm, a.report_date, b.id AS framework_id, b.framework_identifier AS framework_framework_identifier, b.issuing_authority AS framework_issuing_authority
FROM audit_reports a JOIN regulatory_frameworks b ON a.regulatory_framework_id = b.id;
```

| id | report_identifier | audit_firm | report_date | framework_id | framework_framework_identifier | framework_issuing_authority |
|---|---|---|---|---|---|---|
| 100 | REP-2544 | legacy-audit-85 | 2024-03-02 | 100 | FRA-2787 | extended-issuing-33 |
| 101 | REP-2545 | compact-audit-86 | 2025-08-13 | 101 | FRA-2788 | integrated-issuing-34 |
| 102 | REP-2546 | composite-audit-87 | 2022-01-24 | 102 | FRA-2789 | seasonal-issuing-35 |
| 103 | REP-2547 | primary-audit-88 | 2023-06-08 | 103 | FRA-2790 | regional-issuing-36 |

The `audit_report_regulatory_framework_view` answers: "Under which regulatory framework was each audit conducted?" It joins `audit_reports` to `regulatory_frameworks` and projects the audit's `id`, `report_identifier`, and `audit_firm` alongside the framework's `id`, `framework_identifier`, and `issuing_authority`. The row linking audit `REP-2544` to framework `FRA-2787` (issued by `extended-issuing-33`) identifies the regulatory regime against which the audit's findings were measured.

**View `insurance_underwriter_insurance_policy_view`**

```sql
CREATE VIEW insurance_underwriter_insurance_policy_view AS
SELECT a.id, a.underwriter_identifier, a.legal_name, a.location, b.insurance_policy_id AS policy_insurance_policy_id, b.policy_identifier AS policy_policy_identifier, b.provider_name AS policy_provider_name
FROM insurance_underwriters a JOIN insurance_policies b ON a.insurance_policy_id = b.insurance_policy_id;
```

| id | underwriter_identifier | legal_name | location | policy_insurance_policy_id | policy_policy_identifier | policy_provider_name |
|---|---|---|---|---|---|---|
| 1000 | UND-2760 | Adaptive Model | extended-location-99 | 1 | POL-2480 | Primary Initiative A |
| 1001 | UND-2762 | Primary Cluster | integrated-location-100 | 2 | POL-2486 | Composite Model |
| 1002 | UND-2764 | Composite Review D | seasonal-location-101 | 3 | POL-2492 | Compact Cluster |
| 1003 | UND-2766 | Compact Initiative | regional-location-102 | 4 | POL-2498 | Legacy Review D |

The `insurance_underwriter_insurance_policy_view` answers: "Which policy was issued by which underwriter?" It joins `insurance_underwriters` to `insurance_policies` and projects the underwriter's `id`, `underwriter_identifier`, and `legal_name` alongside the policy's `insurance_policy_id`, `policy_identifier`, and `coverage_limit_u_s_d`. The row linking underwriter `UND-2760` (`Adaptive Model`) to policy `POL-2480` (coverage `13.20`) identifies the issuer of the policy.

**View `insurance_underwriter_rating_agency_view`**

```sql
CREATE VIEW insurance_underwriter_rating_agency_view AS
SELECT a.id, a.underwriter_identifier, a.legal_name, a.location, b.id AS agency_id, b.agency_identifier AS agency_agency_identifier, b.agency_name AS agency_agency_name
FROM insurance_underwriters a JOIN rating_agencies b ON a.rating_agency_id = b.id;
```

| id | underwriter_identifier | legal_name | location | agency_id | agency_agency_identifier | agency_agency_name |
|---|---|---|---|---|---|---|
| 1000 | UND-2760 | Adaptive Model | extended-location-99 | 100 | Hinduja Group | FSG Social Impact Advisors |
| 1001 | UND-2762 | Primary Cluster | integrated-location-100 | 101 | Arcimoto Inc. | Whirlpool Corporation |
| 1002 | UND-2764 | Composite Review D | seasonal-location-101 | 102 | McDonnell Douglas | Education Writers Association |
| 1003 | UND-2766 | Compact Initiative | regional-location-102 | 103 | Sa Proton World International N.V. | Switch Card Services Ltd. |

The `insurance_underwriter_rating_agency_view` answers: "Which rating agency assessed which underwriter?" It joins `insurance_underwriters` to `rating_agencies` and projects the underwriter's `id`, `underwriter_identifier`, and `legal_name` alongside the rating agency's `id`, `rating_agency_name`, and `rating_agency_type`. The row linking underwriter `UND-2760` to its rating agency identifies the source of the credit ratings (`distributed-credit-66` from S&P, `primary-credit-70` from A.M. Best, `regional-credit-18` from Fitch) that appear on the underwriter's row.

**View `rating_agency_insurance_underwriter_view`**

```sql
CREATE VIEW rating_agency_insurance_underwriter_view AS
SELECT a.id, a.agency_identifier, a.agency_name, a.rating_methodology, b.id AS underwriter_id, b.underwriter_identifier AS underwriter_underwriter_identifier, b.legal_name AS underwriter_legal_name
FROM rating_agencies a JOIN insurance_underwriters b ON a.insurance_underwriter_id = b.id;
```

| id | agency_identifier | agency_name | rating_methodology | underwriter_id | underwriter_underwriter_identifier | underwriter_legal_name |
|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | regional-rating-18 | 1000 | UND-2760 | Adaptive Model |
| 101 | Arcimoto Inc. | Whirlpool Corporation | legacy-rating-19 | 1001 | UND-2762 | Primary Cluster |
| 102 | McDonnell Douglas | Education Writers Association | compact-rating-20 | 1002 | UND-2764 | Composite Review D |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | composite-rating-21 | 1003 | UND-2766 | Compact Initiative |

The `rating_agency_insurance_underwriter_view` reverses the rating perspective: "Which underwriters were assessed by which rating agency?" It joins `rating_agencies` to `insurance_underwriters` and projects the rating agency's `id`, `rating_agency_name`, and `rating_agency_type` alongside the underwriter's `id`, `underwriter_identifier`, and `legal_name`. The row showing the rating agency that assessed underwriter `UND-2760` (`Adaptive Model`) lists all underwriters rated by that agency.

**View `rating_agency_financial_institution_view`**

```sql
CREATE VIEW rating_agency_financial_institution_view AS
SELECT a.id, a.agency_identifier, a.agency_name, a.rating_methodology, b.financial_institution_id AS institution_financial_institution_id, b.institution_identifier AS institution_institution_identifier, b.legal_name AS institution_legal_name
FROM rating_agencies a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| id | agency_identifier | agency_name | rating_methodology | institution_financial_institution_id | institution_institution_identifier | institution_legal_name |
|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | regional-rating-18 | 1 | INS-2717 | Adaptive Model |
| 101 | Arcimoto Inc. | Whirlpool Corporation | legacy-rating-19 | 2 | INS-2718 | Primary Cluster |
| 102 | McDonnell Douglas | Education Writers Association | compact-rating-20 | 3 | INS-2719 | Composite Review D |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | composite-rating-21 | 4 | INS-2720 | Compact Initiative |

The `rating_agency_financial_institution_view` answers: "Which financial institutions are rated by which rating agency?" It joins `rating_agencies` to `financial_institutions` and projects the rating agency's `id`, `rating_agency_name`, and `rating_agency_type` alongside the institution's `financial_institution_id`, `institution_identifier`, and `legal_name`. The row linking a rating agency to institution `INS-2717` (`Adaptive Model`) identifies the institutions whose creditworthiness the agency has assessed.

## Synthesis

The schema models the financial oversight domain as a set of seven interrelated entity types, each captured in a normalised table with a surrogate primary key and a mix of descriptive attributes and foreign-key references. The foreign keys are placed symmetrically across tables — a portfolio references its policy, institution, and framework, while each of those entities also references the portfolio back. This bidirectional referencing eliminates the need for junction tables for the core relationships and enables every view to reconstruct a domain fact by joining exactly two tables. The twenty materialised views cover every pairwise relationship between the base tables, each answering a specific question about the connection between two entity types and projecting the most relevant columns as evidence. Together, the tables and views provide a complete, queryable representation of the domain's entity types, their attributes, and the relationships that bind them into a coherent whole.

## Data appendix

**Table `rating_agencies`**

| id | agency_identifier | agency_name | rating_methodology | last_review_date | insurance_underwriter_id | financial_institution_id |
|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | regional-rating-18 | 2022-09-03 | 1000 | 1 |
| 101 | Arcimoto Inc. | Whirlpool Corporation | legacy-rating-19 | 2023-02-14 | 1001 | 2 |
| 102 | McDonnell Douglas | Education Writers Association | compact-rating-20 | 2024-07-25 | 1002 | 3 |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | composite-rating-21 | 2025-12-09 | 1003 | 4 |
