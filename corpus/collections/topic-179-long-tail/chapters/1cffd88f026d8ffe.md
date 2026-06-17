---
chapter_id: 1cffd88f026d8ffe
topic_id: 179
family: 03_directive_governance
cited_terms: ['audit_for_period', 'dataset_under_audit', 'audit_conducted_by', 'audit_subclass']
model: xai/grok-4.3
---

# Chapter 4: Relational Representations of Audit Processes for Datasets

This chapter defines four ontological templates that classify audit processes according to their temporal scope, target artifacts, responsible agents, and control objectives. The templates are realized as a fixed relational schema comprising four tables. Primary and foreign keys enforce the subclass and existential restrictions stated in the source axioms, permitting deterministic cross-table navigation for compliance queries.

## 1 Ontological Templates and Schema Projection

The four templates are drawn directly from the supplied Manchester axioms. Each template is projected to one table whose column structure mirrors the slot types (Class or Individual references). The resulting schema supports only the joins licensed by the foreign-key declarations; no additional columns or constraints are introduced.

### 1.1 t_dataset_under_audit

Axiom 2 states that any instance of the class filling slot X is a cco:Artifact that stands in the sdg:underAudit relation to an audit process. The table therefore stores only the identity of the artifact and its textual label. Column id is the primary key; column x records the class or individual name.

```sql
CREATE TABLE t_dataset_under_audit (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

Example rows:

| id       | x                          |
|----------|----------------------------|
| ds_001   | Q2_Financial_Records       |
| ds_002   | Vendor_Compliance_Archive  |
| ds_003   | Payroll_Master_File        |
| ds_004   | Regulatory_Submission_2024 |

### 1.2 t_audit_for_period

Axiom 1 asserts that an audit process (slot X) is existentially restricted to a particular audit period (slot Y). The table therefore carries a mandatory foreign key y referencing t_dataset_under_audit.id. Column id is the primary key.

```sql
CREATE TABLE t_audit_for_period (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_dataset_under_audit(id)
);
```

Example rows:

| id        | x                    | y      |
|-----------|----------------------|--------|
| afp_001   | Q2_2024_Audit        | ds_001 |
| afp_002   | Annual_Vendor_Review | ds_002 |
| afp_003   | Payroll_Compliance   | ds_003 |
| afp_004   | Regulatory_Filing    | ds_004 |

### 1.3 t_audit_conducted_by

Axiom 3 restricts an audit process to a conducting person. The table records only the process identity and its label; linkage to a specific person is maintained outside the present schema through external role assignments.

```sql
CREATE TABLE t_audit_conducted_by (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

Example rows:

| id       | x                          |
|----------|----------------------------|
| acb_001  | Internal_Audit_Team        |
| acb_002  | External_Auditor_Firm      |
| acb_003  | Regulatory_Inspector       |
| acb_004  | Compliance_Officer         |

### 1.4 t_audit_subclass

Axiom 4 classifies an audit process according to the directive or control it examines. The table stores the process identity and the control label.

```sql
CREATE TABLE t_audit_subclass (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

Example rows:

| id       | x                              |
|----------|--------------------------------|
| as_001   | SOX_Control_Assessment         |
| as_002   | GDPR_Data_Retention_Check      |
| as_003   | Payroll_Tax_Compliance         |
| as_004   | SEC_Filing_Accuracy_Review     |

## 2 Cross-Table Navigation

Because only t_audit_for_period carries a foreign key, navigation proceeds by first resolving the dataset identity, then retrieving the associated period record. Further classification is obtained by matching process identifiers across the remaining tables on the shared x values when those values denote the same audit instance.

### 2.1 Worked Multi-Hop Query

Question: Which control directive was examined during the audit of dataset ds_001 that was conducted in period afp_001?

Resolution path:  
1. Locate afp_001 in t_audit_for_period → y = ds_001 confirms the dataset.  
2. The process label “Q2_2024_Audit” is matched in t_audit_subclass where x = “SOX_Control_Assessment”.  

Joined result row:

| afp_id  | dataset_id | control_directive          |
|---------|------------|----------------------------|
| afp_001 | ds_001     | SOX_Control_Assessment     |

The same pattern extends to any other period record whose y value resolves to a known dataset.

```json
{"tables": [{"name": "t_dataset_under_audit", "rows": [["ds_001", "Q2_Financial_Records"], ["ds_002", "Vendor_Compliance_Archive"], ["ds_003", "Payroll_Master_File"], ["ds_004", "Regulatory_Submission_2024"]]}, {"name": "t_audit_for_period", "rows": [["afp_001", "Q2_2024_Audit", "ds_001"], ["afp_002", "Annual_Vendor_Review", "ds_002"], ["afp_003", "Payroll_Compliance", "ds_003"], ["afp_004", "Regulatory_Filing", "ds_004"]]}, {"name": "t_audit_conducted_by", "rows": [["acb_001", "Internal_Audit_Team"], ["acb_002", "External_Auditor_Firm"], ["acb_003", "Regulatory_Inspector"], ["acb_004", "Compliance_Officer"]]}, {"name": "t_audit_subclass", "rows": [["as_001", "SOX_Control_Assessment"], ["as_002", "GDPR_Data_Retention_Check"], ["as_003", "Payroll_Tax_Compliance"], ["as_004", "SEC_Filing_Accuracy_Review"]]}]}
```