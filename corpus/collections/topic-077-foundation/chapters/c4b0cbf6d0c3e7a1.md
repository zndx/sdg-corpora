---
chapter_id: c4b0cbf6d0c3e7a1
topic_id: 77
family: 04_ebpf_kernel
cited_terms: ['syscall_basic', 'syscall_audited_by']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Formal Ontology of Kernel Audit Entities

## 7.1 Scope and Preamble

This chapter delineates the formal ontological mapping required for the classification of kernel-level primitives within the eBPF audit framework. The objective is to establish a rigorous, evidence-anchored methodology for translating low-level system calls into high-fidelity information content entities suitable for automated compliance reporting and forensic analysis. The definitions provided herein are derived from the Common Core Ontologies (CCO) and the Basic Formal Ontology (BFO), ensuring that all kernel entities are treated not merely as functional invocations, but as distinct, designative artifacts bearing specific semantic properties. This approach facilitates the deterministic projection of ontological axioms into relational data structures, thereby enabling the verification of security controls against formal governance frameworks.

## 7.2 Designative Information Content Entities

### 7.2.1 Ontological Definition

In the context of kernel instrumentation, a system call must be understood as an information content entity that designates a specific intent or operational state. Under Axiom 1, we define the class of such entities as subclasses of `cco:DesignativeICE`. A Designative Information Content Entity is a distinct type of information artifact that serves to refer to or stand for some other entity—in this case, the specific function or operation requested of the kernel. By classifying system calls as `cco:DesignativeICE`, we abstract the raw binary execution into a semantic object that can be reasoned about, audited, and governed independently of the underlying hardware architecture.

This classification is critical for establishing the provenance of kernel events. It allows the audit subsystem to treat a system call not as a transient state change, but as a durable record of intent. The formalization of this concept ensures that every captured event is anchored to a specific ontological class, providing the necessary granularity for high-assurance environments where non-repudiation is a mandatory requirement.

### 7.2.2 Axiomatic Representation

The foundational axiom for this classification is expressed in the Manchester syntax as:

**Class: {X:Class} SubClassOf: cco:DesignativeICE**

Verbalizing this axiom, we assert that the class X is a designative information content entity. In the context of the `04_ebpf_kernel` family, this implies that any class X representing a system call or kernel primitive inherits the properties of designative entities. This includes the capability to be serialized, logged, and associated with metadata without losing its semantic fidelity. The axiom serves as the primary constraint for the basic registry of kernel observables.

### 7.2.3 Relational Schema and Data Registry

To operationalize Axiom 1, the ontology is projected onto a relational schema that enforces the uniqueness and type integrity of the defined classes. The table `t_syscall_basic` functions as the registry for these entities. The primary key `id` serves as a unique surrogate key for the axiom instance, while the column `x` holds the class identifier (the specific system call or primitive) that satisfies the condition of being a `DesignativeICE`.

The following table presents a subset of the registry, illustrating the instantiation of basic system calls as designative entities. These entries represent the fundamental vocabulary of the kernel audit log.

**Table 7-1: Basic System Call Registry (Axiom 1)**

| id | x |
|---|---|
| uuid-001 | sys_read |
| uuid-002 | sys_write |
| uuid-003 | sys_open |
| uuid-004 | sys_close |
| uuid-005 | sys_stat |
| uuid-006 | sys_fstat |
| uuid-007 | sys_lstat |

*Table 7-1 embodies Axiom 1 by listing specific system call classes (`x`) that are defined as subclasses of `cco:DesignativeICE`. The primary key `id` ensures that each class designation is treated as a distinct, immutable record within the audit database, facilitating referential integrity in subsequent join operations.*

### 7.2.4 Verification and Compliance

Verification of the data in Table 7-1 involves cross-referencing the `x` values against the system's syscall table headers (e.g., `unistd.h`). Compliance officers must ensure that every system call intercepted by the eBPF instrumentation maps to a valid entry in `t_syscall_basic`. Any syscall invoked by a user-space process that lacks a corresponding DesignativeICE entry in this table constitutes an "orphan event" and must be flagged for manual review, as it indicates a potential drift between the ontology and the kernel implementation.

## 7.3 Process-Attributed Audit Entities

### 7.3.1 The AuditedBy Relationship

While the classification of a system call as a Designative Information Content Entity establishes its semantic identity, it does not inherently capture the agency responsible for its invocation. In governance frameworks, accountability is paramount. To address this, we introduce Axiom 2, which extends the definition of certain kernel entities to include an existential restriction: they must be audited by a specific agent.

In the Basic Formal Ontology (BFO), `bfo:0000015` denotes a "Process," representing a temporal span of ongoing activity. By asserting that a class X is `sdg:auditedBy` some `bfo:0000015`, we create a mandatory linkage between the information content entity (the syscall) and the executing process (the agent). This relationship transforms the log entry from a static datum into a dynamic trace of system behavior, ensuring that every action is attributable to a running process context.

### 7.3.2 Axiomatic Representation

The formal axiom for process-attributed entities is expressed as:

**Class: {X:Class} SubClassOf: cco:DesignativeICE, sdg:auditedBy some bfo:0000015**

Verbalizing this axiom, we assert that X is a designative information content entity that is audited by some process. This is a complex axiom that combines the classification of Axiom 1 with a restriction on the `sdg:auditedBy` property. It implies that for an instance of X to be valid or observable, there must exist a process instance that stands in the auditing relationship to it. This effectively filters the universe of system calls to those that require strict process attribution for security monitoring.

### 7.3.3 Relational Schema and High-Value Targets

The projection of Axiom 2 results in the `t_syscall_audited_by` table. While the schema structure mirrors the basic registry in terms of column definition, the semantic population of this table is restricted to those classes that demand high-fidelity process tracking. These typically include system calls related to process control, memory management, or privilege escalation—operations where the identity of the calling process is critical for security posture assessment.

The table below enumerates system calls that fall under this strict governance regime. These are the "high-value targets" for continuous monitoring.

**Table 7-2: Process-Attributed System Calls (Axiom 2)**

| id | x |
|---|---|
| uuid-101 | sys_clone |
| uuid-102 | sys_fork |
| uuid-103 | sys_execve |
| uuid-104 | sys_exit |
| uuid-105 | sys_ptrace |
| uuid-106 | sys_kill |
| uuid-107 | sys_prctl |

*Table 7-2 embodies Axiom 2 by listing classes (`x`) that are not only `cco:DesignativeICE` but also possess the mandatory property `sdg:auditedBy` linking them to a `bfo:0000015` (Process). The primary key `id` distinguishes these specific axiom instances, which serve as the control points for audit policies focusing on process lifecycle and privilege management.*

### 7.3.4 Governance and Audit Trails

The distinction between the entities in Table 7-1 and Table 7-2 is operational. For a generic syscall like `sys_read`, the audit framework may record the occurrence and the parameters. However, for a syscall listed in Table 7-2, such as `sys_execve`, the framework is ontologically obligated to capture and validate the Process ID (PID) and the associated security context (e.g., SELinux labels, cgroups) before the event can be committed to the immutable ledger.

Failure to satisfy the `auditedBy` restriction during the execution of a `sys_execve` call—perhaps due to a race condition where the process descriptor is unavailable—results in a violation of the ontological constraint. In automated compliance systems, this violation triggers an immediate alert, as it suggests a potential subversion of the audit trail or an anomaly in the kernel's process accounting structures.

## 7.4 Integration and Cross-Reference

The effective deployment of these ontological axioms requires a robust integration layer within the eBPF verification pipeline. The kernel modules must be compiled with the awareness of these class definitions. When a probe triggers, the corresponding event data is validated against the schemas defined in Section 7.2 and 7.3.

It is important to note that the schemas provided are deterministic projections of the ontology. The `id` column in both tables serves as the bridge between the ontological reasoning engine and the relational database used for long-term storage. While the `x` column contains the human-readable or kernel-space identifier of the class, the `id` allows the system to maintain consistency even if the naming conventions of the system calls evolve across kernel versions.

Furthermore, the separation of "basic" entities from "audited" entities allows for tiered auditing strategies. In resource-constrained environments (e.g., embedded IoT devices running a filtered kernel), one might choose to instrument only the classes listed in `t_syscall_audited_by`, thereby reducing the performance overhead while maintaining visibility into the most critical process-related events. Conversely, in high-security server environments, full coverage of `t_syscall_basic` is mandated to ensure comprehensive system observability.

## 7.5 Summary of Schema Mappings

To conclude this chapter, we reiterate the structural mappings that facilitate the transition from abstract ontology to concrete data governance. The following summaries reinforce the definitions provided in the preceding sections.

### 7.5.1 Basic System Call Schema
The `t_syscall_basic` table captures the fundamental designation of kernel primitives.
*   **Axiom:** `Class: {X:Class} SubClassOf: cco:DesignativeICE`
*   **Structure:** `id` (Primary Key), `x` (Class Name).
*   **Purpose:** To catalog all system calls recognized as valid information content entities within the system.

### 7.5.2 Process-Attributed System Call Schema
The `t_syscall_audited_by` table captures the subset of primitives requiring strict agency attribution.
*   **Axiom:** `Class: {X:Class} SubClassOf: cco:DesignativeICE, sdg:auditedBy some bfo:0000015`
*   **Structure:** `id` (Primary Key), `x` (Class Name).
*   **Purpose:** To catalog system calls that must be linked to a BFO Process entity to satisfy security and compliance requirements.

By adhering to these definitions and schema constraints, system architects and security auditors ensure that the kernel's runtime behavior is not only observable but semantically grounded in a rigorous, formal framework.

```json
{
  "tables": [
    {
      "name": "t_syscall_basic",
      "rows": [
        [
          "uuid-001",
          "sys_read"
        ],
        [
          "uuid-002",
          "sys_write"
        ],
        [
          "uuid-003",
          "sys_open"
        ],
        [
          "uuid-004",
          "sys_close"
        ],
        [
          "uuid-005",
          "sys_stat"
        ],
        [
          "uuid-006",
          "sys_fstat"
        ],
        [
          "uuid-007",
          "sys_lstat"
        ]
      ]
    },
    {
      "name": "t_syscall_audited_by",
      "rows": [
        [
          "uuid-101",
          "sys_clone"
        ],
        [
          "uuid-102",
          "sys_fork"
        ],
        [
          "uuid-103",
          "sys_execve"
        ],
        [
          "uuid-104",
          "sys_exit"
        ],
        [
          "uuid-105",
          "sys_ptrace"
        ],
        [
          "uuid-106",
          "sys_kill"
        ],
        [
          "uuid-107",
          "sys_prctl"
        ]
      ]
    }
  ]
}
```