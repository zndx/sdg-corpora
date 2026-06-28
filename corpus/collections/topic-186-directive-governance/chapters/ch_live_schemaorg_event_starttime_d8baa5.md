---
chapter_id: ch_live_schemaorg_event_starttime_d8baa5
topic_id: 186
family: 07_long_tail
cited_terms: ['schemaorg_event_starttime', 'outlier_claim_with_attribute_set', 'perf_buffer_map_subclass']
model: engine-refine
---

In data governance and observability frameworks, the ability to describe entities through typed attributes forms the backbone of structured metadata management. Attributes serve as named properties—such as checksum, created_date, identifier, and license—each bound to a specific type that constrains and clarifies its semantics. Type designations like xsd:string, xsd:date, and cco:DesignativeICE signal the expected data format and provenance conventions, ensuring that downstream consumers interpret values consistently. This type discipline is critical in environments where performance benchmarks (cassandra-perf, netperf-tcp, iperf3-stream, tpch-10gb) and schema artifacts must be catalogued alongside operational metadata, because it enables automated validation, schema evolution tracking, and cross-system interoperability without requiring ad-hoc parsing logic.

**t_perf_buffer_map_subclass**

| id | perf | perf_buffer_config |
| --- | --- | --- |
| MAP-0001 | cassandra-perf | SET-0004 |
| MAP-0002 | netperf-tcp | SET-0007 |
| MAP-0003 | iperf3-stream | SET-0005 |
| MAP-0004 | tpch-10gb | SET-0003 |
| MAP-0005 | spec-jbb2015 | SET-0001 |
| MAP-0006 | pgbench-default | SET-0003 |
| MAP-0007 | spark-stress | SET-0007 |

**t_perf_buffer_map_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MAP-0001 | checksum | xsd:string |
| MAP-0002 | created_date | xsd:date |
| MAP-0003 | identifier | cco:DesignativeICE |
| MAP-0004 | license | xsd:string |
| MAP-0005 | mime_type | xsd:string |
| MAP-0006 | size_bytes | xsd:long |
| MAP-0007 | uri | xsd:string |
| MAP-0008 | version | xsd:integer |

Entities represent the concrete objects being described—performance buffer mappings, schema records, outlier claims—and they acquire meaning through the attribute values attached to them. Values are stored in type-specialized tables: dates such as 2023-01-21, 2023-09-17, 2023-07-22, and 2024-09-18 populate the date-value store; integers like 60, 11, 123, and 12 reside in the integer-value table; and freeform strings including a3f9c21e, gid://svc/77, CC-BY-4.0, and ap-south-2 fill the varchar-value table. Each value row references both an entity and an attribute, creating a flexible entity-attribute-value model that accommodates heterogeneous data without schema migrations. This design supports scenarios where a single entity carries dozens of attributes of varying types, and where new attribute definitions can be introduced without altering the underlying storage structure.

**t_outlier_claim_with_attribute_set**

| id | outlier |
| --- | --- |
| SET-0001 | checksum_mismatch |
| SET-0002 | pipeline_stall |
| SET-0003 | log_flooding |
| SET-0004 | latency_spike |
| SET-0005 | checksum_mismatch |
| SET-0006 | log_flooding |
| SET-0007 | latency_spike |

**t_outlier_claim_with_attribute_set_attribute_set**

| id | attribute_set |
| --- | --- |
| SET-0001 | tolerance_ranges |
| SET-0002 | baseline_values |
| SET-0003 | baseline_values |
| SET-0004 | calibration_constants |
| SET-0005 | tolerance_ranges |
| SET-0006 | temporal_windows |

**t_perf_buffer_map_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0002 | 2023-01-21 |
| MAP-0002 | MAP-0002 | MAP-0002 | 2023-09-17 |
| MAP-0003 | MAP-0003 | MAP-0002 | 2023-07-22 |
| MAP-0004 | MAP-0004 | MAP-0002 | 2024-09-18 |
| MAP-0005 | MAP-0005 | MAP-0002 | 2025-02-25 |
| MAP-0006 | MAP-0006 | MAP-0002 | 2024-02-08 |
| MAP-0007 | MAP-0007 | MAP-0002 | 2024-05-18 |

**t_perf_buffer_map_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | 60 |
| MAP-0002 | MAP-0001 | MAP-0008 | 11 |
| MAP-0003 | MAP-0002 | MAP-0006 | 123 |
| MAP-0004 | MAP-0002 | MAP-0008 | 12 |
| MAP-0005 | MAP-0003 | MAP-0006 | 190 |
| MAP-0006 | MAP-0003 | MAP-0008 | 10 |
| MAP-0007 | MAP-0004 | MAP-0006 | 100 |
| MAP-0008 | MAP-0004 | MAP-0008 | 1 |

**t_perf_buffer_map_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0001 | a3f9c21e |
| MAP-0002 | MAP-0001 | MAP-0003 | gid://svc/77 |
| MAP-0003 | MAP-0001 | MAP-0004 | CC-BY-4.0 |
| MAP-0004 | MAP-0001 | MAP-0009 | ap-south-2 |
| MAP-0005 | MAP-0001 | MAP-0005 | application/xml |
| MAP-0006 | MAP-0001 | MAP-0010 | Name 06 |
| MAP-0007 | MAP-0001 | MAP-0011 | governance |
| MAP-0008 | MAP-0001 | MAP-0012 | Tags 08 |

Outlier detection and remediation workflows rely on a parallel but related construct: attribute sets that group calibration constants, tolerance ranges, and baseline values for systematic comparison against observed behavior. When anomalies such as checksum_mismatch, pipeline_stall, log_flooding, or latency_spike are detected, they are associated with relevant attribute sets through a junction table that encodes the nature of the relationship via a role field. Roles like contributor and owner distinguish between entities that supply data to a set and those that govern or own it, enabling fine-grained access control and audit trails. This subject-target-role pattern—where the outlier acts as the subject, the attribute set as the target, and the role clarifies the directional relationship—provides a general-purpose mechanism for modeling any many-to-many association with semantic context.

**t_outlier_claim_with_attribute_set__attribute_set**

| id | outlier_id | attribute_set_id | role |
| --- | --- | --- | --- |
| SET-0001 | SET-0003 | SET-0005 | contributor |
| SET-0002 | SET-0001 | SET-0004 | owner |
| SET-0003 | SET-0004 | SET-0001 | contributor |
| SET-0004 | SET-0007 | SET-0002 | contributor |
| SET-0005 | SET-0004 | SET-0005 | contributor |
| SET-0006 | SET-0006 | SET-0006 | contributor |
| SET-0007 | SET-0004 | SET-0002 | owner |
| SET-0008 | SET-0001 | SET-0006 | owner |

Temporal and categorical metadata anchor these relationships in time and classification schemes. Event start times, each carrying a descriptive label such as Event Start Time Label 01 through Event Start Time Label 04 and a category designation like Event Start Time Category 01 through Event Start Time Category 04, serve as temporal dimensions that can be joined to fact records for time-series analysis. In the schema registry, for instance, versioned artifacts identified by STAR-0001 through STAR-0004 are linked to event start time keys, carry size measurements ranging from 114,301,972 to 998,785,819 bytes, and are tagged with version numbers from 3 to 8. This combination of temporal, categorical, and quantitative metadata enables operators to trace schema evolution, correlate performance regressions with specific configuration baselines, and reconstruct the state of the system at any point in time.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |