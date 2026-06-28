---
chapter_id: ch_live_ebpf_event_at_hook_41554f
topic_id: 65
family: 02_observation_measurement
cited_terms: ['ebpf_event_at_hook', 'ebpf_event_basic', 'ebpf_event_for_syscall']
model: engine-refine
---

Within the eBPF observability framework, event records are anchored by stable identifiers that serve as the primary key for every subsequent data association. Event identifiers follow a type-prefixed convention: `HOOK-0001` through `HOOK-0004` for hook-attached events, `EVEN-0001` through `EVEN-0004` for basic events, and `SYSC-0001` through `SYSC-0004` for syscall-bound events. Each identifier maps to a specific eBPF program—`kubelet`, `disk_io_latency`, `sys_enter_open`, and `oom_kill_recorder` appear across the hook-attached set; `dns_query_log`, `oom_kill_recorder`, `systemd`, and `tracepoint__sched_switch` populate the basic set; and `oom_kill_recorder`, `tracepoint__sched_switch`, `file_read_bytes`, and `containerd` anchor the syscall set. The hook-attached events carry an additional `at_hook` column specifying the attachment point—`sk_skb`, `xdp`, `sockops`, or `tracepoint`—while the syscall events carry a `for_syscall` column indicating the target system call: `mmap`, `openat`, `connect`, or `bind`. This tripartite classification ensures that every event can be traced to its instrumentation context without ambiguity.

**t_ebpf_event_at_hook**

| id | ebpf | at_hook |
| --- | --- | --- |
| HOOK-0001 | kubelet | sk_skb |
| HOOK-0002 | disk_io_latency | xdp |
| HOOK-0003 | sys_enter_open | sockops |
| HOOK-0004 | oom_kill_recorder | tracepoint |
| HOOK-0005 | netsec_monitor | kretprobe |
| HOOK-0006 | fluentd | tc_ingress |
| HOOK-0007 | netsec_monitor | xdp |
| HOOK-0008 | systemd | tc_ingress |

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

**t_ebpf_event_basic**

| id | ebpf |
| --- | --- |
| EVEN-0001 | dns_query_log |
| EVEN-0002 | oom_kill_recorder |
| EVEN-0003 | systemd |
| EVEN-0004 | tracepoint__sched_switch |
| EVEN-0005 | container_isolation_hook |
| EVEN-0006 | promtail |
| EVEN-0007 | process_spawn_alert |
| EVEN-0008 | dns_query_log |

**t_ebpf_event_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | duration_seconds | xsd:decimal |
| EVEN-0002 | end_time | xsd:dateTime |
| EVEN-0003 | exit_code | xsd:integer |
| EVEN-0004 | host_name | xsd:string |
| EVEN-0005 | log_level | xsd:string |
| EVEN-0006 | phase | xsd:string |
| EVEN-0007 | retry_count | xsd:integer |
| EVEN-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0003 | 615 |
| EVEN-0002 | EVEN-0001 | EVEN-0007 | 227 |
| EVEN-0003 | EVEN-0002 | EVEN-0003 | 918 |
| EVEN-0004 | EVEN-0002 | EVEN-0007 | 103 |
| EVEN-0005 | EVEN-0003 | EVEN-0003 | 872 |
| EVEN-0006 | EVEN-0003 | EVEN-0007 | 453 |
| EVEN-0007 | EVEN-0004 | EVEN-0003 | 370 |
| EVEN-0008 | EVEN-0004 | EVEN-0007 | 219 |

**t_ebpf_event_for_syscall**

| id | ebpf | for_syscall |
| --- | --- | --- |
| SYSC-0001 | oom_kill_recorder | mmap |
| SYSC-0002 | tracepoint__sched_switch | openat |
| SYSC-0003 | file_read_bytes | connect |
| SYSC-0004 | containerd | bind |
| SYSC-0005 | thread_create_tracer | read |
| SYSC-0006 | containerd | openat |

**t_ebpf_event_for_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | duration_seconds | xsd:decimal |
| SYSC-0002 | end_time | xsd:dateTime |
| SYSC-0003 | exit_code | xsd:integer |
| SYSC-0004 | host_name | xsd:string |
| SYSC-0005 | log_level | xsd:string |
| SYSC-0006 | phase | xsd:string |
| SYSC-0007 | retry_count | xsd:integer |
| SYSC-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_for_syscall_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0003 | 7 |
| SYSC-0002 | SYSC-0001 | SYSC-0007 | 420 |
| SYSC-0003 | SYSC-0002 | SYSC-0003 | 186 |
| SYSC-0004 | SYSC-0002 | SYSC-0007 | 281 |
| SYSC-0005 | SYSC-0003 | SYSC-0003 | 156 |
| SYSC-0006 | SYSC-0003 | SYSC-0007 | 35 |
| SYSC-0007 | SYSC-0004 | SYSC-0003 | 875 |
| SYSC-0008 | SYSC-0004 | SYSC-0007 | 95 |

Attribute definitions are scoped to each event category and establish the schema against which observed values are validated. Every event table—whether hook-attached, basic, or syscall-bound—shares a common attribute vocabulary: `duration_seconds` typed as `xsd:decimal`, `end_time` typed as `xsd:dateTime`, `exit_code` typed as `xsd:integer`, and `host_name` typed as `xsd:string`. These four attributes recur across all three event families, each assigned a unique attribute identifier (e.g., `HOOK-0001` through `HOOK-0004` for the hook-attached schema, `EVEN-0001` through `EVEN-0004` for the basic schema, and `SYSC-0001` through `SYSC-0004` for the syscall schema). The separation of attribute definitions from their values enforces a clear contract: the schema declares what may be observed, and the value tables record what was actually observed.

**t_ebpf_event_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-02-22T10:41:40 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 2025-04-20T21:58:53 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | 2024-07-05T03:32:46 |
| EVEN-0004 | EVEN-0002 | EVEN-0002 | 2025-01-15T01:37:56 |
| EVEN-0005 | EVEN-0002 | EVEN-0008 | 2024-11-30T06:10:00 |
| EVEN-0006 | EVEN-0002 | EVEN-0009 | 2023-10-12T13:43:33 |
| EVEN-0007 | EVEN-0003 | EVEN-0002 | 2025-05-19T17:11:08 |
| EVEN-0008 | EVEN-0003 | EVEN-0008 | 2024-12-23T02:27:40 |

**t_ebpf_event_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 2084.55 |
| EVEN-0002 | EVEN-0002 | EVEN-0001 | 3586.50 |
| EVEN-0003 | EVEN-0003 | EVEN-0001 | 2389.78 |
| EVEN-0004 | EVEN-0004 | EVEN-0001 | 1708.37 |
| EVEN-0005 | EVEN-0005 | EVEN-0001 | 4904.40 |
| EVEN-0006 | EVEN-0006 | EVEN-0001 | 2045.89 |
| EVEN-0007 | EVEN-0007 | EVEN-0001 | 4164.85 |
| EVEN-0008 | EVEN-0008 | EVEN-0001 | 4492.01 |

**t_ebpf_event_for_syscall_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0002 | 2025-06-18T16:09:11 |
| SYSC-0002 | SYSC-0001 | SYSC-0008 | 2023-11-08T17:00:45 |
| SYSC-0003 | SYSC-0001 | SYSC-0009 | 2025-04-25T11:16:48 |
| SYSC-0004 | SYSC-0002 | SYSC-0002 | 2024-10-09T21:27:52 |
| SYSC-0005 | SYSC-0002 | SYSC-0008 | 2024-01-10T15:25:08 |
| SYSC-0006 | SYSC-0002 | SYSC-0009 | 2024-10-06T14:16:05 |
| SYSC-0007 | SYSC-0003 | SYSC-0002 | 2023-05-30T09:11:09 |
| SYSC-0008 | SYSC-0003 | SYSC-0008 | 2023-01-31T01:26:46 |

**t_ebpf_event_for_syscall_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | 5668.45 |
| SYSC-0002 | SYSC-0002 | SYSC-0001 | 1373.81 |
| SYSC-0003 | SYSC-0003 | SYSC-0001 | 293.20 |
| SYSC-0004 | SYSC-0004 | SYSC-0001 | 2278.72 |
| SYSC-0005 | SYSC-0005 | SYSC-0001 | 1782.39 |
| SYSC-0006 | SYSC-0006 | SYSC-0001 | 358.71 |

Observed values are materialized in four type-disjoint value tables per event category, each keyed by a composite of `entity_id` and `attr_id` that binds a specific event to a specific attribute. The `val_decimal` tables store duration measurements—`289.81`, `3531.53`, `3907.51`, and `3791.90` for hook-attached events; `2084.55`, `3586.50`, `2389.78`, and `1708.37` for basic events; and `5668.45`, `1373.81`, `293.20`, and `2278.72` for syscall events—each associated with the `duration_seconds` attribute (`HOOK-0001`, `EVEN-0001`, or `SYSC-0001` respectively). The `val_datetime` tables capture temporal markers such as `2025-04-15T06:28:34`, `2023-07-01T04:43:47`, `2024-07-23T09:28:11`, and `2024-10-19T19:53:20` for hook-attached events, all referencing the `end_time` attribute (`HOOK-0002`). The `val_int` tables hold exit codes—`245`, `83`, `157`, and `346` for hook-attached events; `615`, `227`, `918`, and `103` for basic events; and `7`, `420`, `186`, and `281` for syscall events—mapped to the `exit_code` attribute. The `val_varchar` tables store free-form strings including `gw-12`, `Log Level 02`, `closeout`, and `running` for hook-attached events; `execution` and `failed` for basic events; and `node-a01`, `closeout`, and `failed` for syscall events, all bound to the `host_name` attribute.

**t_ebpf_event_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | gw-12 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | Log Level 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0006 | execution |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | failed |
| EVEN-0005 | EVEN-0001 | EVEN-0011 | Triggered By 05 |
| EVEN-0006 | EVEN-0002 | EVEN-0004 | edge-03 |
| EVEN-0007 | EVEN-0002 | EVEN-0005 | Log Level 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0006 | review |

**t_ebpf_event_for_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | node-a01 |
| SYSC-0002 | SYSC-0001 | SYSC-0005 | Log Level 02 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | closeout |
| SYSC-0004 | SYSC-0001 | SYSC-0010 | failed |
| SYSC-0005 | SYSC-0001 | SYSC-0011 | Triggered By 05 |
| SYSC-0006 | SYSC-0002 | SYSC-0004 | worker-07 |
| SYSC-0007 | SYSC-0002 | SYSC-0005 | Log Level 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0006 | review |

The entity relationship model ties these value tables back to their source events through the `entity_id` column, which carries the same identifier space as the event table's primary key. A single event can produce multiple attribute values across the four type tables: `HOOK-0001`, for instance, appears as an `entity_id` in `val_decimal` (with value `289.81`), in `val_datetime` (with value `2025-04-15T06:28:34`), in `val_int` (with value `245`), and in `val_varchar` (with value `gw-12`), each row distinguished by its `attr_id` pointing to the appropriate attribute definition. This design permits heterogeneous attribute sets per event while maintaining referential integrity through the shared identifier namespace. The type-disjoint value tables eliminate null columns that would arise from a single wide value table, at the cost of requiring four joins to reconstruct a complete event record. For compliance and audit purposes, this structure ensures that every observed value is traceable to a specific event, a specific attribute definition, and a specific data type, with the identifier serving as the immutable thread connecting all three dimensions.

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