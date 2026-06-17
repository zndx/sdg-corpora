---
chapter_id: fbce0fdec1f4d23a
topic_id: 100
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'attestation_with_supporting_evidence', 'hipaa_safeguard_admin', 'hipaa_safeguard_technical', 'hipaa_safeguard_physical']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Regulatory Directives and Evidence Correlation in Hybrid Compliance Frameworks

This chapter delineates the structural mapping between high-level regulatory directives and their substantiating evidentiary artifacts within a unified compliance ontology. It specifically addresses the intersection of Payment Card Industry Data Security Standards (PCI DSS) and Health Insurance Portability and Accountability Act (HIPAA) requirements, demonstrating how Information Control Elements (ICE) are formally bound to attestation processes. The discussion proceeds from the definition of requirement directives through the mechanism of attestation, concluding with the specific administrative, technical, and physical safeguards mandated under HIPAA.

## 4.1 PCI DSS Requirements as Directive ICEs

In the context of the Common Control Ontology (cco), a PCI DSS requirement is formally classified as a Directive Information Control Element (DirectiveICE). This classification asserts that the requirement is not merely a textual suggestion but a prescriptive command that necessitates a specific control state. The axiom defining this relationship posits that a PCI DSS Requirement ({X}) is a subclass of `cco:DirectiveICE` and holds an `sdg:pciDssRequirement` relationship with a specific compliance objective ({Y}).

From a governance perspective, this formalization allows an organization to treat a regulation such as Requirement 8.2.3 ("Passwords/passphrases must meet the following guidelines...") as a distinct object within a database schema, rather than unstructured text. This objectification is critical for automated compliance auditing and gap analysis. It enables the mapping of the directive to the specific evidence required to prove its implementation.

The relational projection of this axiom establishes a foreign key dependency where the requirement ({X}) must reference an attestation process ({Y}). This structure enforces the rule that a requirement cannot exist in a "compliant" state without a corresponding attestation mechanism. It prevents the orphaning of regulatory mandates within the compliance framework.

**Table 4.1: PCI DSS Requirement Directives and Associated Attestations**
The following table represents the instantiation of `t_pci_dss_requirement`. The `x` column denotes the specific PCI DSS directive instance, while the `y` column references the unique identifier of the attestation process responsible for validating that directive. The foreign key constraint ensures that every requirement is bound to a verification workflow.

| id | x (PCI DSS Directive) | y (Attestation Process ID) |
| :--- | :--- | :--- |
| `req_pci_001` | `PCI_DSS_Req_1.2.2` | `attest_net_seg` |
| `req_pci_002` | `PCI_DSS_Req_8.2.1` | `attest_pass_policy` |
| `req_pci_003` | `PCI_DSS_Req_10.2.2` | `attest_log_review` |
| `req_pci_004` | `PCI_DSS_Req_11.3.1` | `attest_ext_vuln` |
| `req_pci_005` | `PCI_DSS_Req_12.10.1` | `attest_policy_dist` |

In the table above, `PCI_DSS_Req_1.2.2` refers to the configuration of firewalls to deny unauthorized traffic. The binding to `attest_net_seg` indicates that the evidence for this requirement is aggregated and verified via a specific network segmentation attestation process. This linkage is the foundational unit of the compliance audit trail.

## 4.2 Attestation with Supporting Evidence

The attestation process serves as the procedural bridge between a static directive and the dynamic evidence of its implementation. According to the Basic Formal Ontology (BFO), an attestation is a Process (`bfo:0000015`) that unfolds over time. The axiom `attestation_with_supporting_evidence` defines this process ({X}) as possessing the property `sdg:withSupportingEvidence`, which links it to a specific evidentiary artifact or requirement ({Y}).

This section highlights the critical distinction between the *directive* (the rule) and the *attestation* (the act of verification). In a rigorous audit environment, the mere existence of a configuration is insufficient; there must be a documented process—such as a quarterly review or an automated scan—that generates and validates the supporting evidence. The ontology captures this by treating the attestation as a first-class entity that references the requirement it validates.

The relational schema for this concept introduces a circular dependency with the PCI requirement table. The attestation table ({X}) references the requirement ({Y}) via its foreign key, while the requirement table references the attestation. This bidirectional relationship models the reality of compliance: a requirement is defined by its verification method, and a verification method is defined by the requirement it targets.

**Table 4.2: Attestation Processes and Evidence Links**
The table below, `t_attestation_with_supporting_evidence`, lists specific attestation processes. The `y` column contains the ID of the PCI requirement that the process is designed to validate. This structure ensures that every audit activity is traceable to a specific regulatory mandate.

| id | x (Attestation Process) | y (PCI Requirement ID) |
| :--- | :--- | :--- |
| `attest_net_seg` | `Quarterly_Firewall_Rule_Review` | `req_pci_001` |
| `attest_pass_policy` | `Annual_Password_Policy_Audit` | `req_pci_002` |
| `attest_log_review` | `Daily_Log_Analysis_Job` | `req_pci_003` |
| `attest_ext_vuln` | `Quarterly_External_Penetration_Test` | `req_pci_004` |
| `attest_policy_dist` | `Annual_Employee_Acknowledgement_Check` | `req_pci_005` |

For instance, the `Quarterly_Firewall_Rule_Review` (`attest_net_seg`) is the process that generates the evidence supporting `req_pci_001`. The integrity of this relationship is paramount; if the attestation process fails or is skipped, the foreign key relationship effectively flags the requirement as "unattested" or "non-compliant" within the system.

## 4.3 HIPAA Administrative Safeguards

While PCI DSS focuses on payment card data, healthcare entities must simultaneously adhere to HIPAA Security Rule mandates. The HIPAA Administrative Safeguards constitute the overarching policies and procedures that manage the selection, development, implementation, and maintenance of security measures. Formally, these safeguards are modeled as DirectiveICEs ({X}) that possess the `sdg:hipaaSafeguard` property, linking them to a specific administrative control objective ({Y}).

The ontology treats administrative safeguards similarly to PCI requirements but distinguishes them by their specific regulatory domain. These directives often involve workforce training, security incident procedures, and contingency planning. In the relational model, the administrative safeguard references an attestation process. This allows a single attestation—such as an annual security risk assessment—to serve as evidence for multiple safeguards across different regulatory frameworks (e.g., PCI and HIPAA), thereby streamlining the audit process.

The implementation of administrative safeguards is procedural rather than technical. For example, the requirement for a Security Management Process (164.308(a)(1)(ii)(B)) is a directive that mandates the establishment of policies. The evidence for this directive is not a server log, but rather the attestation document signed by the Chief Information Security Officer (CISO) or the Privacy Officer.

**Table 4.3: HIPAA Administrative Safeguards Mapping**
This table illustrates `t_hipaa_safeguard_admin`. The `x` column identifies the specific HIPAA administrative safeguard, while `y` links to the attestation process that verifies its implementation. Note that the attestation IDs may overlap with those used in PCI tables, reflecting a unified compliance strategy.

| id | x (HIPAA Administrative Safeguard) | y (Attestation Process ID) |
| :--- | :--- | :--- |
| `admin_saf_001` | `HIPAA_Admin_164.308_a_1_ii_B` | `attest_net_seg` |
| `admin_saf_002` | `HIPAA_Admin_164.308_a_3_i_A` | `attest_workforce_training` |
| `admin_saf_003` | `HIPAA_Admin_164.308_a_4` | `attest_policy_dist` |
| `admin_saf_004` | `HIPAA_Admin_164.308_a_6_i` | `attest_incident_response` |
| `admin_saf_005` | `HIPAA_Admin_164.308_a_7_i` | `attest_contingency_plan` |

In this schema, `HIPAA_Admin_164.308_a_4` (Information Access Management) is linked to `attest_policy_dist`. This suggests that the process of distributing and acknowledging policies (the attestation) serves as the validating evidence for both the PCI requirement regarding policy dissemination (`req_pci_005`) and the HIPAA administrative safeguard regarding access management clearance procedures.

## 4.4 HIPAA Technical Safeguards

Technical Safeguards under HIPAA refer to the technology and the policy and procedures for its use that protect electronic protected health information (ePHI) and control access to it. These are also modeled as DirectiveICEs ({X}) with the `sdg:hipaaSafeguard` property. The distinction here lies in the nature of the evidence; while administrative safeguards rely on policy documents and sign-offs, technical safeguards rely on system configurations, logs, and automated mechanisms.

The axiom `hipaa_safeguard_technical` captures the necessity of automating compliance verification where possible. For example, the requirement for Unique User Identification (164.312(a)(2)(i)) is a directive that must be enforced by the system. The corresponding attestation would involve an automated script querying the Active Directory or LDAP database to verify that no shared accounts exist.

The relational structure enforces that these technical directives are not abstract concepts but are grounded in specific attestation processes. By linking the technical safeguard to an attestation ID, the organization creates a closed loop where the configuration of the system is continuously monitored and verified against the regulatory mandate.

**Table 4.4: HIPAA Technical Safeguards Mapping**
The table `t_hipaa_safeguard_technical` provides instances of technical controls. The `y` column indicates the attestation process, which in this context would typically be an automated scan or configuration audit.

| id | x (HIPAA Technical Safeguard) | y (Attestation Process ID) |
| :--- | :--- | :--- |
| `tech_saf_001` | `HIPAA_Tech_164.312_a_1` | `attest_access_control` |
| `tech_saf_002` | `HIPAA_Tech_164.312_a_2_iv` | `attest_emergency_access` |
| `tech_saf_003` | `HIPAA_Tech_164.312_b` | `attest_audit_controls` |
| `tech_saf_004` | `HIPAA_Tech_164.312_c_1` | `attest_integrity_controls` |
| `tech_saf_005` | `HIPAA_Tech_164.312_e_1` | `attest_transmission_security` |

Here, `HIPAA_Tech_164.312_c_1` (Integrity Mechanism) is linked to `attest_integrity_controls`. This attestation might involve checking checksums or verifying that electronic messages are not altered in transit. The strict foreign key constraint ensures that if the integrity control check is not performed, the technical safeguard is considered unverified.

## 4.5 HIPAA Physical Safeguards

The final category of controls addressed in this chapter is the Physical Safeguards. These directives concern the physical access to buildings and equipment where ePHI is stored. As with the other categories, these are DirectiveICEs ({X}) possessing the `sdg:hipaaSafeguard` property. The evidence for physical safeguards often involves physical security logs, visitor records, and facility access badges.

The ontology treats physical safeguards with the same rigor as technical ones. The axiom `hipaa_safeguard_physical` ensures that physical security policies—such as restricting access to the data center (164.310(a)(1))—are formally linked to an attestation process. This process might be a quarterly inspection of the facility or a review of access logs for unauthorized entry attempts.

By integrating physical safeguards into the same schema as PCI and HIPAA technical safeguards, the organization achieves a holistic view of its security posture. It allows risk managers to correlate physical security gaps with digital security breaches, understanding that compliance is a composite of facility, process, and technology.

**Table 4.5: HIPAA Physical Safeguards Mapping**
The table `t_hipaa_safeguard_physical` outlines the relationship between physical security directives and their verification processes.

| id | x (HIPAA Physical Safeguard) | y (Attestation Process ID) |
| :--- | :--- | :--- |
| `phys_saf_001` | `HIPAA_Phys_164.310_a_1` | `attest_facility_access` |
| `phys_saf_002` | `HIPAA_Phys_164.310_b` | `attest_workstation_use` |
| `phys_saf_003` | `HIPAA_Phys_164.310_c` | `attest_device_security` |
| `phys_saf_004` | `HIPAA_Phys_164.310_d_1` | `attest_media_disposal` |
| `phys_saf_005` | `HIPAA_Phys_164.310_e_1` | `attest_relocation_audit` |

For example, `HIPAA_Phys_164.310_d_1` (Disposal) requires that ePHI-containing hardware be properly sanitized or destroyed before disposal. The link to `attest_media_disposal` ensures that there is a documented process and record (the attestation) verifying that this specific physical safeguard has been executed, closing the compliance loop.

```json
{
  "tables": [
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "req_pci_001",
          "PCI_DSS_Req_1.2.2",
          "attest_net_seg"
        ],
        [
          "req_pci_002",
          "PCI_DSS_Req_8.2.1",
          "attest_pass_policy"
        ],
        [
          "req_pci_003",
          "PCI_DSS_Req_10.2.2",
          "attest_log_review"
        ],
        [
          "req_pci_004",
          "PCI_DSS_Req_11.3.1",
          "attest_ext_vuln"
        ],
        [
          "req_pci_005",
          "PCI_DSS_Req_12.10.1",
          "attest_policy_dist"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "attest_net_seg",
          "Quarterly_Firewall_Rule_Review",
          "req_pci_001"
        ],
        [
          "attest_pass_policy",
          "Annual_Password_Policy_Audit",
          "req_pci_002"
        ],
        [
          "attest_log_review",
          "Daily_Log_Analysis_Job",
          "req_pci_003"
        ],
        [
          "attest_ext_vuln",
          "Quarterly_External_Penetration_Test",
          "req_pci_004"
        ],
        [
          "attest_policy_dist",
          "Annual_Employee_Acknowledgement_Check",
          "req_pci_005"
        ]
      ]
    },
    {
      "name": "t_hipaa_safeguard_admin",
      "rows": [
        [
          "admin_saf_001",
          "HIPAA_Admin_164.308_a_1_ii_B",
          "attest_net_seg"
        ],
        [
          "admin_saf_002",
          "HIPAA_Admin_164.308_a_3_i_A",
          "attest_workforce_training"
        ],
        [
          "admin_saf_003",
          "HIPAA_Admin_164.308_a_4",
          "attest_policy_dist"
        ],
        [
          "admin_saf_004",
          "HIPAA_Admin_164.308_a_6_i",
          "attest_incident_response"
        ],
        [
          "admin_saf_005",
          "HIPAA_Admin_164.308_a_7_i",
          "attest_contingency_plan"
        ]
      ]
    },
    {
      "name": "t_hipaa_safeguard_technical",
      "rows": [
        [
          "tech_saf_001",
          "HIPAA_Tech_164.312_a_1",
          "attest_access_control"
        ],
        [
          "tech_saf_002",
          "HIPAA_Tech_164.312_a_2_iv",
          "attest_emergency_access"
        ],
        [
          "tech_saf_003",
          "HIPAA_Tech_164.312_b",
          "attest_audit_controls"
        ],
        [
          "tech_saf_004",
          "HIPAA_Tech_164.312_c_1",
          "attest_integrity_controls"
        ],
        [
          "tech_saf_005",
          "HIPAA_Tech_164.312_e_1",
          "attest_transmission_security"
        ]
      ]
    },
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        [
          "phys_saf_001",
          "HIPAA_Phys_164.310_a_1",
          "attest_facility_access"
        ],
        [
          "phys_saf_002",
          "HIPAA_Phys_164.310_b",
          "attest_workstation_use"
        ],
        [
          "phys_saf_003",
          "HIPAA_Phys_164.310_c",
          "attest_device_security"
        ],
        [
          "phys_saf_004",
          "HIPAA_Phys_164.310_d_1",
          "attest_media_disposal"
        ],
        [
          "phys_saf_005",
          "HIPAA_Phys_164.310_e_1",
          "attest_relocation_audit"
        ]
      ]
    }
  ]
}
```