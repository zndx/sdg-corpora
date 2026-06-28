---
chapter_id: ch_live_equiv_intersect_with_two_restrictions_d71510
topic_id: 12
family: 01_foundation
cited_terms: ['equiv_intersect_with_two_restrictions', 'schemaorg_person_affiliation', 'classification_under_taxonomy']
model: engine-refine
---

Affiliation records constitute the foundational identity layer within the governance framework, each anchored by a unique identifier such as AFFI-0001 through AFFI-0004 that serves as the immutable primary key across all dependent tables. The affiliation fact table captures versioned snapshots of these entities, where each record carries a version number—ranging from 3 to 8 in the observed corpus—and a size_bytes metric that quantifies the payload, with values spanning from 114,301,972 bytes for AFFI-0002 to 998,785,819 bytes for AFFI-0004. The self-referencing affiliation_key column establishes internal linkage: AFFI-0001 points to itself, AFFI-0004 references AFFI-0001, and AFFI-0002 and AFFI-0003 form a reciprocal pair, enabling hierarchical or compositional relationships between affiliation entities. The companion dimension table enriches each identifier with human-readable metadata, pairing affiliation_label values such as "Affiliation Label 01" with categorical designations like "Affiliation Category 01" through "Affiliation Category 04," thereby providing the classification taxonomy that governs how affiliations are grouped, filtered, and reported across operational systems.

**fact_schemaorg**

| id | affiliation_key | size_bytes | version |
| --- | --- | --- | --- |
| AFFI-0001 | AFFI-0001 | 895265030 | 3 |
| AFFI-0002 | AFFI-0004 | 114301972 | 5 |
| AFFI-0003 | AFFI-0002 | 338701831 | 4 |
| AFFI-0004 | AFFI-0003 | 998785819 | 8 |

**dim_affiliation**

| id | affiliation_label | affiliation_category |
| --- | --- | --- |
| AFFI-0001 | Affiliation Label 01 | Affiliation Category 01 |
| AFFI-0002 | Affiliation Label 02 | Affiliation Category 02 |
| AFFI-0003 | Affiliation Label 03 | Affiliation Category 03 |
| AFFI-0004 | Affiliation Label 04 | Affiliation Category 04 |
| AFFI-0005 | Affiliation Label 05 | Affiliation Category 05 |
| AFFI-0006 | Affiliation Label 06 | Affiliation Category 06 |

The identifier namespace extends beyond affiliations into a broader equivalence and taxonomy resolution layer. The equivalence intersection table maps REST-prefixed identifiers—REST-0001 through REST-0004—to paired equivalence and related values, establishing cross-domain mappings between concepts such as telemetry_stream_alpha and ml_model_checkpoint, or governance_policy_set and sensor_node_array. These mappings are not arbitrary; each equivalence pair is coupled with a related pair (for instance, inference_dataset paired with backup_volume under REST-0001, or pressure_transducer appearing twice under REST-0003 and REST-0004), creating a structured graph of semantic relationships that enables systems to resolve aliases, trace data lineage, and enforce referential integrity across heterogeneous data sources. The taxonomy classification table further extends this resolution by binding TAXO-prefixed identifiers to classification labels—such as "Lab Sample Category," "Anomaly Detection Model," "Experiment Phase Code," and "Telemetry Stream Type"—under specific REST taxonomy references, thereby anchoring operational classifications to the same equivalence graph.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | TAXO-0008 | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | TAXO-0003 | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | TAXO-0002 | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | TAXO-0006 | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | TAXO-0008 | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | TAXO-0008 | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | TAXO-0007 | inference_dataset |

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | REST-0002 |
| TAXO-0002 | Anomaly Detection Model | REST-0002 |
| TAXO-0003 | Experiment Phase Code | REST-0007 |
| TAXO-0004 | Telemetry Stream Type | REST-0001 |
| TAXO-0005 | Compliance Framework Set | REST-0006 |
| TAXO-0006 | Experiment Phase Code | REST-0001 |
| TAXO-0007 | Metadata Schema Version | REST-0001 |
| TAXO-0008 | Experiment Phase Code | REST-0004 |

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

Attributes and attribute types form the schema backbone that governs how entity values are typed, validated, and stored. The attribute definition table enumerates attribute names including duration_seconds, end_time, exit_code, and host_name, each bound to an XSD type—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—that dictates the serialization format, validation constraints, and storage strategy for downstream value tables. This type discipline is enforced through a family of value tables partitioned by data type: decimal values such as 4845.29, 4012.23, 5805.70, and 852.80 are stored in the decimal value table; integer values including 123, 306, 682, and 349 reside in the integer value table; datetime values like 2024-03-16T10:40:44, 2023-03-15T13:57:05, 2024-10-13T12:06:31, and 2023-01-11T10:30:50 are persisted in the datetime value table; and string values such as worker-07, Log Level 02, initiation, and superseded are held in the varchar value table. Each value row is anchored by an entity_id foreign key that references the TAXO-prefixed classification identifiers and an attr_id foreign key that resolves to the attribute definition, ensuring that every stored value is traceable to both its semantic context and its type contract.

The entity column in each value table serves as the join key that binds typed values back to their classification context, creating a flexible attribute-value model where a single entity can carry multiple heterogeneous attributes. For example, entity TAXO-0001 appears across all four value tables, carrying a decimal value of 4845.29 for attribute TAXO-0001, a datetime value of 2024-03-16T10:40:44 for attribute TAXO-0002, an integer value of 123 for attribute TAXO-0003, and a varchar value of worker-07 for attribute TAXO-0004—demonstrating how a single classification record can accumulate a rich, multi-typed attribute profile without schema modification. The misc column in the value tables holds the actual payload values, while the misc column in the affiliation dimension table holds the human-readable labels, creating a parallel naming convention that distinguishes operational data from descriptive metadata. This separation of concerns—where identifiers provide stability, attributes provide schema, types provide constraints, and values provide content—enables the framework to scale across diverse data domains while maintaining auditability, type safety, and referential coherence.

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |