---
chapter_id: ch_live_verification_subclass_fa8960
topic_id: 38
family: 03_directive_governance
cited_terms: ['verification_subclass', 'profiling_basic', 'histogram_metric_subclass']
model: engine-refine
---

Operational telemetry for compliance verification rests on a disciplined separation between what is measured, how it is typed, and which governed entity it belongs to. Each verification subclass—whether a Compliance renewal verification, a GDPR data flow review, or a Security posture assessment—receives a stable identifier such as VERI-0001 through VERI-0004 that anchors all downstream attribute bindings and persisted observations. The identifier is not merely a surrogate key; it is the durable handle auditors, orchestration engines, and reconciliation jobs use when correlating partial runs, superseded attestations, and cross-system evidence. Without that invariant reference, duration readings, exit outcomes, and host attribution cannot be joined reliably across typed value stores or replayed under dispute.

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

**t_verification_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

Attributes declare the semantic contract under which observations are recorded. An attr such as duration_seconds, end_time, exit_code, or host_name names the measurable facet; the paired attr_type—xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string—fixes validation, serialization, and the physical store into which the value is written. Typed partitioning is not an implementation convenience but a governance control: a decimal duration_seconds observation for VERI-0001 at 5469.69 seconds cannot be coerced into a datetime column without breaking audit integrity, and an integer exit_code must not share a varchar namespace with host_name strings like node-a01. Entity linkage completes the triangle: every typed value row carries an entity reference—VERI-0001 for a compliance renewal run, VERI-0002 for a GDPR flow review—so that multiple attributes observed against the same verification instance remain joinable while distinct instances remain separable even when attr_id values recur across the population.

Duration_seconds and exit_code constitute the primary execution ledger for verification workloads. Decimal duration_seconds values—5469.69, 821.61, 4016.93, and 4484.04 across VERI-0001 through VERI-0004—quantify wall-clock or instrumented elapsed time and support SLA thresholds, capacity planning, and anomaly detection when a GDPR data flow review completes in 821.61 seconds while a security posture assessment requires 4484.04. Integer exit_code and related exit semantics—616 and 713 on one attr binding, 105 and 29 on another—encode process termination state; non-zero or elevated codes signal failure, partial completion, or policy violation requiring remediation before attestation may be accepted. Datetime misc values such as 2024-10-23T14:58:17 and 2024-01-09T21:40:31 establish temporal bounds; varchar misc including node-a01, Log Level 02, review, and running supply execution context, severity posture, and lifecycle state that duration and exit alone cannot express.

Profiling extends the same evidentiary model into repeated operational characterization keyed by profiling identifiers PROF-0001 through PROF-0004 and profiling_key references such as PROF-0003 and PROF-0006. Fact-level profiling rows record duration_seconds in the thousands—6716.87, 1113.38, 2546.61, 2074.93—alongside exit_code values 725, 809, 348, and 827 and retry_count figures of 209, 186, 303, and 264 that quantify resilience behavior under transient fault. Elevated retry_count against a single profiling_key such as PROF-0006 across multiple fact rows indicates systemic instability rather than isolated timeout; pairing retry_count with exit_code distinguishes retried-then-succeeded paths from retried-then-abandoned ones. Category dimensionality—Category Name 01 through Category Name 04 linked through category_id references PROF-0008, PROF-0001, PROF-0007, PROF-0005—classifies profiling labels and profiling_category descriptors so that operational slices aggregate by governed taxonomy rather than by opaque numeric keys alone.

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

Metric kind and size_bytes complete the observability stack for storage- and distribution-sensitive compliance artifacts. Histogram facts keyed to metric_kind_key METR-0005 and METR-0003 carry size_bytes magnitudes—239999637, 652318299, 823666310, and 194252236—that govern retention economics, transfer windows, and integrity checks across versions 3, 5, and 9. The dim_metric_kind layer supplies metric_kind_label and metric_kind_category pairings—Metric Kind Category 01 through Metric Kind Category 04—so that byte-volume telemetry rolls up under the same categorical discipline applied to profiling. A concentration of large size_bytes observations under a single metric_kind_key signals hotspot datasets requiring tiered archival or sampling policy review; version divergence alongside size growth flags schema or encoding drift that may invalidate prior verification comparisons.

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

Taken together, identifier, attr, attr_type, entity, category, duration_seconds, exit, metric kind, misc, profiling, retry_count, and size_bytes form an interlocking evidence chain from subclass intent through typed observation, execution profiling, and volumetric telemetry. Practitioners treat attr_type enforcement and entity-scoped joins as non-negotiable preconditions for defensible reporting; they interpret duration_seconds and exit_code jointly rather than in isolation; they escalate retry_count patterns tied to shared profiling keys; and they reconcile histogram size_bytes against metric_kind category policy before certifying that a verification record—VERI-0001’s compliance renewal or VERI-0003’s GDPR data flow review—rests on complete, typed, and dimensionally classified operational proof.

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |