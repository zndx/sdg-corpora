---
chapter_id: ch_live_descriptive_not_retracted_1f9759
topic_id: 161
family: 07_long_tail
cited_terms: ['descriptive_not_retracted', 'measurement_produced_by_run', 'aggregation_aggregates_measurement']
model: engine-refine
---

In governed measurement and descriptive-record systems, every assertion is anchored by a stable identifier that survives joins, audits, and downstream reconciliation. Identifiers such as RETR-0001, RUN-0003, and MEAS-0006 function as durable keys: they name the record itself, point foreign relationships at the correct subject, and allow the same logical fact to be cited unchanged across extracts, submissions, and corrective actions. The entity is the object those keys denote—the descriptive artifact, run, or aggregate whose properties are being recorded. A Sensor Drift Note keyed RETR-0001 and an Anomaly Flag Sheet keyed RETR-0002 are distinct entities even when they share attribute names; governance depends on treating entity_id as the binding between a record and its asserted values, so that confidence scores, timestamps, and categorical labels cannot drift onto the wrong subject during batch processing or metadata extension.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

Attributes name what is being said about an entity, while attr type constrains how it may legally be represented. Declaring confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime establishes a typed contract: decimal slots accept magnitudes such as 0.736 and 0.217, datetime slots accept instants such as 2024-02-12T07:34:36 and 2025-01-21T18:04:20, and string slots accept lexical values including Dimension Kind 01, Encoding 02, intake form, and es. Separating attr from attr type is what permits heterogeneous descriptive payloads—Calibration Reference Sheets, Metadata Index Cards, Batch Processing Notes—to share a common attribute vocabulary without collapsing incompatible values into a single untyped column. In practice, reviewers trace attr_id back to the attribute definition before accepting a value entry; a decimal filed against a string attribute, or a timestamp missing timezone discipline, is treated as a conformance defect rather than a mere formatting preference.

Measurements are operational facts: individual observations or run outcomes carrying a reported magnitude, an associated confidence, and an explicit uncertainty band. A measurement keyed RUN-0001 may report value 660.64 at confidence 0.945 with uncertainty 279.24, while another sharing measurement_key RUN-0006 reports 878.99 at confidence 0.506 and 64.10 at confidence 0.307—demonstrating that the same measurement definition can accumulate multiple fact rows whose trustworthiness and error envelopes differ materially. Confidence expresses how strongly the producing process stands behind the assertion; uncertainty quantifies residual doubt in the same units or scale as the measurement itself. Together they govern whether a value may enter compliance calculations, trigger anomaly review, or be downgraded to informational status. Category supplies the taxonomic frame: Measurement Label 03 and Measurement Category 03 align to Category Name 03 through category_id, ensuring that rollups, dashboards, and regulatory line items aggregate like with like rather than mixing incompatible observation classes.

Aggregates elevate measurements and related facts to summary strata suitable for reporting thresholds, portfolio views, and control-total checks. An aggregate keyed MEAS-0003 may carry value 835.01 at confidence 0.857 with uncertainty 811.48, while another row referencing the same aggregates_key MEAS-0003 reports 996.14 at confidence 0.024 and uncertainty 527.80—illustrating that aggregation keys do not imply uniqueness of outcome; multiple aggregate facts may coexist under one definition when methods, periods, or correction passes differ. Aggregates Label 01 through Aggregates Label 04 and their paired Aggregates Category 01–04 mirror the measurement dimension pattern, with category_id tying each aggregate definition to Category Name 01–04 in the aggregates taxonomy. Operators use aggregates to answer questions measurements alone cannot: period totals, cross-sensor blends, and governance rollups where individual run-level noise must be absorbed before comparison to limits.

**fact_aggregation**

| id | aggregates_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0003 | 0.857 | 811.48 | 835.01 |
| MEAS-0002 | MEAS-0004 | 0.688 | 850.83 | 952.80 |
| MEAS-0003 | MEAS-0006 | 0.639 | 844.56 | 52.67 |
| MEAS-0004 | MEAS-0003 | 0.024 | 527.80 | 996.14 |
| MEAS-0005 | MEAS-0004 | 0.062 | 315.40 | 941.21 |

**dim_aggregates_category**

| id | category_name |
| --- | --- |
| MEAS-0001 | Category Name 01 |
| MEAS-0002 | Category Name 02 |
| MEAS-0003 | Category Name 03 |
| MEAS-0004 | Category Name 04 |
| MEAS-0005 | Category Name 05 |
| MEAS-0006 | Category Name 06 |

The misc designation marks value fields that are intentionally polymorphic within their governing context—descriptive titles, measurement magnitudes, aggregate totals, encoded strings—while category, confidence, and uncertainty remain first-class governance dimensions rather than miscellaneous payload. A Metadata Extension Record paired with descriptive_2 on RETR-0001, or an Anomaly Classification Code on RETR-0004, lives in misc because its semantic role is carried by the surrounding entity and attribute binding, not by the column name alone. Uncertainty spanning 120.70 through 850.83 alongside confidences from 0.024 to 0.945 shows why retrieval and attestation workflows must surface all three—identifier, confidence, uncertainty—whenever a value is quoted externally: without that triad, downstream consumers cannot reproduce the producer’s evidentiary posture or defend an aggregate in audit. Identifier integrity, typed attributes, categorical discipline, and the measurement-versus-aggregate distinction thus form the minimum operational grammar for any system that must submit, retract, or defend quantitative results under formal oversight.

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

**fact_measurement**

| id | measurement_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| RUN-0001 | RUN-0003 | 0.496 | 306.26 | 353.34 |
| RUN-0002 | RUN-0001 | 0.945 | 279.24 | 660.64 |
| RUN-0003 | RUN-0006 | 0.506 | 120.70 | 878.99 |
| RUN-0004 | RUN-0006 | 0.307 | 364.07 | 64.10 |
| RUN-0005 | RUN-0003 | 0.923 | 642.96 | 897.70 |

**dim_measurement_category**

| id | category_name |
| --- | --- |
| RUN-0001 | Category Name 01 |
| RUN-0002 | Category Name 02 |
| RUN-0003 | Category Name 03 |
| RUN-0004 | Category Name 04 |
| RUN-0005 | Category Name 05 |
| RUN-0006 | Category Name 06 |

**dim_measurement**

| id | measurement_label | measurement_category | category_id |
| --- | --- | --- | --- |
| RUN-0001 | Measurement Label 01 | Measurement Category 01 | RUN-0004 |
| RUN-0002 | Measurement Label 02 | Measurement Category 02 | RUN-0003 |
| RUN-0003 | Measurement Label 03 | Measurement Category 03 | RUN-0002 |
| RUN-0004 | Measurement Label 04 | Measurement Category 04 | RUN-0005 |
| RUN-0005 | Measurement Label 05 | Measurement Category 05 | RUN-0003 |
| RUN-0006 | Measurement Label 06 | Measurement Category 06 | RUN-0001 |
| RUN-0007 | Measurement Label 07 | Measurement Category 07 | RUN-0002 |

**dim_aggregates**

| id | aggregates_label | aggregates_category | category_id |
| --- | --- | --- | --- |
| MEAS-0001 | Aggregates Label 01 | Aggregates Category 01 | MEAS-0002 |
| MEAS-0002 | Aggregates Label 02 | Aggregates Category 02 | MEAS-0003 |
| MEAS-0003 | Aggregates Label 03 | Aggregates Category 03 | MEAS-0003 |
| MEAS-0004 | Aggregates Label 04 | Aggregates Category 04 | MEAS-0005 |
| MEAS-0005 | Aggregates Label 05 | Aggregates Category 05 | MEAS-0001 |
| MEAS-0006 | Aggregates Label 06 | Aggregates Category 06 | MEAS-0001 |
| MEAS-0007 | Aggregates Label 07 | Aggregates Category 07 | MEAS-0003 |