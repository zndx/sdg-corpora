---
chapter_id: ch_live_span_with_trace_id_74334b
topic_id: 100
family: 07_long_tail
cited_terms: ['span_with_trace_id', 'ebpfprogram_equiv_typed_with_hook', 'identifier_uniquely_identifies']
model: engine-refine
---

OBSERVABILITY TELEMETRY AND IDENTIFIER REGISTRY FRAMEWORK

NOVEMBER 2024

SECTION 3

DISTRIBUTED TRACING METADATA AND PROGRAM HOOK GOVERNANCE

The distributed tracing subsystem records discrete execution units—spans—each uniquely identified by a trace identifier and associated with a named operation within a broader trace context. The span registry maintains records such as TRAC-0001 through TRAC-0004, where each entry captures the operation type (config_fetch, email_send, payment_process, queue_consume) and the parent trace identifier (7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d, c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9, e9f8a7b6c5d4e3f2a1b0c9d8e7f6a5b4). Multiple spans may share a trace identifier, as evidenced by the recurrence of c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9 across distinct span records, reflecting the fan-out and fan-in patterns inherent in microservice call chains. This structural arrangement enables downstream correlation of related operations across service boundaries, forming the backbone of latency attribution and failure root-cause analysis.

**t_span_with_trace_id**

| id | span | trace_id |
| --- | --- | --- |
| TRAC-0001 | config_fetch | 7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d |
| TRAC-0002 | email_send | c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9 |
| TRAC-0003 | payment_process | e9f8a7b6c5d4e3f2a1b0c9d8e7f6a5b4 |
| TRAC-0004 | queue_consume | c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9 |
| TRAC-0005 | payment_process | f0e1d2c3b4a5968778695a4b3c2d1e0f |
| TRAC-0006 | queue_consume | 550e8400e29b41d4a716446655440000 |

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

Attribute metadata for spans is decomposed into a schema layer and a value layer, enforcing type discipline across heterogeneous measurement data. The attribute definition table enumerates property names—duration_seconds, end_time, exit_code, host_name—each bound to an XML Schema datatype (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string). Value storage is partitioned by type into four dedicated tables, each linking an entity identifier (the span record) to an attribute identifier and a typed value. Decimal measurements such as 5004.94, 6293.97, and 683.54 populate the decimal value table; integer-coded exit codes (485, 203, 446, 417) reside in the integer value table; timestamped event markers (2024-07-23T07:53:43, 2024-01-04T12:30:01, 2024-06-08T06:16:51, 2024-09-04T10:45:36) are stored in the datetime value table; and string-valued properties (gw-12, Log Level 02, initiation, running) occupy the varchar value table. This type-partitioned design eliminates null proliferation and ensures that query engines can apply type-specific optimizations without runtime coercion.

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

The eBPF program registry governs kernel-level instrumentation artifacts through a fact table that records each program's type assignment, hook attachment point, compiled size, and version number. Program identifiers (HOOK-0001 through HOOK-0004) reference foreign keys into two dimension tables: dim_program_type, which classifies programs by label and category, and dim_attaches_to_hook, which categorizes the kernel hook points to which programs bind. Size measurements range from 113,209,263 bytes to 784,335,640 bytes, and version numbers span 9 through 12, reflecting the lifecycle diversity of deployed instrumentation. The program type and hook attachment dimensions are themselves classified by categorical labels (Program Type Category 01 through 04, Attaches To Hook Category 01 through 04), enabling policy engines to enforce constraints on which program categories may attach to which hook categories.

**fact_ebpfprogram**

| id | program_type_key | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- | --- |
| HOOK-0001 | HOOK-0007 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0005 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0001 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0003 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0007 | HOOK-0006 | 167519051 | 1 |

**dim_program_type**

| id | program_type_label | program_type_category |
| --- | --- | --- |
| HOOK-0001 | Program Type Label 01 | Program Type Category 01 |
| HOOK-0002 | Program Type Label 02 | Program Type Category 02 |
| HOOK-0003 | Program Type Label 03 | Program Type Category 03 |
| HOOK-0004 | Program Type Label 04 | Program Type Category 04 |
| HOOK-0005 | Program Type Label 05 | Program Type Category 05 |
| HOOK-0006 | Program Type Label 06 | Program Type Category 06 |
| HOOK-0007 | Program Type Label 07 | Program Type Category 07 |
| HOOK-0008 | Program Type Label 08 | Program Type Category 08 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

A general-purpose identifier registry provides a unified namespace for assigning and tracking persistent identifiers across heterogeneous resource types. Each registry entry records the identifier string (doi:10.1145/3641519, urn:isbn:9780131103627, orcid:0000-0002-1825-0097), the resource it identifies (provenance node root, data pipeline stage 3, container image sha256), the serialization format (JSON, E.164, CSV), and the date of issuance (2024-09-07, 2023-03-13, 2024-01-30, 2023-03-01). The registry supports multiple identifier schemes within a single table, with the format column disambiguating the encoding convention and the issued_date column providing an audit trail for identifier lifecycle management. This design permits cross-referencing between the tracing subsystem, the eBPF program registry, and external identifier authorities without requiring schema proliferation.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |