---
chapter_id: ch_live_dengue_transmission_process_336ab8
topic_id: 4
family: 08_derived
cited_terms: ['dengue_transmission_process', 'nist80053_moderate_impact', 'equiv_intersect_with_two_restrictions']
model: engine-refine
---

Within the surveillance and compliance tracking architecture, every record is anchored by a unique identifier that serves as the primary key across both fact and dimension tables. The central fact table, `fact_dengue`, captures discrete epidemiological events, each assigned an identifier such as `PROC-0001` or `PROC-0002`. These identifiers are not merely labels; they form the join keys that connect event-level observations to their corresponding host and vector classifications. Each fact row carries an `event_count` field that quantifies the volume of occurrences associated with that record, ranging from 56 events in one observation to 444 in another, providing the numerical foundation for risk scoring and resource allocation. The fact table also stores foreign keys to the host and vector dimensions—`involves_host_key` and `involves_vector_key` respectively—ensuring that every event is traceable to the biological entities and transmission pathways involved. For instance, the record identified as `PROC-0002` references host key `PROC-0002` and vector key `PROC-0002`, while `PROC-0004` links to host key `PROC-0002` and vector key `PROC-0003`, illustrating how a single host classification can participate across multiple event records.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

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

The host and vector dimensions supply the categorical and descriptive context that transforms raw identifiers into actionable intelligence. The `dim_involves_host` table assigns each host key a human-readable label—such as `Involves Host Label 01` through `Involves Host Label 04`—alongside a `involves_host_category` classification like `Involves Host Category 01` or `Involves Host Category 03`. These category fields are critical for grouping and filtering events by host type, whether that be human populations, animal reservoirs, or environmental vectors. Similarly, `dim_involves_vector` provides `involves_vector_label` entries (e.g., `Involves Vector Label 01` through `Involves Vector Label 04`) and `involves_vector_category` values such as `Involves Vector Category 02` or `Involves Vector Category 04`. The misc fields—the labels—serve as display and reporting attributes, while the category fields drive analytical aggregation and compliance mapping. Together, these dimension tables ensure that the fact table's foreign keys resolve into meaningful, auditable classifications rather than opaque references.

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |

At the governance layer, the relationship between NIST 800-53 control families and impact levels is mediated through a junction table that explicitly models the subject-to-target mapping with an assigned role. The table `t_nist80053_moderate_impact__at_n_i_s_t_impact_level` contains a `subject` column (`nist_id`) that references the NIST control framework records—values such as `IMPA-0002`, `IMPA-0006`, and `IMPA-0007`—and a `target` column (`at_n_i_s_t_impact_level_id`) that points to the corresponding impact level definitions, including `IMPA-0007`, `IMPA-0004`, and `IMPA-0001`. The `role` column in this junction table specifies the nature of the relationship between subject and target, taking values such as `observer`, `contributor`, and `owner`. This tripartite structure—subject, target, and role—enables fine-grained compliance attribution, allowing auditors to determine which NIST controls are merely observed versus actively owned at a given impact threshold. The impact level dimension itself, `t_nist80053_moderate_impact_at_n_i_s_t_impact_level`, provides the descriptive context for these targets, with values like `Moderate Threshold`, `System Security Moderate`, `Impact Level Moderate`, and `Moderate Baseline` defining the severity band against which controls are evaluated.

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |

The integration of these tables forms a complete audit trail from individual epidemiological events through to regulatory compliance posture. An event identified as `PROC-0001` in the fact table carries an `event_count` of 251 and resolves through its foreign keys to a specific host category and vector category in the dimension tables. That same event, when assessed against the NIST moderate impact framework, maps through the junction table to a subject control and a target impact level under a defined role. This layered model—fact, dimension, and junction—ensures that every data point is simultaneously operational, categorical, and compliant, supporting both real-time surveillance analysis and retrospective regulatory reporting without requiring data duplication or manual reconciliation.