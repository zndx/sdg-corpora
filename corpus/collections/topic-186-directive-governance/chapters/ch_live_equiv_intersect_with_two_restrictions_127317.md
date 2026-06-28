---
chapter_id: ch_live_equiv_intersect_with_two_restrictions_127317
topic_id: 186
family: 01_foundation
cited_terms: ['equiv_intersect_with_two_restrictions', 'regional_quality_benchmark', 'allocation_exactly_one_run_id']
model: engine-refine
---

Within data governance frameworks, identifiers function as the immutable anchors that enable traceability across disparate systems and processes. Every entity—from allocation records like `RUN-0001` and `RUN-0002` to regional fact entries such as `BENC-0001` and `REST-0001`—carries a unique identifier that persists regardless of how the underlying data is transformed, joined, or reclassified. These identifiers are not merely labels; they are the mechanism by which an allocation named `etl-sync-west` can be unambiguously linked to a run identifier like `proc-id-4421`, and by which a regional fact with confidence `0.036` can be traced back to its originating regional key `BENC-0001`. In practice, this means that audit trails, lineage tracking, and cross-system reconciliation all depend on the integrity of these identifier columns, which serve as the foreign keys binding allocation tables, regional dimensions, and equivalence relationship tables into a coherent data fabric.

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

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |

**t_allocation_exactly_one_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | etl-sync-west |
| RUN-0002 | batch-ingest-prod |
| RUN-0003 | query-opt-run |
| RUN-0004 | replica-clone-3 |
| RUN-0005 | model-deploy-stg |
| RUN-0006 | cache-warm-init |

**t_allocation_exactly_one_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | proc-id-4421 |
| RUN-0002 | session-77b |
| RUN-0003 | job-handle-11d |
| RUN-0004 | run-88f3a1 |
| RUN-0005 | run-tag-alpha |
| RUN-0006 | batch-snapshot-5e |
| RUN-0007 | pipeline-run-44f |
| RUN-0008 | task-uuid-003 |

Confidence and uncertainty form a complementary pair that quantifies the reliability of measured or inferred values. In the regional fact table, each record carries a confidence score ranging from `0.036` for `BENC-0001` to `0.818` for `BENC-0003`, alongside an uncertainty value that spans from `253.71` to `762.47`. These metrics are not abstract; they directly inform downstream decision-making. A regional entry with confidence `0.818` and uncertainty `510.50` commands substantially more trust than one with confidence `0.286` and uncertainty `762.47`, even when both report comparable value magnitudes such as `179.17` and `261.10`. Governance frameworks use these paired measures to establish data quality thresholds, trigger alerting when confidence falls below acceptable bounds, and weight analytical results according to their epistemic certainty.

Regional classification and categorical labeling provide the organizational scaffolding that transforms raw identifiers into meaningful groupings. The regional dimension table assigns each regional entity a label—`Regional Label 01` through `Regional Label 04`—and a corresponding category such as `Regional Category 01` through `Regional Category 04`. These categories are not arbitrary; they encode business semantics that determine how regional facts are aggregated, how access controls are applied, and how reports are structured. When a regional fact references `BENC-0001` through its regional key, the dimension table resolves that key to both a human-readable label and a category, enabling dashboards and governance queries to operate at the appropriate level of abstraction without exposing raw identifiers to end users.

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

The subject-target-role triad governs access and responsibility within allocation and run-identifier relationships. In the junction table linking allocations to run identifiers, each row specifies a subject (the allocation identifier, such as `RUN-0002` or `RUN-0004`), a target (the run identifier, such as `RUN-0006` or `RUN-0002`), and a role that defines the subject's relationship to the target. Roles observed in the data include `contributor`, `observer`, and `owner`, each carrying distinct permissions and accountability expectations. For instance, allocation `RUN-0002` acts as a contributor to run identifier `RUN-0006`, while allocation `RUN-0005` holds the owner role with respect to run identifier `RUN-0002`. This structure enables fine-grained access control lists, audit logging of who performed which action, and clear delineation of responsibility across distributed data pipelines.

**t_allocation_exactly_one_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0002 | RUN-0006 | contributor |
| RUN-0002 | RUN-0004 | RUN-0002 | contributor |
| RUN-0003 | RUN-0003 | RUN-0003 | observer |
| RUN-0004 | RUN-0005 | RUN-0002 | owner |
| RUN-0005 | RUN-0001 | RUN-0007 | contributor |
| RUN-0006 | RUN-0003 | RUN-0007 | observer |
| RUN-0007 | RUN-0004 | RUN-0007 | owner |
| RUN-0008 | RUN-0003 | RUN-0003 | contributor |

Equivalence relationships capture the semantic mappings between entities that serve similar functions across different systems or contexts. The equivalence intersection table records pairs of equivalent items—such as `telemetry_stream_alpha` and `ml_model_checkpoint`, or `governance_policy_set` and `sensor_node_array`—alongside related items like `storage_volume` and `inference_dataset`, and their corresponding related pairs. These mappings are essential for data integration, schema evolution, and cross-domain governance. When `ml_feature_vector` is declared equivalent to `ml_model_checkpoint` with `centrifuge_tube` and `pressure_transducer` as related items, the framework can automatically propagate access policies, reconcile duplicate records, and maintain consistent metadata across systems that use different naming conventions or data models.