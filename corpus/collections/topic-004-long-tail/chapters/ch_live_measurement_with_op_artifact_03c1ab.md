---
chapter_id: ch_live_measurement_with_op_artifact_03c1ab
topic_id: 4
family: 02_observation_measurement
cited_terms: ['measurement_with_op_artifact', 'evidence_with_mass_function', 'attribute_set_max_attrs']
model: engine-refine
---

Attributes serve as the fundamental metadata layer that annotates every measured entity with structured properties, each defined by a name and a strict type constraint. The attribute schema enforces type discipline through XML Schema Datatypes—`xsd:decimal` for numerical confidence scores like 0.340 and 723.57, `xsd:string` for categorical descriptors such as "Dimension Kind 01" and "Encoding 02", and `xsd:dateTime` for temporal stamps like 2024-07-05T11:56:13. This type-aware design ensures that downstream consumers can reliably parse and validate attribute values without schema discovery at query time. The attribute definitions themselves—confidence, dimension_kind, method, recorded_at—form a reusable vocabulary that spans multiple measurement contexts, from seismic calibration units assessed against network switch ports to turbidity indices measured on reactor fuel rods.

**t_attribute_set_max_attrs_attr**

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

The dimension kind column classifies the physical or logical quantity being measured, anchoring abstract measurements to a domain taxonomy. In the evidence registry, dimension kinds such as pressure, temperature, and mass provide the categorical frame within which mass functions operate—Gaussian distributions, calibration curves, and normalized weight vectors are all contextualized by the dimension they describe. This classification is not merely descriptive; it governs how evidence is aggregated and how mass functions are interpreted. A Gaussian distribution assigned to a temperature dimension carries different semantic weight than the same distribution applied to a mass dimension, and the dimension kind column makes this distinction explicit and queryable.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | Gaussian distribution | pressure | automated |
| FUNC-0002 | calibration certificate | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | signal capture data | Gaussian distribution | mass | hybrid |
| FUNC-0005 | system event record | posterior distribution | length | automated |

Entities represent the concrete subjects of measurement—the artifacts, instruments, or systems under observation—each identified by a stable identifier that serves as the primary key across all value tables. An identifier such as ARTI-0001 functions as the central pivot: it appears in the measurement registry as the subject of a Seismic Calibration Unit assessment, in the entity column of every value table to associate attribute values with their owner, and in the attr_id foreign key to link back to the attribute definition. This identifier-based join model means that all attribute values—whether decimal, datetime, or varchar—are resolved to their entity through a single, consistent reference point, eliminating ambiguity in multi-attribute queries.

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Seismic Calibration Unit | Network Switch Port |
| ARTI-0002 | Seismic Calibration Unit | Reactor Fuel Rod |
| ARTI-0003 | Turbidity Index | Network Switch Port |
| ARTI-0004 | Seismic Calibration Unit | Drone Battery Pack |
| ARTI-0005 | pH Batch Alpha Assay | Soil Core B |
| ARTI-0006 | Soil Moisture Profile | Drone Battery Pack |

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

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

The method column captures the provenance of each measurement or evidence record, distinguishing between automated acquisition, inferred computation, and hybrid approaches that combine both. In the evidence table, methods range from automated signal capture to inferred telemetry dumps, with the method field providing an auditable trail for data quality assessments. This provenance metadata is critical in compliance contexts where the chain of custody for measurement data must be demonstrable; knowing that a calibration certificate was obtained through an automated method versus an inferred one directly impacts its evidentiary weight.

Value storage is partitioned by data type across dedicated tables—decimal values in t_measurement_with_op_artifact_val_decimal, datetime values in t_measurement_with_op_artifact_val_datetime, and string values in t_measurement_with_op_artifact_val_varchar—each maintaining the same four-column structure of id, entity_id, attr_id, and value. This type-partitioned design avoids the null proliferation of wide-table approaches while preserving type safety at the storage layer. The attr_id column in each value table references the attribute definition, creating a three-way join path from entity through attribute definition to the typed value, a pattern that repeats identically across the attribute set tables (ATTR-0001 through ATTR-0004) with their own parallel value stores. The misc column, which holds the actual value, is the terminal node in this join chain and carries the domain-specific data—whether a confidence score of 0.687, a recorded_at timestamp of 2024-07-05T18:39:47, or an audit excerpt tagged with locale code de.