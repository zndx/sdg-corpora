---
chapter_id: dbd72f7ef9fe92c5
topic_id: 58
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'pci_dss_requirement', 'control_with_evidence_requirement', 'hipaa_safeguard_physical', 'verification_produces_evidence']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Evidence-Based Compliance Frameworks and Directive Governance

## 4.1 Scope and Preamble

This chapter delineates the structural and functional relationships between regulatory directives, control mechanisms, and evidentiary artifacts within a formalized governance framework. It provides a technical specification for mapping compliance obligations—specifically those derived from the Payment Card Industry Data Security Standard (PCI DSS) and the Health Insurance Portability and Accountability Act (HIPAA)—to executable control directives and verification processes. The content herein is designed to assist compliance officers, internal auditors, and information security managers in establishing a rigorous, auditable chain of custody for regulatory evidence. By defining the ontological links between high-level requirements and granular verification activities, this framework ensures that governance artifacts are not merely static documentation but dynamic components of a continuous compliance monitoring system.

## 4.2 PCI DSS Requirements and Directive Governance

The foundational layer of the compliance architecture consists of specific PCI DSS requirements, which function as binding directives (cco:DirectiveICE). These requirements are not abstract goals but actionable mandates that must be instantiated within the organization's information security policy. The axiom governing this relationship asserts that a specific directive class (X) is a subclass of the DirectiveICE concept and is characterized by a specific PCI DSS requirement (Y).

In practical terms, this mapping translates the regulatory language of the PCI DSS into operational directives. For instance, the requirement to maintain a firewall configuration constitutes a directive that governs network infrastructure changes. The relational integrity of this mapping is critical; a directive must be traceable to a specific requirement ID to ensure auditability. This traceability allows automated governance tools to query the directive layer and report on coverage across the PCI DSS landscape.

The relationship between the directive and the requirement is unidirectional and hierarchical. The directive serves as the enforcement mechanism for the requirement. To maintain referential integrity within the governance database, every PCI DSS requirement entry must be associated with a valid control directive that enforces it. This structure prevents orphaned requirements—mandates for which no enforcement mechanism exists—and ensures that the compliance posture is accurately reflected in the system's state tables.

**Table 4-1: Mapping of PCI DSS Requirements to Control Directives**

| ID | Directive Class (X) | PCI DSS Requirement (Y) |
| :--- | :--- | :--- |
| `PCI_REQ_01` | `NetworkSegmentationDirective` | `REQ_1.2.3` |
| `PCI_REQ_02` | `DataEncryptionStandard` | `REQ_3.4.1` |
| `PCI_REQ_03` | `AccessControlProtocol` | `REQ_7.1.1` |
| `PCI_REQ_04` | `LoggingMechanismDirective` | `REQ_10.2.4` |
| `PCI_REQ_05` | `VulnerabilityManagementPolicy` | `REQ_11.2.1` |

*Table 4-1 illustrates the instantiation of the `t_pci_dss_requirement` schema. The `Directive Class` column represents the specific internal policy or technical directive (X), while the `PCI DSS Requirement` column (Y) provides the foreign key reference to the specific regulatory clause. This mapping ensures that every governance action is anchored to a valid compliance obligation.*

## 4.3 Controls with Evidence Requirements

While directives establish the rules of engagement, controls represent the operational implementation of those rules. However, the existence of a control is insufficient for compliance; the control must generate or retain specific artifacts that prove its operation. The axiom `control_with_evidence_requirement` posits that a directive (X) requires evidence (Y) of a specific class. This evidence is not merely a byproduct but a formalized data object that must adhere to strict retention and integrity policies.

This section introduces a recursive dependency within the compliance ontology. A control directive implemented to satisfy a PCI DSS requirement often requires evidence that is itself defined by a separate, subordinate PCI DSS requirement. For example, a "Password Rotation Control" may require "System Logs" as evidence. The generation and retention of those "System Logs" are governed by a separate PCI DSS requirement regarding audit trail retention. This circular reference—where a control points to a requirement that defines the evidence standard for that control—creates a closed loop of governance. It ensures that the method of verification is as rigorously defined as the control itself.

The schema for this relationship enforces that the evidence requirement (Y) must correspond to a valid entry in the PCI DSS requirement registry. This constraint guarantees that the evidence demanded by a control is not arbitrary but is grounded in the regulatory framework. It prevents "compliance drift," where internal controls demand evidence that is not actually required by the standard, or conversely, fail to demand evidence that is explicitly mandated.

**Table 4-2: Control Directives and Associated Evidence Requirements**

| ID | Control Directive (X) | Evidence Requirement (Y) |
| :--- | :--- | :--- |
| `CTRL_EVID_01` | `FirewallConfigurationControl` | `PCI_REQ_04` |
| `CTRL_EVID_02` | `CryptographyKeyRotation` | `PCI_REQ_01` |
| `CTRL_EVID_03` | `UserAccessReview` | `PCI_REQ_04` |
| `CTRL_EVID_04` | `AntiMalwareScanningEngine` | `PCI_REQ_05` |
| `CTRL_EVID_05` | `WirelessAccessPointAudit` | `PCI_REQ_02` |

*Table 4-2 represents the `t_control_with_evidence_requirement` schema. The `Control Directive` (X) identifies the specific operational control, while the `Evidence Requirement` (Y) references the PCI DSS requirement ID that defines the nature and retention of the evidence. Note the recursive nature of the reference: `CTRL_EVID_01` relies on `PCI_REQ_04` (Logging), which in turn relies on `CTRL_EVID_03` (Access Review), illustrating the interdependency of the control environment.*

## 4.4 HIPAA Physical Safeguards

The governance framework must accommodate multi-regulatory environments. In addition to PCI DSS, organizations handling Protected Health Information (PHI) must adhere to HIPAA Security Standards. Specifically, the Physical Safeguards section of HIPAA mandates physical access controls and facility security. The axiom `hipaa_safeguard_physical` defines a directive (X) that implements a specific HIPAA safeguard (Y).

This mapping is crucial for organizations in the healthcare sector or those processing payment card data in a healthcare context (e.g., hospitals). The directive class here represents the physical security policy—such as "Facility Entry Protocol"—while the safeguard class represents the HIPAA standard, such as "Contingency Operations" or "Access Control and Validation."

The relational structure for this axiom links the HIPAA safeguard directive to the evidence requirement table. This implies that HIPAA safeguards, like PCI controls, are subject to rigorous evidence collection. For example, a directive enforcing "Workstation Use" policies must produce evidence, such as "Security Awareness Training Logs" or "Physical Access Logs," which are defined by the control evidence requirements. This integration allows the organization to maintain a unified evidence repository where artifacts can satisfy multiple regulatory obligations simultaneously, provided the metadata tags are correctly applied.

**Table 4-3: HIPAA Physical Safeguard Directives**

| ID | HIPAA Safeguard Directive (X) | Control Evidence Requirement (Y) |
| :--- | :--- | :--- |
| `HIPAA_PHYS_01` | `WorkstationSecurityPolicy` | `CTRL_EVID_03` |
| `HIPAA_PHYS_02` | `FacilityAccessControlSystem` | `CTRL_EVID_01` |
| `HIPAA_PHYS_03` | `DeviceMediaControlProtocol` | `CTRL_EVID_02` |
| `HIPAA_PHYS_04` | `DisposalAndReusePolicy` | `CTRL_EVID_05` |

*Table 4-3 details the `t_hipaa_safeguard_physical` schema. The `HIPAA Safeguard Directive` (X) maps the physical security measure to a `Control Evidence Requirement` (Y). This foreign key relationship ensures that the evidence collected for HIPAA compliance (e.g., badge access logs) adheres to the same rigorous validation standards as the PCI DSS evidence, promoting a unified compliance architecture.*

## 4.5 Verification Processes and Evidence Production

Compliance is not a static state but a dynamic process of verification. The axiom `verification_produces_evidence` shifts the focus from directives (which are rules) to processes (which are activities). It asserts that a verification process (X), defined as a specific type of process (bfo:0000015), produces evidence (Y) that satisfies a PCI DSS requirement.

This distinction is vital for audit readiness. A directive might mandate a control, but the *verification* process is the mechanism that generates the audit trail. For instance, a "Quarterly Vulnerability Scan" is a process. The output of this process—the scan report—is the evidence artifact. This axiom links the process instance to the requirement it satisfies. It allows the governance framework to query not just *what* controls are in place, but *when* and *how* they were verified.

The schema requires that the evidence produced (Y) be linked to a valid PCI DSS requirement. This constraint ensures that verification activities are goal-oriented; resources are not expended on producing evidence that does not support a specific compliance obligation. Furthermore, by modeling verification as a distinct class of process, the framework can schedule these activities, assign ownership, and track their execution status independently of the controls they verify.

**Table 4-4: Verification Processes and Evidence Output**

| ID | Verification Process (X) | PCI DSS Requirement (Y) |
| :--- | :--- | :--- |
| `VER_PROC_01` | `QuarterlyVulnerabilityScan` | `PCI_REQ_05` |
| `VER_PROC_02` | `ExternalPenetrationTest` | `PCI_REQ_01` |
| `VER_PROC_03` | `DailyLogReviewProcess` | `PCI_REQ_04` |
| `VER_PROC_04` | `BiannualAccessReview` | `PCI_REQ_03` |
| `VER_PROC_05` | `ConfigurationAuditDrill` | `PCI_REQ_02` |

*Table 4-4 corresponds to the `t_verification_produces_evidence` schema. The `Verification Process` (X) identifies the specific operational activity, while the `PCI DSS Requirement` (Y) identifies the compliance obligation satisfied by the evidence produced. This table facilitates the mapping of operational workflows to regulatory compliance, ensuring that every verification step has a distinct compliance purpose.*

## 4.6 Attestation and Supporting Evidence

The final component of the governance framework is the attestation. Attestation is the formal assertion by an authorized party (e.g., a Chief Information Security Officer or Qualified Security Assessor) that the controls have been implemented and are operating effectively. The axiom `attestation_with_supporting_evidence` defines an attestation (X), a subclass of process (bfo:0000015), which is substantiated by supporting evidence (Y).

This axiom serves as the "seal" on the compliance package. An attestation without supporting evidence is invalid; conversely, evidence without attestation is merely unverified data. The relational structure links the attestation record directly to the PCI DSS requirement it covers. This allows for granular attestation—for example, attesting to compliance with Requirement 1 (Firewalls) while Requirement 2 (Encryption) is still under remediation.

The integrity of the attestation process relies on the immutability of the supporting evidence. Because the attestation references a specific requirement ID, any subsequent change to the underlying evidence or the requirement definition would invalidate the attestation. This provides a strong defense against post-hoc modifications of compliance records. In the event of an audit, the attestation table provides the authoritative summary of the organization's compliance posture at a specific point in time, backed by the full chain of evidence defined in the preceding sections.

**Table 4-5: Attestation Records and Evidence Links**

| ID | Attestation Process (X) | PCI DSS Requirement (Y) |
| :--- | :--- | :--- |
| `ATT_01` | `AnnualROCAssertion` | `PCI_REQ_01` |
| `ATT_02` | `QuarterlyComplianceReview` | `PCI_REQ_05` |
| `ATT_03` | `ExecutiveSignOff` | `PCI_REQ_03` |
| `ATT_04` | `ThirdPartyAuditAttestation` | `PCI_REQ_02` |
| `ATT_05` | `InternalControlSelfAssessment` | `PCI_REQ_04` |

*Table 4-5 represents the `t_attestation_with_supporting_evidence` schema. The `Attestation Process` (X) records the formal assertion event, referencing the `PCI DSS Requirement` (Y) that it validates. This table acts as the index for the compliance report, aggregating the results of the verification processes and control directives into a definitive statement of adherence.*

```json
{
  "tables": [
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "PCI_REQ_01",
          "NetworkSegmentationDirective",
          "REQ_1.2.3"
        ],
        [
          "PCI_REQ_02",
          "DataEncryptionStandard",
          "REQ_3.4.1"
        ],
        [
          "PCI_REQ_03",
          "AccessControlProtocol",
          "REQ_7.1.1"
        ],
        [
          "PCI_REQ_04",
          "LoggingMechanismDirective",
          "REQ_10.2.4"
        ],
        [
          "PCI_REQ_05",
          "VulnerabilityManagementPolicy",
          "REQ_11.2.1"
        ]
      ]
    },
    {
      "name": "t_control_with_evidence_requirement",
      "rows": [
        [
          "CTRL_EVID_01",
          "FirewallConfigurationControl",
          "PCI_REQ_04"
        ],
        [
          "CTRL_EVID_02",
          "CryptographyKeyRotation",
          "PCI_REQ_01"
        ],
        [
          "CTRL_EVID_03",
          "UserAccessReview",
          "PCI_REQ_04"
        ],
        [
          "CTRL_EVID_04",
          "AntiMalwareScanningEngine",
          "PCI_REQ_05"
        ],
        [
          "CTRL_EVID_05",
          "WirelessAccessPointAudit",
          "PCI_REQ_02"
        ]
      ]
    },
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        [
          "HIPAA_PHYS_01",
          "WorkstationSecurityPolicy",
          "CTRL_EVID_03"
        ],
        [
          "HIPAA_PHYS_02",
          "FacilityAccessControlSystem",
          "CTRL_EVID_01"
        ],
        [
          "HIPAA_PHYS_03",
          "DeviceMediaControlProtocol",
          "CTRL_EVID_02"
        ],
        [
          "HIPAA_PHYS_04",
          "DisposalAndReusePolicy",
          "CTRL_EVID_05"
        ]
      ]
    },
    {
      "name": "t_verification_produces_evidence",
      "rows": [
        [
          "VER_PROC_01",
          "QuarterlyVulnerabilityScan",
          "PCI_REQ_05"
        ],
        [
          "VER_PROC_02",
          "ExternalPenetrationTest",
          "PCI_REQ_01"
        ],
        [
          "VER_PROC_03",
          "DailyLogReviewProcess",
          "PCI_REQ_04"
        ],
        [
          "VER_PROC_04",
          "BiannualAccessReview",
          "PCI_REQ_03"
        ],
        [
          "VER_PROC_05",
          "ConfigurationAuditDrill",
          "PCI_REQ_02"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "ATT_01",
          "AnnualROCAssertion",
          "PCI_REQ_01"
        ],
        [
          "ATT_02",
          "QuarterlyComplianceReview",
          "PCI_REQ_05"
        ],
        [
          "ATT_03",
          "ExecutiveSignOff",
          "PCI_REQ_03"
        ],
        [
          "ATT_04",
          "ThirdPartyAuditAttestation",
          "PCI_REQ_02"
        ],
        [
          "ATT_05",
          "InternalControlSelfAssessment",
          "PCI_REQ_04"
        ]
      ]
    }
  ]
}
```