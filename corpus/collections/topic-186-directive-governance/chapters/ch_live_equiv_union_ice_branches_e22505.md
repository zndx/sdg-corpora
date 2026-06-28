---
chapter_id: ch_live_equiv_union_ice_branches_e22505
topic_id: 186
family: 01_foundation
cited_terms: ['equiv_union_ice_branches', 'belief_interval_subclass', 'attribute_set_min_one']
model: engine-refine
---

An identifier serves as the immutable anchor for every entity within a governance framework, providing a stable reference that survives changes to labels, categories, or underlying values. Branch identifiers such as BRAN-0001 through BRAN-0004 and interval identifiers like INTE-0001 through INTE-0004 establish persistent keys that link related records across tables, ensuring that a calibration offset can always be traced back to its originating branch regardless of how many times its description or language tag is updated. Without such identifiers, the provenance of a measurement or policy decision becomes impossible to reconstruct, undermining auditability and regulatory compliance.

**t_belief_interval_subclass**

| id | belief |
| --- | --- |
| INTE-0001 | Sensor calibration drift |
| INTE-0002 | Model convergence state |
| INTE-0003 | Model convergence state |
| INTE-0004 | Sensor calibration drift |
| INTE-0005 | Data ingestion rate |
| INTE-0006 | Reagent shelf life |

Attributes carry the substantive content of governance records, and each attribute is classified by a category that groups related measurements under a common semantic umbrella. In the attribute dimension, labels such as Attribute Label 01 through Attribute Label 04 are paired with categories like Attribute Category 01 through Attribute Category 04, creating a taxonomy that enables aggregation and comparison across datasets. The attribute key itself—seen in fact records as ONE-0005 or ONE-0003—acts as a foreign reference to this dimension, allowing fact tables to remain lean while preserving the ability to resolve any attribute to its full label and category context. This separation of identity from classification is a foundational design principle: the same attribute can appear in multiple fact rows with different confidence and uncertainty values, yet always resolve to the same categorical definition.

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONE-0001 | ONE-0005 | 0.926 | 957.49 | 482.01 |
| ONE-0002 | ONE-0003 | 0.786 | 274.08 | 742.87 |
| ONE-0003 | ONE-0005 | 0.123 | 455.70 | 100.75 |
| ONE-0004 | ONE-0003 | 0.178 | 516.20 | 779.52 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| ONE-0001 | Attribute Label 01 | Attribute Category 01 |
| ONE-0002 | Attribute Label 02 | Attribute Category 02 |
| ONE-0003 | Attribute Label 03 | Attribute Category 03 |
| ONE-0004 | Attribute Label 04 | Attribute Category 04 |
| ONE-0005 | Attribute Label 05 | Attribute Category 05 |
| ONE-0006 | Attribute Label 06 | Attribute Category 06 |

Confidence and uncertainty quantify the reliability of every recorded value, forming a dual lens through which downstream consumers assess risk. A fact record with a confidence of 0.926 and an uncertainty of 957.49 conveys a markedly different risk profile than one with confidence 0.123 and uncertainty 455.70, even when both reference the same attribute key. These metrics are not interchangeable—confidence measures the degree of belief in the accuracy of the value, while uncertainty captures the magnitude of potential deviation. In practice, a governance framework uses both to determine whether a measurement such as 482.01 or 100.75 is sufficient for decision-making, whether it requires re-measurement, or whether it should be flagged for review.

Label text and language provide the human-readable context that bridges technical identifiers to operational understanding. A branch identified as BRAN-0001 carries the label text "calibration record" in French, while BRAN-0003, also labeled "calibration record," is tagged with German, and BRAN-0002 and BRAN-0003 carry the label texts "change rationale" and "intake form" respectively in Spanish. This multilingual layer ensures that the same underlying entity can be referenced correctly across regional teams, while the language tag disambiguates which textual representation applies in any given context. The equivalence field—Calibration_Offset, Equipment_Model, Data_Retention_Policy, Quality_Score—further anchors these labels to domain-specific concepts, making the system interpretable to both machines and people.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |

The relationship between belief intervals and their lower bounds is mediated by a join structure that assigns roles to each linkage. In this structure, a subject—such as belief INTE-0004 referencing "Sensor calibration drift"—is connected to a target—such as belief lower bound INTE-0008 carrying the value "0.85 probability"—through a role that designates whether the linkage acts as a contributor or an owner. This role distinction is critical for governance: an owner relationship implies authoritative responsibility for the bound, while a contributor relationship indicates a supporting or derived connection. The bounds themselves range from probabilistic thresholds like "0.85 probability" and "95 percent threshold" to regulatory references such as "ISO ninety eight" and statistical conventions like "Three sigma limit," each encoding a different standard of evidence.

**t_belief_interval_subclass_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| INTE-0001 | 0.85 probability |
| INTE-0002 | Three sigma limit |
| INTE-0003 | ISO ninety eight |
| INTE-0004 | 95 percent threshold |
| INTE-0005 | 99.9 percent uptime |
| INTE-0006 | 0.85 probability |
| INTE-0007 | 128 megabytes |
| INTE-0008 | 256 units |

**t_belief_interval_subclass__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0008 | contributor |
| INTE-0002 | INTE-0005 | INTE-0006 | owner |
| INTE-0003 | INTE-0001 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0008 | owner |
| INTE-0005 | INTE-0006 | INTE-0001 | contributor |
| INTE-0006 | INTE-0002 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0001 | INTE-0006 | owner |
| INTE-0008 | INTE-0005 | INTE-0007 | contributor |

Miscellaneous values and free-form belief descriptions fill the remaining semantic space, capturing details that do not fit into structured categories. The value column in fact records holds numeric measurements—482.01, 742.87, 100.75, 779.52—that represent the actual observations being governed, while belief descriptions such as "Model convergence state" and "Sensor calibration drift" provide narrative context for why an interval exists in the first place. Together with the structured fields, these free-form elements ensure that the framework can accommodate both machine-readable precision and human-readable explanation, a duality that is essential for systems that must serve automated compliance checks and manual audit reviews simultaneously.