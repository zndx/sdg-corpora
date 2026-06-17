---
chapter_id: aedcfb550ceccb77
topic_id: 150
family: 03_directive_governance
cited_terms: ['attestation_signed_by', 'pci_dss_requirement', 'attestation_min_one_signer', 'audit_conducted_by', 'requirement_equiv_specifies_target']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Formal Ontology of Governance and Compliance Mechanisms

## 7.1 Scope and Preamble

This chapter establishes the formal ontological structures necessary for the rigorous definition of governance, risk, and compliance (GRC) frameworks within enterprise information systems. The content herein defines the axiomatic relationships between regulatory directives, procedural attestations, and audit mechanisms. It provides a deterministic mapping of these axioms to relational schema implementations, ensuring that compliance data structures maintain referential integrity and semantic precision. The definitions provided are derived from the upper-level ontology of Basic Formal Ontology (BFO) and the Common Core Ontologies (CCO), tailored for the specific domain of regulatory control and audit trails.

## 7.2 Attestation and Signatory Authority

### 7.2.1 Axiom: Attestation Signed By

In the context of formal governance, an attestation is defined not merely as a statement of fact, but as a distinct process that must be validated by an agent possessing the authority to bind an organization to a specific claim. Axiomatically, we define the class of attestations as a subclass of `bfo:0000015` (Process), which is necessarily realized through the `sdg:signedBy` object property linking to a `cco:Person`.

This relationship asserts that for any instance of an attestation process to be valid within the system, it must be associated with exactly one natural person who serves as the signatory. This eliminates ambiguity regarding automated or system-generated assertions, ensuring a chain of accountability.

**Table 7.1: Relational Mapping of Attestation Signatory Relations**

The following table represents the projection of the `attestation_signed_by` axiom. The primary key `id` serves as the unique identifier for the attestation instance, while `x` denotes the specific class of the attestation entity being recorded.

| id | x |
| :--- | :--- |
| ATT-2023-884 | `AnnualSecurityAttestation` |
| ATT-2023-885 | `PrivacyPolicyAcknowledgment` |
| ATT-2023-886 | `CodeOfConductCertification` |
| ATT-2023-887 | `IncidentResponseVerification` |

### 7.2.2 Axiom: Attestation Minimum One Signer

To further enforce governance rigor, the ontology imposes a cardinality constraint on the signatory relationship. While the previous axiom establishes the existence of a signatory, the `attestation_min_one_signer` axiom utilizes the Manchester syntax restriction `sdg:signedBy min 1 cco:Person` to define that the attestation process requires a minimum of one authorized person.

This axiom is critical for preventing "orphan" processes—workflow steps that might technically be instantiated as processes but lack the necessary human validation to transition to a completed state. It ensures that the process class `X` is ontologically dependent on the participation of a person.

**Table 7.2: Relational Mapping of Minimum Signer Cardinality**

Table 7.2 enumerates the process classes subject to the minimum signer constraint. The structure is identical to the signatory table but represents the constraint definition rather than a specific instance of a signature event.

| id | x |
| :--- | :--- |
| PROC-CONST-01 | `HighRiskAttestation` |
| PROC-CONST-02 | `FinancialDisclosureProcess` |
| PROC-CONST-03 | `AccessGrantApproval` |
| PROC-CONST-04 | `RegulatoryFilingSubmission` |

## 7.3 Audit Execution and Oversight

### 7.3.1 Axiom: Audit Conducted By

The audit function serves as the primary mechanism for verifying compliance with the aforementioned attestations and directives. The `audit_conducted_by` axiom defines the class `X` (Audit) as a subclass of `bfo:0000015` (Process), which is dependent on the `sdg:conductedBy` property targeting a `cco:Person`.

This distinction separates the concept of an "Audit" (the systematic examination) from the "Auditor" (the agent). In compliance frameworks, this separation is vital for audit trail integrity. The relational projection of this axiom ensures that every audit record is inextricably linked to the personnel credentials of the individual responsible for the examination.

**Table 7.3: Relational Mapping of Audit Conductance**

The data below illustrates the instantiation of audit processes. The column `x` represents the specific classification of the audit event, ensuring that the process is categorized correctly within the broader governance ontology.

| id | x |
| :--- | :--- |
| AUD-Q3-2023-01 | `ITGeneralControlsAudit` |
| AUD-Q3-2023-02 | `PhysicalSecurityAudit` |
| AUD-Q3-2023-03 | `ThirdPartyRiskAssessment` |
| AUD-Q3-2023-04 | `NetworkVulnerabilityAssessment` |

## 7.4 Regulatory Frameworks and PCI DSS Requirements

### 7.4.1 Axiom: PCI DSS Requirement

Governance frameworks often operate at the intersection of internal policy and external regulation. The `pci_dss_requirement` axiom formalizes this intersection by defining a class `X` (typically a Directive or Policy) as a subclass of `cco:DirectiveICE`. This class possesses the property `sdg:pciDssRequirement`, which links it to a specific requirement class `Y`.

This axiom allows the organization to map internal controls directly to the Payment Card Industry Data Security Standard (PCI DSS). The relational schema enforces a foreign key constraint where the requirement (`y`) must reference a valid entry in the specifications table, thereby ensuring that no directive claims compliance with a non-existent or undefined requirement.

**Table 7.4: Relational Mapping of PCI DSS Requirements**

In this table, `x` represents the internal directive class, while `y` is the foreign key referencing the specific requirement definition. Note that the `y` values (`REQ-DEF-01`, etc.) correspond to the identifiers in the subsequent equivalence table (Section 7.5), maintaining referential integrity.

| id | x | y |
| :--- | :--- | :--- |
| DIR-PCI-101 | `CardholderDataPolicy` | REQ-DEF-01 |
| DIR-PCI-102 | `NetworkMonitoringDirective` | REQ-DEF-02 |
| DIR-PCI-103 | `AccessControlProtocol` | REQ-DEF-03 |
| DIR-PCI-104 | `VulnerabilityManagementProcedure` | REQ-DEF-04 |

## 7.5 Directive Equivalence and Target Specification

### 7.5.1 Axiom: Requirement Equivalence Specifies Target

The most complex structure in this chapter is the `requirement_equiv_specifies_target` axiom. This axiom defines a class `X` as being equivalent to the intersection of three conditions:
1.  It is a `cco:DirectiveICE`.
2.  It `sdg:specifies` some requirement class `Y`.
3.  It `sdg:appliesTo` some target class `Z`.

This axiom creates a semantic definition for a "Compliance Directive" that is valid only if it explicitly specifies a requirement and applies to a specific target (e.g., a system, database, or personnel group). The relational schema captures this tripartite relationship. The foreign key constraint on column `y` creates a cyclical dependency with the PCI DSS requirement table (Section 7.4), reflecting the real-world dependency where directives define requirements and requirements validate directives.

**Table 7.5: Relational Mapping of Directive Equivalence**

The table below demonstrates the full context of the compliance directive. The `x` column identifies the directive, `y` links back to the PCI requirement (e.g., `REQ-PCI-101`), and `z` defines the target scope of the directive.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| REQ-DEF-01 | `RequirementDefinition_1` | REQ-PCI-101 | `CardholderDataEnvironment` |
| REQ-DEF-02 | `RequirementDefinition_2` | REQ-PCI-102 | `InternalNetworkZone` |
| REQ-DEF-03 | `RequirementDefinition_3` | REQ-PCI-103 | `AdministrativeAccessConsole` |
| REQ-DEF-04 | `RequirementDefinition_4` | REQ-PCI-104 | `PublicFacingWebServer` |

```json
{
  "tables": [
    {
      "name": "t_attestation_signed_by",
      "rows": [
        [
          "ATT-2023-884",
          "AnnualSecurityAttestation"
        ],
        [
          "ATT-2023-885",
          "PrivacyPolicyAcknowledgment"
        ],
        [
          "ATT-2023-886",
          "CodeOfConductCertification"
        ],
        [
          "ATT-2023-887",
          "IncidentResponseVerification"
        ]
      ]
    },
    {
      "name": "t_attestation_min_one_signer",
      "rows": [
        [
          "PROC-CONST-01",
          "HighRiskAttestation"
        ],
        [
          "PROC-CONST-02",
          "FinancialDisclosureProcess"
        ],
        [
          "PROC-CONST-03",
          "AccessGrantApproval"
        ],
        [
          "PROC-CONST-04",
          "RegulatoryFilingSubmission"
        ]
      ]
    },
    {
      "name": "t_audit_conducted_by",
      "rows": [
        [
          "AUD-Q3-2023-01",
          "ITGeneralControlsAudit"
        ],
        [
          "AUD-Q3-2023-02",
          "PhysicalSecurityAudit"
        ],
        [
          "AUD-Q3-2023-03",
          "ThirdPartyRiskAssessment"
        ],
        [
          "AUD-Q3-2023-04",
          "NetworkVulnerabilityAssessment"
        ]
      ]
    },
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "DIR-PCI-101",
          "CardholderDataPolicy",
          "REQ-DEF-01"
        ],
        [
          "DIR-PCI-102",
          "NetworkMonitoringDirective",
          "REQ-DEF-02"
        ],
        [
          "DIR-PCI-103",
          "AccessControlProtocol",
          "REQ-DEF-03"
        ],
        [
          "DIR-PCI-104",
          "VulnerabilityManagementProcedure",
          "REQ-DEF-04"
        ]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "REQ-DEF-01",
          "RequirementDefinition_1",
          "REQ-PCI-101",
          "CardholderDataEnvironment"
        ],
        [
          "REQ-DEF-02",
          "RequirementDefinition_2",
          "REQ-PCI-102",
          "InternalNetworkZone"
        ],
        [
          "REQ-DEF-03",
          "RequirementDefinition_3",
          "REQ-PCI-103",
          "AdministrativeAccessConsole"
        ],
        [
          "REQ-DEF-04",
          "RequirementDefinition_4",
          "REQ-PCI-104",
          "PublicFacingWebServer"
        ]
      ]
    }
  ]
}
```