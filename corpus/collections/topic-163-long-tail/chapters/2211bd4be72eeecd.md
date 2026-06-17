---
chapter_id: 2211bd4be72eeecd
topic_id: 163
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'gdpr_lawful_basis', 'attestation_signed_by', 'verification_produces_evidence', 'audit_conducted_by']
model: xai/grok-4.3
---

# Chapter 12. Directive Governance in GDPR Compliance: Attestation, Verification, and Audit Trails

This chapter presents five relational tables that instantiate five OWL axioms governing directive processes. The tables encode attestations that carry supporting evidence and signatures, lawful bases that reference those attestations, verifications that produce evidence, and audits conducted by named persons. All column values are drawn from a single consistent instance set describing personal-data processing at a financial-services processor.

## 1. Scope and Table Overview

The schema supports multi-hop retrieval of compliance status. Primary keys are string identifiers; foreign keys enforce the slot restrictions declared in each axiom. Four to eight rows per table suffice to demonstrate joins across attestation, lawful-basis, verification, and audit entities.

### 1.1 Axiom-to-Table Mapping

Each table header below is preceded by the axiom it materializes and the primary-key/foreign-key semantics that realize the Manchester restrictions.

## 2. Attestation with Supporting Evidence

Axiom 1 states that an attestation process is something that with supporting evidence a GDPR lawful basis. The primary key id identifies each attestation instance; column y is a foreign key into t_gdpr_lawful_basis, ensuring every attestation is linked to exactly one declared lawful basis.

| id | x | y |
| id | x | y |
| att_001 | ConsentAttestation | lb_003 |
| att_002 | ContractAttestation | lb_001 |
| att_003 | LegalObligationAttestation | lb_002 |
| att_004 | LegitimateInterestAttestation | lb_004 |
| att_005 | VitalInterestAttestation | lb_005 |

## 3. GDPR Lawful Basis

Axiom 2 states that a processing activity is something that has lawful basis an attestation. The primary key id identifies each lawful-basis declaration; column y is a foreign key into t_attestation_with_supporting_evidence, closing the mutual reference required by the paired axioms.

| id | x | y |
| id | x | y |
| lb_001 | Article6_1_b | att_002 |
| lb_002 | Article6_1_c | att_003 |
| lb_003 | Article6_1_a | att_001 |
| lb_004 | Article6_1_f | att_004 |
| lb_005 | Article6_1_d | att_005 |

## 4. Attestation Signed By

Axiom 3 states that an attestation process is something that signed by person. The primary key id identifies each signed attestation; no foreign key is present because the person slot is realized as a literal value.

| id | x |
| id | x |
| att_001 | DPO-042 |
| att_002 | DPO-042 |
| att_003 | LegalCounsel-017 |
| att_004 | DPO-019 |
| att_005 | ComplianceOfficer-003 |

## 5. Verification Produces Evidence

Axiom 4 states that a verification process is something that produces evidence a GDPR lawful basis. The primary key id identifies each verification; column y is a foreign key into t_gdpr_lawful_basis, recording which lawful basis the verification output supports.

| id | x | y |
| id | x | y |
| ver_001 | AutomatedConsentCheck | lb_003 |
| ver_002 | ContractReview | lb_001 |
| ver_003 | StatutoryReview | lb_002 |
| ver_004 | InterestAssessment | lb_004 |
| ver_005 | MedicalNecessityCheck | lb_005 |

## 6. Audit Conducted By

Axiom 5 states that an audit process is something that conducted by person. The primary key id identifies each audit instance; the conducting person is stored as a literal value.

| id | x |
| id | x |
| aud_001 | ExternalAuditor-112 |
| aud_002 | ExternalAuditor-112 |
| aud_003 | Regulator-007 |
| aud_004 | InternalAudit-045 |
| aud_005 | ExternalAuditor-119 |

## 7. Cross-Join Demonstration

To retrieve the person who signed the attestation supporting the lawful basis verified by ver_001, join t_verification_produces_evidence to t_gdpr_lawful_basis on y = id, then to t_attestation_with_supporting_evidence on y = id, then to t_attestation_signed_by on id = id. The result row is:

ver_001 | AutomatedConsentCheck | lb_003 | Article6_1_a | att_001 | ConsentAttestation | DPO-042

The same path yields the conducting person of any audit that later references the same lawful basis, confirming end-to-end traceability from verification output through lawful basis to responsible signatory.

```json
{"tables": [{"name": "t_attestation_with_supporting_evidence", "rows": [["att_001", "ConsentAttestation", "lb_003"], ["att_002", "ContractAttestation", "lb_001"], ["att_003", "LegalObligationAttestation", "lb_002"], ["att_004", "LegitimateInterestAttestation", "lb_004"], ["att_005", "VitalInterestAttestation", "lb_005"]]}, {"name": "t_gdpr_lawful_basis", "rows": [["lb_001", "Article6_1_b", "att_002"], ["lb_002", "Article6_1_c", "att_003"], ["lb_003", "Article6_1_a", "att_001"], ["lb_004", "Article6_1_f", "att_004"], ["lb_005", "Article6_1_d", "att_005"]]}, {"name": "t_attestation_signed_by", "rows": [["att_001", "DPO-042"], ["att_002", "DPO-042"], ["att_003", "LegalCounsel-017"], ["att_004", "DPO-019"], ["att_005", "ComplianceOfficer-003"]]}, {"name": "t_verification_produces_evidence", "rows": [["ver_001", "AutomatedConsentCheck", "lb_003"], ["ver_002", "ContractReview", "lb_001"], ["ver_003", "StatutoryReview", "lb_002"], ["ver_004", "InterestAssessment", "lb_004"], ["ver_005", "MedicalNecessityCheck", "lb_005"]]}, {"name": "t_audit_conducted_by", "rows": [["aud_001", "ExternalAuditor-112"], ["aud_002", "ExternalAuditor-112"], ["aud_003", "Regulator-007"], ["aud_004", "InternalAudit-045"], ["aud_005", "ExternalAuditor-119"]]}]}
```