---
chapter_id: ch_live_annotation_governed_by_classification_policy_59345c
topic_id: 159
family: 02_observation_measurement
cited_terms: ['annotation_governed_by_classification_policy', 'kernelhook_with_attached_program', 'control_observed_via']
model: engine-refine
---

In governance frameworks that track system-level interventions, annotations serve as the primary mechanism for recording policy decisions, audit findings, and operational observations against specific kernel hooks or attached programs. Each annotation is uniquely identified—values such as POLI-0001 through POLI-0004 anchor the record—and is classified by a categorical label (Annotation Category 01, Annotation Category 02, and so forth) that enables grouping and reporting. The annotation key itself references the target of the annotation, creating a cross-reference to the entity being evaluated. Crucially, every annotation carries a confidence score and an associated uncertainty metric: confidence values range from 0.236 to 0.845, reflecting the assessor's degree of certainty in the annotation's accuracy, while uncertainty values—measured in the hundreds, such as 690.59 or 22.02—quantify the margin of error or variability inherent in the observation. These paired metrics allow auditors to weight annotations appropriately during review, distinguishing high-confidence findings from those requiring further investigation.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| POLI-0001 | POLI-0005 | 0.845 | 690.59 | 979.94 |
| POLI-0002 | POLI-0003 | 0.236 | 593.98 | 370.63 |
| POLI-0003 | POLI-0004 | 0.271 | 104.01 | 360.27 |
| POLI-0004 | POLI-0001 | 0.303 | 22.02 | 284.47 |
| POLI-0005 | POLI-0003 | 0.002 | 328.54 | 25.47 |

Attached programs represent the executable or functional components subject to annotation and control. Each attached program is cataloged with a distinct identifier (PROG-0001 through PROG-0004), a human-readable label, and a category classification that supports hierarchical reporting. The physical footprint of these programs varies considerably: size bytes values span from approximately 27 million bytes (272,822,846 for PROG-0004) to over 560 million bytes (560,962,979 for PROG-0002), a range that directly impacts deployment considerations, memory allocation, and performance profiling. Version numbers—ranging from 1 to 10—track the evolution of each attached program, enabling traceability across releases and supporting rollback or compatibility assessments when annotations flag issues in specific versions.

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| POLI-0001 | Annotation Label 01 | Annotation Category 01 |
| POLI-0002 | Annotation Label 02 | Annotation Category 02 |
| POLI-0003 | Annotation Label 03 | Annotation Category 03 |
| POLI-0004 | Annotation Label 04 | Annotation Category 04 |
| POLI-0005 | Annotation Label 05 | Annotation Category 05 |
| POLI-0006 | Annotation Label 06 | Annotation Category 06 |

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |

**t_control_observed_via**

| id | control |
| --- | --- |
| VIA-0001 | Quality Gate Checkpoint |
| VIA-0002 | Validation Workflow Definition |
| VIA-0003 | Quality Gate Checkpoint |
| VIA-0004 | Quality Gate Checkpoint |
| VIA-0005 | Reference Monitoring Threshold |
| VIA-0006 | Baseline Calibration Protocol |

**t_control_observed_via_observed_via**

| id | observed_via |
| --- | --- |
| VIA-0001 | Audit Log Aggregator |
| VIA-0002 | Quality Check Pipeline |
| VIA-0003 | Audit Log Aggregator |
| VIA-0004 | Audit Log Aggregator |
| VIA-0005 | Reference Monitor Service |
| VIA-0006 | Trace Collector Daemon |

The relationship between controls and their observation mechanisms is captured through a tripartite structure that distinguishes the control itself, the observation channel, and the role each party plays. Controls such as "Quality Gate Checkpoint" and "Validation Workflow Definition" are linked to observation methods like "Audit Log Aggregator" and "Quality Check Pipeline" through a junction table that assigns a role—observer, reviewer, or owner—to each pairing. The subject column identifies the control being observed (VIA-0001, VIA-0004, VIA-0006, VIA-0005), while the target column identifies the observation mechanism (VIA-0003, VIA-0004, VIA-0005). This separation of subject and target, mediated by role, ensures that accountability is explicit: an observer may collect evidence, a reviewer may validate it, and an owner may be responsible for remediation, with each role carrying distinct governance obligations.

**t_control_observed_via__observed_via**

| id | control_id | observed_via_id | role |
| --- | --- | --- | --- |
| VIA-0001 | VIA-0001 | VIA-0004 | observer |
| VIA-0002 | VIA-0004 | VIA-0004 | reviewer |
| VIA-0003 | VIA-0006 | VIA-0005 | owner |
| VIA-0004 | VIA-0005 | VIA-0003 | reviewer |
| VIA-0005 | VIA-0005 | VIA-0006 | reviewer |
| VIA-0006 | VIA-0005 | VIA-0002 | owner |
| VIA-0007 | VIA-0003 | VIA-0003 | contributor |
| VIA-0008 | VIA-0004 | VIA-0003 | contributor |

Together, these structures form a traceable chain from policy intent to operational reality. An annotation (POLI-0001) with high confidence (0.845) and low uncertainty (22.02) might be attached to a kernel hook referencing a specific attached program (PROG-0001), which in turn is governed by a control (VIA-0001) observed through a defined mechanism (VIA-0004) by a party acting in the role of reviewer. The dimension tables for annotations and attached programs provide the categorical context—labels and categories—that enable aggregation and trend analysis across thousands of such records. Confidence and uncertainty metrics, when correlated with version numbers and size metrics, allow compliance teams to identify patterns: for instance, whether newer versions of a program consistently receive lower-confidence annotations, or whether larger programs attract higher uncertainty values that signal measurement difficulty rather than actual risk.