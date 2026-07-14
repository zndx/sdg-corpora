## Pastoral Water Systems and Territorial Governance

The management of water resources in pastoral landscapes requires understanding the intricate relationships between territorial claims, community livelihoods, hydrological infrastructure, and environmental events. This chapter documents the structural framework used to track and analyze these relationships across five core entities: pastoral territories, water sources, pastoral communities, hydrological events, and geographic regions. Each entity carries distinct identifiers and measurements that, when joined, reveal operational patterns critical to resource planning and crisis response.

The foundation of this framework rests on five base tables that capture the primary entities and their cross-referential links.

**Table `pastoral_territories`**

| id | territory_identifier | territory_name | primary_ethnic_group | area_hectares | establishment_date | current_status | geographic_region_id |
|---|---|---|---|---|---|---|---|
| 1 | TER-2602 | Regional Initiative | extended-primary-33 | 10.20 | 2024-07-11 | active | 1 |
| 2 | TER-2607 | Seasonal Model D | integrated-primary-34 | 14.40 | 2025-12-22 | disputed | 2 |
| 3 | TER-2612 | Integrated Cluster | seasonal-primary-35 | 18.60 | 2022-05-06 | fragmented | 3 |
| 4 | TER-2617 | Extended Review | regional-primary-36 | 22.80 | 2023-10-17 | abandoned | 4 |

Pastoral territories represent the foundational administrative units of land management. Each territory carries a unique identifier such as TER-2602 or TER-2617, a descriptive name like "Regional Initiative" or "Extended Review," and a classification of the primary ethnic group associated with its stewardship. The area of each territory is measured in hectares, ranging from 10.20 hectares for the Regional Initiative to 22.80 hectares for the Extended Review. Territories are assigned a current status—active, disputed, fragmented, or abandoned—which reflects their operational stability. The establishment dates span from 2022 through 2025, and each territory is linked to a geographic region via the geographic_region_id foreign key, anchoring it within a broader climatic and topographic context.

**Table `water_sources`**

| id | source_identifier | source_name | source_type | depth_meters | flow_rate_liters_per_second | water_quality_index | discovery_date | is_modern_invention | pastoral_territory_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | SOU-2324 | Composite Model | natural_well | 0.4 | 5.20 | 17.70 | 2024-03-23 | true | 1 |
| 1001 | SOU-2327 | Compact Cluster A | borehole | 0.01999998 | 7.40 | 20.40 | 2025-08-07 | false | 2 |
| 1002 | SOU-2330 | Legacy Review | underground_lake | 0.13 | 9.60 | 23.10 | 2022-01-18 | true | 3 |
| 1003 | SOU-2333 | Regional Initiative | spring | 0.96 | 11.80 | 25.80 | 2023-06-02 | false | 4 |

Water sources document the physical infrastructure and natural features that provide water access. Each source is identified by a code such as SOU-2324 or SOU-2333 and classified by type: natural_well, borehole, underground_lake, or spring. The depth of each source, measured in meters, varies significantly—from a shallow 0.02 meters for the Compact Cluster A borehole to 0.96 meters for the Regional Initiative spring. Flow rates range from 5.20 liters per second at the Composite Model natural well to 11.80 liters per second at the Regional Initiative spring. The water_quality_index provides a standardized measure of source quality, with values between 17.70 and 25.80 across the recorded sources. Each source is also tagged with a discovery_date and a boolean flag indicating whether it is a modern invention, and it is linked to a pastoral_territory_id, establishing which territory claims responsibility for its maintenance.

**Table `pastoral_communities`**

| pastoral_community_id | community_identifier | community_name | population_size | primary_livelihood | herd_size | decimation_event | adaptation_strategy | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | COM-2792 | Primary Initiative A | 35 | pastoralism | 26 | pilot-decimati-50 | baseline-adaptati-37 | 1 |
| 1001 | COM-2799 | Composite Model | 42 | agro-pastoralism | 37 | extended-decimati-51 | pilot-adaptati-38 | 2 |
| 1002 | COM-2806 | Compact Cluster | 49 | sedentary_agriculture | 48 | integrated-decimati-52 | extended-adaptati-39 | 3 |
| 1003 | COM-2813 | Legacy Review D | 56 | wage_labour | 59 | seasonal-decimati-53 | integrated-adaptati-40 | 4 |

Pastoral communities represent the human dimension of the system. Each community carries an identifier such as COM-2792 or COM-2813, a name like "Primary Initiative A" or "Legacy Review D," and demographic data including population_size and herd_size. The primary_livelihood field categorizes the community's economic base—pastoralism, agro-pastoralism, sedentary_agriculture, or wage_labour. The decimation_event field records any prior population-reducing events, using coded identifiers like pilot-decimati-50 or seasonal-decimati-53. Adaptation strategies are similarly coded, ranging from baseline-adaptati-37 to integrated-adaptati-40. Each community is associated with a geographic_region_id, situating it within the regional climate and terrain profile.

**Table `hydrological_events`**

| id | event_identifier | event_type | start_date | end_date | severity_index | affected_area_hectares | caused_herd_decimation | geographic_region_id |
|---|---|---|---|---|---|---|---|---|
| 100 | EVE-2706 | drought | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 20.95 | 6.45 | false | 1 |
| 101 | EVE-2707 | flood | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 22.90 | 8.90 | true | 2 |
| 102 | EVE-2708 | aquifer_discovery | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 24.85 | 11.35 | false | 3 |
| 103 | EVE-2709 | water_table_drop | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 26.80 | 13.80 | true | 4 |

Hydrological events capture significant environmental occurrences that impact water availability and community stability. Events are identified by codes such as EVE-2706 or EVE-2709 and classified by type: drought, flood, aquifer_discovery, or water_table_drop. Each event has a start_date and end_date, though the recorded intervals may span backward in time, suggesting retrospective logging or data entry conventions. The severity_index quantifies the event's intensity, ranging from 20.95 for the drought EVE-2706 to 26.80 for the water_table_drop EVE-2709. The affected_area_hectares field measures the spatial extent of impact, from 6.45 hectares to 13.80 hectares. A boolean flag, caused_herd_decimation, indicates whether the event resulted in livestock losses. Each event is linked to a geographic_region_id.

**Table `geographic_regions`**

| geographic_region_id | region_identifier | region_name | region_type | area_hectares | average_annual_rainfall | climate_classification | elevation_meters |
|---|---|---|---|---|---|---|---|
| 1 | REG-2093 | Distributed Assessment | county | 10.20 | 2.20 | baseline-climate-55 | 23.70 |
| 2 | REG-2100 | Adaptive Survey D | desert | 14.40 | 4.40 | pilot-climate-56 | 28.40 |
| 3 | REG-2107 | Primary Corridor | basin | 18.60 | 6.60 | extended-climate-57 | 33.10 |
| 4 | REG-2114 | Composite Series | ecological_zone | 22.80 | 8.80 | integrated-climate-58 | 37.80 |

Geographic regions provide the environmental context for all other entities. Each region carries an identifier such as REG-2093 or REG-2114, a name like "Distributed Assessment" or "Composite Series," and a region_type classification—county, desert, basin, or ecological_zone. The area_hectares of each region matches the corresponding territory and community areas, suggesting a hierarchical or partitioned structure. Average annual rainfall ranges from 2.20 units in the Distributed Assessment county to 8.80 units in the Composite Series ecological zone. The climate_classification field uses coded labels such as baseline-climate-55 or integrated-climate-58. Elevation_meters increases from 23.70 meters in the first region to 37.80 meters in the fourth, indicating a topographic gradient.

The relationships between these primary entities are captured through junction tables that model many-to-many associations and territorial linkages.

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

The territories_sources junction table establishes which water sources are associated with which pastoral territories. The data reveals a cyclic pattern: territory 1 (TER-2602) is linked to sources 1000 and 1001; territory 2 (TER-2607) to sources 1001 and 1002; territory 3 (TER-2612) to sources 1002 and 1003; and territory 4 (TER-2617) to sources 1003 and 1000. This overlapping arrangement suggests that water sources may serve multiple territories or that territorial boundaries are fluid and shared.

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

The territories_communities table links pastoral communities to the territories they inhabit or operate within. This relationship is essential for understanding which communities depend on which territorial water resources and governance structures.

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

The sources_communities table records which pastoral communities directly utilize which water sources. This many-to-many relationship captures the practical reality that communities may draw from multiple sources and that sources may serve multiple communities.

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

The communities_territories table provides an alternative or complementary linkage between communities and territories, potentially capturing secondary associations, seasonal use patterns, or administrative overlaps not reflected in the primary territorial assignment.

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

The communities_sources table offers another dimension of the community-source relationship, possibly encoding usage frequency, priority access, or historical claims that differ from the direct associations recorded in sources_communities.

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

The events_communities table connects hydrological events to the pastoral communities they affected. This linkage is critical for impact assessment, enabling analysts to trace which communities experienced specific events and to correlate event severity with community vulnerability indicators such as herd size and adaptation strategy.

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

The events_sources table links hydrological events to the water sources impacted by them. This relationship supports infrastructure risk assessment, allowing planners to identify which sources are most vulnerable to specific event types and to prioritize maintenance or reinforcement efforts.

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

The regions_territories table maps pastoral territories to their encompassing geographic regions. This relationship grounds territorial management within regional climate and terrain profiles, enabling region-level aggregation of territorial data for strategic planning.

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

The regions_sources table connects water sources to their geographic regions. This linkage supports regional water resource inventories and facilitates comparisons of source characteristics across different climatic zones.

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

The regions_communities table associates pastoral communities with their geographic regions. This relationship enables demographic and livelihood analysis at the regional scale, supporting the identification of community clusters with similar environmental exposures and adaptation needs.

With the base tables and junction tables established, the analytical power of the framework emerges through its views, which join these tables into cohesive, question-specific result sets.

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

This view joins pastoral_territories with water_sources to answer the question: which water sources are available within each pastoral territory, and what are their physical characteristics? Reading the first row, the Regional Initiative territory (TER-2602) is associated with the Composite Model natural well (SOU-2324), which has a depth of 0.4 meters, a flow rate of 5.20 liters per second, and a water quality index of 17.70. The second row shows the same territory linked to the Compact Cluster A borehole (SOU-2327), which is shallower at 0.02 meters but delivers a higher flow rate of 7.40 liters per second. This view enables territorial managers to assess the water resource portfolio available to each territory and to identify potential capacity constraints.

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

This view joins pastoral_territories with pastoral_communities to reveal which communities operate within each territory and what their demographic and livelihood profiles are. The first row pairs the Regional Initiative territory with the Primary Initiative A community, which has a population of 35, a herd size of 26, and practices pastoralism as its primary livelihood. The second row links the Seasonal Model D territory to the Composite Model community, with a larger population of 42, a herd of 37, and an agro-pastoralist livelihood. This view supports territorial governance by clarifying the human population and economic activities that the territory's water resources must sustain.

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

This view joins pastoral_territories with geographic_regions to situate each territory within its broader environmental context. The first row shows the Regional Initiative territory within the Distributed Assessment county, which receives 2.20 units of annual rainfall and sits at 23.70 meters elevation. The fourth row places the Extended Review territory within the Composite Series ecological zone, with 8.80 units of rainfall and 37.80 meters elevation. This view is essential for understanding how regional climate and topography influence territorial water availability and community resilience.

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

This view joins water_sources with pastoral_territories to answer the inverse question of the first view: from the perspective of each water source, which territory is responsible for it, and what are the territory's characteristics? The first row shows the Composite Model natural well (SOU-2324) belonging to the Regional Initiative territory (TER-2602), which covers 10.20 hectares and is currently active. The third row links the Legacy Review underground lake (SOU-2330) to the Integrated Cluster territory (TER-2612), which spans 18.60 hectares and has a fragmented status. This view supports infrastructure accountability by clarifying which territorial administration is responsible for each source.

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

This view joins water_sources with pastoral_communities to reveal which communities draw from each water source and what their characteristics are. The first row connects the Composite Model natural well to the Primary Initiative A community, which has a population of 35 and a herd of 26. The second row links the Compact Cluster A borehole to the Composite Model community, with 42 residents and 37 head of livestock. This view enables water managers to estimate per-capita and per-herd water availability and to identify sources that may be under stress from high demand.

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

This view joins pastoral_communities with pastoral_territories to show which territory each community belongs to and what the territory's status and area are. The first row pairs the Primary Initiative A community with the Regional Initiative territory (TER-2602), which is active and covers 10.20 hectares. The fourth row links the Legacy Review D community to the Extended Review territory (TER-2617), which has an abandoned status and spans 22.80 hectares. This view supports administrative planning by clarifying the territorial jurisdiction and operational status relevant to each community.

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

This view joins pastoral_communities with water_sources to reveal which water sources each community uses and what the source characteristics are. The first row shows the Primary Initiative A community accessing the Composite Model natural well, which has a flow rate of 5.20 liters per second and a water quality index of 17.70. The third row links the Compact Cluster community to the Legacy Review underground lake, with a flow rate of 9.60 liters per second and a quality index of 23.10. This view is critical for assessing whether community water access meets their population and herd needs.

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

This view joins pastoral_communities with geographic_regions to situate each community within its regional climate and terrain profile. The first row places the Primary Initiative A community in the Distributed Assessment county, with 2.20 units of annual rainfall and 23.70 meters elevation. The fourth row links the Legacy Review D community to the Composite Series ecological zone, with 8.80 units of rainfall and 37.80 meters elevation. This view supports vulnerability analysis by correlating community characteristics with regional environmental conditions.

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

This view joins hydrological_events with pastoral_communities to reveal which communities were affected by each hydrological event and what their characteristics are. The first row shows the drought event EVE-2706 affecting the Primary Initiative A community, which has a population of 35 and practices pastoralism. The second row links the flood event EVE-2707 to the Composite Model community, which has a larger population of 42 and practices agro-pastoralism. This view enables impact assessment by correlating event severity with community vulnerability indicators.

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

This view joins hydrological_events with water_sources to reveal which water sources were impacted by each hydrological event and what their characteristics are. The first row shows the drought event EVE-2706 impacting the Composite Model natural well, which has a flow rate of 5.20 liters per second. The fourth row links the water_table_drop event EVE-2709 to the Regional Initiative spring, with a flow rate of 11.80 liters per second. This view supports infrastructure resilience planning by identifying which sources are most exposed to specific event types.

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

This view joins hydrological_events with geographic_regions to situate each event within its regional environmental context. The first row places the drought event EVE-2706 in the Distributed Assessment county, which receives 2.20 units of annual rainfall. The fourth row links the water_table_drop event EVE-2709 to the Composite Series ecological zone, with 8.80 units of rainfall and 37.80 meters elevation. This view enables regional risk profiling by correlating event types with regional climate and terrain characteristics.

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

This view joins geographic_regions with pastoral_territories to show which territories fall within each geographic region and what their characteristics are. The first row places the Regional Initiative territory (TER-2602) within the Distributed Assessment county, which has 10.20 hectares of area and 2.20 units of annual rainfall. The fourth row links the Extended Review territory (TER-2617) to the Composite Series ecological zone, with 22.80 hectares of area and 8.80 units of rainfall. This view supports regional planning by aggregating territorial data within environmental zones.

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

This view joins geographic_regions with water_sources to reveal which water sources are located within each geographic region and what their characteristics are. The first row shows the Distributed Assessment county containing the Composite Model natural well, which has a depth of 0.4 meters and a flow rate of 5.20 liters per second. The fourth row links the Composite Series ecological zone to the Regional Initiative spring, with a depth of 0.96 meters and a flow rate of 11.80 liters per second. This view enables regional water resource assessments and supports infrastructure investment prioritization.

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

This view joins geographic_regions with pastoral_communities to show which communities reside within each geographic region and what their characteristics are. The first row places the Primary Initiative A community within the Distributed Assessment county, with a population of 35 and a herd of 26. The fourth row links the Legacy Review D community to the Composite Series ecological zone, with a population of 56 and a herd of 59. This view supports regional demographic analysis and helps identify communities that may require targeted adaptation support based on their regional environmental exposure.

The integration of these base tables, junction tables, and analytical views creates a comprehensive framework for understanding pastoral water systems. Pastoral territories provide the administrative structure, water sources document the physical infrastructure, pastoral communities represent the human stakeholders, hydrological events capture environmental disruptions, and geographic regions supply the environmental context. The junction tables model the complex many-to-many relationships that characterize real-world pastoral landscapes, where territories share sources, communities draw from multiple wells, and events ripple across administrative boundaries. The views synthesize these relationships into actionable result sets that answer specific operational questions: which sources serve which territories, which communities are affected by which events, and how regional climate shapes territorial and community outcomes. Together, these elements form a coherent record-keeping system that supports resource management, crisis response, and long-term planning in pastoral landscapes.