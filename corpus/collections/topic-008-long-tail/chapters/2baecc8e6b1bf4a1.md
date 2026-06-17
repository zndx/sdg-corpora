---
chapter_id: 2baecc8e6b1bf4a1
topic_id: 8
family: 04_ebpf_kernel
cited_terms: ['syscall_audited_by', 'syscall_basic']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Ontological Formalization of Kernel Audit Entities

## 4.1 Scope and Preamble

This chapter delineates the formal ontological classification of kernel-level system calls as Designative Information Content Entities (ICE) within the context of enterprise compliance frameworks. It establishes the necessary criteria for distinguishing between basic designative entities and those subject to active auditing processes pursuant to security governance mandates. The definitions provided herein align with the Common Core Ontologies (CCO) and Basic Formal Ontology (BFO) standards to ensure semantic interoperability across distributed audit logging infrastructures. Specifically, we examine the derivation of relational schemas from OWL axioms to facilitate the rigorous mapping of kernel behaviors to database records suitable for forensic analysis.

## 4.2 Basic Designative Information Content Entities

### 4.2.1 Definition and Ontological Grounding

In the context of kernel observability, a system call must be formally understood not merely as a software interrupt, but as a Designative Information Content Entity (`cco:DesignativeICE`). Per the foundational axioms of the Common Core Ontologies, a DesignativeICE is a type of information content entity that stands for or refers to an independent continuant. In this domain, the system call entity designates the specific kernel function or operation it invokes, serving as a semantic proxy for the underlying code execution path.

The classification of a system call as a DesignativeICE is the primary requirement for its inclusion in the audit ontology. This classification asserts that the entity exists as a distinct informational artifact capable of being recorded, indexed, and retrieved. It does not, by itself, imply that the entity is monitored or logged; rather, it establishes the entity's eligibility to be referenced within the information system. This distinction is critical for governance frameworks that must differentiate between the universe of possible kernel operations and the subset of operations that generate compliance records.

### 4.2.2 Relational Mapping of Basic Entities

To implement this ontological distinction within a relational database management system (RDBMS), we project the class definition onto a schema that captures the identity of the designative entity. The following table embodies the axiom that a specific class of system calls (`X`) is a subclass of `cco:DesignativeICE`. The primary key (`id`) serves as the unique identifier for the class definition within the schema, while the column `x` contains the canonical name of the system call class.

This structure ensures that every entry in the table is axiomatically guaranteed to be a DesignativeICE, providing the foundation for higher-level querying and constraint enforcement.

**Table 4.1: Basic System Call Class Definitions**

| id | x |
| :--- | :--- |
| basic_001 | OpenSyscall |
| basic_002 | ReadSyscall |
| basic_003 | WriteSyscall |
| basic_004 | CloseSyscall |
| basic_005 | StatSyscall |

The data presented in Table 4.1 illustrates the instantiation of the `syscall_basic` template. Each row represents a distinct class (`X`) that satisfies the condition `SubClassOf: cco:DesignativeICE`. For instance, the `OpenSyscall` class is formally defined as a designative entity, meaning it refers to the kernel operation responsible for opening file descriptors. This tabular representation allows auditors to verify that the foundational ontology includes all requisite primitive operations before applying audit-specific constraints.

### 4.2.3 Governance Implications

From a compliance perspective, the recognition of these entities as DesignativeICEs permits the organization to maintain a controlled vocabulary of kernel operations. This vocabulary serves as the authoritative source for defining the scope of system behavior. Without this formal designative step, audit logs would lack semantic grounding, making it difficult to prove that a recorded event corresponds to a defined, governed operation. Therefore, the population of the `t_syscall_basic` table is a preliminary control activity in the audit lifecycle.

## 4.3 Audited System Call Entities

### 4.3.1 The Audit Process Constraint

While all audited system calls are designative entities, not all designative entities are subject to auditing. The subset of system calls that must be captured for security monitoring is defined by a more restrictive axiom. This axiom introduces the object property `sdg:auditedBy`, which links the system call class to a specific instance of a BFO Process (`bfo:0000015`).

`bfo:0000015` represents a processual entity—a temporal span during which certain activities occur. In the context of this framework, the process refers to the audit logging mechanism or the monitoring daemon responsible for intercepting the kernel event. The axiom `Class: {X:Class} SubClassOf: cco:DesignativeICE, sdg:auditedBy some bfo:0000015` asserts that for a class `X` to be considered an "Audited Syscall," there must exist at least one audit process that observes it. This creates a necessary dependency: the existence of the audited entity is contingent upon the existence of the observing process.

### 4.3.2 Relational Mapping of Audited Entities

The relational schema for audited system calls reflects this complex subclassing. The table `t_syscall_audited_by` is derived from the axiom requiring both designative status and the presence of an auditing process. The primary key (`id`) uniquely identifies the audited class, while the column `x` denotes the system call class name.

It is imperative to note that while the schema provided for this table mirrors the structure of the basic table in terms of column definitions, the semantic constraints applied during data entry are significantly stricter. A row may only be inserted into `t_syscall_audited_by` if the corresponding class `X` can be proven to be tracked by an active audit process (the `bfo:0000015` continuant).

**Table 4.2: Audited System Call Class Definitions**

| id | x |
| :--- | :--- |
| audit_001 | ExecveSyscall |
| audit_002 | ConnectSyscall |
| audit_003 | AcceptSyscall |
| audit_004 | MountSyscall |
| audit_005 | SetuidSyscall |

Table 4.2 demonstrates the application of the `syscall_audited_by` template. The classes listed herein—such as `ExecveSyscall` and `ConnectSyscall`—are high-value targets for security monitoring. The inclusion of `ExecveSyscall` (which executes a program) and `SetuidSyscall` (which changes user privileges) reflects standard compliance requirements for tracking privilege escalation and code execution. By virtue of their presence in this table, these entities are axiomatically linked to an audit process, satisfying the `sdg:auditedBy some bfo:0000015` restriction.

### 4.3.3 Verification and Compliance Logic

The distinction between the tables in Section 4.2 and Section 4.3 enables a specific set of compliance checks. Auditors can query the `t_syscall_audited_by` table to retrieve the list of all monitored behaviors and cross-reference them against the `t_syscall_basic` table to ensure that no audited entity exists outside the defined designative universe. Furthermore, the presence of the `auditedBy` property in the underlying axiom implies that if the audit process (the BFO Process) terminates or fails, the validity of the entries in `t_syscall_audited_by` may be called into question. This dependency is essential for maintaining the integrity of the audit trail, as it binds the record of the event to the operational status of the monitoring infrastructure.

```json
{
  "tables": [
    {
      "name": "t_syscall_basic",
      "rows": [
        [
          "basic_001",
          "OpenSyscall"
        ],
        [
          "basic_002",
          "ReadSyscall"
        ],
        [
          "basic_003",
          "WriteSyscall"
        ],
        [
          "basic_004",
          "CloseSyscall"
        ],
        [
          "basic_005",
          "StatSyscall"
        ]
      ]
    },
    {
      "name": "t_syscall_audited_by",
      "rows": [
        [
          "audit_001",
          "ExecveSyscall"
        ],
        [
          "audit_002",
          "ConnectSyscall"
        ],
        [
          "audit_003",
          "AcceptSyscall"
        ],
        [
          "audit_004",
          "MountSyscall"
        ],
        [
          "audit_005",
          "SetuidSyscall"
        ]
      ]
    }
  ]
}
```