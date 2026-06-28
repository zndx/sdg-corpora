---
chapter_id: ch_live_measurement_basic_794757
topic_id: 20
family: 02_observation_measurement
cited_terms: ['measurement_basic', 'measurement_equiv_with_dim_unit', 'measurement_max_one_value']
model: engine-refine
---

Attributes serve as the extensible metadata layer that annotates measurement entities with contextual properties, each property declared with a precise type constraint. The attribute registry defines named properties—such as `confidence`, `dimension_kind`, `method`, and `recorded_at`—and binds each to an XSD type, constraining permissible values to `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. This type discipline propagates into the value storage layer, where the system partitions attribute values into three dedicated tables according to their declared type. Decimal-valued attributes like `confidence` are persisted in the decimal value table, where entries such as `0.231` and `407.80` are recorded against their owning measurement entity and attribute identifier. String-valued attributes occupy the varchar value table, carrying values ranging from `Dimension Kind 01` and `Encoding 02` through `calibration record` and the locale code `es`. Datetime attributes are stored separately, with timestamps such as `2024-05-15T18:00:29` and `2024-04-18T18:40:50` anchoring the temporal provenance of each measurement. The entity identifier in each value row establishes the ownership relationship, while the attribute identifier resolves to the attribute definition, forming a normalized triple of entity, attribute, and typed value.

**t_measurement_basic**

| id | measurement |
| --- | --- |
| MEAS-0001 | Blood Glucose |
| MEAS-0002 | Battery Voltage |
| MEAS-0003 | Air particulate |
| MEAS-0004 | CPU Utilization |
| MEAS-0005 | Core temperature |
| MEAS-0006 | api_response_time |
| MEAS-0007 | Soil Moisture |

**t_measurement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | confidence | xsd:decimal |
| MEAS-0002 | dimension_kind | xsd:string |
| MEAS-0003 | method | xsd:string |
| MEAS-0004 | recorded_at | xsd:dateTime |
| MEAS-0005 | uncertainty | xsd:decimal |
| MEAS-0006 | unit | xsd:string |
| MEAS-0007 | value | xsd:decimal |
| MEAS-0008 | encoding | xsd:string |

**t_measurement_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0004 | 2024-05-15T18:00:29 |
| MEAS-0002 | MEAS-0002 | MEAS-0004 | 2024-04-18T18:40:50 |
| MEAS-0003 | MEAS-0003 | MEAS-0004 | 2023-06-19T08:04:37 |
| MEAS-0004 | MEAS-0004 | MEAS-0004 | 2024-12-12T18:49:55 |
| MEAS-0005 | MEAS-0005 | MEAS-0004 | 2024-07-10T05:51:16 |
| MEAS-0006 | MEAS-0006 | MEAS-0004 | 2023-05-22T02:44:37 |
| MEAS-0007 | MEAS-0007 | MEAS-0004 | 2023-01-22T19:04:55 |

**t_measurement_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | 0.231 |
| MEAS-0002 | MEAS-0001 | MEAS-0005 | 407.80 |
| MEAS-0003 | MEAS-0001 | MEAS-0007 | 947.91 |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | 0.117 |
| MEAS-0005 | MEAS-0002 | MEAS-0005 | 521.52 |
| MEAS-0006 | MEAS-0002 | MEAS-0007 | 399.99 |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | 0.530 |
| MEAS-0008 | MEAS-0003 | MEAS-0005 | 792.36 |

**t_measurement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0002 | Dimension Kind 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0008 | Encoding 02 |
| MEAS-0003 | MEAS-0001 | MEAS-0009 | calibration record |
| MEAS-0004 | MEAS-0001 | MEAS-0010 | es |
| MEAS-0005 | MEAS-0001 | MEAS-0003 | automated |
| MEAS-0006 | MEAS-0001 | MEAS-0006 | ms |
| MEAS-0007 | MEAS-0002 | MEAS-0002 | Dimension Kind 07 |
| MEAS-0008 | MEAS-0002 | MEAS-0008 | Encoding 08 |

**t_measurement_max_one_value**

| id | measurement |
| --- | --- |
| VALU-0001 | Wind Speed |
| VALU-0002 | bandwidth_utilization |
| VALU-0003 | Disk Throughput |
| VALU-0004 | bandwidth_utilization |
| VALU-0005 | motor_rpm |
| VALU-0006 | Disk Throughput |
| VALU-0007 | Reactor Temperature |

**t_measurement_max_one_value_numeric_value**

| id | numeric_value |
| --- | --- |
| VALU-0001 | 98.6 |
| VALU-0002 | 120.5 |
| VALU-0003 | 98.6 |
| VALU-0004 | 0.042 |
| VALU-0005 | 0.042 |
| VALU-0006 | 0.85 |

The measurement entity itself is the primary subject of annotation, identified by a stable identifier such as `MEAS-0001` through `MEAS-0004`, each associated with a human-readable measurement name—`Blood Glucose`, `Battery Voltage`, `Air particulate`, `CPU Utilization`. These identifiers function as the foreign key through which all attribute values, dimensional associations, and unit bindings are resolved. The entity identifier thus serves as the central join point across the value tables, the dimension linkage table, and the unit linkage table, ensuring referential integrity throughout the model. Where a measurement admits multiple attributes, each attribute value is independently addressed by its own row in the appropriate value table, with the entity identifier providing the common anchor.

**t_measurement_equiv_with_dim_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Wind Speed |
| UNIT-0002 | Heart rate |
| UNIT-0003 | CPU Utilization |
| UNIT-0004 | Core temperature |
| UNIT-0005 | Air Quality Index |
| UNIT-0006 | soil_moisture |
| UNIT-0007 | Soil pH |

**t_measurement_equiv_with_dim_unit_dimension**

| id | dimension |
| --- | --- |
| UNIT-0001 | temporal_interval |
| UNIT-0002 | test_phase |
| UNIT-0003 | firmware_version |
| UNIT-0004 | test_phase |
| UNIT-0005 | sampling_rate |
| UNIT-0006 | device_class |

**t_measurement_equiv_with_dim_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | microseconds |
| UNIT-0002 | terabytes |
| UNIT-0003 | milligrams_per_deciliter |
| UNIT-0004 | percent_volume |
| UNIT-0005 | cells_per_microliter |
| UNIT-0006 | microseconds |
| UNIT-0007 | microseconds |
| UNIT-0008 | milligrams_per_deciliter |

Beyond attribute annotation, the model supports the association of measurements with dimensions and units through explicit relationship tables that encode both the linkage and its semantic role. The dimension linkage table connects a measurement subject to a dimension target via a foreign key pair, with the `role` column specifying the nature of the association—`reviewer`, `owner`, or `observer`. For instance, measurement `UNIT-0002` (Heart rate) is linked to dimension `UNIT-0001` (temporal_interval) with the role `reviewer`, while measurement `UNIT-0001` (Wind Speed) is linked to dimension `UNIT-0002` (test_phase) with the role `observer`. This role-based association model permits a single measurement to participate in multiple dimensional relationships, each distinguished by its role and target dimension.

The unit linkage table follows an analogous pattern, binding measurements to units through a subject-target foreign key pair augmented by a `role` and a `cardinality_note`. The unit registry defines units such as `microseconds`, `terabytes`, `milligrams_per_deciliter`, and `percent_volume`, each identified by a stable unit identifier. The linkage table records associations like the binding of measurement `UNIT-0001` to unit `UNIT-0001` with role `owner` and cardinality note `Cardinality Note 01`, or the binding of measurement `UNIT-0004` to unit `UNIT-0003` with role `reviewer` and cardinality note `Cardinality Note 03`. The cardinality note column provides additional constraint metadata, documenting whether the association is singular, plural, or subject to other multiplicity rules. This dual-layer of role and cardinality metadata enables precise governance over how measurements relate to their dimensional and unit contexts.

**t_measurement_equiv_with_dim_unit__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0002 | UNIT-0001 | reviewer |
| UNIT-0002 | UNIT-0006 | UNIT-0006 | owner |
| UNIT-0003 | UNIT-0001 | UNIT-0002 | observer |
| UNIT-0004 | UNIT-0004 | UNIT-0003 | owner |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | owner |
| UNIT-0006 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0007 | UNIT-0006 | UNIT-0004 | owner |
| UNIT-0008 | UNIT-0001 | UNIT-0006 | reviewer |

**t_measurement_equiv_with_dim_unit__unit**

| id | measurement_id | unit_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | owner | Cardinality Note 01 |
| UNIT-0002 | UNIT-0006 | UNIT-0008 | owner | Cardinality Note 02 |
| UNIT-0003 | UNIT-0004 | UNIT-0003 | reviewer | Cardinality Note 03 |
| UNIT-0004 | UNIT-0002 | UNIT-0007 | reviewer | Cardinality Note 04 |
| UNIT-0005 | UNIT-0002 | UNIT-0008 | contributor | Cardinality Note 05 |
| UNIT-0006 | UNIT-0004 | UNIT-0004 | reviewer | Cardinality Note 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0005 | contributor | Cardinality Note 07 |
| UNIT-0008 | UNIT-0003 | UNIT-0003 | reviewer | Cardinality Note 08 |

A parallel structure governs measurements constrained to a single numeric value. The max-one-value measurement table identifies measurements such as `Wind Speed`, `bandwidth_utilization`, and `Disk Throughput`, each of which admits at most one numeric value. The numeric value table stores the actual values—`98.6`, `120.5`, `0.042`—while the linkage table connects measurement subjects to their numeric value targets through role annotations. Measurement `VALU-0005` is linked to numeric value `VALU-0001` with role `contributor`, and measurement `VALU-0002` is linked to numeric value `VALU-0003` with role `observer`. This separation of the value from the measurement entity preserves the same normalization principles applied to attribute values, while the cardinality constraint is enforced at the application level rather than through the schema structure.

**t_measurement_max_one_value__numeric_value**

| id | measurement_id | numeric_value_id | role |
| --- | --- | --- | --- |
| VALU-0001 | VALU-0005 | VALU-0001 | reviewer |
| VALU-0002 | VALU-0002 | VALU-0003 | observer |
| VALU-0003 | VALU-0005 | VALU-0005 | contributor |
| VALU-0004 | VALU-0003 | VALU-0001 | observer |
| VALU-0005 | VALU-0007 | VALU-0005 | owner |
| VALU-0006 | VALU-0004 | VALU-0005 | observer |
| VALU-0007 | VALU-0003 | VALU-0006 | contributor |
| VALU-0008 | VALU-0002 | VALU-0006 | owner |