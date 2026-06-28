---
chapter_id: ch_live_policy_effective_period_299fba
topic_id: 26
family: 01_foundation
cited_terms: ['policy_effective_period', 'outlier_claim_supported_by', 'requirement_verified_by']
model: engine-refine
---

In governance and compliance frameworks, every artifact must be traceable to a unique identifier that anchors it within the broader control environment. Identifiers such as PERI-0001, SUPP-0001, and VERI-0001 serve as the immutable keys that link policies, supporting evidence, and verification requirements across disparate systems. A policy like the HIPAA Privacy Rule is not merely referenced by name; it is assigned an effective-period identifier that ties it to a specific verification event (VERI-0003), a defined scope of applicability, and a language variant. This disciplined identification scheme ensures that auditors, automated scanners, and compliance officers can unambiguously resolve any reference to a single, authoritative record.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | VERI-0003 | local | es |
| PERI-0002 | GDPR Compliance | VERI-0006 | local | es |
| PERI-0003 | PCI DSS v4.0 | VERI-0001 | global | fr |
| PERI-0004 | NIST SP 800-53 | VERI-0005 | team | es |
| PERI-0005 | CCPA Data Rights | VERI-0004 | team | es |

**t_requirement_verified_by**

| id | requirement |
| --- | --- |
| VERI-0001 | Data retention policy |
| VERI-0002 | Compliance baseline |
| VERI-0003 | Data retention policy |
| VERI-0004 | Data retention policy |
| VERI-0005 | Audit logging mandate |
| VERI-0006 | Provenance tracking spec |

**t_requirement_verified_by_verified_by**

| id | verified_by |
| --- | --- |
| VERI-0001 | Automated scanner |
| VERI-0002 | Lab director |
| VERI-0003 | Internal audit team |
| VERI-0004 | System validator |
| VERI-0005 | Automated scanner |
| VERI-0006 | Automated scanner |

The reliability of compliance evidence hinges on two complementary metrics: confidence and uncertainty. In the outlier fact table, each observation carries a confidence score ranging from 0.147 to 0.877, reflecting the degree of assurance that the measured value is valid, alongside an uncertainty figure that quantifies the margin of error—values such as 10.24 for a tightly controlled measurement or 719.33 for a highly volatile one. These paired metrics allow governance teams to triage findings: a high-confidence, low-uncertainty outlier warrants immediate remediation, whereas a low-confidence, high-uncertainty result may indicate insufficient data rather than a genuine control failure. The actual measurement itself, stored as a miscellaneous value like 453.93 or 757.32, provides the factual anchor against which thresholds are evaluated.

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

Supporting evidence is organized through a dimension table that classifies each item by category and label. Categories such as Supported By Category 01 through 04 provide a hierarchical taxonomy for grouping evidence types, while labels like Supported By Label 01 offer human-readable descriptors. This categorical structure enables roll-up reporting and filtering; a compliance officer can query all evidence belonging to a particular category to assess whether a given policy—say, PCI DSS v4.0—has adequate backing across all required domains. The supported-by relationship itself forms a foreign key from the fact table back to this dimension, ensuring that every confidence-uncertainty pair is attributable to a documented source.

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

Verification workflows introduce a third layer of relational complexity, mapping requirements to the entities responsible for confirming their fulfillment. The requirement table captures the substance of each obligation—Data retention policy, Compliance baseline—while the verification mapping table assigns roles such as owner, observer, or reviewer to the interaction between a subject requirement and a target verifier. An internal audit team acting as reviewer, an automated scanner serving as owner, or a lab director functioning as observer each carry distinct accountability and authority. The subject-target pairing in the junction table makes explicit which requirement is being verified by whom, and in what capacity, creating an auditable chain of responsibility that satisfies regulatory demands for segregation of duties.

**t_requirement_verified_by__verified_by**

| id | requirement_id | verified_by_id | role |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0006 | VERI-0006 | owner |
| VERI-0002 | VERI-0002 | VERI-0003 | observer |
| VERI-0003 | VERI-0004 | VERI-0006 | reviewer |
| VERI-0004 | VERI-0003 | VERI-0005 | observer |
| VERI-0005 | VERI-0004 | VERI-0001 | owner |
| VERI-0006 | VERI-0004 | VERI-0002 | owner |
| VERI-0007 | VERI-0001 | VERI-0002 | reviewer |
| VERI-0008 | VERI-0004 | VERI-0001 | observer |

Scope and language further contextualize each policy's applicability. A policy may apply at the local level within a single facility, at the team level across a department, or globally across the entire organization. Similarly, the language field—es for Spanish, fr for French—ensures that policy documents and verification artifacts are delivered in the appropriate linguistic variant for the jurisdiction or workforce. When the GDPR Compliance policy is scoped globally and rendered in French, for instance, the combination of scope and language signals both the breadth of enforcement and the linguistic accessibility of the control documentation. Together, these attributes ensure that compliance artifacts are not only technically correct but also contextually appropriate for the audiences and regions they serve.