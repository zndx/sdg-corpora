---
chapter_id: ffad6e6daf5d6668
topic_id: 3
family: 03_directive_governance
cited_terms: ['gdpr_lawful_basis', 'attestation_with_supporting_evidence', 'audit_for_period', 'control_with_evidence_requirement', 'audit_subclass']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Ontological Structures for Compliance Governance

## 7.1 Scope and Preamble

This chapter delineates the formal ontological structures required to establish a rigorous governance framework for data protection and regulatory compliance. It provides a systematic analysis of the axioms governing lawful bases, evidence requirements, and audit protocols. The content is intended for systems architects, compliance officers, and data governance professionals who must implement these concepts within relational database environments or semantic web architectures. The definitions herein are derived from the OWL ontology axioms specified in the governing standards and are translated into deterministic relational schemas to ensure data integrity and auditability.

## 7.2 GDPR Lawful Basis

### 7.2.1 Conceptual Definition
In the context of information compliance, a Lawful Basis is not merely a regulatory checkbox but a foundational ontological class that anchors all processing activities. Axiomatically, we define a Lawful Basis as a specific class of entity that validates the processing of Directive Information Content Entities (DICE). The relationship between a processing directive and its lawful basis is governed by the axiom `gdpr_lawful_basis`, which asserts that any processing activity (Class X) must be subclassified as a `cco:DirectiveICE` and must possess a `sdg:hasLawfulBasis` relationship to a valid basis (Class Y).

This structure ensures that no processing directive exists in a vacuum; it must be explicitly linked to a legal justification, such as Contract, Legal Obligation, or Consent. In a relational implementation, this necessitates a foreign key constraint where the lawful basis identifier references the control that substantiates it, creating a bi-directional verification loop.

### 7.2.2 Relational Implementation
The table `t_gdpr_lawful_basis` serves as the registry for these mappings. The primary key (`id`) uniquely identifies the specific instance of the lawful basis assertion. The column `x` represents the processing directive class, while `y` represents the lawful basis class itself. Critically, the schema enforces that `y` must reference an existing identifier in the control evidence table (`t_control_with_evidence_requirement`), ensuring that every claimed legal basis is backed by a defined control mechanism.

**Table 7-1: GDPR Lawful Basis Mapping**

| id | x | y |
| :--- | :--- | :--- |
| basis_proc_001 | CustomerDataIngestion | ctrl_contract_001 |
| basis_proc_002 | EmployeeMonitoringDirective | ctrl_leg_interest_001 |
| basis_proc_003 | MarketingAnalyticsProcess | ctrl_consent_001 |
| basis_proc_004 | FraudDetectionProtocol | ctrl_leg_oblig_001 |
| basis_proc_005 | VendorDataSharingDirective | ctrl_contract_002 |

## 7.3 Control with Evidence Requirement

### 7.3.1 Conceptual Definition
While a lawful basis provides the legal grounding for processing, the Control with Evidence Requirement defines the operational mechanism that enforces compliance. According to the axiom `control_with_evidence_requirement`, a control (Class X) is a subclass of `cco:DirectiveICE` that `sdg:requiresEvidence` of a specific type (Class Y). This axiom shifts the focus from legal permissibility to technical and procedural enforceability.

In practice, this means that a control is not a passive guideline but an active directive that mandates the generation and retention of specific evidence artifacts. For instance, a control titled "Consent Capture" requires evidence in the form of "Consent Logs." The ontological structure here binds the control to the evidence it must produce, thereby facilitating automated audit trails. The evidence requirement (Y) acts as the standard against which the control's efficacy is measured during an audit.

### 7.3.2 Relational Implementation
The table `t_control_with_evidence_requirement` encodes these definitions. The column `x` holds the identifier of the control directive, and `y` holds the identifier of the evidence class required. The schema includes a foreign key constraint linking `y` back to the `t_gdpr_lawful_basis` table. This circular dependency (where the lawful basis table references the control table, and the control table references the lawful basis table) is intentional, reflecting the real-world dependency loop where a legal basis is implemented by a control, and that control validates the legal basis through evidence.

**Table 7-2: Control Evidence Requirements**

| id | x | y |
| :--- | :--- | :--- |
| ctrl_contract_001 | ServiceContractValidation | basis_proc_001 |
| ctrl_leg_interest_001 | LegitimateInterestAssessment | basis_proc_002 |
| ctrl_consent_001 | DigitalConsentCapture | basis_proc_003 |
| ctrl_leg_oblig_001 | StatutoryReportingMechanism | basis_proc_004 |
| ctrl_contract_002 | DataProcessingAgreementCheck | basis_proc_005 |

## 7.4 Attestation with Supporting Evidence

### 7.4.1 Conceptual Definition
Attestation is the formal process by which an entity asserts that a specific set of controls or processing activities has been executed correctly. The axiom `attestation_with_supporting_evidence` posits that an attestation process (Class X), which is a subclass of `bfo:0000015` (a Process), must be accompanied by `sdg:withSupportingEvidence` (Class Y). This distinguishes a self-declaration from a substantiated claim.

In the governance framework, an attestation is only valid if it points to specific evidence artifacts generated by the controls described in the previous section. For example, an attestation of "Quarterly Compliance Review" is invalid without supporting evidence such as "Consent Logs" or "Contract Records." This axiom enforces the principle of "evidence-based compliance," ensuring that audit trails are continuous and verifiable.

### 7.4.2 Relational Implementation
The `t_attestation_with_supporting_evidence` table records these assertions. The column `x` identifies the specific attestation process instance, while `y` identifies the lawful basis or evidence record that supports it. The foreign key constraint ensures that the supporting evidence (`y`) corresponds to a valid entry in the `t_gdpr_lawful_basis` table, thereby anchoring the attestation to the foundational legal justification.

**Table 7-3: Attestation Records and Evidence**

| id | x | y |
| :--- | :--- | :--- |
| attest_q1_2024 | Q1_Compliance_Attestation | basis_proc_001 |
| attest_emp_mon_2024 | Annual_Monitoring_Attestation | basis_proc_002 |
| attest_mktg_analytics | Marketing_Consent_Attestation | basis_proc_003 |
| attest_fraud_detect | Fraud_Control_Attestation | basis_proc_004 |
| attest_vendor_sharing | Third_Party_Risk_Attestation | basis_proc_005 |

## 7.5 Audit for Period

### 7.5.1 Conceptual Definition
Auditing is a time-bound activity that verifies the state of compliance over a specific duration. The axiom `audit_for_period` defines an audit process (Class X), also a subclass of `bfo:0000015`, that is conducted `sdg:forAuditPeriod` (Class Y). This concept introduces the temporal dimension into the ontology, ensuring that compliance is not viewed as a static state but as a continuous performance over time.

The "Audit Period" (Y) is not merely a date range but is ontologically linked to the lawful basis being audited. This linkage ensures that the scope of the audit is strictly defined by the legal frameworks in effect during that period. For instance, auditing the "Legitimate Interest" basis requires a specific temporal scope where that basis was applicable and active. This structure allows for granular historical analysis and trend reporting in compliance metrics.

### 7.5.2 Relational Implementation
The table `t_audit_for_period` manages the scheduling and scoping of these audits. The column `x` represents the audit process instance, and `y` represents the audit period identifier, which is linked to the lawful basis table. This constraint ensures that audits are only scheduled for periods where a valid lawful basis definition exists, preventing "orphan" audits that lack legal context.

**Table 7-4: Audit Period Definitions**

| id | x | y |
| :--- | :--- | :--- |
| audit_period_h1_23 | H1_2023_Compliance_Audit | basis_proc_001 |
| audit_period_q3_23 | Q3_2023_Monitoring_Audit | basis_proc_002 |
| audit_period_q4_23 | Q4_2023_Consent_Audit | basis_proc_003 |
| audit_period_annual | FY2023_Annual_Audit | basis_proc_004 |
| audit_period_adhoc | Adhoc_Vendor_Audit | basis_proc_005 |

## 7.6 Audit Subclass

### 7.6.1 Conceptual Definition
The final structural component involves the classification of the audit processes themselves. The axiom `audit_subclass` specifies that an audit class (X) is a subclass of `bfo:0000015` (Process) that `sdg:auditsControl` some `cco:DirectiveICE`. This axiom provides the taxonomic structure for different types of audits (e.g., Internal Audit, External Audit, Forensic Audit) and defines their object: the control directives.

By defining audits as subclasses that specifically target controls, the ontology creates a clear chain of custody: The Audit targets the Control, the Control requires Evidence, and the Evidence supports the Lawful Basis. This hierarchical classification ensures that audit resources are correctly mapped to the controls they are designed to verify, facilitating automated audit planning and resource allocation.

### 7.6.2 Relational Implementation
The `t_audit_subclass` table provides a lookup registry for these audit types. It is a simpler structure than the previous tables, consisting of an identifier (`id`) and the class name of the audit (`x`). This table supports the categorization of audit records without requiring direct foreign key links to other tables in this specific schema, serving as a controlled vocabulary for the `x` values used in other process-related tables.

**Table 7-5: Audit Subclass Registry**

| id | x |
| :--- | :--- |
| audit_type_01 | InternalSystemAudit |
| audit_type_02 | ExternalComplianceAudit |
| audit_type_03 | ForensicDataAudit |
| audit_type_04 | ProcessGapAnalysis |
| audit_type_05 | ThirdPartyAssuranceAudit |

```json
{
  "tables": [
    {
      "name": "t_gdpr_lawful_basis",
      "rows": [
        [
          "basis_proc_001",
          "CustomerDataIngestion",
          "ctrl_contract_001"
        ],
        [
          "basis_proc_002",
          "EmployeeMonitoringDirective",
          "ctrl_leg_interest_001"
        ],
        [
          "basis_proc_003",
          "MarketingAnalyticsProcess",
          "ctrl_consent_001"
        ],
        [
          "basis_proc_004",
          "FraudDetectionProtocol",
          "ctrl_leg_oblig_001"
        ],
        [
          "basis_proc_005",
          "VendorDataSharingDirective",
          "ctrl_contract_002"
        ]
      ]
    },
    {
      "name": "t_control_with_evidence_requirement",
      "rows": [
        [
          "ctrl_contract_001",
          "ServiceContractValidation",
          "basis_proc_001"
        ],
        [
          "ctrl_leg_interest_001",
          "LegitimateInterestAssessment",
          "basis_proc_002"
        ],
        [
          "ctrl_consent_001",
          "DigitalConsentCapture",
          "basis_proc_003"
        ],
        [
          "ctrl_leg_oblig_001",
          "StatutoryReportingMechanism",
          "basis_proc_004"
        ],
        [
          "ctrl_contract_002",
          "DataProcessingAgreementCheck",
          "basis_proc_005"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "attest_q1_2024",
          "Q1_Compliance_Attestation",
          "basis_proc_001"
        ],
        [
          "attest_emp_mon_2024",
          "Annual_Monitoring_Attestation",
          "basis_proc_002"
        ],
        [
          "attest_mktg_analytics",
          "Marketing_Consent_Attestation",
          "basis_proc_003"
        ],
        [
          "attest_fraud_detect",
          "Fraud_Control_Attestation",
          "basis_proc_004"
        ],
        [
          "attest_vendor_sharing",
          "Third_Party_Risk_Attestation",
          "basis_proc_005"
        ]
      ]
    },
    {
      "name": "t_audit_for_period",
      "rows": [
        [
          "audit_period_h1_23",
          "H1_2023_Compliance_Audit",
          "basis_proc_001"
        ],
        [
          "audit_period_q3_23",
          "Q3_2023_Monitoring_Audit",
          "basis_proc_002"
        ],
        [
          "audit_period_q4_23",
          "Q4_2023_Consent_Audit",
          "basis_proc_003"
        ],
        [
          "audit_period_annual",
          "FY2023_Annual_Audit",
          "basis_proc_004"
        ],
        [
          "audit_period_adhoc",
          "Adhoc_Vendor_Audit",
          "basis_proc_005"
        ]
      ]
    },
    {
      "name": "t_audit_subclass",
      "rows": [
        [
          "audit_type_01",
          "InternalSystemAudit"
        ],
        [
          "audit_type_02",
          "ExternalComplianceAudit"
        ],
        [
          "audit_type_03",
          "ForensicDataAudit"
        ],
        [
          "audit_type_04",
          "ProcessGapAnalysis"
        ],
        [
          "audit_type_05",
          "ThirdPartyAssuranceAudit"
        ]
      ]
    }
  ]
}
```