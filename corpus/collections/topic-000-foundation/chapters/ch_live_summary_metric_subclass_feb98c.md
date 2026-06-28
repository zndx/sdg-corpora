---
chapter_id: ch_live_summary_metric_subclass_feb98c
topic_id: 0
family: 07_long_tail
cited_terms: ['summary_metric_subclass', 'outlier_detection_targets_dataset', 'attribute_set_min_one']
model: engine-refine
---

The governance of observability data rests on a disciplined separation between definitional metadata and measured observations, a pattern instantiated in the metric subclass registry and its associated attribute schema. Each metric subclass—identified by a stable surrogate key such as `METR-0001` through `METR-0004`—carries a human-readable summary label like `network_bandwidth_rollup` or `error_rate_dashboard` and a `metric_kind` classification (`count`, `distribution`) that governs downstream aggregation semantics. The attribute layer, defined in the subclass-attribute mapping, binds typed properties to these metrics: a `checksum` attribute of type `xsd:string`, a `created_date` of type `xsd:date`, an `identifier` of type `cco:DesignativeICE`, and a `license` of type `xsd:string`. These type annotations are not decorative; they enforce value-domain constraints across the three value tables—`val_date`, `val_int`, and `val_varchar`—which store heterogeneous attribute values keyed by a composite of `entity_id` and `attr_id`. For instance, the `created_date` attribute (`attr_id` = `METR-0002`) holds date literals such as `2023-11-11`, `2024-08-19`, `2023-07-21`, and `2023-02-24` across different metric entities, while the `val_varchar` table stores opaque identifiers like `7b14de08`, registry URIs such as `oid:1.3.6.1`, license strings like `MPL-2.0`, and region codes including `ap-south-2`. The `val_int` table similarly captures numeric attributes with values ranging from `1` to `245`, all referenced by the same `entity_id`/`attr_id` composite that anchors the dimensional model.

**t_summary_metric_subclass**

| id | summary | metric_kind |
| --- | --- | --- |
| METR-0001 | network_bandwidth_rollup | count |
| METR-0002 | network_bandwidth_rollup | count |
| METR-0003 | batch_job_completion_rate | distribution |
| METR-0004 | error_rate_dashboard | count |
| METR-0005 | resource_utilization_snapshot | maximum |
| METR-0006 | storage_io_throughput | delta |
| METR-0007 | system_uptime_window | average |

**t_summary_metric_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| METR-0001 | checksum | xsd:string |
| METR-0002 | created_date | xsd:date |
| METR-0003 | identifier | cco:DesignativeICE |
| METR-0004 | license | xsd:string |
| METR-0005 | mime_type | xsd:string |
| METR-0006 | size_bytes | xsd:long |
| METR-0007 | uri | xsd:string |
| METR-0008 | version | xsd:integer |

The attribute fact table extends this structure from static metadata into the realm of measured, confidence-weighted observations. Each fact row—identified by a surrogate key such as `ONE-0001` through `ONE-0004`—associates an `attribute_key` (e.g., `ONE-0005`, `ONE-0003`) with a numeric `value` (ranging from `100.75` to `779.52`), a `confidence` score (spanning `0.123` to `0.926`), and an `uncertainty` magnitude (from `274.08` to `957.49`). The confidence-uncertainty pairing is the critical innovation: a measurement of `482.01` with `confidence` `0.926` and `uncertainty` `957.49` conveys a fundamentally different assurance profile than a measurement of `100.75` with `confidence` `0.123` and `uncertainty` `455.70`. The former represents a high-certainty observation with a wide absolute uncertainty band, while the latter is a low-certainty reading with a comparatively tighter band—a distinction that matters enormously in downstream alerting and anomaly detection. These facts are contextualized by the attribute dimension table, which assigns each fact an `attribute_label` (`Attribute Label 01` through `Attribute Label 04`) and an `attribute_category` (`Attribute Category 01` through `Attribute Category 04`), enabling categorical rollups and policy-based filtering.

Outlier detection follows an analogous fact-dimension architecture, but with operational telemetry as its subject matter. The outlier fact table records each anomalous event with a surrogate `id` (`DATA-0001` through `DATA-0004`), an `outlier_key` that may reference the same event across multiple observations (note that `DATA-0003` appears as both an `id` and an `outlier_key` value, indicating self-referential or repeated anomaly signatures), a `duration_seconds` measurement (from `1182.39` to `6466.78`), an `exit_code` (values `4`, `124`, `490`, `760`), and a `retry_count` (from `101` to `308`). The `duration_seconds` field captures the temporal extent of the anomalous state—`6466.78` seconds for `DATA-0002` versus `1182.39` seconds for `DATA-0004`—while `exit_code` encodes the termination condition of the affected process, and `retry_count` quantifies the remediation effort expended. The outlier dimension table provides the human-readable context: each outlier receives an `outlier_label` (`Outlier Label 01` through `Outlier Label 04`) and an `outlier_category` (`Outlier Category 01` through `Outlier Category 04`), enabling categorical aggregation of anomaly patterns across the fleet.

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

The foreign-key topology binding these tables forms a coherent star-schema topology. The metric subclass table (`t_summary_metric_subclass`) sits at the center, with its `id` referenced as `entity_id` across all three value tables (`val_date`, `val_int`, `val_varchar`) and as `attr_id` in the subclass-attribute mapping. The attribute fact table (`fact_attribute`) references `dim_attribute` through the `attribute_key`/`id` relationship, and the outlier fact table (`fact_outlier`) references `dim_outlier` through the `outlier_key`/`id` relationship. This design ensures that every measured value—whether a date literal like `2023-02-24`, an integer like `245`, a confidence score like `0.926`, or a duration like `3360.34` seconds—traces back to a well-defined attribute or outlier concept, and every concept carries a category label that supports governance queries. The `misc` column, appearing in the value tables and dimension tables, serves as the catch-all for heterogeneous string data that does not fit the typed attribute schema, including license identifiers, region codes, and free-form labels.

**t_summary_metric_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0002 | 2023-11-11 |
| METR-0002 | METR-0002 | METR-0002 | 2024-08-19 |
| METR-0003 | METR-0003 | METR-0002 | 2023-07-21 |
| METR-0004 | METR-0004 | METR-0002 | 2023-02-24 |
| METR-0005 | METR-0005 | METR-0002 | 2024-01-28 |
| METR-0006 | METR-0006 | METR-0002 | 2025-06-08 |
| METR-0007 | METR-0007 | METR-0002 | 2023-06-04 |

**t_summary_metric_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0006 | 23 |
| METR-0002 | METR-0001 | METR-0008 | 7 |
| METR-0003 | METR-0002 | METR-0006 | 245 |
| METR-0004 | METR-0002 | METR-0008 | 1 |
| METR-0005 | METR-0003 | METR-0006 | 376 |
| METR-0006 | METR-0003 | METR-0008 | 2 |
| METR-0007 | METR-0004 | METR-0006 | 195 |
| METR-0008 | METR-0004 | METR-0008 | 7 |

**t_summary_metric_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0001 | 7b14de08 |
| METR-0002 | METR-0001 | METR-0003 | oid:1.3.6.1 |
| METR-0003 | METR-0001 | METR-0004 | MPL-2.0 |
| METR-0004 | METR-0001 | METR-0009 | ap-south-2 |
| METR-0005 | METR-0001 | METR-0005 | application/avro |
| METR-0006 | METR-0001 | METR-0010 | Name 06 |
| METR-0007 | METR-0001 | METR-0011 | ml-infra |
| METR-0008 | METR-0001 | METR-0012 | Tags 08 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DATA-0001 | Outlier Label 01 | Outlier Category 01 |
| DATA-0002 | Outlier Label 02 | Outlier Category 02 |
| DATA-0003 | Outlier Label 03 | Outlier Category 03 |
| DATA-0004 | Outlier Label 04 | Outlier Category 04 |
| DATA-0005 | Outlier Label 05 | Outlier Category 05 |
| DATA-0006 | Outlier Label 06 | Outlier Category 06 |

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONE-0001 | ONE-0005 | 0.926 | 957.49 | 482.01 |
| ONE-0002 | ONE-0003 | 0.786 | 274.08 | 742.87 |
| ONE-0003 | ONE-0005 | 0.123 | 455.70 | 100.75 |
| ONE-0004 | ONE-0003 | 0.178 | 516.20 | 779.52 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| ONE-0001 | Attribute Label 01 | Attribute Category 01 |
| ONE-0002 | Attribute Label 02 | Attribute Category 02 |
| ONE-0003 | Attribute Label 03 | Attribute Category 03 |
| ONE-0004 | Attribute Label 04 | Attribute Category 04 |
| ONE-0005 | Attribute Label 05 | Attribute Category 05 |
| ONE-0006 | Attribute Label 06 | Attribute Category 06 |