---
chapter_id: ch_live_ebpf_event_writes_to_map_a96000
topic_id: 23
family: 02_observation_measurement
cited_terms: ['ebpf_event_writes_to_map', 'ebpf_program_governed_by_directive', 'ebpfevent_at_kernel_hook_xref']
model: engine-refine
---

The governance of eBPF programs within kernel execution environments depends upon a structured attribute-value architecture that decouples metadata definitions from their concrete instantiations. Each directive governing program behavior—whether enforcing traffic classification on ingress paths, regulating process execution tracing, or controlling socket-level masquerading—is characterized by a set of typed attributes whose schemas are declared independently of their runtime values. The attribute type registry distinguishes between temporal constraints expressed as ISO 8601 dates such as 2024-06-04 and 2025-03-23, boolean enforcement flags, integer priority levels ranging from 3 to 996, and free-form strings including audit excerpts and encoding designations. This separation of attribute definition from value assignment permits heterogeneous policy enforcement mechanisms to share a common metadata vocabulary while preserving type safety across the governance layer.

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | masquerade |
| DIRE-0002 | tc_ingress |
| DIRE-0003 | tracepoint_sched |
| DIRE-0004 | sched_process_exec |
| DIRE-0005 | kprobe_do_fork |
| DIRE-0006 | tracepoint_sched |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

The dimension of map write operations constitutes a parallel taxonomy, wherein each identifier such as MAP-0001 through MAP-0004 anchors a descriptive label and a categorical classification that together encode the semantic purpose of the map write within the eBPF program lifecycle. These categorical assignments—Writes To Map Category 01 through 04—serve as the primary axis for policy aggregation, enabling compliance queries to target entire classes of map operations rather than individual instances. The label taxonomy, ranging from Writes To Map Label 01 to Writes To Map Label 04, provides a human-readable indexing layer that bridges the gap between machine-enforced constraints and operator-facing audit documentation.

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Runtime telemetry for map write operations is captured through a fact structure that records three critical performance dimensions: the elapsed duration in seconds, which spans from 4285.04 to 6511.30 across observed executions; the exit code, a non-trivial integer ranging from 224 to 948 that encodes the termination state of the map write operation; and the retry count, which varies from 25 to 439 and signals the frequency of transient failures requiring recovery. These metrics are indexed by the map write identifier and cross-referenced against the map write key, which itself may differ from the primary identifier—MAP-0006 appearing as a write target where MAP-0001 serves as the record key, for instance—thereby capturing the many-to-one relationships inherent in map write semantics.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

The kernel hook cross-reference layer extends this attribute-value paradigm to event-level telemetry, where each xref entity such as XREF-0001 through XREF-0004 represents a specific binding between an eBPF event—kretprobe_sys_openat, tracepoint_sched_switch, lxc_attach—and its attachment point within the kernel event subsystem. The attribute definitions for these cross-references include decimal-valued durations ranging from 1550.57 to 6431.54 seconds, datetime stamps spanning from 2023-05-01T02:25:15 through 2025-02-12T09:55:43, integer exit codes and host-level counters, and string-valued metadata including host identifiers such as node-b14, log level designations, and execution state descriptors. The entity column in each value table explicitly references the cross-reference identifier, ensuring that attribute-value pairs are unambiguously bound to their governing event-hook association.

**t_ebpfevent_at_kernel_hook_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | kretprobe_sys_openat |
| XREF-0002 | tracepoint_sched_switch |
| XREF-0003 | tracepoint_sched_switch |
| XREF-0004 | lxc_attach |
| XREF-0005 | nodeport |
| XREF-0006 | kretprobe_sys_openat |
| XREF-0007 | kretprobe_sys_openat |

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

The structural discipline of this architecture—where identifiers serve as the immutable anchor points across fact tables, dimension tables, and the multi-table attribute-value decomposition—enables compliance queries to traverse from high-level policy directives through their governing attributes and typed values down to the concrete runtime metrics of individual map write operations and kernel hook events. The attr column consistently references the attribute definition identifier, the entity column anchors values to their governing directive or cross-reference record, and the misc column accommodates the heterogeneous value types that the attr_type declaration anticipates. This design ensures that the governance framework remains extensible: new attribute types can be introduced by adding entries to the attribute definition tables and their corresponding value tables without modifying the underlying fact or dimension structures that depend upon them.

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |