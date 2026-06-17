---
chapter_id: 60c5bdeafee330c9
topic_id: 90
family: 04_ebpf_kernel
cited_terms: ['syscall_at_security_tier', 'syscall_audited_by']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Kernel-Level Information Control Entities and Audit Compliance

## 7.1 Scope and Preamble

This chapter investigates issues relevant to effectively managing Information Technology (IT) security controls within the kernel subsystem. The functions of a system call interface provide the basis for exploring challenges facing Management Information Systems (MIS) managers and e-Business security architects. Management of the fast and ever-changing Information Security landscape requires precise definitions of what constitutes a controlled entity and how those entities are monitored. We will examine the formal ontology governing Designative Information Content Entities (DesignativeICE), specifically focusing on their stratification across security tiers and their mandatory relationships with auditing processes. The following sections delineate the structural axioms that define these relationships, supported by relational data mappings essential for compliance reporting and governance verification.

## 7.2 Security Tier Stratification

### 7.2.1 Conceptual Framework

In the context of kernel-level governance, a Designative Information Content Entity (DesignativeICE) refers to any system call or interface that serves as a semantic marker for a specific operation. To enforce the principle of least privilege and maintain system integrity, these entities must not be treated as monolithic instructions. Rather, they are classified according to a strict hierarchy of access controls. This classification is governed by the axiom `atSecurityTier`, which asserts that a specific class of system calls (X) operates within the bounds of a defined security classification (Y).

The relationship between the system call and the security tier is deterministic. A system call designated as `X` is a subclass of `DesignativeICE` and possesses the property `atSecurityTier` with a value of some class `Y`. This implies that the execution of `X` is logically and physically constrained by the policies governing `Y`. For instance, a call that modifies kernel memory structures resides at a fundamentally different tier than a call that reads user-space file descriptors. This distinction is critical for audit readiness, as it allows governance frameworks to automatically filter and prioritize telemetry based on the sensitivity of the operation.

### 7.2.2 Relational Mapping and Instances

To operationalize this axiom for audit and compliance purposes, the conceptual layer is projected onto a relational schema. The primary key for each record is a unique identifier, while the foreign keys link the specific system call (`x`) to its mandated security tier (`y`). The table below illustrates this mapping, providing evidence of how specific kernel functions are anchored to their respective security domains.

**Table 7-1: System Call Security Tier Classification**

| id | x | y |
| :--- | :--- | :--- |
| ST-1001 | `bpf_prog_load` | `Tier0_Superuser` |
| ST-1002 | `mount` | `Tier0_Superuser` |
| ST-1003 | `socket` | `Tier1_Network` |
| ST-1004 | `connect` | `Tier1_Network` |
| ST-1005 | `openat` | `Tier2_FileIO` |
| ST-1006 | `read` | `Tier2_FileIO` |
| ST-1007 | `uname` | `Tier3_PublicInfo` |

The data presented in Table 7-1 demonstrates the application of the security tier axiom. The entity `bpf_prog_load` (id: ST-1001) is explicitly mapped to `Tier0_Superuser`, indicating that this DesignativeICE requires the highest level of privilege and is subject to the most rigorous scrutiny. Conversely, `uname` (id: ST-1007) is mapped to `Tier3_PublicInfo`, reflecting its non-sensitive nature and lower impact on system integrity. This stratification enables automated compliance tools to verify that runtime execution adheres to the static definitions defined in the governance framework.

### 7.2.3 Verification Protocol

When conducting an audit of the kernel configuration, the reviewer must verify that the actual runtime permissions for the identifiers listed in column `x` align with the tier specified in column `y`. Any deviation—such as a `Tier2_FileIO` operation executing with `Tier0_Superuser` privileges—constitutes a critical finding. The axiom ensures that the classification is not merely a documentation artifact but a structural constraint enforced by the system's design.

## 7.3 Audit Trail Verification

### 7.3.1 The AuditedBy Relationship

While security tier classification defines the *potential* impact of an operation, compliance mandates require the *actualization* of monitoring. The second axiom governing this domain asserts that a Designative Information Content Entity (`X`) is necessarily audited by a process. Formally, this is expressed as `X` SubClassOf `cco:DesignativeICE`, `sdg:auditedBy` some `bfo:0000015`.

In this context, `bfo:0000015` refers to a "Process" within the Basic Formal Ontology (BFO). This axiom establishes a hard dependency: for a system call to be compliant within the governed framework, it must be associated with an active auditing agent. This relationship moves beyond passive logging; it implies that the existence of the system call within the execution environment is contingent upon the presence of an observer capable of recording its state, parameters, and return values. This is essential for forensic analysis, non-repudiation, and the fulfillment of regulatory requirements such as those found in SOC 2 or PCI-DSS environments.

### 7.3.2 Relational Mapping and Instances

The projection of this axiom into a relational schema focuses on the subject of the audit. The schema captures the unique identifier of the system call and the call itself, which implicitly links to the auditing process via the ontology definitions. The following table presents a subset of system calls that fall under this mandatory auditing constraint.

**Table 7-2: System Call Audit Designations**

| id | x |
| :--- | :--- |
| AU-2001 | `execve` |
| AU-2002 | `fork` |
| AU-2003 | `ptrace` |
| AU-2004 | `setuid` |
| AU-2005 | `kill` |
| AU-2006 | `renameat2` |

Table 7-2 enumerates critical control points within the kernel. The entity `execve` (id: AU-2001) represents the replacement of a process image, a high-risk event that requires immutable logging. Similarly, `ptrace` (id: AU-2003) allows one process to inspect and control another, posing significant security risks; therefore, it is explicitly designated as a DesignativeICE that must be audited by a BFO Process. The inclusion of `renameat2` (id: AU-2006) highlights that even file manipulation operations, often used in persistence mechanisms or ransomware activities, are subject to this axiom.

### 7.3.3 Compliance Validation

To validate compliance against this axiom, the auditor must query the runtime environment to ensure that an active audit session (BFO:0000015) is attached to the process threads invoking the calls listed in column `x`. The evidence of compliance is the presence of non-empty audit logs corresponding to the identifiers `AU-2001` through `AU-2006` during the reporting period. If a system listed in Table 7-2 executes without generating a corresponding audit record anchored to the observing process, the system is considered to be in a state of non-compliance regarding the `auditedBy` constraint.

```json
{
  "tables": [
    {
      "name": "t_syscall_at_security_tier",
      "rows": [
        [
          "ST-1001",
          "bpf_prog_load",
          "Tier0_Superuser"
        ],
        [
          "ST-1002",
          "mount",
          "Tier0_Superuser"
        ],
        [
          "ST-1003",
          "socket",
          "Tier1_Network"
        ],
        [
          "ST-1004",
          "connect",
          "Tier1_Network"
        ],
        [
          "ST-1005",
          "openat",
          "Tier2_FileIO"
        ],
        [
          "ST-1006",
          "read",
          "Tier2_FileIO"
        ],
        [
          "ST-1007",
          "uname",
          "Tier3_PublicInfo"
        ]
      ]
    },
    {
      "name": "t_syscall_audited_by",
      "rows": [
        [
          "AU-2001",
          "execve"
        ],
        [
          "AU-2002",
          "fork"
        ],
        [
          "AU-2003",
          "ptrace"
        ],
        [
          "AU-2004",
          "setuid"
        ],
        [
          "AU-2005",
          "kill"
        ],
        [
          "AU-2006",
          "renameat2"
        ]
      ]
    }
  ]
}
```