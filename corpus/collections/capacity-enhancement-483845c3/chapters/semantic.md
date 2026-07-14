In the energy infrastructure domain, organizations plan and execute capacity enhancements across manufacturing facilities that produce product lines within defined geographic regions. The relational model captures this ecosystem through five base tables that encode entities, their attributes, and the foreign-key relationships that bind them into a coherent domain graph. Each table normalizes a distinct concept, and a suite of views materializes the joins that answer operational questions about how capacity, facilities, products, enterprises, and regions interrelate.

## The Base Tables

The table `capacity_enhancements` records planned and realized capacity upgrades. Its primary key is `capacity_enhancement_id`, and it carries the numeric attributes `planned_capacity_m_w` and `actual_capacity_m_w` — for instance, enhancement 1000 planned 8.45 MW but achieved 18.20 MW — alongside the `planning_period` identifier such as `seasonal-planning-89`, the `effective_date` like `2023-02-14`, and a `status` column whose values include `planned`, `in_progress`, `complete`, and `cancelled`. Two foreign keys anchor each enhancement to the wider domain: `manufacturing_facility_id` points to a row in `manufacturing_facilities`, and `enterprise_id` points to a row in `enterprises`.

**Table `capacity_enhancements`**

| capacity_enhancement_id | planned_capacity_m_w | actual_capacity_m_w | planning_period | effective_date | status | manufacturing_facility_id | enterprise_id |
|---|---|---|---|---|---|---|---|
| 1000 | 8.45 | 18.20 | seasonal-planning-89 | 2023-02-14 | planned | 1000 | 1 |
| 1001 | 12.90 | 20.40 | regional-planning-90 | 2024-07-25 | in_progress | 1001 | 2 |
| 1002 | 17.35 | 22.60 | legacy-planning-91 | 2025-12-09 | complete | 1002 | 3 |
| 1003 | 21.80 | 24.80 | compact-planning-92 | 2022-05-20 | cancelled | 1003 | 4 |

The table `manufacturing_facilities` models the physical production sites. Its primary key is `id`, and it stores `facility_name` (e.g. `Integrated Protocol A`), `location` (e.g. `extended-location-99`), `facility_type` (one of `integrated`, `standalone`, or `joint_venture`), and `operational_status` (values such as `planned`, `under_construction`, `operational`, or `decommissioned`). Two foreign keys link each facility to its context: `geographic_region_id` references `geographic_regions`, and `product_line_id` references `product_lines`.

**Table `manufacturing_facilities`**

| id | facility_name | location | facility_type | operational_status | geographic_region_id | product_line_id |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | extended-location-99 | integrated | planned | 1000 | 1 |
| 1001 | Extended Programme | integrated-location-100 | standalone | under_construction | 1001 | 2 |
| 1002 | Pilot Standard | seasonal-location-101 | joint_venture | operational | 1002 | 3 |
| 1003 | Baseline Framework D | regional-location-102 | integrated | decommissioned | 1003 | 4 |

The table `product_lines` captures the output categories produced at each facility. Its primary key is `id`, and it carries `product_category` (e.g. `composite-product-87`), `technology_readiness_level` (integer values like 40, 50, 60, 70), `target_output_m_w` (e.g. 15.20), and a boolean `is_strategic` flag. Two foreign keys tie a product line to its owner and its production site: `enterprise_id` references `enterprises`, and `manufacturing_facility_id` references `manufacturing_facilities`.

**Table `product_lines`**

| id | product_category | technology_readiness_level | target_output_m_w | is_strategic | enterprise_id | manufacturing_facility_id |
|---|---|---|---|---|---|---|
| 1 | composite-product-87 | 40 | 15.20 | false | 1 | 1000 |
| 2 | primary-product-88 | 50 | 18.40 | true | 2 | 1001 |
| 3 | adaptive-product-89 | 60 | 21.60 | false | 3 | 1002 |
| 4 | distributed-product-90 | 70 | 24.80 | true | 4 | 1003 |

The table `enterprises` encodes the organizational entities that own and operate the infrastructure. Its primary key is `id`, and it stores `enterprise_name` (e.g. `Distributed Cluster`), `ownership_type` (values such as `public_sector`, `private_sector`, or `joint_venture`), `registration_number` (e.g. `REG-2136`), and `regulatory_authority` (e.g. `composite-regulato-99`). Timestamp columns `created_at` and `updated_at` record lifecycle events. Three foreign keys appear here: `manufacturing_facility_id` references `manufacturing_facilities`, `product_line_id` references `product_lines`, and `enterprise_id` forms a self-referential link that can model parent–child or hierarchical relationships within the enterprise registry.

**Table `enterprises`**

| id | enterprise_name | ownership_type | registration_number | regulatory_authority | manufacturing_facility_id | product_line_id | enterprise_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | public_sector | REG-2136 | composite-regulato-99 | 1000 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Adaptive Review D | private_sector | REG-2142 | primary-regulato-100 | 1001 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Primary Initiative | joint_venture | REG-2148 | adaptive-regulato-101 | 1002 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Composite Model | public_sector | REG-2154 | distributed-regulato-102 | 1003 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The table `geographic_regions` models the spatial context in which facilities operate. Its primary key is `id`, and it stores `region_name` (e.g. `Distributed Assessment`), `country_code` (a UUID-like string such as `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`), `state_province` (e.g. `primary-state-28`), and `region_type` (values including `state`, `district`, `city`, and `industrial_zone`). The foreign key `manufacturing_facility_id` references `manufacturing_facilities`, and the timestamp columns `created_at` and `updated_at` track the region's metadata lifecycle.

**Table `geographic_regions`**

| id | region_name | country_code | state_province | region_type | manufacturing_facility_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1000 | Distributed Assessment | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | primary-state-28 | state | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Adaptive Survey D | lu_tax_code_template_m_I_2 | adaptive-state-29 | district | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Primary Corridor | default_chart_a_account_57 | distributed-state-30 | city | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Composite Series | 727045 | baseline-state-31 | industrial_zone | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Cardinality and Foreign-Key Topology

The foreign-key topology forms a directed graph. Each row in `capacity_enhancements` depends on exactly one row in `manufacturing_facilities` and exactly one row in `enterprises`, establishing a many-to-one relationship from enhancements to both parent tables. The `manufacturing_facilities` table sits at the center of the graph: every facility belongs to one `geographic_region` and produces one `product_line`, while simultaneously being referenced by `capacity_enhancements`, `product_lines`, `enterprises`, and `geographic_regions` through their respective foreign keys. The `product_lines` table mirrors this centrality, linking each product to one `enterprise` and one `manufacturing_facility`. The `enterprises` table is the most self-referential, with its own `enterprise_id` foreign key enabling hierarchical enterprise structures, while also pointing to one `manufacturing_facility` and one `product_line`. The `geographic_regions` table, though the smallest, anchors the spatial dimension by referencing `manufacturing_facilities`.

This topology means that a single domain fact — such as "enhancement 1000 at facility 1000 under enterprise 1" — is stored across three tables and reconstructed through two joins. The normalization eliminates redundancy: the facility name `Integrated Protocol A` appears once in `manufacturing_facilities` and is referenced by `capacity_enhancements`, `product_lines`, `enterprises`, and `geographic_regions` through their foreign keys rather than being duplicated.

## Views as Reconstructed Domain Facts

Each view materializes a specific join that answers a concrete operational question. The view `v_capacity_enhancement_manufacturing_facility` joins `capacity_enhancements` to `manufacturing_facilities` on `manufacturing_facility_id`, producing a row that pairs capacity metrics with facility identity. Reading the first row — enhancement 1000 at facility `Integrated Protocol A` in location `extended-location-99` with planned capacity 8.45 MW and actual capacity 18.20 MW — the view answers the question "what facility is each capacity enhancement associated with, and what are the capacity figures?"

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

The view `v_capacity_enhancement_enterprise` joins `capacity_enhancements` to `enterprises` on `enterprise_id`, answering "which enterprise owns each capacity enhancement?" The first row pairs enhancement 1000 with enterprise `Distributed Cluster` (ownership type `public_sector`, registration `REG-2136`), while the second row links enhancement 1001 to `Adaptive Review D` (ownership type `private_sector`, registration `REG-2142`).

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

The view `v_manufacturing_facility_geographic_region` joins `manufacturing_facilities` to `geographic_regions` on `geographic_region_id`, answering "where is each facility located?" The first row shows facility `Integrated Protocol A` in region `Distributed Assessment` with country code `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0` and region type `state`. The third row shows facility `Pilot Standard` in region `Primary Corridor` with region type `city`.

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

The view `v_manufacturing_facility_product_line` joins `manufacturing_facilities` to `product_lines` on `product_line_id`, answering "what product line does each facility produce?" The first row pairs facility `Integrated Protocol A` with product category `composite-product-87` at technology readiness level 40 and target output 15.20 MW. The fourth row pairs facility `Baseline Framework D` with product category `distributed-product-90` at technology readiness level 70 and target output 24.80 MW.

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

The view `v_product_line_enterprise` joins `product_lines` to `enterprises` on `enterprise_id`, answering "which enterprise owns each product line?" The first row links product category `composite-product-87` to enterprise `Distributed Cluster` (ownership type `public_sector`), while the second row links product category `primary-product-88` to enterprise `Adaptive Review D` (ownership type `private_sector`).

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

The view `v_product_line_manufacturing_facility` joins `product_lines` to `manufacturing_facilities` on `manufacturing_facility_id`, answering "at which facility is each product line produced?" The first row shows product category `composite-product-87` produced at facility `Integrated Protocol A` (facility type `integrated`, operational status `planned`). The third row shows product category `adaptive-product-89` produced at facility `Pilot Standard` (facility type `joint_venture`, operational status `operational`).

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

The view `v_enterprise_manufacturing_facility` joins `enterprises` to `manufacturing_facilities` on `manufacturing_facility_id`, answering "which facility does each enterprise operate?" The first row links enterprise `Distributed Cluster` to facility `Integrated Protocol A` (facility type `integrated`), while the third row links enterprise `Primary Initiative` to facility `Pilot Standard` (facility type `joint_venture`).

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

The view `v_enterprise_product_line` joins `enterprises` to `product_lines` on `product_line_id`, answering "which product line does each enterprise manage?" The first row links enterprise `Distributed Cluster` to product category `composite-product-87` (technology readiness level 40, not strategic), while the second row links enterprise `Adaptive Review D` to product category `primary-product-88` (technology readiness level 50, strategic).

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

The view `v_enterprise_enterprise` performs a self-join on `enterprises` using the `enterprise_id` foreign key, answering "what is the hierarchical relationship between enterprises?" Because the `enterprise_id` column in `enterprises` references the same table's primary key, this view can model parent–child enterprise structures. In the current dataset, each enterprise references itself (enterprise 1 points to enterprise 1, enterprise 2 to enterprise 2, and so on), which represents a degenerate case of the hierarchy where no parent–child relationship has been established yet.

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

The view `v_geographic_region_manufacturing_facility` joins `geographic_regions` to `manufacturing_facilities` on `manufacturing_facility_id`, answering "which facilities operate within each geographic region?" The first row shows region `Distributed Assessment` (country code `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`, region type `state`) containing facility `Integrated Protocol A`. The third row shows region `Primary Corridor` (region type `city`) containing facility `Pilot Standard`.

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

## Synthesis

The five base tables encode a normalized domain model where capacity enhancements, manufacturing facilities, product lines, enterprises, and geographic regions are each represented once, with foreign keys expressing their dependencies. The cardinality-bounded relationships — each enhancement belongs to one facility and one enterprise, each facility belongs to one region and produces one product line, each product line belongs to one enterprise and one facility — ensure that no fact is duplicated across rows. The ten views reconstruct the joins that operational teams need: pairing capacity with facility identity, linking enhancements to their owning enterprises, locating facilities within regions, associating facilities with their product lines, and tracing the enterprise–product and enterprise–facility ownership chains. Together, the base tables and views form a complete materialization of the energy infrastructure domain, where every row in every view can be traced back through its foreign keys to the normalized entities that store the underlying facts.