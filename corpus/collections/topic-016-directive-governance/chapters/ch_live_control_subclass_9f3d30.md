---
chapter_id: ch_live_control_subclass_9f3d30
topic_id: 16
family: 03_directive_governance
cited_terms: ['control_subclass', 'artifact_with_min_two_parts', 'equiv_union_basic']
model: engine-refine
---

The integrity of any governed system rests on a hierarchy of identifiers that anchor every entity to a verifiable lineage. Control definitions such as CONT-0001 through CONT-0004 serve as the primary keys for policy objects—MFA enforcement, Backup frequency policy, Access review cycle, and TLS 1.3 mandatory—each uniquely addressable within the control taxonomy. These identifiers propagate into the relationship layer, where the junction table `t_control_subclass__mitigates` uses the same identifier namespace to bind controls to their threat-mitigation targets: CONT-0004 maps to CONT-0007 and CONT-0002, while CONT-0001 maps to CONT-0002, establishing a directed graph of responsibility. The identifiers in the artifact registry—PART-0001 through PART-0004—follow the same convention, ensuring that deliverables like `raw_telemetry_dump`, `compliance_manifest`, `inference_model_final`, and `ingestion_script_main` are traceable to their originating control and equivalence contexts.

**t_control_subclass**

| id | control |
| --- | --- |
| CONT-0001 | MFA enforcement |
| CONT-0002 | Backup frequency policy |
| CONT-0003 | Access review cycle |
| CONT-0004 | TLS 1.3 mandatory |
| CONT-0005 | Session timeout limit |
| CONT-0006 | Audit log retention |
| CONT-0007 | MFA enforcement |

**t_control_subclass_mitigates**

| id | mitigates |
| --- | --- |
| CONT-0001 | Service outage |
| CONT-0002 | Service outage |
| CONT-0003 | Phishing attack |
| CONT-0004 | Network intrusion |
| CONT-0005 | System downtime |
| CONT-0006 | Credential stuffing |
| CONT-0007 | Phishing attack |
| CONT-0008 | Data exfiltration |

**t_control_subclass__mitigates**

| id | control_id | mitigates_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0004 | CONT-0007 | owner |
| CONT-0002 | CONT-0004 | CONT-0002 | reviewer |
| CONT-0003 | CONT-0007 | CONT-0004 | observer |
| CONT-0004 | CONT-0001 | CONT-0002 | contributor |
| CONT-0005 | CONT-0006 | CONT-0002 | observer |
| CONT-0006 | CONT-0005 | CONT-0001 | owner |
| CONT-0007 | CONT-0001 | CONT-0002 | observer |
| CONT-0008 | CONT-0006 | CONT-0008 | observer |

Checksums provide the cryptographic anchor for artifact integrity, enabling any stakeholder to verify that a stored or transmitted file has not been altered since its last recorded state. The artifact registry `t_artifact_with_min_two_parts` pairs each identifier with a hexadecimal digest and a version number, creating a tamper-evident record: `raw_telemetry_dump` carries the checksum `c0ffee42` at version 7, `compliance_manifest` carries `a3f9c21e` at version 5, `inference_model_final` carries `5e8f3c91` at version 11, and `ingestion_script_main` carries `7b14de08` at version 10. The checksum is not merely a hash—it is a commitment. When an artifact is deployed, the consuming system recomputes the digest and rejects the payload if the result diverges from the recorded value, thereby enforcing an immutable chain of custody from authoring to execution.

**t_artifact_with_min_two_parts**

| id | artifact | checksum | version |
| --- | --- | --- | --- |
| PART-0001 | raw_telemetry_dump | c0ffee42 | 7 |
| PART-0002 | compliance_manifest | a3f9c21e | 5 |
| PART-0003 | inference_model_final | 5e8f3c91 | 11 |
| PART-0004 | ingestion_script_main | 7b14de08 | 10 |
| PART-0005 | etl_pipeline_run | 1a4b6c2d | 9 |

Version numbers encode the temporal dimension of artifact governance, distinguishing between successive revisions of the same logical component. A version is an integer counter that increments with each approved change, and it operates in tandem with the checksum to produce a two-dimensional integrity check: the version tells you which iteration you are examining, and the checksum tells you whether that iteration is intact. The artifact registry records versions ranging from 5 for `compliance_manifest` to 11 for `inference_model_final`, reflecting the different update cadences of compliance documentation versus machine-learning models. When a version mismatch occurs between a deployed artifact and the registry, the system flags the discrepancy for investigation before allowing the artifact to proceed to production.

Roles govern the human dimension of control-to-threat relationships, assigning accountability and visibility across the mitigation graph. The junction table `t_control_subclass__mitigates` attaches a role—owner, reviewer, observer, or contributor—to each edge connecting a control to its mitigation target. CONT-0004 holds the owner role for its relationship to CONT-0007, meaning the designated owner bears primary responsibility for ensuring that the TLS 1.3 mandatory control effectively mitigates the threat represented by CONT-0007. CONT-0004 also appears as reviewer for the CONT-0002 relationship, indicating a secondary oversight function. CONT-0007 carries the observer role for its link to CONT-0004, and CONT-0001 holds the contributor role for its link to CONT-0002. These role assignments are not metadata; they are enforcement points that determine who must approve changes, who must be notified of incidents, and who may audit the relationship.

Equivalence mappings extend the identifier namespace across system boundaries, declaring that components in different domains represent the same logical entity. The `t_equiv_union_basic` table records three-way equivalences: `telemetry_hub_alpha` is equivalent to `schema_v3_prod` and `governance_log_f`; `metric_bundle_plus` is equivalent to `warehouse_db_staging` and `metric_aggregate_g`; `ingest_pipeline_main` is equivalent to `probe_array_thirteen` and `repository_db_j`; and `sensor_array_beta` is equivalent to `compliance_log_sixteen` and `edge_node_h`. These declarations enable cross-domain queries, policy propagation, and audit correlation. When a control references CONT-0001, the system can resolve that identifier through the equivalence graph to find all associated artifacts, schemas, and infrastructure components, producing a unified view of compliance coverage that spans telemetry pipelines, data warehouses, and edge deployments.

**t_equiv_union_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| UNIO-0001 | telemetry_hub_alpha | schema_v3_prod | governance_log_f |
| UNIO-0002 | metric_bundle_plus | warehouse_db_staging | metric_aggregate_g |
| UNIO-0003 | ingest_pipeline_main | probe_array_thirteen | repository_db_j |
| UNIO-0004 | sensor_array_beta | compliance_log_sixteen | edge_node_h |
| UNIO-0005 | batch_run_four | staging_run_twelve | governance_log_f |