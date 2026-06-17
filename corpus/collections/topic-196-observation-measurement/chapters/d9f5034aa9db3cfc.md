---
chapter_id: d9f5034aa9db3cfc
topic_id: 196
family: 03_directive_governance
cited_terms: ['control_only_addresses_threat_class', 'audit_conducted_by', 'control_addresses_risk', 'attestation_with_supporting_evidence', 'requirement_has_priority']
model: xai/grok-4.3
---

# Chapter 7: Directive Governance Constraints in Compliance Audit Schemas

This chapter defines five relational tables that encode OWL axioms for directive governance. The tables capture controls, audits, attestations, and requirements, with column values serving as entity references that support foreign-key joins across the schema.

## 1 Table Definitions and Axiom Mappings

### 1.1 Control-Only Addresses Threat Class
Table t_control_only_addresses_threat_class embodies axiom 1, restricting a DirectiveICE instance to address a single risk class. Column id is the primary key; columns x and y are entity references with no enforced foreign key in this table but usable for joins to control and risk identifiers.

| id | x | y |
| --- | --- | --- |
| c1 | Control_Infra_01 | Risk_Flood |
| c2 | Control_Infra_02 | Risk_Seismic |
| c3 | Control_Infra_03 | Risk_Corrosion |
| c4 | Control_Infra_04 | Risk_Flood |

### 1.2 Audit Conducted By
Table t_audit_conducted_by embodies axiom 2, linking a Process instance to a conducting Person. Column id is the primary key; column x references an audit identifier.

| id | x |
| --- | --- |
| a1 | Audit_ENCA_2023 |
| a2 | Audit_ENCA_2024 |

### 1.3 Control Addresses Risk
Table t_control_addresses_risk embodies axiom 3, allowing a DirectiveICE instance to address one or more risk classes. Column id is the primary key; column x references a control; column y is a non-null foreign key reference to a risk identifier.

| id | x | y |
| --- | --- | --- |
| cr1 | Control_Infra_01 | Risk_Flood |
| cr2 | Control_Infra_02 | Risk_Seismic |
| cr3 | Control_Infra_03 | Risk_Corrosion |
| cr4 | Control_Infra_01 | Risk_Seismic |

### 1.4 Attestation With Supporting Evidence
Table t_attestation_with_supporting_evidence embodies axiom 4, associating a Process instance with supporting evidence. Column id is the primary key; column x references an attestation; column y is a non-null foreign key reference to an evidence identifier.

| id | x | y |
| --- | --- | --- |
| e1 | Attestation_Report_01 | Evidence_PhotoSet_A |
| e2 | Attestation_Report_02 | Evidence_InspectionLog_B |
| e3 | Attestation_Report_01 | Evidence_SensorData_C |

### 1.5 Requirement Has Priority
Table t_requirement_has_priority embodies axiom 5, assigning a priority class to a DirectiveICE instance. Column id is the primary key; column x references a requirement; column y is a non-null foreign key reference to a priority identifier.

| id | x | y |
| --- | --- | --- |
| rp1 | Requirement_Env_01 | Priority_High |
| rp2 | Requirement_Safety_02 | Priority_Medium |
| rp3 | Requirement_Infra_03 | Priority_High |

## 2 Cross-Join Demonstration

To retrieve the risk addressed by Control_Infra_01 together with its priority, join t_control_addresses_risk on x to t_requirement_has_priority on x where the control identifier matches a requirement identifier. The join yields:

- Control_Infra_01 addresses Risk_Flood (from t_control_addresses_risk row cr1) and carries Priority_High (from t_requirement_has_priority row rp1).

```json
{"tables": [{"name": "t_control_only_addresses_threat_class", "rows": [["c1", "Control_Infra_01", "Risk_Flood"], ["c2", "Control_Infra_02", "Risk_Seismic"], ["c3", "Control_Infra_03", "Risk_Corrosion"], ["c4", "Control_Infra_04", "Risk_Flood"]]}, {"name": "t_audit_conducted_by", "rows": [["a1", "Audit_ENCA_2023"], ["a2", "Audit_ENCA_2024"]]}, {"name": "t_control_addresses_risk", "rows": [["cr1", "Control_Infra_01", "Risk_Flood"], ["cr2", "Control_Infra_02", "Risk_Seismic"], ["cr3", "Control_Infra_03", "Risk_Corrosion"], ["cr4", "Control_Infra_01", "Risk_Seismic"]]}, {"name": "t_attestation_with_supporting_evidence", "rows": [["e1", "Attestation_Report_01", "Evidence_PhotoSet_A"], ["e2", "Attestation_Report_02", "Evidence_InspectionLog_B"], ["e3", "Attestation_Report_01", "Evidence_SensorData_C"]]}, {"name": "t_requirement_has_priority", "rows": [["rp1", "Requirement_Env_01", "Priority_High"], ["rp2", "Requirement_Safety_02", "Priority_Medium"], ["rp3", "Requirement_Infra_03", "Priority_High"]]}]}
```