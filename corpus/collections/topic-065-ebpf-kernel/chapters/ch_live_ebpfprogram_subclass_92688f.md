---
chapter_id: ch_live_ebpfprogram_subclass_92688f
topic_id: 65
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_subclass', 'lineage_edge_with_confidence', 'ebpf_event_writes_to_map']
model: engine-refine
---

System observability and provenance tracking rely on a structured taxonomy that classifies runtime operations, assigns categorical labels, and maintains immutable identifiers across distributed execution contexts. At the core of this taxonomy lies a mapping registry that categorizes kernel-level data structures by functional purpose, assigning each a distinct identifier and a descriptive classification. These categorical designations—ranging from broad operational groupings to granular implementation labels—serve as the foundational indexing mechanism for downstream telemetry aggregation. When an eBPF program initializes, it binds to a specific writes to map key, and the system records this binding alongside a human-readable misc designation and a standardized category code, ensuring that every in-kernel data exchange can be traced back to its originating policy or instrumentation rule without ambiguity. The identifier space, populated with sequential designations such as EBPF-0001 through EBPF-0004 and MAP-0001 through MAP-0006, provides a consistent reference frame that bridges low-level kernel telemetry with high-level data governance requirements.

**t_ebpfprogram_subclass**

| id | ebpfprogram |
| --- | --- |
| EBPF-0001 | kprobe_tcp_connect |
| EBPF-0002 | kprobe_tcp_connect |
| EBPF-0003 | kprobe_tcp_connect |
| EBPF-0004 | tracepoint_sched_switch |
| EBPF-0005 | sockops_monitor |
| EBPF-0006 | cgroup_sock_bind |

**t_ebpfprogram_subclass_attaches_to_hook**

| id | attaches_to_hook |
| --- | --- |
| EBPF-0001 | cgroup/sock_create |
| EBPF-0002 | xdp/eth0 |
| EBPF-0003 | netfilter/ingress |
| EBPF-0004 | sk_skb/stream_parser |
| EBPF-0005 | tracepoint/sched/sched_switch |
| EBPF-0006 | cgroup/sock_create |

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

Runtime execution telemetry complements categorical classification by capturing the operational health and performance characteristics of each instrumentation instance. Duration seconds quantify the lifespan of a program invocation, with observed runtimes spanning several thousand seconds to indicate long-lived monitoring daemons or persistent packet-processing pipelines. Exit codes provide deterministic signals regarding program termination states, while retry count metrics track transient failure recovery, revealing the resilience of the underlying execution environment. A single invocation might persist for over five thousand seconds, terminate with a non-zero exit code such as 224 or 381, and trigger hundreds of automatic retry cycles, collectively painting a precise picture of system stability and the frequency of environmental contention or resource exhaustion. These metrics are not merely diagnostic; they form the basis for compliance auditing, capacity planning, and automated policy enforcement across distributed tracing infrastructures.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

Provenance across data pipelines is formalized through lineage edge records that anchor every transformation to a verifiable timestamp, a quantified confidence score, and a standardized measurement unit. These records establish causal relationships between upstream datasets and downstream artifacts, capturing the degree of certainty surrounding each linkage. Confidence designations range from heuristic assessments like partial_match and statistical_overlap calculations to rigorous probabilistic bounds expressed as 95_percent. Each lineage assertion is recordedat to the second, enabling temporal reconciliation across distributed systems, while the associated unit field preserves the physical or logical dimension of the tracked metric—whether thermal readings in deg_C, chemical concentrations in mg/L, dimensionless ratio values, or optical wavelengths in nm. This structured provenance model ensures that data transformations can be independently verified, audited, and traced back to their original ingestion points.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |

The structural relationships between instrumentation policies and kernel attachment points are modeled as directed associations, where each record explicitly defines a subject program, a target hook, and an operational role. This tripartite structure clarifies how specific eBPF programs—such as kprobe_tcp_connect or tracepoint_sched_switch—interact with network stack entry points like cgroup/sock_create, xdp/eth0, netfilter/ingress, or sk_skb/stream_parser. The role attribute distinguishes between supervisory functions, such as reviewer or observer designations, which govern access permissions, audit logging requirements, and change management workflows. By decoupling the program definition from its attachment semantics, the framework supports dynamic reconfiguration of tracing policies without altering the underlying instrumentation logic, thereby reducing operational friction during incident response and security remediation.

**t_ebpfprogram_subclass__attaches_to_hook**

| id | ebpfprogram_id | attaches_to_hook_id | role |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0005 | EBPF-0003 | reviewer |
| EBPF-0002 | EBPF-0006 | EBPF-0006 | reviewer |
| EBPF-0003 | EBPF-0001 | EBPF-0001 | reviewer |
| EBPF-0004 | EBPF-0003 | EBPF-0002 | observer |
| EBPF-0005 | EBPF-0005 | EBPF-0004 | contributor |
| EBPF-0006 | EBPF-0002 | EBPF-0005 | observer |
| EBPF-0007 | EBPF-0005 | EBPF-0003 | owner |
| EBPF-0008 | EBPF-0001 | EBPF-0005 | contributor |

Together, these interconnected registries form a cohesive governance layer that eliminates the traditional boundary between systems programming and data engineering. The identifier space provides a consistent reference frame across all operational domains, while the categorical and descriptive metadata enable policy enforcement and compliance auditing. Execution metrics ensure that runtime behavior remains within acceptable performance boundaries, and lineage assertions guarantee that data transformations can be independently verified. This architecture allows operators to trace a single packet through network ingress, correlate it with a training dataset preparation step such as ml_training_dataset_prep, and validate the confidence of the resulting analytical output using a unified, cryptographically auditable reference model that scales across heterogeneous infrastructure.