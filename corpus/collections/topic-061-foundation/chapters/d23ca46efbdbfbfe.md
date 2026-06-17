---
chapter_id: d23ca46efbdbfbfe
topic_id: 61
family: 03_directive_governance
cited_terms: ['control_only_addresses_threat_class', 'log_record_subclass', 'audit_targets_data_artifact']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Governance Directives, Log Artifacts, and Audit Provenance

## 4.1 Scope and Preamble

This chapter delineates the structural relationships between governance directives, informational artifacts, and audit processes within a compliant enterprise architecture. The content herein defines the ontological constraints governing risk mitigation controls, the classification of log records as evidentiary artifacts, and the procedural definition of audit targets. Adherence to these axioms ensures that security postures are not only implemented but are verifiable through deterministic traceability between controls, the risks they address, and the processes that audit them. The following sections provide formal definitions, relational mappings, and implementation guidelines for each component of the governance triad.

## 4.2 Control Directives and Risk Addressal

### 4.2.1 Definition and Ontology

In the context of information security governance, a Control Directive is formally classified as an `InformationControlElement` (ICE). The primary axiom governing this entity asserts that a specific control class exists solely to address a specific class of risk. This relationship is not merely associative but is restrictive; the control is defined by its capacity to mitigate the designated threat vector.

Formally, the axiom is expressed as:
> **Class:** {Control} **SubClassOf:** `cco:DirectiveICE`, `sdg:addressesRisk` only {Risk}

This verbalization implies that for any instance of a Control Directive, the scope of its risk addressal is limited to a specific Risk Class. This constraint prevents scope creep in control implementation and ensures that governance frameworks remain auditable. If a control purports to address a risk outside its defined class, it violates the ontological structure of the governance model.

### 4.2.2 Implementation and Relational Mapping

To implement this axiom within a relational database schema, the mapping between the Control (`X`) and the Risk (`Y`) must be recorded with high precision. The primary key of the control table serves as the reference point for the governance framework. The foreign key constraint linking the addressed risk (`Y`) to the log record subclass ensures that the risk being addressed is a recognized, logged event within the system.

The table below, `t_control_only_addresses_threat_class`, enumerates specific control directives and the precise threat classes they are designed to mitigate. Note that the `y` column references the identifier of the threat class, which must exist as a valid log record subclass.

**Table 4.1: Control Directives and Addressed Threat Classes**

| id | x (Control Directive) | y (Addressed Risk Class) |
| :--- | :--- | :--- |
| CTRL-ADM-01 | `AdministrativePrivilegeControl` | LOG-RSK-001 |
| CTRL-NET-02 | `NetworkSegmentationDirective` | LOG-RSK-002 |
| CTRL-DAT-03 | `DataAtRestEncryptionStandard` | LOG-RSK-003 |
| CTRL-APP-04 | `ApplicationInputValidationControl` | LOG-RSK-004 |
| CTRL-ACC-05 | `AccessControlListPolicy` | LOG-RSK-005 |

### 4.2.3 Governance Implications

The strict "only" constraint in the axiom necessitates that governance bodies review control definitions regularly. If a threat class evolves—for instance, if `LOG-RSK-002` expands to include lateral movement via encrypted channels—the control `CTRL-NET-02` must be formally re-evaluated to determine if it still addresses the full scope of the risk. If it does not, a new control must be instantiated, or the existing axiom must be revised. This rigidity is a feature, not a bug, as it prevents the vague assignment of responsibilities often found in ad-hoc security policies.

## 4.3 Log Artifacts and Severity Classification

### 4.3.1 Definition and Ontology

Log records are the fundamental units of evidence in any digital forensic or compliance investigation. Ontologically, a Log Record is a subclass of an `Artifact`. However, not all artifacts are created equal; a log record gains its significance from its severity level. The severity is not an intrinsic property of the data format but is derived from the risk it represents and the control that governs it.

The governing axiom for this concept is:
> **Class:** {LogRecord} **SubClassOf:** `cco:Artifact`, `sdg:hasLogSeverity` some {Severity}

This structure posits that a Log Record (`X`) possesses a log severity (`Y`). In a complex governance framework, the severity classification is often circular in relation to the control: the severity of a log event is defined by the control directive that addresses the risk it represents. This creates a closed loop of verification where the control validates the log, and the log's severity validates the control's relevance.

### 4.3.2 Implementation and Relational Mapping

The relational schema for log records, `t_log_record_subclass`, captures this duality. The table stores the Log Record class (`x`) and its associated Severity (`y`). To maintain referential integrity and the closed-loop verification described above, the severity column (`y`) is structurally linked to the Control Directive table. This ensures that a severity classification cannot exist in a vacuum; it must be backed by a valid control directive.

The table below illustrates this mapping. Each log record is an artifact generated by a system event, and its severity is codified by referencing the specific control ID that manages that risk class.

**Table 4.2: Log Record Subclasses and Severity Mappings**

| id | x (Log Record Artifact) | y (Severity / Control Ref) |
| :--- | :--- | :--- |
| LOG-RSK-001 | `PrivilegeEscalationEvent` | CTRL-ADM-01 |
| LOG-RSK-002 | `CrossSubnetTrafficSpike` | CTRL-NET-02 |
| LOG-RSK-003 | `UnencryptedStorageAccess` | CTRL-DAT-03 |
| LOG-RSK-004 | `SQLInjectionSignature` | CTRL-APP-04 |
| LOG-RSK-005 | `UnauthorizedFileAccessAttempt` | CTRL-ACC-05 |

### 4.3.3 Audit and Compliance Considerations

When an auditor reviews system logs, they are effectively querying the `t_log_record_subclass` table. The presence of a log entry without a valid severity reference (a null or broken foreign key) indicates a failure in the logging pipeline or a gap in the governance framework. For example, if a `PrivilegeEscalationEvent` is logged but lacks the reference to `CTRL-ADM-01`, the event cannot be triaged according to the administrative control policy, rendering the audit trail incomplete. Therefore, maintaining the integrity of the foreign key constraint between the log artifact and the control directive is a critical compliance requirement.

## 4.4 Audit Processes and Target Artifacts

### 4.4.1 Definition and Ontology

While controls and logs represent the static and operational layers of security, the Audit Process represents the temporal, procedural layer. An audit is defined as a `Process` (specifically, a realization of `bfo:0000015` in the Basic Formal Ontology) that acts upon data artifacts. The audit does not create the artifact; it examines it to verify the efficacy of the controls.

The relevant axiom is:
> **Class:** {Audit} **SubClassOf:** `bfo:Process`, `sdg:auditsControl` some `cco:Artifact`

This verbalization defines an Audit (`X`) as a process that audits a control artifact. This distinction is vital: the audit targets the *artifact* (the log, the configuration file, the policy document) which serves as the proxy for the control itself. The audit process validates that the artifact exists, is unaltered, and contains the expected data entries consistent with the control directives.

### 4.4.2 Implementation and Relational Mapping

The relational schema for audit processes, `t_audit_targets_data_artifact`, is distinct in that it focuses on the definition of the audit process itself. The schema captures the Audit ID (`id`) and the Audit Process Class (`x`). While the axiom links the audit to `cco:Artifact`, the schema provided focuses on the enumeration of valid audit process types.

The table below lists the standardized audit processes utilized within the governance framework. Each process is defined by its procedural objective and the specific type of artifact it examines.

**Table 4.3: Audit Process Definitions and Targets**

| id | x (Audit Process) |
| :--- | :--- |
| AUD-PROC-01 | `QuarterlyAccessControlReview` |
| AUD-PROC-02 | `AnnualEncryptionKeyRotationAudit` |
| AUD-PROC-03 | `ContinuousNetworkSegmentationVerification` |
| AUD-PROC-04 | `WebApplicationVulnerabilityScanAudit` |
| AUD-PROC-05 | `FileSystemIntegrityCheckAudit` |

### 4.4.3 Operational Execution

In practice, the execution of `AUD-PROC-01` (Quarterly Access Control Review) involves querying the artifacts defined in Section 4.3 (Log Records) to verify that the controls defined in Section 4.2 (Control Directives) are functioning. The auditor looks for `PrivilegeEscalationEvent` logs (Table 4.2) to validate the `AdministrativePrivilegeControl` (Table 4.1). If the audit process returns a null set of artifacts for a given control, the audit findings must flag a "Control Implementation Failure."

The ontology ensures that the audit process is not a vague activity but a specific class of process with a defined target: the artifact. By anchoring the audit in `bfo:Process`, the framework acknowledges that an audit occurs over time and has a start and end state, distinct from the static existence of the controls and logs it examines.

```json
{
  "tables": [
    {
      "name": "t_control_only_addresses_threat_class",
      "rows": [
        [
          "CTRL-ADM-01",
          "AdministrativePrivilegeControl",
          "LOG-RSK-001"
        ],
        [
          "CTRL-NET-02",
          "NetworkSegmentationDirective",
          "LOG-RSK-002"
        ],
        [
          "CTRL-DAT-03",
          "DataAtRestEncryptionStandard",
          "LOG-RSK-003"
        ],
        [
          "CTRL-APP-04",
          "ApplicationInputValidationControl",
          "LOG-RSK-004"
        ],
        [
          "CTRL-ACC-05",
          "AccessControlListPolicy",
          "LOG-RSK-005"
        ]
      ]
    },
    {
      "name": "t_log_record_subclass",
      "rows": [
        [
          "LOG-RSK-001",
          "PrivilegeEscalationEvent",
          "CTRL-ADM-01"
        ],
        [
          "LOG-RSK-002",
          "CrossSubnetTrafficSpike",
          "CTRL-NET-02"
        ],
        [
          "LOG-RSK-003",
          "UnencryptedStorageAccess",
          "CTRL-DAT-03"
        ],
        [
          "LOG-RSK-004",
          "SQLInjectionSignature",
          "CTRL-APP-04"
        ],
        [
          "LOG-RSK-005",
          "UnauthorizedFileAccessAttempt",
          "CTRL-ACC-05"
        ]
      ]
    },
    {
      "name": "t_audit_targets_data_artifact",
      "rows": [
        [
          "AUD-PROC-01",
          "QuarterlyAccessControlReview"
        ],
        [
          "AUD-PROC-02",
          "AnnualEncryptionKeyRotationAudit"
        ],
        [
          "AUD-PROC-03",
          "ContinuousNetworkSegmentationVerification"
        ],
        [
          "AUD-PROC-04",
          "WebApplicationVulnerabilityScanAudit"
        ],
        [
          "AUD-PROC-05",
          "FileSystemIntegrityCheckAudit"
        ]
      ]
    }
  ]
}
```