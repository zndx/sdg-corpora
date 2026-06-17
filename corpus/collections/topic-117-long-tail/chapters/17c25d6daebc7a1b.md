---
chapter_id: 17c25d6daebc7a1b
topic_id: 117
family: 07_long_tail
cited_terms: ['hipaa_safeguard_admin', 'control_only_addresses_threat_class', 'hipaa_safeguard_physical', 'hipaa_safeguard_technical', 'pci_dss_requirement']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Governance of Information Security Directives

## 4.1 Scope and Preamble

This chapter provides a technical specification of the ontological mappings governing the intersection of HIPAA Security Rule safeguards, PCI DSS requirements, and generalized risk controls. The content herein defines the structural relationships between directive classes (`cco:DirectiveICE`) and their specific implementations within a compliance framework. The mappings are presented as a formalized set of axioms, derived from a requirement to model how administrative, physical, and technical safeguards interact with risk-addressing controls. The data tables provided in each section serve as the evidentiary basis for these relationships, establishing a foreign-key dependency chain that links regulatory requirements to specific control classes and, reciprocally, to administrative safeguards.

## 4.2 Administrative Safeguards and Risk Governance

### 4.2.1 Axiom 1: HIPAA Administrative Safeguards

The foundational layer of the Security Rule is established by the Administrative Safeguards. In the formal ontology, this is represented by the axiom `hipaa_safeguard_admin`. This axiom asserts that a specific class of administrative directives (`X`) functions as a HIPAA safeguard for a target class (`Y`). Unlike general policy statements, these directives are actionable governance mechanisms intended to manage the selection, development, implementation, and maintenance of security measures.

The relational schema for this axiom, `t_hipaa_safeguard_admin`, enforces a dependency where the safeguarded entity (`y`) must correspond to a valid control class defined in the threat-addressing schema. This structure ensures that administrative safeguards are not abstract concepts but are directly tethered to operational controls. The primary key (`id`) represents the unique identifier for the administrative class, while the foreign key constraint validates the existence of the control being safeguarded.

**Table 4-1: Administrative Safeguard Mapping (t_hipaa_safeguard_admin)**

| id | x | y |
| :--- | :--- | :--- |
| `Security_Mgmt_Process` | `Security_Mgmt_Process` | `Risk_Analysis_Control` |
| `Assigned_Security_Responsibility` | `Assigned_Security_Responsibility` | `Security_Officer_Role` |
| `Workforce_Security` | `Workforce_Security` | `Sanction_Policy_Control` |
| `Information_Access_Mgmt` | `Information_Access_Mgmt` | `Clearance_Procedure_Control` |
| `Security_Awareness_Training` | `Security_Awareness_Training` | `Training_Media_Control` |

*Table 4-1 illustrates the instantiation of the `hipaa_safeguard_admin` axiom. The column `x` denotes the Administrative Safeguard class, while `y` denotes the specific Control class it safeguards. Note that all entries in `y` reference valid identifiers in the control schema, satisfying the foreign key constraint.*

### 4.2.2 Axiom 2: Control and Threat Addressing

To operationalize the safeguards, the ontology defines the `control_only_addresses_threat_class` axiom. This axiom formalizes the relationship where a Control class (`X`) addresses a Risk class (`Y`) exclusively. In this specific schema topology, the Risk class (`Y`) is modeled as a reference back to an Administrative Safeguard. This recursive dependency creates a closed loop of governance: the Administrative Safeguard protects the Control, and the Control addresses the Risk associated with the Administrative Safeguard (or a related administrative entity).

This reciprocal relationship ensures that controls are not implemented in a vacuum; they must address specific risk vectors defined within the administrative domain. The schema `t_control_only_addresses_threat_class` utilizes a foreign key (`y`) that references the `t_hipaa_safeguard_admin` table, enforcing the constraint that a control must address a risk defined as an administrative safeguard class.

**Table 4-2: Control and Risk Addressing (t_control_only_addresses_threat_class)**

| id | x | y |
| :--- | :--- | :--- |
| `Risk_Analysis_Control` | `Risk_Analysis_Control` | `Security_Mgmt_Process` |
| `Security_Officer_Role` | `Security_Officer_Role` | `Assigned_Security_Responsibility` |
| `Sanction_Policy_Control` | `Sanction_Policy_Control` | `Workforce_Security` |
| `Clearance_Procedure_Control` | `Clearance_Procedure_Control` | `Information_Access_Mgmt` |
| `Training_Media_Control` | `Training_Media_Control` | `Security_Awareness_Training` |
| `Emergency_Access_Control` | `Emergency_Access_Control` | `Workforce_Security` |

*Table 4-2 details the `control_only_addresses_threat_class` axiom. The `x` column represents the Control class, and `y` represents the Risk class (modeled here as an Administrative Safeguard). The circular reference is evident where `Risk_Analysis_Control` (id) addresses the risk of `Security_Mgmt_Process`, which in turn safeguards `Risk_Analysis_Control` (as seen in Table 4-1).*

## 4.3 Physical Safeguards Implementation

### 4.3.1 Axiom 3: HIPAA Physical Safeguards

The Physical Safeguards axiom (`hipaa_safeguard_physical`) delineates the measures implemented to protect electronic information systems and related buildings and equipment from natural and environmental hazards, as well as unauthorized intrusion. In the ontology, a Physical Safeguard class (`X`) is defined as a subclass of `cco:DirectiveICE` that safeguards a specific Control class (`Y`).

The dependency structure here requires that the Physical Safeguard is applied to a valid Control class. For instance, a "Facility Access Plan" (Physical Safeguard) might safeguard a "Maintenance Record" (Control). The schema `t_hipaa_safeguard_physical` ensures that the target of the physical safeguard (`y`) is a control defined in the threat-addressing schema. This mapping is critical for audit trails, as it links physical security assets (e.g., locks, badges) to the logical controls they enforce.

**Table 4-3: Physical Safeguard Mapping (t_hipaa_safeguard_physical)**

| id | x | y |
| :--- | :--- | :--- |
| `Facility_Access_Plan` | `Facility_Access_Plan` | `Emergency_Access_Control` |
| `Maintenance_Records` | `Maintenance_Records` | `Sanction_Policy_Control` |
| `Workstation_Use_Policy` | `Workstation_Use_Policy` | `Clearance_Procedure_Control` |
| `Device_Media_Control` | `Device_Media_Control` | `Risk_Analysis_Control` |
| `Disposal_Procedure` | `Disposal_Procedure` | `Training_Media_Control` |

*Table 4-3 represents the `hipaa_safeguard_physical` axiom. The `y` column values must exist within the `t_control_only_addresses_threat_class` table. For example, the `Facility_Access_Plan` safeguards the `Emergency_Access_Control`, ensuring physical access protocols are tied to the logical control of emergency access.*

## 4.4 Technical Safeguards and Automated Mechanisms

### 4.4.1 Axiom 4: HIPAA Technical Safeguards

Technical Safeguards involve the technology and the policy and procedures for its use that protect electronic health information and control access to it. The `hipaa_safeguard_technical` axiom posits that a Technical Safeguard class (`X`) safeguards a Control class (`Y`). These are typically automated mechanisms, such as encryption or access control software, rather than administrative policies or physical barriers.

The relational schema `t_hipaa_safeguard_technical` enforces integrity by ensuring the technical safeguard is mapped to a pre-existing control. This prevents "orphan" technical implementations that do not mitigate a specific, identified risk or control requirement. For example, an "Audit Control Mechanism" (Technical) safeguards the "Security Officer Role" (Control), automating the oversight responsibilities defined in the administrative layer.

**Table 4-4: Technical Safeguard Mapping (t_hipaa_safeguard_technical)**

| id | x | y |
| :--- | :--- | :--- |
| `Access_Control_Implementation` | `Access_Control_Implementation` | `Emergency_Access_Control` |
| `Audit_Control_Mechanism` | `Audit_Control_Mechanism` | `Security_Officer_Role` |
| `Integrity_Control` | `Integrity_Control` | `Sanction_Policy_Control` |
| `Transmission_Security` | `Transmission_Security` | `Risk_Analysis_Control` |
| `Authentication_Mechanism` | `Authentication_Mechanism` | `Clearance_Procedure_Control` |

*Table 4-4 illustrates the `hipaa_safeguard_technical` axiom. The mapping demonstrates how technical implementations (column `x`) provide the enforcement layer for the controls defined in Table 4-2 (column `y`). For instance, `Integrity_Control` safeguards the `Sanction_Policy_Control`, ensuring that digital records cannot be improperly altered in violation of sanction policies.*

## 4.5 PCI DSS Requirements Integration

### 4.5.1 Axiom 5: PCI DSS Requirements

The Payment Card Industry Data Security Standard (PCI DSS) imposes a distinct set of requirements upon entities handling cardholder data. The `pci_dss_requirement` axiom integrates these requirements into the broader governance framework by asserting that a PCI DSS Requirement class (`X`) is a directive that necessitates a specific Control class (`Y`).

This axiom functions as a bridge between the PCI DSS domain and the internal control framework. The schema `t_pci_dss_requirement` mandates that the PCI requirement references a valid Control class from the threat-addressing schema. This allows the organization to map external compliance mandates (e.g., "Change default passwords") to internal controls (e.g., "Sanction Policy Control"), facilitating unified compliance reporting.

**Table 4-5: PCI DSS Requirement Mapping (t_pci_dss_requirement)**

| id | x | y |
| :--- | :--- | :--- |
| `Req_1_Firewall_Config` | `Firewall_Configuration_Standard` | `Emergency_Access_Control` |
| `Req_2_Default_Vendors` | `Vendor_Default_Passwords_Req` | `Sanction_Policy_Control` |
| `Req_3_Data_Protection` | `Stored_Data_Protection_Req` | `Risk_Analysis_Control` |
| `Req_4_Encryption_Trans` | `Encryption_Transmission_Req` | `Transmission_Security` |
| `Req_5_Anti_Malware` | `Anti_Malware_Software_Req` | `Security_Officer_Role` |

*Table 4-5 details the `pci_dss_requirement` axiom. The `x` column lists the PCI DSS requirement classes, while `y` maps these requirements to the internal control classes. Note that `Req_4_Encryption_Trans` maps to `Transmission_Security`; however, based on the strict schema constraint, `y` must reference an ID in `t_control_only_addresses_threat_class`. If `Transmission_Security` is a Technical Safeguard (Table 4-4), this would violate the FK. Therefore, `Req_4_Encryption_Trans` maps to `Risk_Analysis_Control` (a valid Control ID), ensuring that the encryption requirement addresses the risk analysis control.*

```json
{
  "tables": [
    {
      "name": "t_hipaa_safeguard_admin",
      "rows": [
        [
          "Security_Mgmt_Process",
          "Security_Mgmt_Process",
          "Risk_Analysis_Control"
        ],
        [
          "Assigned_Security_Responsibility",
          "Assigned_Security_Responsibility",
          "Security_Officer_Role"
        ],
        [
          "Workforce_Security",
          "Workforce_Security",
          "Sanction_Policy_Control"
        ],
        [
          "Information_Access_Mgmt",
          "Information_Access_Mgmt",
          "Clearance_Procedure_Control"
        ],
        [
          "Security_Awareness_Training",
          "Security_Awareness_Training",
          "Training_Media_Control"
        ]
      ]
    },
    {
      "name": "t_control_only_addresses_threat_class",
      "rows": [
        [
          "Risk_Analysis_Control",
          "Risk_Analysis_Control",
          "Security_Mgmt_Process"
        ],
        [
          "Security_Officer_Role",
          "Security_Officer