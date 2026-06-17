---
chapter_id: a1dfbc0afa44df4c
topic_id: 183
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'hipaa_safeguard_technical', 'hipaa_safeguard_physical', 'hipaa_safeguard_admin', 'iso27001_annexa_subclass']
model: xai/grok-4.3
---

# Compliance Directive Modeling for Information Security Controls

This chapter defines five relational tables that instantiate ontological axioms for directive classes under PCI DSS, HIPAA, and ISO 27001. Each table stores subclass relationships to cco:DirectiveICE while recording the specific requirement or safeguard referenced by each directive. The resulting schema supports cross-table queries that trace a control through multiple standards.

## 1. Table Definitions and Axiom Embodiment

### 1.1 PCI DSS Requirement Table
This table embodies axiom pci_dss_requirement by recording each directive class X that is a subclass of cco:DirectiveICE and that satisfies the pciDssRequirement restriction on class Y. Column id is the primary key; column y holds the requirement identifier treated as an entity reference for joins to other directive tables.

```sql
CREATE TABLE t_pci_dss_requirement (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id     | x                        | y             |
|--------|--------------------------|---------------|
| pci-01 | AccessControlDirective   | Req-7.1       |
| pci-02 | EncryptionDirective      | Req-3.4       |
| pci-03 | AuditLogDirective        | Req-10.2      |
| pci-04 | NetworkSegmentDirective  | Req-1.2       |
| pci-05 | KeyManagementDirective   | Req-3.5       |

### 1.2 HIPAA Technical Safeguard Table
This table embodies axiom hipaa_safeguard_technical by recording each directive class X that is a subclass of cco:DirectiveICE and that satisfies the hipaaSafeguard restriction on technical class Y. Column id is the primary key; column y holds the safeguard identifier usable for joins.

```sql
CREATE TABLE t_hipaa_safeguard_technical (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id      | x                        | y             |
|---------|--------------------------|---------------|
| hipaa-t1 | AccessControlDirective  | 164.312(a)(1) |
| hipaa-t2 | EncryptionDirective     | 164.312(e)(1) |
| hipaa-t3 | AuditLogDirective       | 164.312(b)    |
| hipaa-t4 | IntegrityDirective      | 164.312(c)(1) |

### 1.3 HIPAA Physical Safeguard Table
This table embodies axiom hipaa_safeguard_physical by recording each directive class X that is a subclass of cco:DirectiveICE and that satisfies the hipaaSafeguard restriction on physical class Y. Column id is the primary key.

```sql
CREATE TABLE t_hipaa_safeguard_physical (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id      | x                       | y             |
|---------|-------------------------|---------------|
| hipaa-p1 | FacilityDirective      | 164.310(a)(1) |
| hipaa-p2 | WorkstationDirective   | 164.310(b)    |
| hipaa-p3 | DeviceDirective        | 164.310(c)    |

### 1.4 HIPAA Administrative Safeguard Table
This table embodies axiom hipaa_safeguard_admin by recording each directive class X that is a subclass of cco:DirectiveICE and that satisfies the hipaaSafeguard restriction on administrative class Y. Column id is the primary key.

```sql
CREATE TABLE t_hipaa_safeguard_admin (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id      | x                          | y             |
|---------|----------------------------|---------------|
| hipaa-a1 | RiskAnalysisDirective     | 164.308(a)(1) |
| hipaa-a2 | SanctionDirective         | 164.308(a)(3) |
| hipaa-a3 | TrainingDirective         | 164.308(a)(5) |
| hipaa-a4 | ContingencyDirective      | 164.308(a)(7) |

### 1.5 ISO 27001 Annex A Subclass Table
This table embodies axiom iso27001_annexa_subclass by recording each directive class X that is a subclass of cco:DirectiveICE and that satisfies the iso27001AnnexA restriction on class Y. Column id is the primary key.

```sql
CREATE TABLE t_iso27001_annexa_subclass (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id      | x                        | y      |
|---------|--------------------------|--------|
| iso-01  | AccessControlDirective   | A.9.1  |
| iso-02  | EncryptionDirective      | A.10.1 |
| iso-03  | AuditLogDirective        | A.12.4 |
| iso-04  | KeyManagementDirective   | A.10.1 |
| iso-05  | NetworkSegmentDirective  | A.13.1 |

## 2. Cross-Table Query Example

To determine the full set of directive classes that simultaneously satisfy PCI DSS Req-3.4, HIPAA technical safeguard 164.312(e)(1), and ISO 27001 A.10.1, perform successive equi-joins on the y columns:

```sql
SELECT p.x AS directive
FROM t_pci_dss_requirement p
JOIN t_hipaa_safeguard_technical h ON p.x = h.x
JOIN t_iso27001_annexa_subclass i ON p.x = i.x
WHERE p.y = 'Req-3.4'
  AND h.y = '164.312(e)(1)'
  AND i.y = 'A.10.1';
```

The join returns the single row:

directive  
EncryptionDirective

```json
{"tables": [{"name": "t_pci_dss_requirement", "rows": [["pci-01", "AccessControlDirective", "Req-7.1"], ["pci-02", "EncryptionDirective", "Req-3.4"], ["pci-03", "AuditLogDirective", "Req-10.2"], ["pci-04", "NetworkSegmentDirective", "Req-1.2"], ["pci-05", "KeyManagementDirective", "Req-3.5"]]}, {"name": "t_hipaa_safeguard_technical", "rows": [["hipaa-t1", "AccessControlDirective", "164.312(a)(1)"], ["hipaa-t2", "EncryptionDirective", "164.312(e)(1)"], ["hipaa-t3", "AuditLogDirective", "164.312(b)"], ["hipaa-t4", "IntegrityDirective", "164.312(c)(1)"]]}, {"name": "t_hipaa_safeguard_physical", "rows": [["hipaa-p1", "FacilityDirective", "164.310(a)(1)"], ["hipaa-p2", "WorkstationDirective", "164.310(b)"], ["hipaa-p3", "DeviceDirective", "164.310(c)"]]}, {"name": "t_hipaa_safeguard_admin", "rows": [["hipaa-a1", "RiskAnalysisDirective", "164.308(a)(1)"], ["hipaa-a2", "SanctionDirective", "164.308(a)(3)"], ["hipaa-a3", "TrainingDirective", "164.308(a)(5)"], ["hipaa-a4", "ContingencyDirective", "164.308(a)(7)"]]}, {"name": "t_iso27001_annexa_subclass", "rows": [["iso-01", "AccessControlDirective", "A.9.1"], ["iso-02", "EncryptionDirective", "A.10.1"], ["iso-03", "AuditLogDirective", "A.12.4"], ["iso-04", "KeyManagementDirective", "A.10.1"], ["iso-05", "NetworkSegmentDirective", "A.13.1"]]}]}
```