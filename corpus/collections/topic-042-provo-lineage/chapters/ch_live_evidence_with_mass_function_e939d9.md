---
chapter_id: ch_live_evidence_with_mass_function_e939d9
topic_id: 42
family: 06_belief_structure
cited_terms: ['evidence_with_mass_function', 'mass_function_with_normalization', 'transformation_min_one_input']
model: engine-refine
---

The identifier serves as the immutable primary key for every record across the evidence and normalization layers, anchoring provenance traces such as `FUNC-0001` and normalization entries like `NORM-0001` to their respective domains. Each identifier maps to a concrete evidence artifact — a calibration certificate, a telemetry dump, or signal capture data — and carries a mass function that quantifies uncertainty, whether expressed as a Gaussian distribution, a calibration curve, or a normalized weight vector. The dimension kind classifies the physical or categorical axis of the measurement, distinguishing pressure from temperature and mass, while the method column records how the evidence was produced: automated ingestion, inference from derived signals, or a hybrid of both. These three attributes — dimension kind, method, and the mass function itself — form the core evidentiary profile, enabling downstream consumers to assess both the nature and the provenance of each datum without traversing additional joins.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | Gaussian distribution | pressure | automated |
| FUNC-0002 | calibration certificate | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | signal capture data | Gaussian distribution | mass | hybrid |
| FUNC-0005 | system event record | posterior distribution | length | automated |

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | Offset-0.02 |
| NORM-0002 | Batch-7721 | 0.982-scaling |
| NORM-0003 | Core-Segment-12 | 0.982-scaling |
| NORM-0004 | Dust-Collection-1 | Offset-0.02 |
| NORM-0005 | Powder-Grade-B | Baseline-0.75 |
| NORM-0006 | Rotor-Assembly-M | 0.982-scaling |

Normalization records extend this profile by attaching typed attributes to entities through an entity-attribute-value pattern. The attribute definition table enumerates property names such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to an XML Schema type — `xsd:decimal`, `xsd:string`, or `xsd:dateTime` — that governs validation and serialization. Values for these attributes are stored in three separate value tables keyed by entity and attribute identifiers, partitioned by type: decimal values like `0.715` and `279.33` for confidence and derived metrics, string values such as `Dimension Kind 01` and `Encoding 02` for categorical labels, and timestamp values like `2024-12-04T17:58:43` for temporal metadata. This type-partitioned design ensures that numeric precision, string encoding, and temporal semantics are preserved without resorting to ambiguous string coercion, while the entity identifier — for instance `NORM-0001` — ties all scattered attribute values back to a single normalization record.

The mass function normalization layer itself carries its own set of attributes, including a mass value drawn from a physical assembly identifier such as `Rotor-Assembly-M` or `Batch-7721`, and a normalization constant like `Offset-0.02` or `0.982-scaling` that calibrates the distribution. These constants are not arbitrary; they encode the scaling or offset applied to the underlying mass function, and their association with specific mass values creates a reproducible calibration chain. When combined with the attribute-value tables, the normalization record becomes a fully typed, self-describing entity: its identifier links to attribute definitions, its values are typed and partitioned, and its mass and normalization constant provide the quantitative backbone for uncertainty propagation.

**t_mass_function_with_normalization_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| NORM-0001 | confidence | xsd:decimal |
| NORM-0002 | dimension_kind | xsd:string |
| NORM-0003 | method | xsd:string |
| NORM-0004 | recorded_at | xsd:dateTime |
| NORM-0005 | uncertainty | xsd:decimal |
| NORM-0006 | unit | xsd:string |
| NORM-0007 | value | xsd:decimal |
| NORM-0008 | encoding | xsd:string |

**t_mass_function_with_normalization_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0004 | 2024-12-04T17:58:43 |
| NORM-0002 | NORM-0002 | NORM-0004 | 2023-02-03T12:29:30 |
| NORM-0003 | NORM-0003 | NORM-0004 | 2024-03-08T15:41:30 |
| NORM-0004 | NORM-0004 | NORM-0004 | 2023-01-16T04:53:31 |
| NORM-0005 | NORM-0005 | NORM-0004 | 2023-05-04T19:41:54 |
| NORM-0006 | NORM-0006 | NORM-0004 | 2025-01-09T01:34:48 |

**t_mass_function_with_normalization_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0001 | 0.715 |
| NORM-0002 | NORM-0001 | NORM-0005 | 279.33 |
| NORM-0003 | NORM-0001 | NORM-0007 | 243.08 |
| NORM-0004 | NORM-0002 | NORM-0001 | 0.608 |
| NORM-0005 | NORM-0002 | NORM-0005 | 643.66 |
| NORM-0006 | NORM-0002 | NORM-0007 | 319.15 |
| NORM-0007 | NORM-0003 | NORM-0001 | 0.596 |
| NORM-0008 | NORM-0003 | NORM-0005 | 676.31 |

**t_mass_function_with_normalization_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0002 | Dimension Kind 01 |
| NORM-0002 | NORM-0001 | NORM-0008 | Encoding 02 |
| NORM-0003 | NORM-0001 | NORM-0009 | nightly summary |
| NORM-0004 | NORM-0001 | NORM-0010 | ja |
| NORM-0005 | NORM-0001 | NORM-0003 | manual |
| NORM-0006 | NORM-0001 | NORM-0006 | count |
| NORM-0007 | NORM-0002 | NORM-0002 | Dimension Kind 07 |
| NORM-0008 | NORM-0002 | NORM-0008 | Encoding 08 |

Transformation records introduce a relational dimension that connects processing operations to their input datasets through a subject-target-role triad. A transformation such as `DataMasking`, `TimestampAlign`, or `FieldEncryption` acts as the subject in a relationship, while the input dataset — whether `NetworkTrafficLog`, `CustomerTransactions`, or `PatientRecords` — serves as the target. The role column, consistently populated with `observer` in the current dataset, specifies the nature of the dependency: the transformation observes or consumes the input dataset rather than producing it. This subject-target-role junction table decouples the transformation definition from its input references, allowing a single transformation to be associated with multiple input datasets and enabling audit trails that distinguish between the processing logic and the data it operates upon.

**t_transformation_min_one_input**

| id | transformation |
| --- | --- |
| INPU-0001 | DataMasking |
| INPU-0002 | TimestampAlign |
| INPU-0003 | FieldEncryption |
| INPU-0004 | FieldEncryption |
| INPU-0005 | RowFiltering |
| INPU-0006 | DuplicateRemoval |

**t_transformation_min_one_input_input_dataset**

| id | input_dataset |
| --- | --- |
| INPU-0001 | NetworkTrafficLog |
| INPU-0002 | CustomerTransactions |
| INPU-0003 | NetworkTrafficLog |
| INPU-0004 | PatientRecords |
| INPU-0005 | SupplyChainEvents |
| INPU-0006 | NetworkTrafficLog |

**t_transformation_min_one_input__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0006 | INPU-0005 | observer |
| INPU-0002 | INPU-0004 | INPU-0001 | observer |
| INPU-0003 | INPU-0003 | INPU-0002 | observer |
| INPU-0004 | INPU-0001 | INPU-0004 | observer |
| INPU-0005 | INPU-0006 | INPU-0003 | reviewer |
| INPU-0006 | INPU-0003 | INPU-0001 | contributor |
| INPU-0007 | INPU-0005 | INPU-0005 | contributor |
| INPU-0008 | INPU-0003 | INPU-0005 | contributor |

Together, these constructs — identifiers, attributes, attribute types, dimension kinds, methods, entities, roles, subjects, and targets — form a coherent metadata fabric. The identifier provides the anchor point; the attribute and attribute type define what can be said about an entity; the dimension kind and method contextualize the evidence; the entity ties values to a normalization record; the subject-target-role relationship maps data lineage through transformations; and the misc values carry the actual payloads. This architecture supports both the static description of evidence artifacts and the dynamic tracing of how those artifacts flow through processing pipelines, all while preserving type safety and provenance at every step.