---
chapter_id: 4c7f949cb9ecc9fb
topic_id: 131
family: 04_ebpf_kernel
cited_terms: ['syscall_audited_by']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Formal Ontologies for Kernel Audit Compliance

## 7.1 Scope and Preamble

This chapter delineates the formal ontological structures required to map low-level kernel system calls to high-level governance frameworks. In environments requiring strict adherence to security controls—such as financial transaction processing systems, classified defense networks, and regulated healthcare infrastructures—mere logging of kernel events is insufficient. Instead, information content entities must be formally defined as designative entities subject to specific audit processes. The following sections establish the axiomatic foundation for classifying system calls as `DesignativeICE` objects and detail their relationship to auditing processes via the `auditedBy` property. This mapping ensures that kernel observability data is not only captured but is semantically anchored to compliance requirements, facilitating automated reasoning and evidence verification.

## 7.2 Designative Information Content Entities in Kernel Space

### 7.2.1 The Concept of DesignativeICE

Within the Common Core Ontologies (CCO), a `Designative Information Content Entity` (DesignativeICE) is defined as an information content entity that denotes or refers to a specific entity or class of entities. In the context of kernel auditing, a system call is not merely a functional instruction executed by the processor; it is an information-bearing artifact that designates a specific intent or security-relevant action. For example, the `execve` system call designates the intent to replace the current process image with a new one. By formally classifying system calls as instances of `DesignativeICE`, auditors and automated compliance tools can treat these calls as semantic objects rather than raw binary instructions.

This formalization allows for the application of descriptive metadata to kernel events. When a system call is recognized as a `DesignativeICE`, it becomes eligible for governance protocols that apply to information management. This distinction is critical for establishing the "chain of evidence" required in high-assurance audits. Without this ontological classification, a system call is merely a memory address; with it, the call becomes a verifiable, governed entity within the system's logical architecture.

### 7.2.2 Axiomatic Definition: Syscall Audited By

The core relationship governing these entities is defined by the axiom `syscall_audited_by`. This axiom asserts that a specific class of system calls (denoted as variable `{X}`) is a subclass of `cco:DesignativeICE` and is semantically linked to an auditing process via the property `sdg:auditedBy`. The object of this property is `bfo:0000015`, which in the Basic Formal Ontology (BFO) represents a "Process."

This axiom implies that the existence of the system call class is inextricably bound to the process that audits it. It is not sufficient for the call to exist; it must be designated as an entity that is "audited by" a specific process. This structure enforces a dependency where the validity of the system call's execution is contingent upon the successful operation of the audit process. In a compliance scenario, this allows a governance engine to query the ontology and verify that for every instance of class `{X}`, a corresponding audit process instance exists and is active.

### 7.2.3 Relational Schema for Syscall Classification

To implement this axiom within a relational database infrastructure—such as an SQL-backed SIEM (Security Information and Event Management) system—the following schema is utilized. This table, `t_syscall_audited_by`, serves as the registry for system call classes that have been formally designated as auditable entities.

**Table 7.1: System Call Audit Classification Registry**

The following table embodies the axiom `syscall_audited_by`. The primary key is `id`, which serves as a unique identifier for the classification rule. The column `x` represents the specific Class of system call being designated. This structure ensures that every auditable system call class is explicitly enumerated and linked to the governance framework.

| id | x |
| :--- | :--- |
| audit_sys_001 | FileIO_Syscall_Class |
| audit_sys_002 | Network_Socket_Class |
| audit_sys_003 | Process_Control_Class |
| audit_sys_004 | Privilege_Escalation_Class |
| audit_sys_005 | Memory_Management_Class |

In this schema, the value `x` (e.g., `FileIO_Syscall_Class`) is a reference to the ontology class definition. By populating this table, the organization formally declares that these specific classes of information content entities are subject to the `auditedBy` relationship. This registry acts as the control list for audit daemon configuration, ensuring that only defined classes are monitored, thereby reducing noise and focusing resources on governance-relevant kernel activities.

## 7.3 The Audit Process and BFO Process Integration

### 7.3.1 The Role of `bfo:0000015` (Process)

The object property `sdg:auditedBy` maps the system call class to `bfo:0000015`, a BFO entity representing a "Process." In this context, the audit process is not merely a software script but a temporally extended entity that unfolds over time. It encompasses the entire lifecycle of the audit event: the interception of the system call, the extraction of metadata, the logging of the event, and the subsequent verification of the log integrity.

By anchoring the audit mechanism to a formal BFO Process, the ontology facilitates complex reasoning about temporal and causal relationships. For instance, one can infer that if the Audit Process is terminated or fails, the system calls designated as `auditedBy` that process are effectively in a non-compliant state. This integration allows the system to model the dependencies between the operational state of the monitoring infrastructure and the compliance status of the kernel operations.

### 7.3.2 Operationalizing the Audit Relationship

The operationalization of the `syscall_audited_by` axiom requires a tight coupling between the kernel subsystem (e.g., eBPF probes or LSM hooks) and the userspace audit daemon. When a system call matching a class defined in `t_syscall_audited_by` is invoked, the kernel must trigger the corresponding BFO Process instance.

To verify the correct implementation of this axiom, auditors must cross-reference the runtime execution logs against the static definitions in the registry. The following table, `t_audit_process_execution`, represents a runtime view of the audit process (`bfo:0000015`) acting upon instances of the designated system call classes. While not explicitly defined in the primary axiom schema, this table is necessary to evidence the "auditedBy" relationship in practice.

**Table 7.2: Audit Process Execution Log**

This table illustrates the instantiation of the `auditedBy` relationship. It links the specific system call class (referenced via `syscall_class_ref`) to the process ID (`pid`) of the audit daemon handling the event. The `timestamp` provides the temporal dimension required by the BFO Process definition.

| event_id | syscall_class_ref | audit_pid | timestamp | status_code |
| :--- | :--- | :--- | :--- | :--- |
| evt_99281 | FileIO_Syscall_Class | 4022 | 2023-10-27T14:30:05Z | 0 (SUCCESS) |
| evt_99282 | Network_Socket_Class | 4022 | 2023-10-27T14:30:06Z | 0 (SUCCESS) |
| evt_99283 | Process_Control_Class | 4022 | 2023-10-27T14:30:07Z | -1 (BUFFER_FULL) |
| evt_99284 | Privilege_Escalation_Class | 4022 | 2023-10-27T14:30:08Z | 0 (SUCCESS) |
| evt_99285 | Memory_Management_Class | 4022 | 2023-10-27T14:30:09Z | 0 (SUCCESS) |

The data in Table 7.2 provides evidence that the classes defined in Table 7.1 are actively being audited. The entry for `evt_99283` with a status code of `-1` indicates a failure in the audit process (buffer overflow), which, under the strict interpretation of the ontology, implies a lapse in the `auditedBy` relationship for that specific event instance. This triggers a compliance violation that must be remediated.

## 7.4 Compliance Verification and Evidence Anchoring

### 7.4.1 Verifying Axiom Consistency

To maintain the integrity of the governance framework, regular compliance audits must verify that the runtime environment aligns with the ontological definitions defined in Section 7.2. This involves a two-step verification process:

1.  **Schema Validation:** Querying the `t_syscall_audited_by` table to ensure all critical system call classes are enumerated. Any system call invoked in the kernel that matches a security-sensitive pattern but is absent from this table constitutes a "shadow" or unmonitored entity, violating the principle of complete audit coverage.
2.  **Runtime Correlation:** Correlating the `t_audit_process_execution` logs against the `t_syscall_audited_by` registry. For every class `X` in the registry, there must be corresponding log entries in the execution log. A class defined in the registry but absent from the logs suggests a misconfiguration in the audit probes (e.g., a detached eBPF program).

### 7.4.2 Governance Reporting

The ultimate output of this ontological structure is a standardized governance report. By querying the joined data of the classification registry and the execution logs, auditors can generate statements such as:

> "During the reporting period Q3 2023, all instances of `Privilege_Escalation_Class` (ID: audit_sys_004) were successfully captured by Audit Process 4022, satisfying the `sdg:auditedBy` requirement. However, `Process_Control_Class` (ID: audit_sys_003) experienced a 0.5% failure rate in the audit process, indicating potential gaps in the `bfo:0000015` resource allocation."

This level of precision is only achievable when the underlying data structures mirror the formal ontology. The use of `DesignativeICE` as a superclass ensures that the focus remains on the *information* conveyed by the system call, rather than its implementation details, while the `auditedBy` property ensures that this information is subjected to rigorous, ontologically grounded oversight.

```json
{
  "tables": [
    {
      "name": "t_syscall_audited_by",
      "rows": [
        [
          "audit_sys_001",
          "FileIO_Syscall_Class"
        ],
        [
          "audit_sys_002",
          "Network_Socket_Class"
        ],
        [
          "audit_sys_003",
          "Process_Control_Class"
        ],
        [
          "audit_sys_004",
          "Privilege_Escalation_Class"
        ],
        [
          "audit_sys_005",
          "Memory_Management_Class"
        ]
      ]
    },
    {
      "name": "t_audit_process_execution",
      "rows": [
        [
          "evt_99281",
          "FileIO_Syscall_Class",
          "4022",
          "2023-10-27T14:30:05Z",
          "0 (SUCCESS)"
        ],
        [
          "evt_99282",
          "Network_Socket_Class",
          "4022",
          "2023-10-27T14:30:06Z",
          "0 (SUCCESS)"
        ],
        [
          "evt_99283",
          "Process_Control_Class",
          "4022",
          "2023-10-27T14:30:07Z",
          "-1 (BUFFER_FULL)"
        ],
        [
          "evt_99284",
          "Privilege_Escalation_Class",
          "4022",
          "2023-10-27T14:30:08Z",
          "0 (SUCCESS)"
        ],
        [
          "evt_99285",
          "Memory_Management_Class",
          "4022",
          "2023-10-27T14:30:09Z",
          "0 (SUCCESS)"
        ]
      ]
    }
  ]
}
```