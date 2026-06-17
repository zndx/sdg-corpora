---
chapter_id: de537b1fadb01da2
topic_id: 62
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_verified_safe', 'syscall_at_security_tier', 'syscall_equiv_in_subsystem', 'syscall_audited_by']
model: xai/grok-4.3
---

# eBPF Verification and Syscall Audit Schema

This chapter defines four ontological templates that classify eBPF programs and syscalls according to verification status, security tier, subsystem membership, and audit provenance. The templates are realized as a fixed relational schema whose foreign-key links permit multi-hop retrieval of verification and classification facts.

## 1. Template Definitions

Each template is expressed by a single table whose columns directly encode the Manchester slots. Primary keys are opaque identifiers; cross-table references occur through the x and y columns, which hold entity names that appear as primary-key values in other tables.

### 1.1 Verified-Safe eBPF Programs

Table t_ebpfprogram_verified_safe embodies axiom ebpfprogram_verified_safe. Column id is the primary key. Column x references an eBPF program artifact; column y references the verifying entity. A reader can join on y to locate all programs verified by the same entity and then join those programs’ x values into the syscall tables below.

```sql
CREATE TABLE t_ebpfprogram_verified_safe (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
| id | x | y |
| ebpf-v-01 | trace_openat | bpf_verifier_v2 |
| ebpf-v-02 | net_packet_filter | seccomp_checker |
| ebpf-v-03 | fs_audit_hook | bpf_verifier_v2 |
| ebpf-v-04 | proc_monitor | bpf_verifier_v2 |

### 1.2 Syscall Security Tier Assignment

Table t_syscall_at_security_tier embodies axiom syscall_at_security_tier. Column id is the primary key. Column x names a syscall; column y names its assigned tier. The x values are intended to match x values in t_syscall_equiv_in_subsystem and t_syscall_audited_by, enabling a two-hop join from tier to subsystem to audit status.

```sql
CREATE TABLE t_syscall_at_security_tier (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
| id | x | y |
| tier-01 | openat | kernel |
| tier-02 | read | user |
| tier-03 | write | kernel |
| tier-04 | execve | restricted |
| tier-05 | connect | kernel |

### 1.3 Syscall Subsystem Equivalence

Table t_syscall_equiv_in_subsystem embodies axiom syscall_equiv_in_subsystem. Column id is the primary key. Column x names a syscall; column y names the subsystem in which the syscall is considered equivalent. The x column again serves as a foreign key into the tier and audit tables.

```sql
CREATE TABLE t_syscall_equiv_in_subsystem (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
| id | x | y |
| sub-01 | openat | fs |
| sub-02 | read | fs |
| sub-03 | write | fs |
| sub-04 | execve | proc |
| sub-05 | connect | net |

### 1.4 Audited Syscalls

Table t_syscall_audited_by embodies axiom syscall_audited_by. Column id is the primary key. Column x names a syscall that is audited by a bfo:0000015 process. The x values link to the tier and subsystem tables, supporting three-table traversals that combine verification, tier, and audit data.

```sql
CREATE TABLE t_syscall_audited_by (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
| id | x |
| audit-01 | openat |
| audit-02 | read |
| audit-03 | write |
| audit-04 | execve |
| audit-05 | connect |

## 2. Cross-Join Example

Question: Which eBPF programs verified by bpf_verifier_v2 cover syscalls that are both at kernel tier and inside the fs subsystem and are audited?

Walk the links:

- Start in t_ebpfprogram_verified_safe where y = 'bpf_verifier_v2' yields x values trace_openat and fs_audit_hook.
- Match those x values against t_syscall_at_security_tier where y = 'kernel' yields openat.
- Match openat against t_syscall_equiv_in_subsystem where y = 'fs' confirms membership.
- Match openat against t_syscall_audited_by confirms audit-01.

Result row after the three joins:

| ebpf_program | verifier | syscall | tier | subsystem | audit_id |
| trace_openat | bpf_verifier_v2 | openat | kernel | fs | audit-01 |
| fs_audit_hook | bpf_verifier_v2 | openat | kernel | fs | audit-01 |

```json
{"tables": [{"name": "t_ebpfprogram_verified_safe", "rows": [["ebpf-v-01", "trace_openat", "bpf_verifier_v2"], ["ebpf-v-02", "net_packet_filter", "seccomp_checker"], ["ebpf-v-03", "fs_audit_hook", "bpf_verifier_v2"], ["ebpf-v-04", "proc_monitor", "bpf_verifier_v2"]]}, {"name": "t_syscall_at_security_tier", "rows": [["tier-01", "openat", "kernel"], ["tier-02", "read", "user"], ["tier-03", "write", "kernel"], ["tier-04", "execve", "restricted"], ["tier-05", "connect", "kernel"]]}, {"name": "t_syscall_equiv_in_subsystem", "rows": [["sub-01", "openat", "fs"], ["sub-02", "read", "fs"], ["sub-03", "write", "fs"], ["sub-04", "execve", "proc"], ["sub-05", "connect", "net"]]}, {"name": "t_syscall_audited_by", "rows": [["audit-01", "openat"], ["audit-02", "read"], ["audit-03", "write"], ["audit-04", "execve"], ["audit-05", "connect"]]}]}
```