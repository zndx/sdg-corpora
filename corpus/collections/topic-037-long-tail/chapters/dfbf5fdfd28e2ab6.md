---
chapter_id: dfbf5fdfd28e2ab6
topic_id: 37
family: 03_directive_governance
cited_terms: ['audit_for_period', 'dataset_under_audit', 'audit_conducted_by', 'attestation_with_supporting_evidence', 'attestation_signed_by']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Ontological Foundations of Audit Governance and Attestation

This chapter delineates the formal structure of audit governance, establishing the ontological relationships between audit processes, datasets, evidence, and responsible agents. The framework presented herein ensures that compliance activities are not merely procedural but are semantically grounded, allowing for rigorous traceability and automated reasoning over audit records. The following sections define the core axioms governing the audit lifecycle, from the identification of the target artifact to the final attestation of findings.

## 4.1 The Dataset Under Audit

In the context of governance frameworks, the primary object of scrutiny is the artifact subject to verification. We define this entity through the axiom `dataset_under_audit`, which posits that the target of review (Class X) is a subclass of `cco:Artifact` and is subject to a `bfo:0000015` (Process) denoted as "under audit." This distinction is critical: it separates static data assets from the dynamic process of examination. The dataset must exist as a discrete, identifiable artifact—whether a digital ledger, a physical registry, or a structured XML file—before it can be admitted into the audit scope.

The integrity of the audit relies on the precise identification of this artifact. In regulatory environments, failure to strictly define the dataset under audit leads to scope creep and evidentiary challenges. For instance, when a multi-service agency conducts a review of service delivery data, the specific version of the dataset (e.g., "Q3_Financial_Ledger_v2") must be locked and referenced. This ensures that the audit process is repeatable and that subsequent reviews can verify whether the artifact has been altered post-audit.

The relational projection of this axiom is straightforward. The primary key serves as the unique identifier for the dataset instance, while the entity `x` represents the class or specific name of the artifact.

**Table 4.1: Registry of Artifacts Under Audit**

| id | x |
|---|---|
| DS-2023-001 | Q3_Financial_Ledger |
| DS-2023-002 | Employee_Registry_2023 |
| DS-2023-003 | Incident_Report_Log |
| DS-2023-004 | Environmental_Impact_Assessment |

*Table 4.1 illustrates the instantiation of datasets. Each `id` serves as a persistent reference for the audit trail, ensuring that the artifact `x` is uniquely identified within the governance system.*

## 4.2 Audit Period Specification

An audit cannot exist in a temporal vacuum; it must be anchored to a specific timeframe to ensure relevance and currency. The axiom `audit_for_period` formalizes this by asserting that the audit process (Class X) is a subclass of `bfo:0000015` and is defined by the property `sdg:forAuditPeriod`, which links to a specific period (Class Y). In practice, this temporal scoping is inextricably linked to the dataset itself, as the dataset represents the state of affairs during that period.

The relational schema for this concept enforces a foreign key constraint linking the period definition to the dataset under audit. This structural dependency ensures that an audit period is not an abstract calendar date but is operationally bound to the evidence available for that duration. For example, an "Annual Compliance Audit" is functionally dependent on the "Annual Dataset" which contains the records for that year.

**Table 4.2: Audit Period Mapping**

| id | x | y |
|---|---|---|
| AUD-PER-001 | FY2023_Compliance_Audit | DS-2023-001 |
| AUD-PER-002 | FY2023_HR_Review | DS-2023-002 |
| AUD-PER-003 | Q3_Safety_Audit | DS-2023-003 |

*In Table 4.2, the audit process `x` is mapped to a specific period via the dataset reference `y`. The foreign key constraint (`y` REFERENCES `t_dataset_under_audit`) guarantees that the audit period is valid only if the underlying data artifact exists.*

## 4.3 Audit Conductance and Agency

Governance frameworks require the assignment of responsibility to specific natural persons to ensure accountability. The axiom `audit_conducted_by` addresses this by defining the audit process (Class X) as a subclass of `bfo:0000015` that is `sdg:conductedBy` an instance of `cco:Person`. This moves the audit from a theoretical procedure to a concrete action performed by an agent with the authority and competence to execute the review.

The implication of this axiom is that an automated script or a passive data collection process does not constitute an audit in the strict sense unless there is a responsible agent overseeing it. The "Person" slot must be populated by a qualified individual whose credentials are recorded in the system. This aligns with compliance standards (such as ISO 27001 or SOC 2) which require sign-off by authorized personnel.

**Table 4.3: Audit Conductance Registry**

| id | x |
|---|---|
| COND-001 | FY2023_Compliance_Audit |
| COND-002 | FY2023_HR_Review |
| COND-003 | Q3_Safety_Audit |
| COND-004 | Ad_Hoc_Investigation_45 |

*Table 4.3 records the specific audit processes `x` that have been actively conducted. The `id` provides a unique handle for the conductance event, distinct from the definition of the audit itself.*

## 4.4 Attestation and Evidence Linkage

Once the audit process is complete, the findings must be formalized into an attestation. The axiom `attestation_with_supporting_evidence` defines the attestation process (Class X) as a `bfo:0000015` that utilizes `sdg:withSupportingEvidence` to link to a specific artifact (Class Y). This linkage is the cornerstone of audit defensibility; it creates a semantic bridge between the conclusion (the attestation) and the proof (the dataset).

In the relational model, this is enforced by a foreign key constraint requiring the evidence (`y`) to correspond to a valid entry in the `t_dataset_under_audit` table. This prevents "orphan" attestations—claims made without supporting data. For instance, if an auditor attests that "all safety protocols were followed," this system requires that assertion to be backed by a specific dataset ID (e.g., `DS-2023-003`), ensuring that the claim can be re-verified against the source records.

**Table 4.4: Attestation Evidence Log**

| id | x | y |
|---|---|---|
| ATT-001 | FY23_Financial_Clean_Opinion | DS-2023-001 |
| ATT-002 | FY23_HR_Compliance_Certificate | DS-2023-002 |
| ATT-003 | Q3_Safety_Verification | DS-2023-003 |
| ATT-004 | Environmental_Compliance_Attestation | DS-2023-004 |

*Table 4.4 demonstrates the binding of attestations `x` to their evidentiary basis `y`. The non-null constraint on `y` ensures that every attestation is anchored to empirical data.*

## 4.5 Attestation Authorization

The final step in the audit lifecycle is the formal authorization of the attestation. The axiom `attestation_signed_by` specifies that the attestation process (Class X) is a `bfo:0000015` that is `sdg:signedBy` a `cco:Person`. This differs from the "conducted by" axiom in that it pertains specifically to the act of signing off on the final report or attestation, thereby assuming legal liability for the accuracy of the findings.

This axiom enforces the requirement that digital or physical signatures must be captured and linked to the attestation process. It prevents the scenario where a report is generated by a team but lacks a final signatory. In a technical system, this might manifest as a cryptographic signature or a timestamped user action log.

**Table 4.5: Attestation Signatory Log**

| id | x |
|---|---|
| SIG-001 | FY23_Financial_Clean_Opinion |
| SIG-002 | FY23_HR_Compliance_Certificate |
| SIG-003 | Q3_Safety_Verification |
| SIG-004 | Environmental_Compliance_Attestation |
| SIG-005 | Interim_Findings_Report |

*Table 4.5 lists the attestation processes `x` that have been formally signed. The presence of a record in this table indicates that the governance lifecycle for the specific audit item has reached closure.*

```json
{
  "tables": [
    {
      "name": "t_dataset_under_audit",
      "rows": [
        [
          "DS-2023-001",
          "Q3_Financial_Ledger"
        ],
        [
          "DS-2023-002",
          "Employee_Registry_2023"
        ],
        [
          "DS-2023-003",
          "Incident_Report_Log"
        ],
        [
          "DS-2023-004",
          "Environmental_Impact_Assessment"
        ]
      ]
    },
    {
      "name": "t_audit_for_period",
      "rows": [
        [
          "AUD-PER-001",
          "FY2023_Compliance_Audit",
          "DS-2023-001"
        ],
        [
          "AUD-PER-002",
          "FY2023_HR_Review",
          "DS-2023-002"
        ],
        [
          "AUD-PER-003",
          "Q3_Safety_Audit",
          "DS-2023-003"
        ]
      ]
    },
    {
      "name": "t_audit_conducted_by",
      "rows": [
        [
          "COND-001",
          "FY2023_Compliance_Audit"
        ],
        [
          "COND-002",
          "FY2023_HR_Review"
        ],
        [
          "COND-003",
          "Q3_Safety_Audit"
        ],
        [
          "COND-004",
          "Ad_Hoc_Investigation_45"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "ATT-001",
          "FY23_Financial_Clean_Opinion",
          "DS-2023-001"
        ],
        [
          "ATT-002",
          "FY23_HR_Compliance_Certificate",
          "DS-2023-002"
        ],
        [
          "ATT-003",
          "Q3_Safety_Verification",
          "DS-2023-003"
        ],
        [
          "ATT-004",
          "Environmental_Compliance_Attestation",
          "DS-2023-004"
        ]
      ]
    },
    {
      "name": "t_attestation_signed_by",
      "rows": [
        [
          "SIG-001",
          "FY23_Financial_Clean_Opinion"
        ],
        [
          "SIG-002",
          "FY23_HR_Compliance_Certificate"
        ],
        [
          "SIG-003",
          "Q3_Safety_Verification"
        ],
        [
          "SIG-004",
          "Environmental_Compliance_Attestation"
        ],
        [
          "SIG-005",
          "Interim_Findings_Report"
        ]
      ]
    }
  ]
}
```