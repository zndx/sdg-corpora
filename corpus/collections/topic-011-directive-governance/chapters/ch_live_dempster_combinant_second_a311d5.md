---
chapter_id: ch_live_dempster_combinant_second_a311d5
topic_id: 11
family: 07_long_tail
cited_terms: ['dempster_combinant_second', 'transformation_generates_entity', 'audit_conducted_by']
model: engine-refine
---

The entity-attribute-value model structures heterogeneous operational data through a tripartite decomposition: each entity is identified by a stable identifier, described by a schema of named attributes with declared types, and populated through value tables that segregate data by type. An entity represents a discrete operational object—such as a Dempster-Shafer combination node labeled `EvidenceCombinationBeta` or `AnomalyFusionEngine`, or an audit record such as a `Cloud Infrastructure Review` or `SOC2 Compliance Review`—each anchored by a unique identifier like `SECO-0001` or `COND-0001`. The attribute schema, defined in a dedicated metadata table, assigns a human-readable name and an XML Schema datatype to each property; attributes such as `confidence`, `dimension_kind`, `method`, and `recorded_at` carry types `xsd:decimal`, `xsd:string`, `xsd:string`, and `xsd:dateTime` respectively, while audit entities expose properties like `duration_seconds`, `end_time`, `exit_code`, and `host_name` typed as `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. This separation of schema from instance data ensures that type constraints are enforced at query time and that the attribute vocabulary can evolve independently of the value storage layer.

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | COND-0005 |
| SECO-0002 | AnomalyFusionEngine | COND-0001 |
| SECO-0003 | LabDataCombinerNode | COND-0006 |
| SECO-0004 | GovernanceEvidenceModel | COND-0004 |
| SECO-0005 | GovernanceEvidenceModel | COND-0006 |
| SECO-0006 | GovernanceEvidenceModel | COND-0002 |
| SECO-0007 | CrossDomainEvidenceRule | COND-0005 |

**t_dempster_combinant_second_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECO-0001 | confidence | xsd:decimal |
| SECO-0002 | dimension_kind | xsd:string |
| SECO-0003 | method | xsd:string |
| SECO-0004 | recorded_at | xsd:dateTime |
| SECO-0005 | uncertainty | xsd:decimal |
| SECO-0006 | unit | xsd:string |
| SECO-0007 | value | xsd:decimal |
| SECO-0008 | encoding | xsd:string |

**t_dempster_combinant_second_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0004 | 2024-10-02T15:13:46 |
| SECO-0002 | SECO-0002 | SECO-0004 | 2024-09-30T23:04:21 |
| SECO-0003 | SECO-0003 | SECO-0004 | 2023-05-15T03:36:40 |
| SECO-0004 | SECO-0004 | SECO-0004 | 2023-03-27T03:16:31 |
| SECO-0005 | SECO-0005 | SECO-0004 | 2024-02-17T20:31:55 |
| SECO-0006 | SECO-0006 | SECO-0004 | 2025-02-25T15:10:20 |
| SECO-0007 | SECO-0007 | SECO-0004 | 2023-11-24T02:27:20 |

**t_dempster_combinant_second_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0001 | 0.328 |
| SECO-0002 | SECO-0001 | SECO-0005 | 597.98 |
| SECO-0003 | SECO-0001 | SECO-0007 | 738.09 |
| SECO-0004 | SECO-0002 | SECO-0001 | 0.558 |
| SECO-0005 | SECO-0002 | SECO-0005 | 817.82 |
| SECO-0006 | SECO-0002 | SECO-0007 | 989.70 |
| SECO-0007 | SECO-0003 | SECO-0001 | 0.241 |
| SECO-0008 | SECO-0003 | SECO-0005 | 869.27 |

**t_dempster_combinant_second_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0002 | Dimension Kind 01 |
| SECO-0002 | SECO-0001 | SECO-0008 | Encoding 02 |
| SECO-0003 | SECO-0001 | SECO-0009 | nightly summary |
| SECO-0004 | SECO-0001 | SECO-0010 | en |
| SECO-0005 | SECO-0001 | SECO-0003 | manual |
| SECO-0006 | SECO-0001 | SECO-0006 | deg_C |
| SECO-0007 | SECO-0002 | SECO-0002 | Dimension Kind 07 |
| SECO-0008 | SECO-0002 | SECO-0008 | Encoding 08 |

**t_audit_conducted_by**

| id | audit |
| --- | --- |
| COND-0001 | Cloud Infrastructure Review |
| COND-0002 | SOC2 Compliance Review |
| COND-0003 | Lab Safety Inspection |
| COND-0004 | Data Retention Policy |
| COND-0005 | Legacy Migration Check |
| COND-0006 | SOC2 Compliance Review |

**t_audit_conducted_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COND-0001 | duration_seconds | xsd:decimal |
| COND-0002 | end_time | xsd:dateTime |
| COND-0003 | exit_code | xsd:integer |
| COND-0004 | host_name | xsd:string |
| COND-0005 | log_level | xsd:string |
| COND-0006 | phase | xsd:string |
| COND-0007 | retry_count | xsd:integer |
| COND-0008 | scheduled_at | xsd:dateTime |

**t_audit_conducted_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0002 | 2023-06-07T00:47:02 |
| COND-0002 | COND-0001 | COND-0008 | 2025-06-08T04:54:48 |
| COND-0003 | COND-0001 | COND-0009 | 2023-02-14T08:05:22 |
| COND-0004 | COND-0002 | COND-0002 | 2023-03-04T06:34:44 |
| COND-0005 | COND-0002 | COND-0008 | 2025-02-11T04:03:38 |
| COND-0006 | COND-0002 | COND-0009 | 2024-11-06T16:59:35 |
| COND-0007 | COND-0003 | COND-0002 | 2024-02-26T03:59:36 |
| COND-0008 | COND-0003 | COND-0008 | 2023-10-26T01:36:07 |

**t_audit_conducted_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0001 | 1980.42 |
| COND-0002 | COND-0002 | COND-0001 | 6184.62 |
| COND-0003 | COND-0003 | COND-0001 | 3332.18 |
| COND-0004 | COND-0004 | COND-0001 | 5867.45 |
| COND-0005 | COND-0005 | COND-0001 | 1263.06 |
| COND-0006 | COND-0006 | COND-0001 | 5705.65 |

**t_audit_conducted_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0003 | 395 |
| COND-0002 | COND-0001 | COND-0007 | 293 |
| COND-0003 | COND-0002 | COND-0003 | 558 |
| COND-0004 | COND-0002 | COND-0007 | 143 |
| COND-0005 | COND-0003 | COND-0003 | 950 |
| COND-0006 | COND-0003 | COND-0007 | 140 |
| COND-0007 | COND-0004 | COND-0003 | 458 |
| COND-0008 | COND-0004 | COND-0007 | 234 |

**t_audit_conducted_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0004 | node-a01 |
| COND-0002 | COND-0001 | COND-0005 | Log Level 02 |
| COND-0003 | COND-0001 | COND-0006 | review |
| COND-0004 | COND-0001 | COND-0010 | superseded |
| COND-0005 | COND-0001 | COND-0011 | Triggered By 05 |
| COND-0006 | COND-0002 | COND-0004 | worker-07 |
| COND-0007 | COND-0002 | COND-0005 | Log Level 07 |
| COND-0008 | COND-0002 | COND-0006 | review |

Value assignment follows a type-dispatch pattern: rather than storing all attribute values in a single column, the model distributes them across specialized value tables keyed by the entity-attribute pair. Decimal-valued attributes such as `confidence` (yielding values like `0.328` and `0.558`) and `duration_seconds` (with measurements ranging from `1980.42` to `6184.62`) reside in a decimal value table, while temporal attributes like `recorded_at` and `end_time` are stored in a datetime table with ISO 8601 timestamps such as `2024-10-02T15:13:46` and `2025-06-08T04:54:48`. String-valued properties—including `dimension_kind` entries like `Dimension Kind 01`, `Encoding 02`, and `nightly summary`, as well as host identifiers such as `node-a01`—are persisted in a varchar table, and integer-valued attributes like `exit_code` hold values such as `395`, `293`, `558`, and `143`. This normalization by type preserves precision, enables efficient range queries on numeric and temporal columns, and prevents the type-coercion errors that plague single-column EAV designs.

The `duration_seconds` attribute, in particular, serves as a quantitative measure of process execution time across transformation pipelines and audit activities. Within the transformation registry, a `schema migration routine` consuming `5649.07` seconds, a `batch ingestion pipeline` at `2309.83` seconds, an `archival compression job` at `2913.69` seconds, and a `feature engineering step` at `6875.45` seconds are all recorded in the `execution` phase, establishing a baseline for operational latency. Similarly, audit records carry their own `duration_seconds` values—`1980.42`, `6184.62`, `3332.18`, and `5867.45`—which, when correlated with audit identifiers like `COND-0001` through `COND-0004`, enable cross-functional comparisons of process overhead. The `phase` column further contextualizes these durations by categorizing the lifecycle stage of each transformation, with `execution` denoting the active processing window during which the measured duration elapsed.

The `misc` designation applied to value columns reflects the heterogeneous nature of the stored data: each value table carries a generic value column that accepts any datum appropriate to its type discipline, and the actual semantic meaning of a value is recovered only through the join path from value row to attribute definition to entity. This indirection is the cost of flexibility—the same entity `SECO-0001` may carry a decimal confidence of `0.328`, a datetime stamp of `2024-10-02T15:13:46`, and a string dimension of `Dimension Kind 01`—but it is also the mechanism by which the model accommodates entities with entirely different attribute profiles without schema migration. The `entity_id` foreign key in each value table points back to the entity's identifier, and the `attr_id` foreign key resolves to the attribute's definition, forming a navigable graph from instance to schema to type constraint.

This architecture supports governance and compliance workflows by making the provenance of every attribute value traceable. An audit such as `Data Retention Policy` (`COND-0004`) can be associated with a `GovernanceEvidenceModel` entity through the `second_combinant` linkage, and its operational characteristics—host name `node-a01`, exit code `395`, duration `1980.42` seconds, and end time `2023-06-07T00:47:02`—are all retrievable through the same attribute-value join pattern. The `phase` column, when present, adds a temporal dimension to the lifecycle of transformations, distinguishing the `execution` phase from other stages and enabling time-bounded analysis of process performance. Together, the identifier, attribute schema, typed value tables, and phase metadata form a coherent framework for recording, querying, and auditing operational data across heterogeneous systems.

**t_transformation_generates_entity**

| id | transformation | generates_entity | duration_seconds | phase |
| --- | --- | --- | --- | --- |
| ENTI-0001 | schema migration routine | calibrated sensor readings | 5649.07 | execution |
| ENTI-0002 | batch ingestion pipeline | feature matrix | 2309.83 | execution |
| ENTI-0003 | archival compression job | feature matrix | 2913.69 | execution |
| ENTI-0004 | feature engineering step | cleaned telemetry dataset | 6875.45 | execution |
| ENTI-0005 | telemetry aggregation task | feature matrix | 2931.10 | closeout |
| ENTI-0006 | batch ingestion pipeline | reconciliation report | 4817.44 | review |