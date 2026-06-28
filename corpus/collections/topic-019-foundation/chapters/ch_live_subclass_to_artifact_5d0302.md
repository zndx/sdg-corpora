---
chapter_id: ch_live_subclass_to_artifact_5d0302
topic_id: 19
family: 01_foundation
cited_terms: ['subclass_to_artifact', 'state_basic', 'log_record_subclass']
model: engine-refine
---

In governed data environments, the identifier constitutes the non-negotiable anchor by which every entity remains addressable, auditable, and joinable across operational and analytical stores. Artifact registrations such as ARTI-0001 through ARTI-0004 do not merely name rows; they establish durable handles for checksum-manifest-v4, batch-processor-logs, genomic-sequence-17, and sensor-calibration-v2 so that downstream lineage, access control, and reconciliation can resolve the same object irrespective of descriptive drift. State facts carry the parallel convention STAT-0001 through STAT-0004, while operational log records adopt the RECO-0001 through RECO-0004 namespace, each identifier functioning as a surrogate key that survives relabeling, reclassification, and version churn. Where foreign-key relationships bind facts to dimensions—as when state_key references STAT-0001, STAT-0004, STAT-0005, or STAT-0003, or when log_severity_key points to RECO-0006, RECO-0004, RECO-0007, or RECO-0001—the identifier is what preserves referential integrity when human-readable labels change.

Checksums operationalize integrity as a compact, deterministic fingerprint of artifact content at capture or registration time. Values such as c0ffee42 for checksum-manifest-v4 and 1a4b6c2d for genomic-sequence-17 enable automated detection of silent corruption, partial transfer, or unauthorized substitution before dependent pipelines consume the object. The recurrence of 5e8f3c91 across both batch-processor-logs and sensor-calibration-v2 is not incidental noise but a signal that two distinct artifact identifiers may share identical byte content—or that a deduplication or cloning event has occurred—requiring explicit policy on whether shared checksums imply equivalence, permitted duplication, or a data-quality exception. In practice, checksum governance pairs with license metadata so that integrity verification and rights enforcement proceed in concert: BSD-3-Clause governs checksum-manifest-v4, MIT applies to genomic-sequence-17, and CC-BY-4.0 attaches to both batch-processor-logs and sensor-calibration-v2, each license encoding redistribution, attribution, and modification obligations that compliance reviewers must evaluate before cross-environment publication or derivative use.

**t_subclass_to_artifact**

| id | artifact | checksum | license |
| --- | --- | --- | --- |
| ARTI-0001 | checksum-manifest-v4 | c0ffee42 | BSD-3-Clause |
| ARTI-0002 | batch-processor-logs | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0003 | genomic-sequence-17 | 1a4b6c2d | MIT |
| ARTI-0004 | sensor-calibration-v2 | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0005 | model-weights-resnet50 | 5e8f3c91 | proprietary |
| ARTI-0006 | pipeline-output-stage3 | 9d2b7a16 | Apache-2.0 |
| ARTI-0007 | lab-reagent-batch-A7 | 7b14de08 | Apache-2.0 |
| ARTI-0008 | batch-processor-logs | 1a4b6c2d | BSD-3-Clause |

State, as a governed dimension, separates the stable identity of a condition from the evidentiary measurements attached to it. Dimension records associate STAT-0001 with State Label 01 under State Category 01, progressing through parallel category assignments for Labels 02–04, thereby supplying a controlled vocabulary that fact tables reference rather than re-encode. Fact_state rows then attach quantitative posture to those keys: confidence scores of 0.422, 0.012, 0.075, and 0.523 express graded belief in the asserted condition, while paired uncertainty magnitudes—951.90, 416.12, 421.79, and 366.30—quantify the dispersion or error budget within which the reported value should be interpreted. The misc-valued measurement field (195.86, 143.04, 237.15, 619.50) carries the operative scalar outcome; read together with confidence and uncertainty, it supports triage rules that privilege high-confidence, low-uncertainty assertions and flag records such as STAT-0002, where confidence falls to 0.012, for manual review or exclusion from automated decisioning.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |

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

Category generalizes this pattern of controlled classification beyond state alone, furnishing coarse groupings that aggregate fine-grained labels for reporting, policy routing, and entitlement. Log severity follows the same dimensional discipline: RECO-0001 through RECO-0004 in dim_log_severity map to Log Severity Label 01 through Label 04 and Log Severity Category 01 through Category 04, allowing fact_log entries to reference severity by key while dashboards and alerting rules operate at category granularity. A record such as RECO-0001 bound to log_severity_key RECO-0006 therefore inherits its severity semantics indirectly through the dimension, insulating operational telemetry from label renames and ensuring that escalation thresholds remain stable when taxonomy editors revise display strings.

Log records further encode operational scale and temporal generation through size_bytes and version. Payload magnitudes on the order of 913386183, 303816232, 758542341, and 442933768 bytes inform retention economics, transfer-window planning, and anomaly detection when observed volumes diverge from historical baselines; version integers (6, 7, 7, and 2 across the sample) document the schema or emitter generation under which each record was produced, a prerequisite for backward-compatible ingestion and for attributing format shifts when parsers encounter novel fields. Misc-typed descriptive attributes—state_label, log_severity_label, and the scalar value field in fact_state—serve human interpretation and ad hoc analytics where strict typing would foreclose evolving semantics, yet governance still demands that such fields remain subordinate to keyed dimensions and never substitute for identifiers in authoritative joins.

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |

Taken together, these elements define a compliance-ready substrate: identifiers guarantee traceability, checksums and licenses govern artifact trust and lawful use, state-confidence-uncertainty triples bound evidentiary claims, categories and log severity structure operational response, and size_bytes with version calibrate infrastructure and parser expectations. Practitioners who treat each column not as isolated metadata but as an interlocking control—checksum corroborating artifact identity, license constraining dissemination, confidence and uncertainty qualifying state values, severity categories steering log handling—implement the difference between inert storage and an auditable system of record capable of withstanding scrutiny under retention, incident response, and regulatory review.