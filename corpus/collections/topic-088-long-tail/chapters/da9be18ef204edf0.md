---
chapter_id: da9be18ef204edf0
topic_id: 88
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'requirement_equiv_specifies_target', 'attestation_at_period', 'control_with_evidence_requirement', 'attestation_signed_by']
model: xai/grok-4.3
---

# Directive Governance in Institutional Compliance

This chapter introduces five core ontological patterns for modeling directive governance and attestation. The patterns are realized as a relational schema for audit and compliance records. The five tables support cross-table queries that trace requirements to controls, attestations, evidence, and signatories.

## 1 Scope and Schema Overview

The schema captures how directives are specified, how attestations are produced at defined periods, and how evidence and signatures are required. All tables share a common vocabulary of entity references that serve as join keys. Primary keys are the id columns; foreign-key relationships are formed by matching values in the x, y, and z columns to identifiers used elsewhere in the schema.

### 1.1 Table t_attestation_with_supporting_evidence

This table embodies AXIOM 1, recording an attestation process together with a supporting evidence class. Column id is the primary key. Column x references the attestation individual; column y is a foreign key to an evidence entity. A reader can join this table to t_control_with_evidence_requirement on y to retrieve the control that mandated the evidence.

| id | x | y |
| id | x | y |
| att-ev-001 | Attestation-2024-09 | Evidence-Enrollment |
| att-ev-002 | Attestation-2024-09 | Evidence-StaffCert |
| att-ev-003 | Attestation-2024-10 | Evidence-Facility |
| att-ev-004 | Attestation-2024-10 | Evidence-Financial |

### 1.2 Table t_requirement_equiv_specifies_target

This table embodies AXIOM 2, capturing a requirement directive that specifies a target class and applies to a subject class. Column id is the primary key. Columns y and z are foreign keys to the specified target and the subject of application. Joining on y to t_control_with_evidence_requirement links a requirement to the control that enforces it.

| id | x | y | z |
| id | x | y | z |
| req-001 | Requirement-Enrollment | Target-Record | Subject-Pupil |
| req-002 | Requirement-StaffCert | Target-Certificate | Subject-Employee |
| req-003 | Requirement-Facility | Target-Inspection | Subject-Premises |
| req-004 | Requirement-Financial | Target-Report | Subject-Bursary |

### 1.3 Table t_attestation_at_period

This table embodies AXIOM 3, associating an attestation process with its attestation period. Column id is the primary key. Column x references the attestation; column y is a foreign key to the period class. A cross-join with t_attestation_signed_by on x yields the signatory responsible for the attestation produced in that period.

| id | x | y |
| id | x | y |
| att-per-001 | Attestation-2024-09 | Period-September |
| att-per-002 | Attestation-2024-10 | Period-October |
| att-per-003 | Attestation-2024-11 | Period-November |
| att-per-004 | Attestation-2024-12 | Period-December |

### 1.4 Table t_control_with_evidence_requirement

This table embodies AXIOM 4, stating that a control requires a particular evidence class. Column id is the primary key. Column x references the control; column y is a foreign key to the required evidence. Joining on y to t_attestation_with_supporting_evidence recovers the attestation that supplied the mandated evidence.

| id | x | y |
| id | x | y |
| ctrl-001 | Control-Enrollment | Evidence-Enrollment |
| ctrl-002 | Control-StaffCert | Evidence-StaffCert |
| ctrl-003 | Control-Facility | Evidence-Facility |
| ctrl-004 | Control-Financial | Evidence-Financial |

### 1.5 Table t_attestation_signed_by

This table embodies AXIOM 5, recording the person who signed an attestation. Column id is the primary key. Column x references the attestation. A join on x to t_attestation_at_period produces the period and signatory for any given attestation.

| id | x |
| id | x |
| sig-001 | Attestation-2024-09 |
| sig-002 | Attestation-2024-10 |
| sig-003 | Attestation-2024-11 |
| sig-004 | Attestation-2024-12 |

## 2 Cross-Join Example

To answer the multi-hop question “Which person signed the attestation that supplied the evidence required by Control-Enrollment and that was produced in Period-September?”, perform the following joins:

1. Start in t_control_with_evidence_requirement where x = Control-Enrollment; obtain y = Evidence-Enrollment.
2. Move to t_attestation_with_supporting_evidence where y = Evidence-Enrollment; obtain x = Attestation-2024-09.
3. Move to t_attestation_at_period where x = Attestation-2024-09; confirm y = Period-September.
4. Move to t_attestation_signed_by where x = Attestation-2024-09; obtain the signatory reference.

The joined row is:

Attestation-2024-09, Period-September, Evidence-Enrollment, Control-Enrollment, sig-001

```json
{"tables":[{"name":"t_attestation_with_supporting_evidence","rows":[["att-ev-001","Attestation-2024-09","Evidence-Enrollment"],["att-ev-002","Attestation-2024-09","Evidence-StaffCert"],["att-ev-003","Attestation-2024-10","Evidence-Facility"],["att-ev-004","Attestation-2024-10","Evidence-Financial"]]},{"name":"t_requirement_equiv_specifies_target","rows":[["req-001","Requirement-Enrollment","Target-Record","Subject-Pupil"],["req-002","Requirement-StaffCert","Target-Certificate","Subject-Employee"],["req-003","Requirement-Facility","Target-Inspection","Subject-Premises"],["req-004","Requirement-Financial","Target-Report","Subject-Bursary"]]},{"name":"t_attestation_at_period","rows":[["att-per-001","Attestation-2024-09","Period-September"],["att-per-002","Attestation-2024-10","Period-October"],["att-per-003","Attestation-2024-11","Period-November"],["att-per-004","Attestation-2024-12","Period-December"]]},{"name":"t_control_with_evidence_requirement","rows":[["ctrl-001","Control-Enrollment","Evidence-Enrollment"],["ctrl-002","Control-StaffCert","Evidence-StaffCert"],["ctrl-003","Control-Facility","Evidence-Facility"],["ctrl-004","Control-Financial","Evidence-Financial"]]},{"name":"t_attestation_signed_by","rows":[["sig-001","Attestation-2024-09"],["sig-002","Attestation-2024-10"],["sig-003","Attestation-2024-11"],["sig-004","Attestation-2024-12"]]}]}
```