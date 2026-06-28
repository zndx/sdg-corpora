---
chapter_id: ch_live_artifact_not_deprecated_22dc55
topic_id: 5
family: 07_long_tail
cited_terms: ['artifact_not_deprecated', 'control_addresses_risk', 'outlier_claim_supported_by']
model: engine-refine
---

Artifact governance in regulated environments rests on the disciplined tracking of discrete deliverables through their lifecycle, where each artifact carries an immutable identifier, a version stamp, and a measurable footprint. The fact_artifact table anchors this practice: records such as DEPR-0001 through DEPR-0004 each denote a distinct artifact, linked to upstream artifact keys like DEPR-0004 and DEPR-0005 that establish lineage. Size in bytes—123,155,790 for one record, 996,080,316 for another—provides an auditable measure of materiality, while version numbers (5, 6, 10) capture the evolution of the deliverable over time. These attributes, drawn from the dim_artifact dimension, are further classified by artifact category and labeled for human consumption, ensuring that every tracked item can be both machine-parsed and operationally understood.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

Risk management introduces a parallel structure of controls and the threats they mitigate. The t_control_addresses_risk table enumerates controls such as Log Retention Policy, Segregation of Duties, Vendor Assessment, and MFA Enforcement, each mapped to specific risk exposures—Insider Threat, Configuration Drift, Third-Party Failure—within the t_control_addresses_risk_addresses_risk table. The junction table t_control_addresses_risk__addresses_risk formalizes these mappings through foreign keys: control_id references the originating control, addresses_risk_id points to the targeted risk, and role distinguishes whether a party acts as contributor or observer in the control-to-risk relationship. This tripartite structure ensures that accountability is explicit and that the chain of responsibility from control to threat is traceable.

**t_control_addresses_risk**

| id | control |
| --- | --- |
| RISK-0001 | Log Retention Policy |
| RISK-0002 | Segregation of Duties |
| RISK-0003 | Vendor Assessment |
| RISK-0004 | MFA Enforcement |
| RISK-0005 | Access Review Cycle |
| RISK-0006 | Threat Modeling |

**t_control_addresses_risk_addresses_risk**

| id | addresses_risk |
| --- | --- |
| RISK-0001 | Insider Threat |
| RISK-0002 | Configuration Drift |
| RISK-0003 | Third-Party Failure |
| RISK-0004 | Insider Threat |
| RISK-0005 | Regulatory Penalty |
| RISK-0006 | Configuration Drift |
| RISK-0007 | Regulatory Penalty |

**t_control_addresses_risk__addresses_risk**

| id | control_id | addresses_risk_id | role |
| --- | --- | --- | --- |
| RISK-0001 | RISK-0002 | RISK-0005 | contributor |
| RISK-0002 | RISK-0005 | RISK-0002 | observer |
| RISK-0003 | RISK-0001 | RISK-0002 | contributor |
| RISK-0004 | RISK-0005 | RISK-0006 | observer |
| RISK-0005 | RISK-0003 | RISK-0004 | contributor |
| RISK-0006 | RISK-0001 | RISK-0004 | reviewer |
| RISK-0007 | RISK-0005 | RISK-0003 | contributor |
| RISK-0008 | RISK-0006 | RISK-0002 | reviewer |

Outlier detection and evidentiary support form the third pillar, captured in the fact_outlier and dim_supported_by tables. Each outlier record—identified as SUPP-0001 through SUPP-0004—carries a confidence score and an uncertainty value that together quantify the reliability of the observation. Confidence ranges from 0.147, indicating weak support, to 0.877, suggesting strong evidentiary backing; uncertainty values span from 10.24 to 719.33, reflecting the magnitude of variance around the measured value (which itself ranges from 369.89 to 757.32). The supported_by_key column links each outlier to its evidentiary source, which is further described in dim_supported_by through labels and categories. This architecture allows auditors to assess not merely whether an anomaly exists, but how well-supported the claim is and what degree of residual risk remains.

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

The interplay of these tables reveals a coherent governance model: artifacts are versioned and sized for traceability, controls are assigned roles in addressing specific risks, and outlier findings are scored for confidence and uncertainty while being tied to their supporting evidence. An auditor reviewing DEPR-0004, for instance, can verify its artifact key, inspect its version history, and cross-reference any associated outlier (SUPP-0001, with confidence 0.877 and uncertainty 516.58) to the control framework. The role field—contributor versus observer—further clarifies who bears responsibility for each linkage, ensuring that the entire chain from artifact through risk to evidentiary support remains both complete and accountable.