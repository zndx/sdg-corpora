---
chapter_id: ch_live_regional_quality_benchmark_3e55e6
topic_id: 0
family: 08_derived
cited_terms: ['regional_quality_benchmark', 'outlier_detection_targets_dataset', 'kernel_event_with_tid']
model: engine-refine
---

The architecture of the kernel event registry relies on a disciplined separation between attribute definitions and their runtime values, a pattern that ensures type safety and query efficiency across heterogeneous data. Each event carries an identifier—such as TID-0001 or TID-0002—that anchors it to a specific kernel and thread context, with kernels ranging from ZFS on Linux and Darwin 22.4.0 to FreeBSD 13.2 and Linux 5.15.0, and thread identifiers such as 11475, 15634, and 9001. The attributes themselves are catalogued in a dedicated schema table where each attribute name—duration_seconds, end_time, exit_code, host_name—is paired with an attr_type drawn from the XSD namespace: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. This type declaration is not merely metadata; it governs which value table receives the data. Decimal-valued attributes flow into the decimal value table, where entity TID-0001 records a duration of 5060.73, entity TID-0002 records 6983.04, and entity TID-0003 records 363.99. Integer-valued attributes populate the integer value table, with entity TID-0001 carrying values of 883 and 384 across different attributes, while entity TID-0002 carries 644 and 289. String-valued attributes are stored in the varchar value table, where entity TID-0001 holds gw-12, Log Level 02, review, and running across four distinct attributes. Datetime values follow the same partitioned pattern, with entity TID-0001 recording 2025-02-14T18:33:06, 2024-07-20T10:27:40, and 2024-06-11T20:07:21, and entity TID-0002 recording 2025-04-06T19:50:52. The entity column in each value table serves as the foreign key back to the event, while the attr_id column references the attribute definition, forming a normalized entity-attribute-value structure that is materialized across four parallel value tables by type.

**t_kernel_event_with_tid**

| id | kernel | with_thread_id |
| --- | --- | --- |
| TID-0001 | ZFS on Linux | 11475 |
| TID-0002 | Darwin 22.4.0 | 15634 |
| TID-0003 | FreeBSD 13.2 | 9001 |
| TID-0004 | Linux 5.15.0 | 9001 |
| TID-0005 | ZFS on Linux | 15634 |
| TID-0006 | Red Hat 4.18 | 3320 |

**t_kernel_event_with_tid_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TID-0001 | duration_seconds | xsd:decimal |
| TID-0002 | end_time | xsd:dateTime |
| TID-0003 | exit_code | xsd:integer |
| TID-0004 | host_name | xsd:string |
| TID-0005 | log_level | xsd:string |
| TID-0006 | phase | xsd:string |
| TID-0007 | retry_count | xsd:integer |
| TID-0008 | scheduled_at | xsd:dateTime |

**t_kernel_event_with_tid_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0002 | 2025-02-14T18:33:06 |
| TID-0002 | TID-0001 | TID-0008 | 2024-07-20T10:27:40 |
| TID-0003 | TID-0001 | TID-0009 | 2024-06-11T20:07:21 |
| TID-0004 | TID-0002 | TID-0002 | 2025-04-06T19:50:52 |
| TID-0005 | TID-0002 | TID-0008 | 2025-02-15T21:22:11 |
| TID-0006 | TID-0002 | TID-0009 | 2024-07-12T03:26:24 |
| TID-0007 | TID-0003 | TID-0002 | 2024-05-24T01:52:05 |
| TID-0008 | TID-0003 | TID-0008 | 2023-12-06T07:40:08 |

**t_kernel_event_with_tid_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0001 | 5060.73 |
| TID-0002 | TID-0002 | TID-0001 | 6983.04 |
| TID-0003 | TID-0003 | TID-0001 | 363.99 |
| TID-0004 | TID-0004 | TID-0001 | 6644.72 |
| TID-0005 | TID-0005 | TID-0001 | 5301.35 |
| TID-0006 | TID-0006 | TID-0001 | 4668.07 |

**t_kernel_event_with_tid_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0003 | 883 |
| TID-0002 | TID-0001 | TID-0007 | 384 |
| TID-0003 | TID-0002 | TID-0003 | 644 |
| TID-0004 | TID-0002 | TID-0007 | 289 |
| TID-0005 | TID-0003 | TID-0003 | 158 |
| TID-0006 | TID-0003 | TID-0007 | 165 |
| TID-0007 | TID-0004 | TID-0003 | 803 |
| TID-0008 | TID-0004 | TID-0007 | 36 |

**t_kernel_event_with_tid_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0004 | gw-12 |
| TID-0002 | TID-0001 | TID-0005 | Log Level 02 |
| TID-0003 | TID-0001 | TID-0006 | review |
| TID-0004 | TID-0001 | TID-0010 | running |
| TID-0005 | TID-0001 | TID-0011 | Triggered By 05 |
| TID-0006 | TID-0002 | TID-0004 | node-b14 |
| TID-0007 | TID-0002 | TID-0005 | Log Level 07 |
| TID-0008 | TID-0002 | TID-0006 | execution |

Outlier detection and regional measurement follow a parallel dimensional model, each composed of a fact table and a corresponding dimension table. The outlier fact table records discrete anomaly events identified by an identifier such as DATA-0001 or DATA-0002, linked to an outlier_key that may reference another event—DATA-0003 appears as an outlier_key for both DATA-0001 and DATA-0004, suggesting a cascade or dependency relationship. Each outlier fact carries a duration_seconds value, with DATA-0001 lasting 3360.34 seconds, DATA-0002 lasting 6466.78 seconds, DATA-0003 lasting 5282.09 seconds, and DATA-0004 lasting 1182.39 seconds. The exit_code column captures the termination state of the anomalous process, with values of 760, 4, 490, and 124 across the four events, while the retry_count column records how many times the system attempted recovery—293 retries for DATA-0001, 225 for DATA-0002, 101 for DATA-0003, and 308 for DATA-0004. The companion dimension table, dim_outlier, attaches a human-readable label—Outlier Label 01 through Outlier Label 04—and an outlier_category—Outlier Category 01 through Outlier Category 04—to each identifier, enabling categorical aggregation and filtering independent of the raw numeric measurements.

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 3360.34 | 760 | 293 |
| DATA-0002 | DATA-0001 | 6466.78 | 4 | 225 |
| DATA-0003 | DATA-0002 | 5282.09 | 490 | 101 |
| DATA-0004 | DATA-0003 | 1182.39 | 124 | 308 |
| DATA-0005 | DATA-0002 | 3041.72 | 808 | 59 |
| DATA-0006 | DATA-0005 | 3852.38 | 619 | 489 |
| DATA-0007 | DATA-0003 | 1453.07 | 682 | 1 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DATA-0001 | Outlier Label 01 | Outlier Category 01 |
| DATA-0002 | Outlier Label 02 | Outlier Category 02 |
| DATA-0003 | Outlier Label 03 | Outlier Category 03 |
| DATA-0004 | Outlier Label 04 | Outlier Category 04 |
| DATA-0005 | Outlier Label 05 | Outlier Category 05 |
| DATA-0006 | Outlier Label 06 | Outlier Category 06 |

The regional measurement model mirrors this structure with its own fact and dimension tables. The fact_regional table stores quantitative observations keyed by an identifier such as BENC-0001 or BENC-0002, each associated with a regional_key that may repeat across rows—BENC-0001 appears as the regional_key for both BENC-0001 and BENC-0002, indicating that multiple measurements can be attributed to the same regional entity. Each fact carries a value column representing the primary measurement—915.44, 567.07, 179.17, and 261.10 respectively—and a confidence column that quantifies the reliability of that measurement, ranging from 0.036 for BENC-0001 to 0.818 for BENC-0003, with intermediate values of 0.601 and 0.286. An uncertainty column provides an absolute error bound, with values of 509.32, 253.71, 510.50, and 762.47, allowing downstream consumers to assess the precision of each observation. The dim_regional dimension table provides the categorical context, assigning each identifier a regional_label—Regional Label 01 through Regional Label 04—and a regional_category—Regional Category 01 through Regional Category 04—that supports grouping and roll-up operations without coupling the fact table to presentation-level naming conventions.

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |

The attr_type declarations in the attribute schema table are critical to the integrity of the entire value storage layer. By explicitly typing each attribute as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string, the system enforces that values are routed to the correct materialized view or table at ingestion time. This type discipline means that a query for duration_seconds values—xsd:decimal—will only scan the decimal value table, avoiding the cost of filtering irrelevant rows from the integer, varchar, or datetime tables. The attr_name column provides the semantic label that application code and analysts recognize, while the attr_type column provides the structural contract that the storage layer enforces. Together, they form a schema registry that decouples the logical model of events from the physical representation of their values.

The exit_code and retry_count columns in the outlier fact table serve as operational diagnostics that distinguish between transient and persistent failures. An exit_code of 4, as seen for DATA-0002 and DATA-0003, may indicate a specific class of termination condition, while exit_codes of 760 and 124 for DATA-0001 and DATA-0004 respectively suggest different failure modes. The retry_count values—ranging from 101 to 308—quantify the system's resilience effort, with DATA-0004 having undergone 308 retries despite its relatively short duration of 1182.39 seconds, and DATA-0003 having required 101 retries over 5282.09 seconds. These metrics, when correlated with the outlier_category from the dimension table, enable root-cause analysis that separates category-level patterns from individual event anomalies. Similarly, the confidence and uncertainty columns in the regional fact table allow data consumers to weight observations appropriately, with BENC-0003's confidence of 0.818 and uncertainty of 510.50 suggesting a more reliable measurement than BENC-0001's confidence of 0.036 and uncertainty of 509.32, despite both having comparable absolute error bounds.