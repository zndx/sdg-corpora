---
chapter_id: ch_live_column_type_changed_from_6e35fc
topic_id: 183
family: 07_long_tail
cited_terms: ['column_type_changed_from', 'artifact_subclass_two_parents', 'perf_event_subclass']
model: engine-refine
---

Within this data model, attributes serve as the fundamental property descriptors attached to entities, each carrying a typed definition that governs how its values are stored and interpreted. The attribute catalog—exemplified by entries such as `checksum`, `created_date`, `identifier`, and `license`—is paired with a type declaration like `xsd:string`, `xsd:date`, or `cco:DesignativeICE`, establishing a schema-level contract for what kind of data each property can hold. This separation of attribute metadata from actual values enables flexible, multi-typed value storage: date values reside in one table, integers in another, and variable-length strings in a third, all linked back to the same entity through a common `entity_id` foreign key. An entity, in this context, is the subject of description—a performance event, an artifact, or any tracked resource—and its identity is captured through standardized identifiers such as `doi:10.1109/x`, `oid:1.3.6.1`, `ref-8842`, and `urn:uuid:9f2a`, which provide globally resolvable references across systems.

**t_perf_event_subclass**

| id | perf | perf_event_config |
| --- | --- | --- |
| EVEN-0001 | thread_contention | hardware_counter_select |
| EVEN-0002 | disk_io_ops | cpu_affinity_filter |
| EVEN-0003 | disk_io_ops | cpu_affinity_filter |
| EVEN-0004 | network_bytes | sampling_interval_10ms |
| EVEN-0005 | network_bytes | 4gb_memory_pool |
| EVEN-0006 | jvm_heap_used | drop_in_place_policy |

**t_perf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | checksum | xsd:string |
| EVEN-0002 | created_date | xsd:date |
| EVEN-0003 | identifier | cco:DesignativeICE |
| EVEN-0004 | license | xsd:string |
| EVEN-0005 | mime_type | xsd:string |
| EVEN-0006 | size_bytes | xsd:long |
| EVEN-0007 | uri | xsd:string |
| EVEN-0008 | version | xsd:integer |

**t_perf_event_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-03-08 |
| EVEN-0002 | EVEN-0002 | EVEN-0002 | 2023-08-29 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | 2025-04-08 |
| EVEN-0004 | EVEN-0004 | EVEN-0002 | 2024-10-09 |
| EVEN-0005 | EVEN-0005 | EVEN-0002 | 2024-06-29 |
| EVEN-0006 | EVEN-0006 | EVEN-0002 | 2025-04-11 |

**t_perf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0006 | 193 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 8 |
| EVEN-0003 | EVEN-0002 | EVEN-0006 | 332 |
| EVEN-0004 | EVEN-0002 | EVEN-0008 | 11 |
| EVEN-0005 | EVEN-0003 | EVEN-0006 | 351 |
| EVEN-0006 | EVEN-0003 | EVEN-0008 | 10 |
| EVEN-0007 | EVEN-0004 | EVEN-0006 | 314 |
| EVEN-0008 | EVEN-0004 | EVEN-0008 | 12 |

**t_perf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 9d2b7a16 |
| EVEN-0002 | EVEN-0001 | EVEN-0003 | oid:1.3.6.1 |
| EVEN-0003 | EVEN-0001 | EVEN-0004 | MPL-2.0 |
| EVEN-0004 | EVEN-0001 | EVEN-0009 | ap-south-2 |
| EVEN-0005 | EVEN-0001 | EVEN-0005 | application/json |
| EVEN-0006 | EVEN-0001 | EVEN-0010 | Name 06 |
| EVEN-0007 | EVEN-0001 | EVEN-0011 | data-engineering |
| EVEN-0008 | EVEN-0001 | EVEN-0012 | Tags 08 |

The provenance of type changes is tracked with explicit confidence and uncertainty metrics that quantify the reliability of each recorded transformation. When a column's type is altered, the system records both the original type—referenced through a dimension table that maps each `type_changed_from` key to a human-readable label and a categorical grouping—and a confidence score that ranges from 0.068 to 0.354 across observed instances, alongside an uncertainty value spanning 404.01 to 984.09. These paired measures allow downstream consumers to weigh the trustworthiness of type-change assertions: a confidence of 0.354 paired with an uncertainty of 404.01 suggests a more reliable transformation than a confidence of 0.068 with uncertainty of 744.10. The dimension table further enriches this tracking by assigning each type change to a category—`Type Changed From Category 01` through `04`—enabling aggregation and filtering by the nature of the transformation rather than by individual instance.

Tags and categories provide orthogonal classification layers that cut across the typed attribute-value structure. In the artifact-subclass table, entries carry tags such as `verified`, `pii`, and `internal`, which function as lightweight, denormalized labels for governance and access control without requiring schema changes. These tags coexist with structured attributes and identifiers, offering a pragmatic mechanism for annotating entities with properties that are important for compliance but do not warrant dedicated columns. Similarly, the type-change dimension uses categorical labels to group transformations by their semantic class, allowing analysts to ask questions like "how many columns in the 'Type Changed From Category 02' group have confidence below 0.1?" without joining across multiple value tables.

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

**dim_type_changed_from**

| id | type_changed_from_label | type_changed_from_category |
| --- | --- | --- |
| FROM-0001 | Type Changed From Label 01 | Type Changed From Category 01 |
| FROM-0002 | Type Changed From Label 02 | Type Changed From Category 02 |
| FROM-0003 | Type Changed From Label 03 | Type Changed From Category 03 |
| FROM-0004 | Type Changed From Label 04 | Type Changed From Category 04 |
| FROM-0005 | Type Changed From Label 05 | Type Changed From Category 05 |
| FROM-0006 | Type Changed From Label 06 | Type Changed From Category 06 |

**t_artifact_subclass_two_parents**

| id | artifact | artifact_2 | identifier | tags |
| --- | --- | --- | --- | --- |
| PARE-0001 | streaming-window-5min | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0002 | streaming-window-5min | metadata-registry-sync | oid:1.3.6.1 | pii |
| PARE-0003 | telemetry-aggregate-q3 | encryption-key-rotation | ref-8842 | verified |
| PARE-0004 | model-checkpoint-epoch12 | master-schema-v1 | urn:uuid:9f2a | internal |
| PARE-0005 | telemetry-aggregate-q3 | master-schema-v1 | oid:1.3.6.1 | public |
| PARE-0006 | model-checkpoint-epoch12 | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0007 | index-rebuild-prod | validation-ruleset-strict | urn:uuid:9f2a | verified |

The multi-table value storage pattern—splitting values into `val_date`, `val_int`, and `val_varchar` tables—reflects a design choice that prioritizes query performance and type safety over simplicity. Each value row carries an `entity_id` pointing to the subject entity and an `attr_id` pointing to the attribute definition, creating a sparse, entity-attribute-value structure that can accommodate an open-ended set of properties without schema migrations. For instance, entity `EVEN-0001` has a date value of `2024-03-08` for attribute `EVEN-0002`, an integer value of `193` for attribute `EVEN-0006`, and a string value of `9d2b7a16` for attribute `EVEN-0001`, all stored in separate tables but unified through the entity-attribute linkage. This approach supports heterogeneous data types within a single entity while preserving the ability to index and query each value type using the most efficient storage format.