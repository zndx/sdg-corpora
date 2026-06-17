---
chapter_id: a7fcddddf0dc423d
topic_id: 37
family: 03_directive_governance
cited_terms: ['audit_for_period', 'dataset_under_audit', 'audit_conducted_by', 'attestation_with_supporting_evidence', 'attestation_signed_by']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Audit Trail Ontology and Evidence Verification Protocols

This chapter establishes the formal ontology governing audit trails within the enterprise data governance framework. It delineates the structural relationships between audit processes, data artifacts, temporal constraints, and responsible agents. The definitions provided herein align with the Basic Formal Ontology (BFO) upper-level ontology to ensure semantic interoperability across compliance modules. Readers are advised to refer to the accompanying relational schemas to understand the implementation constraints for these concepts in the central repository.

## 1. Dataset Under Audit

The foundational unit of any compliance examination is the artifact itself, formally defined as the entity under audit. In accordance with the governance framework, a dataset under audit is not merely a collection of data points but a distinct `cco:Artifact` that is subject to a specific `bfo:0000015` (Process) of review. This classification ensures that the object of the audit is immutable in definition and traceable in lineage. The ontology asserts that for an artifact to be considered "under audit," it must be actively engaged with a processual entity. This relationship prevents ambiguity regarding the scope of the examination; only those artifacts explicitly linked to an audit process inherit the status of "under audit."

In practice, this distinction is critical for version control. If a dataset is modified during the audit period, the ontology requires that the specific version instance be the one referenced. The relational schema for this concept is straightforward, serving as the primary lookup for all evidence artifacts.

**Table 1.1: Registered Artifacts Under Audit**
This table enumerates the specific datasets currently designated as `cco:Artifact` instances subject to audit processes. The `id` serves as the primary key for foreign key references in subsequent audit tables.

| id | x |
|---|---|
| DS-2023-Q3-FIN | FinancialTransactionLog_Q3_2023 |
| DS-2023-Q4-FIN | FinancialTransactionLog_Q4_2023 |
| DS-2024-ACC-01 | UserAccessControl_Matrix_2024 |
| DS-2024-INC-05 | IncidentResponse_Report_05 |
| DS-2024-INV-12 | PhysicalInventory_Count_12 |

## 2. Audit For Period

An audit process is temporally bounded; it does not exist in a vacuum but is defined by its duration and scope. The axiom "Audit For Period" formalizes this by asserting that a process (specifically, an audit) is a subclass of `bfo:0000015` that possesses the property `sdg:forAuditPeriod`. This property links the process to a defined temporal class or interval. This construct is essential for establishing the "look-back" capability of the governance system, ensuring that findings are attributed to the correct timeframe.

The temporal definition serves as a constraint on the data retrieval mechanisms. When a query is executed against the `t_audit_for_period` table, the system validates that the associated dataset (`y`) contains records relevant to the specified period. This linkage prevents the erroneous association of a Q1 audit with a Q4 dataset, thereby maintaining the integrity of the compliance report.

**Table 2.1: Audit Period Assignments**
This table embodies the axiom where an audit process (`x`) is designated for a specific audit period (`y`). The `y` column acts as a foreign key referencing the dataset under audit, ensuring the process is anchored to a tangible artifact.

| id | x | y |
|---|---|---|
| AUD-001 | Q3_2023_Financial_Compliance_Review | DS-2023-Q3-FIN |
| AUD-002 | Q4_2023_Financial_Compliance_Review | DS-2023-Q4-FIN |
| AUD-003 | FY2024_Access_Control_Audit | DS-2024-ACC-01 |
| AUD-004 | Incident_05_Post-Mortem_Audit | DS-2024-INC-05 |

## 3. Audit Conducted By

Governance frameworks require clear lines of accountability. The axiom "Audit Conducted By" introduces the agent into the ontology. It asserts that the audit process (`bfo:0000015`) is conducted by a `cco:Person`. This relationship moves the definition from a purely procedural abstraction to a realized event with responsible parties. In the context of the relational schema, this allows the system to generate responsibility matrices and auditor workload reports.

The distinction between the process and the agent is vital. While the audit defines *what* is happening, the agent defines *who* is executing it. This separation allows for the reassignment of personnel without altering the fundamental definition of the audit process itself. Furthermore, it supports the requirement for independence in auditing; the ontology can be extended to restrict the `cco:Person` class to exclude individuals with operational conflicts of interest regarding the dataset under review.

**Table 3.1: Auditor Assignment Registry**
The following table details the specific audit processes and the assigned personnel. The `x` column represents the audit process instance, which must correspond to the processes defined in the audit period tables.

| id | x |
|---|---|
| AUD-001 | SeniorAuditor_J_Marquez |
| AUD-002 | SeniorAuditor_J_Marquez |
| AUD-003 | ComplianceOfficer_L_Chen |
| AUD-004 | InfoSecLead_K_Thompson |

## 4. Attestation With Supporting Evidence

An audit culminates in an attestation, which is a formal declaration of validity or compliance. However, per the governance framework, an attestation cannot be a standalone assertion; it must be substantiated by evidence. The axiom "Attestation With Supporting Evidence" defines the attestation as a process (`bfo:0000015`) that utilizes the property `sdg:withSupportingEvidence` to reference a specific dataset (`cco:Artifact`).

This relationship creates the evidentiary chain required for legal and regulatory defensibility. In the relational model, this is enforced by a foreign key constraint linking the attestation to the `t_dataset_under_audit` table. If the supporting evidence is deleted or modified, the referential integrity rules ensure that the attestation is flagged or invalidated, preventing "orphaned" compliance claims. The ontology dictates that the strength of the attestation is directly derived from the robustness of the linked evidence.

**Table 4.1: Attestation Evidence Mapping**
This table illustrates the dependency of attestation processes (`x`) on specific datasets (`y`). The `y` column must reference a valid `id` from the `t_dataset_under_audit` table.

| id | x | y |
|---|---|---|
| ATT-001 | SOX_Certification_Attestation_Q3 | DS-2023-Q3-FIN |
| ATT-002 | SOX_Certification_Attestation_Q4 | DS-2023-Q4-FIN |
| ATT-003 | ISO27001_Access_Control_Cert | DS-2024-ACC-01 |
| ATT-004 | Security_Incident_Validation | DS-2024-INC-05 |

## 5. Attestation Signed By

The final step in the audit lifecycle is the formal authorization of the attestation. The axiom "Attestation Signed By" formalizes the act of signing as a relationship between the attestation process (`bfo:0000015`) and a `cco:Person`. This differs from the "Audit Conducted By" relationship in that the signatory is typically authorizing the *outcome* of the process, whereas the conductor is performing the *work* of the process.

In many regulatory environments, the signatory must possess specific credentials or seniority (e.g., a C-Level officer or a Certified Public Accountant). The ontology supports this by allowing the `cco:Person` class to be restricted or filtered based on role attributes. The relational schema captures this link, enabling the system to retrieve the digital signature or cryptographic hash associated with the person's authorization of the specific attestation instance.

**Table 5.1: Attestation Signatory Log**
This table maps the final attestation processes (`x`) to the authorized signatories (`cco:Person`). This log serves as the final record of authority for the compliance artifacts.

| id | x |
|---|---|
| ATT-001 | CFO_Eleanor_Rigby |
| ATT-002 | CFO_Eleanor_Rigby |
| ATT-003 | CISO_David_Bowie |
| ATT-004 | CISO_David_Bowie |

```json
{
  "tables": [
    {
      "name": "t_dataset_under_audit",
      "rows": [
        ["DS-2023-Q3-FIN", "FinancialTransactionLog_Q3_2023"],
        ["DS-2023-Q4-FIN", "FinancialTransactionLog_Q4_2023"],
        ["DS-2024-ACC-01", "UserAccessControl_Matrix_2024"],
        ["DS-2024-INC-05", "IncidentResponse_Report_05"],
        ["DS-2024-INV-12", "PhysicalInventory_Count_12"]
      ]
    },
    {
      "name": "t_audit_for_period",
      "rows": [
        ["AUD-001", "Q3_2023_Financial_Compliance_Review", "DS-2023-Q3-FIN"],
        ["AUD-002", "Q4_2023_Financial_Compliance_Review", "DS-2023-Q4-FIN"],
        ["AUD-003", "FY2024_Access_Control_Audit", "DS-2024-ACC-01"],
        ["AUD-004", "Incident_05_Post-Mortem_Audit", "DS-2024-INC-05"]
      ]
    },
    {
      "name": "t_audit_conducted_by",
      "rows": [
        ["AUD-001", "SeniorAuditor_J_Marquez"],
        ["AUD-002", "SeniorAuditor_J_Marquez"],
        ["AUD-003", "ComplianceOfficer_L_Chen"],
        ["AUD-004", "InfoSecLead_K_Thompson"]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        ["ATT-001", "SOX_Certification_Attestation_Q3", "DS-2023-Q3-FIN"],
        ["ATT-002", "SOX_Certification_Attestation_Q4", "DS-2023-Q4-FIN"],
        ["ATT-003", "ISO27001_Access_Control_Cert", "DS-2024-ACC-01"],
        ["ATT-004", "Security_Incident_Validation", "DS-2024-INC-05"]
      ]
    },
    {
      "name": "t_attestation_signed_by",
      "rows": [
        ["ATT-001", "CFO_Eleanor_Rigby"],
        ["ATT-002", "CFO_Eleanor_Rigby"],
        ["ATT-003", "CISO_David_Bowie"],
        ["ATT-004", "CISO_David_Bowie"]
      ]
    }
  ]
}
```