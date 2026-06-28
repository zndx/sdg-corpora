---
chapter_id: ch_live_ebpf_event_basic_62e84a
topic_id: 120
family: 02_observation_measurement
cited_terms: ['ebpf_event_basic', 'lineage_observed_by_event', 'syscall_with_argument_count']
model: engine-refine
---

The architecture of event tracking and lineage provenance rests on a uniform decomposition of identifiers, typed attributes, and their associated values into a star-schema topology that separates core entity definitions from their variable properties. Each event—whether an eBPF probe such as network_drop_tracker, dns_query_log, netsec_monitor, or disk_iops_counter, or a lineage observation such as sensor-fusion-pipeline, financial-risk-model, data-lake-ingestion, or quality-control-assay—is assigned a stable identifier (EVEN-0001 through EVEN-0004) that anchors all subsequent attribute-value pairs. The attribute schema itself is defined in a dedicated metadata table where each attribute carries a human-readable name (duration_seconds, end_time, exit_code, host_name for eBPF events; confidence, dimension_kind, method, recorded_at for lineage events) and an XML Schema datatype (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) that governs value validation and storage routing. This separation of attribute definition from value storage enables the system to accommodate heterogeneous property sets without schema migration, as each attribute type maps to its own value table: decimal values such as 2084.55 or 0.142, integer values such as 615 or 227, string values such as gw-12 or Log Level 02, and datetime values such as 2024-02-22T10:41:40 or 2023-01-03T08:23:46.

**t_ebpf_event_basic**

| id | ebpf |
| --- | --- |
| EVEN-0001 | network_drop_tracker |
| EVEN-0002 | dns_query_log |
| EVEN-0003 | netsec_monitor |
| EVEN-0004 | disk_iops_counter |
| EVEN-0005 | memory_leak_detector |
| EVEN-0006 | process_spawn_alert |
| EVEN-0007 | syscall_tracer |
| EVEN-0008 | network_drop_tracker |

**t_ebpf_event_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | duration_seconds | xsd:decimal |
| EVEN-0002 | end_time | xsd:dateTime |
| EVEN-0003 | exit_code | xsd:integer |
| EVEN-0004 | host_name | xsd:string |
| EVEN-0005 | log_level | xsd:string |
| EVEN-0006 | phase | xsd:string |
| EVEN-0007 | retry_count | xsd:integer |
| EVEN-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-02-22T10:41:40 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 2025-04-20T21:58:53 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | 2024-07-05T03:32:46 |
| EVEN-0004 | EVEN-0002 | EVEN-0002 | 2025-01-15T01:37:56 |
| EVEN-0005 | EVEN-0002 | EVEN-0008 | 2024-11-30T06:10:00 |
| EVEN-0006 | EVEN-0002 | EVEN-0009 | 2023-10-12T13:43:33 |
| EVEN-0007 | EVEN-0003 | EVEN-0002 | 2025-05-19T17:11:08 |
| EVEN-0008 | EVEN-0003 | EVEN-0008 | 2024-12-23T02:27:40 |

**t_ebpf_event_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 2084.55 |
| EVEN-0002 | EVEN-0002 | EVEN-0001 | 3586.50 |
| EVEN-0003 | EVEN-0003 | EVEN-0001 | 2389.78 |
| EVEN-0004 | EVEN-0004 | EVEN-0001 | 1708.37 |
| EVEN-0005 | EVEN-0005 | EVEN-0001 | 4904.40 |
| EVEN-0006 | EVEN-0006 | EVEN-0001 | 2045.89 |
| EVEN-0007 | EVEN-0007 | EVEN-0001 | 4164.85 |
| EVEN-0008 | EVEN-0008 | EVEN-0001 | 4492.01 |

**t_ebpf_event_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0003 | 615 |
| EVEN-0002 | EVEN-0001 | EVEN-0007 | 227 |
| EVEN-0003 | EVEN-0002 | EVEN-0003 | 918 |
| EVEN-0004 | EVEN-0002 | EVEN-0007 | 103 |
| EVEN-0005 | EVEN-0003 | EVEN-0003 | 872 |
| EVEN-0006 | EVEN-0003 | EVEN-0007 | 453 |
| EVEN-0007 | EVEN-0004 | EVEN-0003 | 370 |
| EVEN-0008 | EVEN-0004 | EVEN-0007 | 219 |

**t_ebpf_event_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | gw-12 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | Log Level 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0006 | execution |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | failed |
| EVEN-0005 | EVEN-0001 | EVEN-0011 | Triggered By 05 |
| EVEN-0006 | EVEN-0002 | EVEN-0004 | edge-03 |
| EVEN-0007 | EVEN-0002 | EVEN-0005 | Log Level 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0006 | review |

**t_lineage_observed_by_event**

| id | lineage |
| --- | --- |
| EVEN-0001 | sensor-fusion-pipeline |
| EVEN-0002 | financial-risk-model |
| EVEN-0003 | data-lake-ingestion |
| EVEN-0004 | quality-control-assay |
| EVEN-0005 | iot-telemetry-ingest |
| EVEN-0006 | financial-risk-model |

**t_lineage_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_lineage_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2024-07-15T19:59:01 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2023-01-03T08:23:46 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2024-06-13T23:29:26 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-03-31T12:19:15 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2023-03-05T06:53:09 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2023-03-19T16:32:15 |

**t_lineage_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.142 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 754.57 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 852.05 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.607 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 551.25 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 531.16 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.333 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 159.50 |

**t_lineage_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | pre-release note |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | en |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | ratio |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

The entity column in each value table establishes the foreign-key linkage between a concrete event instance and its attribute values, while the attr_id column resolves to the corresponding attribute definition. An event such as EVEN-0001 may simultaneously carry a decimal duration of 2084.55, an integer exit code of 615, a string host name of gw-12, and a datetime end_time of 2024-02-22T10:41:40, each stored in its respective typed value table under the same entity_id. This polyglot persistence pattern—where values are partitioned by schema type rather than by attribute—ensures that numeric precision, temporal ordering, and string encoding are preserved without the ambiguity of a single text column. The same structural discipline applies to lineage events, where EVEN-0001 through EVEN-0004 each carry confidence scores (0.142, 0.607), dimension kinds (Dimension Kind 01), encoding specifications (Encoding 02), and methodological notes (pre-release note, en), all resolved through the same entity-to-attr_id join mechanism.

At the analytical layer, the fact table for system call observations introduces two additional dimensions of aggregation: argument count and event count. Each row in the fact table is identified by a code (COUN-0001 through COUN-0004) and carries an event_count—a measure of how many individual events fall under that classification, ranging from 52 to 382—and a foreign key to the argument count dimension. The argument count dimension itself provides a two-level classification: a human-readable label (Argument Count Label 01 through Argument Count Label 04) and a categorical grouping (Argument Count Category 01 through Argument Count Category 04) that supports roll-up and drill-down operations across syscall observations. This design permits analysts to query not only how many events occurred under a given argument count configuration but also how those configurations cluster into broader semantic categories, enabling both granular forensic investigation and high-level trend analysis within a single query plane.

**fact_syscall**

| id | argument_count_key | event_count |
| --- | --- | --- |
| COUN-0001 | COUN-0008 | 238 |
| COUN-0002 | COUN-0004 | 52 |
| COUN-0003 | COUN-0001 | 198 |
| COUN-0004 | COUN-0003 | 382 |
| COUN-0005 | COUN-0008 | 283 |
| COUN-0006 | COUN-0005 | 288 |

**dim_argument_count**

| id | argument_count_label | argument_count_category |
| --- | --- | --- |
| COUN-0001 | Argument Count Label 01 | Argument Count Category 01 |
| COUN-0002 | Argument Count Label 02 | Argument Count Category 02 |
| COUN-0003 | Argument Count Label 03 | Argument Count Category 03 |
| COUN-0004 | Argument Count Label 04 | Argument Count Category 04 |
| COUN-0005 | Argument Count Label 05 | Argument Count Category 05 |
| COUN-0006 | Argument Count Label 06 | Argument Count Category 06 |
| COUN-0007 | Argument Count Label 07 | Argument Count Category 07 |
| COUN-0008 | Argument Count Label 08 | Argument Count Category 08 |

The practical significance of this structure lies in its ability to maintain referential integrity across three distinct value domains—eBPF event telemetry, lineage provenance, and syscall aggregation—while preserving type safety and enabling ad hoc attribute extension. Because attribute definitions are decoupled from values, new properties can be introduced without altering the value tables or the event core; the system simply registers a new attr_name with its corresponding attr_type and begins routing values to the appropriate typed store. The identifier scheme (EVEN- prefixed for events, COUN- prefixed for argument count references) provides an immediate semantic signal about the row's domain, while the entity and attr_id columns in every value table form the join keys that reconstruct a complete event profile from its distributed components. In operational practice, this means that a single query can retrieve the full attribute set for network_drop_tracker EVEN-0001—its duration, end time, exit code, and host name—alongside its lineage confidence score and its position within the argument count hierarchy, all through standard relational joins without application-level assembly.