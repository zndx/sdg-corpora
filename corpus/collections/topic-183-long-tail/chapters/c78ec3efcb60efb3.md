---
chapter_id: c78ec3efcb60efb3
topic_id: 183
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'hipaa_safeguard_technical', 'hipaa_safeguard_physical', 'hipaa_safeguard_admin', 'iso27001_annexa_subclass']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Cross-Framework Compliance Mapping and Control Directives

## 4.1 Scope and Preamble

This chapter establishes the formal ontology for mapping organizational control directives to specific regulatory requirements across three distinct governance frameworks: the Payment Card Industry Data Security Standard (PCI DSS), the Health Insurance Portability and Accountability Act (HIPAA), and the ISO/IEC 27001 information security standard. The objective is to provide a deterministic relational structure that anchors internal controls (expressed as `cco:DirectiveICE`) to external compliance obligations. By formalizing these mappings, organizations can automate audit evidence collection, perform gap analysis across disparate regulatory regimes, and ensure that technical, physical, and administrative safeguards are rigorously defined. The following sections detail the axiomatic relationships for each framework, supported by relational data tables that instantiate these mappings with realistic control objects.

## 4.2 PCI DSS Requirement Mapping

The Payment Card Industry Data Security Standard (PCI DSS) prescribes a robust set of requirements intended to ensure the secure handling of cardholder data. Within the ontology, the relationship between an internal control directive and a PCI DSS requirement is governed by the axiom `pci_dss_requirement`. This axiom asserts that a specific class of directive (X) is a subclass of `cco:DirectiveICE` and satisfies a specific PCI DSS requirement (Y). This mapping is critical for validating that a system configuration or policy explicitly addresses a mandate such as Requirement 3 (protect stored cardholder data) or Requirement 8 (identify and authenticate access).

### 4.2.1 Implementation of Requirement Directives

In practice, a directive such as "Data Encryption at Rest" must be demonstrably linked to "PCI DSS Requirement 3" to satisfy external auditors. The ontology allows for the granular classification of these directives, ensuring that the scope of the control matches the granularity of the regulatory text. For instance, a directive pertaining to the use of strong cryptography must map specifically to the sub-requirements of Requirement 3, rather than the general requirement itself, to provide sufficient evidence granularity during a Level 1 onsite assessment.

The following table embodies the `pci_dss_requirement` axiom. The primary key is the `id` column, which uniquely identifies the mapping instance. The `x` column represents the internal directive class (the subject), and the `y` column represents the PCI DSS requirement class (the object). The structure ensures that every directive listed is explicitly bound to a specific compliance obligation.

| Table: t_pci_dss_requirement |
| :--- |
| **Schema:** `CREATE TABLE t_pci_dss_requirement (id VARCHAR(255), x VARCHAR(255), y VARCHAR(255) NOT NULL, PRIMARY KEY (id))` |

| id | x | y |
| :--- | :--- | :--- |
| map_pci_001 | FirewallConfigurationDirective | PCI_DSS_Req_1 |
| map_pci_002 | VendorDefaultPasswordDirective | PCI_DSS_Req_2 |
| map_pci_003 | StoredDataEncryptionDirective | PCI_DSS_Req_3 |
| map_pci_004 | TransmissionEncryptionDirective | PCI_DSS_Req_4 |
| map_pci_005 | AntiMalwareDirective | PCI_DSS_Req_5 |
| map_pci_006 | VulnerabilityManagementDirective | PCI_DSS_Req_6 |
| map_pci_007 | AccessControlDirective | PCI_DSS_Req_7 |

## 4.3 HIPAA Technical Safeguards

Under the HIPAA Security Rule, covered entities and business associates must implement technical safeguards to protect electronic Protected Health Information (ePHI). The `hipaa_safeguard_technical` axiom defines the relationship between a directive class and the technical policies and procedures required by 45 CFR § 164.312. Unlike physical or administrative safeguards, technical safeguards involve the technology and the policy and procedures for its use that protect electronic health information and control access to it.

### 4.3.1 Access Control and Audit Mechanisms

The technical safeguards are divided into four specific implementation specifications: Access Control (§ 164.312(a)(1)), Audit Controls (§ 164.312(b)), Integrity Controls (§ 164.312(c)(1)), and Transmission Security (§ 164.312(e)(1)). The ontology maps specific technical directives—such as "Unique User Identification" or "Emergency Access Procedure"—to these high-level safeguard classes. This mapping ensures that technical implementations, like the deployment of an Intrusion Detection System (IDS) or the configuration of Active Directory password policies, are formally recognized as satisfying the "Technical Safeguard" category of the Security Rule.

The following table embodies the `hipaa_safeguard_technical` axiom. The `id` serves as the primary key. The `x` column contains the class of the technical directive, while the `y` column contains the class of the HIPAA technical safeguard it satisfies. This structure enforces the constraint that a technical safeguard cannot be null (`y VARCHAR(255) NOT NULL`), ensuring every mapped directive addresses a specific regulatory control.

| Table: t_hipaa_safeguard_technical |
| :--- |
| **Schema:** `CREATE TABLE t_hipaa_safeguard_technical (id VARCHAR(255), x VARCHAR(255), y VARCHAR(255) NOT NULL, PRIMARY KEY (id))` |

| id | x | y |
| :--- | :--- | :--- |
| map_hip_tech_01 | UniqueUserLoginDirective | AccessControl |
| map_hip_tech_02 | EmergencyAccessProcedureDirective | AccessControl |
| map_hip_tech_03 | AutomaticLogoffDirective | AccessControl |
| map_hip_tech_04 | AuditLogReviewDirective | AuditControl |
| map_hip_tech_05 | DataIntegrityCheckDirective | IntegrityControl |
| map_hip_tech_06 | EncryptionInTransitDirective | TransmissionSecurity |

## 4.4 HIPAA Physical Safeguards

Physical safeguards are measures to protect electronic information systems and related buildings and equipment from natural and environmental hazards, and unauthorized intrusion. The `hipaa_safeguard_physical` axiom maps directives to the physical requirements outlined in 45 CFR § 164.310(a). This category encompasses facility access controls, workstation use, and device and media controls. The ontology treats these as distinct classes of directives that must be instantiated to prove compliance with the physical aspect of the HIPAA Security Rule.

### 4.4.1 Facility Access and Workstation Security

Compliance with physical safeguards often requires tangible evidence, such as badge access logs, security camera footage, or inventory lists for hardware. The directive "Facility Security Plan" maps to the "Facility Access Controls" safeguard. Similarly, a "Workstation Location Policy" maps to the "Workstation Use" safeguard, ensuring that screens are not visible to unauthorized personnel. The ontology allows security officers to query all directives classified under `hipaa_safeguard_physical` to generate a checklist for the physical site inspection portion of a HIPAA audit.

The following table embodies the `hipaa_safeguard_physical` axiom. The primary key is `id`, uniquely identifying the mapping. The `x` column represents the physical directive class, and the `y` column represents the HIPAA physical safeguard class. This schema supports the auditing of physical security assets by linking specific policies (e.g., "Disposal of Media") to their regulatory justification (e.g., "Device and Media Controls").

| Table: t_hipaa_safeguard_physical |
| :--- |
| **Schema:** `CREATE TABLE t_hipaa_safeguard_physical (id VARCHAR(255), x VARCHAR(255), y VARCHAR(255) NOT NULL, PRIMARY KEY (id))` |

| id | x | y |
| :--- | :--- | :--- |
| map_hip_phys_01 | ContingencyOperationsDirective | FacilityAccessControls |
| map_hip_phys_02 | SecurityGuardEscortDirective | FacilityAccessControls |
| map_hip_phys_03 | MaintenanceRecordDirective | FacilityAccessControls |
| map_hip_phys_04 | WorkstationSecurityDirective | WorkstationUse |
| map_hip_phys_05 | MediaDisposalDirective | DeviceAndMediaControls |
| map_hip_phys_06 | MediaReceivingDirective | DeviceAndMediaControls |

## 4.5 HIPAA Administrative Safeguards

Administrative safeguards are the administrative actions, policies, and procedures to manage the selection, development, implementation, and maintenance of security measures to protect electronic protected health information. These safeguards are often the most extensive and complex, involving workforce training, security management processes, and contingency planning. The `hipaa_safeguard_admin` axiom formalizes the relationship between organizational policy directives and the administrative requirements of 45 CFR § 164.308.

### 4.5.1 Security Management and Training

The administrative safeguards require a top-down approach. For example, a "Risk Analysis" directive maps to the "Security Management Process" safeguard. Similarly, "Workforce Authorization" policies map to "Workforce Security." This section of the ontology is crucial for governance, risk, and compliance (GRC) platforms, as it links the soft controls (policies and procedures) to the hard regulatory requirements. It ensures that administrative actions, such as the assignment of a security officer or the sanctioning of employees for policy violations, are captured as compliant directives.

The following table embodies the `hipaa_safeguard_admin` axiom. The `id` is the primary key. The `x` column defines the administrative directive class, and the `y` column defines the HIPAA administrative safeguard class. This relational structure ensures that all administrative activities are traceable to a specific clause in the Security Rule, facilitating the "Addressable" vs. "Required" implementation specification analysis.

| Table: t_hipaa_safeguard_admin |
| :--- |
| **Schema:** `CREATE TABLE t_hipaa_safeguard_admin (id VARCHAR(255), x VARCHAR(255), y VARCHAR(255) NOT NULL, PRIMARY KEY (id))` |

| id | x | y |
| :--- | :--- | :--- |
| map_hip_admin_01 | RiskAnalysisDirective | SecurityManagementProcess |
| map_hip_admin_02 | RiskManagementStrategyDirective | SecurityManagementProcess |
| map_hip_admin_03 | SanctionPolicyDirective | WorkforceSecurity |
| map_hip_admin_04 | SecurityAwarenessTrainingDirective | SecurityAwarenessAndTraining |
| map_hip_admin_05 | IncidentResponseProcedureDirective | IncidentResponseProcedure |
| map_hip_admin_06 | BusinessContinuityPlanDirective | ContingencyPlan |

## 4.6 ISO/IEC 27001 Annex A Controls

ISO/IEC 27001 is the international standard for Information Security Management Systems (ISMS). Annex A of the standard provides a list of information security controls objectives and controls. The `iso27001_annexa_subclass` axiom maps a directive class to a specific control or control objective within Annex A. Unlike the prescriptive nature of HIPAA or PCI DSS, ISO 27001 is risk-based, allowing organizations to select applicable controls. The ontology supports this by allowing directives to be mapped to specific Annex A references (e.g., A.9.2.1 or A.12.3.1).

### 4.6.1 Control Selection and Applicability

The mapping to Annex A is essential for organizations seeking ISO 27001 certification. A directive such as "Access Control Policy" maps to "Annex A.9 Access Control." Similarly, "Data Backup Policy" maps to "Annex A.12 Operations Security." The ontology enables the Statement of Applicability (SoA) to be dynamically generated by querying all directives that satisfy the `iso27001_annexa_subclass` axiom. This ensures that the technical documentation of the ISMS is perfectly aligned with the control set selected for the certification scope.

The following table embodies the `iso27001_annexa_subclass` axiom. The primary key is `id`. The `x` column represents the directive class, and the `y` column represents the ISO 27001 Annex A control class. This structure facilitates the gap analysis between the current state of security controls and the desired state defined by the ISO standard.

| Table: t_iso27001_annexa_subclass |
| :--- |
| **Schema:** `CREATE TABLE t_iso27001_annexa_subclass (id VARCHAR(255), x VARCHAR(255), y VARCHAR(255) NOT NULL, PRIMARY KEY (id))` |

| id | x | y |
| :--- | :--- | :--- |
| map_iso_001 | AccessControlPolicyDirective | AnnexA_A9_AccessControl |
| map_iso_002 | UserAccessManagementDirective | AnnexA_A9_AccessControl |
| map_iso_003 | CryptographyPolicyDirective | AnnexA_A10_Cryptography |
| map_iso_004 | MalwareProtectionDirective | AnnexA_A12_OperationsSecurity |
| map_iso_005 | BackupPolicyDirective | AnnexA_A12_OperationsSecurity |
| map_iso_006 | LoggingAndMonitoringDirective | AnnexA_A12_OperationsSecurity |
| map_iso_007 |SupplierRelationshipSecurityDirective | AnnexA_A15_SupplierRelationships |

```json
{
  "tables": [
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        ["map_pci_001", "FirewallConfigurationDirective", "PCI_DSS_Req_1"],
        ["map_pci_002", "VendorDefaultPasswordDirective", "PCI_DSS_Req_2"],
        ["map_pci_003", "StoredDataEncryptionDirective", "PCI_DSS_Req_3"],
        ["map_pci_004", "TransmissionEncryptionDirective", "PCI_DSS_Req_4"],
        ["map_pci_005", "AntiMalwareDirective", "PCI_DSS_Req_5"],
        ["map_pci_006", "VulnerabilityManagementDirective", "PCI_DSS_Req_6"],
        ["map_pci_007", "AccessControlDirective", "PCI_DSS_Req_7"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_technical",
      "rows": [
        ["map_hip_tech_01", "UniqueUserLoginDirective", "AccessControl"],
        ["map_hip_tech_02", "EmergencyAccessProcedureDirective", "AccessControl"],
        ["map_hip_tech_03", "AutomaticLogoffDirective", "AccessControl"],
        ["map_hip_tech_04", "AuditLogReviewDirective", "AuditControl"],
        ["map_hip_tech_05", "DataIntegrityCheckDirective", "IntegrityControl"],
        ["map_hip_tech_06", "EncryptionInTransitDirective", "TransmissionSecurity"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        ["map_hip_phys_01", "ContingencyOperationsDirective", "FacilityAccessControls"],
        ["map_hip_phys_02", "SecurityGuardEscortDirective", "FacilityAccessControls"],
        ["map_hip_phys_03", "MaintenanceRecordDirective", "FacilityAccessControls"],
        ["map_hip_phys_04", "WorkstationSecurityDirective", "WorkstationUse"],
        ["map_hip_phys_05", "MediaDisposalDirective", "DeviceAndMediaControls"],
        ["map_hip_phys_06", "MediaReceivingDirective", "DeviceAndMediaControls"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_admin",
      "rows": [
        ["map_hip_admin_01", "RiskAnalysisDirective", "SecurityManagementProcess"],
        ["map_hip_admin_02", "RiskManagementStrategyDirective", "SecurityManagementProcess"],
        ["map_hip_admin_03", "SanctionPolicyDirective", "WorkforceSecurity"],
        ["map_hip_admin_04", "SecurityAwarenessTrainingDirective", "SecurityAwarenessAndTraining"],
        ["map_hip_admin_05", "IncidentResponseProcedureDirective", "IncidentResponseProcedure"],
        ["map_hip_admin_06", "BusinessContinuityPlanDirective", "ContingencyPlan"]
      ]
    },
    {
      "name": "t_iso27001_annexa_subclass",
      "rows": [
        ["map_iso_001", "AccessControlPolicyDirective", "AnnexA_A9_AccessControl"],
        ["map_iso_002", "UserAccessManagementDirective", "AnnexA_A9_AccessControl"],
        ["map_iso_003", "CryptographyPolicyDirective", "AnnexA_A10_Cryptography"],
        ["map_iso_004", "MalwareProtectionDirective", "AnnexA_A12_OperationsSecurity"],
        ["map_iso_005", "BackupPolicyDirective", "AnnexA_A12_OperationsSecurity"],
        ["map_iso_006", "LoggingAndMonitoringDirective", "AnnexA_A12_OperationsSecurity"],
        ["map_iso_007", "SupplierRelationshipSecurityDirective", "AnnexA_A15_SupplierRelationships"]
      ]
    }
  ]
}
```