---
chapter_id: ch_live_transformation_associated_with_agent_9ed287
topic_id: 183
family: 05_provo_lineage
cited_terms: ['transformation_associated_with_agent', 'column_nullability_state', 'trace_originates_from']
model: engine-refine
---

In operational data governance, every observable phenomenon is captured through a structured set of attributes that describe an entity's properties, behavior, and provenance. An entity represents the core object under observation—for instance, a column nullability state such as the one governing `timestamp_utc` or `checksum_sha256`. Each entity is assigned a unique identifier, such as `STAT-0001` or `AGEN-0001`, which serves as the stable anchor for all downstream relationships. Attributes are the named characteristics of these entities, with names like `confidence`, `dimension_kind`, `method`, and `recorded_at`. Each attribute carries a declared type that constrains the kind of value it can hold: `xsd:decimal` for numeric measures, `xsd:string` for categorical labels, and `xsd:dateTime` for temporal stamps. This type discipline ensures that values stored in the system are semantically consistent and queryable.

**t_column_nullability_state**

| id | column | nullability_state |
| --- | --- | --- |
| STAT-0001 | timestamp_utc | REQUIRED |
| STAT-0002 | checksum_sha256 | REQUIRED |
| STAT-0003 | latency_ms | NOT_NULL |
| STAT-0004 | timestamp_utc | OPTIONAL |
| STAT-0005 | timestamp_utc | PROVISIONAL |
| STAT-0006 | checksum_sha256 | NULLABLE |

**t_column_nullability_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | confidence | xsd:decimal |
| STAT-0002 | dimension_kind | xsd:string |
| STAT-0003 | method | xsd:string |
| STAT-0004 | recorded_at | xsd:dateTime |
| STAT-0005 | uncertainty | xsd:decimal |
| STAT-0006 | unit | xsd:string |
| STAT-0007 | value | xsd:decimal |
| STAT-0008 | encoding | xsd:string |

**t_column_nullability_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 2024-12-29T19:38:29 |
| STAT-0002 | STAT-0002 | STAT-0004 | 2023-05-04T12:31:25 |
| STAT-0003 | STAT-0003 | STAT-0004 | 2023-11-12T04:10:53 |
| STAT-0004 | STAT-0004 | STAT-0004 | 2024-08-13T21:58:19 |
| STAT-0005 | STAT-0005 | STAT-0004 | 2023-08-07T04:27:45 |
| STAT-0006 | STAT-0006 | STAT-0004 | 2025-03-15T00:17:24 |

**t_column_nullability_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 0.294 |
| STAT-0002 | STAT-0001 | STAT-0005 | 568.73 |
| STAT-0003 | STAT-0001 | STAT-0007 | 519.24 |
| STAT-0004 | STAT-0002 | STAT-0001 | 0.734 |
| STAT-0005 | STAT-0002 | STAT-0005 | 854.57 |
| STAT-0006 | STAT-0002 | STAT-0007 | 958.56 |
| STAT-0007 | STAT-0003 | STAT-0001 | 0.295 |
| STAT-0008 | STAT-0003 | STAT-0005 | 90.08 |

**t_column_nullability_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | Dimension Kind 01 |
| STAT-0002 | STAT-0001 | STAT-0008 | Encoding 02 |
| STAT-0003 | STAT-0001 | STAT-0009 | intake form |
| STAT-0004 | STAT-0001 | STAT-0010 | fr |
| STAT-0005 | STAT-0001 | STAT-0003 | automated |
| STAT-0006 | STAT-0001 | STAT-0006 | ratio |
| STAT-0007 | STAT-0002 | STAT-0002 | Dimension Kind 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | Encoding 08 |

Attribute values are materialized in type-specific storage tables, each linking back to the entity and attribute through foreign keys. A decimal attribute such as `confidence` might hold a value of `0.294` for one entity and `0.734` for another, while a string attribute like `dimension_kind` could carry values such as `Dimension Kind 01` or `Encoding 02`. Temporal attributes store ISO 8601 timestamps—for example, `2024-12-29T19:38:29` or `2023-05-04T12:31:25`—and free-form text attributes capture miscellaneous metadata such as `intake form` or the language code `fr`. This separation of values by type enables efficient storage and type-safe retrieval while preserving a unified logical model where every attribute value is traceable to its entity and its declared type.

Beyond static attributes, the system tracks dynamic operational events through trace records that capture the lifecycle of data transformations. A trace record is anchored by an identifier such as `FROM-0001` and records how long the associated operation took via `duration_seconds`, with observed values ranging from `1874.27` seconds to `3940.66` seconds. The `exit_code` field documents how the operation concluded—codes such as `491`, `900`, `420`, and `60` encode the final status of each run. The `retry_count` field quantifies resilience, recording how many times the system attempted recovery before reaching its final state, with counts as high as `459` retries observed in a single trace. These three measures together form a compact operational signature that supports performance analysis, failure diagnosis, and capacity planning.

**t_transformation_associated_with_agent**

| id | transformation |
| --- | --- |
| AGEN-0001 | Archive Export Run |
| AGEN-0002 | Feature Engineering Job |
| AGEN-0003 | Model Retraining Cycle |
| AGEN-0004 | Sensor Calibration Pass |
| AGEN-0005 | Schema Migration Run |
| AGEN-0006 | Partition Pruning Step |
| AGEN-0007 | Daily ETL Pipeline |

**t_transformation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | GitHub CI Pipeline |
| AGEN-0002 | Docker Container |
| AGEN-0003 | Senior Data Engineer |
| AGEN-0004 | Senior Data Engineer |
| AGEN-0005 | Docker Container |
| AGEN-0006 | Docker Container |

**fact_trace**

| id | originates_from_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | 1874.27 | 491 | 399 |
| FROM-0002 | FROM-0001 | 2092.44 | 900 | 179 |
| FROM-0003 | FROM-0005 | 3940.66 | 420 | 396 |
| FROM-0004 | FROM-0004 | 3336.66 | 60 | 459 |

Every trace record is linked to a dimension table called `dim_originates_from`, which classifies the provenance of the event. The `originates_from_key` column in the trace table points to a row in this dimension, identified by keys such as `FROM-0001` through `FROM-0004`. Each dimension row carries a human-readable label—for example, `Originates From Label 01`—and a `category` classification such as `Originates From Category 01` through `Originates From Category 04`. This categorization enables aggregation and filtering of trace data by provenance type, allowing operators to compare performance and failure patterns across different data sources or pipeline stages.

**dim_originates_from**

| id | originates_from_label | originates_from_category |
| --- | --- | --- |
| FROM-0001 | Originates From Label 01 | Originates From Category 01 |
| FROM-0002 | Originates From Label 02 | Originates From Category 02 |
| FROM-0003 | Originates From Label 03 | Originates From Category 03 |
| FROM-0004 | Originates From Label 04 | Originates From Category 04 |
| FROM-0005 | Originates From Label 05 | Originates From Category 05 |
| FROM-0006 | Originates From Label 06 | Originates From Category 06 |
| FROM-0007 | Originates From Label 07 | Originates From Category 07 |

Relationships between entities are expressed through association tables that carry their own metadata. In the transformation-agent model, a transformation such as `Archive Export Run` or `Model Retraining Cycle` is linked to an agent or external system—like `GitHub CI Pipeline`, `Docker Container`, or `Senior Data Engineer`—through a junction table. This junction table includes a `role` column that specifies the nature of the association, with values such as `contributor`, `reviewer`, and `observer`. The `subject` column identifies the transformation being associated, while the target column identifies the agent or system. This design allows a single transformation to participate in multiple relationships with different roles, supporting a rich, auditable model of data lineage and accountability.

**t_transformation_associated_with_agent__was_associated_with**

| id | transformation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0006 | AGEN-0001 | contributor |
| AGEN-0002 | AGEN-0007 | AGEN-0001 | reviewer |
| AGEN-0003 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0004 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0007 | AGEN-0006 | contributor |
| AGEN-0007 | AGEN-0001 | AGEN-0004 | observer |
| AGEN-0008 | AGEN-0003 | AGEN-0002 | observer |