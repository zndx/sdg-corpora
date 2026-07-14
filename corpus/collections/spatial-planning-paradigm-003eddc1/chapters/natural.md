Spatial planning operates as a multi-layered discipline where theoretical frameworks, land-use designations, ecological constraints, and public sentiment converge within defined geographic zones. Practitioners must navigate a structured information ecosystem that records paradigms of planning thought, catalogs the physical and ecological character of territories, and tracks how communities perceive the natural features embedded in those territories. The records maintained across this domain capture everything from the theoretical focus of a planning paradigm to the sentiment score of a community survey, linking them through explicit relationships that allow analysts to trace how a policy instrument influences a land-use designation, or how a wetland's conservation status relates to the spatial planning zone that governs it. Understanding the structure and content of these records is essential for anyone working at the intersection of urban development, environmental stewardship, and community engagement.

## Foundational Records

The domain's conceptual backbone consists of several core tables that store the primary entities practitioners interact with daily.

**Table `spatial_planning_paradigms`**

| id | paradigm_id | name | theoretical_focus | methodological_focus | status | land_use_id | ecological_system_id | policy_instrument_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 330 | Extended Review | composite-theoreti-27 | seasonal-methodol-77 | emerging | 1 | ChIJ9_yxvThu5kcRRx3ldW98aY0 | 1 |
| 1001 | 4180945 | Pilot Initiative A | primary-theoreti-28 | regional-methodol-78 | established | 2 | 2002007020090 | 2 |
| 1002 | 9568462 | Baseline Model | adaptive-theoreti-29 | legacy-methodol-79 | deprecated | 3 | default_chart_a_tax_code_30 | 3 |
| 1003 | 9125627 | Distributed Cluster | distributed-theoreti-30 | compact-methodol-80 | emerging | 4 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 4 |

The spatial planning paradigms table captures the theoretical and methodological orientations that guide planning decisions. Each paradigm carries a unique identifier, a name such as "Extended Review" or "Pilot Initiative A," and specifies both a theoretical focus and a methodological focus using coded descriptors like `seasonal-methodol-77` or `regional-methodol-78`. The status field tracks the lifecycle stage of each paradigm, ranging from `emerging` to `established` to `deprecated`. Row 1000, for instance, represents the "Extended Review" paradigm with theoretical focus `composite-theoreti-27` and methodological focus `seasonal-methodol-77`, currently in an `emerging` status. Row 1001, "Pilot Initiative A," carries the identifier `4180945` and is marked `established`. The paradigm records also maintain foreign-key links to land-use records, ecological systems, and policy instruments, establishing the first layer of relational structure in the domain.

**Table `land_uses`**

| id | land_use_id | zoning_district | density_class | primary_function | last_survey_date | spatial_planning_zone_id | transit_oriented_development_id | spatial_planning_paradigm_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4985176 | adaptive-zoning-95 | low-density | seasonal-primary-77 | 2025-04-15 | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 325458 | distributed-zoning-96 | medium-density | regional-primary-78 | 2022-09-26 | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 5082970 | baseline-zoning-97 | high-density | legacy-primary-79 | 2023-02-10 | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Tanggal | pilot-zoning-98 | low-density | compact-primary-80 | 2024-07-21 | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Land-use records document the practical application of planning principles to specific zoning districts. Each entry identifies a zoning district such as `adaptive-zoning-95` or `pilot-zoning-98`, assigns a density class ranging from `low-density` to `high-density`, and describes a primary function using codes like `seasonal-primary-77` or `compact-primary-80`. The land-use table also tracks temporal metadata through `last_survey_date`, `created_at`, and `updated_at` fields. Row 1, associated with zoning district `adaptive-zoning-95`, has a `low-density` classification and `seasonal-primary-77` as its primary function, with a last survey conducted on 2025-04-15. Row 4, under `pilot-zoning-98`, similarly carries a `low-density` designation but with `compact-primary-80` as its function and a more recent survey date of 2024-07-21. These records link to spatial planning zones, transit-oriented developments, and the paradigms that inform them.

**Table `transit_oriented_developments`**

| id | tod_id | name | conurbation | coverage_radius | implementation_status | spatial_planning_zone_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 10238282 | Extended Review | compact-conurbat-68 | 20.45 | planned | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 3012808 | Pilot Initiative A | composite-conurbat-69 | 24.90 | under_construction | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3001009030280 | Baseline Model | primary-conurbat-70 | 29.35 | operational | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2640 | Distributed Cluster | adaptive-conurbat-71 | 33.80 | planned | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Transit-oriented developments (TODs) represent concentrated urban growth strategies centered around public transit access. Each TOD record includes a unique TOD identifier, a name that often mirrors the associated planning paradigm, a conurbation classification such as `compact-conurbat-68` or `adaptive-conurbat-71`, and a `coverage_radius` measured in kilometers. The implementation status field tracks project progress through stages including `planned`, `under_construction`, and `operational`. The first TOD, identified as `10238282` and named "Extended Review," has a coverage radius of 20.45 km and is in the `planned` stage. The third TOD, `3001009030280` ("Baseline Model"), covers 29.35 km and is already `operational`. TODs are anchored to specific spatial planning zones, creating a geographic anchor for development activity.

**Table `ecological_systems`**

| ecological_system_id | name | type | area_hectares | conservation_status | spatial_planning_zone_id |
|---|---|---|---|---|---|
| ChIJ9_yxvThu5kcRRx3ldW98aY0 | Extended Review | urban_park | 10.20 | protected | 1 |
| 2002007020090 | Pilot Initiative A | wetland | 14.40 | vulnerable | 2 |
| default_chart_a_tax_code_30 | Baseline Model | forest | 18.60 | degraded | 3 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | coastal | 22.80 | protected | 4 |

Ecological systems catalog the natural environments within planning jurisdictions. Each system carries an ecological system identifier, a name, a type classification such as `urban_park`, `wetland`, `forest`, or `coastal`, an area measurement in hectares, and a conservation status of `protected`, `vulnerable`, or `degraded`. The first ecological system, identified by the Google Place ID `ChIJ9_yxvThu5kcRRx3ldW98aY0`, is an `urban_park` spanning 10.20 hectares with `protected` status. The fourth system, `136630a8-8fcc-11eb-924d-9cd76263cbd0`, is a `coastal` ecosystem covering 22.80 hectares, also `protected`. The second system, `2002007020090`, is a `wetland` of 14.40 hectares classified as `vulnerable`. These systems are tied to spatial planning zones, grounding ecological data within administrative boundaries.

**Table `natural_features`**

| id | feature_id | name | category | perceived_value | ecological_system_id | public_perception_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 9568441 | Extended Review | flora | 4.45 | ChIJ9_yxvThu5kcRRx3ldW98aY0 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 32806 | Pilot Initiative A | fauna | 8.90 | 2002007020090 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | df2daef0-8fcc-11eb-924d-9cd76263cbd0 | Baseline Model | hydrology | 13.35 | default_chart_a_tax_code_30 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 12388 | Distributed Cluster | geomorphology | 17.80 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Natural features are the specific environmental elements within ecological systems that receive focused attention. Each feature has a feature identifier, a name, a category such as `flora`, `fauna`, `hydrology`, or `geomorphology`, a `perceived_value` score, and links to both its parent ecological system and a public perception record. The first feature, `9568441` ("Extended Review"), is categorized as `flora` with a perceived value of 4.45. The fourth feature, `12388` ("Distributed Cluster"), falls under `geomorphology` and carries the highest perceived value of 17.80. These features serve as the bridge between ecological data and community sentiment.

**Table `public_perceptions`**

| public_perception_id | perception_id | methodology | subject | sentiment_score | survey_date | natural_feature_id | spatial_planning_zone_id |
|---|---|---|---|---|---|---|---|
| 1 | 2106694 | compact-methodol-68 | adaptive-subject-83 | 4.95 | 2024-07-23T18:30:00 | 1 | 1 |
| 2 | id_26 | composite-methodol-69 | distributed-subject-84 | 6.90 | 2025-12-07T01:47:00 | 2 | 2 |
| 3 | 1562849 | primary-methodol-70 | baseline-subject-85 | 8.85 | 2022-05-18T08:04:00 | 3 | 3 |
| 4 | 3001009030160 | adaptive-methodol-71 | pilot-subject-86 | 10.80 | 2023-10-02T15:21:00 | 4 | 4 |

Public perceptions record community attitudes toward natural features through structured surveys. Each perception entry includes a public perception identifier, a methodology code such as `compact-methodol-68` or `adaptive-methodol-71`, a subject descriptor like `adaptive-subject-83` or `pilot-subject-86`, a `sentiment_score` ranging from 4.95 to 10.80, a survey date, and links to the relevant natural feature and spatial planning zone. The first perception, with ID `2106694`, used `compact-methodol-68` to survey `adaptive-subject-83`, yielding a sentiment score of 4.95 on 2024-07-23. The fourth perception, `3001009030160`, employed `adaptive-methodol-71` on `pilot-subject-86`, achieving a notably higher sentiment score of 10.80. These records connect human values to physical features within defined zones.

**Table `policy_instruments`**

| policy_instrument_id | policy_id | name | jurisdiction | effective_date | status | public_perception_id | land_use_id | spatial_planning_zone_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | regional-jurisdic-30 | 2023-02-14 | draft | 1 | 1 | 1 |
| 2 | 10207142 | Pilot Initiative A | legacy-jurisdic-31 | 2024-07-25 | active | 2 | 2 | 2 |
| 3 | 1562847 | Baseline Model | compact-jurisdic-32 | 2025-12-09 | repealed | 3 | 3 | 3 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | composite-jurisdic-33 | 2022-05-20 | draft | 4 | 4 | 4 |

Policy instruments represent the regulatory and incentive mechanisms through which planning paradigms exert influence on the ground. Each instrument is linked to a paradigm and serves as the operational bridge between theoretical frameworks and practical outcomes. The policy instruments table maintains references to paradigms, land uses, and public perceptions, enabling analysts to trace how a specific policy approach shapes both land-use patterns and community sentiment.

**Table `spatial_planning_zones`**

| spatial_planning_zone_id | zone_id | name | region | country | area_km2 | transit_oriented_development_id | ecological_system_id |
|---|---|---|---|---|---|---|---|
| 1 | 937724 | Extended Review | distributed-region-12 | compact-country-26 | 14.70 | 1 | ChIJ9_yxvThu5kcRRx3ldW98aY0 |
| 2 | 99504 | Pilot Initiative A | baseline-region-13 | composite-country-27 | 16.40 | 2 | 2002007020090 |
| 3 | 10207142 | Baseline Model | pilot-region-14 | primary-country-28 | 18.10 | 3 | default_chart_a_tax_code_30 |
| 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | extended-region-15 | adaptive-country-29 | 19.80 | 4 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 |

Spatial planning zones provide the geographic and administrative framework within which all other records are organized. Every land use, transit-oriented development, ecological system, and public perception is anchored to a specific zone, making zones the primary spatial container for the domain's data. The zones themselves are referenced through join tables that capture many-to-many relationships between zones and the entities they contain.

## Relational Infrastructure

Beyond the core entity tables, the domain employs join tables to manage relationships that cannot be expressed through simple foreign keys.

**Table `developments_uses`**

| transit_oriented_development_id | land_use_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The developments_uses table resolves the many-to-many relationship between transit-oriented developments and land uses, allowing a single TOD to encompass multiple land-use types and a single land-use designation to appear across multiple TODs. This flexibility reflects the reality that urban development projects rarely conform to rigid categorical boundaries.

**Table `systems_features`**

| ecological_system_id | natural_feature_id |
|---|---|
| ChIJ9_yxvThu5kcRRx3ldW98aY0 | 1 |
| ChIJ9_yxvThu5kcRRx3ldW98aY0 | 2 |
| 2002007020090 | 2 |
| 2002007020090 | 3 |
| default_chart_a_tax_code_30 | 3 |
| default_chart_a_tax_code_30 | 4 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 4 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 1 |

Systems_features links ecological systems to natural features, supporting the hierarchical relationship where a single ecological system—such as a forest or wetland—contains multiple distinct natural features. This table ensures that the ecological hierarchy is preserved in the data while allowing features to be queried independently.

**Table `zones_uses`**

| spatial_planning_zone_id | land_use_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Zones_uses captures the relationship between spatial planning zones and land uses, enabling zones to contain multiple land-use designations and land uses to span multiple zones. This join table is essential for understanding the composite character of planning zones.

## Analytical Views

The domain provides a comprehensive set of analytical views that join base tables to answer specific operational questions. Each view synthesizes data from multiple sources to produce actionable insights.

**View `spatial_planning_paradigm_land_use_view`**

```sql
CREATE VIEW spatial_planning_paradigm_land_use_view AS
SELECT a.id, a.paradigm_id, a.name, a.theoretical_focus, b.id AS use_id, b.land_use_id AS use_land_use_id, b.zoning_district AS use_zoning_district
FROM spatial_planning_paradigms a JOIN land_uses b ON a.land_use_id = b.id;
```

| id | paradigm_id | name | theoretical_focus | use_id | use_land_use_id | use_zoning_district |
|---|---|---|---|---|---|---|
| 1000 | 330 | Extended Review | composite-theoreti-27 | 1 | 4985176 | adaptive-zoning-95 |
| 1001 | 4180945 | Pilot Initiative A | primary-theoreti-28 | 2 | 325458 | distributed-zoning-96 |
| 1002 | 9568462 | Baseline Model | adaptive-theoreti-29 | 3 | 5082970 | baseline-zoning-97 |
| 1003 | 9125627 | Distributed Cluster | distributed-theoreti-30 | 4 | Tanggal | pilot-zoning-98 |

This view connects planning paradigms to their corresponding land-use designations, answering the question of which theoretical frameworks inform which practical zoning outcomes. The "Extended Review" paradigm (ID 1000) links to land use ID 1 under zoning district `adaptive-zoning-95`, while "Pilot Initiative A" (ID 1001) connects to land use ID 2 with `distributed-zoning-96`.

**View `spatial_planning_paradigm_ecological_system_view`**

```sql
CREATE VIEW spatial_planning_paradigm_ecological_system_view AS
SELECT a.id, a.paradigm_id, a.name, a.theoretical_focus, b.ecological_system_id AS system_ecological_system_id, b.name AS system_name, b.type AS system_type
FROM spatial_planning_paradigms a JOIN ecological_systems b ON a.ecological_system_id = b.ecological_system_id;
```

| id | paradigm_id | name | theoretical_focus | system_ecological_system_id | system_name | system_type |
|---|---|---|---|---|---|---|
| 1000 | 330 | Extended Review | composite-theoreti-27 | ChIJ9_yxvThu5kcRRx3ldW98aY0 | Extended Review | urban_park |
| 1001 | 4180945 | Pilot Initiative A | primary-theoreti-28 | 2002007020090 | Pilot Initiative A | wetland |
| 1002 | 9568462 | Baseline Model | adaptive-theoreti-29 | default_chart_a_tax_code_30 | Baseline Model | forest |
| 1003 | 9125627 | Distributed Cluster | distributed-theoreti-30 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | coastal |

By joining paradigms with ecological systems, this view reveals how theoretical planning orientations relate to environmental contexts. The "Extended Review" paradigm corresponds to the `urban_park` ecological system `ChIJ9_yxvThu5kcRRx3ldW98aY0`, while "Distributed Cluster" (ID 1003) aligns with the `coastal` system `136630a8-8fcc-11eb-924d-9cd76263cbd0`.

**View `spatial_planning_paradigm_policy_instrument_view`**

```sql
CREATE VIEW spatial_planning_paradigm_policy_instrument_view AS
SELECT a.id, a.paradigm_id, a.name, a.theoretical_focus, b.policy_instrument_id AS instrument_policy_instrument_id, b.policy_id AS instrument_policy_id, b.name AS instrument_name
FROM spatial_planning_paradigms a JOIN policy_instruments b ON a.policy_instrument_id = b.policy_instrument_id;
```

| id | paradigm_id | name | theoretical_focus | instrument_policy_instrument_id | instrument_policy_id | instrument_name |
|---|---|---|---|---|---|---|
| 1000 | 330 | Extended Review | composite-theoreti-27 | 1 | 5844252 | Extended Review |
| 1001 | 4180945 | Pilot Initiative A | primary-theoreti-28 | 2 | 10207142 | Pilot Initiative A |
| 1002 | 9568462 | Baseline Model | adaptive-theoreti-29 | 3 | 1562847 | Baseline Model |
| 1003 | 9125627 | Distributed Cluster | distributed-theoreti-30 | 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster |

This view maps paradigms to the policy instruments that operationalize them. Each paradigm—whether `emerging` like "Extended Review" or `established` like "Pilot Initiative A"—is paired with a specific policy instrument, creating a traceable path from theory to regulation.

**View `land_use_spatial_planning_zone_view`**

```sql
CREATE VIEW land_use_spatial_planning_zone_view AS
SELECT a.id, a.land_use_id, a.zoning_district, a.density_class, b.spatial_planning_zone_id AS zone_spatial_planning_zone_id, b.zone_id AS zone_zone_id, b.name AS zone_name
FROM land_uses a JOIN spatial_planning_zones b ON a.spatial_planning_zone_id = b.spatial_planning_zone_id;
```

| id | land_use_id | zoning_district | density_class | zone_spatial_planning_zone_id | zone_zone_id | zone_name |
|---|---|---|---|---|---|---|
| 1 | 4985176 | adaptive-zoning-95 | low-density | 1 | 937724 | Extended Review |
| 2 | 325458 | distributed-zoning-96 | medium-density | 2 | 99504 | Pilot Initiative A |
| 3 | 5082970 | baseline-zoning-97 | high-density | 3 | 10207142 | Baseline Model |
| 4 | Tanggal | pilot-zoning-98 | low-density | 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster |

The land-use-to-zone view clarifies which zoning districts fall within which spatial planning zones. Land use ID 1 (`adaptive-zoning-95`) resides in spatial planning zone 1, while land use ID 4 (`pilot-zoning-98`) is located in zone 4, establishing a clear geographic mapping.

**View `land_use_transit_oriented_development_view`**

```sql
CREATE VIEW land_use_transit_oriented_development_view AS
SELECT a.id, a.land_use_id, a.zoning_district, a.density_class, b.id AS development_id, b.tod_id AS development_tod_id, b.name AS development_name
FROM land_uses a JOIN transit_oriented_developments b ON a.transit_oriented_development_id = b.id;
```

| id | land_use_id | zoning_district | density_class | development_id | development_tod_id | development_name |
|---|---|---|---|---|---|---|
| 1 | 4985176 | adaptive-zoning-95 | low-density | 1 | 10238282 | Extended Review |
| 2 | 325458 | distributed-zoning-96 | medium-density | 2 | 3012808 | Pilot Initiative A |
| 3 | 5082970 | baseline-zoning-97 | high-density | 3 | 3001009030280 | Baseline Model |
| 4 | Tanggal | pilot-zoning-98 | low-density | 4 | 2640 | Distributed Cluster |

This view associates land uses with the transit-oriented developments that contain them. Land use ID 1 pairs with TOD `10238282` ("Extended Review"), and land use ID 3 connects to TOD `3001009030280` ("Baseline Model"), showing how development projects incorporate specific zoning categories.

**View `land_use_spatial_planning_paradigm_view`**

```sql
CREATE VIEW land_use_spatial_planning_paradigm_view AS
SELECT a.id, a.land_use_id, a.zoning_district, a.density_class, b.id AS paradigm_id, b.paradigm_id AS paradigm_paradigm_id, b.name AS paradigm_name
FROM land_uses a JOIN spatial_planning_paradigms b ON a.spatial_planning_paradigm_id = b.id;
```

| id | land_use_id | zoning_district | density_class | paradigm_id | paradigm_paradigm_id | paradigm_name |
|---|---|---|---|---|---|---|
| 1 | 4985176 | adaptive-zoning-95 | low-density | 1000 | 330 | Extended Review |
| 2 | 325458 | distributed-zoning-96 | medium-density | 1001 | 4180945 | Pilot Initiative A |
| 3 | 5082970 | baseline-zoning-97 | high-density | 1002 | 9568462 | Baseline Model |
| 4 | Tanggal | pilot-zoning-98 | low-density | 1003 | 9125627 | Distributed Cluster |

Reversing the paradigm-to-land-use relationship, this view answers which paradigms underpin specific land-use designations. Land use ID 1 traces back to paradigm 1000 ("Extended Review"), while land use ID 4 connects to paradigm 1003 ("Distributed Cluster"), demonstrating the theoretical grounding of practical zoning.

**View `transit_oriented_development_land_use_detail_view`**

```sql
CREATE VIEW transit_oriented_development_land_use_detail_view AS
SELECT a.id, a.tod_id, a.name, b.id AS use_id, b.land_use_id AS use_land_use_id, b.zoning_district AS use_zoning_district
FROM transit_oriented_developments a
  JOIN developments_uses j ON j.transit_oriented_development_id = a.id
  JOIN land_uses b ON b.id = j.land_use_id;
```

| id | tod_id | name | use_id | use_land_use_id | use_zoning_district |
|---|---|---|---|---|---|
| 1 | 10238282 | Extended Review | 1 | 4985176 | adaptive-zoning-95 |
| 1 | 10238282 | Extended Review | 2 | 325458 | distributed-zoning-96 |
| 2 | 3012808 | Pilot Initiative A | 2 | 325458 | distributed-zoning-96 |
| 2 | 3012808 | Pilot Initiative A | 3 | 5082970 | baseline-zoning-97 |
| 3 | 3001009030280 | Baseline Model | 3 | 5082970 | baseline-zoning-97 |
| 3 | 3001009030280 | Baseline Model | 4 | Tanggal | pilot-zoning-98 |
| 4 | 2640 | Distributed Cluster | 4 | Tanggal | pilot-zoning-98 |
| 4 | 2640 | Distributed Cluster | 1 | 4985176 | adaptive-zoning-95 |

This detailed view provides an expanded look at TODs alongside their constituent land uses, including conurbation classifications and density information. TOD `10238282` ("Extended Review") operates with a 20.45 km coverage radius in the `compact-conurbat-68` conurbation, serving land use ID 1 with `low-density` classification.

**View `transit_oriented_development_spatial_planning_zone_view`**

```sql
CREATE VIEW transit_oriented_development_spatial_planning_zone_view AS
SELECT a.id, a.tod_id, a.name, a.conurbation, b.spatial_planning_zone_id AS zone_spatial_planning_zone_id, b.zone_id AS zone_zone_id, b.name AS zone_name
FROM transit_oriented_developments a JOIN spatial_planning_zones b ON a.spatial_planning_zone_id = b.spatial_planning_zone_id;
```

| id | tod_id | name | conurbation | zone_spatial_planning_zone_id | zone_zone_id | zone_name |
|---|---|---|---|---|---|---|
| 1 | 10238282 | Extended Review | compact-conurbat-68 | 1 | 937724 | Extended Review |
| 2 | 3012808 | Pilot Initiative A | composite-conurbat-69 | 2 | 99504 | Pilot Initiative A |
| 3 | 3001009030280 | Baseline Model | primary-conurbat-70 | 3 | 10207142 | Baseline Model |
| 4 | 2640 | Distributed Cluster | adaptive-conurbat-71 | 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster |

Linking TODs directly to their governing spatial planning zones, this view confirms that TOD `10238282` is anchored in zone 1, TOD `3012808` in zone 2, and so on, reinforcing the geographic discipline of development planning.

**View `ecological_system_natural_feature_detail_view`**

```sql
CREATE VIEW ecological_system_natural_feature_detail_view AS
SELECT a.ecological_system_id, a.name, a.type, b.id AS feature_id, b.feature_id AS feature_feature_id, b.name AS feature_name
FROM ecological_systems a
  JOIN systems_features j ON j.ecological_system_id = a.ecological_system_id
  JOIN natural_features b ON b.id = j.natural_feature_id;
```

| ecological_system_id | name | type | feature_id | feature_feature_id | feature_name |
|---|---|---|---|---|---|
| ChIJ9_yxvThu5kcRRx3ldW98aY0 | Extended Review | urban_park | 1 | 9568441 | Extended Review |
| ChIJ9_yxvThu5kcRRx3ldW98aY0 | Extended Review | urban_park | 2 | 32806 | Pilot Initiative A |
| 2002007020090 | Pilot Initiative A | wetland | 2 | 32806 | Pilot Initiative A |
| 2002007020090 | Pilot Initiative A | wetland | 3 | df2daef0-8fcc-11eb-924d-9cd76263cbd0 | Baseline Model |
| default_chart_a_tax_code_30 | Baseline Model | forest | 3 | df2daef0-8fcc-11eb-924d-9cd76263cbd0 | Baseline Model |
| default_chart_a_tax_code_30 | Baseline Model | forest | 4 | 12388 | Distributed Cluster |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | coastal | 4 | 12388 | Distributed Cluster |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | coastal | 1 | 9568441 | Extended Review |

This view pairs ecological systems with their constituent natural features, revealing the internal composition of each system. The `urban_park` system `ChIJ9_yxvThu5kcRRx3ldW98aY0` contains the `flora` feature `9568441`, while the `wetland` system `2002007020090` holds the `fauna` feature `32806`.

**View `ecological_system_spatial_planning_zone_view`**

```sql
CREATE VIEW ecological_system_spatial_planning_zone_view AS
SELECT a.ecological_system_id, a.name, a.type, a.area_hectares, b.spatial_planning_zone_id AS zone_spatial_planning_zone_id, b.zone_id AS zone_zone_id, b.name AS zone_name
FROM ecological_systems a JOIN spatial_planning_zones b ON a.spatial_planning_zone_id = b.spatial_planning_zone_id;
```

| ecological_system_id | name | type | area_hectares | zone_spatial_planning_zone_id | zone_zone_id | zone_name |
|---|---|---|---|---|---|---|
| ChIJ9_yxvThu5kcRRx3ldW98aY0 | Extended Review | urban_park | 10.20 | 1 | 937724 | Extended Review |
| 2002007020090 | Pilot Initiative A | wetland | 14.40 | 2 | 99504 | Pilot Initiative A |
| default_chart_a_tax_code_30 | Baseline Model | forest | 18.60 | 3 | 10207142 | Baseline Model |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | coastal | 22.80 | 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster |

By connecting ecological systems to their spatial planning zones, this view confirms that each ecosystem is governed within a specific administrative boundary. The `urban_park` system resides in zone 1, the `wetland` in zone 2, the `forest` in zone 3, and the `coastal` system in zone 4.

**View `natural_feature_ecological_system_view`**

```sql
CREATE VIEW natural_feature_ecological_system_view AS
SELECT a.id, a.feature_id, a.name, a.category, b.ecological_system_id AS system_ecological_system_id, b.name AS system_name, b.type AS system_type
FROM natural_features a JOIN ecological_systems b ON a.ecological_system_id = b.ecological_system_id;
```

| id | feature_id | name | category | system_ecological_system_id | system_name | system_type |
|---|---|---|---|---|---|---|
| 1 | 9568441 | Extended Review | flora | ChIJ9_yxvThu5kcRRx3ldW98aY0 | Extended Review | urban_park |
| 2 | 32806 | Pilot Initiative A | fauna | 2002007020090 | Pilot Initiative A | wetland |
| 3 | df2daef0-8fcc-11eb-924d-9cd76263cbd0 | Baseline Model | hydrology | default_chart_a_tax_code_30 | Baseline Model | forest |
| 4 | 12388 | Distributed Cluster | geomorphology | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | coastal |

This view presents natural features alongside their parent ecological systems, providing a top-down perspective on environmental composition. Feature `9568441` (category `flora`) belongs to ecological system `ChIJ9_yxvThu5kcRRx3ldW98aY0` (type `urban_park`), while feature `df2daef0-8fcc-11eb-924d-9cd76263cbd0` (category `hydrology`) is part of the `forest` system `default_chart_a_tax_code_30`.

**View `natural_feature_public_perception_view`**

```sql
CREATE VIEW natural_feature_public_perception_view AS
SELECT a.id, a.feature_id, a.name, a.category, b.public_perception_id AS perception_public_perception_id, b.perception_id AS perception_perception_id, b.methodology AS perception_methodology
FROM natural_features a JOIN public_perceptions b ON a.public_perception_id = b.public_perception_id;
```

| id | feature_id | name | category | perception_public_perception_id | perception_perception_id | perception_methodology |
|---|---|---|---|---|---|---|
| 1 | 9568441 | Extended Review | flora | 1 | 2106694 | compact-methodol-68 |
| 2 | 32806 | Pilot Initiative A | fauna | 2 | id_26 | composite-methodol-69 |
| 3 | df2daef0-8fcc-11eb-924d-9cd76263cbd0 | Baseline Model | hydrology | 3 | 1562849 | primary-methodol-70 |
| 4 | 12388 | Distributed Cluster | geomorphology | 4 | 3001009030160 | adaptive-methodol-71 |

This view bridges the physical and social dimensions of the domain by pairing natural features with the public perceptions that evaluate them. Feature `9568441` is associated with perception ID 1 (sentiment score 4.95), while feature `12388` links to perception ID 4 (sentiment score 10.80), showing a wide range of community valuation.

**View `public_perception_natural_feature_view`**

```sql
CREATE VIEW public_perception_natural_feature_view AS
SELECT a.public_perception_id, a.perception_id, a.methodology, a.subject, b.id AS feature_id, b.feature_id AS feature_feature_id, b.name AS feature_name
FROM public_perceptions a JOIN natural_features b ON a.natural_feature_id = b.id;
```

| public_perception_id | perception_id | methodology | subject | feature_id | feature_feature_id | feature_name |
|---|---|---|---|---|---|---|
| 1 | 2106694 | compact-methodol-68 | adaptive-subject-83 | 1 | 9568441 | Extended Review |
| 2 | id_26 | composite-methodol-69 | distributed-subject-84 | 2 | 32806 | Pilot Initiative A |
| 3 | 1562849 | primary-methodol-70 | baseline-subject-85 | 3 | df2daef0-8fcc-11eb-924d-9cd76263cbd0 | Baseline Model |
| 4 | 3001009030160 | adaptive-methodol-71 | pilot-subject-86 | 4 | 12388 | Distributed Cluster |

Reversing the perspective, this view starts from public perceptions and traces them to the natural features they assess. Perception `2106694` (methodology `compact-methodol-68`, subject `adaptive-subject-83`) evaluates natural feature ID 1, while perception `3001009030160` (methodology `adaptive-methodol-71`, subject `pilot-subject-86`) assesses feature ID 4.

**View `public_perception_spatial_planning_zone_view`**

```sql
CREATE VIEW public_perception_spatial_planning_zone_view AS
SELECT a.public_perception_id, a.perception_id, a.methodology, a.subject, b.spatial_planning_zone_id AS zone_spatial_planning_zone_id, b.zone_id AS zone_zone_id, b.name AS zone_name
FROM public_perceptions a JOIN spatial_planning_zones b ON a.spatial_planning_zone_id = b.spatial_planning_zone_id;
```

| public_perception_id | perception_id | methodology | subject | zone_spatial_planning_zone_id | zone_zone_id | zone_name |
|---|---|---|---|---|---|---|
| 1 | 2106694 | compact-methodol-68 | adaptive-subject-83 | 1 | 937724 | Extended Review |
| 2 | id_26 | composite-methodol-69 | distributed-subject-84 | 2 | 99504 | Pilot Initiative A |
| 3 | 1562849 | primary-methodol-70 | baseline-subject-85 | 3 | 10207142 | Baseline Model |
| 4 | 3001009030160 | adaptive-methodol-71 | pilot-subject-86 | 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster |

This view connects public perceptions to the spatial planning zones in which they were conducted, confirming that each survey is geographically bounded. Perception ID 1 was conducted in zone 1, ID 2 in zone 2, and so forth, ensuring that sentiment data is always contextualized within its administrative setting.

**View `policy_instrument_public_perception_view`**

```sql
CREATE VIEW policy_instrument_public_perception_view AS
SELECT a.policy_instrument_id, a.policy_id, a.name, a.jurisdiction, b.public_perception_id AS perception_public_perception_id, b.perception_id AS perception_perception_id, b.methodology AS perception_methodology
FROM policy_instruments a JOIN public_perceptions b ON a.public_perception_id = b.public_perception_id;
```

| policy_instrument_id | policy_id | name | jurisdiction | perception_public_perception_id | perception_perception_id | perception_methodology |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | regional-jurisdic-30 | 1 | 2106694 | compact-methodol-68 |
| 2 | 10207142 | Pilot Initiative A | legacy-jurisdic-31 | 2 | id_26 | composite-methodol-69 |
| 3 | 1562847 | Baseline Model | compact-jurisdic-32 | 3 | 1562849 | primary-methodol-70 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | composite-jurisdic-33 | 4 | 3001009030160 | adaptive-methodol-71 |

Linking policy instruments to public perceptions, this view reveals how regulatory approaches correlate with community sentiment. Each policy instrument is associated with a specific perception record, enabling analysts to examine whether certain policy frameworks generate more favorable or unfavorable community responses.

**View `policy_instrument_land_use_view`**

```sql
CREATE VIEW policy_instrument_land_use_view AS
SELECT a.policy_instrument_id, a.policy_id, a.name, a.jurisdiction, b.id AS use_id, b.land_use_id AS use_land_use_id, b.zoning_district AS use_zoning_district
FROM policy_instruments a JOIN land_uses b ON a.land_use_id = b.id;
```

| policy_instrument_id | policy_id | name | jurisdiction | use_id | use_land_use_id | use_zoning_district |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | regional-jurisdic-30 | 1 | 4985176 | adaptive-zoning-95 |
| 2 | 10207142 | Pilot Initiative A | legacy-jurisdic-31 | 2 | 325458 | distributed-zoning-96 |
| 3 | 1562847 | Baseline Model | compact-jurisdic-32 | 3 | 5082970 | baseline-zoning-97 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | composite-jurisdic-33 | 4 | Tanggal | pilot-zoning-98 |

This view maps policy instruments to the land-use designations they influence, completing the regulatory chain from policy to practice. Policy instrument 1 connects to land use ID 1 (`adaptive-zoning-95`), while policy instrument 4 links to land use ID 4 (`pilot-zoning-98`).

**View `policy_instrument_spatial_planning_zone_view`**

```sql
CREATE VIEW policy_instrument_spatial_planning_zone_view AS
SELECT a.policy_instrument_id, a.policy_id, a.name, a.jurisdiction, b.spatial_planning_zone_id AS zone_spatial_planning_zone_id, b.zone_id AS zone_zone_id, b.name AS zone_name
FROM policy_instruments a JOIN spatial_planning_zones b ON a.spatial_planning_zone_id = b.spatial_planning_zone_id;
```

| policy_instrument_id | policy_id | name | jurisdiction | zone_spatial_planning_zone_id | zone_zone_id | zone_name |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | regional-jurisdic-30 | 1 | 937724 | Extended Review |
| 2 | 10207142 | Pilot Initiative A | legacy-jurisdic-31 | 2 | 99504 | Pilot Initiative A |
| 3 | 1562847 | Baseline Model | compact-jurisdic-32 | 3 | 10207142 | Baseline Model |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | composite-jurisdic-33 | 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster |

By connecting policy instruments to spatial planning zones, this view shows how regulatory mechanisms are applied across geographic areas. Each policy instrument is associated with a specific zone, ensuring that regulations are implemented within defined territorial boundaries.

**View `spatial_planning_zone_land_use_detail_view`**

```sql
CREATE VIEW spatial_planning_zone_land_use_detail_view AS
SELECT a.spatial_planning_zone_id, a.zone_id, a.name, b.id AS use_id, b.land_use_id AS use_land_use_id, b.zoning_district AS use_zoning_district
FROM spatial_planning_zones a
  JOIN zones_uses j ON j.spatial_planning_zone_id = a.spatial_planning_zone_id
  JOIN land_uses b ON b.id = j.land_use_id;
```

| spatial_planning_zone_id | zone_id | name | use_id | use_land_use_id | use_zoning_district |
|---|---|---|---|---|---|
| 1 | 937724 | Extended Review | 1 | 4985176 | adaptive-zoning-95 |
| 1 | 937724 | Extended Review | 2 | 325458 | distributed-zoning-96 |
| 2 | 99504 | Pilot Initiative A | 2 | 325458 | distributed-zoning-96 |
| 2 | 99504 | Pilot Initiative A | 3 | 5082970 | baseline-zoning-97 |
| 3 | 10207142 | Baseline Model | 3 | 5082970 | baseline-zoning-97 |
| 3 | 10207142 | Baseline Model | 4 | Tanggal | pilot-zoning-98 |
| 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | 4 | Tanggal | pilot-zoning-98 |
| 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | 1 | 4985176 | adaptive-zoning-95 |

This detailed view presents spatial planning zones alongside their constituent land uses, including zoning district names and density classifications. Zone 1 contains land use ID 1 (`adaptive-zoning-95`, `low-density`), while zone 3 contains land use ID 3 (`baseline-zoning-97`, `high-density`), illustrating the diversity of land-use patterns within zones.

**View `spatial_planning_zone_transit_oriented_development_view`**

```sql
CREATE VIEW spatial_planning_zone_transit_oriented_development_view AS
SELECT a.spatial_planning_zone_id, a.zone_id, a.name, a.region, b.id AS development_id, b.tod_id AS development_tod_id, b.name AS development_name
FROM spatial_planning_zones a JOIN transit_oriented_developments b ON a.transit_oriented_development_id = b.id;
```

| spatial_planning_zone_id | zone_id | name | region | development_id | development_tod_id | development_name |
|---|---|---|---|---|---|---|
| 1 | 937724 | Extended Review | distributed-region-12 | 1 | 10238282 | Extended Review |
| 2 | 99504 | Pilot Initiative A | baseline-region-13 | 2 | 3012808 | Pilot Initiative A |
| 3 | 10207142 | Baseline Model | pilot-region-14 | 3 | 3001009030280 | Baseline Model |
| 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | extended-region-15 | 4 | 2640 | Distributed Cluster |

This view pairs spatial planning zones with the TODs they contain, confirming the geographic anchoring of development projects. Zone 1 hosts TOD `10238282` ("Extended Review"), zone 2 hosts TOD `3012808` ("Pilot Initiative A"), and so on, maintaining a one-to-one correspondence in this dataset.

**View `spatial_planning_zone_ecological_system_view`**

```sql
CREATE VIEW spatial_planning_zone_ecological_system_view AS
SELECT a.spatial_planning_zone_id, a.zone_id, a.name, a.region, b.ecological_system_id AS system_ecological_system_id, b.name AS system_name, b.type AS system_type
FROM spatial_planning_zones a JOIN ecological_systems b ON a.ecological_system_id = b.ecological_system_id;
```

| spatial_planning_zone_id | zone_id | name | region | system_ecological_system_id | system_name | system_type |
|---|---|---|---|---|---|---|
| 1 | 937724 | Extended Review | distributed-region-12 | ChIJ9_yxvThu5kcRRx3ldW98aY0 | Extended Review | urban_park |
| 2 | 99504 | Pilot Initiative A | baseline-region-13 | 2002007020090 | Pilot Initiative A | wetland |
| 3 | 10207142 | Baseline Model | pilot-region-14 | default_chart_a_tax_code_30 | Baseline Model | forest |
| 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | extended-region-15 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | coastal |

The final zone-centric view links spatial planning zones to their ecological systems, completing the environmental picture. Zone 1 encompasses the `urban_park` system `ChIJ9_yxvThu5kcRRx3ldW98aY0` (10.20 hectares, `protected`), zone 2 contains the `wetland` system `2002007020090` (14.40 hectares, `vulnerable`), zone 3 holds the `forest` system `default_chart_a_tax_code_30` (18.60 hectares, `degraded`), and zone 4 includes the `coastal` system `136630a8-8fcc-11eb-924d-9cd76263cbd0` (22.80 hectares, `protected`).

## Synthesis

The spatial planning domain presents a tightly integrated information ecosystem where theoretical paradigms, practical land-use designations, transit-oriented developments, ecological systems, natural features, public perceptions, and policy instruments are all connected through explicit relational pathways. The base tables capture the fundamental entities with sufficient detail to support operational queries, while the join tables manage the complex many-to-many relationships that reflect the messy reality of urban planning. The analytical views then synthesize these records into focused perspectives that answer specific questions—whether tracing a paradigm's influence on land use, examining the ecological composition of a planning zone, or evaluating how community sentiment varies across natural features. Practitioners who understand this structure can navigate from high-level theoretical frameworks down to the sentiment score of a single community survey, always aware of the relational context that gives each data point its meaning.