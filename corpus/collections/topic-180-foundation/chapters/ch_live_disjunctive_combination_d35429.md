---
chapter_id: ch_live_disjunctive_combination_d35429
topic_id: 180
family: 07_long_tail
cited_terms: ['disjunctive_combination', 'ice_with_existential', 'lru_hash_map_subclass']
model: engine-refine
---

An identifier serves as the stable reference point around which all attribute-value relationships are organized, whether the entity in question is a disjunctive combination such as COMB-0001, an existential constraint like EXIS-0001, or an LRU hash map subclass identified as MAP-0001. Each identifier anchors a distinct entity type: disjunctive combinations carry a disjunctive classification—Schema_validation_union, OR_filter_rule—and specify what they combine, as in sensor_primary_signal or archived_log; existential constraints bear labels such as Batch Processing Rule or Metadata Schema Version and relate to external entities like Laboratory Zone B or Hydraulic Pressure Range; LRU hash map subclasses are named primary-db-cache, stream-event-cache, global-rate-limiter, and prod-session-cache. The identifier is the sole key that permits cross-referencing between the entity's defining properties and its attribute values, ensuring that every datum can be traced back to its source without ambiguity.

**t_disjunctive_combination**

| id | disjunctive | disjunctively_combines |
| --- | --- | --- |
| COMB-0001 | Schema_validation_union | sensor_primary_signal |
| COMB-0002 | OR_filter_rule | archived_log |
| COMB-0003 | OR_filter_rule | mirror_table |
| COMB-0004 | Schema_validation_union | backup_readout |
| COMB-0005 | Metric_aggregation_branch | primary_readout |
| COMB-0006 | Compliance_check_union | backup_readout |

**t_disjunctive_combination_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMB-0001 | confidence | xsd:decimal |
| COMB-0002 | dimension_kind | xsd:string |
| COMB-0003 | method | xsd:string |
| COMB-0004 | recorded_at | xsd:dateTime |
| COMB-0005 | uncertainty | xsd:decimal |
| COMB-0006 | unit | xsd:string |
| COMB-0007 | value | xsd:decimal |
| COMB-0008 | encoding | xsd:string |

**t_disjunctive_combination_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0004 | 2023-12-19T10:56:22 |
| COMB-0002 | COMB-0002 | COMB-0004 | 2025-06-13T05:31:45 |
| COMB-0003 | COMB-0003 | COMB-0004 | 2023-09-21T03:35:03 |
| COMB-0004 | COMB-0004 | COMB-0004 | 2025-01-18T01:14:05 |
| COMB-0005 | COMB-0005 | COMB-0004 | 2023-04-13T14:48:56 |
| COMB-0006 | COMB-0006 | COMB-0004 | 2023-06-17T09:04:58 |

**t_disjunctive_combination_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0001 | 0.084 |
| COMB-0002 | COMB-0001 | COMB-0005 | 689.68 |
| COMB-0003 | COMB-0001 | COMB-0007 | 250.05 |
| COMB-0004 | COMB-0002 | COMB-0001 | 0.409 |
| COMB-0005 | COMB-0002 | COMB-0005 | 133.59 |
| COMB-0006 | COMB-0002 | COMB-0007 | 440.04 |
| COMB-0007 | COMB-0003 | COMB-0001 | 0.271 |
| COMB-0008 | COMB-0003 | COMB-0005 | 418.58 |

**t_disjunctive_combination_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0002 | Dimension Kind 01 |
| COMB-0002 | COMB-0001 | COMB-0008 | Encoding 02 |
| COMB-0003 | COMB-0001 | COMB-0009 | calibration record |
| COMB-0004 | COMB-0001 | COMB-0010 | ja |
| COMB-0005 | COMB-0001 | COMB-0003 | hybrid |
| COMB-0006 | COMB-0001 | COMB-0006 | count |
| COMB-0007 | COMB-0002 | COMB-0002 | Dimension Kind 07 |
| COMB-0008 | COMB-0002 | COMB-0008 | Encoding 08 |

**t_ice_with_existential**

| id | ice | related |
| --- | --- | --- |
| EXIS-0001 | Batch Processing Rule | Laboratory Zone B |
| EXIS-0002 | Metadata Schema Version | Hydraulic Pressure Range |
| EXIS-0003 | Provenance Trace Identifier | Network Latency Budget |
| EXIS-0004 | Sampling Frequency Specification | Laboratory Zone B |
| EXIS-0005 | Provenance Trace Identifier | Field Sampling Site |
| EXIS-0006 | Quality Control Checkpoint | Laboratory Zone B |
| EXIS-0007 | Instrument Serial Registry | Ambient Air Temperature |
| EXIS-0008 | Provenance Trace Identifier | ISO 8601 Timestamp |

**t_ice_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | encoding | xsd:string |
| EXIS-0002 | label_text | xsd:string |
| EXIS-0003 | language | xsd:string |

**t_ice_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | Encoding 01 |
| EXIS-0002 | EXIS-0001 | EXIS-0002 | audit excerpt |
| EXIS-0003 | EXIS-0001 | EXIS-0003 | de |
| EXIS-0004 | EXIS-0002 | EXIS-0001 | Encoding 04 |
| EXIS-0005 | EXIS-0002 | EXIS-0002 | change rationale |
| EXIS-0006 | EXIS-0002 | EXIS-0003 | de |
| EXIS-0007 | EXIS-0003 | EXIS-0001 | Encoding 07 |
| EXIS-0008 | EXIS-0003 | EXIS-0002 | pre-release note |

**t_lru_hash_map_subclass**

| id | lru |
| --- | --- |
| MAP-0001 | primary-db-cache |
| MAP-0002 | stream-event-cache |
| MAP-0003 | global-rate-limiter |
| MAP-0004 | prod-session-cache |
| MAP-0005 | primary-db-cache |
| MAP-0006 | stream-event-cache |
| MAP-0007 | prod-session-cache |

**t_lru_hash_map_subclass_l_r_u_hash_config**

| id | l_r_u_hash_config |
| --- | --- |
| MAP-0001 | siphash-2-4 |
| MAP-0002 | xxhash64 |
| MAP-0003 | robin-hood |
| MAP-0004 | sparse-block-map |
| MAP-0005 | murmur3-128 |
| MAP-0006 | murmur3-128 |

Attributes and their types form the schema layer that describes what properties an entity may carry, decoupled from the actual values those properties hold. In the disjunctive combination domain, attributes include confidence typed as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime. The existential constraint domain defines encoding, label_text, and language, all typed as xsd:string. This separation of attribute definition from value storage enables type enforcement at the schema level while allowing values to be distributed across specialized tables—decimal values such as 0.084, 689.68, 250.05, and 0.409 reside in one table; string values like Dimension Kind 01, Encoding 02, calibration record, and ja in another; and datetime values such as 2023-12-19T10:56:22, 2025-06-13T05:31:45, 2023-09-21T03:35:03, and 2025-01-18T01:14:05 in a third. The same pattern applies to existential constraints, where string values including Encoding 01, audit excerpt, de, and Encoding 04 are stored separately from the attribute definitions that declare them as xsd:string.

The entity table establishes the primary record for each object, carrying both its identifier and its domain-specific classification. A disjunctive combination identified as COMB-0001 is classified as Schema_validation_union and combines sensor_primary_signal; COMB-0002 and COMB-0003 are both OR_filter_rule, combining archived_log and mirror_table respectively; COMB-0004 is again Schema_validation_union but combines backup_readout. Existential constraints follow a parallel structure: EXIS-0001 is a Batch Processing Rule related to Laboratory Zone B, EXIS-0002 is a Metadata Schema Version related to Hydraulic Pressure Range, EXIS-0003 carries the label Provenance Trace Identifier and relates to Network Latency Budget, and EXIS-0004 is a Sampling Frequency Specification also related to Laboratory Zone B. The entity table thus provides the foundational row from which all attribute-value associations radiate.

Subject and target, mediated by role, constitute a ternary relationship pattern that captures how two entities interact within a defined capacity. In the LRU hash map subclass configuration, the subject is an LRU instance—MAP-0007, MAP-0004, MAP-0003, MAP-0005—and the target is a hash configuration—MAP-0004, MAP-0002, MAP-0002, MAP-0004—while the role specifies the nature of the association: reviewer, contributor, or observer. This triad allows a single subject to relate to multiple targets under different roles, and a single target to be referenced by multiple subjects, without requiring denormalization. The hash configurations themselves—siphash-2-4, xxhash64, robin-hood, sparse-block-map—are defined in a separate table and linked through this relationship table, preserving referential integrity while supporting many-to-many cardinality.

**t_lru_hash_map_subclass__l_r_u_hash_config**

| id | lru_id | l_r_u_hash_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0007 | MAP-0004 | reviewer |
| MAP-0002 | MAP-0004 | MAP-0002 | contributor |
| MAP-0003 | MAP-0003 | MAP-0002 | observer |
| MAP-0004 | MAP-0005 | MAP-0004 | reviewer |
| MAP-0005 | MAP-0004 | MAP-0005 | owner |
| MAP-0006 | MAP-0001 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0005 | reviewer |
| MAP-0008 | MAP-0007 | MAP-0002 | observer |

The misc column in the value tables holds the actual data payload, typed according to the attribute definition it supports. Decimal values such as 0.084 and 689.68 carry quantitative measurements; string values like calibration record and ja carry categorical or textual metadata; datetime values such as 2023-12-19T10:56:22 carry temporal stamps. Each value row references both the entity it belongs to and the attribute it instantiates, creating a fully traceable chain from identifier through attribute definition to concrete value. This architecture ensures that schema evolution—adding a new attribute type, for instance—requires only a row in the attribute definition table, with no modification to existing value rows or entity records.