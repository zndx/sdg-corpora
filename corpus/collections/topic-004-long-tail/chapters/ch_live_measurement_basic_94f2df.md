---
chapter_id: ch_live_measurement_basic_94f2df
topic_id: 4
family: 02_observation_measurement
cited_terms: ['measurement_basic', 'mass_function_assigns_to_subset', 'summary_metric_subclass']
model: engine-refine
---

In a normalized data architecture, the distinction between an entity and its attributes forms the backbone of flexible, type-safe information modeling. An entity—such as a measurement identified by `MEAS-0001` or a summary metric identified by `METR-0001`—represents a discrete, addressable thing in the domain. Each entity carries a unique identifier, a stable key that enables unambiguous reference across the system. The measurement `MEAS-0001` corresponds to an Air Quality Index reading, while `METR-0001` represents a `network_bandwidth_rollup` derived from underlying measurements. Entities are not monolithic; they decompose into attributes, each of which captures a specific dimension of the entity's state or metadata. The attribute definition itself is a first-class construct: it carries an `attr_name` such as `confidence`, `dimension_kind`, or `checksum`, and an `attr_type` that constrains the permissible value domain. Types follow established schemas—`xsd:decimal` for numeric precision, `xsd:dateTime` for temporal stamps, `xsd:string` for free-form text, and `xsd:date` for calendar dates—ensuring that every value stored against an attribute is semantically coherent and machine-processable.

**t_measurement_basic**

| id | measurement |
| --- | --- |
| MEAS-0001 | Air Quality Index |
| MEAS-0002 | Disk Throughput |
| MEAS-0003 | Water pH Level |
| MEAS-0004 | Air Quality Index |
| MEAS-0005 | Network Latency |
| MEAS-0006 | Air Quality Index |
| MEAS-0007 | Disk Throughput |

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

**t_summary_metric_subclass**

| id | summary | metric_kind |
| --- | --- | --- |
| METR-0001 | network_bandwidth_rollup | MEAS-0003 |
| METR-0002 | network_bandwidth_rollup | MEAS-0006 |
| METR-0003 | batch_job_completion_rate | MEAS-0002 |
| METR-0004 | error_rate_dashboard | MEAS-0003 |
| METR-0005 | resource_utilization_snapshot | MEAS-0003 |
| METR-0006 | storage_io_throughput | MEAS-0001 |
| METR-0007 | system_uptime_window | MEAS-0006 |

**t_summary_metric_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| METR-0001 | checksum | xsd:string |
| METR-0002 | created_date | xsd:date |
| METR-0003 | identifier | cco:DesignativeICE |
| METR-0004 | license | xsd:string |
| METR-0005 | mime_type | xsd:string |
| METR-0006 | size_bytes | xsd:long |
| METR-0007 | uri | xsd:string |
| METR-0008 | version | xsd:integer |

**t_summary_metric_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0002 | 2023-11-11 |
| METR-0002 | METR-0002 | METR-0002 | 2024-08-19 |
| METR-0003 | METR-0003 | METR-0002 | 2023-07-21 |
| METR-0004 | METR-0004 | METR-0002 | 2023-02-24 |
| METR-0005 | METR-0005 | METR-0002 | 2024-01-28 |
| METR-0006 | METR-0006 | METR-0002 | 2025-06-08 |
| METR-0007 | METR-0007 | METR-0002 | 2023-06-04 |

**t_summary_metric_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0006 | 23 |
| METR-0002 | METR-0001 | METR-0008 | 7 |
| METR-0003 | METR-0002 | METR-0006 | 245 |
| METR-0004 | METR-0002 | METR-0008 | 1 |
| METR-0005 | METR-0003 | METR-0006 | 376 |
| METR-0006 | METR-0003 | METR-0008 | 2 |
| METR-0007 | METR-0004 | METR-0006 | 195 |
| METR-0008 | METR-0004 | METR-0008 | 7 |

The Entity-Attribute-Value (EAV) pattern operationalizes this decomposition by separating attribute definitions from their concrete values, routing values into type-specific storage tables to preserve data integrity. For a given entity, its attributes are resolved by joining the entity identifier to the attribute definition table, then to the appropriate value table based on `attr_type`. The decimal attribute `confidence` for entity `MEAS-0001` resolves to the value `0.231` in the decimal value store, while the same entity's `dimension_kind` attribute resolves to `Dimension Kind 01` in the varchar store. This type-dispatched architecture means that the schema does not need to anticipate every possible attribute at design time; new attributes can be introduced by adding rows to the attribute definition table, and their values flow into the correct typed store automatically. Temporal attributes such as `recorded_at` are stored as ISO 8601 timestamps—`2024-05-15T18:00:29` for `MEAS-0001`—while summary metrics carry their own attribute vocabulary, including `created_date` values like `2023-11-11` and `identifier` values such as the checksum `7b14de08`.

**t_summary_metric_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0001 | 7b14de08 |
| METR-0002 | METR-0001 | METR-0003 | oid:1.3.6.1 |
| METR-0003 | METR-0001 | METR-0004 | MPL-2.0 |
| METR-0004 | METR-0001 | METR-0009 | ap-south-2 |
| METR-0005 | METR-0001 | METR-0005 | application/avro |
| METR-0006 | METR-0001 | METR-0010 | Name 06 |
| METR-0007 | METR-0001 | METR-0011 | ml-infra |
| METR-0008 | METR-0001 | METR-0012 | Tags 08 |

Beyond the EAV model, the system encodes relational semantics through subject-target-role triples, which capture how entities participate in structured relationships. The mass function assignment framework illustrates this: a mass function—identified by `SUBS-0001` and named `FlightMass_Empty`—is assigned to a target entity such as `ObservationRecord` (`SUBS-0002`) through a relationship row that specifies the `role` of that assignment. In every observed instance, the role is `observer`, indicating that the mass function serves an observational function with respect to the target. The subject of the relationship is the mass function itself (`SUBS-0006` in the case of `TestMass_Aluminum` and `DroneMass_Complete`), while the target is the entity being assigned (`SensorNode`, `CalibrationEvent`, or `DataQualityMetric`). This triple structure—subject, target, role—provides a minimal but expressive vocabulary for encoding directed, typed associations between entities without hardcoding relationship types into the schema.

The interplay between these two modeling layers—the EAV attribute system and the subject-target-role relationship system—enables a highly adaptable data model that supports both static metadata and dynamic associations. A summary metric such as `METR-0003` (`batch_job_completion_rate`) carries its own set of attributes including a `license` value of `MPL-2.0` and a `created_date` of `2023-07-21`, while simultaneously being linked to its constituent measurement through the `metric_kind` column, which references `MEAS-0002`. The identifier system provides the connective tissue: every entity, attribute, and relationship row is addressable by a stable key, and foreign-key relationships between tables—entity_id pointing to the entity definition, attr_id pointing to the attribute definition, mass_id and assigns_mass_to_id pointing to their respective definitions—ensure referential integrity across the entire structure. This design allows the system to scale its attribute vocabulary and relationship topology independently, while maintaining a consistent addressing and typing discipline throughout.

**t_mass_function_assigns_to_subset**

| id | mass |
| --- | --- |
| SUBS-0001 | FlightMass_Empty |
| SUBS-0002 | TestMass_Aluminum |
| SUBS-0003 | FlightMass_Empty |
| SUBS-0004 | DroneMass_Complete |
| SUBS-0005 | CargoMass_Max |
| SUBS-0006 | DroneMass_Complete |

**t_mass_function_assigns_to_subset_assigns_mass_to**

| id | assigns_mass_to |
| --- | --- |
| SUBS-0001 | ObservationRecord |
| SUBS-0002 | SensorNode |
| SUBS-0003 | CalibrationEvent |
| SUBS-0004 | DataQualityMetric |
| SUBS-0005 | TelemetryStream |
| SUBS-0006 | GovernanceRule |

**t_mass_function_assigns_to_subset__assigns_mass_to**

| id | mass_id | assigns_mass_to_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0006 | SUBS-0002 | observer |
| SUBS-0002 | SUBS-0006 | SUBS-0004 | observer |
| SUBS-0003 | SUBS-0001 | SUBS-0003 | observer |
| SUBS-0004 | SUBS-0006 | SUBS-0003 | observer |
| SUBS-0005 | SUBS-0002 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0002 | SUBS-0003 | reviewer |
| SUBS-0007 | SUBS-0005 | SUBS-0004 | reviewer |
| SUBS-0008 | SUBS-0006 | SUBS-0003 | observer |