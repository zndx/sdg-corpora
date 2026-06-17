---
chapter_id: 627bcdbc80da24ff
topic_id: 166
family: 03_directive_governance
cited_terms: ['audit_with_findings']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Audit Process Ontology and Findings Correlation

## 4.1 Scope and Preamble

This chapter establishes the formal ontological framework for the governance of audit processes within the enterprise compliance architecture. It defines the structural relationship between the audit event—modeled as a temporal process—and the resultant findings that constitute the evidence base for regulatory reporting. The content herein aligns with the Basic Formal Ontology (BFO) specification and the Sustainable Development Goals (SDG) interface ontology, providing a deterministic mapping between high-level semantic axioms and the relational data structures required for audit readiness. The definitions and data models presented are mandatory for all departments conducting internal reviews pursuant to Directive 2024-09.

## 4.2 The Audit-Findings Axiom

### 4.2.1 Conceptual Definition

In accordance with the governing ontology, an Audit Process is formally defined as a subclass of `bfo:0000015` (Process). Within the BFO framework, a process is an occurrent that unfolds in time, possessing temporal parts and typically realizing some specific function. The Audit Process is distinct from static data entities; it is the dynamic activity of examination, verification, and validation.

The core structural assertion for this chapter is derived from the following Manchester Syntax axiom:

**Class:** `{Audit Process} SubClassOf: bfo:0000015, sdg:hasFindings some {Finding}`

This axiom asserts two necessary conditions. First, any instance of the Audit Process must inherit the characteristics of a BFO Process. Second, and critically for compliance reporting, the Audit Process must be characterized by the `sdg:hasFindings` object property. This property utilizes the "some" (existential) restriction, meaning that for an Audit Process to exist in the system, it must be associated with at least one instance of a Finding. In natural language, this is verbalized as:

**Verbalization:** *An Audit Process is something that has findings.*

This relationship ensures that the audit database is not merely a repository of scheduled events, but a linked chain of evidence where every process instance is inextricably bound to its substantive outcomes.

### 4.2.2 Relational Implementation

The ontological axiom described above projects deterministically onto the relational schema used for persistence and reporting. The table `t_audit_with_findings` serves as the primary registry for this relationship. It enforces the existential restriction by requiring a non-null reference to a Finding entity for every Audit Process record.

The primary key of this table is the `id` column, which serves as the unique surrogate key for the specific assertion linking an Audit to a Finding. The column `x` represents the Audit Process instance (the domain), while column `y` represents the Finding instance (the range). The structure supports one-to-many cardinality, as a single Audit Process (X) may generate multiple distinct Findings (Y), represented by multiple rows sharing the same `x` value but unique `id` and `y` values.

**Table 4-1: Audit-Findings Correlation Registry**

| id | x | y |
| :--- | :--- | :--- |
| REC-001 | AUD-2023-884 | FIN-2023-104 |
| REC-002 | AUD-2023-884 | FIN-2023-105 |
| REC-003 | AUD-2023-885 | OPS-2023-402 |
| REC-004 | AUD-2023-886 | FIN-2023-110 |
| REC-005 | AUD-2023-886 | HR-2023-009 |
| REC-006 | AUD-2023-887 | SEC-2023-880 |

*Table 4-1 embodies the axiom that an Audit Process (x) is a process that has findings (y). The primary key (id) ensures referential integrity for each specific finding assertion, while the foreign key structure allows a single audit (e.g., AUD-2023-884) to possess multiple finding records.*

### 4.2.3 Audit Process Instances (Class X)

To provide context for the correlation registry, it is necessary to define the specific instances of the Audit Process (Class X) referenced in the correlation table. These processes are the occurrents that trigger the data entry. The following table details the Audit Process instances (`x`) that serve as the domain for the findings relationship.

**Table 4-2: Audit Process Log**

| process_id | process_name | start_date | end_date |
| :--- | :--- | :--- | :--- |
| AUD-2023-884 | Q3 Financial Compliance Audit | 2023-07-01 | 2023-07-15 |
| AUD-2023-885 | Supply Chain Verification | 2023-07-10 | 2023-07-12 |
| AUD-2023-886 | Annual Physical Security Review | 2023-08-01 | 2023-08-05 |
| AUD-2023-887 | IT Infrastructure Penetration Test | 2023-08-15 | 2023-08-20 |

*Table 4-2 lists the specific instances of the Audit Process (Class X). The `process_id` corresponds to the `x` value in the Correlation Registry (Table 4-1), providing the temporal bounds and nomenclature for the audit events.*

## 4.3 Findings Classification and Semantics

### 4.3.1 The Nature of Findings (Class Y)

The range of the `sdg:hasFindings` property is the class {Finding}. A Finding, in this ontological context, is a dependent entity that derives its existence from the Audit Process. It represents a discrete observation, non-compliance event, or validation result discovered during the execution of the process.

The axiom `sdg:hasFindings some {Finding}` mandates that the absence of findings implies the absence of a completed audit process in the system. Even a "clean" audit with no discrepancies must generate a finding object explicitly stating the absence of exceptions (e.g., "No Exceptions Found"). This data modeling approach prevents null-value ambiguities and ensures that the audit trail is complete and queryable for regulatory analytics.

### 4.3.2 Data Consistency and Evidence Anchoring

When populating the `t_audit_with_findings` table, operators must ensure that every `y` value corresponds to a valid Finding record in the subordinate findings database. The relationship is rigid; an Audit Process cannot be closed or signed off until the requisite Finding records are linked. This enforces the "evidence-anchored" nature of the documentation, ensuring that high-level governance reports are always backed by granular, verifiable data points.

For instance, in the data presented in Table 4-1, the Audit Process `AUD-2023-884` (Q3 Financial Compliance Audit) is linked to two distinct findings: `FIN-2023-104` and `FIN-2023-105`. This multiplicity reflects the reality that a single temporal process (the audit) yields multiple discrete outcomes (the findings). The relational schema effectively normalizes this one-to-many relationship, allowing for complex querying, such as "Retrieve all audits yielding findings related to financial discrepancies in Q3."

```json
{
  "tables": [
    {
      "name": "t_audit_with_findings",
      "rows": [
        [
          "REC-001",
          "AUD-2023-884",
          "FIN-2023-104"
        ],
        [
          "REC-002",
          "AUD-2023-884",
          "FIN-2023-105"
        ],
        [
          "REC-003",
          "AUD-2023-885",
          "OPS-2023-402"
        ],
        [
          "REC-004",
          "AUD-2023-886",
          "FIN-2023-110"
        ],
        [
          "REC-005",
          "AUD-2023-886",
          "HR-2023-009"
        ],
        [
          "REC-006",
          "AUD-2023-887",
          "SEC-2023-880"
        ]
      ]
    },
    {
      "name": "t_audit_process_log",
      "rows": [
        [
          "AUD-2023-884",
          "Q3 Financial Compliance Audit",
          "2023-07-01",
          "2023-07-15"
        ],
        [
          "AUD-2023-885",
          "Supply Chain Verification",
          "2023-07-10",
          "2023-07-12"
        ],
        [
          "AUD-2023-886",
          "Annual Physical Security Review",
          "2023-08-01",
          "2023-08-05"
        ],
        [
          "AUD-2023-887",
          "IT Infrastructure Penetration Test",
          "2023-08-15",
          "2023-08-20"
        ]
      ]
    }
  ]
}
```