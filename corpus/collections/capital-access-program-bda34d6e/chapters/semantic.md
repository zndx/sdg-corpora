The capital-access funding ecosystem is a multi-party financial domain in which government-backed programs, development banks, and corporations channel capital to small businesses operating within underserved communities. Infrastructure projects serve as the physical anchor for this flow, tying public financing to tangible outcomes. The relational schema captures this ecosystem through seven entity tables, three junction tables, and twenty-three materialized views that reconstruct domain facts from the normalized base.

## Entity Types and Their Attributes

The domain centres on seven core entity types, each materialized as a table whose primary key is a surrogate integer and whose business identity is preserved in a natural identifier column.

**Table `capital_access_programs`**

| capital_access_program_id | program_identifier | program_name | established_date | total_financed_amount | max_guarantee_amount | program_status | target_jurisdiction | economic_development_bank_id | financial_development_corporation_id | small_business_id | underserved_community_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | PRO-2198 | Extended Review | 2024-03-27T14:30:00 | 25,211 | 2,996 | active | seasonal-target-11 | 1 | 1 | 1 | 1 |
| 101 | PRO-2205 | Pilot Initiative A | 2025-08-11T21:47:00 | 27,602 | 161,744 | inactive | regional-target-12 | 2 | 2 | 2 | 2 |
| 102 | PRO-2212 | Baseline Model | 2022-01-22T04:04:00 | 11,121 | 45,650 | pending | legacy-target-13 | 3 | 3 | 3 | 3 |
| 103 | PRO-2219 | Distributed Cluster | 2023-06-06T11:21:00 | 233.57 | 8,753 | active | compact-target-14 | 4 | 4 | 4 | 4 |

The `capital_access_programs` table records each program's financial envelope and governance context. The surrogate key `capital_access_program_id` (values 100–103) is distinct from the human-readable `program_identifier` (e.g. `PRO-2198`, `PRO-2205`). The `program_name` column carries descriptive labels such as *Extended Review* and *Pilot Initiative A*, while `established_date` timestamps the program's inception. Financial capacity is captured in `total_financed_amount` (ranging from 233.57 to 27,602) and `max_guarantee_amount` (from 2,996 to 161,744). The `program_status` column constrains each row to one of three states—`active`, `inactive`, or `pending`—and `target_jurisdiction` stores a categorical label like `seasonal-target-11` or `regional-target-12`. Four foreign-key columns (`economic_development_bank_id`, `financial_development_corporation_id`, `small_business_id`, `underserved_community_id`) each point to a single row in their respective entity tables, encoding a one-to-one or one-to-many association depending on the inverse side's cardinality.

**Table `economic_development_banks`**

| economic_development_bank_id | bank_identifier | bank_name | founding_year | governing_office | total_financed_amount | bond_issuance_authority | jurisdiction | financial_development_corporation_id | infrastructure_project_id | small_business_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | BAN-2796 | Compact Initiative | 43 | seasonal-governin-29 | 25,211 | false | regional-jurisdic-30 | 1 | 100 | 1 |
| 2 | BAN-2798 | Legacy Model | 48 | regional-governin-30 | 27,602 | true | legacy-jurisdic-31 | 2 | 101 | 2 |
| 3 | BAN-2800 | Regional Cluster A | 53 | legacy-governin-31 | 11,121 | false | compact-jurisdic-32 | 3 | 102 | 3 |
| 4 | BAN-2802 | Seasonal Review | 58 | compact-governin-32 | 233.57 | true | composite-jurisdic-33 | 4 | 103 | 4 |

`economic_development_banks` models the lending institutions that originate and manage program funds. Its surrogate key `economic_development_bank_id` (1–4) is paired with `bank_identifier` (`BAN-2796`, `BAN-2798`, etc.) and `bank_name` (*Compact Initiative*, *Legacy Model*, *Regional Cluster A*, *Seasonal Review*). The `founding_year` column stores an integer (43–58), while `governing_office` holds a categorical string such as `seasonal-governin-29`. The `total_financed_amount` mirrors the program-level figure, and `bond_issuance_authority` is a boolean flag—`true` for *Legacy Model* and *Seasonal Review*, `false` otherwise. The `jurisdiction` column (e.g. `regional-jurisdic-30`) classifies the bank's operational territory. Three foreign keys link the bank to a `financial_development_corporation`, an `infrastructure_project`, and a `small_business`.

**Table `financial_development_corporations`**

| financial_development_corporation_id | fdc_identifier | fdc_name | establishment_date | public_dollars_leveraged | total_guarantee_issuance | deployment_status | jurisdiction | capital_access_program_id | institutional_lender_id | underserved_community_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | FDC-2618 | Distributed Assessment | 2024-07-11T06:18:00 | 18.70 | 15.45 | active | regional-jurisdic-30 | 100 | 1 | 1 |
| 2 | FDC-2623 | Adaptive Survey D | 2025-12-22T13:35:00 | 20.40 | 19.90 | inactive | legacy-jurisdic-31 | 101 | 2 | 2 |
| 3 | FDC-2628 | Primary Corridor | 2022-05-06T20:52:00 | 22.10 | 24.35 | pending | compact-jurisdic-32 | 102 | 3 | 3 |
| 4 | FDC-2633 | Composite Series | 2023-10-17T03:09:00 | 23.80 | 28.80 | active | composite-jurisdic-33 | 103 | 4 | 4 |

`financial_development_corporations` captures the corporate entities that administer guarantee issuance and leverage public capital. The surrogate `financial_development_corporation_id` (1–4) is complemented by `fdc_identifier` (`FDC-2618`, `FDC-2623`, etc.) and `fdc_name` (*Distributed Assessment*, *Adaptive Survey D*, *Primary Corridor*, *Composite Series*). The `establishment_date` column stores a timestamp, while `public_dollars_leveraged` and `total_guarantee_issuance` are decimal figures (e.g. 18.70 and 15.45 for the first row). The `deployment_status` column mirrors the program-level enum with values `active`, `inactive`, and `pending`. The `jurisdiction` column again stores a categorical label. Three foreign keys connect the corporation to a `capital_access_program`, an `institutional_lender`, and an `underserved_community`.

**Table `small_businesses`**

| id | business_identifier | business_name | industry_sector | employee_count | job_creation_commitment | employee_retention_commitment | tax_base_impact | capital_access_program_id | financial_development_corporation_id | underserved_community_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | BUS-2254 | Baseline Protocol D | seasonal-industry-35 | 131 | 31 | Shelby Patterson | 9.95 | 100 | 1 | 1 |
| 2 | BUS-2255 | Distributed Programme | regional-industry-36 | 428 | 38 | Kimberly Maynard | 12.90 | 101 | 2 | 2 |
| 3 | BUS-2256 | Adaptive Standard | legacy-industry-37 | 3 | 45 | Lori Evans | 15.85 | 102 | 3 | 3 |
| 4 | BUS-2257 | Primary Framework A | compact-industry-38 | 9 | 52 | Sean Green | 18.80 | 103 | 4 | 4 |

`small_businesses` records the recipient enterprises. The surrogate key `id` (1–4) is paired with `business_identifier` (`BUS-2254`–`BUS-2257`) and `business_name` (*Baseline Protocol D*, *Distributed Programme*, *Adaptive Standard*, *Primary Framework A*). The `industry_sector` column stores a categorical label such as `seasonal-industry-35`. Quantitative metrics include `employee_count` (3–428), `job_creation_commitment` (31–52), and `tax_base_impact` (9.95–18.80). The `employee_retention_commitment` column holds a string value—*Shelby Patterson*, *Kimberly Maynard*, *Lori Evans*, *Sean Green*—which in the source data appears to be a person name rather than a numeric metric, suggesting either a placeholder or a named commitment officer. Three foreign keys link each business to a `capital_access_program`, a `financial_development_corporation`, and an `underserved_community`.

**Table `underserved_communities`**

| underserved_community_id | community_identifier | community_name | geographic_boundary | population_density | median_income | access_level | targeted_status | small_business_id | capital_access_program_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | COM-2792 | Primary Initiative A | compact-geograph-14 | 15.70 | 47.66 | low | false | 1 | 100 |
| 2 | COM-2799 | Composite Model | composite-geograph-15 | 19.40 | 14.31 | medium | true | 2 | 101 |
| 3 | COM-2806 | Compact Cluster | primary-geograph-16 | 23.10 | 26.25 | high | false | 3 | 102 |
| 4 | COM-2813 | Legacy Review D | adaptive-geograph-17 | 26.80 | 14.31 | low | true | 4 | 103 |

`underserved_communities` models the geographic and demographic units targeted by the programs. The surrogate `underserved_community_id` (1–4) is paired with `community_identifier` (`COM-2792`–`COM-2813`) and `community_name` (*Primary Initiative A*, *Composite Model*, *Compact Cluster*, *Legacy Review D*). The `geographic_boundary` column stores a categorical label such as `compact-geograph-14`. Quantitative attributes include `population_density` (15.70–26.80) and `median_income` (14.31–47.66). The `access_level` column is categorical (`low`, `medium`, `high`), and `targeted_status` is a boolean (`true` for *Composite Model* and *Legacy Review D*). Two foreign keys connect the community to a `small_business` and a `capital_access_program`.

**Table `infrastructure_projects`**

| id | project_identifier | project_name | project_type | total_cost | financed_amount | start_date | completion_date | project_status | economic_development_bank_id | underserved_community_id | small_business_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | PRO-2058 | Compact Survey | public | 61.82 | 33.06 | 2022-09-05T20:24:00 | 2024-03-14T02:06:00 | planning | 1 | 1 | 1 |
| 101 | PRO-2059 | Legacy Corridor | private | 89.53 | 17.12 | 2023-02-16T03:41:00 | 2025-08-25T09:23:00 | active | 2 | 2 | 2 |
| 102 | PRO-2060 | Regional Series A | mixed | 29.24 | 18.47 | 2024-07-27T10:58:00 | 2022-01-09T16:40:00 | completed | 3 | 3 | 3 |
| 103 | PRO-2061 | Seasonal Assessment | public | 13.94 | 37.54 | 2025-12-11T17:15:00 | 2023-06-20T23:57:00 | cancelled | 4 | 4 | 4 |

`infrastructure_projects` captures the physical undertakings financed through the ecosystem. The surrogate `id` (100–103) is paired with `project_identifier` (`PRO-2058`–`PRO-2061`) and `project_name` (*Compact Survey*, *Legacy Corridor*, *Regional Series A*, *Seasonal Assessment*). The `project_type` column is categorical (`public`, `private`, `mixed`), while `total_cost` and `financed_amount` are decimal figures (e.g. 61.82 and 33.06 for *Compact Survey*). The `start_date` and `completion_date` columns store timestamps, and `project_status` constrains each row to one of four states: `planning`, `active`, `completed`, or `cancelled`. Three foreign keys link the project to an `economic_development_bank`, an `underserved_community`, and a `small_business`.

**Table `institutional_lenders`**

| institutional_lender_id | lender_identifier | lender_name | lender_type | total_capital_deployed | risk_tolerance | jurisdiction | financial_development_corporation_id | capital_access_program_id |
|---|---|---|---|---|---|---|---|---|
| 1 | LEN-2543 | Composite Cluster | commercial_bank | 13.20 | low | regional-jurisdic-30 | 1 | 100 |
| 2 | LEN-2546 | Compact Review A | credit_union | 17.40 | medium | legacy-jurisdic-31 | 2 | 101 |
| 3 | LEN-2549 | Legacy Initiative | cdfi | 21.60 | high | compact-jurisdic-32 | 3 | 102 |
| 4 | LEN-2552 | Regional Model | non_bank | 25.80 | low | composite-jurisdic-33 | 4 | 103 |

`institutional_lenders` represents the financial institutions that partner with financial development corporations to provide capital. While the sample data does not display its rows, the table is referenced through the `institutional_lender_id` foreign key in `financial_development_corporations` and appears in three dedicated views.

## Junction Tables for Many-to-Many Relationships

Three junction tables resolve many-to-many associations that cannot be expressed through single-column foreign keys.

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

The `banks_programs` junction table links `economic_development_banks` to `capital_access_programs` in a many-to-many relationship. Each row contains a bank identifier and a program identifier, allowing a single bank to participate in multiple programs and a single program to be administered by multiple banks. This table decouples the one-to-one associations that the base entity tables currently encode through their foreign-key columns, enabling the schema to evolve when the cardinality changes.

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

The `corporations_businesses` junction table links `financial_development_corporations` to `small_businesses`. Each row pairs a corporation identifier with a business identifier, supporting the scenario where a corporation backs multiple businesses and a business receives backing from multiple corporations. The presence of this table alongside the direct foreign key `financial_development_corporation_id` in `small_businesses` suggests a transitional or dual-mode design: the direct FK enforces a single primary corporation per business, while the junction table permits secondary or historical associations.

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

The `lenders_businesses` junction table links `institutional_lenders` to `small_businesses`. Each row pairs a lender identifier with a business identifier, enabling a lender to finance multiple businesses and a business to receive financing from multiple lenders. Like the other junction tables, this structure anticipates cardinality growth beyond the one-to-one or one-to-many relationships encoded in the base entity tables.

## Foreign-Key Topology

The foreign-key graph forms a tightly interlocked web. The `capital_access_programs` table is the central hub: its four foreign-key columns point to `economic_development_banks`, `financial_development_corporations`, `small_businesses`, and `underserved_communities`. Each of those four tables, in turn, contains foreign keys that point back to `capital_access_programs` or to other entities, creating cycles that the junction tables help to resolve.

The `economic_development_banks` table points to `financial_development_corporations`, `infrastructure_projects`, and `small_businesses`. The `financial_development_corporations` table points to `capital_access_programs`, `institutional_lenders`, and `underserved_communities`. The `small_businesses` table points to `capital_access_programs`, `financial_development_corporations`, and `underserved_communities`. The `underserved_communities` table points to `small_businesses` and `capital_access_programs`. The `infrastructure_projects` table points to `economic_development_banks`, `underserved_communities`, and `small_businesses`. This dense interconnection means that any single domain fact—such as "which program finances which business in which community"—requires a join across multiple tables to reconstruct.

## Views as Reconstructed Domain Facts

The twenty-three views materialize the most common join paths, each answering a specific analytical question by denormalizing the normalized schema.

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

This view joins `capital_access_programs` to `economic_development_banks` on `economic_development_bank_id`. It answers the question: *which economic development bank administers each capital access program?* A row from the view would show `PRO-2198` (Extended Review) paired with `BAN-2796` (Compact Initiative), revealing that the Compact Initiative bank administers the Extended Review program.

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

This view joins `capital_access_programs` to `financial_development_corporations` on `financial_development_corporation_id`. It answers: *which financial development corporation runs each capital access program?* The first row pairs `PRO-2198` with `FDC-2618` (Distributed Assessment), showing that Distributed Assessment runs the Extended Review program.

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

This view joins `capital_access_programs` to `small_businesses` on `small_business_id`. It answers: *which small businesses are served by each capital access program?* The first row pairs `PRO-2198` with `BUS-2254` (Baseline Protocol D), indicating that Baseline Protocol D is served by the Extended Review program.

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

This view joins `capital_access_programs` to `underserved_communities` on `underserved_community_id`. It answers: *which underserved communities are targeted by each capital access program?* The first row pairs `PRO-2198` with `COM-2792` (Primary Initiative A), showing that Primary Initiative A is a target of the Extended Review program.

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

This view joins `economic_development_banks` to `capital_access_programs` on `economic_development_bank_id`, effectively the inverse of the first view. It answers: *for each economic development bank, what are the details of the capital access programs it administers?* A row would show `BAN-2796` (Compact Initiative) alongside `PRO-2198` (Extended Review) with its `total_financed_amount` of 25,211 and `max_guarantee_amount` of 2,996.

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

This view joins `economic_development_banks` to `financial_development_corporations` on `financial_development_corporation_id`. It answers: *which financial development corporation is associated with each economic development bank?* The first row pairs `BAN-2796` (Compact Initiative) with `FDC-2618` (Distributed Assessment), revealing the institutional partnership between the two entities.

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

This view joins `economic_development_banks` to `infrastructure_projects` on `economic_development_bank_id`. It answers: *which infrastructure projects are financed by each economic development bank?* The first row pairs `BAN-2796` (Compact Initiative) with `PRO-2058` (Compact Survey), a public project with a `total_cost` of 61.82 and `financed_amount` of 33.06.

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

This view joins `economic_development_banks` to `small_businesses` on `small_business_id`. It answers: *which small businesses are supported by each economic development bank?* The first row pairs `BAN-2796` (Compact Initiative) with `BUS-2254` (Baseline Protocol D), a business in `seasonal-industry-35` with 131 employees.

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

This view joins `financial_development_corporations` to `capital_access_programs` on `capital_access_program_id`. It answers: *which capital access programs are run by each financial development corporation?* The first row pairs `FDC-2618` (Distributed Assessment) with `PRO-2198` (Extended Review), showing that Distributed Assessment runs the Extended Review program.

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

This view joins `financial_development_corporations` to `small_businesses` on `financial_development_corporation_id`. It answers: *for each financial development corporation, what are the details of the small businesses it backs?* A row would show `FDC-2618` (Distributed Assessment) alongside `BUS-2254` (Baseline Protocol D) with its `employee_count` of 131, `job_creation_commitment` of 31, and `tax_base_impact` of 9.95.

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

This view joins `financial_development_corporations` to `institutional_lenders` on `institutional_lender_id`. It answers: *which institutional lender partners with each financial development corporation?* The first row pairs `FDC-2618` (Distributed Assessment) with the institutional lender identified by `institutional_lender_id` 1, revealing the institutional partnership.

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

This view joins `financial_development_corporations` to `underserved_communities` on `underserved_community_id`. It answers: *which underserved communities are served by each financial development corporation?* The first row pairs `FDC-2618` (Distributed Assessment) with `COM-2792` (Primary Initiative A), a community with `population_density` of 15.70 and `median_income` of 47.66.

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

This view joins `small_businesses` to `capital_access_programs` on `capital_access_program_id`. It answers: *which capital access program is each small business enrolled in?* The first row pairs `BUS-2254` (Baseline Protocol D) with `PRO-2198` (Extended Review), showing that Baseline Protocol D is enrolled in the Extended Review program.

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

This view joins `small_businesses` to `financial_development_corporations` on `financial_development_corporation_id`. It answers: *which financial development corporation backs each small business?* The first row pairs `BUS-2254` (Baseline Protocol D) with `FDC-2618` (Distributed Assessment), revealing the backing relationship.

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

This view joins `small_businesses` to `underserved_communities` on `underserved_community_id`. It answers: *in which underserved community is each small business located?* The first row pairs `BUS-2254` (Baseline Protocol D) with `COM-2792` (Primary Initiative A), showing that Baseline Protocol D is located in Primary Initiative A.

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

This view joins `underserved_communities` to `small_businesses` on `small_business_id`. It answers: *which small businesses are hosted by each underserved community?* The first row pairs `COM-2792` (Primary Initiative A) with `BUS-2254` (Baseline Protocol D), showing that Primary Initiative A hosts Baseline Protocol D.

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

This view joins `underserved_communities` to `capital_access_programs` on `capital_access_program_id`. It answers: *which capital access programs target each underserved community?* The first row pairs `COM-2792` (Primary Initiative A) with `PRO-2198` (Extended Review), showing that Primary Initiative A is targeted by the Extended Review program.

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

This view joins `infrastructure_projects` to `economic_development_banks` on `economic_development_bank_id`. It answers: *which economic development bank finances each infrastructure project?* The first row pairs `PRO-2058` (Compact Survey) with `BAN-2796` (Compact Initiative), showing that Compact Initiative finances the Compact Survey project.

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

This view joins `infrastructure_projects` to `underserved_communities` on `underserved_community_id`. It answers: *in which underserved community is each infrastructure project located?* The first row pairs `PRO-2058` (Compact Survey) with `COM-2792` (Primary Initiative A), showing that Compact Survey is located in Primary Initiative A.

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

This view joins `infrastructure_projects` to `small_businesses` on `small_business_id`. It answers: *which small businesses benefit from each infrastructure project?* The first row pairs `PRO-2058` (Compact Survey) with `BUS-2254` (Baseline Protocol D), showing that Baseline Protocol D benefits from Compact Survey.

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

This view joins `institutional_lenders` to `financial_development_corporations` on `financial_development_corporation_id`. It answers: *which financial development corporations partner with each institutional lender?* The first row pairs the institutional lender with `FDC-2618` (Distributed Assessment), revealing the partnership.

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

This view joins `institutional_lenders` to `small_businesses` through `financial_development_corporations`, traversing the path `institutional_lender → financial_development_corporation → small_business`. It answers: *for each institutional lender, what are the details of the small businesses indirectly financed through its corporate partners?* A row would show the institutional lender paired with `BUS-2254` (Baseline Protocol D), with the `employee_count` of 131 and `tax_base_impact` of 9.95 visible.

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

This view joins `institutional_lenders` to `capital_access_programs` through `financial_development_corporations`, traversing the path `institutional_lender → financial_development_corporation → capital_access_program`. It answers: *which capital access programs are indirectly financed by each institutional lender?* The first row pairs the institutional lender with `PRO-2198` (Extended Review), showing that the Extended Review program is indirectly financed through Distributed Assessment.

## Synthesis

The schema models the capital-access funding domain as a network of seven entity tables whose foreign keys form a dense, cyclic graph. Each entity table stores its own attributes as columns and encodes its relationships through foreign-key references to other entities. The three junction tables (`banks_programs`, `corporations_businesses`, `lenders_businesses`) provide a mechanism for many-to-many associations that the base tables' single-column foreign keys cannot express. The twenty-three views materialize the most common join paths, denormalizing the schema to answer specific analytical questions without requiring the application layer to construct joins manually. Together, the base tables and views provide a complete relational representation of the domain: the tables capture the normalized structure, and the views provide efficient access to the denormalized facts that domain analysts and decision-makers need.