---
chapter_id: ch_live_annotation_basic_52c0fa
topic_id: 186
family: 02_observation_measurement
cited_terms: ['annotation_basic', 'conceptual_construction_process', 'measurement_with_op_artifact']
model: engine-refine
---

An identifier serves as the immutable anchor for every entity in the knowledge graph, providing a stable handle that survives regardless of how an entity's attributes or values evolve. In practice, identifiers follow a consistent naming convention that encodes provenance: annotation records carry identifiers such as `ANNO-0001` through `ANNO-0004`, while measurement artifacts are keyed by identifiers like `ARTI-0001` through `ARTI-0004`. These identifiers are not arbitrary; they distinguish one entity from another and enable foreign-key references across the schema. An entity itself is the thing being described—a lab sample preservation log, a dataset quality flag, a seismic calibration unit, or a turbidity index measurement—and it is always understood in relation to what it measures or annotates. For instance, the measurement artifact `ARTI-0001` represents a Seismic Calibration Unit applied to a Network Switch Port, while `ARTI-0002` applies the same calibration instrument to a Reactor Fuel Rod, illustrating how the same measurement type can target distinct subjects.

**t_annotation_basic**

| id | annotation |
| --- | --- |
| ANNO-0001 | Lab sample preservation log |
| ANNO-0002 | Dataset quality flag |
| ANNO-0003 | Observation confidence score |
| ANNO-0004 | Model versioning record |
| ANNO-0005 | Lab sample preservation log |
| ANNO-0006 | Temperature sensor calibration |
| ANNO-0007 | Observation confidence score |
| ANNO-0008 | Telemetry schema update |

**t_annotation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_annotation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2023-10-01T01:18:56 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-08-04T06:45:48 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2023-05-30T04:23:33 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-12-22T16:10:44 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2024-08-02T10:45:55 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2023-08-09T11:38:40 |
| ANNO-0007 | ANNO-0007 | ANNO-0004 | 2023-04-18T06:49:25 |
| ANNO-0008 | ANNO-0008 | ANNO-0004 | 2024-10-12T21:41:16 |

**t_annotation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.902 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 146.86 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 292.49 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.818 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 591.53 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 955.64 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.553 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 336.91 |

**t_annotation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | intake form |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | fr |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | automated |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | ms |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

Attributes define the properties that can be assigned to any entity, and each attribute carries a name and a type that constrains the kind of values it can hold. The attribute registry captures this metadata explicitly: an attribute named `confidence` is typed as `xsd:decimal`, `dimension_kind` and `method` are typed as `xsd:string`, and `recorded_at` is typed as `xsd:dateTime`. This separation of attribute definition from attribute value is critical—it allows the schema to enforce type safety at query time and to support heterogeneous value storage. Rather than storing all attribute values in a single column, the system distributes them across dedicated value tables keyed by type: decimal values, datetime values, and variable-character string values each occupy their own table. This design reflects a deliberate normalization strategy that keeps type-specific operations efficient while preserving a unified reference model through the `attr_id` foreign key.

Values are the concrete data points that populate attributes for specific entities, and they are stored in a value-entity-attribute triple pattern that mirrors the RDF model of subject-predicate-object. A single entity can carry multiple attributes, each with its own value. The annotation entity `ANNO-0001`, for example, holds a confidence score of `0.902` (stored as a decimal), a dimension kind of `Dimension Kind 01` (stored as a varchar), and a recorded timestamp of `2023-10-01T01:18:56` (stored as a datetime). Similarly, the measurement artifact `ARTI-0001` records a confidence of `0.340`, a dimension kind of `Dimension Kind 01`, and a recorded timestamp of `2024-07-05T11:56:13`. The value tables use composite foreign keys—`entity_id` pointing back to the entity and `attr_id` pointing to the attribute definition—to reconstruct the full triple without requiring a monolithic value column. This approach supports extensibility: new attribute types can be added by introducing new value tables without altering the core schema.

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

The conceptual construction process is the mechanism by which raw data is transformed into structured knowledge, and it is characterized by three components: the process itself, the subject it transforms, and the predicate it generates. A process such as `HierarchicalEdge` operates on a subject like `Raw Data Dictionary` and produces a predicate such as `CrossReferenceLink`, while `Semantic Enrichment` transforms a `Raw Metadata Catalog` into a `Data Model Refinement` predicate. Other processes include `CausalDependency`, which takes `Raw Sensor Readings` as input and yields a `Schema Derivation` predicate. These processes are not merely descriptive labels; they encode the transformation logic that bridges unstructured or semi-structured inputs to formalized knowledge representations. The predicate generated by each process becomes a relationship type that can be queried and reasoned about, effectively turning raw data into graph edges.

Together, these components form a coherent architecture for knowledge representation. Identifiers provide stable entity references, attributes define the schema of what can be said about those entities, values populate the schema with concrete data, and conceptual construction processes govern how raw inputs are elevated to structured, queryable knowledge. The foreign-key relationships between the entity tables, attribute definitions, value tables, and process definitions create a tightly integrated system where every piece of data can be traced back to its origin, validated against its type constraints, and understood in the context of the transformation that produced it. This design supports both the storage of heterogeneous measurement artifacts and the systematic construction of semantic relationships from raw data sources.

**t_conceptual_construction_process**

| id | conceptual_construction_process | transforms_subject | generates_predicate |
| --- | --- | --- | --- |
| PROC-0001 | HierarchicalEdge | Raw Data Dictionary | CrossReferenceLink |
| PROC-0002 | HierarchicalEdge | Unstructured Log Streams | Provenance Tracing |
| PROC-0003 | Semantic Enrichment | Raw Metadata Catalog | Data Model Refinement |
| PROC-0004 | CausalDependency | Raw Sensor Readings | Schema Derivation |
| PROC-0005 | HierarchicalEdge | Unaligned Concept Lists | Schema Derivation |

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