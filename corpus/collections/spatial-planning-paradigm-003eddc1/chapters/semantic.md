Spatial planning in the modern era is a multi-disciplinary exercise: theoretical paradigms inform policy instruments, which in turn shape land-use designations within bounded spatial planning zones. Each zone hosts ecological systems, which contain natural features that communities perceive and value. Transit-oriented developments (TODs) overlay this fabric, concentrating density around transit nodes while respecting the ecological and zoning constraints. The domain model captures these layers as a set of normalized base tables, junction tables for many-to-many relationships, and a family of materialized views that reassemble the facts analysts need to answer concrete planning questions. The following chapter walks through the schema from first principles, showing how entity types, their attributes, and their cardinality-bounded relationships become columns, foreign keys, and junction tables—and how each view's join reconstructs a domain fact from the normalized store.

## Base Tables and Their Attributes

The foundation of the model consists of eight entity tables, each representing a distinct concept in the planning domain. The `spatial_planning_paradigms` table anchors the theoretical layer. Its primary key `id` is a surrogate integer (values 1000–1003), while `paradigm_id` carries a business identifier such as `330` or `9568462`. The `name` column stores human-readable labels like "Extended Review" and "Distributed Cluster"; `theoretical_focus` and `methodological_focus` hold coded descriptors such as `composite-theoreti-27` and `regional-methodol-78`. The `status` column enumerates lifecycle states (`emerging`, `established`, `deprecated`), and three foreign-key columns—`land_use_id`, `ecological_system_id`, and `policy_instrument_id`—tie each paradigm to exactly one land use, one ecological system, and one policy instrument, enforcing a one-to-one cardinality at the row level.

**Table `spatial_planning_paradigms`**

| id | paradigm_id | name | theoretical_focus | methodological_focus | status | land_use_id | ecological_system_id | policy_instrument_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 330 | Extended Review | composite-theoreti-27 | seasonal-methodol-77 | emerging | 1 | ChIJ9_yxvThu5kcRRx3ldW98aY0 | 1 |
| 1001 | 4180945 | Pilot Initiative A | primary-theoreti-28 | regional-methodol-78 | established | 2 | 2002007020090 | 2 |
| 1002 | 9568462 | Baseline Model | adaptive-theoreti-29 | legacy-methodol-79 | deprecated | 3 | default_chart_a_tax_code_30 | 3 |
| 1003 | 9125627 | Distributed Cluster | distributed-theoreti-30 | compact-methodol-80 | emerging | 4 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 4 |

Land use is captured in the `land_uses` table, where the surrogate `id` (1–4) coexists with a business `land_use_id` (e.g., `4985176`, `325458`). The `zoning_district` column holds values like `adaptive-zoning-95` and `pilot-zoning-98`; `density_class` distinguishes `low-density`, `medium-density`, and `high-density` designations. The `primary_function` column carries coded strings such as `seasonal-primary-77`, and `last_survey_date` records the most recent field survey (e.g., `2025-04-15`). Three foreign keys—`spatial_planning_zone_id`, `transit_oriented_development_id`, and `spatial_planning_paradigm_id`—bind each land-use row to its parent zone, its TOD, and its paradigm, respectively. Audit columns `created_at` and `updated_at` track row lifecycle.

**Table `land_uses`**

| id | land_use_id | zoning_district | density_class | primary_function | last_survey_date | spatial_planning_zone_id | transit_oriented_development_id | spatial_planning_paradigm_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4985176 | adaptive-zoning-95 | low-density | seasonal-primary-77 | 2025-04-15 | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 325458 | distributed-zoning-96 | medium-density | regional-primary-78 | 2022-09-26 | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 5082970 | baseline-zoning-97 | high-density | legacy-primary-79 | 2023-02-10 | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Tanggal | pilot-zoning-98 | low-density | compact-primary-80 | 2024-07-21 | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Transit-oriented developments live in `transit_oriented_developments`. The surrogate `id` (1–4) pairs with `tod_id` (`10238282`, `3012808`, etc.) and a human-readable `name` matching the paradigm names ("Extended Review", "Pilot Initiative A"). The `conurbation` column stores coded locality identifiers like `compact-conurbat-68`, while `coverage_radius` measures the TOD's service area in kilometres (20.45, 24.90, 29.35, 33.80). `implementation_status` enumerates `planned`, `under_construction`, and `operational`. A single foreign key, `spatial_planning_zone_id`, anchors each TOD to its zone.

**Table `transit_oriented_developments`**

| id | tod_id | name | conurbation | coverage_radius | implementation_status | spatial_planning_zone_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 10238282 | Extended Review | compact-conurbat-68 | 20.45 | planned | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 3012808 | Pilot Initiative A | composite-conurbat-69 | 24.90 | under_construction | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 3001009030280 | Baseline Model | primary-conurbat-70 | 29.35 | operational | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2640 | Distributed Cluster | adaptive-conurbat-71 | 33.80 | planned | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Ecological systems are stored in `ecological_systems`, whose primary key is the natural `ecological_system_id`—a Google Place ID such as `ChIJ9_yxvThu5kcRRx3ldW98aY0` or a UUID like `136630a8-8fcc-11eb-924d-9cd76263cbd0`. The `name` column mirrors the paradigm/TOD names ("Extended Review", "Distributed Cluster"), `type` classifies the system as `urban_park`, `wetland`, `forest`, or `coastal`, and `area_hectares` records the footprint (10.20, 14.40, 18.60, 22.80). `conservation_status` takes values `protected`, `vulnerable`, or `degraded`. The foreign key `spatial_planning_zone_id` links each system to its zone.

**Table `ecological_systems`**

| ecological_system_id | name | type | area_hectares | conservation_status | spatial_planning_zone_id |
|---|---|---|---|---|---|
| ChIJ9_yxvThu5kcRRx3ldW98aY0 | Extended Review | urban_park | 10.20 | protected | 1 |
| 2002007020090 | Pilot Initiative A | wetland | 14.40 | vulnerable | 2 |
| default_chart_a_tax_code_30 | Baseline Model | forest | 18.60 | degraded | 3 |
| 136630a8-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | coastal | 22.80 | protected | 4 |

Natural features are modelled in `natural_features`. The surrogate `id` (1–4) and business `feature_id` (e.g., `9568441`, `32806`) identify each feature. The `name` column again carries the paradigm-aligned labels, while `category` classifies the feature as `flora`, `fauna`, `hydrology`, or `geomorphology`. The `perceived_value` column stores a numeric rating (4.45, 8.90, 13.35, 17.80). Two foreign keys—`ecological_system_id` and `public_perception_id`—tie each feature to its parent ecological system and to a public-perception record.

**Table `natural_features`**

| id | feature_id | name | category | perceived_value | ecological_system_id | public_perception_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 9568441 | Extended Review | flora | 4.45 | ChIJ9_yxvThu5kcRRx3ldW98aY0 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 32806 | Pilot Initiative A | fauna | 8.90 | 2002007020090 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | df2daef0-8fcc-11eb-924d-9cd76263cbd0 | Baseline Model | hydrology | 13.35 | default_chart_a_tax_code_30 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 12388 | Distributed Cluster | geomorphology | 17.80 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Public perceptions are captured in `public_perceptions`. The surrogate `public_perception_id` (1–4) pairs with `perception_id` (`2106694`, `id_26`, etc.). The `methodology` column holds coded strings like `compact-methodol-68`, and `subject` stores descriptive labels such as `adaptive-subject-83`. The `sentiment_score` is a numeric measure (4.95, 6.90, 8.85, 10.80), and `survey_date` records the survey timestamp (e.g., `2024-07-23T18:30:00`). Foreign keys `natural_feature_id` and `spatial_planning_zone_id` link each perception to its feature and zone.

**Table `public_perceptions`**

| public_perception_id | perception_id | methodology | subject | sentiment_score | survey_date | natural_feature_id | spatial_planning_zone_id |
|---|---|---|---|---|---|---|---|
| 1 | 2106694 | compact-methodol-68 | adaptive-subject-83 | 4.95 | 2024-07-23T18:30:00 | 1 | 1 |
| 2 | id_26 | composite-methodol-69 | distributed-subject-84 | 6.90 | 2025-12-07T01:47:00 | 2 | 2 |
| 3 | 1562849 | primary-methodol-70 | baseline-subject-85 | 8.85 | 2022-05-18T08:04:00 | 3 | 3 |
| 4 | 3001009030160 | adaptive-methodol-71 | pilot-subject-86 | 10.80 | 2023-10-02T15:21:00 | 4 | 4 |

Policy instruments are stored in `policy_instruments`. The surrogate `id` (1–4) and business `policy_instrument_id` (1, 2, 3, 4) identify each instrument. The `name` column carries the paradigm-aligned labels, `type` classifies the instrument, `effectiveness_rating` stores a numeric score, and `implementation_status` enumerates lifecycle states. The foreign key `spatial_planning_zone_id` anchors each instrument to its zone.

**Table `policy_instruments`**

| policy_instrument_id | policy_id | name | jurisdiction | effective_date | status | public_perception_id | land_use_id | spatial_planning_zone_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | regional-jurisdic-30 | 2023-02-14 | draft | 1 | 1 | 1 |
| 2 | 10207142 | Pilot Initiative A | legacy-jurisdic-31 | 2024-07-25 | active | 2 | 2 | 2 |
| 3 | 1562847 | Baseline Model | compact-jurisdic-32 | 2025-12-09 | repealed | 3 | 3 | 3 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | composite-jurisdic-33 | 2022-05-20 | draft | 4 | 4 | 4 |

Spatial planning zones are the geographic container for all other entities. The `spatial_planning_zones` table uses a surrogate `id` (1–4) and a business `zone_id` (`1`, `2`, `3`, `4`). The `name` column stores labels like "Extended Review" and "Pilot Initiative A", `classification` categorizes the zone, `area_hectares` records its size, and `status` tracks its lifecycle.

**Table `spatial_planning_zones`**

| spatial_planning_zone_id | zone_id | name | region | country | area_km2 | transit_oriented_development_id | ecological_system_id |
|---|---|---|---|---|---|---|---|
| 1 | 937724 | Extended Review | distributed-region-12 | compact-country-26 | 14.70 | 1 | ChIJ9_yxvThu5kcRRx3ldW98aY0 |
| 2 | 99504 | Pilot Initiative A | baseline-region-13 | composite-country-27 | 16.40 | 2 | 2002007020090 |
| 3 | 10207142 | Baseline Model | pilot-region-14 | primary-country-28 | 18.10 | 3 | default_chart_a_tax_code_30 |
| 4 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Cluster | extended-region-15 | adaptive-country-29 | 19.80 | 4 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 |

## Junction Tables for Many-to-Many Relationships

Three junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `developments_uses` table links `transit_oriented_developments` to `land_uses`, allowing a single TOD to serve multiple land-use types and a single land-use designation to be served by multiple TODs. The `systems_features` table links `ecological_systems` to `natural_features`, enabling an ecological system to contain multiple features and a feature to be associated with multiple systems. The `zones_uses` table links `spatial_planning_zones` to `land_uses`, permitting a zone to contain multiple land-use designations and a land-use type to span multiple zones.

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

## Views: Reconstructing Domain Facts

Materialized views reassemble the normalized tables into analytical perspectives. Each view answers a specific planning question by joining the relevant entities.

The `spatial_planning_paradigm_land_use_view` joins `spatial_planning_paradigms` to `land_uses` on `land_use_id`, producing rows that pair a paradigm's theoretical focus with its associated land-use designation. For example, paradigm `id 1000` ("Extended Review", theoretical focus `composite-theoreti-27`) maps to land use `id 1` with zoning district `adaptive-zoning-95` and density class `low-density`. This view answers the question: "Which land-use designations are associated with each planning paradigm?"

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

The `spatial_planning_paradigm_ecological_system_view` joins paradigms to ecological systems via `ecological_system_id`. Paradigm `id 1000` ("Extended Review") links to ecological system `ChIJ9_yxvThu5kcRRx3ldW98aY0` ("Extended Review", type `urban_park`, area 10.20 hectares, status `protected`). This view answers: "Which ecological systems are associated with each paradigm?"

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

The `spatial_planning_paradigm_policy_instrument_view` joins paradigms to policy instruments via `policy_instrument_id`. Paradigm `id 1000` maps to policy instrument `id 1`, and paradigm `id 1003` ("Distributed Cluster") maps to policy instrument `id 4`. This view answers: "Which policy instruments are associated with each paradigm?"

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

The `land_use_spatial_planning_zone_view` joins `land_uses` to `spatial_planning_zones` on `spatial_planning_zone_id`. Land use `id 1` ("zoning_district `adaptive-zoning-95`") maps to spatial planning zone `id 1`, and land use `id 4` ("zoning_district `pilot-zoning-98`") maps to zone `id 4`. This view answers: "Which spatial planning zones contain each land-use designation?"

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

The `land_use_transit_oriented_development_view` joins `land_uses` to `transit_oriented_developments` on `transit_oriented_development_id`. Land use `id 1` maps to TOD `id 1` ("Extended Review", conurbation `compact-conurbat-68`, coverage radius 20.45 km, status `planned`), and land use `id 3` maps to TOD `id 3` ("Baseline Model", conurbation `primary-conurbat-70`, coverage radius 29.35 km, status `operational`). This view answers: "Which TODs serve each land-use designation?"

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

The `land_use_spatial_planning_paradigm_view` joins `land_uses` to `spatial_planning_paradigms` on `spatial_planning_paradigm_id`. Land use `id 1` maps to paradigm `id 1000` ("Extended Review", status `emerging`), and land use `id 4` maps to paradigm `id 1003` ("Distributed Cluster", status `emerging`). This view answers: "Which paradigm governs each land-use designation?"

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

The `transit_oriented_development_land_use_detail_view` joins `transit_oriented_developments` to `land_uses` on `transit_oriented_development_id`, providing a TOD-centric detail view. TOD `id 1` ("Extended Review", conurbation `compact-conurbat-68`) maps to land use `id 1` (density class `low-density`, primary function `seasonal-primary-77`), and TOD `id 3` ("Baseline Model", conurbation `primary-conurbat-70`) maps to land use `id 3` (density class `high-density`, primary function `legacy-primary-79`). This view answers: "What land-use details are associated with each TOD?"

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

The `transit_oriented_development_spatial_planning_zone_view` joins `transit_oriented_developments` to `spatial_planning_zones` on `spatial_planning_zone_id`. TOD `id 1` ("Extended Review", coverage radius 20.45 km) maps to spatial planning zone `id 1`, and TOD `id 4` ("Distributed Cluster", coverage radius 33.80 km) maps to zone `id 4`. This view answers: "Which spatial planning zones contain each TOD?"

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

The `ecological_system_natural_feature_detail_view` joins `ecological_systems` to `natural_features` on `ecological_system_id`. Ecological system `ChIJ9_yxvThu5kcRRx3ldW98aY0` ("Extended Review", type `urban_park`) maps to natural feature `id 1` (category `flora`, perceived value 4.45), and ecological system `2002007020090` ("Pilot Initiative A", type `wetland`) maps to natural feature `id 2` (category `fauna`, perceived value 8.90). This view answers: "What natural features are contained within each ecological system?"

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

The `ecological_system_spatial_planning_zone_view` joins `ecological_systems` to `spatial_planning_zones` on `spatial_planning_zone_id`. Ecological system `ChIJ9_yxvThu5kcRRx3ldW98aY0` ("Extended Review", area 10.20 hectares, status `protected`) maps to spatial planning zone `id 1`, and ecological system `136630a8-8fcc-11eb-924d-9cd76263cbd0` ("Distributed Cluster", area 22.80 hectares, status `protected`) maps to zone `id 4`. This view answers: "Which spatial planning zones contain each ecological system?"

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

The `natural_feature_ecological_system_view` joins `natural_features` to `ecological_systems` on `ecological_system_id`, providing a feature-centric perspective. Natural feature `id 1` ("Extended Review", category `flora`, perceived value 4.45) maps to ecological system `ChIJ9_yxvThu5kcRRx3ldW98aY0` (type `urban_park`, area 10.20 hectares), and natural feature `id 4` ("Distributed Cluster", category `geomorphology`, perceived value 17.80) maps to ecological system `136630a8-8fcc-11eb-924d-9cd76263cbd0` (type `coastal`, area 22.80 hectares). This view answers: "Which ecological system contains each natural feature?"

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

The `natural_feature_public_perception_view` joins `natural_features` to `public_perceptions` on `public_perception_id`. Natural feature `id 1` ("Extended Review", category `flora`, perceived value 4.45) maps to public perception `id 1` (sentiment score 4.95, survey date `2024-07-23T18:30:00`), and natural feature `id 4` ("Distributed Cluster", category `geomorphology`, perceived value 17.80) maps to public perception `id 4` (sentiment score 10.80, survey date `2023-10-02T15:21:00`). This view answers: "What public perceptions are associated with each natural feature?"

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

The `public_perception_natural_feature_view` joins `public_perceptions` to `natural_features` on `natural_feature_id`, providing a perception-centric perspective. Public perception `id 1` (methodology `compact-methodol-68`, subject `adaptive-subject-83`, sentiment score 4.95) maps to natural feature `id 1` (category `flora`, perceived value 4.45), and public perception `id 4` (methodology `adaptive-methodol-71`, subject `pilot-subject-86`, sentiment score 10.80) maps to natural feature `id 4` (category `geomorphology`, perceived value 17.80). This view answers: "Which natural features are associated with each public perception?"

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

The `public_perception_spatial_planning_zone_view` joins `public_perceptions` to `spatial_planning_zones` on `spatial_planning_zone_id`. Public perception `id 1` (sentiment score 4.95, survey date `2024-07-23T18:30:00`) maps to spatial planning zone `id 1`, and public perception `id 4` (sentiment score 10.80, survey date `2023-10-02T15:21:00`) maps to zone `id 4`. This view answers: "Which spatial planning zones are associated with each public perception?"

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

The `policy_instrument_public_perception_view` joins `policy_instruments` to `public_perceptions` on `public_perception_id`. Policy instrument `id 1` maps to public perception `id 1` (sentiment score 4.95), and policy instrument `id 4` maps to public perception `id 4` (sentiment score 10.80). This view answers: "Which public perceptions are associated with each policy instrument?"

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

The `policy_instrument_land_use_view` joins `policy_instruments` to `land_uses` on `land_use_id`. Policy instrument `id 1` maps to land use `id 1` (zoning district `adaptive-zoning-95`, density class `low-density`), and policy instrument `id 4` maps to land use `id 4` (zoning district `pilot-zoning-98`, density class `low-density`). This view answers: "Which land-use designations are associated with each policy instrument?"

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

The `policy_instrument_spatial_planning_zone_view` joins `policy_instruments` to `spatial_planning_zones` on `spatial_planning_zone_id`. Policy instrument `id 1` maps to spatial planning zone `id 1`, and policy instrument `id 4` maps to zone `id 4`. This view answers: "Which spatial planning zones are associated with each policy instrument?"

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

The `spatial_planning_zone_land_use_detail_view` joins `spatial_planning_zones` to `land_uses` on `spatial_planning_zone_id`, providing a zone-centric detail view. Spatial planning zone `id 1` maps to land use `id 1` (zoning district `adaptive-zoning-95`, density class `low-density`, primary function `seasonal-primary-77`), and spatial planning zone `id 4` maps to land use `id 4` (zoning district `pilot-zoning-98`, density class `low-density`, primary function `compact-primary-80`). This view answers: "What land-use details are contained within each spatial planning zone?"

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

The `spatial_planning_zone_transit_oriented_development_view` joins `spatial_planning_zones` to `transit_oriented_developments` on `spatial_planning_zone_id`. Spatial planning zone `id 1` maps to TOD `id 1` ("Extended Review", conurbation `compact-conurbat-68`, coverage radius 20.45 km, status `planned`), and spatial planning zone `id 4` maps to TOD `id 4` ("Distributed Cluster", conurbation `adaptive-conurbat-71`, coverage radius 33.80 km, status `planned`). This view answers: "Which TODs are contained within each spatial planning zone?"

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

The `spatial_planning_zone_ecological_system_view` joins `spatial_planning_zones` to `ecological_systems` on `spatial_planning_zone_id`. Spatial planning zone `id 1` maps to ecological system `ChIJ9_yxvThu5kcRRx3ldW98aY0` ("Extended Review", type `urban_park`, area 10.20 hectares, status `protected`), and spatial planning zone `id 4` maps to ecological system `136630a8-8fcc-11eb-924d-9cd76263cbd0` ("Distributed Cluster", type `coastal`, area 22.80 hectares, status `protected`). This view answers: "Which ecological systems are contained within each spatial planning zone?"

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

## Synthesis

The schema models spatial planning as a layered domain: paradigms define theoretical and methodological frameworks, policy instruments translate those frameworks into actionable measures, and land-use designations operationalize them within spatial planning zones. Each zone contains ecological systems, which in turn contain natural features that communities perceive and value. Transit-oriented developments overlay this structure, concentrating density while respecting ecological and zoning constraints. The eight base tables capture these entities with surrogate and business keys, coded attribute values, and foreign-key relationships that enforce cardinality. The three junction tables (`developments_uses`, `systems_features`, `zones_uses`) resolve many-to-many relationships that cannot be expressed through simple foreign keys. The twenty-one materialized views reassemble the normalized tables into analytical perspectives, each answering a specific planning question by joining the relevant entities. Together, the tables and views provide a complete, queryable representation of the spatial planning domain, from theoretical paradigms through to public perceptions of natural features.