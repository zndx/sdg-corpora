---
chapter_id: ch_live_ebpfevent_at_kernel_hook_xref_606e52
topic_id: 40
family: 04_ebpf_kernel
cited_terms: ['ebpfevent_at_kernel_hook_xref', 'claim_not_disconfirmed', 'syscall_audited_by']
model: engine-refine
---

Attributes, their types, and the entities they describe form the structural backbone of any system that must track heterogeneous operational data without collapsing into a single undifferentiated value column. The kernel hook cross-reference framework illustrates this principle directly: each event—whether `tracepoint_file_open`, `tracepoint_sched_switch`, or `kprobe_do_execve`—receives a stable identifier such as `XREF-0001` through `XREF-0004`, and a separate attribute definition table assigns each attribute a name and an XML Schema type. The attribute `duration_seconds` carries type `xsd:decimal`, `end_time` is typed `xsd:dateTime`, `exit_code` is `xsd:integer`, and `host_name` is `xsd:string`. This separation of attribute metadata from attribute values is not merely organizational; it enforces type discipline at the schema level, ensuring that a decimal value like `6431.54` or `4806.21` never collides with a datetime such as `2023-05-01T02:25:15` or `2024-11-27T07:20:09`.

**t_ebpfevent_at_kernel_hook_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | tracepoint_file_open |
| XREF-0002 | tracepoint_sched_switch |
| XREF-0003 | tracepoint_sched_switch |
| XREF-0004 | kprobe_do_execve |
| XREF-0005 | kretprobe_sys_openat |
| XREF-0006 | tracepoint_file_open |
| XREF-0007 | tracepoint_file_open |

**t_ebpfevent_at_kernel_hook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | duration_seconds | xsd:decimal |
| XREF-0002 | end_time | xsd:dateTime |
| XREF-0003 | exit_code | xsd:integer |
| XREF-0004 | host_name | xsd:string |
| XREF-0005 | log_level | xsd:string |
| XREF-0006 | phase | xsd:string |
| XREF-0007 | retry_count | xsd:integer |
| XREF-0008 | scheduled_at | xsd:dateTime |

**t_ebpfevent_at_kernel_hook_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2023-05-01T02:25:15 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2024-11-27T07:20:09 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2025-02-12T09:55:43 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-05-24T23:07:29 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2024-09-21T23:23:59 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2024-03-30T22:13:30 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2023-05-04T20:31:37 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2025-01-21T19:19:05 |

**t_ebpfevent_at_kernel_hook_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 6431.54 |
| XREF-0002 | XREF-0002 | XREF-0001 | 4806.21 |
| XREF-0003 | XREF-0003 | XREF-0001 | 5462.31 |
| XREF-0004 | XREF-0004 | XREF-0001 | 1550.57 |
| XREF-0005 | XREF-0005 | XREF-0001 | 39.90 |
| XREF-0006 | XREF-0006 | XREF-0001 | 2405.95 |
| XREF-0007 | XREF-0007 | XREF-0001 | 1945.32 |

**t_ebpfevent_at_kernel_hook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 571 |
| XREF-0002 | XREF-0001 | XREF-0007 | 284 |
| XREF-0003 | XREF-0002 | XREF-0003 | 60 |
| XREF-0004 | XREF-0002 | XREF-0007 | 436 |
| XREF-0005 | XREF-0003 | XREF-0003 | 3 |
| XREF-0006 | XREF-0003 | XREF-0007 | 8 |
| XREF-0007 | XREF-0004 | XREF-0003 | 922 |
| XREF-0008 | XREF-0004 | XREF-0007 | 55 |

**t_ebpfevent_at_kernel_hook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | node-b14 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | execution |
| XREF-0004 | XREF-0001 | XREF-0010 | pending |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | edge-03 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | review |

The value tables themselves are partitioned by type, each one holding rows that link an `entity_id` back to the cross-reference identifiers and store the actual value in a column appropriate to its schema type. Decimal values—`6431.54`, `4806.21`, `5462.31`, `1550.57`—reside in the decimal valuation table, all pointing to the same attribute identifier `XREF-0001` but attached to distinct entities `XREF-0001` through `XREF-0004`. Integer values such as `571`, `284`, `60`, and `436` occupy their own table, similarly keyed by entity and attribute identifiers. Datetime entries like `2023-05-01T02:25:15`, `2024-11-27T07:20:09`, `2025-02-12T09:55:43`, and `2023-05-24T23:07:29` are stored in the datetime table, while string values including `node-b14`, `Log Level 02`, `execution`, and `pending` live in the varchar table. This partitioning is a deliberate design choice: it eliminates the need for runtime type coercion, simplifies indexing strategies, and makes it possible to enforce constraints such as non-nullability on a per-type basis.

**t_claim_not_disconfirmed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0002 | Dimension Kind 01 |
| DISC-0002 | DISC-0001 | DISC-0008 | Encoding 02 |
| DISC-0003 | DISC-0001 | DISC-0009 | intake form |
| DISC-0004 | DISC-0001 | DISC-0010 | ja |
| DISC-0005 | DISC-0001 | DISC-0003 | hybrid |
| DISC-0006 | DISC-0001 | DISC-0006 | mg/L |
| DISC-0007 | DISC-0002 | DISC-0002 | Dimension Kind 07 |
| DISC-0008 | DISC-0002 | DISC-0008 | Encoding 08 |

A parallel structure governs the claims framework, where assertions about system state—`redundancy failover successful`, `secondary sensor aligned`, `firmware version outdated`, `thermal monitoring active`—are tracked in a dedicated table with identifiers `DISC-0001` through `DISC-0004`. Each claim carries its own set of attributes: `confidence` typed as `xsd:decimal`, `dimension_kind` and `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`. The decimal confidence values, such as `0.145` and `0.678`, are stored separately from the string attributes like `Dimension Kind 01`, `Encoding 02`, `intake form`, and `ja`, and from the datetime stamps `2023-08-09T14:45:08`, `2023-07-14T01:11:42`, `2023-07-27T10:01:23`, and `2024-07-11T23:49:48`. The same type-partitioned pattern repeats, reinforcing that this is not an isolated convention but a systemic approach to handling multi-typed entity data.

**t_claim_not_disconfirmed**

| id | claim | claim_2 |
| --- | --- | --- |
| DISC-0001 | redundancy failover successful | data pipeline stalled |
| DISC-0002 | secondary sensor aligned | latency under SLA bounds |
| DISC-0003 | firmware version outdated | threshold limits expanded |
| DISC-0004 | thermal monitoring active | secondary sensor aligned |
| DISC-0005 | firmware version outdated | network latency spike unexplained |
| DISC-0006 | temperature sensor offline | redundancy failover successful |
| DISC-0007 | latency under SLA bounds | network latency spike unexplained |

**t_claim_not_disconfirmed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DISC-0001 | confidence | xsd:decimal |
| DISC-0002 | dimension_kind | xsd:string |
| DISC-0003 | method | xsd:string |
| DISC-0004 | recorded_at | xsd:dateTime |
| DISC-0005 | uncertainty | xsd:decimal |
| DISC-0006 | unit | xsd:string |
| DISC-0007 | value | xsd:decimal |
| DISC-0008 | encoding | xsd:string |

**t_claim_not_disconfirmed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0004 | 2023-08-09T14:45:08 |
| DISC-0002 | DISC-0002 | DISC-0004 | 2023-07-14T01:11:42 |
| DISC-0003 | DISC-0003 | DISC-0004 | 2023-07-27T10:01:23 |
| DISC-0004 | DISC-0004 | DISC-0004 | 2024-07-11T23:49:48 |
| DISC-0005 | DISC-0005 | DISC-0004 | 2024-06-18T23:43:54 |
| DISC-0006 | DISC-0006 | DISC-0004 | 2023-11-25T07:03:11 |
| DISC-0007 | DISC-0007 | DISC-0004 | 2025-06-11T19:52:01 |

**t_claim_not_disconfirmed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0001 | 0.145 |
| DISC-0002 | DISC-0001 | DISC-0005 | 669.01 |
| DISC-0003 | DISC-0001 | DISC-0007 | 65.74 |
| DISC-0004 | DISC-0002 | DISC-0001 | 0.678 |
| DISC-0005 | DISC-0002 | DISC-0005 | 525.06 |
| DISC-0006 | DISC-0002 | DISC-0007 | 361.13 |
| DISC-0007 | DISC-0003 | DISC-0001 | 0.813 |
| DISC-0008 | DISC-0003 | DISC-0005 | 578.57 |

Beyond attributes and values, the system must also account for how data is serialized and in which language it is produced or consumed. The syscall audit table records individual system calls—`unlinkat`, `execve`, `epoll_ctl`, `clone`—alongside their output format (`JSON`, `UUID`, `CSV`) and the language code (`fr`, `en`, `ja`) associated with the audit record. This is a different dimension of metadata: it does not describe the content of a value but rather the container and locale in which that content is presented. A syscall such as `execve` may be formatted as `UUID` and recorded in English (`en`), while `unlinkat` uses `JSON` and is associated with French (`fr`). The format and language columns serve as routing and localization hints for downstream consumers, ensuring that audit data reaches the correct parser and the correct linguistic audience.

**t_syscall_audited_by**

| id | syscall | format | language |
| --- | --- | --- | --- |
| AUDI-0001 | unlinkat | JSON | fr |
| AUDI-0002 | execve | UUID | en |
| AUDI-0003 | epoll_ctl | CSV | ja |
| AUDI-0004 | clone | UUID | en |

The interplay between these tables—identifiers that anchor events and claims, attribute definitions that specify names and types, value tables that store heterogeneous data by schema category, and audit records that capture format and language—creates a coherent model for operational observability. An entity such as `XREF-0001` can simultaneously carry a duration of `6431.54` seconds, an end time of `2023-05-01T02:25:15`, an exit code of `571`, and a host name of `node-b14`, each value residing in its own type-appropriate table but unified through the shared entity identifier. Similarly, a claim like `redundancy failover successful` (`DISC-0001`) can be associated with a confidence of `0.145`, a dimension kind of `Dimension Kind 01`, a method of `Encoding 02`, and a recorded timestamp of `2023-08-09T14:45:08`. The model scales because it does not force every attribute into every row; instead, it distributes values across type-specific tables and joins them through identifiers, a pattern that is both space-efficient and type-safe.