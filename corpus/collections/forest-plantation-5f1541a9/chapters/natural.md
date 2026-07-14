## Forest Resource Management and Carbon Accounting

The modern forestry sector operates at the intersection of land management, industrial processing, and environmental markets. Organizations that cultivate forest plantations must simultaneously track timber production, manage carbon sequestration assets, and coordinate with industrial facilities that convert raw wood into marketable products. This chapter examines the data architecture that supports these interconnected operations, drawing on records from forest plantations, wood product manufacturing, carbon credit issuance, and industrial processing across multiple countries and companies.

**Table `forest_plantations`**

| id | plantation_id | area_hectares | establishment_year | certification_status | primary_species | land_use_history | country_code | company_id | wood_product_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10238270 | 10.20 | 26 | FSC_Certified | seasonal-primary-77 | Grassland | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Link Title | 1 | 2025-01-01 00:14:00 |
| 2 | strategic-thinking | 14.40 | 31 | Pending_Certification | regional-primary-78 | Degraded_Forestland | lu_tax_code_template_m_I_2 | Interac Association | 2 | 2025-02-06 03:14:00 |
| 3 | Bjornfant | 18.60 | 36 | Not_Certified | legacy-primary-79 | Natural_Forest | default_chart_a_account_57 | Stern Electronics | 3 | 2025-03-11 06:14:00 |
| 4 | 3717623 | 22.80 | 41 | FSC_Certified | compact-primary-80 | Grassland | 727045 | Navistar International | 4 | 2025-04-16 09:14:00 |

Forest plantations form the foundational layer of the supply chain. Each plantation record captures the physical and administrative attributes of a managed forest tract. The plantation with identifier `10238270` spans 10.20 hectares and was established in year 26, operating under FSC_Certified status with seasonal-primary-77 as its primary species. Its land use history traces back to former Grassland, indicating a conversion from open pasture to managed forest. The plantation at `strategic-thinking` covers 14.40 hectares with Pending_Certification status and was developed on Degraded_Forestland, suggesting a restoration project. The Bjornfant plantation, at 18.60 hectares, remains Not_Certified and sits on Natural_Forest land, while the 3717623 plantation encompasses 22.80 hectares on former Grassland with FSC_Certified status and compact-primary-80 as its dominant species. Each plantation is associated with a country through its country_code and operated by a company identified by company_id.

**Table `wood_products`**

| wood_product_id | product_id | product_name | product_category | production_volume | production_year | revenue_u_s_d | forest_plantation_id |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2172 | Composite Assessment | Sawn_Timber | 6.70 | 9 | 13.13 | 1 |
| 2 | PRO-2179 | Compact Survey A | Electricity_Pole | 8.40 | 12 | 13.94 | 2 |
| 3 | PRO-2186 | Legacy Corridor | Pulp | 10.10 | 15 | 11.88 | 3 |
| 4 | PRO-2193 | Regional Series | Charcoal | 11.80 | 18 | 30.51 | 4 |

Wood products represent the commercial output derived from forest plantations. The product PRO-2172, classified as Composite Assessment within the Sawn_Timber category, was produced with a volume of 6.70 units in year 9, generating revenue of 13.13 U.S. dollars. The product PRO-2179, named Compact Survey A and categorized as Electricity_Pole, achieved a production volume of 8.40 units in year 12 with revenue of 13.94 U.S. dollars. Legacy Corridor (PRO-2186), a Pulp product, yielded 10.10 units in year 15 for 11.88 U.S. dollars, while Regional Series (PRO-2193), classified as Charcoal, produced 11.80 units in year 18 generating the highest revenue at 30.51 U.S. dollars. Each wood product is traceable to its source forest_plantation_id, enabling full chain-of-custody documentation from standing timber to finished good.

**Table `carbon_credits`**

| id | credit_id | standard | issue_date | volume_tonnes_c_o2 | revenue_u_s_d | project_type | forest_plantation_id |
|---|---|---|---|---|---|---|---|
| 1 | 7119786 | VCS | 2023-02-01 | 22.45 | 13.13 | Forestation | 1 |
| 2 | gd_fp_ne_acc1 | Gold_Standard | 2024-07-12 | 25.90 | 13.94 | Bio_Energy | 2 |
| 3 | ChIJd13ymnZu5kcRXM7jx5boJBs | Verified_Carbon_Standard | 2025-12-23 | 29.35 | 11.88 | Forestation | 3 |
| 4 | 2933471 | VCS | 2022-05-07 | 32.80 | 30.51 | Bio_Energy | 4 |

Carbon credits quantify the environmental value of forest management activities. The credit identified as 7119786 was issued under the VCS standard on 2023-02-01, representing 22.45 tonnes of CO2 sequestered through a Forestation project type, with associated revenue of 13.13 U.S. dollars. The credit gd_fp_ne_acc1 carries the Gold_Standard designation, issued 2024-07-12 for 25.90 tonnes under a Bio_Energy project, yielding 13.94 U.S. dollars. Credit ChIJd13ymnZu5kcRXM7jx5boJBs, verified under the Verified_Carbon_Standard on 2025-12-23, accounts for 29.35 tonnes from a Forestation initiative at 11.88 U.S. dollars revenue. The credit 2933471, also VCS-standard and dated 2022-05-07, represents 32.80 tonnes from Bio_Energy, generating 30.51 U.S. dollars. Each credit links to its originating forest_plantation_id, establishing the environmental provenance of every tonne of carbon offset.

**Table `industrial_facilities`**

| id | facility_id | facility_name | location | operational_status | capacity | revenue_u_s_d | country_code | company_id | wood_product_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | extended-location-99 | Active | 7.45 | 13.13 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Link Title | 1 |
| 2 | 1040 | Extended Programme | integrated-location-100 | Upgraded | 11.90 | 13.94 | lu_tax_code_template_m_I_2 | Interac Association | 2 |
| 3 | 2986228 | Pilot Standard | seasonal-location-101 | Planned | 16.35 | 11.88 | default_chart_a_account_57 | Stern Electronics | 3 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | regional-location-102 | Active | 20.80 | 30.51 | 727045 | Navistar International | 4 |

Industrial facilities transform raw timber into processed products. The facility 69447, named Integrated Protocol A, operates at extended-location-99 with Active status and a processing capacity of 7.45 units, generating 13.13 U.S. dollars in revenue. Facility 1040, designated Extended Programme, is located at integrated-location-100, holds Upgraded status, and processes 11.90 units for 13.94 U.S. dollars. The 2986228 facility, Pilot Standard, sits at seasonal-location-101 in Planned status with a capacity of 16.35 units and revenue of 11.88 U.S. dollars. Facility ChIJvSxSbfdv5kcRanVzI8RRu20, Baseline Framework D, operates at regional-location-102 with Active status, the highest capacity of 20.80 units, and revenue of 30.51 U.S. dollars. Each facility is geolocated by country_code, operated by a company, and supplied by a wood_product_id, completing the production chain.

**Table `companies`**

| company_id | company_name | founding_year | headquarters | shareholder_count | employee_count | carbon_credit_id |
|---|---|---|---|---|---|---|
| Link Title | Feedback Rating | 43 | composite-headquar-81 | 12 | 131 | 1 |
| Interac Association | Virgin Group | 48 | primary-headquar-82 | 29486 | 428 | 2 |
| Stern Electronics | United Technologies | 53 | adaptive-headquar-83 | 2 | 3 | 3 |
| Navistar International | Link Title | 58 | distributed-headquar-84 | 14297 | 9 | 4 |

Companies serve as the organizational entities managing the entire value chain. The company identified as Link Title was founded in year 43, headquartered at composite-headquar-81, with 12 shareholders and 131 employees, holding carbon_credit_id 1. Interac Association, established in year 48 at primary-headquar-82, operates with 29,486 shareholders and 428 employees, managing carbon_credit_id 2. Stern Electronics, founded in year 53 at adaptive-headquar-83, has 2 shareholders and 3 employees with carbon_credit_id 3. Navistar International, the largest by founding year at 58, is headquartered at distributed-headquar-84 with 14,297 shareholders and 9 employees, associated with carbon_credit_id 4. Each company's carbon_credit_id ties its corporate portfolio to specific environmental asset holdings.

**Table `countries`**

| country_code | country_name | region | forest_plantation_id | industrial_facility_id |
|---|---|---|---|---|
| 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | distributed-region-12 | 1 | 1 |
| lu_tax_code_template_m_I_2 | Distributed Series | baseline-region-13 | 2 | 2 |
| default_chart_a_account_57 | Adaptive Assessment | pilot-region-14 | 3 | 3 |
| 727045 | Primary Survey A | extended-region-15 | 4 | 4 |

Countries provide the geographic and regulatory framework within which all operations occur. The country with code 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 is named Baseline Corridor D and belongs to distributed-region-12, hosting forest_plantation_id 1 and industrial_facility_id 1. Country lu_tax_code_template_m_I_2, labeled Distributed Series in baseline-region-13, contains plantation 2 and facility 2. The country default_chart_a_account_57, known as Adaptive Assessment in pilot-region-14, encompasses plantation 3 and facility 3. Country 727045, designated Primary Survey A within extended-region-15, holds plantation 4 and facility 4. These country records anchor all plantation and facility operations to their respective jurisdictions.

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

The companies_plantations junction table establishes which organizations manage which forest tracts. This many-to-many relationship allows a single company to operate multiple plantations across different regions and enables joint ventures where multiple companies share management responsibilities for a single plantation. The table's structure ensures that every plantation has a clear organizational owner while supporting the flexibility needed in large-scale forestry operations where land management contracts may shift over time.

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

Similarly, companies_facilities links corporate entities to their industrial processing operations. A company may own or operate multiple facilities, and facilities may be managed by different companies through operational agreements. This junction table captures those relationships, ensuring that every industrial facility has a responsible corporate entity while accommodating the complex ownership structures common in industrial processing sectors.

## Geographic and Organizational Perspectives

The joined views synthesize these base records to answer specific operational questions. The view vw_forest_plantation_country combines plantation data with country information, answering which forest tracts operate within which jurisdictions. For example, the plantation 10238270 appears alongside country Baseline Corridor D (code 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0), confirming that this 10.20-hectare FSC_Certified tract falls under the regulatory authority of distributed-region-12. The Bjornfant plantation, at 18.60 hectares with Not_Certified status, is associated with country Adaptive Assessment (default_chart_a_account_57) in pilot-region-14, providing a clear regulatory context for its certification gap.

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

The view vw_forest_plantation_company links each plantation to its operating company, answering the question of corporate responsibility for each managed tract. The plantation 10238270 is operated by the company identified as Link Title, establishing organizational accountability for this 10.20-hectare FSC_Certified Grassland conversion. The strategic-thinking plantation, covering 14.40 hectares on Degraded_Forestland, is managed by Interac Association, a company with 29,486 shareholders and 428 employees headquartered at primary-headquar-82. This linkage enables stakeholders to trace environmental performance back to specific corporate entities.

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

The view vw_forest_plantation_wood_product connects each plantation to its derived wood products, answering which timber outputs originate from which forest tracts. The plantation 10238270 produces the wood product PRO-2172 (Composite Assessment, Sawn_Timber), with a production volume of 6.70 units and revenue of 13.13 U.S. dollars. The plantation 3717622, at 22.80 hectares, yields product PRO-2193 (Regional Series, Charcoal), generating the highest revenue of 30.51 U.S. dollars from 11.80 production units. This view enables yield analysis and revenue attribution at the plantation level.

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

The view vw_wood_product_forest_plantation reverses the perspective, answering which forest tracts supply each wood product. Product PRO-2172 (Composite Assessment, Sawn_Timber) traces back to plantation 10238270, a 10.20-hectare FSC_Certified tract on former Grassland. Product PRO-2186 (Legacy Corridor, Pulp) originates from plantation Bjornfant, an 18.60-hectare Not_Certified Natural_Forest site. This reverse linkage supports supply chain verification and quality追溯, allowing buyers to confirm the provenance of their timber purchases.

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

The view vw_carbon_credit_forest_plantation maps each carbon credit to its originating plantation, answering the environmental provenance question central to carbon markets. Credit 7119786 (VCS standard, 22.45 tonnes, Forestation project) derives from plantation 10238270, a 10.20-hectare FSC_Certified tract. Credit ChIJd13ymnZu5kcRXM7jx5boJBs (Verified_Carbon_Standard, 29.35 tonnes, Forestation project) originates from plantation Bjornfant, an 18.60-hectare Natural_Forest site. This view ensures that every carbon credit sold can be traced to a specific managed forest tract, maintaining market integrity.

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

The view vw_industrial_facility_country joins facility data with country records, answering which industrial operations occur within which jurisdictions. Facility 69447 (Integrated Protocol A, Active status, capacity 7.45) operates within country Baseline Corridor D (2e55e0b6-8fcc-11eb-924d-9cd76263cbd0) in distributed-region-12. Facility 2986228 (Pilot Standard, Planned status, capacity 16.35) is located in country Adaptive Assessment (default_chart_a_account_57) within pilot-region-14. This geographic linkage supports regulatory compliance reporting and regional capacity analysis.

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

The view vw_industrial_facility_company links each facility to its operating company, answering which organization is responsible for each processing operation. Facility 69447 (Integrated Protocol A) is operated by the company identified as Link Title, a firm founded in year 43 with 131 employees. Facility 1040 (Extended Programme, Upgraded status, capacity 11.90) is managed by Interac Association, the company with 29,486 shareholders. This view enables corporate performance tracking across the industrial processing portfolio.

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

The view vw_industrial_facility_wood_product connects each facility to the wood products it processes, answering which facilities handle which product categories. Facility 69447 (Integrated Protocol A) processes wood product PRO-2172 (Composite Assessment, Sawn_Timber), with production volume 6.70 and revenue 13.13 U.S. dollars. Facility ChIJvSxSbfdv5kcRanVzI8RRu20 (Baseline Framework D, capacity 20.80) processes product PRO-2193 (Regional Series, Charcoal), generating revenue of 30.51 U.S. dollars. This linkage supports capacity planning and product mix optimization.

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

The view vw_company_forest_plantation_detail provides a comprehensive corporate-plantation perspective, combining company attributes with plantation characteristics. The company Link Title (founded year 43, 131 employees) operates plantation 10238270, a 10.20-hectare FSC_Certified seasonal-primary-77 tract on former Grassland. Interac Association (founded year 48, 428 employees, 29,486 shareholders) manages plantation strategic-thinking, a 14.40-hectare Pending_Certification site on Degraded_Forestland. This detailed view supports corporate portfolio analysis and ESG reporting.

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

The view vw_company_industrial_facility_detail combines company information with facility operations, answering which organizations run which processing plants and at what scale. Company Link Title (founded year 43, headquarters composite-headquar-81) operates facility 69447 (Integrated Protocol A, Active, capacity 7.45, revenue 13.13 U.S. dollars) in country Baseline Corridor D. Company Interac Association (founded year 48, 428 employees) runs facility 1040 (Extended Programme, Upgraded, capacity 11.90, revenue 13.94 U.S. dollars) in country Distributed Series. This view enables corporate capacity benchmarking and operational efficiency analysis.

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

The view vw_company_carbon_credit links each company to its carbon credit holdings, answering which organizations control which environmental assets. Company Link Title (131 employees) holds carbon credit 7119786 (VCS, 22.45 tonnes, Forestation, revenue 13.13 U.S. dollars). Company Interac Association (428 employees, 29,486 shareholders) holds credit gd_fp_ne_acc1 (Gold_Standard, 25.90 tonnes, Bio_Energy, revenue 13.94 U.S. dollars). This view supports corporate carbon portfolio management and environmental asset valuation.

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

The view vw_country_forest_plantation aggregates plantation data by country, answering which jurisdictions contain which forest management operations. Country Baseline Corridor D (2e55e0b6-8fcc-11eb-924d-9cd76263cbd0, distributed-region-12) contains plantation 10238270, a 10.20-hectare FSC_Certified seasonal-primary-77 tract on former Grassland. Country Distributed Series (lu_tax_code_template_m_I_2, baseline-region-13) contains plantation strategic-thinking, a 14.40-hectare Pending_Certification regional-primary-78 site on Degraded_Forestland. This view supports regional forestry statistics and policy analysis.

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

The view vw_country_industrial_facility aggregates facility data by country, answering which jurisdictions host which industrial processing operations. Country Baseline Corridor D (distributed-region-12) hosts facility 69447 (Integrated Protocol A, Active, capacity 7.45, revenue 13.13 U.S. dollars). Country Distributed Series (baseline-region-13) hosts facility 1040 (Extended Programme, Upgraded, capacity 11.90, revenue 13.94 U.S. dollars). This view enables regional industrial capacity assessment and economic impact analysis.

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

The data architecture described here supports a complete chain of custody from standing timber through industrial processing to carbon market participation. Forest plantations serve as the physical foundation, each characterized by its area, species composition, certification status, and land use history. Wood products translate biological growth into commercial value, with each product traceable to its source plantation. Carbon credits quantify the environmental benefits of forest management, linking sequestration volumes to specific tracts and project types. Industrial facilities convert raw timber into finished goods, with capacity and operational status reflecting processing capability. Companies orchestrate the entire value chain, managing plantations, operating facilities, and holding carbon assets. Countries provide the regulatory and geographic context within which all operations occur. Together, these records form an integrated management system that enables organizations to track environmental performance, commercial output, and corporate responsibility across the full forestry value chain.