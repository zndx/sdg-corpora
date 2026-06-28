---
chapter_id: ch_live_requirement_under_standard_d02f6b
topic_id: 186
family: 03_directive_governance
cited_terms: ['requirement_under_standard', 'perf_buffer_map_subclass', 'column_type_changed_from']
model: engine-refine
---

In data governance frameworks, attributes serve as the fundamental descriptors that give meaning to entities—whether those entities are compliance requirements, performance benchmarks, or dimensional records. An attribute is defined by a name and a type, where the type constrains the shape and semantics of the values it can carry. The attribute registry captures this metadata explicitly: an attribute named `effective_date` carries the type `xsd:date`, while `mandatory` is typed as `xsd:boolean`, `priority` as `xsd:integer`, and `enforcement` as `xsd:string`. This separation of attribute definition from attribute value is deliberate. It allows the system to validate data at ingestion, enforce schema-level constraints, and support type-aware queries without embedding structural knowledge into every value row. The type system itself is extensible, drawing on standard XML Schema datatypes like `xsd:date` and `xsd:string`, as well as custom namespaces such as `cco:DesignativeICE` for designative identifiers.

**t_requirement_under_standard_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAN-0001 | effective_date | xsd:date |
| STAN-0002 | enforcement | xsd:string |
| STAN-0003 | mandatory | xsd:boolean |
| STAN-0004 | priority | xsd:integer |
| STAN-0005 | review_cycle_days | xsd:integer |
| STAN-0006 | scope | xsd:string |
| STAN-0007 | encoding | xsd:string |
| STAN-0008 | label_text | xsd:string |

**t_perf_buffer_map_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MAP-0001 | checksum | xsd:string |
| MAP-0002 | created_date | xsd:date |
| MAP-0003 | identifier | cco:DesignativeICE |
| MAP-0004 | license | xsd:string |
| MAP-0005 | mime_type | xsd:string |
| MAP-0006 | size_bytes | xsd:long |
| MAP-0007 | uri | xsd:string |
| MAP-0008 | version | xsd:integer |

Values are stored separately from their definitions, organized by type into dedicated value tables. This design means that a single entity—identified by a stable identifier such as `STAN-0001` or `MAP-0001`—can carry multiple attributes, each with a value stored in the appropriate type-specific table. For instance, the requirement "Minimum sampling rate" (identifier `STAN-0001`) has an `effective_date` value of `2024-02-08` stored in the date value table, while the same requirement carries a `mandatory` attribute with the boolean value `true` in the boolean value table. Integer attributes store values like `3` and `224` for priority levels, and string attributes hold freeform text such as "Encoding 01", "audit excerpt", or "Enforcement 02". The performance benchmark tables follow the same pattern: the benchmark `cassandra-perf` (identifier `MAP-0001`) has a checksum value of `a3f9c21e`, a license of `CC-BY-4.0`, and a geographic identifier of `ap-south-2`, each stored in the varchar value table, while its `created_date` of `2023-01-21` resides in the date table. This type-partitioned storage ensures that queries targeting a specific attribute type can be executed efficiently, and that type coercion errors are caught at the schema level rather than at query time.

**t_perf_buffer_map_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0002 | 2023-01-21 |
| MAP-0002 | MAP-0002 | MAP-0002 | 2023-09-17 |
| MAP-0003 | MAP-0003 | MAP-0002 | 2023-07-22 |
| MAP-0004 | MAP-0004 | MAP-0002 | 2024-09-18 |
| MAP-0005 | MAP-0005 | MAP-0002 | 2025-02-25 |
| MAP-0006 | MAP-0006 | MAP-0002 | 2024-02-08 |
| MAP-0007 | MAP-0007 | MAP-0002 | 2024-05-18 |

**t_perf_buffer_map_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0001 | a3f9c21e |
| MAP-0002 | MAP-0001 | MAP-0003 | gid://svc/77 |
| MAP-0003 | MAP-0001 | MAP-0004 | CC-BY-4.0 |
| MAP-0004 | MAP-0001 | MAP-0009 | ap-south-2 |
| MAP-0005 | MAP-0001 | MAP-0005 | application/xml |
| MAP-0006 | MAP-0001 | MAP-0010 | Name 06 |
| MAP-0007 | MAP-0001 | MAP-0011 | governance |
| MAP-0008 | MAP-0001 | MAP-0012 | Tags 08 |

The entity-identifier relationship is the connective tissue that binds attributes to the things they describe. Every value row carries an `entity_id` that references the entity to which the attribute belongs, and an `attr_id` that references the attribute definition. In the requirement-under-standard model, the entity `STAN-0001` is linked to the attribute `STAN-0003` (the `mandatory` boolean attribute) with a value of `true`, establishing that the "Minimum sampling rate" requirement is mandatory. Similarly, the performance buffer mapping table links the benchmark `MAP-0001` (cassandra-perf) to the standard `STAN-0002` (Quality threshold), creating a traceable relationship between operational performance data and compliance obligations. The identifier system is hierarchical and consistent: requirement identifiers follow the pattern `STAN-XXXX`, performance buffer identifiers follow `MAP-XXXX`, and fact-level identifiers use `FROM-XXXX`, each namespace serving a distinct conceptual domain. This namespace discipline prevents identifier collisions and supports domain-specific query routing.

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | MAP-0004 |
| STAN-0002 | Quality threshold | MAP-0004 |
| STAN-0003 | Provenance tracking | MAP-0003 |
| STAN-0004 | Access control policy | MAP-0003 |
| STAN-0005 | Provenance tracking | MAP-0007 |
| STAN-0006 | Access control policy | MAP-0003 |

**t_requirement_under_standard_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0003 | true |
| STAN-0002 | STAN-0002 | STAN-0003 | true |
| STAN-0003 | STAN-0003 | STAN-0003 | true |
| STAN-0004 | STAN-0004 | STAN-0003 | false |
| STAN-0005 | STAN-0005 | STAN-0003 | false |
| STAN-0006 | STAN-0006 | STAN-0003 | true |

**t_requirement_under_standard_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0001 | 2024-02-08 |
| STAN-0002 | STAN-0002 | STAN-0001 | 2024-03-15 |
| STAN-0003 | STAN-0003 | STAN-0001 | 2024-09-13 |
| STAN-0004 | STAN-0004 | STAN-0001 | 2023-09-30 |
| STAN-0005 | STAN-0005 | STAN-0001 | 2025-02-13 |
| STAN-0006 | STAN-0006 | STAN-0001 | 2025-01-10 |

**t_requirement_under_standard_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0004 | 3 |
| STAN-0002 | STAN-0001 | STAN-0005 | 224 |
| STAN-0003 | STAN-0002 | STAN-0004 | 4 |
| STAN-0004 | STAN-0002 | STAN-0005 | 622 |
| STAN-0005 | STAN-0003 | STAN-0004 | 1 |
| STAN-0006 | STAN-0003 | STAN-0005 | 177 |
| STAN-0007 | STAN-0004 | STAN-0004 | 5 |
| STAN-0008 | STAN-0004 | STAN-0005 | 817 |

**t_requirement_under_standard_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0007 | Encoding 01 |
| STAN-0002 | STAN-0001 | STAN-0002 | Enforcement 02 |
| STAN-0003 | STAN-0001 | STAN-0008 | audit excerpt |
| STAN-0004 | STAN-0001 | STAN-0009 | de |
| STAN-0005 | STAN-0001 | STAN-0006 | Scope 05 |
| STAN-0006 | STAN-0002 | STAN-0007 | Encoding 06 |
| STAN-0007 | STAN-0002 | STAN-0002 | Enforcement 07 |
| STAN-0008 | STAN-0002 | STAN-0008 | nightly summary |

**t_perf_buffer_map_subclass**

| id | perf | perf_buffer_config |
| --- | --- | --- |
| MAP-0001 | cassandra-perf | STAN-0002 |
| MAP-0002 | netperf-tcp | STAN-0001 |
| MAP-0003 | iperf3-stream | STAN-0004 |
| MAP-0004 | tpch-10gb | STAN-0005 |
| MAP-0005 | spec-jbb2015 | STAN-0003 |
| MAP-0006 | pgbench-default | STAN-0001 |
| MAP-0007 | spark-stress | STAN-0004 |

**t_perf_buffer_map_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | 60 |
| MAP-0002 | MAP-0001 | MAP-0008 | 11 |
| MAP-0003 | MAP-0002 | MAP-0006 | 123 |
| MAP-0004 | MAP-0002 | MAP-0008 | 12 |
| MAP-0005 | MAP-0003 | MAP-0006 | 190 |
| MAP-0006 | MAP-0003 | MAP-0008 | 10 |
| MAP-0007 | MAP-0004 | MAP-0006 | 100 |
| MAP-0008 | MAP-0004 | MAP-0008 | 1 |

Category and classification provide an additional layer of organizational structure. The dimension table for type changes assigns each change a category—`Type Changed From Category 01` through `Type Changed From Category 04`—and a human-readable label such as `Type Changed From Label 01`. These categories are not merely cosmetic; they enable aggregation and filtering at the classification level. A governance analyst can query all type changes belonging to `Type Changed From Category 02` without needing to inspect individual change records, supporting high-level trend analysis and compliance reporting. The category system works in tandem with the attribute type system: while attribute types define the data shape, categories define the business meaning and governance context of changes to that shape.

**dim_type_changed_from**

| id | type_changed_from_label | type_changed_from_category |
| --- | --- | --- |
| FROM-0001 | Type Changed From Label 01 | Type Changed From Category 01 |
| FROM-0002 | Type Changed From Label 02 | Type Changed From Category 02 |
| FROM-0003 | Type Changed From Label 03 | Type Changed From Category 03 |
| FROM-0004 | Type Changed From Label 04 | Type Changed From Category 04 |
| FROM-0005 | Type Changed From Label 05 | Type Changed From Category 05 |
| FROM-0006 | Type Changed From Label 06 | Type Changed From Category 06 |

Confidence and uncertainty are the quantitative measures that accompany data lineage and type-change tracking. In the fact table, each record carries a confidence score and an uncertainty value alongside the measured value itself. A type change with a confidence of `0.354` and an uncertainty of `404.01` indicates a relatively well-understood transition, whereas a change with confidence `0.068` and uncertainty `744.10` signals significant ambiguity about the nature or impact of the change. These metrics are not abstract; they are tied to specific type-change events identified by keys such as `FROM-0001` through `FROM-0004`, each of which references a dimension record that specifies the category and label of the change. The value column in the fact table—holding measurements like `257.80`, `571.55`, `140.18`, and `131.27`—represents the quantitative impact or magnitude of the change, providing a third dimension of evidence alongside confidence and uncertainty. Together, these three metrics form a triad that allows governance systems to rank, prioritize, and escalate type changes based on their reliability and potential risk.

**fact_column**

| id | type_changed_from_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0006 | 0.164 | 560.21 | 257.80 |
| FROM-0002 | FROM-0003 | 0.068 | 744.10 | 571.55 |
| FROM-0003 | FROM-0006 | 0.107 | 984.09 | 140.18 |
| FROM-0004 | FROM-0006 | 0.354 | 404.01 | 131.27 |
| FROM-0005 | FROM-0001 | 0.790 | 109.97 | 235.19 |
| FROM-0006 | FROM-0002 | 0.934 | 653.09 | 813.74 |
| FROM-0007 | FROM-0004 | 0.938 | 827.04 | 409.13 |
| FROM-0008 | FROM-0003 | 0.734 | 419.22 | 492.32 |

The misc column serves as a catch-all for values that do not fit neatly into the typed attribute system. It holds freeform text, computed measurements, and auxiliary metadata that support analysis without requiring schema changes. In the fact table, the misc column carries the numeric measurements that quantify type-change impact. In the requirement value tables, the misc column is the storage medium for all typed values—booleans, dates, integers, and strings—because the value column in those tables is itself the misc destination for the attribute's actual content. This dual use of misc reflects a pragmatic design: it provides a consistent column name across heterogeneous value tables while allowing the surrounding schema to convey the actual type through the table name and the attr_type metadata. The result is a system that is both flexible enough to accommodate new attribute types without schema migration and rigorous enough to enforce type discipline at query time.