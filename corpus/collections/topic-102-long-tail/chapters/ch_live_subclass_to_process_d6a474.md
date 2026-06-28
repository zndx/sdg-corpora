---
chapter_id: ch_live_subclass_to_process_d6a474
topic_id: 102
family: 01_foundation
cited_terms: ['subclass_to_process', 'belief_interval_equiv_bel_and_pl', 'outlier_claim_subclass']
model: engine-refine
---

The governance of operational telemetry and analytical claims rests on a disciplined separation between identifiers, entities, and their attributes. Every process, belief interval, and outlier claim receives a stable identifier—`PROC-0001` through `PROC-0004` for processes such as incident response, data validation, telemetry aggregation, and batch ingestion; `BEL-0001` through `BEL-0004` for belief intervals covering signal attenuation, thermal runaway, latency spike, and sensor drift; and `CLAI-0001` through `CLAI-0004` for outlier claims including Network_Bandwidth_Spike, Patient_Vital_Anomaly, and Log_Flood_Event. These identifiers serve as the immutable anchor points across the data model, ensuring that every attribute value, every relational link, and every audit trail can be traced back to a single, unambiguous entity. The entity itself is the operational or analytical object under governance—a process executing within a production environment, a belief interval quantifying uncertainty around a sensor anomaly, or an outlier claim asserting that a particular deviation warrants investigation.

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | PROC-0005 | ground_truth_marker |
| BEL-0002 | thermal_runaway | PROC-0004 | non_contradictory_set |
| BEL-0003 | latency_spike | PROC-0002 | direct_observation_7 |
| BEL-0004 | sensor_drift | PROC-0001 | secondary_sensor_read |
| BEL-0005 | thermal_runaway | PROC-0001 | ground_truth_marker |
| BEL-0006 | calibration_failure | PROC-0001 | extended_telemetry |
| BEL-0007 | data_corruption | PROC-0006 | secondary_sensor_read |
| BEL-0008 | packet_loss | PROC-0006 | tentative_marker |

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

Attributes and their types provide the schema by which entities are described, measured, and compared. Each entity carries a defined set of attributes, and each attribute is bound to a strict type—`xsd:decimal` for numeric measures such as duration_seconds (values ranging from 2715.88 to 6532.76 across process instances), `xsd:dateTime` for temporal markers like end_time (2024-02-25T00:58:35 through 2025-01-11T16:52:13), `xsd:integer` for discrete codes such as exit_code (684, 195, 63, 361), and `xsd:string` for categorical or free-text fields including host_name (worker-07), log level descriptors (Log Level 02), status indicators (closeout, pending), and methodological labels (Dimension Kind 01, Encoding 02, intake form, es). This type discipline is not merely a data-quality convenience; it is a compliance control. By constraining attribute values to their declared types, the system prevents type confusion between, say, a confidence score of 0.034 and a dimensional metric of 388.43, both of which reside within belief intervals but serve fundamentally different analytical purposes.

Attribute values are stored in type-specific value tables, each keyed by a composite of identifier, entity reference, and attribute reference. The decimal values table captures duration_seconds for process entities PROC-0001 through PROC-0004, with magnitudes of 5106.96, 6532.76, 6219.83, and 2715.88 respectively—figures that quantify the temporal footprint of each process invocation. The integer values table records exit codes and similar discrete measures, while the varchar values table holds string-valued attributes such as host identifiers and status codes. The datetime values table anchors temporal attributes to precise ISO 8601 timestamps, and the belief interval variant tables similarly store confidence scores (0.034, 0.503), dimensional metrics (388.43, 756.27), and categorical metadata. This normalization by type ensures that queries, validations, and audit checks can operate on homogeneous value sets without cross-type contamination.

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

**t_belief_interval_equiv_bel_and_pl_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BEL-0001 | confidence | xsd:decimal |
| BEL-0002 | dimension_kind | xsd:string |
| BEL-0003 | method | xsd:string |
| BEL-0004 | recorded_at | xsd:dateTime |
| BEL-0005 | uncertainty | xsd:decimal |
| BEL-0006 | unit | xsd:string |
| BEL-0007 | value | xsd:decimal |
| BEL-0008 | encoding | xsd:string |

**t_belief_interval_equiv_bel_and_pl_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0004 | 2025-01-05T17:59:26 |
| BEL-0002 | BEL-0002 | BEL-0004 | 2024-10-14T22:53:55 |
| BEL-0003 | BEL-0003 | BEL-0004 | 2023-07-18T12:12:54 |
| BEL-0004 | BEL-0004 | BEL-0004 | 2023-03-22T01:52:23 |
| BEL-0005 | BEL-0005 | BEL-0004 | 2025-03-12T03:35:20 |
| BEL-0006 | BEL-0006 | BEL-0004 | 2025-06-14T01:50:46 |
| BEL-0007 | BEL-0007 | BEL-0004 | 2023-03-18T15:47:07 |
| BEL-0008 | BEL-0008 | BEL-0004 | 2023-02-26T17:53:54 |

**t_belief_interval_equiv_bel_and_pl_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0001 | 0.034 |
| BEL-0002 | BEL-0001 | BEL-0005 | 388.43 |
| BEL-0003 | BEL-0001 | BEL-0007 | 756.27 |
| BEL-0004 | BEL-0002 | BEL-0001 | 0.503 |
| BEL-0005 | BEL-0002 | BEL-0005 | 930.65 |
| BEL-0006 | BEL-0002 | BEL-0007 | 513.67 |
| BEL-0007 | BEL-0003 | BEL-0001 | 0.478 |
| BEL-0008 | BEL-0003 | BEL-0005 | 619.21 |

**t_belief_interval_equiv_bel_and_pl_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0002 | Dimension Kind 01 |
| BEL-0002 | BEL-0001 | BEL-0008 | Encoding 02 |
| BEL-0003 | BEL-0001 | BEL-0009 | intake form |
| BEL-0004 | BEL-0001 | BEL-0010 | es |
| BEL-0005 | BEL-0001 | BEL-0003 | hybrid |
| BEL-0006 | BEL-0001 | BEL-0006 | deg_C |
| BEL-0007 | BEL-0002 | BEL-0002 | Dimension Kind 07 |
| BEL-0008 | BEL-0002 | BEL-0008 | Encoding 08 |

The relational fabric of the model is expressed through the subject-target-role triad, which governs how entities relate to one another beyond simple attribute-value associations. In the outlier claim domain, the junction table `t_outlier_claim_subclass__explains_anomaly_in` establishes directed relationships between outlier claims and the operational contexts they explain. An outlier claim such as CLAI-0001 (Network_Bandwidth_Spike) may serve as the subject in a relationship where it explains an anomaly within CLAI-0005 or CLAI-0006, with the role field specifying whether the claim acts as reviewer, owner, or observer. Similarly, CLAI-0002 (Patient_Vital_Anomaly) functions as both subject and target in relationships contextualized within Automotive_Test_Drive, while CLAI-0003 and CLAI-0004 map to Power_Grid_Substation and Financial_Trading_Queue respectively. The role field is the critical differentiator: it encodes the nature of the relationship, distinguishing between entities that assert a claim (owner), those that evaluate it (reviewer), and those that monitor its propagation (observer). This tripartite structure enables fine-grained governance of claim hierarchies, ensuring that every explanatory link carries an explicit, auditable role assignment.

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |