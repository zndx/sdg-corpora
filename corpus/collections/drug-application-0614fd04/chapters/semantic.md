The pharmaceutical supply chain is a tightly regulated ecosystem where drug applications, active ingredients, manufacturing companies, geographic jurisdictions, and financial transactions intersect. The relational schema captures this ecosystem by normalizing each domain concept into its own table, then linking them through foreign keys that encode the business rules of approval, transfer, and payment. The seven base tables—`drug_applications`, `pharmaceutical_companies`, `active_pharmaceutical_ingredients`, `geographic_regions`, `asset_transfers`, `payments`, and `diseases`—form a star-and-hub topology. Drug applications sit at the centre, referencing companies, APIs, regions, and transfers; pharmaceutical companies reference their own subsidiaries and R&D locations; asset transfers reference payments and chain back to drug applications. The twenty-four materialized views then reassemble these normalised facts into domain-oriented projections, each answering a specific analytical question about the supply chain.

## The Base Tables

The schema begins with `drug_applications`, the central entity that records every regulatory filing. Each row carries a surrogate `drug_application_id` (values such as `1`, `2`, `3`, `4`) alongside a human-readable `application_id` like `505997` or `IVC20det40`. The `application_type` column distinguishes ANDA, NDA, and BLA filings; `approval_status` takes values such as `pending`, `approved`, `withdrawn`, and `transferred`. Temporal attributes `filing_date` and `approval_date` are stored as ISO-8601 timestamps—for instance, row `1` was filed on `2023-02-09T13:15:00` and approved on `2023-10-10T21:27:00`. The `therapeutic_indication` column holds values like `distributed-therapeu-60` and `baseline-therapeu-61`, while `dosage_form` and `strength` capture formulation details such as `primary-dosage-40` and `seasonal-strength-95`. The `regulatory_authority` column stores identifiers like `composite-regulato-99`.

Four foreign keys anchor the application to other domains. `pharmaceutical_company_id` points to the applicant company in `pharmaceutical_companies`—row `1` references company `1000`. `transferred_from_pharmaceutical_company_id` records the prior owner when an application has changed hands, also referencing `pharmaceutical_companies`. `active_pharmaceutical_ingredient_api_id` links to the active ingredient in `active_pharmaceutical_ingredients`, using UUIDs such as `0579699c-8fc7-11eb-924d-9cd76263cbd0` or short integers like `4447008`. `geographic_region_id` and `asset_transfer_id` point to `geographic_regions` and `asset_transfers` respectively, completing the application's contextual envelope.

**Table `drug_applications`**

| drug_application_id | application_id | application_type | drug_substance | approval_status | filing_date | approval_date | therapeutic_indication | dosage_form | strength | regulatory_authority | pharmaceutical_company_id | transferred_from_pharmaceutical_company_id | active_pharmaceutical_ingredient_api_id | geographic_region_id | asset_transfer_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | ANDA | distributed-drug-48 | pending | 2023-02-09T13:15:00 | 2023-10-10T21:27:00 | distributed-therapeu-60 | primary-dosage-40 | seasonal-strength-95 | composite-regulato-99 | 1000 | 1000 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | 1000 | 1 |
| 2 | 1250196 | NDA | baseline-drug-49 | approved | 2024-07-20T20:32:00 | 2024-03-21T04:44:00 | baseline-therapeu-61 | adaptive-dosage-41 | regional-strength-96 | primary-regulato-100 | 1001 | 1001 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | 2 |
| 3 | 124 | BLA | pilot-drug-50 | withdrawn | 2025-12-04T03:49:00 | 2025-08-05T11:01:00 | pilot-therapeu-62 | distributed-dosage-42 | legacy-strength-97 | adaptive-regulato-101 | 1002 | 1002 | 4447008 | 1002 | 3 |
| 4 | IVC20det40 | ANDA | extended-drug-51 | transferred | 2022-05-15T10:06:00 | 2022-01-16T18:18:00 | extended-therapeu-63 | baseline-dosage-43 | compact-strength-98 | distributed-regulato-102 | 1003 | 1003 | 9246330 | 1003 | 4 |

The `pharmaceutical_companies` table stores the corporate actors. Its primary key `pharmaceutical_company_id` uses integer values `1000` through `1003`. The `company_name` column holds names such as `The Hongkong and Shanghai Banking Corporation Limited` and `Schlumberger Industries Identif d'Encarteur PR050`, while `stock_ticker` and `stock_exchange` capture market identifiers like `primary-stock-22` and `compact-stock-74`. The boolean `is_incorporated` distinguishes incorporated from unincorporated entities. `headquarters_location` references a geographic region, `primary_therapeutic_area` describes the company's focus, and `manufacturing_capacity` stores an integer such as `21` or `51`. The `api_supplier` and `finished_dosage_manufacturer` columns hold free-text supplier names.

Three foreign keys reference `drug_applications`—`drug_application_id`, `transfers_application_drug_application_id`, and `receives_application_drug_application_id`—encoding the bidirectional relationship between a company and the applications it files, transfers, or receives. The `active_pharmaceutical_ingredient_api_id` column links the company to an API it produces, while `geographic_region_id` anchors its headquarters. Two self-referential keys, `has_subsidiary_pharmaceutical_company_id` and `has_rn_d_location_geographic_region_id`, model corporate hierarchy and R&D site location respectively, both pointing back to `pharmaceutical_companies` and `geographic_regions`.

**Table `pharmaceutical_companies`**

| pharmaceutical_company_id | company_id | company_name | stock_ticker | stock_exchange | is_incorporated | headquarters_location | primary_therapeutic_area | manufacturing_capacity | api_supplier | finished_dosage_manufacturer | drug_application_id | transfers_application_drug_application_id | receives_application_drug_application_id | active_pharmaceutical_ingredient_api_id | geographic_region_id | has_subsidiary_pharmaceutical_company_id | has_rn_d_location_geographic_region_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Link Title | Feedback Rating | primary-stock-22 | compact-stock-74 | false | composite-headquar-63 | composite-primary-81 | 21 | The Hongkong and Shanghai Banking Corporation Limited | Visa International | 1 | 1 | 1 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | 1000 | 1000 | 1000 |
| 1001 | Interac Association | Virgin Group | adaptive-stock-23 | composite-stock-75 | true | primary-headquar-64 | primary-primary-82 | 31 | Schlumberger Industries Identif d'Encarteur PR050 | Mastercard International | 2 | 2 | 2 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | 1001 | 1001 |
| 1002 | Stern Electronics | United Technologies | distributed-stock-24 | primary-stock-76 | false | adaptive-headquar-65 | adaptive-primary-83 | 41 | General Telephone & Electronics | Grupo Carso | 3 | 3 | 3 | 4447008 | 1002 | 1002 | 1002 |
| 1003 | Navistar International | Link Title | baseline-stock-25 | adaptive-stock-77 | true | distributed-headquar-66 | distributed-primary-84 | 51 | Cristo Rey Network | Feedback Ratings | 4 | 4 | 4 | 9246330 | 1003 | 1003 | 1003 |

Active ingredients are captured in `active_pharmaceutical_ingredients`. The primary key `api_id` is a UUID or short integer, for example `0579699c-8fc7-11eb-924d-9cd76263cbd0` or `9246330`. The `api_name` column holds descriptive names such as `Baseline Model D` and `Distributed Cluster`. Scientific attributes include `chemical_class` (e.g., `compact-chemical-80`), `therapeutic_class` (e.g., `primary-therapeu-40`), `molecular_weight` (a decimal like `0.53` or `0.74`), and `solubility` (values like `baseline-solubili-55`). Storage and shelf-life attributes—`storage_condition`, `shelf_life_months` (ranging from `30` to `45`), and `regulatory_status` (`approved`, `investigational`, `withdrawn`)—round out the scientific profile. The boolean `first_line_therapy` indicates whether the API is a first-line treatment.

Three foreign keys connect APIs to the rest of the schema: `drug_application_id` links to the application that uses the ingredient, `pharmaceutical_company_id` identifies the producing company, and `supplied_to_pharmaceutical_company_id` records the recipient company, creating a supplier-to-customer relationship within the same table. The `disease_id` column points to `diseases`, establishing the therapeutic target.

**Table `active_pharmaceutical_ingredients`**

| api_id | api_name | chemical_class | therapeutic_class | molecular_weight | solubility | storage_condition | shelf_life_months | regulatory_status | first_line_therapy | drug_application_id | pharmaceutical_company_id | supplied_to_pharmaceutical_company_id | disease_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0579699c-8fc7-11eb-924d-9cd76263cbd0 | Baseline Model D | compact-chemical-80 | primary-therapeu-40 | 0.53 | baseline-solubili-55 | adaptive-storage-29 | 30 | approved | false | 1 | 1000 | 1000 | 884351 |
| 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | composite-chemical-81 | adaptive-therapeu-41 | 0.74 | pilot-solubili-56 | distributed-storage-30 | 35 | investigational | true | 2 | 1001 | 1001 | 790478 |
| 4447008 | Adaptive Review | primary-chemical-82 | distributed-therapeu-42 | 0.74 | extended-solubili-57 | baseline-storage-31 | 40 | withdrawn | false | 3 | 1002 | 1002 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 |
| 9246330 | Primary Initiative A | adaptive-chemical-83 | baseline-therapeu-43 | 0.6 | integrated-solubili-58 | pilot-storage-32 | 45 | approved | true | 4 | 1003 | 1003 | state_et_7 |

Geographic jurisdiction is modelled in `geographic_regions`. The surrogate key `id` uses integers `1000`–`1003`, while the business key `region_id` carries UUIDs like `46d49f56-8fcc-11eb-924d-9cd76263cbd0` or short codes such as `4180948`. The `region_name` column holds values like `Distributed Assessment` and `Adaptive Survey D`. The `country_code` column stores identifiers, `region_type` classifies the region as `country`, `state`, `city`, or `market`, and `regulatory_authority` references the governing body. Numeric columns `market_size` (e.g., `1.48`, `0.58`) and `prevalence_rate` (e.g., `22.45`, `32.80`) capture economic and epidemiological context. Currency, language, and time-zone codes—`currency_code`, `language_code`, `time_zone`—round out the regional profile.

Five foreign keys anchor the region to other entities: `pharmaceutical_company_id` and `hosts_rn_d_pharmaceutical_company_id` link to companies, `drug_application_id` and `jurisdiction_for_regulation_drug_application_id` link to applications, and `disease_id` links to diseases. This allows a single region to serve as headquarters, R&D site, regulatory jurisdiction, and disease prevalence zone simultaneously.

**Table `geographic_regions`**

| id | region_id | region_name | country_code | region_type | regulatory_authority | market_size | prevalence_rate | currency_code | language_code | time_zone | pharmaceutical_company_id | hosts_rn_d_pharmaceutical_company_id | drug_application_id | disease_id | jurisdiction_for_regulation_drug_application_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | country | composite-regulato-99 | 1.48 | 22.45 | gd_fp_eu_acc3 | 20723567 | extended-time-69 | 1000 | 1000 | 1 | 884351 | 1 |
| 1001 | 4180948 | Adaptive Survey D | lu_tax_code_template_m_I_2 | state | primary-regulato-100 | 1.0 | 25.90 | managing-resources | 32825 | integrated-time-70 | 1001 | 1001 | 2 | 790478 | 2 |
| 1002 | 3012829 | Primary Corridor | default_chart_a_account_57 | city | adaptive-regulato-101 | 0.58 | 29.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | b_VB-EC-15 | seasonal-time-71 | 1002 | 1002 | 3 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | 3 |
| 1003 | 778576 | Composite Series | 727045 | market | distributed-regulato-102 | 0.9 | 32.80 | 10445649 | 974927 | regional-time-72 | 1003 | 1003 | 4 | state_et_7 | 4 |

Asset transfers are recorded in `asset_transfers`. The surrogate key `id` is an integer (`1`–`4`), while `transfer_id` carries business identifiers like `4060656`. The `transfer_date` column stores timestamps such as `2025-08-12T07:33:00`. The `transfer_value` column holds a decimal amount, and `payment_structure` describes the financial arrangement. The `status` column captures the transfer state, while `currency` specifies the monetary unit. Temporal columns `effective_date` and `expiration_date` define the transfer window, and `governing_law` and `confidentiality_level` capture legal terms.

Four foreign keys link transfers to their context: `drug_application_id` identifies the application being transferred, `pharmaceutical_company_id` and `received_by_pharmaceutical_company_id` identify the sender and recipient companies (both referencing `pharmaceutical_companies`), and `geographic_region_id` identifies the jurisdiction. The `payment_id` column links to `payments`, and the self-referential `asset_transfer_id` column allows chaining of sequential transfers.

**Table `asset_transfers`**

| id | transfer_id | transfer_date | transfer_value | payment_structure | status | currency | effective_date | expiration_date | governing_law | confidentiality_level | drug_application_id | pharmaceutical_company_id | received_by_pharmaceutical_company_id | geographic_region_id | payment_id | asset_transfer_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4060656 | 2025-08-12T07:33:00 | 4.20 | upfront | negotiated | seasonal-currency-71 | 2023-02-14T13:27:00 | 2025-08-18T19:45:00 | regional-governin-66 | public | 1 | 1000 | 1000 | 1000 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 | 6.40 | milestone | executed | regional-currency-72 | 2024-07-25T20:44:00 | 2022-01-02T02:02:00 | legacy-governin-67 | restricted | 2 | 1001 | 1001 | 1001 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | 2986222 | 2023-06-07T21:07:00 | 8.60 | royalty | completed | legacy-currency-73 | 2025-12-09T03:01:00 | 2023-06-13T09:19:00 | compact-governin-68 | confidential | 3 | 1002 | 1002 | 1002 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 | 10.80 | upfront | terminated | compact-currency-74 | 2022-05-20T10:18:00 | 2024-11-24T16:36:00 | composite-governin-69 | public | 4 | 1003 | 1003 | 1003 | 4 | 4 | 2025-04-16 09:14:00 |

Payments are stored in `payments`. The primary key `payment_id` carries identifiers such as `1`, `2`, `3`, `4`. The `payment_date` column records when the payment was made, `payment_amount` stores the monetary value, and `payment_method` describes how the payment was executed. The `status` column captures the payment state. The `asset_transfer_id` foreign key links the payment to its originating transfer, while `pharmaceutical_company_id` and `geographic_region_id` identify the paying company and the region of transaction respectively.

**Table `payments`**

| payment_id | payment_amount | payment_date | payment_type | currency | status | trigger_condition | recipient | payer | tax_withheld | asset_transfer_id | pharmaceutical_company_id | paid_by_pharmaceutical_company_id | geographic_region_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 26.04 | 2024-03-24T14:54:00 | upfront | seasonal-currency-71 | pending | legacy-trigger-49 | legacy-recipien-73 | legacy-payer-91 | false | 1 | 1000 | 1000 | 1000 |
| 2 | 38.08 | 2025-08-08T21:11:00 | milestone | regional-currency-72 | scheduled | compact-trigger-50 | compact-recipien-74 | compact-payer-92 | true | 2 | 1001 | 1001 | 1001 |
| 3 | 13.94 | 2022-01-19T04:28:00 | royalty | legacy-currency-73 | paid | composite-trigger-51 | composite-recipien-75 | composite-payer-93 | false | 3 | 1002 | 1002 | 1002 |
| 4 | 32.21 | 2023-06-03T11:45:00 | equity | compact-currency-74 | overdue | primary-trigger-52 | primary-recipien-76 | primary-payer-94 | true | 4 | 1003 | 1003 | 1003 |

Diseases are captured in `diseases`. The primary key `disease_id` holds values such as `884351`, `790478`, `d3c3d00e-8fb2-11eb-924d-9cd76263cbd0`, and `state_et_7`. The `disease_name` column stores descriptive names, while `disease_category` classifies the disease type. The `prevalence_rate` column holds a decimal prevalence figure, and `is_infectious` is a boolean flag. The `active_pharmaceutical_ingredient_api_id` foreign key links the disease to its target API, and `geographic_region_id` anchors the disease to a region.

**Table `diseases`**

| disease_id | disease_name | icd_code | prevalence | incidence | mortality_rate | chronic_status | transmission_route | primary_treatment | global_burden | active_pharmaceutical_ingredient_api_id | geographic_region_id | has_carrier_count_geographic_region_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 884351 | Regional Protocol | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | 20.45 | 21.45 | 3.70 | false | regional-transmis-90 | seasonal-primary-11 | primary-global-76 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | 1000 | 1000 |
| 790478 | Seasonal Programme D | 4180967 | 24.90 | 25.90 | 7.40 | true | legacy-transmis-91 | regional-primary-12 | adaptive-global-77 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | 1001 |
| d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | Integrated Standard | 974938 | 29.35 | 30.35 | 11.10 | false | compact-transmis-92 | legacy-primary-13 | distributed-global-78 | 4447008 | 1002 | 1002 |
| state_et_7 | Extended Framework | id_25 | 33.80 | 34.80 | 14.80 | true | composite-transmis-93 | compact-primary-14 | baseline-global-79 | 9246330 | 1003 | 1003 |

## Materialized Views

The views reassemble the normalised tables into domain-oriented projections. Each view is a `SELECT` with explicit `JOIN` clauses that reconstruct a business fact from its constituent tables.

The view `vw_drug_application_pharmaceutical_company` joins `drug_applications` to `pharmaceutical_companies` on `drug_applications.pharmaceutical_company_id = pharmaceutical_companies.pharmaceutical_company_id`. It answers the question: "Which company filed which drug application?" Row `1` shows that company `1000` (with name `The Hongkong and Shanghai Banking Corporation Limited`) filed application `505997` of type `ANDA` with status `pending`.

**View `vw_drug_application_pharmaceutical_company`**

```sql
CREATE VIEW vw_drug_application_pharmaceutical_company AS
SELECT a.drug_application_id, a.application_id, a.application_type, a.drug_substance, b.pharmaceutical_company_id AS company_pharmaceutical_company_id, b.company_id AS company_company_id, b.company_name AS company_company_name
FROM drug_applications a JOIN pharmaceutical_companies b ON a.pharmaceutical_company_id = b.pharmaceutical_company_id;
```

| drug_application_id | application_id | application_type | drug_substance | company_pharmaceutical_company_id | company_company_id | company_company_name |
|---|---|---|---|---|---|---|
| 1 | 505997 | ANDA | distributed-drug-48 | 1000 | Link Title | Feedback Rating |
| 2 | 1250196 | NDA | baseline-drug-49 | 1001 | Interac Association | Virgin Group |
| 3 | 124 | BLA | pilot-drug-50 | 1002 | Stern Electronics | United Technologies |
| 4 | IVC20det40 | ANDA | extended-drug-51 | 1003 | Navistar International | Link Title |

The view `vw_drug_application_active_pharmaceutical_ingredient` joins `drug_applications` to `active_pharmaceutical_ingredients` on `drug_applications.active_pharmaceutical_ingredient_api_id = active_pharmaceutical_ingredients.api_id`. It answers: "Which active ingredient is used in which application?" Row `1` links application `505997` to API `0579699c-8fc7-11eb-924d-9cd76263cbd0` (named `Baseline Model D`, chemical class `compact-chemical-80`, molecular weight `0.53`).

**View `vw_drug_application_active_pharmaceutical_ingredient`**

```sql
CREATE VIEW vw_drug_application_active_pharmaceutical_ingredient AS
SELECT a.drug_application_id, a.application_id, a.application_type, a.drug_substance, b.api_id AS ingredient_api_id, b.api_name AS ingredient_api_name, b.chemical_class AS ingredient_chemical_class
FROM drug_applications a JOIN active_pharmaceutical_ingredients b ON a.active_pharmaceutical_ingredient_api_id = b.api_id;
```

| drug_application_id | application_id | application_type | drug_substance | ingredient_api_id | ingredient_api_name | ingredient_chemical_class |
|---|---|---|---|---|---|---|
| 1 | 505997 | ANDA | distributed-drug-48 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | Baseline Model D | compact-chemical-80 |
| 2 | 1250196 | NDA | baseline-drug-49 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | composite-chemical-81 |
| 3 | 124 | BLA | pilot-drug-50 | 4447008 | Adaptive Review | primary-chemical-82 |
| 4 | IVC20det40 | ANDA | extended-drug-51 | 9246330 | Primary Initiative A | adaptive-chemical-83 |

The view `vw_drug_application_geographic_region` joins `drug_applications` to `geographic_regions` on `drug_applications.geographic_region_id = geographic_regions.id`. It answers: "In which region is each application filed?" Row `1` associates application `505997` with region `Distributed Assessment` (type `country`, market size `1.48`, prevalence rate `22.45`).

**View `vw_drug_application_geographic_region`**

```sql
CREATE VIEW vw_drug_application_geographic_region AS
SELECT a.drug_application_id, a.application_id, a.application_type, a.drug_substance, b.id AS region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM drug_applications a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| drug_application_id | application_id | application_type | drug_substance | region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1 | 505997 | ANDA | distributed-drug-48 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 2 | 1250196 | NDA | baseline-drug-49 | 1001 | 4180948 | Adaptive Survey D |
| 3 | 124 | BLA | pilot-drug-50 | 1002 | 3012829 | Primary Corridor |
| 4 | IVC20det40 | ANDA | extended-drug-51 | 1003 | 778576 | Composite Series |

The view `vw_drug_application_asset_transfer` joins `drug_applications` to `asset_transfers` on `drug_applications.asset_transfer_id = asset_transfers.id`. It answers: "Which asset transfer is associated with which application?" Row `1` links application `505997` to transfer `4060656` dated `2025-08-12T07:33:00` with value `4.20`.

**View `vw_drug_application_asset_transfer`**

```sql
CREATE VIEW vw_drug_application_asset_transfer AS
SELECT a.drug_application_id, a.application_id, a.application_type, a.drug_substance, b.id AS transfer_id, b.transfer_id AS transfer_transfer_id, b.transfer_date AS transfer_transfer_date
FROM drug_applications a JOIN asset_transfers b ON a.asset_transfer_id = b.id;
```

| drug_application_id | application_id | application_type | drug_substance | transfer_id | transfer_transfer_id | transfer_transfer_date |
|---|---|---|---|---|---|---|
| 1 | 505997 | ANDA | distributed-drug-48 | 1 | 4060656 | 2025-08-12T07:33:00 |
| 2 | 1250196 | NDA | baseline-drug-49 | 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 |
| 3 | 124 | BLA | pilot-drug-50 | 3 | 2986222 | 2023-06-07T21:07:00 |
| 4 | IVC20det40 | ANDA | extended-drug-51 | 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 |

The view `vw_pharmaceutical_company_drug_application` joins `pharmaceutical_companies` to `drug_applications` on `pharmaceutical_companies.drug_application_id = drug_applications.drug_application_id`. It answers the inverse question: "Which applications does each company file?" Row `1000` (company `The Hongkong and Shanghai Banking Corporation Limited`) filed application `505997` (type `ANDA`, status `pending`).

**View `vw_pharmaceutical_company_drug_application`**

```sql
CREATE VIEW vw_pharmaceutical_company_drug_application AS
SELECT a.pharmaceutical_company_id, a.company_id, a.company_name, a.stock_ticker, b.drug_application_id AS application_drug_application_id, b.application_id AS application_application_id, b.application_type AS application_application_type
FROM pharmaceutical_companies a JOIN drug_applications b ON a.drug_application_id = b.drug_application_id;
```

| pharmaceutical_company_id | company_id | company_name | stock_ticker | application_drug_application_id | application_application_id | application_application_type |
|---|---|---|---|---|---|---|
| 1000 | Link Title | Feedback Rating | primary-stock-22 | 1 | 505997 | ANDA |
| 1001 | Interac Association | Virgin Group | adaptive-stock-23 | 2 | 1250196 | NDA |
| 1002 | Stern Electronics | United Technologies | distributed-stock-24 | 3 | 124 | BLA |
| 1003 | Navistar International | Link Title | baseline-stock-25 | 4 | IVC20det40 | ANDA |

The view `vw_pharmaceutical_company_active_pharmaceutical_ingredient` joins `pharmaceutical_companies` to `active_pharmaceutical_ingredients` on `pharmaceutical_companies.active_pharmaceutical_ingredient_api_id = active_pharmaceutical_ingredients.api_id`. It answers: "Which APIs does each company produce?" Row `1000` produces API `0579699c-8fc7-11eb-924d-9cd76263cbd0` (`Baseline Model D`, therapeutic class `primary-therapeu-40`, shelf life `30` months).

**View `vw_pharmaceutical_company_active_pharmaceutical_ingredient`**

```sql
CREATE VIEW vw_pharmaceutical_company_active_pharmaceutical_ingredient AS
SELECT a.pharmaceutical_company_id, a.company_id, a.company_name, a.stock_ticker, b.api_id AS ingredient_api_id, b.api_name AS ingredient_api_name, b.chemical_class AS ingredient_chemical_class
FROM pharmaceutical_companies a JOIN active_pharmaceutical_ingredients b ON a.active_pharmaceutical_ingredient_api_id = b.api_id;
```

| pharmaceutical_company_id | company_id | company_name | stock_ticker | ingredient_api_id | ingredient_api_name | ingredient_chemical_class |
|---|---|---|---|---|---|---|
| 1000 | Link Title | Feedback Rating | primary-stock-22 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | Baseline Model D | compact-chemical-80 |
| 1001 | Interac Association | Virgin Group | adaptive-stock-23 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | composite-chemical-81 |
| 1002 | Stern Electronics | United Technologies | distributed-stock-24 | 4447008 | Adaptive Review | primary-chemical-82 |
| 1003 | Navistar International | Link Title | baseline-stock-25 | 9246330 | Primary Initiative A | adaptive-chemical-83 |

The view `vw_pharmaceutical_company_geographic_region` joins `pharmaceutical_companies` to `geographic_regions` on `pharmaceutical_companies.geographic_region_id = geographic_regions.id`. It answers: "Where is each company headquartered?" Row `1000` is headquartered in region `Distributed Assessment` (type `country`, currency code `gd_fp_eu_acc3`).

**View `vw_pharmaceutical_company_geographic_region`**

```sql
CREATE VIEW vw_pharmaceutical_company_geographic_region AS
SELECT a.pharmaceutical_company_id, a.company_id, a.company_name, a.stock_ticker, b.id AS region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM pharmaceutical_companies a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| pharmaceutical_company_id | company_id | company_name | stock_ticker | region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1000 | Link Title | Feedback Rating | primary-stock-22 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 1001 | Interac Association | Virgin Group | adaptive-stock-23 | 1001 | 4180948 | Adaptive Survey D |
| 1002 | Stern Electronics | United Technologies | distributed-stock-24 | 1002 | 3012829 | Primary Corridor |
| 1003 | Navistar International | Link Title | baseline-stock-25 | 1003 | 778576 | Composite Series |

The view `vw_pharmaceutical_company_pharmaceutical_company` joins `pharmaceutical_companies` to itself on `pharmaceutical_companies.has_subsidiary_pharmaceutical_company_id = pharmaceutical_companies.pharmaceutical_company_id`. It answers: "Which companies are subsidiaries of which parent?" Row `1000` has subsidiary `1000` (self-referential in this sample), indicating the corporate hierarchy.

**View `vw_pharmaceutical_company_pharmaceutical_company`**

```sql
CREATE VIEW vw_pharmaceutical_company_pharmaceutical_company AS
SELECT a.pharmaceutical_company_id, a.company_id, a.company_name, a.stock_ticker, b.pharmaceutical_company_id AS company_pharmaceutical_company_id, b.company_id AS company_company_id, b.company_name AS company_company_name
FROM pharmaceutical_companies a JOIN pharmaceutical_companies b ON a.has_subsidiary_pharmaceutical_company_id = b.pharmaceutical_company_id;
```

| pharmaceutical_company_id | company_id | company_name | stock_ticker | company_pharmaceutical_company_id | company_company_id | company_company_name |
|---|---|---|---|---|---|---|
| 1000 | Link Title | Feedback Rating | primary-stock-22 | 1000 | Link Title | Feedback Rating |
| 1001 | Interac Association | Virgin Group | adaptive-stock-23 | 1001 | Interac Association | Virgin Group |
| 1002 | Stern Electronics | United Technologies | distributed-stock-24 | 1002 | Stern Electronics | United Technologies |
| 1003 | Navistar International | Link Title | baseline-stock-25 | 1003 | Navistar International | Link Title |

The view `vw_active_pharmaceutical_ingredient_drug_application` joins `active_pharmaceutical_ingredients` to `drug_applications` on `active_pharmaceutical_ingredients.drug_application_id = drug_applications.drug_application_id`. It answers: "Which applications use each API?" Row `0579699c-8fc7-11eb-924d-9cd76263cbd0` (`Baseline Model D`) is used in application `505997` (type `ANDA`, status `pending`).

**View `vw_active_pharmaceutical_ingredient_drug_application`**

```sql
CREATE VIEW vw_active_pharmaceutical_ingredient_drug_application AS
SELECT a.api_id, a.api_name, a.chemical_class, a.therapeutic_class, b.drug_application_id AS application_drug_application_id, b.application_id AS application_application_id, b.application_type AS application_application_type
FROM active_pharmaceutical_ingredients a JOIN drug_applications b ON a.drug_application_id = b.drug_application_id;
```

| api_id | api_name | chemical_class | therapeutic_class | application_drug_application_id | application_application_id | application_application_type |
|---|---|---|---|---|---|---|
| 0579699c-8fc7-11eb-924d-9cd76263cbd0 | Baseline Model D | compact-chemical-80 | primary-therapeu-40 | 1 | 505997 | ANDA |
| 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | composite-chemical-81 | adaptive-therapeu-41 | 2 | 1250196 | NDA |
| 4447008 | Adaptive Review | primary-chemical-82 | distributed-therapeu-42 | 3 | 124 | BLA |
| 9246330 | Primary Initiative A | adaptive-chemical-83 | baseline-therapeu-43 | 4 | IVC20det40 | ANDA |

The view `vw_active_pharmaceutical_ingredient_pharmaceutical_company` joins `active_pharmaceutical_ingredients` to `pharmaceutical_companies` on `active_pharmaceutical_ingredients.pharmaceutical_company_id = pharmaceutical_companies.pharmaceutical_company_id`. It answers: "Which company produces each API?" Row `0579699c-8fc7-11eb-924d-9cd76263cbd0` is produced by company `1000` (`The Hongkong and Shanghai Banking Corporation Limited`).

**View `vw_active_pharmaceutical_ingredient_pharmaceutical_company`**

```sql
CREATE VIEW vw_active_pharmaceutical_ingredient_pharmaceutical_company AS
SELECT a.api_id, a.api_name, a.chemical_class, a.therapeutic_class, b.pharmaceutical_company_id AS company_pharmaceutical_company_id, b.company_id AS company_company_id, b.company_name AS company_company_name
FROM active_pharmaceutical_ingredients a JOIN pharmaceutical_companies b ON a.pharmaceutical_company_id = b.pharmaceutical_company_id;
```

| api_id | api_name | chemical_class | therapeutic_class | company_pharmaceutical_company_id | company_company_id | company_company_name |
|---|---|---|---|---|---|---|
| 0579699c-8fc7-11eb-924d-9cd76263cbd0 | Baseline Model D | compact-chemical-80 | primary-therapeu-40 | 1000 | Link Title | Feedback Rating |
| 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | composite-chemical-81 | adaptive-therapeu-41 | 1001 | Interac Association | Virgin Group |
| 4447008 | Adaptive Review | primary-chemical-82 | distributed-therapeu-42 | 1002 | Stern Electronics | United Technologies |
| 9246330 | Primary Initiative A | adaptive-chemical-83 | baseline-therapeu-43 | 1003 | Navistar International | Link Title |

The view `vw_active_pharmaceutical_ingredient_disease` joins `active_pharmaceutical_ingredients` to `diseases` on `active_pharmaceutical_ingredients.disease_id = diseases.disease_id`. It answers: "Which disease does each API target?" Row `0579699c-8fc7-11eb-924d-9cd76263cbd0` targets disease `884351`.

**View `vw_active_pharmaceutical_ingredient_disease`**

```sql
CREATE VIEW vw_active_pharmaceutical_ingredient_disease AS
SELECT a.api_id, a.api_name, a.chemical_class, a.therapeutic_class, b.disease_id AS disease_disease_id, b.disease_name AS disease_disease_name, b.icd_code AS disease_icd_code
FROM active_pharmaceutical_ingredients a JOIN diseases b ON a.disease_id = b.disease_id;
```

| api_id | api_name | chemical_class | therapeutic_class | disease_disease_id | disease_disease_name | disease_icd_code |
|---|---|---|---|---|---|---|
| 0579699c-8fc7-11eb-924d-9cd76263cbd0 | Baseline Model D | compact-chemical-80 | primary-therapeu-40 | 884351 | Regional Protocol | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 |
| 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | composite-chemical-81 | adaptive-therapeu-41 | 790478 | Seasonal Programme D | 4180967 |
| 4447008 | Adaptive Review | primary-chemical-82 | distributed-therapeu-42 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | Integrated Standard | 974938 |
| 9246330 | Primary Initiative A | adaptive-chemical-83 | baseline-therapeu-43 | state_et_7 | Extended Framework | id_25 |

The view `vw_geographic_region_pharmaceutical_company` joins `geographic_regions` to `pharmaceutical_companies` on `geographic_regions.pharmaceutical_company_id = pharmaceutical_companies.pharmaceutical_company_id`. It answers: "Which companies operate in which region?" Row `1000` (region `Distributed Assessment`) hosts company `1000` (`The Hongkong and Shanghai Banking Corporation Limited`).

**View `vw_geographic_region_pharmaceutical_company`**

```sql
CREATE VIEW vw_geographic_region_pharmaceutical_company AS
SELECT a.id, a.region_id, a.region_name, a.country_code, b.pharmaceutical_company_id AS company_pharmaceutical_company_id, b.company_id AS company_company_id, b.company_name AS company_company_name
FROM geographic_regions a JOIN pharmaceutical_companies b ON a.pharmaceutical_company_id = b.pharmaceutical_company_id;
```

| id | region_id | region_name | country_code | company_pharmaceutical_company_id | company_company_id | company_company_name |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | Link Title | Feedback Rating |
| 1001 | 4180948 | Adaptive Survey D | lu_tax_code_template_m_I_2 | 1001 | Interac Association | Virgin Group |
| 1002 | 3012829 | Primary Corridor | default_chart_a_account_57 | 1002 | Stern Electronics | United Technologies |
| 1003 | 778576 | Composite Series | 727045 | 1003 | Navistar International | Link Title |

The view `vw_geographic_region_drug_application` joins `geographic_regions` to `drug_applications` on `geographic_regions.drug_application_id = drug_applications.drug_application_id`. It answers: "Which applications are filed in which region?" Row `1000` (region `Distributed Assessment`) hosts application `505997` (type `ANDA`, status `pending`).

**View `vw_geographic_region_drug_application`**

```sql
CREATE VIEW vw_geographic_region_drug_application AS
SELECT a.id, a.region_id, a.region_name, a.country_code, b.drug_application_id AS application_drug_application_id, b.application_id AS application_application_id, b.application_type AS application_application_type
FROM geographic_regions a JOIN drug_applications b ON a.drug_application_id = b.drug_application_id;
```

| id | region_id | region_name | country_code | application_drug_application_id | application_application_id | application_application_type |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1 | 505997 | ANDA |
| 1001 | 4180948 | Adaptive Survey D | lu_tax_code_template_m_I_2 | 2 | 1250196 | NDA |
| 1002 | 3012829 | Primary Corridor | default_chart_a_account_57 | 3 | 124 | BLA |
| 1003 | 778576 | Composite Series | 727045 | 4 | IVC20det40 | ANDA |

The view `vw_geographic_region_disease` joins `geographic_regions` to `diseases` on `geographic_regions.disease_id = diseases.disease_id`. It answers: "Which diseases are prevalent in which region?" Row `1000` (region `Distributed Assessment`, prevalence rate `22.45`) hosts disease `884351`.

**View `vw_geographic_region_disease`**

```sql
CREATE VIEW vw_geographic_region_disease AS
SELECT a.id, a.region_id, a.region_name, a.country_code, b.disease_id AS disease_disease_id, b.disease_name AS disease_disease_name, b.icd_code AS disease_icd_code
FROM geographic_regions a JOIN diseases b ON a.disease_id = b.disease_id;
```

| id | region_id | region_name | country_code | disease_disease_id | disease_disease_name | disease_icd_code |
|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 884351 | Regional Protocol | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 |
| 1001 | 4180948 | Adaptive Survey D | lu_tax_code_template_m_I_2 | 790478 | Seasonal Programme D | 4180967 |
| 1002 | 3012829 | Primary Corridor | default_chart_a_account_57 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | Integrated Standard | 974938 |
| 1003 | 778576 | Composite Series | 727045 | state_et_7 | Extended Framework | id_25 |

The view `vw_asset_transfer_drug_application` joins `asset_transfers` to `drug_applications` on `asset_transfers.drug_application_id = drug_applications.drug_application_id`. It answers: "Which application is being transferred?" Row `1` (transfer `4060656`, value `4.20`) transfers application `505997` (type `ANDA`, status `pending`).

**View `vw_asset_transfer_drug_application`**

```sql
CREATE VIEW vw_asset_transfer_drug_application AS
SELECT a.id, a.transfer_id, a.transfer_date, a.transfer_value, b.drug_application_id AS application_drug_application_id, b.application_id AS application_application_id, b.application_type AS application_application_type
FROM asset_transfers a JOIN drug_applications b ON a.drug_application_id = b.drug_application_id;
```

| id | transfer_id | transfer_date | transfer_value | application_drug_application_id | application_application_id | application_application_type |
|---|---|---|---|---|---|---|
| 1 | 4060656 | 2025-08-12T07:33:00 | 4.20 | 1 | 505997 | ANDA |
| 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 | 6.40 | 2 | 1250196 | NDA |
| 3 | 2986222 | 2023-06-07T21:07:00 | 8.60 | 3 | 124 | BLA |
| 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 | 10.80 | 4 | IVC20det40 | ANDA |

The view `vw_asset_transfer_pharmaceutical_company` joins `asset_transfers` to `pharmaceutical_companies` on `asset_transfers.pharmaceutical_company_id = pharmaceutical_companies.pharmaceutical_company_id`. It answers: "Which company initiates each transfer?" Row `1` (transfer `4060656`) is initiated by company `1000` (`The Hongkong and Shanghai Banking Corporation Limited`).

**View `vw_asset_transfer_pharmaceutical_company`**

```sql
CREATE VIEW vw_asset_transfer_pharmaceutical_company AS
SELECT a.id, a.transfer_id, a.transfer_date, a.transfer_value, b.pharmaceutical_company_id AS company_pharmaceutical_company_id, b.company_id AS company_company_id, b.company_name AS company_company_name
FROM asset_transfers a JOIN pharmaceutical_companies b ON a.pharmaceutical_company_id = b.pharmaceutical_company_id;
```

| id | transfer_id | transfer_date | transfer_value | company_pharmaceutical_company_id | company_company_id | company_company_name |
|---|---|---|---|---|---|---|
| 1 | 4060656 | 2025-08-12T07:33:00 | 4.20 | 1000 | Link Title | Feedback Rating |
| 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 | 6.40 | 1001 | Interac Association | Virgin Group |
| 3 | 2986222 | 2023-06-07T21:07:00 | 8.60 | 1002 | Stern Electronics | United Technologies |
| 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 | 10.80 | 1003 | Navistar International | Link Title |

The view `vw_asset_transfer_geographic_region` joins `asset_transfers` to `geographic_regions` on `asset_transfers.geographic_region_id = geographic_regions.id`. It answers: "In which region does each transfer occur?" Row `1` (transfer `4060656`) occurs in region `Distributed Assessment` (type `country`, market size `1.48`).

**View `vw_asset_transfer_geographic_region`**

```sql
CREATE VIEW vw_asset_transfer_geographic_region AS
SELECT a.id, a.transfer_id, a.transfer_date, a.transfer_value, b.id AS region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM asset_transfers a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| id | transfer_id | transfer_date | transfer_value | region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1 | 4060656 | 2025-08-12T07:33:00 | 4.20 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 | 6.40 | 1001 | 4180948 | Adaptive Survey D |
| 3 | 2986222 | 2023-06-07T21:07:00 | 8.60 | 1002 | 3012829 | Primary Corridor |
| 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 | 10.80 | 1003 | 778576 | Composite Series |

The view `vw_asset_transfer_payment` joins `asset_transfers` to `payments` on `asset_transfers.payment_id = payments.payment_id`. It answers: "Which payment settles each transfer?" Row `1` (transfer `4060656`, value `4.20`) is settled by payment `1`.

**View `vw_asset_transfer_payment`**

```sql
CREATE VIEW vw_asset_transfer_payment AS
SELECT a.id, a.transfer_id, a.transfer_date, a.transfer_value, b.payment_id AS payment_payment_id, b.payment_amount AS payment_payment_amount, b.payment_date AS payment_payment_date
FROM asset_transfers a JOIN payments b ON a.payment_id = b.payment_id;
```

| id | transfer_id | transfer_date | transfer_value | payment_payment_id | payment_payment_amount | payment_payment_date |
|---|---|---|---|---|---|---|
| 1 | 4060656 | 2025-08-12T07:33:00 | 4.20 | 1 | 26.04 | 2024-03-24T14:54:00 |
| 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 | 6.40 | 2 | 38.08 | 2025-08-08T21:11:00 |
| 3 | 2986222 | 2023-06-07T21:07:00 | 8.60 | 3 | 13.94 | 2022-01-19T04:28:00 |
| 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 | 10.80 | 4 | 32.21 | 2023-06-03T11:45:00 |

The view `vw_asset_transfer_asset_transfer` joins `asset_transfers` to itself on `asset_transfers.asset_transfer_id = asset_transfers.id`. It answers: "Which transfers are chained to which prior transfers?" Row `1` chains to transfer `1`, indicating a self-referential chain in this sample.

**View `vw_asset_transfer_asset_transfer`**

```sql
CREATE VIEW vw_asset_transfer_asset_transfer AS
SELECT a.id, a.transfer_id, a.transfer_date, a.transfer_value, b.id AS transfer_id, b.transfer_id AS transfer_transfer_id, b.transfer_date AS transfer_transfer_date
FROM asset_transfers a JOIN asset_transfers b ON a.asset_transfer_id = b.id;
```

| id | transfer_id | transfer_date | transfer_value | transfer_id | transfer_transfer_id | transfer_transfer_date |
|---|---|---|---|---|---|---|
| 1 | 4060656 | 2025-08-12T07:33:00 | 4.20 | 1 | 4060656 | 2025-08-12T07:33:00 |
| 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 | 6.40 | 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 |
| 3 | 2986222 | 2023-06-07T21:07:00 | 8.60 | 3 | 2986222 | 2023-06-07T21:07:00 |
| 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 | 10.80 | 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 |

The view `vw_payment_asset_transfer` joins `payments` to `asset_transfers` on `payments.asset_transfer_id = asset_transfers.id`. It answers: "Which transfer does each payment settle?" Row `1` (payment `1`) settles transfer `4060656` (value `4.20`, status `pending`).

**View `vw_payment_asset_transfer`**

```sql
CREATE VIEW vw_payment_asset_transfer AS
SELECT a.payment_id, a.payment_amount, a.payment_date, a.payment_type, b.id AS transfer_id, b.transfer_id AS transfer_transfer_id, b.transfer_date AS transfer_transfer_date
FROM payments a JOIN asset_transfers b ON a.asset_transfer_id = b.id;
```

| payment_id | payment_amount | payment_date | payment_type | transfer_id | transfer_transfer_id | transfer_transfer_date |
|---|---|---|---|---|---|---|
| 1 | 26.04 | 2024-03-24T14:54:00 | upfront | 1 | 4060656 | 2025-08-12T07:33:00 |
| 2 | 38.08 | 2025-08-08T21:11:00 | milestone | 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 |
| 3 | 13.94 | 2022-01-19T04:28:00 | royalty | 3 | 2986222 | 2023-06-07T21:07:00 |
| 4 | 32.21 | 2023-06-03T11:45:00 | equity | 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 |

The view `vw_payment_pharmaceutical_company` joins `payments` to `pharmaceutical_companies` on `payments.pharmaceutical_company_id = pharmaceutical_companies.pharmaceutical_company_id`. It answers: "Which company makes each payment?" Row `1` (payment `1`) is made by company `1000` (`The Hongkong and Shanghai Banking Corporation Limited`).

**View `vw_payment_pharmaceutical_company`**

```sql
CREATE VIEW vw_payment_pharmaceutical_company AS
SELECT a.payment_id, a.payment_amount, a.payment_date, a.payment_type, b.pharmaceutical_company_id AS company_pharmaceutical_company_id, b.company_id AS company_company_id, b.company_name AS company_company_name
FROM payments a JOIN pharmaceutical_companies b ON a.pharmaceutical_company_id = b.pharmaceutical_company_id;
```

| payment_id | payment_amount | payment_date | payment_type | company_pharmaceutical_company_id | company_company_id | company_company_name |
|---|---|---|---|---|---|---|
| 1 | 26.04 | 2024-03-24T14:54:00 | upfront | 1000 | Link Title | Feedback Rating |
| 2 | 38.08 | 2025-08-08T21:11:00 | milestone | 1001 | Interac Association | Virgin Group |
| 3 | 13.94 | 2022-01-19T04:28:00 | royalty | 1002 | Stern Electronics | United Technologies |
| 4 | 32.21 | 2023-06-03T11:45:00 | equity | 1003 | Navistar International | Link Title |

The view `vw_payment_geographic_region` joins `payments` to `geographic_regions` on `payments.geographic_region_id = geographic_regions.id`. It answers: "In which region does each payment occur?" Row `1` (payment `1`) occurs in region `Distributed Assessment` (type `country`, currency code `gd_fp_eu_acc3`).

**View `vw_payment_geographic_region`**

```sql
CREATE VIEW vw_payment_geographic_region AS
SELECT a.payment_id, a.payment_amount, a.payment_date, a.payment_type, b.id AS region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM payments a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| payment_id | payment_amount | payment_date | payment_type | region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1 | 26.04 | 2024-03-24T14:54:00 | upfront | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 2 | 38.08 | 2025-08-08T21:11:00 | milestone | 1001 | 4180948 | Adaptive Survey D |
| 3 | 13.94 | 2022-01-19T04:28:00 | royalty | 1002 | 3012829 | Primary Corridor |
| 4 | 32.21 | 2023-06-03T11:45:00 | equity | 1003 | 778576 | Composite Series |

The view `vw_disease_active_pharmaceutical_ingredient` joins `diseases` to `active_pharmaceutical_ingredients` on `diseases.active_pharmaceutical_ingredient_api_id = active_pharmaceutical_ingredients.api_id`. It answers: "Which API targets each disease?" Row `884351` (disease `884351`) is targeted by API `0579699c-8fc7-11eb-924d-9cd76263cbd0` (`Baseline Model D`, therapeutic class `primary-therapeu-40`).

**View `vw_disease_active_pharmaceutical_ingredient`**

```sql
CREATE VIEW vw_disease_active_pharmaceutical_ingredient AS
SELECT a.disease_id, a.disease_name, a.icd_code, a.prevalence, b.api_id AS ingredient_api_id, b.api_name AS ingredient_api_name, b.chemical_class AS ingredient_chemical_class
FROM diseases a JOIN active_pharmaceutical_ingredients b ON a.active_pharmaceutical_ingredient_api_id = b.api_id;
```

| disease_id | disease_name | icd_code | prevalence | ingredient_api_id | ingredient_api_name | ingredient_chemical_class |
|---|---|---|---|---|---|---|
| 884351 | Regional Protocol | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | 20.45 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | Baseline Model D | compact-chemical-80 |
| 790478 | Seasonal Programme D | 4180967 | 24.90 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | composite-chemical-81 |
| d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | Integrated Standard | 974938 | 29.35 | 4447008 | Adaptive Review | primary-chemical-82 |
| state_et_7 | Extended Framework | id_25 | 33.80 | 9246330 | Primary Initiative A | adaptive-chemical-83 |

The view `vw_disease_geographic_region` joins `diseases` to `geographic_regions` on `diseases.geographic_region_id = geographic_regions.id`. It answers: "In which region is each disease prevalent?" Row `884351` (disease `884351`) is prevalent in region `Distributed Assessment` (prevalence rate `22.45`, market size `1.48`).

**View `vw_disease_geographic_region`**

```sql
CREATE VIEW vw_disease_geographic_region AS
SELECT a.disease_id, a.disease_name, a.icd_code, a.prevalence, b.id AS region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM diseases a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| disease_id | disease_name | icd_code | prevalence | region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 884351 | Regional Protocol | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | 20.45 | 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 790478 | Seasonal Programme D | 4180967 | 24.90 | 1001 | 4180948 | Adaptive Survey D |
| d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | Integrated Standard | 974938 | 29.35 | 1002 | 3012829 | Primary Corridor |
| state_et_7 | Extended Framework | id_25 | 33.80 | 1003 | 778576 | Composite Series |

## Synthesis

The schema models the pharmaceutical supply chain as a network of seven normalised tables linked by foreign keys that encode regulatory, corporate, and financial relationships. Drug applications sit at the centre, referencing the applicant company, the active ingredient, the geographic region, and the asset transfer. Pharmaceutical companies reference their subsidiaries, R&D locations, and the applications they file or receive. Active ingredients reference their producing and receiving companies and their target diseases. Geographic regions serve as hubs for companies, applications, and diseases. Asset transfers reference their originating and receiving companies, their jurisdiction, and their settlement payments. Payments reference their originating transfer, company, and region.

The twenty-four views reassemble these normalised facts into domain-oriented projections. Each view performs a single join (or self-join) that reconstructs a business fact from its constituent tables. The drug-application-centric views answer questions about applications and their attributes; the pharmaceutical-company-centric views answer questions about companies and their activities; the API-centric views answer questions about ingredients and their targets; the geographic-region-centric views answer questions about jurisdictions and their stakeholders; the asset-transfer-centric views answer questions about transfers and their financial settlement; and the disease-centric views answer questions about diseases and their therapeutic targets. Together, the base tables and views provide a complete, queryable model of the pharmaceutical supply chain.