---
chapter_id: ch_live_lift_basic_90de2a
topic_id: 2
family: 02_observation_measurement
cited_terms: ['lift_basic', 'policy_only_for_high_impact', 'equiv_intersect_with_two_restrictions']
model: engine-refine
---

NIST impact level classification anchors how organizations tier information assets according to the potential harm that loss of confidentiality, integrity, or availability would impose on organizational operations, assets, or individuals. In governed data environments, each impact level receives a stable identifier—such as IMPA-0002 or IMPA-0004—and a human-readable label paired with a categorical grouping that situates the tier within a broader compliance taxonomy. Where IMPA-0002 maps to At N I S T Impact Level Label 02 under At N I S T Impact Level Category 02, and IMPA-0004 maps to Label 04 under Category 04, the dimension table supplies the semantic vocabulary that downstream policy engines consume; auditors and data stewards reference these labels when scoping control baselines, retention obligations, and access boundaries rather than interpreting opaque surrogate keys in isolation.

Policy facts bind each classified asset or control obligation to its governing impact tier through the at_n_i_s_t_impact_level foreign key, then layer operational parameters that translate classification into cadence and precedence. Two policies keyed to IMPA-0002 carry priorities of 3 and review cycles of 710 and 866 days respectively, signaling that assets at that tier demand recurring reassessment on a multi-year horizon while remaining subordinate to higher-urgency obligations such as the IMPA-0004 policy at priority 5 with a 950-day review window. A separate policy at IMPA-0006 with priority 2 and a 258-day cycle illustrates how lower-numbered priority values can denote more immediate governance attention even when the underlying impact label differs; stewards use priority to sequence remediation queues and review_cycle_days to schedule attestations, recertifications, and evidence refreshes without conflating severity of impact with timeliness of oversight.

**fact_policy**

| id | at_n_i_s_t_impact_level_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | 2 | 258 |
| IMPA-0002 | IMPA-0002 | 3 | 710 |
| IMPA-0003 | IMPA-0002 | 3 | 866 |
| IMPA-0004 | IMPA-0004 | 5 | 950 |
| IMPA-0005 | IMPA-0001 | 1 | 305 |
| IMPA-0006 | IMPA-0002 | 2 | 729 |

Entity and identifier discipline extends the same governance model to operational records whose physical or logical identity must remain unambiguous across attribute stores. A vertical transport asset registered as LIFT-0001 and designated Observatory Lift, or LIFT-0002 as Freight Service Lift, exemplifies how the entity key persists as the join anchor while descriptive names serve human workflows. Attributes declared under stable attr identifiers—confidence typed as xsd:decimal, dimension_kind and method as xsd:string, recorded_at as xsd:dateTime—establish a contract between producers and consumers of metadata: attr names encode semantic intent and attr_type enforces validation, storage routing, and query behavior so that a confidence reading of 0.624 for LIFT-0001 cannot be persisted in a string bucket nor coerced into a datetime field without triggering schema enforcement.

**t_lift_basic**

| id | lift |
| --- | --- |
| LIFT-0001 | Observatory Lift |
| LIFT-0002 | Freight Service Lift |
| LIFT-0003 | Freight Service Lift |
| LIFT-0004 | Observatory Lift |
| LIFT-0005 | Observatory Lift |
| LIFT-0006 | Cargo Bay Lift |
| LIFT-0007 | Cargo Bay Lift |

**t_lift_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |

Typed value relations materialize those contracts by pairing each entity_id with an attr_id and depositing the measured or asserted quantity in a misc value column appropriate to the declared type. Decimal facts attach quantitative measures such as 93.24 and 541.29 to LIFT-0001 alongside a separate confidence of 0.175 recorded against LIFT-0002, while varchar rows capture qualitative miscellany including Dimension Kind 01, Encoding 02, a change rationale string, and locale shorthand de. Datetime misc values uniformly reference the recorded_at attribute—2024-06-13T06:43:09 for LIFT-0001, 2024-12-03T09:28:05 for LIFT-0002—establishing provenance timestamps that compliance reviewers treat as evidence boundaries when reconstructing who knew what and when. The separation of entity, attr, and misc value into distinct relations prevents type pollution and preserves referential integrity when attribute definitions evolve independently of instance data.

Category, in the NIST impact dimension, functions as the coarser stratification above individual labels, enabling rollup reporting and control inheritance without collapsing distinct tiers. Policies referencing IMPA-0002 and IMPA-0004 therefore inherit not only label-specific semantics but also the categorical posture—Category 02 versus Category 04—that determines which control families, monitoring thresholds, and exception paths apply by default. Where intersection constraints govern equivalences among restricted object classes—telemetry_stream_alpha related to storage_volume and inference_dataset, or ml_feature_vector linked to centrifuge_tube and pressure_transducer through paired equiv and related keys—governance architects verify that assets classified at a given impact level do not traverse forbidden equivalence paths. Such restrictions operationalize the principle that impact classification is not merely descriptive metadata but an enforceable boundary on how identifiers, attributes, and miscellaneous payload values may flow between entity classes.

**dim_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level_label | at_n_i_s_t_impact_level_category |
| --- | --- | --- |
| IMPA-0001 | At N I S T Impact Level Label 01 | At N I S T Impact Level Category 01 |
| IMPA-0002 | At N I S T Impact Level Label 02 | At N I S T Impact Level Category 02 |
| IMPA-0003 | At N I S T Impact Level Label 03 | At N I S T Impact Level Category 03 |
| IMPA-0004 | At N I S T Impact Level Label 04 | At N I S T Impact Level Category 04 |
| IMPA-0005 | At N I S T Impact Level Label 05 | At N I S T Impact Level Category 05 |
| IMPA-0006 | At N I S T Impact Level Label 06 | At N I S T Impact Level Category 06 |
| IMPA-0007 | At N I S T Impact Level Label 07 | At N I S T Impact Level Category 07 |
| IMPA-0008 | At N I S T Impact Level Label 08 | At N I S T Impact Level Category 08 |

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

In practice, reviewers synthesize impact level, category, priority, and review_cycle_days when approving data-handling procedures, while engineers implement attr_type-aware ingestion pipelines that honor entity identifiers across decimal, varchar, and datetime stores. A freight service lift and an observatory lift may share attribute names yet carry different confidence scores, dimension encodings, and recorded_at stamps, and their governing policies may differ in priority and reassessment interval even when categorized under adjacent NIST tiers. The coherence of the overall framework depends on treating identifier stability, typed attributes, categorical impact grouping, and policy cadence as mutually reinforcing controls: impact level states the consequence model, category supplies organizational grouping, priority orders response, review_cycle_days schedules evidence renewal, and entity-attr-value structure ensures that every miscellaneous datum remains traceable to a classified asset subject to those obligations.

**t_lift_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2024-06-13T06:43:09 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-12-03T09:28:05 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-01-28T22:31:03 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2024-06-11T06:27:27 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-13T18:59:00 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2023-02-07T19:19:23 |
| LIFT-0007 | LIFT-0007 | LIFT-0004 | 2023-12-22T04:56:51 |

**t_lift_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.624 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 93.24 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 541.29 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.175 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 180.41 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 256.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.866 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 594.06 |

**t_lift_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | change rationale |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | de |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |