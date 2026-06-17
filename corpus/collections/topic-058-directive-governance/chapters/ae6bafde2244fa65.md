---
chapter_id: ae6bafde2244fa65
topic_id: 58
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'pci_dss_requirement', 'control_with_evidence_requirement', 'hipaa_safeguard_physical', 'verification_produces_evidence']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Evidence-Based Governance and Regulatory Compliance Frameworks

## 4.1 Scope and Preamble

This chapter delineates the formal ontology governing the intersection of regulatory directives, specifically the Payment Card Industry Data Security Standard (PCI DSS) and the Health Insurance Portability and Accountability Act (HIPAA), within a unified compliance architecture. The purpose of this text is to provide systems architects, compliance officers, and information security governance professionals with a precise mapping of how high-level directives decompose into executable controls and verifiable evidence artifacts. The information presented herein is current as of the publication date and aligns with the BFO (Basic Formal Ontology) upper-level ontology for processual and directive entities. Readers should note that the relational mappings provided are deterministic projections of the underlying OWL axioms and are intended for direct implementation in governance, risk, and compliance (GRC) database schemas.

## 4.2 Attestation with Supporting Evidence

In the context of formal governance, an attestation is defined not merely as a declarative statement but as a processual entity that substantiates compliance through the citation of specific artifacts. Formally, we define the class **Attestation with Supporting Evidence** as a subclass of `bfo:0000015` (Process) which necessitates the existence of a supporting evidence object. This relationship is critical for audit readiness; an attestation is invalid if it does not reference a specific, extant evidence artifact that satisfies a regulatory requirement.

The axiom asserts that `{X}` (the Attestation Process) is a process that `with supporting evidence` `{Y}` (the Evidence Artifact). In practice, this means that when an organization signs an Annual Report on Compliance (ROC), the act of signing is the process `X`, but it must be anchored to `Y`, which is the specific requirement or evidence package being validated. This structure prevents "bare" attestations that lack audit trails.

The following table instantiates this axiom. The primary key is the unique identifier for the attestation event (`id`). The column `x` represents the attestation process instance, while `y` is a foreign key referencing the specific PCI DSS requirement that serves as the evidence basis. This enforces the constraint that attestations cannot exist in a vacuum; they must be anchored to a defined regulatory requirement.

**Table 4.1: Relational Schema for Attestation with Supporting Evidence**

| id | x | y |
| :--- | :--- | :--- |
| ATT-2023-01 | Annual_ROC_Signing_Event | PCI_REQ_08 |
| ATT-2023-Q3 | Quarterly_Executive_Attestation | PCI_REQ_11 |
| ATT-2023-04 | Third_Party_Audit_Certification | PCI_REQ_01 |
| ATT-2023-05 | Internal_Compliance_Affidavit | PCI_REQ_12 |
| ATT-2023-06 | SAQ_A_Attestation_Process | PCI_REQ_02 |

## 4.3 PCI DSS Requirements

The **PCI DSS Requirement** class functions as the central node in the compliance graph, representing specific mandates issued by the PCI Security Standards Council. Ontologically, this class is a subclass of `cco:DirectiveICE` (Information Control Element Directive). The axiom posits that `{X}` (a Directive) has a `pci dss requirement` relationship with `{Y}` (a specific Control or Requirement class).

This relationship is recursive in nature within a complex governance environment. A high-level directive (such as "Maintain a Vulnerability Management Program") decomposes into specific requirements (e.g., "Use anti-virus software"), which in turn may map to other control requirements. The relational schema captures this by linking a PCI DSS Requirement entry to another entry in the `t_control_with_evidence_requirement` table. This structure allows the framework to model the nesting of regulations, where a general PCI DSS mandate is fulfilled by a specific technical control that itself demands evidence.

In the table below, `id` represents the unique code for the PCI requirement (e.g., Req. 1.1.2). The `x` column denotes the formal description of the requirement, while `y` is a foreign key pointing to the specific control mechanism that enforces this requirement. This mapping ensures traceability from the abstract standard to the concrete control implementation.

**Table 4.2: Relational Schema for PCI DSS Requirements**

| id | x | y |
| :--- | :--- | :--- |
| PCI_REQ_01 | Install_and_maintain_firewall_configuration | CTRL_EVID_01 |
| PCI_REQ_02 | Change_default_passwords_upon_installation | CTRL_EVID_02 |
| PCI_REQ_08 | Encrypt_transmission_of_cardholder_data | CTRL_EVID_03 |
| PCI_REQ_11 | Regularly_test_security_systems_processes | CTRL_EVID_04 |
| PCI_REQ_12 | Maintain_policy_that_addresses_info_security | CTRL_EVID_05 |

## 4.4 Controls with Evidence Requirements

To operationalize a directive, organizations must implement technical or administrative controls. The **Control with Evidence Requirement** class defines these operational entities. As a subclass of `cco:DirectiveICE`, this class represents the granular rules or configurations that must be present in the IT environment. The axiom formalizes this as `{X}` (the Control) `requires evidence` `{Y}`.

This concept is pivotal for the "evidence-anchored" nature of this documentation. It is insufficient to merely state that a control exists; the control must generate or possess evidence of its operation. For instance, a "Password Complexity Policy" is a control, but it requires evidence in the form of system configuration screenshots or audit logs proving the complexity settings are active.

The relational schema for this axiom establishes a dependency where the control (`x`) points to a PCI DSS requirement (`y`). This creates a bidirectional link with the previous table: PCI Requirements map to Controls, and Controls map back to PCI Requirements (or other requirements), forming a verification loop. The table below illustrates how specific control implementations are tied to the evidence artifacts they must produce to satisfy the broader PCI DSS mandate.

**Table 4.3: Relational Schema for Controls with Evidence Requirements**

| id | x | y |
| :--- | :--- | :--- |
| CTRL_EVID_01 | Perimeter_Firewall_Ruleset_Audit | PCI_REQ_01 |
| CTRL_EVID_02 | Default_Password_Removal_Procedure | PCI_REQ_02 |
| CTRL_EVID_03 | SSL_TLS_Configuration_Validation | PCI_REQ_08 |
| CTRL_EVID_04 | Internal_Vulnerability_Scan_Results | PCI_REQ_11 |
| CTRL_EVID_05 | Security_Awareness_Training_Logs | PCI_REQ_12 |

## 4.5 HIPAA Physical Safeguards

While PCI DSS focuses heavily on digital data flows and encryption, HIPAA (specifically the Security Rule) imposes rigorous standards for physical access and infrastructure. The **HIPAA Safeguard Physical** class represents directives concerning the physical protection of Electronic Protected Health Information (ePHI). The axiom defines `{X}` as a directive that `hipaa safeguard` `{Y}`.

In a hybrid environment where payment card data (PCI) and health information (HIPAA) may coexist (e.g., in a hospital billing department), the physical safeguards become a shared control domain. However, for the purpose of this ontology, we treat the HIPAA safeguard as a distinct class of directive that references the broader evidence requirements. This allows the organization to demonstrate that a physical control (e.g., a badge reader) satisfies a HIPAA mandate while simultaneously generating the evidence required by the control framework defined in Section 4.4.

The table below maps specific HIPAA physical safeguard directives to the control evidence tables. The foreign key `y` links the HIPAA directive to a `control_with_evidence_requirement`, demonstrating that the physical safeguard is the mechanism by which the evidence requirement is satisfied.

**Table 4.4: Relational Schema for HIPAA Physical Safeguards**

| id | x | y |
| :--- | :--- | :--- |
| HIPAA_PHYS_01 | Facility_Access_Control_Contingency | CTRL_EVID_01 |
| HIPAA_PHYS_02 | Workstation_Use_Physical_Restriction | CTRL_EVID_02 |
| HIPAA_PHYS_03 | Device_and_Media_Control_Disposal | CTRL_EVID_03 |
| HIPAA_PHYS_04 | Physical_Access_Validation_Logs | CTRL_EVID_04 |
| HIPAA_PHYS_05 | Security_Guard_Operational_Review | CTRL_EVID_05 |

## 4.6 Verification Producing Evidence

The final concept in this chapter addresses the dynamic generation of compliance artifacts. **Verification Producing Evidence** is a process class (`bfo:0000015`) that encapsulates the act of testing, scanning, or auditing. The axiom states that `{X}` (the Verification Process) `produces evidence` `{Y}`.

This distinction separates the *control* (the static configuration or policy) from the *verification* (the active check of that control). For example, a "Firewall Rule" is a control, but the "Quarterly Firewall Review" is the verification process that produces the evidence (the review report) proving the rule is effective. This process-oriented view is essential for continuous compliance; it shifts the focus from "having a policy" to "proving the policy works" through regular, documented activity.

The relational table below connects the verification activity directly to the PCI DSS requirement it fulfills. The `x` column contains the specific verification procedure (e.g., an external penetration test), and `y` references the PCI requirement ID that this procedure satisfies. This completes the audit trail: the requirement exists, the control is implemented, the verification process runs, and the evidence is generated.

**Table 4.5: Relational Schema for Verification Producing Evidence**

| id | x | y |
| :--- | :--- | :--- |
| VER_PROC_01 | External_Penetration_Test_Execute | PCI_REQ_11 |
| VER_PROC_02 | Internal_Network_Vulnerability_Scan | PCI_REQ_11 |
| VER_PROC_03 | Wireless_Analyzer_Sweep_Conduct | PCI_REQ_02 |
| VER_PROC_04 | Config_Review_Firewall_Ruleset | PCI_REQ_01 |
| VER_PROC_05 | File_Integrity_Monitoring_Log_Check | PCI_REQ_10 |

```json
{
  "tables": [
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        ["ATT-2023-01", "Annual_ROC_Signing_Event", "PCI_REQ_08"],
        ["ATT-2023-Q3", "Quarterly_Executive_Attestation", "PCI_REQ_11"],
        ["ATT-2023-04", "Third_Party_Audit_Certification", "PCI_REQ_01"],
        ["ATT-2023-05", "Internal_Compliance_Affidavit", "PCI_REQ_12"],
        ["ATT-2023-06", "SAQ_A_Attestation_Process", "PCI_REQ_02"]
      ]
    },
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        ["PCI_REQ_01", "Install_and_maintain_firewall_configuration", "CTRL_EVID_01"],
        ["PCI_REQ_02", "Change_default_passwords_upon_installation", "CTRL_EVID_02"],
        ["PCI_REQ_08", "Encrypt_transmission_of_cardholder_data", "CTRL_EVID_03"],
        ["PCI_REQ_11", "Regularly_test_security_systems_processes", "CTRL_EVID_04"],
        ["PCI_REQ_12", "Maintain_policy_that_addresses_info_security", "CTRL_EVID_05"]
      ]
    },
    {
      "name": "t_control_with_evidence_requirement",
      "rows": [
        ["CTRL_EVID_01", "Perimeter_Firewall_Ruleset_Audit", "PCI_REQ_01"],
        ["CTRL_EVID_02", "Default_Password_Removal_Procedure", "PCI_REQ_02"],
        ["CTRL_EVID_03", "SSL_TLS_Configuration_Validation", "PCI_REQ_08"],
        ["CTRL_EVID_04", "Internal_Vulnerability_Scan_Results", "PCI_REQ_11"],
        ["CTRL_EVID_05", "Security_Awareness_Training_Logs", "PCI_REQ_12"]
      ]
    },
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        ["HIPAA_PHYS_01", "Facility_Access_Control_Contingency", "CTRL_EVID_01"],
        ["HIPAA_PHYS_02", "Workstation_Use_Physical_Restriction", "CTRL_EVID_02"],
        ["HIPAA_PHYS_03", "Device_and_Media_Control_Disposal", "CTRL_EVID_03"],
        ["HIPAA_PHYS_04", "Physical_Access_Validation_Logs", "CTRL_EVID_04"],
        ["HIPAA_PHYS_05", "Security_Guard_Operational_Review", "CTRL_EVID_05"]
      ]
    },
    {
      "name": "t_verification_produces_evidence",
      "rows": [
        ["VER_PROC_01", "External_Penetration_Test_Execute", "PCI_REQ_11"],
        ["VER_PROC_02", "Internal_Network_Vulnerability_Scan", "PCI_REQ_11"],
        ["VER_PROC_03", "Wireless_Analyzer_Sweep_Conduct", "PCI_REQ_02"],
        ["VER_PROC_04", "Config_Review_Firewall_Ruleset", "PCI_REQ_01"],
        ["VER_PROC_05", "File_Integrity_Monitoring_Log_Check", "PCI_REQ_10"]
      ]
    }
  ]
}
```