---
chapter_id: ch_live_pdsa_improvement_model_f638a3
topic_id: 60
family: 08_derived
cited_terms: ['pdsa_improvement_model', 'outlier_detection_with_baseline', 'annotation_governed_by_classification_policy']
model: engine-refine
---

The PDSA improvement model framework structures clinical quality initiatives through a tripartite schema that separates model definitions from their operational effects and governance assignments. The core model table anchors each initiative with a machine-readable identifier—MODE-0001 through MODE-0004—and a human-readable designation such as Opioid-Taper-Init, Insulin-Protocol-Opt, Sepsis-Protocol-V2, and Bedside-Handoff-Rev. These identifiers serve as the primary key for all downstream relationships, ensuring that every improvement effort can be traced through its intended clinical care targets, optimized patient outcomes, and the personnel responsible for execution. The separation of model metadata from its relational effects mirrors the broader data warehousing principle that entity definitions must remain decoupled from the many-to-many associations that describe how those entities interact with the clinical environment.

**t_pdsa_improvement_model**

| id | p_d_s_a_improvement_model |
| --- | --- |
| MODE-0001 | Opioid-Taper-Init |
| MODE-0002 | Insulin-Protocol-Opt |
| MODE-0003 | Sepsis-Protocol-V2 |
| MODE-0004 | Bedside-Handoff-Rev |
| MODE-0005 | Fall-Prevention-Q4 |
| MODE-0006 | Bedside-Handoff-Rev |

**t_pdsa_improvement_model_improves**

| id | improves |
| --- | --- |
| MODE-0001 | Wound-Care-Standard |
| MODE-0002 | Wound-Care-Standard |
| MODE-0003 | Hand-Hygiene-Protocol |
| MODE-0004 | Wound-Care-Standard |
| MODE-0005 | Medication-Reconciliation |
| MODE-0006 | Ventilator-Management |
| MODE-0007 | Ventilator-Management |
| MODE-0008 | Wound-Care-Standard |

**t_pdsa_improvement_model_optimizes**

| id | optimizes |
| --- | --- |
| MODE-0001 | Pain-Management-Score |
| MODE-0002 | Complication-Rate |
| MODE-0003 | Adverse-Event-Frequency |
| MODE-0004 | Functional-Recovery-Time |
| MODE-0005 | LOS-Reduction |
| MODE-0006 | Complication-Rate |

Clinical care improvements and patient outcomes are captured through parallel fact tables that each establish a direct link between a PDSA model and a specific target. The improvement table records which clinical care standard a model advances—Wound-Care-Standard appears across MODE-0001, MODE-0002, and MODE-0004, while Hand-Hygiene-Protocol is associated with MODE-0003—demonstrating that a single clinical standard may be the focus of multiple concurrent improvement initiatives. The optimization table maps models to measurable patient outcomes, including Pain-Management-Score, Complication-Rate, Adverse-Event-Frequency, and Functional-Recovery-Time, each representing a quantifiable dimension of care quality that the PDSA cycle is designed to influence. These two fact tables operate independently: a model may improve a clinical care standard without directly optimizing a patient outcome, and vice versa, reflecting the reality that process improvements and outcome improvements do not always align one-to-one.

The junction tables introduce a layer of relational governance that captures not only which entities are connected but also the nature of the connection and its structural constraints. The improvement junction table links a PDSA model (subject) to a clinical care improvement (target) and assigns a role—reviewer, contributor, or owner—to the relationship, thereby encoding accountability into the data model itself. Similarly, the optimization junction table connects PDSA models to patient outcomes with role assignments of reviewer, owner, or contributor, and additionally carries a cardinality note field that documents the structural constraints of the relationship. Cardinality Note 01 through Cardinality Note 04 provide contextual metadata about whether the relationship is one-to-one, one-to-many, or subject to other multiplicity constraints, ensuring that analytical queries can respect the intended semantics of each association rather than treating all links as structurally equivalent.

**t_pdsa_improvement_model__improves**

| id | pdsa_id | improves_id | role |
| --- | --- | --- | --- |
| MODE-0001 | MODE-0001 | MODE-0005 | reviewer |
| MODE-0002 | MODE-0001 | MODE-0006 | contributor |
| MODE-0003 | MODE-0004 | MODE-0003 | contributor |
| MODE-0004 | MODE-0005 | MODE-0004 | owner |
| MODE-0005 | MODE-0003 | MODE-0005 | contributor |
| MODE-0006 | MODE-0003 | MODE-0002 | owner |
| MODE-0007 | MODE-0001 | MODE-0008 | owner |
| MODE-0008 | MODE-0001 | MODE-0008 | observer |

**t_pdsa_improvement_model__optimizes**

| id | pdsa_id | optimizes_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| MODE-0001 | MODE-0005 | MODE-0005 | reviewer | Cardinality Note 01 |
| MODE-0002 | MODE-0001 | MODE-0004 | owner | Cardinality Note 02 |
| MODE-0003 | MODE-0003 | MODE-0001 | contributor | Cardinality Note 03 |
| MODE-0004 | MODE-0005 | MODE-0004 | owner | Cardinality Note 04 |
| MODE-0005 | MODE-0005 | MODE-0003 | contributor | Cardinality Note 05 |
| MODE-0006 | MODE-0005 | MODE-0004 | observer | Cardinality Note 06 |
| MODE-0007 | MODE-0005 | MODE-0006 | owner | Cardinality Note 07 |
| MODE-0008 | MODE-0006 | MODE-0004 | reviewer | Cardinality Note 08 |

Outlier detection with baseline follows an analogous relational pattern, establishing a parallel framework for monitoring the performance of improvement initiatives. The outlier table records detected anomalies—network latency jump, log flood, and sensor drift—each identified by a BASE-0001 through BASE-0004 key. The against table specifies the reference against which each outlier is evaluated: expected distribution, nominal profile, or seasonal pattern. The junction table then binds an outlier (subject) to its baseline reference (target) with a role designation of observer or owner, creating a complete audit trail that answers not only what anomaly was detected and against what standard, but also who is responsible for monitoring and responding to it. This three-table structure ensures that outlier detection is not merely a binary flag but a fully contextualized event with provenance, reference, and accountability.

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

The annotation subsystem operates as a dimensional model that separates annotation metadata from measured values, enabling flexible categorization and confidence assessment. The dimension table assigns each annotation a label—Annotation Label 01 through Annotation Label 04—and a category—Annotation Category 01 through Annotation Category 04—providing the organizational taxonomy through which annotations are classified and retrieved. The fact table records the actual annotation events, linking each to an annotation key that references the dimension, and capturing a confidence score alongside an uncertainty value and a measured value. Confidence scores range from 0.236 to 0.845, reflecting varying degrees of certainty in the annotation, while uncertainty values span from 22.02 to 690.59, providing a quantitative measure of the annotation's reliability. The measured values themselves—ranging from 284.47 to 979.94—represent the substantive content of the annotation, whether a clinical observation, a process metric, or an operational indicator. This separation of dimension and fact allows the same annotation category to be applied across multiple confidence levels and uncertainty ranges, supporting nuanced analysis of data quality and annotation reliability.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| POLI-0001 | POLI-0005 | 0.845 | 690.59 | 979.94 |
| POLI-0002 | POLI-0003 | 0.236 | 593.98 | 370.63 |
| POLI-0003 | POLI-0004 | 0.271 | 104.01 | 360.27 |
| POLI-0004 | POLI-0001 | 0.303 | 22.02 | 284.47 |
| POLI-0005 | POLI-0003 | 0.002 | 328.54 | 25.47 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| POLI-0001 | Annotation Label 01 | Annotation Category 01 |
| POLI-0002 | Annotation Label 02 | Annotation Category 02 |
| POLI-0003 | Annotation Label 03 | Annotation Category 03 |
| POLI-0004 | Annotation Label 04 | Annotation Category 04 |
| POLI-0005 | Annotation Label 05 | Annotation Category 05 |
| POLI-0006 | Annotation Label 06 | Annotation Category 06 |