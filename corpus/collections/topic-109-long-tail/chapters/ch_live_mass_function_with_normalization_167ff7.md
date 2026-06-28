---
chapter_id: ch_live_mass_function_with_normalization_167ff7
topic_id: 109
family: 06_belief_structure
cited_terms: ['mass_function_with_normalization', 'storage_structure_composition', 'equiv_intersect_with_restriction']
model: engine-refine
---

At the foundational level of the data model, entities are uniquely identified by standardized identifiers such as `NORM-0001` through `NORM-0004`, which serve as the primary keys for mass function records. Each entity encapsulates a specific `mass` value—ranging from mechanical components like `Rotor-Assembly-M` and `Core-Segment-12` to abstract batch designations like `Batch-7721` and `Dust-Collection-1`—and is mathematically anchored to a `normalization_constant`, such as `REST-0005` or `REST-0003`, ensuring proportional integrity across the dataset. These identifiers act as the central pivot for the system, allowing disparate mass functions to be referenced unambiguously across multiple relational layers.

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | REST-0005 |
| NORM-0002 | Batch-7721 | REST-0003 |
| NORM-0003 | Core-Segment-12 | REST-0006 |
| NORM-0004 | Dust-Collection-1 | REST-0001 |
| NORM-0005 | Powder-Grade-B | REST-0002 |
| NORM-0006 | Rotor-Assembly-M | REST-0006 |

**t_mass_function_with_normalization_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| NORM-0001 | confidence | xsd:decimal |
| NORM-0002 | dimension_kind | xsd:string |
| NORM-0003 | method | xsd:string |
| NORM-0004 | recorded_at | xsd:dateTime |
| NORM-0005 | uncertainty | xsd:decimal |
| NORM-0006 | unit | xsd:string |
| NORM-0007 | value | xsd:decimal |
| NORM-0008 | encoding | xsd:string |

**t_mass_function_with_normalization_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0004 | 2024-12-04T17:58:43 |
| NORM-0002 | NORM-0002 | NORM-0004 | 2023-02-03T12:29:30 |
| NORM-0003 | NORM-0003 | NORM-0004 | 2024-03-08T15:41:30 |
| NORM-0004 | NORM-0004 | NORM-0004 | 2023-01-16T04:53:31 |
| NORM-0005 | NORM-0005 | NORM-0004 | 2023-05-04T19:41:54 |
| NORM-0006 | NORM-0006 | NORM-0004 | 2025-01-09T01:34:48 |

**t_mass_function_with_normalization_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0001 | 0.715 |
| NORM-0002 | NORM-0001 | NORM-0005 | 279.33 |
| NORM-0003 | NORM-0001 | NORM-0007 | 243.08 |
| NORM-0004 | NORM-0002 | NORM-0001 | 0.608 |
| NORM-0005 | NORM-0002 | NORM-0005 | 643.66 |
| NORM-0006 | NORM-0002 | NORM-0007 | 319.15 |
| NORM-0007 | NORM-0003 | NORM-0001 | 0.596 |
| NORM-0008 | NORM-0003 | NORM-0005 | 676.31 |

**t_mass_function_with_normalization_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0002 | Dimension Kind 01 |
| NORM-0002 | NORM-0001 | NORM-0008 | Encoding 02 |
| NORM-0003 | NORM-0001 | NORM-0009 | nightly summary |
| NORM-0004 | NORM-0001 | NORM-0010 | ja |
| NORM-0005 | NORM-0001 | NORM-0003 | manual |
| NORM-0006 | NORM-0001 | NORM-0006 | count |
| NORM-0007 | NORM-0002 | NORM-0002 | Dimension Kind 07 |
| NORM-0008 | NORM-0002 | NORM-0008 | Encoding 08 |

The structural properties of these entities are formalized through a rigorous attribute system, where each `attr` is explicitly defined by a descriptive `attr_name` and a strict `attr_type`. For instance, quantitative measures are assigned the `xsd:decimal` type, as seen with the `confidence` attribute, while categorical or temporal data utilize `xsd:string` for attributes like `dimension_kind` and `method`, and `xsd:dateTime` for the `recorded_at` timestamp. This strict typing ensures that the subsequent assignment of values adheres to a predictable schema, preventing type coercion errors during data ingestion and guaranteeing that the semantic meaning of each attribute is preserved.

Concrete data values, categorized broadly as `misc` in the value storage layer, are bound to their respective entities and attributes via foreign key relationships linking `entity_id` and `attr_id`. These values are segregated by their underlying datatype to preserve precision: decimal values such as `0.715` and `279.33` are stored in dedicated decimal stores, string literals like `Dimension Kind 01`, `Encoding 02`, and the language code `ja` reside in varchar stores, and precise temporal markers, including `2024-12-04T17:58:43` and `2023-02-03T12:29:30`, are isolated in datetime stores. This separation allows the system to efficiently query heterogeneous data types while maintaining a unified logical view of the entity's state.

Beyond the logical representation of mass functions, the system models physical and logical data placement through `storagestructurecomposition` and `databasecontainer` entities. A `storagestructurecomposition` defines a logical aggregation strategy or hardware tier, exemplified by compositions such as `tiered-storage-pool`, `archive-tape-library`, and `san-disk-array`. These compositions are instantiated by specific `databasecontainer` instances, meaning a `tiered-storage-pool` might comprise a `dev-mongo-shard` or a `staging-redis-cluster`, while an `archive-tape-library` could encompass an `s3-logs-bucket`, thereby mapping abstract storage policies to concrete data stores.

**t_storage_structure_composition**

| id | storage_structure_composition |
| --- | --- |
| COMP-0001 | tiered-storage-pool |
| COMP-0002 | archive-tape-library |
| COMP-0003 | tiered-storage-pool |
| COMP-0004 | san-disk-array |
| COMP-0005 | archive-tape-library |
| COMP-0006 | flash-memory-pool |

**t_storage_structure_composition_comprises**

| id | comprises |
| --- | --- |
| COMP-0001 | dev-mongo-shard |
| COMP-0002 | staging-redis-cluster |
| COMP-0003 | s3-logs-bucket |
| COMP-0004 | cassandra-data-node |
| COMP-0005 | oracle-tablespace-main |
| COMP-0006 | neo4j-graph-store |

The interaction between storage compositions and their constituent containers is governed by a ternary relationship that explicitly defines the `subject`, the `target`, and the `role` of the association. In this framework, the `storage_id` acts as the `subject` initiating the relationship, the `comprises_id` serves as the `target` being composed, and the `role`—such as `observer` or `reviewer`—qualifies the functional nature of the containment. Furthermore, the system supports complex logical mappings through equivalence and intersection restrictions, where distinct system components like `sensor_array_gamma` and `stream_processor_8` are intersected and linked to specific normalization constants (e.g., `NORM-0005`), effectively bridging the gap between physical infrastructure roles and abstract mass function constraints.

**t_storage_structure_composition__comprises**

| id | storage_id | comprises_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0003 | COMP-0006 | observer |
| COMP-0002 | COMP-0002 | COMP-0004 | reviewer |
| COMP-0003 | COMP-0006 | COMP-0001 | observer |
| COMP-0004 | COMP-0003 | COMP-0006 | reviewer |
| COMP-0005 | COMP-0002 | COMP-0002 | contributor |
| COMP-0006 | COMP-0001 | COMP-0006 | reviewer |
| COMP-0007 | COMP-0006 | COMP-0003 | owner |
| COMP-0008 | COMP-0002 | COMP-0006 | reviewer |

**t_equiv_intersect_with_restriction**

| id | equiv | equiv_2 | related |
| --- | --- | --- | --- |
| REST-0001 | sensor_array_gamma | stream_processor_8 | NORM-0005 |
| REST-0002 | event_bus_core | sensor_bridge_delta | NORM-0004 |
| REST-0003 | kafka_stream_primary | batch_mirror_main | NORM-0001 |
| REST-0004 | telemetry_broker_alpha | vector_cache_prod | NORM-0003 |
| REST-0005 | audit_log_archive | sensor_bridge_delta | NORM-0004 |
| REST-0006 | data_lake_zone_3 | kafka_mirror_cluster | NORM-0004 |