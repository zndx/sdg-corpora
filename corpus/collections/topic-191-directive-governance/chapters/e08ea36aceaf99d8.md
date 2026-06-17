---
chapter_id: e08ea36aceaf99d8
topic_id: 191
family: 03_directive_governance
cited_terms: ['attestation_with_supporting_evidence', 'control_with_evidence_requirement', 'requirement_equiv_specifies_target', 'verification_produces_evidence', 'control_only_addresses_threat_class']
model: xai/grok-4.3
---

# Directive Governance in Audit Trail Systems

This chapter defines five relational tables that implement the core axioms of directive governance. The tables capture how controls require and produce evidence, how requirements specify targets, and how attestations and verifications link processes to supporting artifacts. All column values are drawn from instances of the classes named in the axioms; primary keys serve as stable identifiers for cross-table navigation.

## 1 Table Definitions and Axiom Embodiment

### 1.1 t_attestation_with_supporting_evidence
This table embodies AXIOM 1 by recording processes (x) that stand in the relation “with supporting evidence” to an artifact (y). Column id is the primary key; column y functions as a foreign-key reference to evidence instances that may be joined from t_verification_produces_evidence.

| id | x | y |
| id | x | y |
| att-001 | BCC_Financial_Procedures_Review | Annual_Financial_Report_2024 |
| att-002 | Safeguarding_Audit_2025 | BSCP_Prevent_Strategy_Log |
| att-003 | Nursery_Federation_Compliance_Check | Jakeman_Inspection_Record |
| att-004 | Energuide_Verification_Process | Windsor_Park_Energuide_Certificate |
| att-005 | Policy_Remission_Attestation | Birmingham_City_Council_FPM_Excerpt |

### 1.2 t_control_with_evidence_requirement
This table embodies AXIOM 2 by capturing directives (x) that require evidence (y). Column id is the primary key; y references the same evidence instances used in t_attestation_with_supporting_evidence, enabling a direct join on evidence identity.

| id | x | y |
| id | x | y |
| ctl-001 | BCC_Financial_Procedures_Control | Annual_Financial_Report_2024 |
| ctl-002 | BSCP_Safeguarding_Control | BSCP_Prevent_Strategy_Log |
| ctl-003 | Federation_Admissions_Control | Jakeman_Inspection_Record |
| ctl-004 | Net_Zero_Performance_Control | Windsor_Park_Energuide_Certificate |
| ctl-005 | Remissions_Policy_Control | Birmingham_City_Council_FPM_Excerpt |
| ctl-006 | Parking_Regulation_Control | Street_Parking_Audit_2020 |

### 1.3 t_requirement_equiv_specifies_target
This table embodies AXIOM 3 by recording directives (x) that both specify an artifact (y) and apply to a subject (z). Column id is the primary key; y and z are foreign-key references that can be joined to evidence and subject identifiers appearing in the other tables.

| id | x | y | z |
| id | x | y | z |
| req-001 | Financial_Remission_Requirement | Birmingham_City_Council_FPM_Excerpt | Gracelands_Nursery_School |
| req-002 | Prevent_Strategy_Requirement | BSCP_Prevent_Strategy_Log | Jakeman_Nursery_School |
| req-003 | Density_Increase_Requirement | Windsor_Park_Energuide_Certificate | De_Waal_Developments |
| req-004 | Article9_Citation_Requirement | University_of_Baltimore_Law_Forum_Vol50 | Pacheco_v_State |
| req-005 | Tour_Host_Requirement | Street_Parking_Audit_2020 | Windsor_Park_NZE_Home |

### 1.4 t_verification_produces_evidence
This table embodies AXIOM 4 by recording verification processes (x) that produce evidence (y). Column id is the primary key; y again serves as the join key to evidence instances referenced by t_attestation_with_supporting_evidence and t_control_with_evidence_requirement.

| id | x | y |
| id | x | y |
| ver-001 | External_Auditor_Review | Annual_Financial_Report_2024 |
| ver-002 | BSCP_Inspection | BSCP_Prevent_Strategy_Log |
| ver-003 | Ofsted_Style_Inspection | Jakeman_Inspection_Record |
| ver-004 | Energuide_Rating_Audit | Windsor_Park_Energuide_Certificate |
| ver-005 | Law_Review_Verification | University_of_Baltimore_Law_Forum_Vol50 |

### 1.5 t_control_only_addresses_threat_class
This table embodies AXIOM 5 by recording directives (x) whose risk-addressing scope is restricted to a single threat class (y). Column id is the primary key; y references threat classes that may be joined to risk registers maintained outside these tables.

| id | x | y |
| id | x | y |
| cta-001 | BCC_Financial_Procedures_Control | Financial_Misreporting |
| cta-002 | BSCP_Safeguarding_Control | Child_Safety_Breach |
| cta-003 | Federation_Admissions_Control | Unauthorized_Enrollment |
| cta-004 | Net_Zero_Performance_Control | Energy_Performance_Gap |
| cta-005 | Remissions_Policy_Control | Incorrect_Fee_Waiver |

## 2 Cross-Join Demonstration

To determine which verification process produced the evidence required by the control that addresses Financial_Misreporting, join t_control_only_addresses_threat_class to t_control_with_evidence_requirement on x, then to t_verification_produces_evidence on y:

- Row from t_control_only_addresses_threat_class (cta-001) supplies x = BCC_Financial_Procedures_Control and y = Financial_Misreporting.
- Join on x yields row ctl-001 from t_control_with_evidence_requirement, supplying y = Annual_Financial_Report_2024.
- Join on y yields row ver-001 from t_verification_produces_evidence, supplying x = External_Auditor_Review.

The resulting joined tuple is therefore (External_Auditor_Review, Annual_Financial_Report_2024, BCC_Financial_Procedures_Control, Financial_Misreporting).

```json
{"tables": [{"name": "t_attestation_with_supporting_evidence", "rows": [["att-001", "BCC_Financial_Procedures_Review", "Annual_Financial_Report_2024"], ["att-002", "Safeguarding_Audit_2025", "BSCP_Prevent_Strategy_Log"], ["att-003", "Nursery_Federation_Compliance_Check", "Jakeman_Inspection_Record"], ["att-004", "Energuide_Verification_Process", "Windsor_Park_Energuide_Certificate"], ["att-005", "Policy_Remission_Attestation", "Birmingham_City_Council_FPM_Excerpt"]]}, {"name": "t_control_with_evidence_requirement", "rows": [["ctl-001", "BCC_Financial_Procedures_Control", "Annual_Financial_Report_2024"], ["ctl-002", "BSCP_Safeguarding_Control", "BSCP_Prevent_Strategy_Log"], ["ctl-003", "Federation_Admissions_Control", "Jakeman_Inspection_Record"], ["ctl-004", "Net_Zero_Performance_Control", "Windsor_Park_Energuide_Certificate"], ["ctl-005", "Remissions_Policy_Control", "Birmingham_City_Council_FPM_Excerpt"], ["ctl-006", "Parking_Regulation_Control", "Street_Parking_Audit_2020"]]}, {"name": "t_requirement_equiv_specifies_target", "rows": [["req-001", "Financial_Remission_Requirement", "Birmingham_City_Council_FPM_Excerpt", "Gracelands_Nursery_School"], ["req-002", "Prevent_Strategy_Requirement", "BSCP_Prevent_Strategy_Log", "Jakeman_Nursery_School"], ["req-003", "Density_Increase_Requirement", "Windsor_Park_Energuide_Certificate", "De_Waal_Developments"], ["req-004", "Article9_Citation_Requirement", "University_of_Baltimore_Law_Forum_Vol50", "Pacheco_v_State"], ["req-005", "Tour_Host_Requirement", "Street_Parking_Audit_2020", "Windsor_Park_NZE_Home"]]}, {"name": "t_verification_produces_evidence", "rows": [["ver-001", "External_Auditor_Review", "Annual_Financial_Report_2024"], ["ver-002", "BSCP_Inspection", "BSCP_Prevent_Strategy_Log"], ["ver-003", "Ofsted_Style_Inspection", "Jakeman_Inspection_Record"], ["ver-004", "Energuide_Rating_Audit", "Windsor_Park_Energuide_Certificate"], ["ver-005", "Law_Review_Verification", "University_of_Baltimore_Law_Forum_Vol50"]]}, {"name": "t_control_only_addresses_threat_class", "rows": [["cta-001", "BCC_Financial_Procedures_Control", "Financial_Misreporting"], ["cta-002", "BSCP_Safeguarding_Control", "Child_Safety_Breach"], ["cta-003", "Federation_Admissions_Control", "Unauthorized_Enrollment"], ["cta-004", "Net_Zero_Performance_Control", "Energy_Performance_Gap"], ["cta-005", "Remissions_Policy_Control", "Incorrect_Fee_Waiver"]]}]}
```