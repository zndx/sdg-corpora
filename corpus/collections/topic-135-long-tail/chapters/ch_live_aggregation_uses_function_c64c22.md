---
chapter_id: ch_live_aggregation_uses_function_c64c22
topic_id: 135
family: 02_observation_measurement
cited_terms: ['aggregation_uses_function', 'alert_governed_by_runbook', 'alert_triggered_by']
model: engine-refine
---

The alert governance framework is anchored by a fact table recording operational incidents, each identified by a unique identifier such as TRIG-0001 through TRIG-0004, and linked to the metric that precipitated the event through a foreign key referencing the triggering metric dimension. This dimension supplies human-readable labels—Triggered By Metric Label 01, for instance—and groups alerts into categorical buckets like Triggered By Metric Category 01, enabling downstream aggregation by alert class. Each fact record captures three operational metrics: the elapsed duration in seconds, which ranges from 1138.76 for TRIG-0002 to 3285.79 for TRIG-0003; the exit code, a numeric disposition such as 322 or 118; and the retry count, which records how many times the system attempted recovery, with values spanning from 209 for TRIG-0004 to 453 for TRIG-0003. The triggering metric foreign key itself is not uniform across records—TRIG-0002 and TRIG-0003 both reference TRIG-0005, indicating that distinct alert instances can originate from the same underlying metric, a pattern that supports deduplication and trend analysis.

**t_alert_governed_by_runbook**

| id | alert |
| --- | --- |
| RUNB-0001 | Data Pipeline Stalled |
| RUNB-0002 | API Gateway Timeout |
| RUNB-0003 | CPU Utilization Critical |
| RUNB-0004 | TLS Certificate Expiry |
| RUNB-0005 | Disk Space Warning |
| RUNB-0006 | Memory Leak Detected |

**fact_alert**

| id | triggered_by_metric_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRIG-0001 | TRIG-0001 | 3135.98 | 322 | 248 |
| TRIG-0002 | TRIG-0005 | 1138.76 | 442 | 263 |
| TRIG-0003 | TRIG-0005 | 3285.79 | 118 | 453 |
| TRIG-0004 | TRIG-0004 | 1959.41 | 676 | 209 |
| TRIG-0005 | TRIG-0001 | 5812.08 | 4 | 119 |

**dim_triggered_by_metric**

| id | triggered_by_metric_label | triggered_by_metric_category |
| --- | --- | --- |
| TRIG-0001 | Triggered By Metric Label 01 | Triggered By Metric Category 01 |
| TRIG-0002 | Triggered By Metric Label 02 | Triggered By Metric Category 02 |
| TRIG-0003 | Triggered By Metric Label 03 | Triggered By Metric Category 03 |
| TRIG-0004 | Triggered By Metric Label 04 | Triggered By Metric Category 04 |
| TRIG-0005 | Triggered By Metric Label 05 | Triggered By Metric Category 05 |
| TRIG-0006 | Triggered By Metric Label 06 | Triggered By Metric Category 06 |
| TRIG-0007 | Triggered By Metric Label 07 | Triggered By Metric Category 07 |

Governance of these alerts is mediated through a runbook registry that associates each alert with a prescribed remediation procedure. The runbook table enumerates procedures identified by codes such as RUNB-0001 through RUNB-0004 and maps them to alert types including Data Pipeline Stalled, API Gateway Timeout, CPU Utilization Critical, and TLS Certificate Expiry. Each runbook carries a set of typed attributes defined in a separate schema table: effective_date with type xsd:date, enforcement with type xsd:string, mandatory with type xsd:boolean, and priority with type xsd:integer. These attribute definitions establish a rigid type system that constrains the values permissible in the corresponding value tables, ensuring that date fields contain ISO-formatted dates such as 2023-06-14 or 2025-03-21, boolean fields hold only true or false, and integer fields contain whole numbers like 3, 802, 2, or 702. The entity column in each value table serves as the foreign key linking a specific attribute value back to its runbook, while the attr_id column references the attribute definition, creating a normalized structure where attribute metadata is decoupled from its concrete assignments.

**t_alert_governed_by_runbook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RUNB-0001 | effective_date | xsd:date |
| RUNB-0002 | enforcement | xsd:string |
| RUNB-0003 | mandatory | xsd:boolean |
| RUNB-0004 | priority | xsd:integer |
| RUNB-0005 | review_cycle_days | xsd:integer |
| RUNB-0006 | scope | xsd:string |
| RUNB-0007 | encoding | xsd:string |
| RUNB-0008 | label_text | xsd:string |

**t_alert_governed_by_runbook_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0003 | false |
| RUNB-0002 | RUNB-0002 | RUNB-0003 | false |
| RUNB-0003 | RUNB-0003 | RUNB-0003 | true |
| RUNB-0004 | RUNB-0004 | RUNB-0003 | true |
| RUNB-0005 | RUNB-0005 | RUNB-0003 | true |
| RUNB-0006 | RUNB-0006 | RUNB-0003 | true |

**t_alert_governed_by_runbook_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0001 | 2023-06-14 |
| RUNB-0002 | RUNB-0002 | RUNB-0001 | 2023-01-20 |
| RUNB-0003 | RUNB-0003 | RUNB-0001 | 2025-03-21 |
| RUNB-0004 | RUNB-0004 | RUNB-0001 | 2025-02-03 |
| RUNB-0005 | RUNB-0005 | RUNB-0001 | 2023-12-24 |
| RUNB-0006 | RUNB-0006 | RUNB-0001 | 2024-09-30 |

**t_alert_governed_by_runbook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0004 | 3 |
| RUNB-0002 | RUNB-0001 | RUNB-0005 | 802 |
| RUNB-0003 | RUNB-0002 | RUNB-0004 | 2 |
| RUNB-0004 | RUNB-0002 | RUNB-0005 | 702 |
| RUNB-0005 | RUNB-0003 | RUNB-0004 | 5 |
| RUNB-0006 | RUNB-0003 | RUNB-0005 | 87 |
| RUNB-0007 | RUNB-0004 | RUNB-0004 | 1 |
| RUNB-0008 | RUNB-0004 | RUNB-0005 | 47 |

**t_alert_governed_by_runbook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0007 | Encoding 01 |
| RUNB-0002 | RUNB-0001 | RUNB-0002 | Enforcement 02 |
| RUNB-0003 | RUNB-0001 | RUNB-0008 | pre-release note |
| RUNB-0004 | RUNB-0001 | RUNB-0009 | en |
| RUNB-0005 | RUNB-0001 | RUNB-0006 | Scope 05 |
| RUNB-0006 | RUNB-0002 | RUNB-0007 | Encoding 06 |
| RUNB-0007 | RUNB-0002 | RUNB-0002 | Enforcement 07 |
| RUNB-0008 | RUNB-0002 | RUNB-0008 | change rationale |

The value tables are partitioned by data type to enforce schema-level type safety. Boolean values are stored in a dedicated table where entity_id and attr_id columns form a composite foreign key referencing the runbook and attribute definitions respectively; the value column holds only the literals false or true, as seen in records where RUNB-0001 and RUNB-0002 are assigned false while RUNB-0003 and RUNB-0004 receive true. Date values follow the same pattern, with entity_id and attr_id pointing to the governing runbook and the effective_date attribute, and the value column containing dates such as 2023-01-20, 2025-02-03, and 2025-03-21. Integer values are similarly isolated, with entity_id referencing the runbook and attr_id pointing to either the priority attribute or a secondary integer attribute, yielding values like 802 for RUNB-0001 and 702 for RUNB-0002. Variable-length string values reside in a varchar table where entity_id and attr_id reference the runbook and string-type attributes, and the value column contains entries such as Encoding 01, Enforcement 02, pre-release note, and the two-character code en. This type-partitioned design prevents type coercion errors at query time and makes the schema self-documenting.

A parallel dimensional structure governs aggregation functions, which are catalogued in a fact table that records each function's identifier—FUNC-0001 through FUNC-0004—alongside a foreign key to the uses_aggregation_function dimension. This dimension provides a label such as Uses Aggregation Function Label 01, a human-readable category designation like Uses Aggregation Function Category 01, and a category_id foreign key that references the category dimension table, which itself maps category identifiers to category_name values including Category Name 01 through Category Name 04. The aggregation fact table carries three quantitative columns: confidence, which measures the reliability of the aggregation result and ranges from a low of 0.024 for FUNC-0004 to a high of 0.857 for FUNC-0001; uncertainty, which quantifies the margin of error and spans from 527.80 for FUNC-0004 to 850.83 for FUNC-0002; and value, a miscellaneous numeric field holding results such as 835.01, 952.80, 52.67, and 996.14. The confidence and uncertainty columns together provide a probabilistic assessment of each aggregation, where a confidence of 0.024 paired with an uncertainty of 527.80 signals a result of negligible reliability, while a confidence of 0.857 with uncertainty of 811.48 indicates a more trustworthy measurement despite a wide error band. The uses_aggregation_function_key foreign key in the fact table is not one-to-one with the fact identifier—FUNC-0002 and FUNC-0003 both reference FUNC-0004 in the dimension, demonstrating that multiple aggregation facts can draw from the same underlying function definition.

**fact_aggregation**

| id | uses_aggregation_function_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | 0.857 | 811.48 | 835.01 |
| FUNC-0002 | FUNC-0004 | 0.688 | 850.83 | 952.80 |
| FUNC-0003 | FUNC-0004 | 0.639 | 844.56 | 52.67 |
| FUNC-0004 | FUNC-0005 | 0.024 | 527.80 | 996.14 |
| FUNC-0005 | FUNC-0002 | 0.062 | 315.40 | 941.21 |

**dim_uses_aggregation_function_category**

| id | category_name |
| --- | --- |
| FUNC-0001 | Category Name 01 |
| FUNC-0002 | Category Name 02 |
| FUNC-0003 | Category Name 03 |
| FUNC-0004 | Category Name 04 |
| FUNC-0005 | Category Name 05 |
| FUNC-0006 | Category Name 06 |

**dim_uses_aggregation_function**

| id | uses_aggregation_function_label | uses_aggregation_function_category | category_id |
| --- | --- | --- | --- |
| FUNC-0001 | Uses Aggregation Function Label 01 | Uses Aggregation Function Category 01 | FUNC-0003 |
| FUNC-0002 | Uses Aggregation Function Label 02 | Uses Aggregation Function Category 02 | FUNC-0003 |
| FUNC-0003 | Uses Aggregation Function Label 03 | Uses Aggregation Function Category 03 | FUNC-0002 |
| FUNC-0004 | Uses Aggregation Function Label 04 | Uses Aggregation Function Category 04 | FUNC-0005 |
| FUNC-0005 | Uses Aggregation Function Label 05 | Uses Aggregation Function Category 05 | FUNC-0006 |
| FUNC-0006 | Uses Aggregation Function Label 06 | Uses Aggregation Function Category 06 | FUNC-0002 |