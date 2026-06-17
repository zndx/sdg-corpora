---
chapter_id: 6ff8d7b44acfca8c
topic_id: 96
family: 03_directive_governance
cited_terms: ['requirement_equiv_specifies_target', 'pci_dss_requirement', 'policy_equiv_jurisdiction_and_scope', 'attestation_signed_by', 'policy_min_one_enforcer']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Governance Frameworks and Compliance Ontology in PCI DSS Environments

This chapter establishes the formal ontology governing the definition, jurisdiction, and enforcement of Payment Card Industry Data Security Standard (PCI DSS) directives. It provides a rigorous breakdown of the axioms that bind information content entities to specific technical requirements, legal jurisdictions, and enforcement mechanisms. The content herein is intended for compliance officers, auditors, and information security managers who require a precise mapping of governance concepts to relational data structures. Readers should ensure that their local governance documentation aligns with the class definitions and equivalence relations specified below.

## 1. Requirement Specification and Targeting

The foundational axiom of compliance governance is the equivalence between a high-level directive and its specific operational realization. In formal ontology, a Requirement Class is defined as equivalent to a Directive Information and Content Entity (ICE) that specifies a particular control and applies to a specific target. This tripartite structure ensures that governance artifacts are never abstract; they must explicitly articulate the control required (`specifies`) and the system component to which the control applies (`appliesTo`).

This axiom prevents the ambiguity often found in high-level policies by mandating that every directive be anchored to a tangible requirement and a target asset class. For instance, a directive regarding "Network Security" is only valid within the ontology if it specifies a "Firewall Configuration Requirement" and applies to a "Network Perimeter."

The following table delineates the instances of this equivalence relation. The primary key is the unique identifier of the requirement class (`id`). The column `y` functions as a foreign key referencing the specific PCI DSS requirement definition, while `z` denotes the target class of the asset governed by this directive.

**Table 1-1: Requirement Specification and Target Mapping**
This table embodies the axiom `requirement_equiv_specifies_target`, linking the directive class (`x`) to a specific requirement (`y`) and a target system (`z`).

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| REQ_SPEC_101 | FirewallDirective | PCI_REQ_201 | SystemComponent |
| REQ_SPEC_102 | EncryptionDirective | PCI_REQ_202 | TransmissionMedia |
| REQ_SPEC_103 | AccessControlDirective | PCI_REQ_203 | AuthenticationDatabase |
| REQ_SPEC_104 | LoggingDirective | PCI_REQ_204 | AuditLogServer |
| REQ_SPEC_105 | VulnerabilityDirective | PCI_REQ_205 | WebApplication |

Action: Verify that all documented governance directives in your environment map to a valid entry in column `y` and that the target scope in column `z` accurately reflects the asset inventory.

## 2. PCI DSS Requirement Hierarchy

Building upon the general specification of requirements, this section addresses the specific subclass of directives mandated by the PCI DSS framework. The axiom `pci_dss_requirement` posits that a specific Class (`X`) is a subclass of the general Directive ICE and satisfies the `pciDssRequirement` property for a specific Requirement Class (`Y`). This creates a hierarchical structure where specific organizational controls are validated against the standard PCI DSS requirements.

Verbalized, this axiom asserts: "{X} is something that pci dss requirement {Y}". This structure allows the ontology to distinguish between a generic internal policy and a specific control implemented to satisfy a PCI DSS mandate. The relational integrity is maintained through a circular reference with the specification table, reinforcing the bi-directional nature of the compliance definition.

**Table 2-1: PCI DSS Requirement Instances**
This table embodies the axiom `pci_dss_requirement`. The primary key (`id`) identifies the specific requirement instance, while column `y` references the originating specification table (`t_requirement_equiv_specifies_target`), establishing the link between the abstract requirement and its specific PCI DSS classification.

| id | x | y |
| :--- | :--- | :--- |
| PCI_REQ_201 | RequirementClass | REQ_SPEC_101 |
| PCI_REQ_202 | RequirementClass | REQ_SPEC_102 |
| PCI_REQ_203 | RequirementClass | REQ_SPEC_103 |
| PCI_REQ_204 | RequirementClass | REQ_SPEC_104 |
| PCI_REQ_205 | RequirementClass | REQ_SPEC_105 |

Action: Ensure that for every internal directive classified as a PCI DSS requirement, there is a corresponding entry in this table where the `y` value resolves to a valid specification ID.

## 3. Policy Jurisdiction and Scope

While requirements define technical controls, policies define the legal and operational boundaries of those controls. The axiom `policy_equiv_jurisdiction_and_scope` asserts that a Policy Class is equivalent to a Directive ICE that possesses a specific jurisdiction and governs a specific scope. This is critical for multinational organizations where a single technical control may be subject to differing regulatory interpretations based on geography.

The `hasJurisdiction` slot binds the policy to a legal entity (e.g., GDPR, California Consumer Privacy Act), while `governsScope` restricts the policy's application to a specific data domain (e.g., Cardholder Data Environment). This axiom ensures that policies are not only technically sound but also legally enforceable within the defined territory.

**Table 3-1: Policy Jurisdiction and Scope Definitions**
This table embodies the axiom `policy_equiv_jurisdiction_and_scope`. The primary key (`id`) represents the unique policy identifier. Column `y` references the PCI DSS requirement (`t_pci_dss_requirement`) that enforces this policy, and column `z` defines the scope of governance.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| POL_JUR_301 | DataSovereigntyPolicy | PCI_REQ_202 | EEA_Territory |
| POL_JUR_302 | AccessGovernancePolicy | PCI_REQ_203 | CorporateNetwork |
| POL_JUR_303 | IncidentResponsePolicy | PCI_REQ_204 | ProductionEnvironment |
| POL_JUR_304 | PenetrationTestingPolicy | PCI_REQ_205 | ExternalFacingSystems |

Action: Review all jurisdictional claims in column `y` to confirm they align with the current legal frameworks applicable to your organization's primary place of business.

## 4. Attestation and Signatory Authority

Compliance is not merely a state of being but a process of verification. The axiom `attestation_signed_by` defines the Attestation Class as a subclass of a Process (specifically `bfo:0000015`, a Processual Entity) that must be signed by a Person. This formalizes the act of compliance verification as a distinct temporal event with accountable agents.

In the context of an audit, this axiom captures the metadata of the sign-off. It moves beyond the simple existence of a report to the verification that a specific agent (the `cco:Person`) has executed the signing process. This is essential for non-repudiation and audit trail integrity.

**Table 4-1: Attestation Log**
This table embodies the axiom `attestation_signed_by`. The primary key (`id`) is the unique attestation record identifier. Column `x` represents the class of the attestation process, typically an instance of a formal audit sign-off.

| id | x |
| :--- | :--- |
| ATT_SIGN_401 | QSA_Attestation_Event |
| ATT_SIGN_402 | Internal_Audit_SignOff |
| ATT_SIGN_403 | Executive_Acknowledgement |
| ATT_SIGN_404 | ROC_Submission_Process |
| ATT_SIGN_405 | AOC_Signing_Event |

Action: Validate that all entries in the attestation log correspond to a specific, identified individual in the HR records system, ensuring the `cco:Person` reference is resolvable.

## 5. Policy Enforcement Mechanisms

A policy without enforcement is merely advice. The axiom `policy_min_one_enforcer` mandates that a Policy Class (a subclass of Directive ICE) must be enforced by a minimum of one Requirement Class. This creates the necessary "closed-loop" governance structure where high-level mandates are guaranteed to have operational, enforceable controls backing them.

This axiom utilizes the "min 1" quantifier, ensuring cardinality. A policy claiming to enforce "Data Security" must reference at least one concrete requirement—such as "Use of Strong Cryptography"—that performs the enforcement. The relational schema links the policy directly to the requirement table, ensuring that no enforcement references are "dangling."

**Table 5-1: Policy Enforcement Mapping**
This table embodies the axiom `policy_min_one_enforcer`. The primary key (`id`) identifies the policy, while column `y` provides the foreign key reference to the requirement in `t_pci_dss_requirement` that acts as the enforcer.

| id | x | y |
| :--- | :--- | :--- |
| POL_ENF_501 | DataRetentionPolicy | PCI_REQ_204 |
| POL_ENF_502 | RemoteAccessPolicy | PCI_REQ_203 |
| POL_ENF_503 | WirelessAccessPolicy | PCI_REQ_201 |
| POL_ENF_504 | ChangeManagementPolicy | PCI_REQ_205 |
| POL_ENF_505 | PhysicalSecurityPolicy | PCI_REQ_203 |

Action: Conduct a gap analysis to ensure that every active policy in the governance framework has at least one corresponding row in this table, thereby satisfying the "min 1" enforcement cardinality rule.

```json
{
  "tables": [
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "REQ_SPEC_101",
          "FirewallDirective",
          "PCI_REQ_201",
          "SystemComponent"
        ],
        [
          "REQ_SPEC_102",
          "EncryptionDirective",
          "PCI_REQ_202",
          "TransmissionMedia"
        ],
        [
          "REQ_SPEC_103",
          "AccessControlDirective",
          "PCI_REQ_203",
          "AuthenticationDatabase"
        ],
        [
          "REQ_SPEC_104",
          "LoggingDirective",
          "PCI_REQ_204",
          "AuditLogServer"
        ],
        [
          "REQ_SPEC_105",
          "VulnerabilityDirective",
          "PCI_REQ_205",
          "WebApplication"
        ]
      ]
    },
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "PCI_REQ_201",
          "RequirementClass",
          "REQ_SPEC_101"
        ],
        [
          "PCI_REQ_202",
          "RequirementClass",
          "REQ_SPEC_102"
        ],
        [
          "PCI_REQ_203",
          "RequirementClass",
          "REQ_SPEC_103"
        ],
        [
          "PCI_REQ_204",
          "RequirementClass",
          "REQ_SPEC_104"
        ],
        [
          "PCI_REQ_205",
          "RequirementClass",
          "REQ_SPEC_105"
        ]
      ]
    },
    {
      "name": "t_policy_equiv_jurisdiction_and_scope",
      "rows": [
        [
          "POL_JUR_301",
          "DataSovereigntyPolicy",
          "PCI_REQ_202",
          "EEA_Territory"
        ],
        [
          "POL_JUR_302",
          "AccessGovernancePolicy",
          "PCI_REQ_203",
          "CorporateNetwork"
        ],
        [
          "POL_JUR_303",
          "IncidentResponsePolicy",
          "PCI_REQ_204",
          "ProductionEnvironment"
        ],
        [
          "POL_JUR_304",
          "PenetrationTestingPolicy",
          "PCI_REQ_205",
          "ExternalFacingSystems"
        ]
      ]
    },
    {
      "name": "t_attestation_signed_by",
      "rows": [
        [
          "ATT_SIGN_401",
          "QSA_Attestation_Event"
        ],
        [
          "ATT_SIGN_402",
          "Internal_Audit_SignOff"
        ],
        [
          "ATT_SIGN_403",
          "Executive_Acknowledgement"
        ],
        [
          "ATT_SIGN_404",
          "ROC_Submission_Process"
        ],
        [
          "ATT_SIGN_405",
          "AOC_Signing_Event"
        ]
      ]
    },
    {
      "name": "t_policy_min_one_enforcer",
      "rows": [
        [
          "POL_ENF_501",
          "DataRetentionPolicy",
          "PCI_REQ_204"
        ],
        [
          "POL_ENF_502",
          "RemoteAccessPolicy",
          "PCI_REQ_203"
        ],
        [
          "POL_ENF_503",
          "WirelessAccessPolicy",
          "PCI_REQ_201"
        ],
        [
          "POL_ENF_504",
          "ChangeManagementPolicy",
          "PCI_REQ_205"
        ],
        [
          "POL_ENF_505",
          "PhysicalSecurityPolicy",
          "PCI_REQ_203"
        ]
      ]
    }
  ]
}
```