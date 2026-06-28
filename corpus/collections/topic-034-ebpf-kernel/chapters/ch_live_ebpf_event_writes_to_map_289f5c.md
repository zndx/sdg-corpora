---
chapter_id: ch_live_ebpf_event_writes_to_map_289f5c
topic_id: 34
family: 02_observation_measurement
cited_terms: ['ebpf_event_writes_to_map', 'bpf_helper_called_by', 'syscall_at_security_tier']
model: engine-refine
---

Operational telemetry within the eBPF subsystem relies on a structured attribute-value model to capture the lifecycle of map write operations, anchored by a unique identifier that serves as the primary key across all dimensional and fact tables. The `writes_to_map` metric quantifies the frequency and outcome of these data structures, with execution durations recorded in `duration_seconds` ranging from approximately 4,285 to 6,511 seconds for tracked instances such as `MAP-0001` and `MAP-0002`. When these operations terminate, the `exit` code—represented by integer values such as 224, 266, 948, and 381—provides a definitive status signal, while the `retry_count` tracks the resilience of the process, with observed attempts varying significantly from 25 to 439 retries. These operational facts are contextualized by the dimension table for map writes, which assigns a human-readable `misc` label and a `category` to each map write, ensuring that raw telemetry can be mapped to specific functional domains.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

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

Security posture is evaluated through the `at_security_tier` framework, which correlates system call activity with predefined security classifications. The system call fact table aggregates `event_count` data against specific `at_security_tier_key` references, capturing volumes of activity that span from 52 events to 382 events across different tiered environments. This quantitative data is paired with the dimension table for security tiers, which provides the descriptive `misc` labels and `category` designations necessary to interpret the severity and scope of the observed events. By linking the raw event counts to these tiered categories, the system enables granular auditing of how different security levels process and contain system-level interactions, ensuring that high-volume event streams are properly classified.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

The metadata governing these operations is defined through the `attr` and `attr_type` columns, which establish a strict schema for the properties associated with BPF helper calls. Attributes such as `checksum`, `created_date`, `identifier`, and `license` are bound to specific data types, including `xsd:string`, `xsd:date`, and `cco:DesignativeICE`, ensuring type safety across the telemetry pipeline. These attributes are instantiated against a specific `entity`—identified by the `entity_id`—allowing the system to store heterogeneous values in a normalized manner. For instance, an entity linked to call `CALL-0001` might possess a `misc` value of `1a4b6c2d` stored as a varchar, an integer value of 67, or a date value of `2024-07-02`, all retrievable through their respective type-specific value tables while maintaining a unified logical view.

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | envoy |
| CALL-0002 | xdp_router | kubelet |
| CALL-0003 | lsm:inode_create | falco |
| CALL-0004 | tracepoint:sched_process_exit | kubelet |
| CALL-0005 | raw_tracepoint:sys_enter | kubelet |
| CALL-0006 | cgroup_skb_ingress | istiod |

**t_bpf_helper_called_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CALL-0001 | checksum | xsd:string |
| CALL-0002 | created_date | xsd:date |
| CALL-0003 | identifier | cco:DesignativeICE |
| CALL-0004 | license | xsd:string |
| CALL-0005 | mime_type | xsd:string |
| CALL-0006 | size_bytes | xsd:long |
| CALL-0007 | uri | xsd:string |
| CALL-0008 | version | xsd:integer |

**t_bpf_helper_called_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0002 | 2024-07-02 |
| CALL-0002 | CALL-0002 | CALL-0002 | 2025-01-26 |
| CALL-0003 | CALL-0003 | CALL-0002 | 2024-10-16 |
| CALL-0004 | CALL-0004 | CALL-0002 | 2023-11-11 |
| CALL-0005 | CALL-0005 | CALL-0002 | 2024-05-09 |
| CALL-0006 | CALL-0006 | CALL-0002 | 2025-02-22 |

**t_bpf_helper_called_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0006 | 67 |
| CALL-0002 | CALL-0001 | CALL-0008 | 11 |
| CALL-0003 | CALL-0002 | CALL-0006 | 259 |
| CALL-0004 | CALL-0002 | CALL-0008 | 9 |
| CALL-0005 | CALL-0003 | CALL-0006 | 333 |
| CALL-0006 | CALL-0003 | CALL-0008 | 11 |
| CALL-0007 | CALL-0004 | CALL-0006 | 103 |
| CALL-0008 | CALL-0004 | CALL-0008 | 4 |

**t_bpf_helper_called_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0001 | 1a4b6c2d |
| CALL-0002 | CALL-0001 | CALL-0003 | ARN:res/41 |
| CALL-0003 | CALL-0001 | CALL-0004 | proprietary |
| CALL-0004 | CALL-0001 | CALL-0009 | zone-b |
| CALL-0005 | CALL-0001 | CALL-0005 | application/octet-stream |
| CALL-0006 | CALL-0001 | CALL-0010 | Name 06 |
| CALL-0007 | CALL-0001 | CALL-0011 | data-engineering |
| CALL-0008 | CALL-0001 | CALL-0012 | Tags 08 |

This relational architecture ensures that every BPF helper invocation, whether initiated by a program like `envoy` or `kubelet`, is fully traceable from its high-level security tier down to its atomic attribute values. The `identifier` acts as the immutable thread connecting the helper call to its dimensional metadata, while the `misc` and `category` columns provide the necessary semantic context for compliance reporting. By separating the structural definitions of attributes from their runtime values, the framework supports dynamic schema evolution without compromising the integrity of historical `duration_seconds` or `event_count` records, thereby providing a robust foundation for continuous security monitoring and operational analysis.

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |