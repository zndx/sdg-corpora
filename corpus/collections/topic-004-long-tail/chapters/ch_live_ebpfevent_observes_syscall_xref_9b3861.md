---
chapter_id: ch_live_ebpfevent_observes_syscall_xref_9b3861
topic_id: 4
family: 04_ebpf_kernel
cited_terms: ['ebpfevent_observes_syscall_xref', 'control_subclass', 'ebpfprogram_verified_safe']
model: engine-refine
---

The governance of eBPF event execution and program verification rests upon a dimensional data model that separates measurable event telemetry from descriptive classification. The fact table for eBPF events records operational metrics including duration in seconds—values ranging from 889.87 to 5696.76 across observed executions—and exit codes such as 988, 313, 278, and 158, which encode the termination status of each event. The retry count column captures the number of re-attempts required for event processing, with observed values of 278, 427, 133, and 38, providing a direct signal of transient failure rates. Each fact row is identified by an identifier such as XREF-0001 through XREF-0004 and is linked to a dimension record via the ebpfevent key, which itself takes values like XREF-0003 and XREF-0005, establishing a many-to-one relationship between individual event executions and their canonical event definitions.

**fact_ebpfevent**

| id | ebpfevent_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| XREF-0001 | XREF-0003 | 889.87 | 988 | 278 |
| XREF-0002 | XREF-0005 | 1832.41 | 313 | 427 |
| XREF-0003 | XREF-0001 | 3410.73 | 278 | 133 |
| XREF-0004 | XREF-0005 | 5696.76 | 158 | 38 |
| XREF-0005 | XREF-0005 | 4846.66 | 7 | 455 |
| XREF-0006 | XREF-0004 | 4215.38 | 52 | 460 |
| XREF-0007 | XREF-0006 | 653.90 | 100 | 108 |
| XREF-0008 | XREF-0005 | 2673.38 | 169 | 73 |

The dimension table for eBPF events supplies the categorical and descriptive context that the fact table omits. Each dimension record carries an identifier, an ebpfevent label—designated as misc in the schema, with values such as Ebpfevent Label 01 through Ebpfevent Label 04—and an ebpfevent category, labeled as category, with corresponding values of Ebpfevent Category 01 through Ebpfevent Category 04. These two descriptive columns serve as the primary axes for aggregation and filtering: category enables grouping events by functional domain, while misc provides human-readable labels suitable for reporting and audit trails. The identifier column in both the fact and dimension tables acts as the join key, ensuring that every measured event execution can be traced back to its categorical classification without ambiguity.

**dim_ebpfevent**

| id | ebpfevent_label | ebpfevent_category |
| --- | --- | --- |
| XREF-0001 | Ebpfevent Label 01 | Ebpfevent Category 01 |
| XREF-0002 | Ebpfevent Label 02 | Ebpfevent Category 02 |
| XREF-0003 | Ebpfevent Label 03 | Ebpfevent Category 03 |
| XREF-0004 | Ebpfevent Label 04 | Ebpfevent Category 04 |
| XREF-0005 | Ebpfevent Label 05 | Ebpfevent Category 05 |
| XREF-0006 | Ebpfevent Label 06 | Ebpfevent Category 06 |

Beyond event telemetry, the model captures the control framework that governs eBPF program safety through a set of interrelated tables. The control subclass table defines individual security controls—MFA enforcement, Backup frequency policy, Access review cycle, TLS 1.3 mandatory—each identified by a CONT-prefixed identifier such as CONT-0001 through CONT-0004. A parallel table enumerates the threat categories these controls mitigate, including Service outage, Phishing attack, and Network intrusion. The relationship between controls and mitigations is materialized in a junction table that employs subject and target as foreign key columns: subject references the control identifier (e.g., CONT-0004), while target references the mitigation identifier (e.g., CONT-0007), and the role column assigns a functional relationship type—owner, reviewer, observer, or contributor—to each pairing. This three-column structure (subject, target, role) generalizes the control-to-mitigation mapping into a reusable pattern that can express any directed relationship with an associated responsibility designation.

**t_control_subclass**

| id | control |
| --- | --- |
| CONT-0001 | MFA enforcement |
| CONT-0002 | Backup frequency policy |
| CONT-0003 | Access review cycle |
| CONT-0004 | TLS 1.3 mandatory |
| CONT-0005 | Session timeout limit |
| CONT-0006 | Audit log retention |
| CONT-0007 | MFA enforcement |

**t_control_subclass_mitigates**

| id | mitigates |
| --- | --- |
| CONT-0001 | Service outage |
| CONT-0002 | Service outage |
| CONT-0003 | Phishing attack |
| CONT-0004 | Network intrusion |
| CONT-0005 | System downtime |
| CONT-0006 | Credential stuffing |
| CONT-0007 | Phishing attack |
| CONT-0008 | Data exfiltration |

**t_control_subclass__mitigates**

| id | control_id | mitigates_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0004 | CONT-0007 | owner |
| CONT-0002 | CONT-0004 | CONT-0002 | reviewer |
| CONT-0003 | CONT-0007 | CONT-0004 | observer |
| CONT-0004 | CONT-0001 | CONT-0002 | contributor |
| CONT-0005 | CONT-0006 | CONT-0002 | observer |
| CONT-0006 | CONT-0005 | CONT-0001 | owner |
| CONT-0007 | CONT-0001 | CONT-0002 | observer |
| CONT-0008 | CONT-0006 | CONT-0008 | observer |

A parallel structure governs the verification of eBPF programs against safety criteria. The verified-safe program table lists programs such as lsm_file_open, sock_ops_connect, perf_event_trace, and tc_police_ingress, each identified by a SAFE-prefixed identifier. The verification provider table records the tools or frameworks used to certify safety—libbpf, Kani_bpf, Z3_solver—and the junction table between them again uses subject and target as foreign key columns: subject references the program identifier (e.g., SAFE-0004), target references the verification provider identifier (e.g., SAFE-0002), and role assigns the relationship type (contributor, reviewer, owner). This mirrors the control-subclass junction pattern exactly, confirming that subject and role form a consistent relational idiom across the model for expressing directed, responsibility-bearing associations between entities.

**t_ebpfprogram_verified_safe**

| id | ebpfprogram |
| --- | --- |
| SAFE-0001 | lsm_file_open |
| SAFE-0002 | sock_ops_connect |
| SAFE-0003 | perf_event_trace |
| SAFE-0004 | tc_police_ingress |
| SAFE-0005 | xdp_router |
| SAFE-0006 | cgroup_skb_ingress |

**t_ebpfprogram_verified_safe_verified_safe_by**

| id | verified_safe_by |
| --- | --- |
| SAFE-0001 | libbpf |
| SAFE-0002 | Kani_bpf |
| SAFE-0003 | Z3_solver |
| SAFE-0004 | Kani_bpf |
| SAFE-0005 | veristat |
| SAFE-0006 | FramaC_bpf |

**t_ebpfprogram_verified_safe__verified_safe_by**

| id | ebpfprogram_id | verified_safe_by_id | role |
| --- | --- | --- | --- |
| SAFE-0001 | SAFE-0004 | SAFE-0002 | contributor |
| SAFE-0002 | SAFE-0004 | SAFE-0004 | reviewer |
| SAFE-0003 | SAFE-0003 | SAFE-0005 | owner |
| SAFE-0004 | SAFE-0002 | SAFE-0003 | owner |
| SAFE-0005 | SAFE-0001 | SAFE-0003 | contributor |
| SAFE-0006 | SAFE-0003 | SAFE-0006 | contributor |
| SAFE-0007 | SAFE-0001 | SAFE-0005 | owner |
| SAFE-0008 | SAFE-0001 | SAFE-0002 | owner |

The identifier column appears in every table as the primary key, providing a stable, opaque reference that decouples internal storage from external semantics. Its values follow domain-specific prefixes—XREF for event facts, CONT for controls, SAFE for verified programs—enabling immediate visual disambiguation of entity types. The ebpfevent column (the key linking fact to dimension) and the role column (the relationship type in junction tables) are the only non-key columns that appear across multiple tables, underscoring their centrality to the model's join topology. Together, these columns form a coherent schema in which operational metrics, categorical classification, control governance, and program verification are all expressed through a uniform pattern of identifier-based joins and role-labeled relationships.