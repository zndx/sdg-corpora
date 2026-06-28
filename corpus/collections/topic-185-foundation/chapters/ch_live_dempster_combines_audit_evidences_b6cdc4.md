---
chapter_id: ch_live_dempster_combines_audit_evidences_b6cdc4
topic_id: 185
family: 07_long_tail
cited_terms: ['dempster_combines_audit_evidences', 'apolitical_islam', 'regional_quality_benchmark']
model: engine-refine
---

The evidentiary architecture for classifying Islamic political-theological positions rests upon a dual-dimension framework that separates normative doctrinal models from their regional manifestations, each annotated with Dempster-Shafer confidence measures. At the core of this structure, the apolitical Islam dimension enumerates distinct theological paradigms—such as the Turkish Diyanet model and Iranian Hawza quietism—alongside their associated doctrinal narratives, ranging from Hadith preservation focus to ascetic withdrawal practice, and contrasts these against political Islam stances including theocratic state proposal, militant jihadism, and political enjoinment doctrine. Each paradigm entry carries an identifier of the form ISLA-0001 through ISLA-0004, anchoring the doctrinal taxonomy to a stable reference frame that supports downstream evidence fusion. The attribute system extends this taxonomy through an entity-attribute-value pattern, where metadata such as encoding schemes and language specifications—encoded as xsd:string types—attach to individual doctrinal entries, enabling multilingual documentation (notably French-language annotations) and systematic change rationale tracking across the knowledge base.

**dim_dempster**

| id | dempster_label | dempster_category |
| --- | --- | --- |
| EVID-0001 | Dempster Label 01 | Dempster Category 01 |
| EVID-0002 | Dempster Label 02 | Dempster Category 02 |
| EVID-0003 | Dempster Label 03 | Dempster Category 03 |
| EVID-0004 | Dempster Label 04 | Dempster Category 04 |
| EVID-0005 | Dempster Label 05 | Dempster Category 05 |
| EVID-0006 | Dempster Label 06 | Dempster Category 06 |
| EVID-0007 | Dempster Label 07 | Dempster Category 07 |
| EVID-0008 | Dempster Label 08 | Dempster Category 08 |

**t_apolitical_islam**

| id | apolitical_islam | doctrinal_narrative | political_islam_stance |
| --- | --- | --- | --- |
| ISLA-0001 | Turkish Diyanet model | Hadith preservation focus | Theocratic state proposal |
| ISLA-0002 | Turkish Diyanet model | Ascetic withdrawal practice | Militant jihadism |
| ISLA-0003 | Turkish Diyanet model | Hadith preservation focus | Political enjoinment doctrine |
| ISLA-0004 | Iranian Hawza quietism | Worldly detachment concept | Islamist governance theory |
| ISLA-0005 | Sunni quietism | Hadith preservation focus | Theocratic state proposal |
| ISLA-0006 | Ahl-e Hadith | Community stability tenet | Islamist constitutionalism |
| ISLA-0007 | Deobandi quietism | Taqlid adherence tradition | Revolutionary vanguard model |

**t_apolitical_islam_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ISLA-0001 | encoding | xsd:string |
| ISLA-0002 | label_text | xsd:string |
| ISLA-0003 | language | xsd:string |

**t_apolitical_islam_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ISLA-0001 | ISLA-0001 | ISLA-0001 | Encoding 01 |
| ISLA-0002 | ISLA-0001 | ISLA-0002 | change rationale |
| ISLA-0003 | ISLA-0001 | ISLA-0003 | fr |
| ISLA-0004 | ISLA-0002 | ISLA-0001 | Encoding 04 |
| ISLA-0005 | ISLA-0002 | ISLA-0002 | audit excerpt |
| ISLA-0006 | ISLA-0002 | ISLA-0003 | fr |
| ISLA-0007 | ISLA-0003 | ISLA-0001 | Encoding 07 |
| ISLA-0008 | ISLA-0003 | ISLA-0002 | pre-release note |

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

The Dempster evidence facts layer operationalizes uncertainty quantification across the doctrinal taxonomy. Each evidence record, identified by codes such as EVID-0001 through EVID-0004, carries a confidence coefficient ranging from 0.014 to 0.728 and an uncertainty magnitude spanning from 9.49 to 687.80, alongside a measured value that may represent a quantitative assessment of doctrinal alignment or evidentiary weight. These facts reference a dimension table that categorizes each Dempster entry by label and category—Dempster Label 01 through Dempster Label 04 mapped to their respective Dempster Category designations—providing a controlled vocabulary for evidence classification. The dempster_key column establishes the linkage between individual evidence facts and their categorical parent, enabling aggregation of confidence measures across related doctrinal assessments. This structure supports the application of Dempster's rule of combination for fusing multiple independent evidence sources, a critical capability when evaluating contested theological positions where expert assessments may diverge substantially.

**fact_dempster**

| id | dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVID-0001 | EVID-0007 | 0.153 | 9.49 | 520.46 |
| EVID-0002 | EVID-0003 | 0.014 | 392.06 | 137.18 |
| EVID-0003 | EVID-0004 | 0.025 | 687.80 | 197.61 |
| EVID-0004 | EVID-0007 | 0.728 | 479.57 | 846.10 |
| EVID-0005 | EVID-0005 | 0.918 | 172.36 | 296.96 |
| EVID-0006 | EVID-0006 | 0.755 | 608.06 | 341.51 |

The regional dimension mirrors the Dempster evidence structure but operates at the geopolitical level, capturing how doctrinal positions manifest across different Islamic political contexts. Regional evidence facts, identified by codes BENC-0001 through BENC-0004, carry their own confidence and uncertainty metrics—confidence values such as 0.036, 0.601, 0.818, and 0.286 paired with uncertainty measures from 253.71 to 762.47—alongside quantitative values that may represent regional alignment scores or policy impact estimates. The regional_key column links each evidence fact to its corresponding regional dimension entry, which provides a label and category classification (Regional Label 01 through Regional Label 04 and their associated Regional Category designations). This parallel structure allows analysts to compare confidence levels across doctrinal and regional evidence streams, identifying where regional assessments converge or diverge from doctrinal classifications.

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |

The integration of these dimensions serves a specific analytical purpose: distinguishing between Islamic theological traditions that explicitly reject political engagement and those that embed political imperatives within their doctrinal frameworks. The Turkish Diyanet model, for instance, appears across multiple evidence entries with varying confidence levels, suggesting that its classification as an apolitical paradigm carries substantial but not unanimous expert agreement. Similarly, the Iranian Hawza quietism model is associated with the concept of worldly detachment, a doctrinal narrative that provides theological grounding for non-participation in political governance. The political Islam stances—ranging from theocratic state proposal to Islamist governance theory—serve as counterpoints, enabling systematic comparison between traditions that seek to separate religious authority from state power and those that explicitly fuse the two. The confidence and uncertainty metrics attached to each assessment provide a quantitative basis for weighing competing interpretations, supporting governance decisions that require defensible evidence thresholds.