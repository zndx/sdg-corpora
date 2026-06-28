---
chapter_id: ch_live_constraint_subclass_175ef1
topic_id: 186
family: 01_foundation
cited_terms: ['constraint_subclass', 'equiv_intersect_with_two_restrictions', 'provenance_agent_subclass']
model: engine-refine
---

Identifiers anchor every governance artifact to a stable, machine-readable reference that survives across system boundaries and audit cycles. Constraint records carry codes such as CONS-0001 through CONS-0004, equivalence intersections are labeled REST-0001 through REST-0004, and provenance agents receive identifiers ranging from AGEN-0001 to AGEN-0004. These codes are not arbitrary; they encode the artifact class and sequence, enabling downstream systems to join records without ambiguity. A telemetry stream identified as telemetry-stream-alpha in the provenance registry, for instance, can be unambiguously traced to its equivalence intersection REST-0001, its associated constraint CONS-0001, and the set of responsible agents that maintain it. The identifier is the single point of truth that lets an auditor reconstruct the full lineage of any governed asset.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | storage_volume | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | encryption_key | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | centrifuge_tube | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | ingestion_connector | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | protocol_adapter | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | schema_registry | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | centrifuge_tube | inference_dataset |

**t_provenance_agent_subclass**

| id | provenance |
| --- | --- |
| AGEN-0001 | audit-trail-archive |
| AGEN-0002 | clinical-trial-raw |
| AGEN-0003 | feature-store-export |
| AGEN-0004 | telemetry-stream-alpha |
| AGEN-0005 | pipeline-logs-v2 |
| AGEN-0006 | telemetry-stream-alpha |

Priority and review cycle days together define the temporal cadence and risk weighting of each constraint. Priority values range from 2 to 4 in the observed data, with the encryption standard (CONS-0004) carrying the highest priority of 2, while the data retention policy (CONS-0003) sits at priority 4, indicating a lower urgency tier. Review cycle days quantify how frequently each constraint must be re-evaluated: the audit log retention policy (CONS-0002) demands a review every 467 days, whereas the data retention policy (CONS-0003) is reassessed every 185 days. These intervals are not uniform because the assets under constraint carry different risk profiles and regulatory obligations. A geofence boundary governing a database cluster (CONS-0001) is reviewed every 311 days, while an encryption standard applied to a sensor array (CONS-0004) requires a 391-day cycle. The combination of priority and review cadence allows governance programs to allocate scarce review capacity to the artifacts that matter most and need the most attention.

The role, subject, and target triad operationalizes accountability by linking provenance sources to specific responsibilities. In the provenance responsibility matrix, the subject column identifies the provenance agent—such as AGEN-0004, which corresponds to the telemetry-stream-alpha agent—and the target column identifies the responsibility agent, for example AGEN-0005 or AGEN-0007. The role column then specifies the nature of the relationship: contributor, observer, or reviewer. A single provenance agent can hold multiple roles across different responsibility assignments; AGEN-0004, for instance, appears as a contributor to one responsibility and as a reviewer for two others. This many-to-many structure ensures that no single agent is overburdened with accountability while guaranteeing that every responsibility has at least one named owner. The system-auditor responsibility (AGen-0001), the data-steward responsibility (AGen-0002), the lab-coordinator responsibility (AGen-0003), and the etl-scheduler responsibility (AGen-0004) are the responsibility endpoints that agents are assigned to, and the role column clarifies whether the agent executes the responsibility, monitors it, or validates its completion.

In practice, these six concepts form an interlocking governance fabric. An identifier like CONS-0001 ties a specific constraint—geofence boundary—to the asset it constrains, the database cluster, and the priority and review cadence that govern its lifecycle. The provenance registry, through identifiers such as AGEN-0001 through AGEN-0004, records the origin and transformation history of data assets like audit-trail-archive, clinical-trial-raw, feature-store-export, and telemetry-stream-alpha. The responsibility matrix then maps each provenance agent to the roles it plays across the responsibility pool, using subject and target columns to express directed accountability relationships. Equivalence intersections, identified by codes like REST-0001, capture the complex relationships between assets—for example, linking telemetry_stream_alpha with ml_model_checkpoint and connecting storage_volume to inference_dataset—ensuring that governance decisions propagate correctly across related artifacts. Together, identifier, priority, reviewcycledays, role, subject, and target provide the structural vocabulary that makes governance auditable, automated, and actionable.

**t_constraint_subclass**

| id | constraint | constrains | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| CONS-0001 | Geofence boundary | Database cluster | 3 | 311 |
| CONS-0002 | Audit log retention | Compute node | 3 | 467 |
| CONS-0003 | Data retention policy | Network interface | 4 | 185 |
| CONS-0004 | Encryption standard | Sensor array | 2 | 391 |

**t_provenance_agent_subclass_responsibility**

| id | responsibility |
| --- | --- |
| AGEN-0001 | system-auditor |
| AGEN-0002 | data-steward |
| AGEN-0003 | lab-coordinator |
| AGEN-0004 | etl-scheduler |
| AGEN-0005 | lab-coordinator |
| AGEN-0006 | data-steward |
| AGEN-0007 | data-steward |

**t_provenance_agent_subclass__responsibility**

| id | provenance_id | responsibility_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0002 | AGEN-0004 | AGEN-0002 | observer |
| AGEN-0003 | AGEN-0002 | AGEN-0001 | reviewer |
| AGEN-0004 | AGEN-0004 | AGEN-0007 | reviewer |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | owner |
| AGEN-0006 | AGEN-0005 | AGEN-0007 | observer |
| AGEN-0007 | AGEN-0003 | AGEN-0003 | reviewer |
| AGEN-0008 | AGEN-0001 | AGEN-0001 | owner |