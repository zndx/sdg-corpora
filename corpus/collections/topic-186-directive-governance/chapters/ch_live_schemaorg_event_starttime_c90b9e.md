---
chapter_id: ch_live_schemaorg_event_starttime_c90b9e
topic_id: 186
family: 07_long_tail
cited_terms: ['schemaorg_event_starttime', 'measurement_of_artifact', 'anomaly_in_metric']
model: engine-refine
---

Identifiers serve as the immutable backbone of the data model, anchoring every record to a unique, auditable key. In the schema registry, identifiers such as STAR-0001 through STAR-0004 designate distinct schema versions, while artifact measurements carry identifiers like ARTI-0001 and ARTI-0003, and anomaly records are keyed by METR-0001 through METR-0004. These identifiers are not merely labels; they are the join keys that bind together the dimensional, fact, and attribute-value layers of the warehouse. An identifier such as ARTI-0001, for instance, simultaneously references a latency_p99_ms measurement in the artifact table and appears as an entity_id across multiple value tables, ensuring that every attribute value can be traced back to its originating measurement or anomaly without ambiguity.

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

**t_measurement_of_artifact_attr**

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

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

**t_anomaly_in_metric**

| id | anomaly | anomaly_in_metric |
| --- | --- | --- |
| METR-0001 | Cache Eviction Storm | ARTI-0003 |
| METR-0002 | Memory Leak Spike | ARTI-0005 |
| METR-0003 | Memory Leak Spike | ARTI-0002 |
| METR-0004 | DNS Resolution Timeout | ARTI-0002 |
| METR-0005 | Kernel Panic | ARTI-0003 |
| METR-0006 | Memory Leak Spike | ARTI-0004 |

**t_anomaly_in_metric_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0004 | 2025-04-23T06:08:33 |
| METR-0002 | METR-0002 | METR-0004 | 2025-05-24T14:06:40 |
| METR-0003 | METR-0003 | METR-0004 | 2024-05-21T09:32:53 |
| METR-0004 | METR-0004 | METR-0004 | 2024-12-09T22:35:58 |
| METR-0005 | METR-0005 | METR-0004 | 2024-11-21T20:37:39 |
| METR-0006 | METR-0006 | METR-0004 | 2024-09-07T09:05:43 |

Attributes and their types define the semantic properties of each entity. The attribute definition tables establish a schema for what can be measured about an artifact or anomaly: attr_name fields capture property names such as confidence, dimension_kind, method, and recorded_at, while attr_type enforces data typing through XML Schema Datatypes—xsd:decimal for numeric confidence scores, xsd:string for categorical descriptors like dimension_kind, and xsd:dateTime for temporal metadata. This separation of attribute metadata from attribute values enables flexible, schema-on-read semantics. A single entity such as ARTI-0001 can carry a decimal confidence value of 0.670, a string dimension_kind of "Dimension Kind 01", and a recorded_at timestamp of 2023-05-19T07:46:35, each stored in its own type-specific value table (t_measurement_of_artifact_val_decimal, t_measurement_of_artifact_val_varchar, t_measurement_of_artifact_val_datetime) and linked through the shared entity and attr foreign keys.

The entity concept represents the subject of observation—whether a measurement artifact or an anomaly instance—and is referenced consistently across the value tables. An entity_id such as ARTI-0001 appears in the decimal value table with attr_id ARTI-0001 carrying a value of 0.670, and in the varchar table with attr_id ARTI-0002 carrying "Dimension Kind 01", demonstrating how a single entity aggregates heterogeneous attribute values. Similarly, anomaly entities like METR-0001 (a Cache Eviction Storm affecting metric ARTI-0003) carry their own attribute values: a confidence of 0.515, a dimension_kind of "Dimension Kind 01", and a recorded_at timestamp of 2025-04-23T06:08:33. This entity-centric design ensures that all attribute data—regardless of type—can be queried holistically for any given observation.

**t_anomaly_in_metric_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| METR-0001 | confidence | xsd:decimal |
| METR-0002 | dimension_kind | xsd:string |
| METR-0003 | method | xsd:string |
| METR-0004 | recorded_at | xsd:dateTime |
| METR-0005 | uncertainty | xsd:decimal |
| METR-0006 | unit | xsd:string |
| METR-0007 | value | xsd:decimal |
| METR-0008 | encoding | xsd:string |

**t_anomaly_in_metric_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0001 | 0.515 |
| METR-0002 | METR-0001 | METR-0005 | 505.78 |
| METR-0003 | METR-0001 | METR-0007 | 646.06 |
| METR-0004 | METR-0002 | METR-0001 | 0.337 |
| METR-0005 | METR-0002 | METR-0005 | 475.15 |
| METR-0006 | METR-0002 | METR-0007 | 359.78 |
| METR-0007 | METR-0003 | METR-0001 | 0.527 |
| METR-0008 | METR-0003 | METR-0005 | 251.95 |

**t_anomaly_in_metric_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0002 | Dimension Kind 01 |
| METR-0002 | METR-0001 | METR-0008 | Encoding 02 |
| METR-0003 | METR-0001 | METR-0009 | calibration record |
| METR-0004 | METR-0001 | METR-0010 | de |
| METR-0005 | METR-0001 | METR-0003 | hybrid |
| METR-0006 | METR-0001 | METR-0006 | m/s |
| METR-0007 | METR-0002 | METR-0002 | Dimension Kind 07 |
| METR-0008 | METR-0002 | METR-0008 | Encoding 08 |

Event start times and their associated categories provide temporal and organizational context for schema versions. The dimension table dim_event_start_time maps each event_start_time_key (STAR-0001 through STAR-0004) to a human-readable label such as "Event Start Time Label 01" and a category classification like "Event Start Time Category 01". These keys are then referenced from the fact table fact_schemaorg, where each schema version record carries an event_start_time_key that anchors it to a point in time. This temporal anchoring is critical for compliance auditing: when a schema version changes, the event start time provides the exact moment of transition, and the category enables grouping and filtering of versions by operational context.

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

Size bytes and version numbers complete the schema versioning picture by capturing the storage footprint and revision state of each schema definition. In fact_schemaorg, version values range from 3 to 8 across the four records, while size_bytes spans from approximately 114 MB (114301972 bytes for STAR-0002) to nearly 1 GB (998785819 bytes for STAR-0004). These metrics are essential for capacity planning and for detecting anomalous schema growth that could indicate data quality issues or uncontrolled expansion. Together with the event start time and category, they form a complete provenance record for each schema version, enabling operators to answer not just what changed, but when, under what classification, and at what storage cost.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |