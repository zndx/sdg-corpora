---
chapter_id: 04abd1dc241c4ffc
topic_id: 176
family: 03_directive_governance
cited_terms: ['verification_min_one_evidence', 'verification_basic', 'audit_basic', 'attestation_min_one_signer']
model: xai/grok-4.3
---

# Chapter 12: Directive Governance Processes in Regulatory Compliance

This chapter defines four process classes drawn from the BFO process hierarchy and demonstrates their relational encoding in a compliance schema for public-utility water-production records. The schema supports multi-hop queries that traverse verification evidence, audit records, and attestation signatories while preserving the minimum-cardinality constraints stated in each axiom.

## 1 Ontological Grounding

All four classes are declared as subclasses of bfo:0000015 (process). Two of the classes carry additional existential restrictions: one requires at least one evidence artifact, the other requires at least one human signatory. The remaining two classes carry only the base process classification.

### 1.1 Verification Requiring Evidence

The class VerificationMinOneEvidence satisfies the axiom “Class: VerificationMinOneEvidence SubClassOf: bfo:0000015, sdg:producesEvidence min 1 EvidenceArtifact.” Its relational projection therefore stores both the process identifier and a mandatory foreign reference to an evidence artifact.

Table t_verification_min_one_evidence embodies the axiom above. Column id is the primary key. Column x holds the process class; column y is a foreign key that must resolve to an existing evidence artifact. A reader can answer “which verification produced a given evidence artifact” by joining on y.

| id | x | y |
| id | x | y |
| vme-001 | MonthlyWaterProductionVerification | ev-2023-031 |
| vme-002 | MonthlyWaterProductionVerification | ev-2023-032 |
| vme-003 | NonPotableWheeledVolumeVerification | ev-2023-033 |
| vme-004 | NonPotableWheeledVolumeVerification | ev-2023-034 |
| vme-005 | MonthlyWaterProductionVerification | ev-2023-035 |
| vme-006 | NonPotableWheeledVolumeVerification | ev-2023-036 |

### 1.2 Basic Verification

The class VerificationBasic satisfies only “Class: VerificationBasic SubClassOf: bfo:0000015.” Its table therefore contains no additional cardinality columns.

Table t_verification_basic embodies the axiom above. Column id is the primary key; column x records the process class. No foreign-key column is present because the axiom imposes no existential restriction.

| id | x |
| id | x |
| vb-001 | DailyMeterReadingVerification |
| vb-002 | DailyMeterReadingVerification |
| vb-003 | ReservoirLevelVerification |
| vb-004 | ReservoirLevelVerification |
| vb-005 | DailyMeterReadingVerification |
| vb-006 | ReservoirLevelVerification |

### 1.3 Basic Audit

The class AuditBasic likewise satisfies only the base process axiom.

Table t_audit_basic embodies the axiom. Column id is the primary key; column x records the process class. The table functions as an independent audit-event registry that downstream attestation records may reference.

| id | x |
| id | x |
| ab-001 | QuarterlyProductionAudit |
| ab-002 | QuarterlyProductionAudit |
| ab-003 | AnnualComplianceAudit |
| ab-004 | AnnualComplianceAudit |
| ab-005 | QuarterlyProductionAudit |
| ab-006 | AnnualComplianceAudit |

### 1.4 Attestation Requiring a Signatory

The class AttestationMinOneSigner satisfies “Class: AttestationMinOneSigner SubClassOf: bfo:0000015, sdg:signedBy min 1 cco:Person.”

Table t_attestation_min_one_signer embodies the axiom. Column id is the primary key; column x records the process class. Because the axiom requires a signer, any conforming row must be accompanied by a separate signer relation (omitted here for brevity) whose foreign key points back to id.

| id | x |
| id | x |
| ams-001 | MonthlyWaterReportAttestation |
| ams-002 | MonthlyWaterReportAttestation |
| ams-003 | QuarterlyProductionAttestation |
| ams-004 | QuarterlyProductionAttestation |
| ams-005 | MonthlyWaterReportAttestation |
| ams-006 | QuarterlyProductionAttestation |

## 2 Cross-Table Navigation Example

A compliance officer needs the evidence artifact that supported the verification step inside the attestation signed for the March 2023 water report. The path traverses three tables:

1. Start at t_attestation_min_one_signer row ams-001 (process = MonthlyWaterReportAttestation).
2. Locate the verification that produced the required evidence by joining t_verification_min_one_evidence.y to the evidence identifier referenced by the attestation workflow (ev-2023-031).
3. Confirm the verification class via t_verification_min_one_evidence.x.

The joined result row is:

- attestation_id = ams-001
- verification_id = vme-001
- evidence_id = ev-2023-031
- verification_class = MonthlyWaterProductionVerification

No additional rows satisfy the same three-table path for the March reporting period.

```json
{"tables": [{"name": "t_verification_min_one_evidence", "rows": [["vme-001", "MonthlyWaterProductionVerification", "ev-2023-031"], ["vme-002", "MonthlyWaterProductionVerification", "ev-2023-032"], ["vme-003", "NonPotableWheeledVolumeVerification", "ev-2023-033"], ["vme-004", "NonPotableWheeledVolumeVerification", "ev-2023-034"], ["vme-005", "MonthlyWaterProductionVerification", "ev-2023-035"], ["vme-006", "NonPotableWheeledVolumeVerification", "ev-2023-036"]]}, {"name": "t_verification_basic", "rows": [["vb-001", "DailyMeterReadingVerification"], ["vb-002", "DailyMeterReadingVerification"], ["vb-003", "ReservoirLevelVerification"], ["vb-004", "ReservoirLevelVerification"], ["vb-005", "DailyMeterReadingVerification"], ["vb-006", "ReservoirLevelVerification"]]}, {"name": "t_audit_basic", "rows": [["ab-001", "QuarterlyProductionAudit"], ["ab-002", "QuarterlyProductionAudit"], ["ab-003", "AnnualComplianceAudit"], ["ab-004", "AnnualComplianceAudit"], ["ab-005", "QuarterlyProductionAudit"], ["ab-006", "AnnualComplianceAudit"]]}, {"name": "t_attestation_min_one_signer", "rows": [["ams-001", "MonthlyWaterReportAttestation"], ["ams-002", "MonthlyWaterReportAttestation"], ["ams-003", "QuarterlyProductionAttestation"], ["ams-004", "QuarterlyProductionAttestation"], ["ams-005", "MonthlyWaterReportAttestation"], ["ams-006", "QuarterlyProductionAttestation"]]}]}
```