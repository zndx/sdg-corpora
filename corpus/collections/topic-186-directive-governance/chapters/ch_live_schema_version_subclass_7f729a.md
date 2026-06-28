---
chapter_id: ch_live_schema_version_subclass_7f729a
topic_id: 186
family: 07_long_tail
cited_terms: ['schema_version_subclass', 'column_type_changed_from', 'metric_with_aggregation']
model: engine-refine
---

Schema versioning and attribute management form the backbone of any system that must track how data contracts evolve over time. Each schema version—identified by a unique identifier such as VERS-0001 through VERS-0004—represents a distinct point in the lifecycle of a data model, whether that model is an EventCatalog, an AccessControlMatrix, or a TelemetryStream. These versions carry their own version strings, ranging from stable releases like release-11.0 to pre-release candidates such as rc-2.1 and alpha-0.9, as well as patch-level iterations like patch-3.2. Within each schema version, attributes are declared with a name and a type. The attribute name—checksum, created_date, identifier, or license—serves as the conceptual label, while the attribute type anchors the value to a concrete schema, whether that is an XML Schema Definition type like xsd:string or xsd:date, or a domain-specific type such as cco:DesignativeICE. This separation of attribute definition from attribute value is deliberate: it allows the system to evolve the schema independently of the data that populates it, and to enforce type discipline at query time rather than at ingestion time.

**t_schema_version_subclass**

| id | schema | schema_version |
| --- | --- | --- |
| VERS-0001 | EventCatalog | release-11.0 |
| VERS-0002 | AccessControlMatrix | rc-2.1 |
| VERS-0003 | AccessControlMatrix | alpha-0.9 |
| VERS-0004 | TelemetryStream | patch-3.2 |
| VERS-0005 | AccessControlMatrix | rc-2.1 |
| VERS-0006 | AssetRegistry | hotfix-2.0 |
| VERS-0007 | AccessControlMatrix | alpha-0.9 |
| VERS-0008 | EventCatalog | hotfix-2.0 |

**t_schema_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | checksum | xsd:string |
| VERS-0002 | created_date | xsd:date |
| VERS-0003 | identifier | cco:DesignativeICE |
| VERS-0004 | license | xsd:string |
| VERS-0005 | mime_type | xsd:string |
| VERS-0006 | size_bytes | xsd:long |
| VERS-0007 | uri | xsd:string |
| VERS-0008 | version | xsd:integer |

The actual values assigned to attributes are stored in a normalized entity-attribute-value pattern, with separate tables for each data type. Date values—such as 2024-06-07, 2024-09-26, 2024-06-05, and 2023-07-15—are persisted in a dedicated date table, integer values like 24, 11, 16, and 12 in an integer table, and free-form strings—including checksums like a3f9c21e, license identifiers such as doi:10.1109/x and MPL-2.0, and infrastructure labels like on-prem-dc1—in a varchar table. Each value record is keyed by a unique identifier and linked to both the entity (the schema version or metric aggregation context) and the attribute (the attr_id), creating a many-to-many relationship that supports flexible schema evolution. The same pattern applies to metric aggregation contexts, where identifiers like AGGR-0001 through AGGR-0004 map to metrics such as memory_usage_gigabytes, log_error_rate_per_minute, cpu_utilization_percent, and api_response_time_p99, each with its own aggregation temporality—per_minute, 24_hours, or 5_minutes—and its own set of typed attributes and values.

**t_schema_version_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | 2024-06-07 |
| VERS-0002 | VERS-0002 | VERS-0002 | 2024-09-26 |
| VERS-0003 | VERS-0003 | VERS-0002 | 2024-06-05 |
| VERS-0004 | VERS-0004 | VERS-0002 | 2023-07-15 |
| VERS-0005 | VERS-0005 | VERS-0002 | 2025-03-15 |
| VERS-0006 | VERS-0006 | VERS-0002 | 2024-09-16 |
| VERS-0007 | VERS-0007 | VERS-0002 | 2023-01-08 |
| VERS-0008 | VERS-0008 | VERS-0002 | 2023-05-20 |

**t_schema_version_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0006 | 24 |
| VERS-0002 | VERS-0001 | VERS-0008 | 11 |
| VERS-0003 | VERS-0002 | VERS-0006 | 16 |
| VERS-0004 | VERS-0002 | VERS-0008 | 12 |
| VERS-0005 | VERS-0003 | VERS-0006 | 266 |
| VERS-0006 | VERS-0003 | VERS-0008 | 11 |
| VERS-0007 | VERS-0004 | VERS-0006 | 422 |
| VERS-0008 | VERS-0004 | VERS-0008 | 5 |

**t_schema_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | a3f9c21e |
| VERS-0002 | VERS-0001 | VERS-0003 | doi:10.1109/x |
| VERS-0003 | VERS-0001 | VERS-0004 | MPL-2.0 |
| VERS-0004 | VERS-0001 | VERS-0009 | on-prem-dc1 |
| VERS-0005 | VERS-0001 | VERS-0005 | application/octet-stream |
| VERS-0006 | VERS-0001 | VERS-0010 | Name 06 |
| VERS-0007 | VERS-0001 | VERS-0011 | governance |
| VERS-0008 | VERS-0001 | VERS-0012 | Tags 08 |

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | memory_usage_gigabytes | per_minute |
| AGGR-0002 | log_error_rate_per_minute | 24_hours |
| AGGR-0003 | cpu_utilization_percent | 5_minutes |
| AGGR-0004 | api_response_time_p99 | 5_minutes |
| AGGR-0005 | queue_depth_messages | 1_month |
| AGGR-0006 | database_connection_pool_active | per_minute |
| AGGR-0007 | http_request_latency_ms | 30_minutes |
| AGGR-0008 | api_response_time_p99 | 1_hour |

**t_metric_with_aggregation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | checksum | xsd:string |
| AGGR-0002 | created_date | xsd:date |
| AGGR-0003 | identifier | cco:DesignativeICE |
| AGGR-0004 | license | xsd:string |
| AGGR-0005 | mime_type | xsd:string |
| AGGR-0006 | size_bytes | xsd:long |
| AGGR-0007 | uri | xsd:string |
| AGGR-0008 | version | xsd:integer |

**t_metric_with_aggregation_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | 2025-01-26 |
| AGGR-0002 | AGGR-0002 | AGGR-0002 | 2024-12-19 |
| AGGR-0003 | AGGR-0003 | AGGR-0002 | 2025-05-29 |
| AGGR-0004 | AGGR-0004 | AGGR-0002 | 2024-03-19 |
| AGGR-0005 | AGGR-0005 | AGGR-0002 | 2023-09-16 |
| AGGR-0006 | AGGR-0006 | AGGR-0002 | 2023-04-28 |
| AGGR-0007 | AGGR-0007 | AGGR-0002 | 2024-03-10 |
| AGGR-0008 | AGGR-0008 | AGGR-0002 | 2024-10-06 |

**t_metric_with_aggregation_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0006 | 105 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | 11 |
| AGGR-0003 | AGGR-0002 | AGGR-0006 | 324 |
| AGGR-0004 | AGGR-0002 | AGGR-0008 | 2 |
| AGGR-0005 | AGGR-0003 | AGGR-0006 | 334 |
| AGGR-0006 | AGGR-0003 | AGGR-0008 | 9 |
| AGGR-0007 | AGGR-0004 | AGGR-0006 | 424 |
| AGGR-0008 | AGGR-0004 | AGGR-0008 | 12 |

**t_metric_with_aggregation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 1a4b6c2d |
| AGGR-0002 | AGGR-0001 | AGGR-0003 | ref-8842 |
| AGGR-0003 | AGGR-0001 | AGGR-0004 | Apache-2.0 |
| AGGR-0004 | AGGR-0001 | AGGR-0009 | zone-b |
| AGGR-0005 | AGGR-0001 | AGGR-0005 | text/plain |
| AGGR-0006 | AGGR-0001 | AGGR-0010 | Name 06 |
| AGGR-0007 | AGGR-0001 | AGGR-0011 | data-engineering |
| AGGR-0008 | AGGR-0001 | AGGR-0012 | Tags 08 |

Beyond the structural tracking of schema versions and their attributes, the system maintains a dimensional model for type change analysis. The fact_column table records quantitative observations about type transitions, with each fact identified by an identifier such as FROM-0001 through FROM-0004 and linked to a type_changed_from dimension via the type_changed_from_key foreign key. This dimension, dim_type_changed_from, provides human-readable labels—Type Changed From Label 01 through Type Changed From Label 04—and categorizes each transition into a type_changed_from_category, such as Type Changed From Category 01 through Type Changed From Category 04. The fact table itself carries three numeric measures: confidence, which ranges from 0.068 to 0.354 across the observed transitions; uncertainty, which spans from 404.01 to 984.09; and a raw value measure, with entries like 257.80, 571.55, 140.18, and 131.27. These measures enable downstream analytics on the reliability and magnitude of type changes, supporting governance decisions about when a schema evolution is sufficiently validated to be promoted to a stable release.

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

The interplay between these tables creates a coherent governance framework. A schema version identifier anchors the entire chain: it defines which attributes belong to the version, those attributes define which value tables hold the data, and the type_changed_from dimension provides the categorical context for understanding how those attributes have evolved. Confidence and uncertainty scores attached to type transitions allow operators to distinguish between well-understood changes—those with higher confidence and lower uncertainty—and risky transitions that may warrant additional review. The entity-attribute-value structure, while introducing join complexity, provides the flexibility needed to support heterogeneous schemas without requiring schema-on-write constraints. In practice, this means that a single identifier like VERS-0001 can simultaneously reference the EventCatalog schema at release-11.0, carry a checksum value of a3f9c21e, hold a created_date of 2024-06-07, and participate in a type change analysis with a confidence of 0.164 and an uncertainty of 560.21—all within a single, queryable data model.