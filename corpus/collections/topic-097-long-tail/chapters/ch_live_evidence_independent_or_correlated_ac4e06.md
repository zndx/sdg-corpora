---
chapter_id: ch_live_evidence_independent_or_correlated_ac4e06
topic_id: 97
family: 06_belief_structure
cited_terms: ['evidence_independent_or_correlated', 'evidence_observed_by_process', 'evidence_refutes_claim']
model: engine-refine
---

The evidentiary backbone of the system rests on the table `t_evidence_independent_or_correlated`, which anchors every record with a surrogate key such as `CORR-0001` through `CORR-0004` and carries three evidence columns that capture independent and correlated data sources. A single row may pair `Anomaly-Detection-Log` with `Quarterly-Audit-Trail` and `Anomaly-Cluster-Log`, while another links `Provenance-Chain-Hash` to `Telemetry-Stream-Alpha` and a `latency_spike_report`. These triadic evidence fields are not free-form text but structured references to distinct telemetry, audit, and diagnostic artefacts that together establish the provenance chain for any downstream assertion.

Attribute metadata for these evidence records is normalised into `t_evidence_independent_or_correlated_attr`, whose rows are keyed by the same `CORR-` identifiers and carry an `attr_name`—for instance `confidence`, `dimension_kind`, `method`, or `recorded_at`—alongside an `attr_type` drawn from the XSD vocabulary (`xsd:decimal`, `xsd:string`, `xsd:dateTime`). This separation of attribute schema from evidence payload enables heterogeneous value storage: decimal-valued attributes such as `confidence` are persisted in `t_evidence_independent_or_correlated_val_decimal`, string-valued attributes like `dimension_kind` and `method` in `t_evidence_independent_or_correlated_val_varchar`, and temporal attributes such as `recorded_at` in `t_evidence_independent_or_correlated_val_datetime`. Each value table joins back to the parent evidence row through `entity_id` and to the attribute definition through `attr_id`, forming a clean entity-attribute-value triangle. Concrete values illustrate the range: decimal measures include `0.175` and `667.59`; string attributes carry `Dimension Kind 01`, `Encoding 02`, `intake form`, and the language tag `en`; datetime stamps record moments such as `2024-06-09T05:47:42` and `2023-01-17T16:04:18`.

**t_evidence_independent_or_correlated**

| id | evidence | evidence_2 | evidence_3 |
| --- | --- | --- | --- |
| CORR-0001 | Anomaly-Detection-Log | Quarterly-Audit-Trail | Anomaly-Cluster-Log |
| CORR-0002 | vibration_anomaly_log | Checksum-Edge-Record | seismic_accelerogram |
| CORR-0003 | Telemetry-Beacon-Log | Quarterly-Audit-Trail | seismic_accelerogram |
| CORR-0004 | Provenance-Chain-Hash | Telemetry-Stream-Alpha | latency_spike_report |
| CORR-0005 | Metrics-Cache-Ref | Audit report FY2023 | Field trial cohort B |
| CORR-0006 | Data lineage snapshot | Governance-Archive-File | Correlation-Stream-Gamma |

**t_evidence_independent_or_correlated_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CORR-0001 | confidence | xsd:decimal |
| CORR-0002 | dimension_kind | xsd:string |
| CORR-0003 | method | xsd:string |
| CORR-0004 | recorded_at | xsd:dateTime |
| CORR-0005 | uncertainty | xsd:decimal |
| CORR-0006 | unit | xsd:string |
| CORR-0007 | value | xsd:decimal |
| CORR-0008 | encoding | xsd:string |

**t_evidence_independent_or_correlated_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0004 | 2024-06-09T05:47:42 |
| CORR-0002 | CORR-0002 | CORR-0004 | 2023-11-11T17:14:05 |
| CORR-0003 | CORR-0003 | CORR-0004 | 2023-01-17T16:04:18 |
| CORR-0004 | CORR-0004 | CORR-0004 | 2024-01-18T01:21:21 |
| CORR-0005 | CORR-0005 | CORR-0004 | 2025-02-19T18:21:28 |
| CORR-0006 | CORR-0006 | CORR-0004 | 2023-04-21T22:33:15 |

**t_evidence_independent_or_correlated_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0001 | 0.175 |
| CORR-0002 | CORR-0001 | CORR-0005 | 667.59 |
| CORR-0003 | CORR-0001 | CORR-0007 | 420.06 |
| CORR-0004 | CORR-0002 | CORR-0001 | 0.415 |
| CORR-0005 | CORR-0002 | CORR-0005 | 386.38 |
| CORR-0006 | CORR-0002 | CORR-0007 | 519.11 |
| CORR-0007 | CORR-0003 | CORR-0001 | 0.685 |
| CORR-0008 | CORR-0003 | CORR-0005 | 275.29 |

**t_evidence_independent_or_correlated_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0002 | Dimension Kind 01 |
| CORR-0002 | CORR-0001 | CORR-0008 | Encoding 02 |
| CORR-0003 | CORR-0001 | CORR-0009 | intake form |
| CORR-0004 | CORR-0001 | CORR-0010 | en |
| CORR-0005 | CORR-0001 | CORR-0003 | hybrid |
| CORR-0006 | CORR-0001 | CORR-0006 | kg |
| CORR-0007 | CORR-0002 | CORR-0002 | Dimension Kind 07 |
| CORR-0008 | CORR-0002 | CORR-0008 | Encoding 08 |

Beyond the entity-attribute-value triad, the schema provides two parallel lenses for evidence. The table `t_evidence_observed_by_process` logs process-level observations with columns `evidence`, `value`, and `language`; a single entry might record that `Telemetry-Stream-Alpha` produced a measurement of `573.25` in English (`en`), while another captures a `ph_sensor_record` of `273.64` in Spanish (`es`), with additional rows in German (`de`) and French (`fr`). This table is independent of the EAV normalisation and instead associates raw numeric readings with the process artefacts that generated them, enabling multilingual provenance annotations on the same evidence stream.

**t_evidence_observed_by_process**

| id | evidence | value | language |
| --- | --- | --- | --- |
| PROC-0001 | Telemetry-Stream-Alpha | 573.25 | en |
| PROC-0002 | ph_sensor_record | 273.64 | es |
| PROC-0003 | Correlation-Pipeline-Run | 199.51 | de |
| PROC-0004 | spectral_read_alpha | 512.26 | fr |
| PROC-0005 | Anomaly-Swarm-Report | 950.53 | es |

The final structural layer, `t_evidence_refutes_claim`, captures adversarial evidence—records that actively contradict stated assertions. Each row carries an `id` such as `CLAI-0001`, an `evidence` column referencing artefacts like `seismic_accelerogram` or `Governance-Verification-File`, a `refutes_claim` column stating the proposition being challenged (e.g., `Uptime exceeds 99.9%` or `Carbon neutral supply chain`), a `method` column indicating whether the refutation was derived `manual`ly, `automated`, or via a `hybrid` approach, and a `label_text` column providing a human-readable descriptor such as `calibration record`, `audit excerpt`, or `pre-release note`. This table operates as a claim-resolution register, linking refuting evidence to the specific claims it undermines and documenting the provenance method and contextual label for auditability.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | seismic_accelerogram | Uptime exceeds 99.9% | manual | calibration record |
| CLAI-0002 | flow_rate_snapshot | Uptime exceeds 99.9% | hybrid | audit excerpt |
| CLAI-0003 | Governance-Verification-File | Carbon neutral supply chain | automated | intake form |
| CLAI-0004 | Telemetry-Stream-Alpha | Uptime exceeds 99.9% | hybrid | pre-release note |
| CLAI-0005 | flow_rate_snapshot | GDPR Article 17 compliant | hybrid | calibration record |
| CLAI-0006 | Telemetry-Mesh-Record | Chemical purity meets ISO | automated | change rationale |
| CLAI-0007 | Provenance-Chain-Hash | Uptime exceeds 99.9% | inferred | intake form |