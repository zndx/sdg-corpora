---
chapter_id: 394d52bacac5ed6e
topic_id: 22
family: 07_long_tail
cited_terms: ['schemaorg_product_brand', 'iso27001_annexa_subclass', 'iso27001_clause_subclass']
model: xai/grok-4.3
---

# Compliance Modeling for Artifact Directives under ISO 27001

This chapter presents three ontological templates that relate artifacts to brands and directives to ISO 27001 control structures. The templates are realized as a fixed relational schema of three tables. Primary keys identify each assertion; cross-table joins on shared class references permit retrieval of multi-step compliance facts such as the brand of an artifact that satisfies a given annex or clause.

## 1. Schemaorg Product Brand Table

Axiom 1 states that an artifact class stands in the relation hasBrand to a brand class. The table t_schemaorg_product_brand records each such assertion. Column id is the primary key. Columns x and y hold class references; no foreign-key constraint is declared because both values are drawn from an external class hierarchy.

```sql
CREATE TABLE t_schemaorg_product_brand (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

Four rows illustrate typical usage.

| id | x | y |
|----|---|---|
| pb-001 | FirewallAppliance | BP |
| pb-002 | SecureRouter | UniversityBaltimore |
| pb-003 | AuditLogServer | SocietyFireProtection |
| pb-004 | EncryptionModule | LawForum |

## 2. Iso27001 Annexa Subclass Table

Axiom 2 states that a directive class is a subclass of DirectiveICE and stands in the relation iso27001AnnexA to an annex-A control class. The table t_iso27001_annexa_subclass records each assertion. Column id is the primary key. Columns x and y hold class references.

```sql
CREATE TABLE t_iso27001_annexa_subclass (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

Five rows are supplied.

| id | x | y |
|----|---|---|
| aa-010 | AccessControlPolicy | A.9 |
| aa-011 | EncryptionStandard | A.10 |
| aa-012 | LogRetentionDirective | A.12 |
| aa-013 | IncidentResponsePlan | A.16 |
| aa-014 | SupplierEvaluationRule | A.15 |

## 3. Iso27001 Clause Subclass Table

Axiom 3 states that a directive class is a subclass of DirectiveICE and stands in the relation iso27001Clause to a clause class. The table t_iso27001_clause_subclass records each assertion. Column id is the primary key. Columns x and y hold class references.

```sql
CREATE TABLE t_iso27001_clause_subclass (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

Six rows are supplied.

| id | x | y |
|----|---|---|
| cl-020 | AccessControlPolicy | 9.1 |
| cl-021 | EncryptionStandard | 10.1 |
| cl-022 | LogRetentionDirective | 12.4 |
| cl-023 | IncidentResponsePlan | 16.1 |
| cl-024 | SupplierEvaluationRule | 15.2 |
| cl-025 | ChangeManagementProc | 8.1 |

## 4. Cross-Table Retrieval Example

A reader may obtain the brand of every artifact whose governing directive satisfies both a named annex and a named clause. The following mental join proceeds in two steps. First locate the directive class that appears in both annex and clause tables for the same control topic; second locate the artifact that carries that directive class through the brand table.

- Start with annex row aa-010 (x = AccessControlPolicy, y = A.9).  
- Locate the matching clause row cl-020 (x = AccessControlPolicy, y = 9.1).  
- Locate the brand row pb-001 (x = FirewallAppliance, y = BP).

The joined result is the single row (FirewallAppliance, BP, A.9, 9.1). Repeating the pattern for the remaining shared directive classes yields four additional joined rows, each obtained solely by equality on the x column across the three tables.

```json
{"tables":[{"name":"t_schemaorg_product_brand","rows":[["pb-001","FirewallAppliance","BP"],["pb-002","SecureRouter","UniversityBaltimore"],["pb-003","AuditLogServer","SocietyFireProtection"],["pb-004","EncryptionModule","LawForum"]]},{"name":"t_iso27001_annexa_subclass","rows":[["aa-010","AccessControlPolicy","A.9"],["aa-011","EncryptionStandard","A.10"],["aa-012","LogRetentionDirective","A.12"],["aa-013","IncidentResponsePlan","A.16"],["aa-014","SupplierEvaluationRule","A.15"]]},{"name":"t_iso27001_clause_subclass","rows":[["cl-020","AccessControlPolicy","9.1"],["cl-021","EncryptionStandard","10.1"],["cl-022","LogRetentionDirective","12.4"],["cl-023","IncidentResponsePlan","16.1"],["cl-024","SupplierEvaluationRule","15.2"],["cl-025","ChangeManagementProc","8.1"]]}]}
```