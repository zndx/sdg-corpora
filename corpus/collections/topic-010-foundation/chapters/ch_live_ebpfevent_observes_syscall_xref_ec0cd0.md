---
chapter_id: ch_live_ebpfevent_observes_syscall_xref_ec0cd0
topic_id: 10
family: 04_ebpf_kernel
cited_terms: ['ebpfevent_observes_syscall_xref', 'ebpfevent_via_program_xref', 'ebpfmap_basic']
model: engine-refine
---

Observability infrastructures rely upon structured telemetry to reconstruct the lifecycle of kernel-level probes and user-space workloads. Within such architectures, the ebpfevent and ebpfmap constructs serve as the primary carriers of execution and resource-state data, respectively. Each instance is anchored by a unique identifier that guarantees referential integrity across fact and dimension layers. The categorical taxonomy—organized under category and misc designations—provides the semantic scaffolding necessary to group disparate telemetry streams into coherent operational domains. For instance, an ebpfevent labeled Ebpfevent Label 01 may be classified under Ebpfevent Category 01, while its ebpfmap counterpart, Ebpfmap Label 02, resides within Ebpfmap Category 02. This hierarchical labeling ensures that high-frequency probe data can be aggregated, filtered, and routed to downstream analytics without ambiguity.

**dim_ebpfevent**

| id | ebpfevent_label | ebpfevent_category |
| --- | --- | --- |
| XREF-0001 | Ebpfevent Label 01 | Ebpfevent Category 01 |
| XREF-0002 | Ebpfevent Label 02 | Ebpfevent Category 02 |
| XREF-0003 | Ebpfevent Label 03 | Ebpfevent Category 03 |
| XREF-0004 | Ebpfevent Label 04 | Ebpfevent Category 04 |
| XREF-0005 | Ebpfevent Label 05 | Ebpfevent Category 05 |
| XREF-0006 | Ebpfevent Label 06 | Ebpfevent Category 06 |

**t_ebpfevent_via_program_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | DATA_LAKE_SYNC_FAIL |
| XREF-0002 | DATA_LAKE_SYNC_FAIL |
| XREF-0003 | TELEMETRY_HEARTBEAT |
| XREF-0004 | BATCH_ETL_COMPLETE |
| XREF-0005 | BATCH_ETL_COMPLETE |
| XREF-0006 | BATCH_ETL_COMPLETE |
| XREF-0007 | AUDIT_LOG_ROTATE |
| XREF-0008 | SYS_METRIC_COLLECT_9 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

The temporal and operational characteristics of these probes are captured in fact tables that quantify execution behavior. Duration seconds records the elapsed wall-clock time for each event, with observed values ranging from 889.87 to 5696.76, reflecting the variance between lightweight heartbeats and heavyweight synchronization tasks. Exit values document the termination state of each run, yielding discrete integers such as 988, 313, 278, and 158 that signal success, partial completion, or failure conditions. When transient faults occur, the retry count metric tracks the number of recovery attempts, with recorded values of 278, 427, 133, and 38 indicating varying degrees of system resilience. Parallel to event tracking, the ebpfmap fact table monitors kernel data structure consumption, where size bytes quantifies memory allocation, spanning from 31105012 to 354373995, thereby enabling capacity planning and memory-leak detection at the eBPF layer.

**fact_ebpfevent**

| id | ebpfevent_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| XREF-0001 | XREF-0003 | 889.87 | 988 | 278 |
| XREF-0002 | XREF-0005 | 1832.41 | 313 | 427 |
| XREF-0003 | XREF-0001 | 3410.73 | 278 | 133 |
| XREF-0004 | XREF-0005 | 5696.76 | 158 | 38 |
| XREF-0005 | XREF-0005 | 4846.66 | 7 | 455 |
| XREF-0006 | XREF-0004 | 4215.38 | 52 | 460 |
| XREF-0007 | XREF-0006 | 653.90 | 100 | 108 |
| XREF-0008 | XREF-0005 | 2673.38 | 169 | 73 |

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

To accommodate heterogeneous telemetry payloads without schema rigidity, the architecture employs an attribute-value paradigm where each measurement is decoupled from its container. The attr column designates the semantic property being recorded—such as duration_seconds, end_time, exit_code, or host_name—while the attr type column enforces strict data typing using XSD standards, including xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This separation allows the system to store diverse measurements under a unified entity reference, which acts as the foreign key linking back to the originating probe or workload. Numeric payloads are persisted in dedicated decimal stores, yielding values like 523.38 and 5096.06, whereas integer attributes capture discrete counters such as 165 and 480. Temporal attributes resolve to ISO-8601 timestamps like 2024-04-10T05:27:34, and string-based misc values preserve operational metadata, including host identifiers like worker-07 and diagnostic strings such as review or failed.

**t_ebpfevent_via_program_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2024-04-10T05:27:34 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2023-11-22T11:52:36 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2023-03-12T23:52:23 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-06-01T11:10:59 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2025-03-29T17:45:15 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2025-05-05T19:52:00 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2025-04-08T16:02:54 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2023-08-28T04:07:50 |

**t_ebpfevent_via_program_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 523.38 |
| XREF-0002 | XREF-0002 | XREF-0001 | 5096.06 |
| XREF-0003 | XREF-0003 | XREF-0001 | 3292.30 |
| XREF-0004 | XREF-0004 | XREF-0001 | 4000.50 |
| XREF-0005 | XREF-0005 | XREF-0001 | 6997.28 |
| XREF-0006 | XREF-0006 | XREF-0001 | 6461.53 |
| XREF-0007 | XREF-0007 | XREF-0001 | 396.42 |
| XREF-0008 | XREF-0008 | XREF-0001 | 2149.89 |

**t_ebpfevent_via_program_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 165 |
| XREF-0002 | XREF-0001 | XREF-0007 | 480 |
| XREF-0003 | XREF-0002 | XREF-0003 | 408 |
| XREF-0004 | XREF-0002 | XREF-0007 | 150 |
| XREF-0005 | XREF-0003 | XREF-0003 | 507 |
| XREF-0006 | XREF-0003 | XREF-0007 | 419 |
| XREF-0007 | XREF-0004 | XREF-0003 | 413 |
| XREF-0008 | XREF-0004 | XREF-0007 | 9 |

**t_ebpfevent_via_program_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | worker-07 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | review |
| XREF-0004 | XREF-0001 | XREF-0010 | failed |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | ingest-21 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | execution |

The cross-referencing layer bridges programmatic event names with their dimensional and factual representations, ensuring that raw telemetry aligns with business logic. Events such as DATA_LAKE_SYNC_FAIL, TELEMETRY_HEARTBEAT, and BATCH_ETL_COMPLETE are mapped to their respective identifiers, enabling correlation between infrastructure-level eBPF probes and application-layer workflows. By maintaining strict foreign-key relationships between the fact tables, dimension lookups, and the attribute-value stores, the model supports complex analytical queries without denormalization penalties. This design guarantees that every duration seconds measurement, exit value, or size bytes allocation can be traced back to its originating entity, categorized under its proper taxonomy, and typed according to its semantic role. Consequently, operators gain a unified, queryable ledger of system behavior, where transient probe executions and persistent kernel maps are rendered into actionable, auditable intelligence.

**t_ebpfevent_via_program_xref_attr**

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