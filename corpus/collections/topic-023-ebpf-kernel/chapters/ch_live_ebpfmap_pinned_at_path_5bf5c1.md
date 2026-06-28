---
chapter_id: ch_live_ebpfmap_pinned_at_path_5bf5c1
topic_id: 23
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_pinned_at_path', 'process_min_one_output', 'evidence_at_quality_tier']
model: engine-refine
---

Identifiers serve as the ontological anchors of any governed data fabric, providing immutable keys that bind operational artifacts to their authoritative records. Whether tracking a pinned eBPF map at `/run/bpf/sockops`, a feature extraction pipeline output, or a quality-tiered evidence collection, each object receives a unique designation—PATH-0001, OUTP-0001, TIER-0001—that functions as the primary reference point for lineage, audit, and cross-system reconciliation. These identifiers are not merely cataloguing labels; they establish a deterministic chain of custody, ensuring that every downstream transformation, compliance check, or telemetry ingestion can be traced back to a single, verifiable source. By decoupling the conceptual entity from its physical representation, the framework guarantees that operational state remains queryable and auditable regardless of infrastructure topology or deployment environment.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | sock_hash | /run/bpf/sockops | sre | pii |
| PATH-0002 | cpumap | /sys/fs/bpf/cilium_flow | data-engineering | pii |
| PATH-0003 | conntrack_map | /sys/fs/bpf/bpftool_prog | data-engineering | internal |
| PATH-0004 | flow_table | /sys/fs/bpf/netfilter_flow | sre | verified |
| PATH-0005 | sock_hash | /sys/fs/bpf/cilium_sock | sre | internal |
| PATH-0006 | lru_percpu_hash | /sys/fs/bpf/xdp_ingress | platform-team | verified |

**t_process_min_one_output**

| id | process | output |
| --- | --- | --- |
| OUTP-0001 | feature extraction pipeline | TIER-0002 |
| OUTP-0002 | pipeline rollback procedure | TIER-0008 |
| OUTP-0003 | feature extraction pipeline | TIER-0006 |
| OUTP-0004 | model training run | TIER-0008 |
| OUTP-0005 | data validation cycle | TIER-0002 |
| OUTP-0006 | model training run | TIER-0002 |
| OUTP-0007 | anomaly detection sweep | TIER-0008 |

**t_process_min_one_output_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0003 | 695 |
| OUTP-0002 | OUTP-0001 | OUTP-0007 | 449 |
| OUTP-0003 | OUTP-0002 | OUTP-0003 | 903 |
| OUTP-0004 | OUTP-0002 | OUTP-0007 | 474 |
| OUTP-0005 | OUTP-0003 | OUTP-0003 | 215 |
| OUTP-0006 | OUTP-0003 | OUTP-0007 | 204 |
| OUTP-0007 | OUTP-0004 | OUTP-0003 | 967 |
| OUTP-0008 | OUTP-0004 | OUTP-0007 | 241 |

**t_process_min_one_output_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0004 | ingest-21 |
| OUTP-0002 | OUTP-0001 | OUTP-0005 | Log Level 02 |
| OUTP-0003 | OUTP-0001 | OUTP-0006 | closeout |
| OUTP-0004 | OUTP-0001 | OUTP-0010 | complete |
| OUTP-0005 | OUTP-0001 | OUTP-0011 | Triggered By 05 |
| OUTP-0006 | OUTP-0002 | OUTP-0004 | worker-07 |
| OUTP-0007 | OUTP-0002 | OUTP-0005 | Log Level 07 |
| OUTP-0008 | OUTP-0002 | OUTP-0006 | closeout |

**t_evidence_at_quality_tier**

| id | evidence | at_quality_tier |
| --- | --- | --- |
| TIER-0001 | network packets | OUTP-0003 |
| TIER-0002 | audit trails | OUTP-0002 |
| TIER-0003 | network packets | OUTP-0004 |
| TIER-0004 | inspection photos | OUTP-0001 |
| TIER-0005 | telemetry streams | OUTP-0007 |
| TIER-0006 | field measurements | OUTP-0002 |
| TIER-0007 | device firmware | OUTP-0001 |
| TIER-0008 | audit trails | OUTP-0004 |

**t_evidence_at_quality_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_evidence_at_quality_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2024-11-19T18:15:43 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2023-02-10T23:54:33 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-06-07T05:45:43 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2024-08-05T11:37:21 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2025-03-30T21:54:34 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-10-26T18:53:01 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2023-09-26T03:30:22 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-04-10T10:08:00 |

**t_evidence_at_quality_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.731 |
| TIER-0002 | TIER-0001 | TIER-0005 | 574.79 |
| TIER-0003 | TIER-0001 | TIER-0007 | 563.53 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.358 |
| TIER-0005 | TIER-0002 | TIER-0005 | 139.04 |
| TIER-0006 | TIER-0002 | TIER-0007 | 944.94 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.228 |
| TIER-0008 | TIER-0003 | TIER-0005 | 33.93 |

**t_evidence_at_quality_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | ja |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

Attributes and their corresponding attribute types enforce the schema discipline required for regulatory compliance and data quality assurance. An attribute defines a measurable or descriptive property of an entity, while the attribute type dictates the lexical and semantic constraints under which that property must be recorded. For instance, execution duration is governed by `xsd:decimal`, capturing precise values such as 1575.12 or 3915.42, whereas temporal markers like `end_time` are bound to `xsd:dateTime`, standardizing timestamps to ISO 8601 formats such as 2023-04-19T05:25:34. Exit codes and performance counters adhere to `xsd:integer`, preserving discrete values like 695 or 449 without floating-point ambiguity, and host identifiers or categorical states utilize `xsd:string` to accommodate alphanumeric sequences like `ingest-21` or `closeout`. This strict type segregation prevents schema drift, eliminates runtime coercion errors, and aligns stored telemetry with internationally recognized data exchange standards.

**t_process_min_one_output_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OUTP-0001 | duration_seconds | xsd:decimal |
| OUTP-0002 | end_time | xsd:dateTime |
| OUTP-0003 | exit_code | xsd:integer |
| OUTP-0004 | host_name | xsd:string |
| OUTP-0005 | log_level | xsd:string |
| OUTP-0006 | phase | xsd:string |
| OUTP-0007 | retry_count | xsd:integer |
| OUTP-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_output_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0002 | 2023-04-19T05:25:34 |
| OUTP-0002 | OUTP-0001 | OUTP-0008 | 2023-03-27T21:29:05 |
| OUTP-0003 | OUTP-0001 | OUTP-0009 | 2025-05-24T00:18:25 |
| OUTP-0004 | OUTP-0002 | OUTP-0002 | 2024-01-13T03:16:51 |
| OUTP-0005 | OUTP-0002 | OUTP-0008 | 2024-09-26T20:27:11 |
| OUTP-0006 | OUTP-0002 | OUTP-0009 | 2023-06-30T01:21:38 |
| OUTP-0007 | OUTP-0003 | OUTP-0002 | 2024-04-05T13:10:28 |
| OUTP-0008 | OUTP-0003 | OUTP-0008 | 2023-07-31T01:33:46 |

**t_process_min_one_output_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0001 | 1575.12 |
| OUTP-0002 | OUTP-0002 | OUTP-0001 | 3915.42 |
| OUTP-0003 | OUTP-0003 | OUTP-0001 | 6819.95 |
| OUTP-0004 | OUTP-0004 | OUTP-0001 | 6826.25 |
| OUTP-0005 | OUTP-0005 | OUTP-0001 | 4127.39 |
| OUTP-0006 | OUTP-0006 | OUTP-0001 | 1299.93 |
| OUTP-0007 | OUTP-0007 | OUTP-0001 | 6249.12 |

The misc category functions as the type-safe repository for actual attribute values, deliberately normalized into dedicated storage domains to preserve validation integrity and query performance. Rather than conflating heterogeneous data types within a single column, the architecture isolates decimal measurements, datetime stamps, integer counters, and variable-length strings into distinct value tables, each linked to its parent entity and attribute through foreign keys. This design enables deterministic reconstruction of the complete attribute-value pair at query time while maintaining strict data typing at rest. Confidence scores such as 0.731 or 0.358 remain mathematically precise, archival timestamps like 2024-11-19T18:15:43 retain timezone-agnostic clarity, and categorical descriptors including `complete` or `change rationale` are stored without numeric conversion overhead. The result is a high-fidelity telemetry layer that satisfies both real-time monitoring requirements and long-term forensic analysis.

Ownership and tagging mechanisms operationalize accountability and classification within the metadata registry. The owner field assigns explicit stewardship responsibility to functional groups—sre or data-engineering—ensuring that every pinned resource, pipeline output, or evidence tier has a designated custodian responsible for lifecycle management, access provisioning, and incident response. Complementing this, tags provide a flexible, multi-valued classification layer that encodes compliance posture and circulation constraints. Labels such as `pii` trigger mandatory encryption and access-control enforcement, `internal` restricts distribution to authorized personnel, and `verified` signals that a record has successfully passed audit validation cycles. Together, these fields form a lightweight but rigorous governance matrix that satisfies regulatory mandates for data stewardship, role-based access control, and lifecycle tracking without introducing structural bloat.

The interplay of identifiers, typed attributes, value segregation, and ownership tags constitutes a self-describing, auditable metadata fabric capable of supporting both operational telemetry and regulatory reporting. By enforcing schema discipline at the attribute level, isolating heterogeneous values by type, and binding every record to a responsible owner and compliance tag, the framework eliminates ambiguity in data lineage and ensures that every operational artifact can be reconstructed, validated, and audited with deterministic precision. This architecture does not merely catalog system state; it institutionalizes data governance, transforming raw telemetry into a compliant, queryable, and legally defensible record of operational reality.