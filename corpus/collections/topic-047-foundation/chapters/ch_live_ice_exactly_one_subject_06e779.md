---
chapter_id: ch_live_ice_exactly_one_subject_06e779
topic_id: 47
family: 01_foundation
cited_terms: ['ice_exactly_one_subject', 'subclass_basic', 'process_min_one_output']
model: engine-refine
---

Attributes constitute the definitional scaffolding through which entities acquire semantic specificity, and their proper typing is a prerequisite for any system that must reason over heterogeneous data. An attribute is declared by a name and a type; the type constrains the domain of admissible values and thereby governs how those values may be compared, stored, and transformed. In the subject domain, attributes such as encoding, label_text, and language are uniformly typed as xsd:string, which is appropriate for free-form textual descriptors that carry no intrinsic numeric or temporal semantics. By contrast, process outputs are characterized by a richer type vocabulary: duration_seconds is declared as xsd:decimal to preserve fractional precision, end_time as xsd:dateTime for point-in-time anchoring, exit_code as xsd:integer for discrete status codes, and host_name as xsd:string for machine identifiers. This type discipline ensures that a value of 1575.12 is interpreted as a quantitative duration rather than a string, that 2023-04-19T05:25:34 is parsed as an instant rather than arbitrary text, and that 695 is treated as a numeric exit code rather than a label.

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | Measurement Timeframe |
| SUBJ-0002 | Provenance Graph Export | Message Type Definition |
| SUBJ-0003 | Raw Observation Feed | Quality Check Script |
| SUBJ-0004 | Provenance Graph Export | Primary Data Source |
| SUBJ-0005 | Schema Registry Entry | Primary Data Source |
| SUBJ-0006 | Audit Trail Report | Primary Data Source |
| SUBJ-0007 | Schema Registry Entry | Field Survey Zone |
| SUBJ-0008 | Sensor Configuration File | Data Governance Board |

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |

**t_process_min_one_output**

| id | process | output |
| --- | --- | --- |
| OUTP-0001 | feature extraction pipeline | cleaned dataset |
| OUTP-0002 | pipeline rollback procedure | rollback snapshot |
| OUTP-0003 | feature extraction pipeline | feature matrix |
| OUTP-0004 | model training run | detection alert |
| OUTP-0005 | data validation cycle | cleaned dataset |
| OUTP-0006 | model training run | cleaned dataset |
| OUTP-0007 | anomaly detection sweep | cleaned dataset |

**t_process_min_one_output_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OUTP-0001 | duration_seconds | xsd:decimal |
| OUTP-0002 | end_time | xsd:dateTime |
| OUTP-0003 | exit_code | xsd:integer |
| OUTP-0004 | host_name | xsd:string |
| OUTP-0005 | log_level | xsd:string |
| OUTP-0006 | phase | xsd:string |
| OUTP-0007 | retry_count | xsd:integer |
| OUTP-0008 | scheduled_at | xsd:dateTime |

The entity is the bearer of attributes, and its identity is established through a stable identifier that is independent of any mutable property. Subject entities are identified by keys such as SUBJ-0001 and SUBJ-0002, while process output entities carry identifiers like OUTP-0001 and OUTP-0002. The identifier serves as the anchor for all attribute-value bindings; it is the foreign key that connects a value row back to the entity it describes and to the attribute definition that constrains it. A single entity may accumulate multiple attributes, and a single attribute may be instantiated across many entities. The subject entity SUBJ-0001, for instance, carries the attributes encoding, label_text, and language simultaneously, each bound to its own value, while the process output OUTP-0001 accumulates values across four distinct attribute dimensions — a decimal duration, a dateTime end time, an integer exit code, and a string host name — all referenced through the same entity identifier.

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |

**t_process_min_one_output_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0002 | 2023-04-19T05:25:34 |
| OUTP-0002 | OUTP-0001 | OUTP-0008 | 2023-03-27T21:29:05 |
| OUTP-0003 | OUTP-0001 | OUTP-0009 | 2025-05-24T00:18:25 |
| OUTP-0004 | OUTP-0002 | OUTP-0002 | 2024-01-13T03:16:51 |
| OUTP-0005 | OUTP-0002 | OUTP-0008 | 2024-09-26T20:27:11 |
| OUTP-0006 | OUTP-0002 | OUTP-0009 | 2023-06-30T01:21:38 |
| OUTP-0007 | OUTP-0003 | OUTP-0002 | 2024-04-05T13:10:28 |
| OUTP-0008 | OUTP-0003 | OUTP-0008 | 2023-07-31T01:33:46 |

**t_process_min_one_output_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0001 | 1575.12 |
| OUTP-0002 | OUTP-0002 | OUTP-0001 | 3915.42 |
| OUTP-0003 | OUTP-0003 | OUTP-0001 | 6819.95 |
| OUTP-0004 | OUTP-0004 | OUTP-0001 | 6826.25 |
| OUTP-0005 | OUTP-0005 | OUTP-0001 | 4127.39 |
| OUTP-0006 | OUTP-0006 | OUTP-0001 | 1299.93 |
| OUTP-0007 | OUTP-0007 | OUTP-0001 | 6249.12 |

**t_process_min_one_output_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0003 | 695 |
| OUTP-0002 | OUTP-0001 | OUTP-0007 | 449 |
| OUTP-0003 | OUTP-0002 | OUTP-0003 | 903 |
| OUTP-0004 | OUTP-0002 | OUTP-0007 | 474 |
| OUTP-0005 | OUTP-0003 | OUTP-0003 | 215 |
| OUTP-0006 | OUTP-0003 | OUTP-0007 | 204 |
| OUTP-0007 | OUTP-0004 | OUTP-0003 | 967 |
| OUTP-0008 | OUTP-0004 | OUTP-0007 | 241 |

**t_process_min_one_output_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0004 | ingest-21 |
| OUTP-0002 | OUTP-0001 | OUTP-0005 | Log Level 02 |
| OUTP-0003 | OUTP-0001 | OUTP-0006 | closeout |
| OUTP-0004 | OUTP-0001 | OUTP-0010 | complete |
| OUTP-0005 | OUTP-0001 | OUTP-0011 | Triggered By 05 |
| OUTP-0006 | OUTP-0002 | OUTP-0004 | worker-07 |
| OUTP-0007 | OUTP-0002 | OUTP-0005 | Log Level 07 |
| OUTP-0008 | OUTP-0002 | OUTP-0006 | closeout |

Attribute-value bindings are materialized through a tripartite linkage: the entity identifier, the attribute identifier, and the value itself. This structure decouples the value from both the entity and the attribute definition, allowing the same attribute to be reused across entities and the same entity to be described by different attributes in different contexts. The value column is the misc carrier — it holds heterogeneous data types that are disambiguated not by the column itself but by the attr_id it is joined to, which in turn resolves to a type declaration in the attribute definition table. Thus, the value Encoding 01 is associated with the attribute encoding on entity SUBJ-0001, while the value nightly summary is associated with the attribute label_text on the same entity; both are xsd:string values, but their semantic roles differ entirely because their attribute identifiers differ. Similarly, the decimal value 6826.25 and the integer value 474 are stored in separate value tables keyed by type, yet both are resolved to their correct semantic meaning through the attr_id foreign key that points to duration_seconds and exit_code respectively.

The relationship between entities and their attributes is further contextualized by the broader data model, in which entities participate in subclass hierarchies and process pipelines that define their provenance and output. Subject entities such as those carrying the ice type Calibration Manifest or Provenance Graph Export are related to concepts like Measurement Timeframe and Quality Check Script, establishing a lineage that is separate from but complementary to their attribute bindings. Process outputs are similarly situated within a pipeline architecture: the feature extraction pipeline produces both a cleaned dataset and a feature matrix, while the pipeline rollback procedure yields a rollback snapshot, and the model training run generates a detection alert. Each of these outputs is an entity with its own identifier, its own set of typed attributes, and its own set of value bindings. The subclass relationships — for example, the pairing of ISO 8601 timestamp with Query execution engine, or Parquet row group with Kestrel telemetry probe — provide an additional layer of classification that operates orthogonally to the attribute-value structure, enabling queries that reason about both what an entity is and what properties it carries.

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |

This separation of concerns — identifier for identity, attribute definition for schema, value binding for instance data — is not merely an implementation detail but a governance mechanism. It ensures that attribute types are declared once and enforced everywhere, that values are typed at the point of binding rather than at the point of storage, and that entities can be extended with new attributes without modifying existing data. The system thus supports both static type checking, through the xsd type declarations, and dynamic extensibility, through the ability to add new attribute definitions and bindings without schema migration. A value such as fr, bound to the language attribute on entity SUBJ-0001, is validated against the xsd:string type at declaration time and then available for downstream consumption without any additional type coercion. Likewise, the decimal value 3915.42, bound to the duration_seconds attribute on entity OUTP-0002, retains its numeric precision through the entire pipeline, from ingestion through the feature extraction pipeline to the final cleaned dataset output.