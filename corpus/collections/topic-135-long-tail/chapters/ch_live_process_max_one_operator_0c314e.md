---
chapter_id: ch_live_process_max_one_operator_0c314e
topic_id: 135
family: 07_long_tail
cited_terms: ['process_max_one_operator', 'process_min_one_input', 'process_min_one_output']
model: engine-refine
---

An operational process registry decomposes complex execution records into three orthogonal concerns: the entity itself, the attributes that describe it, and the typed values that instantiate those attributes. Each process—whether a SchemaEvolution task governed by a SysAdmin operator, a BatchExport orchestrated by VaultAgent, or a Real-time stream processing workflow consuming Parquet partition files—is assigned a stable identifier such as OPER-0001 or INPU-0003, which serves as the immutable anchor for all subsequent metadata and value resolution. The process column captures the semantic category of the operation, ranging from KeyRotation and pipeline rollback procedures to feature engineering workflows and model training runs, while the operator or input/output columns record the responsible component or data artifact, whether that be a NodeExporter agent, labeled training datasets, or a detection alert. This separation of identity from behavior ensures that process classification can evolve independently of the operational history attached to any single record.

**t_process_max_one_operator**

| id | process | operator |
| --- | --- | --- |
| OPER-0001 | SchemaEvolution | SysAdmin |
| OPER-0002 | BatchExport | NodeExporter |
| OPER-0003 | KeyRotation | SysAdmin |
| OPER-0004 | SchemaEvolution | VaultAgent |
| OPER-0005 | ModelTraining | SysAdmin |
| OPER-0006 | AuditCompaction | DBA |

**t_process_max_one_operator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OPER-0001 | duration_seconds | xsd:decimal |
| OPER-0002 | end_time | xsd:dateTime |
| OPER-0003 | exit_code | xsd:integer |
| OPER-0004 | host_name | xsd:string |
| OPER-0005 | log_level | xsd:string |
| OPER-0006 | phase | xsd:string |
| OPER-0007 | retry_count | xsd:integer |
| OPER-0008 | scheduled_at | xsd:dateTime |

**t_process_max_one_operator_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0003 | 284 |
| OPER-0002 | OPER-0001 | OPER-0007 | 368 |
| OPER-0003 | OPER-0002 | OPER-0003 | 91 |
| OPER-0004 | OPER-0002 | OPER-0007 | 298 |
| OPER-0005 | OPER-0003 | OPER-0003 | 778 |
| OPER-0006 | OPER-0003 | OPER-0007 | 263 |
| OPER-0007 | OPER-0004 | OPER-0003 | 756 |
| OPER-0008 | OPER-0004 | OPER-0007 | 105 |

**t_process_min_one_input**

| id | process | input |
| --- | --- | --- |
| INPU-0001 | Real-time stream processing | Parquet partition files |
| INPU-0002 | Batch data ingestion | Labeled training datasets |
| INPU-0003 | ETL transformation step | Labeled training datasets |
| INPU-0004 | Feature engineering workflow | Sensor telemetry packets |
| INPU-0005 | Real-time stream processing | System log archives |
| INPU-0006 | Audit trail generation | Labeled training datasets |

**t_process_min_one_input_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INPU-0001 | duration_seconds | xsd:decimal |
| INPU-0002 | end_time | xsd:dateTime |
| INPU-0003 | exit_code | xsd:integer |
| INPU-0004 | host_name | xsd:string |
| INPU-0005 | log_level | xsd:string |
| INPU-0006 | phase | xsd:string |
| INPU-0007 | retry_count | xsd:integer |
| INPU-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_input_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0003 | 682 |
| INPU-0002 | INPU-0001 | INPU-0007 | 200 |
| INPU-0003 | INPU-0002 | INPU-0003 | 365 |
| INPU-0004 | INPU-0002 | INPU-0007 | 357 |
| INPU-0005 | INPU-0003 | INPU-0003 | 339 |
| INPU-0006 | INPU-0003 | INPU-0007 | 252 |
| INPU-0007 | INPU-0004 | INPU-0003 | 834 |
| INPU-0008 | INPU-0004 | INPU-0007 | 166 |

**t_process_min_one_output**

| id | process | output |
| --- | --- | --- |
| OUTP-0001 | feature extraction pipeline | cleaned dataset |
| OUTP-0002 | pipeline rollback procedure | rollback snapshot |
| OUTP-0003 | feature extraction pipeline | feature matrix |
| OUTP-0004 | model training run | detection alert |
| OUTP-0005 | data validation cycle | cleaned dataset |
| OUTP-0006 | model training run | cleaned dataset |
| OUTP-0007 | anomaly detection sweep | cleaned dataset |

**t_process_min_one_output_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OUTP-0001 | duration_seconds | xsd:decimal |
| OUTP-0002 | end_time | xsd:dateTime |
| OUTP-0003 | exit_code | xsd:integer |
| OUTP-0004 | host_name | xsd:string |
| OUTP-0005 | log_level | xsd:string |
| OUTP-0006 | phase | xsd:string |
| OUTP-0007 | retry_count | xsd:integer |
| OUTP-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_output_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0002 | 2023-04-19T05:25:34 |
| OUTP-0002 | OUTP-0001 | OUTP-0008 | 2023-03-27T21:29:05 |
| OUTP-0003 | OUTP-0001 | OUTP-0009 | 2025-05-24T00:18:25 |
| OUTP-0004 | OUTP-0002 | OUTP-0002 | 2024-01-13T03:16:51 |
| OUTP-0005 | OUTP-0002 | OUTP-0008 | 2024-09-26T20:27:11 |
| OUTP-0006 | OUTP-0002 | OUTP-0009 | 2023-06-30T01:21:38 |
| OUTP-0007 | OUTP-0003 | OUTP-0002 | 2024-04-05T13:10:28 |
| OUTP-0008 | OUTP-0003 | OUTP-0008 | 2023-07-31T01:33:46 |

**t_process_min_one_output_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0001 | 1575.12 |
| OUTP-0002 | OUTP-0002 | OUTP-0001 | 3915.42 |
| OUTP-0003 | OUTP-0003 | OUTP-0001 | 6819.95 |
| OUTP-0004 | OUTP-0004 | OUTP-0001 | 6826.25 |
| OUTP-0005 | OUTP-0005 | OUTP-0001 | 4127.39 |
| OUTP-0006 | OUTP-0006 | OUTP-0001 | 1299.93 |
| OUTP-0007 | OUTP-0007 | OUTP-0001 | 6249.12 |

**t_process_min_one_output_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0003 | 695 |
| OUTP-0002 | OUTP-0001 | OUTP-0007 | 449 |
| OUTP-0003 | OUTP-0002 | OUTP-0003 | 903 |
| OUTP-0004 | OUTP-0002 | OUTP-0007 | 474 |
| OUTP-0005 | OUTP-0003 | OUTP-0003 | 215 |
| OUTP-0006 | OUTP-0003 | OUTP-0007 | 204 |
| OUTP-0007 | OUTP-0004 | OUTP-0003 | 967 |
| OUTP-0008 | OUTP-0004 | OUTP-0007 | 241 |

**t_process_min_one_output_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0004 | ingest-21 |
| OUTP-0002 | OUTP-0001 | OUTP-0005 | Log Level 02 |
| OUTP-0003 | OUTP-0001 | OUTP-0006 | closeout |
| OUTP-0004 | OUTP-0001 | OUTP-0010 | complete |
| OUTP-0005 | OUTP-0001 | OUTP-0011 | Triggered By 05 |
| OUTP-0006 | OUTP-0002 | OUTP-0004 | worker-07 |
| OUTP-0007 | OUTP-0002 | OUTP-0005 | Log Level 07 |
| OUTP-0008 | OUTP-0002 | OUTP-0006 | closeout |

Attribute definitions form a parallel schema layer that decouples the ontology of measurable properties from their runtime values. A fixed set of attribute names—duration_seconds, end_time, exit_code, host_name—appears consistently across operator, input, and output registries, each annotated with an XSD-derived type such as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. The attr_type column enforces a strict typing discipline: duration_seconds is always xsd:decimal, end_time is xsd:dateTime, exit_code is xsd:integer, and host_name is xsd:string, regardless of whether the attribute belongs to an operator record like OPER-0004 or an input record like INPU-0002. This uniform attribute vocabulary enables cross-domain queries and aggregation without schema drift, while the attr_name column provides a human-readable label that maps directly to the typed value tables below.

Value instantiation follows a type-dispatched storage pattern where each attribute's runtime value is persisted in a dedicated table keyed by entity and attribute identifiers. Decimal values such as 3596.17, 2700.62, 5101.62, and 2639.57 populate the decimal value store, representing execution durations that span from under forty-five minutes to nearly an hour and a half. Integer exit codes—284, 368, 91, 298 for operator records and 682, 200, 365, 357 for input records—encode completion status or resource utilization metrics. Datetime values like 2025-02-16T08:36:01, 2025-02-03T08:52:18, and 2024-10-29T11:02:54 capture precise end-of-execution timestamps, while varchar fields store freeform descriptors including host identifiers such as gw-12, log level annotations reading Log Level 02, and state transitions from initiation through pending to complete. The entity_id column in each value table references the originating process record, and the attr_id column resolves to the corresponding attribute definition, creating a fully normalized join path from typed value back to semantic meaning.

**t_process_max_one_operator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0002 | 2025-02-16T08:36:01 |
| OPER-0002 | OPER-0001 | OPER-0008 | 2025-02-03T08:52:18 |
| OPER-0003 | OPER-0001 | OPER-0009 | 2024-10-29T11:02:54 |
| OPER-0004 | OPER-0002 | OPER-0002 | 2024-01-13T15:11:53 |
| OPER-0005 | OPER-0002 | OPER-0008 | 2023-10-19T14:19:43 |
| OPER-0006 | OPER-0002 | OPER-0009 | 2025-02-16T12:03:32 |
| OPER-0007 | OPER-0003 | OPER-0002 | 2024-02-17T13:45:28 |
| OPER-0008 | OPER-0003 | OPER-0008 | 2024-11-18T13:09:46 |

**t_process_max_one_operator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0001 | 3596.17 |
| OPER-0002 | OPER-0002 | OPER-0001 | 2700.62 |
| OPER-0003 | OPER-0003 | OPER-0001 | 5101.62 |
| OPER-0004 | OPER-0004 | OPER-0001 | 2639.57 |
| OPER-0005 | OPER-0005 | OPER-0001 | 6522.26 |
| OPER-0006 | OPER-0006 | OPER-0001 | 4952.76 |

**t_process_max_one_operator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0004 | gw-12 |
| OPER-0002 | OPER-0001 | OPER-0005 | Log Level 02 |
| OPER-0003 | OPER-0001 | OPER-0006 | initiation |
| OPER-0004 | OPER-0001 | OPER-0010 | pending |
| OPER-0005 | OPER-0001 | OPER-0011 | Triggered By 05 |
| OPER-0006 | OPER-0002 | OPER-0004 | node-a01 |
| OPER-0007 | OPER-0002 | OPER-0005 | Log Level 07 |
| OPER-0008 | OPER-0002 | OPER-0006 | execution |

**t_process_min_one_input_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0002 | 2023-04-22T11:20:36 |
| INPU-0002 | INPU-0001 | INPU-0008 | 2024-10-27T08:51:57 |
| INPU-0003 | INPU-0001 | INPU-0009 | 2024-06-22T04:25:17 |
| INPU-0004 | INPU-0002 | INPU-0002 | 2023-12-06T11:11:06 |
| INPU-0005 | INPU-0002 | INPU-0008 | 2025-02-03T11:35:55 |
| INPU-0006 | INPU-0002 | INPU-0009 | 2024-12-06T22:47:35 |
| INPU-0007 | INPU-0003 | INPU-0002 | 2023-08-23T16:52:39 |
| INPU-0008 | INPU-0003 | INPU-0008 | 2024-05-09T10:22:43 |

**t_process_min_one_input_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0001 | 2164.83 |
| INPU-0002 | INPU-0002 | INPU-0001 | 4485.78 |
| INPU-0003 | INPU-0003 | INPU-0001 | 2430.62 |
| INPU-0004 | INPU-0004 | INPU-0001 | 7108.77 |
| INPU-0005 | INPU-0005 | INPU-0001 | 1824.80 |
| INPU-0006 | INPU-0006 | INPU-0001 | 4795.57 |

**t_process_min_one_input_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0004 | ingest-21 |
| INPU-0002 | INPU-0001 | INPU-0005 | Log Level 02 |
| INPU-0003 | INPU-0001 | INPU-0006 | review |
| INPU-0004 | INPU-0001 | INPU-0010 | complete |
| INPU-0005 | INPU-0001 | INPU-0011 | Triggered By 05 |
| INPU-0006 | INPU-0002 | INPU-0004 | node-b14 |
| INPU-0007 | INPU-0002 | INPU-0005 | Log Level 07 |
| INPU-0008 | INPU-0002 | INPU-0006 | review |

The foreign-key topology across these registries establishes a three-tier relational chain: process identifiers in the entity tables reference entity_id columns in the value tables, while attribute identifiers in the metadata tables reference attr_id columns in the same value tables. This design permits any process record—OPER-0001, for instance, which maps SchemaEvolution to SysAdmin—to be enriched with its full attribute set by joining through the value tables, where each row carries both the entity context and the attribute key needed to look up the type and name from the metadata layer. The result is a queryable execution ledger where a single SQL join across entity, attribute, and value tables reconstructs the complete operational profile of any process, including its duration of 3596.17 seconds, its termination timestamp of 2025-02-16T08:36:01, its exit code of 284, and its associated host gw-12, all resolved through stable identifiers that persist across process lifecycle changes.