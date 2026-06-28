---
chapter_id: ch_live_subclass_to_process_770246
topic_id: 45
family: 01_foundation
cited_terms: ['subclass_to_process', 'pignistic_transformation', 'kernelhook_only_kprobe']
model: engine-refine
---

Operational governance over distributed telemetry, belief-state diagnostics, and kernel instrumentation rests on a small set of relational primitives that recur across otherwise heterogeneous subsystems. An **identifier** supplies the durable handle by which every record participates in joins, audits, and lineage reconstruction: process instances carry labels such as PROC-0001 through PROC-0004, transformation artifacts TRAN-0001 through TRAN-0004, and kernel-hook registrations KPRO-0001 through KPRO-0004. Because identifiers are typed by namespace prefix and assigned independently of descriptive text, the same key can anchor a definitional row (incident response mapped to PROC-0001), every attribute observation tied to that process, and every cross-domain association that cites the key as either endpoint. Stability of identifier assignment is therefore a compliance precondition: once PROC-0001 has accumulated duration_seconds readings, datetime stamps, integer exit codes, and varchar host labels, re-keying would fracture evidentiary continuity unless a formal supersession chain is recorded.

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

The **entity** is the governed object whose state the system measures, not the measurement row itself. In the process-monitoring slice, entity_id values such as PROC-0001 and PROC-0002 denote concrete executions—incident response and data validation respectively—while sibling rows under the same identifier family may describe the class-level process definition. Typed value stores partition observations by **attr_type**, enforcing that a decimal duration (5106.96 s on PROC-0001, 6532.76 s on PROC-0002) never co-resides with a datetime end_time (2024-02-25T00:58:35 for PROC-0001) or an integer exit_code (684 and 195 on PROC-0001) inside a single undifferentiated column. The **attr** names the semantic dimension—duration_seconds, end_time, exit_code, host_name—while attr_id (PROC-0001, PROC-0003, PROC-0004, and others) binds that semantics to the identifier registry so that heterogeneous collectors can emit facts without re-negotiating field meaning at ingest time. **Attr_type** declarations (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) close the loop: they dictate validation rules, storage surface, and permissible aggregation, which is why host_name resolves to worker-07 as varchar, Log Level 02 and closeout/pending as operational status strings, and never as spurious numerics.

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

The payload carried on each typed value row is conventionally materialized in a **misc** column—not because the data is miscellaneous, but because its interpretation is always deferred to the paired entity and attr context. A misc value of 6219.83 seconds attached to entity PROC-0003 (telemetry aggregation) and attr_id PROC-0001 is a duration observation; the identical column holding 63 or 361 under attr_id PROC-0007 on PROC-0002 is an integer-coded diagnostic counter whose units are defined only by attr metadata. Likewise, 2024-06-21T23:54:50 misc on PROC-0002 with attr_id PROC-0002 records a temporal boundary for data validation, while 2025-01-11T16:52:13 on PROC-0001 marks a distinct lifecycle event on incident response. Governance reviewers therefore treat misc as evidentiary substance only after verifying entity–attr–type alignment; isolated literals are inadmissible for compliance findings.

Associations between definitional records introduce **subject** and **target** as directed endpoints, with **role** qualifying the nature of the link rather than duplicating either endpoint’s intrinsic description. In the pignistic transformation graph, subject pignistic_id TRAN-0008 (a diagnostic confidence matrix context) may target pignistic_transform_id TRAN-0005 (a pignistic probability distribution) under role reviewer, while TRAN-0006 as subject links to TRAN-0003 (transformed belief state) under the same reviewer role, and TRAN-0005 as subject connects to TRAN-0006 under contributor—separating attestation authority from authorship of the transform. The parallel kernel-hook pattern is structurally identical: kernelhook_id KPRO-0002 (kfree) targets hook_kind_id KPRO-0005 (kprobe_perf) with role owner, whereas KPRO-0004 (ext4_file_open) targets KPRO-0006 under contributor and KPRO-0005 (vfs_read) targets KPRO-0002 (kprobe_trace) under reviewer. Roles are not decorative labels; they determine who may certify a hook configuration, who may supply telemetry belief assignments versus anomaly likelihood sets, and which betting-probability transforms require independent review before production promotion.

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role form a layered evidence model. Identifiers and attrs establish vocabulary; entities anchor observations in operational reality; attr_type and misc enforce typed, auditable fact storage; and subject–target–role triples encode directed governance relationships across diagnostic, probabilistic, and kernel-instrumentation domains. A complete compliance read of, say, batch ingestion (PROC-0004) with duration 2715.88 s therefore traverses definition, typed measurement, and—where applicable—association roles, yielding a single coherent narrative from raw telemetry through certified transformation and monitored execution hook, without collapsing distinct semantic layers into one undifferentiated field.