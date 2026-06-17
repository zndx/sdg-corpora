---
chapter_id: 487f8d4d0e9dbaea
topic_id: 107
family: 06_belief_structure
cited_terms: ['audit_produces_evidence', 'directive_authored_and_applies', 'evidence_basic', 'attestation_with_supporting_evidence', 'claim_min_one_evidence']
model: xai/grok-4.3
---

# Audit Evidence and Directive Management in Examination Processes

This chapter defines five relational tables that implement axioms for modeling directives, attestations, audits, and evidence within examination grievance and compliance workflows. The tables support cross-table joins that trace how a directive is authored, attested, audited, and claimed through supporting evidence.

## 1. Core Axioms and Schema Overview

The schema directly projects the five supplied OWL axioms into tables whose column types and foreign-key constraints preserve the original slot structures. Primary keys serve as stable identifiers for each class instance. Foreign keys enforce the existential restrictions expressed by the axioms, enabling queries that traverse from a claim to its required evidence or from an attestation to its supporting directive.

### 1.1 t_evidence_basic

This table embodies AXIOM 3 by recording every descriptive information content entity that functions as evidence. Column id is the primary key; column x stores the class reference.

| id | x |
|----|---|
| eb-001 | cco:DescriptiveICE |
| eb-002 | cco:DescriptiveICE |
| eb-003 | cco:DescriptiveICE |
| eb-004 | cco:DescriptiveICE |
| eb-005 | cco:DescriptiveICE |

### 1.2 t_audit_produces_evidence

This table embodies AXIOM 1 by capturing audit processes that produce descriptive evidence. Column id is the primary key; column x stores the audit class reference. A reader can join this table to t_claim_min_one_evidence on t_claim_min_one_evidence.y = t_audit_produces_evidence.id to retrieve every claim supported by a given audit.

| id | x |
|----|---|
| au-001 | bfo:0000015 |
| au-002 | bfo:0000015 |
| au-003 | bfo:0000015 |
| au-004 | bfo:0000015 |

### 1.3 t_directive_authored_and_applies

This table embodies AXIOM 2 by recording directives that are both authored by an attestation and apply to a target class. Column id is the primary key; column y is a foreign key referencing t_attestation_with_supporting_evidence.id; column z stores the target class. A reader can join on y to obtain the authoring attestation for any directive.

| id | x | y | z |
|----|---|---|---|
| di-001 | cco:DirectiveICE | at-001 | Post:CBRTGrievance |
| di-002 | cco:DirectiveICE | at-002 | Post:CBRTGrievance |
| di-003 | cco:DirectiveICE | at-003 | Post:CBRTGrievance |
| di-004 | cco:DirectiveICE | at-004 | Post:CBRTGrievance |

### 1.4 t_attestation_with_supporting_evidence

This table embodies AXIOM 4 by recording processes that carry supporting evidence. Column id is the primary key; column y is a foreign key referencing t_directive_authored_and_applies.id. A reader can join on y to retrieve the directive attested by each attestation instance.

| id | x | y |
|----|---|---|
| at-001 | bfo:0000015 | di-001 |
| at-002 | bfo:0000015 | di-002 |
| at-003 | bfo:0000015 | di-003 |
| at-004 | bfo:0000015 | di-004 |

### 1.5 t_claim_min_one_evidence

This table embodies AXIOM 5 by recording descriptive claims that must be supported by at least one audit-produced evidence item. Column id is the primary key; column y is a foreign key referencing t_audit_produces_evidence.id. A reader can join on y to list every claim backed by a particular audit.

| id | x | y |
|----|---|---|
| cl-001 | cco:DescriptiveICE | au-001 |
| cl-002 | cco:DescriptiveICE | au-002 |
| cl-003 | cco:DescriptiveICE | au-003 |
| cl-004 | cco:DescriptiveICE | au-001 |
| cl-005 | cco:DescriptiveICE | au-004 |

## 2. Cross-Join Example

To determine the directive that authorizes the claim cl-001, first locate the audit referenced by cl-001.y (au-001). Next locate every directive whose attestation y value participates in an attestation that produced evidence linked to au-001. The join path t_claim_min_one_evidence → t_audit_produces_evidence → t_attestation_with_supporting_evidence → t_directive_authored_and_applies yields directive di-001.

```json
{"tables": [{"name": "t_evidence_basic", "rows": [["eb-001", "cco:DescriptiveICE"], ["eb-002", "cco:DescriptiveICE"], ["eb-003", "cco:DescriptiveICE"], ["eb-004", "cco:DescriptiveICE"], ["eb-005", "cco:DescriptiveICE"]]}, {"name": "t_audit_produces_evidence", "rows": [["au-001", "bfo:0000015"], ["au-002", "bfo:0000015"], ["au-003", "bfo:0000015"], ["au-004", "bfo:0000015"]]}, {"name": "t_directive_authored_and_applies", "rows": [["di-001", "cco:DirectiveICE", "at-001", "Post:CBRTGrievance"], ["di-002", "cco:DirectiveICE", "at-002", "Post:CBRTGrievance"], ["di-003", "cco:DirectiveICE", "at-003", "Post:CBRTGrievance"], ["di-004", "cco:DirectiveICE", "at-004", "Post:CBRTGrievance"]]}, {"name": "t_attestation_with_supporting_evidence", "rows": [["at-001", "bfo:0000015", "di-001"], ["at-002", "bfo:0000015", "di-002"], ["at-003", "bfo:0000015", "di-003"], ["at-004", "bfo:0000015", "di-004"]]}, {"name": "t_claim_min_one_evidence", "rows": [["cl-001", "cco:DescriptiveICE", "au-001"], ["cl-002", "cco:DescriptiveICE", "au-002"], ["cl-003", "cco:DescriptiveICE", "au-003"], ["cl-004", "cco:DescriptiveICE", "au-001"], ["cl-005", "cco:DescriptiveICE", "au-004"]]}]}
```