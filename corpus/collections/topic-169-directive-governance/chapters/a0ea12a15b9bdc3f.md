---
chapter_id: a0ea12a15b9bdc3f
topic_id: 169
family: 04_ebpf_kernel
cited_terms: ['syscall_basic']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Ontological Classification of Kernel System Calls

## 7.1 Scope and Preamble

This chapter delineates the formal taxonomy for kernel-level system calls within the context of the eBPF observability framework. The objective is to establish a rigorous mapping between raw kernel events and their corresponding ontological entities, specifically focusing on the classification of these events as Designative Information Content Entities (DesignativeICE). This classification is critical for ensuring semantic interoperability between low-level telemetry data and high-level compliance reporting mechanisms. The following sections provide a detailed analysis of the governing axioms, the projected relational schema, and the operational implications for security auditing.

## 7.2 Designative Information Content Entities

### 7.2.1 Conceptual Definition

In the context of the Common Core Ontology (CCO) and the Basic Formal Ontology (BFO), a Designative Information Content Entity is defined as an entity that serves to stand for, or designate, another entity. Within the domain of kernel auditing, a system call is not merely a functional invocation or a transition of processor state; it is fundamentally an informational artifact that designates a specific, defined interaction between user space and kernel space.

The governing axiom for this classification is expressed in Manchester Syntax as:

`Class: {X:Class} SubClassOf: cco:DesignativeICE`

Verbalized, this axiom asserts that the class variable {X}—representing any specific system call taxonomy—is a subclass of the general concept `cco:DesignativeICE`. This relationship implies that the system call itself, as a named and recorded entity within the audit trail, functions as a designative marker. It signifies the intent of the calling process (e.g., to open a file, to create a socket) without being the execution of that intent itself. This distinction is vital for forensic analysis, where the *record* of the call (the DesignativeICE) must be distinguished from the *process* of the call (the occurrent).

### 7.2.2 The Role of {X} in Kernel Taxonomy

The variable {X} within the axiom represents the specific class of the system call being observed. For instance, the `open` system call, when modeled in this ontology, is not treated as a verb or an action, but as a class of information content: `SyscallOpen`. This class inherits the properties of `cco:DesignativeICE`, including its capacity to be about some realizable entity—in this case, the file opening procedure.

By anchoring these classes to `cco:DesignativeICE`, the ontology ensures that all system call entries in an audit log are treated as standardized, semantically rich data points. This allows for automated reasoning tools to infer that if a log entry is an instance of `SyscallOpen`, it is necessarily an information content entity, subject to governance policies regarding data retention, queryability, and chain-of-custody verification.

### 7.2.3 Relational Projection and Schema

To operationalize this ontological axiom within a relational database management system (RDBMS), the class structure is projected onto a deterministic schema. This projection facilitates the storage and querying of system call taxonomies in a manner that preserves their semantic relationships.

The schema derived from Axiom 1 is designated as `t_syscall_basic`. This table serves as the registry for all defined system call classes that function as DesignativeICEs. The structure is intentionally minimal to enforce strict typing and referential integrity.

**Table 7.1: Schema Definition for t_syscall_basic**

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `id` | VARCHAR(255) | The unique identifier for the system call class, typically a UUID or hash. |
| `x` | VARCHAR(255) | The class name of the system call (e.g., `SyscallOpen`, `SyscallClone`). |

The primary key for this table is the `id` column. The `x` column represents the specific class {X} defined in the axiom. While the `x` column functions as a data property in this relational view, it acts as the bridge to the broader ontology, allowing SQL-based queries to retrieve all entities that are subclasses of `cco:DesignativeICE`.

### 7.2.4 Data Population: File System Operations

The following table illustrates the instantiation of the `t_syscall_basic` schema for common file system operations. These rows represent specific classes of system calls that have been formally defined as Designative Information Content Entities. Each entry provides a unique identifier and the corresponding class name, demonstrating the mapping from the abstract axiom to concrete data elements used in audit logs.

**Table 7.2: File System System Call Taxonomy**

| id | x |
| :--- | :--- |
| `550e8400-e29b-41d4-a716-446655440001` | `SyscallOpen` |
| `550e8400-e29b-41d4-a716-446655440002` | `SyscallClose` |
| `550e8400-e29b-41d4-a716-446655440003` | `SyscallRead` |
| `550e8400-e29b-41d4-a716-446655440004` | `SyscallWrite` |
| `550e8400-e29b-41d4-a716-446655440005` | `SyscallStat` |

In the context of a compliance audit, these entries allow the auditor to verify that the monitoring system correctly identifies the "Open" operation not merely as a raw integer (e.g., syscall number 2 on x86_64), but as a member of the class `SyscallOpen`, which is a DesignativeICE. This abstraction layer is essential for creating cross-platform compliance reports that remain accurate even if the underlying syscall numbers change between kernel versions or architectures.

### 7.2.5 Data Population: Process Control Operations

Similarly, process control operations must be cataloged to ensure that the creation, termination, and manipulation of processes are captured within the ontological framework. The table below extends the `t_syscall_basic` registry to include these critical classes.

**Table 7.3: Process Control System Call Taxonomy**

| id | x |
| :--- | :--- |
| `660e8400-e29b-41d4-a716-446655440011` | `SyscallClone` |
| `660e8400-e29b-41d4-a716-446655440012` | `SyscallExecve` |
| `660e8400-e29b-41d4-a716-446655440013` | `SyscallExit` |
| `660e8400-e29b-41d4-a716-446655440014` | `SyscallKill` |
| `660e8400-e29b-41d4-a716-446655440015` | `SyscallWait4` |

The inclusion of `SyscallClone` and `SyscallExecve` is particularly pertinent for governance frameworks regarding privilege escalation and process lineage. By defining these as DesignativeICEs, the audit trail can semantically link the *information* that a process was spawned to the *realizable entity* of the new process itself, satisfying the traceability requirements of standards such as NIST 800-53.

## 7.3 Compliance and Verification Protocols

### 7.3.1 Audit Trail Validation

The utilization of the `t_syscall_basic` table as a reference dictionary enables automated validation of audit trails. A compliant eBPF monitoring daemon must map captured kernel events to the `x` values present in this table. If a captured event corresponds to a syscall identifier not present in `t_syscall_basic`, the system must flag a taxonomy violation. This ensures that all observed kernel behaviors are accounted for within the formal ontology.

### 7.3.2 Reporting Standards

When generating audit reports, the system must reference the `id` field rather than relying solely on string names or raw numbers. This practice prevents ambiguity. For example, reporting the occurrence of `550e8400-e29b-41d4-a716-446655440001` is unambiguous, whereas reporting "open" could be confused with the `openat` syscall or standard library functions. The strict adherence to the `cco:DesignativeICE` subclassing axiom guarantees that the reported entity is understood to be a designative record, facilitating accurate legal and technical review of the evidence.

### 7.3.3 Governance Framework Integration

This ontological structure aligns with the `04_ebpf_kernel` family of schemas, which is specifically designed to handle kernel-level telemetry. The `is_complex` flag in the schema metadata (set to `false` for this template) indicates that this is a primitive, atomic definition within the larger framework. It serves as the building block for more complex, multi-entity relationships, such as correlating a `SyscallWrite` (DesignativeICE) with a specific `FileDescriptor` (Independent Continuant) and a `Process` (Agent). By grounding these complex relationships in the simple, verified entries of `t_syscall_basic`, the integrity of the entire governance framework is maintained.

```json
{
  "tables": [
    {
      "name": "t_syscall_basic",
      "rows": [
        [
          "550e8400-e29b-41d4-a716-446655440001",
          "SyscallOpen"
        ],
        [
          "550e8400-e29b-41d4-a716-446655440002",
          "SyscallClose"
        ],
        [
          "550e8400-e29b-41d4-a716-446655440003",
          "SyscallRead"
        ],
        [
          "550e8400-e29b-41d4-a716-446655440004",
          "SyscallWrite"
        ],
        [
          "550e8400-e29b-41d4-a716-446655440005",
          "SyscallStat"
        ],
        [
          "660e8400-e29b-41d4-a716-446655440011",
          "SyscallClone"
        ],
        [
          "660e8400-e29b-41d4-a716-446655440012",
          "SyscallExecve"
        ],
        [
          "660e8400-e29b-41d4-a716-446655440013",
          "SyscallExit"
        ],
        [
          "660e8400-e29b-41d4-a716-446655440014",
          "SyscallKill"
        ],
        [
          "660e8400-e29b-41d4-a716-446655440015",
          "SyscallWait4"
        ]
      ]
    }
  ]
}
```