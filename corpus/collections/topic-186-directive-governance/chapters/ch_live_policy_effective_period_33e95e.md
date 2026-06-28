---
chapter_id: ch_live_policy_effective_period_33e95e
topic_id: 186
family: 01_foundation
cited_terms: ['policy_effective_period', 'allocation_with_run_status', 'mass_function_normalized_form']
model: engine-refine
---

Identifiers serve as the immutable anchors of any governance or operational system, providing stable references that survive changes in context, ownership, or state. A policy record such as PERI-0001 for the HIPAA Privacy Rule or PERI-0003 for PCI DSS v4.0 remains addressable regardless of when it takes effect or which language it is rendered in. Similarly, allocation identifiers like STAT-0001 for a kafka-consumer-group or STAT-0004 for gpu-cluster-alpha, and mass-form identifiers such as FORM-0001 for a Silicon-28 isotope or FORM-0004 for a Platinum-195 trace, all share this property: they are the primary keys that other tables reference, ensuring that relationships can be resolved without ambiguity. Without such identifiers, the system would lack the ability to track entities across time, correlate related records, or enforce referential integrity.

Language and scope define the contextual boundaries within which an entity operates, and they are typically stored as attributes of the entity itself rather than as relationships. A policy effective during Q4 2022 may be expressed in Spanish (es) and scoped to a local jurisdiction, while the same policy period rendered in French (fr) under PCI DSS v4.0 carries a global scope. These two dimensions—language and scope—answer fundamentally different questions: language determines the human-readable form of the content, while scope determines the geographic, organizational, or operational reach of the rule. A team-scoped NIST SP 800-53 policy and a local-scoped HIPAA Privacy Rule may both be effective in the same quarter, yet their applicability differs entirely because scope constrains where and to whom the policy applies.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | Q4 2022 | local | es |
| PERI-0002 | GDPR Compliance | Q3 2023 | local | es |
| PERI-0003 | PCI DSS v4.0 | Q1 2025 | global | fr |
| PERI-0004 | NIST SP 800-53 | Q4 2022 | team | es |
| PERI-0005 | CCPA Data Rights | Q4 2025 | team | es |

Subject and target represent the paired endpoints of a relationship, and their distinction is essential for modeling many-to-many associations. In an allocation-to-run-status mapping, the allocation (subject) is the resource being evaluated—kafka-consumer-group or vault-secret-rotate—while the run_status (target) is the state or outcome being attributed to it, such as timeout-expired, disconnected-drift, or succeeded-final. The relationship itself is captured in a junction table where each row carries its own identifier (e.g., STAT-0001 linking allocation STAT-0001 to run_status STAT-0006) and a role that qualifies the nature of the association. The same pattern appears in mass-function normalization: a Platinum-195 trace (subject) is linked to an ISO 17025 baseline (target) through a relationship row that assigns the role of reviewer, indicating that the reviewer is the party responsible for validating that the mass measurement conforms to the specified standard.

**t_mass_function_normalized_form**

| id | mass |
| --- | --- |
| FORM-0001 | Silicon-28 isotope |
| FORM-0002 | Tungsten calibration |
| FORM-0003 | Copper-63 signal |
| FORM-0004 | Platinum-195 trace |
| FORM-0005 | Copper-63 signal |
| FORM-0006 | Carbon-13 baseline |
| FORM-0007 | Copper-63 signal |
| FORM-0008 | Carbon-13 baseline |

**t_mass_function_normalized_form_normalized_form**

| id | normalized_form |
| --- | --- |
| FORM-0001 | ISO 17025 baseline |
| FORM-0002 | NRC traceable standard |
| FORM-0003 | WHO certified control |
| FORM-0004 | BIPM pilot scale |
| FORM-0005 | BIPM pilot scale |
| FORM-0006 | NRC traceable standard |
| FORM-0007 | ISO 17025 baseline |
| FORM-0008 | OIML R111 class |

**t_mass_function_normalized_form__normalized_form**

| id | mass_id | normalized_form_id | role |
| --- | --- | --- | --- |
| FORM-0001 | FORM-0004 | FORM-0004 | observer |
| FORM-0002 | FORM-0007 | FORM-0007 | owner |
| FORM-0003 | FORM-0006 | FORM-0008 | reviewer |
| FORM-0004 | FORM-0008 | FORM-0001 | reviewer |
| FORM-0005 | FORM-0006 | FORM-0006 | contributor |
| FORM-0006 | FORM-0003 | FORM-0006 | reviewer |
| FORM-0007 | FORM-0003 | FORM-0006 | observer |
| FORM-0008 | FORM-0008 | FORM-0008 | reviewer |

Role is the attribute that qualifies a relationship, specifying the capacity in which the subject interacts with the target. In the allocation-status junction, the same allocation STAT-0001 can appear in multiple relationship rows with different roles—one as a contributor paired with run_status STAT-0005, and another as a reviewer paired with run_status STAT-0006—demonstrating that role is not a property of the subject or target individually but of the association between them. In the mass-function domain, roles such as owner, reviewer, and observer distinguish whether a party has decision authority (owner), verification responsibility (reviewer), or informational access (observer) over the normalization relationship. This separation of role from both subject and target enables fine-grained access control and auditability: the system can answer not just which allocations have which statuses, but who is accountable for each pairing.

In practice, these six concepts—identifier, language, role, scope, subject, and target—form a minimal vocabulary for describing how entities relate to one another and to the people and rules that govern them. Identifiers provide the stable references; language and scope constrain applicability; subject and target define the relationship endpoints; and role qualifies the nature of the association. A compliance framework that tracks HIPAA Privacy Rule (PERI-0001) in Spanish with local scope, an allocation (STAT-0001) with a succeeded-final status, and a reviewer role assigned to that pairing, is using all six concepts simultaneously to answer the question of who is responsible for what, under which rules, in which language, and to whom those rules apply.

**t_allocation_with_run_status**

| id | allocation |
| --- | --- |
| STAT-0001 | kafka-consumer-group |
| STAT-0002 | kafka-consumer-group |
| STAT-0003 | vault-secret-rotate |
| STAT-0004 | gpu-cluster-alpha |
| STAT-0005 | gpu-cluster-alpha |
| STAT-0006 | batch-etl-nightly |

**t_allocation_with_run_status_run_status**

| id | run_status |
| --- | --- |
| STAT-0001 | timeout-expired |
| STAT-0002 | disconnected-drift |
| STAT-0003 | succeeded-final |
| STAT-0004 | succeeded-final |
| STAT-0005 | succeeded-final |
| STAT-0006 | retrying-backoff |

**t_allocation_with_run_status__run_status**

| id | allocation_id | run_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0006 | reviewer |
| STAT-0002 | STAT-0006 | STAT-0004 | observer |
| STAT-0003 | STAT-0004 | STAT-0002 | contributor |
| STAT-0004 | STAT-0001 | STAT-0005 | contributor |
| STAT-0005 | STAT-0006 | STAT-0001 | observer |
| STAT-0006 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0007 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0008 | STAT-0005 | STAT-0006 | observer |