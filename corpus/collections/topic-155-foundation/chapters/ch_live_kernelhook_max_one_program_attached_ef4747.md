---
chapter_id: ch_live_kernelhook_max_one_program_attached_ef4747
topic_id: 155
family: 04_ebpf_kernel
cited_terms: ['kernelhook_max_one_program_attached', 'kernelhook_observes_event_class', 'kernelhook_observes_syscall_xref']
model: engine-refine
---

Kernel hooks function as the structural backbone of an observability fabric, each identified by a stable surrogate key—ATTA-0001 through ATTA-0004 in the attachment registry—that anchors a one-to-one mapping between a hook such as `trace-collector`, `auditd-hook`, `tracee_fs_watch`, or `tcp_connect` and its corresponding attached program, whether an `apparmor_module`, `bpftrace_script`, `eBPF_loader`, or `auditd_agent`. The attachment table enforces this cardinality constraint directly, while a separate junction table resolves the many-to-many relationships that arise when hooks and programs are recombined across environments; there, the `subject` column carries the kernel hook's identifier (for instance, ATTA-0002 or ATTA-0005), the `target` column carries the program's identifier (ATTA-0006 or ATTA-0005), and the `role` column assigns a functional designation—`owner` or `reviewer`—that governs who may modify the binding and who must approve it. This triad of subject, target, and role constitutes the minimal authorization primitive for the hook-program graph, enabling fine-grained access control without introducing ad hoc permission tables.

**t_kernelhook_max_one_program_attached**

| id | kernelhook |
| --- | --- |
| ATTA-0001 | trace-collector |
| ATTA-0002 | auditd-hook |
| ATTA-0003 | tracee_fs_watch |
| ATTA-0004 | tcp_connect |
| ATTA-0005 | tracee_fs_watch |
| ATTA-0006 | eBPF_net_monitor |

**t_kernelhook_max_one_program_attached_attached_program**

| id | attached_program |
| --- | --- |
| ATTA-0001 | apparmor_module |
| ATTA-0002 | bpftrace_script |
| ATTA-0003 | eBPF_loader |
| ATTA-0004 | auditd_agent |
| ATTA-0005 | perf_event |
| ATTA-0006 | bpftrace_script |

**t_kernelhook_max_one_program_attached__attached_program**

| id | kernelhook_id | attached_program_id | role |
| --- | --- | --- | --- |
| ATTA-0001 | ATTA-0002 | ATTA-0006 | owner |
| ATTA-0002 | ATTA-0005 | ATTA-0005 | owner |
| ATTA-0003 | ATTA-0003 | ATTA-0003 | reviewer |
| ATTA-0004 | ATTA-0004 | ATTA-0004 | owner |
| ATTA-0005 | ATTA-0005 | ATTA-0003 | reviewer |
| ATTA-0006 | ATTA-0002 | ATTA-0005 | observer |
| ATTA-0007 | ATTA-0003 | ATTA-0006 | reviewer |
| ATTA-0008 | ATTA-0001 | ATTA-0003 | contributor |

**t_kernelhook_observes_syscall_xref**

| id | kernelhook | created_date | owner |
| --- | --- | --- | --- |
| XREF-0001 | kmem_alloc | 2025-01-25 | sre |
| XREF-0002 | kprobes_do_fork | 2023-03-30 | ml-infra |
| XREF-0003 | sysmon-agent | 2024-11-21 | platform-team |
| XREF-0004 | kprobes_do_fork | 2025-04-07 | analytics |
| XREF-0005 | sysmon-agent | 2024-03-25 | governance |

Beyond attachment semantics, the event-class registry extends the model by associating each kernel hook with the classes of events it observes—`disk-io`, `net-packet-capture`, `thread-schedule`—and by anchoring those associations to a geographic or logical `location` such as `ap-south-2`, `us-east-1`, or `zone-b`. The `misc` column, realized as the `name` field, carries human-readable labels like `probe_capture_main`, `audit_log_stream`, `net_watch_stream`, and `event_feed_prod` that serve as display identifiers in dashboards and alerting rules. Together, location and misc allow operators to reason about data provenance and routing: a hook registered in `us-east-1` with the name `audit_log_stream` is immediately distinguishable from an identically named hook in `ap-south-2`, and the location field becomes the pivot for region-level cost allocation and compliance boundary enforcement.

**t_kernelhook_observes_event_class**

| id | kernelhook | observes_event | location | name |
| --- | --- | --- | --- | --- |
| EVEN-0001 | ext4_write | disk-io | ap-south-2 | probe_capture_main |
| EVEN-0002 | bcc_tcpconnect | net-packet-capture | us-east-1 | audit_log_stream |
| EVEN-0003 | audit_rule_connect | net-packet-capture | zone-b | net_watch_stream |
| EVEN-0004 | do_fork | thread-schedule | us-east-1 | event_feed_prod |
| EVEN-0005 | kernel-watcher | thread-schedule | on-prem-dc1 | probe_capture_main |

The syscall cross-reference table introduces a temporal dimension through the `created_date` column, which records the provisioning timestamp of each hook-to-syscall binding—2025-01-25 for `kmem_alloc`, 2023-03-30 for `kprobes_do_fork`, 2024-11-21 for `sysmon-agent`, and 2025-04-07 for a second `kprobes_do_fork` entry—enabling lifecycle audits, drift detection, and automated decommissioning of stale bindings. Ownership of these bindings is tracked in the `owner` column, which enumerates functional teams such as `sre`, `ml-infra`, `platform-team`, and `analytics`; this column operates at two levels, both in the cross-reference table and in the junction table's `role` field, creating a layered accountability model where team-level ownership coexists with individual role assignments on specific hook-program relationships. The distinction is deliberate: `owner` in the cross-reference denotes the team responsible for the syscall mapping itself, while `role` in the junction table denotes the individual's capacity—`owner` or `reviewer`—on a particular attachment, allowing the same team to hold ownership of a binding while delegating review authority to a different stakeholder.