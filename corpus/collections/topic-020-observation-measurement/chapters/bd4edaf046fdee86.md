---
chapter_id: bd4edaf046fdee86
topic_id: 20
family: 03_directive_governance
cited_terms: ['audit_conducted_by', 'requirement_equiv_specifies_target', 'policy_min_one_enforcer', 'attestation_with_supporting_evidence', 'audit_for_period']
model: xai/grok-4.3
---

# Chapter 4: Directive Governance Ontologies Projected to Audit Compliance Schemas

This chapter specifies five OWL axioms that formalize processes and directive information content entities within regulatory audit workflows. Each axiom is realized as a single relational table whose columns directly encode the axiom’s slot types. The resulting five-table schema supports primary-key identification of individuals and foreign-key traversal across conducted-by, specification, enforcement, evidence, and period relations.

## 1. Axiom-to-Table Mapping

### 1.1 t_audit_conducted_by
Axiom 1 classifies an audit process as conducted by a person. Column id is the primary key for each conducted-by assertion; column x references the audit individual. The table therefore supplies the foreign-key anchor for any subsequent join that must identify the responsible person.

| id | x |
|----|---------------------|
| acb-001 | Audit_Planning_2016 |
| acb-002 | Audit_AnimalWelfare_2018 |
| acb-003 | Audit_NIMBioS_2011 |
| acb-004 | Audit_Trace_Repository |
| acb-005 | Audit_Council_Chambers |

### 1.2 t_requirement_equiv_specifies_target
Axiom 2 states that a requirement is equivalent to a directive that specifies one class and applies to another. Column id is the primary key; columns y and z are foreign keys to the specified and target classes respectively, enabling two-hop navigation from requirement to both its content and its scope.

| id | x | y | z |
|----|-----------------------------|-----------------------------|-----------------------------|
| req-001 | Req_Wheelchair_Access | Spec_Physical_Access | Target_Council_Chambers |
| req-002 | Req_Research_Protocol | Spec_Data_Integrity | Target_Conference_Records |
| req-003 | Req_Animal_Procedure | Spec_Veterinary_Review | Target_Laboratory_Samples |
| req-004 | Req_Trace_Deposit | Spec_Metadata_Completeness | Target_Undergraduate_Abstracts |
| req-005 | Req_Minutes_Publication | Spec_Timeliness | Target_Planning_Commission |

### 1.3 t_policy_min_one_enforcer
Axiom 3 requires every policy to be enforced by at least one agent. Column id is the primary key; column x identifies the policy and column y is a foreign key to the enforcing individual or role.

| id | x | y |
|----|-----------------------------|---------------------|
| pol-001 | Policy_AnimalWelfare_2018 | Patsy_Reddy |
| pol-002 | Policy_Research_Exchange | NIMBioS_Director |
| pol-003 | Policy_City_Hall_Access | Carla_Hansen |
| pol-004 | Policy_Abstract_Archiving | TRACE_Curator |
| pol-005 | Policy_Minutes_Approval | Planning_Chair |

### 1.4 t_attestation_with_supporting_evidence
Axiom 4 classifies an attestation process as one that carries supporting evidence. Column id is the primary key; column x references the attestation and column y is a foreign key to the evidence individual.

| id | x | y |
|----|-----------------------------|-----------------------------|
| att-001 | Attest_Access_Compliance | Evidence_Photo_Ramp |
| att-002 | Attest_Protocol_Adherence | Evidence_Vet_Report_2018 |
| att-003 | Attest_Conference_Integrity | Evidence_Registration_List |
| att-004 | Attest_Repository_Deposit | Evidence_DOI_Record |
| att-005 | Attest_Minutes_Accuracy | Evidence_Audio_Recording |

### 1.5 t_audit_for_period
Axiom 5 asserts that an audit process is defined for a specific audit period. Column id is the primary key; column x references the audit and column y is a foreign key to the period individual.

| id | x | y |
|----|-----------------------------|---------------------|
| afp-001 | Audit_Planning_2016 | Period_June_2016 |
| afp-002 | Audit_AnimalWelfare_2018 | Period_March_2018 |
| afp-003 | Audit_NIMBioS_2011 | Period_2011 |
| afp-004 | Audit_Trace_Repository | Period_August_2020 |
| afp-005 | Audit_Council_Chambers | Period_2016 |

## 2. Multi-Hop Query Example

To determine the evidence supporting the attestation linked to the audit conducted by Carla Hansen for the June 2016 period, first locate the audit identifier in t_audit_conducted_by where the person value matches the target, then follow the shared audit identifier into t_audit_for_period to confirm the period, then traverse t_attestation_with_supporting_evidence using the same audit identifier to retrieve the evidence foreign key. The joined result row is:

Audit_Planning_2016 | Carla_Hansen | Period_June_2016 | Attest_Access_Compliance | Evidence_Photo_Ramp

```json
{"tables": [{"name": "t_audit_conducted_by", "rows": [["acb-001", "Audit_Planning_2016"], ["acb-002", "Audit_AnimalWelfare_2018"], ["acb-003", "Audit_NIMBioS_2011"], ["acb-004", "Audit_Trace_Repository"], ["acb-005", "Audit_Council_Chambers"]]}, {"name": "t_requirement_equiv_specifies_target", "rows": [["req-001", "Req_Wheelchair_Access", "Spec_Physical_Access", "Target_Council_Chambers"], ["req-002", "Req_Research_Protocol", "Spec_Data_Integrity", "Target_Conference_Records"], ["req-003", "Req_Animal_Procedure", "Spec_Veterinary_Review", "Target_Laboratory_Samples"], ["req-004", "Req_Trace_Deposit", "Spec_Metadata_Completeness", "Target_Undergraduate_Abstracts"], ["req-005", "Req_Minutes_Publication", "Spec_Timeliness", "Target_Planning_Commission"]]}, {"name": "t_policy_min_one_enforcer", "rows": [["pol-001", "Policy_AnimalWelfare_2018", "Patsy_Reddy"], ["pol-002", "Policy_Research_Exchange", "NIMBioS_Director"], ["pol-003", "Policy_City_Hall_Access", "Carla_Hansen"], ["pol-004", "Policy_Abstract_Archiving", "TRACE_Curator"], ["pol-005", "Policy_Minutes_Approval", "Planning_Chair"]]}, {"name": "t_attestation_with_supporting_evidence", "rows": [["att-001", "Attest_Access_Compliance", "Evidence_Photo_Ramp"], ["att-002", "Attest_Protocol_Adherence", "Evidence_Vet_Report_2018"], ["att-003", "Attest_Conference_Integrity", "Evidence_Registration_List"], ["att-004", "Attest_Repository_Deposit", "Evidence_DOI_Record"], ["att-005", "Attest_Minutes_Accuracy", "Evidence_Audio_Recording"]]}, {"name": "t_audit_for_period", "rows": [["afp-001", "Audit_Planning_2016", "Period_June_2016"], ["afp-002", "Audit_AnimalWelfare_2018", "Period_March_2018"], ["afp-003", "Audit_NIMBioS_2011", "Period_2011"], ["afp-004", "Audit_Trace_Repository", "Period_August_2020"], ["afp-005", "Audit_Council_Chambers", "Period_2016"]]}]}
```