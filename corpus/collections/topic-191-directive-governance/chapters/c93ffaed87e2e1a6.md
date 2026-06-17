---
chapter_id: c93ffaed87e2e1a6
topic_id: 191
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'control_with_evidence_requirement', 'requirement_equiv_specifies_target', 'verification_produces_evidence', 'control_only_addresses_threat_class']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Directive Governance and Evidentiary Standards

## 4.1 Scope and Applicability

This chapter establishes the formal parameters governing the intersection of directive control, risk mitigation, and evidentiary verification within the Unified Governance Framework (UGF). The provisions herein apply to all entities subject to the Global Compliance Accord (GCA) 2024-2025, specifically regarding the management of Directive ICE (Information Control Element) artifacts. The text delineates the ontological relationships between control classes, their required evidentiary outputs, and the specific threat classes they are sanctioned to address. Compliance officers must ensure that all internal governance mappings align strictly with the schemas defined in Sections 4.2 through 4.6, ensuring that every control implementation is traceable to a specific requirement and supported by verifiable artifacts.

## 4.2 Attestation with Supporting Evidence

In accordance with the UGF Audit Protocols, an attestation is defined formally as a process (`bfo:0000015`) that validates the state of compliance against a specified benchmark. However, under the axioms of the framework, an attestation is not merely a declarative statement; it is a complex entity that must possess a material link to supporting evidence. The axiom `attestation_with_supporting_evidence` posits that for an attestation to be valid, it must be substantiated by specific evidentiary artifacts.

This relationship ensures that governance assertions are not abstract but are anchored in verifiable data. For instance, a "System Availability Attestation" is invalid unless it is accompanied by supporting evidence such as "Uptime Monitoring Logs." The primary key for this relationship is the unique attestation identifier, which binds the attestation class (X) to its supporting evidence class (Y). This binding prevents the issuance of "orphan" attestations—claims made without an audit trail.

**Table 4.1: Registry of Attestations and Supporting Evidence**

| ID | Attestation Class (X) | Supporting Evidence Class (Y) |
| :--- | :--- | :--- |
| ATT-2024-089 | AnnualFinancialAudit | GeneralLedgerExtract |
| ATT-2024-090 | ThirdPartyPenetrationTest | VulnerabilityScanReport |
| ATT-2024-091 | DataPrivacyImpactAssessment | DataFlowMappingDiagram |
| ATT-2024-092 | PhysicalSecurityReview | CCTVAccessLogs |
| ATT-2024-093 | UserAccessReview | IdentityManagementDatabaseDump |

The integrity of the audit cycle depends on the strict enforcement of this axiom. Auditors are instructed to reject any attestation record where the `y` slot (Supporting Evidence) is null or refers to a data class that has not been archived in accordance with the Retention Directive.

## 4.3 Control Evidence Requirements

Building upon the concept of attestation, the framework defines the obligations of the controls themselves. A `cco:DirectiveICE` represents a governance control or directive. The axiom `control_with_evidence_requirement` mandates that every such control must explicitly define the class of evidence it requires to demonstrate compliance.

This is distinct from the evidence *produced* by a verification; rather, this is the evidence *required* by the control's existence. For example, a "Password Policy Control" inherently requires "Password Hash Files" as evidence to prove that the policy is being enforced. Without this requirement definition, a control cannot be audited effectively. The schema enforces that the evidence requirement (Y) is a mandatory, non-null field, ensuring that no control is implemented without a predefined plan for verification.

**Table 4.2: Control Directives and Evidence Requirements**

| ID | Control Class (X) | Required Evidence Class (Y) |
| :--- | :--- | :--- |
| CTRL-REQ-001 | AccessControlPolicy | UserAccessLogs |
| CTRL-REQ-002 | ChangeManagementProcedure | ChangeRequestTickets |
| CTRL-REQ-003 | EncryptionStandardDirective | CryptographicKeyCertificates |
| CTRL-REQ-004 | DataClassificationProtocol | DataInventoryManifest |
| CTRL-REQ-005 | IncidentResponsePlan | IncidentResponseTickets |

Governance bodies must review these mappings quarterly. If a Control Class (X) is modified, the corresponding Required Evidence Class (Y) must be updated to reflect the new operational reality. Failure to maintain this linkage constitutes a critical finding under the 2024 Compliance Standards.

## 4.4 Requirement Specification and Targeting

The definition of a requirement within the ontology is more granular than that of a general control. The axiom `requirement_equiv_specifies_target` establishes that a Requirement Class (X) is equivalent to a Directive ICE that simultaneously specifies a rule or parameter (Y) and applies to a specific target scope (Z).

This tripartite structure is essential for precision in governance. It prevents the application of generic requirements to inappropriate targets. For example, a "PCI-DSS Requirement" (X) might specify "Two-Factor Authentication" (Y) but applies only to "Cardholder Data Environment" (Z). Applying this requirement to "Public Marketing Website" (Z) would be a violation of the logical structure defined here.

The relational schema for this axiom enforces that both the specification (Y) and the target (Z) are mandatory. This reflects the legal and operational necessity that a requirement must have both a defined action and a defined subject.

**Table 4.3: Requirement Specifications and Target Applications**

| ID | Requirement Class (X) | Specification (Y) | Target Class (Z) |
| :--- | :--- | :--- | :--- |
| REQ-DEF-101 | DataRetentionDirective | SevenYearRetentionRule | CustomerTransactionRecords |
| REQ-DEF-102 | NetworkSecurityStandard | TLS1.3EncryptionProtocol | ExternalAPIEndpoints |
| REQ-DEF-103 | EmployeeScreeningPolicy | CriminalBackgroundCheck | HumanResourcesPersonnel |
| REQ-DEF-104 | SoftwareDevelopmentLifecycle | StaticCodeAnalysis | ProductionSourceCode |
| REQ-DEF-105 | VendorManagementPolicy | SOC2Type2Report | ThirdPartyServiceProviders |

When implementing these requirements, the compliance officer must verify that the `z` value accurately reflects the current asset inventory. Mismatches between the defined Target Class (Z) and the actual assets in scope are a primary cause of audit discrepancies.

## 4.5 Verification and Evidence Production

While controls *require* evidence, the act of verification *produces* it. The axiom `verification_produces_evidence` defines a Verification Class (X) as a process (`bfo:0000015`) that results in the generation of an Evidence Class (Y). This distinction is vital for the audit lifecycle: verification is the active work (the scan, the review, the inspection), and the evidence is the passive artifact left behind (the report, the log, the certificate).

This axiom tracks the provenance of evidence. If an auditor questions the validity of a "Penetration Test Report" (Y), they can trace it back to the "Penetration Test Engagement" (X) that produced it. The schema ensures that every piece of evidence in the system is the product of a recognized verification process. This prevents "synthetic" evidence—artifacts created to satisfy a control without undergoing the actual verification process.

**Table 4.4: Verification Processes and Produced Evidence**

| ID | Verification Class (X) | Produced Evidence Class (Y) |
| :--- | :--- | :--- |
| VER-PROD-201 | QuarterlyVulnerabilityScan | NessusScanReport |
| VER-PROD-202 | AnnualFinancialAudit | ExternalAuditorOpinionLetter |
| VER-PROD-203 | FirewallConfigurationReview | RuleSetAuditLog |
| VER-PROD-204 | DatabaseIntegrityCheck | HashComparisonReport |
| VER-PROD-205 | PhysicalSecurityInspection | GuardTourManifest |

The timestamp of the Verification Class (X) must precede or be simultaneous with the creation of the Evidence Class (Y). Temporal violations where evidence predates the verification process are indicative of record tampering and must be investigated immediately.

## 4.6 Control and Threat Addressal

The final component of the governance framework concerns the efficacy of controls. The axiom `control_only_addresses_threat_class` posits that a Control Class (X) is a directive that addresses a specific Threat Class (Y) and *only* that Threat Class.

This "only" constraint (`only` in OWL Manchester syntax) implies a restriction on the scope of the control. While a control may incidentally affect other areas, its primary design and governance mandate are restricted to a specific threat. For example, a "Anti-Malware Gateway" is designed to address "Malicious Software Threats." While it may log traffic (incidental), it is not the designated control for "Data Exfiltration Threats" (which would require a DLP solution).

This restriction prevents "scope creep" in control definitions, where a single control is claimed to mitigate too many disparate risks. By enforcing a specific relationship between X and Y, the framework ensures that the threat landscape is covered by a comprehensive suite of specialized controls, rather than a few generalized, ineffective ones.

**Table 4.5: Control Directives and Addressed Threat Classes**

| ID | Control Class (X) | Addressed Threat Class (Y) |
| :--- | :--- | :--- |
| CTRL-RISK-301 | MultiFactorAuthenticationProtocol | CredentialCompromiseThreat |
| CTRL-RISK-302 | DataLossPreventionSystem | SensitiveDataExfiltrationThreat |
| CTRL-RISK-303 | IntrusionDetectionSystem | UnauthorizedNetworkAccessThreat |
| CTRL-RISK-304 | EnvironmentalControlSystem | HardwareFailureDueToHeatThreat |
| CTRL-RISK-305 | SecurityAwarenessTraining | PhishingAndSocialEngineeringThreat |

It is the responsibility of the Risk Management Committee to map every identified risk in the corporate risk register to a Control Class (X) in this table. If a Threat Class (Y) is identified that has no corresponding entry in Table 4.5, a gap analysis must be initiated, and a new control directive must be drafted.

```json
{
  "tables": [
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        ["ATT-2024-089", "AnnualFinancialAudit", "GeneralLedgerExtract"],
        ["ATT-2024-090", "ThirdPartyPenetrationTest", "VulnerabilityScanReport"],
        ["ATT-2024-091", "DataPrivacyImpactAssessment", "DataFlowMappingDiagram"],
        ["ATT-2024-092", "PhysicalSecurityReview", "CCTVAccessLogs"],
        ["ATT-2024-093", "UserAccessReview", "IdentityManagementDatabaseDump"]
      ]
    },
    {
      "name": "t_control_with_evidence_requirement",
      "rows": [
        ["CTRL-REQ-001", "AccessControlPolicy", "UserAccessLogs"],
        ["CTRL-REQ-002", "ChangeManagementProcedure", "ChangeRequestTickets"],
        ["CTRL-REQ-003", "EncryptionStandardDirective", "CryptographicKeyCertificates"],
        ["CTRL-REQ-004", "DataClassificationProtocol", "DataInventoryManifest"],
        ["CTRL-REQ-005", "IncidentResponsePlan", "IncidentResponseTickets"]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        ["REQ-DEF-101", "DataRetentionDirective", "SevenYearRetentionRule", "CustomerTransactionRecords"],
        ["REQ-DEF-102", "NetworkSecurityStandard", "TLS1.3EncryptionProtocol", "ExternalAPIEndpoints"],
        ["REQ-DEF-103", "EmployeeScreeningPolicy", "CriminalBackgroundCheck", "HumanResourcesPersonnel"],
        ["REQ-DEF-104", "SoftwareDevelopmentLifecycle", "StaticCodeAnalysis", "ProductionSourceCode"],
        ["REQ-DEF-105", "VendorManagementPolicy", "SOC2Type2Report", "ThirdPartyServiceProviders"]
      ]
    },
    {
      "name": "t_verification_produces_evidence",
      "rows": [
        ["VER-PROD-201", "QuarterlyVulnerabilityScan", "NessusScanReport"],
        ["VER-PROD-202", "AnnualFinancialAudit", "ExternalAuditorOpinionLetter"],
        ["VER-PROD-203", "FirewallConfigurationReview", "RuleSetAuditLog"],
        ["VER-PROD-204", "DatabaseIntegrityCheck", "HashComparisonReport"],
        ["VER-PROD-205", "PhysicalSecurityInspection", "GuardTourManifest"]
      ]
    },
    {
      "name": "t_control_only_addresses_threat_class",
      "rows": [
        ["CTRL-RISK-301", "MultiFactorAuthenticationProtocol", "CredentialCompromiseThreat"],
        ["CTRL-RISK-302", "DataLossPreventionSystem", "SensitiveDataExfiltrationThreat"],
        ["CTRL-RISK-303", "IntrusionDetectionSystem", "UnauthorizedNetworkAccessThreat"],
        ["CTRL-RISK-304", "EnvironmentalControlSystem", "HardwareFailureDueToHeatThreat"],
        ["CTRL-RISK-305", "SecurityAwarenessTraining", "PhishingAndSocialEngineeringThreat"]
      ]
    }
  ]
}
```