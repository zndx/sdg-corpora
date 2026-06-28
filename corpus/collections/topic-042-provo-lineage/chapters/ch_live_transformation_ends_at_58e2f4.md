---
chapter_id: ch_live_transformation_ends_at_58e2f4
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_ends_at', 'transformation_equiv_io_intersection', 'transformation_generates_entity']
model: engine-refine
---

Operational governance of data transformations rests on a small set of cross-cutting attributes that make heterogeneous pipeline activity legible to auditors, operators, and downstream consumers alike. The identifier serves as the immutable handle by which every recorded event, junction, and artifact may be retrieved without ambiguity: completion records such as ENDS-0001 through ENDS-0004, intersection definitions INTE-0001 through INTE-0004, and entity-generation entries ENTI-0001 through ENTI-0004 each carry a distinct identifier so that references persist even when human-readable names—metadata extraction pipeline, Audit record sync, Batch ingestion job—collide or evolve. Without such keys, correlating a sensor calibration routine that terminated on 2024-05-17T07:30:00Z with the contributor role assigned to its output dataset, or with the 216 retries logged at critical severity, would depend on fragile string matching rather than authoritative linkage.

**t_transformation_ends_at**

| id | transformation | ended_at_time | log_level | retry_count |
| --- | --- | --- | --- | --- |
| ENDS-0001 | metadata extraction pipeline | 2024-02-28T16:45:12Z | info | 210 |
| ENDS-0002 | sensor calibration routine | 2024-05-17T07:30:00Z | critical | 216 |
| ENDS-0003 | stream processing job | 2024-02-28T16:45:12Z | warning | 307 |
| ENDS-0004 | schema migration routine | 2024-04-09T11:15:30Z | warning | 446 |
| ENDS-0005 | Log aggregation process | 2024-03-15T14:22:01Z | info | 371 |
| ENDS-0006 | Data reconciliation workflow | 2024-05-17T07:30:00Z | info | 187 |
| ENDS-0007 | feature engineering step | 2023-09-30T23:59:59Z | error | 426 |
| ENDS-0008 | deduplicate_patient_ids | 2024-01-22T18:10:55Z | warning | 196 |

**t_transformation_equiv_io_intersection**

| id | transformation |
| --- | --- |
| INTE-0001 | Audit record sync |
| INTE-0002 | Audit record sync |
| INTE-0003 | filter_null_records |
| INTE-0004 | aggregate_daily_metrics |
| INTE-0005 | Sensor calibration sequence |
| INTE-0006 | sanitize_pii_fields |

**t_transformation_equiv_io_intersection_output_dataset**

| id | output_dataset |
| --- | --- |
| INTE-0001 | financial_transactions |
| INTE-0002 | weather_station_data |
| INTE-0003 | raw_telemetry_v3 |
| INTE-0004 | network_traffic_logs |
| INTE-0005 | raw_telemetry_v3 |
| INTE-0006 | network_traffic_parsed |

**t_transformation_generates_entity**

| id | transformation | generates_entity | duration_seconds | phase |
| --- | --- | --- | --- | --- |
| ENTI-0001 | Batch ingestion job | calibrated sensor readings | 5649.07 | execution |
| ENTI-0002 | telemetry aggregation task | feature matrix | 2309.83 | execution |
| ENTI-0003 | transform_csv_to_parquet | feature matrix | 2913.69 | execution |
| ENTI-0004 | Schema migration script | cleaned telemetry dataset | 6875.45 | execution |
| ENTI-0005 | sensor calibration routine | feature matrix | 2931.10 | closeout |
| ENTI-0006 | telemetry aggregation task | reconciliation report | 4817.44 | review |

Subject and target formalize directed relationships in the transformation graph. The subject denotes the transformation node that initiates or owns an association; the target denotes the dataset or entity node acted upon. In input-side bindings, a subject such as INTE-0005 may point to a target input_dataset_id of INTE-0007 for iot_device_streams, while a separate binding pairs the same subject INTE-0005 with target INTE-0004 for weather_station_data—permitting one transformation to declare multiple inputs under differentiated roles. Output-side bindings invert the pattern: subject INTE-0001 links to target INTE-0005 producing weather_station_data, whereas subject INTE-0003 links to target INTE-0001 yielding financial_transactions. This subject–target discipline is what allows equivalence and intersection registries to express many-to-many topology without collapsing distinct operational facts into a single undifferentiated record.

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

Role assignment governs who may assert, review, or merely observe each subject–target edge. An owner on an input binding signals custodial authority over iot_device_streams feeding Audit record sync; contributors on filter_null_records and aggregate_daily_metrics indicate operational responsibility short of ownership; observers on output bindings for weather_station_data and raw_telemetry_v3 mark read-only visibility into produced artifacts; a reviewer on the network_traffic_logs output elevates accountability above passive observation. Roles do not substitute for technical metadata—they annotate accountability atop it—so that when schema migration routine completes with warning-level telemetry and 446 retries, investigators can determine not only that user_activity_events was consumed but which party held contributor standing at the time of execution.

Cardinality note captures relational multiplicity where a single transformation–output pairing would otherwise under-specify data shape or fan-out. Cardinality Note 01 through Cardinality Note 04 attach to distinct output edges—financial_transactions, weather_station_data, raw_telemetry_v3, network_traffic_logs—documenting whether a transformation emits one row per input, aggregates to daily grain, or projects into a widened schema. These notes matter because downstream contracts—SLAs, freshness guarantees, deduplication rules—depend on knowing whether a job such as stream processing job or aggregate_daily_metrics produces a bounded one-to-one artifact or an expanded many-to-one result set; the note is the durable, queryable statement of that constraint, not an informal comment buried in run logs.

Duration in seconds and phase situate work within the execution lifecycle. Durationseconds records elapsed wall-clock time for entity-generating work: telemetry aggregation task completing feature matrix generation in 2309.83 seconds, transform_csv_to_parquet in 2913.69 seconds, schema migration script yielding cleaned telemetry dataset in 6875.45 seconds. Phase, here uniformly execution, distinguishes generation and materialization from planning, validation, or teardown stages that may be recorded elsewhere in the framework; anchoring duration to phase prevents misinterpreting setup latency as processing latency. Together they support capacity planning and regression detection—a Batch ingestion job that once produced calibrated sensor readings in 5649.07 seconds but later exceeds tolerance signals infrastructure or logic drift before loglevel escalation is required.

Log level and retry count close the loop on operational health at termination. Loglevel classifies the final disposition: info for metadata extraction pipeline and stream processing job, warning for schema migration routine and the duplicate-ended stream processing timestamp of 2024-02-28T16:45:12Z, critical for sensor calibration routine. Retrycount quantifies resilience expenditure—210 through 446 attempts across the sampled completions—so that a critical loglevel paired with 216 retries on calibration is read as structural failure after exhaustive retry, whereas warning with 307 or 446 retries may indicate eventual success under degraded conditions. Operators treat these fields as complementary: loglevel answers whether the run may be trusted for downstream consumption; retrycount answers how hard the platform worked to reach that answer. Taken as a whole, identifier, subject, target, role, cardinality note, durationseconds, phase, loglevel, and retrycount form the minimum attestable surface for proving what ran, on what data, for how long, under whose authority, with what relational guarantees, and with what final operational verdict.