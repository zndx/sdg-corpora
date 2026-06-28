---
chapter_id: ch_live_subclass_to_independent_continuant_d2ef55
topic_id: 97
family: 01_foundation
cited_terms: ['subclass_to_independent_continuant', 'belief_interval_equiv_bel_and_pl', 'column_distinctness']
model: engine-refine
---

In the governance of relational data models, the entity serves as the fundamental unit of observability, anchored by a unique identifier that ensures referential integrity across disparate subsystems. These identifiers, typically structured with domain-specific prefixes such as `CONT-0001` for infrastructure continuants or `BEL-0001` for belief intervals, function as the immutable keys that bind metadata to their respective subjects. Whether tracking a physical asset like `Server Rack 14A` or an abstract measurement such as `signal_attenuation`, the identifier provides the necessary semantic grounding for downstream compliance audits and operational telemetry.

**t_subclass_to_independent_continuant**

| id | independent |
| --- | --- |
| CONT-0001 | Audit Log Stream 5 |
| CONT-0002 | Audit Log Stream 5 |
| CONT-0003 | Firewall Appliance 7 |
| CONT-0004 | Server Rack 14A |
| CONT-0005 | Sensor Node 7B |
| CONT-0006 | Server Rack 14A |

**t_subclass_to_independent_continuant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | on-prem-dc1 |
| CONT-0002 | CONT-0001 | CONT-0002 | Name 02 |
| CONT-0003 | CONT-0001 | CONT-0003 | sre |
| CONT-0004 | CONT-0001 | CONT-0004 | Tags 04 |
| CONT-0005 | CONT-0002 | CONT-0001 | us-east-1 |
| CONT-0006 | CONT-0002 | CONT-0002 | Name 06 |
| CONT-0007 | CONT-0002 | CONT-0003 | sre |
| CONT-0008 | CONT-0002 | CONT-0004 | Tags 08 |

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | DIST-0003 | ground_truth_marker |
| BEL-0002 | thermal_runaway | DIST-0002 | non_contradictory_set |
| BEL-0003 | latency_spike | DIST-0002 | direct_observation_7 |
| BEL-0004 | sensor_drift | DIST-0005 | secondary_sensor_read |
| BEL-0005 | thermal_runaway | DIST-0003 | ground_truth_marker |
| BEL-0006 | calibration_failure | DIST-0003 | extended_telemetry |
| BEL-0007 | data_corruption | DIST-0008 | secondary_sensor_read |
| BEL-0008 | packet_loss | DIST-0006 | tentative_marker |

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

Associated with each entity is a schema of attributes, defined by an attribute name and a strictly enforced attribute type that dictates the permissible value space. This type system bridges the gap between human-readable metadata and machine-parsable constraints, utilizing standard XML Schema definitions like `xsd:string` for free-form text, `xsd:decimal` for quantitative metrics, and `xsd:dateTime` for temporal stamps. In specialized ontologies, custom types such as `cco:Person` may be employed to enforce domain-specific validation rules, ensuring that fields like `owner` or `method` adhere to organizational standards before data ingestion.

**t_column_distinctness_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0004 | 2024-02-16T07:35:25 |
| DIST-0002 | DIST-0002 | DIST-0004 | 2024-11-18T03:00:42 |
| DIST-0003 | DIST-0003 | DIST-0004 | 2024-09-01T19:05:24 |
| DIST-0004 | DIST-0004 | DIST-0004 | 2023-12-18T13:12:41 |
| DIST-0005 | DIST-0005 | DIST-0004 | 2023-08-26T16:30:42 |
| DIST-0006 | DIST-0006 | DIST-0004 | 2024-12-26T12:24:58 |
| DIST-0007 | DIST-0007 | DIST-0004 | 2024-03-15T16:54:27 |
| DIST-0008 | DIST-0008 | DIST-0004 | 2024-09-07T18:06:58 |

**t_column_distinctness_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0001 | 0.415 |
| DIST-0002 | DIST-0001 | DIST-0005 | 195.19 |
| DIST-0003 | DIST-0001 | DIST-0007 | 910.18 |
| DIST-0004 | DIST-0002 | DIST-0001 | 0.481 |
| DIST-0005 | DIST-0002 | DIST-0005 | 493.27 |
| DIST-0006 | DIST-0002 | DIST-0007 | 836.73 |
| DIST-0007 | DIST-0003 | DIST-0001 | 0.447 |
| DIST-0008 | DIST-0003 | DIST-0005 | 842.78 |

The actual values assigned to these attributes are materialized in type-specific value stores, linked back to their parent entities and attributes through precise foreign key relationships. A single entity, such as the `Audit Log Stream 5` identified by `CONT-0001`, may simultaneously host a `location` value of `on-prem-dc1` and an `owner` designation of `sre`, each retrieved from its respective categorical bucket. Similarly, belief intervals like `BEL-0001` require the aggregation of heterogeneous data points—combining a `confidence` score of `0.034` with a `recorded_at` timestamp of `2025-01-05T17:59:26`—to construct a complete, multi-dimensional record of the observed phenomenon.

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

Beyond basic descriptive metadata, the attribute framework supports complex analytical constructs, such as distinctness ratios used to evaluate column variance within sample batches. For instance, the `sample_batch` column might be assigned a distinctness ratio of `0.415`, accompanied by a `dimension_kind` of `Dimension Kind 01` and an `encoding` specification of `Encoding 02`. This flexibility extends to internationalized data, where attribute values can capture linguistic variations—such as `es` or `ja`—ensuring that the governance model remains agnostic to the underlying cultural or regional context of the ingested information.

**t_column_distinctness**

| id | column | distinctness_ratio |
| --- | --- | --- |
| DIST-0001 | sample_batch | BEL-0007 |
| DIST-0002 | device_serial | BEL-0003 |
| DIST-0003 | protocol_version | BEL-0002 |
| DIST-0004 | log_sequence | BEL-0006 |
| DIST-0005 | specimen_code | BEL-0005 |
| DIST-0006 | telemetry_node | BEL-0007 |
| DIST-0007 | run_identifier | BEL-0001 |
| DIST-0008 | sample_batch | BEL-0006 |

**t_column_distinctness_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIST-0001 | confidence | xsd:decimal |
| DIST-0002 | dimension_kind | xsd:string |
| DIST-0003 | method | xsd:string |
| DIST-0004 | recorded_at | xsd:dateTime |
| DIST-0005 | uncertainty | xsd:decimal |
| DIST-0006 | unit | xsd:string |
| DIST-0007 | value | xsd:decimal |
| DIST-0008 | encoding | xsd:string |

**t_column_distinctness_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0002 | Dimension Kind 01 |
| DIST-0002 | DIST-0001 | DIST-0008 | Encoding 02 |
| DIST-0003 | DIST-0001 | DIST-0009 | intake form |
| DIST-0004 | DIST-0001 | DIST-0010 | ja |
| DIST-0005 | DIST-0001 | DIST-0003 | automated |
| DIST-0006 | DIST-0001 | DIST-0006 | deg_C |
| DIST-0007 | DIST-0002 | DIST-0002 | Dimension Kind 07 |
| DIST-0008 | DIST-0002 | DIST-0008 | Encoding 08 |

Ultimately, the rigorous separation of identifiers, attributes, types, and values establishes a robust foundation for data lineage and quality assurance. By decoupling the structural definition of an entity from its dynamic value assignments, the system allows for the continuous evolution of metadata schemas without disrupting historical records. Whether tracking the `thermal_runaway` of a sensor or the `protocol_version` of a network device, this architecture guarantees that every data point remains traceable, typed, and verifiable against the established governance framework.

**t_subclass_to_independent_continuant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | location | xsd:string |
| CONT-0002 | name | xsd:string |
| CONT-0003 | owner | cco:Person |
| CONT-0004 | tags | xsd:string |