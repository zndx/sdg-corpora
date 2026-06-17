---
chapter_id: 1ce7aab16d829aab
topic_id: 144
family: 03_directive_governance
cited_terms: ['audit_conducted_by', 'iso27001_annexa_subclass', 'attestation_with_supporting_evidence', 'attestation_at_period', 'requirement_equiv_specifies_target']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Governance Frameworks and ISO 27001 Annex A Compliance

## 4.1 Scope and Applicability

This chapter establishes the formal ontological mapping required to govern information security management systems (ISMS) within the enterprise. It defines the structural relationships between internal audit processes, regulatory directives, and the specific control objectives enumerated in ISO/IEC 27001:2022 Annex A. The definitions herein are binding for all compliance reporting, internal audit cycles, and third-party attestations. Where conflicts arise between legacy procedural documents and the axioms defined in this chapter, the latter shall take precedence due to their alignment with the BFO (Basic Formal Ontology) upper-level ontology.

## 4.2 Audit Conducted By

### 4.2.1 Conceptual Definition

In the context of governance, an audit is not merely a checklist but a temporal process (`bfo:Process`) that necessitates agency. The axiom `audit_conducted_by` posits that for any audit event to be valid and verifiable, it must be attributable to a specific natural person. This ensures non-repudiation and assigns accountability for the rigor and integrity of the audit execution. The ontology distinguishes between the *process* of auditing and the *agent* performing it, preventing the anthropomorphization of software tools or automated scripts as auditors.

### 4.2.2 Implementation and Provenance

When an audit is instantiated within the governance framework, the system must record the unique identifier of the process and link it to the personnel record of the individual conducting the review. This linkage is critical for maintaining the chain of custody for compliance evidence. For instance, the "Annual Security Review 2023" is a process instance; it is distinct from the "Senior Auditor," who is the person executing it. The table below illustrates the instantiation of this axiom, mapping specific audit process identifiers to their executed entities.

**Table 4.1: Audit Process and Agent Mapping**

| id | x |
| :--- | :--- |
| AUD-2023-Q3 | Q3AccessControlAudit |
| AUD-2023-04 | PenetrationTestExecution |
| AUD-2023-05 | PhysicalSecurityReview |
| AUD-2023-06 | DataPrivacyImpactAssessment |
| AUD-2023-07 | VendorRiskAssessment |

*Table 4.1 represents the `t_audit_conducted_by` relation, where `x` denotes the specific audit process instance. The primary key `id` serves as the immutable reference for the audit record.*

## 4.3 ISO 27001 Annex A Subclass

### 4.3.1 Conceptual Definition

The organization's internal governance architecture relies on `cco:DirectiveICE` (Internal Compliance Entity) objects to operationalize abstract standards. The axiom `iso27001_annexa_subclass` formalizes the relationship between these internal directives and the external control sets defined in ISO/IEC 27001 Annex A. Specifically, a Directive `X` is defined as a subclass of the broader compliance framework, satisfying the condition `sdg:iso27001AnnexA some {Y}`.

This relationship ensures that every internal policy or procedure is traceable to a specific control objective (e.g., A.9.4.1 or A.8.2.1). The structure is recursive in nature; the Directive inherits the obligations of the Annex A control while adding specific organizational context. The relational schema enforces this by requiring that the Annex A reference (`y`) corresponds to a valid requirement definition, creating a closed loop of verification.

### 4.3.2 Directive Mapping and Traceability

To maintain compliance maturity, the governance office must map every internal directive to its corresponding Annex A control. This mapping allows for automated gap analysis and reporting. The following table details the mapping of internal directives to their respective ISO 27001 Annex A anchors. Note that the `y` column references the specific requirement identifier, which serves as the bridge between the internal directive and the external standard.

**Table 4.2: Directive to Annex A Control Mapping**

| id | x | y |
| :--- | :--- | :--- |
| DIR-SEC-001 | IdentityManagementPolicy | REQ-ISO-9.4.1 |
| DIR-SEC-002 | CryptographyStandard | REQ-ISO-8.2.1 |
| DIR-SEC-003 | PhysicalAccessProtocol | REQ-ISO-7.2.1 |
| DIR-SEC-004 | MalwareProtectionDirective | REQ-ISO-8.7.1 |
| DIR-SEC-005 | SupplierSecurityPolicy | REQ-ISO-5.1.1 |

*Table 4.2 represents the `t_iso27001_annexa_subclass` relation. The `x` column denotes the internal Directive, while `y` is the foreign key referencing the requirement definition (see Section 4.6).*

## 4.4 Attestation with Supporting Evidence

### 4.4.1 Conceptual Definition

Attestation is the formal affirmation that a control is operating as intended. However, an attestation without evidence is merely a claim. The axiom `attestation_with_supporting_evidence` establishes that an attestation process (`X`) must be substantiated by supporting evidence (`Y`). This evidence typically consists of logs, screenshots, configuration exports, or signed memoranda that demonstrate the effective implementation of the control defined in the Directive.

This axiom is pivotal during external audits. When an auditor queries the status of a control, the system must retrieve not only the attestation (the "yes" or "no" status) but also the evidentiary artifacts (`Y`) that justify that status. The ontology links the attestation process back to the Directive/Annex A control, ensuring that the evidence is relevant to the specific control being tested.

### 4.4.2 Evidence Linkage and Verification

The integrity of the compliance framework depends on the robustness of the evidence linked to attestations. The following table demonstrates how specific attestation processes are anchored to the directives they validate. The foreign key structure ensures that evidence is only accepted if it pertains to a valid, mapped directive.

**Table 4.3: Attestation and Evidence Linkage**

| id | x | y |
| :--- | :--- | :--- |
| ATT-EV-101 | Q3AccessControlReview | DIR-SEC-001 |
| ATT-EV-102 | TLSConfigurationAudit | DIR-SEC-002 |
| ATT-EV-103 | DataCenterLogReview | DIR-SEC-003 |
| ATT-EV-104 | EndpointProtectionScan | DIR-SEC-004 |
| ATT-EV-105 | ThirdPartyRiskAssessment | DIR-SEC-005 |

*Table 4.3 represents the `t_attestation_with_supporting_evidence` relation. Column `x` identifies the attestation process, while `y` references the Directive ID (`t_iso27001_annexa_subclass`), thereby linking the evidence to the specific ISO control.*

## 4.5 Attestation at Period

### 4.5.1 Conceptual Definition

Compliance is not a static state but a temporal condition. A control validated today may be invalid tomorrow. The axiom `attestation_at_period` introduces the dimension of time to the attestation process. It asserts that an attestation (`X`) is valid only within a specific attestation period (`Y`). This temporal indexing is essential for continuous monitoring and for defining the "look-back" periods required for certification audits.

In this ontology, the period (`Y`) is modeled as a class that references the specific control context. This implies that attestation periods are defined relative to the control's operational cycle. For example, an access control review might occur quarterly, while a physical security review might occur bi-annually. The schema enforces that the period is defined within the context of the applicable directive.

### 4.5.2 Temporal Validity Framework

The following table outlines the attestation periods associated with various governance processes. By linking the period (`y`) to the directive, the framework ensures that the frequency of testing is aligned with the risk profile of the underlying control.

**Table 4.4: Attestation Periods by Control**

| id | x | y |
| :--- | :--- | :--- |
| ATT-PD-201 | FY23_Q4_Attestation | DIR-SEC-001 |
| ATT-PD-202 | FY23_Q4_Attestation | DIR-SEC-002 |
| ATT-PD-203 | FY23_H2_Attestation | DIR-SEC-003 |
| ATT-PD-204 | FY23_Q4_Attestation | DIR-SEC-004 |
| ATT-PD-205 | FY23_Q1_Attestation | DIR-SEC-005 |

*Table 4.4 represents the `t_attestation_at_period` relation. The `y` column links the attestation instance to the Directive, anchoring the temporal validity to the specific control context.*

## 4.6 Requirement Equivalence

### 4.6.1 Conceptual Definition

The `requirement_equiv_specifies_target` axiom serves as the definitional core of the governance ontology. It asserts that a Requirement (`X`) is equivalent to the intersection of three conditions: it is a `cco:DirectiveICE`, it specifies a particular control (`Y`), and it applies to a specific target (`Z`). This axiom creates a "Requirement Class" that is semantically rich and computable.

This structure allows the organization to define requirements that are granular. For example, a Requirement is not just "Encryption," but "Encryption (`X`) that specifies AES-256 (`Y`) and applies to Customer Data (`Z`)." The relational schema captures this by linking the Requirement back to the Directive (via `y`) and defining the target (`z`). The circular reference between the Requirement table and the Directive table (where the Directive points to the Requirement and the Requirement points to the Directive) creates a mutually reinforcing definition that prevents orphaned controls or undefined requirements.

### 4.6.2 Target Specification and Equivalence

The table below details the formal definition of requirements within the system. It illustrates how the requirement entity bridges the internal directive, the specific ISO control objective, and the organizational target (asset, system, or process) to which the control applies.

**Table 4.5: Requirement Specification and Targeting**

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| REQ-ISO-9.4.1 | ISOAnnexA9_4_1_Req | DIR-SEC-001 | ActiveDirectory |
| REQ-ISO-8.2.1 | ISOAnnexA8_2_1_Req | DIR-SEC-002 | CustomerDatabase |
| REQ-ISO-7.2.1 | ISOAnnexA7_2_1_Req | DIR-SEC-003 | ServerRoom_Zone1 |
| REQ-ISO-8.7.1 | ISOAnnexA8_7_1_Req | DIR-SEC-004 | Endpoints_Windows10 |
| REQ-ISO-5.1.1 | ISOAnnexA5_1_1_Req | DIR-SEC-005 | CriticalSuppliers |

*Table 4.5 represents the `t_requirement_equiv_specifies_target` relation. Column `x` is the Requirement Class; `y` references the Directive (creating the equivalence loop); and `z` defines the specific target of the control.*

```json
{
  "tables": [
    {
      "name": "t_audit_conducted_by",
      "rows": [
        [
          "AUD-2023-Q3",
          "Q3AccessControlAudit"
        ],
        [
          "AUD-2023-04",
          "PenetrationTestExecution"
        ],
        [
          "AUD-2023-05",
          "PhysicalSecurityReview"
        ],
        [
          "AUD-2023-06",
          "DataPrivacyImpactAssessment"
        ],
        [
          "AUD-2023-07",
          "VendorRiskAssessment"
        ]
      ]
    },
    {
      "name": "t_iso27001_annexa_subclass",
      "rows": [
        [
          "DIR-SEC-001",
          "IdentityManagementPolicy",
          "REQ-ISO-9.4.1"
        ],
        [
          "DIR-SEC-002",
          "CryptographyStandard",
          "REQ-ISO-8.2.1"
        ],
        [
          "DIR-SEC-003",
          "PhysicalAccessProtocol",
          "REQ-ISO-7.2.1"
        ],
        [
          "DIR-SEC-004",
          "MalwareProtectionDirective",
          "REQ-ISO-8.7.1"
        ],
        [
          "DIR-SEC-005",
          "SupplierSecurityPolicy",
          "REQ-ISO-5.1.1"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "ATT-EV-101",
          "Q3AccessControlReview",
          "DIR-SEC-001"
        ],
        [
          "ATT-EV-102",
          "TLSConfigurationAudit",
          "DIR-SEC-002"
        ],
        [
          "ATT-EV-103",
          "DataCenterLogReview",
          "DIR-SEC-003"
        ],
        [
          "ATT-EV-104",
          "EndpointProtectionScan",
          "DIR-SEC-004"
        ],
        [
          "ATT-EV-105",
          "ThirdPartyRiskAssessment",
          "DIR-SEC-005"
        ]
      ]
    },
    {
      "name": "t_attestation_at_period",
      "rows": [
        [
          "ATT-PD-201",
          "FY23_Q4_Attestation",
          "DIR-SEC-001"
        ],
        [
          "ATT-PD-202",
          "FY23_Q4_Attestation",
          "DIR-SEC-002"
        ],
        [
          "ATT-PD-203",
          "FY23_H2_Attestation",
          "DIR-SEC-003"
        ],
        [
          "ATT-PD-204",
          "FY23_Q4_Attestation",
          "DIR-SEC-004"
        ],
        [
          "ATT-PD-205",
          "FY23_Q1_Attestation",
          "DIR-SEC-005"
        ]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "REQ-ISO-9.4.1",
          "ISOAnnexA9_4_1_Req",
          "DIR-SEC-001",
          "ActiveDirectory"
        ],
        [
          "REQ-ISO-8.2.1",
          "ISOAnnexA8_2_1_Req",
          "DIR-SEC-002",
          "CustomerDatabase"
        ],
        [
          "REQ-ISO-7.2.1",
          "ISOAnnexA7_2_1_Req",
          "DIR-SEC-003",
          "ServerRoom_Zone1"
        ],
        [
          "REQ-ISO-8.7.1",
          "ISOAnnexA8_7_1_Req",
          "DIR-SEC-004",
          "Endpoints_Windows10"
        ],
        [
          "REQ-ISO-5.1.1",
          "ISOAnnexA5_1_1_Req",
          "DIR-SEC-005",
          "CriticalSuppliers"
        ]
      ]
    }
  ]
}
```