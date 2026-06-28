---
chapter_id: ch_live_patient_insurance_record_0f473a
topic_id: 79
family: 08_derived
cited_terms: ['patient_insurance_record', 'column_lineage_for_compliance_claim', 'policy_classification_tier']
model: engine-refine
---

Patient insurance records serve as the foundational identifiers within the data architecture, each anchored by a unique record key such as RECO-0001 through RECO-0004 and associated with enrollment designations including ENROLL-7742, POL-8821-AX, SSN-4821, and DOB-19850312. These identifiers establish the primary entities to which all downstream data elements, classification policies, and access roles are bound. The records themselves function not merely as containers but as the subject of governance—each one a discrete patient insurance record that must be traced, classified, and protected according to the regulatory frameworks applied to it.

**t_patient_insurance_record**

| id | patient_insurance_record |
| --- | --- |
| RECO-0001 | ENROLL-7742 |
| RECO-0002 | POL-8821-AX |
| RECO-0003 | SSN-4821 |
| RECO-0004 | DOB-19850312 |
| RECO-0005 | MRN-4829103 |
| RECO-0006 | SSN-4821 |
| RECO-0007 | POL-8821-AX |
| RECO-0008 | ENROLL-7742 |

**t_patient_insurance_record_contains_data_element**

| id | contains_data_element |
| --- | --- |
| RECO-0001 | coverage_start_date |
| RECO-0002 | provider_npi |
| RECO-0003 | deductible_limit |
| RECO-0004 | premium_amount |
| RECO-0005 | copay_rate |
| RECO-0006 | coverage_start_date |

Data elements such as coverage_start_date, provider_npi, deductible_limit, and premium_amount are linked to patient insurance records through a containment relationship that is itself mediated by a role assignment. In this junction structure, the patient identifier and the data element identifier converge under a role designation—contributor, owner, or observer—that determines the nature of the relationship. For instance, record RECO-0001 associates with patient RECO-0005 and data element RECO-0003 under the role of contributor, while RECO-0008 and RECO-0006 are joined under the role of owner. This tripartite construction—subject, target, and role—ensures that every data element association carries an explicit governance context, making it possible to audit not only what data exists but who is responsible for it and in what capacity.

**t_patient_insurance_record__contains_data_element**

| id | patient_id | contains_data_element_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0005 | RECO-0003 | contributor |
| RECO-0002 | RECO-0003 | RECO-0006 | contributor |
| RECO-0003 | RECO-0008 | RECO-0006 | owner |
| RECO-0004 | RECO-0007 | RECO-0002 | observer |
| RECO-0005 | RECO-0001 | RECO-0002 | owner |
| RECO-0006 | RECO-0005 | RECO-0002 | observer |
| RECO-0007 | RECO-0003 | RECO-0002 | contributor |
| RECO-0008 | RECO-0008 | RECO-0001 | owner |

Column-level data is organized through a fact-dimension pairing that separates measurable values from their categorical metadata. The fact table records a column key, a numeric value such as 257.80 or 131.27, a confidence score ranging from 0.068 to 0.354, and an uncertainty magnitude spanning 404.01 to 984.09. The dimension table provides the human-readable column label—Column Label 01 through Column Label 04—and a column category such as Column Category 01 through Column Category 04. Confidence and uncertainty operate as complementary measures: a record with confidence 0.354 and uncertainty 404.01 carries substantially more assurance than one with confidence 0.068 and uncertainty 744.10, and these paired metrics enable downstream systems to weight or flag values according to their reliability.

**dim_column**

| id | column_label | column_category |
| --- | --- | --- |
| CLAI-0001 | Column Label 01 | Column Category 01 |
| CLAI-0002 | Column Label 02 | Column Category 02 |
| CLAI-0003 | Column Label 03 | Column Category 03 |
| CLAI-0004 | Column Label 04 | Column Category 04 |
| CLAI-0005 | Column Label 05 | Column Category 05 |
| CLAI-0006 | Column Label 06 | Column Category 06 |

Policy classification tiers impose a regulatory overlay on the data architecture, mapping policies such as the Medical Privacy Directive, the Financial SEC Reporting Rule, and the Environmental EPA Emissions Standard to access tiers including Tier 3 Critical, Restricted Access, and Level 2 Sensitive. The association between a policy and a classification tier is itself governed by a role—owner, observer, contributor, or reviewer—that specifies the policy's relationship to the tier. Record TIER-0002, for example, appears as the owner of tier TIER-0002 and as the observer of tier TIER-0003, demonstrating that a single policy can hold multiple roles across different classification tiers. This multi-role structure ensures that regulatory compliance is not a binary property but a nuanced assignment of responsibilities, where the same directive may be enforced, monitored, or audited depending on the tier in question.

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | Medical Privacy Directive |
| TIER-0002 | Financial SEC Reporting Rule |
| TIER-0003 | Environmental EPA Emissions Standard |
| TIER-0004 | Medical Privacy Directive |
| TIER-0005 | Open Source License Policy |
| TIER-0006 | National Cybersecurity Strategy |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

The complete schema—spanning patient insurance records, data element associations, column facts and dimensions, and policy-tier mappings—forms a unified governance fabric. Identifiers provide the keys, categories provide the organization, columns provide the structure, confidence and uncertainty provide the quality signals, roles provide the accountability, and the subject-target relationships provide the connective tissue. Together, they enable an organization to answer not only what data it holds and how it is classified, but who is responsible for it, how reliable it is, and under which regulatory tier it must be managed.

**fact_column**

| id | column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | 0.164 | 560.21 | 257.80 |
| CLAI-0002 | CLAI-0006 | 0.068 | 744.10 | 571.55 |
| CLAI-0003 | CLAI-0004 | 0.107 | 984.09 | 140.18 |
| CLAI-0004 | CLAI-0001 | 0.354 | 404.01 | 131.27 |
| CLAI-0005 | CLAI-0006 | 0.790 | 109.97 | 235.19 |
| CLAI-0006 | CLAI-0003 | 0.934 | 653.09 | 813.74 |
| CLAI-0007 | CLAI-0005 | 0.938 | 827.04 | 409.13 |
| CLAI-0008 | CLAI-0002 | 0.734 | 419.22 | 492.32 |

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |