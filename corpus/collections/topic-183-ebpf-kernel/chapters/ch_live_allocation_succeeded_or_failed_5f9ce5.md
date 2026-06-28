---
chapter_id: ch_live_allocation_succeeded_or_failed_5f9ce5
topic_id: 183
family: 05_provo_lineage
cited_terms: ['allocation_succeeded_or_failed', 'kernel_event_with_comm', 'artifact_with_role']
model: engine-refine
---

Allocation tracking within the system relies on unique identifiers to establish a single source of truth across all operational events. Each allocation event receives a distinct identifier—such as `FAIL-0001` or `FAIL-0002`—that persists through its lifecycle and enables cross-referencing with downstream execution records. These identifiers anchor the allocation registry, which captures the specific resources being managed, including named allocations like `event-trace-log`, `replication-stream`, and `burst-window-epsilon`, alongside secondary and tertiary allocation dimensions such as `governance-tag-set`, `tenant-quota-gold`, and `processing-shard-kappa`. The status field records the current state of each allocation, cycling through values like `failed`, `running`, and `complete`, while the triggered_by column documents the origin of the allocation request, distinguishing between `manual` initiation, `schedule`-driven automation, and `api`-mediated invocations. This triad of identifier, status, and trigger provenance provides operators with immediate visibility into allocation health and the chain of custody for resource provisioning decisions.

**t_allocation_succeeded_or_failed**

| id | allocation | allocation_2 | allocation_3 | status | triggered_by |
| --- | --- | --- | --- | --- | --- |
| FAIL-0001 | event-trace-log | governance-tag-set | processing-shard-kappa | failed | manual |
| FAIL-0002 | replication-stream | burst-window-epsilon | telemetry-buffer | running | schedule |
| FAIL-0003 | burst-window-epsilon | tenant-quota-gold | burst-window-epsilon | complete | manual |
| FAIL-0004 | event-trace-log | audit-retention-vault | quality-rule-std | failed | api |
| FAIL-0005 | compute-pool-alpha | metric-rollup-daily | event-trace-log | running | api |

Kernel execution records form the operational core of the system, capturing granular performance and reliability metrics for each process communication event. The fact_kernel table links to process communication entities through a foreign key relationship, where each kernel record carries a with_process_comm_key that references the corresponding dimension entry. Execution duration is measured in seconds with sub-second precision, yielding values such as `5315.83` for one kernel run and `3561.41` for another, reflecting the variable computational load across different process types. The exit_code field records the termination status of each kernel invocation, with numeric codes like `769`, `229`, `332`, and `253` indicating distinct completion or failure conditions. Critically, the retry_count column quantifies resilience behavior, tracking how many times a kernel was reattempted before reaching its final state—values ranging from `14` to `436` retries reveal significant variance in operational stability, with higher retry counts signaling processes that encounter transient failures or resource contention.

**fact_kernel**

| id | with_process_comm_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| COMM-0001 | COMM-0007 | 5315.83 | 769 | 436 |
| COMM-0002 | COMM-0004 | 6644.30 | 229 | 251 |
| COMM-0003 | COMM-0008 | 4698.54 | 332 | 190 |
| COMM-0004 | COMM-0004 | 3561.41 | 253 | 14 |
| COMM-0005 | COMM-0001 | 6092.67 | 910 | 352 |
| COMM-0006 | COMM-0002 | 6729.90 | 888 | 269 |
| COMM-0007 | COMM-0006 | 814.76 | 674 | 214 |
| COMM-0008 | COMM-0008 | 2447.90 | 247 | 434 |

Process communication entities are classified through a dimension table that provides both categorical and descriptive metadata. Each process communication record carries a category designation—such as `With Process Comm Category 01` through `With Process Comm Category 04`—that groups related process types for aggregation and policy enforcement. The misc column, represented as a human-readable label like `With Process Comm Label 01`, offers an additional layer of descriptive context that operators can reference during incident investigation or capacity planning. This classification layer sits between the raw execution metrics in fact_kernel and the business-level allocation records, enabling operators to filter, aggregate, and correlate kernel performance data by process type without embedding operational semantics directly into the execution tables.

**dim_with_process_comm**

| id | with_process_comm_label | with_process_comm_category |
| --- | --- | --- |
| COMM-0001 | With Process Comm Label 01 | With Process Comm Category 01 |
| COMM-0002 | With Process Comm Label 02 | With Process Comm Category 02 |
| COMM-0003 | With Process Comm Label 03 | With Process Comm Category 03 |
| COMM-0004 | With Process Comm Label 04 | With Process Comm Category 04 |
| COMM-0005 | With Process Comm Label 05 | With Process Comm Category 05 |
| COMM-0006 | With Process Comm Label 06 | With Process Comm Category 06 |
| COMM-0007 | With Process Comm Label 07 | With Process Comm Category 07 |
| COMM-0008 | With Process Comm Label 08 | With Process Comm Category 08 |

Artifact integrity and lifecycle management are tracked through a separate registry that associates content objects with their functional roles within the data pipeline. Each artifact entry is identified by a unique key such as `ROLE-0001` and carries a checksum—represented as an eight-character hexadecimal value like `5e8f3c91` or `a3f9c21e`—that serves as a cryptographic fingerprint for detecting corruption or unauthorized modification. The size_bytes column records the byte-level footprint of each artifact, with values spanning from approximately `29.9 MB` for a feature-store-cache output to `666.9 MB` for a patient-cohorts-2023 source dataset, providing operators with storage utilization visibility and transfer planning data. The role field assigns each artifact a functional designation within the pipeline, including `source-dataset`, `transform-stage`, `output-sink`, and `archival-copy`, which clarifies the artifact's position in the data flow and determines which integrity checks and retention policies apply. Notably, the same artifact—such as `patient-cohorts-2023` or `feature-store-cache`—may appear under multiple roles, reflecting its traversal through different pipeline stages with distinct integrity and governance requirements.

**t_artifact_with_role**

| id | artifact | role | checksum | size_bytes |
| --- | --- | --- | --- | --- |
| ROLE-0001 | patient-cohorts-2023 | source-dataset | 5e8f3c91 | 666903238 |
| ROLE-0002 | patient-cohorts-2023 | transform-stage | 7b14de08 | 309925726 |
| ROLE-0003 | feature-store-cache | output-sink | a3f9c21e | 29914871 |
| ROLE-0004 | feature-store-cache | archival-copy | 9d2b7a16 | 347040623 |