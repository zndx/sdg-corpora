## Pastoral Systems and Water Resource Governance

Pastoral communities across diverse ecological zones depend on intricate relationships between land, water, and livelihood strategies. The records in this domain capture how herding populations organize themselves across territories, manage water resources, respond to hydrological pressures, and develop alternative income sources when traditional grazing becomes untenable. Each pastoral community occupies a defined territory, maintains access to specific watered places, employs particular water management practices, and faces measurable hydrological stress that shapes both its immediate survival and its long-term adaptation strategies. Understanding these interlocking relationships requires examining the domain through multiple analytical lenses—each view answering a distinct operational question about how communities, territories, water infrastructure, management practices, and stressors relate to one another.

**Table `pastoral_communities`**

| pastoral_community_id | community_name | territory_name | primary_livelihood | historical_presence | territory_id | water_management_practice_id | alternative_livelihood_id |
|---|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | Regional Initiative | seasonal-primary-35 | 9 | 1000 | 1 | 1 |
| 2 | Composite Model | Seasonal Model D | regional-primary-36 | 17 | 1001 | 2 | 2 |
| 3 | Compact Cluster | Integrated Cluster | legacy-primary-37 | 25 | 1002 | 3 | 3 |
| 4 | Legacy Review D | Extended Review | compact-primary-38 | 33 | 1003 | 4 | 4 |

The pastoral communities table forms the central entity in this domain, anchoring every other relationship. Four communities are recorded, each identified by a numeric `pastoral_community_id` and a descriptive `community_name`. Primary Initiative A operates under a seasonal-primary-35 livelihood classification with a historical presence score of 9, while the Composite Model follows a regional-primary-36 pattern with a presence score of 17. The Compact Cluster carries a legacy-primary-37 classification and a presence score of 25, and Legacy Review D represents the most established community with a compact-primary-38 livelihood type and a presence score of 33. Each community is linked to a territory through `territory_id`, a water management practice via `water_management_practice_id`, and an alternative livelihood strategy through `alternative_livelihood_id`, establishing the foundational foreign-key structure that supports all downstream analytical views.

**Table `territories`**

| id | territory_name | location | area_size | dominant_ecosystem | well_watered_place_id | territory_id | pastoral_community_id |
|---|---|---|---|---|---|---|---|
| 1000 | Regional Initiative | extended-location-99 | 1.52 | adaptive-dominant-29 | 1 | 1000 | 1 |
| 1001 | Seasonal Model D | integrated-location-100 | 0.65 | distributed-dominant-30 | 2 | 1001 | 2 |
| 1002 | Integrated Cluster | seasonal-location-101 | 0.43012016 | baseline-dominant-31 | 3 | 1002 | 3 |
| 1003 | Extended Review | regional-location-102 | 0.6000001 | pilot-dominant-32 | 4 | 1003 | 4 |

Territories define the spatial and ecological context within which pastoral communities operate. The territories table records four geographic units, each with a unique `id` matching its associated `territory_id` in the communities table. Regional Initiative spans 1.52 square units under an adaptive-dominant-29 ecosystem classification, while Seasonal Model D covers a more compact 0.65 square units with a distributed-dominant-30 ecosystem. Integrated Cluster occupies just 0.43 square units under a baseline-dominant-31 regime, and Extended Review encompasses 0.60 square units with a pilot-dominant-32 ecosystem type. Each territory references a specific well-watered place through `well_watered_place_id`, links back to its parent territory via `territory_id`, and identifies the resident pastoral community through `pastoral_community_id`. The `location` field uses coded descriptors such as extended-location-99 and integrated-location-100 to categorize spatial positioning without revealing precise coordinates.

**Table `well_watered_places`**

| id | place_name | water_source | reliability | socio_ecological_niche | territory_id | pastoral_community_id | water_management_practice_id |
|---|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | compact-water-92 | integrated-reliabil-40 | true | 1000 | 1 | 1 |
| 2 | Adaptive Review D | composite-water-93 | seasonal-reliabil-41 | false | 1001 | 2 | 2 |
| 3 | Primary Initiative | primary-water-94 | regional-reliabil-42 | true | 1002 | 3 | 3 |
| 4 | Composite Model | adaptive-water-95 | legacy-reliabil-43 | false | 1003 | 4 | 4 |

Watered places represent the critical infrastructure nodes that sustain pastoral livelihoods. The well_watered_places table documents four locations, each with a `place_name` that often echoes the community or territory it serves. Distributed Cluster draws from a compact-water-92 source with integrated-reliabil-40 reliability and is classified within a true socio-ecological niche. Adaptive Review D relies on composite-water-93 with seasonal-reliabil-41 reliability and carries a false socio-ecological niche designation. Primary Initiative accesses primary-water-94 under regional-reliabil-42 reliability with a true niche classification, while Composite Model depends on adaptive-water-95 with legacy-reliabil-43 reliability and a false niche status. Each watered place connects to its parent territory through `territory_id`, identifies the benefiting pastoral community via `pastoral_community_id`, and associates with a specific water management practice through `water_management_practice_id`.

**Table `water_management_practices`**

| water_management_practice_id | practice_name | conservation_level | historical_period | effectiveness | pastoral_community_id | territory_id | hydrological_stress_id |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | compact-conserva-68 | compact-historic-26 | legacy-effectiv-73 | 1 | 1000 | 1 |
| 2 | Integrated Corridor | composite-conserva-69 | composite-historic-27 | compact-effectiv-74 | 2 | 1001 | 2 |
| 3 | Extended Series D | primary-conserva-70 | primary-historic-28 | composite-effectiv-75 | 3 | 1002 | 3 |
| 4 | Pilot Assessment | adaptive-conserva-71 | adaptive-historic-29 | primary-effectiv-76 | 4 | 1003 | 4 |

Water management practices encode the institutional and technical approaches communities use to sustain their water resources. The four recorded practices—Seasonal Survey, Integrated Corridor, Extended Series D, and Pilot Assessment—each carry a `conservation_level` code, a `historical_period` classification, and an `effectiveness` rating. Seasonal Survey operates at compact-conserva-68 conservation level within the compact-historic-26 period and achieves legacy-effectiv-73 effectiveness. Integrated Corridor applies composite-conserva-69 conservation standards from the composite-historic-27 era with compact-effectiv-74 effectiveness. Extended Series D implements primary-conserva-70 conservation measures under primary-historic-28 historical conditions, reaching composite-effectiv-75 effectiveness. Pilot Assessment utilizes adaptive-conserva-71 conservation protocols from the adaptive-historic-29 period and attains primary-effectiv-76 effectiveness. Each practice links to its originating pastoral community through `pastoral_community_id`, its territorial context via `territory_id`, and the hydrological stress it addresses through `hydrological_stress_id`.

**Table `hydrological_stresses`**

| hydrological_stress_id | stress_level | duration | affected_area | impact_on_livelihood | pastoral_community_id | territory_id | water_management_practice_id |
|---|---|---|---|---|---|---|---|
| 1 | compact-stress-20 | 28 | extended-affected-15 | regional-impact-36 | 1 | 1000 | 1 |
| 2 | composite-stress-21 | 36 | integrated-affected-16 | legacy-impact-37 | 2 | 1001 | 2 |
| 3 | primary-stress-22 | 44 | seasonal-affected-17 | compact-impact-38 | 3 | 1002 | 3 |
| 4 | adaptive-stress-23 | 52 | regional-affected-18 | composite-impact-39 | 4 | 1003 | 4 |

Hydrological stresses quantify the environmental pressures that challenge pastoral water security. The four stress records capture `stress_level` classifications, `duration` in days, `affected_area` descriptors, and `impact_on_livelihood` ratings. Compact-stress-20 persists for 28 days across extended-affected-15 area and produces regional-impact-36 consequences on livelihoods. Composite-stress-21 endures for 36 days within integrated-affected-16 territory, generating legacy-impact-37 effects. Primary-stress-22 lasts 44 days across seasonal-affected-17 regions with compact-impact-38 livelihood consequences. Adaptive-stress-23 represents the most severe recorded event, lasting 52 days across regional-affected-18 area and producing composite-impact-39 impacts. Each stress event is associated with a specific pastoral community through `pastoral_community_id`, its territorial scope via `territory_id`, and the water management practice deployed in response through `water_management_practice_id`.

**Table `alternative_livelihoods`**

| id | livelihood_type | adoption_rate | primary_drivers | sustainability | pastoral_community_id | well_watered_place_id |
|---|---|---|---|---|---|---|
| 1 | baseline-liveliho-37 | 7.20 | integrated-primary-22 | composite-sustaina-75 | 1 | 1 |
| 2 | pilot-liveliho-38 | 9.40 | seasonal-primary-23 | primary-sustaina-76 | 2 | 2 |
| 3 | extended-liveliho-39 | 11.60 | regional-primary-24 | adaptive-sustaina-77 | 3 | 3 |
| 4 | integrated-liveliho-40 | 13.80 | legacy-primary-25 | distributed-sustaina-78 | 4 | 4 |

Alternative livelihoods represent the adaptive strategies communities pursue when traditional pastoralism becomes insufficient. The four livelihood records span `livelihood_type` categories from baseline-liveliho-37 through integrated-liveliho-40, with `adoption_rate` values increasing from 7.20 to 13.80 across the sequence. Each livelihood identifies its `primary_drivers` using codes such as integrated-primary-22 and seasonal-primary-23, and carries a `sustainability` rating ranging from composite-sustaina-75 to distributed-sustaina-78. The adoption rates show a clear upward progression: baseline-liveliho-37 at 7.20, pilot-liveliho-38 at 9.40, extended-liveliho-39 at 11.60, and integrated-liveliho-40 at 13.80. Each alternative livelihood connects to its originating pastoral community through `pastoral_community_id` and to a specific well-watered place via `well_watered_place_id`, establishing the bridge between water infrastructure and economic diversification.

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

This view joins pastoral communities with their territorial contexts, answering the question of which communities operate within which ecological zones and at what spatial scale. The join reveals that Primary Initiative A (pastoral_community_id 1) operates within territory 1000, a 1.52-square-unit region classified as adaptive-dominant-29. The Composite Model (pastoral_community_id 2) occupies territory 1001, a 0.65-square-unit distributed-dominant-30 ecosystem. Compact Cluster (pastoral_community_id 3) is situated in territory 1002, the smallest at 0.43 square units under baseline-dominant-31 conditions. Legacy Review D (pastoral_community_id 4) spans territory 1003, a 0.60-square-unit pilot-dominant-32 zone. This relationship enables planners to assess whether community size and historical presence correlate with territorial extent or ecosystem type.

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

By linking pastoral communities to their water management practices, this view reveals how institutional approaches to water governance vary across communities. Primary Initiative A employs Seasonal Survey (water_management_practice_id 1000), a compact-conserva-68 practice from the compact-historic-26 period achieving legacy-effectiv-73 effectiveness. The Composite Model uses Integrated Corridor (1001), applying composite-conserva-69 conservation from the composite-historic-27 era with compact-effectiv-74 results. Compact Cluster implements Extended Series D (1002), a primary-conserva-70 practice rooted in primary-historic-28 conditions reaching composite-effectiv-75 effectiveness. Legacy Review D deploys Pilot Assessment (1003), utilizing adaptive-conserva-71 protocols from the adaptive-historic-29 period and attaining primary-effectiv-76 effectiveness. The progression from legacy-effectiv-73 to primary-effectiv-76 suggests that more established communities may adopt more effective conservation strategies.

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

This view connects pastoral communities to their alternative livelihood strategies, illuminating the economic diversification pathways available to each. Primary Initiative A (pastoral_community_id 1) is associated with baseline-liveliho-37, carrying an adoption rate of 7.20 and integrated-primary-22 primary drivers, with composite-sustaina-75 sustainability. The Composite Model (2) pursues pilot-liveliho-38 at a 9.40 adoption rate, driven by seasonal-primary-23 factors and rated primary-sustaina-76. Compact Cluster (3) engages extended-liveliho-39 with an 11.60 adoption rate, regional-primary-24 drivers, and adaptive-sustaina-77 sustainability. Legacy Review D (4) has adopted integrated-liveliho-40 at the highest rate of 13.80, supported by legacy-primary-25 drivers and distributed-sustaina-78 sustainability. The positive correlation between historical presence and adoption rate suggests that longer-established communities develop more robust alternative livelihood portfolios.

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

This territorial-watered place join clarifies which water infrastructure nodes serve each territory and their reliability characteristics. Territory 1000 (Regional Initiative) is served by watered place 1, Distributed Cluster, which draws from compact-water-92 with integrated-reliabil-40 reliability and a true socio-ecological niche. Territory 1001 (Seasonal Model D) accesses watered place 2, Adaptive Review D, sourced from composite-water-93 with seasonal-reliabil-41 reliability and a false niche designation. Territory 1002 (Integrated Cluster) relies on watered place 3, Primary Initiative, fed by primary-water-94 at regional-reliabil-42 reliability with a true socio-ecological niche. Territory 1003 (Extended Review) depends on watered place 4, Composite Model, drawing from adaptive-water-95 with legacy-reliabil-43 reliability and a false socio-ecological niche. The alternating true/false socio-ecological niche pattern may indicate varying degrees of ecosystem integration.

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

This self-referential territory view exposes the hierarchical or recursive relationships within the territorial structure itself. Each territory record references itself through the `territory_id` field, creating a self-join that can reveal nested territorial classifications or administrative sub-divisions. Territory 1000 references itself, as do territories 1001, 1002, and 1003. This structure supports queries about whether territories contain sub-territories or whether certain territorial classifications encompass others, enabling multi-level spatial analysis of pastoral land use.

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

This view inverts the community-to-territory relationship, presenting territories as the primary entity with their resident communities as the joined attribute. Territory 1000 hosts pastoral community 1 (Primary Initiative A), a seasonal-primary-35 community with historical presence 9. Territory 1001 contains community 2 (Composite Model), a regional-primary-36 community with presence 17. Territory 1002 accommodates community 3 (Compact Cluster), a legacy-primary-37 community with presence 25. Territory 1003 holds community 4 (Legacy Review D), a compact-primary-38 community with presence 33. This perspective is useful for territorial planners assessing the human population density and livelihood composition within each geographic unit.

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

This view presents watered places as the primary entity, joined with their parent territories to clarify the spatial distribution of water infrastructure. Distributed Cluster (watered place 1) serves territory 1000, a 1.52-square-unit adaptive-dominant-29 region. Adaptive Review D (place 2) supports territory 1001, a 0.65-square-unit distributed-dominant-30 zone. Primary Initiative (place 3) supplies territory 1002, the smallest territory at 0.43 square units under baseline-dominant-31 classification. Composite Model (place 4) serves territory 1003, a 0.60-square-unit pilot-dominant-32 ecosystem. The view enables water resource managers to evaluate whether water infrastructure coverage is proportional to territorial area or ecosystem complexity.

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

This join connects watered places directly to the pastoral communities they benefit, bypassing the territorial intermediate. Watered place 1 (Distributed Cluster) serves pastoral community 1 (Primary Initiative A), while place 2 (Adaptive Review D) supports community 2 (Composite Model). Place 3 (Primary Initiative) serves community 3 (Compact Cluster), and place 4 (Composite Model) supports community 4 (Legacy Review D). The one-to-one mapping in this dataset suggests a direct correspondence between water infrastructure and community, though the view structure supports scenarios where a single watered place might serve multiple communities or where communities share water sources.

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

This view links watered places to the management practices applied at or near them, revealing how technical governance approaches are deployed across water infrastructure. Distributed Cluster (place 1) is managed under practice 1000 (Seasonal Survey), a compact-conserva-68 approach from compact-historic-26 with legacy-effectiv-73 effectiveness. Adaptive Review D (place 2) follows practice 1001 (Integrated Corridor), applying composite-conserva-69 conservation from composite-historic-27 with compact-effectiv-74 results. Primary Initiative (place 3) implements practice 1002 (Extended Series D), a primary-conserva-70 practice from primary-historic-28 reaching composite-effectiv-75 effectiveness. Composite Model (place 4) uses practice 1003 (Pilot Assessment), an adaptive-conserva-71 protocol from adaptive-historic-29 achieving primary-effectiv-76 effectiveness. The consistent upward trend in effectiveness ratings across the four watered places suggests that newer or more adaptive management practices may yield superior conservation outcomes.

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

This view presents water management practices as the primary entity, joined with their originating pastoral communities. Seasonal Survey (practice 1000) originates from pastoral community 1 (Primary Initiative A), while Integrated Corridor (1001) is developed by community 2 (Composite Model). Extended Series D (1002) is associated with community 3 (Compact Cluster), and Pilot Assessment (1003) with community 4 (Legacy Review D). This perspective is valuable for understanding which communities have developed or adopted specific management approaches, and for tracing the institutional knowledge embedded in each practice.

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

This join connects water management practices to their territorial contexts, enabling analysis of how management approaches vary across ecological zones. Practice 1000 (Seasonal Survey) operates within territory 1000 (Regional Initiative), a 1.52-square-unit adaptive-dominant-29 region. Practice 1001 (Integrated Corridor) functions in territory 1001 (Seasonal Model D), a 0.65-square-unit distributed-dominant-30 ecosystem. Practice 1002 (Extended Series D) is deployed in territory 1002 (Integrated Cluster), the smallest territory at 0.43 square units under baseline-dominant-31 conditions. Practice 1003 (Pilot Assessment) operates in territory 1003 (Extended Review), a 0.60-square-unit pilot-dominant-32 zone. The view supports cross-territorial comparisons of management practice effectiveness and conservation level appropriateness.

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

This critical view links water management practices to the hydrological stresses they are designed to address, revealing the cause-and-effect relationships between environmental pressures and institutional responses. Practice 1000 (Seasonal Survey) addresses stress 1 (compact-stress-20), a 28-day event affecting extended-affected-15 area with regional-impact-36 livelihood consequences. Practice 1001 (Integrated Corridor) responds to stress 2 (composite-stress-21), lasting 36 days across integrated-affected-16 territory with legacy-impact-37 effects. Practice 1002 (Extended Series D) counters stress 3 (primary-stress-22), a 44-day event in seasonal-affected-17 regions producing compact-impact-38 impacts. Practice 1003 (Pilot Assessment) manages stress 4 (adaptive-stress-23), the most severe at 52 days across regional-affected-18 area with composite-impact-39 consequences. The increasing duration and impact severity from stress 1 to stress 4, paired with the progression of practice effectiveness from legacy-effectiv-73 to primary-effectiv-76, suggests that more severe hydrological conditions may drive the adoption of more effective management practices.

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

This view presents hydrological stresses as the primary entity, joined with the pastoral communities they affect. Stress 1 (compact-stress-20, 28 days) impacts pastoral community 1 (Primary Initiative A). Stress 2 (composite-stress-21, 36 days) affects community 2 (Composite Model). Stress 3 (primary-stress-22, 44 days) impacts community 3 (Compact Cluster). Stress 4 (adaptive-stress-23, 52 days) affects community 4 (Legacy Review D). The direct one-to-one mapping indicates that each community faces a distinct hydrological stress profile, with stress duration increasing from 28 to 52 days across the community sequence. This view enables vulnerability assessments that rank communities by their exposure to prolonged hydrological stress.

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

This join connects hydrological stresses to their territorial contexts, enabling spatial analysis of stress distribution. Stress 1 (compact-stress-20) occurs within territory 1000 (Regional Initiative), a 1.52-square-unit adaptive-dominant-29 region. Stress 2 (composite-stress-21) affects territory 1001 (Seasonal Model D), a 0.65-square-unit distributed-dominant-30 ecosystem. Stress 3 (primary-stress-22) impacts territory 1002 (Integrated Cluster), the smallest at 0.43 square units under baseline-dominant-31 classification. Stress 4 (adaptive-stress-23) occurs in territory 1003 (Extended Review), a 0.60-square-unit pilot-dominant-32 zone. The view supports geographic prioritization of water management investments based on the severity and territorial extent of hydrological stress events.

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

This view presents hydrological stresses as the primary entity, joined with the water management practices deployed in response. Stress 1 (compact-stress-20) is managed by practice 1000 (Seasonal Survey), a compact-conserva-68 approach from compact-historic-26 with legacy-effectiv-73 effectiveness. Stress 2 (composite-stress-21) is addressed by practice 1001 (Integrated Corridor), applying composite-conserva-69 conservation from composite-historic-27 with compact-effectiv-74 results. Stress 3 (primary-stress-22) is countered by practice 1002 (Extended Series D), a primary-conserva-70 practice from primary-historic-28 reaching composite-effectiv-75 effectiveness. Stress 4 (adaptive-stress-23) is managed by practice 1003 (Pilot Assessment), an adaptive-conserva-71 protocol from adaptive-historic-29 achieving primary-effectiv-76 effectiveness. This perspective is essential for evaluating whether the conservation level and historical period of a management practice are appropriately matched to the severity and duration of the hydrological stress it addresses.

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

This view presents alternative livelihoods as the primary entity, joined with their originating pastoral communities. Baseline-liveliho-37 (adoption rate 7.20, integrated-primary-22 drivers, composite-sustaina-75 sustainability) originates from pastoral community 1 (Primary Initiative A). Pilot-liveliho-38 (9.40 adoption, seasonal-primary-23 drivers, primary-sustaina-76 sustainability) comes from community 2 (Composite Model). Extended-liveliho-39 (11.60 adoption, regional-primary-24 drivers, adaptive-sustaina-77 sustainability) is associated with community 3 (Compact Cluster). Integrated-liveliho-40 (13.80 adoption, legacy-primary-25 drivers, distributed-sustaina-78 sustainability) originates from community 4 (Legacy Review D). The view enables economic planners to assess whether livelihood adoption rates and sustainability ratings correlate with community characteristics such as historical presence or primary livelihood type.

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

This final view connects alternative livelihoods to the well-watered places they are associated with, revealing the relationship between water infrastructure and economic diversification. Baseline-liveliho-37 (adoption rate 7.20) is linked to well-watered place 1 (Distributed Cluster, compact-water-92 source, integrated-reliabil-40 reliability). Pilot-liveliho-38 (9.40 adoption) connects to place 2 (Adaptive Review D, composite-water-93 source, seasonal-reliabil-41 reliability). Extended-liveliho-39 (11.60 adoption) is associated with place 3 (Primary Initiative, primary-water-94 source, regional-reliabil-42 reliability). Integrated-liveliho-40 (13.80 adoption) links to place 4 (Composite Model, adaptive-water-95 source, legacy-reliabil-43 reliability). The positive correlation between water source reliability and livelihood adoption rate suggests that communities with more reliable water access may be better positioned to develop and sustain alternative economic strategies.

## Synthesis

The pastoral systems domain reveals a tightly coupled network of communities, territories, water infrastructure, management practices, environmental stresses, and economic adaptations. Each entity in the data serves as both a subject and a connector, with foreign keys establishing relationships that support multiple analytical perspectives. The six base tables capture the fundamental records of pastoral life, while the fifteen views provide distinct lenses for examining how these records interrelate. Whether analyzing which communities face the most severe hydrological stress, which territories have the most reliable water infrastructure, or which management practices achieve the highest effectiveness, the domain's structure supports comprehensive operational decision-making. The consistent one-to-one mappings observed in this dataset suggest a highly organized system, though the view architecture remains flexible enough to accommodate more complex many-to-many relationships as the domain evolves.