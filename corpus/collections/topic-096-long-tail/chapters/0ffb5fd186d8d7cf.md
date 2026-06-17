---
chapter_id: 0ffb5fd186d8d7cf
topic_id: 96
family: 03_directive_governance
cited_terms: ['requirement_equiv_specifies_target', 'pci_dss_requirement', 'policy_equiv_jurisdiction_and_scope', 'attestation_signed_by', 'policy_min_one_enforcer']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Structural Governance and the Ontology of Compliance Directives

### 4.1 Scope and Preamble

This chapter delineates the structural architecture of compliance governance, specifically focusing on the formalization of directives, requirements, and enforcement mechanisms within a regulated information environment. The discourse herein establishes the ontological relationships between abstract policy instruments and their tangible implementations, adhering to the rigorous standards expected in high-trust domains such as financial services and data security. By mapping the semantic constraints of governance frameworks to relational data structures, this chapter provides the necessary blueprint for auditing the integrity of compliance controls. Readers are advised to consult the referenced data tables to verify the logical consistency of the proposed axiom sets against real-world deployment scenarios.

### 4.2 Requirement Specification and Targeting

The fundamental unit of governance is the Directive Information Content Entity (ICE), which serves as the informational artifact upon which compliance logic is built. Within the formal ontology, a Requirement is defined not merely by its textual composition but by its functional relationships: it must specify a control mechanism and apply to a specific target entity. This tripartite structure—Entity, Specification, and Target—ensures that directives are actionable and verifiable.

The axiom `requirement_equiv_specifies_target` posits that for a Class `X` to be recognized as a valid Requirement, it must be equivalent to a `cco:DirectiveICE` that specifies some Class `Y` (the control) and applies to some Class `Z` (the target). This structure prevents the existence of "orphan" directives that mandate action without defining the subject of that action or the scope of its application.

In practice, this means that a governance framework cannot simply state "encrypt data"; it must state "encrypt data (Specification) applied to cardholder data (Target)." The following table illustrates instances of this axiom, demonstrating how specific directives are mapped to their required specifications and targets.

**Table 4-1: Requirement Specification and Target Mapping**
*This table embodies the axiom `requirement_equiv_specifies_target`. The primary key is `id`; columns `y` and `z` represent the specification and target respectively, which are mandatory data properties.*

| id | x (Directive Class) | y (Specifies) | z (Applies To) |
| :--- | :--- | :--- | :--- |
| REQ-2024-001 | TransmissionControlDirective | TLS_1.3_Protocol | ExternalNetworkInterface |
| REQ-2024-002 | AccessControlDirective | MultiFactorAuthentication | AdministrativeConsole |
| REQ-2024-003 | DataRetentionDirective | ImmutableWORMStorage | AuditLogRepository |
| REQ-2024-004 | EncryptionDirective | AES_256_Standard | CardholderDataEnvironment |
| REQ-2024-005 | PhysicalSecurityDirective | BiometricScanner | ServerRoomEntry |

**Action:** Compliance officers must ensure that for every directive defined in column `x`, the technical implementation of column `y` is active across all assets identified in column `z`.

### 4.3 PCI DSS Requirement Integration

Building upon the general definition of a requirement, specific regulatory frameworks impose additional constraints. The Payment Card Industry Data Security Standard (PCI DSS) represents a codified set of requirements that must be formally integrated into the governance ontology. The axiom `pci_dss_requirement` asserts that a Class `X` is a subclass of `cco:DirectiveICE` and possesses a `pciDssRequirement` relationship with some Class `Y`.

This relationship creates a strict hierarchy where general governance directives are validated against specific regulatory mandates. The verbalization "{X} is something that pci dss requirement {Y}" implies that the entity `X` derives its authority and necessity from the PCI DSS standard `Y`. In a relational context, this creates a dependency where the validity of a specific control implementation is contingent upon its alignment with a specific PCI DSS article.

To maintain data integrity, the schema enforces a foreign key constraint linking the specific requirement instance back to the broader requirement specification defined in the previous section. This ensures that every PCI DSS mandate is traceable to a foundational directive within the organization's governance model.

**Table 4-2: PCI DSS Requirement Hierarchy**
*This table embodies the axiom `pci_dss_requirement`. The primary key is `id`; column `y` references the foundational requirement ID (`t_requirement_equiv_specifies_target`), establishing the regulatory lineage.*

| id | x (PCI Requirement Class) | y (Requirement Reference) |
| :--- | :--- | :--- |
| PCI-REQ-8.2.1 | StrongAuthenticationControl | REQ-2024-002 |
| PCI-REQ-4.1 | TransmissionEncryptionControl | REQ-2024-001 |
| PCI-REQ-10.5.1 | AuditLogProtectionControl | REQ-2024-003 |
| PCI-REQ-3.4 | RenderCardholderDataUnreadable | REQ-2024-004 |
| PCI-REQ-9.1.1 | PhysicalAccessControl | REQ-2024-005 |

**Action:** Auditors should verify that the identifiers in column `y` correspond to active entries in the requirement specification register. Any orphaned reference indicates a breakdown in the governance traceability chain.

### 4.4 Policy Jurisdiction and Scope

While requirements define the "what" and "how," policies define the "where" and "who." The axiom `policy_equiv_jurisdiction_and_scope` formalizes the definition of a Policy Class `X` as a `cco:DirectiveICE` that possesses a specific jurisdiction `Y` and governs a specific scope `Z`. Jurisdiction refers to the legal or regulatory authority enforcing the policy (e.g., GDPR, HIPAA, PCI SSC), while scope refers to the operational domain (e.g., EU subsidiaries, payment processing units).

The relational schema for this axiom dictates that the jurisdiction (`y`) is validated against the PCI DSS requirement registry. This constraint reflects a common compliance architecture where the applicability of a specific policy is determined by the presence of specific regulatory requirements. For instance, a policy regarding data encryption may derive its jurisdictional relevance from the existence of PCI DSS Requirement 4.1.

This mapping ensures that policies are not drafted in a vacuum but are anchored to specific regulatory drivers. It enforces the principle that governance scope is a function of regulatory obligation.

**Table 4-3: Policy Jurisdiction and Scope Definition**
*This table embodies the axiom `policy_equiv_jurisdiction_and_scope`. The primary key is `id`; column `y` references the PCI requirement ID, acting as the jurisdictional anchor, while `z` defines the operational scope.*

| id | x (Policy Class) | y (Jurisdiction / PCI Ref) | z (Governed Scope) |
| :--- | :--- | :--- | :--- |
| POL-001 | CorporateEncryptionStandard | PCI-REQ-4.1 | PointOfSaleSystems |
| POL-002 | IdentityManagementPolicy | PCI-REQ-8.2.1 | CorporateNetwork |
| POL-003 | LogRetentionPolicy | PCI-REQ-10.5.1 | CentralizedLoggingCluster |
| POL-004 | KeyManagementPolicy | PCI-REQ-3.4 | DatabaseBackEnd |
| POL-005 | DataCenterAccessPolicy | PCI-REQ-9.1.1 | Facility_Site_A |

**Action:** Review the scope defined in column `z` to ensure it encompasses all assets currently in-scope for the PCI assessment referenced in column `y`.

### 4.5 Policy Enforcement Mechanisms

A directive without enforcement is merely advisory. The ontology addresses this through the axiom `policy_min_one_enforcer`, which states that a Policy Class `X` (a subclass of `cco:DirectiveICE`) must be enforced by a minimum of one Enforcer Class `Y`. This "min 1" cardinality constraint is critical for auditability; it mandates that every policy must have an assigned agent or mechanism responsible for its implementation and monitoring.

In this schema, the enforcer (`y`) is linked to the PCI DSS requirement. This design choice implies that the enforcement mechanism is often the technical control or procedural check mandated by the requirement itself. For example, the "enforcer" of a password policy is the authentication system configured to meet PCI DSS requirements. This linkage closes the loop between policy definition and technical reality.

The relational structure ensures that no policy exists without a corresponding enforcement agent identified in the PCI requirement register. This prevents the common governance failure where policies are documented but lack operational owners.

**Table 4-4: Policy Enforcement Assignment**
*This table embodies the axiom `policy_min_one_enforcer`. The primary key is `id`; column `y` references the PCI requirement ID, which identifies the specific control or agent acting as the enforcer.*

| id | x (Policy Class) | y (Enforcer / PCI Ref) |
| :--- | :--- | :--- |
| POL-ENF-001 | CorporateEncryptionStandard | PCI-REQ-4.1 |
| POL-ENF-002 | IdentityManagementPolicy | PCI-REQ-8.2.1 |
| POL-ENF-003 | LogRetentionPolicy | PCI-REQ-10.5.1 |
| POL-ENF-004 | KeyManagementPolicy | PCI-REQ-3.4 |
| POL-ENF-005 | DataCenterAccessPolicy | PCI-REQ-9.1.1 |

**Action:** Validate that the system or role identified in the referenced PCI requirement (`y`) has the necessary permissions and technical capability to enforce the policy listed in column `x`.

### 4.6 Attestation and Signatory Authority

The final component of the governance framework is the human element of accountability. The axiom `attestation_signed_by` addresses the process of attestation. It defines Class `X` as a subclass of `bfo:0000015` (a Process) that is signed by a `cco:Person`. This axiom captures the formal act of a qualified individual validating the state of compliance.

Attestation is the bridge between the automated or procedural enforcement of controls and the legal or ethical acceptance of responsibility. By classifying attestation as a `bfo:Process`, the ontology acknowledges that it is an activity occurring over time, involving specific steps (review, verification, signing). The `signedBy` property ensures that this process is anchored to a natural person, providing the "human in the loop" required for most regulatory frameworks.

The relational table for this concept is distinct from the others as it focuses on the instance of the attestation process rather than the definition of the directive. It serves as the audit trail for the governance framework.

**Table 4-5: Attestation Process Log**
*This table embodies the axiom `attestation_signed_by`. The primary key is `id`; column `x` represents the attestation process instance.*

| id | x (Attestation Process) |
| :--- | :--- |
| ATT-2023-Q4 | Q4_2023_PCI_DSS_Roc_Attestation |
| ATT-2024-01 | Annual_Security_Awareness_Review |
| ATT-2024-02 | Penetration_Test_Sign_Off |
| ATT-2024-03 | Vulnerability_Management_Attestation |
| ATT-2024-04 | Network_Diagram_Validation_Process |

**Action:** Ensure that all entries in column `x` have associated metadata identifying the signatory (Person) and the timestamp of the signature, as implied by the `signedBy` object property.

```json
{
  "tables": [
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "REQ-2024-001",
          "TransmissionControlDirective",
          "TLS_1.3_Protocol",
          "ExternalNetworkInterface"
        ],
        [
          "REQ-2024-002",
          "AccessControlDirective",
          "MultiFactorAuthentication",
          "AdministrativeConsole"
        ],
        [
          "REQ-2024-003",
          "DataRetentionDirective",
          "ImmutableWORMStorage",
          "AuditLogRepository"
        ],
        [
          "REQ-2024-004",
          "EncryptionDirective",
          "AES_256_Standard",
          "CardholderDataEnvironment"
        ],
        [
          "REQ-2024-005",
          "PhysicalSecurityDirective",
          "BiometricScanner",
          "ServerRoomEntry"
        ]
      ]
    },
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "PCI-REQ-8.2.1",
          "StrongAuthenticationControl",
          "REQ-2024-002"
        ],
        [
          "PCI-REQ-4.1",
          "TransmissionEncryptionControl",
          "REQ-2024-001"
        ],
        [
          "PCI-REQ-10.5.1",
          "AuditLogProtectionControl",
          "REQ-2024-003"
        ],
        [
          "PCI-REQ-3.4",
          "RenderCardholderDataUnreadable",
          "REQ-2024-004"
        ],
        [
          "PCI-REQ-9.1.1",
          "PhysicalAccessControl",
          "REQ-2024-005"
        ]
      ]
    },
    {
      "name": "t_policy_equiv_jurisdiction_and_scope",
      "rows": [
        [
          "POL-001",
          "CorporateEncryptionStandard",
          "PCI-REQ-4.1",
          "PointOfSaleSystems"
        ],
        [
          "POL-002",
          "IdentityManagementPolicy",
          "PCI-REQ-8.2.1",
          "CorporateNetwork"
        ],
        [
          "POL-003",
          "LogRetentionPolicy",
          "PCI-REQ-10.5.1",
          "CentralizedLoggingCluster"
        ],
        [
          "POL-004",
          "KeyManagementPolicy",
          "PCI-REQ-3.4",
          "DatabaseBackEnd"
        ],
        [
          "POL-005",
          "DataCenterAccessPolicy",
          "PCI-REQ-9.1.1",
          "Facility_Site_A"
        ]
      ]
    },
    {
      "name": "t_policy_min_one_enforcer",
      "rows": [
        [
          "POL-ENF-001",
          "CorporateEncryptionStandard",
          "PCI-REQ-4.1"
        ],
        [
          "POL-ENF-002",
          "IdentityManagementPolicy",
          "PCI-REQ-8.2.1"
        ],
        [
          "POL-ENF-003",
          "LogRetentionPolicy",
          "PCI-REQ-10.5.1"
        ],
        [
          "POL-ENF-004",
          "KeyManagementPolicy",
          "PCI-REQ-3.4"
        ],
        [
          "POL-ENF-005",
          "DataCenterAccessPolicy",
          "PCI-REQ-9.1.1"
        ]
      ]
    },
    {
      "name": "t_attestation_signed_by",
      "rows": [
        [
          "ATT-2023-Q4",
          "Q4_2023_PCI_DSS_Roc_Attestation"
        ],
        [
          "ATT-2024-01",
          "Annual_Security_Awareness_Review"
        ],
        [
          "ATT-2024-02",
          "Penetration_Test_Sign_Off"
        ],
        [
          "ATT-2024-03",
          "Vulnerability_Management_Attestation"
        ],
        [
          "ATT-2024-04",
          "Network_Diagram_Validation_Process"
        ]
      ]
    }
  ]
}
```