---
chapter_id: dd8d6d95fd83d3af
topic_id: 58
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'pci_dss_requirement', 'control_with_evidence_requirement', 'hipaa_safeguard_physical', 'verification_produces_evidence']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Evidence-Centric Compliance Frameworks and Verification Protocols

**Governance, Risk, and Compliance Series**
**Volume II: Operational Security Controls**

**Prepared by:**
The Office of Internal Audit and Compliance
Division of Information Security Governance

**Date:** October 24, 2023
**Classification:** Internal Use Only
**Reference Standard:** NIST SP 800-53 / ISO/IEC 27001

---

### 4.0 Scope and Preamble

This chapter delineates the structural relationships between regulatory directives, technical controls, and the evidentiary artifacts required to establish a defensible compliance posture. It provides a formal ontology for mapping specific governance requirements—specifically within the Payment Card Industry Data Security Standard (PCI DSS) and the Health Insurance Portability and Accountability Act (HIPAA)—to the operational mechanisms that fulfill them. The text establishes a deterministic linkage between high-level attestations, granular control implementations, and the verification processes that generate audit trails. Readers will apply these axioms to construct a relational framework where every compliance claim is anchored to a specific, verifiable artifact.

---

### 4.1 Attestation with Supporting Evidence

In the context of formal governance, an attestation is not merely a declaration of compliance but a distinct process (defined by the BFO:Process ontology) that substantiates a state of affairs through reference to objective data. The axiom "Attestation with Supporting Evidence" posits that for an attestation to be valid, it must be intrinsically linked to a supporting evidence class. This relationship prevents "bare assertions" by mandating that every executive sign-off or compliance certification be backed by specific, retrievable data points.

From an audit perspective, this implies that the entity performing the attestation (the *X* class) cannot exist in a valid state without the presence of the supporting evidence (*Y* class). The evidence serves as the dependent variable in the compliance equation. For instance, a Chief Information Security Officer (CISO) attesting to the effectiveness of network segmentation must reference specific configuration files or scan results. Without this linkage, the attestation is considered null and void under rigorous audit standards.

The following table illustrates instances where attestation processes are directly bound to PCI DSS requirement artifacts. The primary key is the unique attestation identifier, while the foreign key establishes the dependency on the specific requirement evidence being validated.

**Table 4.1: Relational Mapping of Attestations to Evidence Requirements**

| id | x (Attestation Process) | y (PCI DSS Requirement Evidence) |
| :--- | :--- | :--- |
| ATT-2023-001 | Annual SOC 2 Type II Attestation | PCI_REQ_8.2.1 |
| ATT-2023-004 | Quarterly Vulnerability Management Sign-off | PCI_REQ_11.3.2 |
| ATT-2023-007 | Third-Party Penetration Test Review | PCI_REQ_11.4 |
| ATT-2023-009 | Encryption Key Management Certification | PCI_REQ_3.6.4 |
| ATT-2023-012 | Physical Access Log Verification | PCI_REQ_9.3 |

This axiom embodies the principle of **traceability**. The table structure enforces that an attestation cannot be recorded unless it references a valid requirement ID (`y`), ensuring that the governance layer is strictly evidence-based.

---

### 4.2 PCI DSS Requirement

The PCI DSS Requirement axiom functions as a directive within the ICE (Information, Control, and Enforcement) ontology. It asserts that a requirement class (*X*) is a type of directive that necessitates a specific PCI DSS control implementation (*Y*). Unlike general policy statements, these directives are actionable mandates that prescribe specific behaviors or configurations within the IT environment.

The verbalization "{X} is something that pci dss requirement {Y}" highlights the directional nature of the mandate. The requirement is the abstract rule; the *Y* slot represents the concrete control or sub-requirement that satisfies the rule. In a relational schema, this creates a hierarchy where high-level compliance goals are decomposed into executable technical controls. For example, the requirement to "protect stored cardholder data" is instantiated through specific controls like encryption, hashing, or truncation mechanisms.

The table below demonstrates how abstract requirement classes are mapped to specific control implementations. Note the recursive nature of compliance: the control implementation (*y*) often references another control requirement, creating a chain of custody for compliance logic.

**Table 4.2: Decomposition of PCI DSS Directives**

| id | x (Requirement Directive) | y (Control Implementation) |
| :--- | :--- | :--- |
| PCI_REQ_1.2.1 | Restrict Inbound/Outbound Traffic | CTRL_FW_RULE_101 |
| PCI_REQ_2.2.2 | System Configuration Standards | CTRL_BASELINE_IMG_v2 |
| PCI_REQ_3.4 | Render PAN Unreadable | CTRL_AES_256_ENCRYPT |
| PCI_REQ_8.1.1 | Assign Unique IDs | CTRL_LDAP_SSO_INT |
| PCI_REQ_10.2.3 | Audit Log Integrity | CTRL_SYSLOG_FORWARDER |

This table represents the **operationalization** of policy. The foreign key constraint linking `y` to a control requirement ensures that every directive has a corresponding, actionable enforcement mechanism within the infrastructure.

---

### 4.3 Control with Evidence Requirement

A critical component of the governance framework is the specification that a control is not merely a passive setting but an active directive that requires evidence. The "Control with Evidence Requirement" axiom formalizes this by stating that a control class (*X*) is a directive that necessitates the production of evidence (*Y*). This distinguishes a theoretical policy from an enforced control; the latter must generate a record of its execution or state.

This axiom introduces a feedback loop within the compliance schema. While the PCI Requirement directs the implementation of a control, the Control with Evidence Requirement directs the generation of proof that the control is functioning. This evidence often takes the form of logs, timestamps, or state snapshots. In the relational model, this creates a dependency where the control's validity is contingent upon the existence of the evidence it generates.

The following table maps specific control classes to the evidence they are mandated to produce. This mapping is essential for automated compliance auditing, as it allows scanning tools to verify not just the presence of a control, but the presence of the control's output.

**Table 4.3: Evidence Generation Mandates for Security Controls**

| id | x (Control Class) | y (Evidence Requirement) |
| :--- | :--- | :--- |
| CTRL_FW_RULE_101 | Next-Gen Firewall Rule Set | PCI_REQ_1.1.6 |
| CTRL_BASELINE_IMG_v2 | Server Hardening Baseline | PCI_REQ_2.2 |
| CTRL_AES_256_ENCRYPT | Database Encryption Module | PCI_REQ_3.4 |
| CTRL_LDAP_SSO_INT | Identity Management Integration | PCI_REQ_8.3 |
| CTRL_SYSLOG_FORWARDER | Centralized Log Aggregation | PCI_REQ_10.5.3 |

This structure enforces **auditability**. The foreign key constraint ensures that the evidence requirement (`y`) is a recognized compliance artifact, thereby closing the loop between the enforcement of a control and the verification of its efficacy.

---

### 4.4 HIPAA Safeguard Physical

While PCI DSS focuses on financial data protection, the HIPAA Security Rule introduces specific safeguards for Protected Health Information (PHI). The "HIPAA Safeguard Physical" axiom defines a class of physical safeguards (*X*) as directives that implement specific HIPAA requirements (*Y*). These controls address the tangible aspects of security—facility access, workstation usage, and device security—rather than purely logical or administrative measures.

The verbalization "{X} is something that hipaa safeguard {Y}" indicates that physical measures are the implementation vehicles for the HIPAA Security Rule's technical standards. For example, the "Facility Access Controls" standard is implemented through physical safeguards such as keycard readers, security guards, or biometric scanners. In the ontology, physical safeguards are a subset of broader directive controls, specifically tailored to the constraints of physical space and hardware.

The table below categorizes physical safeguards and maps them to the specific HIPAA control requirements they satisfy. This mapping is crucial for mixed-environment audits where both digital and physical security domains must be assessed.

**Table 4.4: Mapping of Physical Safeguards to HIPAA Controls**

| id | x (Physical Safeguard) | y (Control Requirement) |
| :--- | :--- | :--- |
| PHY_SAFE_01 | Data Center Biometric Mantrap | CTRL_ACCESS_CTRL_01 |
| PHY_SAFE_02 | Workstation Auto-Lock Mechanism | CTRL_WORKSTATION_02 |
| PHY_SAFE_03 | Secure Document Disposal Bins | CTRL_MEDIA_DISPOSAL_03 |
| PHY_SAFE_04 | CCTV Surveillance System | CTRL_ACCESS_MONITOR_04 |
| PHY_SAFE_05 | UPS and Power Backup Systems | CTRL_POWER_MGMT_05 |

This axiom emphasizes **domain specificity**. The foreign key linking the physical safeguard to a control requirement ensures that physical security measures are not treated in isolation, but are integrated into the broader compliance architecture.

---

### 4.5 Verification Produces Evidence

The final concept in this framework is the "Verification Produces Evidence" axiom. It asserts that the verification process (*X*)—such as an audit, a penetration test, or a manual review—is a distinct activity that produces evidence (*Y*). This is distinct from the evidence produced by the control itself; verification evidence is the *meta-evidence* that proves the control was checked.

This axiom is foundational to the concept of "Independent Verification." It separates the operation of a system from the observation of that system. In a mature governance framework, the logs produced by a server (Control Evidence) are insufficient without the penetration test report (Verification Evidence) that validates the server's resilience against attack. The relational schema treats verification as a process that outputs a specific class of artifact, usually a report or a certificate.

The table below outlines verification activities and the specific evidence artifacts they generate. These artifacts are the final deliverables presented to auditors and regulators to demonstrate due diligence.

**Table 4.5: Verification Processes and Resulting Artifacts**

| id | x (Verification Process) | y (Evidence Artifact) |
| :--- | :--- | :--- |
| VER_PROC_01 | External Penetration Testing | PCI_REQ_11.4 |
| VER_PROC_02 | Quarterly Network Vulnerability Scan | PCI_REQ_11.2.2 |
| VER_PROC_03 | Code Review for Payment Applications | PCI_REQ_6.6 |
| VER_PROC_04 | Wireless Analysis Survey | PCI_REQ_11.1 |
| VER_PROC_05 | Policy Review and Gap Analysis | PCI_REQ_12.1.1 |

This table captures the concept of **assurance**. The foreign key constraint ties the verification process directly to the requirement it addresses, ensuring that verification activities are targeted and relevant to the compliance objectives.

```json
{
  "tables": [
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "ATT-2023-001",
          "Annual SOC 2 Type II Attestation",
          "PCI_REQ_8.2.1"
        ],
        [
          "ATT-2023-004",
          "Quarterly Vulnerability Management Sign-off",
          "PCI_REQ_11.3.2"
        ],
        [
          "ATT-2023-007",
          "Third-Party Penetration Test Review",
          "PCI_REQ_11.4"
        ],
        [
          "ATT-2023-009",
          "Encryption Key Management Certification",
          "PCI_REQ_3.6.4"
        ],
        [
          "ATT-2023-012",
          "Physical Access Log Verification",
          "PCI_REQ_9.3"
        ]
      ]
    },
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "PCI_REQ_1.2.1",
          "Restrict Inbound/Outbound Traffic",
          "CTRL_FW_RULE_101"
        ],
        [
          "PCI_REQ_2.2.2",
          "System Configuration Standards",
          "CTRL_BASELINE_IMG_v2"
        ],
        [
          "PCI_REQ_3.4",
          "Render PAN Unreadable",
          "CTRL_AES_256_ENCRYPT"
        ],
        [
          "PCI_REQ_8.1.1",
          "Assign Unique IDs",
          "CTRL_LDAP_SSO_INT"
        ],
        [
          "PCI_REQ_10.2.3",
          "Audit Log Integrity",
          "CTRL_SYSLOG_FORWARDER"
        ]
      ]
    },
    {
      "name": "t_control_with_evidence_requirement",
      "rows": [
        [
          "CTRL_FW_RULE_101",
          "Next-Gen Firewall Rule Set",
          "PCI_REQ_1.1.6"
        ],
        [
          "CTRL_BASELINE_IMG_v2",
          "Server Hardening Baseline",
          "PCI_REQ_2.2"
        ],
        [
          "CTRL_AES_256_ENCRYPT",
          "Database Encryption Module",
          "PCI_REQ_3.4"
        ],
        [
          "CTRL_LDAP_SSO_INT",
          "Identity Management Integration",
          "PCI_REQ_8.3"
        ],
        [
          "CTRL_SYSLOG_FORWARDER",
          "Centralized Log Aggregation",
          "PCI_REQ_10.5.3"
        ]
      ]
    },
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        [
          "PHY_SAFE_01",
          "Data Center Biometric Mantrap",
          "CTRL_ACCESS_CTRL_01"
        ],
        [
          "PHY_SAFE_02",
          "Workstation Auto-Lock Mechanism",
          "CTRL_WORKSTATION_02"
        ],
        [
          "PHY_SAFE_03",
          "Secure Document Disposal Bins",
          "CTRL_MEDIA_DISPOSAL_03"
        ],
        [
          "PHY_SAFE_04",
          "CCTV Surveillance System",
          "CTRL_ACCESS_MONITOR_04"
        ],
        [
          "PHY_SAFE_05",
          "UPS and Power Backup Systems",
          "CTRL_POWER_MGMT_05"
        ]
      ]
    },
    {
      "name": "t_verification_produces_evidence",
      "rows": [
        [
          "VER_PROC_01",
          "External Penetration Testing",
          "PCI_REQ_11.4"
        ],
        [
          "VER_PROC_02",
          "Quarterly Network Vulnerability Scan",
          "PCI_REQ_11.2.2"
        ],
        [
          "VER_PROC_03",
          "Code Review for Payment Applications",
          "PCI_REQ_6.6"
        ],
        [
          "VER_PROC_04",
          "Wireless Analysis Survey",
          "PCI_REQ_11.1"
        ],
        [
          "VER_PROC_05",
          "Policy Review and Gap Analysis",
          "PCI_REQ_12.1.1"
        ]
      ]
    }
  ]
}
```