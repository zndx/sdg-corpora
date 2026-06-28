---
chapter_id: ch_live_span_with_parent_3f1902
topic_id: 172
family: 07_long_tail
cited_terms: ['span_with_parent', 'annotation_basic', 'insertion_loss_specification']
model: engine-refine
---

In distributed systems and data governance, the identifier serves as the immutable anchor for every entity, whether it is a trace span such as `PARE-0001` representing an orchestrator job, an annotation like `ANNO-0001` documenting a lab sample preservation log, or an insertion loss specification such as `SPEC-0001` defining a connector-loss baseline. Each identifier is scoped to its domain—span identifiers follow the `PARE-` prefix, annotations use `ANNO-`, and specifications carry `SPEC-`—ensuring that cross-referencing between heterogeneous entity types remains unambiguous. The entity itself is the conceptual object being described: a span captures a unit of work within a request lifecycle, an annotation records an observation or quality flag, and an insertion loss specification codifies a hardware performance threshold. These entities are not monolithic records; they are decomposed into attributes and values so that metadata can evolve independently of the core entity definition.

**t_span_with_parent**

| id | span |
| --- | --- |
| PARE-0001 | orchestrator job |
| PARE-0002 | api gateway route |
| PARE-0003 | request router |
| PARE-0004 | gateway auth check |
| PARE-0005 | kafka consumer process |
| PARE-0006 | gateway auth check |
| PARE-0007 | orchestrator job |
| PARE-0008 | service mesh proxy |

**t_span_with_parent_parent_span**

| id | parent_span |
| --- | --- |
| PARE-0001 | cache lookup session |
| PARE-0002 | service mesh proxy |
| PARE-0003 | load balancer forward |
| PARE-0004 | service mesh proxy |
| PARE-0005 | kafka consumer process |
| PARE-0006 | kafka consumer process |

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

**t_insertion_loss_specification**

| id | insertion_loss_specification |
| --- | --- |
| SPEC-0001 | Connector-Loss-Baseline |
| SPEC-0002 | Connector-Loss-Baseline |
| SPEC-0003 | Filter-Insertion-Depth |
| SPEC-0004 | Transceiver-Margin-Spec |
| SPEC-0005 | Antenna-Feed-Loss |
| SPEC-0006 | Optic-Coupler-Loss |

**t_insertion_loss_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_insertion_loss_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | intake form |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | fr |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | automated |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | ratio |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

The attribute model separates what is being measured from how it is measured. An attribute name—such as `confidence`, `dimension_kind`, `method`, or `recorded_at`—defines the semantic dimension of a property, while the attribute type constrains its format to a schema-defined datatype like `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. This separation is critical because the same attribute name can appear across different entity families without conflict: `confidence` as an `xsd:decimal` applies to both annotation `ANNO-0001` (with a value of `0.902`) and insertion loss specification `SPEC-0001` (with a value of `0.131`), yet each value is scoped to its entity through the entity identifier. The type system ensures that a decimal value like `146.86` is never conflated with a string value like `Dimension Kind 01` or a datetime value like `2023-10-01T01:18:56`, even when all three belong to the same entity.

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

**t_insertion_loss_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-12-28T03:34:41 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-07-30T00:55:27 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2024-10-08T23:01:51 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2024-02-08T16:58:47 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2024-02-29T05:58:20 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-21T07:18:41 |

**t_insertion_loss_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.131 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 129.10 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 470.08 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.111 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 499.91 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 156.27 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.125 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 625.08 |

The value tables implement an entity-attribute-value pattern where each row binds an entity identifier to an attribute identifier and stores the actual value in a type-specific table. For datetime attributes, the value column holds ISO 8601 timestamps such as `2024-12-28T03:34:41` for specification `SPEC-0001` or `2024-08-04T06:45:48` for annotation `ANNO-0002`. Decimal values capture precision measurements like `292.49` or `470.08`, while varchar values store freeform descriptors such as `Encoding 02`, `intake form`, or the locale code `fr`. This type-disaggregated design means that querying for all confidence scores across entity types requires joining only the decimal value table, while datetime lookups route exclusively to the datetime value table, avoiding the null proliferation and type coercion problems inherent in a single wide attribute table.

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

Relationships between entities are captured through a subject-target-role triad. In the span-parent junction table, the subject column identifies the child span—`PARE-0004` (gateway auth check) or `PARE-0002` (api gateway route)—while the target column identifies the parent span, such as `PARE-0002` (load balancer forward) or `PARE-0005` (service mesh proxy). The role column qualifies the nature of the relationship: `owner` denotes direct responsibility, `observer` indicates passive monitoring, and `reviewer` signals an audit or approval function. For instance, span `PARE-0004` has role `owner` with parent span `PARE-0002`, while span `PARE-0003` carries role `owner` against parent span `PARE-0001`. This tripartite structure allows a single subject-target pair to support multiple roles, enabling nuanced governance models where the same span might be both owned and observed by different parent contexts.

**t_span_with_parent__parent_span**

| id | span_id | parent_span_id | role |
| --- | --- | --- | --- |
| PARE-0001 | PARE-0004 | PARE-0002 | owner |
| PARE-0002 | PARE-0002 | PARE-0005 | observer |
| PARE-0003 | PARE-0003 | PARE-0001 | owner |
| PARE-0004 | PARE-0005 | PARE-0005 | reviewer |
| PARE-0005 | PARE-0005 | PARE-0003 | owner |
| PARE-0006 | PARE-0005 | PARE-0002 | observer |
| PARE-0007 | PARE-0004 | PARE-0002 | observer |
| PARE-0008 | PARE-0006 | PARE-0005 | contributor |

The practical significance of this architecture lies in its support for heterogeneous metadata without schema rigidity. An insertion loss specification like `Filter-Insertion-Depth` (`SPEC-0003`) carries the same attribute vocabulary as an annotation like `Observation confidence score` (`ANNO-0003`), yet each entity family maintains its own value tables, preserving type safety and query performance. The identifier provides referential integrity across all tables, the attribute definition provides semantic clarity, the attribute type provides structural constraints, and the subject-target-role relationship provides organizational context. Together, these constructs form a data model where entities are described through composable, type-safe attributes and linked through role-qualified relationships—a pattern that scales from tracing microservice request flows to governing hardware specifications and laboratory annotations within a single coherent framework.