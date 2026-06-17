---
chapter_id: c9e81c4b1ebcbd8c
topic_id: 77
family: 04_ebpf_kernel
cited_terms: ['syscall_basic', 'syscall_audited_by']
model: xai/grok-4.3
---

# Kernel Audit Information Content Entities

This chapter defines designative information content entities for system calls within kernel audit trails. Two axioms establish the classification of syscall identifiers and their linkage to audit processes. The relational model uses four tables to record these entities, enforce foreign-key references, and support multi-table queries that reconstruct audited events.

## 1. Designative Classification of Syscalls

Axiom 1 states that any class X is a designative information content entity when it functions as a stable identifier for a syscall. Table t_syscall_basic implements this axiom by storing each identifier once. Column id serves as the primary key; column x holds the designated class name. No foreign keys exist because the table records only the classification itself.

| id | x |
|----|---|
| scb-001 | sys_open |
| scb-002 | sys_read |
| scb-003 | sys_write |
| scb-004 | sys_close |
| scb-005 | sys_mmap |

## 1.1 Audited Designation

Axiom 2 extends the classification by requiring that X is audited by at least one process. Table t_syscall_audited_by records the same designative entities while adding the audit relation. Column id is the primary key; column x again holds the class. The table therefore satisfies both the subclass relation to cco:DesignativeICE and the existential restriction on sdg:auditedBy.

| id | x |
|----|---|
| sca-001 | sys_open |
| sca-002 | sys_read |
| sca-003 | sys_write |
| sca-004 | sys_close |

## 2. Audit Process Registry

Each audited designation must reference a concrete process instance. Table t_audit_process supplies these instances. Column process_id is the primary key. Column audited_class references the id column of t_syscall_audited_by, establishing a foreign-key constraint. Column operator_id is a second foreign key that links to the operator registry.

| process_id | audited_class | operator_id | start_time |
|------------|---------------|-------------|------------|
| ap-1001 | sca-001 | op-01 | 2024-02-11 08:12:03 |
| ap-1002 | sca-002 | op-02 | 2024-02-11 08:14:17 |
| ap-1003 | sca-003 | op-01 | 2024-02-11 08:15:49 |
| ap-1004 | sca-004 | op-03 | 2024-02-11 08:17:22 |

## 2.1 Operator Registry

Table t_operator completes the schema. Column operator_id is the primary key. No foreign keys are required because operators are the terminal entities referenced by audit processes.

| operator_id | name | role |
|-------------|------|------|
| op-01 | J. Harlan | Senior Auditor |
| op-02 | M. Reyes | Kernel Specialist |
| op-03 | L. Voss | Compliance Officer |

## 3. Cross-Table Query Example

The following query reconstructs the full audit record for sys_read by traversing the foreign-key chain:

- Start at t_syscall_audited_by where x = 'sys_read' (sca-002).
- Join t_audit_process on audited_class = sca-002 (ap-1002).
- Join t_operator on operator_id = op-02.

Result row: (sca-002, sys_read, ap-1002, 2024-02-11 08:14:17, op-02, M. Reyes, Kernel Specialist).

```json
{"tables": [{"name": "t_syscall_basic", "rows": [["scb-001", "sys_open"], ["scb-002", "sys_read"], ["scb-003", "sys_write"], ["scb-004", "sys_close"], ["scb-005", "sys_mmap"]]}, {"name": "t_syscall_audited_by", "rows": [["sca-001", "sys_open"], ["sca-002", "sys_read"], ["sca-003", "sys_write"], ["sca-004", "sys_close"]]}, {"name": "t_audit_process", "rows": [["ap-1001", "sca-001", "op-01", "2024-02-11 08:12:03"], ["ap-1002", "sca-002", "op-02", "2024-02-11 08:14:17"], ["ap-1003", "sca-003", "op-01", "2024-02-11 08:15:49"], ["ap-1004", "sca-004", "op-03", "2024-02-11 08:17:22"]]}, {"name": "t_operator", "rows": [["op-01", "J. Harlan", "Senior Auditor"], ["op-02", "M. Reyes", "Kernel Specialist"], ["op-03", "L. Voss", "Compliance Officer"]]}]}
```