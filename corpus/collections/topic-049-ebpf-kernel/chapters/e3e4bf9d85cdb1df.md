---
chapter_id: e3e4bf9d85cdb1df
topic_id: 49
family: 02_observation_measurement
cited_terms: ['outlier_claim_min_one_attribute', 'trace_supports_claim', 'outlier_claim_basic', 'dataset_under_audit']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Ontological Structures for Audit Verification and Anomaly Management

This chapter delineates the formal ontological structures required to govern the verification of audit trails and the management of anomaly claims within regulated information systems. The scope encompasses the definition of informational artifacts subject to audit, the classification of descriptive claims regarding outliers, and the processual entities that provide evidentiary support for such claims. The principles presented herein are aligned with the Basic Formal Ontology (BFO) and the Common Core Ontologies (CCO), ensuring that data governance frameworks adhere to rigorous semantic standards. By instantiating these axioms, organizations establish a deterministic chain of evidence necessary for compliance reporting and forensic analysis.

## 7.1 The Dataset Under Audit

The foundational unit of any audit engagement is the informational artifact itself. In this framework, a dataset under audit is formally defined as an instance of `cco:Artifact` that is currently undergoing a `bfo:Process` specifically designated as an audit. This distinction is critical: it separates static data repositories from the dynamic act of examination, thereby preserving the temporal integrity of the audit record.

The axiom `dataset_under_audit` asserts that the entity {X} is an artifact that is "under audit" by some process. This relationship ensures that governance protocols are not merely applied to data in a vacuum, but are enacted upon specific, identified artifacts during a defined temporal interval. In practice, this class encompasses financial ledgers, transaction logs, or user activity registers that have been flagged for review against internal controls or regulatory standards.

The relational schema for this concept requires a unique identifier for the artifact and a reference to the class of the artifact itself. The primary key (`id`) serves as the stable reference for the audit engagement, while the column `x` denotes the specific artifact class being examined.

**Table 7.1: Instances of Artifacts Designated for Audit Review**

| id | x |
| :--- | :--- |
| ART-2023-Q3-001 | General_Ledger_Q3_2023 |
| ART-2023-Q3-002 | Accounts_Payable_Subledger |
| ART-2023-Q3-003 | Access_Control_Logs_NA |
| ART-2023-Q3-004 | Trade_Allocation_History |
| ART-2023-Q3-005 | Customer_Data_Master_File |

As demonstrated in Table 7.1, the instantiation of `dataset_under_audit` captures the specific scope of the audit engagement. The entity `ART-2023-Q3-001`, for example, represents the "General_Ledger_Q3_2023," which is the informational artifact subject to the audit process. This classification allows auditors to apply specific procedural controls (e.g., sampling, reconciliation) to the artifact, ensuring that all subsequent observations are traceable to this root entity.

## 7.2 Basic Outlier Claims

Once an artifact is under audit, the examination process inevitably yields observations. A fundamental category of observation is the "outlier claim basic." Formally, this concept is defined by the axiom `outlier_claim_basic`, which asserts that {X} is a subclass of `cco:DescriptiveICE` (Information Content Entity).

A Descriptive Information Content Entity is a generically dependent continuant that conveys meaning. In the context of an audit, an outlier claim is a declarative statement about a data point or pattern that deviates from the expected norm. Unlike a complex claim, which may carry immediate evidentiary weight, the basic claim serves as the initial identification of an anomaly. It is the assertion that "something is here that requires attention," prior to the validation of that assertion.

The schema for `t_outlier_claim_basic` is structurally simple but semantically significant. It records the unique identifier of the claim and the class of the claim {X}. This structure allows the audit system to categorize the nature of the anomaly (e.g., a timing discrepancy, a value variance) without yet linking it to supporting evidence.

**Table 7.2: Identification of Descriptive Outlier Claims**

| id | x |
| :--- | :--- |
| CLM-OUT-101 | High_Value_Transaction_Flag |
| CLM-OUT-102 | Off-Hours_Login_Attempt |
| CLM-OUT-103 | Duplicate_Invoice_Number |
| CLM-OUT-104 | Inventory_Count_Variance |
| CLM-OUT-105 | Missing_Signature_Authorization |

Table 7.2 illustrates the registration of these descriptive entities. The entry `CLM-OUT-102`, categorized as an "Off-Hours_Login_Attempt," represents a pure information content entity describing a potential security incident. At this stage, the claim is descriptive; it asserts the existence of a state of affairs. The ontology treats this claim as a distinct entity, allowing it to be managed, tracked, and resolved independently of the raw log data that generated it.

## 7.3 Traces Supporting Claims

For a descriptive claim to possess audit value, it must be substantiated by evidence. This substantiation is modeled by the `trace_supports_claim` axiom. This axiom defines {X} as a subclass of `bfo:0000015` (a Process) that `sdg:supportsClaim` some `cco:DescriptiveICE`.

This distinction introduces the concept of provenance. The "trace" is not merely a data point; it is the *process* or the record of a process that validates the claim. For example, if a claim asserts an anomaly in a financial transaction, the supporting trace might be the system execution log or the manual approval workflow that generated (or failed to generate) that transaction. By defining the trace as a process (or a record of one), the ontology enforces a dynamic view of evidence: the claim is true because a specific process occurred or failed to occur.

The relational structure for `t_trace_supports_claim` establishes the trace as a primary entity. The `id` represents the unique trace identifier, and `x` represents the class of the process or trace entity. This table functions as the evidentiary registry; every valid claim must eventually reference an entry in this registry to be considered verified.

**Table 7.3: Processual Entities Providing Evidentiary Support**

| id | x |
| :--- | :--- |
| TRC-SUP-500 | System_Log_Entry_8821 |
| TRC-SUP-501 | Manager_Approval_Workflow |
| TRC-SUP-502 | Biometric_Authentication_Stream |
| TRC-SUP-503 | Network_Traffic_Capture_PCAP |
| TRC-SUP-504 | External_Validation_API_Response |

In Table 7.3, `TRC-SUP-501` represents a "Manager_Approval_Workflow." This entry serves as the potential support for a claim regarding authorization. If `CLM-OUT-105` (Missing_Signature_Authorization) is to be resolved or refuted, it must be linked to a trace such as `TRC-SUP-501`. The existence of the trace in the registry confirms that the process entity is available for scrutiny.

## 7.4 Complex Outlier Claims with Attributes

The final, and most rigorous, concept integrates the previous elements into a composite structure. The axiom `outlier_claim_min_one_attribute` defines a class {X} that is a `cco:DescriptiveICE` and must possess an attribute set (`sdg:hasAttributeSet`) containing a minimum of one {Y}.

In this specific ontological configuration, the attribute {Y} is constrained to be an instance of the trace supporting the claim. Therefore, this axiom formalizes the rule: *A valid outlier claim is a descriptive entity that is minimally accompanied by one evidentiary trace.* This structure prevents "orphan" claims—assertions that exist without any grounding in the processual reality of the system.

This is a complex axiom because it enforces a cardinality constraint and a foreign key relationship. The relational schema `t_outlier_claim_min_one_attribute` reflects this complexity. It includes the claim identifier (`id`), the claim class (`x`), and the attribute reference (`y`). The column `y` is a foreign key that must reference the `id` in the `t_trace_supports_claim` table. This referential integrity is the mechanical enforcement of the axiom's logic: a claim cannot exist in this table without pointing to a valid trace.

**Table 7.4: Validated Outlier Claims with Mandatory Attributes**

| id | x | y |
| :--- | :--- | :--- |
| CLM-CPL-900 | Verified_Anomaly_Transaction_99 | TRC-SUP-500 |
| CLM-CPL-901 | Unauthorized_Access_Incident | TRC-SUP-502 |
| CLM-CPL-902 | Discrepancy_Inventory_Count | TRC-SUP-504 |
| CLM-CPL-903 | Policy_Violation_Login_Time | TRC-SUP-501 |
| CLM-CPL-904 | Data_Exfiltration_Attempt | TRC-SUP-503 |

Table 7.4 presents the fully realized audit findings. The row with `id` `CLM-CPL-901` links the claim "Unauthorized_Access_Incident" to the trace `TRC-SUP-502` (Biometric_Authentication_Stream). This linkage confirms that the descriptive claim is not merely an opinion; it is an information content entity anchored by a specific processual attribute. The foreign key constraint ensures that the audit trail is unbroken. If `TRC-SUP-502` were deleted or did not exist, the record `CLM-CPL-901` would violate the relational integrity, rendering the claim invalid within the system. This structure provides the dense, evidence-anchored framework required for high-assurance compliance reporting.

```json
{
  "tables": [
    {
      "name": "t_dataset_under_audit",
      "rows": [
        ["ART-2023-Q3-001", "General_Ledger_Q3_2023"],
        ["ART-2023-Q3-002", "Accounts_Payable_Subledger"],
        ["ART-2023-Q3-003", "Access_Control_Logs_NA"],
        ["ART-2023-Q3-004", "Trade_Allocation_History"],
        ["ART-2023-Q3-005", "Customer_Data_Master_File"]
      ]
    },
    {
      "name": "t_outlier_claim_basic",
      "rows": [
        ["CLM-OUT-101", "High_Value_Transaction_Flag"],
        ["CLM-OUT-102", "Off-Hours_Login_Attempt"],
        ["CLM-OUT-103", "Duplicate_Invoice_Number"],
        ["CLM-OUT-104", "Inventory_Count_Variance"],
        ["CLM-OUT-105", "Missing_Signature_Authorization"]
      ]
    },
    {
      "name": "t_trace_supports_claim",
      "rows": [
        ["TRC-SUP-500", "System_Log_Entry_8821"],
        ["TRC-SUP-501", "Manager_Approval_Workflow"],
        ["TRC-SUP-502", "Biometric_Authentication_Stream"],
        ["TRC-SUP-503", "Network_Traffic_Capture_PCAP"],
        ["TRC-SUP-504", "External_Validation_API_Response"]
      ]
    },
    {
      "name": "t_outlier_claim_min_one_attribute",
      "rows": [
        ["CLM-CPL-900", "Verified_Anomaly_Transaction_99", "TRC-SUP-500"],
        ["CLM-CPL-901", "Unauthorized_Access_Incident", "TRC-SUP-502"],
        ["CLM-CPL-902", "Discrepancy_Inventory_Count", "TRC-SUP-504"],
        ["CLM-CPL-903", "Policy_Violation_Login_Time", "TRC-SUP-501"],
        ["CLM-CPL-904", "Data_Exfiltration_Attempt", "TRC-SUP-503"]
      ]
    }
  ]
}
```