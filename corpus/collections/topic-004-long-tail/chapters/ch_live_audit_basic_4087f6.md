---
chapter_id: ch_live_audit_basic_4087f6
topic_id: 4
family: 03_directive_governance
cited_terms: ['audit_basic', 'equiv_intersect_three', 'measurement_of_artifact']
model: engine-refine
---

Attributes serve as the structural vocabulary through which entities are described, and their type discipline is what makes the model both expressive and queryable. An attribute definition pairs a human-readable name with an XML Schema datatype, establishing the shape of the value that any entity may carry. In the audit domain, attributes such as `duration_seconds` (typed as `xsd:decimal`), `end_time` (`xsd:dateTime`), `exit_code` (`xsd:integer`), and `host_name` (`xsd:string`) define the dimensions along which an audit event like "Telemetry Integrity Check" or "Logging Compliance Review" can be characterized. Similarly, artifact measurements are described by attributes like `confidence` (`xsd:decimal`), `dimension_kind` (`xsd:string`), `method` (`xsd:string`), and `recorded_at` (`xsd:dateTime`), which frame how a measurement such as `latency_p99_ms` or `yield_stress_test` is qualified. The separation of attribute definitions from their values allows the same attribute schema to be reused across multiple entities without duplication.

**t_audit_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2024-05-14T01:27:39 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-24T17:57:06 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2023-07-30T11:39:04 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2024-03-11T10:39:38 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2025-01-11T17:40:44 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-09-25T22:35:18 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2025-04-27T05:17:32 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2023-12-11T03:24:19 |

**t_audit_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 2391.38 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 1955.36 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 919.71 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 338.61 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1120.15 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 6419.06 |

**t_measurement_of_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

Identifiers provide the stable, machine-readable keys that anchor every element in the model. Each entity, attribute, and value row carries a unique identifier following a domain-prefixed convention: audit entities use `AUDI-0001` through `AUDI-0004`, artifact measurements use `ARTI-0001` through `ARTI-0004`, and equivalence mappings use `THRE-0001` through `THRE-0004`. These identifiers are not merely labels; they form the foreign-key backbone of the entire graph. An audit entity identified as `AUDI-0001` is linked to its attributes through attribute identifiers such as `AUDI-0001` for `duration_seconds`, `AUDI-0002` for `end_time`, `AUDI-0003` for `exit_code`, and `AUDI-0004` for `host_name`. The same pattern holds for artifact measurements, where `ARTI-0001` references `confidence`, `ARTI-0002` references `dimension_kind`, and so forth. This uniform identification scheme ensures that cross-domain joins and traversals are unambiguous.

**t_audit_basic**

| id | audit |
| --- | --- |
| AUDI-0001 | Telemetry Integrity Check |
| AUDI-0002 | Logging Compliance Review |
| AUDI-0003 | Logging Compliance Review |
| AUDI-0004 | Model Drift Validation |
| AUDI-0005 | Model Drift Validation |
| AUDI-0006 | Pipeline Latency Review |

**t_audit_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 765 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 217 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 123 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 33 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 601 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 361 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 79 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 456 |

**t_audit_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | initiation |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | pending |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | ingest-21 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | closeout |

**t_equiv_intersect_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | lab_sample_registry | orc_table | crosswalk_rule | dev_sandbox |
| THRE-0002 | governance_policy_alpha | orc_table | lineage_node | hot_cache |
| THRE-0003 | governance_policy_alpha | csv_archive | standard_mapping | air_gapped |
| THRE-0004 | sensor_array_gamma | hdf5_archive | crosswalk_rule | staging_zone |
| THRE-0005 | telemetry_stream_alpha | netcdf_file | retention_policy | dev_sandbox |
| THRE-0006 | lab_sample_registry | parquet_dataset | schema_binding | edge_node |

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Entities represent the concrete instances to which attributes are applied, and they are the primary subjects of queries and reports. An audit entity such as `AUDI-0001` corresponds to the event "Telemetry Integrity Check," while `AUDI-0002` and `AUDI-0003` both map to "Logging Compliance Review," and `AUDI-0004` represents "Model Drift Validation." Artifact measurement entities include `ARTI-0001` and `ARTI-0003`, both measuring `latency_p99_ms`, alongside `ARTI-0002` for `yield_stress_test` and `ARTI-0004` for `pressure_transducer`. Equivalence entities, identified as `THRE-0001` through `THRE-0004`, encode four-way relationships between concepts such as `lab_sample_registry` and `orc_table` in one mapping, or `governance_policy_alpha` and `csv_archive` in another, with additional dimensions like `crosswalk_rule`, `lineage_node`, `standard_mapping`, and `dev_sandbox`, `hot_cache`, `air_gapped`, `staging_zone`. Each entity is a node in a larger knowledge graph, connected to its attributes and values through identifier-based foreign keys.

Values are stored in type-specific tables to preserve datatype integrity and enable efficient range queries. Decimal values such as `2391.38`, `1955.36`, `919.71`, and `338.61` for audit durations, or `0.670`, `226.14`, and `361.86` for artifact confidence and dimensional measurements, reside in a dedicated decimal store. Integer values like `765`, `217`, `123`, and `33` for audit exit codes occupy their own table. String values are distributed across a varchar table and include host names such as `node-a01`, log levels like `Log Level 02`, status descriptors such as `initiation` and `pending`, and artifact metadata like `Dimension Kind 01`, `Encoding 02`, `intake form`, and `fr`. Datetime values, including `2024-05-14T01:27:39`, `2024-03-24T17:57:06`, `2023-07-30T11:39:04`, and `2024-03-11T10:39:38` for audit end times, as well as `2023-05-19T07:46:35`, `2023-01-19T07:45:29`, `2023-07-23T03:47:45`, and `2024-05-29T07:18:18` for artifact recording timestamps, are stored in a separate datetime table. This type-dispatched value storage ensures that each value is validated against its declared `attr_type` at ingestion time and that downstream consumers can rely on consistent semantics.

The foreign-key relationships between these tables form a directed acyclic graph that supports both narrow lookups and broad traversals. Starting from an entity identifier, one resolves its attributes through the attribute table, then dispatches to the appropriate value table based on the attribute's declared type. For example, resolving entity `AUDI-0001` requires joining to its attributes (`AUDI-0001` through `AUDI-0004`), then querying the decimal table for `AUDI-0001` (yielding `2391.38`), the integer table for `AUDI-0003` (yielding `765`), the varchar table for `AUDI-0004` (yielding `node-a01`), and the datetime table for `AUDI-0002` (yielding `2024-05-14T01:27:39`). The same resolution pattern applies to artifact entities and equivalence mappings, where the four-way equivalence columns (`equiv`, `equiv_2`, `equiv_3`, `equiv_4`) each reference concepts that may themselves be entities in other domains. This design decouples schema evolution from data storage, allows type-specific indexing strategies, and ensures that the model remains extensible as new attribute types and entity categories are introduced.