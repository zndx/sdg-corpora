In the pastoral domain, water is the scarce resource around which territorial claims, community livelihoods, and hydrological events revolve. A pastoral territory defines a geographically bounded area managed by a particular ethnic group; a water source is a point or area from which water is extracted; a pastoral community is a human settlement whose primary livelihood depends on herding; a hydrological event is a discrete occurrence—drought, flood, aquifer discovery, or water-table drop—that alters the availability of water; and a geographic region is the broader administrative and climatic envelope within which all of these entities reside. The relational schema captures these five entity types as base tables, their many-to-many associations as junction tables, and their cross-entity relationships as materialized views. Every view is a single join that reconstructs a domain fact from the normalized tables.

## Base Tables

The five base tables hold the atomic entities of the domain. Each row is identified by a surrogate integer `id` (or `geographic_region_id` / `pastoral_community_id` where the surrogate is named for clarity), and each entity carries a human-readable identifier alongside its attributes.

**Table `pastoral_territories`**

| id | territory_identifier | territory_name | primary_ethnic_group | area_hectares | establishment_date | current_status | geographic_region_id |
|---|---|---|---|---|---|---|---|
| 1 | TER-2602 | Regional Initiative | extended-primary-33 | 10.20 | 2024-07-11 | active | 1 |
| 2 | TER-2607 | Seasonal Model D | integrated-primary-34 | 14.40 | 2025-12-22 | disputed | 2 |
| 3 | TER-2612 | Integrated Cluster | seasonal-primary-35 | 18.60 | 2022-05-06 | fragmented | 3 |
| 4 | TER-2617 | Extended Review | regional-primary-36 | 22.80 | 2023-10-17 | abandoned | 4 |

The `pastoral_territories` table stores territorial units. The `territory_identifier` column holds codes such as `TER-2602` and `TER-2607`; the `territory_name` column carries descriptive labels like *Regional Initiative* and *Seasonal Model D*. The `primary_ethnic_group` column enumerates group typologies (`extended-primary-33`, `integrated-primary-34`, `seasonal-primary-35`, `regional-primary-36`). The `area_hectares` column records the territorial extent (10.20 through 22.80 hectares in the sample), `establishment_date` records the founding date, and `current_status` classifies the territory as `active`, `disputed`, `fragmented`, or `abandoned`. The foreign key `geographic_region_id` links each territory to its enclosing geographic region.

**Table `water_sources`**

| id | source_identifier | source_name | source_type | depth_meters | flow_rate_liters_per_second | water_quality_index | discovery_date | is_modern_invention | pastoral_territory_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | SOU-2324 | Composite Model | natural_well | 0.4 | 5.20 | 17.70 | 2024-03-23 | true | 1 |
| 1001 | SOU-2327 | Compact Cluster A | borehole | 0.01999998 | 7.40 | 20.40 | 2025-08-07 | false | 2 |
| 1002 | SOU-2330 | Legacy Review | underground_lake | 0.13 | 9.60 | 23.10 | 2022-01-18 | true | 3 |
| 1003 | SOU-2333 | Regional Initiative | spring | 0.96 | 11.80 | 25.80 | 2023-06-02 | false | 4 |

The `water_sources` table describes extraction points. The `source_identifier` column holds codes such as `SOU-2324` and `SOU-2327`; the `source_name` column carries labels like *Composite Model* and *Compact Cluster A*. The `source_type` column enumerates types: `natural_well`, `borehole`, `underground_lake`, and `spring`. Physical attributes include `depth_meters` (0.02 through 0.96 m), `flow_rate_liters_per_second` (5.20 through 11.80 L/s), and `water_quality_index` (17.70 through 25.80). The `discovery_date` records when the source was first documented, `is_modern_invention` is a boolean flag, and the foreign key `pastoral_territory_id` anchors the source to the territory that manages it.

**Table `pastoral_communities`**

| pastoral_community_id | community_identifier | community_name | population_size | primary_livelihood | herd_size | decimation_event | adaptation_strategy | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | COM-2792 | Primary Initiative A | 35 | pastoralism | 26 | pilot-decimati-50 | baseline-adaptati-37 | 1 |
| 1001 | COM-2799 | Composite Model | 42 | agro-pastoralism | 37 | extended-decimati-51 | pilot-adaptati-38 | 2 |
| 1002 | COM-2806 | Compact Cluster | 49 | sedentary_agriculture | 48 | integrated-decimati-52 | extended-adaptati-39 | 3 |
| 1003 | COM-2813 | Legacy Review D | 56 | wage_labour | 59 | seasonal-decimati-53 | integrated-adaptati-40 | 4 |

The `pastoral_communities` table stores human settlements. The surrogate key is `pastoral_community_id`; the `community_identifier` column holds codes such as `COM-2792` and `COM-2799`; the `community_name` column carries labels like *Primary Initiative A* and *Composite Model*. The `population_size` column records headcount (35 through 56), `primary_livelihood` enumerates livelihood types (`pastoralism`, `agro-pastoralism`, `sedentary_agriculture`, `wage_labour`), `herd_size` records livestock count (26 through 59), and `decimation_event` and `adaptation_strategy` columns hold coded references to historical shocks and response strategies (e.g., `pilot-decimati-50`, `baseline-adaptati-37`). The foreign key `geographic_region_id` links each community to its enclosing geographic region.

**Table `hydrological_events`**

| id | event_identifier | event_type | start_date | end_date | severity_index | affected_area_hectares | caused_herd_decimation | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 100 | EVE-2706 | drought | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 20.95 | 6.45 | false | 1 |
| 101 | EVE-2707 | flood | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 22.90 | 8.90 | true | 2 |
| 102 | EVE-2708 | aquifer_discovery | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 24.85 | 11.35 | false | 3 |
| 103 | EVE-2709 | water_table_drop | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 26.80 | 13.80 | true | 4 |

The `hydrological_events` table records discrete hydrological occurrences. The `event_identifier` column holds codes such as `EVE-2706` and `EVE-2707`; the `event_type` column enumerates types: `drought`, `flood`, `aquifer_discovery`, and `water_table_drop`. Temporal attributes `start_date` and `end_date` store ISO-8601 timestamps (e.g., `2022-09-05T20:24:00`); the `severity_index` column quantifies impact (20.95 through 26.80); `affected_area_hectares` records the spatial footprint (6.45 through 13.80 ha); `caused_herd_decimation` is a boolean flag; and the foreign key `geographic_region_id` anchors the event to its enclosing geographic region.

**Table `geographic_regions`**

| geographic_region_id | region_identifier | region_name | region_type | area_hectares | average_annual_rainfall | climate_classification | elevation_meters |
|---|---|---|---|---|---|---|---|
| 1 | REG-2093 | Distributed Assessment | county | 10.20 | 2.20 | baseline-climate-55 | 23.70 |
| 2 | REG-2100 | Adaptive Survey D | desert | 14.40 | 4.40 | pilot-climate-56 | 28.40 |
| 3 | REG-2107 | Primary Corridor | basin | 18.60 | 6.60 | extended-climate-57 | 33.10 |
| 4 | REG-2114 | Composite Series | ecological_zone | 22.80 | 8.80 | integrated-climate-58 | 37.80 |

The `geographic_regions` table defines the broadest administrative and climatic envelopes. The surrogate key is `geographic_region_id`; the `region_identifier` column holds codes such as `REG-2093` and `REG-2100`; the `region_name` column carries labels like *Distributed Assessment* and *Adaptive Survey D*. The `region_type` column enumerates types: `county`, `desert`, `basin`, and `ecological_zone`. Physical attributes include `area_hectares` (10.20 through 22.80 ha), `average_annual_rainfall` (2.20 through 8.80 units), `climate_classification` (e.g., `baseline-climate-55`, `pilot-climate-56`), and `elevation_meters` (23.70 through 37.80 m).

## Junction Tables

The junction tables materialize many-to-many relationships that cannot be expressed through a single foreign key. Each junction table is a two-column association table whose composite primary key is the pair of foreign keys.

**Table `territories_sources`**

| pastoral_territory_id | water_source_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `territories_sources` table links territories to water sources. A territory may manage multiple sources and a source may be shared across territories. The sample data shows that territory `1` manages sources `1000` and `1001`, territory `2` manages sources `1001` and `1002`, territory `3` manages sources `1002` and `1003`, and territory `4` manages sources `1003` and `1000`. This creates a cyclic sharing pattern: source `1000` is managed by territories `1` and `4`, source `1001` by territories `1` and `2`, and so on.

**Table `territories_communities`**

| pastoral_territory_id | pastoral_community_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `territories_communities` table links territories to pastoral communities. A territory may contain multiple communities and a community may span multiple territories.

**Table `sources_communities`**

| water_source_id | pastoral_community_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `sources_communities` table links water sources to pastoral communities. A source may serve multiple communities and a community may draw from multiple sources.

**Table `communities_territories`**

| pastoral_community_id | pastoral_territory_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `communities_territories` table is the inverse association of `territories_communities`, providing a symmetric view of the territory–community relationship.

**Table `communities_sources`**

| pastoral_community_id | water_source_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `communities_sources` table is the inverse association of `sources_communities`, providing a symmetric view of the source–community relationship.

**Table `events_communities`**

| hydrological_event_id | pastoral_community_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `events_communities` table links hydrological events to pastoral communities. An event may affect multiple communities and a community may be affected by multiple events.

**Table `events_sources`**

| hydrological_event_id | water_source_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `events_sources` table links hydrological events to water sources. An event may impact multiple sources and a source may be impacted by multiple events.

**Table `regions_territories`**

| geographic_region_id | pastoral_territory_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `regions_territories` table links geographic regions to pastoral territories. A region may contain multiple territories and a territory may span multiple regions.

**Table `regions_sources`**

| geographic_region_id | water_source_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `regions_sources` table links geographic regions to water sources. A region may contain multiple sources and a source may span multiple regions.

**Table `regions_communities`**

| geographic_region_id | pastoral_community_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `regions_communities` table links geographic regions to pastoral communities. A region may contain multiple communities and a community may span multiple regions.

## Views

Each view is a single join between two base tables (or a base table and a junction table) that reconstructs a domain fact. The view names encode the join direction: the prefix identifies the "from" entity and the suffix identifies the "to" entity.

**View `vw_pastoral_territory_water_source_detail`**

```sql
CREATE VIEW vw_pastoral_territory_water_source_detail AS
SELECT a.id, a.territory_identifier, a.territory_name, b.id AS source_id, b.source_identifier AS source_source_identifier, b.source_name AS source_source_name
FROM pastoral_territories a
  JOIN territories_sources j ON j.pastoral_territory_id = a.id
  JOIN water_sources b ON b.id = j.water_source_id;
```

| id | territory_identifier | territory_name | source_id | source_source_identifier | source_source_name |
|---|---|---|---|---|---|
| 1 | TER-2602 | Regional Initiative | 1000 | SOU-2324 | Composite Model |
| 1 | TER-2602 | Regional Initiative | 1001 | SOU-2327 | Compact Cluster A |
| 2 | TER-2607 | Seasonal Model D | 1001 | SOU-2327 | Compact Cluster A |
| 2 | TER-2607 | Seasonal Model D | 1002 | SOU-2330 | Legacy Review |
| 3 | TER-2612 | Integrated Cluster | 1002 | SOU-2330 | Legacy Review |
| 3 | TER-2612 | Integrated Cluster | 1003 | SOU-2333 | Regional Initiative |
| 4 | TER-2617 | Extended Review | 1003 | SOU-2333 | Regional Initiative |
| 4 | TER-2617 | Extended Review | 1000 | SOU-2324 | Composite Model |

This view joins `pastoral_territories` to `water_sources` through the `territories_sources` junction table, answering the question: *Which water sources are managed by which pastoral territories?* Reading the sample data, the row for territory `TER-2602` (Regional Initiative) lists sources `SOU-2324` (Composite Model, a natural_well) and `SOU-2327` (Compact Cluster A, a borehole). The row for territory `TER-2617` (Extended Review) lists sources `SOU-2333` (Regional Initiative, a spring) and `SOU-2324` (Composite Model, a natural_well). This view materializes the territory-to-source management relationship as a denormalized detail table.

**View `vw_pastoral_territory_pastoral_community_detail`**

```sql
CREATE VIEW vw_pastoral_territory_pastoral_community_detail AS
SELECT a.id, a.territory_identifier, a.territory_name, b.pastoral_community_id AS community_pastoral_community_id, b.community_identifier AS community_community_identifier, b.community_name AS community_community_name
FROM pastoral_territories a
  JOIN territories_communities j ON j.pastoral_territory_id = a.id
  JOIN pastoral_communities b ON b.pastoral_community_id = j.pastoral_community_id;
```

| id | territory_identifier | territory_name | community_pastoral_community_id | community_community_identifier | community_community_name |
|---|---|---|---|---|---|
| 1 | TER-2602 | Regional Initiative | 1000 | COM-2792 | Primary Initiative A |
| 1 | TER-2602 | Regional Initiative | 1001 | COM-2799 | Composite Model |
| 2 | TER-2607 | Seasonal Model D | 1001 | COM-2799 | Composite Model |
| 2 | TER-2607 | Seasonal Model D | 1002 | COM-2806 | Compact Cluster |
| 3 | TER-2612 | Integrated Cluster | 1002 | COM-2806 | Compact Cluster |
| 3 | TER-2612 | Integrated Cluster | 1003 | COM-2813 | Legacy Review D |
| 4 | TER-2617 | Extended Review | 1003 | COM-2813 | Legacy Review D |
| 4 | TER-2617 | Extended Review | 1000 | COM-2792 | Primary Initiative A |

This view joins `pastoral_territories` to `pastoral_communities` through the `territories_communities` junction table, answering: *Which pastoral communities reside within which pastoral territories?* The sample data would show, for example, that territory `TER-2602` contains community `COM-2792` (Primary Initiative A, population 35, pastoralism, herd size 26) and potentially additional communities linked through the junction table.

**View `vw_pastoral_territory_geographic_region`**

```sql
CREATE VIEW vw_pastoral_territory_geographic_region AS
SELECT a.id, a.territory_identifier, a.territory_name, a.primary_ethnic_group, b.geographic_region_id AS region_geographic_region_id, b.region_identifier AS region_region_identifier, b.region_name AS region_region_name
FROM pastoral_territories a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| id | territory_identifier | territory_name | primary_ethnic_group | region_geographic_region_id | region_region_identifier | region_region_name |
|---|---|---|---|---|---|---|
| 1 | TER-2602 | Regional Initiative | extended-primary-33 | 1 | REG-2093 | Distributed Assessment |
| 2 | TER-2607 | Seasonal Model D | integrated-primary-34 | 2 | REG-2100 | Adaptive Survey D |
| 3 | TER-2612 | Integrated Cluster | seasonal-primary-35 | 3 | REG-2107 | Primary Corridor |
| 4 | TER-2617 | Extended Review | regional-primary-36 | 4 | REG-2114 | Composite Series |

This view joins `pastoral_territories` to `geographic_regions` through the `regions_territories` junction table, answering: *Which geographic region contains which pastoral territory?* The sample data shows that territory `TER-2602` (Regional Initiative) is contained in region `REG-2093` (Distributed Assessment, county type, 10.20 ha, baseline-climate-55), territory `TER-2607` (Seasonal Model D) is in region `REG-2100` (Adaptive Survey D, desert type), territory `TER-2612` (Integrated Cluster) is in region `REG-2107` (Primary Corridor, basin type), and territory `TER-2617` (Extended Review) is in region `REG-2114` (Composite Series, ecological_zone type).

**View `vw_water_source_pastoral_territory`**

```sql
CREATE VIEW vw_water_source_pastoral_territory AS
SELECT a.id, a.source_identifier, a.source_name, a.source_type, b.id AS territory_id, b.territory_identifier AS territory_territory_identifier, b.territory_name AS territory_territory_name
FROM water_sources a JOIN pastoral_territories b ON a.pastoral_territory_id = b.id;
```

| id | source_identifier | source_name | source_type | territory_id | territory_territory_identifier | territory_territory_name |
|---|---|---|---|---|---|---|
| 1000 | SOU-2324 | Composite Model | natural_well | 1 | TER-2602 | Regional Initiative |
| 1001 | SOU-2327 | Compact Cluster A | borehole | 2 | TER-2607 | Seasonal Model D |
| 1002 | SOU-2330 | Legacy Review | underground_lake | 3 | TER-2612 | Integrated Cluster |
| 1003 | SOU-2333 | Regional Initiative | spring | 4 | TER-2617 | Extended Review |

This view joins `water_sources` to `pastoral_territories` through the `territories_sources` junction table, answering: *Which pastoral territory manages which water source?* This is the inverse perspective of `vw_pastoral_territory_water_source_detail`. Reading the sample data, source `SOU-2324` (Composite Model, natural_well, depth 0.4 m, flow rate 5.20 L/s) is managed by territory `TER-2602` (Regional Initiative, active status) and territory `TER-2617` (Extended Review, abandoned status). Source `SOU-2327` (Compact Cluster A, borehole, depth 0.02 m, flow rate 7.40 L/s) is managed by territory `TER-2602` and territory `TER-2607` (Seasonal Model D, disputed status).

**View `vw_water_source_pastoral_community_detail`**

```sql
CREATE VIEW vw_water_source_pastoral_community_detail AS
SELECT a.id, a.source_identifier, a.source_name, b.pastoral_community_id AS community_pastoral_community_id, b.community_identifier AS community_community_identifier, b.community_name AS community_community_name
FROM water_sources a
  JOIN sources_communities j ON j.water_source_id = a.id
  JOIN pastoral_communities b ON b.pastoral_community_id = j.pastoral_community_id;
```

| id | source_identifier | source_name | community_pastoral_community_id | community_community_identifier | community_community_name |
|---|---|---|---|---|---|
| 1000 | SOU-2324 | Composite Model | 1000 | COM-2792 | Primary Initiative A |
| 1000 | SOU-2324 | Composite Model | 1001 | COM-2799 | Composite Model |
| 1001 | SOU-2327 | Compact Cluster A | 1001 | COM-2799 | Composite Model |
| 1001 | SOU-2327 | Compact Cluster A | 1002 | COM-2806 | Compact Cluster |
| 1002 | SOU-2330 | Legacy Review | 1002 | COM-2806 | Compact Cluster |
| 1002 | SOU-2330 | Legacy Review | 1003 | COM-2813 | Legacy Review D |
| 1003 | SOU-2333 | Regional Initiative | 1003 | COM-2813 | Legacy Review D |
| 1003 | SOU-2333 | Regional Initiative | 1000 | COM-2792 | Primary Initiative A |

This view joins `water_sources` to `pastoral_communities` through the `sources_communities` junction table, answering: *Which pastoral communities draw water from which water sources?* The sample data would show, for example, that source `SOU-2324` (Composite Model, natural_well) serves community `COM-2792` (Primary Initiative A, population 35, pastoralism) and potentially additional communities.

**View `vw_pastoral_community_pastoral_territory_detail`**

```sql
CREATE VIEW vw_pastoral_community_pastoral_territory_detail AS
SELECT a.pastoral_community_id, a.community_identifier, a.community_name, b.id AS territory_id, b.territory_identifier AS territory_territory_identifier, b.territory_name AS territory_territory_name
FROM pastoral_communities a
  JOIN communities_territories j ON j.pastoral_community_id = a.pastoral_community_id
  JOIN pastoral_territories b ON b.id = j.pastoral_territory_id;
```

| pastoral_community_id | community_identifier | community_name | territory_id | territory_territory_identifier | territory_territory_name |
|---|---|---|---|---|---|
| 1000 | COM-2792 | Primary Initiative A | 1 | TER-2602 | Regional Initiative |
| 1000 | COM-2792 | Primary Initiative A | 2 | TER-2607 | Seasonal Model D |
| 1001 | COM-2799 | Composite Model | 2 | TER-2607 | Seasonal Model D |
| 1001 | COM-2799 | Composite Model | 3 | TER-2612 | Integrated Cluster |
| 1002 | COM-2806 | Compact Cluster | 3 | TER-2612 | Integrated Cluster |
| 1002 | COM-2806 | Compact Cluster | 4 | TER-2617 | Extended Review |
| 1003 | COM-2813 | Legacy Review D | 4 | TER-2617 | Extended Review |
| 1003 | COM-2813 | Legacy Review D | 1 | TER-2602 | Regional Initiative |

This view joins `pastoral_communities` to `pastoral_territories` through the `communities_territories` junction table, answering: *Which pastoral territory contains which pastoral community?* This is the inverse perspective of `vw_pastoral_territory_pastoral_community_detail`. Reading the sample data, community `COM-2792` (Primary Initiative A, population 35, pastoralism, herd size 26, decimation event `pilot-decimati-50`, adaptation strategy `baseline-adaptati-37`) resides in territory `TER-2602` (Regional Initiative, extended-primary-33, 10.20 ha, active status).

**View `vw_pastoral_community_water_source_detail`**

```sql
CREATE VIEW vw_pastoral_community_water_source_detail AS
SELECT a.pastoral_community_id, a.community_identifier, a.community_name, b.id AS source_id, b.source_identifier AS source_source_identifier, b.source_name AS source_source_name
FROM pastoral_communities a
  JOIN communities_sources j ON j.pastoral_community_id = a.pastoral_community_id
  JOIN water_sources b ON b.id = j.water_source_id;
```

| pastoral_community_id | community_identifier | community_name | source_id | source_source_identifier | source_source_name |
|---|---|---|---|---|---|
| 1000 | COM-2792 | Primary Initiative A | 1000 | SOU-2324 | Composite Model |
| 1000 | COM-2792 | Primary Initiative A | 1001 | SOU-2327 | Compact Cluster A |
| 1001 | COM-2799 | Composite Model | 1001 | SOU-2327 | Compact Cluster A |
| 1001 | COM-2799 | Composite Model | 1002 | SOU-2330 | Legacy Review |
| 1002 | COM-2806 | Compact Cluster | 1002 | SOU-2330 | Legacy Review |
| 1002 | COM-2806 | Compact Cluster | 1003 | SOU-2333 | Regional Initiative |
| 1003 | COM-2813 | Legacy Review D | 1003 | SOU-2333 | Regional Initiative |
| 1003 | COM-2813 | Legacy Review D | 1000 | SOU-2324 | Composite Model |

This view joins `pastoral_communities` to `water_sources` through the `communities_sources` junction table, answering: *Which water sources serve which pastoral communities?* This is the inverse perspective of `vw_water_source_pastoral_community_detail`. The sample data would show, for example, that community `COM-2792` (Primary Initiative A, population 35, pastoralism) draws from source `SOU-2324` (Composite Model, natural_well, depth 0.4 m, flow rate 5.20 L/s, water quality index 17.70).

**View `vw_pastoral_community_geographic_region`**

```sql
CREATE VIEW vw_pastoral_community_geographic_region AS
SELECT a.pastoral_community_id, a.community_identifier, a.community_name, a.population_size, b.geographic_region_id AS region_geographic_region_id, b.region_identifier AS region_region_identifier, b.region_name AS region_region_name
FROM pastoral_communities a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| pastoral_community_id | community_identifier | community_name | population_size | region_geographic_region_id | region_region_identifier | region_region_name |
|---|---|---|---|---|---|---|
| 1000 | COM-2792 | Primary Initiative A | 35 | 1 | REG-2093 | Distributed Assessment |
| 1001 | COM-2799 | Composite Model | 42 | 2 | REG-2100 | Adaptive Survey D |
| 1002 | COM-2806 | Compact Cluster | 49 | 3 | REG-2107 | Primary Corridor |
| 1003 | COM-2813 | Legacy Review D | 56 | 4 | REG-2114 | Composite Series |

This view joins `pastoral_communities` to `geographic_regions` through the `regions_communities` junction table, answering: *Which geographic region contains which pastoral community?* The sample data shows that community `COM-2792` (Primary Initiative A, population 35, pastoralism) is in region `REG-2093` (Distributed Assessment, county type, 10.20 ha, average annual rainfall 2.20, baseline-climate-55, elevation 23.70 m), community `COM-2799` (Composite Model, population 42, agro-pastoralism) is in region `REG-2100` (Adaptive Survey D, desert type), community `COM-2806` (Compact Cluster, population 49, sedentary_agriculture) is in region `REG-2107` (Primary Corridor, basin type), and community `COM-2813` (Legacy Review D, population 56, wage_labour) is in region `REG-2114` (Composite Series, ecological_zone type).

**View `vw_hydrological_event_pastoral_community_detail`**

```sql
CREATE VIEW vw_hydrological_event_pastoral_community_detail AS
SELECT a.id, a.event_identifier, a.event_type, b.pastoral_community_id AS community_pastoral_community_id, b.community_identifier AS community_community_identifier, b.community_name AS community_community_name
FROM hydrological_events a
  JOIN events_communities j ON j.hydrological_event_id = a.id
  JOIN pastoral_communities b ON b.pastoral_community_id = j.pastoral_community_id;
```

| id | event_identifier | event_type | community_pastoral_community_id | community_community_identifier | community_community_name |
|---|---|---|---|---|---|
| 100 | EVE-2706 | drought | 1000 | COM-2792 | Primary Initiative A |
| 100 | EVE-2706 | drought | 1001 | COM-2799 | Composite Model |
| 101 | EVE-2707 | flood | 1001 | COM-2799 | Composite Model |
| 101 | EVE-2707 | flood | 1002 | COM-2806 | Compact Cluster |
| 102 | EVE-2708 | aquifer_discovery | 1002 | COM-2806 | Compact Cluster |
| 102 | EVE-2708 | aquifer_discovery | 1003 | COM-2813 | Legacy Review D |
| 103 | EVE-2709 | water_table_drop | 1003 | COM-2813 | Legacy Review D |
| 103 | EVE-2709 | water_table_drop | 1000 | COM-2792 | Primary Initiative A |

This view joins `hydrological_events` to `pastoral_communities` through the `events_communities` junction table, answering: *Which pastoral communities are affected by which hydrological events?* Reading the sample data, event `EVE-2706` (drought, severity index 20.95, affected area 6.45 ha, no herd decimation) affects community `COM-2792` (Primary Initiative A, population 35, pastoralism). Event `EVE-2707` (flood, severity index 22.90, affected area 8.90 ha, caused herd decimation) affects community `COM-2799` (Composite Model, population 42, agro-pastoralism). Event `EVE-2708` (aquifer_discovery, severity index 24.85, affected area 11.35 ha, no herd decimation) affects community `COM-2806` (Compact Cluster, population 49, sedentary_agriculture). Event `EVE-2709` (water_table_drop, severity index 26.80, affected area 13.80 ha, caused herd decimation) affects community `COM-2813` (Legacy Review D, population 56, wage_labour).

**View `vw_hydrological_event_water_source_detail`**

```sql
CREATE VIEW vw_hydrological_event_water_source_detail AS
SELECT a.id, a.event_identifier, a.event_type, b.id AS source_id, b.source_identifier AS source_source_identifier, b.source_name AS source_source_name
FROM hydrological_events a
  JOIN events_sources j ON j.hydrological_event_id = a.id
  JOIN water_sources b ON b.id = j.water_source_id;
```

| id | event_identifier | event_type | source_id | source_source_identifier | source_source_name |
|---|---|---|---|---|---|
| 100 | EVE-2706 | drought | 1000 | SOU-2324 | Composite Model |
| 100 | EVE-2706 | drought | 1001 | SOU-2327 | Compact Cluster A |
| 101 | EVE-2707 | flood | 1001 | SOU-2327 | Compact Cluster A |
| 101 | EVE-2707 | flood | 1002 | SOU-2330 | Legacy Review |
| 102 | EVE-2708 | aquifer_discovery | 1002 | SOU-2330 | Legacy Review |
| 102 | EVE-2708 | aquifer_discovery | 1003 | SOU-2333 | Regional Initiative |
| 103 | EVE-2709 | water_table_drop | 1003 | SOU-2333 | Regional Initiative |
| 103 | EVE-2709 | water_table_drop | 1000 | SOU-2324 | Composite Model |

This view joins `hydrological_events` to `water_sources` through the `events_sources` junction table, answering: *Which water sources are impacted by which hydrological events?* The sample data would show, for example, that event `EVE-2706` (drought, severity index 20.95) impacts source `SOU-2324` (Composite Model, natural_well, depth 0.4 m, flow rate 5.20 L/s, water quality index 17.70).

**View `vw_hydrological_event_geographic_region`**

```sql
CREATE VIEW vw_hydrological_event_geographic_region AS
SELECT a.id, a.event_identifier, a.event_type, a.start_date, b.geographic_region_id AS region_geographic_region_id, b.region_identifier AS region_region_identifier, b.region_name AS region_region_name
FROM hydrological_events a JOIN geographic_regions b ON a.geographic_region_id = b.geographic_region_id;
```

| id | event_identifier | event_type | start_date | region_geographic_region_id | region_region_identifier | region_region_name |
|---|---|---|---|---|---|---|
| 100 | EVE-2706 | drought | 2022-09-05T20:24:00 | 1 | REG-2093 | Distributed Assessment |
| 101 | EVE-2707 | flood | 2023-02-16T03:41:00 | 2 | REG-2100 | Adaptive Survey D |
| 102 | EVE-2708 | aquifer_discovery | 2024-07-27T10:58:00 | 3 | REG-2107 | Primary Corridor |
| 103 | EVE-2709 | water_table_drop | 2025-12-11T17:15:00 | 4 | REG-2114 | Composite Series |

This view joins `hydrological_events` to `geographic_regions` through the foreign key `geographic_region_id` on `hydrological_events`, answering: *Which geographic region experienced which hydrological events?* The sample data shows that event `EVE-2706` (drought, severity index 20.95, affected area 6.45 ha, no herd decimation) occurred in region `REG-2093` (Distributed Assessment, county type, 10.20 ha, average annual rainfall 2.20, baseline-climate-55, elevation 23.70 m), event `EVE-2707` (flood, severity index 22.90, affected area 8.90 ha, caused herd decimation) occurred in region `REG-2100` (Adaptive Survey D, desert type), event `EVE-2708` (aquifer_discovery, severity index 24.85, affected area 11.35 ha, no herd decimation) occurred in region `REG-2107` (Primary Corridor, basin type), and event `EVE-2709` (water_table_drop, severity index 26.80, affected area 13.80 ha, caused herd decimation) occurred in region `REG-2114` (Composite Series, ecological_zone type).

**View `vw_geographic_region_pastoral_territory_detail`**

```sql
CREATE VIEW vw_geographic_region_pastoral_territory_detail AS
SELECT a.geographic_region_id, a.region_identifier, a.region_name, b.id AS territory_id, b.territory_identifier AS territory_territory_identifier, b.territory_name AS territory_territory_name
FROM geographic_regions a
  JOIN regions_territories j ON j.geographic_region_id = a.geographic_region_id
  JOIN pastoral_territories b ON b.id = j.pastoral_territory_id;
```

| geographic_region_id | region_identifier | region_name | territory_id | territory_territory_identifier | territory_territory_name |
|---|---|---|---|---|---|
| 1 | REG-2093 | Distributed Assessment | 1 | TER-2602 | Regional Initiative |
| 1 | REG-2093 | Distributed Assessment | 2 | TER-2607 | Seasonal Model D |
| 2 | REG-2100 | Adaptive Survey D | 2 | TER-2607 | Seasonal Model D |
| 2 | REG-2100 | Adaptive Survey D | 3 | TER-2612 | Integrated Cluster |
| 3 | REG-2107 | Primary Corridor | 3 | TER-2612 | Integrated Cluster |
| 3 | REG-2107 | Primary Corridor | 4 | TER-2617 | Extended Review |
| 4 | REG-2114 | Composite Series | 4 | TER-2617 | Extended Review |
| 4 | REG-2114 | Composite Series | 1 | TER-2602 | Regional Initiative |

This view joins `geographic_regions` to `pastoral_territories` through the `regions_territories` junction table, answering: *Which pastoral territories are contained within which geographic regions?* This is the inverse perspective of `vw_pastoral_territory_geographic_region`. The sample data shows that region `REG-2093` (Distributed Assessment, county type, 10.20 ha, average annual rainfall 2.20, baseline-climate-55, elevation 23.70 m) contains territory `TER-2602` (Regional Initiative, extended-primary-33, 10.20 ha, established 2024-07-11, active status).

**View `vw_geographic_region_water_source_detail`**

```sql
CREATE VIEW vw_geographic_region_water_source_detail AS
SELECT a.geographic_region_id, a.region_identifier, a.region_name, b.id AS source_id, b.source_identifier AS source_source_identifier, b.source_name AS source_source_name
FROM geographic_regions a
  JOIN regions_sources j ON j.geographic_region_id = a.geographic_region_id
  JOIN water_sources b ON b.id = j.water_source_id;
```

| geographic_region_id | region_identifier | region_name | source_id | source_source_identifier | source_source_name |
|---|---|---|---|---|---|
| 1 | REG-2093 | Distributed Assessment | 1000 | SOU-2324 | Composite Model |
| 1 | REG-2093 | Distributed Assessment | 1001 | SOU-2327 | Compact Cluster A |
| 2 | REG-2100 | Adaptive Survey D | 1001 | SOU-2327 | Compact Cluster A |
| 2 | REG-2100 | Adaptive Survey D | 1002 | SOU-2330 | Legacy Review |
| 3 | REG-2107 | Primary Corridor | 1002 | SOU-2330 | Legacy Review |
| 3 | REG-2107 | Primary Corridor | 1003 | SOU-2333 | Regional Initiative |
| 4 | REG-2114 | Composite Series | 1003 | SOU-2333 | Regional Initiative |
| 4 | REG-2114 | Composite Series | 1000 | SOU-2324 | Composite Model |

This view joins `geographic_regions` to `water_sources` through the `regions_sources` junction table, answering: *Which water sources are located within which geographic regions?* The sample data would show, for example, that region `REG-2093` (Distributed Assessment, county type, 10.20 ha, average annual rainfall 2.20, baseline-climate-55, elevation 23.70 m) contains source `SOU-2324` (Composite Model, natural_well, depth 0.4 m, flow rate 5.20 L/s, water quality index 17.70, discovered 2024-03-23, modern invention).

**View `vw_geographic_region_pastoral_community_detail`**

```sql
CREATE VIEW vw_geographic_region_pastoral_community_detail AS
SELECT a.geographic_region_id, a.region_identifier, a.region_name, b.pastoral_community_id AS community_pastoral_community_id, b.community_identifier AS community_community_identifier, b.community_name AS community_community_name
FROM geographic_regions a
  JOIN regions_communities j ON j.geographic_region_id = a.geographic_region_id
  JOIN pastoral_communities b ON b.pastoral_community_id = j.pastoral_community_id;
```

| geographic_region_id | region_identifier | region_name | community_pastoral_community_id | community_community_identifier | community_community_name |
|---|---|---|---|---|---|
| 1 | REG-2093 | Distributed Assessment | 1000 | COM-2792 | Primary Initiative A |
| 1 | REG-2093 | Distributed Assessment | 1001 | COM-2799 | Composite Model |
| 2 | REG-2100 | Adaptive Survey D | 1001 | COM-2799 | Composite Model |
| 2 | REG-2100 | Adaptive Survey D | 1002 | COM-2806 | Compact Cluster |
| 3 | REG-2107 | Primary Corridor | 1002 | COM-2806 | Compact Cluster |
| 3 | REG-2107 | Primary Corridor | 1003 | COM-2813 | Legacy Review D |
| 4 | REG-2114 | Composite Series | 1003 | COM-2813 | Legacy Review D |
| 4 | REG-2114 | Composite Series | 1000 | COM-2792 | Primary Initiative A |

This view joins `geographic_regions` to `pastoral_communities` through the `regions_communities` junction table, answering: *Which pastoral communities reside within which geographic regions?* This is the inverse perspective of `vw_pastoral_community_geographic_region`. The sample data shows that region `REG-2093` (Distributed Assessment, county type, 10.20 ha, average annual rainfall 2.20, baseline-climate-55, elevation 23.70 m) contains community `COM-2792` (Primary Initiative A, population 35, pastoralism, herd size 26, decimation event `pilot-decimati-50`, adaptation strategy `baseline-adaptati-37`).

## Synthesis

The schema models the pastoral domain as a network of five entity types connected by ten junction tables and observed through fourteen cross-entity views. The base tables store atomic facts: territories with their ethnic composition and status, water sources with their physical characteristics, communities with their demographic and livelihood profiles, hydrological events with their temporal and severity attributes, and geographic regions with their climatic and topographic properties. The junction tables materialize many-to-many associations that cannot be captured by a single foreign key, while the views provide denormalized lenses that answer specific domain questions by joining two entities at a time. Every view name encodes its join direction, and every view reconstructs a single domain fact from the normalized tables. The result is a schema that is both normalized for update integrity and denormalized for query convenience.