---
chapter_id: ch_live_measurement_observed_at_abe0d9
topic_id: 119
family: 02_observation_measurement
cited_terms: ['measurement_observed_at', 'constraint_subclass', 'lineage_edge_with_confidence']
model: engine-refine
---

The attribute-value architecture decouples measurement metadata from the core observation record, allowing heterogeneous properties to be attached to any entity without schema modification. Each attribute is declared once with a name and a type—`xsd:decimal`, `xsd:string`, or `xsd:dateTime`—and then instantiated across entities through a set of type-specialized value tables. For instance, the attribute identified as `OBSE-0004` carries the name `recorded_at` and type `xsd:dateTime`, and its values are stored in the datetime value table, where entity `OBSE-0001` is associated with the timestamp `2023-12-12T12:05:13` and entity `OBSE-0002` with `2024-12-09T20:37:11`. The same mechanism applies to decimal attributes such as `OBSE-0005` (dimension kind) and `OBSE-0007` (method), which hold values like `280.63` and `384.95` for entity `OBSE-0001`, and to string attributes like `OBSE-0002` (confidence) and `OBSE-0008` (dimension kind), which carry values such as `Dimension Kind 01` and `Encoding 02`. This separation of attribute definition from value storage ensures type safety while preserving the flexibility to add new properties to any measurement record—whether it is a temperature gradient observed at Monitoring Station Bravo or a packet loss measurement from Observatory Dome 2.

**t_measurement_observed_at**

| id | measurement | observed_at |
| --- | --- | --- |
| OBSE-0001 | temperature gradient | Monitoring Station Bravo |
| OBSE-0002 | packet loss | Observatory Dome 2 |
| OBSE-0003 | wind shear | Lab Bench 7B |
| OBSE-0004 | network latency | Weather Mast Delta |
| OBSE-0005 | pH level | Telemetry Gateway Alpha |
| OBSE-0006 | pH level | Calibration Rack 9 |

**t_measurement_observed_at_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSE-0001 | confidence | xsd:decimal |
| OBSE-0002 | dimension_kind | xsd:string |
| OBSE-0003 | method | xsd:string |
| OBSE-0004 | recorded_at | xsd:dateTime |
| OBSE-0005 | uncertainty | xsd:decimal |
| OBSE-0006 | unit | xsd:string |
| OBSE-0007 | value | xsd:decimal |
| OBSE-0008 | encoding | xsd:string |

**t_measurement_observed_at_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0004 | 2023-12-12T12:05:13 |
| OBSE-0002 | OBSE-0002 | OBSE-0004 | 2024-12-09T20:37:11 |
| OBSE-0003 | OBSE-0003 | OBSE-0004 | 2023-09-12T00:10:32 |
| OBSE-0004 | OBSE-0004 | OBSE-0004 | 2024-08-27T19:17:19 |
| OBSE-0005 | OBSE-0005 | OBSE-0004 | 2025-06-14T14:45:22 |
| OBSE-0006 | OBSE-0006 | OBSE-0004 | 2023-03-29T14:19:26 |

**t_measurement_observed_at_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0001 | 0.528 |
| OBSE-0002 | OBSE-0001 | OBSE-0005 | 280.63 |
| OBSE-0003 | OBSE-0001 | OBSE-0007 | 384.95 |
| OBSE-0004 | OBSE-0002 | OBSE-0001 | 0.215 |
| OBSE-0005 | OBSE-0002 | OBSE-0005 | 900.19 |
| OBSE-0006 | OBSE-0002 | OBSE-0007 | 524.13 |
| OBSE-0007 | OBSE-0003 | OBSE-0001 | 0.738 |
| OBSE-0008 | OBSE-0003 | OBSE-0005 | 695.46 |

**t_measurement_observed_at_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0002 | Dimension Kind 01 |
| OBSE-0002 | OBSE-0001 | OBSE-0008 | Encoding 02 |
| OBSE-0003 | OBSE-0001 | OBSE-0009 | calibration record |
| OBSE-0004 | OBSE-0001 | OBSE-0010 | de |
| OBSE-0005 | OBSE-0001 | OBSE-0003 | hybrid |
| OBSE-0006 | OBSE-0001 | OBSE-0006 | nm |
| OBSE-0007 | OBSE-0002 | OBSE-0002 | Dimension Kind 07 |
| OBSE-0008 | OBSE-0002 | OBSE-0008 | Encoding 08 |

The entity identifier serves as the anchor point that ties every attribute value back to its source observation. In the measurement domain, identifiers such as `OBSE-0001` through `OBSE-0004` correspond to distinct observations, each recorded at a specific location: Lab Bench 7B, Weather Mast Delta, and others. The entity column in each value table references these identifiers, creating a many-to-many relationship between entities and attributes. A single entity may carry multiple attributes of different types—decimal, string, and datetime—while a single attribute definition may be instantiated across numerous entities. This design supports rich, multi-dimensional descriptions of each measurement without requiring a fixed set of columns in the observation table itself.

Constraints governing data quality and compliance are managed through a parallel structure that assigns each constraint a priority level and a review cycle measured in days. The constraint identified as `CONS-0001` enforces a geofence boundary on a database cluster with priority `3` and a review cycle of `311` days, while `CONS-0002` mandates audit log retention on a compute node with the same priority but a longer review cycle of `467` days. The data retention policy (`CONS-0003`) applies to a network interface at priority `4` with a review cycle of `185` days, and the encryption standard (`CONS-0004`) governs a sensor array at priority `2` with a review cycle of `391` days. The priority field, ranging from `2` to `4`, indicates the relative importance of each constraint, while the review cycle determines how frequently the constraint must be re-evaluated, ensuring that compliance checks remain current and actionable.

**t_constraint_subclass**

| id | constraint | constrains | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| CONS-0001 | Geofence boundary | Database cluster | 3 | 311 |
| CONS-0002 | Audit log retention | Compute node | 3 | 467 |
| CONS-0003 | Data retention policy | Network interface | 4 | 185 |
| CONS-0004 | Encryption standard | Sensor array | 2 | 391 |

Lineage tracking extends the attribute-value model to capture the provenance of data transformations, with each lineage edge annotated by confidence, a recorded timestamp, and a unit of measure. The edge `CONF-0001` describes the relationship between an `ml_training_dataset_prep` lineage and its downstream consumer, carrying a confidence of `partial_match`, a recorded timestamp of `2024-07-21T21:36:51`, and a unit of `deg_C`. The edge `CONF-0002` links a `data_lake_warehouse_sync` lineage with a confidence of `statistical_overlap`, recorded on `2025-03-12T13:46:59`, and a unit of `mg/L`. Two additional edges, `CONF-0003` and `CONF-0004`, both describe `data_lake_warehouse_sync` relationships with a confidence of `95_percent`, recorded on `2023-02-17T19:37:00` and `2024-01-06T01:59:57` respectively, and carrying units of `ratio` and `nm`. The unit field encodes the physical or dimensional context of the lineage—whether it pertains to temperature, concentration, a dimensionless ratio, or wavelength—while the confidence field quantifies the degree of certainty in the relationship, ranging from qualitative descriptors like `partial_match` to quantitative assessments like `95_percent`.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |