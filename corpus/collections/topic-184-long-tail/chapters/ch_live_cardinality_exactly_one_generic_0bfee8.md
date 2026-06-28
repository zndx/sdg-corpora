---
chapter_id: ch_live_cardinality_exactly_one_generic_0bfee8
topic_id: 184
family: 01_foundation
cited_terms: ['cardinality_exactly_one_generic', 'backward_compatible_with', 'column_tag_from_annotator']
model: engine-refine
---

In governed information systems, stable identifiers anchor every auditable fact to a durable record that can be referenced across schemas, releases, and organizational boundaries without ambiguity. An identifier such as GENE-0001 or ANNO-0003 is not merely a surrogate key; it is the contractual handle by which cardinality rules, compatibility assertions, and annotation provenance remain joinable when physical storage is partitioned, versioned, or migrated. Where cardinality is declared ExclusiveOwner against CoreService, or StrictParent against DesignatedOwner, the identifier carries enforcement semantics: the system can reject writes that would violate exactly-one ownership or mandatory lineage, because the constraint is bound to a named, addressable rule instance rather than to an implicit convention in application code.

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |

Entity denotes the thing that bears attributes and participates in relationships—the unit of governance inspection. In annotation workflows, entity ANNO-0001 represents a concrete tagging act on ingestion_latency by lab_technician, while ANNO-0004 records a separate act on api_version by compliance_officer. Separating entity from identifier allows the same logical subject to accumulate multiple attribute assertions over time, and allows cross-table integrity checks to verify that every value row references a declared entity and a declared attribute definition. Without entity as first-class semantics, typed value stores devolve into opaque key–value bags in which provenance, cardinality, and compatibility cannot be reconstructed for audit.

Attr and attr_type form the definitional layer that constrains what may be said about an entity and how it may be serialized. Attribute confidence is typed xsd:decimal and therefore admits quantitative comparison—0.302 on ANNO-0001 versus 0.049 on ANNO-0002—whereas dimension_kind as xsd:string carries categorical literals such as Dimension Kind 01 and Encoding 02 under the same entity without type coercion. recorded_at, typed xsd:dateTime, closes the evidentiary loop with instants including 2025-01-07T23:20:10 and 2023-05-11T14:25:42, establishing when an assertion entered the record irrespective of downstream processing latency. attr_type is the compliance gate: misc values that do not conform to the declared type are rejected or quarantined before they can pollute aggregates, dashboards, or regulatory submissions.

Misc is the carried payload—the fact itself—stored in type-specialized relations so validation, indexing, and retention policies can differ by representation without fragmenting the entity model. Decimal misc rows attach measurements and scores to entity–attribute pairs; varchar misc rows hold method=nightly summary and language=en; datetime misc rows timestamp the assertion event. The tripartite pattern—entity_id, attr_id, value—decouples schema evolution from content growth: new attributes (method, recorded_at) extend the catalog without rewriting historical misc rows, and re-typing an attribute forces a controlled migration path rather than silent reinterpretation of legacy misc.

Subject and target orient directed assertions in compatibility and dependency graphs, while role qualifies the nature of the linkage so that symmetric-looking edges are not treated as interchangeable. In backward-compatibility governance, subject WITH-0001 (gRPC 1.50) is asserted backward_compatible_with target WITH-0005 (OpenTelemetry 1.10) under role observer, whereas another pairing carries role owner—signalling custodial responsibility distinct from observational endorsement. Chains such as Kafka 2.8 appearing both as a backward artifact and as a compatibility target illustrate why subject–target discipline matters: without explicit direction and role, transitive closure algorithms may infer obligations that the governing standard never intended, and migration planners cannot distinguish mandatory adoption from monitored coexistence.

**t_backward_compatible_with**

| id | backward |
| --- | --- |
| WITH-0001 | gRPC 1.50 |
| WITH-0002 | Terraform v1.4 |
| WITH-0003 | Kafka 2.8 |
| WITH-0004 | Rust 1.50 |
| WITH-0005 | gRPC 1.50 |
| WITH-0006 | gRPC 1.27 |
| WITH-0007 | Parquet 2.0 |
| WITH-0008 | OAuth 1.0 |

**t_backward_compatible_with_backward_compatible_with**

| id | backward_compatible_with |
| --- | --- |
| WITH-0001 | OpenTelemetry 1.10 |
| WITH-0002 | Avro 1.9 |
| WITH-0003 | Kafka 2.8 |
| WITH-0004 | Avro 1.9 |
| WITH-0005 | Parquet 2.0 |
| WITH-0006 | Parquet 2.0 |
| WITH-0007 | Terraform v0.13 |

**t_backward_compatible_with__backward_compatible_with**

| id | backward_id | backward_compatible_with_id | role |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0005 | observer |
| WITH-0002 | WITH-0007 | WITH-0007 | observer |
| WITH-0003 | WITH-0005 | WITH-0001 | owner |
| WITH-0004 | WITH-0008 | WITH-0005 | observer |
| WITH-0005 | WITH-0002 | WITH-0002 | reviewer |
| WITH-0006 | WITH-0008 | WITH-0006 | reviewer |
| WITH-0007 | WITH-0004 | WITH-0004 | owner |
| WITH-0008 | WITH-0008 | WITH-0001 | observer |

Operational practice treats identifier, entity, attr, attr_type, misc, subject, target, and role as interoperable primitives across cardinality enforcement, version matrices, and human–machine annotation. Cardinality identifiers GENE-0003 and GENE-0004 bind StrictParent to SourceSystem; compatibility identifiers WITH-0002 and WITH-0003 bind Terraform v1.4 and Kafka 2.8 into cross-standard graphs; annotation identifiers thread column, by_annotator, attr_name, and typed misc into a single evidentiary object suitable for handbook citation. Mature deployments require that every misc value resolve to a typed attr on a known entity, that every graph edge name its subject, target, and role, and that every rule or tag remain retrievable by identifier when assessors demand reproducible proof—because governance frameworks fail not when data is abundant, but when facts cannot be traced to the definitions and relationships that authorized them.

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | lab_technician |
| ANNO-0002 | compliance_flag | lab_technician |
| ANNO-0003 | api_version | auto_classifier |
| ANNO-0004 | api_version | compliance_officer |
| ANNO-0005 | compliance_flag | governance_board |
| ANNO-0006 | event_timestamp | ml_inference_engine |

**t_column_tag_from_annotator_attr**

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

**t_column_tag_from_annotator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2025-01-07T23:20:10 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-03-06T18:58:36 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2024-05-08T12:18:31 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-05-11T14:25:42 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2023-11-26T14:31:09 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2024-05-18T09:15:26 |

**t_column_tag_from_annotator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.302 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 639.96 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 206.06 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.049 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 98.50 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 895.36 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.609 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 158.17 |

**t_column_tag_from_annotator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | nightly summary |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | en |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | hybrid |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | kg |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |