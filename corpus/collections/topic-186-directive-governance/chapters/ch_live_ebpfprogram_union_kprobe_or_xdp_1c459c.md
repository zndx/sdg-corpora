---
chapter_id: ch_live_ebpfprogram_union_kprobe_or_xdp_1c459c
topic_id: 186
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_union_kprobe_or_xdp', 'allocation_at_run_id', 'process_max_one_operator']
model: engine-refine
---

Identifiers serve as the immutable anchors of the data model, providing stable, system-wide references that persist across operational lifecycles. An identifier such as `XDP-0001` uniquely tags an eBPF program, while `RUN-0001` identifies a specific allocation run, and `OPER-0001` denotes a process operator instance. These identifiers are not human-readable labels; they are structured keys designed for reliable joins and referential integrity. The prefix convention—`XDP-` for eBPF programs, `RUN-` for allocation runs, `OPER-` for operators—encodes the entity class at a glance, enabling operators to distinguish between a program like `xdp_packet_dropper` and a run identifier like `pipeline-run-zeta` without consulting a schema dictionary.

**t_allocation_at_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | batch-etl-override |
| RUN-0002 | model-training-v3 |
| RUN-0003 | data-sync-nightly |
| RUN-0004 | ml-inference-run |
| RUN-0005 | ml-inference-run |
| RUN-0006 | batch-etl-override |
| RUN-0007 | ml-inference-run |

**t_allocation_at_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | pipeline-run-zeta |
| RUN-0002 | NodeExporter |
| RUN-0003 | PrometheusAgent |
| RUN-0004 | batch-hash-f3c2 |
| RUN-0005 | SecurityScanner |
| RUN-0006 | DBA |
| RUN-0007 | run-7a2b4c1d |
| RUN-0008 | NodeExporter |

**t_process_max_one_operator**

| id | process | operator |
| --- | --- | --- |
| OPER-0001 | SchemaEvolution | job-context-99a |
| OPER-0002 | BatchExport | SysAdmin |
| OPER-0003 | KeyRotation | job-context-99a |
| OPER-0004 | SchemaEvolution | alloc-tag-33f |
| OPER-0005 | ModelTraining | run-hash-66d |
| OPER-0006 | AuditCompaction | batch-hash-f3c2 |

Entities represent the discrete objects under governance: eBPF programs, allocation runs, process operators, and their associated metadata. An entity is identified by its key and described through a collection of attributes. For instance, the operator entity `OPER-0001` corresponds to the `SchemaEvolution` process executed by the `job-context-99a` operator, while `OPER-0002` maps to `BatchExport` run by `SysAdmin`. Similarly, the allocation entity `RUN-0001` carries the label `batch-etl-override` and is associated with the run identifier `pipeline-run-zeta`. Entities are not monolithic; they are decomposed into typed attributes whose values are stored in specialized value tables, enabling schema flexibility without sacrificing type safety.

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

Attributes and their types define the schema of an entity's descriptive properties. The attribute definition table pairs an attribute name—such as `duration_seconds`, `end_time`, `exit_code`, or `host_name`—with its semantic type, expressed in XSD notation: `xsd:decimal` for numeric durations, `xsd:dateTime` for timestamps, `xsd:integer` for exit codes, and `xsd:string` for hostnames. This separation of attribute definition from attribute value is critical: the definition establishes the contract, while the value tables hold the actual data. A duration of `3596.17` seconds, an end time of `2025-02-16T08:36:01`, an exit code of `284`, and a hostname value of `gw-12` are all stored in their respective typed value tables—decimal, datetime, integer, and varchar—each linked back to the same entity and attribute through foreign keys. The value tables are partitioned by type to enforce schema discipline; a datetime value never appears in the decimal store, and a string value never contaminates the integer store.

Mimetype and sizebytes capture the physical characteristics of the artifacts associated with entities. An eBPF program identified as `XDP-0001` carries the MIME type `application/xml` and occupies `613,043,965` bytes, while `XDP-0002` is stored as `application/parquet` at `757,467,115` bytes. These fields are essential for storage planning, content negotiation, and integrity verification. The MIME type `application/octet-stream` for `XDP-0003` signals a binary blob, whereas `text/csv` for `XDP-0004` indicates a structured text format. Size values span orders of magnitude—from `79,215,808` bytes for the smallest program to over `757` million for the largest—reflecting the diversity of eBPF program payloads and their associated metadata.

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |

Subject and target, mediated by role, model the relational fabric that connects entities beyond their intrinsic attributes. The junction table linking allocations to run identifiers uses `subject` to reference the allocation side of the relationship and `target` for the run identifier side, with `role` describing the nature of the association. In one instance, allocation `RUN-0001` (the subject) is linked to run identifier `RUN-0003` (the target) with the role `observer`, indicating that the allocation passively monitors the run. Another pairing connects allocation `RUN-0004` to run identifier `RUN-0007` with role `reviewer`, implying an active oversight function. The role field—taking values such as `observer` and `reviewer`—adds semantic richness to the relationship, transforming a simple many-to-many link into a governed association with defined responsibilities. This pattern enables the system to express not just which entities are connected, but how they interact within the operational workflow.

**t_allocation_at_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0001 | RUN-0003 | observer |
| RUN-0002 | RUN-0004 | RUN-0007 | reviewer |
| RUN-0003 | RUN-0003 | RUN-0004 | observer |
| RUN-0004 | RUN-0005 | RUN-0001 | observer |
| RUN-0005 | RUN-0007 | RUN-0002 | contributor |
| RUN-0006 | RUN-0007 | RUN-0001 | reviewer |
| RUN-0007 | RUN-0003 | RUN-0005 | owner |
| RUN-0008 | RUN-0007 | RUN-0004 | contributor |