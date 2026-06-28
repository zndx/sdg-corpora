---
chapter_id: ch_live_allocation_with_run_status_3f43e8
topic_id: 183
family: 05_provo_lineage
cited_terms: ['allocation_with_run_status', 'equiv_union_three', 'artifact_not_deprecated']
model: engine-refine
---

In resource governance frameworks, the lifecycle of every allocation must be tracked from initiation through completion or failure. Allocations such as `kafka-consumer-group` and `gpu-cluster-alpha` represent discrete computational or service assignments whose operational state is recorded through run statuses like `timeout-expired`, `disconnected-drift`, and `succeeded-final`. The distinction between a terminal state such as `succeeded-final` and a failure mode like `timeout-expired` carries direct implications for audit trails, cost reconciliation, and incident response. When an allocation transitions through these states, the system maintains a persistent record keyed by identifiers like `STAT-0001` through `STAT-0004`, ensuring that every execution attempt is traceable to a specific resource assignment and its outcome.

**t_allocation_with_run_status**

| id | allocation |
| --- | --- |
| STAT-0001 | kafka-consumer-group |
| STAT-0002 | kafka-consumer-group |
| STAT-0003 | vault-secret-rotate |
| STAT-0004 | gpu-cluster-alpha |
| STAT-0005 | gpu-cluster-alpha |
| STAT-0006 | batch-etl-nightly |

**t_allocation_with_run_status_run_status**

| id | run_status |
| --- | --- |
| STAT-0001 | timeout-expired |
| STAT-0002 | disconnected-drift |
| STAT-0003 | succeeded-final |
| STAT-0004 | succeeded-final |
| STAT-0005 | succeeded-final |
| STAT-0006 | retrying-backoff |

Responsibility for each allocation-status pairing is formalized through role-based assignments that distinguish between active contributors, passive observers, and approving reviewers. The junction between an allocation and its run status is not merely a technical linkage but a governance construct: the same allocation `STAT-0001` may appear with different roles depending on which run status it is associated with, reflecting the fact that accountability shifts as an allocation progresses through its lifecycle. A contributor who initiated the work may hand off to a reviewer for validation, while an observer monitors the outcome without direct operational authority. This role dimension—`reviewer`, `observer`, `contributor`—ensures that compliance audits can answer not only what happened to a resource but who was responsible at each stage.

**t_allocation_with_run_status__run_status**

| id | allocation_id | run_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0006 | reviewer |
| STAT-0002 | STAT-0006 | STAT-0004 | observer |
| STAT-0003 | STAT-0004 | STAT-0002 | contributor |
| STAT-0004 | STAT-0001 | STAT-0005 | contributor |
| STAT-0005 | STAT-0006 | STAT-0001 | observer |
| STAT-0006 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0007 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0008 | STAT-0005 | STAT-0006 | observer |

Artifact management operates as a parallel tracking domain, where each artifact is characterized by its categorical classification, human-readable label, physical size, and version number. Artifacts such as `DEPR-0001` through `DEPR-0004` carry labels like `Artifact Label 01` and categories like `Artifact Category 01`, providing the metadata necessary for classification and retrieval. The size of these artifacts varies significantly—`DEPR-0003` occupies nearly one gigabyte (`996080316` bytes) while `DEPR-0002` is under fifty megabytes (`42978804` bytes)—a distinction that matters for storage provisioning, transfer costs, and retention policy enforcement. Version numbers, ranging from `5` to `10` across the sample, enable change tracking and rollback capabilities, ensuring that any artifact can be reconstructed at a specific point in its evolution.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |

Equivalence relationships between system components form a third pillar of the governance model, capturing how different elements map to one another across functional boundaries. Components such as `telemetry_stream_alpha`, `governance_policy_alpha`, and `metadata_registry` are linked through multi-dimensional equivalence tuples that also reference associated elements like `switch_board`, `firewall_rule`, and `primary_gateway`. These relationships are further qualified by operational modes such as `idle_mode` and `rate_limit`, and by serialization formats including `json_payload`, `protobuf_msg`, and `yaml_config`. Understanding these equivalence chains is essential for impact analysis: when a `governance_policy_alpha` is modified, the system can trace its dependencies through `backup_node` and `rate_limit` to identify all downstream components that require revalidation.

Together, these structures form an integrated governance fabric where resource allocations, artifact metadata, and component equivalences are cross-referenced to support compliance reporting, operational visibility, and change management. The allocation tracking tables answer questions about resource utilization and failure modes, the artifact tables provide a catalog of managed assets with their physical and categorical properties, and the equivalence union captures the dependency topology that determines how changes propagate through the system. An auditor examining a specific allocation like `STAT-0001` can follow the chain from its run status through its assigned roles, while a release engineer managing artifact `DEPR-0004` can verify its version history and size constraints before deployment.

**t_equiv_union_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | telemetry_stream_alpha | switch_board | idle_mode | flat_text |
| THRE-0002 | governance_policy_alpha | firewall_rule | rate_limit | json_payload |
| THRE-0003 | governance_policy_alpha | backup_node | maintenance_window | protobuf_msg |
| THRE-0004 | metadata_registry | primary_gateway | rate_limit | yaml_config |
| THRE-0005 | governance_policy_alpha | relay_module | error_recovery | parquet_file |