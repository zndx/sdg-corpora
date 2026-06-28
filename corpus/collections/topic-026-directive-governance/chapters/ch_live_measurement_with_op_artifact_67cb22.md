---
chapter_id: ch_live_measurement_with_op_artifact_67cb22
topic_id: 26
family: 02_observation_measurement
cited_terms: ['measurement_with_op_artifact', 'measurement_with_precision', 'measurement_with_unit']
model: engine-refine
---

Measurements in this framework are anchored by a unique identifier—such as `ARTI-0001` or `PREC-0001`—that serves as the primary key for every record, ensuring each observation can be referenced unambiguously across the system. A measurement carries a human-readable label, like "Core Temp Log" or "Ozone concentration," and is associated with a target entity, which might be a "Network Switch Port," "Reactor Fuel Rod," or "Drone Battery Pack." This separation between the measurement itself and the entity it describes allows the same measurement type to be recorded against multiple physical or logical objects without duplication. The identifier is the immutable handle by which all downstream relationships—attribute assignments, value storage, precision declarations, and unit associations—are resolved.

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Core Temp Log | Network Switch Port |
| ARTI-0002 | CPU temperature | Reactor Fuel Rod |
| ARTI-0003 | voltage drop | Network Switch Port |
| ARTI-0004 | Core Temp Log | Drone Battery Pack |
| ARTI-0005 | Glucose level | Soil Core B |
| ARTI-0006 | Network latency | Drone Battery Pack |

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

**t_measurement_with_precision**

| id | measurement |
| --- | --- |
| PREC-0001 | Ozone concentration |
| PREC-0002 | Ozone concentration |
| PREC-0003 | Core Temp Log |
| PREC-0004 | Ozone concentration |
| PREC-0005 | Network latency |
| PREC-0006 | Latency Trace |
| PREC-0007 | GPS accuracy |
| PREC-0008 | Network latency |

**t_measurement_with_precision_precision**

| id | precision |
| --- | --- |
| PREC-0001 | ±10 ppm |
| PREC-0002 | 1 sigma |
| PREC-0003 | 10 µs |
| PREC-0004 | 0.001 K |
| PREC-0005 | ±0.2% FS |
| PREC-0006 | 0.1 dB |
| PREC-0007 | 32-bit |
| PREC-0008 | 0.001 K |

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Seismic magnitude |
| UNIT-0002 | Latency Trace |
| UNIT-0003 | Latency Trace |
| UNIT-0004 | GPS accuracy |
| UNIT-0005 | GPS accuracy |
| UNIT-0006 | Ozone concentration |
| UNIT-0007 | disk IOPS |
| UNIT-0008 | Battery voltage |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

Attributes provide the metadata layer that enriches each measurement with contextual properties. The attribute registry defines named properties such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to a specific data type from the XSD namespace. A `confidence` value is typed as `xsd:decimal`, a `dimension_kind` as `xsd:string`, and a `recorded_at` timestamp as `xsd:dateTime`. This type discipline is enforced at the storage layer by partitioning values into type-specific tables: decimal values like `0.340` or `723.57` reside in the decimal value store, string values such as "Dimension Kind 01" or "change rationale" in the varchar store, and datetime values like `2024-07-05T11:56:13` in the datetime store. Each value record links back to its parent entity through an `entity_id` foreign key and to its attribute definition through an `attr_id` foreign key, creating a normalized many-to-many relationship that supports arbitrary attribute cardinality per measurement.

Precision and unit information follow a parallel three-table pattern that decouples definition from association. Precision definitions—such as "±10 ppm," "1 sigma," "10 µs," or "0.001 K"—are stored in their own table and linked to measurements through a junction table that carries a `role` qualifier. The role distinguishes the nature of the association: a precision or unit may be designated as `owner`, `contributor`, `reviewer`, or `observer`. In the precision linkage table, the `measurement_id` column (the subject) references the measurement being qualified, while the `precision_id` column (the target) references the precision definition being applied. The same structural pattern governs unit associations, where units like "milligrams per deciliter," "Richter scale," "milliseconds," or "beats per minute" are linked to measurements with role-based semantics. This design permits a single measurement to carry multiple precision or unit annotations, each with a distinct governance role, supporting scenarios where a reading might have a primary unit of record alongside secondary reference units contributed by different parties.

**t_measurement_with_precision__precision**

| id | measurement_id | precision_id | role |
| --- | --- | --- | --- |
| PREC-0001 | PREC-0003 | PREC-0008 | contributor |
| PREC-0002 | PREC-0008 | PREC-0007 | reviewer |
| PREC-0003 | PREC-0004 | PREC-0007 | owner |
| PREC-0004 | PREC-0007 | PREC-0001 | reviewer |
| PREC-0005 | PREC-0005 | PREC-0006 | observer |
| PREC-0006 | PREC-0007 | PREC-0007 | reviewer |
| PREC-0007 | PREC-0001 | PREC-0008 | contributor |
| PREC-0008 | PREC-0008 | PREC-0002 | reviewer |

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |