---
chapter_id: ch_live_telemetry_span_observes_syscall_e1b13a
topic_id: 183
family: 07_long_tail
cited_terms: ['telemetry_span_observes_syscall', 'third_party_data_sharing', 'trace_basic']
model: engine-refine
---

In distributed systems observability, tracking telemetry spans and execution traces requires a flexible schema that accommodates heterogeneous metadata without rigid column definitions. The core entities—telemetry spans and basic traces—are identified by unique keys such as SYSC-0001 or TRAC-0001, and each is associated with a telemetry source or operational context. A telemetry span might observe a syscall through Prometheus or Dynatrace OneAgent, while a trace captures a specific execution path like load-balancer-routing or worker-task-execution, recorded at a point in time referenced by a span identifier. This separation of entity identity from attribute values enables the system to evolve its metadata model without schema migrations.

**t_telemetry_span_observes_syscall**

| id | telemetry |
| --- | --- |
| SYSC-0001 | Prometheus |
| SYSC-0002 | SignalFx Stream Processor |
| SYSC-0003 | Dynatrace OneAgent |
| SYSC-0004 | Prometheus |
| SYSC-0005 | OpenTelemetry Collector |
| SYSC-0006 | Honeycomb Collector |

**t_telemetry_span_observes_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | checksum_algo | xsd:string |
| SYSC-0002 | code | xsd:string |
| SYSC-0003 | format | xsd:string |
| SYSC-0004 | issued_date | xsd:date |
| SYSC-0005 | namespace | xsd:string |
| SYSC-0006 | encoding | xsd:string |
| SYSC-0007 | label_text | xsd:string |
| SYSC-0008 | language | xsd:string |

**t_telemetry_span_observes_syscall_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | 2024-08-07 |
| SYSC-0002 | SYSC-0002 | SYSC-0004 | 2023-04-29 |
| SYSC-0003 | SYSC-0003 | SYSC-0004 | 2024-09-27 |
| SYSC-0004 | SYSC-0004 | SYSC-0004 | 2023-06-07 |
| SYSC-0005 | SYSC-0005 | SYSC-0004 | 2025-01-16 |
| SYSC-0006 | SYSC-0006 | SYSC-0004 | 2023-10-29 |

**t_telemetry_span_observes_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | Checksum Algo 01 |
| SYSC-0002 | SYSC-0001 | SYSC-0002 | D-33 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | Encoding 03 |
| SYSC-0004 | SYSC-0001 | SYSC-0003 | E.164 |
| SYSC-0005 | SYSC-0001 | SYSC-0007 | nightly summary |
| SYSC-0006 | SYSC-0001 | SYSC-0008 | fr |
| SYSC-0007 | SYSC-0001 | SYSC-0005 | Namespace 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0001 | Checksum Algo 08 |

**t_trace_basic**

| id | trace | observed_at |
| --- | --- | --- |
| TRAC-0001 | load-balancer-routing | SYSC-0001 |
| TRAC-0002 | frontend-render-loop | SYSC-0001 |
| TRAC-0003 | message-broker-poll | SYSC-0002 |
| TRAC-0004 | worker-task-execution | SYSC-0003 |
| TRAC-0005 | cache-hit-miss-run | SYSC-0004 |
| TRAC-0006 | message-broker-poll | SYSC-0005 |

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

Attributes are defined independently from their values, establishing a contract between an attribute name and its expected type. For telemetry spans, attributes include checksum_algo, code, format, and issued_date, each typed as xsd:string or xsd:date. Trace attributes follow a similar pattern, encompassing duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string). The attr_type field is the critical discriminator that determines which value table receives the data, allowing the same attribute-definition mechanism to support strings, dates, decimals, integers, and datetime values across different entity types.

Value storage is partitioned by type to preserve data integrity while maintaining query efficiency. A telemetry span entity like SYSC-0001 can carry multiple attributes simultaneously: its issued_date attribute holds 2024-08-07 in the date-value table, while its code attribute stores D-33 and its format attribute stores E.164 in the varchar-value table. Similarly, a trace entity such as TRAC-0001 records a duration_seconds of 1505.64 in the decimal-value table, an end_time of 2023-04-16T02:44:01 in the datetime-value table, an exit_code of 376 in the integer-value table, and a host_name of node-b14 in the varchar-value table. The entity_id column in each value table links the concrete value back to its owning entity, and the attr_id column resolves to the attribute definition, creating a three-way join that reconstructs the full attribute set for any given entity.

Beyond internal observability, the system also governs external data relationships through third-party data sharing agreements. Each sharing record carries an identifier like SHAR-0001 and a descriptive name such as PartnerAnalyticsBridge or GeospatialInfoExchange, and is linked to a participating external business partner—RegionalHealthNetwork, AcmeAnalyticsCorp, FinServDataHub, or GlobalLogisticsInc. These agreements represent formalized data exchange relationships where the externalbusinesspartner entity serves as the contractual counterparty, and the thirdpartydatasharing entity captures the nature and scope of the data flow. This separation allows a single sharing agreement to be associated with multiple participants and enables audit trails that distinguish between the agreement itself and the organizations involved.

**t_third_party_data_sharing**

| id | third_party_data_sharing | has_participant |
| --- | --- | --- |
| SHAR-0001 | PartnerAnalyticsBridge | RegionalHealthNetwork |
| SHAR-0002 | GeospatialInfoExchange | AcmeAnalyticsCorp |
| SHAR-0003 | GeospatialInfoExchange | FinServDataHub |
| SHAR-0004 | GeospatialInfoExchange | GlobalLogisticsInc |
| SHAR-0005 | IoTSensorDataBridge | AutoOEMDataTeam |
| SHAR-0006 | ResearchCollabDataFlow | TelecomPartnerOps |

The identifier namespace provides the connective tissue across all these domains. Span identifiers like SYSC-0001 appear not only as primary keys in the telemetry span table but also as foreign keys in the trace table's observed_at column, establishing a temporal relationship between traces and the spans they were recorded against. Attribute identifiers such as SYSC-0004 for issued_date or TRAC-0001 for duration_seconds are reused consistently across definition tables and value tables, ensuring that any value can be resolved to its semantic meaning through a single attr_id lookup. This unified identifier strategy means that the attr, attr_type, entity, and externalbusinesspartner concepts are not isolated concerns but interlocking components of a single data governance framework.