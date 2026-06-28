---
chapter_id: ch_live_ebpf_event_observed_pid_70fbb5
topic_id: 80
family: 02_observation_measurement
cited_terms: ['ebpf_event_observed_pid', 'division_assignment_record', 'kernel_event_with_tid']
model: engine-refine
---

Operational observability and governance frameworks rely on a rigorous identification architecture to anchor discrete events, trace relationships, and enforce accountability across distributed systems. Each recorded instance receives a unique identifier that serves as the immutable anchor for downstream correlation, whether tracking an eBPF probe such as `syscall_trace` or a kernel-level event originating from `ZFS on Linux` or `Darwin 22.4.0`. These identifiers are not isolated; they form directed observation graphs where a subject entity assumes a specific role relative to a target entity. In practice, an eBPF process identified as `PID-0002` may act as a contributor to a target process `PID-0006`, while another instance assumes the role of reviewer over a different target. This subject-to-target mapping, mediated by explicit role designations, ensures that every observation carries provenance, enabling auditors to reconstruct not merely what was captured, but which component initiated the capture and under what operational capacity.

**t_ebpf_event_observed_pid**

| id | ebpf |
| --- | --- |
| PID-0001 | syscall_trace |
| PID-0002 | disk_io_tracker |
| PID-0003 | tcp_connect_probe |
| PID-0004 | disk_io_tracker |
| PID-0005 | cpu_profile_sampler |
| PID-0006 | disk_io_tracker |

**t_ebpf_event_observed_pid_observes_pid**

| id | observes_pid |
| --- | --- |
| PID-0001 | 11024 |
| PID-0002 | 11024 |
| PID-0003 | 7743 |
| PID-0004 | 11024 |
| PID-0005 | 8891 |
| PID-0006 | 11024 |

**t_ebpf_event_observed_pid__observes_pid**

| id | ebpf_id | observes_pid_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0006 | contributor |
| PID-0002 | PID-0004 | PID-0004 | observer |
| PID-0003 | PID-0003 | PID-0002 | owner |
| PID-0004 | PID-0002 | PID-0002 | reviewer |
| PID-0005 | PID-0005 | PID-0004 | contributor |
| PID-0006 | PID-0005 | PID-0001 | contributor |
| PID-0007 | PID-0006 | PID-0005 | owner |
| PID-0008 | PID-0006 | PID-0002 | contributor |

**t_kernel_event_with_tid**

| id | kernel | with_thread_id |
| --- | --- | --- |
| TID-0001 | ZFS on Linux | PID-0003 |
| TID-0002 | Darwin 22.4.0 | PID-0006 |
| TID-0003 | FreeBSD 13.2 | PID-0001 |
| TID-0004 | Linux 5.15.0 | PID-0002 |
| TID-0005 | ZFS on Linux | PID-0003 |
| TID-0006 | Red Hat 4.18 | PID-0006 |

**t_kernel_event_with_tid_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0003 | 883 |
| TID-0002 | TID-0001 | TID-0007 | 384 |
| TID-0003 | TID-0002 | TID-0003 | 644 |
| TID-0004 | TID-0002 | TID-0007 | 289 |
| TID-0005 | TID-0003 | TID-0003 | 158 |
| TID-0006 | TID-0003 | TID-0007 | 165 |
| TID-0007 | TID-0004 | TID-0003 | 803 |
| TID-0008 | TID-0004 | TID-0007 | 36 |

Once an event is anchored, its descriptive properties must be captured with strict type fidelity to support both real-time telemetry and long-term compliance reporting. Each attr is paired with an attr type that establishes the semantic contract for the observable property, dictating how values are persisted, validated, and queried across specialized storage partitions. Temporal markers like `2025-02-14T18:33:06` are routed to datetime-optimized repositories, while numeric measurements such as `5060.73` or `6983.04` populate decimal stores, and categorical descriptors like `gw-12` or `running` reside in varchar repositories. By segregating misc values according to their declared attr type, the architecture prevents type coercion errors, enforces schema-level constraints at ingestion, and guarantees that downstream analytics operate on consistently typed evidence.

**t_kernel_event_with_tid_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TID-0001 | duration_seconds | xsd:decimal |
| TID-0002 | end_time | xsd:dateTime |
| TID-0003 | exit_code | xsd:integer |
| TID-0004 | host_name | xsd:string |
| TID-0005 | log_level | xsd:string |
| TID-0006 | phase | xsd:string |
| TID-0007 | retry_count | xsd:integer |
| TID-0008 | scheduled_at | xsd:dateTime |

**t_kernel_event_with_tid_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0002 | 2025-02-14T18:33:06 |
| TID-0002 | TID-0001 | TID-0008 | 2024-07-20T10:27:40 |
| TID-0003 | TID-0001 | TID-0009 | 2024-06-11T20:07:21 |
| TID-0004 | TID-0002 | TID-0002 | 2025-04-06T19:50:52 |
| TID-0005 | TID-0002 | TID-0008 | 2025-02-15T21:22:11 |
| TID-0006 | TID-0002 | TID-0009 | 2024-07-12T03:26:24 |
| TID-0007 | TID-0003 | TID-0002 | 2024-05-24T01:52:05 |
| TID-0008 | TID-0003 | TID-0008 | 2023-12-06T07:40:08 |

**t_kernel_event_with_tid_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0001 | 5060.73 |
| TID-0002 | TID-0002 | TID-0001 | 6983.04 |
| TID-0003 | TID-0003 | TID-0001 | 363.99 |
| TID-0004 | TID-0004 | TID-0001 | 6644.72 |
| TID-0005 | TID-0005 | TID-0001 | 5301.35 |
| TID-0006 | TID-0006 | TID-0001 | 4668.07 |

**t_kernel_event_with_tid_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0004 | gw-12 |
| TID-0002 | TID-0001 | TID-0005 | Log Level 02 |
| TID-0003 | TID-0001 | TID-0006 | review |
| TID-0004 | TID-0001 | TID-0010 | running |
| TID-0005 | TID-0001 | TID-0011 | Triggered By 05 |
| TID-0006 | TID-0002 | TID-0004 | node-b14 |
| TID-0007 | TID-0002 | TID-0005 | Log Level 07 |
| TID-0008 | TID-0002 | TID-0006 | execution |

Beyond raw telemetry, governance requires a classification layer that maps observed entities to organizational or operational categories. The assignment framework resolves this by linking each record to an assigns athlete designation and an assigns division classification, each carrying a human-readable label and a formal category taxonomy. An entity classified under `Assigns Athlete Category 01` might carry the operational label `Assigns Athlete Label 01`, while its corresponding division reference aligns with `Assigns Division Category 02` and `Assigns Division Label 02`. This dual-axis categorization ensures that every tracked event or recommendation inherits both a functional role and a structural placement within the operational hierarchy. The category field provides the coarse-grained grouping necessary for policy enforcement, while the label field supplies the contextual granularity required for day-to-day operational routing and stakeholder communication.

**fact_division**

| id | assigns_athlete_key | assigns_division_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0007 | 0.517 | 96.89 | 330.50 |
| RECO-0002 | RECO-0004 | RECO-0003 | 0.806 | 738.86 | 254.97 |
| RECO-0003 | RECO-0001 | RECO-0001 | 0.257 | 500.56 | 407.11 |
| RECO-0004 | RECO-0007 | RECO-0001 | 0.083 | 740.08 | 404.52 |
| RECO-0005 | RECO-0006 | RECO-0007 | 0.281 | 881.15 | 8.05 |
| RECO-0006 | RECO-0007 | RECO-0004 | 0.538 | 6.12 | 177.48 |
| RECO-0007 | RECO-0003 | RECO-0005 | 0.833 | 343.27 | 857.73 |

**dim_assigns_athlete**

| id | assigns_athlete_label | assigns_athlete_category |
| --- | --- | --- |
| RECO-0001 | Assigns Athlete Label 01 | Assigns Athlete Category 01 |
| RECO-0002 | Assigns Athlete Label 02 | Assigns Athlete Category 02 |
| RECO-0003 | Assigns Athlete Label 03 | Assigns Athlete Category 03 |
| RECO-0004 | Assigns Athlete Label 04 | Assigns Athlete Category 04 |
| RECO-0005 | Assigns Athlete Label 05 | Assigns Athlete Category 05 |
| RECO-0006 | Assigns Athlete Label 06 | Assigns Athlete Category 06 |
| RECO-0007 | Assigns Athlete Label 07 | Assigns Athlete Category 07 |

**dim_assigns_division**

| id | assigns_division_label | assigns_division_category |
| --- | --- | --- |
| RECO-0001 | Assigns Division Label 01 | Assigns Division Category 01 |
| RECO-0002 | Assigns Division Label 02 | Assigns Division Category 02 |
| RECO-0003 | Assigns Division Label 03 | Assigns Division Category 03 |
| RECO-0004 | Assigns Division Label 04 | Assigns Division Category 04 |
| RECO-0005 | Assigns Division Label 05 | Assigns Division Category 05 |
| RECO-0006 | Assigns Division Label 06 | Assigns Division Category 06 |
| RECO-0007 | Assigns Division Label 07 | Assigns Division Category 07 |

The reliability of any assignment or classification must be explicitly quantified to support risk-aware decision-making and audit readiness. The governance model captures this through paired confidence metrics that accompany every assignment record, establishing threshold-driven controls for automated enforcement. A recommendation carrying a confidence score of `0.806` signals a high-fidelity classification suitable for immediate policy application, whereas a record with confidence at `0.083` triggers manual review workflows or conditional restrictions. Intermediate states, such as a confidence of `0.517` paired with uncertainty of `96.89`, establish a gray zone where operational controls are applied with reduced authority pending verification. By formalizing these probabilistic bounds, the framework transforms subjective classification into auditable governance, ensuring that automated systems act only within verified confidence intervals while preserving human oversight for ambiguous assignments.