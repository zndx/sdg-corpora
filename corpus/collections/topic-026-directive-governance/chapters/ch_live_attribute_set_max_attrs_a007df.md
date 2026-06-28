---
chapter_id: ch_live_attribute_set_max_attrs_a007df
topic_id: 26
family: 02_observation_measurement
cited_terms: ['attribute_set_max_attrs', 'rollback_relation', 'subclass_not_basic']
model: engine-refine
---

In governed operational and compliance systems, an identifier is the durable handle that lets auditors, integrators, and rollback procedures refer to the same record across time, storage partitions, and typed value stores without ambiguity. Identifiers such as `ATTR-0001` or `RELA-0003` are not themselves measurements or rollback events; they are stable keys that anchor everything else. When a nightly sync is reversed or a failed config deploy must be unwound, the rollback relation `nightly-sync-rollback` does not merely name an operation—it points through `rolls_back_to` at `ATTR-0003`, re-establishing which governed object the procedure targets. That indirection is what makes lineage auditable: the identifier survives even when the descriptive labels, confidence scores, or timestamps attached to the entity change.

**t_rollback_relation**

| id | rollback | rolls_back_to |
| --- | --- | --- |
| RELA-0001 | release-tag-v3.2 | ATTR-0003 |
| RELA-0002 | telemetry-archive-oct | ATTR-0001 |
| RELA-0003 | nightly-sync-rollback | ATTR-0003 |
| RELA-0004 | config-deploy-fail | ATTR-0003 |
| RELA-0005 | model-checkpoint-88 | ATTR-0003 |
| RELA-0006 | batch-processing-halt | ATTR-0002 |

**t_rollback_relation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RELA-0001 | confidence | xsd:decimal |
| RELA-0002 | dimension_kind | xsd:string |
| RELA-0003 | method | xsd:string |
| RELA-0004 | recorded_at | xsd:dateTime |
| RELA-0005 | uncertainty | xsd:decimal |
| RELA-0006 | unit | xsd:string |
| RELA-0007 | value | xsd:decimal |
| RELA-0008 | encoding | xsd:string |

An entity is the thing the system is trying to describe, govern, or restore—not the metadata row that defines it, and not the individual fact stored about it. In practice, entities appear wherever observations are scoped: a `entity_id` of `ATTR-0001` may carry a decimal confidence of `0.687`, a varchar dimension kind of `Dimension Kind 01`, and a `recorded_at` timestamp of `2024-07-05T18:39:47`, all as separate assertions about the same governed object. The pattern repeats for rollback relations, where `RELA-0001` accumulates its own decimal, string, and datetime values under the same entity key. Entities therefore function as the compositional center of compliance evidence: they bind heterogeneous facts into a single auditable subject, whether that subject is a telemetry attribute like `voltage_dc` or an operational event like `release-tag-v3.2`.

An attr—short for attribute in this domain—is the named property through which facts are classified, validated, and retrieved. Attributes are defined declaratively: `confidence`, `dimension_kind`, `method`, and `recorded_at` recur across both attribute-set and rollback-relation contexts because they represent cross-cutting governance dimensions rather than one-off columns on a monolithic table. At observation time, each stored value carries an `attr_id` that resolves to one of those definitions, so a decimal row referencing `ATTR-0001` as its attribute is asserting confidence, while a datetime row referencing `ATTR-0004` is asserting when the observation was recorded. This separation matters for policy enforcement: you can require `recorded_at` on every entity, cap `confidence` to a decimal range, or treat `method` as a controlled vocabulary without redesigning the underlying entity model.

Attr type is the contract that determines where a value may live and how it may be interpreted. Types are expressed here in XSD terms—`xsd:decimal` for numeric precision such as `0.041` or `717.59`, `xsd:string` for lexical values including `Encoding 02` and audit excerpts, and `xsd:dateTime` for instants like `2025-03-29T09:43:13`. The type system is not decorative; it drives physical partitioning into typed value stores so that validators, query planners, and retention rules can treat decimals, strings, and timestamps differently while still joining them back to the same entity through shared identifiers. When `dimension_kind` is typed as `xsd:string` and `confidence` as `xsd:decimal`, downstream consumers know that comparing `0.999` to `Dimension Kind 01` is a category error, and that compliance checks can safely apply numeric thresholds only where the attribute definition permits it.

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

**t_attribute_set_max_attrs_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

Misc, in this framework, denotes the stored payload—the actual value field that completes the observation once identifier, entity, and attribute have fixed the context. A misc value is intentionally typed at rest: `391.05` belongs with decimal attributes, `de` and `pre-release note` belong with varchar attributes, and `2024-01-11T10:28:20` belongs with datetime attributes. Treating the payload as misc rather than as an undifferentiated blob preserves semantic discipline while still allowing rich, heterogeneous evidence on a single entity. The same entity `ATTR-0001` can therefore simultaneously hold a confidence decimal, a dimension kind string, and an encoding label without collapsing those distinct governance meanings into one overloaded field.

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

Taken together, identifier, entity, attr, attr type, and misc implement a flexible but enforceable evidence model suitable for compliance handbooks and operational guides. Core governed quantities—`voltage_dc`, `flow_rate_lpm`, `humidity_percent`, `particulate_um`—receive stable entity identities, while rollback relations mirror the same structure so that restoration events remain as auditable as the measurements they affect. Subclass or auxiliary records such as `NOT-0001` through `NOT-0004` may carry their own identifiers without participating in the full attribute-value lattice, illustrating that not every governed object needs the complete metadata surface area. The practical payoff is traceability under change: when `config-deploy-fail` rolls back to `ATTR-0003`, reviewers can follow identifiers to entities, entities to attribute definitions, attribute definitions to XSD types, and types to the exact misc values that constituted the record at the moment of failure—without conflating names, types, and payloads into a single undifferentiated store.

**t_rollback_relation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0004 | 2024-05-22T12:01:29 |
| RELA-0002 | RELA-0002 | RELA-0004 | 2024-03-03T15:52:05 |
| RELA-0003 | RELA-0003 | RELA-0004 | 2024-01-11T10:28:20 |
| RELA-0004 | RELA-0004 | RELA-0004 | 2025-05-09T21:44:43 |
| RELA-0005 | RELA-0005 | RELA-0004 | 2023-08-15T18:37:49 |
| RELA-0006 | RELA-0006 | RELA-0004 | 2023-12-04T10:02:30 |

**t_rollback_relation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0001 | 0.023 |
| RELA-0002 | RELA-0001 | RELA-0005 | 717.59 |
| RELA-0003 | RELA-0001 | RELA-0007 | 918.13 |
| RELA-0004 | RELA-0002 | RELA-0001 | 0.999 |
| RELA-0005 | RELA-0002 | RELA-0005 | 360.64 |
| RELA-0006 | RELA-0002 | RELA-0007 | 735.68 |
| RELA-0007 | RELA-0003 | RELA-0001 | 0.137 |
| RELA-0008 | RELA-0003 | RELA-0005 | 883.40 |

**t_rollback_relation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0002 | Dimension Kind 01 |
| RELA-0002 | RELA-0001 | RELA-0008 | Encoding 02 |
| RELA-0003 | RELA-0001 | RELA-0009 | pre-release note |
| RELA-0004 | RELA-0001 | RELA-0010 | de |
| RELA-0005 | RELA-0001 | RELA-0003 | automated |
| RELA-0006 | RELA-0001 | RELA-0006 | kg |
| RELA-0007 | RELA-0002 | RELA-0002 | Dimension Kind 07 |
| RELA-0008 | RELA-0002 | RELA-0008 | Encoding 08 |

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |