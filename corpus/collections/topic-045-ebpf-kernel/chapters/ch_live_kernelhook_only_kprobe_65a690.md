---
chapter_id: ch_live_kernelhook_only_kprobe_65a690
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['kernelhook_only_kprobe', 'bullying_response_process', 'syscall_governed_by_directive']
model: engine-refine
---

Kernel-level observability in this framework is structured through a kprobe-centric model that binds instrumentation points to their underlying kernel hooks and assigns governance roles across the relationship. Each kprobe is identified by a unique identifier such as `KPRO-0001` through `KPRO-0004`, and is associated with a specific kernel hook—`net_rx_action` for network receive processing, `kfree` for memory deallocation, `vfs_read` for virtual file system reads, and `ext4_file_open` for ext4 file open operations. The hook kind further classifies the instrumentation mechanism, distinguishing between `kprobe_perf` for performance-oriented probes, `entry_kprobe` for entry-point tracing, and `kprobe_trace` for general trace probes. A junction table mediates the many-to-many relationship between kprobes and hook kinds, introducing the concept of a role—`owner`, `contributor`, or `reviewer`—that establishes accountability for each association. For instance, the kprobe identified as `KPRO-0002` assumes the role of owner over its hook kind linkage, while `KPRO-0005` and `KPRO-0006` appear as subjects and targets in cross-referential mappings, indicating that the model supports complex dependency graphs where probes may reference other probes as their targets.

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

The governance of system call behavior is articulated through a directive-based architecture that separates the declaration of policy attributes from their typed value assignments, enabling a flexible and extensible constraint model. Directives are identified by identifiers such as `DIRE-0001` through `DIRE-0004` and govern specific syscalls including `mmap` for memory mapping, `connect` for network connections, `epoll_wait` for event polling, and `listen` for socket listening. The attribute schema defines four distinct attribute types—`effective_date` of type `xsd:date`, `enforcement` of type `xsd:string`, `mandatory` of type `xsd:boolean`, and `priority` of type `xsd:integer`—each with its own dedicated value table to preserve type safety and enable efficient querying. Boolean values such as `true` and `false` populate the mandatory flag across directives, with `DIRE-0001`, `DIRE-0003`, and `DIRE-0004` marked as mandatory while `DIRE-0002` is not. Date values anchor directives to specific effective dates including `2023-07-14`, `2025-03-29`, `2024-05-27`, and `2024-04-25`, establishing temporal enforceability windows. Integer values such as `4`, `80`, `443`, and `443` encode priority levels or port-related constraints, while varchar values like `Encoding 01`, `Enforcement 02`, `audit excerpt`, and `fr` provide free-form metadata and localization support. The entity column in each value table serves as the foreign key linking typed values back to their governing directive, ensuring referential integrity across the attribute-value decomposition.

**t_syscall_governed_by_directive**

| id | syscall |
| --- | --- |
| DIRE-0001 | mmap |
| DIRE-0002 | connect |
| DIRE-0003 | epoll_wait |
| DIRE-0004 | listen |
| DIRE-0005 | socket |
| DIRE-0006 | bind |

**t_syscall_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_syscall_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_syscall_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2023-07-14 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-29 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2024-05-27 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-04-25 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-30 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-07-29 |

**t_syscall_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 4 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 80 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 4 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 443 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 564 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 613 |

**t_syscall_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | fr |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

The school safety domain employs a parallel structural pattern through the bullying response process model, which formalizes incident response workflows and their associated personnel. Each process is identified by an identifier such as `PROC-0001` through `PROC-0004` and is named according to its scenario—`Playground-Dispute`, `Hallway-Shoving-Report`, `Cafeteria-Conflict`, and `Exclusion-Plan`—providing immediate semantic clarity about the incident type being addressed. The `has_participant` column references a school staff role, with observed values including `GuidanceCounselor`, `DeanOfStudents`, `Principal`, and `VicePrincipal`, establishing the chain of responsibility for each response process. This model mirrors the directive architecture in its use of a structured identifier and a human-readable process name, while diverging in its simpler single-participant association rather than the multi-table attribute decomposition seen in the syscall governance layer.

**t_bullying_response_process**

| id | bullying_response_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Playground-Dispute | GuidanceCounselor |
| PROC-0002 | Hallway-Shoving-Report | DeanOfStudents |
| PROC-0003 | Cafeteria-Conflict | Principal |
| PROC-0004 | Exclusion-Plan | VicePrincipal |
| PROC-0005 | Cyberbullying-Alert | SchoolNurse |

Across both domains, the relational design consistently applies a set of core concepts: the identifier serves as the primary key for all entities, the entity column functions as the foreign key in value and relationship tables, the subject and target columns in junction tables express directional relationships between entities, and the role column introduces a governance dimension that assigns accountability. The misc column appears in value tables to hold heterogeneous data—whether boolean flags, date strings, integer priorities, or free-form text—while the attr and attr_type columns in the attribute schema define the metadata vocabulary that governs how directives are constrained. This separation of schema from instance data, combined with the explicit role and participant modeling, creates a framework that is both semantically rich and mechanically queryable, supporting audit trails, compliance verification, and operational oversight across kernel instrumentation and school safety workflows alike.