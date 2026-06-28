---
chapter_id: ch_live_existential_generic_2cdaeb
topic_id: 26
family: 01_foundation
cited_terms: ['existential_generic', 'dataset_snapshot_subclass', 'appointment_scheduling_process']
model: engine-refine
---

In operational data governance, appointment scheduling processes serve as the central organizing construct for coordinating patient care workflows and their associated artifacts. Each scheduling process is uniquely identified—values such as PROC-0001 through PROC-0004 anchor individual process instances—and carries a descriptive label like Appointment Scheduling Process 01 that communicates its purpose within the broader care continuum. These processes do not exist in isolation; they are executed by designated operators, typically receptionist agents, who assume defined responsibilities during the scheduling lifecycle. The operator dimension captures both the identity of the responsible agent and the nature of their involvement, with roles ranging from owner, which denotes full accountability for the scheduling action, to observer, which indicates a monitoring or audit posture without direct execution authority.

The relationship between scheduling processes and their operators is modeled as a many-to-many association, enabling flexible assignment patterns where a single receptionist agent may participate in multiple scheduling processes and, conversely, a single process may involve multiple operators across different phases. In the association table, each linkage carries its own identifier and explicitly records the appointment identifier, the operator identifier, and the role assigned to that operator within that specific context. For instance, PROC-0001 appears as both the appointment and the operator in certain linkages, reflecting scenarios where an agent both initiates and participates in the same scheduling process, while other linkages pair PROC-0001 as the appointment with PROC-0002 as the operator, illustrating cross-process delegation. The role field in these associations—populated with values such as owner and observer—provides the granular access control and accountability metadata necessary for audit trails and compliance reporting.

**t_appointment_scheduling_process**

| id | appointment_scheduling_process |
| --- | --- |
| PROC-0001 | Appointment Scheduling Process 01 |
| PROC-0002 | Appointment Scheduling Process 02 |
| PROC-0003 | Appointment Scheduling Process 03 |
| PROC-0004 | Appointment Scheduling Process 04 |
| PROC-0005 | Appointment Scheduling Process 05 |
| PROC-0006 | Appointment Scheduling Process 06 |

**t_appointment_scheduling_process_operator**

| id | operator |
| --- | --- |
| PROC-0001 | Operator 01 |
| PROC-0002 | Operator 02 |
| PROC-0003 | Operator 03 |
| PROC-0004 | Operator 04 |
| PROC-0005 | Operator 05 |
| PROC-0006 | Operator 06 |
| PROC-0007 | Operator 07 |

**t_appointment_scheduling_process__operator**

| id | appointment_id | operator_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | owner |
| PROC-0002 | PROC-0006 | PROC-0004 | owner |
| PROC-0003 | PROC-0004 | PROC-0007 | observer |
| PROC-0004 | PROC-0001 | PROC-0004 | observer |
| PROC-0005 | PROC-0006 | PROC-0001 | contributor |
| PROC-0006 | PROC-0002 | PROC-0001 | reviewer |
| PROC-0007 | PROC-0002 | PROC-0005 | owner |
| PROC-0008 | PROC-0005 | PROC-0002 | reviewer |

Appointment scheduling processes also target specific artifacts, most notably patient appointment schedules, which represent the concrete output or deliverable of the scheduling activity. The target artifact dimension captures what each process aims to produce or modify, with entries like Targets Artifact 01 through Targets Artifact 04 serving as categorical descriptors of the artifact type. The association between processes and target artifacts mirrors the operator relationship in its many-to-many structure but adds a cardinality note field that constrains the multiplicity of the relationship. Cardinality notes such as Cardinality Note 01 through Cardinality Note 04 encode business rules about whether a scheduling process may produce one or many target artifacts, or whether a single target artifact may be the result of multiple scheduling processes. The role field in this association similarly distinguishes between owner, reviewer, and observer positions, ensuring that artifact ownership and review responsibilities are explicitly tracked alongside the scheduling action itself.

**t_appointment_scheduling_process_targets_artifact**

| id | targets_artifact |
| --- | --- |
| PROC-0001 | Targets Artifact 01 |
| PROC-0002 | Targets Artifact 02 |
| PROC-0003 | Targets Artifact 03 |
| PROC-0004 | Targets Artifact 04 |
| PROC-0005 | Targets Artifact 05 |
| PROC-0006 | Targets Artifact 06 |

**t_appointment_scheduling_process__targets_artifact**

| id | appointment_id | targets_artifact_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0004 | owner | Cardinality Note 01 |
| PROC-0002 | PROC-0001 | PROC-0006 | owner | Cardinality Note 02 |
| PROC-0003 | PROC-0004 | PROC-0004 | reviewer | Cardinality Note 03 |
| PROC-0004 | PROC-0006 | PROC-0002 | observer | Cardinality Note 04 |
| PROC-0005 | PROC-0001 | PROC-0005 | observer | Cardinality Note 05 |
| PROC-0006 | PROC-0005 | PROC-0002 | reviewer | Cardinality Note 06 |
| PROC-0007 | PROC-0004 | PROC-0003 | owner | Cardinality Note 07 |
| PROC-0008 | PROC-0005 | PROC-0006 | observer | Cardinality Note 08 |

Beyond the scheduling domain, the broader data ecosystem includes existential entities that represent the foundational components upon which scheduling and data operations depend. The generic existential table captures entities identified by codes such as GENE-0001 through GENE-0004, with descriptive values ranging from ml-model-v3 and telemetry-stream-7 to ingestion-pipeline-5 and edge-gateway-19. Each existential entity carries a related field that establishes its dependency or association with other system components—for example, compliance-framework-iso, pipeline-dependency-3, and access-policy-admin—providing the traceability needed to assess the impact of changes across the operational landscape. These existential relationships form the substrate upon which scheduling processes and their operators operate, and disruptions to any linked component can cascade through the scheduling workflow.

**t_existential_generic**

| id | existential | related |
| --- | --- | --- |
| GENE-0001 | ml-model-v3 | compliance-framework-iso |
| GENE-0002 | telemetry-stream-7 | pipeline-dependency-3 |
| GENE-0003 | ingestion-pipeline-5 | access-policy-admin |
| GENE-0004 | edge-gateway-19 | pipeline-dependency-3 |
| GENE-0005 | batch-ingest-902 | cloud-storage-prod |
| GENE-0006 | batch-ingest-902 | validation-ruleset-9 |
| GENE-0007 | sensor-node-44 | backup-replication-4 |

Dataset snapshots represent another critical dimension of the operational data model, capturing point-in-time states of data assets with precise metadata. Each snapshot is identified by a code such as SNAP-0001 through SNAP-0004 and is linked to a source dataset through the snapshot_of relationship, enabling reconstruction and audit of data states at specific moments. The size_bytes field records the storage footprint of each snapshot—values such as 350697080, 501391865, 31504133, and 676110880 bytes reflect the varying scale of data assets under management—while the version field tracks the iteration of the snapshot, with values like 2, 5, and 10 indicating the revision history. The snapshot dimension further classifies each snapshot by a label and a category, with entries like Snapshot Of Label 01 through Snapshot Of Label 04 and corresponding categories such as Snapshot Of Category 01 through Snapshot Of Category 04, providing the organizational taxonomy needed for discovery and governance. Together, these snapshot attributes ensure that data lineage, storage planning, and compliance verification can be performed with precision across the entire operational data fabric.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |