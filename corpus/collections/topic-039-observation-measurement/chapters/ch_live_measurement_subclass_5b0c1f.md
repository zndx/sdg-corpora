---
chapter_id: ch_live_measurement_subclass_5b0c1f
topic_id: 39
family: 02_observation_measurement
cited_terms: ['measurement_subclass', 'belief_interval_exactly_two_bounds', 'outlier_claim_min_one_attribute']
model: engine-refine
---

ATTRIBUTES, ATTRIBUTE TYPES, ENTITIES, IDENTIFIERS, MISC, ROLE, SUBJECT, AND TARGET constitute the foundational vocabulary of the schema’s entity-attribute-value architecture. At the core of this design lies the identifier, a unique key that anchors every record across all tables; identifiers such as MEAS-0001, BOUN-0003, and ATTR-0002 serve as the immutable reference points by which measurement subclasses, belief intervals, and outlier claims are distinguished and cross-referenced. The attribute itself—recorded in columns labeled attr_name—captures the semantic property being measured or described, whether that be confidence, dimension_kind, method, or recorded_at. Each attribute is typed according to an XSD schema: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal stamps. For instance, the attribute recorded_at carries values such as 2023-09-29T17:50:45 and 2025-03-24T15:12:01, anchoring outlier claims like count_mismatch_feedA and telemetry_gap_night to specific moments in the data lifecycle.

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |

**t_outlier_claim_min_one_attribute**

| id | outlier | attribute_set |
| --- | --- | --- |
| ATTR-0001 | count_mismatch_feedA | schema_constraints |
| ATTR-0002 | log_checksum_fail | sampling_windows |
| ATTR-0003 | telemetry_gap_night | alert_policies |
| ATTR-0004 | voltage_sag_event | provenance_tags |
| ATTR-0005 | telemetry_gap_night | sampling_windows |
| ATTR-0006 | throughput_drop_zone3 | sampling_windows |

**t_outlier_claim_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_outlier_claim_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2023-09-29T17:50:45 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2023-11-30T14:55:48 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2024-10-03T15:06:44 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-24T15:12:01 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2025-03-04T01:17:47 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-12-29T13:19:15 |

**t_outlier_claim_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.179 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 145.76 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 830.74 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.034 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 316.10 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 304.68 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.373 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 478.83 |

**t_outlier_claim_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | calibration record |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | m/s |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

The entity column designates the subject of an attribute assignment, establishing which record the attribute value pertains to. In the outlier claim tables, entity identifiers such as ATTR-0001 and ATTR-0002 appear repeatedly, indicating that a single outlier claim—say, log_checksum_fail or voltage_sag_event—may carry multiple attributes drawn from different attribute sets including schema_constraints, sampling_windows, alert_policies, and provenance_tags. This many-to-many relationship between entities and attributes is resolved through the misc column, which serves as the value container for heterogeneous data types. Decimal values like 0.179 and 145.76 populate the misc column alongside string values such as Dimension Kind 01, Encoding 02, calibration record, and de, demonstrating the schema’s capacity to store diverse attribute values without requiring dedicated columns for each type.

Subject and target columns define the relational topology between entities, forming the backbone of the schema’s join architecture. In the measurement subclass dimension mapping, the subject column (measurement_id) references a measurement such as MEAS-0004, while the target column (dimension_id) points to a dimension like MEAS-0003 or MEAS-0005. This pattern recurs in the belief interval lower bound mapping, where belief_id (subject) connects to belief_lower_bound_id (target), linking belief intervals such as battery charge decay and reactor core temperature estimate to their respective lower bounds—78.9 pct, 22.4 dBm, 0.001, and 15.0 kPa. The role column completes this triad by specifying the nature of the relationship: owner, reviewer, observer, or contributor. A single measurement may assume the role of owner when linked to one dimension and reviewer when linked to another, reflecting the multiplicity of relationships that any given entity can participate in.

**t_belief_interval_exactly_two_bounds__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0006 | BOUN-0004 | observer |
| BOUN-0002 | BOUN-0003 | BOUN-0001 | reviewer |
| BOUN-0003 | BOUN-0002 | BOUN-0004 | reviewer |
| BOUN-0004 | BOUN-0001 | BOUN-0002 | contributor |
| BOUN-0005 | BOUN-0001 | BOUN-0001 | reviewer |
| BOUN-0006 | BOUN-0003 | BOUN-0004 | observer |
| BOUN-0007 | BOUN-0001 | BOUN-0004 | reviewer |
| BOUN-0008 | BOUN-0005 | BOUN-0002 | observer |

The practical implications of this design become evident when examining how measurement subclasses and their associated dimensions interlock. The measurement Heart rate maps to the dimension Electric current, while Seismic magnitude maps to Power, and Soil moisture appears in two distinct dimensional contexts—Energy and Mass—each mediated through the junction table t_measurement_subclass__dimension. Similarly, belief intervals such as turbine vibration threshold and blood glucose trend are connected to their lower bounds through the junction table t_belief_interval_exactly_two_bounds__belief_lower_bound, where the role column distinguishes between reviewer and contributor relationships. This separation of relationship metadata from the entities themselves ensures that the schema remains extensible: new roles can be introduced without altering the underlying entity tables, and new attributes can be added to any entity without restructuring the schema.

**t_belief_interval_exactly_two_bounds**

| id | belief |
| --- | --- |
| BOUN-0001 | battery charge decay |
| BOUN-0002 | turbine vibration threshold |
| BOUN-0003 | blood glucose trend |
| BOUN-0004 | reactor core temperature estimate |
| BOUN-0005 | filter clog probability |
| BOUN-0006 | turbine vibration threshold |

**t_belief_interval_exactly_two_bounds_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| BOUN-0001 | 78.9 pct |
| BOUN-0002 | 22.4 dBm |
| BOUN-0003 | 0.001 |
| BOUN-0004 | 15.0 kPa |
| BOUN-0005 | 78.9 pct |
| BOUN-0006 | 78.9 pct |