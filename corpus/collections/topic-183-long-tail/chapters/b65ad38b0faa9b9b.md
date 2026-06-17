---
chapter_id: b65ad38b0faa9b9b
topic_id: 183
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'hipaa_safeguard_technical', 'hipaa_safeguard_physical', 'hipaa_safeguard_admin', 'iso27001_annexa_subclass']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Regulatory Alignment and Directive Compliance Frameworks

## 4.1 Scope and Preamble

This chapter delineates the structural alignment between organizational governance artifacts—specifically Information Control Elements (ICE) classified as Directives—and prevailing regulatory frameworks. In the context of enterprise compliance, a directive serves as the foundational instrument for enforcing technical, physical, and administrative controls. The following sections provide a comprehensive analysis of how these directives are formally mapped to specific requirements within the Payment Card Industry Data Security Standard (PCI DSS), the Health Insurance Portability and Accountability Act (HIPAA), and the ISO/IEC 27001 information security management standard. This mapping is not merely taxonomic but functional, ensuring that every enacted control is traceable to a specific legal or contractual obligation, thereby satisfying audit requirements for evidence-anchored governance.

## 4.2 PCI DSS Requirement Mapping

The Payment Card Industry Data Security Standard (PCI DSS) prescribes a robust set of requirements intended to ensure the secure handling of cardholder data. For an entity to validate compliance, internal directives must be explicitly subclassed as PCI DSS requirements. This relationship asserts that a specific organizational policy or technical mandate (the Directive) is a realization of a broader regulatory obligation.

### 4.2.1 The Directive-Requirement Relationship

In the ontology of compliance, the axiom `pci_dss_requirement` establishes that a DirectiveICE is a mechanism to enforce a specific PCI DSS control. For instance, a corporate policy regarding network segmentation is not merely a guideline; it is a direct instantiation of PCI DSS Requirement 1.2.3, which mandates the installation of firewalls between any trusted networks and untrusted networks. By formalizing this relationship, governance frameworks can automate the gap analysis process, identifying directives that lack regulatory grounding or requirements that lack enforcing directives.

### 4.2.2 Implementation Evidence

Auditors must verify that the directive is active within the environment. This requires reviewing configuration standards, network diagrams, and firewall rule sets. The directive must be granular enough to be enforceable yet broad enough to encompass the full scope of the requirement.

**Table 4-1: Mapping of Directives to PCI DSS Requirements**

| ID | Directive (X) | PCI DSS Requirement (Y) |
| :--- | :--- | :--- |
| PCI-001 | `WirelessEnvironmentDirective` | Requirement 1.2.3 |
| PCI-002 | `DataRetentionPolicy` | Requirement 3.1 |
| PCI-003 | `SystemComponentInventory` | Requirement 2.4 |
| PCI-004 | `MalwareProtectionProtocol` | Requirement 5.1 |
| PCI-005 | `LogReviewProcedure` | Requirement 10.6.1 |
| PCI-006 | `VulnerabilityManagementPlan` | Requirement 6.1 |

*Table 4-1 illustrates the instantiation of the `t_pci_dss_requirement` schema, where internal governance documents (X) are mapped to specific PCI DSS control points (Y). The primary key `id` ensures traceability within the compliance management system.*

## 4.3 HIPAA Technical Safeguards

Under the HIPAA Security Rule, technical safeguards are the automated mechanisms and processes used to protect electronic Protected Health Information (ePHI) and control access to it. Unlike physical or administrative safeguards, technical safeguards involve the technology and the policy and procedures for its use that protect electronic health information and control access to it.

### 4.3.1 Access Control and Audit Mechanisms

The axiom `hipaa_safeguard_technical` defines the relationship between a directive and a specific technical safeguard specification. For example, a directive implementing unique user identification is a direct response to the § 164.312(a)(1) standard. The ontology captures this by classifying the directive as a subclass of the technical safeguard requirement. This ensures that the logical access controls in place are not merely operational conveniences but statutory necessities.

### 4.3.2 Transmission Security

A critical component of this domain is transmission security. Directives governing the use of encryption over open networks must be mapped to the technical safeguard addressing encryption. This mapping provides the evidence trail required during a HIPAA audit to demonstrate that ePHI integrity and confidentiality are maintained during electronic transmission.

**Table 4-2: Technical Safeguard Directives**

| ID | Directive (X) | HIPAA Technical Safeguard (Y) |
| :--- | :--- | :--- |
| HT-001 | `UserAuthenticationProtocol` | § 164.312(d) |
| HT-002 | `AuditControlMechanism` | § 164.312(b) |
| HT-003 | `EncryptionInTransitPolicy` | § 164.312(e)(1) |
| HT-004 | `EncryptionAtRestStandard` | § 164.312(a)(2)(iv) |
| HT-005 | `AutomaticLogoffProcedure` | § 164.312(a)(2)(iii) |

*Table 4-2 represents the `t_hipaa_safeguard_technical` schema. The `y` column references the specific HIPAA regulatory text, anchoring the directive `x` to the legal definition of the safeguard.*

## 4.4 HIPAA Physical Safeguards

Physical safeguards are measures to protect physical electronic information systems (ePHI) and related buildings and equipment from natural and environmental hazards, and unauthorized intrusion. The `hipaa_safeguard_physical` axiom formalizes the directives that manage facility access, workstation usage, and device security.

### 4.4.1 Facility Access Controls

The directive governing facility access must specify the procedures by which authorized personnel gain entry to areas containing ePHI. This includes the contingency operations stipulations that ensure access is supported and restored in an emergency. By mapping the `FacilityAccessDirective` to the physical safeguard requirement, the organization establishes a clear chain of custody for physical assets.

### 4.4.2 Workstation and Device Security

Directives regarding workstation placement and device disposal are essential for preventing incidental exposure of ePHI. For instance, a directive prohibiting the display of ePHI on screens visible to the public is a physical safeguard implementation. The relational mapping ensures that such policies are recognized as compliance activities rather than general office rules.

**Table 4-3: Physical Safeguard Directives**

| ID | Directive (X) | HIPAA Physical Safeguard (Y) |
| :--- | :--- | :--- |
| HP-001 | `FacilityAccessControlPlan` | § 164.310(a)(1) |
| HP-002 | `WorkstationUsePolicy` | § 164.310(b) |
| HP-003 | `WorkstationSecurityStandard` | § 164.310(c) |
| HP-004 | `DeviceMediaDisposalProtocol` | § 164.310(d)(1) |
| HP-005 | `HardwareMovementTracking` | § 164.310(d)(2)(ii) |

*Table 4-3 details the `t_hipaa_safeguard_physical` schema. The directives listed in column `x` are the actionable implementations of the physical controls defined in column `y`.*

## 4.5 HIPAA Administrative Safeguards

Administrative safeguards are administrative actions, policies, and procedures to manage the selection, development, implementation, and maintenance of security measures to protect electronic protected health information. These safeguards are often the most complex, as they involve the human element of security management.

### 4.5.1 Security Management Process

The core of administrative compliance is the security management process. A directive mandating periodic risk analysis is the primary vehicle for satisfying § 164.308(a)(1)(ii)(A). The `hipaa_safeguard_admin` axiom captures this by linking the risk analysis directive to the administrative safeguard category. This linkage is critical for demonstrating to the Department of Health and Human Services (HHS) that the organization has conducted an accurate and thorough assessment of potential risks.

### 4.5.2 Workforce Security and Training

Directives regarding workforce clearance procedures and security awareness training are also mapped here. The ontology distinguishes between the *existence* of a training program and the *directive* that mandates it. By populating the administrative safeguard table, the organization provides evidence that the workforce is not only trained but that the training requirement is codified in the governance framework.

**Table 4-4: Administrative Safeguard Directives**

| ID | Directive (X) | HIPAA Administrative Safeguard (Y) |
| :--- | :--- | :--- |
| HA-001 | `RiskAnalysisProcedure` | § 164.308(a)(1)(ii)(A) |
| HA-002 | `SanctionPolicy` | § 164.308(a)(1)(ii)(C) |
| HA-003 | `InformationAccessPolicy` | § 164.308(a)(4)(ii)(B) |
| HA-004 | `SecurityAwarenessTraining` | § 164.308(a)(5) |
| HA-005 | `ContingencyPlanDirective` | § 164.308(a)(7) |

*Table 4-4 utilizes the `t_hipaa_safeguard_admin` schema. The `y` values correspond to the specific sections of the HIPAA Security Rule that define administrative requirements, ensuring the directives in `x` are legally grounded.*

## 4.6 ISO/IEC 27001 Annex A Controls

ISO/IEC 27001 is the international standard that specifies the requirements for establishing, implementing, maintaining, and continually improving an information security management system (ISMS). Annex A provides a list of information security controls objectives and controls. The `iso27001_annexa_subclass` axiom is used to map organizational directives to these specific controls.

### 4.6.1 Control Selection and Statement of Applicability

The mapping of directives to Annex A controls is the basis for the Statement of Applicability (SoA). A directive addressing asset management, for example, must be linked to Control A.8.1.1 (Inventory of assets). The ontology asserts that the directive is a subclass of the control objective, meaning the directive *is* the implementation of that control within the specific context of the organization.

### 4.6.2 Access Control and Cryptography

Directives governing access control (A.9) and cryptography (A.10) are fundamental to the ISMS. By formalizing the relationship between the `AccessControlDirective` and Control A.9.4.1 (Restriction of access to information), the organization demonstrates that its policies are designed to meet the rigorous standards of ISO 27001. This allows for automated certification audits where the control implementation is verified against the directive text.

**Table 4-5: ISO 27001 Annex A Control Mappings**

| ID | Directive (X) | ISO 27001 Annex A Control (Y) |
| :--- | :--- | :--- |
| ISO-001 | `AssetInventoryProcedure` | A.8.1.1 |
| ISO-002 | `AccessControlPolicy` | A.9.1.1 |
| ISO-003 | `CryptographyUsagePolicy` | A.10.1.1 |
| ISO-004 | `SupplierSecurityPolicy` | A.15.1.1 |
| ISO-005 | `InformationSecurityPolicy` | A.5.1.1 |
| ISO-006 | `OperationalLoggingProcedure` | A.12.4.1 |

*Table 4-5 populates the `t_iso27001_annexa_subclass` schema. The `y` column references the ISO 27001 Annex A control codes, linking the organizational directives in `x` to the international standard's control set.*

```json
{
  "tables": [
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        ["PCI-001", "WirelessEnvironmentDirective", "Requirement 1.2.3"],
        ["PCI-002", "DataRetentionPolicy", "Requirement 3.1"],
        ["PCI-003", "SystemComponentInventory", "Requirement 2.4"],
        ["PCI-004", "MalwareProtectionProtocol", "Requirement 5.1"],
        ["PCI-005", "LogReviewProcedure", "Requirement 10.6.1"],
        ["PCI-006", "VulnerabilityManagementPlan", "Requirement 6.1"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_technical",
      "rows": [
        ["HT-001", "UserAuthenticationProtocol", "§ 164.312(d)"],
        ["HT-002", "AuditControlMechanism", "§ 164.312(b)"],
        ["HT-003", "EncryptionInTransitPolicy", "§ 164.312(e)(1)"],
        ["HT-004", "EncryptionAtRestStandard", "§ 164.312(a)(2)(iv)"],
        ["HT-005", "AutomaticLogoffProcedure", "§ 164.312(a)(2)(iii)"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        ["HP-001", "FacilityAccessControlPlan", "§ 164.310(a)(1)"],
        ["HP-002", "WorkstationUsePolicy", "§ 164.310(b)"],
        ["HP-003", "WorkstationSecurityStandard", "§ 164.310(c)"],
        ["HP-004", "DeviceMediaDisposalProtocol", "§ 164.310(d)(1)"],
        ["HP-005", "HardwareMovementTracking", "§ 164.310(d)(2)(ii)"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_admin",
      "rows": [
        ["HA-001", "RiskAnalysisProcedure", "§ 164.308(a)(1)(ii)(A)"],
        ["HA-002", "SanctionPolicy", "§ 164.308(a)(1)(ii)(C)"],
        ["HA-003", "InformationAccessPolicy", "§ 164.308(a)(4)(ii)(B)"],
        ["HA-004", "SecurityAwarenessTraining", "§ 164.308(a)(5)"],
        ["HA-005", "ContingencyPlanDirective", "§ 164.308(a)(7)"]
      ]
    },
    {
      "name": "t_iso27001_annexa_subclass",
      "rows": [
        ["ISO-001", "AssetInventoryProcedure", "A.8.1.1"],
        ["ISO-002", "AccessControlPolicy", "A.9.1.1"],
        ["ISO-003", "CryptographyUsagePolicy", "A.10.1.1"],
        ["ISO-004", "SupplierSecurityPolicy", "A.15.1.1"],
        ["ISO-005", "InformationSecurityPolicy", "A.5.1.1"],
        ["ISO-006", "OperationalLoggingProcedure", "A.12.4.1"]
      ]
    }
  ]
}
```