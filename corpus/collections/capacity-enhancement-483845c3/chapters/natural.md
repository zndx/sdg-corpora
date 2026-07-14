Capacity planning in modern energy infrastructure demands a coordinated view of facilities, product lines, enterprises, and the geographic regions they inhabit. Practitioners must track how planned megawatt targets compare to actual output, how manufacturing sites are organized under different ownership models, and how product categories map to specific operational contexts. The records below capture these relationships across five base tables and twelve derived views, each answering a distinct operational question.

## Capacity Enhancement Records

Capacity enhancements represent discrete planning events tied to specific manufacturing facilities and enterprises. Each record documents a planned megawatt target, the actual output achieved, the planning period under which it was scoped, and its current status.

**Table `capacity_enhancements`**

| capacity_enhancement_id | planned_capacity_m_w | actual_capacity_m_w | planning_period | effective_date | status | manufacturing_facility_id | enterprise_id |
|---|---|---|---|---|---|---|---|
| 1000 | 8.45 | 18.20 | seasonal-planning-89 | 2023-02-14 | planned | 1000 | 1 |
| 1001 | 12.90 | 20.40 | regional-planning-90 | 2024-07-25 | in_progress | 1001 | 2 |
| 1002 | 17.35 | 22.60 | legacy-planning-91 | 2025-12-09 | complete | 1002 | 3 |
| 1003 | 21.80 | 24.80 | compact-planning-92 | 2022-05-20 | cancelled | 1003 | 4 |

Consider the first record: enhancement 1000 was scoped under the planning period `seasonal-planning-89` with a planned capacity of 8.45 MW, yet the actual output reached 18.20 MW, nearly double the projection. This enhancement is linked to facility 1000 and enterprise 1, and its status remains `planned`. By contrast, enhancement 1003 — associated with facility 1003 and enterprise 4 — carries a planned capacity of 21.80 MW and an actual of 24.80 MW, but its status is `cancelled`, indicating the project was halted despite exceeding its target. The `in_progress` status of enhancement 1001 (12.90 MW planned, 20.40 MW actual) and the `complete` status of enhancement 1002 (17.35 MW planned, 22.60 MW actual) illustrate the lifecycle of these planning events.

## Manufacturing Facilities and Their Attributes

Manufacturing facilities serve as the physical backbone of capacity planning. Each facility carries a name, a location identifier, a type classification, and an operational status that together determine its readiness for production.

**Table `manufacturing_facilities`**

| id | facility_name | location | facility_type | operational_status | geographic_region_id | product_line_id |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | extended-location-99 | integrated | planned | 1000 | 1 |
| 1001 | Extended Programme | integrated-location-100 | standalone | under_construction | 1001 | 2 |
| 1002 | Pilot Standard | seasonal-location-101 | joint_venture | operational | 1002 | 3 |
| 1003 | Baseline Framework D | regional-location-102 | integrated | decommissioned | 1003 | 4 |

Facility 1000, named "Integrated Protocol A," is classified as `integrated` and sits in `extended-location-99`. Its operational status is `planned`, meaning it has not yet begun operations. Facility 1001, "Extended Programme," is a `standalone` facility currently `under_construction` at `integrated-location-100`. Facility 1002, "Pilot Standard," is a `joint_venture` that is fully `operational` at `seasonal-location-101`. Facility 1003, "Baseline Framework D," is an `integrated` facility that has been `decommissioned` at `regional-location-102`. Each facility is associated with a geographic region and a product line, creating the structural links that the derived views expose.

## Product Lines and Technology Readiness

Product lines define the categories of output that facilities are designed to produce. Each product line carries a technology readiness level (TRL), a target output in megawatts, and a strategic designation that signals its priority within the enterprise portfolio.

**Table `product_lines`**

| id | product_category | technology_readiness_level | target_output_m_w | is_strategic | enterprise_id | manufacturing_facility_id |
|---|---|---|---|---|---|---|
| 1 | composite-product-87 | 40 | 15.20 | false | 1 | 1000 |
| 2 | primary-product-88 | 50 | 18.40 | true | 2 | 1001 |
| 3 | adaptive-product-89 | 60 | 21.60 | false | 3 | 1002 |
| 4 | distributed-product-90 | 70 | 24.80 | true | 4 | 1003 |

Product line 1, categorized as `composite-product-87`, has a technology readiness level of 40 and a target output of 15.20 MW. It is not designated as strategic (`is_strategic` is `false`). Product line 2, `primary-product-88`, reaches a TRL of 50 with a target of 18.40 MW and is marked as strategic. Product line 3, `adaptive-product-89`, sits at TRL 60 with a target of 21.60 MW and is non-strategic. Product line 4, `distributed-product-90`, achieves the highest readiness level at 70, targets 24.80 MW, and is strategic. Each product line is tied to a specific enterprise and manufacturing facility, anchoring the product strategy to operational reality.

## Enterprise Registry and Ownership Models

Enterprises represent the organizational entities that own, operate, or regulate the manufacturing infrastructure. The registry captures ownership type, registration number, and the regulatory authority responsible for oversight.

**Table `enterprises`**

| id | enterprise_name | ownership_type | registration_number | regulatory_authority | manufacturing_facility_id | product_line_id | enterprise_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | public_sector | REG-2136 | composite-regulato-99 | 1000 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Adaptive Review D | private_sector | REG-2142 | primary-regulato-100 | 1001 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Primary Initiative | joint_venture | REG-2148 | adaptive-regulato-101 | 1002 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Composite Model | public_sector | REG-2154 | distributed-regulato-102 | 1003 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Enterprise 1, "Distributed Cluster," operates as a `public_sector` entity with registration number `REG-2136` under the regulatory authority `composite-regulato-99`. Enterprise 2, "Adaptive Review D," is a `private_sector` entity (`REG-2142`) overseen by `primary-regulato-100`. Enterprise 3, "Primary Initiative," is structured as a `joint_venture` (`REG-2148`) under `adaptive-regulato-101`. Enterprise 4, "Composite Model," returns to `public_sector` status (`REG-2154`) with oversight from `distributed-regulato-102`. Each enterprise is linked to a manufacturing facility, a product line, and its own parent enterprise, enabling both hierarchical and lateral analysis.

## Geographic Regions and Jurisdictional Boundaries

Geographic regions define the spatial and regulatory context in which manufacturing facilities operate. Each region carries a name, country code, state or province designation, and a region type that classifies its administrative character.

**Table `geographic_regions`**

| id | region_name | country_code | state_province | region_type | manufacturing_facility_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | primary-state-28 | state | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Adaptive Survey D | lu_tax_code_template_m_I_2 | adaptive-state-29 | district | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Primary Corridor | default_chart_a_account_57 | distributed-state-30 | city | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Composite Series | 727045 | baseline-state-31 | industrial_zone | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Region 1000, "Distributed Assessment," is classified as a `state` with country code `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0` and state `primary-state-28`. Region 1001, "Adaptive Survey D," is a `district` (`lu_tax_code_template_m_I_2`, `adaptive-state-29`). Region 1002, "Primary Corridor," is a `city` (`default_chart_a_account_57`, `distributed-state-30`). Region 1003, "Composite Series," is an `industrial_zone` (`727045`, `baseline-state-31`). Each region is associated with a manufacturing facility, forming the geographic anchor for facility-level analysis.

## Capacity Enhancement and Manufacturing Facility Alignment

The view joining capacity enhancements with manufacturing facilities answers a fundamental question: which facility is responsible for each capacity planning event, and how do planned and actual outputs compare at the site level?

**View `v_capacity_enhancement_manufacturing_facility`**

```sql
CREATE VIEW v_capacity_enhancement_manufacturing_facility AS
SELECT a.capacity_enhancement_id, a.planned_capacity_m_w, a.actual_capacity_m_w, a.planning_period, b.id AS facility_id, b.facility_name AS facility_facility_name, b.location AS facility_location
FROM capacity_enhancements a JOIN manufacturing_facilities b ON a.manufacturing_facility_id = b.id;
```

| capacity_enhancement_id | planned_capacity_m_w | actual_capacity_m_w | planning_period | facility_id | facility_facility_name | facility_location |
|---|---|---|---|---|---|---|
| 1000 | 8.45 | 18.20 | seasonal-planning-89 | 1000 | Integrated Protocol A | extended-location-99 |
| 1001 | 12.90 | 20.40 | regional-planning-90 | 1001 | Extended Programme | integrated-location-100 |
| 1002 | 17.35 | 22.60 | legacy-planning-91 | 1002 | Pilot Standard | seasonal-location-101 |
| 1003 | 21.80 | 24.80 | compact-planning-92 | 1003 | Baseline Framework D | regional-location-102 |

Row 1 shows enhancement 1000 at facility 1000 ("Integrated Protocol A") in location `extended-location-99`. The planned capacity of 8.45 MW was exceeded by the actual output of 18.20 MW, a surplus of 9.75 MW. Row 3 shows enhancement 1002 at facility 1002 ("Pilot Standard") in location `seasonal-location-101`, where the planned 17.35 MW was surpassed by 22.60 MW actual. These rows demonstrate that facilities consistently outperform their planned targets, though the degree of overperformance varies.

## Capacity Enhancement and Enterprise Linkage

This view connects each capacity enhancement to its owning enterprise, revealing which organizations are driving capacity growth and how their projects compare in scale.

**View `v_capacity_enhancement_enterprise`**

```sql
CREATE VIEW v_capacity_enhancement_enterprise AS
SELECT a.capacity_enhancement_id, a.planned_capacity_m_w, a.actual_capacity_m_w, a.planning_period, b.id AS enterprise_id, b.enterprise_name AS enterprise_enterprise_name, b.ownership_type AS enterprise_ownership_type
FROM capacity_enhancements a JOIN enterprises b ON a.enterprise_id = b.id;
```

| capacity_enhancement_id | planned_capacity_m_w | actual_capacity_m_w | planning_period | enterprise_id | enterprise_enterprise_name | enterprise_ownership_type |
|---|---|---|---|---|---|---|
| 1000 | 8.45 | 18.20 | seasonal-planning-89 | 1 | Distributed Cluster | public_sector |
| 1001 | 12.90 | 20.40 | regional-planning-90 | 2 | Adaptive Review D | private_sector |
| 1002 | 17.35 | 22.60 | legacy-planning-91 | 3 | Primary Initiative | joint_venture |
| 1003 | 21.80 | 24.80 | compact-planning-92 | 4 | Composite Model | public_sector |

The join maps enhancement 1000 to enterprise 1, enhancement 1001 to enterprise 2, enhancement 1002 to enterprise 3, and enhancement 1003 to enterprise 4. Enterprise 4's enhancement 1003 carries the highest planned capacity at 21.80 MW and the highest actual at 24.80 MW, yet it is the only `cancelled` project. Enterprise 3's enhancement 1002, by contrast, is `complete` with a planned 17.35 MW and actual 22.60 MW. This view enables portfolio-level assessment of enterprise performance across their capacity initiatives.

## Manufacturing Facility and Geographic Region Mapping

This view reveals the spatial distribution of facilities by joining each facility to its geographic region, answering where each site operates and under what administrative classification.

**View `v_manufacturing_facility_geographic_region`**

```sql
CREATE VIEW v_manufacturing_facility_geographic_region AS
SELECT a.id, a.facility_name, a.location, a.facility_type, b.id AS region_id, b.region_name AS region_region_name, b.country_code AS region_country_code
FROM manufacturing_facilities a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| id | facility_name | location | facility_type | region_id | region_region_name | region_country_code |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | extended-location-99 | integrated | 1000 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 |
| 1001 | Extended Programme | integrated-location-100 | standalone | 1001 | Adaptive Survey D | lu_tax_code_template_m_I_2 |
| 1002 | Pilot Standard | seasonal-location-101 | joint_venture | 1002 | Primary Corridor | default_chart_a_account_57 |
| 1003 | Baseline Framework D | regional-location-102 | integrated | 1003 | Composite Series | 727045 |

Facility 1000 ("Integrated Protocol A") is located in region 1000 ("Distributed Assessment"), a `state`-type jurisdiction. Facility 1001 ("Extended Programme") sits in region 1001 ("Adaptive Survey D"), classified as a `district`. Facility 1002 ("Pilot Standard") is in region 1002 ("Primary Corridor"), a `city` designation. Facility 1003 ("Baseline Framework D") occupies region 1003 ("Composite Series"), an `industrial_zone`. This spatial mapping is essential for regulatory compliance, regional capacity aggregation, and infrastructure investment planning.

## Manufacturing Facility and Product Line Association

This view answers which product line each manufacturing facility is designed to produce, linking physical infrastructure to product strategy.

**View `v_manufacturing_facility_product_line`**

```sql
CREATE VIEW v_manufacturing_facility_product_line AS
SELECT a.id, a.facility_name, a.location, a.facility_type, b.id AS line_id, b.product_category AS line_product_category, b.technology_readiness_level AS line_technology_readiness_level
FROM manufacturing_facilities a JOIN product_lines b ON a.product_line_id = b.id;
```

| id | facility_name | location | facility_type | line_id | line_product_category | line_technology_readiness_level |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | extended-location-99 | integrated | 1 | composite-product-87 | 40 |
| 1001 | Extended Programme | integrated-location-100 | standalone | 2 | primary-product-88 | 50 |
| 1002 | Pilot Standard | seasonal-location-101 | joint_venture | 3 | adaptive-product-89 | 60 |
| 1003 | Baseline Framework D | regional-location-102 | integrated | 4 | distributed-product-90 | 70 |

Facility 1000 is associated with product line 1 (`composite-product-87`), a non-strategic product at TRL 40 with a 15.20 MW target. Facility 1001 produces product line 2 (`primary-product-88`), a strategic product at TRL 50 targeting 18.40 MW. Facility 1002 handles product line 3 (`adaptive-product-89`), non-strategic at TRL 60 with a 21.60 MW target. Facility 1003 is tied to product line 4 (`distributed-product-90`), strategic at TRL 70 targeting 24.80 MW. The view makes clear that strategic product lines tend to carry higher technology readiness levels and larger output targets.

## Product Line and Enterprise Ownership

This view identifies which enterprise owns each product line, clarifying the organizational responsibility for product strategy and technology development.

**View `v_product_line_enterprise`**

```sql
CREATE VIEW v_product_line_enterprise AS
SELECT a.id, a.product_category, a.technology_readiness_level, a.target_output_m_w, b.id AS enterprise_id, b.enterprise_name AS enterprise_enterprise_name, b.ownership_type AS enterprise_ownership_type
FROM product_lines a JOIN enterprises b ON a.enterprise_id = b.id;
```

| id | product_category | technology_readiness_level | target_output_m_w | enterprise_id | enterprise_enterprise_name | enterprise_ownership_type |
|---|---|---|---|---|---|---|
| 1 | composite-product-87 | 40 | 15.20 | 1 | Distributed Cluster | public_sector |
| 2 | primary-product-88 | 50 | 18.40 | 2 | Adaptive Review D | private_sector |
| 3 | adaptive-product-89 | 60 | 21.60 | 3 | Primary Initiative | joint_venture |
| 4 | distributed-product-90 | 70 | 24.80 | 4 | Composite Model | public_sector |

Product line 1 (`composite-product-87`) is owned by enterprise 1 ("Distributed Cluster"), a public-sector entity. Product line 2 (`primary-product-88`) belongs to enterprise 2 ("Adaptive Review D"), a private-sector organization. Product line 3 (`adaptive-product-89`) is held by enterprise 3 ("Primary Initiative"), a joint venture. Product line 4 (`distributed-product-90`) is owned by enterprise 4 ("Composite Model"), another public-sector enterprise. This ownership mapping is critical for understanding which organizations control which product portfolios and their associated technology readiness trajectories.

## Product Line and Manufacturing Facility Assignment

This view reverses the facility-to-product relationship, showing which facility produces each product line and enabling capacity allocation analysis from the product perspective.

**View `v_product_line_manufacturing_facility`**

```sql
CREATE VIEW v_product_line_manufacturing_facility AS
SELECT a.id, a.product_category, a.technology_readiness_level, a.target_output_m_w, b.id AS facility_id, b.facility_name AS facility_facility_name, b.location AS facility_location
FROM product_lines a JOIN manufacturing_facilities b ON a.manufacturing_facility_id = b.id;
```

| id | product_category | technology_readiness_level | target_output_m_w | facility_id | facility_facility_name | facility_location |
|---|---|---|---|---|---|---|
| 1 | composite-product-87 | 40 | 15.20 | 1000 | Integrated Protocol A | extended-location-99 |
| 2 | primary-product-88 | 50 | 18.40 | 1001 | Extended Programme | integrated-location-100 |
| 3 | adaptive-product-89 | 60 | 21.60 | 1002 | Pilot Standard | seasonal-location-101 |
| 4 | distributed-product-90 | 70 | 24.80 | 1003 | Baseline Framework D | regional-location-102 |

Product line 1 is produced at facility 1000 ("Integrated Protocol A"), a planned integrated facility. Product line 2 is produced at facility 1001 ("Extended Programme"), a standalone facility under construction. Product line 3 is produced at facility 1002 ("Pilot Standard"), an operational joint venture. Product line 4 is produced at facility 1003 ("Baseline Framework D"), a decommissioned integrated facility. The operational status of each facility directly impacts the reliability of the corresponding product line's supply chain.

## Enterprise and Manufacturing Facility Ownership

This view links enterprises to the facilities they own or operate, answering which organizations control which physical assets.

**View `v_enterprise_manufacturing_facility`**

```sql
CREATE VIEW v_enterprise_manufacturing_facility AS
SELECT a.id, a.enterprise_name, a.ownership_type, a.registration_number, b.id AS facility_id, b.facility_name AS facility_facility_name, b.location AS facility_location
FROM enterprises a JOIN manufacturing_facilities b ON a.manufacturing_facility_id = b.id;
```

| id | enterprise_name | ownership_type | registration_number | facility_id | facility_facility_name | facility_location |
|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | public_sector | REG-2136 | 1000 | Integrated Protocol A | extended-location-99 |
| 2 | Adaptive Review D | private_sector | REG-2142 | 1001 | Extended Programme | integrated-location-100 |
| 3 | Primary Initiative | joint_venture | REG-2148 | 1002 | Pilot Standard | seasonal-location-101 |
| 4 | Composite Model | public_sector | REG-2154 | 1003 | Baseline Framework D | regional-location-102 |

Enterprise 1 ("Distributed Cluster") operates facility 1000 ("Integrated Protocol A"), which is in `planned` status. Enterprise 2 ("Adaptive Review D") operates facility 1001 ("Extended Programme"), currently `under_construction`. Enterprise 3 ("Primary Initiative") operates facility 1002 ("Pilot Standard"), which is `operational`. Enterprise 4 ("Composite Model") operates facility 1003 ("Baseline Framework D"), which is `decommissioned`. This view is essential for asset management, maintenance scheduling, and capacity allocation decisions.

## Enterprise and Product Line Portfolio

This view reveals the product line portfolio of each enterprise, enabling strategic assessment of which organizations hold strategic versus non-strategic products.

**View `v_enterprise_product_line`**

```sql
CREATE VIEW v_enterprise_product_line AS
SELECT a.id, a.enterprise_name, a.ownership_type, a.registration_number, b.id AS line_id, b.product_category AS line_product_category, b.technology_readiness_level AS line_technology_readiness_level
FROM enterprises a JOIN product_lines b ON a.product_line_id = b.id;
```

| id | enterprise_name | ownership_type | registration_number | line_id | line_product_category | line_technology_readiness_level |
|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | public_sector | REG-2136 | 1 | composite-product-87 | 40 |
| 2 | Adaptive Review D | private_sector | REG-2142 | 2 | primary-product-88 | 50 |
| 3 | Primary Initiative | joint_venture | REG-2148 | 3 | adaptive-product-89 | 60 |
| 4 | Composite Model | public_sector | REG-2154 | 4 | distributed-product-90 | 70 |

Enterprise 1 holds product line 1 (`composite-product-87`), which is non-strategic. Enterprise 2 holds product line 2 (`primary-product-88`), which is strategic. Enterprise 3 holds product line 3 (`adaptive-product-89`), non-strategic. Enterprise 4 holds product line 4 (`distributed-product-90`), strategic. The pattern is clear: enterprises alternate between strategic and non-strategic product holdings, suggesting a balanced portfolio approach across the organizational structure.

## Enterprise Self-Reference and Hierarchical Relationships

This view captures the self-referential relationship within the enterprise table, where each enterprise references another enterprise through its parent link. This enables hierarchical analysis of organizational structure.

**View `v_enterprise_enterprise`**

```sql
CREATE VIEW v_enterprise_enterprise AS
SELECT a.id, a.enterprise_name, a.ownership_type, a.registration_number, b.id AS enterprise_id, b.enterprise_name AS enterprise_enterprise_name, b.ownership_type AS enterprise_ownership_type
FROM enterprises a JOIN enterprises b ON a.enterprise_id = b.id;
```

| id | enterprise_name | ownership_type | registration_number | enterprise_id | enterprise_enterprise_name | enterprise_ownership_type |
|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | public_sector | REG-2136 | 1 | Distributed Cluster | public_sector |
| 2 | Adaptive Review D | private_sector | REG-2142 | 2 | Adaptive Review D | private_sector |
| 3 | Primary Initiative | joint_venture | REG-2148 | 3 | Primary Initiative | joint_venture |
| 4 | Composite Model | public_sector | REG-2154 | 4 | Composite Model | public_sector |

Each enterprise references itself as its own parent in the current dataset — enterprise 1 links to enterprise 1, enterprise 2 to enterprise 2, and so on. This self-referential pattern may indicate a flat organizational structure or serve as a placeholder for future hierarchical expansion. As the enterprise structure evolves, this view will reveal parent-child relationships that define reporting lines, ownership chains, and governance boundaries.

## Geographic Region and Manufacturing Facility Coverage

This view provides a geographic perspective on facility distribution, showing which region each manufacturing facility operates within and enabling regional capacity aggregation.

**View `v_geographic_region_manufacturing_facility`**

```sql
CREATE VIEW v_geographic_region_manufacturing_facility AS
SELECT a.id, a.region_name, a.country_code, a.state_province, b.id AS facility_id, b.facility_name AS facility_facility_name, b.location AS facility_location
FROM geographic_regions a JOIN manufacturing_facilities b ON a.manufacturing_facility_id = b.id;
```

| id | region_name | country_code | state_province | facility_id | facility_facility_name | facility_location |
|---|---|---|---|---|---|---|
| 1000 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | primary-state-28 | 1000 | Integrated Protocol A | extended-location-99 |
| 1001 | Adaptive Survey D | lu_tax_code_template_m_I_2 | adaptive-state-29 | 1001 | Extended Programme | integrated-location-100 |
| 1002 | Primary Corridor | default_chart_a_account_57 | distributed-state-30 | 1002 | Pilot Standard | seasonal-location-101 |
| 1003 | Composite Series | 727045 | baseline-state-31 | 1003 | Baseline Framework D | regional-location-102 |

Region 1000 ("Distributed Assessment") contains facility 1000 ("Integrated Protocol A"), a planned integrated site. Region 1001 ("Adaptive Survey D") contains facility 1001 ("Extended Programme"), a standalone facility under construction. Region 1002 ("Primary Corridor") contains facility 1002 ("Pilot Standard"), an operational joint venture. Region 1003 ("Composite Series") contains facility 1003 ("Baseline Framework D"), a decommissioned integrated facility. This regional view supports geographic capacity planning, regulatory reporting, and infrastructure investment prioritization across jurisdictions.

## Synthesis

The five base tables and twelve derived views together form a comprehensive operational picture of capacity planning across manufacturing infrastructure. Capacity enhancements track the delta between planned and actual megawatt output, manufacturing facilities provide the physical sites, product lines define what those sites produce, enterprises own and operate the assets, and geographic regions establish the regulatory and spatial context. The derived views join these dimensions to answer specific operational questions — from facility-level overperformance analysis to enterprise portfolio assessment to regional capacity aggregation. Practitioners who understand these relationships can make informed decisions about capacity allocation, facility investment, product strategy, and regulatory compliance across the entire operational landscape.