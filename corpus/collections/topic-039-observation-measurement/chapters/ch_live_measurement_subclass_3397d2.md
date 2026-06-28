---
chapter_id: ch_live_measurement_subclass_3397d2
topic_id: 39
family: 02_observation_measurement
cited_terms: ['measurement_subclass', 'measurement_subclass_only_one_unit', 'measurement_with_method']
model: engine-refine
---

Measurement systems require a disciplined approach to tracking what was measured, how it was measured, and how reliable the result is. At the foundation of this model, every entity is anchored by a unique identifier—short codes such as MEAS-0001 for luminance, UNIT-0001 for temperature gradient, and METH-0001 for a particular measurement method—that serve as the stable reference point across all tables. These identifiers are not merely labels; they are the foreign keys that bind the dimensional structure together, ensuring that a measurement like heart rate can be traced to its physical dimension, its assigned unit, and the quality attributes attached to it. The measurement subclass table captures the what—luminance, heart rate, Oil viscosity, CPU utilization—while the dimension table captures the underlying physical quantity, such as Electric current, Power, Energy, or Mass. A junction table links measurements to dimensions through subject and target relationships, where the subject is the measurement being characterized and the target is the dimension it relates to, and a role column assigns responsibility, distinguishing between owner and reviewer in the provenance chain.

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | luminance |
| MEAS-0002 | heart rate |
| MEAS-0003 | Heart rate |
| MEAS-0004 | Oil viscosity |
| MEAS-0005 | soil moisture |
| MEAS-0006 | Battery charge |

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

**t_measurement_subclass_only_one_unit**

| id | measurement | unit |
| --- | --- | --- |
| UNIT-0001 | temperature gradient | newton meters |
| UNIT-0002 | CPU utilization | decibels |
| UNIT-0003 | particulate count | lumens |
| UNIT-0004 | network throughput | degrees celsius |
| UNIT-0005 | luminance | lumens |
| UNIT-0006 | voltage drop | percent |

**t_measurement_subclass_only_one_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | confidence | xsd:decimal |
| UNIT-0002 | dimension_kind | xsd:string |
| UNIT-0003 | method | xsd:string |
| UNIT-0004 | recorded_at | xsd:dateTime |
| UNIT-0005 | uncertainty | xsd:decimal |
| UNIT-0006 | unit | xsd:string |
| UNIT-0007 | value | xsd:decimal |
| UNIT-0008 | encoding | xsd:string |

**t_measurement_subclass_only_one_unit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0004 | 2024-07-02T10:17:22 |
| UNIT-0002 | UNIT-0002 | UNIT-0004 | 2025-05-17T18:10:32 |
| UNIT-0003 | UNIT-0003 | UNIT-0004 | 2023-09-23T07:34:54 |
| UNIT-0004 | UNIT-0004 | UNIT-0004 | 2023-07-03T17:50:57 |
| UNIT-0005 | UNIT-0005 | UNIT-0004 | 2025-03-23T11:32:54 |
| UNIT-0006 | UNIT-0006 | UNIT-0004 | 2024-10-11T18:39:44 |

**t_measurement_subclass_only_one_unit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | 0.584 |
| UNIT-0002 | UNIT-0001 | UNIT-0005 | 680.89 |
| UNIT-0003 | UNIT-0001 | UNIT-0007 | 977.36 |
| UNIT-0004 | UNIT-0002 | UNIT-0001 | 0.929 |
| UNIT-0005 | UNIT-0002 | UNIT-0005 | 548.84 |
| UNIT-0006 | UNIT-0002 | UNIT-0007 | 51.31 |
| UNIT-0007 | UNIT-0003 | UNIT-0001 | 0.964 |
| UNIT-0008 | UNIT-0003 | UNIT-0005 | 305.75 |

**t_measurement_subclass_only_one_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | Dimension Kind 01 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | Encoding 02 |
| UNIT-0003 | UNIT-0001 | UNIT-0009 | change rationale |
| UNIT-0004 | UNIT-0001 | UNIT-0010 | fr |
| UNIT-0005 | UNIT-0001 | UNIT-0003 | hybrid |
| UNIT-0006 | UNIT-0001 | UNIT-0006 | nm |
| UNIT-0007 | UNIT-0002 | UNIT-0002 | Dimension Kind 07 |
| UNIT-0008 | UNIT-0002 | UNIT-0008 | Encoding 08 |

**dim_via_method**

| id | via_method_label | via_method_category |
| --- | --- | --- |
| METH-0001 | Via Method Label 01 | Via Method Category 01 |
| METH-0002 | Via Method Label 02 | Via Method Category 02 |
| METH-0003 | Via Method Label 03 | Via Method Category 03 |
| METH-0004 | Via Method Label 04 | Via Method Category 04 |
| METH-0005 | Via Method Label 05 | Via Method Category 05 |
| METH-0006 | Via Method Label 06 | Via Method Category 06 |

Attributes provide the metadata layer that enriches each measurement entity with contextual information, and their types are strictly enforced to ensure data integrity. The attribute definition table maps attribute names—confidence, dimension_kind, method, recorded_at—to their corresponding data types, which follow XML Schema definitions: xsd:decimal for numeric precision, xsd:string for free-form text, and xsd:dateTime for temporal stamps. This type discipline is reflected in the value storage, which is split across three separate tables organized by data type. Decimal attributes such as confidence scores are stored in the decimal value table, where UNIT-0001 carries a confidence of 0.584 and UNIT-0002 holds a value of 680.89. String attributes populate the varchar table, capturing values like Dimension Kind 01, Encoding 02, change rationale, and the locale code fr. DateTime attributes are stored separately, recording timestamps such as 2024-07-02T10:17:22 and 2025-05-17T18:10:32, each tied to a specific entity through the entity_id foreign key and to a specific attribute definition through the attr_id foreign key. The generic value column, labeled misc across all value tables, serves as the universal carrier for these heterogeneous data types within a normalized structure.

Measurement quality is quantified through two complementary metrics: confidence and uncertainty, both stored as decimal values in the fact measurement table. Confidence represents the degree of assurance in a measurement result, ranging from 0.307 for METH-0004 to 0.945 for METH-0002, with intermediate values such as 0.496 and 0.506 indicating moderate reliability. Uncertainty, expressed as an absolute numeric value, captures the margin of error—306.26 for METH-0001, 279.24 for METH-0002, 120.70 for METH-0003, and 364.07 for METH-0004—providing a complementary perspective on measurement precision. The actual measured value sits alongside these quality indicators, with observed values including 353.34, 660.64, 878.99, and 64.10. Each fact record is linked to a via method key, which references the method dimension table where each method is assigned a human-readable label such as Via Method Label 01 and a categorical classification like Via Method Category 01 through Via Method Category 04. This category field enables aggregation and filtering of measurements by the type of method employed, supporting governance queries that ask which measurement approaches are being used and how their quality profiles compare.

**fact_measurement**

| id | via_method_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0003 | 0.496 | 306.26 | 353.34 |
| METH-0002 | METH-0002 | 0.945 | 279.24 | 660.64 |
| METH-0003 | METH-0005 | 0.506 | 120.70 | 878.99 |
| METH-0004 | METH-0005 | 0.307 | 364.07 | 64.10 |
| METH-0005 | METH-0001 | 0.923 | 642.96 | 897.70 |

The unit assignment table establishes a one-to-one mapping between measurement types and their units, ensuring that every measurement is expressed in a canonical form. Temperature gradient is paired with newton meters, CPU utilization with decibels, particulate count with lumens, and network throughput with degrees celsius—each combination forming a distinct entity identified by codes such as UNIT-0001 through UNIT-0004. These unit entities participate in the same attribute-value pattern as other entities, receiving their own confidence scores, method annotations, and temporal stamps. The role column in the measurement-dimension junction table adds a governance layer to the physical relationships, designating which entities act as owners of a measurement-dimension pairing and which serve as reviewers, creating an auditable chain of accountability. Together, these structures form a coherent framework for recording not just what was measured and in what units, but who is responsible, how the measurement was obtained, how confident we can be in the result, and what the uncertainty bounds are—all traceable through a network of foreign keys rooted in stable identifiers.