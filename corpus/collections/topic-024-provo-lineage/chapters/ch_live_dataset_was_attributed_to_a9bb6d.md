---
chapter_id: ch_live_dataset_was_attributed_to_a9bb6d
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_attributed_to', 'ebpf_event_at_hook', 'kernelhook_with_attached_program']
model: engine-refine
---

Within kernel-level observability frameworks, eBPF programs serve as the primary instrumentation mechanism, attaching to specific kernel hooks to capture execution events and system behavior. Programs such as `oom_kill_recorder`, `tcp_connect_monitor`, `socket_bind_observer`, and `kprobe__do_fork` are bound to hook locations including `sk_skb`, `xdp`, `sockops`, and `tracepoint`, forming a structured mapping between instrumentation logic and the kernel entry points they monitor. Each attached program carries metadata—its binary size, ranging from approximately 27 MB to 561 MB, and a version identifier—that governs lifecycle management and compatibility verification. Programs are further classified by category and labeled for administrative discoverability, enabling operators to distinguish between memory management monitors, network traffic observers, and process lifecycle trackers within a unified registry.

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |

**t_ebpf_event_at_hook**

| id | ebpf | at_hook |
| --- | --- | --- |
| HOOK-0001 | oom_kill_recorder | sk_skb |
| HOOK-0002 | tcp_connect_monitor | xdp |
| HOOK-0003 | socket_bind_observer | sockops |
| HOOK-0004 | kprobe__do_fork | tracepoint |
| HOOK-0005 | xdp_drop_counter | kretprobe |
| HOOK-0006 | disk_io_latency | tc_ingress |
| HOOK-0007 | xdp_drop_counter | xdp |
| HOOK-0008 | tcp_connect_monitor | tc_ingress |

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |

The event data captured at these hooks is structured through a typed attribute model that separates schema definition from value storage. Attributes such as `duration_seconds`, `end_time`, `exit_code`, and `host_name` are declared with their corresponding data types—`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`—ensuring type-safe ingestion and query-time validation. Actual measurements are stored in dedicated value tables keyed to the entity (the hook event) and the attribute, producing a normalized layout where decimal values like 289.81 or 3531.53, integer codes such as 245 or 83, datetime stamps including `2025-04-15T06:28:34`, and string identifiers like `gw-12` or `running` are each housed in their respective typed containers. This separation permits efficient indexing per data type while preserving the flexibility to add new attributes without restructuring the underlying storage.

**t_ebpf_event_at_hook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| HOOK-0001 | duration_seconds | xsd:decimal |
| HOOK-0002 | end_time | xsd:dateTime |
| HOOK-0003 | exit_code | xsd:integer |
| HOOK-0004 | host_name | xsd:string |
| HOOK-0005 | log_level | xsd:string |
| HOOK-0006 | phase | xsd:string |
| HOOK-0007 | retry_count | xsd:integer |
| HOOK-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_at_hook_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0002 | 2025-04-15T06:28:34 |
| HOOK-0002 | HOOK-0001 | HOOK-0008 | 2023-07-01T04:43:47 |
| HOOK-0003 | HOOK-0001 | HOOK-0009 | 2024-07-23T09:28:11 |
| HOOK-0004 | HOOK-0002 | HOOK-0002 | 2024-10-19T19:53:20 |
| HOOK-0005 | HOOK-0002 | HOOK-0008 | 2024-09-07T20:44:31 |
| HOOK-0006 | HOOK-0002 | HOOK-0009 | 2024-01-06T00:55:45 |
| HOOK-0007 | HOOK-0003 | HOOK-0002 | 2023-07-31T02:59:19 |
| HOOK-0008 | HOOK-0003 | HOOK-0008 | 2024-12-05T20:30:51 |

**t_ebpf_event_at_hook_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0001 | 289.81 |
| HOOK-0002 | HOOK-0002 | HOOK-0001 | 3531.53 |
| HOOK-0003 | HOOK-0003 | HOOK-0001 | 3907.51 |
| HOOK-0004 | HOOK-0004 | HOOK-0001 | 3791.90 |
| HOOK-0005 | HOOK-0005 | HOOK-0001 | 2276.70 |
| HOOK-0006 | HOOK-0006 | HOOK-0001 | 4707.83 |
| HOOK-0007 | HOOK-0007 | HOOK-0001 | 5960.02 |
| HOOK-0008 | HOOK-0008 | HOOK-0001 | 1500.90 |

**t_ebpf_event_at_hook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0003 | 245 |
| HOOK-0002 | HOOK-0001 | HOOK-0007 | 83 |
| HOOK-0003 | HOOK-0002 | HOOK-0003 | 157 |
| HOOK-0004 | HOOK-0002 | HOOK-0007 | 346 |
| HOOK-0005 | HOOK-0003 | HOOK-0003 | 820 |
| HOOK-0006 | HOOK-0003 | HOOK-0007 | 382 |
| HOOK-0007 | HOOK-0004 | HOOK-0003 | 364 |
| HOOK-0008 | HOOK-0004 | HOOK-0007 | 482 |

**t_ebpf_event_at_hook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0004 | gw-12 |
| HOOK-0002 | HOOK-0001 | HOOK-0005 | Log Level 02 |
| HOOK-0003 | HOOK-0001 | HOOK-0006 | closeout |
| HOOK-0004 | HOOK-0001 | HOOK-0010 | running |
| HOOK-0005 | HOOK-0001 | HOOK-0011 | Triggered By 05 |
| HOOK-0006 | HOOK-0002 | HOOK-0004 | node-b14 |
| HOOK-0007 | HOOK-0002 | HOOK-0005 | Log Level 07 |
| HOOK-0008 | HOOK-0002 | HOOK-0006 | initiation |

Attribution records provide provenance for datasets collected through these instrumentation pipelines, linking each dataset to its source through a foreign-key relationship that references the attribution dimension. Dataset identifiers such as `ATTR-0001` through `ATTR-0004` carry version numbers—ranging from 2 to 10—and file sizes spanning from 31 MB to 676 MB, reflecting the variable volume of telemetry produced by different collection configurations. The attribution dimension itself supplies human-readable labels and categorical classifications, allowing operators to trace a dataset back to its originating collection process and understand its organizational context without consulting operational documentation.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

The overall architecture follows a star-schema pattern common in analytical data warehouses, where fact tables capture measurable quantities—kernel hook sizes, dataset sizes, and version numbers—while dimension tables supply the descriptive context needed for filtering, grouping, and reporting. The `fact_kernelhook` and `fact_dataset` tables each anchor a distinct analytical domain: one centered on the programs and hooks that generate telemetry, the other on the datasets themselves and their provenance. Both share a common design principle—foreign keys that reference dimension tables for labels and categories—ensuring that every quantitative record can be enriched with semantic metadata at query time. This separation of concerns between measurement and classification supports both operational dashboards that track program sizes and versions, and analytical queries that aggregate event values by attribute type, hook location, or attribution category.