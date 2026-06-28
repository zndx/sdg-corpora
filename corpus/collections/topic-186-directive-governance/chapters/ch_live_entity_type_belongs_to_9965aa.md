---
chapter_id: ch_live_entity_type_belongs_to_9965aa
topic_id: 186
family: 07_long_tail
cited_terms: ['entity_type_belongs_to', 'schemaorg_person_email', 'measurement_of_artifact']
model: engine-refine
---

Entity identification and classification form the backbone of any governance framework that must track heterogeneous assets across operational environments. Each entity—whether an edge_gateway_12, a sensor_node_47, or a governance_policy_fin—receives a unique identifier and is classified according to its functional role through a belongs-to relationship with an artifact type such as ARTI-0001 or ARTI-0003. This classification is not merely administrative; it determines which attributes are applicable, which measurement schemas govern the entity, and how its data flows through downstream systems. The same entity can appear in multiple classification contexts, as sensor_node_47 maps to both ARTI-0003 and ARTI-0004, reflecting the reality that physical devices often serve overlapping functions across different measurement domains.

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | ARTI-0001 |
| BELO-0002 | sensor_node_47 | ARTI-0003 |
| BELO-0003 | governance_policy_fin | ARTI-0001 |
| BELO-0004 | sensor_node_47 | ARTI-0004 |
| BELO-0005 | edge_gateway_12 | ARTI-0006 |
| BELO-0006 | edge_gateway_12 | ARTI-0002 |
| BELO-0007 | ml_feature_store_prod | ARTI-0006 |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

**t_measurement_of_artifact_attr**

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

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Attributes and their types provide the semantic scaffolding that gives entity data its analytical utility. Every attribute carries a name—confidence, dimension_kind, method, recorded_at—and a strict type definition drawn from the XML Schema Datatypes namespace, including xsd:decimal for numerical precision, xsd:string for categorical labels, and xsd:dateTime for temporal anchoring. This type discipline is enforced through a value partitioning strategy: decimal values such as 0.703 or 525.54 are stored separately from string values like Dimension Kind 01 or Encoding 02, and datetime values such as 2025-04-30T12:57:36 occupy their own storage domain. The separation is not an implementation artifact but a governance decision that ensures type safety, optimizes query performance, and prevents the kind of data corruption that arises when heterogeneous values share a single column. Each value record is anchored to its entity through a composite key that references both the entity and the attribute, creating a sparse but fully navigable graph of entity-attribute-value triples.

The measurement-of-artifact domain mirrors this attribute-value architecture but applies it to operational telemetry rather than classification metadata. Measurements such as latency_p99_ms, yield_stress_test, and pressure_transducer are tracked with the same typed attribute system, where confidence scores like 0.670 or 0.088 quantify measurement reliability, and recorded_at timestamps such as 2023-05-19T07:46:35 establish the temporal provenance of each reading. The parallel structure between entity classification and artifact measurement is intentional: it allows governance policies to reference both the identity of a monitored asset and the quality of its telemetry within a single query, enabling compliance checks that span from device inventory to measurement accuracy.

Email schema metadata introduces a parallel tracking dimension focused on data provenance and version control. The fact_schemaorg table links email identifiers to aggregate size measurements in bytes—values such as 895265030 or 998785819 represent the storage footprint of schema definitions—and assigns a version number ranging from 3 to 8 that tracks the evolution of each schema over time. These version numbers are not arbitrary; they serve as checkpoints in the schema lifecycle, enabling rollback capabilities and ensuring that downstream consumers can validate their expectations against the correct schema revision. The email dimension table further categorizes each email identifier with a label and a category, providing the human-readable context that bridges the gap between machine-readable identifiers like EMAI-0001 and the organizational semantics that operators need to understand what each schema governs.

**fact_schemaorg**

| id | email_key | size_bytes | version |
| --- | --- | --- | --- |
| EMAI-0001 | EMAI-0004 | 895265030 | 3 |
| EMAI-0002 | EMAI-0002 | 114301972 | 5 |
| EMAI-0003 | EMAI-0005 | 338701831 | 4 |
| EMAI-0004 | EMAI-0005 | 998785819 | 8 |

**dim_email**

| id | email_label | email_category |
| --- | --- | --- |
| EMAI-0001 | Email Label 01 | Email Category 01 |
| EMAI-0002 | Email Label 02 | Email Category 02 |
| EMAI-0003 | Email Label 03 | Email Category 03 |
| EMAI-0004 | Email Label 04 | Email Category 04 |
| EMAI-0005 | Email Label 05 | Email Category 05 |
| EMAI-0006 | Email Label 06 | Email Category 06 |

Together, these structures implement a unified approach to data governance where entities, attributes, measurements, and schemas are all tracked through a consistent pattern of identifier-based relationships and type-enforced values. The system does not distinguish between the metadata that classifies an edge_gateway_12 and the telemetry that measures its latency_p99_ms; both are expressed as typed attributes with versioned, sized, and categorized values. This uniformity is the framework's primary strength: it allows auditors to trace a governance_policy_fin from its classification through its applicable attributes, its measurement records, and the schema versions that govern its data format, all within a single navigable model.