---
chapter_id: ch_live_state_basic_d96602
topic_id: 19
family: 02_observation_measurement
cited_terms: ['state_basic', 'profile_basic', 'control_observed_via']
model: engine-refine
---

The governance framework rests upon a system of unique identifiers that anchor every observable entity and relationship within the compliance architecture. Each state is distinguished by an identifier such as STAT-0001 or STAT-0004, each profile by PROF-0001 through PROF-0006, and each control-observation linkage by VIA-0001 through VIA-0006. These identifiers serve as the immutable keys through which all downstream metrics, classifications, and accountability assignments are resolved. A state_key value like STAT-0005 may reference a state not enumerated in the primary dimension table, indicating that the fact table captures observed instances that extend beyond the canonical catalog of states. Similarly, the profile_key column in the fact profile table references profiles such as PROF-0003 and PROF-0006, some of which appear only as targets of observation rather than as subjects themselves. This decoupling of identifier from dimension ensures that the framework can record events and measurements for entities whose full metadata is maintained separately.

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |

**dim_profile**

| id | profile_label | profile_category |
| --- | --- | --- |
| PROF-0001 | Profile Label 01 | Profile Category 01 |
| PROF-0002 | Profile Label 02 | Profile Category 02 |
| PROF-0003 | Profile Label 03 | Profile Category 03 |
| PROF-0004 | Profile Label 04 | Profile Category 04 |
| PROF-0005 | Profile Label 05 | Profile Category 05 |
| PROF-0006 | Profile Label 06 | Profile Category 06 |
| PROF-0007 | Profile Label 07 | Profile Category 07 |

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

Every state and profile carries a categorical classification that groups related entities for aggregation and reporting. State categories such as State Category 01, State Category 02, and State Category 03 partition the state space into distinct domains of compliance concern, while profile categories including Profile Category 01 through Profile Category 04 perform the same function for behavioral or operational profiles. These categories are not merely labels; they determine how confidence and uncertainty metrics are interpreted across the framework. A confidence value of 0.994 recorded against profile PROF-0002 carries different governance implications than a confidence of 0.226 against PROF-0004, even though both are expressed on the same normalized scale. The categorical dimension provides the context necessary to calibrate thresholds, assign review priorities, and determine escalation paths when confidence falls below acceptable bounds.

Confidence and uncertainty form the dual metrics that quantify the reliability of every recorded observation. Confidence values range from near-zero to near-unity—0.012 for state STAT-0004 and 0.523 for STAT-0003 in one instance, 0.299 and 0.773 for profiles PROF-0001 and PROF-0003 in another—reflecting the varying degrees of assurance that the underlying measurement or assessment is accurate. Uncertainty values, expressed as absolute magnitudes such as 951.90, 416.12, and 622.09, provide the complementary measure of variance or error bounds associated with each observation. The value column, which holds measurements like 195.86, 619.50, and 728.94, represents the actual observed quantity, while the misc column carries auxiliary labels such as State Label 01 or Profile Label 03 that support human-readable reporting without affecting computational logic. Together, these four numeric and textual fields constitute the complete measurement record for each state and profile instance.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0005 | 0.299 | 284.36 | 728.94 |
| PROF-0002 | PROF-0005 | 0.994 | 557.92 | 380.57 |
| PROF-0003 | PROF-0003 | 0.773 | 622.09 | 607.36 |
| PROF-0004 | PROF-0006 | 0.226 | 488.10 | 448.09 |

The relationship between controls and their observation mechanisms is governed by a role-based assignment model that distinguishes subject from target. In the control-observation matrix, the subject column identifies the control being assessed—VIA-0001, VIA-0004, VIA-0005, or VIA-0006—while the target column identifies the mechanism through which the control is observed, such as VIA-0003, VIA-0004, or VIA-0005. The role column assigns one of three accountability positions: observer, reviewer, or owner. An observer, as recorded for VIA-0001, passively collects evidence through mechanisms like the Audit Log Aggregator. A reviewer, as assigned to VIA-0004 and VIA-0005, performs active validation against controls such as Quality Gate Checkpoint or Validation Workflow Definition. An owner, as designated for VIA-0006, bears ultimate responsibility for the control's effectiveness. This tripartite role structure ensures that no control-observation linkage exists without a clearly defined chain of accountability, and that the same observation mechanism—Audit Log Aggregator, for instance—can serve multiple controls under different roles without conflating responsibilities.