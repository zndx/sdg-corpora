---
chapter_id: ch_live_descriptive_not_retracted_6f1138
topic_id: 47
family: 07_long_tail
cited_terms: ['descriptive_not_retracted', 'subclass_to_information_content_entity', 'requirement_applies_to_system']
model: engine-refine
---

Attributes, their types, and the entities to which they attach constitute the fundamental scaffolding of any structured data governance framework. An attribute is a named property—such as `confidence`, `dimension_kind`, `method`, or `recorded_at`—that describes some facet of an entity, and its type constrains the domain of permissible values. In the descriptive record domain, the table `t_descriptive_not_retracted_attr` enumerates these properties alongside their XSD types: `xsd:decimal` for `confidence`, `xsd:string` for `dimension_kind` and `method`, and `xsd:dateTime` for `recorded_at`. The same pattern recurs in the requirements domain, where `t_requirement_applies_to_system_attr` defines `effective_date` as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. This type discipline ensures that every value stored against an attribute conforms to a well-defined schema, a prerequisite for automated validation and cross-system interoperability.

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

Entities serve as the anchor points to which attributes are bound. Each entity carries a stable identifier—`RETR-0001` through `RETR-0004` in the descriptive domain, `ENTI-0001` through `ENTI-0004` in the information content domain, and `SYST-0001` through `SYST-0004` in the requirements domain—and is further characterized by human-readable labels. The table `t_descriptive_not_retracted` associates identifiers such as `RETR-0001` with descriptive entries like "Sensor Drift Note" and secondary descriptors such as "Metadata Extension Record"; `t_subclass_to_information_content_entity` maps `ENTI-0001` to the information type `schema_registry` with the label text "nightly summary" in language `en`, while `ENTI-0003` carries the label "intake form" in language `ja`. In the requirements domain, `t_requirement_applies_to_system` binds `SYST-0001` to the requirement "latency under 50ms" and `SYST-0003` to "encryption at rest". These identifiers and labels provide the stable, queryable identity that allows attributes, values, and metadata to be resolved unambiguously across the system.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

The separation of attribute definitions from their concrete values is achieved through a family of typed value tables, each keyed by a surrogate `id` and linked back to its entity and attribute via foreign keys `entity_id` and `attr_id`. For the descriptive records, `t_descriptive_not_retracted_val_decimal` stores numeric measurements such as `0.736` and `273.61` against entity `RETR-0001` and attribute `RETR-0001`; `t_descriptive_not_retracted_val_varchar` holds string values like "Dimension Kind 01", "Encoding 02", and the language code "es" against the same entity; and `t_descriptive_not_retracted_val_datetime` records timestamps including `2024-02-12T07:34:36` and `2025-01-21T18:04:20` against entity `RETR-0004` and attribute `RETR-0004`. The requirements domain mirrors this structure: `t_requirement_applies_to_system_val_boolean` stores `true` and `false` for the `mandatory` attribute across systems `SYST-0001` through `SYST-0004`; `t_requirement_applies_to_system_val_date` captures effective dates such as `2025-05-21` and `2023-05-13`; `t_requirement_applies_to_system_val_int` holds priority scores like `391` and `295`; and `t_requirement_applies_to_system_val_varchar` stores strings including "audit excerpt" and the language code "fr". This type-dispatched value architecture avoids the pitfalls of wide, sparse tables while preserving full type safety.

The foreign-key relationships between these tables form a coherent entity-attribute-value graph that supports both extensibility and auditability. An attribute defined in `t_descriptive_not_retracted_attr` with `id` `RETR-0001` can be referenced by any number of rows in the corresponding value table, each row tying that attribute to a specific entity via `entity_id` and carrying a single typed `value`. Similarly, `t_requirement_applies_to_system_attr` entries such as `SYST-0003` (the `mandatory` attribute) are referenced by `t_requirement_applies_to_system_val_boolean`, where `attr_id` resolves to the attribute definition and `entity_id` resolves to the system requirement in `t_requirement_applies_to_system`. The `t_subclass_to_information_content_entity` table extends this model by attaching multilingual label text—`label_text` columns carrying values like "pre-release note" in `ja` or "change rationale" in `es`—to information content entities, enabling localized presentation without duplicating the underlying data. Together, these tables encode not only what data exists but how it is typed, labeled, and related, providing the structural foundation for compliance tracking, data lineage, and governance enforcement.