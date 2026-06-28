---
chapter_id: ch_live_process_min_one_output_7d4576
topic_id: 72
family: 07_long_tail
cited_terms: ['process_min_one_output', 'outlier_detection_basic', 'attestation_about_compliance_claim']
model: engine-refine
---

Process outputs such as the cleaned dataset produced by the feature extraction pipeline (OUTP-0001), the rollback snapshot generated during the pipeline rollback procedure (OUTP-0002), the feature matrix from the feature extraction pipeline (OUTP-0003), and the detection alert emitted by the model training run (OUTP-0004) constitute the foundational artifacts of any auditable data operations environment. Each output carries a suite of attributes—duration_seconds, end_time, exit_code, and host_name—typed according to strict schema conventions: xsd:decimal for temporal durations, xsd:dateTime for event timestamps, xsd:integer for numeric exit codes, and xsd:string for textual identifiers. The end_time attribute, for instance, records precise moments such as 2023-04-19T05:25:34 and 2025-05-24T00:18:25, anchoring each output to an immutable point in time; the duration_seconds attribute captures execution spans ranging from 1575.12 to 6826.25 units, providing a quantitative measure of resource consumption that directly informs capacity planning and SLA compliance. These typed attributes are not embedded within the output record itself but are resolved through a normalized value layer where entity_id and attr_id foreign keys map each output to its corresponding typed value—whether a decimal magnitude, a datetime stamp, an integer code, or a categorical string such as ingest-21, Log Level 02, closeout, or complete.

**t_process_min_one_output**

| id | process | output |
| --- | --- | --- |
| OUTP-0001 | feature extraction pipeline | cleaned dataset |
| OUTP-0002 | pipeline rollback procedure | rollback snapshot |
| OUTP-0003 | feature extraction pipeline | feature matrix |
| OUTP-0004 | model training run | detection alert |
| OUTP-0005 | data validation cycle | cleaned dataset |
| OUTP-0006 | model training run | cleaned dataset |
| OUTP-0007 | anomaly detection sweep | cleaned dataset |

**t_process_min_one_output_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OUTP-0001 | duration_seconds | xsd:decimal |
| OUTP-0002 | end_time | xsd:dateTime |
| OUTP-0003 | exit_code | xsd:integer |
| OUTP-0004 | host_name | xsd:string |
| OUTP-0005 | log_level | xsd:string |
| OUTP-0006 | phase | xsd:string |
| OUTP-0007 | retry_count | xsd:integer |
| OUTP-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_output_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0002 | 2023-04-19T05:25:34 |
| OUTP-0002 | OUTP-0001 | OUTP-0008 | 2023-03-27T21:29:05 |
| OUTP-0003 | OUTP-0001 | OUTP-0009 | 2025-05-24T00:18:25 |
| OUTP-0004 | OUTP-0002 | OUTP-0002 | 2024-01-13T03:16:51 |
| OUTP-0005 | OUTP-0002 | OUTP-0008 | 2024-09-26T20:27:11 |
| OUTP-0006 | OUTP-0002 | OUTP-0009 | 2023-06-30T01:21:38 |
| OUTP-0007 | OUTP-0003 | OUTP-0002 | 2024-04-05T13:10:28 |
| OUTP-0008 | OUTP-0003 | OUTP-0008 | 2023-07-31T01:33:46 |

**t_process_min_one_output_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0001 | 1575.12 |
| OUTP-0002 | OUTP-0002 | OUTP-0001 | 3915.42 |
| OUTP-0003 | OUTP-0003 | OUTP-0001 | 6819.95 |
| OUTP-0004 | OUTP-0004 | OUTP-0001 | 6826.25 |
| OUTP-0005 | OUTP-0005 | OUTP-0001 | 4127.39 |
| OUTP-0006 | OUTP-0006 | OUTP-0001 | 1299.93 |
| OUTP-0007 | OUTP-0007 | OUTP-0001 | 6249.12 |

**t_process_min_one_output_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0003 | 695 |
| OUTP-0002 | OUTP-0001 | OUTP-0007 | 449 |
| OUTP-0003 | OUTP-0002 | OUTP-0003 | 903 |
| OUTP-0004 | OUTP-0002 | OUTP-0007 | 474 |
| OUTP-0005 | OUTP-0003 | OUTP-0003 | 215 |
| OUTP-0006 | OUTP-0003 | OUTP-0007 | 204 |
| OUTP-0007 | OUTP-0004 | OUTP-0003 | 967 |
| OUTP-0008 | OUTP-0004 | OUTP-0007 | 241 |

**t_process_min_one_output_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0004 | ingest-21 |
| OUTP-0002 | OUTP-0001 | OUTP-0005 | Log Level 02 |
| OUTP-0003 | OUTP-0001 | OUTP-0006 | closeout |
| OUTP-0004 | OUTP-0001 | OUTP-0010 | complete |
| OUTP-0005 | OUTP-0001 | OUTP-0011 | Triggered By 05 |
| OUTP-0006 | OUTP-0002 | OUTP-0004 | worker-07 |
| OUTP-0007 | OUTP-0002 | OUTP-0005 | Log Level 07 |
| OUTP-0008 | OUTP-0002 | OUTP-0006 | closeout |

The outlier detection subsystem operates as a parallel evidentiary track, capturing anomalous execution events through a fact table keyed by identifiers DETE-0001 through DETE-0004, each of which records a duration_seconds measurement, an exit_code, and a retry_count. The duration_seconds field in this context diverges from the process output attribute: here it measures the elapsed time of the anomalous event itself, with values such as 3360.34, 6466.78, 5282.09, and 1182.39 seconds reflecting the temporal footprint of each detected deviation. Exit codes—760, 4, 490, and 124—encode the termination status of the failed or anomalous process, while retry counts of 293, 225, 101, and 308 quantify the number of recovery attempts before the system escalated or abandoned the operation. These three numeric fields form the core of the outlier fact, and they are enriched by a dimension table that assigns each outlier a human-readable label (Outlier Label 01 through Outlier Label 04) and a categorical classification (Outlier Category 01 through Outlier Category 04), enabling downstream reporting and threshold-based alerting.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DETE-0001 | DETE-0003 | 3360.34 | 760 | 293 |
| DETE-0002 | DETE-0001 | 6466.78 | 4 | 225 |
| DETE-0003 | DETE-0002 | 5282.09 | 490 | 101 |
| DETE-0004 | DETE-0003 | 1182.39 | 124 | 308 |
| DETE-0005 | DETE-0002 | 3041.72 | 808 | 59 |
| DETE-0006 | DETE-0005 | 3852.38 | 619 | 489 |
| DETE-0007 | DETE-0003 | 1453.07 | 682 | 1 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |

Attestation records provide the formal mechanism by which system-generated claims are accompanied by a quantified confidence score and an associated uncertainty metric. The attestation fact table, keyed by identifiers CLAI-0001 through CLAI-0004, stores a confidence value—ranging from a low of 0.051 to a high of 0.987—alongside an uncertainty measurement that spans from 91.51 to 986.76, and a numeric value such as 571.54, 362.06, 96.81, or 16.44 that represents the underlying claim being attested. The confidence field, expressed as a decimal fraction, communicates the degree of assurance that the attesting system places in the associated claim; a confidence of 0.987 signals near-certainty, whereas 0.051 indicates profound doubt. The uncertainty field, expressed in absolute units, provides a complementary measure of variance or error bounds around the claim's value. The attestation dimension table supplements these numeric fields with attestation_label entries (Attestation Label 01 through Attestation Label 04) and attestation_category entries (Attestation Category 01 through Attestation Category 04), enabling classification and aggregation of attestation records by domain, purpose, or regulatory requirement.

**fact_attestation**

| id | attestation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 0.051 | 91.51 | 571.54 |
| CLAI-0002 | CLAI-0001 | 0.840 | 986.76 | 362.06 |
| CLAI-0003 | CLAI-0003 | 0.482 | 606.80 | 96.81 |
| CLAI-0004 | CLAI-0004 | 0.987 | 859.08 | 16.44 |
| CLAI-0005 | CLAI-0003 | 0.738 | 864.19 | 799.64 |

**dim_attestation**

| id | attestation_label | attestation_category |
| --- | --- | --- |
| CLAI-0001 | Attestation Label 01 | Attestation Category 01 |
| CLAI-0002 | Attestation Label 02 | Attestation Category 02 |
| CLAI-0003 | Attestation Label 03 | Attestation Category 03 |
| CLAI-0004 | Attestation Label 04 | Attestation Category 04 |
| CLAI-0005 | Attestation Label 05 | Attestation Category 05 |
| CLAI-0006 | Attestation Label 06 | Attestation Category 06 |

The interrelation of these tables forms a coherent evidentiary chain: process outputs are defined and typed through the attribute schema, their values are resolved through the normalized value tables keyed by entity and attribute identifiers, outlier facts capture deviations from expected behavior with duration, exit, and retry metrics, and attestation facts provide a formal confidence-weighted assertion about the state of the system. The foreign-key relationships—entity_id and attr_id linking value tables to the attribute definition table, attestation_key and outlier_key linking fact tables to their respective dimension tables—ensure that every numeric measurement, timestamp, and categorical label can be traced back to its source definition and contextual classification. In a compliance or governance context, this structure supports auditability: an auditor can reconstruct the full provenance of any output artifact, verify the conditions under which an outlier was detected, and assess the confidence with which the system attests to its own operational state.