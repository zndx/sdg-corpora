---
chapter_id: ch_live_profile_over_time_window_200f0d
topic_id: 195
family: 02_observation_measurement
cited_terms: ['profile_over_time_window', 'profiling_basic', 'profiling_only_targets_datasets']
model: engine-refine
---

Profiling constitutes the systematic examination of data assets to produce measurable indicators of quality, completeness, and structural integrity. Each profiling run is assigned a unique identifier—PROF-0001 through PROF-0004 in the operational corpus—and is classified within a categorical taxonomy that governs its scope and methodology. The profiling dimension carries a human-readable label such as "Profiling Label 01" and is associated with a category designation like "Profiling Category 01," which in turn references a category key (PROF-0008, PROF-0001, PROF-0007, PROF-0005) to establish a hierarchical classification. These runs target specific analytical operations: null rate analysis, cardinality profiling, data lineage sweep, and hash integrity check, each of which exercises a distinct quality-assurance function against the underlying datasets. The duration of individual profiling executions varies substantially, ranging from 1113.38 seconds for a comparatively brief assessment to 6716.87 seconds for a more exhaustive examination, reflecting the computational intensity of the underlying analysis.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

The confidence metric serves as the primary gauge of result reliability within the profiling framework, expressed as a decimal value between zero and one. A confidence of 0.994 indicates near-certainty in the assessment outcome, whereas a value of 0.226 signals considerable doubt and warrants manual review. This metric is paired with an uncertainty figure—measured in the same units as the observed value—that quantifies the margin of error around the point estimate. In the corpus, uncertainty values span from 284.36 to 622.09, while the associated misc values (the observed measurements themselves) range from 380.57 to 728.94. The over_time_window dimension provides temporal context for these measurements, with each window identified by a key such as WIND-0005 or WIND-0007 and labeled descriptively (e.g., "Over Time Window Label 01"). Windows are further classified under category designations like "Over Time Window Category 01," which reference category keys (WIND-0008, WIND-0004) to enable temporal aggregation and trend analysis across comparable measurement periods.

**fact_profile**

| id | over_time_window_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WIND-0001 | WIND-0005 | 0.299 | 284.36 | 728.94 |
| WIND-0002 | WIND-0007 | 0.994 | 557.92 | 380.57 |
| WIND-0003 | WIND-0004 | 0.773 | 622.09 | 607.36 |
| WIND-0004 | WIND-0007 | 0.226 | 488.10 | 448.09 |

**dim_over_time_window_category**

| id | category_name |
| --- | --- |
| WIND-0001 | Category Name 01 |
| WIND-0002 | Category Name 02 |
| WIND-0003 | Category Name 03 |
| WIND-0004 | Category Name 04 |
| WIND-0005 | Category Name 05 |
| WIND-0006 | Category Name 06 |
| WIND-0007 | Category Name 07 |
| WIND-0008 | Category Name 08 |

**dim_over_time_window**

| id | over_time_window_label | over_time_window_category | category_id |
| --- | --- | --- | --- |
| WIND-0001 | Over Time Window Label 01 | Over Time Window Category 01 | WIND-0008 |
| WIND-0002 | Over Time Window Label 02 | Over Time Window Category 02 | WIND-0004 |
| WIND-0003 | Over Time Window Label 03 | Over Time Window Category 03 | WIND-0008 |
| WIND-0004 | Over Time Window Label 04 | Over Time Window Category 04 | WIND-0004 |
| WIND-0005 | Over Time Window Label 05 | Over Time Window Category 05 | WIND-0005 |
| WIND-0006 | Over Time Window Label 06 | Over Time Window Category 06 | WIND-0002 |
| WIND-0007 | Over Time Window Label 07 | Over Time Window Category 07 | WIND-0006 |

The entity-attribute-value model forms the backbone of the profiling data store, enabling heterogeneous attribute types to be recorded within a unified schema. Attributes are defined by name and type: duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string, among others. Each entity—identified by keys such as DATA-0001 or DATA-0002—carries a set of attribute values distributed across type-specific value tables. Decimal values include 30.48 and 6189.13, integer values encompass 255 and 337, datetime values record timestamps such as 2024-10-18T20:19:23 and 2025-02-03T06:32:48, and varchar values capture categorical states like "gw-12," "Log Level 02," "closeout," and "failed." This normalization permits flexible schema evolution without requiring structural changes to the underlying tables.

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |

Exit codes and retry counts provide operational telemetry that complements the quality metrics produced by profiling. The exit_code column records the termination status of each profiling run, with values such as 725, 809, 348, and 827 indicating the specific condition under which execution concluded. These codes are not binary success/failure indicators but rather granular status signals that enable root-cause analysis when profiling jobs encounter anomalies. The retry_count column tracks how many times a profiling operation was reattempted before reaching its final state, with observed values of 209, 186, 303, and 264 suggesting that significant re-execution is common in production environments. High retry counts may indicate transient infrastructure issues, data access contention, or resource constraints that warrant investigation. Together, these operational metrics form a feedback loop that informs capacity planning and reliability engineering for the profiling infrastructure.