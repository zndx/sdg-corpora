---
chapter_id: ch_live_transformation_subclass_de6a93
topic_id: 4
family: 05_provo_lineage
cited_terms: ['transformation_subclass', 'ebpfmap_with_value_type', 'annotation_basic']
model: engine-refine
---

Attributes and their typed values constitute the foundational metadata layer for any governance framework that demands traceability and auditability. Each attribute is defined by a name and a strict type constraint—`confidence` as an `xsd:decimal`, `dimension_kind` as an `xsd:string`, `method` as an `xsd:string`, and `recorded_at` as an `xsd:dateTime`—ensuring that downstream consumers can validate and interpret data without ambiguity. These definitions are anchored to entities through unique identifiers such as `ANNO-0001` through `ANNO-0004`, which serve as the stable keys linking attribute schemas to their concrete values. The value tables partition data by type: decimal values like `0.902` and `146.86` reside in the decimal store, datetime values such as `2023-10-01T01:18:56` and `2024-08-04T06:45:48` in the datetime store, and string values including `Dimension Kind 01`, `Encoding 02`, and `intake form` in the varchar store. This normalization by type prevents schema drift and enables efficient indexing, while the foreign-key relationships between the entity identifier, the attribute identifier, and the typed value table guarantee referential integrity across the metadata graph.

**t_annotation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2023-10-01T01:18:56 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-08-04T06:45:48 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2023-05-30T04:23:33 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-12-22T16:10:44 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2024-08-02T10:45:55 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2023-08-09T11:38:40 |
| ANNO-0007 | ANNO-0007 | ANNO-0004 | 2023-04-18T06:49:25 |
| ANNO-0008 | ANNO-0008 | ANNO-0004 | 2024-10-12T21:41:16 |

**t_annotation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.902 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 146.86 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 292.49 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.818 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 591.53 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 955.64 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.553 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 336.91 |

**t_annotation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | intake form |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | fr |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | automated |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | ms |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

The categorization and labeling of value type maps provide the semantic scaffolding that transforms raw identifiers into meaningful governance constructs. The dimension table `dim_value_type_map` assigns each type map a human-readable label—`Value Type Map Label 01` through `Value Type Map Label 04`—and a category designation such as `Value Type Map Category 01` through `Value Type Map Category 04`. These labels and categories are not decorative; they drive policy enforcement, access control, and reporting aggregation. The fact table `fact_ebpfmap` materializes these mappings with concrete measurements: each record carries a `value_type_map_key` that references the dimension, a `size_bytes` field capturing magnitudes ranging from `31,105,012` to `354,373,995` bytes, and a `version` number—`3`, `6`, `12`, and `5` respectively—that tracks the evolution of the type map over time. Versioning is critical for compliance, as it allows auditors to reconstruct the state of any classification at a point in time and to detect unauthorized modifications to type definitions.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

Transformation records introduce the operational dimension, capturing not just what data exists but how it has been processed and where it sits in the lifecycle. The transformation subclass table records each operation with a unique identifier like `TRAN-0001` through `TRAN-0004`, names such as `Signal Bandpass Filtering`, `Provenance Hash Computation`, `Log Pattern Extraction`, and `Telemetry Aggregation Rollup`, and the entity it operates on—`REST API Response Bodies`, `Reagent Batch Alpha`, `PCAP Archive Files`, and `PostgreSQL Schema Definitions`. The phase column distinguishes between `review` and `execution` states, while the status column tracks outcomes as `failed`, `complete`, or `pending`. A transformation marked `failed` in `execution` phase, for instance, signals a break in the data lineage that must be investigated before downstream reports can be trusted. This phase-status matrix is the operational heartbeat of the governance framework, enabling dashboards that surface bottlenecks, compliance gaps, and processing anomalies in real time.

**t_transformation_subclass**

| id | transformation | uses_entity | phase | status |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Signal Bandpass Filtering | REST API Response Bodies | review | failed |
| TRAN-0002 | Provenance Hash Computation | Reagent Batch Alpha | execution | complete |
| TRAN-0003 | Log Pattern Extraction | PCAP Archive Files | execution | pending |
| TRAN-0004 | Telemetry Aggregation Rollup | PostgreSQL Schema Definitions | execution | complete |

Annotation records tie the metadata and operational layers together by attaching descriptive context to entities. An annotation such as `Lab sample preservation log`, `Dataset quality flag`, `Observation confidence score`, or `Model versioning record` provides the narrative that raw identifiers and typed values cannot convey on their own. These annotations are themselves entities with their own attribute definitions and value assignments, creating a recursive structure where metadata about metadata is itself governed by the same rigor. The foreign-key architecture ensures that every value—whether a decimal confidence score, a datetime stamp, or a categorical label—can be traced back through its attribute definition to its parent annotation, and from there to the transformation that produced it or the type map that classifies it. This end-to-end traceability is what separates a compliant governance framework from an ad hoc data inventory.

**t_annotation_basic**

| id | annotation |
| --- | --- |
| ANNO-0001 | Lab sample preservation log |
| ANNO-0002 | Dataset quality flag |
| ANNO-0003 | Observation confidence score |
| ANNO-0004 | Model versioning record |
| ANNO-0005 | Lab sample preservation log |
| ANNO-0006 | Temperature sensor calibration |
| ANNO-0007 | Observation confidence score |
| ANNO-0008 | Telemetry schema update |

**t_annotation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |