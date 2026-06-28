---
chapter_id: ch_live_verification_produces_evidence_87c910
topic_id: 6
family: 03_directive_governance
cited_terms: ['verification_produces_evidence', 'span_with_trace_id', 'performance_tuning_configuration']
model: engine-refine
---

Verification evidence is captured through a structured evidence registry that associates each verification activity with a unique identifier, a production target, an exit code, and a lifecycle status. The identifier column serves as the primary key for evidence records, following a convention such as EVID-0001 through EVID-0004, and anchors each row to a specific audit or assessment event. The verification column records the originating activity—for instance, Compliance audit Q3—while the produces_evidence column maps to downstream trace identifiers like TRAC-0001, TRAC-0003, TRAC-0005, and TRAC-0006, establishing a causal chain from audit to observable artifact. The exit_code column encodes the termination status of the verification run as a numeric value; exit codes such as 568, 821, 938, and 88 distinguish between successful completion, partial failure, and exceptional conditions. The status column provides a human-readable lifecycle state—complete, failed, or pending—that enables operational dashboards to surface overdue or errored verifications without requiring code-level interpretation of exit codes.

**t_verification_produces_evidence**

| id | verification | produces_evidence | exit_code | status |
| --- | --- | --- | --- | --- |
| EVID-0001 | Compliance audit Q3 | TRAC-0006 | 568 | complete |
| EVID-0002 | Compliance audit Q3 | TRAC-0001 | 821 | failed |
| EVID-0003 | Compliance audit Q3 | TRAC-0005 | 938 | failed |
| EVID-0004 | Compliance audit Q3 | TRAC-0003 | 88 | pending |
| EVID-0005 | Compliance audit Q3 | TRAC-0002 | 761 | pending |
| EVID-0006 | Compliance audit Q3 | TRAC-0005 | 718 | running |

Trace spans extend the evidence model into operational telemetry by decomposing each trace identifier into discrete execution segments. The span_with_trace_id table links a trace identifier such as TRAC-0001 to a span name like config_fetch, email_send, payment_process, or queue_consume, thereby mapping high-level evidence artifacts to the underlying service operations that produced them. Each span is further enriched through an attribute schema defined in the span attribute table, where the attr column enumerates measurable properties—duration_seconds, end_time, exit_code, host_name—and the attr_type column assigns an XML Schema datatype (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) that governs validation and rendering. This separation of attribute metadata from attribute values permits schema evolution without altering the value storage layer.

**t_span_with_trace_id**

| id | span | trace_id |
| --- | --- | --- |
| TRAC-0001 | config_fetch | EVID-0006 |
| TRAC-0002 | email_send | EVID-0005 |
| TRAC-0003 | payment_process | EVID-0002 |
| TRAC-0004 | queue_consume | EVID-0004 |
| TRAC-0005 | payment_process | EVID-0001 |
| TRAC-0006 | queue_consume | EVID-0006 |

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

Attribute values are persisted in type-specific value tables that reference both the owning entity and the attribute definition. The entity column in each value table acts as a foreign key pointing back to the span or configuration identifier (TRAC-0001, TRAC-0002, and so forth), while the attr_id column references the corresponding attribute definition. For decimal-valued attributes such as duration_seconds, values like 5004.94, 6293.97, 683.54, and 6162.04 are stored in the decimal value table; integer-valued attributes such as exit_code receive values like 485, 203, 446, and 417 in the integer value table; datetime attributes such as end_time hold timestamps including 2024-07-23T07:53:43, 2024-01-04T12:30:01, 2024-06-08T06:16:51, and 2024-09-04T10:45:36; and string-valued attributes such as host_name and misc store freeform text like gw-12, Log Level 02, initiation, and running. This type-dispatched storage pattern ensures that each value is validated against its declared attr_type at ingestion time and that query paths can be optimized by datatype.

Performance tuning configurations follow an analogous attribute-entity-value pattern, enabling governance teams to record, version, and audit system-level optimization parameters. The performance_tuning_configuration table assigns each configuration a unique identifier (CONF-0001 through CONF-0004) and a human-readable name such as kafka_consumer_optimization, batch_processing_tuning, postgresql_connection_pooling, and redis_memory_eviction_policy. The configuration attribute table defines the measurable properties of each tuning record—confidence, dimension_kind, method, recorded_at—along with their respective attr_type declarations (xsd:decimal, xsd:string, xsd:string, xsd:dateTime). Values are stored in dedicated tables: decimal values like 0.759, 366.54, 440.16, and 0.260 capture confidence scores and dimensional metrics; varchar values such as Dimension Kind 01, Encoding 02, change rationale, and de record categorical and narrative metadata; and datetime values including 2025-04-03T22:35:42, 2023-11-10T02:40:53, 2024-01-02T03:01:16, and 2023-07-19T12:03:53 anchor each configuration to its recording timestamp. The entity column in each value table ties the measurement back to its parent configuration identifier, preserving referential integrity across the attribute-value graph.

**t_performance_tuning_configuration**

| id | performance_tuning_configuration |
| --- | --- |
| CONF-0001 | kafka_consumer_optimization |
| CONF-0002 | batch_processing_tuning |
| CONF-0003 | postgresql_connection_pooling |
| CONF-0004 | redis_memory_eviction_policy |
| CONF-0005 | spark_shuffle_buffer_tuning |
| CONF-0006 | telemetry_ingest_profile |

**t_performance_tuning_configuration_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |

**t_performance_tuning_configuration_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2025-04-03T22:35:42 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2023-11-10T02:40:53 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2024-01-02T03:01:16 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2023-07-19T12:03:53 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2024-04-25T19:17:24 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-11-04T15:42:47 |

**t_performance_tuning_configuration_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.759 |
| CONF-0002 | CONF-0001 | CONF-0005 | 366.54 |
| CONF-0003 | CONF-0001 | CONF-0007 | 440.16 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.260 |
| CONF-0005 | CONF-0002 | CONF-0005 | 527.31 |
| CONF-0006 | CONF-0002 | CONF-0007 | 285.84 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.704 |
| CONF-0008 | CONF-0003 | CONF-0005 | 456.07 |

**t_performance_tuning_configuration_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | change rationale |
| CONF-0004 | CONF-0001 | CONF-0010 | de |
| CONF-0005 | CONF-0001 | CONF-0003 | manual |
| CONF-0006 | CONF-0001 | CONF-0006 | count |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

The convergence of these two attribute-entity-value graphs—span telemetry and performance tuning—under a unified identifier and attr_type discipline provides a common audit substrate. Exit codes recorded both at the verification level (numeric codes like 568, 821, 938, 88) and at the span attribute level (integer values like 485, 203, 446, 417) enable cross-referencing between compliance outcomes and operational performance. Status values (complete, failed, pending) on verification records can be correlated with span durations, host names, and configuration confidence scores to triage incidents and attribute root causes. By normalizing attribute names and types across domains, the schema supports automated validation, consistent reporting, and reproducible evidence chains from raw telemetry through compliance assertion.