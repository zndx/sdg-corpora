---
chapter_id: fe4ca9e46b6eb2f4
topic_id: 165
family: 03_directive_governance
cited_terms: ['pci_dss_requirement', 'attestation_signed_by', 'trace_supports_claim', 'requirement_equiv_specifies_target', 'control_only_addresses_threat_class']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Ontological Formalization of Compliance Artifacts

## 4.1 Scope and Preamble

This chapter delineates the formal ontological structures underpinning the governance framework, specifically focusing on the representation of PCI DSS requirements, attestation protocols, and evidentiary traceability within a regulated environment. It provides a rigorous examination of the axioms governing the relationships between directive classes, risk mitigation controls, and descriptive information content entities. The objective is to establish a schema that supports automated reasoning, high-fidelity audit trails, and the precise mapping of regulatory mandates to technical implementations. By grounding these concepts in the Common Core Ontologies (CCO) and the Basic Formal Ontology (BFO), this text ensures that compliance artifacts are interoperable across disparate governance, risk, and compliance (GRC) systems.

## 1. PCI DSS Requirement Classification

### 1.1 Conceptual Definition

In the context of the governance ontology, the classification of regulatory mandates is not merely a labeling exercise but a structural assertion of compliance obligations. Axiomatically, we define a specific class of artifacts that function as directives. The axiom `pci_dss_requirement` posits that for a given class `X` to be recognized as a valid compliance directive, it must be a subclass of `cco:DirectiveICE` (Information Content Entity) and must satisfy the condition of being a `pciDssRequirement` for some other class `Y`.

This relationship establishes a dependency where the existence of the directive `X` is intrinsically linked to the requirement specification `Y`. In formal terms, `X` is something that "pci dss requirement" `Y`. This structure allows the ontology to distinguish between generic directives and those specifically sanctioned under the Payment Card Industry Data Security Standard (PCI DSS). It ensures that any entity classified as `X` carries the weight of regulatory enforceability associated with the standard.

### 1.2 Relational Implementation

The projection of this axiom into a relational schema necessitates a table structure that captures the identity of the directive class (`X`) and its associated requirement class (`Y`). The primary key serves as the unique identifier for the axiom instance, while the foreign key constraint establishes a rigid link to the requirement specification table, ensuring referential integrity and preventing orphaned directives.

The following table illustrates instances of this axiom, mapping specific directive classes—such as firewall configuration or encryption protocols—to their corresponding PCI DSS requirement definitions.

**Table 1.1: PCI DSS Requirement Classifications**

| id | x | y |
| :--- | :--- | :--- |
| req_inst_01 | FirewallConfigurationDirective | req_spec_inst_01 |
| req_inst_02 | DataEncryptionStandard | req_spec_inst_02 |
| req_inst_03 | AntiMalwareProtocol | req_spec_inst_03 |
| req_inst_04 | LoggingMechanism | req_spec_inst_04 |
| req_inst_05 | AccessControlMeasure | req_spec_inst_05 |

*Table 1.1 embodies the `pci_dss_requirement` axiom, where `x` represents the directive class and `y` is the foreign key referencing the specific requirement specification. The primary key is `id`, and `y` must not be null, ensuring every directive maps to a valid requirement.*

## 2. Requirement Specification and Target Application

### 2.1 The Logic of Equivalence

While the previous section established the subclass relationship for directives, the axiom `requirement_equiv_specifies_target` provides a more granular definition through equivalence. Here, a class `X` is defined as being equivalent to the intersection of three conditions: it is a `cco:DirectiveICE`, it `specifies` some class `Y`, and it `appliesTo` some class `Z`.

This equivalence is critical for semantic reasoning. It asserts that `X` is not just *a kind of* directive, but that `X` is *fully defined by* its capacity to specify an action (`Y`) and apply to a target (`Z`). This eliminates ambiguity in compliance auditing; to verify the presence of `X`, one must demonstrate the specification of `Y` and its application to `Z`. This structure supports the decomposition of complex regulatory text into machine-readable logic.

### 2.2 Bidirectional Binding and Targeting

The relational schema for this axiom introduces a bidirectional binding with the `t_pci_dss_requirement` table. The `y` column in this table, representing the specification, references the `id` of the requirement table, while the requirement table simultaneously references this table via its own `y` column. This circular dependency enforces a strict coupling: a requirement cannot exist without its specification, and a specification cannot exist without the requirement it fulfills.

Furthermore, the `z` column introduces the target of the directive. This is the entity—whether a system component, data asset, or personnel role—to which the directive is operationally bound. This explicit targeting is essential for scope definition in audits, ensuring that controls are applied to the correct assets within the infrastructure.

**Table 2.1: Requirement Equivalences and Targets**

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| req_spec_inst_01 | FirewallConfigurationDirective | req_inst_01 | NetworkPerimeter |
| req_spec_inst_02 | DataEncryptionStandard | req_inst_02 | CardholderDataEnvironment |
| req_spec_inst_03 | AntiMalwareProtocol | req_inst_03 | EndpointSystem |
| req_spec_inst_04 | LoggingMechanism | req_inst_04 | AuditTrailServer |
| req_spec_inst_05 | AccessControlMeasure | req_inst_05 | AuthenticationDatabase |

*Table 2.1 represents the `requirement_equiv_specifies_target` axiom. The primary key is `id`. Column `y` is a foreign key referencing `t_pci_dss_requirement(id)`, creating the bidirectional link described in Section 2.2. Column `z` represents the target class to which the directive applies and is mandatory.*

## 3. Control Logic and Threat Addressal

### 3.1 Risk Mitigation Semantics

The implementation of security controls is governed by the axiom `control_only_addresses_threat_class`. This axiom formalizes the relationship between a control class `X` and the specific threat class `Y` that it addresses. The axiom asserts that `X` is a subclass of `cco:DirectiveICE` and that the `addressesRisk` property for `X` is restricted *only* to the class `Y`.

The use of the "only" restriction (`only`) in the Manchester syntax is semantically significant. It implies a closed-world assumption regarding the control's efficacy: if an instance of `X` addresses a risk, that risk *must* be an instance of `Y`. This prevents scope creep in control definitions and ensures that controls are not arbitrarily applied to threats for which they were not designed. In a compliance context, this precision is vital for validating control design effectiveness.

### 3.2 Mapping Controls to Requirements

In the relational projection, the threat class `Y` is mapped to the PCI DSS requirement ID. This design choice implies that the "threat class" is effectively defined or categorized by the requirement it is associated with. For instance, the threat of "unauthorized network access" may be categorized entirely under the requirement ID for firewall configuration.

The table below illustrates how specific control classes, such as an Intrusion Prevention System or a Cryptographic Module, are linked to the requirement IDs defined in previous sections. This linkage creates a traceable path from the high-level control implementation down to the specific regulatory requirement it mitigates.

**Table 3.1: Control and Threat Class Mappings**

| id | x | y |
| :--- | :--- | :--- |
| ctrl_inst_01 | IntrusionPreventionSystem | req_inst_01 |
| ctrl_inst_02 | CryptographicModule | req_inst_02 |
| ctrl_inst_03 | HeuristicAnalysisEngine | req_inst_03 |
| ctrl_inst_04 | SyslogAggregator | req_inst_04 |
| ctrl_inst_05 | RoleBasedAccessControl | req_inst_05 |

*Table 3.1 embodies the `control_only_addresses_threat_class` axiom. The primary key is `id`. Column `x` denotes the control class, and column `y` is a foreign key referencing `t_pci_dss_requirement(id)`, identifying the specific threat class (via the requirement) that the control addresses.*

## 4. Attestation and Signatory Authority

### 4.1 The Process of Attestation

Attestation represents the formalization of approval and the assumption of liability. The axiom `attestation_signed_by` defines a class `X` as a subclass of `bfo:0000015` (a Process) that involves the participation of a `cco:Person` via the `signedBy` property.

This axiom anchors the abstract concept of "signing" in the ontology of processes. It asserts that attestation is not a static document but a temporal process occurring between an information content entity (the attestation) and an agent (the person). This distinction is crucial for audit trails, as it separates the *record* of the attestation from the *act* of attesting. By classifying `X` as a process, the ontology can accommodate temporal reasoning, such as the start and end times of the signing event, or the sequence of signatories in a multi-level approval workflow.

### 4.2 Signatory Identification

The relational schema for this axiom is straightforward, reflecting the binary nature of the signing relationship. It captures the identity of the attestation process (`X`) and relies on the broader ontology to resolve the `cco:Person` entity. The table below lists specific attestation processes, such as the Annual Compliance Review or the Quarterly Risk Assessment, identifying them as distinct instances of the signing process.

**Table 4.1: Attestation Processes**

| id | x |
| :--- | :--- |
| att_inst_01 | AnnualComplianceAttestation |
| att_inst_02 | QuarterlyReviewSignOff |
| att_inst_03 | ThirdPartyAuditValidation |
| att_inst_04 | PolicyApprovalProcess |
| att_inst_05 | IncidentResponseAcknowledgement |

*Table 4.1 embodies the `attestation_signed_by` axiom. The primary key is `id`, and `x` represents the class of the attestation process. This table serves as a registry of formal approval events within the governance framework.*

## 5. Traceability of Descriptive Claims

### 5.1 Supporting Claims with Evidence

The final axiom, `trace_supports_claim`, addresses the evidentiary backbone of compliance. It defines a class `X` (a Trace) as a subclass of `bfo:0000015` (Process) that `supportsClaim` regarding some `cco:DescriptiveICE`. In practical terms, this axiom models the relationship between an audit trail or log entry (the trace) and the specific assertion or claim (the descriptive information) that it validates.

A "claim" in this context is a descriptive information content entity—for example, a statement that "all servers are patched." The "trace" is the process or artifact (e.g., the patch management report output) that provides evidence for that claim. By formalizing this relationship, the ontology enables automated validation of compliance posture: if a claim exists, the system can verify the existence of a supporting trace process.

### 5.2 Evidentiary Artifacts

The relational table for this axiom catalogs the traces available within the system. These traces are the operational evidence generated by security controls and IT processes. Linking these traces to claims allows auditors to verify that compliance assertions are grounded in verifiable data rather than self-reported assertions.

**Table 5.1: Traceability and Claim Support**

| id | x |
| :--- | :--- |
| trace_inst_01 | SystemConfigurationLog |
| trace_inst_02 | KeyManagementAuditTrail |
| trace_inst_03 | VulnerabilityScanReport |
| trace_inst_04 | UserProvisioningHistory |
| trace_inst_05 | PhysicalAccessLog |

*Table 5.1 embodies the `trace_supports_claim` axiom. The primary key is `id`, and `x` represents the class of the trace process. These rows correspond to the evidentiary artifacts that support descriptive claims made during an audit.*

```json
{
  "tables": [
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "req_inst_01",
          "FirewallConfigurationDirective",
          "req_spec_inst_01"
        ],
        [
          "req_inst_02",
          "DataEncryptionStandard",
          "req_spec_inst_02"
        ],
        [
          "req_inst_03",
          "AntiMalwareProtocol",
          "req_spec_inst_03"
        ],
        [
          "req_inst_04",
          "LoggingMechanism",
          "req_spec_inst_04"
        ],
        [
          "req_inst_05",
          "AccessControlMeasure",
          "req_spec_inst_05"
        ]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "req_spec_inst_01",
          "FirewallConfigurationDirective",
          "req_inst_01",
          "NetworkPerimeter"
        ],
        [
          "req_spec_inst_02",
          "DataEncryptionStandard",
          "req_inst_02",
          "CardholderDataEnvironment"
        ],
        [
          "req_spec_inst_03",
          "AntiMalwareProtocol",
          "req_inst_03",
          "EndpointSystem"
        ],
        [
          "req_spec_inst_04",
          "LoggingMechanism",
          "req_inst_04",
          "AuditTrailServer"
        ],
        [
          "req_spec_inst_05",
          "AccessControlMeasure",
          "req_inst_05",
          "AuthenticationDatabase"
        ]
      ]
    },
    {
      "name": "t_control_only_addresses_threat_class",
      "rows": [
        [
          "ctrl_inst_01",
          "IntrusionPreventionSystem",
          "req_inst_01"
        ],
        [
          "ctrl_inst_02",
          "CryptographicModule",
          "req_inst_02"
        ],
        [
          "ctrl_inst_03",
          "HeuristicAnalysisEngine",
          "req_inst_03"
        ],
        [
          "ctrl_inst_04",
          "SyslogAggregator",
          "req_inst_04"
        ],
        [
          "ctrl_inst_05",
          "RoleBasedAccessControl",
          "req_inst_05"
        ]
      ]
    },
    {
      "name": "t_attestation_signed_by",
      "rows": [
        [
          "att_inst_01",
          "AnnualComplianceAttestation"
        ],
        [
          "att_inst_02",
          "QuarterlyReviewSignOff"
        ],
        [
          "att_inst_03",
          "ThirdPartyAuditValidation"
        ],
        [
          "att_inst_04",
          "PolicyApprovalProcess"
        ],
        [
          "att_inst_05",
          "IncidentResponseAcknowledgement"
        ]
      ]
    },
    {
      "name": "t_trace_supports_claim",
      "rows": [
        [
          "trace_inst_01",
          "SystemConfigurationLog"
        ],
        [
          "trace_inst_02",
          "KeyManagementAuditTrail"
        ],
        [
          "trace_inst_03",
          "VulnerabilityScanReport"
        ],
        [
          "trace_inst_04",
          "UserProvisioningHistory"
        ],
        [
          "trace_inst_05",
          "PhysicalAccessLog"
        ]
      ]
    }
  ]
}
```