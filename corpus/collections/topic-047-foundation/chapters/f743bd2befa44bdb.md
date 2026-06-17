---
chapter_id: f743bd2befa44bdb
topic_id: 47
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'requirement_equiv_specifies_target', 'hipaa_safeguard_physical', 'hipaa_safeguard_technical', 'hipaa_safeguard_admin']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Regulatory Directive Mapping and Control Equivalence Frameworks

This chapter establishes the formal ontology for mapping disparate regulatory frameworks—specifically the Payment Card Industry Data Security Standard (PCI DSS) and the Health Insurance Portability and Accountability Act (HIPAA) Security Rule—into a unified Information Control Element (ICE) architecture. The scope of this text is limited to the definition of directive classes, the specification of target assets, and the categorization of safeguards according to their implementation domain (physical, technical, and administrative). The following sections provide the axiomatic definitions required to automate compliance verification and audit evidence generation within a governance, risk, and compliance (GRC) management system.

## 4.1 PCI DSS Requirements as Information Control Elements

The foundational unit of regulatory compliance within this framework is the PCI DSS Requirement. In the context of the Common Compliance Ontology (cco), a PCI DSS Requirement is defined not merely as a textual mandate but as a distinct class of Information Control Element (ICE). This class represents a directive that imposes specific obligations regarding the handling of cardholder data.

Formally, we define the class **PCI DSS Requirement** as a subclass of `cco:DirectiveICE`. The relationship between the requirement and the specific control objective it enforces is articulated through the object property `sdg:pciDssRequirement`. This axiom asserts that any instance of this class is a directive that necessitates a specific requirement class. This mapping allows auditors to trace a high-level regulatory mandate down to specific, enforceable control logic.

To illustrate this mapping, consider the following tabulation of PCI DSS directives. In this schema, the `x` column represents the specific PCI DSS directive class (e.g., a requirement regarding firewall configuration), while the `y` column represents the requirement equivalence class that formally defines the control logic. The foreign key constraint ensures that every PCI requirement is anchored to a valid specification definition.

*Table 4.1: Mapping of PCI DSS Directives to Requirement Equivalents*

| id | x | y |
| :--- | :--- | :--- |
| PCI_REQ_001 | FirewallConfigurationDirective | REQ_EQUIV_001 |
| PCI_REQ_002 | VendorDefaultPasswordDirective | REQ_EQUIV_002 |
| PCI_REQ_003 | CardholderDataEncryptionDirective | REQ_EQUIV_003 |
| PCI_REQ_004 | AntivirusSoftwareDirective | REQ_EQUIV_004 |
| PCI_REQ_005 | SecureSystemDevelopmentDirective | REQ_EQUIV_005 |

The table above demonstrates how specific regulatory mandates (column `x`) are structurally linked to their formal equivalence definitions (column `y`). This structure is critical for maintaining referential integrity within the compliance database, ensuring that no directive exists without a corresponding, valid specification of its intent and application.

## 4.2 Requirement Equivalence and Target Specification

While the previous section identified the directive, this section defines the formal equivalence of that directive in terms of its specification and its target application. The **Requirement Equivalent Specifies Target** class provides the semantic bridge between a regulatory text and the actual assets or personnel to which it applies.

According to the defined ontology, the class **Requirement Equivalent Specifies Target** is equivalent to the intersection of three conditions: it must be a `cco:DirectiveICE`; it must `sdg:specifies` a requirement class; and it must `sdg:appliesTo` a target class. This tripartite definition ensures that a directive is never treated as an abstract concept but is always bound to a specific operational context (the target) and a specific requirement (the specification).

The relational schema for this axiom supports a recursive relationship where the specification (`y`) often refers back to the PCI requirement defined in the previous section, while the target (`z`) identifies the operational domain (e.g., network perimeter, database, or system components). This circular reference between the requirement table and the equivalence table is intentional, modeling the real-world dependency where a requirement defines a specification, and that specification validates the requirement.

*Table 4.2: Specification of Requirements and Target Applications*

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| REQ_EQUIV_001 | FormalFirewallSpec | PCI_REQ_001 | NetworkPerimeter |
| REQ_EQUIV_002 | FormalAuthSpec | PCI_REQ_002 | SystemComponent |
| REQ_EQUIV_003 | FormalCryptoSpec | PCI_REQ_003 | TransmissionMedia |
| REQ_EQUIV_004 | FormalMalwareSpec | PCI_REQ_004 | EndpointDevice |
| REQ_EQUIV_005 | FormalDevSpec | PCI_REQ_005 | SoftwareEnvironment |

In the above tabulation, column `x` denotes the formal specification class, column `y` links back to the originating PCI requirement identifier, and column `z` defines the target class to which the directive applies. For instance, the `FormalFirewallSpec` applies specifically to the `NetworkPerimeter`, thereby delimiting the scope of the audit for `PCI_REQ_001`.

## 4.3 HIPAA Physical Safeguards

The HIPAA Security Rule categorizes safeguards into three distinct domains: physical, technical, and administrative. This section addresses the **HIPAA Physical Safeguard** class. Within the ontology, this class is defined as a subclass of `cco:DirectiveICE` that enforces a `sdg:hipaaSafeguard` relationship with a specific safeguard class.

Physical safeguards are measures to protect physical electronic information systems and related buildings and equipment from natural and environmental hazards, as well as unauthorized intrusion. The axiom `X is something that hipaa safeguard Y` captures the relationship where `X` is the directive (e.g., a policy on facility access) and `Y` is the specific safeguard requirement class (e.g., contingency operations or access control).

The following table enumerates instances of HIPAA physical safeguard directives. Note that the `y` column references the requirement equivalence identifiers established in Section 4.2, demonstrating how HIPAA controls can share structural definitions with PCI requirements or map to distinct regulatory specifications.

*Table 4.3: HIPAA Physical Safeguard Directives*

| id | x | y |
| :--- | :--- | :--- |
| HIPAA_PHY_001 | FacilityAccessControls | REQ_EQUIV_006 |
| HIPAA_PHY_002 | WorkstationUsePolicy | REQ_EQUIV_007 |
| HIPAA_PHY_003 | WorkstationSecurity | REQ_EQUIV_008 |
| HIPAA_PHY_004 | DeviceAndMediaControls | REQ_EQUIV_009 |
| HIPAA_PHY_005 | DisposalProcedures | REQ_EQUIV_010 |

The data in Table 4.3 indicates that directives such as `FacilityAccessControls` are governed by the equivalence specification `REQ_EQUIV_006`. This linkage ensures that the physical control is not only defined as a directive but is also mapped to a specific requirement set and target asset class via the equivalence table.

## 4.4 HIPAA Technical Safeguards

The **HIPAA Technical Safeguard** class encompasses the technology and the policy and procedures for its use that protect electronic protected health information (ePHI) and control access to it. Structurally, this class mirrors the physical safeguard definition in that it is a subclass of `cco:DirectiveICE` involving the `sdg:hipaaSafeguard` property.

However, the domain of application differs. Technical safeguards involve automated mechanisms, such as access control, audit controls, and integrity controls. The ontology treats these as distinct classes of directives (`X`) that mandate specific technical safeguard implementations (`Y`). The rigorous separation of physical and technical safeguards in the schema allows for granular reporting and gap analysis during security audits.

*Table 4.4: HIPAA Technical Safeguard Directives*

| id | x | y |
| :--- | :--- | :--- |
| HIPAA_TECH_001 | AccessControlMechanism | REQ_EQUIV_011 |
| HIPAA_TECH_002 | AuditControlMechanism | REQ_EQUIV_012 |
| HIPAA_TECH_003 | IntegrityControlMechanism | REQ_EQUIV_013 |
| HIPAA_TECH_004 | TransmissionSecurityMechanism | REQ_EQUIV_014 |
| HIPAA_TECH_005 | AuthenticationMechanism | REQ_EQUIV_015 |

As shown in Table 4.4, the `AuthenticationMechanism` directive (`x`) is linked to the equivalence specification `REQ_EQUIV_015` (`y`). This specification would, in turn, define the target (e.g., `WorkforceMember`) and the specific requirement logic, ensuring that the technical directive is operationalized effectively within the system architecture.

## 4.5 HIPAA Administrative Safeguards

The final domain addressed in this chapter is the **HIPAA Administrative Safeguard** class. Administrative safeguards are administrative actions, policies, and procedures to manage the selection, development, implementation, and maintenance of security measures to protect electronic protected health information. These actions are often the most complex, as they involve human behavior and organizational culture.

In the ontology, the administrative safeguard class follows the same axiomatic pattern as the physical and technical safeguards: `X` is a subclass of `cco:DirectiveICE` that safeguards `Y`. Here, `X` represents administrative policies (e.g., security awareness training) and `Y` represents the underlying requirement class. The relational mapping ensures that these administrative policies are treated as formal directives with the same rigor as technical controls.

*Table 4.5: HIPAA Administrative Safeguard Directives*

| id | x | y |
| :--- | :--- | :--- |
| HIPAA_ADMIN_001 | SecurityManagementProcess | REQ_EQUIV_016 |
| HIPAA_ADMIN_002 | AssignedSecurityResponsibility | REQ_EQUIV_017 |
| HIPAA_ADMIN_003 | WorkforceSecurityPolicy | REQ_EQUIV_018 |
| HIPAA_ADMIN_004 | InformationAccessManagement | REQ_EQUIV_019 |
| HIPAA_ADMIN_005 | SecurityAwarenessTraining | REQ_EQUIV_020 |

The entries in Table 4.5, such as `SecurityAwarenessTraining`, map to their respective equivalence specifications. By anchoring these administrative policies to the `t_requirement_equiv_specifies_target` table via the foreign key in column `y`, the framework ensures that every administrative action has a defined scope (`z`) and a verifiable requirement (`y`), completing the audit trail for the governance framework.

```json
{
  "tables": [
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        ["PCI_REQ_001", "FirewallConfigurationDirective", "REQ_EQUIV_001"],
        ["PCI_REQ_002", "VendorDefaultPasswordDirective", "REQ_EQUIV_002"],
        ["PCI_REQ_003", "CardholderDataEncryptionDirective", "REQ_EQUIV_003"],
        ["PCI_REQ_004", "AntivirusSoftwareDirective", "REQ_EQUIV_004"],
        ["PCI_REQ_005", "SecureSystemDevelopmentDirective", "REQ_EQUIV_005"]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        ["REQ_EQUIV_001", "FormalFirewallSpec", "PCI_REQ_001", "NetworkPerimeter"],
        ["REQ_EQUIV_002", "FormalAuthSpec", "PCI_REQ_002", "SystemComponent"],
        ["REQ_EQUIV_003", "FormalCryptoSpec", "PCI_REQ_003", "TransmissionMedia"],
        ["REQ_EQUIV_004", "FormalMalwareSpec", "PCI_REQ_004", "EndpointDevice"],
        ["REQ_EQUIV_005", "FormalDevSpec", "PCI_REQ_005", "SoftwareEnvironment"],
        ["REQ_EQUIV_006", "PhysicalAccessSpec", "HIPAA_PHY_001", "FacilityPremises"],
        ["REQ_EQUIV_007", "WorkstationUseSpec", "HIPAA_PHY_002", "WorkstationLocation"],
        ["REQ_EQUIV_008", "WorkstationSecuritySpec", "HIPAA_PHY_003", "PhysicalWorkstation"],
        ["REQ_EQUIV_009", "MediaControlSpec", "HIPAA_PHY_004", "RemovableMedia"],
        ["REQ_EQUIV_010", "DisposalSpec", "HIPAA_PHY_005", "ElectronicMedia"],
        ["REQ_EQUIV_011", "TechAccessControlSpec", "HIPAA_TECH_001", "EHRSystem"],
        ["REQ_EQUIV_012", "TechAuditControlSpec", "HIPAA_TECH_002", "HealthInfoSystem"],
        ["REQ_EQUIV_013", "TechIntegritySpec", "HIPAA_TECH_003", "ElectronicPHI"],
        ["REQ_EQUIV_014", "TechTransmissionSpec", "HIPAA_TECH_004", "OpenNetwork"],
        ["REQ_EQUIV_015", "TechAuthSpec", "HIPAA_TECH_005", "UserSession"],
        ["REQ_EQUIV_016", "AdminMgmtProcessSpec", "HIPAA_ADMIN_001", "OrgEntity"],
        ["REQ_EQUIV_017", "AdminSecurityRespSpec", "HIPAA_ADMIN_002", "SecurityOfficial"],
        ["REQ_EQUIV_018", "AdminWorkforcePolicySpec", "HIPAA_ADMIN_003", "WorkforceMembers"],
        ["REQ_EQUIV_019", "AdminAccessMgmtSpec", "HIPAA_ADMIN_004", "InfoSystemAccess"],
        ["REQ_EQUIV_020", "AdminTrainingSpec", "HIPAA_ADMIN_005", "EmployeeBase"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        ["HIPAA_PHY_001", "FacilityAccessControls", "REQ_EQUIV_006"],
        ["HIPAA_PHY_002", "WorkstationUsePolicy", "REQ_EQUIV_007"],
        ["HIPAA_PHY_003", "WorkstationSecurity", "REQ_EQUIV_008"],
        ["HIPAA_PHY_004", "DeviceAndMediaControls", "REQ_EQUIV_009"],
        ["HIPAA_PHY_005", "DisposalProcedures", "REQ_EQUIV_010"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_technical",
      "rows": [
        ["HIPAA_TECH_001", "AccessControlMechanism", "REQ_EQUIV_011"],
        ["HIPAA_TECH_002", "AuditControlMechanism", "REQ_EQUIV_012"],
        ["HIPAA_TECH_003", "IntegrityControlMechanism", "REQ_EQUIV_013"],
        ["HIPAA_TECH_004", "TransmissionSecurityMechanism", "REQ_EQUIV_014"],
        ["HIPAA_TECH_005", "AuthenticationMechanism", "REQ_EQUIV_015"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_admin",
      "rows": [
        ["HIPAA_ADMIN_001", "SecurityManagementProcess", "REQ_EQUIV_016"],
        ["HIPAA_ADMIN_002", "AssignedSecurityResponsibility", "REQ_EQUIV_017"],
        ["HIPAA_ADMIN_003", "WorkforceSecurityPolicy", "REQ_EQUIV_018"],
        ["HIPAA_ADMIN_004", "InformationAccessManagement", "REQ_EQUIV_019"],
        ["HIPAA_ADMIN_005", "SecurityAwarenessTraining", "REQ_EQUIV_020"]
      ]
    }
  ]
}
```