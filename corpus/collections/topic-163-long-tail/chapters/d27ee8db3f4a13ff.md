---
chapter_id: d27ee8db3f4a13ff
topic_id: 163
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'gdpr_lawful_basis', 'attestation_signed_by', 'verification_produces_evidence', 'audit_conducted_by']
model: xai/grok-4.3
---

# Chapter 4. Directive Governance in Regulatory Attestation Systems

This chapter presents five relational tables that instantiate the axioms attestation_with_supporting_evidence, gdpr_lawful_basis, attestation_signed_by, verification_produces_evidence and audit_conducted_by. The tables record the production, signing and verification of attestations that assert lawful bases under GDPR, together with the personnel responsible for conducting the associated audits. All column values are instances of the slot types declared in the axioms; foreign-key references permit cross-table traversal that answers multi-hop queries about evidence chains.

## 1. Table t_attestation_with_supporting_evidence

The table embodies axiom 1 by recording each attestation process (column x) together with the lawful-basis assertion that supplies its supporting evidence (column y). Column id is the primary key. Column y is a foreign key that references t_gdpr_lawful_basis.id, establishing the directed evidence link required by the axiom.

| id | x | y |
| id | x | y |
| att-001 | Attestation_Processing_Activity_42 | lba-003 |
| att-002 | Attestation_Processing_Activity_43 | lba-001 |
| att-003 | Attestation_Processing_Activity_44 | lba-002 |
| att-004 | Attestation_Processing_Activity_45 | lba-004 |

## 1.1 Table t_gdpr_lawful_basis

The table embodies axiom 2 by associating each directive instance (column x) with the attestation that supplies its lawful basis (column y). Column id is the primary key. Column y is a foreign key that references t_attestation_with_supporting_evidence.id, closing the mutual reference required by the paired axioms.

| id | x | y |
| id | x | y |
| lba-001 | Consent_Article_6_1_a | att-002 |
| lba-002 | Contract_Article_6_1_b | att-003 |
| lba-003 | Legal_Obligation_Article_6_1_c | att-001 |
| lba-004 | Legitimate_Interest_Article_6_1_f | att-004 |

## 1.2 Table t_attestation_signed_by

The table embodies axiom 3 by recording the signing of each attestation process by a responsible person. Column id is the primary key; column x stores the attestation identifier. No foreign key is declared because the axiom specifies only the existential restriction to cco:Person.

| id | x |
| id | x |
| sig-001 | att-001 |
| sig-002 | att-002 |
| sig-003 | att-003 |
| sig-004 | att-004 |

## 1.3 Table t_verification_produces_evidence

The table embodies axiom 4 by recording each verification process (column x) and the lawful-basis assertion it produces as evidence (column y). Column id is the primary key. Column y is a foreign key that references t_gdpr_lawful_basis.id.

| id | x | y |
| id | x | y |
| ver-001 | Verification_Audit_Step_7 | lba-001 |
| ver-002 | Verification_Audit_Step_8 | lba-003 |
| ver-003 | Verification_Audit_Step_9 | lba-002 |
| ver-004 | Verification_Audit_Step_10 | lba-004 |

## 1.4 Table t_audit_conducted_by

The table embodies axiom 5 by recording the person who conducted each audit process. Column id is the primary key; column x stores the audit-process identifier. No foreign key is declared because the axiom specifies only the existential restriction to cco:Person.

| id | x |
| id | x |
| aud-001 | Audit_Annual_GDPR_2024 |
| aud-002 | Audit_Annual_GDPR_2024 |
| aud-003 | Audit_Special_Processing_42 |
| aud-004 | Audit_Special_Processing_43 |

## 2. Cross-join demonstration

To determine the person who signed the attestation supporting the lawful basis verified by verification step ver-002, traverse the following path: start at t_verification_produces_evidence (ver-002 → lba-003), follow the foreign key in t_gdpr_lawful_basis (lba-003 → att-001), then locate the matching row in t_attestation_signed_by (att-001 → sig-001). The joined result is the single row (ver-002, lba-003, att-001, sig-001).

```json
{"tables": [{"name": "t_attestation_with_supporting_evidence", "rows": [["att-001", "Attestation_Processing_Activity_42", "lba-003"], ["att-002", "Attestation_Processing_Activity_43", "lba-001"], ["att-003", "Attestation_Processing_Activity_44", "lba-002"], ["att-004", "Attestation_Processing_Activity_45", "lba-004"]]}, {"name": "t_gdpr_lawful_basis", "rows": [["lba-001", "Consent_Article_6_1_a", "att-002"], ["lba-002", "Contract_Article_6_1_b", "att-003"], ["lba-003", "Legal_Obligation_Article_6_1_c", "att-001"], ["lba-004", "Legitimate_Interest_Article_6_1_f", "att-004"]]}, {"name": "t_attestation_signed_by", "rows": [["sig-001", "att-001"], ["sig-002", "att-002"], ["sig-003", "att-003"], ["sig-004", "att-004"]]}, {"name": "t_verification_produces_evidence", "rows": [["ver-001", "Verification_Audit_Step_7", "lba-001"], ["ver-002", "Verification_Audit_Step_8", "lba-003"], ["ver-003", "Verification_Audit_Step_9", "lba-002"], ["ver-004", "Verification_Audit_Step_10", "lba-004"]]}, {"name": "t_audit_conducted_by", "rows": [["aud-001", "Audit_Annual_GDPR_2024"], ["aud-002", "Audit_Annual_GDPR_2024"], ["aud-003", "Audit_Special_Processing_42"], ["aud-004", "Audit_Special_Processing_43"]]}]}
```