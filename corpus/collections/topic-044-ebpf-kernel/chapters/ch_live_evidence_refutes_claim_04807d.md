---
chapter_id: ch_live_evidence_refutes_claim_04807d
topic_id: 44
family: 06_belief_structure
cited_terms: ['evidence_refutes_claim', 'state_transitions_from', 'ebpfprogram_writes_to_map']
model: engine-refine
---

Governance frameworks for data integrity and system observability rely on structured evidence registries that capture, classify, and cross-reference claims against their supporting or refuting artifacts. The evidence registry, anchored by the `t_evidence_refutes_claim` table, records discrete assertions and the materials that contradict them. Each entry carries a unique identifier—`CLAI-0001` through `CLAI-0004`—and pairs a piece of evidence, such as a benchmark result at version 2.1, an audit report for fiscal year 2023, a sensor drift calibration record, or a data lineage snapshot, against a specific claim it refutes. The claim most frequently challenged across the registry is the assertion that uptime exceeds 99.9 percent, which appears in three of the four records; a fourth entry targets a carbon-neutral supply chain claim. The evidentiary method is classified as manual, hybrid, or automated, and each record is annotated with a label text—calibration record, audit excerpt, intake form, or pre-release note—that situates the artifact within its operational provenance.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | Uptime exceeds 99.9% | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | Uptime exceeds 99.9% | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | Carbon neutral supply chain | automated | intake form |
| CLAI-0004 | Data lineage snapshot | Uptime exceeds 99.9% | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | GDPR Article 17 compliant | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | Chemical purity meets ISO | automated | change rationale |
| CLAI-0007 | Incident summary Aug | Uptime exceeds 99.9% | inferred | intake form |

State transition management follows a parallel discipline, decomposing lifecycle movements into discrete source states and their originating transition contexts. The `t_state_transitions_from` table enumerates source states such as `MaintenanceWindow`, `DrainingEndpoint`, and `SynchronizedState`, each assigned a stable identifier from `FROM-0001` through `FROM-0004`. These states are cross-referenced against transition origins recorded in `t_state_transitions_from_transitions_from`, which maps identifiers to transition-from entities including `StagingDataset`, `ValidationQueue`, `ArchiveBucket`, and `BackupSnapshot`. The relationship between states and transition origins is materialized through the junction table `t_state_transitions_from__transitions_from`, which binds a `state_id` to a `transitions_from_id` and assigns a role—`contributor`, `reviewer`, or `observer`—to the entity performing the linkage. For instance, the transition originating from `StagingDataset` (`FROM-0001`) is associated with the state `MaintenanceWindow` (`FROM-0007`) under an observer role, while the transition from `BackupSnapshot` (`FROM-0006`) connects to the `DrainingEndpoint` state (`FROM-0002`) under a reviewer role. This tripartite structure ensures that every state change is attributable to a specific origin context and an accountable participant.

**t_state_transitions_from**

| id | state |
| --- | --- |
| FROM-0001 | MaintenanceWindow |
| FROM-0002 | DrainingEndpoint |
| FROM-0003 | MaintenanceWindow |
| FROM-0004 | SynchronizedState |
| FROM-0005 | DrainingEndpoint |
| FROM-0006 | ReplicationGap |
| FROM-0007 | CorruptionDetected |

**t_state_transitions_from_transitions_from**

| id | transitions_from |
| --- | --- |
| FROM-0001 | StagingDataset |
| FROM-0002 | ValidationQueue |
| FROM-0003 | ArchiveBucket |
| FROM-0004 | BackupSnapshot |
| FROM-0005 | ProductionMirror |
| FROM-0006 | LegacyWarehouse |
| FROM-0007 | LegacyWarehouse |

**t_state_transitions_from__transitions_from**

| id | state_id | transitions_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0007 | FROM-0006 | contributor |
| FROM-0002 | FROM-0005 | FROM-0004 | reviewer |
| FROM-0003 | FROM-0006 | FROM-0001 | observer |
| FROM-0004 | FROM-0002 | FROM-0006 | reviewer |
| FROM-0005 | FROM-0007 | FROM-0004 | reviewer |
| FROM-0006 | FROM-0006 | FROM-0005 | observer |
| FROM-0007 | FROM-0003 | FROM-0002 | owner |
| FROM-0008 | FROM-0003 | FROM-0006 | observer |

System-level observability extends into kernel-space program tracking through a star schema that relates eBPF programs to the maps they populate. The fact table `fact_ebpfprogram` records each program by its identifier—`MAP-0001` through `MAP-0004`—and references a target map via the `writes_to_map_key` column, which serves as a foreign key into the dimension table `dim_writes_to_map`. Program sizes range from approximately 113 megabytes for `MAP-0003` to 784 megabytes for `MAP-0001`, with versions distributed across 9, 11, and 12. The dimension table `dim_writes_to_map` provides categorical and label metadata for each map, assigning identifiers `MAP-0001` through `MAP-0004` to generic labels such as `Writes To Map Label 01` and categories such as `Writes To Map Category 01`. This separation of measurable program attributes from descriptive map metadata enables efficient aggregation and filtering across large-scale telemetry pipelines.

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

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

The structural relationships across these registries form a coherent evidence graph. The `writes_to_map_key` foreign key in `fact_ebpfprogram` resolves to `dim_writes_to_map.id`, establishing a many-to-one relationship that permits multiple programs to target the same map while preserving distinct size and version attributes. Similarly, the junction table `t_state_transitions_from__transitions_from` enforces referential integrity between `t_state_transitions_from` and `t_state_transitions_from_transitions_from` through its `state_id` and `transitions_from_id` columns, respectively, while the `role` column introduces an additional attribute layer that captures the functional capacity of the linking entity. Together, these tables support audit trails that are simultaneously granular enough to identify individual artifacts—such as the `Sensor drift calibration` evidence refuting a carbon-neutral claim—and aggregated enough to reveal systemic patterns, such as the repeated challenge to uptime assertions across multiple evidence types and methods.