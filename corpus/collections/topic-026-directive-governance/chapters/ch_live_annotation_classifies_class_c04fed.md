---
chapter_id: ch_live_annotation_classifies_class_c04fed
topic_id: 26
family: 02_observation_measurement
cited_terms: ['annotation_classifies_class', 'control_observed_via', 'mass_function_basic']
model: engine-refine
---

In any structured governance or quality-management system, the identifier serves as the immutable anchor for every record, ensuring that each entity can be referenced unambiguously across the entire data fabric. Whether tracking a classification such as CLAS-0001, a control observation like VIA-0001, or a mass function entry designated FUNC-0001, the identifier provides the single point of truth that joins disparate tables and supports auditability. Without stable identifiers, the relationships that underpin classification hierarchies, control-to-observer mappings, and measurement records would collapse into ambiguity, making it impossible to trace a decision back to its source or to reproduce an analysis.

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

Classification and categorization form the semantic backbone of such systems, organizing observations into meaningful groups that drive downstream policy and reporting. The classifies dimension assigns each annotation a label—Classifies Label 01 through Classifies Label 04—and a broader category such as Classifies Category 01 or Classifies Category 02, enabling aggregation and filtering at multiple levels of granularity. An annotation keyed to CLAS-0001, for instance, inherits the semantic context of its associated label and category, which in turn determines how it is treated in compliance workflows. The classifies relationship is not merely descriptive; it governs which controls apply, which reviewers are authorized, and which thresholds trigger escalation.

**dim_classifies**

| id | classifies_label | classifies_category |
| --- | --- | --- |
| CLAS-0001 | Classifies Label 01 | Classifies Category 01 |
| CLAS-0002 | Classifies Label 02 | Classifies Category 02 |
| CLAS-0003 | Classifies Label 03 | Classifies Category 03 |
| CLAS-0004 | Classifies Label 04 | Classifies Category 04 |
| CLAS-0005 | Classifies Label 05 | Classifies Category 05 |
| CLAS-0006 | Classifies Label 06 | Classifies Category 06 |

Confidence and uncertainty quantify the reliability of each annotation, providing a dual lens through which operators can assess risk. Confidence scores such as 0.845 for CLAS-0001 signal strong agreement or high-quality evidence, whereas a score of 0.236 for CLAS-0002 indicates substantial doubt and warrants closer scrutiny. Uncertainty values—measured in units ranging from 22.02 for CLAS-0004 to 690.59 for CLAS-0001—complement confidence by expressing the absolute dispersion or error bound around each measurement. Together, these metrics allow a governance framework to triage annotations: high-confidence, low-uncertainty records can be acted upon directly, while low-confidence, high-uncertainty entries require manual review or additional data collection. The misc value column, holding figures such as 979.94 or 284.47, captures auxiliary measurements that may inform downstream calculations but do not directly affect the confidence-uncertainty assessment.

**fact_annotation**

| id | classifies_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 0.845 | 690.59 | 979.94 |
| CLAS-0002 | CLAS-0006 | 0.236 | 593.98 | 370.63 |
| CLAS-0003 | CLAS-0001 | 0.271 | 104.01 | 360.27 |
| CLAS-0004 | CLAS-0002 | 0.303 | 22.02 | 284.47 |
| CLAS-0005 | CLAS-0005 | 0.002 | 328.54 | 25.47 |

The method and encoding dimensions describe how data is produced and stored, which is critical for reproducibility and interoperability. Mass functions such as Filter cake, Effluent mass, Target mass, and Total solids are captured using either automated or manual methods, each carrying different implications for accuracy and audit trail completeness. Automated entries reduce human error and enable real-time monitoring, while manual entries may be necessary for complex judgments that systems cannot yet replicate. Encoding formats—ascii and latin1—ensure that textual data remains portable across systems and regions, preventing character-set corruption when records move between platforms. These technical choices are not incidental; they directly affect the integrity of the confidence and uncertainty metrics that depend on them.

**t_mass_function_basic**

| id | mass | method | encoding |
| --- | --- | --- | --- |
| FUNC-0001 | Filter cake | automated | ascii |
| FUNC-0002 | Effluent mass | manual | latin1 |
| FUNC-0003 | Target mass | automated | latin1 |
| FUNC-0004 | Total solids | manual | ascii |
| FUNC-0005 | Effluent mass | hybrid | latin1 |
| FUNC-0006 | Feedstock mass | automated | latin1 |

Finally, the role, subject, and target triad governs the operational relationships between controls and the mechanisms that observe or validate them. The junction table linking controls to observation methods assigns each pairing a role—observer, reviewer, or owner—that defines the authority and responsibility of the relationship. A control such as Quality Gate Checkpoint may be observed by an Audit Log Aggregator with the observer role, meaning the system passively records events without making judgments. The same control, when paired with a Quality Check Pipeline under a reviewer role, implies active evaluation and potential intervention. The subject column identifies the control being observed, while the target column identifies the observation mechanism, creating a clear directional relationship that supports accountability and traceability. This structure ensures that every control has a defined validation path, every observation has an assigned authority, and every action can be traced to a responsible party.

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