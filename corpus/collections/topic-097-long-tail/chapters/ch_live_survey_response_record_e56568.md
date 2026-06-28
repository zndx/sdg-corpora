---
chapter_id: ch_live_survey_response_record_e56568
topic_id: 97
family: 08_derived
cited_terms: ['survey_response_record', 'claim_supported_by_evidence', 'evidence_refutes_claim']
model: engine-refine
---

The architecture for capturing and validating research artefacts rests on a dual-track model: one track records survey responses that bind researcher profile attributes to structured metadata, while the other tracks claims and the evidence that either supports or refutes them. The survey response table, `t_survey_response_record`, anchors each entry with an identifier such as `RECO-0001` through `RECO-0004`, and associates a `survey_response_record` type—`Peer-Review-Submission`, `Q3-2023-Feedback`, or `Safety-Compliance-Check`—with a `researcherprofileattribute` like `Clearance-Level`, `Domain-Expertise-Code`, or `Protocol-Approval-Ref`. Each response carries an `encoding` designation (`ascii`, `unicode`, `utf8`) and a `language` tag (`es`, `de`, `en`), ensuring that the provenance of the captured attribute is traceable to its original character set and linguistic context. This design permits cross-lingual, cross-encoding audit trails where a `Protocol-Approval-Ref` captured in `ascii` under `es` can be distinguished from one captured in `utf8` under `en`, a distinction that matters when downstream systems perform locale-sensitive validation.

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |

Evidence supporting a claim is modelled in `t_claim_supported_by_evidence`, where each row carries an identifier (`EVID-0001` through `EVID-0004`), a `claim` such as `Model accuracy benchmark` or `Server latency threshold breach`, and a `supported_by_evidence` field naming the artefact—`CloudWatch snapshot`, `Trace identifier`, or `Throughput sustained steady`. The schema separates attribute metadata from attribute values to accommodate heterogeneous data types without forcing null columns. The attribute definition table, `t_claim_supported_by_evidence_attr`, stores `attr_name` values like `confidence`, `dimension_kind`, `method`, and `recorded_at`, each paired with an `attr_type` drawn from the XSD vocabulary (`xsd:decimal`, `xsd:string`, `xsd:dateTime`). This separation allows a single evidence entity to carry multiple typed attributes, each resolved to the correct value table at query time.

**t_claim_supported_by_evidence**

| id | claim | supported_by_evidence |
| --- | --- | --- |
| EVID-0001 | Model accuracy benchmark | CloudWatch snapshot |
| EVID-0002 | Server latency threshold breach | Trace identifier |
| EVID-0003 | Server latency threshold breach | CloudWatch snapshot |
| EVID-0004 | Emissions compliance record | Throughput sustained steady |
| EVID-0005 | Emissions compliance record | Lab assay sheet |
| EVID-0006 | Batch ingestion delay anomaly | Kafka consumer lag metric |

**t_claim_supported_by_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_claim_supported_by_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2024-08-09T04:01:38 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-12-19T17:45:47 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2024-10-20T14:55:58 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2024-09-01T03:06:06 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2024-01-23T04:47:13 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-03-02T02:15:09 |

**t_claim_supported_by_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.768 |
| EVID-0002 | EVID-0001 | EVID-0005 | 631.25 |
| EVID-0003 | EVID-0001 | EVID-0007 | 135.16 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.833 |
| EVID-0005 | EVID-0002 | EVID-0005 | 5.88 |
| EVID-0006 | EVID-0002 | EVID-0007 | 87.07 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.936 |
| EVID-0008 | EVID-0003 | EVID-0005 | 975.53 |

Value resolution proceeds through three type-specific tables. The `t_claim_supported_by_evidence_val_decimal` table stores numeric measures such as `0.768` and `0.833` for the `confidence` attribute, alongside dimensional values like `631.25` and `135.16` for other attributes, all linked back to their parent evidence entity via `entity_id` and to the attribute definition via `attr_id`. The `t_claim_supported_by_evidence_val_varchar` table holds string-valued attributes—`Dimension Kind 01`, `Encoding 02`, `nightly summary`, and `de`—using the same join pattern. The `t_claim_supported_by_evidence_val_datetime` table records temporal metadata, with `recorded_at` values such as `2024-08-09T04:01:38`, `2023-12-19T17:45:47`, `2024-10-20T14:55:58`, and `2024-09-01T03:06:06`, enabling time-bound evidence retrieval and versioned audit queries. The `misc` column across these value tables serves as the generic value carrier, typed at query time by reference to the `attr_type` in the metadata table.

**t_claim_supported_by_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | nightly summary |
| EVID-0004 | EVID-0001 | EVID-0010 | de |
| EVID-0005 | EVID-0001 | EVID-0003 | automated |
| EVID-0006 | EVID-0001 | EVID-0006 | ms |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

Refutation evidence is captured in `t_evidence_refutes_claim`, which records when an artefact directly contradicts a claim. Each row carries an identifier (`CLAI-0001` through `CLAI-0004`), an `evidence` item such as `Benchmark result v2.1`, `Audit report FY2023`, `Sensor drift calibration`, or `Data lineage snapshot`, and a `refutes_claim` target like `Carbon neutral supply chain` or `CloudWatch snapshot`. The `method` column distinguishes how the refutation was established—`manual`, `hybrid`, or `automated`—while the `label_text` field provides a human-readable annotation, such as `calibration record`, `audit excerpt`, `intake form`, or `pre-release note`. This structure permits a single piece of evidence to refute multiple claims and allows governance workflows to route refutations according to their method classification, with `hybrid` refutations receiving different review thresholds than purely `automated` ones.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | Carbon neutral supply chain | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | Carbon neutral supply chain | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | CloudWatch snapshot | automated | intake form |
| CLAI-0004 | Data lineage snapshot | Firmware patch resolves bug | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | Pipeline latency under 50ms | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | Prometheus alert log | automated | change rationale |
| CLAI-0007 | Incident summary Aug | Carbon neutral supply chain | inferred | intake form |