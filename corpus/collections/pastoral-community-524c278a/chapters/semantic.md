## The Pastoral Domain as a Normalised Relational Model

The pastoral domain captures the interplay between human communities, their geographic territories, water resources, management practices, environmental stresses, and adaptive livelihood strategies. At its core, the model represents a network of six entity types — `pastoral_communities`, `territories`, `well_watered_places`, `water_management_practices`, `hydrological_stresses`, and `alternative_livelihoods` — each materialised as a base table whose columns encode both intrinsic attributes and foreign-key references to the other entities. The normalised design avoids redundancy by storing each entity's identity once in its own table and reaching across tables through integer foreign keys. The result is a schema in which every domain fact is reconstructible by joining the appropriate tables, and the views provide pre-joined lenses that answer specific analytical questions about the relationships.

**Table `pastoral_communities`**

| pastoral_community_id | community_name | territory_name | primary_livelihood | historical_presence | territory_id | water_management_practice_id | alternative_livelihood_id |
|---|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | Regional Initiative | seasonal-primary-35 | 9 | 1000 | 1 | 1 |
| 2 | Composite Model | Seasonal Model D | regional-primary-36 | 17 | 1001 | 2 | 2 |
| 3 | Compact Cluster | Integrated Cluster | legacy-primary-37 | 25 | 1002 | 3 | 3 |
| 4 | Legacy Review D | Extended Review | compact-primary-38 | 33 | 1003 | 4 | 4 |

The `pastoral_communities` table is the central hub of the schema. Its primary key, `pastoral_community_id`, is a small integer identifier (values 1 through 4 in the sample data) that anchors every relationship. The column `community_name` carries human-readable labels such as "Primary Initiative A" and "Composite Model", while `territory_name` stores a secondary textual reference like "Regional Initiative" or "Seasonal Model D". The attribute `primary_livelihood` encodes the dominant economic activity of the community — values such as "seasonal-primary-35" and "regional-primary-36" — and `historical_presence` is an integer (9, 17, 25, 33) that quantifies how long the community has occupied the territory. Three foreign-key columns complete the table: `territory_id` references `territories.id`, `water_management_practice_id` references `water_management_practices.water_management_practice_id`, and `alternative_livelihood_id` references `alternative_livelihoods.id`. In the sample data, row 1 links community "Primary Initiative A" to territory 1000, water management practice 1000, and alternative livelihood 1, establishing the first complete chain of relationships.

**Table `territories`**

| id | territory_name | location | area_size | dominant_ecosystem | well_watered_place_id | territory_id | pastoral_community_id |
|---|---|---|---|---|---|---|---|
| 1000 | Regional Initiative | extended-location-99 | 1.52 | adaptive-dominant-29 | 1 | 1000 | 1 |
| 1001 | Seasonal Model D | integrated-location-100 | 0.65 | distributed-dominant-30 | 2 | 1001 | 2 |
| 1002 | Integrated Cluster | seasonal-location-101 | 0.43012016 | baseline-dominant-31 | 3 | 1002 | 3 |
| 1003 | Extended Review | regional-location-102 | 0.6000001 | pilot-dominant-32 | 4 | 1003 | 4 |

The `territories` table models geographic units. Its primary key `id` (values 1000–1003) is distinct from the `pastoral_community_id` range, reflecting that territories and communities are separate entity types even when they share a one-to-one correspondence in the sample data. The column `territory_name` repeats values like "Regional Initiative" and "Seasonal Model D", `location` stores strings such as "extended-location-99", `area_size` is a decimal (1.52, 0.65, 0.43012016, 0.6000001) measuring the territory's extent, and `dominant_ecosystem` carries categorical labels like "adaptive-dominant-29". Three foreign keys — `well_watered_place_id`, `territory_id`, and `pastoral_community_id` — create self-referential and cross-entity links. The `territory_id` column is a self-reference pointing back to `territories.id`, enabling hierarchical or peer relationships between territories, while `pastoral_community_id` links the territory to its resident community.

**Table `well_watered_places`**

| id | place_name | water_source | reliability | socio_ecological_niche | territory_id | pastoral_community_id | water_management_practice_id |
|---|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | compact-water-92 | integrated-reliabil-40 | true | 1000 | 1 | 1 |
| 2 | Adaptive Review D | composite-water-93 | seasonal-reliabil-41 | false | 1001 | 2 | 2 |
| 3 | Primary Initiative | primary-water-94 | regional-reliabil-42 | true | 1002 | 3 | 3 |
| 4 | Composite Model | adaptive-water-95 | legacy-reliabil-43 | false | 1003 | 4 | 4 |

`well_watered_places` represents discrete water resource locations. Its primary key `id` (1–4) is independent of the territory identifiers. The column `place_name` carries labels such as "Distributed Cluster" and "Adaptive Review D", `water_source` stores strings like "compact-water-92", and `reliability` carries values such as "integrated-reliabil-40". The boolean column `socio_ecological_niche` (true/false) indicates whether the place occupies a recognised socio-ecological role. Three foreign keys — `territory_id`, `pastoral_community_id`, and `water_management_practice_id` — connect the water place to its parent territory, its associated community, and the management practice governing it. Row 1, for example, places "Distributed Cluster" under territory 1000, community 1, and water management practice 1.

**Table `water_management_practices`**

| water_management_practice_id | practice_name | conservation_level | historical_period | effectiveness | pastoral_community_id | territory_id | hydrological_stress_id |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | compact-conserva-68 | compact-historic-26 | legacy-effectiv-73 | 1 | 1000 | 1 |
| 2 | Integrated Corridor | composite-conserva-69 | composite-historic-27 | compact-effectiv-74 | 2 | 1001 | 2 |
| 3 | Extended Series D | primary-conserva-70 | primary-historic-28 | composite-effectiv-75 | 3 | 1002 | 3 |
| 4 | Pilot Assessment | adaptive-conserva-71 | adaptive-historic-29 | primary-effectiv-76 | 4 | 1003 | 4 |

The `water_management_practices` table encodes the strategies used to manage water resources. Its primary key `water_management_practice_id` (1000–1003) uses a separate identifier range. The column `practice_name` carries values like "Seasonal Survey" and "Integrated Corridor", `conservation_level` stores strings such as "compact-conserva-68", `historical_period` carries labels like "compact-historic-26", and `effectiveness` stores values such as "legacy-effectiv-73". Three foreign keys — `pastoral_community_id`, `territory_id`, and `hydrological_stress_id` — link each practice to the community that employs it, the territory where it is applied, and the hydrological stress it addresses. Row 1 associates "Seasonal Survey" with community 1, territory 1000, and hydrological stress 1.

**Table `hydrological_stresses`**

| hydrological_stress_id | stress_level | duration | affected_area | impact_on_livelihood | pastoral_community_id | territory_id | water_management_practice_id |
|---|---|---|---|---|---|---|---|
| 1 | compact-stress-20 | 28 | extended-affected-15 | regional-impact-36 | 1 | 1000 | 1 |
| 2 | composite-stress-21 | 36 | integrated-affected-16 | legacy-impact-37 | 2 | 1001 | 2 |
| 3 | primary-stress-22 | 44 | seasonal-affected-17 | compact-impact-38 | 3 | 1002 | 3 |
| 4 | adaptive-stress-23 | 52 | regional-affected-18 | composite-impact-39 | 4 | 1003 | 4 |

`hydrological_stresses` models environmental pressures on water systems. Its primary key `hydrological_stress_id` (1–4) is a compact integer range. The column `stress_level` carries labels such as "compact-stress-20", `duration` is an integer (28, 36, 44, 52) measuring how long the stress persists, `affected_area` stores strings like "extended-affected-15", and `impact_on_livelihood` carries values such as "regional-impact-36". Three foreign keys — `pastoral_community_id`, `territory_id`, and `water_management_practice_id` — connect each stress event to the community it affects, the territory it impacts, and the water management practice that responds to it. Row 1 links stress "compact-stress-20" (duration 28) to community 1, territory 1000, and water management practice 1.

**Table `alternative_livelihoods`**

| id | livelihood_type | adoption_rate | primary_drivers | sustainability | pastoral_community_id | well_watered_place_id |
|---|---|---|---|---|---|---|
| 1 | baseline-liveliho-37 | 7.20 | integrated-primary-22 | composite-sustaina-75 | 1 | 1 |
| 2 | pilot-liveliho-38 | 9.40 | seasonal-primary-23 | primary-sustaina-76 | 2 | 2 |
| 3 | extended-liveliho-39 | 11.60 | regional-primary-24 | adaptive-sustaina-77 | 3 | 3 |
| 4 | integrated-liveliho-40 | 13.80 | legacy-primary-25 | distributed-sustaina-78 | 4 | 4 |

The `alternative_livelihoods` table captures non-traditional economic options available to pastoral communities. Its primary key `id` (1–4) is a compact integer. The column `livelihood_type` carries labels such as "baseline-liveliho-37", `adoption_rate` is a decimal (7.20, 9.40, 11.60, 13.80) indicating uptake, `primary_drivers` stores strings like "integrated-primary-22", and `sustainability` carries values such as "composite-sustaina-75". Two foreign keys — `pastoral_community_id` and `well_watered_place_id` — link each livelihood to the community that pursues it and the water place that supports it. Row 1 associates livelihood "baseline-liveliho-37" (adoption rate 7.20) with community 1 and well watered place 1.

### From Entity Types to Columns and Foreign Keys

The schema follows a straightforward normalisation pattern: each entity type becomes a table, its intrinsic attributes become non-key columns, and its relationships to other entities become foreign-key columns. The cardinality of each relationship is bounded by the presence or absence of a foreign key. A `pastoral_community` row that carries a non-null `territory_id` asserts a one-to-one or many-to-one relationship to a single territory; the same community row also carries `water_management_practice_id` and `alternative_livelihood_id`, establishing two additional foreign-key relationships in a single row. This design means that the `pastoral_communities` table alone can answer the question "which water management practice and alternative livelihood does each community use?" without any join.

The `territories` table introduces a self-referential foreign key: `territory_id` points to `territories.id`. This column enables hierarchical territory structures (a territory can reference another territory as its parent) while the primary key `id` uniquely identifies each territory row. The `well_watered_places` table similarly carries a `territory_id` foreign key, creating a parent-child relationship where each water place belongs to exactly one territory. The `water_management_practices` table links to `hydrological_stresses` via `hydrological_stress_id`, and the `hydrological_stresses` table links back to `water_management_practices` via its own `water_management_practice_id` column, forming a bidirectional relationship that captures the mutual dependence between stress events and the practices designed to address them.

### Views as Reconstructed Domain Facts

The views materialise the relationships between tables by performing joins, each one answering a specific analytical question about the domain.

**View `vw_pastoral_community_territory`**

```sql
CREATE VIEW vw_pastoral_community_territory AS
SELECT a.pastoral_community_id, a.community_name, a.territory_name, a.primary_livelihood, b.id AS territory_id, b.territory_name AS territory_territory_name, b.location AS territory_location
FROM pastoral_communities a JOIN territories b ON a.territory_id = b.id;
```

| pastoral_community_id | community_name | territory_name | primary_livelihood | territory_id | territory_territory_name | territory_location |
|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | Regional Initiative | seasonal-primary-35 | 1000 | Regional Initiative | extended-location-99 |
| 2 | Composite Model | Seasonal Model D | regional-primary-36 | 1001 | Seasonal Model D | integrated-location-100 |
| 3 | Compact Cluster | Integrated Cluster | legacy-primary-37 | 1002 | Integrated Cluster | seasonal-location-101 |
| 4 | Legacy Review D | Extended Review | compact-primary-38 | 1003 | Extended Review | regional-location-102 |

The view `vw_pastoral_community_territory` joins `pastoral_communities` to `territories` on `pastoral_communities.territory_id = territories.id`. It answers the question: "For each pastoral community, what are the geographic details of its territory?" Reading row 1 of the view, we see community "Primary Initiative A" paired with territory "Regional Initiative" at location "extended-location-99" with area size 1.52 and dominant ecosystem "adaptive-dominant-29". This join reconstructs the fact that community 1 occupies territory 1000, combining the community's identity with the territory's physical attributes in a single row.

**View `vw_pastoral_community_water_management_practice`**

```sql
CREATE VIEW vw_pastoral_community_water_management_practice AS
SELECT a.pastoral_community_id, a.community_name, a.territory_name, a.primary_livelihood, b.water_management_practice_id AS practice_water_management_practice_id, b.practice_name AS practice_practice_name, b.conservation_level AS practice_conservation_level
FROM pastoral_communities a JOIN water_management_practices b ON a.water_management_practice_id = b.water_management_practice_id;
```

| pastoral_community_id | community_name | territory_name | primary_livelihood | practice_water_management_practice_id | practice_practice_name | practice_conservation_level |
|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | Regional Initiative | seasonal-primary-35 | 1 | Seasonal Survey | compact-conserva-68 |
| 2 | Composite Model | Seasonal Model D | regional-primary-36 | 2 | Integrated Corridor | composite-conserva-69 |
| 3 | Compact Cluster | Integrated Cluster | legacy-primary-37 | 3 | Extended Series D | primary-conserva-70 |
| 4 | Legacy Review D | Extended Review | compact-primary-38 | 4 | Pilot Assessment | adaptive-conserva-71 |

The view `vw_pastoral_community_water_management_practice` joins `pastoral_communities` to `water_management_practices` on `pastoral_communities.water_management_practice_id = water_management_practices.water_management_practice_id`. It answers: "Which water management practice does each community employ?" Row 1 shows "Primary Initiative A" using practice "Seasonal Survey" with conservation level "compact-conserva-68", historical period "compact-historic-26", and effectiveness "legacy-effectiv-73". This view isolates the community-to-practice relationship, stripping away territory and livelihood details to focus on the management dimension.

**View `vw_pastoral_community_alternative_livelihood`**

```sql
CREATE VIEW vw_pastoral_community_alternative_livelihood AS
SELECT a.pastoral_community_id, a.community_name, a.territory_name, a.primary_livelihood, b.id AS livelihood_id, b.livelihood_type AS livelihood_livelihood_type, b.adoption_rate AS livelihood_adoption_rate
FROM pastoral_communities a JOIN alternative_livelihoods b ON a.alternative_livelihood_id = b.id;
```

| pastoral_community_id | community_name | territory_name | primary_livelihood | livelihood_id | livelihood_livelihood_type | livelihood_adoption_rate |
|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | Regional Initiative | seasonal-primary-35 | 1 | baseline-liveliho-37 | 7.20 |
| 2 | Composite Model | Seasonal Model D | regional-primary-36 | 2 | pilot-liveliho-38 | 9.40 |
| 3 | Compact Cluster | Integrated Cluster | legacy-primary-37 | 3 | extended-liveliho-39 | 11.60 |
| 4 | Legacy Review D | Extended Review | compact-primary-38 | 4 | integrated-liveliho-40 | 13.80 |

The view `vw_pastoral_community_alternative_livelihood` joins `pastoral_communities` to `alternative_livelihoods` on `pastoral_communities.alternative_livelihood_id = alternative_livelihoods.id`. It answers: "What alternative livelihood does each community pursue?" Row 1 links "Primary Initiative A" to livelihood type "baseline-liveliho-37" with adoption rate 7.20, primary drivers "integrated-primary-22", and sustainability "composite-sustaina-75". This view isolates the economic adaptation dimension of the pastoral domain.

**View `vw_territory_well_watered_place`**

```sql
CREATE VIEW vw_territory_well_watered_place AS
SELECT a.id, a.territory_name, a.location, a.area_size, b.id AS place_id, b.place_name AS place_place_name, b.water_source AS place_water_source
FROM territories a JOIN well_watered_places b ON a.well_watered_place_id = b.id;
```

| id | territory_name | location | area_size | place_id | place_place_name | place_water_source |
|---|---|---|---|---|---|---|
| 1000 | Regional Initiative | extended-location-99 | 1.52 | 1 | Distributed Cluster | compact-water-92 |
| 1001 | Seasonal Model D | integrated-location-100 | 0.65 | 2 | Adaptive Review D | composite-water-93 |
| 1002 | Integrated Cluster | seasonal-location-101 | 0.43012016 | 3 | Primary Initiative | primary-water-94 |
| 1003 | Extended Review | regional-location-102 | 0.6000001 | 4 | Composite Model | adaptive-water-95 |

The view `vw_territory_well_watered_place` joins `territories` to `well_watered_places` on `territories.id = well_watered_places.territory_id`. It answers: "Which well watered places belong to each territory?" Row 1 shows territory "Regional Initiative" containing well watered place "Distributed Cluster" with water source "compact-water-92", reliability "integrated-reliabil-40", and socio-ecological niche true. This view reconstructs the territorial containment relationship, showing how water resources are distributed across geographic units.

**View `vw_territory_territory`**

```sql
CREATE VIEW vw_territory_territory AS
SELECT a.id, a.territory_name, a.location, a.area_size, b.id AS territory_id, b.territory_name AS territory_territory_name, b.location AS territory_location
FROM territories a JOIN territories b ON a.territory_id = b.id;
```

| id | territory_name | location | area_size | territory_id | territory_territory_name | territory_location |
|---|---|---|---|---|---|---|
| 1000 | Regional Initiative | extended-location-99 | 1.52 | 1000 | Regional Initiative | extended-location-99 |
| 1001 | Seasonal Model D | integrated-location-100 | 0.65 | 1001 | Seasonal Model D | integrated-location-100 |
| 1002 | Integrated Cluster | seasonal-location-101 | 0.43012016 | 1002 | Integrated Cluster | seasonal-location-101 |
| 1003 | Extended Review | regional-location-102 | 0.6000001 | 1003 | Extended Review | regional-location-102 |

The view `vw_territory_territory` performs a self-join on `territories`, linking each territory to its parent territory via `territories.territory_id = territories.id`. It answers: "How are territories hierarchically related to one another?" Row 1 shows territory "Regional Initiative" (id 1000) linked to itself (id 1000), indicating that in the sample data, each territory references itself as its own parent — a pattern that may represent root-level territories or a placeholder for hierarchical depth not yet populated.

**View `vw_territory_pastoral_community`**

```sql
CREATE VIEW vw_territory_pastoral_community AS
SELECT a.id, a.territory_name, a.location, a.area_size, b.pastoral_community_id AS community_pastoral_community_id, b.community_name AS community_community_name, b.territory_name AS community_territory_name
FROM territories a JOIN pastoral_communities b ON a.pastoral_community_id = b.pastoral_community_id;
```

| id | territory_name | location | area_size | community_pastoral_community_id | community_community_name | community_territory_name |
|---|---|---|---|---|---|---|
| 1000 | Regional Initiative | extended-location-99 | 1.52 | 1 | Primary Initiative A | Regional Initiative |
| 1001 | Seasonal Model D | integrated-location-100 | 0.65 | 2 | Composite Model | Seasonal Model D |
| 1002 | Integrated Cluster | seasonal-location-101 | 0.43012016 | 3 | Compact Cluster | Integrated Cluster |
| 1003 | Extended Review | regional-location-102 | 0.6000001 | 4 | Legacy Review D | Extended Review |

The view `vw_territory_pastoral_community` joins `territories` to `pastoral_communities` on `territories.pastoral_community_id = pastoral_communities.pastoral_community_id`. It answers: "Which pastoral community inhabits each territory?" Row 1 pairs territory "Regional Initiative" with community "Primary Initiative A", primary livelihood "seasonal-primary-35", and historical presence 9. This view inverts the perspective of `vw_pastoral_community_territory`, starting from the territory and revealing its resident community.

**View `vw_well_watered_place_territory`**

```sql
CREATE VIEW vw_well_watered_place_territory AS
SELECT a.id, a.place_name, a.water_source, a.reliability, b.id AS territory_id, b.territory_name AS territory_territory_name, b.location AS territory_location
FROM well_watered_places a JOIN territories b ON a.territory_id = b.id;
```

| id | place_name | water_source | reliability | territory_id | territory_territory_name | territory_location |
|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | compact-water-92 | integrated-reliabil-40 | 1000 | Regional Initiative | extended-location-99 |
| 2 | Adaptive Review D | composite-water-93 | seasonal-reliabil-41 | 1001 | Seasonal Model D | integrated-location-100 |
| 3 | Primary Initiative | primary-water-94 | regional-reliabil-42 | 1002 | Integrated Cluster | seasonal-location-101 |
| 4 | Composite Model | adaptive-water-95 | legacy-reliabil-43 | 1003 | Extended Review | regional-location-102 |

The view `vw_well_watered_place_territory` joins `well_watered_places` to `territories` on `well_watered_places.territory_id = territories.id`. It answers: "To which territory does each well watered place belong?" Row 1 shows well watered place "Distributed Cluster" belonging to territory "Regional Initiative" with area size 1.52 and dominant ecosystem "adaptive-dominant-29". This view reconstructs the same containment relationship as `vw_territory_well_watered_place` but from the water place's perspective.

**View `vw_well_watered_place_pastoral_community`**

```sql
CREATE VIEW vw_well_watered_place_pastoral_community AS
SELECT a.id, a.place_name, a.water_source, a.reliability, b.pastoral_community_id AS community_pastoral_community_id, b.community_name AS community_community_name, b.territory_name AS community_territory_name
FROM well_watered_places a JOIN pastoral_communities b ON a.pastoral_community_id = b.pastoral_community_id;
```

| id | place_name | water_source | reliability | community_pastoral_community_id | community_community_name | community_territory_name |
|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | compact-water-92 | integrated-reliabil-40 | 1 | Primary Initiative A | Regional Initiative |
| 2 | Adaptive Review D | composite-water-93 | seasonal-reliabil-41 | 2 | Composite Model | Seasonal Model D |
| 3 | Primary Initiative | primary-water-94 | regional-reliabil-42 | 3 | Compact Cluster | Integrated Cluster |
| 4 | Composite Model | adaptive-water-95 | legacy-reliabil-43 | 4 | Legacy Review D | Extended Review |

The view `vw_well_watered_place_pastoral_community` joins `well_watered_places` to `pastoral_communities` on `well_watered_places.pastoral_community_id = pastoral_communities.pastoral_community_id`. It answers: "Which pastoral community is associated with each well watered place?" Row 1 links well watered place "Distributed Cluster" to community "Primary Initiative A" with primary livelihood "seasonal-primary-35". This view isolates the water-community relationship, showing which communities rely on which water resources.

**View `vw_well_watered_place_water_management_practice`**

```sql
CREATE VIEW vw_well_watered_place_water_management_practice AS
SELECT a.id, a.place_name, a.water_source, a.reliability, b.water_management_practice_id AS practice_water_management_practice_id, b.practice_name AS practice_practice_name, b.conservation_level AS practice_conservation_level
FROM well_watered_places a JOIN water_management_practices b ON a.water_management_practice_id = b.water_management_practice_id;
```

| id | place_name | water_source | reliability | practice_water_management_practice_id | practice_practice_name | practice_conservation_level |
|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | compact-water-92 | integrated-reliabil-40 | 1 | Seasonal Survey | compact-conserva-68 |
| 2 | Adaptive Review D | composite-water-93 | seasonal-reliabil-41 | 2 | Integrated Corridor | composite-conserva-69 |
| 3 | Primary Initiative | primary-water-94 | regional-reliabil-42 | 3 | Extended Series D | primary-conserva-70 |
| 4 | Composite Model | adaptive-water-95 | legacy-reliabil-43 | 4 | Pilot Assessment | adaptive-conserva-71 |

The view `vw_well_watered_place_water_management_practice` joins `well_watered_places` to `water_management_practices` on `well_watered_places.water_management_practice_id = water_management_practices.water_management_practice_id`. It answers: "Which water management practice governs each well watered place?" Row 1 shows well watered place "Distributed Cluster" governed by practice "Seasonal Survey" with conservation level "compact-conserva-68" and effectiveness "legacy-effectiv-73". This view reconstructs the operational relationship between water resources and the practices that manage them.

**View `vw_water_management_practice_pastoral_community`**

```sql
CREATE VIEW vw_water_management_practice_pastoral_community AS
SELECT a.water_management_practice_id, a.practice_name, a.conservation_level, a.historical_period, b.pastoral_community_id AS community_pastoral_community_id, b.community_name AS community_community_name, b.territory_name AS community_territory_name
FROM water_management_practices a JOIN pastoral_communities b ON a.pastoral_community_id = b.pastoral_community_id;
```

| water_management_practice_id | practice_name | conservation_level | historical_period | community_pastoral_community_id | community_community_name | community_territory_name |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | compact-conserva-68 | compact-historic-26 | 1 | Primary Initiative A | Regional Initiative |
| 2 | Integrated Corridor | composite-conserva-69 | composite-historic-27 | 2 | Composite Model | Seasonal Model D |
| 3 | Extended Series D | primary-conserva-70 | primary-historic-28 | 3 | Compact Cluster | Integrated Cluster |
| 4 | Pilot Assessment | adaptive-conserva-71 | adaptive-historic-29 | 4 | Legacy Review D | Extended Review |

The view `vw_water_management_practice_pastoral_community` joins `water_management_practices` to `pastoral_communities` on `water_management_practices.pastoral_community_id = pastoral_communities.pastoral_community_id`. It answers: "Which pastoral community employs each water management practice?" Row 1 links practice "Seasonal Survey" to community "Primary Initiative A" with primary livelihood "seasonal-primary-35". This view inverts the perspective of `vw_pastoral_community_water_management_practice`, starting from the practice and revealing its user community.

**View `vw_water_management_practice_territory`**

```sql
CREATE VIEW vw_water_management_practice_territory AS
SELECT a.water_management_practice_id, a.practice_name, a.conservation_level, a.historical_period, b.id AS territory_id, b.territory_name AS territory_territory_name, b.location AS territory_location
FROM water_management_practices a JOIN territories b ON a.territory_id = b.id;
```

| water_management_practice_id | practice_name | conservation_level | historical_period | territory_id | territory_territory_name | territory_location |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | compact-conserva-68 | compact-historic-26 | 1000 | Regional Initiative | extended-location-99 |
| 2 | Integrated Corridor | composite-conserva-69 | composite-historic-27 | 1001 | Seasonal Model D | integrated-location-100 |
| 3 | Extended Series D | primary-conserva-70 | primary-historic-28 | 1002 | Integrated Cluster | seasonal-location-101 |
| 4 | Pilot Assessment | adaptive-conserva-71 | adaptive-historic-29 | 1003 | Extended Review | regional-location-102 |

The view `vw_water_management_practice_territory` joins `water_management_practices` to `territories` on `water_management_practices.territory_id = territories.id`. It answers: "In which territory is each water management practice applied?" Row 1 shows practice "Seasonal Survey" applied in territory "Regional Initiative" with area size 1.52 and dominant ecosystem "adaptive-dominant-29". This view reconstructs the territorial scope of management practices.

**View `vw_water_management_practice_hydrological_stress`**

```sql
CREATE VIEW vw_water_management_practice_hydrological_stress AS
SELECT a.water_management_practice_id, a.practice_name, a.conservation_level, a.historical_period, b.hydrological_stress_id AS stress_hydrological_stress_id, b.stress_level AS stress_stress_level, b.duration AS stress_duration
FROM water_management_practices a JOIN hydrological_stresses b ON a.hydrological_stress_id = b.hydrological_stress_id;
```

| water_management_practice_id | practice_name | conservation_level | historical_period | stress_hydrological_stress_id | stress_stress_level | stress_duration |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | compact-conserva-68 | compact-historic-26 | 1 | compact-stress-20 | 28 |
| 2 | Integrated Corridor | composite-conserva-69 | composite-historic-27 | 2 | composite-stress-21 | 36 |
| 3 | Extended Series D | primary-conserva-70 | primary-historic-28 | 3 | primary-stress-22 | 44 |
| 4 | Pilot Assessment | adaptive-conserva-71 | adaptive-historic-29 | 4 | adaptive-stress-23 | 52 |

The view `vw_water_management_practice_hydrological_stress` joins `water_management_practices` to `hydrological_stresses` on `water_management_practices.hydrological_stress_id = hydrological_stresses.hydrological_stress_id`. It answers: "Which hydrological stress does each water management practice address?" Row 1 links practice "Seasonal Survey" to stress "compact-stress-20" with duration 28, affected area "extended-affected-15", and impact on livelihood "regional-impact-36". This view is critical for understanding the cause-and-effect relationship between environmental pressures and management responses.

**View `vw_hydrological_stress_pastoral_community`**

```sql
CREATE VIEW vw_hydrological_stress_pastoral_community AS
SELECT a.hydrological_stress_id, a.stress_level, a.duration, a.affected_area, b.pastoral_community_id AS community_pastoral_community_id, b.community_name AS community_community_name, b.territory_name AS community_territory_name
FROM hydrological_stresses a JOIN pastoral_communities b ON a.pastoral_community_id = b.pastoral_community_id;
```

| hydrological_stress_id | stress_level | duration | affected_area | community_pastoral_community_id | community_community_name | community_territory_name |
|---|---|---|---|---|---|---|
| 1 | compact-stress-20 | 28 | extended-affected-15 | 1 | Primary Initiative A | Regional Initiative |
| 2 | composite-stress-21 | 36 | integrated-affected-16 | 2 | Composite Model | Seasonal Model D |
| 3 | primary-stress-22 | 44 | seasonal-affected-17 | 3 | Compact Cluster | Integrated Cluster |
| 4 | adaptive-stress-23 | 52 | regional-affected-18 | 4 | Legacy Review D | Extended Review |

The view `vw_hydrological_stress_pastoral_community` joins `hydrological_stresses` to `pastoral_communities` on `hydrological_stresses.pastoral_community_id = pastoral_communities.pastoral_community_id`. It answers: "Which pastoral community is affected by each hydrological stress?" Row 1 links stress "compact-stress-20" (duration 28) to community "Primary Initiative A" with primary livelihood "seasonal-primary-35". This view reconstructs the human dimension of environmental stress, showing which communities bear the impact.

**View `vw_hydrological_stress_territory`**

```sql
CREATE VIEW vw_hydrological_stress_territory AS
SELECT a.hydrological_stress_id, a.stress_level, a.duration, a.affected_area, b.id AS territory_id, b.territory_name AS territory_territory_name, b.location AS territory_location
FROM hydrological_stresses a JOIN territories b ON a.territory_id = b.id;
```

| hydrological_stress_id | stress_level | duration | affected_area | territory_id | territory_territory_name | territory_location |
|---|---|---|---|---|---|---|
| 1 | compact-stress-20 | 28 | extended-affected-15 | 1000 | Regional Initiative | extended-location-99 |
| 2 | composite-stress-21 | 36 | integrated-affected-16 | 1001 | Seasonal Model D | integrated-location-100 |
| 3 | primary-stress-22 | 44 | seasonal-affected-17 | 1002 | Integrated Cluster | seasonal-location-101 |
| 4 | adaptive-stress-23 | 52 | regional-affected-18 | 1003 | Extended Review | regional-location-102 |

The view `vw_hydrological_stress_territory` joins `hydrological_stresses` to `territories` on `hydrological_stresses.territory_id = territories.id`. It answers: "In which territory does each hydrological stress occur?" Row 1 shows stress "compact-stress-20" occurring in territory "Regional Initiative" with area size 1.52 and dominant ecosystem "adaptive-dominant-29". This view reconstructs the geographic dimension of environmental stress events.

**View `vw_hydrological_stress_water_management_practice`**

```sql
CREATE VIEW vw_hydrological_stress_water_management_practice AS
SELECT a.hydrological_stress_id, a.stress_level, a.duration, a.affected_area, b.water_management_practice_id AS practice_water_management_practice_id, b.practice_name AS practice_practice_name, b.conservation_level AS practice_conservation_level
FROM hydrological_stresses a JOIN water_management_practices b ON a.water_management_practice_id = b.water_management_practice_id;
```

| hydrological_stress_id | stress_level | duration | affected_area | practice_water_management_practice_id | practice_practice_name | practice_conservation_level |
|---|---|---|---|---|---|---|
| 1 | compact-stress-20 | 28 | extended-affected-15 | 1 | Seasonal Survey | compact-conserva-68 |
| 2 | composite-stress-21 | 36 | integrated-affected-16 | 2 | Integrated Corridor | composite-conserva-69 |
| 3 | primary-stress-22 | 44 | seasonal-affected-17 | 3 | Extended Series D | primary-conserva-70 |
| 4 | adaptive-stress-23 | 52 | regional-affected-18 | 4 | Pilot Assessment | adaptive-conserva-71 |

The view `vw_hydrological_stress_water_management_practice` joins `hydrological_stresses` to `water_management_practices` on `hydrological_stresses.water_management_practice_id = water_management_practices.water_management_practice_id`. It answers: "Which water management practice responds to each hydrological stress?" Row 1 links stress "compact-stress-20" to practice "Seasonal Survey" with conservation level "compact-conserva-68" and effectiveness "legacy-effectiv-73". This view inverts the perspective of `vw_water_management_practice_hydrological_stress`, starting from the stress and revealing the practice designed to mitigate it.

**View `vw_alternative_livelihood_pastoral_community`**

```sql
CREATE VIEW vw_alternative_livelihood_pastoral_community AS
SELECT a.id, a.livelihood_type, a.adoption_rate, a.primary_drivers, b.pastoral_community_id AS community_pastoral_community_id, b.community_name AS community_community_name, b.territory_name AS community_territory_name
FROM alternative_livelihoods a JOIN pastoral_communities b ON a.pastoral_community_id = b.pastoral_community_id;
```

| id | livelihood_type | adoption_rate | primary_drivers | community_pastoral_community_id | community_community_name | community_territory_name |
|---|---|---|---|---|---|---|
| 1 | baseline-liveliho-37 | 7.20 | integrated-primary-22 | 1 | Primary Initiative A | Regional Initiative |
| 2 | pilot-liveliho-38 | 9.40 | seasonal-primary-23 | 2 | Composite Model | Seasonal Model D |
| 3 | extended-liveliho-39 | 11.60 | regional-primary-24 | 3 | Compact Cluster | Integrated Cluster |
| 4 | integrated-liveliho-40 | 13.80 | legacy-primary-25 | 4 | Legacy Review D | Extended Review |

The view `vw_alternative_livelihood_pastoral_community` joins `alternative_livelihoods` to `pastoral_communities` on `alternative_livelihoods.pastoral_community_id = pastoral_communities.pastoral_community_id`. It answers: "Which pastoral community pursues each alternative livelihood?" Row 1 links livelihood "baseline-liveliho-37" (adoption rate 7.20) to community "Primary Initiative A" with primary livelihood "seasonal-primary-35". This view reconstructs the community-livelihood relationship from the livelihood's perspective.

**View `vw_alternative_livelihood_well_watered_place`**

```sql
CREATE VIEW vw_alternative_livelihood_well_watered_place AS
SELECT a.id, a.livelihood_type, a.adoption_rate, a.primary_drivers, b.id AS place_id, b.place_name AS place_place_name, b.water_source AS place_water_source
FROM alternative_livelihoods a JOIN well_watered_places b ON a.well_watered_place_id = b.id;
```

| id | livelihood_type | adoption_rate | primary_drivers | place_id | place_place_name | place_water_source |
|---|---|---|---|---|---|---|
| 1 | baseline-liveliho-37 | 7.20 | integrated-primary-22 | 1 | Distributed Cluster | compact-water-92 |
| 2 | pilot-liveliho-38 | 9.40 | seasonal-primary-23 | 2 | Adaptive Review D | composite-water-93 |
| 3 | extended-liveliho-39 | 11.60 | regional-primary-24 | 3 | Primary Initiative | primary-water-94 |
| 4 | integrated-liveliho-40 | 13.80 | legacy-primary-25 | 4 | Composite Model | adaptive-water-95 |

The view `vw_alternative_livelihood_well_watered_place` joins `alternative_livelihoods` to `well_watered_places` on `alternative_livelihoods.well_watered_place_id = well_watered_places.id`. It answers: "Which well watered place supports each alternative livelihood?" Row 1 shows livelihood "baseline-liveliho-37" supported by well watered place "Distributed Cluster" with water source "compact-water-92" and reliability "integrated-reliabil-40". This view reconstructs the resource-livelihood relationship, showing how water resources enable economic adaptation.

### Synthesis

The pastoral domain model demonstrates how a complex socio-ecological system can be decomposed into six entity types, each materialised as a normalised table with a primary key, intrinsic attributes, and foreign-key columns that encode relationships. The `pastoral_communities` table serves as the central hub, with three foreign keys reaching out to `territories`, `water_management_practices`, and `alternative_livelihoods`. The remaining tables form a web of cross-references: `territories` links to `well_watered_places` and `pastoral_communities`, `water_management_practices` links to `hydrological_stresses`, and `alternative_livelihoods` links to `well_watered_places`. The twenty-one views provide pre-joined lenses that answer specific analytical questions by reconstructing domain facts from the normalised tables. Each view performs a simple equi-join on a single foreign-key relationship, and reading concrete rows from these views — such as "Primary Initiative A" using "Seasonal Survey" to address "compact-stress-20" in territory "Regional Initiative" — reveals how the normalised schema captures the full richness of the pastoral domain in a form that is both storage-efficient and analytically accessible.