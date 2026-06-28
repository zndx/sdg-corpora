---
chapter_id: ch_live_claim_observed_by_event_9baa97
topic_id: 97
family: 07_long_tail
cited_terms: ['claim_observed_by_event', 'claim_refuted_by_evidence', 'claim_subclass']
model: engine-refine
---

Claims serve as the fundamental unit of assertion in evidence-based governance frameworks, each anchored by a unique identifier such as EVEN-0001 or CLAI-0001 that ensures unambiguous reference across audit trails. These assertions are organized into categorical taxonomies—Claim Category 01 through Claim Category 04—providing structural classification that enables systematic review and cross-referencing. Each claim carries a descriptive label, such as Claim Label 01 or Claim Label 04, which offers a human-readable designation alongside the machine-stable identifier. The categorization scheme supports hierarchical analysis, allowing governance bodies to aggregate claims by domain, assess systemic risk patterns, and prioritize review workflows according to claim type.

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

**t_claim_refuted_by_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Lab centrifuge unit-7 |
| EVID-0002 | Carbon emissions peaked |
| EVID-0003 | Data ingestion pipeline |
| EVID-0004 | Patient dosage exceeds limit |
| EVID-0005 | PostgreSQL analytics_db |
| EVID-0006 | Solar flare frequency |
| EVID-0007 | Network switch core-01 |

**t_claim_refuted_by_evidence_refuted_by_evidence**

| id | refuted_by_evidence |
| --- | --- |
| EVID-0001 | Compliance checklist v2.1 |
| EVID-0002 | Compliance checklist v2.1 |
| EVID-0003 | Compliance checklist v2.1 |
| EVID-0004 | Satellite imagery timestamp |
| EVID-0005 | Peer reviewed study 10.1234 |
| EVID-0006 | Lab bench measurement sheet |
| EVID-0007 | Satellite imagery timestamp |
| EVID-0008 | Clinical trial phase III |

The reliability of any claim is quantified through paired measures of confidence and uncertainty, which together form a probabilistic assessment of its evidentiary standing. Confidence scores such as 0.621 or 0.338 represent the degree of belief in a claim's validity, while uncertainty values—measured in units ranging from 43.01 to 571.46—capture the magnitude of residual doubt. A claim with confidence 0.621 and uncertainty 571.46 suggests a moderately supported assertion with substantial variance, whereas a claim scoring 0.338 confidence alongside 142.53 uncertainty indicates a weaker evidentiary foundation. These dual metrics enable auditors to weight claims proportionally during deliberation, ensuring that decisions reflect not merely whether a claim exists but how robustly it is substantiated.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

Claims are further refined through subclassification, which attaches methodological provenance and documentary provenance to each assertion. Methods of classification include automated derivation, hybrid analysis combining algorithmic and human review, and inferred reasoning based on indirect evidence. A claim such as "Lab centrifuge unit-7" may be classified through automated processes, while "Data ingestion pipeline" and "Supply chain disruption" employ hybrid methods, and "CPU temp exceeds threshold" relies on inferred classification. Each subclassification is grounded in a label text—audit excerpt, intake form, pre-release note, or calibration record—that identifies the source document or artifact from which the claim was extracted. This provenance chain ensures traceability from raw evidence through analytical processing to final assertion.

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | Patient dosage exceeds limit | automated | audit excerpt |
| CLAI-0002 | Data ingestion pipeline | Firmware update breaks encryption | hybrid | intake form |
| CLAI-0003 | Supply chain disruption | API gateway prod | hybrid | pre-release note |
| CLAI-0004 | CPU temp exceeds threshold | Network latency spike | inferred | calibration record |

The relational architecture of the framework extends beyond individual claims to model how claims interact with refuting evidence and how those refutations themselves are challenged. Claims such as "Patient dosage exceeds limit" or "Carbon emissions peaked" are linked to refuting evidence records like Compliance checklist v2.1 or Satellite imagery timestamp through structured relationships. These linkages are mediated by role designations—observer and reviewer—that specify the functional capacity of the evidence in relation to the claim. An observer role indicates direct evidentiary contact with the claim subject, while a reviewer role denotes evaluative assessment of the claim's validity. The subject of a claim, such as "Firmware update breaks encryption" or "Network latency spike," represents the specific phenomenon under assertion, and the target identifies the entity or system to which the claim pertains. This multi-layered relational structure enables granular reconstruction of the evidentiary chain, supporting both retrospective audit and prospective risk assessment.

**t_claim_refuted_by_evidence__refuted_by_evidence**

| id | claim_id | refuted_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0006 | EVID-0004 | observer |
| EVID-0002 | EVID-0007 | EVID-0004 | observer |
| EVID-0003 | EVID-0003 | EVID-0007 | observer |
| EVID-0004 | EVID-0001 | EVID-0003 | reviewer |
| EVID-0005 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0006 | EVID-0001 | EVID-0007 | contributor |
| EVID-0007 | EVID-0007 | EVID-0005 | owner |
| EVID-0008 | EVID-0003 | EVID-0001 | owner |

Additional contextual data—miscellaneous values such as 164.54, 173.58, 166.95, and 152.06—supplement the core claim attributes with supplementary measurements that may represent derived metrics, temporal offsets, or domain-specific quantities. These ancillary values enrich the claim record without altering its fundamental classification or evidentiary weight, providing supplementary context for domain experts during review.