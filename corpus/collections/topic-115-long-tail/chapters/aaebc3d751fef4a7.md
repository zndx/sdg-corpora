---
chapter_id: aaebc3d751fef4a7
topic_id: 115
family: 07_long_tail
cited_terms: ['trace_supports_claim', 'kernel_anomaly_supports_claim', 'column_lineage_for_compliance_claim', 'pci_dss_requirement', 'schemaorg_org_taxid']
model: xai/grok-4.3
---

# Chapter 4: Claim-Support Artifacts in Compliance Audit Trails

This chapter defines five ontological classes that capture how artifacts and directives participate in evidentiary claims under regulatory frameworks. The classes are projected into a minimal relational schema consisting of five tables. Primary keys identify individual claim-support instances; shared literal values in the `x` and `y` columns serve as the only sanctioned join paths, enabling reconstruction of multi-hop compliance derivations such as “which column lineage supports a PCI DSS requirement asserted by an organization holding a given tax identifier.”

## 1 Scope and Table Organization

The five tables directly instantiate the five supplied axioms. Tables 1–3 each embody a distinct subclass of claim-supporting entities. Tables 4 and 5 embody binary relations that attach regulatory directives and tax identifiers to those entities. All tables share the same column-type discipline: `id` is the sole primary key; every other column is either a class reference (`x`) or a secondary class reference (`y`).

### 1.1 t_trace_supports_claim

This table realizes Axiom 1. Column `id` is the primary key naming each trace instance; column `x` holds the class that supports a descriptive information content entity. A reader can join on `x` values to locate every trace that participates in the same claim.

```sql
CREATE TABLE t_trace_supports_claim (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|---|---|
| trace-001 | DataLineageTrace |
| trace-002 | DataLineageTrace |
| trace-003 | KernelExecutionTrace |
| trace-004 | ColumnMappingTrace |
| trace-005 | KernelExecutionTrace |
| trace-006 | DataLineageTrace |

### 1.2 t_kernel_anomaly_supports_claim

This table realizes Axiom 2. Column `id` is the primary key; column `x` names the artifact class whose anomaly record supports a claim. Joins on `x` connect anomaly records that underwrite identical compliance assertions.

```sql
CREATE TABLE t_kernel_anomaly_supports_claim (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|---|---|
| anomaly-001 | KernelAnomalyRecord |
| anomaly-002 | KernelAnomalyRecord |
| anomaly-003 | KernelAnomalyRecord |
| anomaly-004 | ExecutionAnomalyRecord |
| anomaly-005 | KernelAnomalyRecord |

### 1.3 t_column_lineage_for_compliance_claim

This table realizes Axiom 3. Column `id` is the primary key; column `x` identifies the lineage artifact supporting a compliance claim. Cross-table joins on `x` values retrieve every lineage fragment attached to a given claim.

```sql
CREATE TABLE t_column_lineage_for_compliance_claim (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|---|---|
| lineage-001 | ColumnLineageGraph |
| lineage-002 | ColumnLineageGraph |
| lineage-003 | ColumnLineageGraph |
| lineage-004 | ColumnLineageGraph |
| lineage-005 | ColumnLineageGraph |
| lineage-006 | ColumnLineageGraph |

### 1.4 t_pci_dss_requirement

This table realizes Axiom 4. Column `id` is the primary key; column `x` names the directive class and column `y` names the PCI DSS requirement class it references. A join on `x` or `y` recovers the full set of directives that satisfy a particular requirement.

```sql
CREATE TABLE t_pci_dss_requirement (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
|---|---|---|
| req-001 | DirectiveICE | PCI-DSS-Req-10 |
| req-002 | DirectiveICE | PCI-DSS-Req-3 |
| req-003 | DirectiveICE | PCI-DSS-Req-10 |
| req-004 | DirectiveICE | PCI-DSS-Req-12 |
| req-005 | DirectiveICE | PCI-DSS-Req-3 |

### 1.5 t_schemaorg_org_taxid

This table realizes Axiom 5. Column `id` is the primary key; column `x` names the organizational artifact and column `y` names its tax identifier class. Joins on `x` or `y` associate every artifact with its legal tax identity.

```sql
CREATE TABLE t_schemaorg_org_taxid (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
|---|---|---|
| tax-001 | AcmeBankCorp | EIN-12-3456789 |
| tax-002 | LedgerCo | EIN-98-7654321 |
| tax-003 | AcmeBankCorp | EIN-12-3456789 |
| tax-004 | DataVaultInc | EIN-45-6789012 |
| tax-005 | LedgerCo | EIN-98-7654321 |

## 2 Cross-Join Example

Question: Which kernel anomaly records and column lineage graphs together support the PCI DSS requirement referenced by the directive attached to AcmeBankCorp?

Walk the links as follows.  
1. From `t_schemaorg_org_taxid`, select rows where `x = 'AcmeBankCorp'` to obtain `y = 'EIN-12-3456789'`.  
2. From `t_pci_dss_requirement`, select rows where `x = 'DirectiveICE'` and `y = 'PCI-DSS-Req-10'` (the requirement asserted under that tax identity).  
3. Join the resulting `x` values to `t_kernel_anomaly_supports_claim.x` and `t_column_lineage_for_compliance_claim.x`.

Resulting joined rows (abbreviated):

- anomaly-001 (KernelAnomalyRecord) + lineage-001 (ColumnLineageGraph) + req-001 (PCI-DSS-Req-10)  
- anomaly-002 (KernelAnomalyRecord) + lineage-003 (ColumnLineageGraph) + req-003 (PCI-DSS-Req-10)

The two-hop join confirms that the listed anomaly records and lineage graphs are the evidentiary artifacts supporting the PCI DSS requirement for the organization identified by EIN-12-3456789.

```json
{"tables": [{"name": "t_trace_supports_claim", "rows": [["trace-001", "DataLineageTrace"], ["trace-002", "DataLineageTrace"], ["trace-003", "KernelExecutionTrace"], ["trace-004", "ColumnMappingTrace"], ["trace-005", "KernelExecutionTrace"], ["trace-006", "DataLineageTrace"]]}, {"name": "t_kernel_anomaly_supports_claim", "rows": [["anomaly-001", "KernelAnomalyRecord"], ["anomaly-002", "KernelAnomalyRecord"], ["anomaly-003", "KernelAnomalyRecord"], ["anomaly-004", "ExecutionAnomalyRecord"], ["anomaly-005", "KernelAnomalyRecord"]]}, {"name": "t_column_lineage_for_compliance_claim", "rows": [["lineage-001", "ColumnLineageGraph"], ["lineage-002", "ColumnLineageGraph"], ["lineage-003", "ColumnLineageGraph"], ["lineage-004", "ColumnLineageGraph"], ["lineage-005", "ColumnLineageGraph"], ["lineage-006", "ColumnLineageGraph"]]}, {"name": "t_pci_dss_requirement", "rows": [["req-001", "DirectiveICE", "PCI-DSS-Req-10"], ["req-002", "DirectiveICE", "PCI-DSS-Req-3"], ["req-003", "DirectiveICE", "PCI-DSS-Req-10"], ["req-004", "DirectiveICE", "PCI-DSS-Req-12"], ["req-005", "DirectiveICE", "PCI-DSS-Req-3"]]}, {"name": "t_schemaorg_org_taxid", "rows": [["tax-001", "AcmeBankCorp", "EIN-12-3456789"], ["tax-002", "LedgerCo", "EIN-98-7654321"], ["tax-003", "AcmeBankCorp", "EIN-12-3456789"], ["tax-004", "DataVaultInc", "EIN-45-6789012"], ["tax-005", "LedgerCo", "EIN-98-7654321"]]}]}
```