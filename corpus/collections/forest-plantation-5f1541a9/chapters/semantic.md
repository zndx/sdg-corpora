The forestry and carbon-credit ecosystem under study spans four operational domains—land management, timber production, carbon-offset issuance, and industrial processing—each anchored to legal entities and sovereign jurisdictions. The relational model captures this ecosystem by normalizing entities into eight base tables, linking them through foreign keys and two junction tables, then reassembling them into thirteen denormalized views that answer the analytical questions stakeholders actually ask. This chapter walks through the schema from first principles: which entity types exist, how their attributes and cardinality-bounded relationships become columns, foreign keys, and junction tables, and how each view's join reconstructs a domain fact from the normalized tables.

## The Core Entity Types

The model's backbone is the `forest_plantations` table, which records every managed woodland parcel. Each row carries a surrogate primary key `id`, a business-level `plantation_id` (such as `10238270` or the mnemonic `strategic-thinking`), the parcel's `area_hectares` (ranging from 10.20 to 22.80 in the sample), the `establishment_year` (encoded as small integers like 26 or 31), a `certification_status` drawn from the values `FSC_Certified`, `Pending_Certification`, and `Not_Certified`, the `primary_species` (e.g. `seasonal-primary-77`), the `land_use_history` (`Grassland`, `Degraded_Forestland`, `Natural_Forest`), and a `created_at` timestamp. Crucially, `forest_plantations` also holds three foreign-key columns: `country_code` pointing to `countries`, `company_id` pointing to `companies`, and `wood_product_id` pointing to `wood_products`. This design means a plantation row already knows its jurisdiction, its managing organization, and the timber product it yields.

**Table `forest_plantations`**

| id | plantation_id | area_hectares | establishment_year | certification_status | primary_species | land_use_history | country_code | company_id | wood_product_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10238270 | 10.20 | 26 | FSC_Certified | seasonal-primary-77 | Grassland | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Link Title | 1 | 2025-01-01 00:14:00 |
| 2 | strategic-thinking | 14.40 | 31 | Pending_Certification | regional-primary-78 | Degraded_Forestland | lu_tax_code_template_m_I_2 | Interac Association | 2 | 2025-02-06 03:14:00 |
| 3 | Bjornfant | 18.60 | 36 | Not_Certified | legacy-primary-79 | Natural_Forest | default_chart_a_account_57 | Stern Electronics | 3 | 2025-03-11 06:14:00 |
| 4 | 3717623 | 22.80 | 41 | FSC_Certified | compact-primary-80 | Grassland | 727045 | Navistar International | 4 | 2025-04-16 09:14:00 |

The `wood_products` table stores the output side of plantation management. Its primary key is `wood_product_id`, and each row identifies a product by a business-level `product_id` (such as `PRO-2172`), a human-readable `product_name` (`Composite Assessment`, `Compact Survey A`), a `product_category` (`Sawn_Timber`, `Electricity_Pole`, `Pulp`, `Charcoal`), the `production_volume` (6.70 to 11.80), the `production_year` (9 to 18), the `revenue_u_s_d` (11.88 to 30.51), and a `forest_plantation_id` foreign key that points back to the originating parcel. The cardinality here is one-to-one in the sample data—each plantation produces exactly one product—but the schema permits a plantation to be referenced by multiple product rows if diversification occurs.

**Table `wood_products`**

| wood_product_id | product_id | product_name | product_category | production_volume | production_year | revenue_u_s_d | forest_plantation_id |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2172 | Composite Assessment | Sawn_Timber | 6.70 | 9 | 13.13 | 1 |
| 2 | PRO-2179 | Compact Survey A | Electricity_Pole | 8.40 | 12 | 13.94 | 2 |
| 3 | PRO-2186 | Legacy Corridor | Pulp | 10.10 | 15 | 11.88 | 3 |
| 4 | PRO-2193 | Regional Series | Charcoal | 11.80 | 18 | 30.51 | 4 |

Carbon-offset issuance is captured in `carbon_credits`. Each row has a surrogate `id`, a business-level `credit_id` (such as `7119786` or the opaque `ChIJd13ymnZu5kcRXM7jx5boJBs`), the issuing `standard` (`VCS`, `Gold_Standard`, `Verified_Carbon_Standard`), the `issue_date`, the `volume_tonnes_c_o2` (22.45 to 32.80), the `revenue_u_s_d` (mirroring the wood product revenue in the sample), the `project_type` (`Forestation` or `Bio_Energy`), and a `forest_plantation_id` foreign key. Again, the sample shows a one-to-one mapping between plantations and credits, but the schema allows multiple credits per plantation if a parcel generates offsets under different standards or vintages.

**Table `carbon_credits`**

| id | credit_id | standard | issue_date | volume_tonnes_c_o2 | revenue_u_s_d | project_type | forest_plantation_id |
|---|---|---|---|---|---|---|---|
| 1 | 7119786 | VCS | 2023-02-01 | 22.45 | 13.13 | Forestation | 1 |
| 2 | gd_fp_ne_acc1 | Gold_Standard | 2024-07-12 | 25.90 | 13.94 | Bio_Energy | 2 |
| 3 | ChIJd13ymnZu5kcRXM7jx5boJBs | Verified_Carbon_Standard | 2025-12-23 | 29.35 | 11.88 | Forestation | 3 |
| 4 | 2933471 | VCS | 2022-05-07 | 32.80 | 30.51 | Bio_Energy | 4 |

Industrial processing is modeled in `industrial_facilities`. Each row carries a surrogate `id`, a business-level `facility_id` (`69447`, `1040`, `2986228`, or the opaque `ChIJvSxSbfdv5kcRanVzI8RRu20`), a `facility_name` (`Integrated Protocol A`, `Extended Programme`), a `location` identifier, an `operational_status` (`Active`, `Upgraded`, `Planned`), the `capacity` (7.45 to 20.80), the `revenue_u_s_d`, and three foreign keys: `country_code` → `countries`, `company_id` → `companies`, and `wood_product_id` → `wood_products`. Like `forest_plantations`, this table embeds its jurisdictional, organizational, and product context directly.

**Table `industrial_facilities`**

| id | facility_id | facility_name | location | operational_status | capacity | revenue_u_s_d | country_code | company_id | wood_product_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | extended-location-99 | Active | 7.45 | 13.13 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Link Title | 1 |
| 2 | 1040 | Extended Programme | integrated-location-100 | Upgraded | 11.90 | 13.94 | lu_tax_code_template_m_I_2 | Interac Association | 2 |
| 3 | 2986228 | Pilot Standard | seasonal-location-101 | Planned | 16.35 | 11.88 | default_chart_a_account_57 | Stern Electronics | 3 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | Active | 20.80 | 30.51 | 727045 | Navistar International | 4 |

The `companies` table is the organizational anchor. Its primary key is `company_id` (values such as `Link Title`, `Interac Association`, `Stern Electronics`, `Navistar International`). Each row records the `company_name` (`Feedback Rating`, `Virgin Group`, `United Technologies`, `Link Title`), the `founding_year` (43 to 58), the `headquarters` location (`composite-headquar-81`, `primary-headquar-82`, `adaptive-headquar-83`, `distributed-headquar-84`), the `shareholder_count` (2 to 29486), the `employee_count` (3 to 428), and a `carbon_credit_id` foreign key that links the company to its offset portfolio. In the sample, each company holds exactly one credit, but the schema supports a company issuing multiple credits.

**Table `companies`**

| company_id | company_name | founding_year | headquarters | shareholder_count | employee_count | carbon_credit_id |
|---|---|---|---|---|---|---|
| Link Title | Feedback Rating | 43 | composite-headquar-81 | 12 | 131 | 1 |
| Interac Association | Virgin Group | 48 | primary-headquar-82 | 29486 | 428 | 2 |
| Stern Electronics | United Technologies | 53 | adaptive-headquar-83 | 2 | 3 | 3 |
| Navistar International | Link Title | 58 | distributed-headquar-84 | 14297 | 9 | 4 |

The `countries` table provides the sovereign context. Its primary key is `country_code` (UUIDs like `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0` or short codes like `727045`). Each row stores the `country_name` (`Baseline Corridor D`, `Distributed Series`, `Adaptive Assessment`, `Primary Survey A`), the `region` (`distributed-region-12`, `baseline-region-13`, `pilot-region-14`, `extended-region-15`), and two foreign keys: `forest_plantation_id` and `industrial_facility_id`. This design means a country row directly references one plantation and one facility, establishing a tight coupling between jurisdiction and the assets it hosts.

**Table `countries`**

| country_code | country_name | region | forest_plantation_id | industrial_facility_id |
|---|---|---|---|---|
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | distributed-region-12 | 1 | 1 |
| lu_tax_code_template_m_I_2 | Distributed Series | baseline-region-13 | 2 | 2 |
| default_chart_a_account_57 | Adaptive Assessment | pilot-region-14 | 3 | 3 |
| 727045 | Primary Survey A | extended-region-15 | 4 | 4 |

## Junction Tables for Many-to-Many Relationships

Not all relationships are one-to-one. The model uses two junction tables to resolve many-to-many associations. The `companies_plantations` table breaks the direct `company_id` foreign key on `forest_plantations` into a proper M:N relationship, allowing a single company to manage multiple plantations and a single plantation to be co-managed by multiple companies. The surrogate `id` column on `forest_plantations` is retained for backward compatibility, but the junction table is the authoritative source for organizational assignments.

**Table `companies_plantations`**

| company_id | forest_plantation_id |
|---|---|
| Link Title | 1 |
| Link Title | 2 |
| Interac Association | 2 |
| Interac Association | 3 |
| Stern Electronics | 3 |
| Stern Electronics | 4 |
| Navistar International | 4 |
| Navistar International | 1 |

Similarly, the `companies_facilities` table resolves the many-to-many relationship between companies and industrial facilities. A company can operate multiple facilities, and a facility can be jointly operated by multiple companies. The junction table's composite key (implicitly `company_id` + `facility_id`) enforces uniqueness and prevents duplicate assignments.

**Table `companies_facilities`**

| company_id | industrial_facility_id |
|---|---|
| Link Title | 1 |
| Link Title | 2 |
| Interac Association | 2 |
| Interac Association | 3 |
| Stern Electronics | 3 |
| Stern Electronics | 4 |
| Navistar International | 4 |
| Navistar International | 1 |

## Foreign-Key Topology

The foreign-key graph forms a star centered on `forest_plantations`. The `wood_products` table points back to `forest_plantations` via `forest_plantation_id`. The `carbon_credits` table also points back to `forest_plantations` via `forest_plantation_id`. The `countries` table points forward to both `forest_plantations` and `industrial_facilities` via `forest_plantation_id` and `industrial_facility_id`. The `companies` table points forward to `carbon_credits` via `carbon_credit_id`. The `forest_plantations` and `industrial_facilities` tables each point to `countries`, `companies`, and `wood_products`. This topology means that any domain fact can be reconstructed by joining along these foreign-key edges.

## Analytical Views

The thirteen views materialize the most common analytical queries. Each view joins the relevant base tables and presents a denormalized result set that answers a specific business question.

### `vw_forest_plantation_country`

This view joins `forest_plantations` to `countries` on `country_code`, answering the question: *Which jurisdiction hosts each plantation?* A row such as plantation `10238270` (10.20 hectares, `FSC_Certified`, `Grassland`) paired with country `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0` (`Baseline Corridor D`, `distributed-region-12`) tells a regulator exactly where to look for compliance.

**View `vw_forest_plantation_country`**

```sql
CREATE VIEW vw_forest_plantation_country AS
SELECT a.id, a.plantation_id, a.area_hectares, a.establishment_year, b.country_code AS country_country_code, b.country_name AS country_country_name, b.region AS country_region
FROM forest_plantations a JOIN countries b ON a.country_code = b.country_code;
```

| id | plantation_id | area_hectares | establishment_year | country_country_code | country_country_name | country_region |
|---|---|---|---|---|---|---|
| 1 | 10238270 | 10.20 | 26 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | distributed-region-12 |
| 2 | strategic-thinking | 14.40 | 31 | lu_tax_code_template_m_I_2 | Distributed Series | baseline-region-13 |
| 3 | Bjornfant | 18.60 | 36 | default_chart_a_account_57 | Adaptive Assessment | pilot-region-14 |
| 4 | 3717623 | 22.80 | 41 | 727045 | Primary Survey A | extended-region-15 |

### `vw_forest_plantation_company`

This view joins `forest_plantations` to `companies` on `company_id`, answering: *Which organization manages each plantation?* The row for plantation `strategic-thinking` (14.40 hectares, `Pending_Certification`, `Degraded_Forestland`) linked to company `Interac Association` (`Virgin Group`, founded year 48, 29486 employees) gives an auditor a clear chain of accountability.

**View `vw_forest_plantation_company`**

```sql
CREATE VIEW vw_forest_plantation_company AS
SELECT a.id, a.plantation_id, a.area_hectares, a.establishment_year, b.company_id AS company_company_id, b.company_name AS company_company_name, b.founding_year AS company_founding_year
FROM forest_plantations a JOIN companies b ON a.company_id = b.company_id;
```

| id | plantation_id | area_hectares | establishment_year | company_company_id | company_company_name | company_founding_year |
|---|---|---|---|---|---|---|
| 1 | 10238270 | 10.20 | 26 | Link Title | Feedback Rating | 43 |
| 2 | strategic-thinking | 14.40 | 31 | Interac Association | Virgin Group | 48 |
| 3 | Bjornfant | 18.60 | 36 | Stern Electronics | United Technologies | 53 |
| 4 | 3717623 | 22.80 | 41 | Navistar International | Link Title | 58 |

### `vw_forest_plantation_wood_product`

This view joins `forest_plantations` to `wood_products` on `wood_product_id`, answering: *What timber product does each plantation yield?* The row for plantation `Bjornfant` (18.60 hectares, `Not_Certified`, `Natural_Forest`) paired with product `PRO-2186` (`Legacy Corridor`, `Pulp`, volume 10.10, revenue 11.88) connects land use to market output.

**View `vw_forest_plantation_wood_product`**

```sql
CREATE VIEW vw_forest_plantation_wood_product AS
SELECT a.id, a.plantation_id, a.area_hectares, a.establishment_year, b.wood_product_id AS product_wood_product_id, b.product_id AS product_product_id, b.product_name AS product_product_name
FROM forest_plantations a JOIN wood_products b ON a.wood_product_id = b.wood_product_id;
```

| id | plantation_id | area_hectares | establishment_year | product_wood_product_id | product_product_id | product_product_name |
|---|---|---|---|---|---|---|
| 1 | 10238270 | 10.20 | 26 | 1 | PRO-2172 | Composite Assessment |
| 2 | strategic-thinking | 14.40 | 31 | 2 | PRO-2179 | Compact Survey A |
| 3 | Bjornfant | 18.60 | 36 | 3 | PRO-2186 | Legacy Corridor |
| 4 | 3717623 | 22.80 | 41 | 4 | PRO-2193 | Regional Series |

### `vw_wood_product_forest_plantation`

This is the inverse of the previous view: it starts from the product and walks back to the plantation, answering: *Which plantation produces this product?* The row for product `PRO-2172` (`Composite Assessment`, `Sawn_Timber`, volume 6.70, revenue 13.13) pointing to plantation `10238270` (10.20 hectares, `FSC_Certified`) is useful for supply-chain traceability.

**View `vw_wood_product_forest_plantation`**

```sql
CREATE VIEW vw_wood_product_forest_plantation AS
SELECT a.wood_product_id, a.product_id, a.product_name, a.product_category, b.id AS plantation_id, b.plantation_id AS plantation_plantation_id, b.area_hectares AS plantation_area_hectares
FROM wood_products a JOIN forest_plantations b ON a.forest_plantation_id = b.id;
```

| wood_product_id | product_id | product_name | product_category | plantation_id | plantation_plantation_id | plantation_area_hectares |
|---|---|---|---|---|---|---|
| 1 | PRO-2172 | Composite Assessment | Sawn_Timber | 1 | 10238270 | 10.20 |
| 2 | PRO-2179 | Compact Survey A | Electricity_Pole | 2 | strategic-thinking | 14.40 |
| 3 | PRO-2186 | Legacy Corridor | Pulp | 3 | Bjornfant | 18.60 |
| 4 | PRO-2193 | Regional Series | Charcoal | 4 | 3717623 | 22.80 |

### `vw_carbon_credit_forest_plantation`

This view joins `carbon_credits` to `forest_plantations` on `forest_plantation_id`, answering: *Which plantation generated this carbon credit?* The row for credit `7119786` (`VCS` standard, 22.45 tonnes CO₂, `Forestation` project, revenue 13.13) linked to plantation `10238270` (10.20 hectares) lets a carbon trader verify the offset's provenance.

**View `vw_carbon_credit_forest_plantation`**

```sql
CREATE VIEW vw_carbon_credit_forest_plantation AS
SELECT a.id, a.credit_id, a.standard, a.issue_date, b.id AS plantation_id, b.plantation_id AS plantation_plantation_id, b.area_hectares AS plantation_area_hectares
FROM carbon_credits a JOIN forest_plantations b ON a.forest_plantation_id = b.id;
```

| id | credit_id | standard | issue_date | plantation_id | plantation_plantation_id | plantation_area_hectares |
|---|---|---|---|---|---|---|
| 1 | 7119786 | VCS | 2023-02-01 | 1 | 10238270 | 10.20 |
| 2 | gd_fp_ne_acc1 | Gold_Standard | 2024-07-12 | 2 | strategic-thinking | 14.40 |
| 3 | ChIJd13ymnZu5kcRXM7jx5boJBs | Verified_Carbon_Standard | 2025-12-23 | 3 | Bjornfant | 18.60 |
| 4 | 2933471 | VCS | 2022-05-07 | 4 | 3717623 | 22.80 |

### `vw_industrial_facility_country`

This view joins `industrial_facilities` to `countries` on `country_code`, answering: *In which jurisdiction does each facility operate?* The row for facility `69447` (`Integrated Protocol A`, `Active`, capacity 7.45, revenue 13.13) paired with country `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0` (`Baseline Corridor D`) provides the regulatory context for an environmental permit inquiry.

**View `vw_industrial_facility_country`**

```sql
CREATE VIEW vw_industrial_facility_country AS
SELECT a.id, a.facility_id, a.facility_name, a.location, b.country_code AS country_country_code, b.country_name AS country_country_name, b.region AS country_region
FROM industrial_facilities a JOIN countries b ON a.country_code = b.country_code;
```

| id | facility_id | facility_name | location | country_country_code | country_country_name | country_region |
|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | extended-location-99 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | distributed-region-12 |
| 2 | 1040 | Extended Programme | integrated-location-100 | lu_tax_code_template_m_I_2 | Distributed Series | baseline-region-13 |
| 3 | 2986228 | Pilot Standard | seasonal-location-101 | default_chart_a_account_57 | Adaptive Assessment | pilot-region-14 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 727045 | Primary Survey A | extended-region-15 |

### `vw_industrial_facility_company`

This view joins `industrial_facilities` to `companies` on `company_id`, answering: *Which company operates each facility?* The row for facility `1040` (`Extended Programme`, `Upgraded`, capacity 11.90) linked to company `Interac Association` (`Virgin Group`, 29486 employees) establishes operational responsibility.

**View `vw_industrial_facility_company`**

```sql
CREATE VIEW vw_industrial_facility_company AS
SELECT a.id, a.facility_id, a.facility_name, a.location, b.company_id AS company_company_id, b.company_name AS company_company_name, b.founding_year AS company_founding_year
FROM industrial_facilities a JOIN companies b ON a.company_id = b.company_id;
```

| id | facility_id | facility_name | location | company_company_id | company_company_name | company_founding_year |
|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | extended-location-99 | Link Title | Feedback Rating | 43 |
| 2 | 1040 | Extended Programme | integrated-location-100 | Interac Association | Virgin Group | 48 |
| 3 | 2986228 | Pilot Standard | seasonal-location-101 | Stern Electronics | United Technologies | 53 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | Navistar International | Link Title | 58 |

### `vw_industrial_facility_wood_product`

This view joins `industrial_facilities` to `wood_products` on `wood_product_id`, answering: *What product does each facility process?* The row for facility `2986228` (`Pilot Standard`, `Planned`, capacity 16.35) paired with product `PRO-2186` (`Legacy Corridor`, `Pulp`) connects processing capacity to product line.

**View `vw_industrial_facility_wood_product`**

```sql
CREATE VIEW vw_industrial_facility_wood_product AS
SELECT a.id, a.facility_id, a.facility_name, a.location, b.wood_product_id AS product_wood_product_id, b.product_id AS product_product_id, b.product_name AS product_product_name
FROM industrial_facilities a JOIN wood_products b ON a.wood_product_id = b.wood_product_id;
```

| id | facility_id | facility_name | location | product_wood_product_id | product_product_id | product_product_name |
|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | extended-location-99 | 1 | PRO-2172 | Composite Assessment |
| 2 | 1040 | Extended Programme | integrated-location-100 | 2 | PRO-2179 | Compact Survey A |
| 3 | 2986228 | Pilot Standard | seasonal-location-101 | 3 | PRO-2186 | Legacy Corridor |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | 4 | PRO-2193 | Regional Series |

### `vw_company_forest_plantation_detail`

This view joins `companies` to `forest_plantations` through the `company_id` foreign key, answering: *What is the full detail of each company's plantation portfolio?* The row for company `Link Title` (`Feedback Rating`, founded year 43, 131 employees) paired with plantation `10238270` (10.20 hectares, `FSC_Certified`, `seasonal-primary-77`, `Grassland`) gives a portfolio manager a consolidated view of land assets.

**View `vw_company_forest_plantation_detail`**

```sql
CREATE VIEW vw_company_forest_plantation_detail AS
SELECT a.company_id, a.company_name, a.founding_year, b.id AS plantation_id, b.plantation_id AS plantation_plantation_id, b.area_hectares AS plantation_area_hectares
FROM companies a
  JOIN companies_plantations j ON j.company_id = a.company_id
  JOIN forest_plantations b ON b.id = j.forest_plantation_id;
```

| company_id | company_name | founding_year | plantation_id | plantation_plantation_id | plantation_area_hectares |
|---|---|---|---|---|---|
| Link Title | Feedback Rating | 43 | 1 | 10238270 | 10.20 |
| Link Title | Feedback Rating | 43 | 2 | strategic-thinking | 14.40 |
| Interac Association | Virgin Group | 48 | 2 | strategic-thinking | 14.40 |
| Interac Association | Virgin Group | 48 | 3 | Bjornfant | 18.60 |
| Stern Electronics | United Technologies | 53 | 3 | Bjornfant | 18.60 |
| Stern Electronics | United Technologies | 53 | 4 | 3717623 | 22.80 |
| Navistar International | Link Title | 58 | 4 | 3717623 | 22.80 |
| Navistar International | Link Title | 58 | 1 | 10238270 | 10.20 |

### `vw_company_industrial_facility_detail`

This view joins `companies` to `industrial_facilities` through the `company_id` foreign key, answering: *What is the full detail of each company's industrial portfolio?* The row for company `Stern Electronics` (`United Technologies`, founded year 53, 3 employees) paired with facility `2986228` (`Pilot Standard`, `Planned`, capacity 16.35, revenue 11.88) provides an operations director with a consolidated view of processing assets.

**View `vw_company_industrial_facility_detail`**

```sql
CREATE VIEW vw_company_industrial_facility_detail AS
SELECT a.company_id, a.company_name, a.founding_year, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM companies a
  JOIN companies_facilities j ON j.company_id = a.company_id
  JOIN industrial_facilities b ON b.id = j.industrial_facility_id;
```

| company_id | company_name | founding_year | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|
| Link Title | Feedback Rating | 43 | 1 | 69447 | Integrated Protocol A |
| Link Title | Feedback Rating | 43 | 2 | 1040 | Extended Programme |
| Interac Association | Virgin Group | 48 | 2 | 1040 | Extended Programme |
| Interac Association | Virgin Group | 48 | 3 | 2986228 | Pilot Standard |
| Stern Electronics | United Technologies | 53 | 3 | 2986228 | Pilot Standard |
| Stern Electronics | United Technologies | 53 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| Navistar International | Link Title | 58 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |
| Navistar International | Link Title | 58 | 1 | 69447 | Integrated Protocol A |

### `vw_company_carbon_credit`

This view joins `companies` to `carbon_credits` through the `carbon_credit_id` foreign key, answering: *Which carbon credits does each company hold?* The row for company `Navistar International` (`Link Title`, founded year 58, 14297 shareholders) paired with credit `2933471` (`VCS` standard, 32.80 tonnes CO₂, `Bio_Energy` project, revenue 30.51) gives a sustainability officer a clear picture of the company's offset holdings.

**View `vw_company_carbon_credit`**

```sql
CREATE VIEW vw_company_carbon_credit AS
SELECT a.company_id, a.company_name, a.founding_year, a.headquarters, b.id AS credit_id, b.credit_id AS credit_credit_id, b.standard AS credit_standard
FROM companies a JOIN carbon_credits b ON a.carbon_credit_id = b.id;
```

| company_id | company_name | founding_year | headquarters | credit_id | credit_credit_id | credit_standard |
|---|---|---|---|---|---|---|
| Link Title | Feedback Rating | 43 | composite-headquar-81 | 1 | 7119786 | VCS |
| Interac Association | Virgin Group | 48 | primary-headquar-82 | 2 | gd_fp_ne_acc1 | Gold_Standard |
| Stern Electronics | United Technologies | 53 | adaptive-headquar-83 | 3 | ChIJd13ymnZu5kcRXM7jx5boJBs | Verified_Carbon_Standard |
| Navistar International | Link Title | 58 | distributed-headquar-84 | 4 | 2933471 | VCS |

### `vw_country_forest_plantation`

This view joins `countries` to `forest_plantations` through the `forest_plantation_id` foreign key on `countries`, answering: *Which plantations are located in each country?* The row for country `lu_tax_code_template_m_I_2` (`Distributed Series`, `baseline-region-13`) paired with plantation `strategic-thinking` (14.40 hectares, `Pending_Certification`, `regional-primary-78`, `Degraded_Forestland`) gives a government analyst a jurisdiction-level inventory.

**View `vw_country_forest_plantation`**

```sql
CREATE VIEW vw_country_forest_plantation AS
SELECT a.country_code, a.country_name, a.region, a.industrial_facility_id, b.id AS plantation_id, b.plantation_id AS plantation_plantation_id, b.area_hectares AS plantation_area_hectares
FROM countries a JOIN forest_plantations b ON a.forest_plantation_id = b.id;
```

| country_code | country_name | region | industrial_facility_id | plantation_id | plantation_plantation_id | plantation_area_hectares |
|---|---|---|---|---|---|---|
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | distributed-region-12 | 1 | 1 | 10238270 | 10.20 |
| lu_tax_code_template_m_I_2 | Distributed Series | baseline-region-13 | 2 | 2 | strategic-thinking | 14.40 |
| default_chart_a_account_57 | Adaptive Assessment | pilot-region-14 | 3 | 3 | Bjornfant | 18.60 |
| 727045 | Primary Survey A | extended-region-15 | 4 | 4 | 3717623 | 22.80 |

### `vw_country_industrial_facility`

This view joins `countries` to `industrial_facilities` through the `industrial_facility_id` foreign key on `countries`, answering: *Which facilities operate in each country?* The row for country `default_chart_a_account_57` (`Adaptive Assessment`, `pilot-region-14`) paired with facility `2986228` (`Pilot Standard`, `Planned`, capacity 16.35, revenue 11.88) provides a regional economic development office with a facility inventory.

**View `vw_country_industrial_facility`**

```sql
CREATE VIEW vw_country_industrial_facility AS
SELECT a.country_code, a.country_name, a.region, a.forest_plantation_id, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM countries a JOIN industrial_facilities b ON a.industrial_facility_id = b.id;
```

| country_code | country_name | region | forest_plantation_id | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | distributed-region-12 | 1 | 1 | 69447 | Integrated Protocol A |
| lu_tax_code_template_m_I_2 | Distributed Series | baseline-region-13 | 2 | 2 | 1040 | Extended Programme |
| default_chart_a_account_57 | Adaptive Assessment | pilot-region-14 | 3 | 3 | 2986228 | Pilot Standard |
| 727045 | Primary Survey A | extended-region-15 | 4 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

## Synthesis

The schema models the forestry-carbon-industry ecosystem as a network of eight normalized tables linked by foreign keys and two junction tables. The `forest_plantations` table sits at the center, with `wood_products` and `carbon_credits` pointing back to it, while `countries`, `companies`, and `industrial_facilities` radiate outward. The thirteen views reassemble these normalized pieces into denormalized result sets that answer the specific questions regulators, auditors, portfolio managers, and sustainability officers need answered. Every row in every view traces back to a concrete base-table record—plantation `10238270` with 10.20 hectares, product `PRO-2172` in the `Sawn_Timber` category, credit `7119786` under the `VCS` standard—ensuring that analytical results remain grounded in auditable, normalized data.