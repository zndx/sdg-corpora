---
chapter_id: ch_live_evidence_at_quality_tier_361de3
topic_id: 51
family: 06_belief_structure
cited_terms: ['evidence_at_quality_tier', 'entity_type_belongs_to', 'annotation_classifies_artifact']
model: engine-refine
---

Attributes, attribute types, entities, identifiers, and miscellaneous values constitute the foundational vocabulary of a normalized entity-attribute-value architecture, wherein heterogeneous data is decomposed into discrete, queryable components. An entity—whether an operational asset such as `edge_gateway_12` and `sensor_node_47`, a governance artifact like `governance_policy_fin`, or a classified document—serves as the primary subject of observation. Each entity is assigned a unique identifier, for example `BELO-0001` or `ARTI-0001`, which functions as the immutable anchor across all relational joins. The entity is further contextualized by its type membership: `edge_gateway_12` and `governance_policy_fin` both resolve to type `TIER-0007`, while `sensor_node_47` appears in two distinct type assignments (`TIER-0005` and `TIER-0008`), reflecting the model's capacity for multi-class classification. This type hierarchy is itself governed by a separate classification table, `t_entity_type_belongs_to`, which maps each entity identifier to its corresponding type code, thereby establishing a two-level taxonomy that separates identity from categorization.

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | TIER-0007 |
| BELO-0002 | sensor_node_47 | TIER-0005 |
| BELO-0003 | governance_policy_fin | TIER-0007 |
| BELO-0004 | sensor_node_47 | TIER-0008 |
| BELO-0005 | edge_gateway_12 | TIER-0004 |
| BELO-0006 | edge_gateway_12 | TIER-0004 |
| BELO-0007 | ml_feature_store_prod | TIER-0008 |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

Attributes define the dimensions along which entities are measured and described. The attribute schema is declared in a dedicated metadata table—`t_evidence_at_quality_tier_attr` for evidence items, `t_entity_type_belongs_to_attr` for entity types, and `t_annotation_classifies_artifact_attr` for artifact classifications—each listing an `attr_name` and its corresponding `attr_type` in XSD notation. Common attributes recur across entity categories: `confidence` is typed as `xsd:decimal`, `dimension_kind` and `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`. This uniformity enables cross-entity queries while preserving type safety; a confidence score of `0.731` for evidence item `TIER-0001` and a score of `0.703` for entity `BELO-0001` are both stored as decimal values but remain semantically scoped to their respective entity namespaces. The attribute definitions themselves are keyed by the same identifier scheme as their parent entities, ensuring that every attribute can be resolved to its originating entity type without ambiguity.

**t_evidence_at_quality_tier**

| id | evidence | at_quality_tier |
| --- | --- | --- |
| TIER-0001 | network packets | BELO-0003 |
| TIER-0002 | audit trails | BELO-0002 |
| TIER-0003 | network packets | BELO-0004 |
| TIER-0004 | inspection photos | BELO-0001 |
| TIER-0005 | telemetry streams | BELO-0007 |
| TIER-0006 | field measurements | BELO-0002 |
| TIER-0007 | device firmware | BELO-0001 |
| TIER-0008 | audit trails | BELO-0004 |

**t_evidence_at_quality_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_evidence_at_quality_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2024-11-19T18:15:43 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2023-02-10T23:54:33 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-06-07T05:45:43 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2024-08-05T11:37:21 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2025-03-30T21:54:34 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-10-26T18:53:01 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2023-09-26T03:30:22 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-04-10T10:08:00 |

**t_evidence_at_quality_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.731 |
| TIER-0002 | TIER-0001 | TIER-0005 | 574.79 |
| TIER-0003 | TIER-0001 | TIER-0007 | 563.53 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.358 |
| TIER-0005 | TIER-0002 | TIER-0005 | 139.04 |
| TIER-0006 | TIER-0002 | TIER-0007 | 944.94 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.228 |
| TIER-0008 | TIER-0003 | TIER-0005 | 33.93 |

**t_annotation_classifies_artifact**

| id | annotation |
| --- | --- |
| ARTI-0001 | Source Verified |
| ARTI-0002 | PII Redacted |
| ARTI-0003 | PII Sensitive |
| ARTI-0004 | Deprecated |
| ARTI-0005 | GDPR Compliant |
| ARTI-0006 | GDPR Compliant |

**t_annotation_classifies_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_annotation_classifies_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-11-28T13:33:59 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-06-29T04:58:51 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-01-05T00:51:32 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-11-30T14:24:01 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2023-01-14T09:06:44 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2023-02-15T12:01:42 |

**t_annotation_classifies_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.727 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 765.80 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 266.33 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.091 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 761.16 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 564.24 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.118 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 599.96 |

**t_annotation_classifies_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | pre-release note |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | ja |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | automated |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

The actual attribute values are materialized in a set of type-dispatch tables that partition data by XSD type, thereby avoiding the null-column proliferation characteristic of wide relational schemas. Decimal values reside in `t_evidence_at_quality_tier_val_decimal`, where `TIER-0001` carries a confidence of `0.731` and a secondary metric of `574.79` under attribute `TIER-0005`; string values are stored in `t_evidence_at_quality_tier_val_varchar`, capturing entries such as `Dimension Kind 01`, `Encoding 02`, and `change rationale`; and temporal data is held in `t_evidence_at_quality_tier_val_datetime`, recording timestamps like `2024-11-19T18:15:43` and `2023-02-10T23:54:33`. Each value row is identified by a composite key comprising the entity identifier (`entity_id`) and the attribute identifier (`attr_id`), with a surrogate `id` providing a stable row handle. This three-table decomposition—decimal, varchar, datetime—mirrors the XSD type declarations in the attribute metadata, creating a closed loop between schema definition and data storage that enforces type consistency at the application layer.

**t_evidence_at_quality_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | ja |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

Evidence items and artifact classifications introduce a parallel classification layer that annotates entities with provenance and sensitivity markers. The table `t_evidence_at_quality_tier` links evidence sources—`network packets`, `audit trails`, and `inspection photos`—to quality tier identifiers such as `BELO-0003`, `BELO-0002`, `BELO-0004`, and `BELO-0001`, establishing a traceability chain from raw data to quality assessment. Similarly, `t_annotation_classifies_artifact` assigns classification labels to artifacts: `Source Verified`, `PII Redacted`, `PII Sensitive`, and `Deprecated` serve as categorical tags that govern access control and retention policies. These annotations are themselves subject to the same attribute-value decomposition, with confidence scores (`0.727` for `ARTI-0001`), methodological notes (`pre-release note`), and recording timestamps (`2024-11-28T13:33:59`) stored in the corresponding value tables. The result is a fully normalized provenance graph in which every classification decision is accompanied by its own metadata, enabling auditability without sacrificing query performance.

The practical significance of this architecture lies in its ability to accommodate schema evolution without structural migration. When a new attribute is introduced—say, a `data_source` field for evidence items—the change is confined to the attribute metadata table; no DDL alteration is required, and existing value rows remain intact. The type-dispatch tables absorb new values according to their XSD declarations, and the composite key structure ensures that every value can be traced back to its entity and attribute origin. This design is particularly valuable in compliance and governance contexts, where the set of measurable dimensions expands as regulatory requirements evolve, and where the ability to reconstruct the full attribute profile of any entity—whether a sensor node, a governance policy, or a classified document—is a prerequisite for audit readiness.