---
chapter_id: ch_live_policy_with_review_cycle_1766e8
topic_id: 2
family: 03_directive_governance
cited_terms: ['policy_with_review_cycle', 'control_with_evidence_requirement', 'appointment_scheduling_process']
model: engine-refine
---

Appointment scheduling processes constitute the operational backbone of clinical workflow governance, each process identified by a unique identifier such as PROC-0001 through PROC-0004 and designated by a process name like Appointment Scheduling Process 01 or Appointment Scheduling Process 02. These processes are not abstract constructs but are bound to specific receptionist agents—Operator 01, Operator 02, Operator 03, Operator 04—who execute the scheduling actions on behalf of the practice. The receptionist agent serves as the operational actor, and the relationship between a scheduling process and its assigned operator is mediated through a junction table that assigns a role to each pairing. In this capacity, an operator may be designated as owner, conferring full authority over the scheduling process, or as observer, granting visibility without modification rights. For instance, PROC-0001 is paired with PROC-0002 as operator under an owner role, while PROC-0004 assumes an observer role in its association with PROC-0007, illustrating how the same operator can hold different positional relationships depending on the appointment subject and target context.

**t_appointment_scheduling_process**

| id | appointment_scheduling_process |
| --- | --- |
| PROC-0001 | Appointment Scheduling Process 01 |
| PROC-0002 | Appointment Scheduling Process 02 |
| PROC-0003 | Appointment Scheduling Process 03 |
| PROC-0004 | Appointment Scheduling Process 04 |
| PROC-0005 | Appointment Scheduling Process 05 |
| PROC-0006 | Appointment Scheduling Process 06 |

**t_appointment_scheduling_process_operator**

| id | operator |
| --- | --- |
| PROC-0001 | Operator 01 |
| PROC-0002 | Operator 02 |
| PROC-0003 | Operator 03 |
| PROC-0004 | Operator 04 |
| PROC-0005 | Operator 05 |
| PROC-0006 | Operator 06 |
| PROC-0007 | Operator 07 |

**t_appointment_scheduling_process__operator**

| id | appointment_id | operator_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | owner |
| PROC-0002 | PROC-0006 | PROC-0004 | owner |
| PROC-0003 | PROC-0004 | PROC-0007 | observer |
| PROC-0004 | PROC-0001 | PROC-0004 | observer |
| PROC-0005 | PROC-0006 | PROC-0001 | contributor |
| PROC-0006 | PROC-0002 | PROC-0001 | reviewer |
| PROC-0007 | PROC-0002 | PROC-0005 | owner |
| PROC-0008 | PROC-0005 | PROC-0002 | reviewer |

The target of an appointment scheduling process is a patient appointment schedule, a discrete artifact that captures the structured output of the scheduling operation. Each process may reference one or more target artifacts—Targets Artifact 01 through Targets Artifact 04—through a dedicated linkage table that records not only the association but also the role the process plays with respect to that artifact and a cardinality note that constrains the multiplicity of the relationship. A process such as PROC-0001 may act as owner against target PROC-0006 with Cardinality Note 02, while PROC-0004 may serve as reviewer against PROC-0004 under Cardinality Note 03, and PROC-0006 may function as observer against PROC-0002 under Cardinality Note 04. The cardinality note is the mechanism by which the system enforces whether a scheduling process produces a single patient appointment schedule, may produce multiple, or is constrained to a specific subset of schedules, thereby preventing unbounded or ambiguous associations between scheduling operations and their scheduled outcomes.

**t_appointment_scheduling_process_targets_artifact**

| id | targets_artifact |
| --- | --- |
| PROC-0001 | Targets Artifact 01 |
| PROC-0002 | Targets Artifact 02 |
| PROC-0003 | Targets Artifact 03 |
| PROC-0004 | Targets Artifact 04 |
| PROC-0005 | Targets Artifact 05 |
| PROC-0006 | Targets Artifact 06 |

Governance of these processes is further reinforced by the policy and control frameworks that govern their execution. Policies such as FedRAMP, NIST SP 800-53, CCPA, and SOC 2 Type II are each assigned a review cycle—annual, fiscal-year, or semi-annual—and scoped to a particular organizational boundary, whether local, team, or regional. The language in which a policy is authored, whether Japanese (ja) or French (fr), determines the linguistic register in which compliance obligations are communicated to operators. Controls such as DataEncryptionAtRest and BaselineConfigurationCheck carry explicit evidence requirements—SystemAuditLog, ISO27001Certification, ManagerApprovalEmail—and are classified by their enforcement posture as mandatory, advisory, or deprecated. A control marked mandatory demands verifiable evidence at every audit cycle, whereas an advisory control signals a recommended practice without punitive consequence for non-compliance, and a deprecated control indicates a practice that has been superseded and should no longer be invoked in active scheduling processes.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | annual | local | ja |
| CYCL-0002 | NIST SP 800-53 | fiscal-year | team | ja |
| CYCL-0003 | CCPA | semi-annual | regional | fr |
| CYCL-0004 | SOC 2 Type II | fiscal-year | regional | ja |
| CYCL-0005 | GDPR | quarterly | global | ja |
| CYCL-0006 | FedRAMP | continuous | global | fr |
| CYCL-0007 | SOC 2 Type II | continuous | global | ja |
| CYCL-0008 | CCPA | monthly | local | ja |

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | ISO27001Certification | advisory | es |
| REQU-0003 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | ManagerApprovalEmail | mandatory | ja |

The interplay between scheduling processes, their operators, their target artifacts, and the governing policy-control matrix forms a coherent governance architecture. An identifier such as CYCL-0001 anchors a policy review cycle, while REQU-0001 anchors a control with its evidence and enforcement requirements. The subject of a scheduling-operator association is the appointment process itself, and the target is the operator or artifact to which the process is bound. The role—owner, reviewer, or observer—determines the degree of agency the subject exercises over the target. When a scheduling process is scoped to a regional boundary under a fiscal-year review cycle and governed by a mandatory control requiring SystemAuditLog evidence, the receptionist agent executing that process operates within a tightly constrained compliance envelope. The cardinality note on the process-to-artifact linkage ensures that the patient appointment schedule produced is neither under-specified nor over-provisioned, maintaining data integrity across the scheduling lifecycle.

**t_appointment_scheduling_process__targets_artifact**

| id | appointment_id | targets_artifact_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0004 | owner | Cardinality Note 01 |
| PROC-0002 | PROC-0001 | PROC-0006 | owner | Cardinality Note 02 |
| PROC-0003 | PROC-0004 | PROC-0004 | reviewer | Cardinality Note 03 |
| PROC-0004 | PROC-0006 | PROC-0002 | observer | Cardinality Note 04 |
| PROC-0005 | PROC-0001 | PROC-0005 | observer | Cardinality Note 05 |
| PROC-0006 | PROC-0005 | PROC-0002 | reviewer | Cardinality Note 06 |
| PROC-0007 | PROC-0004 | PROC-0003 | owner | Cardinality Note 07 |
| PROC-0008 | PROC-0005 | PROC-0006 | observer | Cardinality Note 08 |