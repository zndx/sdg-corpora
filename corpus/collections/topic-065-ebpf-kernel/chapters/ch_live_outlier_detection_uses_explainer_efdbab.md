---
chapter_id: ch_live_outlier_detection_uses_explainer_efdbab
topic_id: 65
family: 02_observation_measurement
cited_terms: ['outlier_detection_uses_explainer', 'aggregation_over_time_window', 'ebpf_event_for_syscall']
model: engine-refine
---

The identifier column functions as the primary key across all relational structures, providing a stable, machine-readable handle for every record regardless of domain. In the outlier fact table, identifiers such as EXPL-0001 through EXPL-0004 anchor individual performance anomalies; in the aggregation-over-time-window tables, identifiers like WIND-0001 and WIND-0002 identify distinct metric definitions; and in the eBPF syscall event tables, identifiers such as SYSC-0001 through SYSC-0004 tag individual system-call observations. This uniform naming convention—whether prefixed with EXPL, WIND, or SYSC—ensures that cross-table joins remain unambiguous and that referential integrity can be enforced through foreign-key relationships. The identifier is the single most critical column for relational navigation, as every other column either belongs to the table it inhabits or references another table through it.

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

**t_ebpf_event_for_syscall**

| id | ebpf | for_syscall |
| --- | --- | --- |
| SYSC-0001 | node-exporter | mmap |
| SYSC-0002 | node-exporter | openat |
| SYSC-0003 | systemd | connect |
| SYSC-0004 | promtail | bind |
| SYSC-0005 | sshd | read |
| SYSC-0006 | nginx | openat |

The attr and attr_type columns together constitute the schema for an entity-attribute-value (EAV) model that underpins the aggregation and eBPF event tables. The attr column stores the human-readable name of a measured property—confidence, dimension_kind, method, recorded_at in the aggregation tables; duration_seconds, end_time, exit_code, host_name in the eBPF tables—while the attr_type column declares the XML Schema Definition type of that property, such as xsd:decimal, xsd:string, xsd:dateTime, or xsd:integer. This separation of schema from data allows the system to accommodate heterogeneous attribute sets without requiring a fixed relational schema. A single entity, identified by entity_id, can carry multiple attributes of different types, each stored in its own typed value table: t_aggregation_over_time_window_val_decimal for numeric measures, t_aggregation_over_time_window_val_datetime for temporal stamps, t_aggregation_over_time_window_val_varchar for free-form text, and analogous tables for the eBPF event domain.

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |

**t_ebpf_event_for_syscall_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0002 | 2025-06-18T16:09:11 |
| SYSC-0002 | SYSC-0001 | SYSC-0008 | 2023-11-08T17:00:45 |
| SYSC-0003 | SYSC-0001 | SYSC-0009 | 2025-04-25T11:16:48 |
| SYSC-0004 | SYSC-0002 | SYSC-0002 | 2024-10-09T21:27:52 |
| SYSC-0005 | SYSC-0002 | SYSC-0008 | 2024-01-10T15:25:08 |
| SYSC-0006 | SYSC-0002 | SYSC-0009 | 2024-10-06T14:16:05 |
| SYSC-0007 | SYSC-0003 | SYSC-0002 | 2023-05-30T09:11:09 |
| SYSC-0008 | SYSC-0003 | SYSC-0008 | 2023-01-31T01:26:46 |

**t_ebpf_event_for_syscall_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | 5668.45 |
| SYSC-0002 | SYSC-0002 | SYSC-0001 | 1373.81 |
| SYSC-0003 | SYSC-0003 | SYSC-0001 | 293.20 |
| SYSC-0004 | SYSC-0004 | SYSC-0001 | 2278.72 |
| SYSC-0005 | SYSC-0005 | SYSC-0001 | 1782.39 |
| SYSC-0006 | SYSC-0006 | SYSC-0001 | 358.71 |

**t_ebpf_event_for_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | node-a01 |
| SYSC-0002 | SYSC-0001 | SYSC-0005 | Log Level 02 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | closeout |
| SYSC-0004 | SYSC-0001 | SYSC-0010 | failed |
| SYSC-0005 | SYSC-0001 | SYSC-0011 | Triggered By 05 |
| SYSC-0006 | SYSC-0002 | SYSC-0004 | worker-07 |
| SYSC-0007 | SYSC-0002 | SYSC-0005 | Log Level 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0006 | review |

The entity column serves as the foreign key that binds attribute values back to the entity they describe. In the aggregation value tables, entity_id values such as WIND-0001 and WIND-0002 appear repeatedly across different attr_id references, indicating that a single time-window definition carries multiple attributes—confidence at 0.781, a dimension kind labeled Dimension Kind 01, and a recorded_at timestamp of 2023-08-23T11:54:15, for example. Similarly, in the eBPF event value tables, entity_id SYSC-0001 references a single syscall event whose attributes include a duration of 5668.45 seconds, an exit code of 7, and a host name of node-a01. The entity column is thus the linchpin of the EAV pattern, ensuring that attribute values are not orphaned and that queries can reconstruct a complete attribute profile for any given entity by joining across the typed value tables.

**t_ebpf_event_for_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | duration_seconds | xsd:decimal |
| SYSC-0002 | end_time | xsd:dateTime |
| SYSC-0003 | exit_code | xsd:integer |
| SYSC-0004 | host_name | xsd:string |
| SYSC-0005 | log_level | xsd:string |
| SYSC-0006 | phase | xsd:string |
| SYSC-0007 | retry_count | xsd:integer |
| SYSC-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_for_syscall_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0003 | 7 |
| SYSC-0002 | SYSC-0001 | SYSC-0007 | 420 |
| SYSC-0003 | SYSC-0002 | SYSC-0003 | 186 |
| SYSC-0004 | SYSC-0002 | SYSC-0007 | 281 |
| SYSC-0005 | SYSC-0003 | SYSC-0003 | 156 |
| SYSC-0006 | SYSC-0003 | SYSC-0007 | 35 |
| SYSC-0007 | SYSC-0004 | SYSC-0003 | 875 |
| SYSC-0008 | SYSC-0004 | SYSC-0007 | 95 |

The duration_seconds column appears both as a standalone column in the fact_outlier table and as an attr_name in the eBPF event attribute definitions, illustrating how the same concept can be modeled either as a first-class column or as an EAV attribute depending on the table's purpose. In fact_outlier, duration_seconds holds values such as 3360.34, 6466.78, 5282.09, and 1182.39, representing the elapsed time in seconds for outlier events identified as EXPL-0001 through EXPL-0004. In the eBPF event tables, duration_seconds is declared as attr_type xsd:decimal and its values—5668.45, 1373.81, 293.20, 2278.72—are stored in the typed value table t_ebpf_event_for_syscall_val_decimal, linked to entities via attr_id SYSC-0001. This dual treatment reflects a design choice: when duration is a primary dimension of analysis, it is promoted to a column; when it is one among many optional attributes, it is stored in the EAV value table.

The exit column, stored as exit_code in fact_outlier, captures the termination status of an observed process or event, with values such as 760, 4, 490, and 124 corresponding to outlier events EXPL-0001 through EXPL-0004. In the eBPF event tables, exit_code is modeled as an EAV attribute with attr_type xsd:integer, and its values—7, 186, and others—are stored in the integer value table t_ebpf_event_for_syscall_val_int. The exit code is a critical diagnostic field: non-zero values signal abnormal termination, and when combined with the retry_count column from fact_outlier (values of 293, 225, 101, 308), they enable root-cause analysis by revealing whether repeated retries correlate with specific exit codes. The retry_count column itself quantifies how many times a process was retried before reaching its final state, providing a direct measure of operational instability.

**fact_outlier**

| id | uses_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| EXPL-0001 | EXPL-0003 | 3360.34 | 760 | 293 |
| EXPL-0002 | EXPL-0003 | 6466.78 | 4 | 225 |
| EXPL-0003 | EXPL-0002 | 5282.09 | 490 | 101 |
| EXPL-0004 | EXPL-0005 | 1182.39 | 124 | 308 |
| EXPL-0005 | EXPL-0002 | 3041.72 | 808 | 59 |
| EXPL-0006 | EXPL-0004 | 3852.38 | 619 | 489 |
| EXPL-0007 | EXPL-0002 | 1453.07 | 682 | 1 |

The uses and category columns, drawn from the dim_uses table, provide a classification layer for usage metadata. The uses column (uses_key in fact_outlier) references a usage record by its identifier—EXPL-0003, EXPL-0002, EXPL-0005—while the dim_uses table maps those identifiers to a uses_label (Uses Label 01 through Uses Label 04) and a uses_category (Uses Category 01 through Uses Category 04). This two-level classification—label for human readability, category for grouping—enables aggregation and filtering of usage data by semantic domain. The misc column, appearing as the value column in all typed value tables, stores the actual attribute values in their native format: decimal numbers like 0.781 and 86.18, datetime strings like 2023-08-23T11:54:15, and free-form text like Dimension Kind 01, Encoding 02, and pre-release note. The misc column is the final piece of the EAV puzzle, holding the data that the attr and attr_type columns describe.

**dim_uses**

| id | uses_label | uses_category |
| --- | --- | --- |
| EXPL-0001 | Uses Label 01 | Uses Category 01 |
| EXPL-0002 | Uses Label 02 | Uses Category 02 |
| EXPL-0003 | Uses Label 03 | Uses Category 03 |
| EXPL-0004 | Uses Label 04 | Uses Category 04 |
| EXPL-0005 | Uses Label 05 | Uses Category 05 |
| EXPL-0006 | Uses Label 06 | Uses Category 06 |