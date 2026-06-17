---
chapter_id: f552fe4adbc0e8bd
topic_id: 32
family: 03_directive_governance
cited_terms: ['audit_for_period', 'dataset_under_audit', 'audit_conducted_by', 'audit_subclass', 'audit_with_findings']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Ontological Structures in Audit Governance and Relational Mapping

## 4.1 Scope and Preamble

This chapter delineates the formal ontological structures required to represent audit processes within a governance framework. The content herein defines the axiomatic relationships between audit artifacts, temporal periods, responsible agents, and resultant findings, projecting these semantic structures into a deterministic relational schema. The definitions provided are anchored in the Basic Formal Ontology (BFO) and the Common Core Ontologies (CCO), ensuring that the data models presented are suitable for high-assurance environments such as regulatory compliance reporting and financial auditing. The following sections map specific ontology axioms to relational table structures, providing evidence-based examples of how these concepts are instantiated in practice.

## 4.2 Datasets Under Audit

### 4.2.1 Definition and Axiomatic Basis

In the context of governance frameworks, the primary object of scrutiny is the **Dataset Under Audit**. This concept is formally defined by Axiom 2 (`dataset_under_audit`), which asserts that the entity {X} is a subclass of `cco:Artifact` and is subject to an audit process (`bfo:0000015`). An artifact, in this ontological framing, is distinct from a physical object; it is an information content entity that persists independently of a single observer's cognition.

The axiom implies that for a dataset to be validly placed under audit, it must exist as a discrete, identifiable information entity. This is not merely a collection of data points but a coherent artifact governed by specific retention and integrity controls. The relational projection of this axiom creates a registry of these artifacts, serving as the foreign key anchor for subsequent audit relationships.

### 4.2.2 Relational Schema and Instances

The table `t_dataset_under_audit` functions as the master registry for all information entities subject to the governance framework. The primary key (`id`) ensures referential integrity, while the column `x` captures the specific class or instance name of the artifact.

**Table 4-1: Registry of Artifacts Under Audit (Axiom 2)**

| id | x |
| :--- | :--- |
| DS-2023-GL | General_Ledger_FY23 |
| DS-2023-HR | Employee_Access_Logs_Q4 |
| DS-2023-INV | Inventory_Manifest_System |
| DS-2023-AC | Accounts_Payable_Subledg |
| DS-2023-TR | Transaction_History_Archive |

*Table 4-1 illustrates the instantiation of Axiom 2. Each row represents a distinct `cco:Artifact` that has been formally entered into the audit scope. The `id` serves as the persistent identifier used throughout the audit lifecycle.*

## 4.3 Audit Periodicity

### 4.3.1 Definition and Axiomatic Basis

An audit process is temporally bounded. Axiom 1 (`audit_for_period`) establishes that an audit process {X} is a subclass of `bfo:0000015` (Process) and must be associated with a specific audit period {Y}. This temporal constraint is critical for regulatory compliance, as it defines the scope of inquiry and prevents open-ended investigations that lack temporal grounding.

In this schema, the "period" is not an abstract interval but is functionally linked to the specific dataset instance under examination. The relational schema enforces this by requiring a foreign key reference to the `t_dataset_under_audit` table. This design choice reflects the reality that an audit period is inextricably linked to the specific snapshot of data being audited.

### 4.3.2 Relational Schema and Instances

The table `t_audit_for_period` maps the audit process to its temporal context. The column `y` references the dataset ID, effectively binding the audit period to the specific artifact version defined in Section 4.2.

**Table 4-2: Mapping of Audit Processes to Periods (Axiom 1)**

| id | x | y |
| :--- | :--- | :--- |
| AP-FY23-001 | FY2023_Financial_Audit | DS-2023-GL |
| AP-FY23-002 | Q4_Compliance_Review | DS-2023-HR |
| AP-FY23-003 | Year_End_Inventory_Check | DS-2023-INV |
| AP-FY23-004 | AP_Substantive_Test | DS-2023-AC |

*Table 4-2 demonstrates the instantiation of Axiom 1. The process `FY2023_Financial_Audit` (x) is linked to the period defined by `DS-2023-GL` (y), ensuring that the audit is strictly scoped to the General Ledger data for Fiscal Year 2023.*

## 4.4 Audit Conducted By

### 4.4.1 Definition and Axiomatic Basis

Governance frameworks require the attribution of agency to audit processes. Axiom 3 (`audit_conducted_by`) posits that an audit process {X} is a process that is `conductedBy` a `cco:Person`. This axiom introduces the requirement of provenance; an audit cannot exist as a disembodied process but must be the result of intentional action by a responsible agent.

The ontological distinction here is between the *process* and the *agent*. The table `t_audit_conducted_by` catalogs those processes that satisfy the condition of having a designated conductor. While the schema provided does not store the identity of the person directly (it focuses on the process), the existence of the row in this table asserts that the process {X} is validly conducted by a person instance. In a broader implementation, this would likely join to a personnel registry, but within this specific axiom scope, it serves to classify processes as "agent-driven."

### 4.4.2 Relational Structure

The schema for `t_audit_conducted_by` is a catalog of processes satisfying the agency constraint. It ensures that every audit process listed herein is verified as being conducted by a person, satisfying the `cco:Person` object property requirement.

## 4.5 Control Directives and Audit Subclasses

### 4.5.1 Definition and Axiomatic Basis

Not all audits are generic; many are specific responses to regulatory controls. Axiom 4 (`audit_subclass`) defines a specific type of audit process {X} that `auditsControl` some `cco:DirectiveICE` (Directive Information Content Entity). A Directive ICE is a normative document—such as a law, regulation, or internal policy—that prescribes specific behaviors.

This axiom allows the ontology to distinguish between a generic "inventory count" and a "SOX 404 control audit." The latter is specifically defined by its relationship to a directive (e.g., the Sarbanes-Oxley Act). The relational table `t_audit_subclass` isolates these specialized processes, enabling the reporting framework to filter audits by their regulatory target.

### 4.5.2 Relational Structure

The table `t_audit_subclass` lists processes that are specifically targeting control directives. This allows for precise reporting on governance adherence, separating general operational audits from those required by specific `cco:DirectiveICE` mandates.

## 4.6 Audit Findings

### 4.6.1 Definition and Axiomatic Basis

The output of an audit process is the generation of findings. Axiom 5 (`audit_with_findings`) asserts that an audit process {X} `hasFindings` {Y}. In this ontological model, the findings {Y} are treated as entities that are derived from or associated with the dataset under audit.

The relational schema for this axiom links the audit process back to the dataset via the findings. The foreign key constraint (`y` references `t_dataset_under_audit`) implies that findings are artifacts in their own right, or are inextricably bound to the artifact dataset from which they were derived. This structure ensures that findings are not orphaned text strings but are formally anchored to the evidence base (the dataset).

### 4.6.2 Relational Schema and Instances

The table `t_audit_with_findings` records the generation of observations or discrepancies. The link to `t_dataset_under_audit` via column `y` ensures traceability from the finding back to the specific data artifact that contained the exception.

**Table 4-3: Audit Findings Linked to Artifacts (Axiom 5)**

| id | x | y |
| :--- | :--- | :--- |
| WF-FY23-001 | FY2023_Financial_Audit | DS-2023-GL |
| WF-FY23-002 | FY2023_Financial_Audit | DS-2023-AC |
| WF-FY23-003 | Q4_Compliance_Review | DS-2023-HR |
| WF-FY23-004 | Year_End_Inventory_Check | DS-2023-INV |

*Table 4-3 represents the instantiation of Axiom 5. The process `FY2023_Financial_Audit` (x) generated findings associated with both the General Ledger (`DS-2023-GL`) and the Accounts Payable subledger (`DS-2023-AC`). This structure supports the requirement that audit findings must be evidence-anchored to specific artifacts.*

```json
{
  "tables": [
    {
      "name": "t_dataset_under_audit",
      "rows": [
        [
          "DS-2023-GL",
          "General_Ledger_FY23"
        ],
        [
          "DS-2023-HR",
          "Employee_Access_Logs_Q4"
        ],
        [
          "DS-2023-INV",
          "Inventory_Manifest_System"
        ],
        [
          "DS-2023-AC",
          "Accounts_Payable_Subledg"
        ],
        [
          "DS-2023-TR",
          "Transaction_History_Archive"
        ]
      ]
    },
    {
      "name": "t_audit_for_period",
      "rows": [
        [
          "AP-FY23-001",
          "FY2023_Financial_Audit",
          "DS-2023-GL"
        ],
        [
          "AP-FY23-002",
          "Q4_Compliance_Review",
          "DS-2023-HR"
        ],
        [
          "AP-FY23-003",
          "Year_End_Inventory_Check",
          "DS-2023-INV"
        ],
        [
          "AP-FY23-004",
          "AP_Substantive_Test",
          "DS-2023-AC"
        ]
      ]
    },
    {
      "name": "t_audit_conducted_by",
      "rows": [
        [
          "ACB-FY23-001",
          "FY2023_Financial_Audit"
        ],
        [
          "ACB-FY23-002",
          "Q4_Compliance_Review"
        ],
        [
          "ACB-FY23-003",
          "Year_End_Inventory_Check"
        ]
      ]
    },
    {
      "name": "t_audit_subclass",
      "rows": [
        [
          "AS-FY23-001",
          "SOX_404_Control_Audit"
        ],
        [
          "AS-FY23-002",
          "GDPR_Access_Audit"
        ]
      ]
    },
    {
      "name": "t_audit_with_findings",
      "rows": [
        [
          "WF-FY23-001",
          "FY2023_Financial_Audit",
          "DS-2023-GL"
        ],
        [
          "WF-FY23-002",
          "FY2023_Financial_Audit",
          "DS-2023-AC"
        ],
        [
          "WF-FY23-003",
          "Q4_Compliance_Review",
          "DS-2023-HR"
        ],
        [
          "WF-FY23-004",
          "Year_End_Inventory_Check",
          "DS-2023-INV"
        ]
      ]
    }
  ]
}
```