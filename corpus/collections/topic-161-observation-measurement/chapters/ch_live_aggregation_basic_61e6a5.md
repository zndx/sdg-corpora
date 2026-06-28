---
chapter_id: ch_live_aggregation_basic_61e6a5
topic_id: 161
family: 02_observation_measurement
cited_terms: ['aggregation_basic', 'aggregation_grouped_by', 'aggregation_over_time_window']
model: engine-refine
---

Attributes, their types, and the entities to which they are bound constitute the foundational metadata layer of any structured data system, governing how information is classified, stored, and retrieved. An attribute serves as a named property of an entity—such as `confidence`, `dimension_kind`, `method`, or `recorded_at`—each assigned a precise type that constrains the kind of value it may hold. The attribute type registry, exemplified by the uniform schema of `xsd:decimal`, `xsd:string`, and `xsd:dateTime`, ensures type safety across all value assignments and prevents the corruption of structured data through type mismatches. In practice, this means that a confidence score such as `0.712` or `0.676` is stored in a decimal-specific value table, while a timestamp like `2023-06-08T14:00:36` or `2025-01-14T14:41:10` is routed to a datetime value table, and a categorical label such as `Dimension Kind 01` or `Encoding 02` is persisted in a varchar value table. This type-dispatched storage pattern, replicated across every aggregation category, enforces data integrity at the schema level and eliminates the need for runtime type coercion.

Entities represent the concrete instances to which attributes are applied, and each entity is identified by a unique identifier that serves as the primary key for all relational joins. In the basic aggregation domain, identifiers such as `AGGR-0001` through `AGGR-0004` correspond to distinct aggregation definitions—`Daily telemetry summary`, `Annual inventory rollup`, `Quarterly revenue consolidation`, and `Weekly sensor fusion`—each of which may carry multiple attribute values. The entity identifier functions as the foreign key in every value table, anchoring a row of attribute data to its parent entity. For instance, the decimal value `778.10` is associated with entity `AGGR-0001` through the `entity_id` column, and the varchar value `intake form` is likewise bound to the same entity, establishing a clear lineage from raw value to semantic context. This pattern holds uniformly across all three aggregation categories: `GROU-0001` through `GROU-0004` for grouped-by aggregations such as `cross_department_access_log` and `monthly_billing_snapshot`, and `WIND-0001` through `WIND-0004` for time-window aggregations including `RealTimeClusterLoad` and `MonthlyThroughputMetric`.

**t_aggregation_basic**

| id | aggregation |
| --- | --- |
| AGGR-0001 | Daily telemetry summary |
| AGGR-0002 | Annual inventory rollup |
| AGGR-0003 | Quarterly revenue consolidation |
| AGGR-0004 | Weekly sensor fusion |
| AGGR-0005 | Quarterly revenue consolidation |
| AGGR-0006 | Quarterly revenue consolidation |

**t_aggregation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 0.712 |
| AGGR-0002 | AGGR-0001 | AGGR-0005 | 778.10 |
| AGGR-0003 | AGGR-0001 | AGGR-0007 | 155.63 |
| AGGR-0004 | AGGR-0002 | AGGR-0001 | 0.690 |
| AGGR-0005 | AGGR-0002 | AGGR-0005 | 670.79 |
| AGGR-0006 | AGGR-0002 | AGGR-0007 | 377.50 |
| AGGR-0007 | AGGR-0003 | AGGR-0001 | 0.383 |
| AGGR-0008 | AGGR-0003 | AGGR-0005 | 911.00 |

**t_aggregation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | Dimension Kind 01 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | Encoding 02 |
| AGGR-0003 | AGGR-0001 | AGGR-0009 | intake form |
| AGGR-0004 | AGGR-0001 | AGGR-0010 | es |
| AGGR-0005 | AGGR-0001 | AGGR-0003 | hybrid |
| AGGR-0006 | AGGR-0001 | AGGR-0006 | ratio |
| AGGR-0007 | AGGR-0002 | AGGR-0002 | Dimension Kind 07 |
| AGGR-0008 | AGGR-0002 | AGGR-0008 | Encoding 08 |

**t_aggregation_grouped_by**

| id | aggregation |
| --- | --- |
| GROU-0001 | cross_department_access_log |
| GROU-0002 | monthly_billing_snapshot |
| GROU-0003 | daily_traffic_rollup |
| GROU-0004 | monthly_billing_snapshot |
| GROU-0005 | monthly_billing_snapshot |
| GROU-0006 | regional_temperature_average |

**t_aggregation_grouped_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0001 | 0.676 |
| GROU-0002 | GROU-0001 | GROU-0005 | 770.46 |
| GROU-0003 | GROU-0001 | GROU-0007 | 107.12 |
| GROU-0004 | GROU-0002 | GROU-0001 | 0.437 |
| GROU-0005 | GROU-0002 | GROU-0005 | 595.38 |
| GROU-0006 | GROU-0002 | GROU-0007 | 23.10 |
| GROU-0007 | GROU-0003 | GROU-0001 | 0.551 |
| GROU-0008 | GROU-0003 | GROU-0005 | 567.02 |

**t_aggregation_grouped_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0002 | Dimension Kind 01 |
| GROU-0002 | GROU-0001 | GROU-0008 | Encoding 02 |
| GROU-0003 | GROU-0001 | GROU-0009 | calibration record |
| GROU-0004 | GROU-0001 | GROU-0010 | en |
| GROU-0005 | GROU-0001 | GROU-0003 | manual |
| GROU-0006 | GROU-0001 | GROU-0006 | ms |
| GROU-0007 | GROU-0002 | GROU-0002 | Dimension Kind 07 |
| GROU-0008 | GROU-0002 | GROU-0008 | Encoding 08 |

The attribute identifier, distinct from the entity identifier, serves as the foreign key that links a stored value to its corresponding attribute definition. In the value tables, the `attr_id` column references the `id` column of the attribute registry, thereby resolving any value to its semantic meaning and type constraint. A value of `0.690` stored with `attr_id` equal to `AGGR-0001` is understood to be a confidence measurement, while a value of `es` or `en` stored with `attr_id` equal to `AGGR-0010` or `WIND-0010` respectively, is interpreted as a language code. This two-level indirection—value to attribute, attribute to type—creates a normalized structure that supports schema evolution without requiring changes to the value tables themselves. New attributes can be introduced into the registry without altering the storage layout, and existing attributes can be re-typed by updating their definition rather than migrating stored values.

The misc column, which holds the actual data values, is the terminal node in this relational chain and is typed according to the attribute to which it belongs. Decimal values such as `155.63`, `107.12`, and `86.18` represent quantitative measurements—possibly counts, scores, or aggregated metrics—while datetime values such as `2024-12-13T14:33:07` and `2023-03-02T05:31:47` capture temporal metadata, often indicating when an aggregation was recorded or last updated. Varchar values encompass both structured codes like `Dimension Kind 01` and free-form annotations such as `pre-release note` or `calibration record`, reflecting the system's capacity to store both machine-readable and human-readable metadata within the same framework. The language codes `es` and `en` further demonstrate that the misc column accommodates internationalization metadata, allowing attribute values to be localized without introducing additional tables.

Together, these constructs—identifiers, attributes, types, entities, and misc values—form a cohesive metadata architecture that supports flexible, type-safe data storage across diverse aggregation contexts. The repetition of the same structural pattern across `t_aggregation_basic`, `t_aggregation_grouped_by`, and `t_aggregation_over_time_window` ensures that any aggregation, regardless of its domain or time window, can be described with the same rigor: an identifier anchors the entity, an attribute definition provides the schema, and a typed value table holds the data. This uniformity simplifies query construction, enables cross-domain comparisons, and provides a reliable foundation for governance, auditing, and compliance reporting.

**t_aggregation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | confidence | xsd:decimal |
| AGGR-0002 | dimension_kind | xsd:string |
| AGGR-0003 | method | xsd:string |
| AGGR-0004 | recorded_at | xsd:dateTime |
| AGGR-0005 | uncertainty | xsd:decimal |
| AGGR-0006 | unit | xsd:string |
| AGGR-0007 | value | xsd:decimal |
| AGGR-0008 | encoding | xsd:string |

**t_aggregation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0004 | 2023-06-08T14:00:36 |
| AGGR-0002 | AGGR-0002 | AGGR-0004 | 2024-12-13T14:33:07 |
| AGGR-0003 | AGGR-0003 | AGGR-0004 | 2023-10-30T03:55:23 |
| AGGR-0004 | AGGR-0004 | AGGR-0004 | 2023-08-23T20:37:20 |
| AGGR-0005 | AGGR-0005 | AGGR-0004 | 2023-04-27T16:41:49 |
| AGGR-0006 | AGGR-0006 | AGGR-0004 | 2024-07-14T23:19:51 |

**t_aggregation_grouped_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GROU-0001 | confidence | xsd:decimal |
| GROU-0002 | dimension_kind | xsd:string |
| GROU-0003 | method | xsd:string |
| GROU-0004 | recorded_at | xsd:dateTime |
| GROU-0005 | uncertainty | xsd:decimal |
| GROU-0006 | unit | xsd:string |
| GROU-0007 | value | xsd:decimal |
| GROU-0008 | encoding | xsd:string |

**t_aggregation_grouped_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0004 | 2025-01-14T14:41:10 |
| GROU-0002 | GROU-0002 | GROU-0004 | 2023-10-30T01:59:25 |
| GROU-0003 | GROU-0003 | GROU-0004 | 2023-04-12T02:41:30 |
| GROU-0004 | GROU-0004 | GROU-0004 | 2023-12-16T14:56:57 |
| GROU-0005 | GROU-0005 | GROU-0004 | 2023-04-07T15:52:42 |
| GROU-0006 | GROU-0006 | GROU-0004 | 2023-09-07T01:41:33 |

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |