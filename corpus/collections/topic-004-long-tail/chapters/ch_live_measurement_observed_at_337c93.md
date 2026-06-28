---
chapter_id: ch_live_measurement_observed_at_337c93
topic_id: 4
family: 02_observation_measurement
cited_terms: ['measurement_observed_at', 'constraint_check_subclass', 'cardinality_max_three_generic']
model: engine-refine
---

In measurement and observability systems, every recorded datum carries not only a raw value but a structured set of metadata that establishes provenance, quality, and interpretability. An entity—such as the measurement identified as OBSE-0001, which captures a temperature gradient observed at Monitoring Station Bravo—serves as the anchor point for all associated attribute data. Each entity is assigned a unique identifier, following a convention like OBSE-NNNN, that enables unambiguous cross-referencing across the attribute-value stores. The entity's core properties, including what is being measured and where it was observed, are stored in a central registry, while the richer, typed attribute values are distributed across specialized value tables to preserve type safety and query efficiency.

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

Attributes define the dimensions along which an entity is characterized. The attribute registry maps each attribute to a name and a data type, ensuring that downstream consumers know how to interpret the stored values. For instance, the attribute named confidence carries an xsd:decimal type, dimension_kind and method are xsd:string, and recorded_at is xsd:dateTime. This type discipline is enforced at the storage layer by segregating values into three parallel tables: one for decimal values such as 0.528 or 280.63, another for datetime stamps like 2023-12-12T12:05:13, and a third for free-form strings such as "Dimension Kind 01" or "calibration record." Each value row links back to its owning entity through an entity_id foreign key and to its attribute definition through an attr_id foreign key, forming a normalized entity-attribute-value model that scales to arbitrary attribute counts per entity without schema modification.

The integrity of this model depends on constraints that govern what constitutes valid data. Constraint definitions such as "Null field rejection," "Anomaly detection threshold," and "Header presence check" encode business rules that must be satisfied before a measurement is accepted into the system. Each constraint references one or more checks—identified by codes like GENE-0001 or GENE-0005—that specify the actual validation logic. The cardinality table further constrains how many checks may apply to a given constraint, using terms like capped-pair, bounded-triplet, single-bound, and max-three to describe the upper bound on the number of associated checks. This separation between constraint definition and check cardinality allows the system to enforce both the scope and the quantity of validation rules independently.

**t_cardinality_max_three_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | capped-pair | CHEC-0006 |
| GENE-0002 | bounded-triplet | CHEC-0001 |
| GENE-0003 | single-bound | CHEC-0006 |
| GENE-0004 | max-three | CHEC-0004 |
| GENE-0005 | limited-association | CHEC-0004 |
| GENE-0006 | triple-cap | CHEC-0001 |
| GENE-0007 | fixed-triple | CHEC-0006 |
| GENE-0008 | capped-pair | CHEC-0003 |

Not all constraints carry equal weight. Each constraint is assigned a mandatory flag and a priority level, where mandatory indicates whether the constraint must be satisfied for the measurement to be accepted, and priority determines the order in which constraints are evaluated. For example, the Null field rejection constraint is both mandatory and assigned priority 1, meaning it is evaluated first and is non-negotiable. In contrast, the Header presence check, while also priority 1, is not mandatory, allowing the system to log a warning without rejecting the measurement. The Anomaly detection threshold constraint, mandatory with priority 4, is evaluated later in the pipeline but still blocks acceptance if violated. This two-dimensional control—mandatory versus optional, and numeric priority—enables fine-grained governance over data quality without requiring custom code paths for each rule.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | GENE-0005 | true | 1 |
| CHEC-0002 | Null field rejection | GENE-0001 | true | 5 |
| CHEC-0003 | Anomaly detection threshold | GENE-0001 | true | 4 |
| CHEC-0004 | Header presence check | GENE-0006 | false | 1 |
| CHEC-0005 | Batch size limit | GENE-0006 | false | 4 |
| CHEC-0006 | Anomaly detection threshold | GENE-0005 | false | 1 |