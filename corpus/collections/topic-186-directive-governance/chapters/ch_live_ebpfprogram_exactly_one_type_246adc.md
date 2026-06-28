---
chapter_id: ch_live_ebpfprogram_exactly_one_type_246adc
topic_id: 186
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_exactly_one_type', 'trace_basic', 'equiv_intersect_with_restriction']
model: engine-refine
---

An identifier is the immutable key that anchors every record in the system, providing a stable reference point across all relationships and value tables. These identifiers follow a structured naming convention—TYPE-0001 through TYPE-0004 for eBPF program type definitions, TRAC-0001 through TRAC-0004 for trace records, and REST-0001 through REST-0004 for equivalence restrictions—ensuring that each entity can be unambiguously located regardless of how its descriptive attributes change over time. The identifier serves as the primary key in every table, from the core entity definitions through the attribute metadata and value storage layers, forming the backbone of referential integrity across the entire data model.

**t_trace_basic**

| id | trace | observed_at |
| --- | --- | --- |
| TRAC-0001 | load-balancer-routing | TYPE-0001 |
| TRAC-0002 | frontend-render-loop | TYPE-0001 |
| TRAC-0003 | message-broker-poll | TYPE-0002 |
| TRAC-0004 | worker-task-execution | TYPE-0003 |
| TRAC-0005 | cache-hit-miss-run | TYPE-0004 |
| TRAC-0006 | message-broker-poll | TYPE-0005 |

**t_trace_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |

**t_trace_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 376 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 314 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 88 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 293 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 468 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 480 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 297 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 77 |

An attribute defines a measurable or descriptive property of an entity, while the attribute type specifies the semantic category and data format of that property. In the trace system, attributes such as duration_seconds, end_time, exit_code, and host_name are declared with corresponding types drawn from the XML Schema Definition namespace—xsd:decimal for numeric measurements, xsd:dateTime for temporal values, xsd:integer for whole-number counts, and xsd:string for textual labels. This separation between attribute definition and attribute type enables the system to validate values at ingestion time and to route them to the appropriate storage table based on their declared type, ensuring that a duration of 1505.64 is stored alongside other decimal values while a timestamp like 2023-04-16T02:44:01 is routed to the datetime store.

An entity represents a concrete instance of a tracked phenomenon—a specific trace execution, an eBPF program binding, or an equivalence restriction—and is identified by its unique identifier while carrying its descriptive attributes through the value tables. The entity acts as the anchor point in the entity-attribute-value pattern: each value row references its entity through the entity_id column and its attribute through the attr_id column, creating a sparse, extensible structure where not every entity needs every attribute. For example, the trace identified as TRAC-0001 carries a duration of 1505.64 in the decimal value table, a host name of node-b14 in the varchar table, and multiple datetime and integer values, while the trace TRAC-0002 carries a duration of 5061.29 and an exit code of 88, demonstrating how the same entity can accumulate a heterogeneous set of attributes without requiring a fixed schema.

**t_trace_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2023-04-16T02:44:01 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-07-31T11:49:14 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2025-04-08T10:42:35 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2023-05-20T09:49:51 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2023-07-22T09:50:59 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2023-11-29T05:54:22 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2023-07-03T21:45:54 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-03-31T15:28:51 |

**t_trace_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 1505.64 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 5061.29 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 4957.42 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 1589.98 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 2846.09 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 1626.04 |

**t_trace_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | node-b14 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | complete |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | ingest-21 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

**t_equiv_intersect_with_restriction**

| id | equiv | equiv_2 | related |
| --- | --- | --- | --- |
| REST-0001 | sensor_array_gamma | stream_processor_8 | s3_export_bucket |
| REST-0002 | event_bus_core | sensor_bridge_delta | snowflake_warehouse_prod |
| REST-0003 | kafka_stream_primary | batch_mirror_main | s3_export_bucket |
| REST-0004 | telemetry_broker_alpha | vector_cache_prod | prometheus_scrape_target |

The misc column stores the actual value payload for each entity-attribute pair, with the data type determined by the attribute's declared type and the corresponding value table. Decimal values such as 1505.64, 5061.29, 4957.42, and 1589.98 populate the decimal store; integer values like 376, 314, 88, and 293 populate the integer store; datetime values including 2023-04-16T02:44:01, 2024-07-31T11:49:14, and 2025-04-08T10:42:35 populate the datetime store; and string values such as node-b14, Log Level 02, initiation, and complete populate the varchar store. This type-partitioned value storage avoids the overhead of storing every value as a generic string while preserving the flexibility of the EAV pattern.

A subject and target pair defines the directional relationship between two entities, with the role column specifying the nature of that relationship from the subject's perspective. In the eBPF program type binding table, the subject column (ebpfprogram_id) references one program type entity while the target column (program_type_id) references another, and the role—such as owner or observer—clarifies whether the subject program owns the target type or merely observes it. For instance, the binding with identifier TYPE-0001 establishes that program TYPE-0003 relates to program type TYPE-0005 in an owner capacity, while the binding TYPE-0002 shows program TYPE-0005 relating to program type TYPE-0004 as an observer, creating a rich graph of program-to-type associations that goes beyond simple many-to-many mapping.

**t_ebpfprogram_exactly_one_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | fentry_do_fork |
| TYPE-0002 | kprobe_sched_switch |
| TYPE-0003 | kprobe_sched_switch |
| TYPE-0004 | fentry_do_fork |
| TYPE-0005 | tc_ingress_filter |
| TYPE-0006 | tc_ingress_filter |

**t_ebpfprogram_exactly_one_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | kprobe |
| TYPE-0002 | kprobe |
| TYPE-0003 | kprobe |
| TYPE-0004 | socket_filter |
| TYPE-0005 | lsm |
| TYPE-0006 | kprobe |

**t_ebpfprogram_exactly_one_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0003 | TYPE-0005 | owner |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | observer |
| TYPE-0003 | TYPE-0004 | TYPE-0006 | owner |
| TYPE-0004 | TYPE-0003 | TYPE-0002 | owner |
| TYPE-0005 | TYPE-0006 | TYPE-0003 | owner |
| TYPE-0006 | TYPE-0006 | TYPE-0002 | reviewer |
| TYPE-0007 | TYPE-0004 | TYPE-0003 | owner |
| TYPE-0008 | TYPE-0005 | TYPE-0001 | observer |

An equivalence restriction captures relationships between system components by declaring that two entities are equivalent or related in a specific context, with the related column providing additional linkage to downstream consumers. The restriction REST-0001, for example, declares that sensor_array_gamma is equivalent to stream_processor_8 and is related to s3_export_bucket, while REST-0003 establishes that kafka_stream_primary is equivalent to batch_mirror_main and also relates to s3_export_bucket, suggesting that multiple equivalence chains can converge on a single downstream target. These restrictions enable the system to reason about component interoperability, route telemetry through equivalent paths, and maintain a coherent view of the infrastructure topology across distributed systems.