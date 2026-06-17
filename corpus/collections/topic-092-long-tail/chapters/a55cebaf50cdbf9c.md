---
chapter_id: a55cebaf50cdbf9c
topic_id: 92
family: 07_long_tail
cited_terms: ['attestation_with_supporting_evidence', 'pci_dss_requirement', 'control_with_evidence_requirement', 'hipaa_safeguard_physical', 'hipaa_safeguard_technical']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Integrated Compliance Frameworks and Evidence Verification

## 4.1 Scope and Preamble

This chapter delineates the structural architecture for integrating multi-regulatory compliance standards within a unified governance framework. The primary objective is to establish a deterministic mapping between high-level attestations, specific regulatory directives (specifically PCI DSS and HIPAA), and the granular control mechanisms that enforce them. The following sections provide a formal ontology of these relationships, defining how abstract compliance processes are anchored to verifiable evidence requirements. This approach ensures that governance artifacts are not merely descriptive but are functionally linked to the operational realities of security controls and physical safeguards.

## 4.2 Attestation with Supporting Evidence

In the context of formal governance, an attestation is defined as a specific process (`bfo:0000015`) that validates the state of compliance through the explicit citation of supporting evidence. This concept moves beyond simple self-assessment; it requires a demonstrable chain of custody where a declarative statement is directly supported by artifacted data. The entity making the attestation asserts that a specific condition exists, and this assertion is validated by referencing a distinct evidence class.

The relationship between the attestation process and the evidence is causal and dependency-based. An attestation cannot exist as a valid compliance artifact without the presence of the supporting evidence class. This structure is critical for audit readiness, as it allows external auditors to trace a "Pass/Fail" attestation back to the raw data or configuration states that generated that result.

**Table 4.1: Attestation Linkage to PCI DSS Requirements**
*The following table embodies the axiom `attestation_with_supporting_evidence`. It maps the attestation process (X) to the specific PCI DSS requirement (Y) that serves as its evidentiary basis. The primary key is the attestation ID, while the foreign key establishes the dependency on the requirement table.*

| id | x | y |
| :--- | :--- | :--- |
| ATT-2023-Q3-01 | Quarterly_Audit_Attestation | PCI-REQ-7.1.1 |
| ATT-2023-Q3-02 | Network_Segment_Attestation | PCI-REQ-1.2.3 |
| ATT-2023-Q3-03 | Encryption_Key_Attestation | PCI-REQ-3.5.1 |
| ATT-2023-Q3-04 | Vulnerability_Scan_Attestation | PCI-REQ-11.2.2 |
| ATT-2023-Q3-05 | Policy_Review_Attestation | PCI-REQ-12.1.1 |

## 4.3 PCI DSS Requirements

The Payment Card Industry Data Security Standard (PCI DSS) functions as a set of prescriptive directives (`cco:DirectiveICE`) intended to secure cardholder data. Within the ontology, a PCI DSS requirement is modeled as a class that imposes a specific obligation. This obligation is not isolated; it is structurally linked to a control class that implements the requirement.

This mapping ensures that for every abstract requirement stated in the PCI DSS framework (e.g., "Restrict access to cardholder data"), there is a corresponding control implementation. The relational schema defines this as a dependency where the Requirement (X) necessitates the Control (Y). This directional mapping allows compliance officers to query a requirement and immediately retrieve the specific operational control responsible for satisfying it.

**Table 4.2: PCI DSS Requirements and Control Mappings**
*This table embodies the axiom `pci_dss_requirement`. It lists the specific PCI DSS directive (X) and maps it to the control class (Y) that fulfills the obligation. The foreign key constraint ensures that every requirement is backed by a defined control.*

| id | x | y |
| :--- | :--- | :--- |
| PCI-REQ-7.1.1 | PCI_DSS_Requirement_7_1_1 | CTRL-Access_Control_Policy |
| PCI-REQ-1.2.3 | PCI_DSS_Requirement_1_2_3 | CTRL-Network_Segmentation |
| PCI-REQ-3.5.1 | PCI_DSS_Requirement_3_5_1 | CTRL-Key_Management_Process |
| PCI-REQ-11.2.2 | PCI_DSS_Requirement_11_2_2 | CTRL-External_Vulnerability_Scan |
| PCI-REQ-12.1.1 | PCI_DSS_Requirement_12_1_1 | CTRL-Information_Security_Policy |

## 4.4 Control with Evidence Requirement

A control with an evidence requirement represents the operationalization of compliance. While the PCI DSS requirement defines *what* must be achieved, the control defines *how* it is achieved, and the evidence requirement defines *how it is proven*. This axiom (`control_with_evidence_requirement`) asserts that the control class (X) is a directive that necessitates the production of evidence (Y).

Notably, the schema establishes a recursive or bidirectional reference structure where the evidence requirement (Y) often references the originating PCI DSS requirement. This circularity in the relational model reflects the audit reality: a control is implemented to satisfy a requirement, and the evidence generated by that control is evaluated against that same requirement. This tight coupling ensures that controls are not implemented in a vacuum but are always generating artifacts relevant to the specific regulatory clauses they address.

**Table 4.3: Control Implementation and Evidence Artifacts**
*This table embodies the axiom `control_with_evidence_requirement`. It identifies the specific control (X) and the evidence class (Y) that the control must generate. The foreign key links the evidence back to the governing PCI DSS requirement ID.*

| id | x | y |
| :--- | :--- | :--- |
| CTRL-Access_Control_Policy | Access_Control_Mechanism | PCI-REQ-7.1.1 |
| CTRL-Network_Segmentation | Network_Architecture_Diagram | PCI-REQ-1.2.3 |
| CTRL-Key_Management_Process | Key_Rotation_Logs | PCI-REQ-3.5.1 |
| CTRL-External_Vulnerability_Scan | Scan_Report_Artifact | PCI-REQ-11.2.2 |
| CTRL-Information_Security_Policy | Policy_Document_Version | PCI-REQ-12.1.1 |

## 4.5 HIPAA Safeguards: Physical

The Health Insurance Portability and Accountability Act (HIPAA) mandates specific safeguards to protect Protected Health Information (PHI). Physical safeguards are measures to protect physical access to electronic information systems and related buildings and equipment. In this ontology, a HIPAA physical safeguard is modeled as a directive (`cco:DirectiveICE`) that enforces a specific safeguard class (Y).

These safeguards are integrated into the broader compliance framework by referencing the control mechanisms defined in previous sections. For instance, a physical safeguard regarding "facility access" may rely on the "Access Control Mechanism" control. This mapping demonstrates how a single operational control can satisfy multiple regulatory frameworks (PCI DSS and HIPAA), thereby reducing redundancy and streamlining governance.

**Table 4.4: HIPAA Physical Safeguards Mapping**
*This table embodies the axiom `hipaa_safeguard_physical`. It lists the physical safeguard directive (X) and links it to the underlying control (Y) that enforces it. The structure ensures that physical security measures are formally documented within the control inventory.*

| id | x | y |
| :--- | :--- | :--- |
| HIPAA-PHY-01 | Facility_Access_Control | CTRL-Access_Control_Policy |
| HIPAA-PHY-02 | Workstation_Use | CTRL-Workstation_Security_Policy |
| HIPAA-PHY-03 | Device_and_Media_Control | CTRL-Asset_Management_Process |
| HIPAA-PHY-04 | Workstation_Security | CTRL-Physical_Access_Logs |
| HIPAA-PHY-05 | Contingency_Operations | CTRL-Emergency_Mode_Operation_Plan |

## 4.6 HIPAA Safeguards: Technical

Complementing physical safeguards, HIPAA technical safeguards focus on the technology and the policies and procedures for its use that protect electronic health information and control access to it. These include access control, audit controls, integrity controls, and transmission security.

The ontology models technical safeguards (`hipaa_safeguard_technical`) similarly to physical safeguards but distinguishes the class to allow for domain-specific reporting. A technical safeguard such as "Audit Controls" will map to a control class responsible for logging and monitoring. This distinction is crucial for reporting purposes, as auditors often need to filter controls by the type of safeguard (Physical vs. Technical) to verify comprehensive coverage of the HIPAA Security Rule.

**Table 4.5: HIPAA Technical Safeguards Mapping**
*This table embodies the axiom `hipaa_safeguard_technical`. It defines the technical safeguard directive (X) and its dependency on the specific control implementation (Y). This mapping facilitates automated compliance reporting for technical security domains.*

| id | x | y |
| :--- | :--- | :--- |
| HIPAA-TECH-01 | Access_Control | CTRL-Access_Control_Policy |
| HIPAA-TECH-02 | Audit_Controls | CTRL-Audit_Logging_Mechanism |
| HIPAA-TECH-03 | Integrity_Control | CTRL-Data_Integrity_Checks |
| HIPAA-TECH-04 | Transmission_Security | CTRL-Encryption_Transit |
| HIPAA-TECH-05 | Person_or_Entity_Authentication | CTRL-Multi_Factor_Authentication |

```json
{
  "tables": [
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        ["ATT-2023-Q3-01", "Quarterly_Audit_Attestation", "PCI-REQ-7.1.1"],
        ["ATT-2023-Q3-02", "Network_Segment_Attestation", "PCI-REQ-1.2.3"],
        ["ATT-2023-Q3-03", "Encryption_Key_Attestation", "PCI-REQ-3.5.1"],
        ["ATT-2023-Q3-04", "Vulnerability_Scan_Attestation", "PCI-REQ-11.2.2"],
        ["ATT-2023-Q3-05", "Policy_Review_Attestation", "PCI-REQ-12.1.1"]
      ]
    },
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        ["PCI-REQ-7.1.1", "PCI_DSS_Requirement_7_1_1", "CTRL-Access_Control_Policy"],
        ["PCI-REQ-1.2.3", "PCI_DSS_Requirement_1_2_3", "CTRL-Network_Segmentation"],
        ["PCI-REQ-3.5.1", "PCI_DSS_Requirement_3_5_1", "CTRL-Key_Management_Process"],
        ["PCI-REQ-11.2.2", "PCI_DSS_Requirement_11_2_2", "CTRL-External_Vulnerability_Scan"],
        ["PCI-REQ-12.1.1", "PCI_DSS_Requirement_12_1_1", "CTRL-Information_Security_Policy"]
      ]
    },
    {
      "name": "t_control_with_evidence_requirement",
      "rows": [
        ["CTRL-Access_Control_Policy", "Access_Control_Mechanism", "PCI-REQ-7.1.1"],
        ["CTRL-Network_Segmentation", "Network_Architecture_Diagram", "PCI-REQ-1.2.3"],
        ["CTRL-Key_Management_Process", "Key_Rotation_Logs", "PCI-REQ-3.5.1"],
        ["CTRL-External_Vulnerability_Scan", "Scan_Report_Artifact", "PCI-REQ-11.2.2"],
        ["CTRL-Information_Security_Policy", "Policy_Document_Version", "PCI-REQ-12.1.1"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        ["HIPAA-PHY-01", "Facility_Access_Control", "CTRL-Access_Control_Policy"],
        ["HIPAA-PHY-02", "Workstation_Use", "CTRL-Workstation_Security_Policy"],
        ["HIPAA-PHY-03", "Device_and_Media_Control", "CTRL-Asset_Management_Process"],
        ["HIPAA-PHY-04", "Workstation_Security", "CTRL-Physical_Access_Logs"],
        ["HIPAA-PHY-05", "Contingency_Operations", "CTRL-Emergency_Mode_Operation_Plan"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_technical",
      "rows": [
        ["HIPAA-TECH-01", "Access_Control", "CTRL-Access_Control_Policy"],
        ["HIPAA-TECH-02", "Audit_Controls", "CTRL-Audit_Logging_Mechanism"],
        ["HIPAA-TECH-03", "Integrity_Control", "CTRL-Data_Integrity_Checks"],
        ["HIPAA-TECH-04", "Transmission_Security", "CTRL-Encryption_Transit"],
        ["HIPAA-TECH-05", "Person_or_Entity_Authentication", "CTRL-Multi_Factor_Authentication"]
      ]
    }
  ]
}
```