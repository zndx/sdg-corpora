---
chapter_id: ch_live_policy_enforced_by_064483
topic_id: 97
family: 03_directive_governance
cited_terms: ['policy_enforced_by', 'outlier_claim_supported_by', 'claim_refuted_by_evidence']
model: engine-refine
---

Governance and compliance architectures depend upon a disciplined taxonomy of identifiers, roles, and confidence measures to bind policy requirements to their enforcement mechanisms and to ground analytical claims in verifiable evidence. Each policy—whether governing encryption under ISO27001, data deletion under CCPA, tokenization under PCI-DSS, or record retention under FINRA—receives a unique identifier such as ENFO-0001 or ENFO-0004, which serves as the immutable anchor across all relational joins. These identifiers propagate through junction tables that associate policies with the controls responsible for their execution: Splunk SIEM, the ISO Audit Board, and AWS Config Rules appear repeatedly as enforcement agents, each linked to one or more policies through a relationship that carries a role qualifier. The role—observer, reviewer, or owner—encodes the nature of the enforcement relationship, distinguishing between entities that merely monitor compliance posture and those that bear direct accountability for remediation.

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO27001 Encryption |
| ENFO-0002 | CCPA Data Deletion |
| ENFO-0003 | PCI-DSS Tokenization |
| ENFO-0004 | FINRA Record Retention |
| ENFO-0005 | FINRA Record Retention |
| ENFO-0006 | HIPAA Audit Trail |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

The same pattern of role-annotated relationships extends to the evidentiary layer, where claims such as "Carbon emissions peaked," "Patient dosage exceeds limit," "Supply chain disruption," and "Firmware update breaks encryption" are systematically refuted by documented evidence. The refuting evidence itself—Compliance checklist v2.1 and Satellite imagery timestamp—carries its own identifier, and the linkage between claim and refutation is mediated by a junction table that again assigns a role, typically observer or reviewer, to the relationship. This dual-layer structure, in which both policy enforcement and evidentiary refutation are expressed as role-bearing associations between subject and target entities, ensures that every assertion in the system can be traced to a responsible party and a supporting artifact.

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |

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

Analytical assertions within the system are further qualified by confidence and uncertainty measures that together define the reliability envelope of each observation. A fact outlier identified as SUPP-0001 carries a confidence of 0.877 and an uncertainty of 516.58, while its counterpart SUPP-0002 registers a confidence of only 0.147 against an uncertainty of 368.22, illustrating the inverse relationship that governs these paired metrics. The misc value associated with each outlier—453.93, 510.05, 369.89, 757.32—provides the raw measurement that the confidence and uncertainty parameters contextualize. These outliers are themselves supported by keys that reference a dimension table, where each supported_by entry is classified under a category such as Supported By Category 01 through Supported By Category 04 and labeled with a descriptive string like Supported By Label 01.

The category field serves as the primary classification mechanism within the dimension tables, grouping supported_by entries into coherent sets that reflect their functional domain. Each category—Supported By Category 01, Supported By Category 02, and so forth—corresponds to a distinct label and identifier pair, forming a lookup structure that the fact tables reference through the supported_by_key column. This separation of classification from measurement allows the system to aggregate outliers by category while preserving the granular confidence and uncertainty values that pertain to individual records. The misc column, which holds the raw values, operates independently of the categorical structure, enabling the same category to encompass observations of widely varying magnitude.

**fact_outlier**

| id | supported_by_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SUPP-0001 | SUPP-0006 | 0.877 | 516.58 | 453.93 |
| SUPP-0002 | SUPP-0002 | 0.147 | 368.22 | 510.05 |
| SUPP-0003 | SUPP-0001 | 0.792 | 10.24 | 369.89 |
| SUPP-0004 | SUPP-0003 | 0.479 | 719.33 | 757.32 |
| SUPP-0005 | SUPP-0003 | 0.986 | 245.64 | 972.07 |
| SUPP-0006 | SUPP-0004 | 0.386 | 5.02 | 16.62 |
| SUPP-0007 | SUPP-0003 | 0.047 | 979.09 | 828.93 |

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

Together, these constructs—identifier, category, confidence, uncertainty, role, subject, target, supported_by, and misc—form a coherent relational grammar that supports both compliance enforcement and evidentiary analysis. The identifier provides the stable key across all tables; the category organizes dimension entries into meaningful groups; the confidence and uncertainty pair quantifies the reliability of analytical observations; the role specifies the nature of the relationship between subject and target entities; the supported_by column traces analytical claims back to their dimensional foundations; and the misc column preserves the raw data that underpins all derived measures. This architecture ensures that every policy, every claim, and every outlier can be traced through a chain of relationships that are themselves annotated with role and qualified by confidence, creating a system in which accountability and reliability are first-class concerns.