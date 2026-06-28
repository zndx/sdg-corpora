---
chapter_id: ch_live_span_with_trace_id_d1c0b6
topic_id: 100
family: 07_long_tail
cited_terms: ['span_with_trace_id', 'state_observed_at_time', 'cardinality_max_three_generic']
model: engine-refine
---

ATTRIBUTES, TYPES, ENTITIES, AND IDENTIFIERS IN DISTRIBUTED TELEMETRY

A telemetry system must reconcile two competing requirements: the need to capture a wide variety of operational properties across heterogeneous spans and state observations, and the need to enforce type discipline so that downstream consumers can reason about values without runtime inspection. The schema achieves this through a three-tier decomposition. The first tier defines the entity itself—each row in the span registry carries a unique identifier such as TRAC-0001 or TRAC-0002, a span name like config_fetch, email_send, or payment_process, and a trace identifier (TIME-0001 through TIME-0004) that groups related operations into a single causal chain. The second tier enumerates the attributes that may be attached to these entities: duration_seconds, end_time, exit_code, and host_name for spans; confidence, dimension_kind, method, and recorded_at for state observations. Each attribute carries a declared type—xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string—that governs how its value is stored and validated. The third tier materializes the actual values in type-dispatched tables, ensuring that a decimal such as 5004.94 or 0.673 never collides with a timestamp like 2024-07-23T07:53:43 or a string such as gw-12 or Dimension Kind 01.

**t_span_with_trace_id**

| id | span | trace_id |
| --- | --- | --- |
| TRAC-0001 | config_fetch | TIME-0002 |
| TRAC-0002 | email_send | TIME-0001 |
| TRAC-0003 | payment_process | TIME-0004 |
| TRAC-0004 | queue_consume | TIME-0004 |
| TRAC-0005 | payment_process | TIME-0003 |
| TRAC-0006 | queue_consume | TIME-0004 |

**t_span_with_trace_id_attr**

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

**t_span_with_trace_id_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2024-07-23T07:53:43 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-01-04T12:30:01 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2024-06-08T06:16:51 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2024-09-04T10:45:36 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2024-03-10T17:10:26 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2024-08-27T18:50:31 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2024-05-28T07:14:21 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-12-31T18:14:37 |

**t_span_with_trace_id_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 5004.94 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 6293.97 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 683.54 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 6162.04 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 7049.18 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 6047.18 |

**t_span_with_trace_id_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 485 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 203 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 446 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 417 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 481 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 210 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 137 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 453 |

**t_span_with_trace_id_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | gw-12 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | running |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | gw-12 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

**t_state_observed_at_time_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0004 | 2023-08-28T00:49:09 |
| TIME-0002 | TIME-0002 | TIME-0004 | 2023-01-12T06:19:16 |
| TIME-0003 | TIME-0003 | TIME-0004 | 2023-12-07T18:51:38 |
| TIME-0004 | TIME-0004 | TIME-0004 | 2024-05-06T22:48:11 |
| TIME-0005 | TIME-0005 | TIME-0004 | 2023-11-07T19:04:18 |
| TIME-0006 | TIME-0006 | TIME-0004 | 2024-03-08T08:57:30 |
| TIME-0007 | TIME-0007 | TIME-0004 | 2023-04-13T11:54:48 |
| TIME-0008 | TIME-0008 | TIME-0004 | 2024-08-24T14:36:17 |

**t_state_observed_at_time_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0001 | 0.673 |
| TIME-0002 | TIME-0001 | TIME-0005 | 138.13 |
| TIME-0003 | TIME-0001 | TIME-0007 | 126.00 |
| TIME-0004 | TIME-0002 | TIME-0001 | 0.137 |
| TIME-0005 | TIME-0002 | TIME-0005 | 428.04 |
| TIME-0006 | TIME-0002 | TIME-0007 | 24.81 |
| TIME-0007 | TIME-0003 | TIME-0001 | 0.753 |
| TIME-0008 | TIME-0003 | TIME-0005 | 875.90 |

The entity-attribute-value (EAV) pattern is the structural backbone of this design. An entity identifier—TRAC-0001, for instance—appears as the entity_id column in every value table, establishing a foreign-key link back to the span record. The attr_id column then points into the attribute definition table, where TRAC-0001 resolves to duration_seconds (xsd:decimal), TRAC-0002 to end_time (xsd:dateTime), and TRAC-0003 to exit_code (xsd:integer). This indirection allows the schema to remain open-ended: new attributes can be declared without schema migrations, and existing attributes can be attached to any entity that supports them. In practice, the span for TRAC-0001 carries a duration of 5004.94 seconds, an end time of 2024-07-23T07:53:43, an exit code of 485, and a host name of gw-12, each value residing in its own type-specific table but united by the common entity_id and attr_id keys.

State observations follow the same architectural logic but operate on a different domain. The state registry records discrete conditions—offline, calibrated, idle—each associated with a timestamp reference (TRAC-0001, TRAC-0005, TRAC-0006) that anchors the observation to a specific trace. The attribute definitions for state observations include confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). A single state record such as TIME-0001, which captures the offline condition, carries a confidence score of 0.673, a dimension kind of Dimension Kind 01, an encoding label of Encoding 02, and a recorded_at timestamp of 2023-08-28T00:49:09. The value tables for state observations mirror the span tables in structure: separate tables for datetime, decimal, and varchar values, each keyed by entity_id and attr_id.

The cardinality constraint table introduces a fourth dimension to the model, governing how many related entities may be associated with a given telemetry stream. Values such as capped-pair, bounded-triplet, single-bound, and max-three define the multiplicity of relationships, while the related column specifies the target entity type—in all observed cases, telemetry-stream. This constraint layer operates orthogonally to the EAV decomposition: it does not store attribute values but rather regulates the topology of entity relationships. The identifier space (GENE-0001 through GENE-0004) is independent of both the span identifiers (TRAC-*) and the state identifiers (TIME-*), reflecting the fact that cardinality rules are metadata about the system's structure rather than observations about its runtime state.

**t_state_observed_at_time**

| id | state | observed_at |
| --- | --- | --- |
| TIME-0001 | offline | TRAC-0001 |
| TIME-0002 | calibrated | TRAC-0005 |
| TIME-0003 | idle | TRAC-0006 |
| TIME-0004 | calibrated | TRAC-0001 |
| TIME-0005 | idle | TRAC-0001 |
| TIME-0006 | draining | TRAC-0006 |
| TIME-0007 | idle | TRAC-0005 |
| TIME-0008 | locked | TRAC-0005 |

**t_state_observed_at_time_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIME-0001 | confidence | xsd:decimal |
| TIME-0002 | dimension_kind | xsd:string |
| TIME-0003 | method | xsd:string |
| TIME-0004 | recorded_at | xsd:dateTime |
| TIME-0005 | uncertainty | xsd:decimal |
| TIME-0006 | unit | xsd:string |
| TIME-0007 | value | xsd:decimal |
| TIME-0008 | encoding | xsd:string |

**t_state_observed_at_time_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0002 | Dimension Kind 01 |
| TIME-0002 | TIME-0001 | TIME-0008 | Encoding 02 |
| TIME-0003 | TIME-0001 | TIME-0009 | nightly summary |
| TIME-0004 | TIME-0001 | TIME-0010 | fr |
| TIME-0005 | TIME-0001 | TIME-0003 | automated |
| TIME-0006 | TIME-0001 | TIME-0006 | ms |
| TIME-0007 | TIME-0002 | TIME-0002 | Dimension Kind 07 |
| TIME-0008 | TIME-0002 | TIME-0008 | Encoding 08 |

**t_cardinality_max_three_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | capped-pair | telemetry-stream |
| GENE-0002 | bounded-triplet | telemetry-stream |
| GENE-0003 | single-bound | telemetry-stream |
| GENE-0004 | max-three | telemetry-stream |
| GENE-0005 | limited-association | batch-job |
| GENE-0006 | triple-cap | telemetry-stream |
| GENE-0007 | fixed-triple | batch-job |
| GENE-0008 | capped-pair | stream-processor |

Type safety is enforced at the storage layer rather than through a single monolithic value column. By partitioning values into datetime, decimal, integer, and varchar tables, the schema guarantees that a query for duration_seconds will never return a string, and a query for end_time will never return an integer. This design eliminates the need for runtime type coercion and simplifies downstream analytics: a decimal aggregation over the duration values (5004.94, 6293.97, 683.54, 6162.04) is a straightforward numeric operation, while a string filter on host names (gw-12) or state methods (nightly summary, fr) operates on a homogeneous set. The attr_type column in the attribute definition tables serves as the schema registry that maps each attr_id to its corresponding value table, completing the chain from entity through attribute to typed value.