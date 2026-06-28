---
chapter_id: ch_live_entity_match_link_5c2051
topic_id: 161
family: 07_long_tail
cited_terms: ['entity_match_link', 'dempster_combinant_first', 'aggregation_basic']
model: engine-refine
---

Entity matching in this framework is mediated through a link table that records pairwise correspondences between distinct entities, each link bearing a unique identifier such as LINK-0001 or LINK-0002. A given link associates an entity—Lab instrument SN-4491, Sample batch SB-2214, Dataset v4.2.1, or Governance policy DOC-992—with a matched entity drawn from the aggregation namespace, for instance AGGR-0001 or AGGR-0006. The link itself is the subject of the relationship; it is the target of attribute assignments and the pivot around which provenance metadata is organized. This design separates the identity of the match from the properties that qualify it, allowing a single linkage to carry multiple typed attributes without conflating the match's existence with the evidence that supports it.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | AGGR-0001 |
| LINK-0002 | Sample batch SB-2214 | AGGR-0006 |
| LINK-0003 | Dataset v4.2.1 | AGGR-0004 |
| LINK-0004 | Governance policy DOC-992 | AGGR-0006 |
| LINK-0005 | Governance policy DOC-992 | AGGR-0004 |
| LINK-0006 | Provenance log PR-7741 | AGGR-0005 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_aggregation_basic**

| id | aggregation |
| --- | --- |
| AGGR-0001 | Daily telemetry summary |
| AGGR-0002 | Annual inventory rollup |
| AGGR-0003 | Quarterly revenue consolidation |
| AGGR-0004 | Weekly sensor fusion |
| AGGR-0005 | Quarterly revenue consolidation |
| AGGR-0006 | Quarterly revenue consolidation |

**t_aggregation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | confidence | xsd:decimal |
| AGGR-0002 | dimension_kind | xsd:string |
| AGGR-0003 | method | xsd:string |
| AGGR-0004 | recorded_at | xsd:dateTime |
| AGGR-0005 | uncertainty | xsd:decimal |
| AGGR-0006 | unit | xsd:string |
| AGGR-0007 | value | xsd:decimal |
| AGGR-0008 | encoding | xsd:string |

Attributes are declared in a dedicated schema table that pairs an attribute name with its type, using XML Schema datatypes such as xsd:decimal, xsd:string, and xsd:dateTime. The attribute repertoire includes confidence, dimension_kind, method, and recorded_at, each of which is materialized through a set of value tables partitioned by type. Decimal values—0.249, 0.772, 448.20, 699.43 for entity match links; 0.712, 0.690, 778.10, 155.63 for aggregations—are stored in the decimal value table, where each row ties a value to a specific entity and attribute through composite foreign keys. String values such as Dimension Kind 01, Encoding 02, audit excerpt, and es reside in the varchar value table, while timestamps like 2025-02-02T03:38:54, 2024-07-01T04:17:43, 2023-10-04T15:34:58, and 2025-05-20T07:58:08 are held in the datetime value table. This type-disaggregated value store enforces schema discipline at the storage layer and ensures that every misc value is anchored to its declared attr_type.

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

**t_aggregation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0004 | 2023-06-08T14:00:36 |
| AGGR-0002 | AGGR-0002 | AGGR-0004 | 2024-12-13T14:33:07 |
| AGGR-0003 | AGGR-0003 | AGGR-0004 | 2023-10-30T03:55:23 |
| AGGR-0004 | AGGR-0004 | AGGR-0004 | 2023-08-23T20:37:20 |
| AGGR-0005 | AGGR-0005 | AGGR-0004 | 2023-04-27T16:41:49 |
| AGGR-0006 | AGGR-0006 | AGGR-0004 | 2024-07-14T23:19:51 |

**t_aggregation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 0.712 |
| AGGR-0002 | AGGR-0001 | AGGR-0005 | 778.10 |
| AGGR-0003 | AGGR-0001 | AGGR-0007 | 155.63 |
| AGGR-0004 | AGGR-0002 | AGGR-0001 | 0.690 |
| AGGR-0005 | AGGR-0002 | AGGR-0005 | 670.79 |
| AGGR-0006 | AGGR-0002 | AGGR-0007 | 377.50 |
| AGGR-0007 | AGGR-0003 | AGGR-0001 | 0.383 |
| AGGR-0008 | AGGR-0003 | AGGR-0005 | 911.00 |

**t_aggregation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | Dimension Kind 01 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | Encoding 02 |
| AGGR-0003 | AGGR-0001 | AGGR-0009 | intake form |
| AGGR-0004 | AGGR-0001 | AGGR-0010 | es |
| AGGR-0005 | AGGR-0001 | AGGR-0003 | hybrid |
| AGGR-0006 | AGGR-0001 | AGGR-0006 | ratio |
| AGGR-0007 | AGGR-0002 | AGGR-0002 | Dimension Kind 07 |
| AGGR-0008 | AGGR-0002 | AGGR-0008 | Encoding 08 |

Evidence combination follows the Dempster-Shafer formalism, where a combinator entity—UncertaintyPropagationPipeline, MultiSourceInferenceEngine, EvidenceCombinationModel, or ProvenanceAggregator—acts as the subject that fuses multiple sources of belief. Each combinator is linked to a first combinant, such as HistoricalLogArchive, CoreTelemetryFeed, GroundTruthLabels, or PrimaryFlightData, through a junction table that also records the role of the first combinant within the combination: observer, reviewer, or owner. The junction table carries its own identifier (FIRS-0001 through FIRS-0004) and establishes a many-to-many relationship between the dempster subject and the first_combinant target, with the role column encoding the combinant's functional position in the aggregation logic. This tripartite structure—subject, target, role—makes explicit not only which entities participate in a combination but also the capacity in which they do so.

**t_dempster_combinant_first**

| id | dempster |
| --- | --- |
| FIRS-0001 | UncertaintyPropagationPipeline |
| FIRS-0002 | MultiSourceInferenceEngine |
| FIRS-0003 | EvidenceCombinationModel |
| FIRS-0004 | ProvenanceAggregator |
| FIRS-0005 | DataQualityFusionService |
| FIRS-0006 | BeliefFusionEngine |

**t_dempster_combinant_first_first_combinant**

| id | first_combinant |
| --- | --- |
| FIRS-0001 | HistoricalLogArchive |
| FIRS-0002 | CoreTelemetryFeed |
| FIRS-0003 | GroundTruthLabels |
| FIRS-0004 | PrimaryFlightData |
| FIRS-0005 | LIDARPointCloud |
| FIRS-0006 | BaselineSensorArray |

**t_dempster_combinant_first__first_combinant**

| id | dempster_id | first_combinant_id | role |
| --- | --- | --- | --- |
| FIRS-0001 | FIRS-0001 | FIRS-0005 | observer |
| FIRS-0002 | FIRS-0005 | FIRS-0002 | reviewer |
| FIRS-0003 | FIRS-0001 | FIRS-0004 | observer |
| FIRS-0004 | FIRS-0005 | FIRS-0006 | owner |
| FIRS-0005 | FIRS-0004 | FIRS-0005 | owner |
| FIRS-0006 | FIRS-0005 | FIRS-0005 | owner |
| FIRS-0007 | FIRS-0006 | FIRS-0004 | contributor |
| FIRS-0008 | FIRS-0002 | FIRS-0005 | observer |

Aggregations are themselves first-class entities, each identified by an aggregation code such as AGGR-0001 (Daily telemetry summary), AGGR-0002 (Annual inventory rollup), AGGR-0003 (Quarterly revenue consolidation), or AGGR-0004 (Weekly sensor fusion). They share the same attribute declaration and value-storage pattern as entity match links, enabling a uniform treatment of metadata across the system. An aggregation's confidence score of 0.712 or 0.690, its dimension_kind of Dimension Kind 01, its method recorded as Encoding 02 or intake form, and its recorded_at timestamp of 2023-06-08T14:00:36 or 2024-12-13T14:33:07 are all stored as typed values linked back to the aggregation entity through the same composite key structure. The entity match links further connect these aggregations to source entities, forming a traceable chain from raw instrument or policy through matched aggregation to combined evidence, with every step annotated by attr, attr_type, and role.