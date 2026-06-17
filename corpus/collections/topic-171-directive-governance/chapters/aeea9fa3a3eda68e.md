---
chapter_id: aeea9fa3a3eda68e
topic_id: 171
family: 03_directive_governance
cited_terms: ['audit_for_period', 'attestation_min_one_signer', 'audit_conducted_by', 'verification_min_one_evidence', 'requirement_equiv_specifies_target']
model: xai/grok-4.3
---

# Relational Modeling of Audit Directive Ontologies

This chapter maps five OWL axioms from the directive-governance family onto a compact relational schema for municipal and workplace safety audits. The schema supports cross-table joins that recover multi-hop facts such as the period, signatory, conductor, and evidence of a given audit process.

## 1 Table Embodiments of the Axioms

Each table is introduced by the axiom that directly determines its columns. Primary-key columns uniquely identify process or directive instances. Foreign-key columns encode the existential or minimum-cardinality restrictions expressed in the Manchester syntax.

### 1.1 t_audit_for_period

Axiom 1 states that an audit process is defined for a specific period. The table therefore stores the audit identifier as primary key, the process class as x, and the period class as y. A reader can join on y to retrieve every audit that occurred within a chosen fiscal quarter.

| id          | x               | y             |
|-------------|-----------------|---------------|
| AUD-2014-01 | SafetyAudit     | PER-2014Q1    |
| AUD-2014-02 | BudgetAudit     | PER-2014Q2    |
| AUD-2011-03 | CommitteeAudit  | PER-2011Q4    |
| AUD-2017-04 | UXPolicyAudit   | PER-2017Q1    |
| AUD-2014-05 | ProclamationAudit | PER-2014Q2  |

### 1.2 t_attestation_min_one_signer

Axiom 2 requires every attestation process to be signed by at least one person. The table records the attestation identifier as primary key and the process class as x; the minimum-cardinality restriction is satisfied by later joins that confirm signer presence.

| id          | x               |
|-------------|-----------------|
| ATT-001     | SafetyAudit     |
| ATT-002     | BudgetAudit     |
| ATT-003     | CommitteeAudit  |
| ATT-004     | UXPolicyAudit   |

### 1.3 t_audit_conducted_by

Axiom 3 asserts that an audit process is conducted by a person. The table uses the audit identifier as primary key and stores the process class in x; the conductor is recovered by joining x to personnel records outside this minimal schema.

| id          | x               |
|-------------|-----------------|
| AUD-2014-01 | SafetyAudit     |
| AUD-2014-02 | BudgetAudit     |
| AUD-2011-03 | CommitteeAudit  |
| AUD-2017-04 | UXPolicyAudit   |
| AUD-2014-05 | ProclamationAudit |

### 1.4 t_verification_min_one_evidence

Axiom 4 requires every verification process to produce at least one evidence artifact. The table therefore records the verification identifier as primary key, the process class as x, and the evidence class as y.

| id          | x               | y               |
|-------------|-----------------|-----------------|
| VER-001     | SafetyAudit     | EV-Report-042   |
| VER-002     | BudgetAudit     | EV-Minutes-0314 |
| VER-003     | CommitteeAudit  | EV-Manual-2011  |
| VER-004     | UXPolicyAudit   | EV-CRM-Design   |
| VER-005     | ProclamationAudit | EV-Notice-0414 |

### 1.5 t_requirement_equiv_specifies_target

Axiom 5 defines a requirement as a DirectiveICE that both specifies a target and applies to a subject. The table therefore contains three class columns in addition to the primary-key identifier.

| id          | x                  | y               | z                  |
|-------------|--------------------|-----------------|--------------------|
| REQ-001     | SafetyRequirement  | SafetyAudit     | WorkplaceSafety    |
| REQ-002     | BudgetRequirement  | BudgetAudit     | MunicipalBudget    |
| REQ-003     | CommitteeRequirement | CommitteeAudit | Pennsylvanians     |
| REQ-004     | UXRequirement      | UXPolicyAudit   | CoachNetwork       |

## 2 Cross-Join Demonstration

To recover the period, signatory requirement, conductor, and evidence for the safety audit of the first quarter of 2014, the following mental walk traverses three tables:

- Start in t_audit_for_period where x = SafetyAudit and y = PER-2014Q1 (row AUD-2014-01).
- Join x to t_attestation_min_one_signer on x to confirm the attestation ATT-001 exists.
- Join x to t_audit_conducted_by on x to confirm the same process identifier.
- Join x to t_verification_min_one_evidence on x to obtain evidence EV-Report-042.

The resulting joined fact row is therefore:

AUD-2014-01 | SafetyAudit | PER-2014Q1 | ATT-001 | AUD-2014-01 | VER-001 | EV-Report-042

```json
{"tables": [{"name": "t_audit_for_period", "rows": [["AUD-2014-01", "SafetyAudit", "PER-2014Q1"], ["AUD-2014-02", "BudgetAudit", "PER-2014Q2"], ["AUD-2011-03", "CommitteeAudit", "PER-2011Q4"], ["AUD-2017-04", "UXPolicyAudit", "PER-2017Q1"], ["AUD-2014-05", "ProclamationAudit", "PER-2014Q2"]]}, {"name": "t_attestation_min_one_signer", "rows": [["ATT-001", "SafetyAudit"], ["ATT-002", "BudgetAudit"], ["ATT-003", "CommitteeAudit"], ["ATT-004", "UXPolicyAudit"]]}, {"name": "t_audit_conducted_by", "rows": [["AUD-2014-01", "SafetyAudit"], ["AUD-2014-02", "BudgetAudit"], ["AUD-2011-03", "CommitteeAudit"], ["AUD-2017-04", "UXPolicyAudit"], ["AUD-2014-05", "ProclamationAudit"]]}, {"name": "t_verification_min_one_evidence", "rows": [["VER-001", "SafetyAudit", "EV-Report-042"], ["VER-002", "BudgetAudit", "EV-Minutes-0314"], ["VER-003", "CommitteeAudit", "EV-Manual-2011"], ["VER-004", "UXPolicyAudit", "EV-CRM-Design"], ["VER-005", "ProclamationAudit", "EV-Notice-0414"]]}, {"name": "t_requirement_equiv_specifies_target", "rows": [["REQ-001", "SafetyRequirement", "SafetyAudit", "WorkplaceSafety"], ["REQ-002", "BudgetRequirement", "BudgetAudit", "MunicipalBudget"], ["REQ-003", "CommitteeRequirement", "CommitteeAudit", "Pennsylvanians"], ["REQ-004", "UXRequirement", "UXPolicyAudit", "CoachNetwork"]]}]}
```