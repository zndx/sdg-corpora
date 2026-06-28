---
chapter_id: ch_live_ebpfprogram_exactly_one_type_9ab640
topic_id: 2
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_exactly_one_type', 'control_with_evidence_requirement', 'labrun_has_operator']
model: engine-refine
---

The governance of automated execution environments rests upon a layered architecture of identifiers, roles, and enforcement mechanisms that together ensure traceability and accountability across every operational artifact. Each entity—whether an eBPF program, a compliance control, or a lab-run operator—is anchored by a unique identifier, such as TYPE-0001 through TYPE-0004 for program definitions, REQU-0001 through REQU-0004 for evidence requirements, and OPER-0001 through OPER-0004 for operator dimensions. These identifiers serve as the immutable keys through which relationships are established, constraints are enforced, and audit trails are constructed. The subject-target relationship model, exemplified by the junction table linking eBPF programs to program types, introduces a role attribute that distinguishes between ownership and observation: an entry may designate TYPE-0003 as the subject with TYPE-0002 as the target under an owner role, while another entry assigns TYPE-0005 as the subject with TYPE-0004 as the target under an observer role, thereby encoding not merely connectivity but the nature of the dependency itself.

**t_ebpfprogram_exactly_one_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | fentry_do_fork |
| TYPE-0002 | kprobe_sched_switch |
| TYPE-0003 | kprobe_sched_switch |
| TYPE-0004 | fentry_do_fork |
| TYPE-0005 | tc_ingress_filter |
| TYPE-0006 | tc_ingress_filter |

**t_ebpfprogram_exactly_one_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | kprobe |
| TYPE-0002 | kprobe |
| TYPE-0003 | kprobe |
| TYPE-0004 | socket_filter |
| TYPE-0005 | lsm |
| TYPE-0006 | kprobe |

**t_ebpfprogram_exactly_one_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0003 | TYPE-0005 | owner |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | observer |
| TYPE-0003 | TYPE-0004 | TYPE-0006 | owner |
| TYPE-0004 | TYPE-0003 | TYPE-0002 | owner |
| TYPE-0005 | TYPE-0006 | TYPE-0003 | owner |
| TYPE-0006 | TYPE-0006 | TYPE-0002 | reviewer |
| TYPE-0007 | TYPE-0004 | TYPE-0003 | owner |
| TYPE-0008 | TYPE-0005 | TYPE-0001 | observer |

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | ISO27001Certification | advisory | es |
| REQU-0003 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | ManagerApprovalEmail | mandatory | ja |

Compliance controls are defined through a structured set of attributes that specify what must be demonstrated, how it must be demonstrated, and with what authority. The control column identifies the policy domain—DataEncryptionAtRest and BaselineConfigurationCheck appear repeatedly across requirements—while the requires_evidence column enumerates the acceptable forms of proof, ranging from SystemAuditLog and ISO27001Certification to ManagerApprovalEmail. Enforcement levels assign the regulatory weight of each requirement: mandatory controls carry the highest obligation, advisory controls signal recommended practice, and deprecated controls indicate policies that have been superseded. The language column further localizes these requirements, with entries recorded in English (en), Spanish (es), and Japanese (ja), ensuring that compliance obligations are communicated in the appropriate linguistic context for the responsible parties.

Operational execution is captured through a fact table that records the performance characteristics of each lab run, linking back to operator dimensions through the operator_key foreign key. The duration_seconds column quantifies the elapsed time of each execution, with values such as 4856.18, 4308.22, 4764.89, and 5155.73 seconds reflecting the substantial computational effort involved. Exit codes—122, 691, 566, and 3—encode the termination status of each run, providing diagnostic information about whether execution completed successfully or encountered an error condition. The retry_count column, with values ranging from 12 to 265, reveals the resilience behavior of the system, indicating how many times a failed or interrupted operation was retried before reaching a final state. These metrics, when correlated with the operator dimension through the operator_key, enable performance analysis across categories and labels, supporting capacity planning and reliability assessments.

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

The operator dimension table provides the human-readable context for the identifiers used in operational facts, with operator_label columns carrying descriptive values such as Operator Label 01 through Operator Label 04, and operator_category columns assigning categorical groupings like Operator Category 01 through Operator Category 04. This separation of identity from description follows a standard dimensional modeling pattern, allowing the fact table to maintain referential integrity while the dimension table supports filtering, grouping, and reporting by organizational or functional categories. The misc column, though present in the dimension schema, serves as a catch-all for supplementary metadata that does not fit within the structured category or label fields.

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |

eBPF program definitions are themselves decomposed across multiple tables to support flexible type relationships. The program type table maps identifiers to specific eBPF program names—fentry_do_fork and kprobe_sched_switch appear as concrete program implementations—while the program type classification table assigns each identifier to a program type such as kprobe or socket_filter. This decomposition allows a single program to be associated with multiple types through the junction table, where the role attribute clarifies whether the relationship is one of ownership or observation. The resulting structure supports complex query patterns that can trace from a program name through its types, through its relationships, and ultimately to the operational facts that record its execution, creating a complete audit chain from definition to deployment to performance.