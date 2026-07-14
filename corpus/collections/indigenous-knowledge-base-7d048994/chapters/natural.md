## Foundations of Community Risk Reduction

Community risk reduction operates at the intersection of environmental hazard exposure, local knowledge systems, and structured intervention strategies. Practitioners in this domain manage records that capture how communities experience hazards, what knowledge informs their preparedness, and which strategies are deployed to reduce risk. The data model underlying this work organizes information around five core entities: indigenous knowledge bases, scientific knowledge bases, communities, risk reduction strategies, and environmental hazards, with a junction table linking communities to the strategies they employ. Each entity carries identifiers, descriptive attributes, and cross-references that together support queries about which knowledge sources inform which strategies, which communities face which hazards, and how integration between knowledge systems correlates with implementation outcomes.

**Table `indigenous_knowledge_bases`**

| knowledge_base_id | community_name | region | primary_hazard_type | transmission_mode | last_verified_date | is_integrated | community_id | strategy_id | interacts_with_knowledge_base_id |
|---|---|---|---|---|---|---|---|---|---|
| 220 | Primary Initiative A | distributed-region-12 | tsunami | oral_tradition | 2024-11-16T10:42:00 | true | 1 | 392481 | 220 |
| 5844261 | Composite Model | baseline-region-13 | volcanic_ash | ritual_practice | 2025-04-27T17:59:00 | false | 2 | 24897677 | 5844261 |
| flexible-thinking | Compact Cluster | pilot-region-14 | landslide | landmark_based | 2022-09-11T00:16:00 | true | 3 | 9736901 | flexible-thinking |
| 727060 | Legacy Review D | extended-region-15 | cyclone | kinship_network | 2023-02-22T07:33:00 | false | 4 | 25893422 | 727060 |

Indigenous knowledge bases document the traditional knowledge systems that communities rely upon for hazard awareness and response. Each record carries a `knowledge_base_id` that serves as the primary key, a `community_name` identifying the originating group, and a `region` describing the geographic scope of the knowledge. The `primary_hazard_type` field captures the dominant environmental threat the knowledge addresses—values in the data include `tsunami`, `volcanic_ash`, `landslide`, and `cyclone`. Transmission mode, recorded in the `transmission_mode` column, describes how knowledge is passed between generations: `oral_tradition`, `ritual_practice`, `landmark_based`, and `kinship_network` appear across the records. The `last_verified_date` timestamp indicates when the knowledge was last validated, while `is_integrated` flags whether this indigenous knowledge has been formally integrated with scientific approaches. The `community_id` and `strategy_id` columns link each knowledge base to its originating community and associated strategy, and `interacts_with_knowledge_base_id` enables self-referential links between knowledge bases.

**Table `scientific_knowledge_bases`**

| knowledge_base_id | data_source | model_type | resolution | last_updated | validation_status | community_id | strategy_id | interacts_with_knowledge_base_id |
|---|---|---|---|---|---|---|---|---|
| 220 | satellite_imagery | probabilistic_hazard | high | 2023-06-17T17:27:00 | peer_reviewed | 1 | 392481 | 220 |
| 5844261 | seismic_monitoring | vulnerability_index | medium | 2024-11-01T00:44:00 | preliminary | 2 | 24897677 | 5844261 |
| flexible-thinking | historical_records | exposure_map | low | 2025-04-12T07:01:00 | field_validated | 3 | 9736901 | flexible-thinking |
| 727060 | field_survey | risk_matrix | high | 2022-09-23T14:18:00 | peer_reviewed | 4 | 25893422 | 727060 |

Scientific knowledge bases parallel the indigenous records but capture data-driven knowledge systems. The `data_source` column distinguishes between `satellite_imagery`, `seismic_monitoring`, `historical_records`, and `field_survey` as the origins of the knowledge. Model types range from `probabilistic_hazard` and `vulnerability_index` to `exposure_map` and `risk_matrix`, reflecting different analytical approaches. Resolution is categorized as `high`, `medium`, or `low`, and `validation_status` records whether a model is `peer_reviewed`, `preliminary`, or `field_validated`. Like their indigenous counterparts, scientific knowledge bases carry `community_id`, `strategy_id`, and `interacts_with_knowledge_base_id` foreign keys that anchor them to the same operational context.

**Table `communities`**

| id | community_id | community_name | province | population | island_group | primary_livelihood | vulnerability_level | knowledge_base_id | hosts_scientific_assessment_knowledge_base_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 325466 | Primary Initiative A | baseline-province-67 | 42 | composite-island-45 | subsistence_agriculture | high | 220 | 220 |
| 2 | 5082990 | Composite Model | pilot-province-68 | 49 | primary-island-46 | fishing | medium | 5844261 | 5844261 |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | extended-province-69 | 56 | adaptive-island-47 | mixed | low | flexible-thinking | flexible-thinking |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | integrated-province-70 | 63 | distributed-island-48 | subsistence_agriculture | high | 727060 | 727060 |

Communities represent the human populations at the center of risk reduction efforts. The `id` column provides the primary key, while `community_id` and `community_name` offer secondary identifiers and human-readable labels such as "Primary Initiative A," "Composite Model," "Compact Cluster," and "Legacy Review D." Geographic context comes from `province` (e.g., `baseline-province-67`, `pilot-province-68`), `island_group` (e.g., `composite-island-45`, `primary-island-46`), and `primary_livelihood` (e.g., `subsistence_agriculture`, `fishing`, `mixed`). Population figures are modest—values of 42, 49, 56, and 63 suggest small-scale settlements. The `vulnerability_level` column classifies each community as `high`, `medium`, or `low`, and the `knowledge_base_id` and `hosts_scientific_assessment_knowledge_base_id` columns link each community to its primary indigenous and scientific knowledge bases respectively.

**Table `risk_reduction_strategies`**

| strategy_id | strategy_name | integration_level | implementation_status | target_hazard | start_date | end_date | community_id | knowledge_base_id | draws_from_scientific_knowledge_knowledge_base_id |
|---|---|---|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | full | planned | tsunami | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 220 | 220 |
| 24897677 | Extended Protocol | partial | piloting | volcanic_ash | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 5844261 | 5844261 |
| 9736901 | Pilot Programme | consultative | active | landslide | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | flexible-thinking | flexible-thinking |
| 25893422 | Baseline Standard D | full | evaluated | cyclone | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 727060 | 727060 |

Risk reduction strategies are the structured interventions designed to mitigate hazard exposure. Each strategy carries a `strategy_id`, a `strategy_name` such as "Integrated Framework A," "Extended Protocol," "Pilot Programme," or "Baseline Standard D," and an `integration_level` that describes how deeply indigenous and scientific knowledge are combined—values include `full`, `partial`, and `consultative`. The `implementation_status` column tracks progress through stages: `planned`, `piloting`, `active`, and `evaluated`. The `target_hazard` field specifies which environmental threat the strategy addresses, while `start_date` and `end_date` define the implementation window. Foreign keys `community_id` and `knowledge_base_id` anchor each strategy to its originating community and knowledge base, and `draws_from_scientific_knowledge_knowledge_base_id` indicates which scientific knowledge base informs the strategy.

**Table `environmental_hazards`**

| hazard_id | hazard_type | frequency | magnitude | affected_area | last_occurrence | community_id | knowledge_base_id |
|---|---|---|---|---|---|---|---|
| 3012829 | tsunami | annual | 11.70 | extended-affected-15 | 2023-06-26T05:03:00 | 1 | 220 |
| 103167 | volcanic_ash | decadal | 14.40 | integrated-affected-16 | 2024-11-10T12:20:00 | 2 | 5844261 |
| pgc_pyme_551 | landslide | centennial | 17.10 | seasonal-affected-17 | 2025-04-21T19:37:00 | 3 | flexible-thinking |
| 3012826 | cyclone | rare | 19.80 | regional-affected-18 | 2022-09-05T02:54:00 | 4 | 727060 |

Environmental hazards represent the physical threats that communities face. The `hazard_id` serves as the primary key, and `hazard_type` mirrors the values found in the knowledge base tables: `tsunami`, `volcanic_ash`, `landslide`, and `cyclone`. The `frequency` column classifies how often each hazard occurs—`annual`, `decadal`, `centennial`, and `rare`—while `magnitude` provides a numeric severity score ranging from 11.70 for tsunamis to 19.80 for cyclones in the current data. The `affected_area` field describes the geographic scope of impact, and `last_occurrence` records the most recent event timestamp. Each hazard record links to a `community_id` and `knowledge_base_id`, establishing which community and knowledge system are associated with each hazard.

**Table `communities_strategies`**

| community_id | strategy_id |
|---|---|
| 1 | 392481 |
| 1 | 24897677 |
| 2 | 24897677 |
| 2 | 9736901 |
| 3 | 9736901 |
| 3 | 25893422 |
| 4 | 25893422 |
| 4 | 392481 |

The `communities_strategies` table functions as a many-to-many junction, allowing communities to be associated with multiple strategies and vice versa. In the current data, community 1 is linked to strategies 392481 and 24897677, community 2 to 24897677 and 9736901, community 3 to 9736901 and 25893422, and community 4 to 25893422 and 392481. This cross-wiring means that strategies are not siloed to single communities; for example, strategy 392481 (Integrated Framework A) serves both community 1 and community 4, while strategy 24897677 (Extended Protocol) serves communities 1 and 2.

## Indigenous Knowledge in Community Context

The relationship between indigenous knowledge bases and the communities that generate them is captured through direct foreign key links and through analytical views that join the two tables. The view `v_indigenous_knowledge_base_community` answers the question of which indigenous knowledge systems are associated with which communities, combining the `knowledge_base_id`, `community_name`, `region`, and `primary_hazard_type` from the knowledge base table with the community identifiers and attributes. In the data, the record for knowledge base 220 ("Primary Initiative A" in `distributed-region-12`, focused on `tsunami` via `oral_tradition`) joins with community 1 ("Primary Initiative A" in `baseline-province-67` with a population of 42 and `high` vulnerability), demonstrating a one-to-one alignment between the knowledge base and its originating community. Similarly, knowledge base `flexible-thinking` ("Compact Cluster" in `pilot-region-14`, addressing `landslide` through `landmark_based` transmission) links to community 3 ("Compact Cluster" in `extended-province-69`, population 56, `low` vulnerability).

The complementary view `v_community_indigenous_knowledge_base` presents the same relationship from the community's perspective, starting with community records and joining to their associated indigenous knowledge bases. This orientation is useful when a practitioner begins with a community profile and needs to identify what traditional knowledge systems are available. Community 4 ("Legacy Review D", population 63, `high` vulnerability, `subsistence_agriculture` livelihood) joins to knowledge base 727060 ("Legacy Review D" in `extended-region-15`, addressing `cyclone` through `kinship_network` transmission, last verified on 2023-02-22). The `is_integrated` flag is `false` for this record, indicating that this particular indigenous knowledge system has not been formally integrated with scientific approaches.

## Scientific Knowledge and Community Linkages

Scientific knowledge bases connect to communities through the same structural pattern. The view `v_scientific_knowledge_base_community` joins the scientific knowledge base table to the communities table, enabling practitioners to see which scientific models and data sources are associated with which populations. Knowledge base 220 in the scientific table uses `satellite_imagery` as its data source, employs a `probabilistic_hazard` model at `high` resolution, and holds `peer_reviewed` validation status. It links to community 1, the same community that hosts the corresponding indigenous knowledge base. Knowledge base `flexible-thinking` draws from `historical_records`, produces an `exposure_map` at `low` resolution with `field_validated` status, and connects to community 3.

The view `v_community_scientific_knowledge_base` reverses this perspective, starting from communities and identifying their associated scientific knowledge bases. Community 2 ("Composite Model", population 49, `medium` vulnerability, `fishing` livelihood) joins to scientific knowledge base 5844261, which uses `seismic_monitoring` data, applies a `vulnerability_index` model at `medium` resolution, and carries `preliminary` validation status. This pairing suggests that the community's fishing livelihood and medium vulnerability profile are addressed by a still-developing scientific assessment.

## Strategies and Their Knowledge Foundations

Risk reduction strategies are informed by both indigenous and scientific knowledge bases, and the views that connect strategies to knowledge systems reveal the integration patterns that practitioners need to understand. The view `v_indigenous_knowledge_base_risk_reduction_strategy` joins indigenous knowledge bases to the strategies that draw upon them. Strategy 392481 ("Integrated Framework A", `full` integration level, `planned` status, targeting `tsunami`) links to indigenous knowledge base 220, which addresses `tsunami` through `oral_tradition` and is marked as `is_integrated = true`. This alignment between the strategy's target hazard and the knowledge base's primary hazard type, combined with the full integration level, suggests a well-coordinated approach. Strategy 9736901 ("Pilot Programme", `consultative` integration, `active` status, targeting `landslide") connects to knowledge base `flexible-thinking`, which addresses `landslide` through `landmark_based` transmission.

The view `v_scientific_knowledge_base_risk_reduction_strategy` performs the same join for scientific knowledge bases. Strategy 24897677 ("Extended Protocol", `partial` integration, `piloting` status, targeting `volcanic_ash") links to scientific knowledge base 5844261, which uses `seismic_monitoring` and a `vulnerability_index` model. The `partial` integration level and `piloting` status indicate that this strategy is still developing its knowledge foundations. Strategy 25893422 ("Baseline Standard D", `full` integration, `evaluated` status, targeting `cyclone") connects to scientific knowledge base 727060, which uses `field_survey` data, a `risk_matrix` model at `high` resolution, and holds `peer_reviewed` status.

The cross-knowledge view `v_indigenous_knowledge_base_scientific_knowledge_base` reveals whether indigenous and scientific knowledge bases are paired within the same operational context. In the data, each indigenous knowledge base has a corresponding scientific knowledge base with the same `knowledge_base_id`: 220 pairs with 220, 5844261 with 5844261, `flexible-thinking` with `flexible-thinking`, and 727060 with 727060. This one-to-one correspondence suggests a deliberate design in which each community's traditional knowledge is accompanied by a scientific assessment.

The reverse perspective is provided by `v_scientific_knowledge_base_indigenous_knowledge_base`, which starts from scientific knowledge bases and identifies their indigenous counterparts. The same pairings emerge: scientific knowledge base 220 (using `satellite_imagery`, `probabilistic_hazard` model) pairs with indigenous knowledge base 220 (`oral_tradition`, `tsunami` focus), and scientific knowledge base `flexible-thinking` (`historical_records`, `exposure_map`) pairs with indigenous knowledge base `flexible-thinking` (`landmark_based`, `landslide` focus).

## Strategy-Community Relationships

The view `v_risk_reduction_strategy_community` joins risk reduction strategies to the communities they serve, answering which strategies are deployed in which communities. Strategy 392481 ("Integrated Framework A", `full` integration, `planned` status) serves community 1 ("Primary Initiative A", population 42, `high` vulnerability). Strategy 24897677 ("Extended Protocol", `partial` integration, `piloting") serves community 2 ("Composite Model", population 49, `medium` vulnerability). The junction table `communities_strategies` explains why some strategies serve multiple communities: strategy 392481 appears in the junction for both community 1 and community 4, meaning that the "Integrated Framework A" strategy is deployed across two communities with different vulnerability profiles—one `high` and one `high`—suggesting that this strategy may be particularly suited to high-vulnerability settlements.

The view `v_community_risk_reduction_strategy_detail` provides the same join from the community's perspective, enriched with additional detail. Community 1 is associated with strategies 392481 and 24897677, giving it access to both a `full`-integration strategy targeting `tsunami` and a `partial`-integration strategy targeting `volcanic_ash`. Community 3, with `low` vulnerability, is linked to strategies 9736901 (`consultative` integration, `active`, targeting `landslide`) and 25893422 (`full` integration, `evaluated`, targeting `cyclone`). The presence of an `evaluated` strategy in community 3's portfolio suggests that this community may have completed a full cycle of strategy implementation and assessment.

## Hazard-Community and Hazard-Knowledge Associations

Environmental hazards are linked to both communities and knowledge bases, and the views that expose these relationships help practitioners understand which knowledge systems are relevant to which hazard exposures. The view `v_environmental_hazard_community` joins environmental hazards to the communities they affect. Hazard 3012829 (`tsunami`, `annual` frequency, magnitude 11.70, last occurring on 2023-06-26) affects community 1 ("Primary Initiative A"). Hazard 103167 (`volcanic_ash`, `decadal` frequency, magnitude 14.40, last occurring on 2024-11-10) affects community 2. Hazard `pgc_pyme_551` (`landslide`, `centennial` frequency, magnitude 17.10, last occurring on 2025-04-21) affects community 3. Hazard 3012826 (`cyclone`, `rare` frequency, magnitude 19.80, last occurring on 2022-09-05) affects community 4. The magnitude values increase from tsunami (11.70) to cyclone (19.80), while frequency decreases from `annual` to `rare`, suggesting an inverse relationship between how often a hazard occurs and how severe its impacts are.

The view `v_environmental_hazard_scientific_knowledge_base` connects hazards to the scientific knowledge bases that model or monitor them. Tsunami hazard 3012829 links to scientific knowledge base 220 (`probabilistic_hazard` model, `high` resolution). Volcanic ash hazard 103167 links to scientific knowledge base 5844261 (`vulnerability_index` model, `medium` resolution). Landslide hazard `pgc_pyme_551` links to scientific knowledge base `flexible-thinking` (`exposure_map` model, `low` resolution). Cyclone hazard 3012826 links to scientific knowledge base 727060 (`risk_matrix` model, `high` resolution). The resolution of the scientific model does not consistently track with hazard magnitude—both the lower-magnitude tsunami and the higher-magnitude cyclone are addressed by `high`-resolution models, while the `medium`-magnitude volcanic ash and `centennial`-frequency landslide receive `medium` and `low` resolution models respectively.

## Synthesis

The data model for community risk reduction organizes knowledge, communities, strategies, and hazards into a coherent relational structure. Indigenous knowledge bases and scientific knowledge bases each carry identifiers, descriptive attributes, and foreign keys that anchor them to communities and strategies. Communities are characterized by their geographic location, population, livelihood, and vulnerability level. Risk reduction strategies specify their integration level, implementation status, and target hazards. Environmental hazards quantify frequency, magnitude, and temporal patterns. The junction table `communities_strategies` enables flexible many-to-many relationships between communities and strategies, while the views provide pre-joined perspectives that answer common analytical questions: which knowledge bases serve which communities, which strategies draw upon which knowledge systems, and which hazards affect which populations. The records in the data show a consistent pattern of one-to-one alignment between indigenous and scientific knowledge bases within each community context, with strategies varying in their integration levels from `consultative` to `full` and their implementation statuses from `planned` to `evaluated`.

## Data appendix

**View `v_indigenous_knowledge_base_community`**

```sql
CREATE VIEW v_indigenous_knowledge_base_community AS
SELECT a.knowledge_base_id, a.community_name, a.region, a.primary_hazard_type, b.id AS community_id, b.community_id AS community_community_id, b.community_name AS community_community_name
FROM indigenous_knowledge_bases a JOIN communities b ON a.community_id = b.id;
```

| knowledge_base_id | community_name | region | primary_hazard_type | community_id | community_community_id | community_community_name |
|---|---|---|---|---|---|---|
| 220 | Primary Initiative A | distributed-region-12 | tsunami | 1 | 325466 | Primary Initiative A |
| 5844261 | Composite Model | baseline-region-13 | volcanic_ash | 2 | 5082990 | Composite Model |
| flexible-thinking | Compact Cluster | pilot-region-14 | landslide | 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster |
| 727060 | Legacy Review D | extended-region-15 | cyclone | 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D |

**View `v_indigenous_knowledge_base_risk_reduction_strategy`**

```sql
CREATE VIEW v_indigenous_knowledge_base_risk_reduction_strategy AS
SELECT a.knowledge_base_id, a.community_name, a.region, a.primary_hazard_type, b.strategy_id AS strategy_strategy_id, b.strategy_name AS strategy_strategy_name, b.integration_level AS strategy_integration_level
FROM indigenous_knowledge_bases a JOIN risk_reduction_strategies b ON a.strategy_id = b.strategy_id;
```

| knowledge_base_id | community_name | region | primary_hazard_type | strategy_strategy_id | strategy_strategy_name | strategy_integration_level |
|---|---|---|---|---|---|---|
| 220 | Primary Initiative A | distributed-region-12 | tsunami | 392481 | Integrated Framework A | full |
| 5844261 | Composite Model | baseline-region-13 | volcanic_ash | 24897677 | Extended Protocol | partial |
| flexible-thinking | Compact Cluster | pilot-region-14 | landslide | 9736901 | Pilot Programme | consultative |
| 727060 | Legacy Review D | extended-region-15 | cyclone | 25893422 | Baseline Standard D | full |

**View `v_indigenous_knowledge_base_scientific_knowledge_base`**

```sql
CREATE VIEW v_indigenous_knowledge_base_scientific_knowledge_base AS
SELECT a.knowledge_base_id, a.community_name, a.region, a.primary_hazard_type, b.knowledge_base_id AS base_knowledge_base_id, b.data_source AS base_data_source, b.model_type AS base_model_type
FROM indigenous_knowledge_bases a JOIN scientific_knowledge_bases b ON a.interacts_with_knowledge_base_id = b.knowledge_base_id;
```

| knowledge_base_id | community_name | region | primary_hazard_type | base_knowledge_base_id | base_data_source | base_model_type |
|---|---|---|---|---|---|---|
| 220 | Primary Initiative A | distributed-region-12 | tsunami | 220 | satellite_imagery | probabilistic_hazard |
| 5844261 | Composite Model | baseline-region-13 | volcanic_ash | 5844261 | seismic_monitoring | vulnerability_index |
| flexible-thinking | Compact Cluster | pilot-region-14 | landslide | flexible-thinking | historical_records | exposure_map |
| 727060 | Legacy Review D | extended-region-15 | cyclone | 727060 | field_survey | risk_matrix |

**View `v_scientific_knowledge_base_community`**

```sql
CREATE VIEW v_scientific_knowledge_base_community AS
SELECT a.knowledge_base_id, a.data_source, a.model_type, a.resolution, b.id AS community_id, b.community_id AS community_community_id, b.community_name AS community_community_name
FROM scientific_knowledge_bases a JOIN communities b ON a.community_id = b.id;
```

| knowledge_base_id | data_source | model_type | resolution | community_id | community_community_id | community_community_name |
|---|---|---|---|---|---|---|
| 220 | satellite_imagery | probabilistic_hazard | high | 1 | 325466 | Primary Initiative A |
| 5844261 | seismic_monitoring | vulnerability_index | medium | 2 | 5082990 | Composite Model |
| flexible-thinking | historical_records | exposure_map | low | 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster |
| 727060 | field_survey | risk_matrix | high | 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D |

**View `v_scientific_knowledge_base_risk_reduction_strategy`**

```sql
CREATE VIEW v_scientific_knowledge_base_risk_reduction_strategy AS
SELECT a.knowledge_base_id, a.data_source, a.model_type, a.resolution, b.strategy_id AS strategy_strategy_id, b.strategy_name AS strategy_strategy_name, b.integration_level AS strategy_integration_level
FROM scientific_knowledge_bases a JOIN risk_reduction_strategies b ON a.strategy_id = b.strategy_id;
```

| knowledge_base_id | data_source | model_type | resolution | strategy_strategy_id | strategy_strategy_name | strategy_integration_level |
|---|---|---|---|---|---|---|
| 220 | satellite_imagery | probabilistic_hazard | high | 392481 | Integrated Framework A | full |
| 5844261 | seismic_monitoring | vulnerability_index | medium | 24897677 | Extended Protocol | partial |
| flexible-thinking | historical_records | exposure_map | low | 9736901 | Pilot Programme | consultative |
| 727060 | field_survey | risk_matrix | high | 25893422 | Baseline Standard D | full |

**View `v_scientific_knowledge_base_indigenous_knowledge_base`**

```sql
CREATE VIEW v_scientific_knowledge_base_indigenous_knowledge_base AS
SELECT a.knowledge_base_id, a.data_source, a.model_type, a.resolution, b.knowledge_base_id AS base_knowledge_base_id, b.community_name AS base_community_name, b.region AS base_region
FROM scientific_knowledge_bases a JOIN indigenous_knowledge_bases b ON a.interacts_with_knowledge_base_id = b.knowledge_base_id;
```

| knowledge_base_id | data_source | model_type | resolution | base_knowledge_base_id | base_community_name | base_region |
|---|---|---|---|---|---|---|
| 220 | satellite_imagery | probabilistic_hazard | high | 220 | Primary Initiative A | distributed-region-12 |
| 5844261 | seismic_monitoring | vulnerability_index | medium | 5844261 | Composite Model | baseline-region-13 |
| flexible-thinking | historical_records | exposure_map | low | flexible-thinking | Compact Cluster | pilot-region-14 |
| 727060 | field_survey | risk_matrix | high | 727060 | Legacy Review D | extended-region-15 |

**View `v_community_indigenous_knowledge_base`**

```sql
CREATE VIEW v_community_indigenous_knowledge_base AS
SELECT a.id, a.community_id, a.community_name, a.province, b.knowledge_base_id AS base_knowledge_base_id, b.community_name AS base_community_name, b.region AS base_region
FROM communities a JOIN indigenous_knowledge_bases b ON a.knowledge_base_id = b.knowledge_base_id;
```

| id | community_id | community_name | province | base_knowledge_base_id | base_community_name | base_region |
|---|---|---|---|---|---|---|
| 1 | 325466 | Primary Initiative A | baseline-province-67 | 220 | Primary Initiative A | distributed-region-12 |
| 2 | 5082990 | Composite Model | pilot-province-68 | 5844261 | Composite Model | baseline-region-13 |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | extended-province-69 | flexible-thinking | Compact Cluster | pilot-region-14 |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | integrated-province-70 | 727060 | Legacy Review D | extended-region-15 |

**View `v_community_scientific_knowledge_base`**

```sql
CREATE VIEW v_community_scientific_knowledge_base AS
SELECT a.id, a.community_id, a.community_name, a.province, b.knowledge_base_id AS base_knowledge_base_id, b.data_source AS base_data_source, b.model_type AS base_model_type
FROM communities a JOIN scientific_knowledge_bases b ON a.hosts_scientific_assessment_knowledge_base_id = b.knowledge_base_id;
```

| id | community_id | community_name | province | base_knowledge_base_id | base_data_source | base_model_type |
|---|---|---|---|---|---|---|
| 1 | 325466 | Primary Initiative A | baseline-province-67 | 220 | satellite_imagery | probabilistic_hazard |
| 2 | 5082990 | Composite Model | pilot-province-68 | 5844261 | seismic_monitoring | vulnerability_index |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | extended-province-69 | flexible-thinking | historical_records | exposure_map |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | integrated-province-70 | 727060 | field_survey | risk_matrix |

**View `v_community_risk_reduction_strategy_detail`**

```sql
CREATE VIEW v_community_risk_reduction_strategy_detail AS
SELECT a.id, a.community_id, a.community_name, b.strategy_id AS strategy_strategy_id, b.strategy_name AS strategy_strategy_name, b.integration_level AS strategy_integration_level
FROM communities a
  JOIN communities_strategies j ON j.community_id = a.id
  JOIN risk_reduction_strategies b ON b.strategy_id = j.strategy_id;
```

| id | community_id | community_name | strategy_strategy_id | strategy_strategy_name | strategy_integration_level |
|---|---|---|---|---|---|
| 1 | 325466 | Primary Initiative A | 392481 | Integrated Framework A | full |
| 1 | 325466 | Primary Initiative A | 24897677 | Extended Protocol | partial |
| 2 | 5082990 | Composite Model | 24897677 | Extended Protocol | partial |
| 2 | 5082990 | Composite Model | 9736901 | Pilot Programme | consultative |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | 9736901 | Pilot Programme | consultative |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | 25893422 | Baseline Standard D | full |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | 25893422 | Baseline Standard D | full |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | 392481 | Integrated Framework A | full |

**View `v_risk_reduction_strategy_community`**

```sql
CREATE VIEW v_risk_reduction_strategy_community AS
SELECT a.strategy_id, a.strategy_name, a.integration_level, a.implementation_status, b.id AS community_id, b.community_id AS community_community_id, b.community_name AS community_community_name
FROM risk_reduction_strategies a JOIN communities b ON a.community_id = b.id;
```

| strategy_id | strategy_name | integration_level | implementation_status | community_id | community_community_id | community_community_name |
|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | full | planned | 1 | 325466 | Primary Initiative A |
| 24897677 | Extended Protocol | partial | piloting | 2 | 5082990 | Composite Model |
| 9736901 | Pilot Programme | consultative | active | 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster |
| 25893422 | Baseline Standard D | full | evaluated | 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D |

**View `v_risk_reduction_strategy_indigenous_knowledge_base`**

```sql
CREATE VIEW v_risk_reduction_strategy_indigenous_knowledge_base AS
SELECT a.strategy_id, a.strategy_name, a.integration_level, a.implementation_status, b.knowledge_base_id AS base_knowledge_base_id, b.community_name AS base_community_name, b.region AS base_region
FROM risk_reduction_strategies a JOIN indigenous_knowledge_bases b ON a.knowledge_base_id = b.knowledge_base_id;
```

| strategy_id | strategy_name | integration_level | implementation_status | base_knowledge_base_id | base_community_name | base_region |
|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | full | planned | 220 | Primary Initiative A | distributed-region-12 |
| 24897677 | Extended Protocol | partial | piloting | 5844261 | Composite Model | baseline-region-13 |
| 9736901 | Pilot Programme | consultative | active | flexible-thinking | Compact Cluster | pilot-region-14 |
| 25893422 | Baseline Standard D | full | evaluated | 727060 | Legacy Review D | extended-region-15 |

**View `v_risk_reduction_strategy_scientific_knowledge_base`**

```sql
CREATE VIEW v_risk_reduction_strategy_scientific_knowledge_base AS
SELECT a.strategy_id, a.strategy_name, a.integration_level, a.implementation_status, b.knowledge_base_id AS base_knowledge_base_id, b.data_source AS base_data_source, b.model_type AS base_model_type
FROM risk_reduction_strategies a JOIN scientific_knowledge_bases b ON a.draws_from_scientific_knowledge_knowledge_base_id = b.knowledge_base_id;
```

| strategy_id | strategy_name | integration_level | implementation_status | base_knowledge_base_id | base_data_source | base_model_type |
|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | full | planned | 220 | satellite_imagery | probabilistic_hazard |
| 24897677 | Extended Protocol | partial | piloting | 5844261 | seismic_monitoring | vulnerability_index |
| 9736901 | Pilot Programme | consultative | active | flexible-thinking | historical_records | exposure_map |
| 25893422 | Baseline Standard D | full | evaluated | 727060 | field_survey | risk_matrix |

**View `v_environmental_hazard_community`**

```sql
CREATE VIEW v_environmental_hazard_community AS
SELECT a.hazard_id, a.hazard_type, a.frequency, a.magnitude, b.id AS community_id, b.community_id AS community_community_id, b.community_name AS community_community_name
FROM environmental_hazards a JOIN communities b ON a.community_id = b.id;
```

| hazard_id | hazard_type | frequency | magnitude | community_id | community_community_id | community_community_name |
|---|---|---|---|---|---|---|
| 3012829 | tsunami | annual | 11.70 | 1 | 325466 | Primary Initiative A |
| 103167 | volcanic_ash | decadal | 14.40 | 2 | 5082990 | Composite Model |
| pgc_pyme_551 | landslide | centennial | 17.10 | 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster |
| 3012826 | cyclone | rare | 19.80 | 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D |

**View `v_environmental_hazard_scientific_knowledge_base`**

```sql
CREATE VIEW v_environmental_hazard_scientific_knowledge_base AS
SELECT a.hazard_id, a.hazard_type, a.frequency, a.magnitude, b.knowledge_base_id AS base_knowledge_base_id, b.data_source AS base_data_source, b.model_type AS base_model_type
FROM environmental_hazards a JOIN scientific_knowledge_bases b ON a.knowledge_base_id = b.knowledge_base_id;
```

| hazard_id | hazard_type | frequency | magnitude | base_knowledge_base_id | base_data_source | base_model_type |
|---|---|---|---|---|---|---|
| 3012829 | tsunami | annual | 11.70 | 220 | satellite_imagery | probabilistic_hazard |
| 103167 | volcanic_ash | decadal | 14.40 | 5844261 | seismic_monitoring | vulnerability_index |
| pgc_pyme_551 | landslide | centennial | 17.10 | flexible-thinking | historical_records | exposure_map |
| 3012826 | cyclone | rare | 19.80 | 727060 | field_survey | risk_matrix |
