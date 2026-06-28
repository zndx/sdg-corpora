---
chapter_id: ch_live_state_basic_6ec00b
topic_id: 19
family: 02_observation_measurement
cited_terms: ['state_basic', 'attestation_basic', 'process_min_one_output']
model: engine-refine
---

In governed compliance and operational telemetry, every auditable fact must be addressable, typed, and interpretable across time and process boundaries. An identifier supplies that addressability: stable surrogate keys such as ATTE-0001, OUTP-0003, and STAT-0004 persist even when human-readable labels change, and they are what downstream reconciliation, lineage tracing, and regulatory inquiry rely upon when linking an attestation to the process output that produced it or to the dimensional state in which it was recorded. The entity is the subject those identifiers denote—the compliance artifact itself (for example, a vendor risk assessment keyed as ATTE-0001, or a pipeline output keyed as OUTP-0001 from a feature extraction run)—and operational integrity depends on treating entity identity as invariant while permitting its descriptive surface to evolve. Where a single entity carries multiple observations, as when ATTE-0001 holds both a duration of 7132.97 seconds and an end time of 2024-11-18T12:26:52, the entity identifier becomes the anchor that keeps heterogeneous measurements attributable to one governed object rather than scattered rows in unrelated contexts.

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_output**

| id | process | output |
| --- | --- | --- |
| OUTP-0001 | feature extraction pipeline | ATTE-0004 |
| OUTP-0002 | pipeline rollback procedure | ATTE-0004 |
| OUTP-0003 | feature extraction pipeline | ATTE-0002 |
| OUTP-0004 | model training run | ATTE-0006 |
| OUTP-0005 | data validation cycle | ATTE-0004 |
| OUTP-0006 | model training run | ATTE-0006 |
| OUTP-0007 | anomaly detection sweep | ATTE-0006 |

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

Attributes and attribute types constitute the semantic contract under which those measurements may be stored, validated, and compared. An attr names the measurable dimension—duration_seconds, end_time, exit_code, host_name—while attr_type declares the governing datatype, here expressed as XSD primitives (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) that route each value into a type-appropriate persistence layer and enforce parseability at ingestion. The pattern is not decorative: a decimal duration and a datetime end_time for the same entity answer different audit questions, and conflating their types would corrupt aggregations, invalidate temporal ordering, and undermine cross-entity benchmarking. Attestation records and process outputs share the same attribute vocabulary—both declare duration_seconds as xsd:decimal and host_name as xsd:string—so compliance reviewers can evaluate whether a HIPAA compliance review (ATTE-0002) and a feature extraction pipeline output (OUTP-0003) were captured under equivalent measurement rules, even when their misc values diverge materially (6429.54 versus 6819.95 seconds, or exit codes 487 versus 903).

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

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

The misc designation captures values that are factually essential yet semantically heterogeneous: timestamps, numerics, status strings, and operational tokens that do not themselves define structure but carry the evidentiary payload. A misc value of initiation on ATTE-0001 signals lifecycle phase; superseded on another row of the same entity signals succession or replacement; ingest-21 and Log Level 02 on OUTP-0001 tie execution context to infrastructure and observability posture. Because misc spans domains, governance treats it as content governed by attr and attr_type rather than as a free-form field: the same logical attribute may appear as 2023-09-08T13:00:56 under datetime typing or as complete under varchar typing, and auditors must read misc only in combination with its declared type and entity binding. Category, by contrast, supplies orthogonal classification at a coarser grain: State Category 01 through State Category 04 partition dimensional states (State Label 01–04) into reviewable groupings that support policy filters, reporting rollups, and exception routing without encoding the full behavioral detail of any single measurement.

State, confidence, and uncertainty form the evaluative layer on which automated and human judgment converge when facts are incomplete, contested, or derived. A state record associates a state_key (which may reference another identifier such as STAT-0004 or STAT-0005) with a measured value and explicit epistemic metadata: confidence scores ranging from 0.012 to 0.523 and uncertainty magnitudes from 366.30 to 951.90 express how firmly the system holds a given assertion and how much residual doubt remains. Low confidence paired with high uncertainty—as in the pairing of 0.012 confidence with 416.12 uncertainty—signals that downstream controls should treat the associated value (here 143.04) as provisional, triggering re-attestation, manual review, or suppression from authoritative dashboards until corroboration improves. Higher confidence with moderated uncertainty (0.523 and 366.30 around value 619.50) supports stronger reliance in control attestations and trend analysis, provided category and entity lineage remain consistent.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |

In practice, these elements interoperate through process-to-output linkage and repeated attestation workflows. Process definitions such as feature extraction pipeline and pipeline rollback procedure emit outputs identified as ATTE-0004 or ATTE-0002, binding operational execution to compliance objects whose attributes are populated across typed value stores; duplicate attestation text (HIPAA compliance review appearing for both ATTE-0002 and ATTE-0004) illustrates how identifiers, not display strings, disambiguate records that would otherwise collapse in narrative reports. Reviewers therefore work from a composite reading: identifier and entity establish what is being claimed; attr and attr_type establish how it may be read; misc carries the claim’s substance; category and state situate it within control taxonomy; confidence and uncertainty govern how aggressively the organization may act on it. Mature governance does not treat any single field as authoritative in isolation—it requires the full lattice to be present, typed, and traceable before an attestation, pipeline output, or state assertion may enter the record of compliance.

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

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