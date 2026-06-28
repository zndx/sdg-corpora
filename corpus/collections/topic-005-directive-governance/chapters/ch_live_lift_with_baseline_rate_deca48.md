---
chapter_id: ch_live_lift_with_baseline_rate_deca48
topic_id: 5
family: 02_observation_measurement
cited_terms: ['lift_with_baseline_rate', 'existential_with_part_of', 'profiling_with_method']
model: engine-refine
---

Identifiers serve as the immutable anchors of any structured data fabric, and across the observability and metric registries they follow a disciplined naming convention—RATE-0001 through RATE-0004 for lift measurements, METH-0001 through METH-0004 for profiling records, and PART-0001 through PART-0004 for component relationships. Each identifier resolves to a concrete entity: the lift records carry semantic labels such as Conversion Gain, Latency Peak Reduction, Click Through Uplift, and Model v2 Accuracy Lift, while the profiling entries track execution characteristics of methods keyed by identifiers like METH-0001 and METH-0007. The entity concept extends further into infrastructure topology, where components such as regional_telemetry_gateway, alpha_compute_cluster, alpha_query_engine, and primary_stream_processor are explicitly bound to larger systems—geo_redundant_backup, audit_logging_system, and realtime_analytics_platform—through a part-of relationship that preserves architectural provenance.

**t_existential_with_part_of**

| id | existential | part_of |
| --- | --- | --- |
| PART-0001 | regional_telemetry_gateway | geo_redundant_backup |
| PART-0002 | alpha_compute_cluster | audit_logging_system |
| PART-0003 | alpha_query_engine | geo_redundant_backup |
| PART-0004 | primary_stream_processor | realtime_analytics_platform |

Attributes and their associated types form the secondary layer of metadata, enabling heterogeneous values to be stored in a type-safe manner without sacrificing query flexibility. The attribute registry distinguishes between xsd:decimal, xsd:string, and xsd:dateTime types, each governing how the misc column is interpreted at read time. A recorded_at attribute typed as xsd:dateTime carries values like 2024-01-14T18:32:00 and 2023-02-02T03:32:58, while a dimension_kind attribute typed as xsd:string holds values such as Dimension Kind 01 and Encoding 02. Decimal attributes store numeric measurements—0.799, 559.38, 634.64, 0.522—against the same entity identifiers, demonstrating that a single entity can carry multiple typed attributes across separate value tables. The baseline_rate column in the lift registry further illustrates this pattern, anchoring each lift measurement to a reference point such as Control Group Mean, Previous Release Metric, or Historical Median.

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | Control Group Mean |
| RATE-0002 | Latency Peak Reduction | Previous Release Metric |
| RATE-0003 | Click Through Uplift | Historical Median |
| RATE-0004 | Model v2 Accuracy Lift | Historical Median |
| RATE-0005 | Latency Peak Reduction | 72 Hour Average |
| RATE-0006 | Ad Improvement | Previous Release Metric |

**t_lift_with_baseline_rate_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RATE-0001 | confidence | xsd:decimal |
| RATE-0002 | dimension_kind | xsd:string |
| RATE-0003 | method | xsd:string |
| RATE-0004 | recorded_at | xsd:dateTime |
| RATE-0005 | uncertainty | xsd:decimal |
| RATE-0006 | unit | xsd:string |
| RATE-0007 | value | xsd:decimal |
| RATE-0008 | encoding | xsd:string |

**t_lift_with_baseline_rate_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0004 | 2024-01-14T18:32:00 |
| RATE-0002 | RATE-0002 | RATE-0004 | 2023-02-02T03:32:58 |
| RATE-0003 | RATE-0003 | RATE-0004 | 2024-08-11T22:28:18 |
| RATE-0004 | RATE-0004 | RATE-0004 | 2024-10-19T09:19:40 |
| RATE-0005 | RATE-0005 | RATE-0004 | 2023-07-24T08:45:17 |
| RATE-0006 | RATE-0006 | RATE-0004 | 2025-03-24T11:20:59 |

**t_lift_with_baseline_rate_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0001 | 0.799 |
| RATE-0002 | RATE-0001 | RATE-0005 | 559.38 |
| RATE-0003 | RATE-0001 | RATE-0007 | 634.64 |
| RATE-0004 | RATE-0002 | RATE-0001 | 0.522 |
| RATE-0005 | RATE-0002 | RATE-0005 | 254.23 |
| RATE-0006 | RATE-0002 | RATE-0007 | 594.57 |
| RATE-0007 | RATE-0003 | RATE-0001 | 0.290 |
| RATE-0008 | RATE-0003 | RATE-0005 | 361.02 |

**t_lift_with_baseline_rate_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0002 | Dimension Kind 01 |
| RATE-0002 | RATE-0001 | RATE-0008 | Encoding 02 |
| RATE-0003 | RATE-0001 | RATE-0009 | pre-release note |
| RATE-0004 | RATE-0001 | RATE-0010 | de |
| RATE-0005 | RATE-0001 | RATE-0003 | automated |
| RATE-0006 | RATE-0001 | RATE-0006 | ratio |
| RATE-0007 | RATE-0002 | RATE-0002 | Dimension Kind 07 |
| RATE-0008 | RATE-0002 | RATE-0008 | Encoding 08 |

The fact_profiling table captures the operational lifecycle of applied methods through three quantitative dimensions: duration_seconds, exit_code, and retry_count. A single method invocation, identified by METH-0001, may consume 6716.87 seconds and terminate with exit code 725 after 209 retries, while METH-0007 appears twice in the dataset with divergent profiles—1113.38 seconds with exit code 809 and 186 retries on one occasion, 2546.61 seconds with exit code 348 and 303 retries on another. These figures are not merely logged; they are indexed by applies_method_key, which maps back to the method dimension table where each method carries a human-readable label such as Applies Method Label 01 and a categorical classification like Applies Method Category 01. The duration measurements alone span a range from 1113.38 seconds to 6716.87 seconds, revealing the variance in execution cost that any governance framework must account for when setting service-level objectives.

**fact_profiling**

| id | applies_method_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0001 | 6716.87 | 725 | 209 |
| METH-0002 | METH-0007 | 1113.38 | 809 | 186 |
| METH-0003 | METH-0007 | 2546.61 | 348 | 303 |
| METH-0004 | METH-0004 | 2074.93 | 827 | 264 |

Categories provide the organizational scaffold that groups methods into coherent families. The dimension_applies_method_category table assigns names such as Category Name 01 through Category Name 04 to categorical identifiers, while the dimension_applies_method table links each method to its category via a foreign key—METH-0001 and METH-0002 both resolve to category METH-0001, whereas METH-0003 maps to METH-0003 and METH-0004 to METH-0001. This many-to-one relationship means that a single category can encompass multiple methods with disparate durations and exit profiles, and that governance policies can be applied at the category level rather than requiring per-method configuration. The applies_method_label column provides an additional human-readable layer—Applies Method Label 01 through Applies Method Label 04—that bridges the gap between machine-readable identifiers and operational documentation.

**dim_applies_method_category**

| id | category_name |
| --- | --- |
| METH-0001 | Category Name 01 |
| METH-0002 | Category Name 02 |
| METH-0003 | Category Name 03 |
| METH-0004 | Category Name 04 |
| METH-0005 | Category Name 05 |
| METH-0006 | Category Name 06 |

**dim_applies_method**

| id | applies_method_label | applies_method_category | category_id |
| --- | --- | --- | --- |
| METH-0001 | Applies Method Label 01 | Applies Method Category 01 | METH-0006 |
| METH-0002 | Applies Method Label 02 | Applies Method Category 02 | METH-0001 |
| METH-0003 | Applies Method Label 03 | Applies Method Category 03 | METH-0003 |
| METH-0004 | Applies Method Label 04 | Applies Method Category 04 | METH-0001 |
| METH-0005 | Applies Method Label 05 | Applies Method Category 05 | METH-0002 |
| METH-0006 | Applies Method Label 06 | Applies Method Category 06 | METH-0001 |
| METH-0007 | Applies Method Label 07 | Applies Method Category 07 | METH-0001 |

The misc column, appearing across multiple value tables, serves as the catch-all for string-valued attributes that do not fit into the typed decimal or datetime schemas. Values such as pre-release note and de populate this column alongside structured labels, demonstrating that the schema accommodates both machine-parsable metadata and free-form annotations within the same entity-attribute-value model. Together, the identifier, entity, attr, attr_type, category, duration_seconds, exit, retry_count, and misc constructs form a coherent governance substrate: identifiers anchor every record, attributes and their types govern how values are stored and interpreted, categories organize methods into policy domains, and the profiling facts—duration, exit code, retry count—provide the quantitative evidence needed for operational review and compliance auditing.