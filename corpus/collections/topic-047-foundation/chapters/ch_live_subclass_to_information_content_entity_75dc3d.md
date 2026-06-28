---
chapter_id: ch_live_subclass_to_information_content_entity_75dc3d
topic_id: 47
family: 01_foundation
cited_terms: ['subclass_to_information_content_entity', 'measurement_subclass_only_one_unit', 'column_pair_subject']
model: engine-refine
---

An attribute is a named property of an entity, and its type determines both the shape of its value and the storage mechanism by which that value is persisted. In the measurement domain, attributes such as `confidence`, `dimension_kind`, `method`, and `recorded_at` are declared with precise XML Schema types—`xsd:decimal`, `xsd:string`, and `xsd:dateTime`—and the system dispatches each attribute's value to a type-specialized value table. A `confidence` score of `0.584` or `0.929` is stored in the decimal value table; the string `Dimension Kind 01` or `Encoding 02` in the varchar table; and the timestamp `2024-07-02T10:17:22` in the datetime table. This type-driven routing ensures that queries against a given attribute can target a single value table, avoiding the cost of type coercion and preserving precision across heterogeneous data.

The entity is the thing to which attributes attach. In the measurement subclass, entities are identified by codes such as `UNIT-0001` through `UNIT-0004`, each representing a distinct measurement—`temperature gradient`, `soil pH`, `soil moisture`, `torque`—and each linked to a unit via the subject column `SUBJ-0004`, `SUBJ-0007`, `SUBJ-0005`, or `SUBJ-0001`. A second family of entities, the column-pair subjects, carries identifiers `SUBJ-0001` through `SUBJ-0004` and represents columns such as `log_level`, `batch_token`, `transaction_id`, and `timestamp_utc`. Both families share the same attribute vocabulary—`confidence`, `dimension_kind`, `method`, `recorded_at`—demonstrating that the attribute model is not tied to a single entity class but is a reusable schema layer that can describe measurement metadata and column metadata alike.

**t_measurement_subclass_only_one_unit**

| id | measurement | unit |
| --- | --- | --- |
| UNIT-0001 | temperature gradient | SUBJ-0004 |
| UNIT-0002 | soil pH | SUBJ-0007 |
| UNIT-0003 | soil moisture | SUBJ-0005 |
| UNIT-0004 | torque | SUBJ-0001 |
| UNIT-0005 | heart rate | SUBJ-0007 |
| UNIT-0006 | packet loss | SUBJ-0001 |

**t_measurement_subclass_only_one_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | Dimension Kind 01 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | Encoding 02 |
| UNIT-0003 | UNIT-0001 | UNIT-0009 | change rationale |
| UNIT-0004 | UNIT-0001 | UNIT-0010 | fr |
| UNIT-0005 | UNIT-0001 | UNIT-0003 | hybrid |
| UNIT-0006 | UNIT-0001 | UNIT-0006 | nm |
| UNIT-0007 | UNIT-0002 | UNIT-0002 | Dimension Kind 07 |
| UNIT-0008 | UNIT-0002 | UNIT-0008 | Encoding 08 |

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | UNIT-0004 |
| SUBJ-0002 | batch_token | UNIT-0005 |
| SUBJ-0003 | transaction_id | UNIT-0005 |
| SUBJ-0004 | timestamp_utc | UNIT-0004 |
| SUBJ-0005 | patient_id | UNIT-0001 |
| SUBJ-0006 | transaction_id | UNIT-0001 |
| SUBJ-0007 | batch_token | UNIT-0003 |

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |

The identifier is the stable key that binds an entity to its attributes and values. Every row in the value tables carries an `entity_id` that references the entity's identifier and an `attr_id` that references the attribute definition, forming a composite foreign key that guarantees each attribute value belongs to exactly one entity and one attribute. For example, the decimal value `680.89` is associated with entity `UNIT-0001` and attribute `UNIT-0005`; the datetime value `2025-05-17T18:10:32` is associated with entity `UNIT-0002` and attribute `UNIT-0004` (`recorded_at`). This two-key structure eliminates ambiguity and supports efficient joins: a query for all attributes of entity `UNIT-0001` scans the `entity_id` index once and retrieves values from whichever type table the attribute definition specifies.

Label text and language provide the human-readable layer that sits above the machine identifiers. The information content entity table maps identifiers such as `ENTI-0001` through `ENTI-0004` to machine-readable information descriptors—`schema_registry`, `telemetry_stream`, `compliance_audit`, `data_catalog_entry`—and to human-facing label texts like `nightly summary`, `pre-release note`, `intake form`, and `change rationale`. Each label is annotated with a language code: `en`, `ja`, `ja`, `es`. This separation of machine identifier, information descriptor, and localized label enables systems to reference entities by stable codes while presenting context-appropriate text to users in their preferred language. The label `change rationale` appears both as a label text in the information content entity and as a varchar value in the measurement attribute value table, illustrating how the same semantic content can serve as a human-readable label in one context and as an attribute value in another.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |

The practical consequence of this design is that attribute definitions, entity definitions, and value storage are decoupled. Adding a new attribute type requires only a new row in the attribute definition table and a corresponding value table; existing entities can acquire new attributes without schema migration. The type system—`xsd:decimal`, `xsd:string`, `xsd:dateTime`—provides a shared vocabulary across measurement and column-pair domains, while the identifier space remains partitioned so that `UNIT-0001` and `SUBJ-0001` refer to entirely different entities despite sharing a naming convention. This architecture supports compliance and governance use cases where audit trails (`compliance_audit`), telemetry streams (`telemetry_stream`), and data catalog entries (`data_catalog_entry`) must each carry rich, typed metadata without entangling the metadata schema with the data schema.

**t_measurement_subclass_only_one_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | confidence | xsd:decimal |
| UNIT-0002 | dimension_kind | xsd:string |
| UNIT-0003 | method | xsd:string |
| UNIT-0004 | recorded_at | xsd:dateTime |
| UNIT-0005 | uncertainty | xsd:decimal |
| UNIT-0006 | unit | xsd:string |
| UNIT-0007 | value | xsd:decimal |
| UNIT-0008 | encoding | xsd:string |

**t_measurement_subclass_only_one_unit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0004 | 2024-07-02T10:17:22 |
| UNIT-0002 | UNIT-0002 | UNIT-0004 | 2025-05-17T18:10:32 |
| UNIT-0003 | UNIT-0003 | UNIT-0004 | 2023-09-23T07:34:54 |
| UNIT-0004 | UNIT-0004 | UNIT-0004 | 2023-07-03T17:50:57 |
| UNIT-0005 | UNIT-0005 | UNIT-0004 | 2025-03-23T11:32:54 |
| UNIT-0006 | UNIT-0006 | UNIT-0004 | 2024-10-11T18:39:44 |

**t_measurement_subclass_only_one_unit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | 0.584 |
| UNIT-0002 | UNIT-0001 | UNIT-0005 | 680.89 |
| UNIT-0003 | UNIT-0001 | UNIT-0007 | 977.36 |
| UNIT-0004 | UNIT-0002 | UNIT-0001 | 0.929 |
| UNIT-0005 | UNIT-0002 | UNIT-0005 | 548.84 |
| UNIT-0006 | UNIT-0002 | UNIT-0007 | 51.31 |
| UNIT-0007 | UNIT-0003 | UNIT-0001 | 0.964 |
| UNIT-0008 | UNIT-0003 | UNIT-0005 | 305.75 |