---
chapter_id: ch_live_aggregation_over_time_window_eb62e0
topic_id: 36
family: 02_observation_measurement
cited_terms: ['aggregation_over_time_window', 'column_lineage_describes_pair', 'requirement_under_standard']
model: engine-refine
---

Identifiers serve as the immutable addressing layer across all operational registries, anchoring every entity to a stable reference that survives schema evolution and cross-system reconciliation. In the aggregation domain, identifiers such as WIND-0001 through WIND-0004 designate distinct temporal aggregation definitions—RealTimeClusterLoad, MonthlyThroughputMetric, and AnnualCapacityForecast—each bound to a specific time window like MonthlySettlement, TrailingSevenDays, or BusinessHours. Within the compliance domain, identifiers STAN-0001 through STAN-0004 enumerate requirements including Minimum sampling rate, Quality threshold, Provenance tracking, and Access control policy, each mapped to a governing standard such as GDPR, NIST SP 800-53, IEEE 802.11, or HIPAA. The column lineage registry employs its own identifier namespace, PAIR-0001 through PAIR-0004, to reference transformation pairs such as telemetry_payload to parsed_telemetry or raw_customer_id to order_timestamp. This separation of identifier spaces prevents collision while enabling each entity to carry its own attribute set without cross-contamination.

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

An attribute is a named property that qualifies an entity, and its type constrains the domain of permissible values to a precise schema namespace. The aggregation attributes include confidence typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. The compliance attributes encompass effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. This typed discipline ensures that a confidence score of 0.781 and a priority ranking of 224 are stored in structurally distinct value tables, preventing type coercion errors at query time. The attr_name column records the semantic label while attr_type records the XSD constraint, together forming a self-describing metadata pair that governs validation, serialization, and cross-referencing.

Value storage is partitioned by type into dedicated tables—t_aggregation_over_time_window_val_decimal, t_aggregation_over_time_window_val_varchar, t_aggregation_over_time_window_val_datetime, t_requirement_under_standard_val_boolean, t_requirement_under_standard_val_date, t_requirement_under_standard_val_int, and t_requirement_under_standard_val_varchar—each keyed by a surrogate identifier and linked to an entity via entity_id and to an attribute via attr_id. Decimal values such as 0.781, 86.18, 786.35, and 0.307 populate the decimal store; string values including Dimension Kind 01, Encoding 02, pre-release note, and en populate the varchar store; timestamps like 2023-08-23T11:54:15 and 2025-01-03T19:33:06 populate the datetime store; boolean flags true and false populate the boolean store; dates such as 2024-02-08 and 2023-09-30 populate the date store; and integers including 3, 224, 4, and 622 populate the integer store. This normalization by value type preserves precision, enables indexed range queries on numerics, and isolates temporal data for efficient time-series operations.

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

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | GDPR |
| STAN-0002 | Quality threshold | NIST SP 800-53 |
| STAN-0003 | Provenance tracking | IEEE 802.11 |
| STAN-0004 | Access control policy | HIPAA |
| STAN-0005 | Provenance tracking | IEEE 802.11 |
| STAN-0006 | Access control policy | FAIR Principles |

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

Confidence and method constitute the provenance layer that documents how relationships and mappings were established. In the column lineage registry, confidence scores range from 0.259 for the pii_masking_rule mapping to 0.783 for the price_normalization mapping, with intermediate values of 0.290 and 0.319 for tax_calc_engine transformations. The method column records whether each lineage pair was derived through manual curation or a hybrid automated-assisted process. Confidence values also appear as attributes on aggregation entities themselves, where a confidence of 0.307 is recorded for entity WIND-0002, suggesting that the system tracks both the provenance of structural relationships and the reliability of individual metric values. This dual-layer provenance—method for process classification and confidence for quantitative assurance—enables downstream consumers to weight lineage information appropriately during data quality assessments.

**t_column_lineage_describes_pair**

| id | column | from_column | to_column | confidence | method |
| --- | --- | --- | --- | --- | --- |
| PAIR-0001 | tax_calc_engine | telemetry_payload | parsed_telemetry | 0.290 | manual |
| PAIR-0002 | tax_calc_engine | raw_customer_id | order_timestamp | 0.319 | manual |
| PAIR-0003 | price_normalization | product_sku | raw_customer_id | 0.783 | hybrid |
| PAIR-0004 | pii_masking_rule | masked_ip_address | parsed_telemetry | 0.259 | hybrid |