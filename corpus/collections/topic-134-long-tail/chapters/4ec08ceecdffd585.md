---
chapter_id: 4ec08ceecdffd585
topic_id: 134
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'pci_dss_requirement', 'control_with_evidence_requirement', 'hipaa_safeguard_technical', 'requirement_equiv_specifies_target']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Interoperable Governance Frameworks and Evidence Management

## 7.1 Scope and Preamble

This chapter delineates the structural architecture for integrating disparate regulatory frameworks—specifically the Payment Card Industry Data Security Standard (PCI DSS) and the Health Insurance Portability and Accountability Act (HIPAA)—into a unified governance ontology. The objective is to provide a rigorous method for mapping high-level organizational directives to granular compliance controls and their associated evidentiary artifacts. By formalizing these relationships, organizations can establish a defensible audit trail that satisfies the requirements of multiple regulatory bodies simultaneously, reducing redundancy and enhancing the precision of compliance reporting. The following sections introduce five foundational axioms that govern the relationships between attestations, requirements, controls, and safeguards, supported by relational data structures that enforce referential integrity across the compliance domain.

## 7.2 Attestation with Supporting Evidence

### 7.2.1 Conceptual Definition

In the context of formal governance, an attestation is defined as a distinct process (bfo:Process) wherein a responsible entity validates the state of compliance against a specified set of criteria. Crucially, an attestation cannot exist in a vacuum; it must be anchored by empirical data or artifacts that substantiate the claim being made. The axiom `attestation_with_supporting_evidence` posits that for any attestation process {X}, there exists a necessary relationship to a supporting evidence class {Y}. This relationship ensures that executive sign-offs or committee certifications are not merely administrative exercises but are grounded in verifiable proof of control implementation and efficacy.

### 7.2.2 Implementation and Data Structure

When modeling this in a relational database, the primary key is the unique identifier of the attestation event. The foreign key constraint mandates that the evidence referenced must exist within the repository of defined PCI DSS requirements or other validated artifacts. This structure prevents the "orphan attestation" problem, where a compliance claim is made without citing the specific regulatory requirement it satisfies.

**Table 7.1: Attestation Linkage to Supporting Evidence**
This table embodies the axiom `attestation_with_supporting_evidence`, illustrating how specific attestation processes (X) are functionally dependent on evidence artifacts (Y) derived from PCI DSS requirements.

| id | x | y |
| :--- | :--- | :--- |
| ATT-2023-Q3 | AnnualSecurityReviewProcess | PCI_REQ_8_1 |
| ATT-2023-Q3 | AnnualSecurityReviewProcess | PCI_REQ_8_2 |
| ATT-2023-Q4 | IncidentResponseAttestation | PCI_REQ_12_9 |
| ATT-2024-01 | AccessControlAudit | PCI_REQ_7_1 |
| ATT-2024-01 | AccessControlAudit | PCI_REQ_7_2 |

In the data presented above, the `AnnualSecurityReviewProcess` (ATT-2023-Q3) is substantiated by multiple evidence points, specifically referencing requirements 8.1 and 8.2 regarding user identification and authentication. This multiplicity allows a single attestation process to cover a broad scope of compliance activities, provided the linkage is explicitly recorded in the governance ledger.

## 7.3 PCI DSS Requirement Mapping

### 7.3.1 Conceptual Definition

The PCI DSS framework operates as a set of prescriptive mandates intended to secure cardholder data. Within the ontology, a PCI DSS requirement is modeled as a subclass of `cco:DirectiveICE` (Information Control Element). The axiom `pci_dss_requirement` establishes that a directive {X} encompasses a specific PCI DSS requirement {Y}. This mapping is critical for translating the dense, legalistic language of the PCI DSS standard into actionable operational directives. It serves as the bridge between the abstract standard (e.g., "Implement strong access control measures") and the specific, technical instantiation of that standard within the enterprise environment.

### 7.3.2 Implementation and Data Structure

The relational schema for this axiom enforces a dependency where the specific requirement {Y} must map back to a control with an evidence requirement. This recursive structure acknowledges that requirements often trigger the need for new controls or the modification of existing ones. The table below captures this mapping, linking high-level organizational policies to the specific PCI clauses they address.

**Table 7.2: Directive to PCI DSS Requirement Mapping**
This table embodies the axiom `pci_dss_requirement`, demonstrating how organizational directives (X) are semantically bound to specific PCI DSS clauses (Y), which in turn mandate evidence collection.

| id | x | y |
| :--- | :--- | :--- |
| DIR-001 | UserAccessPolicy | CTRL_EVID_001 |
| DIR-002 | NetworkMonitoringPolicy | CTRL_EVID_002 |
| DIR-003 | CryptographyStandard | CTRL_EVID_003 |
| DIR-004 | VulnerabilityManagementPlan | CTRL_EVID_004 |
| DIR-005 | InformationSecurityPolicy | CTRL_EVID_005 |

For instance, `DIR-001` (UserAccessPolicy) is the organizational directive that fulfills the obligation of `CTRL_EVID_001`. The foreign key constraint ensures that the control evidence requirement is formally defined and recorded before it can be associated with a directive, maintaining the integrity of the compliance chain.

## 7.4 Control with Evidence Requirement

### 7.4.1 Conceptual Definition

While a directive states *what* must be achieved, a control defines *how* it is achieved. The axiom `control_with_evidence_requirement` formalizes the relationship between a directive {X} and the evidence {Y} required to demonstrate its effective operation. This is a subclass of `cco:DirectiveICE`, emphasizing that the control itself is a directive artifact that demands proof. In audit scenarios, the absence of such evidence results in a finding of "ineffective control," regardless of whether the control is technically deployed. Therefore, the ontology treats the requirement for evidence as a fundamental component of the control definition itself.

### 7.4.2 Implementation and Data Structure

The schema for this axiom creates a circular reference with the PCI DSS requirement table, reflecting the iterative nature of compliance: a PCI requirement necessitates a control, and that control generates evidence that satisfies the requirement. The table below populates this relationship, showing how specific control mechanisms are tied back to the PCI requirements they validate.

**Table 7.3: Control Evidence Requirements**
This table embodies the axiom `control_with_evidence_requirement`, mapping specific control directives (X) to the PCI requirements (Y) that generate the demand for said evidence.

| id | x | y |
| :--- | :--- | :--- |
| CTRL_EVID_001 | MFA_Implementation_Directive | REQ_8_3 |
| CTRL_EVID_002 | IDS_Appliance_Configuration | REQ_11_4 |
| CTRL_EVID_003 | AES256_Encryption_Procedure | REQ_3_4 |
| CTRL_EVID_004 | Quarterly_Scan_Process | REQ_11_2 |
| CTRL_EVID_005 | Annual_Risk_Assessment | REQ_12_1_2 |

Here, the `MFA_Implementation_Directive` (CTRL_EVID_001) is the control mechanism. It is linked to `REQ_8_3` (a placeholder for the PCI requirement regarding Multi-Factor Authentication). This linkage confirms that the evidence produced by the MFA directive (e.g., logs of authentication attempts) is the specific artifact required to satisfy the PCI audit query.

## 7.5 HIPAA Technical Safeguards

### 7.5.1 Conceptual Definition

The HIPAA Security Rule categorizes safeguards into administrative, physical, and technical. The axiom `hipaa_safeguard_technical` focuses specifically on the technical mechanisms and the policies governing their use to protect Electronic Protected Health Information (ePHI). This axiom models a directive {X} as implementing a specific HIPAA technical safeguard {Y}. Unlike the PCI DSS mappings, which are often prescriptive regarding specific data types, HIPAA safeguards are often more flexible regarding the "addressable" vs. "required" nature of implementation. The ontology captures this by treating the safeguard as a class that the directive must satisfy or implement.

### 7.5.2 Implementation and Data Structure

The relational model links the HIPAA safeguard directive to a control with an evidence requirement. This allows the organization to demonstrate that the technical measures deployed for HIPAA compliance (e.g., encryption or access controls) are the same controls used for PCI DSS, facilitating a "controls unification" strategy. The table below illustrates these mappings.

**Table 7.4: HIPAA Technical Safeguard Directives**
This table embodies the axiom `hipaa_safeguard_technical`, linking governance directives (X) to the specific HIPAA technical safeguard definitions (Y) which rely on evidence-generating controls.

| id | x | y |
| :--- | :--- | :--- |
| HIPAA_001 | ePHI_Transmission_Encryption | CTRL_EVID_003 |
| HIPAA_002 | Audit_Control_Mechanism | CTRL_EVID_001 |
| HIPAA_003 | Integrity_Control_Protocol | CTRL_EVID_005 |
| HIPAA_004 | Person_Entity_Authentication | CTRL_EVID_001 |
| HIPAA_005 | Transmission_Security_Mechanism | CTRL_EVID_002 |

In this schema, `HIPAA_001` (ePHI_Transmission_Encryption) utilizes the control evidence defined in `CTRL_EVID_003` (AES256_Encryption_Procedure). This demonstrates that a single technical control (AES-256 encryption) can serve as the evidentiary basis for both a PCI DSS requirement (Table 7.3) and a HIPAA technical safeguard (Table 7.4), optimizing the compliance landscape.

## 7.6 Requirement Specification and Targeting

### 7.6.1 Conceptual Definition

The final axiom, `requirement_equiv_specifies_target`, introduces the concept of scope and applicability. A directive {X} is equivalent to the intersection of two conditions: it specifies a requirement {Y} and applies to a target {Z}. This axiom is crucial for governance because it prevents the "over-application" of controls, which can lead to operational friction, and the "under-application," which leads to compliance gaps. By explicitly defining the target (e.g., a specific database, network segment, or user group), the organization ensures that the requirement is enforced precisely where the risk exists.

### 7.6.2 Implementation and Data Structure

This table structure is more complex, incorporating two foreign keys: one for the requirement specification and one for the target. The target is typically an asset class or inventory item defined elsewhere in the configuration management database (CMDB). The table below provides examples of how requirements are targeted at specific organizational assets.

**Table 7.5: Requirement Specification and Target Application**
This table embodies the axiom `requirement_equiv_specifies_target`, defining the scope of directives (X) by linking them to specific requirements (Y) and the operational targets (Z) to which they apply.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| SPEC-A | Firewall_Rule_Set_101 | REQ_1_2 | Internet_Facing_Perimeter |
| SPEC-B | DB_Access_Role_Config | REQ_7_1 | Production_Patient_DB |
| SPEC-C | Wireless_Access_Policy | REQ_1_2 | Guest_WiFi_Network |
| SPEC-D | Log_Aggregation_Daemon | REQ_10_1 | Central_Syslog_Server |
| SPEC-E | Anti_Malware_Definition | REQ_5_2 | Endpoint_Workstation_Cluster |

For example, `SPEC-A` represents a specific firewall rule set. It specifies `REQ_1_2` (typically related to building and maintaining a secure network) and applies specifically to the `Internet_Facing_Perimeter` target. This granular definition ensures that the audit trail can verify not just that a rule exists, but that it is applied to the correct asset class within the infrastructure.

```json
{
  "tables": [
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "ATT-2023-Q3",
          "AnnualSecurityReviewProcess",
          "PCI_REQ_8_1"
        ],
        [
          "ATT-2023-Q3",
          "AnnualSecurityReviewProcess",
          "PCI_REQ_8_2"
        ],
        [
          "ATT-2023-Q4",
          "IncidentResponseAttestation",
          "PCI_REQ_12_9"
        ],
        [
          "ATT-2024-01",
          "AccessControlAudit",
          "PCI_REQ_7_1"
        ],
        [
          "ATT-2024-01",
          "AccessControlAudit",
          "PCI_REQ_7_2"
        ]
      ]
    },
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "DIR-001",
          "UserAccessPolicy",
          "CTRL_EVID_001"
        ],
        [
          "DIR-002",
          "NetworkMonitoringPolicy",
          "CTRL_EVID_002"
        ],
        [
          "DIR-003",
          "CryptographyStandard",
          "CTRL_EVID_003"
        ],
        [
          "DIR-004",
          "VulnerabilityManagementPlan",
          "CTRL_EVID_004"
        ],
        [
          "DIR-005",
          "InformationSecurityPolicy",
          "CTRL_EVID_005"
        ]
      ]
    },
    {
      "name": "t_control_with_evidence_requirement",
      "rows": [
        [
          "CTRL_EVID_001",
          "MFA_Implementation_Directive",
          "REQ_8_3"
        ],
        [
          "CTRL_EVID_002",
          "IDS_Appliance_Configuration",
          "REQ_11_4"
        ],
        [
          "CTRL_EVID_003",
          "AES256_Encryption_Procedure",
          "REQ_3_4"
        ],
        [
          "CTRL_EVID_004",
          "Quarterly_Scan_Process",
          "REQ_11_2"
        ],
        [
          "CTRL_EVID_005",
          "Annual_Risk_Assessment",
          "REQ_12_1_2"
        ]
      ]
    },
    {
      "name": "t_hipaa_safeguard_technical",
      "rows": [
        [
          "HIPAA_001",
          "ePHI_Transmission_Encryption",
          "CTRL_EVID_003"
        ],
        [
          "HIPAA_002",
          "Audit_Control_Mechanism",
          "CTRL_EVID_001"
        ],
        [
          "HIPAA_003",
          "Integrity_Control_Protocol",
          "CTRL_EVID_005"
        ],
        [
          "HIPAA_004",
          "Person_Entity_Authentication",
          "CTRL_EVID_001"
        ],
        [
          "HIPAA_005",
          "Transmission_Security_Mechanism",
          "CTRL_EVID_002"
        ]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "SPEC-A",
          "Firewall_Rule_Set_101",
          "REQ_1_2",
          "Internet_Facing_Perimeter"
        ],
        [
          "SPEC-B",
          "DB_Access_Role_Config",
          "REQ_7_1",
          "Production_Patient_DB"
        ],
        [
          "SPEC-C",
          "Wireless_Access_Policy",
          "REQ_1_2",
          "Guest_WiFi_Network"
        ],
        [
          "SPEC-D",
          "Log_Aggregation_Daemon",
          "REQ_10_1",
          "Central_Syslog_Server"
        ],
        [
          "SPEC-E",
          "Anti_Malware_Definition",
          "REQ_5_2",
          "Endpoint_Workstation_Cluster"
        ]
      ]
    }
  ]
}
```