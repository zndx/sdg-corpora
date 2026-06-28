---
chapter_id: ch_live_ebpfmap_pinned_at_path_94d52b
topic_id: 23
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_pinned_at_path', 'kernelhook_observes_syscall_xref', 'ebpfprogram_union_kprobe_or_xdp']
model: engine-refine
---

Within systems that manage eBPF programs, kernel hooks, and pinned maps, the provenance and governance of each resource hinge on a small set of disciplined attributes: the identifier, the creation date, the owner, the tags, the MIME type, and the size in bytes. The identifier functions as the immutable primary key—PATH-0001 through PATH-0004 for pinned maps, XREF-0001 through XREF-0004 for kernel-hook–syscall cross-references, and XDP-0001 through XDP-0004 for eBPF program unions—ensuring that every object can be referenced unambiguously across the three registries. The creation date anchors each record in a temporal sequence that is essential for auditing and lifecycle management; cross-reference entries span from 2023-03-30 for an early bcc_tcpconnect hook to 2025-04-07 for a more recently registered analytics-facing instance, while the 2024-11-21 timestamp on a tracee_fs_watch hook situates it between those extremes. This chronology is not merely archival: it establishes the order of deployment, supports compliance windows, and allows operators to reason about which hooks or maps were introduced before or after a given policy change.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | filesystem_integrity_hook | /run/bpf/sockops | sre | pii |
| PATH-0002 | ringbuf | /sys/fs/bpf/cilium_flow | data-engineering | pii |
| PATH-0003 | cpumap | /sys/fs/bpf/bpftool_prog | data-engineering | internal |
| PATH-0004 | tcp_state_monitor | /sys/fs/bpf/netfilter_flow | sre | verified |
| PATH-0005 | filesystem_integrity_hook | /sys/fs/bpf/cilium_sock | sre | internal |
| PATH-0006 | thermal_throttle_hook | /sys/fs/bpf/xdp_ingress | platform-team | verified |

**t_kernelhook_observes_syscall_xref**

| id | kernelhook | created_date | owner |
| --- | --- | --- | --- |
| XREF-0001 | bcc_tcpconnect | 2025-01-25 | sre |
| XREF-0002 | bcc_tcpconnect | 2023-03-30 | ml-infra |
| XREF-0003 | tracee_fs_watch | 2024-11-21 | platform-team |
| XREF-0004 | bcc_tcpconnect | 2025-04-07 | analytics |
| XREF-0005 | tracee_fs_watch | 2024-03-25 | governance |

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | flow_table | thermal_throttle_hook | cpu_frequency_governor | application/xml | 613043965 |
| XDP-0002 | sock_hash | thermal_throttle_hook | syscall_audit_filter | application/parquet | 757467115 |
| XDP-0003 | perf_cpu_clock_sampler | audit_syscall_filter | xdp_packet_dropper | application/octet-stream | 333629998 |
| XDP-0004 | process_exec_tracker | capability_change_hook | ptrace_attach_monitor | text/csv | 79215808 |
| XDP-0005 | sysctl_access_tracker | page_fault_monitor | socket_connect_tracker | text/plain | 893084779 |

Ownership attribution assigns accountability for each resource to a specific team or role, and the pattern of assignment reveals how operational responsibility is distributed across the infrastructure. The sre team owns the tcp_state_monitor map pinned at /sys/fs/bpf/netfilter_flow and the filesystem_integrity_hook at /run/bpf/sockops, while the data-engineering team claims stewardship over both the ringbuf and cpumap entries—demonstrating that network-facing and data-pipeline resources are governed by distinct groups. In the cross-reference registry, ownership is more granular: sre retains control over the earliest bcc_tcpconnect hook, ml-infra assumes responsibility for a second instance, platform-team oversees the tracee_fs_watch cross-reference, and analytics owns the most recent bcc_tcpconnect registration. This distribution of ownership across sre, ml-infra, platform-team, and analytics reflects a federated model in which each team maintains its own set of kernel hooks and eBPF programs, yet all remain discoverable through a shared identifier space.

Tags provide a secondary, flexible layer of classification that complements the rigid ownership model. The pii tag appears on the filesystem_integrity_hook and ringbuf maps, signaling that these pinned objects handle personally identifiable information and therefore require heightened access controls and audit scrutiny. The internal tag on the cpumap and the verified tag on the tcp_state_monitor map indicate different assurance levels—one marking a resource as organizationally scoped but not necessarily sensitive, the other certifying that the map has undergone validation. These tags operate orthogonally to ownership: an sre-owned map can carry the pii tag, while a data-engineering-owned map may carry only internal, allowing compliance policies to be expressed in terms of data sensitivity and verification status rather than team affiliation alone.

The MIME type and size in bytes describe the physical characteristics of the eBPF program binaries stored in the union registry, information that is critical for deployment validation, storage planning, and integrity verification. The flow_table program is recorded as application/xml at 613,043,965 bytes, while the sock_hash program uses application/parquet and occupies 757,467,115 bytes—the largest entry in the set. The perf_cpu_clock_sampler appears as application/octet-stream at 333,629,998 bytes, and the process_exec_tracker is stored as text/csv at 79,215,808 bytes, the smallest by a factor of nearly ten. These size disparities are not incidental: the 613-megabyte flow_table and the 757-megabyte sock_hash suggest substantial program payloads, possibly reflecting complex XDP or kprobe logic, whereas the 79-megabyte process_exec_tracker indicates a more lightweight instrumentation point. The MIME type further distinguishes whether the binary is a native eBPF object (application/octet-stream) or a structured representation (application/xml, application/parquet, text/csv), which has implications for how the runtime loads, validates, and executes the program.

Together, these six attributes form a minimal but complete provenance model. The identifier guarantees uniqueness, the creation date provides temporal context, the owner assigns accountability, the tags express policy-relevant classifications, and the MIME type and size bytes capture the binary's physical form. In practice, an operator querying for all resources owned by sre can cross-reference PATH-0001 and PATH-0004 in the pinned-map registry, while a compliance auditor searching for pii-tagged objects will find the same two maps. A capacity planner examining the union registry will see that the two largest programs—sock_hash at 757 megabytes and flow_table at 613 megabytes—together consume over 1.3 gigabytes of storage, a figure that must be reconciled against available disk space on the nodes where these eBPF programs are loaded. The interplay of these attributes, each grounded in concrete values drawn from the actual registries, enables operators to manage, audit, and govern a complex eBPF deployment without requiring external documentation or tribal knowledge.