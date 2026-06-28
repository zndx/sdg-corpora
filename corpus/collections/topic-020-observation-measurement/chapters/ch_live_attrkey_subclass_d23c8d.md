---
chapter_id: ch_live_attrkey_subclass_d23c8d
topic_id: 20
family: 01_foundation
cited_terms: ['attrkey_subclass', 'port_isolation_measurement', 'column_tag_at_confidence']
model: engine-refine
---

Port isolation measurements serve as the central entities in this data model, each uniquely identified by an identifier such as MEAS-0001 or MEAS-0002 and described by a human-readable name like Antenna_1_and_2 or Switch_Network_P6. Every measurement records which port pair it evaluates—RF_Switch_3_4, Coaxial_Outlet_B, or Fiber_Port_M_N—and specifies its dependency on an impedance termination, with values ranging from Depends On Impedance Termination 01 through Depends On Impedance Termination 04. This structure ensures that each measurement is traceable to both the physical configuration under test and the termination conditions required for valid results, establishing a complete chain of measurement provenance.

**t_port_isolation_measurement**

| id | port_isolation_measurement | measures_port_isolation | depends_on_impedance_termination |
| --- | --- | --- | --- |
| MEAS-0001 | Antenna_1_and_2 | RF_Switch_3_4 | Depends On Impedance Termination 01 |
| MEAS-0002 | Switch_Network_P6 | Coaxial_Outlet_B | Depends On Impedance Termination 02 |
| MEAS-0003 | Balun_Prim_Sec | Fiber_Port_M_N | Depends On Impedance Termination 03 |
| MEAS-0004 | Coaxial_Outlet_B | Switch_Network_P6 | Depends On Impedance Termination 04 |
| MEAS-0005 | SMA_Port_A4 | Microstrip_Line_C | Depends On Impedance Termination 05 |
| MEAS-0006 | Balun_Secondary | SMA_Port_A4 | Depends On Impedance Termination 06 |
| MEAS-0007 | Optical_Coupler_1 | PCB_Trace_X_Y | Depends On Impedance Termination 07 |
| MEAS-0008 | Filter_Input_2 | Antenna_1_and_2 | Depends On Impedance Termination 08 |

**t_port_isolation_measurement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | encoding | xsd:string |
| MEAS-0002 | label_text | xsd:string |
| MEAS-0003 | language | xsd:string |

Attribute definitions are catalogued in a separate subclass table where each entry carries an identifier like ATTR-0001, an attrkey such as lot_number or batch_id, and a describes_property field indicating the characteristic being captured—ambient_temperature, production_batch, or equipment_calibration. The format column specifies the encoding standard for the attribute value, with examples including CSV, UUID, and E.164, while the namespace field partitions attributes into logical domains like governance and telemetry. This separation of attribute schema from measurement instances enables a flexible, extensible metadata framework where new attribute types can be introduced without modifying the measurement records themselves.

**t_attrkey_subclass**

| id | attrkey | describes_property | format | namespace |
| --- | --- | --- | --- | --- |
| ATTR-0001 | lot_number | ambient_temperature | CSV | governance |
| ATTR-0002 | batch_id | ambient_temperature | UUID | governance |
| ATTR-0003 | operator_code | production_batch | UUID | telemetry |
| ATTR-0004 | voltage_read | equipment_calibration | E.164 | telemetry |
| ATTR-0005 | flow_rate | equipment_calibration | E.164 | governance |
| ATTR-0006 | lot_number | data_integrity_status | CSV | governance |
| ATTR-0007 | ambient_temp | electrical_voltage | JSON | catalog |

**t_column_tag_at_confidence**

| id | column | tag_confidence |
| --- | --- | --- |
| CONF-0001 | instrument_serial | 0.99 |
| CONF-0002 | audit_log_id | 0.99 |
| CONF-0003 | calibration_date | 0.72 |
| CONF-0004 | instrument_serial | 0.81 |
| CONF-0005 | geospatial_ref | verified |
| CONF-0006 | sample_volume_ml | 0.99 |

**t_column_tag_at_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |

The attribute-value relationship is realized through an entity-attr-value pattern that decouples schema from data. Each attribute definition—identified by its own id and named through attr_name fields like encoding, label_text, or language—specifies an attr_type drawn from the XSD vocabulary, with xsd:string appearing consistently across measurement attributes. Values are stored in type-specific tables: varchar values such as Encoding 01, nightly summary, or en populate the varchar value store, while decimal values like 0.375 and 699.80, and datetime values such as 2024-04-09T22:04:24 and 2025-04-05T07:15:37, reside in their respective typed stores. The entity_id column in each value table links back to the measurement identifier, and the attr_id column references the attribute definition, creating a normalized many-to-many relationship between measurements and their typed attribute values.

**t_port_isolation_measurement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | Encoding 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0002 | nightly summary |
| MEAS-0003 | MEAS-0001 | MEAS-0003 | en |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | Encoding 04 |
| MEAS-0005 | MEAS-0002 | MEAS-0002 | pre-release note |
| MEAS-0006 | MEAS-0002 | MEAS-0003 | de |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | Encoding 07 |
| MEAS-0008 | MEAS-0003 | MEAS-0002 | nightly summary |

**t_column_tag_at_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2024-04-09T22:04:24 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2025-04-05T07:15:37 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-17T15:47:25 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2024-06-11T23:21:15 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-11-28T13:45:04 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-05-23T02:47:56 |

**t_column_tag_at_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.375 |
| CONF-0002 | CONF-0001 | CONF-0005 | 699.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 906.58 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.359 |
| CONF-0005 | CONF-0002 | CONF-0005 | 525.15 |
| CONF-0006 | CONF-0002 | CONF-0007 | 158.80 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.944 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.61 |

**t_column_tag_at_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | nightly summary |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | automated |
| CONF-0006 | CONF-0001 | CONF-0006 | kg |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

Confidence scoring for column-level data quality follows an identical architectural pattern, with records identified by CONF-0001 through CONF-0004 and associated with columns such as instrument_serial, audit_log_id, and calibration_date. The tag_confidence column holds decimal scores ranging from 0.72 to 0.99, reflecting varying degrees of certainty in the column classification. Additional attributes enrich each confidence record: dimension_kind values like Dimension Kind 01, encoding references such as Encoding 02, descriptive labels including nightly summary, and locale indicators like fr are stored as varchar values, while a recorded_at attribute captures the timestamp of each assessment in xsd:dateTime format, with entries spanning from 2023-12-17T15:47:25 through 2025-04-05T07:15:37. This parallel structure ensures that confidence metadata is as rigorously typed and traceable as the measurement data it evaluates.