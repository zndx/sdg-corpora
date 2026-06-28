---
chapter_id: ch_live_ebpfprogram_exactly_one_type_8d9e2a
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_exactly_one_type', 'ebpfprogram_governed_by_security_policy', 'ebpfprogram_has_program_type']
model: engine-refine
---

The governance of extended Berkeley Packet Filter (eBPF) programs necessitates a rigorous taxonomy wherein each executable artifact is assigned a unique identifier to ensure traceability across the system lifecycle. These programs, ranging from network-oriented filters such as `tc_ingress_filter` and `tc_filter_ingress` to kernel-level probes like `kprobe_sched_switch` and `kprobe_sys_execve`, are systematically categorized to delineate their operational scope. A descriptive category, such as `Ebpfprogram Category 01`, provides the high-level classification required for audit compliance, while supplementary miscellaneous labels, including `Ebpfprogram Label 01`, offer granular metadata for internal tracking. This structured nomenclature ensures that every program instance, whether deployed as a traffic control mechanism or a system call tracer, is distinctly identifiable and properly contextualized within the broader security posture.

**t_ebpfprogram_exactly_one_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | tc_ingress_filter |
| TYPE-0002 | kprobe_sched_switch |
| TYPE-0003 | kprobe_sched_switch |
| TYPE-0004 | netfilter_hook_in |
| TYPE-0005 | tracepoint_syscall_open |
| TYPE-0006 | tracepoint_syscall_open |

**t_ebpfprogram_exactly_one_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | tracepoint |
| TYPE-0002 | cgroup_sock_addr |
| TYPE-0003 | xdp |
| TYPE-0004 | socket_filter |
| TYPE-0005 | cgroup_sock_addr |
| TYPE-0006 | tracepoint |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

**t_ebpfprogram_has_program_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | kprobe_sys_execve |
| TYPE-0002 | tc_filter_ingress |
| TYPE-0003 | tracepoint_syscall_open |
| TYPE-0004 | fentry_do_fork |
| TYPE-0005 | lsm_bpf_attach |
| TYPE-0006 | kprobe_sys_execve |
| TYPE-0007 | netfilter_hook_in |

**t_ebpfprogram_has_program_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | iter_task |
| TYPE-0002 | fentry |
| TYPE-0003 | tracepoint |
| TYPE-0004 | iter_task |
| TYPE-0005 | fentry |
| TYPE-0006 | sk_skb |

The operational behavior of an eBPF program is intrinsically linked to its designated program type, a relationship formalized through explicit subject-to-target mappings. For instance, a program acting as the subject may be bound to a target program type such as `tracepoint`, `xdp`, or `cgroup_sock_addr`, thereby defining the precise kernel hook or network namespace where the bytecode will execute. These associations are not merely technical bindings but are governed by defined roles that dictate the nature of the interaction. An entity may assume the role of `owner`, asserting direct control over the program's lifecycle, or it may serve as an `observer`, `reviewer`, or `contributor`, reflecting a more limited or collaborative engagement with the program type. Such role-based delineation is critical for enforcing the principle of least privilege and ensuring that only authorized program types are permitted to interact with sensitive kernel interfaces.

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

**t_ebpfprogram_has_program_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0006 | TYPE-0005 | observer |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0003 | TYPE-0002 | TYPE-0001 | reviewer |
| TYPE-0004 | TYPE-0004 | TYPE-0006 | contributor |
| TYPE-0005 | TYPE-0006 | TYPE-0001 | reviewer |
| TYPE-0006 | TYPE-0007 | TYPE-0002 | owner |
| TYPE-0007 | TYPE-0007 | TYPE-0001 | observer |
| TYPE-0008 | TYPE-0006 | TYPE-0001 | observer |

Beyond their categorical and relational attributes, eBPF programs are subject to stringent factual constraints regarding their physical footprint and versioning history. The size of a program, measured in bytes, is a critical metric for compliance, as excessive bytecode can lead to kernel stack overflows or execution timeouts. For example, a specific program instance may be recorded with a size of `784335640` bytes, while another, such as `POLI-0005`, might occupy `161013093` bytes, highlighting the significant variance in resource consumption across different deployment profiles. Concurrently, version tracking is maintained to manage updates and rollback procedures; programs are tagged with version numbers such as `12` or `9`, ensuring that the exact iteration of the bytecode can be verified against the approved baseline. This rigorous accounting of size and version is indispensable for maintaining system stability and preventing the deployment of unvetted or oversized program artifacts.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

Ultimately, the comprehensive management of eBPF programs relies on the seamless integration of these disparate data elements into a unified operational framework. By correlating the unique identifier of a program with its specific category, its assigned program type, and its governing role, administrators can construct a complete audit trail that spans from initial deployment to ongoing maintenance. The interplay between the program's intrinsic properties—such as its size and version—and its extrinsic relationships to other system components ensures that every execution context is fully documented. This holistic approach to data governance not only facilitates rapid incident response and forensic analysis but also provides the necessary evidentiary foundation for demonstrating regulatory compliance in highly regulated environments where kernel-level code execution poses inherent security risks.