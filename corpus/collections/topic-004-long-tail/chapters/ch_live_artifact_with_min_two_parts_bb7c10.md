---
chapter_id: ch_live_artifact_with_min_two_parts_bb7c10
topic_id: 4
family: 01_foundation
cited_terms: ['artifact_with_min_two_parts', 'measurement_observed_at', 'schemaorg_product_price']
model: engine-refine
---

In any structured data ecosystem, the identifier serves as the immutable anchor for every entity, whether it is a software artifact, a telemetry measurement, or a commercial product. Identifiers such as PART-0001 through PART-0004 uniquely tag artifacts like the raw_telemetry_dump or compliance_manifest, while OBSE-0001 through OBSE-0004 identify measurement observations and PRIC-0001 through PRIC-0004 identify product-price records. This uniform addressing scheme enables cross-referencing across domains: a measurement recorded at PRIC-0003, for instance, can be traced back to the Apple AirPods Pro product record without ambiguity. The identifier is the primary key by which every other attribute and relationship resolves, and its stability underpins the entire data model's referential integrity.

**t_artifact_with_min_two_parts**

| id | artifact | checksum | version |
| --- | --- | --- | --- |
| PART-0001 | raw_telemetry_dump | c0ffee42 | 7 |
| PART-0002 | compliance_manifest | a3f9c21e | 5 |
| PART-0003 | inference_model_final | 5e8f3c91 | 11 |
| PART-0004 | ingestion_script_main | 7b14de08 | 10 |
| PART-0005 | etl_pipeline_run | 1a4b6c2d | 9 |

**t_measurement_observed_at**

| id | measurement | observed_at |
| --- | --- | --- |
| OBSE-0001 | temperature gradient | PRIC-0003 |
| OBSE-0002 | packet loss | PRIC-0003 |
| OBSE-0003 | wind shear | PRIC-0005 |
| OBSE-0004 | network latency | PRIC-0003 |
| OBSE-0005 | pH level | PRIC-0005 |
| OBSE-0006 | pH level | PRIC-0006 |

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

**t_schemaorg_product_price**

| id | schemaorg |
| --- | --- |
| PRIC-0001 | Apple AirPods Pro |
| PRIC-0002 | Dyson V15 |
| PRIC-0003 | Bose QC Ultra |
| PRIC-0004 | Samsung Galaxy S24 |
| PRIC-0005 | Dyson V15 |
| PRIC-0006 | Apple AirPods Pro |

**t_schemaorg_product_price_price**

| id | price |
| --- | --- |
| PRIC-0001 | 1599 GBP |
| PRIC-0002 | 199.99 CAD |
| PRIC-0003 | $449.95 |
| PRIC-0004 | $349.00 |
| PRIC-0005 | $349.00 |
| PRIC-0006 | $349.00 |
| PRIC-0007 | 1599 GBP |

Attributes and their types form the descriptive layer that gives entities semantic meaning. An attribute—such as confidence, dimension_kind, method, or recorded_at—captures a specific characteristic of an entity, while the attribute type constrains the kind of value that attribute may hold. The type system enforces schema discipline: confidence is typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This separation of attribute definition from attribute value allows the system to store heterogeneous data in type-specialized value tables. Decimal measurements like 0.528 or 280.63 reside in the decimal value store, datetime stamps such as 2023-12-12T12:05:13 in the datetime store, and free-form strings like Dimension Kind 01 or calibration record in the varchar store. Each value row links back to its entity and attribute through foreign keys, ensuring that every datum is traceable to its source definition.

Versioning and checksums provide the integrity and provenance guarantees that make this structure auditable. Every artifact carries a version number—version 7 for the raw_telemetry_dump, version 11 for the inference_model_final—and a checksum such as c0ffee42 or 5e8f3c91 that serves as a cryptographic fingerprint of the artifact's contents. Together, these two fields enable change detection and tamper verification: any modification to the artifact will produce a different checksum, and the version number records the sequence of changes over time. In compliance-sensitive contexts, where a compliance_manifest or ingestion_script_main must be reproduced and verified, the combination of checksum and version is the minimal unit of provenance.

Subject, target, and role describe the relationship layer that connects entities beyond simple attribute-value pairs. A relationship row identifies a subject—the originating entity—and a target—the entity being related to—along with a role that specifies the nature of the connection. In the product pricing domain, the schemaorg product record PRIC-0001 (Apple AirPods Pro) relates to the price record PRIC-0001 through a reviewer role, and to PRIC-0007 through a contributor role, indicating that multiple pricing records can be associated with a single product under different functional roles. This triad of subject, target, and role generalizes beyond pricing: any entity can be the subject of a relationship, any other entity can be the target, and the role field encodes the semantic context of the link. The result is a graph-like structure built on top of the entity-attribute-value foundation, where relationships carry their own metadata and can be queried, filtered, and audited independently.

**t_schemaorg_product_price__price**

| id | schemaorg_id | price_id | role |
| --- | --- | --- | --- |
| PRIC-0001 | PRIC-0001 | PRIC-0001 | reviewer |
| PRIC-0002 | PRIC-0003 | PRIC-0007 | reviewer |
| PRIC-0003 | PRIC-0003 | PRIC-0003 | contributor |
| PRIC-0004 | PRIC-0001 | PRIC-0007 | contributor |
| PRIC-0005 | PRIC-0006 | PRIC-0002 | contributor |
| PRIC-0006 | PRIC-0002 | PRIC-0003 | contributor |
| PRIC-0007 | PRIC-0001 | PRIC-0006 | reviewer |
| PRIC-0008 | PRIC-0004 | PRIC-0006 | owner |