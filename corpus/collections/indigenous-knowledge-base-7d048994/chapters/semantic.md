## Ontology-Grounded Relational Modelling of Disaster Risk Knowledge

The domain under examination concerns the governance of disaster risk reduction across communities that draw upon two distinct epistemic traditions—indigenous knowledge and scientific knowledge—while being exposed to environmental hazards and managed through formal risk reduction strategies. The relational schema captures this landscape as a network of five core entity types and one associative junction, each materialized as a normalized table whose columns encode attributes and whose foreign keys encode cardinality-bounded relationships. The views then reassemble these normalized pieces into domain-level facts suitable for analytical consumption.

### Indigenous Knowledge Bases

The `indigenous_knowledge_bases` table anchors the indigenous epistemic tradition. Its primary key, `knowledge_base_id`, accommodates both integer identifiers (220, 5844261, 727060) and string identifiers (flexible-thinking), reflecting the flexibility of community-named knowledge repositories. The column `community_name` carries values such as Primary Initiative A and Compact Cluster, while `region` situates each knowledge base geographically (distributed-region-12, baseline-region-13, pilot-region-14, extended-region-15). The `primary_hazard_type` column enumerates the hazard each knowledge base is oriented toward—tsunami, volcanic_ash, landslide, cyclone—and `transmission_mode` records how the knowledge is passed down: oral_tradition, ritual_practice, landmark_based, kinship_network. A `last_verified_date` timestamp (e.g., 2024-11-16T10:42:00) and a boolean `is_integrated` flag (true or false) provide operational metadata.

Foreign keys in this table bind it to other entities. The `community_id` column references the `communities` table, linking each knowledge base to the community that maintains it. The `strategy_id` column references `risk_reduction_strategies`, indicating which risk reduction strategy the knowledge base supports. The self-referential `interacts_with_knowledge_base_id` column enables knowledge bases to reference one another, as seen when row 220 points to itself and row 5844261 similarly references itself, suggesting a pattern of self-referential anchoring or peer linkage within the indigenous knowledge graph.

**Table `indigenous_knowledge_bases`**

| knowledge_base_id | community_name | region | primary_hazard_type | transmission_mode | last_verified_date | is_integrated | community_id | strategy_id | interacts_with_knowledge_base_id |
|---|---|---|---|---|---|---|---|---|---|
| 220 | Primary Initiative A | distributed-region-12 | tsunami | oral_tradition | 2024-11-16T10:42:00 | true | 1 | 392481 | 220 |
| 5844261 | Composite Model | baseline-region-13 | volcanic_ash | ritual_practice | 2025-04-27T17:59:00 | false | 2 | 24897677 | 5844261 |
| flexible-thinking | Compact Cluster | pilot-region-14 | landslide | landmark_based | 2022-09-11T00:16:00 | true | 3 | 9736901 | flexible-thinking |
| 727060 | Legacy Review D | extended-region-15 | cyclone | kinship_network | 2023-02-22T07:33:00 | false | 4 | 25893422 | 727060 |

### Scientific Knowledge Bases

The `scientific_knowledge_bases` table mirrors the structure of its indigenous counterpart but encodes scientific attributes. Its `knowledge_base_id` primary key uses the same dual-type convention (integers and strings like flexible-thinking). The `data_source` column distinguishes between satellite_imagery, seismic_monitoring, historical_records, and field_survey. The `model_type` column carries probabilistic_hazard, vulnerability_index, exposure_map, and risk_matrix, while `resolution` takes the values high, medium, or low. The `last_updated` timestamp and `validation_status` column (peer_reviewed, preliminary, field_validated) provide provenance and quality signals.

The foreign keys `community_id`, `strategy_id`, and `interacts_with_knowledge_base_id` parallel those in the indigenous table, establishing the same tripartite relationship pattern: each scientific knowledge base is maintained by a community, supports a risk reduction strategy, and optionally references another knowledge base. For instance, the knowledge base with id 220 draws from satellite_imagery, uses a probabilistic_hazard model at high resolution, and has peer_reviewed validation status, while the flexible-thinking knowledge base relies on historical_records with an exposure_map model at low resolution and field_validated status.

**Table `scientific_knowledge_bases`**

| knowledge_base_id | data_source | model_type | resolution | last_updated | validation_status | community_id | strategy_id | interacts_with_knowledge_base_id |
|---|---|---|---|---|---|---|---|---|
| 220 | satellite_imagery | probabilistic_hazard | high | 2023-06-17T17:27:00 | peer_reviewed | 1 | 392481 | 220 |
| 5844261 | seismic_monitoring | vulnerability_index | medium | 2024-11-01T00:44:00 | preliminary | 2 | 24897677 | 5844261 |
| flexible-thinking | historical_records | exposure_map | low | 2025-04-12T07:01:00 | field_validated | 3 | 9736901 | flexible-thinking |
| 727060 | field_survey | risk_matrix | high | 2022-09-23T14:18:00 | peer_reviewed | 4 | 25893422 | 727060 |

### Communities

The `communities` table is the central hub of the schema. Its surrogate primary key `id` uses both integer values (1, 2, 3, 4) and UUIDs (dce14308-8fba-11eb-924d-9cd76263cbd0, d9d981b8-8fcc-11eb-924d-9cd76263cbd0). The `community_id` column carries distinct identifiers (325466, 5082990, dce14308-8fba-11eb-924d-9cd76263cbd0, d9d981b8-8fcc-11eb-924d-9cd76263cbd0), while `community_name` repeats values seen in the knowledge base tables (Primary Initiative A, Composite Model, Compact Cluster, Legacy Review D), confirming that community names are shared across entity types. The `province` column (baseline-province-67, pilot-province-68, extended-province-69, integrated-province-70) and `island_group` column (composite-island-45, primary-island-46, adaptive-island-47, distributed-island-48) provide geographic context.

Demographic and livelihood attributes include `population` (42, 49, 56, 63), `primary_livelihood` (subsistence_agriculture, fishing, mixed), and `vulnerability_level` (high, medium, low). Two foreign keys complete the table: `knowledge_base_id` links each community to its primary indigenous knowledge base, and `hosts_scientific_assessment_knowledge_base_id` links it to its scientific knowledge base. Community 1 (Primary Initiative A) has a population of 42, practices subsistence_agriculture, and is classified as high vulnerability, while Community 3 (Compact Cluster) has a population of 56, practices mixed livelihoods, and is classified as low vulnerability.

**Table `communities`**

| id | community_id | community_name | province | population | island_group | primary_livelihood | vulnerability_level | knowledge_base_id | hosts_scientific_assessment_knowledge_base_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 325466 | Primary Initiative A | baseline-province-67 | 42 | composite-island-45 | subsistence_agriculture | high | 220 | 220 |
| 2 | 5082990 | Composite Model | pilot-province-68 | 49 | primary-island-46 | fishing | medium | 5844261 | 5844261 |
| 3 | dce14308-8fba-11eb-924d-9cd76263cbd0 | Compact Cluster | extended-province-69 | 56 | adaptive-island-47 | mixed | low | flexible-thinking | flexible-thinking |
| 4 | d9d981b8-8fcc-11eb-924d-9cd76263cbd0 | Legacy Review D | integrated-province-70 | 63 | distributed-island-48 | subsistence_agriculture | high | 727060 | 727060 |

### Risk Reduction Strategies

The `risk_reduction_strategies` table formalizes the intervention layer. Its primary key `strategy_id` uses integer values (392481, 24897677, 9736901, 25893422). The `strategy_name` column carries names such as Integrated Framework A, Extended Protocol, Pilot Programme, and Baseline Standard D. The `integration_level` column takes values full, partial, or consultative, while `implementation_status` records planned, piloting, active, or evaluated. The `target_hazard` column (tsunami, volcanic_ash, landslide, cyclone) aligns with the hazard types found in both knowledge base tables and the environmental hazards table.

Temporal attributes include `start_date` and `end_date`, which for strategy 392481 (Integrated Framework A) span from 2022-09-05T20:24:00 to 2022-09-01T08:00:00. The foreign key `community_id` links each strategy to the community it targets, while `knowledge_base_id` links it to the indigenous knowledge base it draws upon. The column `draws_from_scientific_knowledge_knowledge_base_id` references the scientific knowledge base that informs the strategy, completing a three-way dependency: each strategy is community-specific, indigenous-knowledge-grounded, and scientifically-informed.

**Table `risk_reduction_strategies`**

| strategy_id | strategy_name | integration_level | implementation_status | target_hazard | start_date | end_date | community_id | knowledge_base_id | draws_from_scientific_knowledge_knowledge_base_id |
|---|---|---|---|---|---|---|---|---|---|
| 392481 | Integrated Framework A | full | planned | tsunami | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 220 | 220 |
| 24897677 | Extended Protocol | partial | piloting | volcanic_ash | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 5844261 | 5844261 |
| 9736901 | Pilot Programme | consultative | active | landslide | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | flexible-thinking | flexible-thinking |
| 25893422 | Baseline Standard D | full | evaluated | cyclone | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 727060 | 727060 |

### Environmental Hazards

The `environmental_hazards` table captures the physical risk dimension. Its primary key `hazard_id` uses both integers (3012829, 103167, 3012826) and string identifiers (pgc_pyme_551). The `hazard_type` column enumerates tsunami, volcanic_ash, landslide, and cyclone—values that directly correspond to `primary_hazard_type` in the knowledge base tables and `target_hazard` in the strategies table. The `frequency` column takes annual, decadal, centennial, or rare, while `magnitude` carries floating-point values (11.70, 14.40, 17.10, 19.80). The `affected_area` column (extended-affected-15, integrated-affected-16, seasonal-affected-17, regional-affected-18) and `last_occurrence` timestamp (e.g., 2023-06-26T05:03:00) provide temporal and spatial context.

Two foreign keys bind this table to the rest of the schema: `community_id` links each hazard to the community it affects, and `knowledge_base_id` links it to the knowledge base that documents or monitors it. The tsunami hazard (id 3012829) occurs annually with magnitude 11.70 and last occurred on 2023-06-26, while the cyclone hazard (id 3012826) is classified as rare with magnitude 19.80 and last occurred on 2022-09-05.

**Table `environmental_hazards`**

| hazard_id | hazard_type | frequency | magnitude | affected_area | last_occurrence | community_id | knowledge_base_id |
|---|---|---|---|---|---|---|---|
| 3012829 | tsunami | annual | 11.70 | extended-affected-15 | 2023-06-26T05:03:00 | 1 | 220 |
| 103167 | volcanic_ash | decadal | 14.40 | integrated-affected-16 | 2024-11-10T12:20:00 | 2 | 5844261 |
| pgc_pyme_551 | landslide | centennial | 17.10 | seasonal-affected-17 | 2025-04-21T19:37:00 | 3 | flexible-thinking |
| 3012826 | cyclone | rare | 19.80 | regional-affected-18 | 2022-09-05T02:54:00 | 4 | 727060 |

### Communities-Strategies Junction

The `communities_strategies` table is a pure junction table implementing a many-to-many relationship between communities and risk reduction strategies. Its composite key consists of `community_id` and `strategy_id`. The data reveals that each community participates in exactly two strategies, and each strategy serves exactly two communities, forming a balanced bipartite graph. Community 1 participates in strategies 392481 and 24897677; Community 2 in 24897677 and 9736901; Community 3 in 9736901 and 25893422; and Community 4 in 25893422 and 392481. This cyclic overlap ensures that no strategy is isolated to a single community and no community is excluded from any strategy.

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

### View: Indigenous Knowledge Base to Community

The view `v_indigenous_knowledge_base_community` joins `indigenous_knowledge_bases` to `communities` on the community foreign key, producing a row that pairs each knowledge base with its host community. This view answers the question: which community maintains which indigenous knowledge base, and what are that community's demographic characteristics? Row 220 shows Primary Initiative A (a community of population 42, high vulnerability, subsistence_agriculture livelihood) maintaining the knowledge base with id 220, which transmits tsunami knowledge via oral_tradition in distributed-region-12. The flexible-thinking knowledge base is maintained by Compact Cluster, a community of population 56 with low vulnerability and mixed livelihoods, transmitting landslide knowledge via landmark_based methods in pilot-region-14.

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

### View: Indigenous Knowledge Base to Risk Reduction Strategy

The view `v_indigenous_knowledge_base_risk_reduction_strategy` joins `indigenous_knowledge_bases` to `risk_reduction_strategies` via the `strategy_id` foreign key. It answers: which risk reduction strategy does each indigenous knowledge base support, and what are the strategy's operational parameters? The knowledge base 220 supports strategy 392481 (Integrated Framework A), which has full integration level, planned status, and targets tsunami. The flexible-thinking knowledge base supports strategy 9736901 (Pilot Programme), which has consultative integration, active status, and targets landslide.

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

### View: Indigenous Knowledge Base to Scientific Knowledge Base

The view `v_indigenous_knowledge_base_scientific_knowledge_base` joins the two knowledge base tables through their shared `community_id`, revealing which indigenous and scientific knowledge bases coexist within the same community. This view answers: for each community, what indigenous knowledge and what scientific knowledge are available? Community 1 hosts indigenous knowledge base 220 (oral_tradition, tsunami) alongside scientific knowledge base 220 (satellite_imagery, probabilistic_hazard, peer_reviewed). Community 3 hosts indigenous knowledge base flexible-thinking (landmark_based, landslide) alongside scientific knowledge base flexible-thinking (historical_records, exposure_map, field_validated).

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

### View: Scientific Knowledge Base to Community

The view `v_scientific_knowledge_base_community` joins `scientific_knowledge_bases` to `communities` on the community foreign key, answering: which community hosts which scientific knowledge base, and what are the community's characteristics? Scientific knowledge base 220 (probabilistic_hazard model, high resolution, peer_reviewed) is hosted by Community 1 (Primary Initiative A, population 42, high vulnerability). Scientific knowledge base flexible-thinking (exposure_map model, low resolution, field_validated) is hosted by Community 3 (Compact Cluster, population 56, low vulnerability).

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

### View: Scientific Knowledge Base to Risk Reduction Strategy

The view `v_scientific_knowledge_base_risk_reduction_strategy` joins `scientific_knowledge_bases` to `risk_reduction_strategies` via `strategy_id`, answering: which risk reduction strategy is informed by which scientific knowledge base? Strategy 392481 (Integrated Framework A, full integration, planned) is informed by scientific knowledge base 220 (satellite_imagery, probabilistic_hazard). Strategy 9736901 (Pilot Programme, consultative, active) is informed by scientific knowledge base flexible-thinking (historical_records, exposure_map).

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

### View: Scientific Knowledge Base to Indigenous Knowledge Base

The view `v_scientific_knowledge_base_indigenous_knowledge_base` joins the two knowledge base tables through their shared `community_id`, mirroring `v_indigenous_knowledge_base_scientific_knowledge_base` but from the scientific perspective. It answers: for each community, what scientific knowledge base exists alongside which indigenous knowledge base? Community 2 hosts scientific knowledge base 5844261 (seismic_monitoring, vulnerability_index, medium resolution, preliminary validation) alongside indigenous knowledge base 5844261 (ritual_practice, volcanic_ash). Community 4 hosts scientific knowledge base 727060 (field_survey, risk_matrix, high resolution, peer_reviewed) alongside indigenous knowledge base 727060 (kinship_network, cyclone).

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

### View: Community to Indigenous Knowledge Base

The view `v_community_indigenous_knowledge_base` joins `communities` to `indigenous_knowledge_bases` on the community foreign key, answering: what indigenous knowledge base does each community maintain, and what are the knowledge base's characteristics? Community 1 (Primary Initiative A, population 42, high vulnerability) maintains knowledge base 220 (oral_tradition, tsunami, integrated). Community 4 (Legacy Review D, population 63, high vulnerability) maintains knowledge base 727060 (kinship_network, cyclone, not integrated).

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

### View: Community to Scientific Knowledge Base

The view `v_community_scientific_knowledge_base` joins `communities` to `scientific_knowledge_bases` on the community foreign key, answering: what scientific knowledge base does each community host? Community 1 hosts scientific knowledge base 220 (satellite_imagery, probabilistic_hazard, peer_reviewed). Community 2 (Composite Model, population 49, medium vulnerability, fishing) hosts scientific knowledge base 5844261 (seismic_monitoring, vulnerability_index, preliminary).

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

### View: Community to Risk Reduction Strategy Detail

The view `v_community_risk_reduction_strategy_detail` joins `communities` to `risk_reduction_strategies` via the `community_id` foreign key, answering: which risk reduction strategies does each community directly target, and what are the strategy parameters? Community 1 (Primary Initiative A) is directly targeted by strategy 392481 (Integrated Framework A, full integration, planned, tsunami). Community 3 (Compact Cluster) is directly targeted by strategy 9736901 (Pilot Programme, consultative, active, landslide). The junction table `communities_strategies` provides the additional many-to-many layer, allowing each community to participate in two strategies beyond its primary one.

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

### View: Risk Reduction Strategy to Community

The view `v_risk_reduction_strategy_community` joins `risk_reduction_strategies` to `communities` on the community foreign key, answering: which community does each risk reduction strategy target? Strategy 392481 (Integrated Framework A) targets Community 1 (Primary Initiative A). Strategy 25893422 (Baseline Standard D) targets Community 4 (Legacy Review D). This view inverts the perspective of `v_community_risk_reduction_strategy_detail`, organizing by strategy rather than by community.

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

### View: Risk Reduction Strategy to Indigenous Knowledge Base

The view `v_risk_reduction_strategy_indigenous_knowledge_base` joins `risk_reduction_strategies` to `indigenous_knowledge_bases` via the `knowledge_base_id` foreign key, answering: which indigenous knowledge base does each strategy draw upon? Strategy 392481 (Integrated Framework A) draws upon indigenous knowledge base 220 (oral_tradition, tsunami). Strategy 25893422 (Baseline Standard D) draws upon indigenous knowledge base 727060 (kinship_network, cyclone).

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

### View: Risk Reduction Strategy to Scientific Knowledge Base

The view `v_risk_reduction_strategy_scientific_knowledge_base` joins `risk_reduction_strategies` to `scientific_knowledge_bases` via the `draws_from_scientific_knowledge_knowledge_base_id` foreign key, answering: which scientific knowledge base informs each strategy? Strategy 392481 (Integrated Framework A) is informed by scientific knowledge base 220 (satellite_imagery, probabilistic_hazard, peer_reviewed). Strategy 9736901 (Pilot Programme) is informed by scientific knowledge base flexible-thinking (historical_records, exposure_map, field_validated).

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

### View: Environmental Hazard to Community

The view `v_environmental_hazard_community` joins `environmental_hazards` to `communities` on the community foreign key, answering: which community is affected by which environmental hazard, and what are the hazard characteristics? Community 1 (Primary Initiative A) is affected by hazard 3012829 (tsunami, annual frequency, magnitude 11.70, last occurred 2023-06-26). Community 4 (Legacy Review D) is affected by hazard 3012826 (cyclone, rare frequency, magnitude 19.80, last occurred 2022-09-05).

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

### View: Environmental Hazard to Scientific Knowledge Base

The view `v_environmental_hazard_scientific_knowledge_base` joins `environmental_hazards` to `scientific_knowledge_bases` via the `knowledge_base_id` foreign key, answering: which scientific knowledge base documents or monitors which environmental hazard? Hazard 3012829 (tsunami) is documented by scientific knowledge base 220 (satellite_imagery, probabilistic_hazard). Hazard pgc_pyme_551 (landslide) is documented by scientific knowledge base flexible-thinking (historical_records, exposure_map).

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

### Synthesis

The schema models disaster risk governance as a five-entity core (indigenous knowledge bases, scientific knowledge bases, communities, risk reduction strategies, environmental hazards) augmented by a many-to-many junction (communities_strategies). Foreign keys bind knowledge bases to communities and strategies, strategies to communities and knowledge bases, hazards to communities and knowledge bases, and communities to both knowledge base types. The junction table `communities_strategies` decouples the community-strategy relationship from the one-to-one foreign keys in the strategy and knowledge base tables, enabling each community to participate in multiple strategies and each strategy to serve multiple communities. The fourteen views materialize every pairwise relationship between the five core entities, each answering a specific analytical question by joining the appropriate normalized tables and projecting the relevant columns. Together, the tables and views provide a complete, ontology-grounded representation of how communities, knowledge traditions, hazards, and interventions interrelate in the domain.