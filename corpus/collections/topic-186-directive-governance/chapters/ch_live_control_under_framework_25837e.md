---
chapter_id: ch_live_control_under_framework_25837e
topic_id: 186
family: 03_directive_governance
cited_terms: ['control_under_framework', 'belief_interval_exactly_two_bounds', 'ebpfmap_subclass']
model: engine-refine
---

In a governance framework that tracks controls against boundaries, every artifact is anchored by a unique identifier—`FRAM-0001` through `FRAM-0004` for controls such as "Network firewall," "Threat detection," "Session timeout," and "Configuration baseline"—and each control is mapped to one or more governing boundaries like `BOUN-0005` or `BOUN-0002`. The boundaries themselves represent conceptual constructs: "battery charge decay," "turbine vibration threshold," "blood glucose trend," and "reactor core temperature estimate." This identifier-driven architecture ensures that every control, boundary, and attribute can be referenced unambiguously across the system, forming the backbone of traceability and auditability.

**t_control_under_framework**

| id | control | under_framework |
| --- | --- | --- |
| FRAM-0001 | Network firewall | BOUN-0005 |
| FRAM-0002 | Threat detection | BOUN-0005 |
| FRAM-0003 | Session timeout | BOUN-0002 |
| FRAM-0004 | Configuration baseline | BOUN-0005 |
| FRAM-0005 | Vulnerability scan | BOUN-0003 |
| FRAM-0006 | Access review | BOUN-0004 |

**t_control_under_framework_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FRAM-0001 | effective_date | xsd:date |
| FRAM-0002 | enforcement | xsd:string |
| FRAM-0003 | mandatory | xsd:boolean |
| FRAM-0004 | priority | xsd:integer |
| FRAM-0005 | review_cycle_days | xsd:integer |
| FRAM-0006 | scope | xsd:string |
| FRAM-0007 | encoding | xsd:string |
| FRAM-0008 | label_text | xsd:string |

**t_control_under_framework_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0003 | true |
| FRAM-0002 | FRAM-0002 | FRAM-0003 | true |
| FRAM-0003 | FRAM-0003 | FRAM-0003 | true |
| FRAM-0004 | FRAM-0004 | FRAM-0003 | false |
| FRAM-0005 | FRAM-0005 | FRAM-0003 | false |
| FRAM-0006 | FRAM-0006 | FRAM-0003 | false |

**t_control_under_framework_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0001 | 2024-07-12 |
| FRAM-0002 | FRAM-0002 | FRAM-0001 | 2023-06-25 |
| FRAM-0003 | FRAM-0003 | FRAM-0001 | 2024-04-08 |
| FRAM-0004 | FRAM-0004 | FRAM-0001 | 2023-08-28 |
| FRAM-0005 | FRAM-0005 | FRAM-0001 | 2025-04-10 |
| FRAM-0006 | FRAM-0006 | FRAM-0001 | 2024-04-05 |

**t_control_under_framework_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0004 | 3 |
| FRAM-0002 | FRAM-0001 | FRAM-0005 | 104 |
| FRAM-0003 | FRAM-0002 | FRAM-0004 | 1 |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | 994 |
| FRAM-0005 | FRAM-0003 | FRAM-0004 | 5 |
| FRAM-0006 | FRAM-0003 | FRAM-0005 | 358 |
| FRAM-0007 | FRAM-0004 | FRAM-0004 | 3 |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | 95 |

**t_control_under_framework_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0007 | Encoding 01 |
| FRAM-0002 | FRAM-0001 | FRAM-0002 | Enforcement 02 |
| FRAM-0003 | FRAM-0001 | FRAM-0008 | pre-release note |
| FRAM-0004 | FRAM-0001 | FRAM-0009 | ja |
| FRAM-0005 | FRAM-0001 | FRAM-0006 | Scope 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0007 | Encoding 06 |
| FRAM-0007 | FRAM-0002 | FRAM-0002 | Enforcement 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0008 | calibration record |

**t_ebpfmap_subclass**

| id | ebpfmap | map_type | checksum | uri |
| --- | --- | --- | --- | --- |
| EBPF-0001 | sock_ops_map | lpm_trie | 9d2b7a16 | abfss://prod/silver |
| EBPF-0002 | xdp_stats_map | devmap | 1a4b6c2d | abfss://prod/silver |
| EBPF-0003 | conntrack_hash | perf_event_array | a3f9c21e | s3://lake/raw |
| EBPF-0004 | conntrack_hash | hash_map | 7b14de08 | gs://warehouse/gold |
| EBPF-0005 | perf_event_map | stack_trace | 9d2b7a16 | hdfs://cluster/staging |
| EBPF-0006 | stack_trace_map | ringbuf | 1a4b6c2d | hdfs://cluster/staging |
| EBPF-0007 | dev_map_eth | hash_map | 5e8f3c91 | hdfs://cluster/staging |
| EBPF-0008 | xdp_stats_map | stack_trace | c0ffee42 | abfss://prod/silver |

Attributes provide the dimensional detail that transforms a bare control definition into an actionable, measurable entity. Each attribute carries a name—`effective_date`, `enforcement`, `mandatory`, `priority`—and a declared type (`xsd:date`, `xsd:string`, `xsd:boolean`, `xsd:integer`) that governs how its values are stored and validated. Because different data types require different storage strategies, the system distributes attribute values across specialized tables: boolean values such as `true` and `false` populate the value table for the `mandatory` attribute, date values like `2024-07-12` and `2023-06-25` reside in the date-specific store, integers such as `3`, `104`, `1`, and `994` are held in the integer table, and free-form strings including "Encoding 01," "Enforcement 02," "pre-release note," and "ja" occupy the varchar table. The `entity_id` column in each value table ties the stored value back to the control or boundary it describes, while `attr_id` references the attribute definition, creating a clean separation between schema and data.

The relationship between beliefs and their lower bounds introduces a subject-target-role triad that captures not just what is being measured but who is accountable for each component. In the belief-boundary linkage table, the `subject` column references a belief entity (e.g., `BOUN-0006` or `BOUN-0003`), the `target` column points to a lower-bound entity (e.g., `BOUN-0004` or `BOUN-0002`), and the `role` column assigns a functional designation—`observer`, `reviewer`, or `contributor`—to the relationship. This triad allows the framework to express nuanced governance relationships: a contributor might define the bound, a reviewer might validate it, and an observer might monitor compliance against it, all without conflating the conceptual entities with the people or systems that interact with them.

**t_belief_interval_exactly_two_bounds**

| id | belief |
| --- | --- |
| BOUN-0001 | battery charge decay |
| BOUN-0002 | turbine vibration threshold |
| BOUN-0003 | blood glucose trend |
| BOUN-0004 | reactor core temperature estimate |
| BOUN-0005 | filter clog probability |
| BOUN-0006 | turbine vibration threshold |

**t_belief_interval_exactly_two_bounds_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| BOUN-0001 | 78.9 pct |
| BOUN-0002 | 22.4 dBm |
| BOUN-0003 | 0.001 |
| BOUN-0004 | 15.0 kPa |
| BOUN-0005 | 78.9 pct |
| BOUN-0006 | 78.9 pct |

**t_belief_interval_exactly_two_bounds__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0006 | BOUN-0004 | observer |
| BOUN-0002 | BOUN-0003 | BOUN-0001 | reviewer |
| BOUN-0003 | BOUN-0002 | BOUN-0004 | reviewer |
| BOUN-0004 | BOUN-0001 | BOUN-0002 | contributor |
| BOUN-0005 | BOUN-0001 | BOUN-0001 | reviewer |
| BOUN-0006 | BOUN-0003 | BOUN-0004 | observer |
| BOUN-0007 | BOUN-0001 | BOUN-0004 | reviewer |
| BOUN-0008 | BOUN-0005 | BOUN-0002 | observer |

For infrastructure artifacts such as eBPF maps, integrity and provenance are captured through checksums and URIs. The map `sock_ops_map` of type `lpm_trie` carries the checksum `9d2b7a16` and is located at `abfss://prod/silver`, while `xdp_stats_map` (type `devmap`) bears checksum `1a4b6c2d` at the same URI; `conntrack_hash` appears twice with distinct checksums (`a3f9c21e` and `7b14de08`) and different URIs (`s3://lake/raw` and `gs://warehouse/gold`), illustrating how the same logical map name can exist in multiple storage locations with different versions or configurations. The checksum serves as a content-addressable fingerprint that enables rapid integrity verification, while the URI provides the resource locator, together ensuring that every deployed artifact can be both found and validated.