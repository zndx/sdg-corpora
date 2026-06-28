---
chapter_id: ch_live_agent_acts_on_behalf_of_fa8e23
topic_id: 40
family: 05_provo_lineage
cited_terms: ['agent_acts_on_behalf_of', 'constraint_min_one_check', 'outlier_detection_uses_explainer']
model: engine-refine
---

The governance of data operations rests upon a layered architecture of identifiers, roles, and constraints that together establish accountability, enforce quality thresholds, and capture operational anomalies. At the foundation, each agent—whether an AuditLogger, LogAggregator, ProvenanceTracker, or ETLBatchScheduler—is assigned a unique identifier such as BEHA-0001 or BEHA-0003, which serves as the immutable key through which all subsequent relationships are resolved. These identifiers do not exist in isolation; they participate in a many-to-many delegation model wherein an agent acts on behalf of another entity, and the nature of that delegation is captured through a role designation. The role field distinguishes between observer, contributor, owner, and reviewer, each carrying distinct permissions and audit implications. For instance, the ProvenanceTracker (BEHA-0003) acts as an owner when operating on behalf of the AnalyticsDivision, while the same agent functions as a reviewer when acting on behalf of the SecurityOperations entity. The subject and target columns in the junction table formalize this relationship: the subject identifies the acting agent, and the target identifies the entity on whose behalf the action is taken, creating a traceable chain of delegated authority that can be audited retrospectively.

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | AuditLogger |
| BEHA-0002 | LogAggregator |
| BEHA-0003 | ProvenanceTracker |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | ReconciliationBot |
| BEHA-0006 | ETLBatchScheduler |

**t_agent_acts_on_behalf_of_acted_on_behalf_of**

| id | acted_on_behalf_of |
| --- | --- |
| BEHA-0001 | DataGovernanceBoard |
| BEHA-0002 | DataGovernanceBoard |
| BEHA-0003 | AnalyticsDivision |
| BEHA-0004 | SecurityOperations |
| BEHA-0005 | ComplianceAudit |
| BEHA-0006 | SecurityOperations |

**t_agent_acts_on_behalf_of__acted_on_behalf_of**

| id | agent_id | acted_on_behalf_of_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0005 | BEHA-0003 | observer |
| BEHA-0002 | BEHA-0001 | BEHA-0006 | contributor |
| BEHA-0003 | BEHA-0003 | BEHA-0001 | owner |
| BEHA-0004 | BEHA-0006 | BEHA-0005 | reviewer |
| BEHA-0005 | BEHA-0003 | BEHA-0002 | observer |
| BEHA-0006 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0007 | BEHA-0005 | BEHA-0001 | contributor |
| BEHA-0008 | BEHA-0006 | BEHA-0006 | owner |

Operational integrity is further maintained through a constraint-checking framework that binds validation rules to specific temporal and organizational boundaries. Each constraint—whether a Unique Index, a Latency Limit, a Primary Key Rule, or a Range Validation—is associated with a concrete implementation such as the Great Expectations Suite, a Kafka Validator, a Pydantic Model, or an Apache Griffin Job, and is activated on a defined effective_date. The scope column determines the breadth of enforcement, distinguishing between team-level, local, and regional applicability. The constraint CHEC-0002, for example, enforces a Latency Limit via a Kafka Validator with team-level scope as of 2023-05-17, whereas CHEC-0003 applies a Primary Key Rule through a Pydantic Model at the local level, with an effective_date of 2025-03-18, indicating a future-dated policy change. This temporal dimension ensures that constraint enforcement can be versioned and rolled out incrementally across organizational units without disrupting existing pipelines.

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Unique Index | Great Expectations Suite | 2023-05-21 | team |
| CHEC-0002 | Latency Limit | Kafka Validator | 2023-05-17 | team |
| CHEC-0003 | Primary Key Rule | Pydantic Model | 2025-03-18 | local |
| CHEC-0004 | Range Validation | Apache Griffin Job | 2023-05-11 | regional |

When operations deviate from expected parameters, outlier records capture the full spectrum of failure characteristics, linking each anomaly to a specific use case and quantifying its severity through duration, exit code, and retry metrics. The fact_outlier table records four distinct outlier events—EXPL-0001 through EXPL-0004—each associated with a uses_key that references a particular operational use case. The duration_seconds field measures the elapsed time of the anomalous execution, ranging from 1182.39 seconds for EXPL-0004 to 6466.78 seconds for EXPL-0002, while the exit_code field encodes the termination reason, with values such as 760, 4, 490, and 124 indicating distinct failure modes. The retry_count field quantifies the number of recovery attempts, with EXPL-0004 recording 308 retries and EXPL-0003 recording 101, providing a direct measure of operational resilience under stress. These outlier records are not merely diagnostic; they feed into capacity planning and SLA compliance assessments by establishing empirical baselines for execution duration and failure frequency.

**fact_outlier**

| id | uses_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| EXPL-0001 | EXPL-0003 | 3360.34 | 760 | 293 |
| EXPL-0002 | EXPL-0003 | 6466.78 | 4 | 225 |
| EXPL-0003 | EXPL-0002 | 5282.09 | 490 | 101 |
| EXPL-0004 | EXPL-0005 | 1182.39 | 124 | 308 |
| EXPL-0005 | EXPL-0002 | 3041.72 | 808 | 59 |
| EXPL-0006 | EXPL-0004 | 3852.38 | 619 | 489 |
| EXPL-0007 | EXPL-0002 | 1453.07 | 682 | 1 |

The uses dimension provides the categorical context that ties outlier events to their operational purpose. Each use is identified by a unique identifier and classified by a uses_category—such as Uses Category 01 through Uses Category 04—while a uses_label, stored in the misc column, offers a human-readable designation like Uses Label 01 or Uses Label 03. This separation between machine-readable categorization and human-readable labeling supports both automated aggregation and manual review. The uses_key in the fact_outlier table references these dimension records, enabling analysts to filter outlier events by category and identify whether certain use cases exhibit systematically higher retry counts or longer durations. In practice, this means that an operations team can determine whether the 6466.78-second execution recorded in EXPL-0002 is an isolated incident or part of a pattern within Uses Category 02, and whether the 308 retries in EXPL-0004 suggest a systemic issue requiring architectural intervention rather than a transient fault.

**dim_uses**

| id | uses_label | uses_category |
| --- | --- | --- |
| EXPL-0001 | Uses Label 01 | Uses Category 01 |
| EXPL-0002 | Uses Label 02 | Uses Category 02 |
| EXPL-0003 | Uses Label 03 | Uses Category 03 |
| EXPL-0004 | Uses Label 04 | Uses Category 04 |
| EXPL-0005 | Uses Label 05 | Uses Category 05 |
| EXPL-0006 | Uses Label 06 | Uses Category 06 |