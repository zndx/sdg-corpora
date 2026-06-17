---
chapter_id: f7b34eab9cf906dc
topic_id: 131
family: 04_ebpf_kernel
cited_terms: ['syscall_audited_by']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Ontological Mapping of Kernel System Calls in eBPF Auditing Frameworks

## 4.1 Scope and Preamble

This chapter establishes the formal protocol for mapping kernel-level system calls to the compliance ontology using Extended Berkeley Packet Filter (eBPF) instrumentation. It details the axiomatic definition of auditable entities, specifically focusing on the designation of information content entities that represent system calls. The content herein provides the necessary schema definitions, relational mappings, and verification protocols required to ensure that kernel interactions are not merely logged, but are semantically anchored to the `04_ebpf_kernel` family of the ontology. This approach ensures that audit trails are verifiable, machine-readable, and compliant with high-assurance security standards.

## 4.2 The Designative Information Content Entity (DesignativeICE)

In the context of kernel auditing, a "system call" is more than a binary invocation; it is an event that must be semantically categorized to be useful for governance and compliance. The foundational axiom for this categorization is derived from the Ontology for Biomedical Investigations (OBI) and the Common Core Ontologies (CCO), adapted here for low-level systems telemetry.

The core concept introduced in this framework is the **Designative Information Content Entity (DesignativeICE)**. According to the formal axiom provided, a specific class of system calls, denoted as `{X}`, is defined as a subclass of `cco:DesignativeICE`. In semantic web terminology, a Designative ICE is an entity that "stands for" or "refers to" another entity. In this technical implementation, the class `{X}` refers to the specific, real-world execution of a kernel function (e.g., opening a file, establishing a socket connection).

The axiom governing this relationship is expressed in Manchester Syntax as:
`Class: {X:Class} SubClassOf: cco:DesignativeICE, sdg:auditedBy some bfo:0000015`

This verbalization asserts that `{X}` is a designative information content entity that is audited by some process. The utilization of `bfo:0000015` (Process) from the Basic Formal Ontology (BFO) indicates that the auditing action is performed by an active, temporal computational process—specifically, an eBPF program attached to the kernel.

### 4.2.1 The Role of the `auditedBy` Relation

The `sdg:auditedBy` object property creates a mandatory link between the system call class `{X}` and the auditing process. This is a critical constraint for the compliance framework. It implies that for a system call class to be valid within this ontology, it *must* have a defined observer. In the context of eBPF, this resolves to the requirement that every designated syscall class must have a corresponding tracepoint or kprobe loaded into the kernel space that collects the requisite metadata.

If a class `{X}` is defined in the ontology but lacks a corresponding `bfo:0000015` process instance (i.e., no running eBPF program is observing that syscall), the system is in a state of non-compliance. The architecture therefore enforces a bidirectional verification: the ontology validates the presence of the auditor, and the runtime environment validates the instantiation of the class.

## 4.3 Relational Schema and Data Integrity

To bridge the gap between the abstract ontology and the relational database management systems (RDBMS) typically used in audit storage (e.g., SIEMs or compliance logs), a deterministic relational schema is projected from the ontology axioms. This section defines the structure of the table `t_syscall_audited_by`, which embodies the axiom `syscall_audited_by`.

### 4.3.1 Schema Definition

The table `t_syscall_audited_by` is designed to store the definitions of the system call classes that are subject to auditing. The primary key, `id`, serves as a unique identifier for the class definition within the database, ensuring referential integrity. The column `x` stores the name of the Class (e.g., `SyscallOpen`, `SyscallExecve`), which maps directly to the `{X}` slot in the ontology.

The schema definition is as follows:

```sql
CREATE TABLE t_syscall_audited_by (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"syscall_audited_by"}'
```

In this schema, the `id` column acts as the surrogate key for the information content entity, while `x` represents the specific designation of the syscall class. The JSON comment attached to the table creation statement preserves the provenance of the table, linking it back to the BFO anchor (`cco:DesignativeICE`) and the specific template ID (`syscall_audited_by`), ensuring that the database structure remains traceable to the governing ontology.

### 4.3.2 Instantiation of Audited Classes

The following table presents a populated instance of `t_syscall_audited_by`. These rows represent specific system call classes that have been formally designated and are currently under audit observation by the eBPF subsystem.

**Table 4.1: Instantiated System Call Classes in the Audit Framework**

| id | x |
| :--- | :--- |
| `sc-audit-001` | `SyscallExecveClass` |
| `sc-audit-002` | `SyscallOpenat2Class` |
| `sc-audit-003` | `SyscallConnectClass` |
| `sc-audit-004` | `SyscallMmapClass` |
| `sc-audit-005` | `SyscallClone3Class` |

*Table 4.1 Note:* The `x` values correspond to the `Class` definitions in the ontology. For instance, `SyscallExecveClass` designates the entity responsible for executing programs. The presence of this row in the table asserts that an eBPF program (a `bfo:0000015` Process) is currently loaded and auditing this specific class of events.

## 4.4 Audit Process Verification and Kernel Mapping

While the ontology defines the *what* (the classes of system calls) and the schema defines the *storage*, the technical implementation relies on the mapping of these classes to specific eBPF tracepoints or kprobes. The `bfo:0000015` (Process) referenced in the axiom is realized in the Linux kernel as a specific BPF program type (e.g., `BPF_PROG_TYPE_TRACEPOINT`).

To ensure that the `auditedBy` relationship holds true in practice, the compliance framework must verify that for every row in `t_syscall_audited_by`, a corresponding BPF program is active. This verification process involves querying the kernel's BPF file system (usually mounted at `/sys/kernel/debug/tracing/`) or utilizing the `bpftool` to enumerate loaded programs.

### 4.4.1 Mapping Designative Classes to Kernel Tracepoints

The following table illustrates the correlation between the ontological classes defined in Table 4.1 and their concrete kernel tracepoint implementations. This mapping is essential for auditors to verify that the abstract semantic layer (`{X}`) is correctly anchored to the low-level telemetry layer.

**Table 4.2: Kernel Tracepoint Mapping for Designative Classes**

| Designative Class (x) | Kernel Tracepoint | BPF Program ID | Status |
| :--- | :--- | :--- | :--- |
| `SyscallExecveClass` | `sys_enter_execve` | `bpf-prog-1452` | Active |
| `SyscallOpenat2Class` | `sys_enter_openat2` | `bpf-prog-1453` | Active |
| `SyscallConnectClass` | `sys_enter_connect` | `bpf-prog-1454` | Active |
| `SyscallMmapClass` | `sys_enter_mmap` | `bpf-prog-1455` | Active |
| `SyscallClone3Class` | `sys_enter_clone3` | `bpf-prog-1456` | Active |

*Table 4.2 Note:* The "Status" column indicates the operational state of the auditing process. A status of "Active" confirms that the `sdg:auditedBy` relation is satisfied. If a tracepoint were inactive, the system would flag a violation of the axiom, as the Designative ICE would exist in the schema without a corresponding Process to audit it.

## 4.5 Compliance and Governance Implications

Adopting this ontological approach to system call auditing provides several distinct advantages for governance frameworks. First, it decouples the compliance definition from the specific kernel version. While the tracepoint names (e.g., `sys_enter_openat2`) might change or be deprecated in future kernel versions, the ontological class (`SyscallOpenat2Class`) remains stable. The mapping layer (Table 4.2) absorbs the technical changes, preserving the integrity of historical audit logs.

Second, the formalization of the `auditedBy` relation enforces a strict "no observation, no existence" policy for compliance purposes. If a security team defines a new class of sensitive data access (e.g., `SyscallReadSecretClass`) but fails to deploy the corresponding eBPF auditor, the ontology immediately highlights the gap. The system design prevents the "checkbox compliance" failure where a policy is written but not enforced.

Finally, the use of the `cco:DesignativeICE` classification allows these audit entries to be linked to other information entities in a broader knowledge graph. For example, a specific instance of `SyscallExecveClass` can be linked to a `UserAccount` entity and a `PolicyDocument` entity, creating a rich, queryable semantic network of system behavior. This transforms raw logs into evidence-grade data suitable for forensic analysis and regulatory reporting.

```json
{
  "tables": [
    {
      "name": "t_syscall_audited_by",
      "rows": [
        [
          "sc-audit-001",
          "SyscallExecveClass"
        ],
        [
          "sc-audit-002",
          "SyscallOpenat2Class"
        ],
        [
          "sc-audit-003",
          "SyscallConnectClass"
        ],
        [
          "sc-audit-004",
          "SyscallMmapClass"
        ],
        [
          "sc-audit-005",
          "SyscallClone3Class"
        ]
      ]
    }
  ]
}
```