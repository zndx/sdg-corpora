---
chapter_id: ac0d7f8c4fae404a
topic_id: 179
family: 03_directive_governance
cited_terms: ['audit_for_period', 'dataset_under_audit', 'audit_conducted_by', 'audit_subclass']
model: xai/grok-4.3
---

# Audit Governance Ontologies in Relational Schema Form

This chapter defines four core ontological templates that formalise audit processes over datasets, periods, persons and control directives. Each template is materialised as a table whose columns directly encode the Manchester axioms. The resulting schema supports deterministic joins that recover multi-hop facts such as “which person conducted the audit of directive D on dataset S for period P”.

## 1. Dataset Under Audit

Axiom 2 states that a dataset is an artifact placed under an audit process. Table t_dataset_under_audit therefore stores only the dataset identifier; its primary key supplies the foreign-key target for every subsequent audit-period link.

```sql
CREATE TABLE t_dataset_under_audit (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| DS-001 | QuarterlyFinancials-Q4 |
| DS-002 | SupplierMaster-2023 |
| DS-003 | CustomerPII-Archive |
| DS-004 | RegulatoryFilings-2024 |
| DS-005 | ESG-Metrics-2023 |

## 2. Audit Linked to Period

Axiom 1 asserts that an audit process exists for a specific audit period that references a dataset. Table t_audit_for_period therefore carries a foreign key y that must resolve to t_dataset_under_audit.id; its own id serves as the primary key for later joins to conductor and subclass tables.

```sql
CREATE TABLE t_audit_for_period (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_dataset_under_audit(id)
);
```

| id | x | y |
|----|---|---|
| AP-1001 | Audit-Q4-Fin | DS-001 |
| AP-1002 | Audit-Supplier | DS-002 |
| AP-1003 | Audit-PII-Retention | DS-003 |
| AP-1004 | Audit-Reg-Sub | DS-004 |
| AP-1005 | Audit-ESG-Controls | DS-005 |
| AP-1006 | Audit-Q1-FollowUp | DS-001 |

## 3. Audit Conducted By Person

Axiom 3 states that an audit process is conducted by a person. Table t_audit_conducted_by therefore records the same audit identifier as primary key together with the conducting person; the identifier can be joined to t_audit_for_period.id to recover the responsible individual for any period-specific audit.

```sql
CREATE TABLE t_audit_conducted_by (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| AP-1001 | J. Patel |
| AP-1002 | M. Torres |
| AP-1003 | R. Klein |
| AP-1004 | S. Novak |
| AP-1005 | J. Patel |
| AP-1006 | M. Torres |

## 4. Audit Subclass for Control Directives

Axiom 4 states that an audit process audits a control directive information content entity. Table t_audit_subclass therefore stores the audit identifier together with the directive identifier; the identifier again aligns with t_audit_for_period.id, enabling a three-table join that returns the directive examined, the dataset audited and the conducting person.

```sql
CREATE TABLE t_audit_subclass (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| AP-1001 | DIR-CTRL-RevRec |
| AP-1002 | DIR-CTRL-SupEval |
| AP-1003 | DIR-CTRL-Consent |
| AP-1004 | DIR-CTRL-FilingAcc |
| AP-1005 | DIR-CTRL-ESGTrace |
| AP-1006 | DIR-CTRL-RevRec |

## 5. Cross-Join Example

To answer “Which person conducted the audit of directive DIR-CTRL-RevRec on dataset QuarterlyFinancials-Q4 for period Audit-Q4-Fin?”, traverse the foreign-key chain:

1. Locate AP-1001 in t_audit_for_period where y = DS-001.
2. Join t_audit_conducted_by on id = AP-1001 → J. Patel.
3. Join t_audit_subclass on id = AP-1001 → DIR-CTRL-RevRec.

Result row: (AP-1001, DS-001, QuarterlyFinancials-Q4, J. Patel, DIR-CTRL-RevRec).

```json
{"tables": [{"name": "t_dataset_under_audit", "rows": [["DS-001", "QuarterlyFinancials-Q4"], ["DS-002", "SupplierMaster-2023"], ["DS-003", "CustomerPII-Archive"], ["DS-004", "RegulatoryFilings-2024"], ["DS-005", "ESG-Metrics-2023"]]}, {"name": "t_audit_for_period", "rows": [["AP-1001", "Audit-Q4-Fin", "DS-001"], ["AP-1002", "Audit-Supplier", "DS-002"], ["AP-1003", "Audit-PII-Retention", "DS-003"], ["AP-1004", "Audit-Reg-Sub", "DS-004"], ["AP-1005", "Audit-ESG-Controls", "DS-005"], ["AP-1006", "Audit-Q1-FollowUp", "DS-001"]]}, {"name": "t_audit_conducted_by", "rows": [["AP-1001", "J. Patel"], ["AP-1002", "M. Torres"], ["AP-1003", "R. Klein"], ["AP-1004", "S. Novak"], ["AP-1005", "J. Patel"], ["AP-1006", "M. Torres"]]}, {"name": "t_audit_subclass", "rows": [["AP-1001", "DIR-CTRL-RevRec"], ["AP-1002", "DIR-CTRL-SupEval"], ["AP-1003", "DIR-CTRL-Consent"], ["AP-1004", "DIR-CTRL-FilingAcc"], ["AP-1005", "DIR-CTRL-ESGTrace"], ["AP-1006", "DIR-CTRL-RevRec"]]}]}
```