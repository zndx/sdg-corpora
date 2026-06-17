---
chapter_id: 43ae6bbcfe481a8b
topic_id: 4
family: 03_directive_governance
cited_terms: ['iso27001_clause_subclass', 'attestation_signed_by', 'iso27001_annexa_subclass', 'requirement_equiv_specifies_target', 'attestation_min_one_signer']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Governance Frameworks and ISO 27001 Compliance Mapping

## 4.1 Scope and Preamble

This chapter establishes the formal protocols for mapping organizational directives to the ISO/IEC 27001 information security standard. It defines the ontological structures required to bind internal governance artifacts—specifically Directives, Requirements, and Attestations—to the normative controls and clauses specified in the ISO 27001 framework. The content herein applies exclusively to compliance officers, internal auditors, and governance architects responsible for maintaining the alignment between the organization's procedural mandates (hereinafter referred to as "Directives") and the international standard for Information Security Management Systems (ISMS). Deviating from these mapping axioms may result in non-conformity findings during external certification audits. All data tables presented in this chapter are to be treated as the authoritative relational schema for the governance database, ensuring that every directive is traceable to a specific clause, annex control, or signatory authority.

## 4.2 ISO 27001 Clause Subclassifications

### 4.2.1 Concept Definition
In the context of the governance ontology, a Directive is not merely a standalone document; it must be formally classified as a subclass of the `cco:DirectiveICE` (Information Control Element). To ensure regulatory compliance, this Directive must be explicitly linked to a specific clause within the ISO 27001 standard. This relationship is axiomatized by the assertion that a Class X (the Directive) is a subclass of `cco:DirectiveICE` and holds a specific relationship to an ISO 27001 Clause Y. This linkage ensures that every internal policy has a valid, auditable lineage to the standard's requirements.

### 4.2.2 Implementation and Evidence
When defining a new security policy, the governance team must identify the primary ISO 27001 clause that necessitates the policy's existence. For instance, an "Access Control Policy" is not a generic administrative document; it is a Directive that satisfies the requirements of ISO 27001 Clause 9 (Access Control). By formalizing this relationship, the organization creates a defensible audit trail. The following table illustrates this mapping, where the `y` column references the specific requirement identifier that defines the clause context.

**Table 4.1: ISO 27001 Clause Subclass Mapping**
This table embodies the axiom that a Directive (x) is a subclass of `cco:DirectiveICE` and is defined by its adherence to an ISO 27001 Clause (y). The primary key is the unique directive ID, while the foreign key (`y`) establishes a dependency on the requirement equivalence table defined in Section 4.5.

| id | x | y |
| :--- | :--- | :--- |
| dir_access_control_01 | AccessControlPolicy | req_iso_9_4 |
| dir_infosec_policy_01 | InformationSecurityPolicy | req_iso_5_1 |
| dir_asset_mgmt_01 | AssetManagementProcedure | req_iso_8_1 |
| dir_hr_security_01 | HumanResourceSecurity | req_iso_7_1 |
| dir_supplier_rel_01 | SupplierRelationshipPolicy | req_iso_8_1 |

### 4.2.3 Audit Verification
During an audit, the assessor will verify that for every entry in Table 4.1, the corresponding Directive document (`x`) contains language explicitly addressing the clause referenced by `y`. Failure to maintain this linkage constitutes a break in the chain of evidence and may be flagged as a deficiency in the ISMS's governance structure.

## 4.3 Requirement Equivalence and Target Specification

### 4.3.1 Concept Definition
The core of the compliance framework rests on the definition of a "Requirement." In this ontology, a Requirement is not a simple string of text but a complex equivalence class. A Requirement (Class X) is defined as being equivalent to a `cco:DirectiveICE` that *specifies* a particular Clause (Class Y) and *applies to* a specific Target (Class Z). This tripartite definition ensures that requirements are not abstract wishes but concrete mandates that specify a control clause and target a specific operational domain (e.g., "Server Infrastructure," "Personnel Records," or "Customer Database").

### 4.3.2 The Circular Dependency of Clauses and Requirements
It is critical to note the structural interdependence between the Clause Subclassifications (Section 4.2) and the Requirement Equivalence. The Clause Subclass table references the Requirement ID to establish context, while the Requirement table references the Clause Subclass ID to define the specification. This circular reference is intentional and mirrors the recursive nature of compliance: a Clause defines a Requirement, and a Requirement instantiates a Clause.

**Table 4.2: Requirement Equivalence Specification**
This table embodies the axiom that a Requirement (x) is equivalent to a Directive that specifies a Clause (y) and applies to a Target (z). The primary key is the requirement ID. The foreign key (`y`) references the `t_iso27001_clause_subclass` table, creating the necessary bidirectional traceability between the abstract clause and the concrete requirement.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| req_iso_9_4 | RequirementAccessControlUnlogged | dir_access_control_01 | LogicalAccessSystem |
| req_iso_5_1 | RequirementMgmtCommitment | dir_infosec_policy_01 | ExecutiveManagement |
| req_iso_8_1 | AssetInventoryRequirement | dir_asset_mgmt_01 | InformationAsset |
| req_iso_7_1 | RequirementScreeningProcess | dir_hr_security_01 | CandidatePersonnel |
| req_iso_8_1 | SupplierAgreementRequirement | dir_supplier_rel_01 | ThirdPartyVendor |

### 4.3.3 Target Application
The `z` column (Target) is essential for scope definition. It restricts the application of the Directive. For example, the "Access Control Policy" might apply generally, but the specific *Requirement* derived from Clause 9.4 might apply strictly to "LogicalAccessSystem" targets. This granularity allows the organization to enforce different controls on different assets (e.g., Z="ProductionDatabase" vs. Z="PublicWebServer") while referencing the same overarching Directive.

## 4.4 ISO 27001 Annex A Subclassifications

### 4.4.1 Concept Definition
While the clauses of ISO 27001 provide the high-level requirements, Annex A provides the detailed control objectives and controls. The ontology distinguishes between general Clause mappings and specific Annex A control mappings. A Directive (Class X) may be a subclass of `cco:DirectiveICE` specifically designed to implement an ISO 27001 Annex A control (Class Y). This distinction is vital for organizations seeking certification against the extensive controls listed in Annex A, such as cryptography, physical security, or operations security.

### 4.4.2 Control Implementation
Directives mapped to Annex A controls are typically more technical or procedural than those mapped to high-level clauses. For example, a Directive regarding "Cryptography Key Management" directly implements Annex A control A.10.1.1. The following table maps these Directives to their corresponding Requirement IDs, which in turn define the specific context of the control.

**Table 4.3: ISO 27001 Annex A Subclass Mapping**
This table embodies the axiom that a Directive (x) is a subclass of `cco:DirectiveICE` and implements an ISO 27001 Annex A control (y). The primary key is the directive ID. The foreign key (`y`) references the requirement equivalence table, linking the specific Annex A control to a broader requirement definition.

| id | x | y |
| :--- | :--- | :--- |
| dir_crypto_01 | CryptographicKeyManagementDirective | req_annex_a_10_1 |
| dir_physical_01 | PhysicalEntryControlDirective | req_annex_a_11_1 |
| dir_ops_sec_01 | MalwareProtectionDirective | req_annex_a_12_2 |
| dir_comms_01 | NetworkSecurityManagementDirective | req_annex_a_13_1 |
| dir_acquis_01 | SecureDevelopmentLifecycleDirective | req_annex_a_14_2 |

### 4.4.3 Compliance Verification
To verify compliance against Table 4.3, auditors will examine the Directive (`x`) and look for evidence that the specific Annex A control (`y`) is operational. For instance, for `dir_crypto_01`, the auditor would request key rotation logs and encryption standards documentation to validate the implementation of control A.10.1.

## 4.5 Attestation and Signatory Authority

### 4.5.1 Concept Definition
Governance frameworks are ineffective without accountability. The ontology defines "Attestation" as a specific type of Process (`bfo:0000015`) that must be signed by a Person (`cco:Person`). This axiom transforms a Directive from a static document into an active process of verification. An Attestation (Class X) is a process that is "signed by" a person. This ensures that a responsible individual has reviewed and validated the state of compliance or the implementation of a control.

### 4.5.2 The Attestation Process
Attestations serve as the "human-in-the-loop" verification mechanism. They are distinct from automated system logs. An Attestation represents a conscious affirmation by an authorized role (e.g., CISO, Data Owner, System Administrator) that a Directive is being followed. The following table lists the classes of attestations required within the framework.

**Table 4.4: Attestation Signed By Mapping**
This table embodies the axiom that an Attestation (x) is a Process that is signed by a Person. The primary key is the attestation ID. This table does not require a foreign key in this schema view but serves as a registry of attestable events requiring human sign-off.

| id | x |
| :--- | :--- |
| att_annual_review | AnnualSecurityReviewAttestation |
| att_access_cert | AccessRightsCertificationAttestation |
| att_policy_ack | PolicyAcknowledgmentAttestation |
| att_risk_accept | RiskAcceptanceAttestation |
| att_vendor_audit | ThirdPartyAuditAttestation |

### 4.5.3 Signatory Validation
For each entry in Table 4.4, the system must capture the digital signature or manual sign-off of a `cco:Person`. The ontology implies that without this signatory link, the Attestation process is incomplete. For example, the `att_risk_accept` process is invalid unless signed by a designated Risk Officer with the authority to accept risk on behalf of the organization.

## 4.6 Attestation Cardinality Constraints

### 4.6.1 Concept Definition
To prevent orphaned attestations or unsigned compliance artifacts, the ontology imposes a cardinality constraint on the Attestation process. An Attestation (Class X) is defined as a Process (`bfo:0000015`) that must have a minimum of one (`min 1`) signer (`cco:Person`). This axiom enforces the business rule that an attestation cannot exist in a valid state without at least one authorized signatory. It eliminates the possibility of "empty" attestations where a process is marked as complete without accountability.

### 4.6.2 Enforcement Mechanism
This constraint is typically enforced at the application layer or database trigger level. When a record corresponding to an Attestation class is created, the system mandates the association of a User ID corresponding to a `cco:Person`. If an attempt is made to close an Attestation task without assigning a signer, the system must raise a constraint violation error.

**Table 4.5: Attestation Minimum One Signer Constraints**
This table embodies the axiom that an Attestation (x) is a Process requiring a minimum of one signatory. The primary key is the constraint ID. This table acts as a validation rule registry for the governance engine.

| id | x |
| :--- | :--- |
| const_001 | AnnualSecurityReviewAttestation |
| const_002 | AccessRightsCertificationAttestation |
| const_003 | PolicyAcknowledgmentAttestation |
| const_004 | RiskAcceptanceAttestation |
| const_005 | ThirdPartyAuditAttestation |

### 4.6.3 Implications for Audit Trails
The data in Table 4.5 ensures that the audit trail is continuous and verifiable. By mandating `min 1` signers, the organization guarantees that for every compliance event, there is a specific individual accountable. This is crucial for forensic investigations and regulatory inquiries, as it allows investigators to trace the "who" behind every "what" in the compliance history.

```json
{
  "tables": [
    {
      "name": "t_iso27001_clause_subclass",
      "rows": [
        [
          "dir_access_control_01",
          "AccessControlPolicy",
          "req_iso_9_4"
        ],
        [
          "dir_infosec_policy_01",
          "InformationSecurityPolicy",
          "req_iso_5_1"
        ],
        [
          "dir_asset_mgmt_01",
          "AssetManagementProcedure",
          "req_iso_8_1"
        ],
        [
          "dir_hr_security_01",
          "HumanResourceSecurity",
          "req_iso_7_1"
        ],
        [
          "dir_supplier_rel_01",
          "SupplierRelationshipPolicy",
          "req_iso_8_1"
        ]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "req_iso_9_4",
          "RequirementAccessControlUnlogged",
          "dir_access_control_01",
          "LogicalAccessSystem"
        ],
        [
          "req_iso_5_1",
          "RequirementMgmtCommitment",
          "dir_infosec_policy_01",
          "ExecutiveManagement"
        ],
        [
          "req_iso_8_1",
          "AssetInventoryRequirement",
          "dir_asset_mgmt_01",
          "InformationAsset"
        ],
        [
          "req_iso_7_1",
          "RequirementScreeningProcess",
          "dir_hr_security_01",
          "CandidatePersonnel"
        ],
        [
          "req_iso_8_1",
          "SupplierAgreementRequirement",
          "dir_supplier_rel_01",
          "ThirdPartyVendor"
        ]
      ]
    },
    {
      "name": "t_iso27001_annexa_subclass",
      "rows": [
        [
          "dir_crypto_01",
          "CryptographicKeyManagementDirective",
          "req_annex_a_10_1"
        ],
        [
          "dir_physical_01",
          "PhysicalEntryControlDirective",
          "req_annex_a_11_1"
        ],
        [
          "dir_ops_sec_01",
          "MalwareProtectionDirective",
          "req_annex_a_12_2"
        ],
        [
          "dir_comms_01",
          "NetworkSecurityManagementDirective",
          "req_annex_a_13_1"
        ],
        [
          "dir_acquis_01",
          "SecureDevelopmentLifecycleDirective",
          "req_annex_a_14_2"
        ]
      ]
    },
    {
      "name": "t_attestation_signed_by",
      "rows": [
        [
          "att_annual_review",
          "AnnualSecurityReviewAttestation"
        ],
        [
          "att_access_cert",
          "AccessRightsCertificationAttestation"
        ],
        [
          "att_policy_ack",
          "PolicyAcknowledgmentAttestation"
        ],
        [
          "att_risk_accept",
          "RiskAcceptanceAttestation"
        ],
        [
          "att_vendor_audit",
          "ThirdPartyAuditAttestation"
        ]
      ]
    },
    {
      "name": "t_attestation_min_one_signer",
      "rows": [
        [
          "const_001",
          "AnnualSecurityReviewAttestation"
        ],
        [
          "const_002",
          "AccessRightsCertificationAttestation"
        ],
        [
          "const_003",
          "PolicyAcknowledgmentAttestation"
        ],
        [
          "const_004",
          "RiskAcceptanceAttestation"
        ],
        [
          "const_005",
          "ThirdPartyAuditAttestation"
        ]
      ]
    }
  ]
}
```