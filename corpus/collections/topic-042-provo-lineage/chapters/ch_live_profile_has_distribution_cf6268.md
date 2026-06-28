---
chapter_id: ch_live_profile_has_distribution_cf6268
topic_id: 42
family: 02_observation_measurement
cited_terms: ['profile_has_distribution', 'transformation_equiv_io_intersection', 'outlier_detection_basic']
model: engine-refine
---

In governed data environments, every assertion about a profile, transformation, or operational event must be anchored by a stable identifier so that lineage, audit, and reconciliation can proceed without ambiguity. Identifiers such as DIST-0001 through DIST-0004 denote distinct profile–distribution bindings—here pairing Schema Evolution Registry with Kafka Topic Stream, Anomaly Detection Ruleset with JSON Schema Registry, and Schema Validation Profile with XML Metadata Archive—while INTE-0001 through INTE-0004 mark transformation equivalence intersections whose inputs and outputs (for example aggregate_daily_metrics consuming iot_device_streams and emitting financial_transactions, or merge_sensor_readings drawing on user_activity_events and producing raw_telemetry_v3) must remain traceable across revisions. The identifier is not merely a surrogate key; it is the contractual handle by which downstream controls reference the same governed object from attribute declarations through typed value stores and, where applicable, into outlier fact and dimension records keyed as DETE-0001 through DETE-0004.

**t_profile_has_distribution**

| id | profile | distribution |
| --- | --- | --- |
| DIST-0001 | Schema Evolution Registry | Kafka Topic Stream |
| DIST-0002 | Anomaly Detection Ruleset | JSON Schema Registry |
| DIST-0003 | Schema Validation Profile | XML Metadata Archive |
| DIST-0004 | Schema Evolution Registry | Parquet Dataset |
| DIST-0005 | Data Contract Specification | JSON Schema Registry |
| DIST-0006 | Lineage Tracking Map | Parquet Dataset |

**t_profile_has_distribution_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIST-0001 | confidence | xsd:decimal |
| DIST-0002 | dimension_kind | xsd:string |
| DIST-0003 | method | xsd:string |
| DIST-0004 | recorded_at | xsd:dateTime |
| DIST-0005 | uncertainty | xsd:decimal |
| DIST-0006 | unit | xsd:string |
| DIST-0007 | value | xsd:decimal |
| DIST-0008 | encoding | xsd:string |

**t_transformation_equiv_io_intersection**

| id | transformation |
| --- | --- |
| INTE-0001 | aggregate_daily_metrics |
| INTE-0002 | aggregate_daily_metrics |
| INTE-0003 | merge_sensor_readings |
| INTE-0004 | merge_sensor_readings |
| INTE-0005 | resample_telemetry_stream |
| INTE-0006 | transform_csv_to_parquet |

**t_transformation_equiv_io_intersection_input_dataset**

| id | input_dataset |
| --- | --- |
| INTE-0001 | iot_device_streams |
| INTE-0002 | weather_station_data |
| INTE-0003 | user_activity_events |
| INTE-0004 | sensor_aggregates_daily |
| INTE-0005 | financial_transactions |
| INTE-0006 | lab_sample_analyzed |
| INTE-0007 | financial_transactions |

**t_transformation_equiv_io_intersection_output_dataset**

| id | output_dataset |
| --- | --- |
| INTE-0001 | financial_transactions |
| INTE-0002 | weather_station_data |
| INTE-0003 | raw_telemetry_v3 |
| INTE-0004 | network_traffic_logs |
| INTE-0005 | raw_telemetry_v3 |
| INTE-0006 | network_traffic_parsed |

Attributes and their declared types form the semantic contract under which measured or asserted values may be recorded. An attr names the governed property—confidence, dimension_kind, method, recorded_at—while attr_type fixes the interpretive and storage regime: xsd:decimal for numeric scores, xsd:string for categorical or lexical tokens, xsd:dateTime for temporal stamps. This separation matters because conformance checks, unit validation, and cross-system exchange all depend on knowing that 0.522 and 0.997 are decimals subject to precision rules, that Dimension Kind 01 and Encoding 02 are strings whose allowed enumerations may be constrained elsewhere, and that 2024-02-01T19:38:09 and 2025-03-10T08:03:10 are instants comparable only within a single timezone and calendar policy. Where attr_type is misdeclared, values migrate to the wrong physical store or fail ingestion silently; where attr is underspecified, two operators may populate incompatible misc payloads under the same logical name.

The entity linkage closes the loop between attribute metadata and the object to which a value applies. Each value row binds entity_id to the distribution or profile instance (DIST-0001, DIST-0002, and so on) and attr_id to the specific attribute slot, so that confidence 0.522 attaches to DIST-0001 under one attr_id while 445.38 and 68.45 attach to the same entity under different attr_ids, and recorded_at values uniformly reference attr_id DIST-0004 across all four entities. Misc, in this framing, is the carried payload—the decimal, varchar, or datetime literal as stored—not a decorative field name but the evidentiary content auditors inspect when validating that a profile’s stated distribution characteristics match operational reality. Governance reviews therefore treat entity–attr–misc triples as atomic claims: alter the entity reference and the claim changes subject; alter misc without a controlled attr revision and the claim becomes noncompliant.

**t_profile_has_distribution_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0004 | 2024-02-01T19:38:09 |
| DIST-0002 | DIST-0002 | DIST-0004 | 2025-05-10T14:15:47 |
| DIST-0003 | DIST-0003 | DIST-0004 | 2024-06-29T13:14:55 |
| DIST-0004 | DIST-0004 | DIST-0004 | 2025-03-10T08:03:10 |
| DIST-0005 | DIST-0005 | DIST-0004 | 2025-05-31T19:13:55 |
| DIST-0006 | DIST-0006 | DIST-0004 | 2024-10-12T04:18:41 |

**t_profile_has_distribution_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0001 | 0.522 |
| DIST-0002 | DIST-0001 | DIST-0005 | 445.38 |
| DIST-0003 | DIST-0001 | DIST-0007 | 68.45 |
| DIST-0004 | DIST-0002 | DIST-0001 | 0.997 |
| DIST-0005 | DIST-0002 | DIST-0005 | 691.41 |
| DIST-0006 | DIST-0002 | DIST-0007 | 957.20 |
| DIST-0007 | DIST-0003 | DIST-0001 | 0.423 |
| DIST-0008 | DIST-0003 | DIST-0005 | 321.82 |

**t_profile_has_distribution_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0002 | Dimension Kind 01 |
| DIST-0002 | DIST-0001 | DIST-0008 | Encoding 02 |
| DIST-0003 | DIST-0001 | DIST-0009 | nightly summary |
| DIST-0004 | DIST-0001 | DIST-0010 | de |
| DIST-0005 | DIST-0001 | DIST-0003 | automated |
| DIST-0006 | DIST-0001 | DIST-0006 | kg |
| DIST-0007 | DIST-0002 | DIST-0002 | Dimension Kind 07 |
| DIST-0008 | DIST-0002 | DIST-0008 | Encoding 08 |

Transformation equivalence intersections extend the same discipline to pipeline topology and accountability. Role assigns responsibility on input and output dataset attachments—owner and contributor on ingress paths such as iot_device_streams and sensor_aggregates_daily, observer and reviewer on egress paths including financial_transactions and network_traffic_logs—so that access reviews, sign-off workflows, and incident escalation routes have named parties rather than anonymous graph edges. Cardinality note documents the structural expectation between a transformation subject and its output target—Cardinality Note 01 through Cardinality Note 04 in the present corpus—capturing whether a job may emit zero, one, or many datasets, or whether fan-in and fan-out are bounded. Operators rely on cardinality notes to detect silent schema drift: a merge_sensor_readings step that suddenly produces multiple raw_telemetry_v3 equivalents where a single output was certified should surface as a cardinality violation before consumers ingest inconsistent grains.

**t_transformation_equiv_io_intersection__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0005 | INTE-0007 | owner |
| INTE-0002 | INTE-0005 | INTE-0004 | reviewer |
| INTE-0003 | INTE-0003 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0006 | contributor |
| INTE-0005 | INTE-0004 | INTE-0004 | owner |
| INTE-0006 | INTE-0003 | INTE-0001 | contributor |
| INTE-0007 | INTE-0004 | INTE-0002 | observer |
| INTE-0008 | INTE-0004 | INTE-0007 | reviewer |

**t_transformation_equiv_io_intersection__output_dataset**

| id | transformation_id | output_dataset_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| INTE-0001 | INTE-0005 | INTE-0006 | contributor | Cardinality Note 01 |
| INTE-0002 | INTE-0001 | INTE-0005 | observer | Cardinality Note 02 |
| INTE-0003 | INTE-0002 | INTE-0001 | observer | Cardinality Note 03 |
| INTE-0004 | INTE-0003 | INTE-0003 | reviewer | Cardinality Note 04 |
| INTE-0005 | INTE-0003 | INTE-0005 | reviewer | Cardinality Note 05 |
| INTE-0006 | INTE-0002 | INTE-0006 | contributor | Cardinality Note 06 |
| INTE-0007 | INTE-0003 | INTE-0005 | reviewer | Cardinality Note 07 |
| INTE-0008 | INTE-0006 | INTE-0006 | owner | Cardinality Note 08 |

Outlier governance treats anomalous runs and detections as first-class facts requiring both operational telemetry and categorical context. The outlier key (for instance DETE-0003 appearing in multiple fact rows) ties recurring or related events across duration_seconds, exit, and retry_count, while dim_outlier supplies misc labels such as Outlier Label 01 through Outlier Label 04 and category assignments Outlier Category 01 through Outlier Category 04 for reporting and policy routing. Duration_seconds records elapsed wall time—3360.34 seconds in one case, 6466.78 in another—supporting SLA analysis and capacity planning; exit encodes termination status, where codes as disparate as 4 and 760 signal qualitatively different failure modes requiring distinct runbooks; retry_count quantifies persistence before abandonment or success, with counts of 101, 225, 293, and 308 indicating workloads that exhausted substantial retry budgets. Together these measures distinguish a brief 1182.39-second episode with exit 124 from a protracted 5282.09-second failure exiting 490, enabling compliance officers to prioritize remediation by severity, cost, and recurrence rather than by label alone.

In practice, identifiers, typed attributes, entity-bound misc values, role and cardinality annotations on transformations, and outlier metrics interoperate as a single control fabric. A Schema Evolution Registry bound to Parquet Dataset under DIST-0004 carries recorded_at 2025-03-10T08:03:10 and may later appear as an input to aggregate_daily_metrics only if the intersection’s role and cardinality_note still certify the relationship; conversely, elevated retry_count on an outlier keyed to DETE-0003 may trigger revalidation of the Anomaly Detection Ruleset profile whose confidence decimal was last asserted at 0.997. Reviewers should read attr and attr_type before misc, confirm entity alignment, verify transformation roles against data-owner registers, treat cardinality notes as binding constraints rather than commentary, and classify outlier facts through category before interpreting exit and duration_seconds. That sequencing preserves evidential integrity: each field answers a distinct control question, and only in combination do they substantiate that governed data remained within declared bounds for the periods those timestamps denote.

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