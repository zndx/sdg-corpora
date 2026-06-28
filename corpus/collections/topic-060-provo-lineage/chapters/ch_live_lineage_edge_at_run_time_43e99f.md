---
chapter_id: ch_live_lineage_edge_at_run_time_43e99f
topic_id: 60
family: 05_provo_lineage
cited_terms: ['lineage_edge_at_run_time', 'outlier_detection_with_baseline', 'kernel_event_with_pid']
model: engine-refine
---

In operational data architectures, the disciplined separation of identifiers, roles, subjects, and targets constitutes a foundational pattern for modeling relationships that must remain both traceable and semantically precise. An identifier serves as the immutable handle by which any entity—whether a data pipeline, a runtime worker, a detected anomaly, or a kernel version—is referenced across the system. The lineage catalog assigns handles such as TIME-0001 through TIME-0004 to distinct processing flows, including batch-revenue-aggregation, customer-churn-pipeline, climate-data-ingest, and genomic-sequence-align, each of which must be independently addressable regardless of how its runtime context or governance relationships evolve. Similarly, outlier detection records carry identifiers like BASE-0001 and BASE-0002 for a network latency jump, while kernel event records use PID-0001 through PID-0004 to distinguish Darwin 22.4.0, Arch 2023.11, Ubuntu 22.04, and Alpine 6.1.12. The identifier is the anchor; without it, no relationship can be reliably reconstructed.

**t_lineage_edge_at_run_time**

| id | lineage |
| --- | --- |
| TIME-0001 | batch-revenue-aggregation |
| TIME-0002 | customer-churn-pipeline |
| TIME-0003 | climate-data-ingest |
| TIME-0004 | genomic-sequence-align |
| TIME-0005 | model-training-workflow |
| TIME-0006 | user-behavior-trace |

**t_lineage_edge_at_run_time_at_run_time**

| id | at_run_time |
| --- | --- |
| TIME-0001 | worker-node-12 |
| TIME-0002 | job-run-8842 |
| TIME-0003 | worker-node-12 |
| TIME-0004 | batch-queue-primary |
| TIME-0005 | job-run-8842 |
| TIME-0006 | execution-window-4 |

**t_lineage_edge_at_run_time__at_run_time**

| id | lineage_id | at_run_time_id | role |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0004 | TIME-0005 | owner |
| TIME-0002 | TIME-0006 | TIME-0003 | observer |
| TIME-0003 | TIME-0004 | TIME-0005 | owner |
| TIME-0004 | TIME-0004 | TIME-0001 | reviewer |
| TIME-0005 | TIME-0002 | TIME-0006 | contributor |
| TIME-0006 | TIME-0004 | TIME-0006 | owner |
| TIME-0007 | TIME-0005 | TIME-0004 | contributor |
| TIME-0008 | TIME-0005 | TIME-0003 | observer |

**t_kernel_event_with_pid**

| id | kernel |
| --- | --- |
| PID-0001 | Darwin 22.4.0 |
| PID-0002 | Arch 2023.11 |
| PID-0003 | Ubuntu 22.04 |
| PID-0004 | Alpine 6.1.12 |
| PID-0005 | Red Hat 8.6 |
| PID-0006 | CentOS 7.9 |

**t_kernel_event_with_pid_with_process_id**

| id | with_process_id |
| --- | --- |
| PID-0001 | 128 |
| PID-0002 | 128 |
| PID-0003 | 24576 |
| PID-0004 | 8192 |
| PID-0005 | 1024 |
| PID-0006 | 128 |

**t_kernel_event_with_pid__with_process_id**

| id | kernel_id | with_process_id_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0005 | owner |
| PID-0002 | PID-0003 | PID-0002 | owner |
| PID-0003 | PID-0005 | PID-0005 | observer |
| PID-0004 | PID-0006 | PID-0005 | observer |
| PID-0005 | PID-0001 | PID-0005 | observer |
| PID-0006 | PID-0005 | PID-0001 | owner |
| PID-0007 | PID-0003 | PID-0001 | reviewer |
| PID-0008 | PID-0003 | PID-0004 | observer |

The subject and target of a relationship are the two entities that participate in a connection, and their distinction is not merely syntactic but semantic. In the lineage domain, a subject such as the lineage record TIME-0004 (genomic-sequence-align) may relate to a target runtime entity like TIME-0001 (batch-queue-primary), and the directionality of that connection matters: the lineage is the thing being executed, the runtime entity is the thing executing it. In outlier detection, the subject BASE-0001 (network latency jump) relates to the target BASE-0005 (expected distribution), establishing that the anomaly is measured against a particular baseline. In kernel-event correlation, the subject PID-0002 (Arch 2023.11) relates to the target PID-0002 (process ID 128), indicating which kernel version is associated with which process. The subject-target pairing is the relational core; everything else—identifiers, roles—serves to qualify it.

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

The role column is what transforms a bare subject-target pairing into a governed, auditable relationship. It answers not merely which entities are connected but in what capacity they are connected. A lineage edge may carry the role owner, as seen when TIME-0004 (genomic-sequence-align) is linked to TIME-0005, or the role observer, as when TIME-0006 connects to TIME-0003, or the role reviewer, as when TIME-0004 connects to TIME-0001. In outlier detection, the same subject BASE-0001 (network latency jump) relates to two different targets—BASE-0005 and BASE-0004—under the roles observer and owner respectively, indicating that the relationship is not one-to-one but multiplexed by governance intent. In kernel-event correlation, the role owner appears when PID-0002 (Arch 2023.11) relates to PID-0005, and the role observer appears when PID-0003 (Ubuntu 22.04) relates to the same target PID-0005, demonstrating that a single target can participate in multiple relationships under different roles simultaneously. The role is the semantic qualifier that makes the relationship machine-interpretable and policy-enforceable.

This three-table pattern—identifier catalog, target catalog, and subject-target-role junction—repeats across domains because it solves a single structural problem: how to represent many-to-many relationships with explicit governance semantics without collapsing into an unmanageable monolith. The lineage system separates the pipeline catalog from the runtime catalog and joins them through a junction table that carries role metadata; the outlier system separates the anomaly catalog from the baseline catalog and joins them through a junction table that carries role metadata; the kernel-event system separates the kernel catalog from the process catalog and joins them through a junction table that carries role metadata. Each junction table carries its own surrogate identifier (TIME-0001 through TIME-0004, BASE-0001 through BASE-0004, PID-0001 through PID-0004) to ensure that every relationship instance is independently addressable, versionable, and deletable without ambiguity. The pattern is not novel, but its consistent application across heterogeneous domains—data engineering, anomaly detection, systems telemetry—is what makes it operationally significant.

The practical consequence of this design is that queries can traverse relationships with precision: one can ask which runtimes are owned by a given lineage, which baselines an outlier is observed against, or which processes are associated with a given kernel under a specific role. The identifiers ensure referential integrity, the subject-target distinction preserves directionality, and the role column enables role-based access control, audit filtering, and policy evaluation. When a network latency jump (BASE-0001) is both an observer of expected distribution (BASE-0005) and an owner of BASE-0004, the system captures that duality explicitly rather than forcing a choice. When a genomic-sequence-align pipeline (TIME-0004) is simultaneously an owner of TIME-0005 and a reviewer of TIME-0001, the system captures that multiplicity. The pattern scales because it is composable: new relationship types are added by introducing new junction tables, not by modifying existing ones, and new roles are added by extending the role domain, not by restructuring the schema.