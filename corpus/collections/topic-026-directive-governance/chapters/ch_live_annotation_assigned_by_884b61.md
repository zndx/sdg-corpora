---
chapter_id: ch_live_annotation_assigned_by_884b61
topic_id: 26
family: 02_observation_measurement
cited_terms: ['annotation_assigned_by', 'annotation_only_about_artifact', 'schemaorg_review_target']
model: engine-refine
---

Annotations serve as the primary mechanism for attaching metadata to entities across a data governance framework, capturing everything from compliance audit trails to telemetry ingestion events and provenance traces. Each annotation is assigned to a target—such as a SoftwareApplication, Person, or Service—and the assignment itself becomes a first-class record that can be traced back through identifiers like ASSI-0001 through ASSI-0004. The assignment relationship is not merely administrative; it anchors the annotation to a concrete schema.org entity, whether that entity is a GraphQLEndpoint, an AzureBlobStorage resource, or a PostgreSQLTable, and the association is mediated through role designations such as owner or contributor that clarify the nature of the relationship between the subject and target.

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | TARG-0005 |
| ASSI-0002 | telemetry_ingestion | TARG-0006 |
| ASSI-0003 | provenance_trace | TARG-0005 |
| ASSI-0004 | provenance_trace | TARG-0006 |
| ASSI-0005 | source_system_sync | TARG-0004 |
| ASSI-0006 | source_system_sync | TARG-0004 |

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

The attribute system provides a flexible, typed schema for enriching annotations with structured metadata. Rather than hardcoding fields, the framework defines attributes by name and type—confidence as an xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime—then stores their values in dedicated type-specific tables. A single annotation can carry multiple attributes: decimal values like 0.167 or 103.53, string values such as Dimension Kind 01 or calibration record, and timestamped entries like 2025-05-21T21:38:03, each linked back to its defining attribute through entity and attribute identifiers. This separation of attribute definitions from their runtime values enables schema evolution without schema migration, as new attribute types can be introduced independently of existing data.

**t_annotation_assigned_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |

Confidence and uncertainty form a dual-axis quality model that quantifies the reliability of annotation facts. Confidence scores—ranging from 0.236 to 0.845 in the observed data—express the degree of belief in an annotation's correctness, while uncertainty values—spanning from 22.02 to 690.59—capture the magnitude of potential error or variance. These metrics are not merely decorative; they enable downstream consumers to weight annotations appropriately in aggregation, filtering, or decision-making pipelines. An annotation with a confidence of 0.845 and an uncertainty of 690.59, for instance, signals high belief but substantial absolute variance, whereas a score of 0.236 paired with 593.98 uncertainty indicates both low confidence and high dispersion, warranting cautious interpretation.

The entity taxonomy organizes annotations through a dimensional layer that assigns labels and categories, providing a hierarchical classification scheme. Labels such as Annotation Label 01 through Annotation Label 04 serve as human-readable identifiers, while categories like Annotation Category 01 through Annotation Category 04 enable grouping and filtering at a semantic level. This dimension table is referenced by fact records through annotation keys, creating a bridge between the categorical taxonomy and the quantitative measures of confidence and uncertainty. The result is a model where every annotation can be classified, measured, and traced to its source entity and assigned target simultaneously.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| ARTI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| ARTI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| ARTI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| ARTI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| ARTI-0001 | Annotation Label 01 | Annotation Category 01 |
| ARTI-0002 | Annotation Label 02 | Annotation Category 02 |
| ARTI-0003 | Annotation Label 03 | Annotation Category 03 |
| ARTI-0004 | Annotation Label 04 | Annotation Category 04 |
| ARTI-0005 | Annotation Label 05 | Annotation Category 05 |
| ARTI-0006 | Annotation Label 06 | Annotation Category 06 |

The schema.org review target structure extends the annotation framework into a graph of interrelated entities, where each target can be associated with multiple review items through a junction table that encodes both the relationship and its role. A Service entity, for example, may have an AzureBlobStorage resource linked as a contributor and a PostgreSQLTable linked as an owner, with each association carrying its own identifier and role semantics. This design supports complex provenance scenarios where a single entity participates in multiple relationships with different responsibilities, and where the same review item can appear under different roles across different schema.org targets. The combination of subject, target, and role fields creates a triple-based model that is both expressive and queryable, enabling traversal of the entity graph from any entry point.

**t_schemaorg_review_target**

| id | schemaorg |
| --- | --- |
| TARG-0001 | SoftwareApplication |
| TARG-0002 | Person |
| TARG-0003 | Service |
| TARG-0004 | Service |
| TARG-0005 | Service |
| TARG-0006 | Person |

**t_schemaorg_review_target_reviews_item**

| id | reviews_item |
| --- | --- |
| TARG-0001 | GraphQLEndpoint |
| TARG-0002 | AzureBlobStorage |
| TARG-0003 | AzureBlobStorage |
| TARG-0004 | PostgreSQLTable |
| TARG-0005 | AzureBlobStorage |
| TARG-0006 | GraphQLEndpoint |

**t_schemaorg_review_target__reviews_item**

| id | schemaorg_id | reviews_item_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0003 | TARG-0003 | owner |
| TARG-0002 | TARG-0004 | TARG-0003 | contributor |
| TARG-0003 | TARG-0006 | TARG-0006 | contributor |
| TARG-0004 | TARG-0005 | TARG-0001 | owner |
| TARG-0005 | TARG-0005 | TARG-0005 | owner |
| TARG-0006 | TARG-0001 | TARG-0005 | observer |
| TARG-0007 | TARG-0005 | TARG-0004 | observer |
| TARG-0008 | TARG-0005 | TARG-0001 | contributor |