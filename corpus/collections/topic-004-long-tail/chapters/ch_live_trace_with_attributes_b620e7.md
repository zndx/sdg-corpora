---
chapter_id: ch_live_trace_with_attributes_b620e7
topic_id: 4
family: 02_observation_measurement
cited_terms: ['trace_with_attributes', 'audit_basic', 'ebpfprogram_verified_safe']
model: engine-refine
---

The attribute-value model separates entity identity from the properties that describe it, enabling heterogeneous metadata to be stored without schema migration. Each entity—whether a trace identified as `batch-exec-094`, an audit record named `Telemetry Integrity Check`, or an eBPF program such as `lsm_file_open`—is assigned a unique identifier (`ATTR-0001`, `AUDI-0001`, `SAFE-0001`) that anchors all subsequent references. Attribute definitions live in a parallel catalogue: `attr_name` records the semantic label (`duration_seconds`, `end_time`, `exit_code`, `host_name`) while `attr_type` constrains the permissible value domain to an XSD type (`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`). This decoupling means that adding a new property requires only an insert into the attribute catalogue; no DDL is needed, and the value tables remain stable across schema evolutions.

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

**t_audit_basic**

| id | audit |
| --- | --- |
| AUDI-0001 | Telemetry Integrity Check |
| AUDI-0002 | Logging Compliance Review |
| AUDI-0003 | Logging Compliance Review |
| AUDI-0004 | Model Drift Validation |
| AUDI-0005 | Model Drift Validation |
| AUDI-0006 | Pipeline Latency Review |

**t_audit_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2024-05-14T01:27:39 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-24T17:57:06 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2023-07-30T11:39:04 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2024-03-11T10:39:38 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2025-01-11T17:40:44 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-09-25T22:35:18 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2025-04-27T05:17:32 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2023-12-11T03:24:19 |

**t_audit_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 2391.38 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 1955.36 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 919.71 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 338.61 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1120.15 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 6419.06 |

**t_audit_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 765 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 217 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 123 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 33 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 601 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 361 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 79 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 456 |

**t_audit_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | initiation |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | pending |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | ingest-21 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | closeout |

Typed value tables enforce data integrity at the storage layer by partitioning values according to their declared type. A decimal attribute such as `duration_seconds` resolves to a value of `1085.14` in the decimal store, while the same entity's `end_time` appears as `2024-07-09T10:21:53` in the datetime store. Integer-valued attributes like `exit_code` carry values such as `445` or `106`, and string attributes like `host_name` hold `gw-12` or `node-a01`. Each value row carries an `entity_id` that points back to the owning entity and an `attr_id` that resolves to the attribute definition, forming a composite foreign key that guarantees every stored value corresponds to a declared attribute of the correct type. The `misc` column holds the actual value, and the table name itself (`val_datetime`, `val_decimal`, `val_int`, `val_varchar`) serves as the type discriminator.

The same attribute-value architecture is replicated across entity domains. Trace records, audit records, and eBPF program records each maintain their own attribute catalogue and typed value stores, yet the structural pattern is identical: an identifier column, an attribute definition table with `attr_name` and `attr_type`, and four value tables partitioned by XSD type. Audit records, for instance, define attributes such as `duration_seconds` with a value of `2391.38` and `host_name` with a value of `node-a01`, while trace records define the same attribute names but carry values like `3252.57` for duration and `gw-12` for host. This uniformity simplifies query patterns and tooling, as the schema is domain-agnostic even though the data is not.

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

Subject-target-role relationships model directed associations between entities using a ternary pattern. The relationship table `t_ebpfprogram_verified_safe__verified_safe_by` links an `ebpfprogram_id` (the subject) to a `verified_safe_by_id` (the target) through a `role` column that classifies the nature of the association. An eBPF program such as `SAFE-0004` may appear as a subject with the role `contributor` pointing to target `SAFE-0002`, while the same program may also appear with the role `owner` pointing to target `SAFE-0004`. Roles observed in the corpus include `contributor`, `reviewer`, and `owner`, each encoding a distinct governance relationship. The composite key of subject and target, together with the role, ensures that the same pair of entities can participate in multiple distinct relationships without ambiguity.

**t_ebpfprogram_verified_safe**

| id | ebpfprogram |
| --- | --- |
| SAFE-0001 | lsm_file_open |
| SAFE-0002 | sock_ops_connect |
| SAFE-0003 | perf_event_trace |
| SAFE-0004 | tc_police_ingress |
| SAFE-0005 | xdp_router |
| SAFE-0006 | cgroup_skb_ingress |

**t_ebpfprogram_verified_safe_verified_safe_by**

| id | verified_safe_by |
| --- | --- |
| SAFE-0001 | libbpf |
| SAFE-0002 | Kani_bpf |
| SAFE-0003 | Z3_solver |
| SAFE-0004 | Kani_bpf |
| SAFE-0005 | veristat |
| SAFE-0006 | FramaC_bpf |

**t_ebpfprogram_verified_safe__verified_safe_by**

| id | ebpfprogram_id | verified_safe_by_id | role |
| --- | --- | --- | --- |
| SAFE-0001 | SAFE-0004 | SAFE-0002 | contributor |
| SAFE-0002 | SAFE-0004 | SAFE-0004 | reviewer |
| SAFE-0003 | SAFE-0003 | SAFE-0005 | owner |
| SAFE-0004 | SAFE-0002 | SAFE-0003 | owner |
| SAFE-0005 | SAFE-0001 | SAFE-0003 | contributor |
| SAFE-0006 | SAFE-0003 | SAFE-0006 | contributor |
| SAFE-0007 | SAFE-0001 | SAFE-0005 | owner |
| SAFE-0008 | SAFE-0001 | SAFE-0002 | owner |