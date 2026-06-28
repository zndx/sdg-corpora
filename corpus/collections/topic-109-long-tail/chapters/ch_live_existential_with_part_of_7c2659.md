---
chapter_id: ch_live_existential_with_part_of_7c2659
topic_id: 109
family: 01_foundation
cited_terms: ['existential_with_part_of', 'measurement_subclass', 'belief_interval_with_upper_bound']
model: engine-refine
---

The foundational layer of the ontology rests upon a disciplined identifier scheme, where every entity—whether a component, a boundary, or a measurement subclass—is assigned a stable, prefix-qualified key. Identifiers such as `PART-0001` and `BOUN-0001` serve as the immutable anchors across all relational tables, enabling cross-referential integrity without ambiguity. In the partonomy, existential components like `regional_telemetry_gateway` and `alpha_compute_cluster` are bound to their enclosing boundaries (`BOUN-0001`, `BOUN-0005`, `BOUN-0006`), establishing a containment hierarchy that is itself queryable through the `part_of` linkage. Similarly, measurement subclasses—`Heart rate`, `Seismic magnitude`, `Soil moisture`—are each keyed by identifiers (`MEAS-0001` through `MEAS-0004`) that propagate into the dimensional and belief-interval domains, ensuring that a single measurement can be traced from its semantic label through its associated dimensions and up to the plausibility bounds that govern its interpretation.

**t_existential_with_part_of**

| id | existential | part_of |
| --- | --- | --- |
| PART-0001 | regional_telemetry_gateway | BOUN-0001 |
| PART-0002 | alpha_compute_cluster | BOUN-0005 |
| PART-0003 | alpha_query_engine | BOUN-0006 |
| PART-0004 | primary_stream_processor | BOUN-0005 |
| PART-0005 | central_metadata_catalog | BOUN-0003 |
| PART-0006 | eastern_kafka_broker | BOUN-0003 |

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Model feature shift | PART-0002 |
| BOUN-0002 | Batch ingestion failure | PART-0002 |
| BOUN-0003 | Sensor calibration drift | PART-0001 |
| BOUN-0004 | Storage quota warning | PART-0005 |
| BOUN-0005 | Latency SLA breach | PART-0005 |
| BOUN-0006 | Model feature shift | PART-0002 |

Attributes and their types constitute the second structural pillar, decoupling property definitions from their runtime values. The attribute schema declares names such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to an XML Schema datatype—`xsd:decimal`, `xsd:string`, `xsd:dateTime`—that constrains the shape of permissible values. This separation of attribute metadata from attribute instances is critical: it allows the same attribute definition to be referenced by multiple entities while guaranteeing type safety at query time. The `attr_type` column thus functions as a schema-level contract, and the proliferation of type-specific value tables (`val_datetime`, `val_decimal`, `val_varchar`) reflects a deliberate normalization strategy that avoids NULL proliferation and enforces domain integrity at the storage layer.

Entity-value relationships materialize through a tripartite association: an entity identifier, an attribute identifier, and a typed value drawn from the appropriate value table. A belief interval record such as `BOUN-0001`—which captures the proposition "Model feature shift" bounded by the plausibility upper bound `PART-0002`—carries a confidence of `0.680` (stored in the decimal value table), a `dimension_kind` of `Dimension Kind 01` (stored in the varchar table), and a `recorded_at` timestamp of `2024-12-10T20:43:33` (stored in the datetime table). The same entity may reference multiple attributes, and a single attribute definition may be instantiated across many entities, producing a sparse but highly structured attribute-value matrix. The `misc` column, which holds the actual value, is deliberately generic: its semantics are determined entirely by the intersection of the referenced `attr_id` and the table in which the row resides.

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |

The measurement-to-dimension association introduces the concept of role as a first-class relationship qualifier. In the junction table linking measurement subclasses to their dimensions, each pair is annotated with a role—`owner` or `reviewer`—that specifies the nature of the association. For instance, the measurement `MEAS-0004` (corresponding to `Soil moisture`) is linked to dimension `MEAS-0003` (`Energy`) with the role `owner`, while the same measurement is linked to dimension `MEAS-0005` with the role `reviewer`. This role-bearing relationship model allows a single subject-target pair to participate in multiple distinct associations, each carrying its own semantic weight. The subject column identifies the measurement subclass initiating the relationship, and the target column identifies the dimension being related to, but it is the role column that disambiguates the intent of the linkage.

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

Together, these structures form a coherent evidence model: identifiers provide referential stability, attributes and their types define the vocabulary of observation, entity-value associations ground abstract properties in concrete records, and role-qualified relationships encode the provenance and authority of each linkage. The belief-interval framework, which ties propositions like "Batch ingestion failure" and "Sensor calibration drift" to plausibility bounds and their associated metadata, demonstrates how this model supports uncertainty-aware reasoning. Every value—from the decimal confidence `0.590` attached to `BOUN-0002` to the ISO 8601 timestamp `2025-04-06T06:40:08` on `BOUN-0004`—is traceable to its definition, its entity, and its role in the broader evidentiary graph.