---
chapter_id: ch_live_baseline_for_metric_5e1932
topic_id: 92
family: 07_long_tail
cited_terms: ['baseline_for_metric', 'schemaorg_person_affiliation', 'claim_refuted_by_evidence']
model: engine-refine
---

Affiliation structures and their categorical classifications form the backbone of entity relationship management within governed data ecosystems. Each affiliation record carries a unique identifier—AFFI-0001 through AFFI-0004—alongside a human-readable label such as Affiliation Label 01 and a category designation like Affiliation Category 01, establishing a clear taxonomy for how organizations, systems, or data assets relate to one another. The fact_schemaorg table operationalizes these relationships by recording not only the affiliation key that binds records together but also the version number and size in bytes of the associated entity, with values ranging from version 3 to version 8 and data volumes spanning from approximately 114 megabytes to nearly 1 gigabyte. This versioning mechanism ensures traceability across schema evolution, while the size_bytes field provides a practical metric for capacity planning and data governance audits.

**fact_schemaorg**

| id | affiliation_key | size_bytes | version |
| --- | --- | --- | --- |
| AFFI-0001 | AFFI-0001 | 895265030 | 3 |
| AFFI-0002 | AFFI-0004 | 114301972 | 5 |
| AFFI-0003 | AFFI-0002 | 338701831 | 4 |
| AFFI-0004 | AFFI-0003 | 998785819 | 8 |

**dim_affiliation**

| id | affiliation_label | affiliation_category |
| --- | --- | --- |
| AFFI-0001 | Affiliation Label 01 | Affiliation Category 01 |
| AFFI-0002 | Affiliation Label 02 | Affiliation Category 02 |
| AFFI-0003 | Affiliation Label 03 | Affiliation Category 03 |
| AFFI-0004 | Affiliation Label 04 | Affiliation Category 04 |
| AFFI-0005 | Affiliation Label 05 | Affiliation Category 05 |
| AFFI-0006 | Affiliation Label 06 | Affiliation Category 06 |

Identifier conventions serve as the primary mechanism for unambiguous record resolution across distributed tables and subsystems. Metric identifiers follow the pattern METR-0001 through METR-0004, each corresponding to a specific baseline type such as Standard_Daylight_Cycle, Power_Consumption, Structural_Stress, or Steady_State_Vibration. Evidence identifiers, designated EVID-0001 through EVID-0004, anchor claims ranging from Carbon emissions peaked to Firmware update breaks encryption, and the evidence that refutes them—including Compliance checklist v2.1 and Satellite imagery timestamp. The consistency of this naming convention across disparate domains enables reliable cross-referencing without ambiguity, a requirement that becomes critical when audit trails must link a refuted claim to its supporting evidence and the evidence to its reviewer or observer.

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

**t_claim_refuted_by_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Carbon emissions peaked |
| EVID-0002 | Patient dosage exceeds limit |
| EVID-0003 | Supply chain disruption |
| EVID-0004 | Firmware update breaks encryption |
| EVID-0005 | Algorithm bias flagged |
| EVID-0006 | Market volatility threshold |
| EVID-0007 | Carbon emissions peaked |

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

The subject-target-role triad provides a formalized model for describing how entities interact within a relationship. In the baseline metric junction table, a baseline identified as METR-0007 assumes the role of owner against a baseline_for target of METR-0004, while another record assigns the role of contributor to the relationship between METR-0002 and METR-0005. This same pattern appears in the evidence refutation table, where claim EVID-0006 is observed by refutation evidence EVID-0004, and claim EVID-0001 is reviewed by evidence EVID-0003. The role field—taking values such as owner, contributor, observer, and reviewer—encodes the nature of the relationship, transforming a simple many-to-many link into a semantically rich association that supports downstream governance queries and compliance reporting.

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

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

Size and version metadata provide the operational context necessary for managing the lifecycle of affiliated entities. The fact_schemaorg table records size_bytes values with precision—895,265,030 bytes for AFFI-0001, 114,301,972 for AFFI-0004—enabling data stewards to track storage consumption by affiliation and identify outliers that may warrant investigation. Version numbers, ranging from 3 through 8 across the four affiliation records, indicate the maturity or revision state of each entity, supporting change management workflows where older versions must be preserved for historical reference while newer versions are deployed into production. Together, these fields ensure that every affiliation relationship is not only semantically described but also quantitatively characterized, providing the evidence base required for regulatory compliance and operational decision-making.