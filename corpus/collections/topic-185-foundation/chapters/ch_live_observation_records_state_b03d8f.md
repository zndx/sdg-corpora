---
chapter_id: ch_live_observation_records_state_b03d8f
topic_id: 185
family: 02_observation_measurement
cited_terms: ['observation_records_state', 'attrkey_with_value_type', 'annotation_at_tier']
model: engine-refine
---

Attributes constitute the fundamental units of observability within a telemetry framework, each defined by a name and a strict type that governs how its value is stored, validated, and queried. An attribute such as `duration_seconds` carries the type `xsd:decimal`, while `end_time` is bound to `xsd:dateTime`, `exit_code` to `xsd:integer`, and `host_name` to `xsd:string`. This type discipline propagates into the value layer, where separate typed stores—decimal, integer, datetime, and variable-length character—partition attribute values by their semantic domain. A single entity, identified by a reference such as `STAT-0001`, may thus carry a duration of `4243.13` in the decimal store, an exit code of `958` in the integer store, a host name of `worker-07` in the varchar store, and an end time of `2023-08-02T17:44:58` in the datetime store, all linked through a common entity identifier and a foreign key into the attribute definition table. The separation of value types eliminates null-handling ambiguity and enforces schema-level correctness at query time, since a decimal value can never be misinterpreted as a timestamp or a string.

**t_attrkey_with_value_type**

| id | attrkey | value_type | checksum_algo | code |
| --- | --- | --- | --- | --- |
| TYPE-0001 | config_hash | datetime_utc | md5 | C-07 |
| TYPE-0002 | data_quality_flag | url_string | sha256 | A-01 |
| TYPE-0003 | event_type | temperature_c | sha256 | A-01 |
| TYPE-0004 | timestamp_utc | binary_blob | md5 | E-21 |
| TYPE-0005 | batch_number | datetime_utc | md5 | E-21 |
| TYPE-0006 | timestamp_utc | decimal_number | sha1 | E-21 |
| TYPE-0007 | device_mac | json_object | md5 | C-07 |
| TYPE-0008 | firmware_version | json_object | blake2b | B-12 |

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

The attribute definition layer itself is governed by a registry of attribute keys, each of which maps a logical name to a canonical value type and, where integrity matters, to a checksum algorithm. The key `config_hash` is associated with the value type `datetime_utc` and the checksum algorithm `md5`; `data_quality_flag` maps to `url_string` with `sha256`; `event_type` maps to `temperature_c` with `sha256`; and `timestamp_utc` maps to `binary_blob` with `md5`. These checksum algorithms—`md5` and `sha256`—serve as cryptographic anchors for data provenance, ensuring that any derived or replicated value can be verified against its source. Each attribute key is further classified by a code such as `C-07`, `A-01`, or `E-21`, which encodes its operational category and governs downstream routing, retention, and access policies. The registry thus functions as both a type dictionary and an integrity policy store, binding semantic meaning to computational guarantees.

Observation records sit at the apex of this hierarchy, each identified by a unique key such as `STAT-0001` through `STAT-0004` and describing a discrete event: a `Network latency spike`, a `Water quality anomaly`, or a `Reactor pressure threshold` that appears twice across the record set. Each observation is associated with a record artifact—an `Event log manifest`, a `Sensor data packet`, or a `Diagnostic trace file`—that provides the raw material from which attribute values are extracted. The observation record is the primary entity to which all attribute values are attached; the entity identifier in every value table points back to the observation, not to a physical device or a logical service, thereby decoupling the abstract event from its provenance. This design permits a single observation to accumulate attributes from multiple sources and over multiple time windows without requiring a denormalized record structure.

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | Event log manifest |
| STAT-0002 | Water quality anomaly | Event log manifest |
| STAT-0003 | Reactor pressure threshold | Sensor data packet |
| STAT-0004 | Reactor pressure threshold | Diagnostic trace file |
| STAT-0005 | Network latency spike | Observation index cache |
| STAT-0006 | pH deviation alert | Sensor data packet |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

Annotations extend the observation model into a tiered governance layer, where metadata about data quality, calibration, and versioning is attached at specific processing tiers. An annotation such as `SensorCalibration Q4` or `TelemetryLabel HighLatency` is classified at a tier like `L0 Unprocessed`, `Cold Archive`, or `Baseline Reference`, establishing a lifecycle context for the associated observation. The annotation attribute layer mirrors the observation attribute layer in structure: attributes like `confidence` (typed `xsd:decimal`), `dimension_kind` and `method` (typed `xsd:string`), and `recorded_at` (typed `xsd:dateTime`) are defined once and then instantiated across annotations. A confidence value of `0.089` or `0.223` and a dimension kind of `Dimension Kind 01` are stored in the same typed value tables, linked to the annotation entity through the same foreign-key pattern. The tier classification ensures that annotations are queryable by their processing stage, enabling auditors to distinguish between pre-processing labels and post-archive quality flags.

**t_annotation_at_tier**

| id | annotation | at_tier |
| --- | --- | --- |
| TIER-0001 | SensorCalibration Q4 | L0 Unprocessed |
| TIER-0002 | TelemetryLabel HighLatency | Cold Archive |
| TIER-0003 | QualityFlag Pass | Baseline Reference |
| TIER-0004 | DatasetVersion v3.2.1 | L0 Unprocessed |
| TIER-0005 | ProvenanceSource EPA7 | Cold Archive |
| TIER-0006 | ProvenanceSource EPA7 | L0 Unprocessed |
| TIER-0007 | ObservationNote Drift | Derived Metrics |
| TIER-0008 | ComplianceLevel SOC2 | Cold Archive |

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

The value tables themselves are the operational heart of the system, each one a partitioned store keyed by a unique identifier and connected to both an entity and an attribute through foreign keys. The datetime values—`2023-08-02T17:44:58`, `2025-03-10T03:55:42`, `2024-08-16T12:27:34`, `2024-01-02T12:08:53`—reside in one table; the decimal values—`4243.13`, `4365.77`, `5274.11`, `1567.00`—in another; the integers—`958`, `456`, `517`, `41`—in a third; and the variable-length strings—`worker-07`, `Log Level 02`, `execution`, `pending`, `change rationale`, `es`—in a fourth. This partitioning is not merely a normalization choice; it is a performance and correctness mechanism. A query for all decimal attributes of a given entity touches only the decimal store, avoiding the overhead of type discrimination and null checks that would be required in a single wide table. The identifier in each value row—`STAT-0001`, `TIER-0001`, and so on—provides a stable, queryable handle that survives entity renames and attribute redefinitions, anchoring the value to its provenance regardless of upstream schema evolution.