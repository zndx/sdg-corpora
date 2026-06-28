---
chapter_id: ch_live_transformation_ends_at_7882f2
topic_id: 106
family: 05_provo_lineage
cited_terms: ['transformation_ends_at', 'profiling_basic', 'ebpf_event_min_one_attribute']
model: engine-refine
---

The attribute registry establishes a typed schema for event metadata, where each attribute is declared with a name and an XSD type that constrains the domain of permissible values. An attribute such as `duration_seconds` carries the type `xsd:decimal`, permitting fractional measurements like 2938.76 or 6550.82, while `end_time` is typed as `xsd:dateTime`, anchoring temporal observations to ISO 8601 timestamps such as 2024-05-05T15:51:23. The integer type `xsd:integer` governs exit codes and host identifiers, and `xsd:string` accommodates free-form values like node designations (node-b14) and state descriptors (initiation, pending). This type discipline ensures that downstream consumers of the attribute store can parse and validate values without schema discovery at query time, a design choice that reduces runtime overhead in high-throughput telemetry pipelines.

Event entities serve as the primary join key between the attribute definitions and their concrete values. Each entity—identified by a stable identifier such as ATTR-0001 or ATTR-0002—aggregates multiple attribute values across the value tables, with the entity_id column providing the foreign-key linkage. A single entity may carry a decimal measurement from `t_ebpf_event_min_one_attribute_val_decimal`, a datetime from the corresponding value table, an integer from the integer store, and a varchar from the character store, all unified under one entity identifier. This star-schema decomposition separates the attribute schema from the value storage, allowing the system to support heterogeneous event types—perf_event_sample, xdp_rx_drop, tc_ingress_filter—without requiring a monolithic table with nullable columns for every possible attribute.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | perf_event_sample |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tc_ingress_filter |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | tracepoint_sched_switch |
| ATTR-0006 | lsm_bpf_attach |

**t_ebpf_event_min_one_attribute_attr**

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

**t_ebpf_event_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-05-05T15:51:23 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2023-02-23T16:05:24 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2023-10-25T19:35:09 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-08-09T05:49:50 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2025-04-07T23:06:46 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2023-01-30T19:25:12 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2023-12-02T01:15:04 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2023-01-06T05:08:04 |

**t_ebpf_event_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 2938.76 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3337.03 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 6550.82 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 5328.03 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 811.82 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 7052.31 |

**t_ebpf_event_min_one_attribute_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 465 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 59 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 938 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 81 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 9 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 492 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 120 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 470 |

**t_ebpf_event_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | node-b14 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | pending |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | edge-03 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | closeout |

Profiling records extend this pattern by attaching temporal and outcome metadata to discrete execution units. The fact table for profiling captures the wall-clock duration of each profiling session, with values ranging from 1113.38 seconds for a short-lived routine to 6716.87 seconds for a prolonged analysis pass. Exit codes—725, 809, 348, 827—encode the termination status of each profiling run, while the retry count column records how many times the system attempted to complete the operation before reaching a terminal state, with observed counts spanning from 186 to 303. The profiling key itself, such as PROF-0003 or PROF-0006, functions as a logical grouping identifier that may be shared across multiple fact rows, enabling aggregation by profiling session rather than by individual measurement.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

Transformation completion records mirror the profiling structure but operate at a higher level of abstraction, tracking the lifecycle of data engineering operations. Each transformation—whether an ETL pipeline run, a feature engineering routine, a telemetry normalization pass, or a schema migration script—is assigned a unique identifier (ENDS-0001 through ENDS-0004) and a completion timestamp drawn from the ended_at_time column. The log level column records the severity of the final state, with values ranging from info through warning to critical, providing an immediate signal for operational dashboards. Retry counts in this table reach as high as 446, indicating that certain transformations—particularly schema migrations—may require extensive recovery attempts before stabilizing.

**t_transformation_ends_at**

| id | transformation | ended_at_time | log_level | retry_count |
| --- | --- | --- | --- | --- |
| ENDS-0001 | ETL pipeline run | 2024-02-28T16:45:12Z | info | 210 |
| ENDS-0002 | Feature engineering routine | 2024-05-17T07:30:00Z | critical | 216 |
| ENDS-0003 | Telemetry normalization pass | 2024-02-28T16:45:12Z | warning | 307 |
| ENDS-0004 | Schema migration script | 2024-04-09T11:15:30Z | warning | 446 |
| ENDS-0005 | Audit record sync | 2024-03-15T14:22:01Z | info | 371 |
| ENDS-0006 | Schema migration script | 2024-05-17T07:30:00Z | info | 187 |
| ENDS-0007 | Data reconciliation workflow | 2023-09-30T23:59:59Z | error | 426 |
| ENDS-0008 | ETL pipeline run | 2024-01-22T18:10:55Z | warning | 196 |

The dimension tables for profiling introduce a categorical taxonomy that partitions execution records into meaningful groups. Each profiling dimension row carries a profiling label, a profiling category, and a foreign key to the category dimension, where the category name provides a human-readable classification. The category identifiers (PROF-0001 through PROF-0008) form a separate namespace from the profiling identifiers, ensuring that category hierarchies can evolve independently of the profiling records themselves. This separation allows the system to reclassify existing profiling sessions without modifying the fact table, a capability that proves essential when operational taxonomies shift in response to changing monitoring requirements.

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |

The misc column appears across multiple value tables as the carrier for the actual data payload—whether that payload is a datetime, a decimal, an integer, or a variable-length string. Its generic naming reflects the fact that the column's semantic meaning is determined by the attr_id foreign key and the corresponding attr_type declaration in the attribute registry, not by the column name itself. This indirection is the mechanism that allows a single value table to store heterogeneous data types while preserving type safety through the schema layer. In practice, the misc column in the datetime table holds timestamps like 2023-02-23T16:05:24, in the decimal table it holds measurements like 3337.03, in the integer table it holds codes like 465 and 59, and in the varchar table it holds labels like Log Level 02 and status strings like pending, all governed by the same structural pattern.