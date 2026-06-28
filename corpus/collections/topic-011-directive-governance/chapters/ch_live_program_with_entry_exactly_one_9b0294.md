---
chapter_id: ch_live_program_with_entry_exactly_one_9b0294
topic_id: 11
family: 01_foundation
cited_terms: ['program_with_entry_exactly_one', 'requirement_has_priority', 'trace_with_attributes']
model: engine-refine
---

An attribute-value architecture structures governance data around a disciplined separation of entity identity, attribute definition, and typed value storage. Each entity—whether a program such as `inventory_sync` or `nightly_etl`, a requirement like `Latency threshold` or `Backup interval`, or a trace identified as `batch-exec-094` or `session-gamma-9`—receives a stable identifier that anchors all subsequent metadata. The identifier space is partitioned by domain: program-level records carry identifiers such as `ONE-0001` through `ONE-0004`, priority-linked requirements use `PRIO-0001` through `PRIO-0004`, and trace records are labeled `ATTR-0001` through `ATTR-0004`. External resource references appear as ARN-style identifiers (`ARN:res/41`) alongside opaque handles (`ref-8842`), ensuring that cross-system provenance can be preserved without conflating internal and external namespaces.

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | ONE-0007 |
| PRIO-0002 | Backup interval | ONE-0003 |
| PRIO-0003 | Throughput minimum | ONE-0006 |
| PRIO-0004 | Audit log frequency | ONE-0006 |
| PRIO-0005 | Throughput minimum | ONE-0002 |
| PRIO-0006 | Encryption standard | ONE-0004 |
| PRIO-0007 | Throughput minimum | ONE-0002 |
| PRIO-0008 | Fault tolerance level | ONE-0005 |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |

**t_trace_with_attributes**

| id | trace |
| --- | --- |
| ATTR-0001 | batch-exec-094 |
| ATTR-0002 | session-gamma-9 |
| ATTR-0003 | gateway-span-55 |
| ATTR-0004 | telemetry-flow-alpha |
| ATTR-0005 | pipeline-run-412 |
| ATTR-0006 | api-call-trace-12 |

**t_trace_with_attributes_attr**

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

**t_trace_with_attributes_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 445 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 106 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 567 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 380 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 276 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 188 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 89 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 391 |

**t_trace_with_attributes_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | gw-12 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | superseded |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | node-b14 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | execution |

Attribute definitions establish the schema for each entity class independently of any particular value assignment. The attribute registry maps a human-readable name to a machine-enforceable type: `effective_date` carries `xsd:date`, `enforcement` carries `xsd:string`, `mandatory` carries `xsd:boolean`, and `priority` carries `xsd:integer`. Trace attributes follow the same pattern, with `duration_seconds` typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`. This decoupling means that the attribute catalog can evolve—adding `exit_code` to the trace schema, for instance—without requiring any change to the entity or value tables. The type declaration is the sole contract between definition and storage, and it governs which value table receives the materialized data.

**t_trace_with_attributes_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-07-09T10:21:53 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2024-10-26T05:28:10 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2024-01-16T11:34:50 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-03-03T12:52:58 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2023-12-16T04:33:56 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2024-09-15T16:03:36 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2024-12-20T02:32:40 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2024-08-26T04:55:34 |

**t_trace_with_attributes_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 1085.14 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3252.57 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 401.17 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 3242.47 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 4250.01 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 3788.41 |

Value storage is materialized across type-specific tables, each keyed by the entity identifier and the attribute identifier it belongs to. Boolean attributes such as `mandatory` resolve to `false` across all four priority entities (`PRIO-0001` through `PRIO-0004`), a uniformity that signals a default posture rather than per-entity variation. Date attributes like `effective_date` carry distinct temporal anchors—`2023-09-07`, `2024-08-03`, `2024-06-06`, `2023-04-21`—reflecting the operational calendar of each requirement. Integer attributes store quantitative thresholds: values of `3` and `56` for one entity's pair of integer attributes, `2` and `806` for another, while trace exit codes register as `445` and `567` and `380`. Decimal durations span `1085.14` seconds for `batch-exec-094` down to `401.17` for `gateway-span-55`, and string attributes capture free-form metadata such as `Encoding 01`, `intake form`, `gw-12`, and `superseded`. The type-specific partitioning of values eliminates null columns and enforces type safety at the storage layer.

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

Versioning and linkage complete the model by connecting entities to their operational context. Programs are associated with entry points—`PRIO-0007` for `inventory_sync`, `PRIO-0002` for `nightly_etl`—and each program carries a version number (`12`, `3`, `8`, `11`) that tracks configuration drift over time. Requirements such as `Throughput minimum` and `Audit log frequency` are assigned priority identifiers (`ONE-0006`), which in turn reference the same priority entity space used by program entry points, creating a cross-referential graph that ties governance constraints to execution pathways. The identifier `ARN:res/41` appears across three programs, indicating a shared resource dependency, while `ref-8842` stands alone for `health_check`, suggesting a distinct or newly provisioned asset.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | PRIO-0007 | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | PRIO-0008 | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | PRIO-0002 | ARN:res/41 | 8 |
| ONE-0004 | health_check | PRIO-0001 | ref-8842 | 11 |
| ONE-0005 | health_check | PRIO-0004 | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | PRIO-0001 | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | PRIO-0007 | urn:uuid:9f2a | 1 |

In practice, this architecture supports auditability and extensibility simultaneously. An auditor can reconstruct the full attribute profile of any entity by joining the entity identifier to its attribute definitions and then to the appropriate value table, yielding a complete, type-coherent record. A developer adding a new attribute—say, `sla_target` typed as `xsd:decimal`—need only insert a row into the attribute registry and begin populating the decimal value table; no schema migration touches the entity or priority tables. The separation of attr, attr type, entity, identifier, misc values, and version into distinct but interlocking structures ensures that governance data remains queryable, auditable, and resilient to the incremental changes that characterize operational environments.