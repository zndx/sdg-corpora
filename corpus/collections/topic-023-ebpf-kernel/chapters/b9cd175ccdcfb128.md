---
chapter_id: b9cd175ccdcfb128
topic_id: 23
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'verification_produces_evidence', 'constraint_evaluated_during', 'control_with_evidence_requirement']
model: xai/grok-4.3
---

# Audit Governance in Research Process Oversight

This chapter defines four relational tables that instantiate directive governance patterns drawn from the supplied OWL axioms. The tables capture attestations, verifications, constraint evaluations, and evidence requirements within audit trails for research compliance at higher-education institutions. Primary keys are uniformly named `id`; foreign-key relationships exist between `y` values in one table and `x` or `id` values in another, enabling two- and three-hop joins that answer questions such as “which verification produced the evidence required by a given control evaluated during a stated process.”

## 1. Table t_attestation_with_supporting_evidence

This table embodies AXIOM 1 (`attestation_with_supporting_evidence`). Column `id` is the primary key. Column `x` references a bfo:Process subclass; column `y` is a foreign key to an evidence entity produced by a verification. A reader can join on `y` to retrieve the supporting evidence for any attestation.

| id | x | y |
| id | x | y |
| att-001 | AnnualResearchReport | doc-ethics-2023 |
| att-002 | LaboratorySafetyLog | doc-equip-cal-2023 |
| att-003 | StudentWelfareRecord | doc-kindness-log-2023 |
| att-004 | IndustrialProcessAudit | doc-decision-support-2023 |
| att-005 | EthicsProtocolReview | doc-idex-fiche-2023 |

## 1.1 Table t_verification_produces_evidence

This table embodies AXIOM 2 (`verification_produces_evidence`). Column `id` is the primary key. Column `x` references a verification process; column `y` is a foreign key to an evidence entity. Joining `y` to the `y` column of t_attestation_with_supporting_evidence yields the originating verification for any attested evidence item.

| id | x | y |
| id | x | y |
| ver-001 | EthicsCommitteeReview | doc-ethics-2023 |
| ver-002 | EquipmentCalibrationCheck | doc-equip-cal-2023 |
| ver-003 | DailyObservationLog | doc-kindness-log-2023 |
| ver-004 | DecisionModelValidation | doc-decision-support-2023 |
| ver-005 | IDEXApplicationScrutiny | doc-idex-fiche-2023 |
| ver-006 | SiteVisitInspection | doc-site-report-2023 |

## 1.2 Table t_constraint_evaluated_during

This table embodies AXIOM 3 (`constraint_evaluated_during`). Column `id` is the primary key. Column `x` references a cco:DirectiveICE; column `y` is a foreign key to a bfo:Process. A three-table join across this table, t_verification_produces_evidence, and t_attestation_with_supporting_evidence traces which constraint was evaluated inside the process that ultimately supported an attestation.

| id | x | y |
| id | x | y |
| con-001 | ResearchEthicsDirective | AnnualResearchReport |
| con-002 | EquipmentSafetyDirective | LaboratorySafetyLog |
| con-003 | StudentConductDirective | StudentWelfareRecord |
| con-004 | DataQualityDirective | IndustrialProcessAudit |
| con-005 | FundingEligibilityDirective | EthicsProtocolReview |

## 1.3 Table t_control_with_evidence_requirement

This table embodies AXIOM 4 (`control_with_evidence_requirement`). Column `id` is the primary key. Column `x` references a cco:DirectiveICE; column `y` is a foreign key to an evidence entity. Joining `y` to the `y` column of t_verification_produces_evidence identifies the verification step that satisfied each control’s evidence requirement.

| id | x | y |
| id | x | y |
| ctl-001 | ResearchEthicsDirective | doc-ethics-2023 |
| ctl-002 | EquipmentSafetyDirective | doc-equip-cal-2023 |
| ctl-003 | StudentConductDirective | doc-kindness-log-2023 |
| ctl-004 | DataQualityDirective | doc-decision-support-2023 |
| ctl-005 | FundingEligibilityDirective | doc-idex-fiche-2023 |
| ctl-006 | SiteAccessDirective | doc-site-report-2023 |

## 2. Cross-join example

Question: Which verification produced the evidence required by the control “ResearchEthicsDirective” that was evaluated during “AnnualResearchReport”?

Step 1. Locate the control row in t_control_with_evidence_requirement where `x = "ResearchEthicsDirective"` → `y = "doc-ethics-2023"`.  
Step 2. Locate the verification row in t_verification_produces_evidence where `y = "doc-ethics-2023"` → `x = "EthicsCommitteeReview"`.  
Step 3. Confirm via t_constraint_evaluated_during that `x = "ResearchEthicsDirective"` was evaluated during `y = "AnnualResearchReport"`.

Joined result row:  
(`ctl-001`, `ResearchEthicsDirective`, `doc-ethics-2023`)  
(`ver-001`, `EthicsCommitteeReview`, `doc-ethics-2023`)  
(`con-001`, `ResearchEthicsDirective`, `AnnualResearchReport`)

```json
{"tables": [{"name": "t_attestation_with_supporting_evidence", "rows": [["att-001", "AnnualResearchReport", "doc-ethics-2023"], ["att-002", "LaboratorySafetyLog", "doc-equip-cal-2023"], ["att-003", "StudentWelfareRecord", "doc-kindness-log-2023"], ["att-004", "IndustrialProcessAudit", "doc-decision-support-2023"], ["att-005", "EthicsProtocolReview", "doc-idex-fiche-2023"]]}, {"name": "t_verification_produces_evidence", "rows": [["ver-001", "EthicsCommitteeReview", "doc-ethics-2023"], ["ver-002", "EquipmentCalibrationCheck", "doc-equip-cal-2023"], ["ver-003", "DailyObservationLog", "doc-kindness-log-2023"], ["ver-004", "DecisionModelValidation", "doc-decision-support-2023"], ["ver-005", "IDEXApplicationScrutiny", "doc-idex-fiche-2023"], ["ver-006", "SiteVisitInspection", "doc-site-report-2023"]]}, {"name": "t_constraint_evaluated_during", "rows": [["con-001", "ResearchEthicsDirective", "AnnualResearchReport"], ["con-002", "EquipmentSafetyDirective", "LaboratorySafetyLog"], ["con-003", "StudentConductDirective", "StudentWelfareRecord"], ["con-004", "DataQualityDirective", "IndustrialProcessAudit"], ["con-005", "FundingEligibilityDirective", "EthicsProtocolReview"]]}, {"name": "t_control_with_evidence_requirement", "rows": [["ctl-001", "ResearchEthicsDirective", "doc-ethics-2023"], ["ctl-002", "EquipmentSafetyDirective", "doc-equip-cal-2023"], ["ctl-003", "StudentConductDirective", "doc-kindness-log-2023"], ["ctl-004", "DataQualityDirective", "doc-decision-support-2023"], ["ctl-005", "FundingEligibilityDirective", "doc-idex-fiche-2023"], ["ctl-006", "SiteAccessDirective", "doc-site-report-2023"]]}]}
```