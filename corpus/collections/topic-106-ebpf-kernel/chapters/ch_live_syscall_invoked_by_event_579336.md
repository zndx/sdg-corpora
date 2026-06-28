---
chapter_id: ch_live_syscall_invoked_by_event_579336
topic_id: 106
family: 04_ebpf_kernel
cited_terms: ['syscall_invoked_by_event', 'syscall_max_one_return', 'syscall_only_in_kernel_subsystem']
model: engine-refine
---

Syscall invocation records are anchored by a unique identifier—EVEN-0001, EVEN-0002, and so forth—that serves as the immutable key for every event-driven call trace. Each record binds a specific system call, whether pipe, socket, openat, or clone, to the event that triggered it, such as disk_read or api_callback. The integrity of these traces is preserved through a checksum algorithm field, where md5, sha256, crc32, and sha1 appear as the chosen hashing mechanisms, and through an encoding field that specifies the character set—utf8, unicode, or latin1—used to serialize the associated metadata. This dual-layer of checksum and encoding ensures that both the structural and textual components of invocation records remain verifiable across audit cycles.

**t_syscall_invoked_by_event**

| id | syscall | invoked_by_event | checksum_algo | encoding |
| --- | --- | --- | --- | --- |
| EVEN-0001 | pipe | disk_read | md5 | utf8 |
| EVEN-0002 | socket | disk_read | sha256 | unicode |
| EVEN-0003 | openat | api_callback | crc32 | utf8 |
| EVEN-0004 | clone | disk_read | sha1 | latin1 |
| EVEN-0005 | pipe | api_callback | sha256 | utf8 |
| EVEN-0006 | fstat | memory_fault | md5 | unicode |

The return behavior of system calls is governed by a separate constraint: certain syscalls are documented as producing at most one return value, a restriction captured by identifiers RETU-0001 through RETU-0004. The syscalls subject to this constraint—read, munmap, clone, and execve—are each associated with a single return type drawn from a finite taxonomy: process_id, error_code, pointer_addr, and memory_size. This one-to-one cardinality is not merely descriptive; it enforces a deterministic contract between the kernel and user-space callers, eliminating ambiguity in return-value handling and simplifying both static analysis and runtime verification.

**t_syscall_max_one_return**

| id | syscall |
| --- | --- |
| RETU-0001 | read |
| RETU-0002 | munmap |
| RETU-0003 | clone |
| RETU-0004 | execve |
| RETU-0005 | fstat |
| RETU-0006 | accept |
| RETU-0007 | ioctl |
| RETU-0008 | fstat |

**t_syscall_max_one_return_return_type**

| id | return_type |
| --- | --- |
| RETU-0001 | process_id |
| RETU-0002 | error_code |
| RETU-0003 | pointer_addr |
| RETU-0004 | memory_size |
| RETU-0005 | pointer_addr |
| RETU-0006 | stat_struct |
| RETU-0007 | process_id |

**t_syscall_only_in_kernel_subsystem**

| id | syscall | in_syscall_subsystem | code | issued_date |
| --- | --- | --- | --- | --- |
| SUBS-0001 | write | namespaces | C-07 | 2024-01-17 |
| SUBS-0002 | ioctl | inotify | B-12 | 2023-04-09 |
| SUBS-0003 | epoll_wait | fsnotify | E-21 | 2024-01-29 |
| SUBS-0004 | accept | vDSO | E-21 | 2024-04-20 |
| SUBS-0005 | mmap | inotify | C-07 | 2025-01-29 |

The relationship between syscalls and their permitted return types is mediated by an association table that introduces a role attribute, assigning each linkage one of four designations: observer, contributor, owner, or reviewer. In this model, the syscall identifier (subject) and the return-type identifier (target) are joined not as a simple foreign-key pair but as a governed relationship, where the role field encodes the nature of the dependency. A syscall may observe a return type without consuming it, contribute to its derivation, own the mapping entirely, or review it for compliance. This role-based layer transforms what would otherwise be a flat join into a structured governance mechanism, enabling fine-grained access control and auditability over syscall-return-type bindings.

**t_syscall_max_one_return__return_type**

| id | syscall_id | return_type_id | role |
| --- | --- | --- | --- |
| RETU-0001 | RETU-0005 | RETU-0003 | observer |
| RETU-0002 | RETU-0001 | RETU-0007 | contributor |
| RETU-0003 | RETU-0004 | RETU-0004 | owner |
| RETU-0004 | RETU-0008 | RETU-0006 | reviewer |
| RETU-0005 | RETU-0006 | RETU-0007 | owner |
| RETU-0006 | RETU-0006 | RETU-0007 | owner |
| RETU-0007 | RETU-0007 | RETU-0002 | contributor |
| RETU-0008 | RETU-0003 | RETU-0005 | reviewer |

Kernel subsystem confinement is tracked through a dedicated registry that records which syscalls are restricted to execution within specific kernel subsystems. Entries such as SUBS-0001 through SUBS-0004 enumerate syscalls—write, ioctl, epoll_wait, accept—and bind each to its permitted subsystem: namespaces, inotify, fsnotify, or vDSO. Each confinement record carries a classification code, drawn from the set C-07, B-12, E-21, and an issued date, such as 2023-04-09 or 2024-04-20, that anchors the policy to a point in time. The code field functions as a policy severity or category marker, while the issued date provides temporal provenance, allowing administrators to reconstruct the evolution of subsystem access restrictions and to correlate policy changes with kernel releases or security incidents.