---
chapter_id: fbaa6e85cb29e4b0
topic_id: 40
family: 03_directive_governance
cited_terms: ['verification_min_one_evidence', 'process_with_min_one_artifact', 'classification_basic', 'audit_basic']
model: xai/grok-4.3
---

# Process Ontologies in Examination Audit Systems

This chapter defines four tables that realize the supplied OWL axioms for bfo:Process subclasses. The tables support cross-table joins that answer multi-hop queries over verification, artifact use, classification, and audit instances drawn from examination registration workflows.

## 1 Table Definitions and Axiom Mapping

### 1.1 t_process_with_min_one_artifact

This table embodies AXIOM 2 by recording every process declared as a subclass of bfo:0000015 that uses at least one cco:Artifact. Column id is the primary key; column x holds the process identifier.

| id | x |
| id | x |
| p001 | ExamFormIntake |
| p002 | CNICVerification |
| p003 | RegistrationAudit |
| p004 | RollNoAssignment |
| p005 | CandidateClassification |

### 1.2 t_verification_min_one_evidence

This table embodies AXIOM 1 by recording every verification process that produces at least one evidence individual. Column id is the primary key; column x names the verification process; column y is a foreign key referencing t_process_with_min_one_artifact.id.

| id | x | y |
| id | x | y |
| v001 | FormEvidenceCheck | p001 |
| v002 | IdentityEvidenceCheck | p002 |
| v003 | AuditEvidenceCheck | p003 |
| v004 | ClassificationEvidenceCheck | p005 |

### 1.3 t_classification_basic

This table embodies AXIOM 3 by recording every process declared simply as a subclass of bfo:0000015 whose role is classification. Column id is the primary key; column x holds the process identifier.

| id | x |
| id | x |
| c001 | DegreeClassification |
| c002 | ProgramClassification |
| c003 | SessionClassification |
| c004 | CollegeClassification |

### 1.4 t_audit_basic

This table embodies AXIOM 4 by recording every process declared simply as a subclass of bfo:0000015 whose role is audit. Column id is the primary key; column x holds the process identifier.

| id | x |
| id | x |
| a001 | RegistrationAudit |
| a002 | ComplianceAudit |
| a003 | EvidenceAudit |
| a004 | RollNoAudit |

## 2 Cross-Join Demonstration

To retrieve the evidence identifier, the verification process, and the artifact-using process that supplied the evidence, execute the equi-join on t_verification_min_one_evidence.y = t_process_with_min_one_artifact.id. The query

```
SELECT v.id, v.x, p.x
FROM t_verification_min_one_evidence v
JOIN t_process_with_min_one_artifact p ON v.y = p.id
WHERE p.x = 'ExamFormIntake';
```

returns the single row (v001, FormEvidenceCheck, ExamFormIntake). Extending the join to t_audit_basic on shared process names yields the further linkage (v003, AuditEvidenceCheck, RegistrationAudit, a001).

```json
{"tables": [{"name": "t_process_with_min_one_artifact", "rows": [["p001", "ExamFormIntake"], ["p002", "CNICVerification"], ["p003", "RegistrationAudit"], ["p004", "RollNoAssignment"], ["p005", "CandidateClassification"]]}, {"name": "t_verification_min_one_evidence", "rows": [["v001", "FormEvidenceCheck", "p001"], ["v002", "IdentityEvidenceCheck", "p002"], ["v003", "AuditEvidenceCheck", "p003"], ["v004", "ClassificationEvidenceCheck", "p005"]]}, {"name": "t_classification_basic", "rows": [["c001", "DegreeClassification"], ["c002", "ProgramClassification"], ["c003", "SessionClassification"], ["c004", "CollegeClassification"]]}, {"name": "t_audit_basic", "rows": [["a001", "RegistrationAudit"], ["a002", "ComplianceAudit"], ["a003", "EvidenceAudit"], ["a004", "RollNoAudit"]]}]}
```