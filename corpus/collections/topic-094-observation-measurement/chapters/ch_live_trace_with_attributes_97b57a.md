---
chapter_id: ch_live_trace_with_attributes_97b57a
topic_id: 94
family: 02_observation_measurement
cited_terms: ['trace_with_attributes', 'annotation_at_tier', 'annotation_with_confidence']
model: engine-refine
---

Attributes constitute the fundamental unit of metadata enrichment within the system, each defined by a name and a corresponding type that governs how its value is stored and interpreted. An attribute such as `duration_seconds` carries the type `xsd:decimal`, while `end_time` is classified as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`; this type discipline ensures that heterogeneous data—whether the decimal magnitude `1085.14` or the ISO timestamp `2024-07-09T10:21:53`—is preserved with semantic fidelity. The attribute registry is decoupled from its values, allowing a single attribute definition to be referenced across multiple entities without duplication, and the type annotation itself serves as both a schema constraint and a documentation artifact for downstream consumers.

Entities function as the primary subjects to which attributes are bound, each identified by a stable identifier such as `ATTR-0001` or `TIER-0001`. These identifiers anchor the entity within the system's namespace and serve as the foreign key through which attribute values are resolved. A single entity may accumulate a diverse set of attribute bindings: `ATTR-0001`, for instance, is associated with a decimal value of `3252.57` for its duration attribute, a datetime value of `2024-10-26T05:28:10` for its end time, and a string value of `gw-12` for its host designation, while simultaneously participating in integer-valued relationships with values such as `445` and `106`. This many-to-many arrangement between entities and attributes enables flexible, schema-on-read semantics where the structure of an entity's metadata emerges from its accumulated bindings rather than from a fixed schema.

**t_trace_with_attributes**

| id | trace |
| --- | --- |
| ATTR-0001 | batch-exec-094 |
| ATTR-0002 | session-gamma-9 |
| ATTR-0003 | gateway-span-55 |
| ATTR-0004 | telemetry-flow-alpha |
| ATTR-0005 | pipeline-run-412 |
| ATTR-0006 | api-call-trace-12 |

**t_trace_with_attributes_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-07-09T10:21:53 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2024-10-26T05:28:10 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2024-01-16T11:34:50 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-03-03T12:52:58 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2023-12-16T04:33:56 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2024-09-15T16:03:36 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2024-12-20T02:32:40 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2024-08-26T04:55:34 |

**t_trace_with_attributes_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 1085.14 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3252.57 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 401.17 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 3242.47 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 4250.01 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 3788.41 |

**t_trace_with_attributes_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 445 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 106 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 567 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 380 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 276 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 188 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 89 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 391 |

**t_annotation_at_tier**

| id | annotation | at_tier |
| --- | --- | --- |
| TIER-0001 | ObservationNote Drift | L0 Unprocessed |
| TIER-0002 | Lab Assay Plate 12B | Cold Archive |
| TIER-0003 | ComplianceLevel SOC2 | Baseline Reference |
| TIER-0004 | SampleType FieldBlind | L0 Unprocessed |
| TIER-0005 | Sensor Readings Q1 | Cold Archive |
| TIER-0006 | Sensor Readings Q1 | L0 Unprocessed |
| TIER-0007 | ProvenanceSource EPA7 | Derived Metrics |
| TIER-0008 | MetadataTag Deprecated | Cold Archive |

**t_annotation_at_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2023-08-28T08:07:44 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2024-09-06T16:54:15 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-05-23T23:56:22 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2025-03-16T10:06:06 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2023-04-25T04:15:41 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-06-14T22:17:53 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2024-03-09T22:47:27 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-01-10T07:31:27 |

**t_annotation_at_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.089 |
| TIER-0002 | TIER-0001 | TIER-0005 | 784.31 |
| TIER-0003 | TIER-0001 | TIER-0007 | 319.44 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.223 |
| TIER-0005 | TIER-0002 | TIER-0005 | 427.90 |
| TIER-0006 | TIER-0002 | TIER-0007 | 411.91 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.933 |
| TIER-0008 | TIER-0003 | TIER-0005 | 35.44 |

**t_annotation_at_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | es |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

The value storage layer employs a type-dispatched architecture, with separate tables dedicated to each XML Schema data type—`val_datetime`, `val_decimal`, `val_int`, and `val_varchar`—each carrying the entity identifier and the attribute identifier as composite foreign keys alongside the actual value. This design avoids the pitfalls of a generic key-value store by preserving type information at the storage level, ensuring that a value of `0.089` is unambiguously a decimal rather than a string representation, and that `2023-08-28T08:07:44` is parsed as a temporal instant rather than opaque text. The type-specific tables also enable efficient range queries and indexed lookups on numerically or temporally significant attributes without the overhead of runtime type coercion.

**t_trace_with_attributes_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_trace_with_attributes_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | gw-12 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | superseded |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | node-b14 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | execution |

Annotations introduce a second dimension of metadata enrichment, attaching observational notes and compliance designations to processing tiers. An annotation such as `ObservationNote Drift` or `ComplianceLevel SOC2` is associated with a tier like `L0 Unprocessed` or `Cold Archive`, and itself carries typed attributes including a `confidence` measure expressed as `xsd:decimal` (values such as `0.089` or `0.223`), a `dimension_kind` as `xsd:string` (e.g., `Dimension Kind 01`), and a `recorded_at` timestamp (e.g., `2023-05-23T23:56:22`). The tier-level annotation model mirrors the trace-level attribute model in its structural discipline, establishing a parallel metadata layer that captures provenance and quality signals alongside the operational data itself.

**t_annotation_at_tier_attr**

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

**t_annotation_with_confidence**

| id | annotation |
| --- | --- |
| CONF-0001 | ObservationNote Drift |
| CONF-0002 | GovernanceStatus Approved |
| CONF-0003 | ComplianceLevel SOC2 |
| CONF-0004 | ProvenanceSource EPA7 |
| CONF-0005 | Sensor Readings Q1 |
| CONF-0006 | Gene Expression Run X42 |
| CONF-0007 | Clinical Trial Arm C |

**t_annotation_with_confidence_confidence**

| id | confidence |
| --- | --- |
| CONF-0001 | 95 Percent Confidence |
| CONF-0002 | Cross Referenced |
| CONF-0003 | Ensemble Agreement |
| CONF-0004 | Expert Verified |
| CONF-0005 | P Value 0.01 |
| CONF-0006 | Expert Verified |

Confidence annotations are further refined through a ternary relationship that links an annotation to a confidence mechanism with an assigned role. The confidence mechanisms themselves—`95 Percent Confidence`, `Cross Referenced`, `Ensemble Agreement`, `Expert Verified`—are catalogued as distinct entities, and the linking table establishes which annotation serves as the subject, which confidence mechanism serves as the target, and what role the relationship plays in the provenance chain. A single annotation may participate in multiple such relationships: `CONF-0001` appears as the subject with `CONF-0004` as the target in the role of `contributor`, and also with `CONF-0005` as the target in the role of `observer`, while `CONF-0002` links to `CONF-0001` in the role of `reviewer`. This role-based disambiguation allows the system to distinguish between different kinds of confidence assertions on the same annotation, supporting nuanced provenance tracking where the same piece of evidence may be evaluated through multiple lenses—contributor, observer, reviewer—each carrying its own epistemic weight.

**t_annotation_with_confidence__confidence**

| id | annotation_id | confidence_id | role |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0007 | CONF-0006 | contributor |
| CONF-0002 | CONF-0001 | CONF-0004 | observer |
| CONF-0003 | CONF-0001 | CONF-0005 | contributor |
| CONF-0004 | CONF-0002 | CONF-0001 | reviewer |
| CONF-0005 | CONF-0006 | CONF-0005 | observer |
| CONF-0006 | CONF-0001 | CONF-0001 | owner |
| CONF-0007 | CONF-0004 | CONF-0005 | owner |
| CONF-0008 | CONF-0006 | CONF-0002 | contributor |