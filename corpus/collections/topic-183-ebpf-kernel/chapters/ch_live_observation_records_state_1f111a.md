---
chapter_id: ch_live_observation_records_state_1f111a
topic_id: 183
family: 02_observation_measurement
cited_terms: ['observation_records_state', 'equiv_intersect_with_two_restrictions', 'requirement_subclass']
model: engine-refine
---

Observation records serve as the foundational entities in the monitoring framework, each identified by a unique key such as `STAT-0001` and associated with a descriptive observation like "Network latency spike" or "Reactor pressure threshold" alongside a supporting record type such as "Event log manifest" or "Sensor data packet." These records capture discrete events or conditions requiring tracking, and they function as the anchor points around which all attribute metadata and measured values are organized. The observation field conveys the nature of the monitored phenomenon, while the records field indicates the provenance or format of the underlying data source, establishing a clear audit trail from raw event to structured analysis.

Attributes define the measurable or descriptive dimensions of each observation, with their names—such as `duration_seconds`, `end_time`, `exit_code`, and `host_name`—paired with strict XSD type declarations including `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. This type discipline is enforced through a value-normalization strategy that partitions stored data across four dedicated tables: `t_observation_records_state_val_datetime` for temporal values like `2023-08-02T17:44:58`, `t_observation_records_state_val_decimal` for numeric measurements such as `4243.13` or `5274.11`, `t_observation_records_state_val_int` for integer quantities like `958` or `41`, and `t_observation_records_state_val_varchar` for free-text entries including `worker-07`, `Log Level 02`, `execution`, and `pending`. Each value row links back to its parent observation through an `entity_id` foreign key and to its attribute definition through an `attr_id` foreign key, creating a star-like schema where the observation record sits at the center and attribute values radiate outward, type-specific but semantically unified.

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | Event log manifest |
| STAT-0002 | Water quality anomaly | Event log manifest |
| STAT-0003 | Reactor pressure threshold | Sensor data packet |
| STAT-0004 | Reactor pressure threshold | Diagnostic trace file |
| STAT-0005 | Network latency spike | Observation index cache |
| STAT-0006 | pH deviation alert | Sensor data packet |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

The identifier system operates at two levels: the observation-level keys (`STAT-0001` through `STAT-0004`) that uniquely identify each monitored event, and the attribute-level keys that uniquely identify each attribute definition across the schema. This dual-key architecture allows a single observation to carry multiple attributes of different types without schema modification. For instance, observation `STAT-0001` ("Network latency spike") carries a decimal value of `4243.13` for attribute `STAT-0001`, a datetime value of `2023-08-02T17:44:58` for attribute `STAT-0002`, an integer value of `958` for attribute `STAT-0003`, and a varchar value of `worker-07` for attribute `STAT-0004`, all while remaining a single coherent record. The `entity_id` column in each value table explicitly references the observation record, ensuring that attribute values are always traceable to their originating event.

Requirement subclasses introduce governance constraints that apply to equivalence intersections, each defined by a requirement name such as "Event Deduplication Protocol" or "Data Retention Policy," a specification of which equivalence intersection it governs (e.g., `REST-0007` or `REST-0002`), a scope designation of `local`, `team`, or `global`, and a language code of `de`, `es`, `fr`, or `ja`. The scope field determines the organizational reach of the requirement—whether it applies to a single deployment, a team-wide operation, or a globally distributed system—while the language field indicates the linguistic context for compliance documentation or enforcement. The `specifies` column creates a foreign-key relationship to the equivalence intersection table, where pairs of related entities such as `telemetry_stream_alpha` and `ml_model_checkpoint` are linked through restriction identifiers like `REST-0001` or `REST-0003`, and further connected to downstream resources such as `REQU-0004` or `REQU-0006` and their associated assets like `inference_dataset`, `backup_volume`, `pressure_transducer`, and `sensor_node_array`. This structure enables requirements to be scoped and localized while maintaining a clear lineage from high-level policy to the specific data intersections and resources they govern.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | REQU-0004 | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | REQU-0003 | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | REQU-0006 | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | REQU-0006 | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | REQU-0004 | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | REQU-0004 | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | REQU-0005 | inference_dataset |

**t_requirement_subclass**

| id | requirement | specifies | scope | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | Event Deduplication Protocol | REST-0007 | local | de |
| REQU-0002 | Data Retention Policy | REST-0002 | team | es |
| REQU-0003 | Data Retention Policy | REST-0004 | local | fr |
| REQU-0004 | Metadata Tagging Mandate | REST-0005 | global | ja |
| REQU-0005 | PII Encryption Standard | REST-0005 | team | fr |
| REQU-0006 | Schema Validation Rule | REST-0003 | regional | en |