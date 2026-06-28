---
chapter_id: ch_live_measurement_subclass_only_one_unit_b93476
topic_id: 12
family: 02_observation_measurement
cited_terms: ['measurement_subclass_only_one_unit', 'subclass_to_artifact', 'classification_under_taxonomy']
model: engine-refine
---

An attribute registry establishes the schema for metadata by pairing a human-readable attribute name with a machine-enforceable type constraint. Each attribute definition carries an identifier such as `UNIT-0001` through `UNIT-0004`, a name like `confidence`, `dimension_kind`, `method`, or `recorded_at`, and a type drawn from the XML Schema Datatypes namespace—`xsd:decimal`, `xsd:string`, or `xsd:dateTime`. This decoupling of attribute definition from attribute value permits a single measurement entity to carry heterogeneous metadata without schema migration: the same entity may record a confidence score as a decimal, a method description as a string, and a timestamp as an `xsd:dateTime`, each resolved at query time by joining through the attribute identifier. The type annotation is not decorative; it governs validation, indexing strategy, and the physical storage table into which a value is routed.

**t_measurement_subclass_only_one_unit**

| id | measurement | unit |
| --- | --- | --- |
| UNIT-0001 | temperature gradient | newton meters |
| UNIT-0002 | soil pH | decibels |
| UNIT-0003 | soil moisture | lumens |
| UNIT-0004 | torque | degrees celsius |
| UNIT-0005 | heart rate | lumens |
| UNIT-0006 | packet loss | percent |

**t_measurement_subclass_only_one_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | confidence | xsd:decimal |
| UNIT-0002 | dimension_kind | xsd:string |
| UNIT-0003 | method | xsd:string |
| UNIT-0004 | recorded_at | xsd:dateTime |
| UNIT-0005 | uncertainty | xsd:decimal |
| UNIT-0006 | unit | xsd:string |
| UNIT-0007 | value | xsd:decimal |
| UNIT-0008 | encoding | xsd:string |

**t_measurement_subclass_only_one_unit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0004 | 2024-07-02T10:17:22 |
| UNIT-0002 | UNIT-0002 | UNIT-0004 | 2025-05-17T18:10:32 |
| UNIT-0003 | UNIT-0003 | UNIT-0004 | 2023-09-23T07:34:54 |
| UNIT-0004 | UNIT-0004 | UNIT-0004 | 2023-07-03T17:50:57 |
| UNIT-0005 | UNIT-0005 | UNIT-0004 | 2025-03-23T11:32:54 |
| UNIT-0006 | UNIT-0006 | UNIT-0004 | 2024-10-11T18:39:44 |

**t_measurement_subclass_only_one_unit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | 0.584 |
| UNIT-0002 | UNIT-0001 | UNIT-0005 | 680.89 |
| UNIT-0003 | UNIT-0001 | UNIT-0007 | 977.36 |
| UNIT-0004 | UNIT-0002 | UNIT-0001 | 0.929 |
| UNIT-0005 | UNIT-0002 | UNIT-0005 | 548.84 |
| UNIT-0006 | UNIT-0002 | UNIT-0007 | 51.31 |
| UNIT-0007 | UNIT-0003 | UNIT-0001 | 0.964 |
| UNIT-0008 | UNIT-0003 | UNIT-0005 | 305.75 |

**t_measurement_subclass_only_one_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | Dimension Kind 01 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | Encoding 02 |
| UNIT-0003 | UNIT-0001 | UNIT-0009 | change rationale |
| UNIT-0004 | UNIT-0001 | UNIT-0010 | fr |
| UNIT-0005 | UNIT-0001 | UNIT-0003 | hybrid |
| UNIT-0006 | UNIT-0001 | UNIT-0006 | nm |
| UNIT-0007 | UNIT-0002 | UNIT-0002 | Dimension Kind 07 |
| UNIT-0008 | UNIT-0002 | UNIT-0008 | Encoding 08 |

Values are partitioned across type-specific tables to preserve both query performance and type safety. A decimal attribute such as `confidence` resolves to a value like `0.584` or `680.89` stored in the decimal value table, where the `entity_id` column links the measurement instance—say `UNIT-0001`—to the attribute definition via `attr_id`. String-valued attributes like `dimension_kind` or `method` land in the varchar table, carrying values such as `Dimension Kind 01`, `Encoding 02`, or `change rationale`. Temporal attributes resolve to ISO 8601 timestamps—`2024-07-02T10:17:22`, `2025-05-17T18:10:32`—in the datetime table, while integer attributes such as `exit_code` hold values like `123` or `682` in the integer table. Each value row carries its own surrogate `id` for row-level traceability, and the composite of `entity_id` plus `attr_id` forms the logical key that reconstructs the attribute–value pair regardless of the physical table in which it resides.

Measurement entities themselves are catalogued with a unit of measure and a descriptive label. An entity identified as `UNIT-0001` might represent a `temperature gradient` measured in `degrees celsius`, while `UNIT-0002` could denote a `soil pH` reading in `newton meters`. The identifier space is self-referential: the same `UNIT-0001` identifier appears as an `entity_id` in the value tables and as a primary key in the entity definition table, creating a closed loop that anchors every metadata value to a concrete measurement concept. This design supports extensibility—new measurement types such as `torque` or `soil moisture` can be introduced without altering the value storage architecture, since the attribute registry absorbs the schema evolution.

Artifact integrity and provenance are managed through a parallel registry that binds each artifact to a cryptographic checksum and a license designation. Artifacts such as `checksum-manifest-v4`, `batch-processor-logs`, `genomic-sequence-17`, and `sensor-calibration-v2` are each assigned a unique identifier (`ARTI-0001` through `ARTI-0004`) and a checksum digest like `c0ffee42` or `5e8f3c91`. The checksum serves as a tamper-evident seal: any modification to the underlying artifact invalidates the stored digest, triggering a verification failure in downstream pipelines. Licenses such as `BSD-3-Clause`, `CC-BY-4.0`, and `MIT` are attached at the same level, enabling automated compliance checks that verify whether an artifact's usage rights are compatible with the consuming system's policy. Notably, the same checksum value `5e8f3c91` appears against multiple artifacts, indicating either a shared source or a canonical build artifact distributed across contexts.

**t_subclass_to_artifact**

| id | artifact | checksum | license |
| --- | --- | --- | --- |
| ARTI-0001 | checksum-manifest-v4 | c0ffee42 | BSD-3-Clause |
| ARTI-0002 | batch-processor-logs | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0003 | genomic-sequence-17 | 1a4b6c2d | MIT |
| ARTI-0004 | sensor-calibration-v2 | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0005 | model-weights-resnet50 | 5e8f3c91 | proprietary |
| ARTI-0006 | pipeline-output-stage3 | 9d2b7a16 | Apache-2.0 |
| ARTI-0007 | lab-reagent-batch-A7 | 7b14de08 | Apache-2.0 |
| ARTI-0008 | batch-processor-logs | 1a4b6c2d | BSD-3-Clause |

Classifications are organized under a taxonomy hierarchy that maps each classification concept to a parent taxonomy node. A classification such as `Lab Sample Category`, `Anomaly Detection Model`, `Experiment Phase Code`, or `Telemetry Stream Type` receives its own identifier (`TAXO-0001` through `TAXO-0004`) and is linked to a taxonomy parent—`ARTI-0007` or `ARTI-0008`—establishing the containment relationship. Like the measurement attribute system, the classification attribute registry defines metadata fields (`duration_seconds`, `end_time`, `exit_code`, `host_name`) with their corresponding types (`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`), and values are stored in type-specific tables following the same entity–attribute–value pattern. Classification values include numeric durations such as `4845.29` or `5805.70`, integer codes like `306` or `349`, string descriptors such as `worker-07` or `Log Level 02`, and temporal markers like `2024-03-16T10:40:44`. The taxonomy linkage ensures that classifications are not flat labels but nodes in a navigable hierarchy, enabling roll-up queries and policy inheritance across classification boundaries.

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | ARTI-0007 |
| TAXO-0002 | Anomaly Detection Model | ARTI-0008 |
| TAXO-0003 | Experiment Phase Code | ARTI-0007 |
| TAXO-0004 | Telemetry Stream Type | ARTI-0008 |
| TAXO-0005 | Compliance Framework Set | ARTI-0008 |
| TAXO-0006 | Experiment Phase Code | ARTI-0004 |
| TAXO-0007 | Metadata Schema Version | ARTI-0007 |
| TAXO-0008 | Experiment Phase Code | ARTI-0007 |

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |