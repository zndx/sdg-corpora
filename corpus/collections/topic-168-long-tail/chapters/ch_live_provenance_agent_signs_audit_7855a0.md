---
chapter_id: ch_live_provenance_agent_signs_audit_7855a0
topic_id: 168
family: 07_long_tail
cited_terms: ['provenance_agent_signs_audit', 'profiling_basic', 'ebpfprogram_observes_syscall']
model: engine-refine
---

Provenance and profiling constitute the twin pillars of operational observability, each anchored by a unique identifier that serializes discrete events into auditable sequences. Provenance records—identified by codes such as AUDI-0001 through AUDI-0004—capture the lineage and execution characteristics of data-originating operations, while profiling records, bearing identifiers like PROF-0001 through PROF-0004, track the behavioral and performance signatures of system activities. Both record families are enriched by categorical metadata: provenance events are classified under labels such as "Provenance Label 01" through "Provenance Label 04" and grouped into categories like "Provenance Category 01" through "Provenance Category 04," whereas profiling events carry analogous descriptors—"Profiling Label 01" through "Profiling Label 04" and "Profiling Category 01" through "Profiling Category 04"—that enable hierarchical organization and downstream filtering. The category dimension, additionally present as a standalone classification entity in the profiling domain (with entries ranging from "Category Name 01" to "Category Name 04"), serves as a normalization layer that decouples semantic classification from the operational facts themselves, permitting category reuse across multiple profiling records without duplication.

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |

The temporal and failure dimensions of these records are captured through duration, exit code, and retry count, which together form a triad of execution quality indicators. Duration seconds quantify the wall-clock time consumed by each operation, spanning from the relatively brief 1113.38 seconds observed in profiling record PROF-0002 to the protracted 6949.35 seconds recorded for provenance event AUDI-0004, with intermediate values such as 2601.59 and 6716.87 illustrating the wide variance inherent in production workloads. Exit codes—non-zero integers including 256, 728, 452, and 985 for provenance events, and 725, 809, 348, and 827 for profiling events—encode the termination status of each operation, with the absence of a zero exit value signaling abnormal completion that warrants investigation. Retry count measures the number of re-execution attempts before final termination, ranging from a modest 23 retries for provenance record AUDI-0004 to a substantial 410 retries for AUDI-0003, and from 186 retries for PROF-0002 to 303 for PROF-0003; these figures reveal the resilience—or fragility—of the underlying processes, with high retry counts often correlating with transient failures, resource contention, or cascading dependency issues.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

The relational architecture governing these observations extends beyond isolated event records into a structured graph of program-to-syscall mappings, where the concepts of subject, target, and role formalize the directional relationships between eBPF programs and the system calls they monitor. In this schema, the subject column identifies the originating entity—the eBPF program itself, referenced by identifiers such as SYSC-0001 and SYSC-0003—while the target column designates the observed entity, namely the system call under surveillance, with values like SYSC-0004 and SYSC-0001. The role attribute, taking values of contributor, owner, or observer, specifies the nature of the relationship: a program that contributes to a syscall's instrumentation, one that owns the monitoring logic, or one that passively observes without modification. Concrete instances include the program SYSC-0001 acting as a contributor to syscall SYSC-0004, and SYSC-0002 assuming both observer and contributor roles across syscalls SYSC-0005 and SYSC-0006 respectively, demonstrating that a single program may hold multiple relationship types simultaneously.

**t_ebpfprogram_observes_syscall**

| id | ebpfprogram |
| --- | --- |
| SYSC-0001 | audit_syscall |
| SYSC-0002 | track_memory |
| SYSC-0003 | log_dns_query |
| SYSC-0004 | trace_execve |
| SYSC-0005 | profile_latency |
| SYSC-0006 | netsec_probe |

**t_ebpfprogram_observes_syscall_observes_syscall**

| id | observes_syscall |
| --- | --- |
| SYSC-0001 | openat |
| SYSC-0002 | connect |
| SYSC-0003 | statx |
| SYSC-0004 | socket |
| SYSC-0005 | clone |
| SYSC-0006 | sendmsg |
| SYSC-0007 | execve |

**t_ebpfprogram_observes_syscall__observes_syscall**

| id | ebpfprogram_id | observes_syscall_id | role |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | contributor |
| SYSC-0002 | SYSC-0003 | SYSC-0001 | owner |
| SYSC-0003 | SYSC-0002 | SYSC-0005 | observer |
| SYSC-0004 | SYSC-0002 | SYSC-0006 | contributor |
| SYSC-0005 | SYSC-0002 | SYSC-0006 | observer |
| SYSC-0006 | SYSC-0002 | SYSC-0004 | observer |
| SYSC-0007 | SYSC-0002 | SYSC-0004 | reviewer |
| SYSC-0008 | SYSC-0001 | SYSC-0001 | contributor |

Underpinning this relationship graph are the lookup tables that associate human-readable program names with their technical identifiers: the eBPF program audit_syscall maps to SYSC-0001, track_memory to SYSC-0002, log_dns_query to SYSC-0003, and trace_execve to SYSC-0004, while the observed syscalls resolve to concrete kernel operations including openat, connect, statx, and socket. This separation of concerns—between the abstract relationship layer (subject, target, role) and the concrete program-syscall bindings—enables the system to evolve its monitoring topology without disrupting the analytical records that depend on stable identifiers. The misc column, populated with descriptive labels such as "Provenance Label 01" or "Profiling Label 01," provides an additional layer of human-interpretable context that bridges the gap between machine-auditable facts and the operational narratives that engineers and auditors require when diagnosing failures, tracing data lineage, or certifying compliance with governance policies.