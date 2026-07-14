## The Architecture of Regional Economic Development Finance

Economic development finance operates as a layered ecosystem in which public and quasi-public institutions channel capital toward small enterprises, underserved geographies, and infrastructure that sustains long-term growth. The records in this reference describe a coordinated network of capital access programs, economic development banks, financial development corporations, institutional lenders, small businesses, underserved communities, and infrastructure projects. Each entity carries measurable attributes—financed amounts, guarantee ceilings, employment commitments, and deployment statuses—that together form a traceable audit trail from policy intent to on-the-ground impact. Understanding how these entities relate requires examining both the standalone records and the joined perspectives that reveal multi-party relationships.

**Table `capital_access_programs`**

| capital_access_program_id | program_identifier | program_name | established_date | total_financed_amount | max_guarantee_amount | program_status | target_jurisdiction | economic_development_bank_id | financial_development_corporation_id | small_business_id | underserved_community_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2024-03-27T14:30:00 | 25,211 | 2,996 | active | seasonal-target-11 | 1 | 1 | 1 | 1 |
| 101 | PRO-2205 | Pilot Initiative A | 2025-08-11T21:47:00 | 27,602 | 161,744 | inactive | regional-target-12 | 2 | 2 | 2 | 2 |
| 102 | PRO-2212 | Baseline Model | 2022-01-22T04:04:00 | 11,121 | 45,650 | pending | legacy-target-13 | 3 | 3 | 3 | 3 |
| 103 | PRO-2219 | Distributed Cluster | 2023-06-06T11:21:00 | 233.57 | 8,753 | active | compact-target-14 | 4 | 4 | 4 | 4 |

Capital access programs serve as the primary funding instruments through which development capital is allocated. Each program carries a unique identifier such as `PRO-2198` or `PRO-2205`, a descriptive name like "Extended Review" or "Pilot Initiative A," and an establishment date that anchors it in a policy timeline. The `total_financed_amount` column records the cumulative dollars committed to the program, ranging from modest allocations like 233.57 for the "Distributed Cluster" program (`PRO-2219`) to larger commitments exceeding 27,000 for "Pilot Initiative A" (`PRO-2205`). The `max_guarantee_amount` defines the ceiling on individual guarantees, while `program_status` tracks whether a program is `active`, `inactive`, or `pending`. The `target_jurisdiction` field classifies the geographic or demographic scope—values such as `seasonal-target-11` and `regional-target-12` indicate the program's intended reach. Critically, each capital access program is linked to an economic development bank, a financial development corporation, a small business, and an underserved community, establishing the foundational four-way relationship that underpins the entire financing architecture.

**Table `economic_development_banks`**

| economic_development_bank_id | bank_identifier | bank_name | founding_year | governing_office | total_financed_amount | bond_issuance_authority | jurisdiction | financial_development_corporation_id | infrastructure_project_id | small_business_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | BAN-2796 | Compact Initiative | 43 | seasonal-governin-29 | 25,211 | false | regional-jurisdic-30 | 1 | 100 | 1 |
| 2 | BAN-2798 | Legacy Model | 48 | regional-governin-30 | 27,602 | true | legacy-jurisdic-31 | 2 | 101 | 2 |
| 3 | BAN-2800 | Regional Cluster A | 53 | legacy-governin-31 | 11,121 | false | compact-jurisdic-32 | 3 | 102 | 3 |
| 4 | BAN-2802 | Seasonal Review | 58 | compact-governin-32 | 233.57 | true | composite-jurisdic-33 | 4 | 103 | 4 |

Economic development banks function as the institutional engines that originate and manage development capital. The bank identified as `BAN-2796` ("Compact Initiative") was established 43 years ago and operates under the `seasonal-governin-29` governing office, while `BAN-2802` ("Seasonal Review"), at 58 years old, carries `bond_issuance_authority: true`, indicating its capacity to raise debt on capital markets. The `total_financed_amount` for each bank mirrors the financed amounts of its associated capital access programs, confirming that banks act as the primary custodians of program-level capital. The `jurisdiction` column—values like `regional-jurisdic-30` and `composite-jurisdic-33`—defines the geographic footprint of each bank's operations. Each bank is further connected to a financial development corporation, an infrastructure project, and a small business, creating a triad of institutional, infrastructural, and enterprise relationships.

**Table `financial_development_corporations`**

| financial_development_corporation_id | fdc_identifier | fdc_name | establishment_date | public_dollars_leveraged | total_guarantee_issuance | deployment_status | jurisdiction | capital_access_program_id | institutional_lender_id | underserved_community_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | FDC-2618 | Distributed Assessment | 2024-07-11T06:18:00 | 18.70 | 15.45 | active | regional-jurisdic-30 | 100 | 1 | 1 |
| 2 | FDC-2623 | Adaptive Survey D | 2025-12-22T13:35:00 | 20.40 | 19.90 | inactive | legacy-jurisdic-31 | 101 | 2 | 2 |
| 3 | FDC-2628 | Primary Corridor | 2022-05-06T20:52:00 | 22.10 | 24.35 | pending | compact-jurisdic-32 | 102 | 3 | 3 |
| 4 | FDC-2633 | Composite Series | 2023-10-17T03:09:00 | 23.80 | 28.80 | active | composite-jurisdic-33 | 103 | 4 | 4 |

Financial development corporations (FDCs) operate as the leverage mechanisms that multiply public investment through guaranteed exposure. The FDC `FDC-2618` ("Distributed Assessment"), established on 2024-07-11, has leveraged 18.70 in public dollars against a total guarantee issuance of 15.45, producing a leverage ratio slightly below one-to-one. By contrast, `FDC-2633` ("Composite Series"), established in 2023, shows a leverage of 23.80 against guarantee issuance of 28.80, indicating a more aggressive deployment posture. The `deployment_status` field—`active`, `inactive`, or `pending`—tracks operational readiness, while `jurisdiction` values such as `regional-jurisdic-30` and `composite-jurisdic-33` align with the geographic scope of the banks and programs they support. Each FDC is tied to a capital access program, an institutional lender, and an underserved community, forming the critical bridge between institutional capital and community-level deployment.

**Table `small_businesses`**

| id | business_identifier | business_name | industry_sector | employee_count | job_creation_commitment | employee_retention_commitment | tax_base_impact | capital_access_program_id | financial_development_corporation_id | underserved_community_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | BUS-2254 | Baseline Protocol D | seasonal-industry-35 | 131 | 31 | Shelby Patterson | 9.95 | 100 | 1 | 1 |
| 2 | BUS-2255 | Distributed Programme | regional-industry-36 | 428 | 38 | Kimberly Maynard | 12.90 | 101 | 2 | 2 |
| 3 | BUS-2256 | Adaptive Standard | legacy-industry-37 | 3 | 45 | Lori Evans | 15.85 | 102 | 3 | 3 |
| 4 | BUS-2257 | Primary Framework A | compact-industry-38 | 9 | 52 | Sean Green | 18.80 | 103 | 4 | 4 |

Small businesses represent the ultimate recipients of development capital within this ecosystem. The enterprise `BUS-2254` ("Baseline Protocol D") operates in `seasonal-industry-35`, employs 131 workers, and has committed to creating 31 additional jobs while retaining the workforce under the `Shelby Patterson` retention framework, with an estimated tax base impact of 9.95. Larger operations such as `BUS-2255` ("Distributed Programme") employ 428 workers and carry a job creation commitment of 38. The `capital_access_program_id`, `financial_development_corporation_id`, and `underserved_community_id` columns anchor each business within the broader financing network, confirming that no enterprise operates in isolation from the institutional and geographic structures designed to support it.

**Table `underserved_communities`**

| underserved_community_id | community_identifier | community_name | geographic_boundary | population_density | median_income | access_level | targeted_status | small_business_id | capital_access_program_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | COM-2792 | Primary Initiative A | compact-geograph-14 | 15.70 | 47.66 | low | false | 1 | 100 |
| 2 | COM-2799 | Composite Model | composite-geograph-15 | 19.40 | 14.31 | medium | true | 2 | 101 |
| 3 | COM-2806 | Compact Cluster | primary-geograph-16 | 23.10 | 26.25 | high | false | 3 | 102 |
| 4 | COM-2813 | Legacy Review D | adaptive-geograph-17 | 26.80 | 14.31 | low | true | 4 | 103 |

Underserved communities provide the geographic and socioeconomic context for capital deployment. Community `COM-2792` ("Primary Initiative A") occupies the `compact-geograph-14` boundary, reports a population density of 15.70, and has a median income of 47.66, with `access_level: low` and `targeted_status: false`. In contrast, `COM-2799` ("Composite Model") shows a median income of only 14.31, `access_level: medium`, and `targeted_status: true`, marking it as a priority for intervention. The `small_business_id` and `capital_access_program_id` columns link each community to the enterprises and programs operating within its boundaries, enabling precise tracking of capital flows into and through disadvantaged areas.

**Table `infrastructure_projects`**

| id | project_identifier | project_name | project_type | total_cost | financed_amount | start_date | completion_date | project_status | economic_development_bank_id | underserved_community_id | small_business_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | PRO-2058 | Compact Survey | public | 61.82 | 33.06 | 2022-09-05T20:24:00 | 2024-03-14T02:06:00 | planning | 1 | 1 | 1 |
| 101 | PRO-2059 | Legacy Corridor | private | 89.53 | 17.12 | 2023-02-16T03:41:00 | 2025-08-25T09:23:00 | active | 2 | 2 | 2 |
| 102 | PRO-2060 | Regional Series A | mixed | 29.24 | 18.47 | 2024-07-27T10:58:00 | 2022-01-09T16:40:00 | completed | 3 | 3 | 3 |
| 103 | PRO-2061 | Seasonal Assessment | public | 13.94 | 37.54 | 2025-12-11T17:15:00 | 2023-06-20T23:57:00 | cancelled | 4 | 4 | 4 |

Infrastructure projects constitute the physical backbone that small businesses and communities depend upon. The project `PRO-2058` ("Compact Survey") is classified as `public`, carries a total cost of 61.82 with 33.06 financed, and is currently in the `planning` phase, spanning from 2022-09-05 to 2024-03-14. The project `PRO-2061` ("Seasonal Assessment"), also `public`, shows a total cost of 13.94 with 37.54 financed—a financed amount exceeding total cost, which may indicate supplemental funding or reclassification—and carries a `cancelled` status. Project types range from `public` and `private` to `mixed`, and each project is linked to an economic development bank, an underserved community, and a small business, ensuring that infrastructure investment is coordinated with both institutional oversight and community benefit.

**Table `institutional_lenders`**

| institutional_lender_id | lender_identifier | lender_name | lender_type | total_capital_deployed | risk_tolerance | jurisdiction | financial_development_corporation_id | capital_access_program_id |
|---|---|---|---|---|---|---|---|---|
| 1 | LEN-2543 | Composite Cluster | commercial_bank | 13.20 | low | regional-jurisdic-30 | 1 | 100 |
| 2 | LEN-2546 | Compact Review A | credit_union | 17.40 | medium | legacy-jurisdic-31 | 2 | 101 |
| 3 | LEN-2549 | Legacy Initiative | cdfi | 21.60 | high | compact-jurisdic-32 | 3 | 102 |
| 4 | LEN-2552 | Regional Model | non_bank | 25.80 | low | composite-jurisdic-33 | 4 | 103 |

Institutional lenders provide the debt and equity capital that financial development corporations leverage and guarantee. While the base records for lenders are sparse in the standalone table, their presence is confirmed through the relational links in the FDC and small business tables. Each lender is associated with a financial development corporation, a small business, and a capital access program, positioning them as the upstream source of funds that flow through FDC guarantee structures into program-level disbursements.

**Table `banks_programs`**

| economic_development_bank_id | capital_access_program_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `banks_programs` junction table formalizes the many-to-many relationships between economic development banks and capital access programs. This intermediary record ensures that a single bank can sponsor multiple programs and that a program can draw from multiple banks, reflecting the flexible allocation mechanisms that characterize modern development finance.

**Table `corporations_businesses`**

| financial_development_corporation_id | small_business_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `corporations_businesses` junction table captures the relationships between financial development corporations and small businesses. This linkage documents which FDCs have extended guarantees or direct support to which enterprises, providing an auditable chain of responsibility from corporate guarantee to business-level deployment.

**Table `lenders_businesses`**

| institutional_lender_id | small_business_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `lenders_businesses` junction table records the direct relationships between institutional lenders and small businesses. These records document which lenders have provided financing to which enterprises, independent of FDC guarantee structures, enabling a complete picture of capital sources available to a given business.

### Capital Access Programs in Multi-Party Context

**View `v_capital_access_program_economic_development_bank`**

```sql
CREATE VIEW v_capital_access_program_economic_development_bank AS
SELECT a.capital_access_program_id, a.program_identifier, a.program_name, a.established_date, b.economic_development_bank_id AS bank_economic_development_bank_id, b.bank_identifier AS bank_bank_identifier, b.bank_name AS bank_bank_name
FROM capital_access_programs a JOIN economic_development_banks b ON a.economic_development_bank_id = b.economic_development_bank_id;
```

| capital_access_program_id | program_identifier | program_name | established_date | bank_economic_development_bank_id | bank_bank_identifier | bank_bank_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2024-03-27T14:30:00 | 1 | BAN-2796 | Compact Initiative |
| 101 | PRO-2205 | Pilot Initiative A | 2025-08-11T21:47:00 | 2 | BAN-2798 | Legacy Model |
| 102 | PRO-2212 | Baseline Model | 2022-01-22T04:04:00 | 3 | BAN-2800 | Regional Cluster A |
| 103 | PRO-2219 | Distributed Cluster | 2023-06-06T11:21:00 | 4 | BAN-2802 | Seasonal Review |

This view joins capital access programs with their sponsoring economic development banks, answering the question of which institution is responsible for each program's execution. The row for program `PRO-2198` ("Extended Review") links to bank `BAN-2796` ("Compact Initiative"), confirming that the Compact Initiative is the operational custodian of the Extended Review program. The row for `PRO-2219` ("Distributed Cluster") connects to bank `BAN-2802` ("Seasonal Review"), illustrating how banks with bond issuance authority can manage programs with modest financed amounts.

**View `v_capital_access_program_financial_development_corporation`**

```sql
CREATE VIEW v_capital_access_program_financial_development_corporation AS
SELECT a.capital_access_program_id, a.program_identifier, a.program_name, a.established_date, b.financial_development_corporation_id AS corporation_financial_development_corporation_id, b.fdc_identifier AS corporation_fdc_identifier, b.fdc_name AS corporation_fdc_name
FROM capital_access_programs a JOIN financial_development_corporations b ON a.financial_development_corporation_id = b.financial_development_corporation_id;
```

| capital_access_program_id | program_identifier | program_name | established_date | corporation_financial_development_corporation_id | corporation_fdc_identifier | corporation_fdc_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2024-03-27T14:30:00 | 1 | FDC-2618 | Distributed Assessment |
| 101 | PRO-2205 | Pilot Initiative A | 2025-08-11T21:47:00 | 2 | FDC-2623 | Adaptive Survey D |
| 102 | PRO-2212 | Baseline Model | 2022-01-22T04:04:00 | 3 | FDC-2628 | Primary Corridor |
| 103 | PRO-2219 | Distributed Cluster | 2023-06-06T11:21:00 | 4 | FDC-2633 | Composite Series |

By joining capital access programs with financial development corporations, this view reveals which FDC is responsible for guaranteeing exposure under each program. Program `PRO-2198` maps to FDC `FDC-2618` ("Distributed Assessment"), while `PRO-2219` maps to FDC `FDC-2633` ("Composite Series"). The leverage figures in the FDC records—18.70 and 23.80 respectively—indicate the scale of public dollar multiplication each FDC brings to its assigned program.

**View `v_capital_access_program_small_business`**

```sql
CREATE VIEW v_capital_access_program_small_business AS
SELECT a.capital_access_program_id, a.program_identifier, a.program_name, a.established_date, b.id AS business_id, b.business_identifier AS business_business_identifier, b.business_name AS business_business_name
FROM capital_access_programs a JOIN small_businesses b ON a.small_business_id = b.id;
```

| capital_access_program_id | program_identifier | program_name | established_date | business_id | business_business_identifier | business_business_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2024-03-27T14:30:00 | 1 | BUS-2254 | Baseline Protocol D |
| 101 | PRO-2205 | Pilot Initiative A | 2025-08-11T21:47:00 | 2 | BUS-2255 | Distributed Programme |
| 102 | PRO-2212 | Baseline Model | 2022-01-22T04:04:00 | 3 | BUS-2256 | Adaptive Standard |
| 103 | PRO-2219 | Distributed Cluster | 2023-06-06T11:21:00 | 4 | BUS-2257 | Primary Framework A |

This view connects capital access programs directly to the small businesses they fund, answering which enterprises benefit from each program's financing. Program `PRO-2198` supports business `BUS-2254` ("Baseline Protocol D"), which employs 131 workers and carries a tax base impact of 9.95. Program `PRO-2212` ("Baseline Model") supports `BUS-2256` ("Adaptive Standard"), a smaller operation with only 3 employees but a job creation commitment of 45, suggesting a focus on high-impact, lean enterprises.

**View `v_capital_access_program_underserved_community`**

```sql
CREATE VIEW v_capital_access_program_underserved_community AS
SELECT a.capital_access_program_id, a.program_identifier, a.program_name, a.established_date, b.underserved_community_id AS community_underserved_community_id, b.community_identifier AS community_community_identifier, b.community_name AS community_community_name
FROM capital_access_programs a JOIN underserved_communities b ON a.underserved_community_id = b.underserved_community_id;
```

| capital_access_program_id | program_identifier | program_name | established_date | community_underserved_community_id | community_community_identifier | community_community_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2024-03-27T14:30:00 | 1 | COM-2792 | Primary Initiative A |
| 101 | PRO-2205 | Pilot Initiative A | 2025-08-11T21:47:00 | 2 | COM-2799 | Composite Model |
| 102 | PRO-2212 | Baseline Model | 2022-01-22T04:04:00 | 3 | COM-2806 | Compact Cluster |
| 103 | PRO-2219 | Distributed Cluster | 2023-06-06T11:21:00 | 4 | COM-2813 | Legacy Review D |

The linkage between capital access programs and underserved communities identifies which geographic areas are the intended beneficiaries of each program. Program `PRO-2198` targets community `COM-2792` ("Primary Initiative A"), which has low access and a median income of 47.66. Program `PRO-2205` ("Pilot Initiative A") targets `COM-2799` ("Composite Model"), a community with a median income of 14.31 and `targeted_status: true`, confirming that higher-need communities receive dedicated programmatic attention.

### Economic Development Banks in Multi-Party Context

**View `v_economic_development_bank_capital_access_program_detail`**

```sql
CREATE VIEW v_economic_development_bank_capital_access_program_detail AS
SELECT a.economic_development_bank_id, a.bank_identifier, a.bank_name, b.capital_access_program_id AS program_capital_access_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM economic_development_banks a
  JOIN banks_programs j ON j.economic_development_bank_id = a.economic_development_bank_id
  JOIN capital_access_programs b ON b.capital_access_program_id = j.capital_access_program_id;
```

| economic_development_bank_id | bank_identifier | bank_name | program_capital_access_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|
| 1 | BAN-2796 | Compact Initiative | 100 | PRO-2198 | Extended Review |
| 1 | BAN-2796 | Compact Initiative | 101 | PRO-2205 | Pilot Initiative A |
| 2 | BAN-2798 | Legacy Model | 101 | PRO-2205 | Pilot Initiative A |
| 2 | BAN-2798 | Legacy Model | 102 | PRO-2212 | Baseline Model |
| 3 | BAN-2800 | Regional Cluster A | 102 | PRO-2212 | Baseline Model |
| 3 | BAN-2800 | Regional Cluster A | 103 | PRO-2219 | Distributed Cluster |
| 4 | BAN-2802 | Seasonal Review | 103 | PRO-2219 | Distributed Cluster |
| 4 | BAN-2802 | Seasonal Review | 100 | PRO-2198 | Extended Review |

This view provides a detailed perspective of economic development banks alongside their associated capital access programs, enabling analysts to assess bank-level program portfolios. Bank `BAN-2796` ("Compact Initiative") sponsors program `PRO-2198` with a total financed amount of 25,211 and a maximum guarantee of 2,996. Bank `BAN-2802` ("Seasonal Review") sponsors `PRO-2219` with a notably smaller financed amount of 233.57 but a guarantee ceiling of 8,753, suggesting a strategy of high-leverage, low-volume guarantee issuance.

**View `v_economic_development_bank_financial_development_corporation`**

```sql
CREATE VIEW v_economic_development_bank_financial_development_corporation AS
SELECT a.economic_development_bank_id, a.bank_identifier, a.bank_name, a.founding_year, b.financial_development_corporation_id AS corporation_financial_development_corporation_id, b.fdc_identifier AS corporation_fdc_identifier, b.fdc_name AS corporation_fdc_name
FROM economic_development_banks a JOIN financial_development_corporations b ON a.financial_development_corporation_id = b.financial_development_corporation_id;
```

| economic_development_bank_id | bank_identifier | bank_name | founding_year | corporation_financial_development_corporation_id | corporation_fdc_identifier | corporation_fdc_name |
|---|---|---|---|---|---|---|
| 1 | BAN-2796 | Compact Initiative | 43 | 1 | FDC-2618 | Distributed Assessment |
| 2 | BAN-2798 | Legacy Model | 48 | 2 | FDC-2623 | Adaptive Survey D |
| 3 | BAN-2800 | Regional Cluster A | 53 | 3 | FDC-2628 | Primary Corridor |
| 4 | BAN-2802 | Seasonal Review | 58 | 4 | FDC-2633 | Composite Series |

This view joins economic development banks with their affiliated financial development corporations, revealing the institutional pairing that drives guarantee issuance. Bank `BAN-2796` pairs with FDC `FDC-2618` ("Distributed Assessment"), while bank `BAN-2802` pairs with FDC `FDC-2633` ("Composite Series"). The bond issuance authority held by banks `BAN-2798` and `BAN-2802` correlates with their FDC partners' higher leverage figures, suggesting that banks with debt-raising capacity enable more aggressive FDC deployment.

**View `v_economic_development_bank_infrastructure_project`**

```sql
CREATE VIEW v_economic_development_bank_infrastructure_project AS
SELECT a.economic_development_bank_id, a.bank_identifier, a.bank_name, a.founding_year, b.id AS project_id, b.project_identifier AS project_project_identifier, b.project_name AS project_project_name
FROM economic_development_banks a JOIN infrastructure_projects b ON a.infrastructure_project_id = b.id;
```

| economic_development_bank_id | bank_identifier | bank_name | founding_year | project_id | project_project_identifier | project_project_name |
|---|---|---|---|---|---|---|
| 1 | BAN-2796 | Compact Initiative | 43 | 100 | PRO-2058 | Compact Survey |
| 2 | BAN-2798 | Legacy Model | 48 | 101 | PRO-2059 | Legacy Corridor |
| 3 | BAN-2800 | Regional Cluster A | 53 | 102 | PRO-2060 | Regional Series A |
| 4 | BAN-2802 | Seasonal Review | 58 | 103 | PRO-2061 | Seasonal Assessment |

This view links economic development banks to the infrastructure projects they finance, answering which institutions are responsible for public and private infrastructure investment. Bank `BAN-2796` ("Compact Initiative") is associated with project `PRO-2058` ("Compact Survey"), a public project with total cost 61.82 and financed amount 33.06. Bank `BAN-2802` ("Seasonal Review") is linked to project `PRO-2061` ("Seasonal Assessment"), a public project that has been cancelled despite having a financed amount of 37.54.

**View `v_economic_development_bank_small_business`**

```sql
CREATE VIEW v_economic_development_bank_small_business AS
SELECT a.economic_development_bank_id, a.bank_identifier, a.bank_name, a.founding_year, b.id AS business_id, b.business_identifier AS business_business_identifier, b.business_name AS business_business_name
FROM economic_development_banks a JOIN small_businesses b ON a.small_business_id = b.id;
```

| economic_development_bank_id | bank_identifier | bank_name | founding_year | business_id | business_business_identifier | business_business_name |
|---|---|---|---|---|---|---|
| 1 | BAN-2796 | Compact Initiative | 43 | 1 | BUS-2254 | Baseline Protocol D |
| 2 | BAN-2798 | Legacy Model | 48 | 2 | BUS-2255 | Distributed Programme |
| 3 | BAN-2800 | Regional Cluster A | 53 | 3 | BUS-2256 | Adaptive Standard |
| 4 | BAN-2802 | Seasonal Review | 58 | 4 | BUS-2257 | Primary Framework A |

This view connects economic development banks directly to the small businesses they support, completing the institutional-to-enterprise chain. Bank `BAN-2796` supports business `BUS-2254` ("Baseline Protocol D"), while bank `BAN-2802` supports `BUS-2257` ("Primary Framework A"), a compact-industry enterprise with 9 employees and a job creation commitment of 52. The disparity in employee counts—131 versus 9—illustrates how banks serve enterprises across the full spectrum of small business scale.

### Financial Development Corporations in Multi-Party Context

**View `v_financial_development_corporation_capital_access_program`**

```sql
CREATE VIEW v_financial_development_corporation_capital_access_program AS
SELECT a.financial_development_corporation_id, a.fdc_identifier, a.fdc_name, a.establishment_date, b.capital_access_program_id AS program_capital_access_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM financial_development_corporations a JOIN capital_access_programs b ON a.capital_access_program_id = b.capital_access_program_id;
```

| financial_development_corporation_id | fdc_identifier | fdc_name | establishment_date | program_capital_access_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1 | FDC-2618 | Distributed Assessment | 2024-07-11T06:18:00 | 100 | PRO-2198 | Extended Review |
| 2 | FDC-2623 | Adaptive Survey D | 2025-12-22T13:35:00 | 101 | PRO-2205 | Pilot Initiative A |
| 3 | FDC-2628 | Primary Corridor | 2022-05-06T20:52:00 | 102 | PRO-2212 | Baseline Model |
| 4 | FDC-2633 | Composite Series | 2023-10-17T03:09:00 | 103 | PRO-2219 | Distributed Cluster |

This view presents financial development corporations alongside their associated capital access programs, enabling assessment of FDC-level program coverage. FDC `FDC-2618` ("Distributed Assessment") is linked to program `PRO-2198` ("Extended Review"), while FDC `FDC-2628` ("Primary Corridor") is linked to `PRO-2212` ("Baseline Model"). The deployment status of each FDC—`active`, `inactive`, `pending`, or `active`—provides a real-time indicator of which corporations are currently operational.

**View `v_financial_development_corporation_small_business_detail`**

```sql
CREATE VIEW v_financial_development_corporation_small_business_detail AS
SELECT a.financial_development_corporation_id, a.fdc_identifier, a.fdc_name, b.id AS business_id, b.business_identifier AS business_business_identifier, b.business_name AS business_business_name
FROM financial_development_corporations a
  JOIN corporations_businesses j ON j.financial_development_corporation_id = a.financial_development_corporation_id
  JOIN small_businesses b ON b.id = j.small_business_id;
```

| financial_development_corporation_id | fdc_identifier | fdc_name | business_id | business_business_identifier | business_business_name |
|---|---|---|---|---|---|
| 1 | FDC-2618 | Distributed Assessment | 1 | BUS-2254 | Baseline Protocol D |
| 1 | FDC-2618 | Distributed Assessment | 2 | BUS-2255 | Distributed Programme |
| 2 | FDC-2623 | Adaptive Survey D | 2 | BUS-2255 | Distributed Programme |
| 2 | FDC-2623 | Adaptive Survey D | 3 | BUS-2256 | Adaptive Standard |
| 3 | FDC-2628 | Primary Corridor | 3 | BUS-2256 | Adaptive Standard |
| 3 | FDC-2628 | Primary Corridor | 4 | BUS-2257 | Primary Framework A |
| 4 | FDC-2633 | Composite Series | 4 | BUS-2257 | Primary Framework A |
| 4 | FDC-2633 | Composite Series | 1 | BUS-2254 | Baseline Protocol D |

This view joins financial development corporations with the small businesses they guarantee, answering which enterprises benefit from FDC-backed support. FDC `FDC-2618` ("Distributed Assessment") supports business `BUS-2254` ("Baseline Protocol D"), which has 131 employees and a tax base impact of 9.95. FDC `FDC-2633` ("Composite Series") supports `BUS-2257` ("Primary Framework A"), a lean enterprise with 9 employees but a substantial job creation commitment of 52, suggesting that FDCs may prioritize high-impact, low-headcount businesses.

**View `v_financial_development_corporation_institutional_lender`**

```sql
CREATE VIEW v_financial_development_corporation_institutional_lender AS
SELECT a.financial_development_corporation_id, a.fdc_identifier, a.fdc_name, a.establishment_date, b.institutional_lender_id AS lender_institutional_lender_id, b.lender_identifier AS lender_lender_identifier, b.lender_name AS lender_lender_name
FROM financial_development_corporations a JOIN institutional_lenders b ON a.institutional_lender_id = b.institutional_lender_id;
```

| financial_development_corporation_id | fdc_identifier | fdc_name | establishment_date | lender_institutional_lender_id | lender_lender_identifier | lender_lender_name |
|---|---|---|---|---|---|---|
| 1 | FDC-2618 | Distributed Assessment | 2024-07-11T06:18:00 | 1 | LEN-2543 | Composite Cluster |
| 2 | FDC-2623 | Adaptive Survey D | 2025-12-22T13:35:00 | 2 | LEN-2546 | Compact Review A |
| 3 | FDC-2628 | Primary Corridor | 2022-05-06T20:52:00 | 3 | LEN-2549 | Legacy Initiative |
| 4 | FDC-2633 | Composite Series | 2023-10-17T03:09:00 | 4 | LEN-2552 | Regional Model |

This view links financial development corporations to their upstream institutional lenders, revealing the capital sourcing chain. FDC `FDC-2618` ("Distributed Assessment") draws from institutional lender 1, while FDC `FDC-2633` ("Composite Series") draws from institutional lender 4. These relationships confirm that FDCs do not originate capital independently but rely on institutional lenders as the primary source of debt and equity funding.

**View `v_financial_development_corporation_underserved_community`**

```sql
CREATE VIEW v_financial_development_corporation_underserved_community AS
SELECT a.financial_development_corporation_id, a.fdc_identifier, a.fdc_name, a.establishment_date, b.underserved_community_id AS community_underserved_community_id, b.community_identifier AS community_community_identifier, b.community_name AS community_community_name
FROM financial_development_corporations a JOIN underserved_communities b ON a.underserved_community_id = b.underserved_community_id;
```

| financial_development_corporation_id | fdc_identifier | fdc_name | establishment_date | community_underserved_community_id | community_community_identifier | community_community_name |
|---|---|---|---|---|---|---|
| 1 | FDC-2618 | Distributed Assessment | 2024-07-11T06:18:00 | 1 | COM-2792 | Primary Initiative A |
| 2 | FDC-2623 | Adaptive Survey D | 2025-12-22T13:35:00 | 2 | COM-2799 | Composite Model |
| 3 | FDC-2628 | Primary Corridor | 2022-05-06T20:52:00 | 3 | COM-2806 | Compact Cluster |
| 4 | FDC-2633 | Composite Series | 2023-10-17T03:09:00 | 4 | COM-2813 | Legacy Review D |

This view connects financial development corporations to the underserved communities they serve, answering which FDCs are deployed in which geographic areas. FDC `FDC-2618` ("Distributed Assessment") serves community `COM-2792` ("Primary Initiative A"), while FDC `FDC-2633` ("Composite Series") serves `COM-2813` ("Legacy Review D"), a community with `targeted_status: true` and `access_level: low`. The alignment of FDC deployment with community need indicators confirms the targeted nature of development finance.

### Small Businesses in Multi-Party Context

**View `v_small_business_capital_access_program`**

```sql
CREATE VIEW v_small_business_capital_access_program AS
SELECT a.id, a.business_identifier, a.business_name, a.industry_sector, b.capital_access_program_id AS program_capital_access_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM small_businesses a JOIN capital_access_programs b ON a.capital_access_program_id = b.capital_access_program_id;
```

| id | business_identifier | business_name | industry_sector | program_capital_access_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1 | BUS-2254 | Baseline Protocol D | seasonal-industry-35 | 100 | PRO-2198 | Extended Review |
| 2 | BUS-2255 | Distributed Programme | regional-industry-36 | 101 | PRO-2205 | Pilot Initiative A |
| 3 | BUS-2256 | Adaptive Standard | legacy-industry-37 | 102 | PRO-2212 | Baseline Model |
| 4 | BUS-2257 | Primary Framework A | compact-industry-38 | 103 | PRO-2219 | Distributed Cluster |

This view presents small businesses alongside their associated capital access programs, enabling enterprise-level program analysis. Business `BUS-2254` ("Baseline Protocol D") participates in program `PRO-2198` ("Extended Review"), while business `BUS-2256` ("Adaptive Standard") participates in `PRO-2212` ("Baseline Model"). The industry sectors—`seasonal-industry-35` and `legacy-industry-37`—suggest that programs serve diverse economic segments.

**View `v_small_business_financial_development_corporation`**

```sql
CREATE VIEW v_small_business_financial_development_corporation AS
SELECT a.id, a.business_identifier, a.business_name, a.industry_sector, b.financial_development_corporation_id AS corporation_financial_development_corporation_id, b.fdc_identifier AS corporation_fdc_identifier, b.fdc_name AS corporation_fdc_name
FROM small_businesses a JOIN financial_development_corporations b ON a.financial_development_corporation_id = b.financial_development_corporation_id;
```

| id | business_identifier | business_name | industry_sector | corporation_financial_development_corporation_id | corporation_fdc_identifier | corporation_fdc_name |
|---|---|---|---|---|---|---|
| 1 | BUS-2254 | Baseline Protocol D | seasonal-industry-35 | 1 | FDC-2618 | Distributed Assessment |
| 2 | BUS-2255 | Distributed Programme | regional-industry-36 | 2 | FDC-2623 | Adaptive Survey D |
| 3 | BUS-2256 | Adaptive Standard | legacy-industry-37 | 3 | FDC-2628 | Primary Corridor |
| 4 | BUS-2257 | Primary Framework A | compact-industry-38 | 4 | FDC-2633 | Composite Series |

This view links small businesses to the financial development corporations that guarantee their exposure, completing the guarantee chain from FDC to enterprise. Business `BUS-2254` ("Baseline Protocol D") is guaranteed by FDC `FDC-2618` ("Distributed Assessment"), while business `BUS-2257` ("Primary Framework A") is guaranteed by FDC `FDC-2633` ("Composite Series"). The guarantee issuance figures of the FDCs—15.45 and 28.80 respectively—indicate the scale of risk absorption each corporation provides.

**View `v_small_business_underserved_community`**

```sql
CREATE VIEW v_small_business_underserved_community AS
SELECT a.id, a.business_identifier, a.business_name, a.industry_sector, b.underserved_community_id AS community_underserved_community_id, b.community_identifier AS community_community_identifier, b.community_name AS community_community_name
FROM small_businesses a JOIN underserved_communities b ON a.underserved_community_id = b.underserved_community_id;
```

| id | business_identifier | business_name | industry_sector | community_underserved_community_id | community_community_identifier | community_community_name |
|---|---|---|---|---|---|---|
| 1 | BUS-2254 | Baseline Protocol D | seasonal-industry-35 | 1 | COM-2792 | Primary Initiative A |
| 2 | BUS-2255 | Distributed Programme | regional-industry-36 | 2 | COM-2799 | Composite Model |
| 3 | BUS-2256 | Adaptive Standard | legacy-industry-37 | 3 | COM-2806 | Compact Cluster |
| 4 | BUS-2257 | Primary Framework A | compact-industry-38 | 4 | COM-2813 | Legacy Review D |

This view connects small businesses to the underserved communities in which they operate, answering which enterprises serve which communities. Business `BUS-2254` ("Baseline Protocol D") operates in community `COM-2792` ("Primary Initiative A"), while business `BUS-2257` ("Primary Framework A") operates in `COM-2813` ("Legacy Review D"). The employee counts—131 and 9—demonstrate that both large and small enterprises serve underserved areas.

### Underserved Communities in Multi-Party Context

**View `v_underserved_community_small_business`**

```sql
CREATE VIEW v_underserved_community_small_business AS
SELECT a.underserved_community_id, a.community_identifier, a.community_name, a.geographic_boundary, b.id AS business_id, b.business_identifier AS business_business_identifier, b.business_name AS business_business_name
FROM underserved_communities a JOIN small_businesses b ON a.small_business_id = b.id;
```

| underserved_community_id | community_identifier | community_name | geographic_boundary | business_id | business_business_identifier | business_business_name |
|---|---|---|---|---|---|---|
| 1 | COM-2792 | Primary Initiative A | compact-geograph-14 | 1 | BUS-2254 | Baseline Protocol D |
| 2 | COM-2799 | Composite Model | composite-geograph-15 | 2 | BUS-2255 | Distributed Programme |
| 3 | COM-2806 | Compact Cluster | primary-geograph-16 | 3 | BUS-2256 | Adaptive Standard |
| 4 | COM-2813 | Legacy Review D | adaptive-geograph-17 | 4 | BUS-2257 | Primary Framework A |

This view presents underserved communities alongside the small businesses operating within them, enabling community-level enterprise analysis. Community `COM-2792` ("Primary Initiative A") hosts business `BUS-2254` ("Baseline Protocol D"), while community `COM-2813` ("Legacy Review D") hosts `BUS-2257` ("Primary Framework A"). The population density figures—15.70 and 26.80—suggest that higher-density communities may support fewer but more concentrated enterprises.

**View `v_underserved_community_capital_access_program`**

```sql
CREATE VIEW v_underserved_community_capital_access_program AS
SELECT a.underserved_community_id, a.community_identifier, a.community_name, a.geographic_boundary, b.capital_access_program_id AS program_capital_access_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM underserved_communities a JOIN capital_access_programs b ON a.capital_access_program_id = b.capital_access_program_id;
```

| underserved_community_id | community_identifier | community_name | geographic_boundary | program_capital_access_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1 | COM-2792 | Primary Initiative A | compact-geograph-14 | 100 | PRO-2198 | Extended Review |
| 2 | COM-2799 | Composite Model | composite-geograph-15 | 101 | PRO-2205 | Pilot Initiative A |
| 3 | COM-2806 | Compact Cluster | primary-geograph-16 | 102 | PRO-2212 | Baseline Model |
| 4 | COM-2813 | Legacy Review D | adaptive-geograph-17 | 103 | PRO-2219 | Distributed Cluster |

This view links underserved communities to the capital access programs that target them, answering which programs are designed for which areas. Community `COM-2792` ("Primary Initiative A") is targeted by program `PRO-2198` ("Extended Review"), while community `COM-2813` ("Legacy Review D") is targeted by `PRO-2219` ("Distributed Cluster"). The `targeted_status` field of the community—`false` for `COM-2792` and `true` for `COM-2813`—indicates that programs are allocated to both priority and non-priority communities.

### Infrastructure Projects in Multi-Party Context

**View `v_infrastructure_project_economic_development_bank`**

```sql
CREATE VIEW v_infrastructure_project_economic_development_bank AS
SELECT a.id, a.project_identifier, a.project_name, a.project_type, b.economic_development_bank_id AS bank_economic_development_bank_id, b.bank_identifier AS bank_bank_identifier, b.bank_name AS bank_bank_name
FROM infrastructure_projects a JOIN economic_development_banks b ON a.economic_development_bank_id = b.economic_development_bank_id;
```

| id | project_identifier | project_name | project_type | bank_economic_development_bank_id | bank_bank_identifier | bank_bank_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2058 | Compact Survey | public | 1 | BAN-2796 | Compact Initiative |
| 101 | PRO-2059 | Legacy Corridor | private | 2 | BAN-2798 | Legacy Model |
| 102 | PRO-2060 | Regional Series A | mixed | 3 | BAN-2800 | Regional Cluster A |
| 103 | PRO-2061 | Seasonal Assessment | public | 4 | BAN-2802 | Seasonal Review |

This view joins infrastructure projects with their sponsoring economic development banks, answering which institutions oversee which infrastructure investments. Project `PRO-2058` ("Compact Survey") is sponsored by bank `BAN-2796` ("Compact Initiative"), while project `PRO-2061` ("Seasonal Assessment") is sponsored by `BAN-2802` ("Seasonal Review"). The project statuses—`planning` and `cancelled`—illustrate the lifecycle variability of infrastructure investments.

**View `v_infrastructure_project_underserved_community`**

```sql
CREATE VIEW v_infrastructure_project_underserved_community AS
SELECT a.id, a.project_identifier, a.project_name, a.project_type, b.underserved_community_id AS community_underserved_community_id, b.community_identifier AS community_community_identifier, b.community_name AS community_community_name
FROM infrastructure_projects a JOIN underserved_communities b ON a.underserved_community_id = b.underserved_community_id;
```

| id | project_identifier | project_name | project_type | community_underserved_community_id | community_community_identifier | community_community_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2058 | Compact Survey | public | 1 | COM-2792 | Primary Initiative A |
| 101 | PRO-2059 | Legacy Corridor | private | 2 | COM-2799 | Composite Model |
| 102 | PRO-2060 | Regional Series A | mixed | 3 | COM-2806 | Compact Cluster |
| 103 | PRO-2061 | Seasonal Assessment | public | 4 | COM-2813 | Legacy Review D |

This view links infrastructure projects to the underserved communities they serve, answering which communities benefit from which infrastructure investments. Project `PRO-2058` ("Compact Survey") serves community `COM-2792` ("Primary Initiative A"), while project `PRO-2061` ("Seasonal Assessment") serves `COM-2813` ("Legacy Review D"). The project types—`public` for both—confirm that infrastructure in underserved areas is predominantly publicly funded.

**View `v_infrastructure_project_small_business`**

```sql
CREATE VIEW v_infrastructure_project_small_business AS
SELECT a.id, a.project_identifier, a.project_name, a.project_type, b.id AS business_id, b.business_identifier AS business_business_identifier, b.business_name AS business_business_name
FROM infrastructure_projects a JOIN small_businesses b ON a.small_business_id = b.id;
```

| id | project_identifier | project_name | project_type | business_id | business_business_identifier | business_business_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2058 | Compact Survey | public | 1 | BUS-2254 | Baseline Protocol D |
| 101 | PRO-2059 | Legacy Corridor | private | 2 | BUS-2255 | Distributed Programme |
| 102 | PRO-2060 | Regional Series A | mixed | 3 | BUS-2256 | Adaptive Standard |
| 103 | PRO-2061 | Seasonal Assessment | public | 4 | BUS-2257 | Primary Framework A |

This view connects infrastructure projects to the small businesses that benefit from them, completing the infrastructure-to-enterprise chain. Project `PRO-2058` ("Compact Survey") supports business `BUS-2254` ("Baseline Protocol D"), while project `PRO-2061` ("Seasonal Assessment") supports `BUS-2257` ("Primary Framework A"). The financed amounts of the projects—33.06 and 37.54—indicate the scale of infrastructure investment relative to the enterprises they serve.

### Institutional Lenders in Multi-Party Context

**View `v_institutional_lender_financial_development_corporation`**

```sql
CREATE VIEW v_institutional_lender_financial_development_corporation AS
SELECT a.institutional_lender_id, a.lender_identifier, a.lender_name, a.lender_type, b.financial_development_corporation_id AS corporation_financial_development_corporation_id, b.fdc_identifier AS corporation_fdc_identifier, b.fdc_name AS corporation_fdc_name
FROM institutional_lenders a JOIN financial_development_corporations b ON a.financial_development_corporation_id = b.financial_development_corporation_id;
```

| institutional_lender_id | lender_identifier | lender_name | lender_type | corporation_financial_development_corporation_id | corporation_fdc_identifier | corporation_fdc_name |
|---|---|---|---|---|---|---|
| 1 | LEN-2543 | Composite Cluster | commercial_bank | 1 | FDC-2618 | Distributed Assessment |
| 2 | LEN-2546 | Compact Review A | credit_union | 2 | FDC-2623 | Adaptive Survey D |
| 3 | LEN-2549 | Legacy Initiative | cdfi | 3 | FDC-2628 | Primary Corridor |
| 4 | LEN-2552 | Regional Model | non_bank | 4 | FDC-2633 | Composite Series |

This view presents institutional lenders alongside their affiliated financial development corporations, enabling lender-level FDC coverage analysis. Lender 1 is affiliated with FDC `FDC-2618` ("Distributed Assessment"), while lender 4 is affiliated with FDC `FDC-2633` ("Composite Series"). These relationships confirm that institutional lenders serve as the upstream capital source for FDC guarantee operations.

**View `v_institutional_lender_small_business_detail`**

```sql
CREATE VIEW v_institutional_lender_small_business_detail AS
SELECT a.institutional_lender_id, a.lender_identifier, a.lender_name, b.id AS business_id, b.business_identifier AS business_business_identifier, b.business_name AS business_business_name
FROM institutional_lenders a
  JOIN lenders_businesses j ON j.institutional_lender_id = a.institutional_lender_id
  JOIN small_businesses b ON b.id = j.small_business_id;
```

| institutional_lender_id | lender_identifier | lender_name | business_id | business_business_identifier | business_business_name |
|---|---|---|---|---|---|
| 1 | LEN-2543 | Composite Cluster | 1 | BUS-2254 | Baseline Protocol D |
| 1 | LEN-2543 | Composite Cluster | 2 | BUS-2255 | Distributed Programme |
| 2 | LEN-2546 | Compact Review A | 2 | BUS-2255 | Distributed Programme |
| 2 | LEN-2546 | Compact Review A | 3 | BUS-2256 | Adaptive Standard |
| 3 | LEN-2549 | Legacy Initiative | 3 | BUS-2256 | Adaptive Standard |
| 3 | LEN-2549 | Legacy Initiative | 4 | BUS-2257 | Primary Framework A |
| 4 | LEN-2552 | Regional Model | 4 | BUS-2257 | Primary Framework A |
| 4 | LEN-2552 | Regional Model | 1 | BUS-2254 | Baseline Protocol D |

This view links institutional lenders to the small businesses they finance, answering which enterprises receive direct lender funding. Lender 1 finances business `BUS-2254` ("Baseline Protocol D"), while lender 4 finances `BUS-2257` ("Primary Framework A"). These direct lender-to-business relationships operate alongside FDC guarantee structures, providing businesses with multiple capital pathways.

**View `v_institutional_lender_capital_access_program`**

```sql
CREATE VIEW v_institutional_lender_capital_access_program AS
SELECT a.institutional_lender_id, a.lender_identifier, a.lender_name, a.lender_type, b.capital_access_program_id AS program_capital_access_program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM institutional_lenders a JOIN capital_access_programs b ON a.capital_access_program_id = b.capital_access_program_id;
```

| institutional_lender_id | lender_identifier | lender_name | lender_type | program_capital_access_program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1 | LEN-2543 | Composite Cluster | commercial_bank | 100 | PRO-2198 | Extended Review |
| 2 | LEN-2546 | Compact Review A | credit_union | 101 | PRO-2205 | Pilot Initiative A |
| 3 | LEN-2549 | Legacy Initiative | cdfi | 102 | PRO-2212 | Baseline Model |
| 4 | LEN-2552 | Regional Model | non_bank | 103 | PRO-2219 | Distributed Cluster |

This view connects institutional lenders to the capital access programs they support, completing the capital sourcing chain from lender to program. Lender 1 supports program `PRO-2198` ("Extended Review"), while lender 4 supports `PRO-2219` ("Distributed Cluster"). These relationships confirm that institutional lenders provide the foundational capital that flows through FDC guarantee mechanisms into program-level disbursements.

### Synthesis

The economic development finance ecosystem described by these records operates as an integrated network in which capital flows from institutional lenders through financial development corporations and capital access programs to small businesses, infrastructure projects, and underserved communities. Economic development banks serve as the operational custodians of programs and infrastructure, while financial development corporations provide the guarantee leverage that multiplies public dollars. The junction tables—`banks_programs`, `corporations_businesses`, and `lenders_businesses`—ensure that these relationships are explicitly recorded and auditable. The views provide multiple analytical perspectives, each answering a specific question about which entity supports which other entity, enabling practitioners to trace capital from its institutional source through every layer of the deployment chain to its ultimate destination in enterprises, communities, and infrastructure.