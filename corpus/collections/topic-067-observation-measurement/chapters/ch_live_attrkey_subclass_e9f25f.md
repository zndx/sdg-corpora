---
chapter_id: ch_live_attrkey_subclass_e9f25f
topic_id: 67
family: 01_foundation
cited_terms: ['attrkey_subclass', 'measurement_with_op_artifact', 'labrun_basic']
model: engine-refine
---

Attributes, their types, and the entities they qualify form the foundational vocabulary of any system that must track provenance, enforce governance, and support auditability across heterogeneous data sources. An attribute is not merely a column but a named property with an explicit type and a declared scope; the attribute key catalogue establishes this vocabulary by binding identifiers such as ATTR-0001 through ATTR-0004 to semantic keys like lot_number, batch_id, operator_code, and voltage_read, each of which describes a concrete property—ambient_temperature, production_batch, or equipment_calibration—and is governed by a namespace (governance or telemetry) that signals its regulatory provenance. The format column further constrains how values are serialized: CSV for tabular exchange, UUID for globally unique identifiers, and E.164 for international telephone numbering, ensuring that downstream consumers can parse and validate data without schema discovery.

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

**t_measurement_with_op_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

Entities serve as the anchor points to which attributes attach, and the system distinguishes between measurement artifacts and laboratory runs as two principal entity classes. A measurement artifact—identified by ARTI-0001, ARTI-0002, and so forth—represents a specific instrument or sensor deployment, such as the Seismic Calibration Unit or the Turbidity Index, and is always about a target object: a Network Switch Port, a Reactor Fuel Rod, or a Drone Battery Pack. A laboratory run—LABR-0001 through LABR-0004—captures discrete experimental executions like Microplate_Scan_9A, MassSpec_Triplicate, ELISA_Screen_4B, or PCR_Amplification, each carrying its own attribute set. The separation of entity definitions from their attributes enables a single entity to accumulate a rich, evolving profile without schema migration, as new attributes are declared independently of any existing value rows.

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Seismic Calibration Unit | Network Switch Port |
| ARTI-0002 | Seismic Calibration Unit | Reactor Fuel Rod |
| ARTI-0003 | Turbidity Index | Network Switch Port |
| ARTI-0004 | Seismic Calibration Unit | Drone Battery Pack |
| ARTI-0005 | pH Batch Alpha Assay | Soil Core B |
| ARTI-0006 | Soil Moisture Profile | Drone Battery Pack |

**t_measurement_with_op_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-07-05T11:56:13 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-04-19T15:36:13 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-08-09T17:12:55 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2023-08-07T05:21:09 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2024-01-27T15:32:18 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2024-09-24T04:37:52 |

**t_measurement_with_op_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.340 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 723.57 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 106.04 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.434 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 258.77 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 846.45 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.917 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 397.02 |

**t_measurement_with_op_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | change rationale |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | m/s |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Attribute types enforce semantic discipline at the point of value insertion. The measurement artifact attribute catalogue declares confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime, while the laboratory run catalogue defines duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. These XML Schema types are not decorative; they determine which value table receives the data and how it is validated. Decimal values such as 0.340, 723.57, 106.04, or 1438.98 flow into the decimal value store; datetime values like 2024-07-05T11:56:13, 2023-02-28T02:17:46, or 2025-01-01T00:58:28 into the datetime store; integer values such as 918, 57, 674, or 220 into the integer store; and string values including Dimension Kind 01, Encoding 02, change rationale, fr, edge-03, Log Level 02, execution, or complete into the varchar store. The attr_id column in each value table references the attribute definition, while entity_id ties the value to its owning entity, creating a tripartite join that reconstructs the full attribute-value pair at query time.

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

The namespace column in the attribute key table provides the highest-level organizational principle, partitioning attributes into governance and telemetry domains. Governance attributes—lot_number, batch_id, operator_code—carry regulatory weight: they identify production batches, trace operator actions, and support compliance audits. Telemetry attributes—voltage_read and similar sensor measurements—serve operational monitoring and diagnostic purposes. This namespace distinction is not merely taxonomic; it drives access control, retention policy, and data quality expectations. A governance attribute describing ambient_temperature with format UUID demands different handling than a telemetry attribute describing equipment_calibration with format E.164, even though both may appear on the same measurement artifact or laboratory run. The system's ability to enforce these distinctions at the schema level, rather than through application logic, is what makes the model both extensible and auditable.