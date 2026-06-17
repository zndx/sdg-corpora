---
chapter_id: e5bfecfa28b8be1e
topic_id: 32
family: 03_directive_governance
cited_terms: ['audit_for_period', 'dataset_under_audit', 'audit_conducted_by', 'audit_subclass', 'audit_with_findings']
model: xai/grok-4.3
---

# Chapter 4: Audit Processes and Controlled Datasets in Regulatory Reporting

This chapter defines five ontological templates that capture the structure of audit processes applied to datasets. The templates are realized as a five-table relational schema drawn from municipal financial reporting. Primary and foreign keys encode the subclass and relational restrictions stated in each axiom, permitting direct verification of multi-hop queries over audit periods, conducting agents, subclasses, and findings.

## 1 Scope and Table Overview

The schema models audits performed on financial statement datasets issued by unified school districts. Each table corresponds to one axiom. Column names preserve the slot variables X and Y. All identifiers are opaque strings; values in column X reference process individuals while values in column Y reference dataset individuals.

### 1.1 t_dataset_under_audit

Axiom 2 states that a dataset is an artifact placed under an audit process. The table therefore contains only a primary-key column id that uniquely identifies each dataset instance; column x repeats the same identifier for compatibility with the Manchester syntax projection.

```sql
CREATE TABLE t_dataset_under_audit (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id          | x           |
|-------------|-------------|
| ds-2020-503 | ds-2020-503 |
| ds-2020-501 | ds-2020-501 |
| ds-2019-402 | ds-2019-402 |
| ds-2020-312 | ds-2020-312 |
| ds-2020-207 | ds-2020-207 |

### 1.2 t_audit_for_period

Axiom 1 asserts that an audit process exists for a specific audit period realized by a dataset. The foreign key y therefore references t_dataset_under_audit.id, establishing the period linkage. Column id is the primary key of the audit process itself.

```sql
CREATE TABLE t_audit_for_period (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_dataset_under_audit(id)
);
```

| id         | x          | y           |
|------------|------------|-------------|
| aud-001    | aud-001    | ds-2020-503 |
| aud-002    | aud-002    | ds-2020-501 |
| aud-003    | aud-003    | ds-2019-402 |
| aud-004    | aud-004    | ds-2020-312 |
| aud-005    | aud-005    | ds-2020-207 |

### 1.3 t_audit_conducted_by

Axiom 3 restricts an audit process to a conducting person. Column id again serves as primary key; column x stores the same identifier, allowing later extension with person references without altering the present schema.

```sql
CREATE TABLE t_audit_conducted_by (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id         | x          |
|------------|------------|
| aud-001    | aud-001    |
| aud-002    | aud-002    |
| aud-003    | aud-003    |
| aud-004    | aud-004    |
| aud-005    | aud-005    |

### 1.4 t_audit_subclass

Axiom 4 classifies the audit as a subclass that audits directive information content entities (control statements). The table therefore records only the audit identifier.

```sql
CREATE TABLE t_audit_subclass (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id         | x          |
|------------|------------|
| aud-001    | aud-001    |
| aud-002    | aud-002    |
| aud-003    | aud-003    |
| aud-004    | aud-004    |
| aud-005    | aud-005    |

### 1.5 t_audit_with_findings

Axiom 5 asserts that an audit process yields findings attached to a dataset. The foreign key y again references t_dataset_under_audit.id.

```sql
CREATE TABLE t_audit_with_findings (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_dataset_under_audit(id)
);
```

| id         | x          | y           |
|------------|------------|-------------|
| fnd-101    | fnd-101    | ds-2020-503 |
| fnd-102    | fnd-102    | ds-2020-501 |
| fnd-103    | fnd-103    | ds-2019-402 |
| fnd-104    | fnd-104    | ds-2020-312 |

## 2 Cross-Join Demonstration

To retrieve the dataset identifier and the finding identifier for every audit conducted on a 2020-period dataset, the following mental join is performed:

- Start at t_audit_for_period where y = 'ds-2020-503' → row yields id = 'aud-001'.
- Locate the same id in t_audit_with_findings → row yields y = 'ds-2020-503' and id = 'fnd-101'.

The joined result row is therefore (aud-001, ds-2020-503, fnd-101). Repeating the walk for the remaining 2020 rows produces the complete set of findings attached to each audited 2020 dataset.

```json
{"tables": [{"name": "t_dataset_under_audit", "rows": [["ds-2020-503", "ds-2020-503"], ["ds-2020-501", "ds-2020-501"], ["ds-2019-402", "ds-2019-402"], ["ds-2020-312", "ds-2020-312"], ["ds-2020-207", "ds-2020-207"]]}, {"name": "t_audit_for_period", "rows": [["aud-001", "aud-001", "ds-2020-503"], ["aud-002", "aud-002", "ds-2020-501"], ["aud-003", "aud-003", "ds-2019-402"], ["aud-004", "aud-004", "ds-2020-312"], ["aud-005", "aud-005", "ds-2020-207"]]}, {"name": "t_audit_conducted_by", "rows": [["aud-001", "aud-001"], ["aud-002", "aud-002"], ["aud-003", "aud-003"], ["aud-004", "aud-004"], ["aud-005", "aud-005"]]}, {"name": "t_audit_subclass", "rows": [["aud-001", "aud-001"], ["aud-002", "aud-002"], ["aud-003", "aud-003"], ["aud-004", "aud-004"], ["aud-005", "aud-005"]]}, {"name": "t_audit_with_findings", "rows": [["fnd-101", "fnd-101", "ds-2020-503"], ["fnd-102", "fnd-102", "ds-2020-501"], ["fnd-103", "fnd-103", "ds-2019-402"], ["fnd-104", "fnd-104", "ds-2020-312"]]}]}
```