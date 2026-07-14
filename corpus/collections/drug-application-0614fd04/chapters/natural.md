## The Pharmaceutical Supply Chain and Regulatory Framework

The pharmaceutical industry operates within a tightly regulated ecosystem where drug development, manufacturing, distribution, and market access intersect across multiple jurisdictions. At the core of this system are drug applications—formal submissions to regulatory authorities that document the safety, efficacy, and quality of therapeutic products. These applications carry distinct identifiers such as `505997` and `IVC20det40`, and they follow one of several submission pathways: the Abbreviated New Drug Application (ANDA) for generic products, the New Drug Application (NDA) for novel therapeutics, or the Biologics License Application (BLA) for biological products. Each application progresses through a lifecycle that spans filing, review, approval, and potentially withdrawal or transfer, with dates like `2023-02-09` marking the initial submission and `2023-10-10` capturing the regulatory decision. The substances under review—`distributed-drug-48`, `baseline-drug-49`, `pilot-drug-50`, `extended-drug-51`—are paired with specific therapeutic indications, dosage forms, and strength specifications that define their clinical profile.

**Table `drug_applications`**

| drug_application_id | application_id | application_type | drug_substance | approval_status | filing_date | approval_date | therapeutic_indication | dosage_form | strength | regulatory_authority | pharmaceutical_company_id | transferred_from_pharmaceutical_company_id | active_pharmaceutical_ingredient_api_id | geographic_region_id | asset_transfer_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | ANDA | distributed-drug-48 | pending | 2023-02-09T13:15:00 | 2023-10-10T21:27:00 | distributed-therapeu-60 | primary-dosage-40 | seasonal-strength-95 | composite-regulato-99 | 1000 | 1000 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | 1000 | 1 |
| 2 | 1250196 | NDA | baseline-drug-49 | approved | 2024-07-20T20:32:00 | 2024-03-21T04:44:00 | baseline-therapeu-61 | adaptive-dosage-41 | regional-strength-96 | primary-regulato-100 | 1001 | 1001 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | 2 |
| 3 | 124 | BLA | pilot-drug-50 | withdrawn | 2025-12-04T03:49:00 | 2025-08-05T11:01:00 | pilot-therapeu-62 | distributed-dosage-42 | legacy-strength-97 | adaptive-regulato-101 | 1002 | 1002 | 4447008 | 1002 | 3 |
| 4 | IVC20det40 | ANDA | extended-drug-51 | transferred | 2022-05-15T10:06:00 | 2022-01-16T18:18:00 | extended-therapeu-63 | baseline-dosage-43 | compact-strength-98 | distributed-regulato-102 | 1003 | 1003 | 9246330 | 1003 | 4 |

The companies driving these applications are themselves complex entities with corporate structures, manufacturing capabilities, and market presences that extend across borders. Pharmaceutical organizations such as Link Title, Interac Association, Stern Electronics, and Navistar International maintain distinct corporate identities captured through stock tickers like `primary-stock-22` and `adaptive-stock-23`, listed on exchanges ranging from `compact-stock-74` to `adaptive-stock-77`. Their operational profiles include headquarters locations, primary therapeutic focus areas, and manufacturing capacities that scale from 21 to 51 units across the dataset. Each company functions as both an applicant and a recipient in the broader supply chain, with some organizations serving as API suppliers, finished dosage manufacturers, or both. The incorporation status and subsidiary relationships further complicate the organizational landscape, creating a network where pharmaceutical entities interact through application filings, supply agreements, and corporate ownership structures.

**Table `pharmaceutical_companies`**

| pharmaceutical_company_id | company_id | company_name | stock_ticker | stock_exchange | is_incorporated | headquarters_location | primary_therapeutic_area | manufacturing_capacity | api_supplier | finished_dosage_manufacturer | drug_application_id | transfers_application_drug_application_id | receives_application_drug_application_id | active_pharmaceutical_ingredient_api_id | geographic_region_id | has_subsidiary_pharmaceutical_company_id | has_rn_d_location_geographic_region_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Link Title | Feedback Rating | primary-stock-22 | compact-stock-74 | false | composite-headquar-63 | composite-primary-81 | 21 | The Hongkong and Shanghai Banking Corporation Limited | Visa International | 1 | 1 | 1 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | 1000 | 1000 | 1000 |
| 1001 | Interac Association | Virgin Group | adaptive-stock-23 | composite-stock-75 | true | primary-headquar-64 | primary-primary-82 | 31 | Schlumberger Industries Identif d'Encarteur PR050 | Mastercard International | 2 | 2 | 2 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | 1001 | 1001 |
| 1002 | Stern Electronics | United Technologies | distributed-stock-24 | primary-stock-76 | false | adaptive-headquar-65 | adaptive-primary-83 | 41 | General Telephone & Electronics | Grupo Carso | 3 | 3 | 3 | 4447008 | 1002 | 1002 | 1002 |
| 1003 | Navistar International | Link Title | baseline-stock-25 | adaptive-stock-77 | true | distributed-headquar-66 | distributed-primary-84 | 51 | Cristo Rey Network | Feedback Ratings | 4 | 4 | 4 | 9246330 | 1003 | 1003 | 1003 |

At the molecular level, the active pharmaceutical ingredients (APIs) that form the therapeutic foundation of each drug application carry their own technical and regulatory profiles. Baseline Model D, Distributed Cluster, Adaptive Review, and Primary Initiative A represent distinct chemical entities classified under categories such as `compact-chemical-80` and `composite-chemical-81`. Their therapeutic classes—`primary-therapeu-40`, `adaptive-therapeu-41`, `distributed-therapeu-42`, `baseline-therapeu-43`—align with the clinical indications specified in the corresponding drug applications. Physical properties including molecular weights around 0.53 to 0.74, solubility characteristics ranging from `baseline-solubili-55` to `integrated-solubili-58`, and storage conditions like `adaptive-storage-29` through `pilot-storage-32` dictate handling requirements throughout the supply chain. Shelf life spans from 30 to 45 months, and regulatory statuses—approved, investigational, or withdrawn—reflect the current standing of each API within the development pipeline. The first-line therapy designation further distinguishes which APIs serve as primary treatment options versus alternatives.

**Table `active_pharmaceutical_ingredients`**

| api_id | api_name | chemical_class | therapeutic_class | molecular_weight | solubility | storage_condition | shelf_life_months | regulatory_status | first_line_therapy | drug_application_id | pharmaceutical_company_id | supplied_to_pharmaceutical_company_id | disease_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0579699c-8fc7-11eb-924d-9cd76263cbd0 | Baseline Model D | compact-chemical-80 | primary-therapeu-40 | 0.53 | baseline-solubili-55 | adaptive-storage-29 | 30 | approved | false | 1 | 1000 | 1000 | 884351 |
| 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | composite-chemical-81 | adaptive-therapeu-41 | 0.74 | pilot-solubili-56 | distributed-storage-30 | 35 | investigational | true | 2 | 1001 | 1001 | 790478 |
| 4447008 | Adaptive Review | primary-chemical-82 | distributed-therapeu-42 | 0.74 | extended-solubili-57 | baseline-storage-31 | 40 | withdrawn | false | 3 | 1002 | 1002 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 |
| 9246330 | Primary Initiative A | adaptive-chemical-83 | baseline-therapeu-43 | 0.6 | integrated-solubili-58 | pilot-storage-32 | 45 | approved | true | 4 | 1003 | 1003 | state_et_7 |

Geographic regions provide the jurisdictional context in which drug applications are filed, companies operate, and diseases manifest. The dataset encompasses regions classified as countries, states, cities, and markets—Distributed Assessment, Adaptive Survey D, Primary Corridor, and Composite Series—each governed by distinct regulatory authorities such as `composite-regulato-99` and `primary-regulato-100`. Market sizes vary from 0.58 to 1.48, while disease prevalence rates range from 22.45 to 32.80, offering quantitative measures of population health burden. Currency codes, language codes, and time zones such as `extended-time-69` through `regional-time-72` reflect the operational diversity of these jurisdictions. Each region hosts pharmaceutical companies, anchors drug applications, and correlates with disease prevalence, creating a multidimensional map of where therapeutic products are developed, regulated, and deployed.

**Table `geographic_regions`**

| id | region_id | region_name | country_code | region_type | regulatory_authority | market_size | prevalence_rate | currency_code | language_code | time_zone | pharmaceutical_company_id | hosts_rn_d_pharmaceutical_company_id | drug_application_id | disease_id | jurisdiction_for_regulation_drug_application_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | country | composite-regulato-99 | 1.48 | 22.45 | gd_fp_eu_acc3 | 20723567 | extended-time-69 | 1000 | 1000 | 1 | 884351 | 1 |
| 1001 | 4180948 | Adaptive Survey D | lu_tax_code_template_m_I_2 | state | primary-regulato-100 | 1.0 | 25.90 | managing-resources | 32825 | integrated-time-70 | 1001 | 1001 | 2 | 790478 | 2 |
| 1002 | 3012829 | Primary Corridor | default_chart_a_account_57 | city | adaptive-regulato-101 | 0.58 | 29.35 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | b_VB-EC-15 | seasonal-time-71 | 1002 | 1002 | 3 | d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | 3 |
| 1003 | 778576 | Composite Series | 727045 | market | distributed-regulato-102 | 0.9 | 32.80 | 10445649 | 974927 | regional-time-72 | 1003 | 1003 | 4 | state_et_7 | 4 |

Asset transfers represent the commercial transactions through which drug applications, intellectual property, and manufacturing rights change hands between pharmaceutical companies. These transfers are timestamped with dates like `2025-08-12T07:33:00` and carry monetary values such as 4.20, structured through payment arrangements and governed by legal frameworks that specify governing law and confidentiality levels. The transfer lifecycle includes status tracking and effective dates that determine when rights and obligations shift between parties. Each transfer links a sending pharmaceutical company to a receiving entity, connects to a specific drug application, and occurs within a defined geographic jurisdiction. The payment records associated with these transfers document the financial settlement, creating an auditable trail from agreement through execution.

**Table `asset_transfers`**

| id | transfer_id | transfer_date | transfer_value | payment_structure | status | currency | effective_date | expiration_date | governing_law | confidentiality_level | drug_application_id | pharmaceutical_company_id | received_by_pharmaceutical_company_id | geographic_region_id | payment_id | asset_transfer_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4060656 | 2025-08-12T07:33:00 | 4.20 | upfront | negotiated | seasonal-currency-71 | 2023-02-14T13:27:00 | 2025-08-18T19:45:00 | regional-governin-66 | public | 1 | 1000 | 1000 | 1000 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | gd_taxp_st_2_2 | 2022-01-23T14:50:00 | 6.40 | milestone | executed | regional-currency-72 | 2024-07-25T20:44:00 | 2022-01-02T02:02:00 | legacy-governin-67 | restricted | 2 | 1001 | 1001 | 1001 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | 2986222 | 2023-06-07T21:07:00 | 8.60 | royalty | completed | legacy-currency-73 | 2025-12-09T03:01:00 | 2023-06-13T09:19:00 | compact-governin-68 | confidential | 3 | 1002 | 1002 | 1002 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-18T04:24:00 | 10.80 | upfront | terminated | compact-currency-74 | 2022-05-20T10:18:00 | 2024-11-24T16:36:00 | composite-governin-69 | public | 4 | 1003 | 1003 | 1003 | 4 | 4 | 2025-04-16 09:14:00 |

The disease landscape provides the clinical motivation for drug development and application. Diseases such as `884351`, `790478`, `d3c3d00e-8fb2-11eb-924d-9cd76263cbd0`, and `state_et_7` are tracked across geographic regions, with prevalence data informing market sizing and development priorities. The relationship between diseases and active pharmaceutical ingredients reveals which APIs are being developed to address specific therapeutic needs, while the geographic distribution of disease prevalence highlights regions where particular treatments may face the greatest demand.

**Table `diseases`**

| disease_id | disease_name | icd_code | prevalence | incidence | mortality_rate | chronic_status | transmission_route | primary_treatment | global_burden | active_pharmaceutical_ingredient_api_id | geographic_region_id | has_carrier_count_geographic_region_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 884351 | Regional Protocol | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | 20.45 | 21.45 | 3.70 | false | regional-transmis-90 | seasonal-primary-11 | primary-global-76 | 0579699c-8fc7-11eb-924d-9cd76263cbd0 | 1000 | 1000 |
| 790478 | Seasonal Programme D | 4180967 | 24.90 | 25.90 | 7.40 | true | legacy-transmis-91 | regional-primary-12 | adaptive-global-77 | 476b5bc0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | 1001 |
| d3c3d00e-8fb2-11eb-924d-9cd76263cbd0 | Integrated Standard | 974938 | 29.35 | 30.35 | 11.10 | false | compact-transmis-92 | legacy-primary-13 | distributed-global-78 | 4447008 | 1002 | 1002 |
| state_et_7 | Extended Framework | id_25 | 33.80 | 34.80 | 14.80 | true | composite-transmis-93 | compact-primary-14 | baseline-global-79 | 9246330 | 1003 | 1003 |

The view `vw_drug_application_pharmaceutical_company` answers the fundamental question of which pharmaceutical organization is responsible for each drug application. By joining the application records with company data, this view reveals that application `505997` is filed by the entity identified as Link Title, while `1250196` corresponds to Interac Association. The joined result surfaces the company's stock ticker, incorporation status, and manufacturing capacity alongside the application's filing date, approval status, and therapeutic indication, enabling analysts to correlate corporate characteristics with application outcomes.

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

The view `vw_drug_application_active_pharmaceutical_ingredient` maps each drug application to its underlying active ingredient, answering which molecular entity forms the basis of the therapeutic product. Application `505997` links to the API identified as Baseline Model D with chemical class `compact-chemical-80`, while `1250196` connects to Distributed Cluster classified as `composite-chemical-81`. The view surfaces the API's molecular weight, solubility profile, shelf life, and regulatory status alongside the application's dosage form and strength, providing a complete picture of the substance-to-product relationship.

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

The view `vw_drug_application_geographic_region` situates each drug application within its regulatory jurisdiction, answering where the application was filed and under which authority it was reviewed. Application `505997` is associated with the region named Distributed Assessment, governed by `composite-regulato-99`, with a market size of 1.48 and disease prevalence of 22.45. Application `124` (BLA type) maps to Primary Corridor, a city-level jurisdiction with regulatory authority `adaptive-regulato-101`. This view enables cross-jurisdictional analysis of approval timelines and regulatory outcomes.

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

The view `vw_drug_application_asset_transfer` connects drug applications to the commercial transactions that have affected their ownership or rights. Application `505997` is linked to transfer record `4060656`, while `1250196` connects to transfer `2`. The joined result surfaces the transfer date, value, payment structure, and governing law alongside the application's approval status and therapeutic indication, allowing stakeholders to trace how commercial events intersect with regulatory milestones.

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

The view `vw_pharmaceutical_company_drug_application` inverts the perspective, answering which drug applications are associated with each pharmaceutical company. Company Link Title (ID 1000) is linked to application `505997` with ANDA type and pending status, while Interac Association (ID 1001) connects to `1250196` (NDA, approved). This view supports portfolio analysis by aggregating applications under their respective corporate umbrellas and surfacing the distribution of application types, statuses, and filing dates across a company's pipeline.

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

The view `vw_pharmaceutical_company_active_pharmaceutical_ingredient` reveals which active ingredients are associated with each pharmaceutical company, answering the question of which molecular entities each organization develops or supplies. Company 1000 (Link Title) is linked to API Baseline Model D with a 30-month shelf life and approved regulatory status, while company 1001 (Interac Association) connects to Distributed Cluster, classified as investigational with a 35-month shelf life. The view surfaces the API's therapeutic class, molecular weight, and first-line therapy designation alongside the company's primary therapeutic area and manufacturing capacity.

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

The view `vw_pharmaceutical_company_geographic_region` maps pharmaceutical companies to the jurisdictions in which they operate, answering where each organization maintains its presence. Company 1000 (Link Title) is associated with region Distributed Assessment, a country-level jurisdiction with market size 1.48, while company 1003 (Navistar International) maps to Composite Series, classified as a market with prevalence rate 32.80. This view supports geographic portfolio analysis by revealing the regional distribution of corporate operations and their associated market characteristics.

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

The view `vw_pharmaceutical_company_pharmaceutical_company` captures the inter-company relationships within the pharmaceutical ecosystem, answering which organizations have corporate or operational ties to one another. Company 1000 (Link Title) appears linked to company 1000 itself, indicating self-referential relationships that may represent subsidiary structures or internal divisions. Company 1001 (Interac Association) similarly maps to itself, while company 1002 (Stern Electronics) and company 1003 (Navistar International) follow the same pattern. This view surfaces the corporate network topology, revealing how pharmaceutical entities are connected through ownership, supply agreements, or operational dependencies.

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

The view `vw_active_pharmaceutical_ingredient_drug_application` provides the API-centric perspective, answering which drug applications incorporate each active ingredient. API Baseline Model D is linked to application `505997` (ANDA, pending), while Distributed Cluster connects to `1250196` (NDA, approved). The view surfaces the application's filing date, approval date, dosage form, and therapeutic indication alongside the API's chemical class, solubility, and storage conditions, enabling substance-level analysis of development progress.

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

The view `vw_active_pharmaceutical_ingredient_pharmaceutical_company` maps active pharmaceutical ingredients to the companies that develop or supply them, answering which organization is responsible for each molecular entity. API Baseline Model D is supplied by company 1000 (Link Title) and also linked to company 1000 as the receiving entity, indicating a self-supply arrangement. API 9246330 (Primary Initiative A) connects to company 1003 (Navistar International), which operates with a manufacturing capacity of 51 units. This view supports supply chain analysis by revealing the producer-to-product relationships across the API landscape.

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

The view `vw_active_pharmaceutical_ingredient_disease` links active pharmaceutical ingredients to the diseases they are intended to treat, answering which therapeutic targets each API addresses. API Baseline Model D is associated with disease `884351`, while Distributed Cluster connects to `790478`. API 4447008 (Adaptive Review) maps to disease `d3c3d00e-8fb2-11eb-924d-9cd76263cbd0`, and API 9246330 (Primary Initiative A) targets `state_et_7`. The view surfaces the API's therapeutic class, regulatory status, and first-line therapy designation alongside the disease identifier, enabling therapeutic area mapping.

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

The view `vw_geographic_region_pharmaceutical_company` presents the region-centric view of corporate presence, answering which pharmaceutical companies operate within each jurisdiction. Region Distributed Assessment (ID 1000) hosts company 1000 (Link Title), while Adaptive Survey D (ID 1001) hosts company 1001 (Interac Association). The view surfaces the region's market size, prevalence rate, and regulatory authority alongside the company's incorporation status, primary therapeutic area, and manufacturing capacity, supporting regional market analysis.

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

The view `vw_geographic_region_drug_application` situates drug applications within their geographic and regulatory context from the region's perspective, answering which applications are filed in each jurisdiction. Region 1000 (Distributed Assessment) hosts application `505997` (ANDA, pending), while region 1001 (Adaptive Survey D) hosts `1250196` (NDA, approved). Region 1002 (Primary Corridor) contains application `124` (BLA, withdrawn), and region 1003 (Composite Series) contains `IVC20det40` (ANDA, transferred). This view enables regulatory authority comparison and jurisdictional outcome analysis.

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

The view `vw_geographic_region_disease` maps diseases to the geographic regions where they are prevalent, answering where each disease manifests and at what intensity. Region 1000 (Distributed Assessment) is associated with disease `884351` and a prevalence rate of 22.45, while region 1001 (Adaptive Survey D) links to disease `790478` with prevalence 25.90. Region 1002 (Primary Corridor) connects to disease `d3c3d00e-8fb2-11eb-924d-9cd76263cbd0` at prevalence 29.35, and region 1003 (Composite Series) maps to `state_et_7` at prevalence 32.80. This view supports epidemiological analysis and market sizing for therapeutic products.

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

The view `vw_asset_transfer_drug_application` connects asset transfers to the drug applications they affect, answering which applications have been the subject of commercial transactions. Transfer `4060656` is linked to application `505997`, while transfer `2` connects to `1250196`. The view surfaces the transfer's value, payment structure, governing law, and confidentiality level alongside the application's approval status and therapeutic indication, enabling commercial impact analysis.

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

The view `vw_asset_transfer_pharmaceutical_company` reveals the parties involved in each asset transfer, answering which pharmaceutical companies are the sending and receiving entities. Transfer `4060656` involves company 1000 (Link Title) as both sender and receiver, indicating an internal reorganization. Transfer `2` connects company 1001 (Interac Association) in a similar self-referential pattern. The view surfaces the companies' stock tickers, incorporation status, and manufacturing capacities alongside the transfer's effective date, expiration date, and status, supporting transaction analysis.

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

The view `vw_asset_transfer_geographic_region` situates asset transfers within their geographic and legal context, answering where each transfer is governed and under which jurisdiction. Transfer `4060656` is associated with region 1000 (Distributed Assessment), while transfer `2` maps to region 1001 (Adaptive Survey D). The view surfaces the region's regulatory authority, market size, and currency code alongside the transfer's governing law, confidentiality level, and currency, enabling cross-jurisdictional transaction analysis.

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

The view `vw_asset_transfer_payment` links asset transfers to their associated payment records, answering how each commercial transaction is financially settled. Transfer `4060656` is linked to payment record `1`, while transfer `2` connects to payment `2`. The view surfaces the payment's amount, currency, and processing date alongside the transfer's value, payment structure, and status, providing a complete financial picture of the transaction.

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

The view `vw_asset_transfer_asset_transfer` captures relationships between asset transfers, answering whether transfers are connected through cascading transactions or dependency chains. Transfer `4060656` (ID 1) links to itself, while transfer `2` (ID 2) similarly maps to itself, suggesting self-referential transaction records that may represent audit trails or versioned records. This view supports transaction lineage analysis by revealing how transfers relate to one another.

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

The view `vw_payment_asset_transfer` presents the payment-centric perspective, answering which asset transfer each payment record settles. Payment `1` is associated with transfer `4060656`, while payment `2` connects to transfer `2`. The view surfaces the payment's currency, amount, and processing details alongside the transfer's value, date, and status, enabling financial reconciliation and audit trail verification.

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

The view `vw_payment_pharmaceutical_company` links payments to the pharmaceutical companies involved in the underlying transactions, answering which organizations are party to each financial settlement. Payment `1` connects to company 1000 (Link Title), while payment `2` links to company 1001 (Interac Association). The view surfaces the companies' incorporation status, primary therapeutic area, and manufacturing capacity alongside the payment's currency and amount, supporting financial analysis at the corporate level.

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

The view `vw_payment_geographic_region` situates payments within their geographic and regulatory context, answering where each financial transaction is governed. Payment `1` is associated with region 1000 (Distributed Assessment), with currency code `gd_fp_eu_acc3` and time zone `extended-time-69`. Payment `2` maps to region 1001 (Adaptive Survey D), with currency `managing-resources` and time zone `integrated-time-70`. This view supports cross-border financial analysis and regulatory compliance verification.

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

The view `vw_disease_active_pharmaceutical_ingredient` maps diseases to the active pharmaceutical ingredients developed to treat them, answering which APIs are being pursued for each therapeutic target. Disease `884351` is associated with API Baseline Model D, while disease `790478` connects to Distributed Cluster. Disease `d3c3d00e-8fb2-11eb-924d-9cd76263cbd0` links to API 4447008 (Adaptive Review), and disease `state_et_7` targets API 9246330 (Primary Initiative A). The view surfaces the API's therapeutic class, regulatory status, and first-line therapy designation alongside the disease identifier, enabling therapeutic pipeline analysis.

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

The view `vw_disease_geographic_region` maps diseases to the geographic regions where they are most prevalent, answering where each disease manifests and at what intensity. Disease `884351` is associated with region 1000 (Distributed Assessment) with prevalence rate 22.45, while disease `790478` connects to region 1001 (Adaptive Survey D) at prevalence 25.90. Disease `d3c3d00e-8fb2-11eb-924d-9cd76263cbd0` maps to region 1002 (Primary Corridor) at prevalence 29.35, and disease `state_et_7` targets region 1003 (Composite Series) at prevalence 32.80. This view supports epidemiological intelligence and market opportunity assessment.

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

The pharmaceutical domain captured in these records forms an interconnected system where drug applications, corporate entities, molecular ingredients, geographic jurisdictions, commercial transfers, financial settlements, and disease targets all relate to one another through well-defined operational relationships. Each drug application sits at the center of a web of connections—linked to its sponsoring company, its active ingredient, its regulatory jurisdiction, and any asset transfers that have affected its ownership. Pharmaceutical companies serve as hubs, connecting to multiple applications, APIs, regions, and counterparties. Active pharmaceutical ingredients bridge the gap between molecular science and clinical need, while geographic regions provide the regulatory and market context that shapes development strategy. Asset transfers and payments document the commercial transactions that move rights and products through the supply chain, and diseases anchor the entire system to the clinical realities that drive therapeutic development. Together, these records form a comprehensive operational picture of the pharmaceutical industry, capturing the full lifecycle from molecular discovery through regulatory approval, commercial transfer, and market deployment.

## Data appendix

**Table `payments`**

| payment_id | payment_amount | payment_date | payment_type | currency | status | trigger_condition | recipient | payer | tax_withheld | asset_transfer_id | pharmaceutical_company_id | paid_by_pharmaceutical_company_id | geographic_region_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 26.04 | 2024-03-24T14:54:00 | upfront | seasonal-currency-71 | pending | legacy-trigger-49 | legacy-recipien-73 | legacy-payer-91 | false | 1 | 1000 | 1000 | 1000 |
| 2 | 38.08 | 2025-08-08T21:11:00 | milestone | regional-currency-72 | scheduled | compact-trigger-50 | compact-recipien-74 | compact-payer-92 | true | 2 | 1001 | 1001 | 1001 |
| 3 | 13.94 | 2022-01-19T04:28:00 | royalty | legacy-currency-73 | paid | composite-trigger-51 | composite-recipien-75 | composite-payer-93 | false | 3 | 1002 | 1002 | 1002 |
| 4 | 32.21 | 2023-06-03T11:45:00 | equity | compact-currency-74 | overdue | primary-trigger-52 | primary-recipien-76 | primary-payer-94 | true | 4 | 1003 | 1003 | 1003 |
