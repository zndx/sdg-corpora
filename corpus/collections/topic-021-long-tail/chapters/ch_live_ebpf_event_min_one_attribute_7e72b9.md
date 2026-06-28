---
chapter_id: ch_live_ebpf_event_min_one_attribute_7e72b9
topic_id: 21
family: 02_observation_measurement
cited_terms: ['ebpf_event_min_one_attribute', 'column_tag_subclass', 'flood_defence_condition_characterisation']
model: engine-refine
---

An attribute serves as a named property bound to a specific data type, and the attribute type constrains the domain of permissible values to a well-defined schema namespace. Within the attribute registry, identifiers such as ATTR-0001 through ATTR-0004 anchor individual definitions, each carrying an attr_name—duration_seconds, end_time, exit_code, host_name—and an attr_type drawn from the XSD vocabulary: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. This separation of declaration from instantiation allows a single attribute definition to be referenced across multiple entities and value stores without duplication of metadata. The attr type is not merely a label; it determines which value table receives the instantiated data, ensuring that a decimal value of 2938.76 is stored alongside an xsd:decimal-typed attribute while a timestamp such as 2024-05-05T15:51:23 is routed to the datetime store, and a string like node-b14 or Log Level 02 lands in the varchar repository.

**t_ebpf_event_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

The entity is the principal subject to which attribute values are affixed, and it appears as the entity_id column in every value table, linking a concrete observation back to its defining attribute. An entity such as ATTR-0001 may carry a decimal value of 2938.76 on its duration_seconds attribute, a datetime value of 2024-05-05T15:51:23 on end_time, and a string value of node-b14 on host_name—all simultaneously, all retrievable through the shared entity identifier. This design permits an entity to accumulate heterogeneous properties without requiring a fixed schema; new attributes can be introduced by registering them in the attribute definition table and then populating the corresponding value table, with the entity_id serving as the join key. The identifier itself, whether formatted as ATTR-0001 for an event attribute or TAG-0001 for a column tag, provides a stable, machine-readable handle that survives across value migrations and schema evolutions.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | perf_event_sample |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tc_ingress_filter |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | tracepoint_sched_switch |
| ATTR-0006 | lsm_bpf_attach |

**t_ebpf_event_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-05-05T15:51:23 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2023-02-23T16:05:24 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2023-10-25T19:35:09 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-08-09T05:49:50 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2025-04-07T23:06:46 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2023-01-30T19:25:12 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2023-12-02T01:15:04 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2023-01-06T05:08:04 |

**t_ebpf_event_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 2938.76 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3337.03 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 6550.82 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 5328.03 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 811.82 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 7052.31 |

**t_ebpf_event_min_one_attribute_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 465 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 59 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 938 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 81 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 9 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 492 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 120 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 470 |

**t_ebpf_event_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | node-b14 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | pending |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | edge-03 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | closeout |

**t_column_tag_subclass**

| id | column | annotates_column |
| --- | --- | --- |
| TAG-0001 | user_id | ATTR-0001 |
| TAG-0002 | log_level | ATTR-0003 |
| TAG-0003 | patient_id | ATTR-0006 |
| TAG-0004 | sensor_reading | ATTR-0006 |
| TAG-0005 | throughput_mb | ATTR-0005 |
| TAG-0006 | sensor_reading | ATTR-0006 |
| TAG-0007 | region_code | ATTR-0003 |

**t_column_tag_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0004 | 2023-08-03T19:45:29 |
| TAG-0002 | TAG-0002 | TAG-0004 | 2025-03-24T11:46:10 |
| TAG-0003 | TAG-0003 | TAG-0004 | 2025-05-22T05:44:38 |
| TAG-0004 | TAG-0004 | TAG-0004 | 2025-01-14T19:12:47 |
| TAG-0005 | TAG-0005 | TAG-0004 | 2024-02-24T06:52:57 |
| TAG-0006 | TAG-0006 | TAG-0004 | 2024-10-16T08:04:03 |
| TAG-0007 | TAG-0007 | TAG-0004 | 2025-02-04T08:16:45 |

**t_column_tag_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0001 | 0.376 |
| TAG-0002 | TAG-0001 | TAG-0005 | 922.76 |
| TAG-0003 | TAG-0001 | TAG-0007 | 942.47 |
| TAG-0004 | TAG-0002 | TAG-0001 | 0.809 |
| TAG-0005 | TAG-0002 | TAG-0005 | 398.44 |
| TAG-0006 | TAG-0002 | TAG-0007 | 718.52 |
| TAG-0007 | TAG-0003 | TAG-0001 | 0.172 |
| TAG-0008 | TAG-0003 | TAG-0005 | 254.23 |

The misc column in each value table is the generic carrier for the actual data, typed implicitly by the table it inhabits rather than by an explicit type discriminator. In the decimal store, misc holds 2938.76, 3337.03, 6550.82, and 5328.03; in the integer store, it carries 465, 59, 938, and 81; in the varchar store, it contains node-b14, Log Level 02, initiation, and pending. This multi-table value architecture avoids the overhead of nullable columns and type-checking at query time, at the cost of requiring the application to know which value table to consult based on the attribute's declared type. The attr_id column in each value table completes the triad—entity, attribute, value—ensuring that a value can be traced back to both the entity it describes and the attribute definition that governs its semantics.

**t_column_tag_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0002 | Dimension Kind 01 |
| TAG-0002 | TAG-0001 | TAG-0008 | Encoding 02 |
| TAG-0003 | TAG-0001 | TAG-0009 | intake form |
| TAG-0004 | TAG-0001 | TAG-0010 | en |
| TAG-0005 | TAG-0001 | TAG-0003 | automated |
| TAG-0006 | TAG-0001 | TAG-0006 | m/s |
| TAG-0007 | TAG-0002 | TAG-0002 | Dimension Kind 07 |
| TAG-0008 | TAG-0002 | TAG-0008 | Encoding 08 |

Beyond event-level attributes, the system supports column-level tagging through the t_column_tag_subclass hierarchy, where a tag such as TAG-0001 annotates a column like user_id and carries its own set of attributes—confidence, dimension_kind, method, recorded_at—each with its own type and value store. The tag attributes follow the same pattern: a confidence of 0.376 or 0.809 is stored as xsd:decimal, a dimension_kind of Dimension Kind 01 as xsd:string, and a recorded_at timestamp of 2023-08-03T19:45:29 as xsd:dateTime. This parallel structure allows metadata about data elements to be treated with the same rigor as the data elements themselves, enabling traceability from a column's values back to the provenance and quality assessments attached to it.

**t_column_tag_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAG-0001 | confidence | xsd:decimal |
| TAG-0002 | dimension_kind | xsd:string |
| TAG-0003 | method | xsd:string |
| TAG-0004 | recorded_at | xsd:dateTime |
| TAG-0005 | uncertainty | xsd:decimal |
| TAG-0006 | unit | xsd:string |
| TAG-0007 | value | xsd:decimal |
| TAG-0008 | encoding | xsd:string |

In the domain of flood defence assessment, the t_flood_defence_condition_characterisation table links a characterisation method to the earth observation data it employs and the validation process it undergoes. A characterisation such as ExpertReviewPanel may involve CopernicusDEM as its earth observation data source and be validated through HistoricalBaselineMatch, while GroundTruthSampling pairs with Sentinel1GRD and GroundTruthSampling as its validation method. CrossSensorCalibration and UncertaintyPropagated both reference LiDARBathymetry, with the latter validated against the SeineBreach2016 event. This triadic relationship—characterisation, earth observation data, validation process—encodes the methodological provenance of each assessment, making it possible to audit which satellite or sensor data underpins a given condition evaluation and which validation protocol was applied to confirm its accuracy.

**t_flood_defence_condition_characterisation**

| id | flood_defence_condition_characterisation | involves_earth_observation_data | employs_validation_process |
| --- | --- | --- | --- |
| CHAR-0001 | ExpertReviewPanel | CopernicusDEM | HistoricalBaselineMatch |
| CHAR-0002 | GroundTruthSampling | Sentinel1GRD | GroundTruthSampling |
| CHAR-0003 | CrossSensorCalibration | LiDARBathymetry | SeineBreach2016 |
| CHAR-0004 | UncertaintyPropagated | LiDARBathymetry | SeineBreach2016 |
| CHAR-0005 | VeniceTide2019 | RADARSAT2 | CrossSensorCalibration |