---
chapter_id: ch_live_outlier_claim_subclass_605b9f
topic_id: 24
family: 02_observation_measurement
cited_terms: ['outlier_claim_subclass', 'dataset_was_attributed_to', 'soc2_processing_integrity']
model: engine-refine
---

Operational compliance architectures depend upon precise identifier resolution to anchor disparate audit events within a unified governance topology. Each record receives a unique identifier that serves as the immutable anchor for downstream lineage tracking and cross-referencing. These identifiers do not operate in isolation; they function as relational pivots connecting a subject entity to a target domain. In anomaly tracking, for instance, an outlier claim such as CLAI-0005 is explicitly mapped to a target context like CLAI-0002, establishing a directed relationship that clarifies which operational environment requires investigation. This subject-to-target linkage ensures that every flagged event, whether a Network_Bandwidth_Spike or a Patient_Vital_Anomaly, can be traced to its precise point of impact without ambiguity.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |

Accountability within these mappings is formalized through role assignment, which transforms raw relational links into auditable chains of custody. Junction records explicitly declare whether a subject acts as the owner, reviewer, or observer relative to its target. A single identifier may carry multiple role designations across different contexts; CLAI-0001, for example, functions simultaneously as a reviewer in one domain pairing and as an observer in another, reflecting the distributed nature of modern compliance oversight. This role taxonomy prevents accountability dilution by ensuring that every cross-domain assertion carries a clearly designated steward, thereby satisfying internal control requirements and external audit mandates.

**t_soc2_processing_integrity__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0006 | INTE-0005 | owner |
| INTE-0002 | INTE-0003 | INTE-0006 | reviewer |
| INTE-0003 | INTE-0004 | INTE-0005 | observer |
| INTE-0004 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0005 | INTE-0002 | INTE-0003 | owner |
| INTE-0006 | INTE-0003 | INTE-0002 | reviewer |
| INTE-0007 | INTE-0005 | INTE-0004 | contributor |
| INTE-0008 | INTE-0004 | INTE-0003 | observer |

Dataset provenance and version control are maintained through a parallel attribution layer that captures both quantitative and categorical metadata. The fact_dataset table records size_bytes alongside a version number, enabling operators to verify data lineage and confirm that processing pipelines reference the exact artifact required for compliance validation. A record such as ATTR-0001, sized at 350697080 bytes and locked to version 10, provides a deterministic checkpoint for regression testing and forensic analysis. These quantitative markers are supplemented by category and misc descriptors that classify artifacts according to organizational taxonomy. The was attributed to linkage further anchors each dataset to its originating steward, creating a verifiable provenance chain that survives environment migrations and regulatory inspections.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |

The framework extends this rigor to regulatory domains by binding processing integrity claims to specific business functions. SOC2 compliance assertions, attributed to entities like Quantum Retail Group or GlobalPay Systems, are systematically mapped to operational domains such as user provisioning, customer onboarding, and report generation. Similarly, anomaly explanations are routed to high-stakes environments including Automotive_Test_Drive, Power_Grid_Substation, and Financial_Trading_Queue. By structuring these mappings as explicit relational triples rather than implicit assumptions, the architecture guarantees that every compliance claim, integrity assertion, and anomaly report carries a complete audit trail. The result is a governance topology where identifiers, roles, sizes, versions, and attribution categories converge to enforce traceability, accountability, and regulatory readiness across distributed systems.

**t_soc2_processing_integrity**

| id | soc |
| --- | --- |
| INTE-0001 | Quantum Retail Group |
| INTE-0002 | GlobalPay Systems |
| INTE-0003 | Pinnacle SaaS Platform |
| INTE-0004 | Nexus Cloud Services |
| INTE-0005 | Vertex Analytics Ltd |
| INTE-0006 | Quantum Retail Group |

**t_soc2_processing_integrity_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| INTE-0001 | user provisioning |
| INTE-0002 | customer onboarding |
| INTE-0003 | report generation |
| INTE-0004 | customer onboarding |
| INTE-0005 | inventory management |
| INTE-0006 | supply chain tracking |