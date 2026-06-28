---
chapter_id: ch_live_alert_triggered_by_257f6a
topic_id: 27
family: 07_long_tail
cited_terms: ['alert_triggered_by', 'evidence_refutes_claim', 'process_either_started_or_completed']
model: engine-refine
---

Operational compliance and incident governance rest on stable identifiers that bind heterogeneous records into auditable chains. An identifier is not merely a surrogate key but the durable handle by which facts, dimensions, evidence, and process state are joined across time and subsystem boundaries. Alert records such as TRIG-0001 through TRIG-0004 each carry a distinct identifier while referencing a triggered-by-metric key that may repeat when multiple alert episodes arise from the same underlying signal; TRIG-0002 and TRIG-0003 both cite TRIG-0005, whereas TRIG-0004 closes a self-referential loop by pairing identifier TRIG-0004 with triggered_by_metric TRIG-0004. Process entities—COMP-0001 through COMP-0004—serve a parallel anchoring role for lifecycle events (Microtome sectioning, Chromatography elution, Reactor startup sequence) and for the attribute-value tuples that materialize those entities in typed storage. Without identifier discipline, duration measurements, exit semantics, and evidentiary cross-references cannot be reconciled under examination.

**t_process_either_started_or_completed**

| id | process | process_2 | process_3 |
| --- | --- | --- | --- |
| COMP-0001 | Microtome sectioning | Hash partitioning pass | Log rotation routine |
| COMP-0002 | Chromatography elution | Pressure equalization | Data retention purge |
| COMP-0003 | Reactor startup sequence | Hash partitioning pass | Data retention purge |
| COMP-0004 | Reactor startup sequence | Buffer exchange step | Baseline calibration sweep |
| COMP-0005 | ETL data ingestion | Cache invalidation sweep | Sample deidentification pass |
| COMP-0006 | PCR thermal cycle | Cache invalidation sweep | Sample deidentification pass |

**t_process_either_started_or_completed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMP-0001 | duration_seconds | xsd:decimal |
| COMP-0002 | end_time | xsd:dateTime |
| COMP-0003 | exit_code | xsd:integer |
| COMP-0004 | host_name | xsd:string |
| COMP-0005 | log_level | xsd:string |
| COMP-0006 | phase | xsd:string |
| COMP-0007 | retry_count | xsd:integer |
| COMP-0008 | scheduled_at | xsd:dateTime |

**t_process_either_started_or_completed_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0003 | 522 |
| COMP-0002 | COMP-0001 | COMP-0007 | 9 |
| COMP-0003 | COMP-0002 | COMP-0003 | 153 |
| COMP-0004 | COMP-0002 | COMP-0007 | 96 |
| COMP-0005 | COMP-0003 | COMP-0003 | 508 |
| COMP-0006 | COMP-0003 | COMP-0007 | 474 |
| COMP-0007 | COMP-0004 | COMP-0003 | 5 |
| COMP-0008 | COMP-0004 | COMP-0007 | 25 |

**t_process_either_started_or_completed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0004 | node-a01 |
| COMP-0002 | COMP-0001 | COMP-0005 | Log Level 02 |
| COMP-0003 | COMP-0001 | COMP-0006 | initiation |
| COMP-0004 | COMP-0001 | COMP-0010 | running |
| COMP-0005 | COMP-0001 | COMP-0011 | Triggered By 05 |
| COMP-0006 | COMP-0002 | COMP-0004 | ingest-21 |
| COMP-0007 | COMP-0002 | COMP-0005 | Log Level 07 |
| COMP-0008 | COMP-0002 | COMP-0006 | review |

The triggered-by-metric construct names the observational predicate that elevated a condition into an alert-worthy state. In practice it functions as a bridge between raw measurement semantics and human-actionable taxonomy: each metric key resolves to a label (Triggered By Metric Label 01 through 04) and a category (Triggered By Metric Category 01 through 04) that classify why the system believed intervention was required. Category assignment matters because remediation playbooks, escalation tiers, and regulatory reporting buckets are keyed to category rather than to opaque metric identifiers alone. When TRIG-0001 is associated with metric TRIG-0001 under Category 01, investigators inherit a interpretive frame before inspecting episode-specific telemetry; conversely, shared metric keys across distinct alert identifiers compel analysts to distinguish recurring signal patterns from duplicate record noise.

Duration in seconds, exit disposition, and retry count constitute the quantitative spine of alert episodes and, analogously, of process execution attributes. Duration_seconds on an alert fact—3135.98 for TRIG-0001, 1138.76 for TRIG-0002, 3285.79 for TRIG-0003, 1959.41 for TRIG-0004—records elapsed persistence of the triggering condition or of the handling workflow, and therefore supports service-level accountability and mean-time-to-resolution analytics. Exit codes (322, 442, 118, 676) encode terminal state: success, controlled failure, operator abort, or subsystem-specific fault classes depending on the governing codebook. Retry_count (248, 263, 453, 209) exposes automation or orchestration stress—high counts on TRIG-0003 (453) signal brittle dependencies or contested resources rather than a single transient glitch. The same duration_seconds attribute name appears in the process attribute registry as xsd:decimal, with observed values 992.92 through 6910.53 bound to entities COMP-0001–COMP-0004, demonstrating that one semantic field may be promoted from episodic alert facts into longitudinal process characterization when schema typing permits uniform aggregation.

Attribute governance separates what may be said about an entity (attr) from how it may legally be stored and validated (attr_type). The registry records attr_name alongside a machine-checkable type: duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, host_name as xsd:string. Enforcement of attr_type prevents silent corruption—an exit_code stored as free text cannot be joined to alert exit_code semantics, and a datetime miscast as decimal breaks retention and sequencing proofs. Values are sharded into type-aligned tables keyed by entity and attr: COMP-0001 carries end_time 2023-09-15T18:52:08 and host_name node-a01; COMP-0002 records duration_seconds 6910.53 and exit_code 153; COMP-0001 also holds exit_code 522 and status-like misc values initiation and running under distinct attr bindings. This entity–attr–value pattern is the normalized substrate beneath wide operational exports; misc fields in value tables hold the literal payload whose meaning is recoverable only through attr_id resolution.

**t_process_either_started_or_completed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0002 | 2023-09-15T18:52:08 |
| COMP-0002 | COMP-0001 | COMP-0008 | 2024-08-13T16:34:41 |
| COMP-0003 | COMP-0001 | COMP-0009 | 2025-03-15T23:53:33 |
| COMP-0004 | COMP-0002 | COMP-0002 | 2025-06-15T09:08:30 |
| COMP-0005 | COMP-0002 | COMP-0008 | 2025-01-13T18:32:01 |
| COMP-0006 | COMP-0002 | COMP-0009 | 2023-05-31T03:15:32 |
| COMP-0007 | COMP-0003 | COMP-0002 | 2024-08-17T22:03:21 |
| COMP-0008 | COMP-0003 | COMP-0008 | 2023-03-17T02:37:48 |

**t_process_either_started_or_completed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0001 | 992.92 |
| COMP-0002 | COMP-0002 | COMP-0001 | 6910.53 |
| COMP-0003 | COMP-0003 | COMP-0001 | 4781.54 |
| COMP-0004 | COMP-0004 | COMP-0001 | 3156.19 |
| COMP-0005 | COMP-0005 | COMP-0001 | 593.89 |
| COMP-0006 | COMP-0006 | COMP-0001 | 5472.77 |

Evidentiary refutation introduces method and labeltext as controls on how claims are challenged and how artifacts are presented to reviewers. Each evidence row (CLAI-0001–CLAI-0004) pairs concrete material—Benchmark result v2.1, Audit report FY2023, Sensor drift calibration, Data lineage snapshot—with a refutes_claim target (COMP-0004, COMP-0004, COMP-0002, COMP-0006) and a method designation: manual, hybrid, or automated. Method selection governs defensibility: manual review preserves human attestation for ambiguous calibrations; hybrid and automated paths trade speed for reproducibility and must be backed by procedure logs. Labeltext—calibration record, audit excerpt, intake form, pre-release note—supplies the human-readable facet of an evidence object without collapsing it into unstructured misc; auditors retrieve artifacts by label while automated pipelines key off identifier and method. Where misc appears on non-evidence value tables, it denotes the stored literal rather than a curated display string, reinforcing that labeltext is a presentation and classification layer distinct from raw typed storage.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | COMP-0004 | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | COMP-0004 | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | COMP-0002 | automated | intake form |
| CLAI-0004 | Data lineage snapshot | COMP-0006 | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | COMP-0005 | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | COMP-0003 | automated | change rationale |
| CLAI-0007 | Incident summary Aug | COMP-0006 | inferred | intake form |

Taken together, these elements implement a closed compliance narrative: a triggered_by_metric under a defined category raises an alert identified by TRIG-* keys, whose duration_seconds, exit, and retry_count quantify handling; parallel COMP-* entities accumulate typed attrs that may later refute or substantiate claims through evidence rows whose method and labeltext document provenance. Investigators traverse identifier edges first, hydrate category and metric labels for context, validate attr_type constraints before trusting misc values, and only then weigh whether an exit_code of 676 on TRIG-0004 or a hybrid-method lineage snapshot on CLAI-0004 sufficiently rebuts the associated claim. Density of cross-reference—not volume of columns—determines whether the framework withstands scrutiny; each field earns its place by constraining interpretation, enabling join-safe analytics, or preserving the audit trail that converts operational telemetry into governable fact.

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