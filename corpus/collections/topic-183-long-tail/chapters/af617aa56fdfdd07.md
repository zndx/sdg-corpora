---
chapter_id: af617aa56fdfdd07
topic_id: 183
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'hipaa_safeguard_technical', 'hipaa_safeguard_physical', 'hipaa_safeguard_admin', 'iso27001_annexa_subclass']
model: xai/grok-4.3
---

# Compliance Directive Instantiation in Audit Trail Schemas

This chapter presents five deterministic projections of OWL axioms that classify subclasses of cco:DirectiveICE according to PCI DSS, HIPAA, and ISO 27001 relations. Each projection is realized as a table whose rows are admissible instances; foreign-key joins across the y and x columns permit retrieval of chained compliance mappings.

## 1 Ontological Templates and Their Relational Images

Five Manchester axioms are used. Each states that a class X is a subclass of cco:DirectiveICE and stands in a named object-property relation to a second class Y. The corresponding table therefore contains one row per admissible (X, Y) pair, with id serving as surrogate primary key.

### 1.1 PCI DSS Requirement Table

Table t_pci_dss_requirement embodies axiom 1. Column id is the primary key; column y stores the target PCI DSS requirement class and functions as a foreign key when joined to x values in the ISO 27001 table.

| id     | x                        | y             |
|--------|--------------------------|---------------|
| pci-01 | DataAtRestEncryption     | PCI-DSS-3.4   |
| pci-02 | TransmissionEncryption   | PCI-DSS-4.1   |
| pci-03 | AccessControlList        | PCI-DSS-7.1   |
| pci-04 | AuditLogRetention        | PCI-DSS-10.7  |
| pci-05 | KeyRotationSchedule      | PCI-DSS-3.6   |

### 1.2 HIPAA Technical Safeguard Table

Table t_hipaa_safeguard_technical embodies axiom 2. Column id is the primary key; column y stores the target HIPAA technical safeguard class and may be joined to x values appearing in the physical-safeguard table.

| id      | x                       | y               |
|---------|-------------------------|-----------------|
| hipaa-t1| AccessControl           | 164.312(a)(1)   |
| hipaa-t2| AuditControls           | 164.312(b)      |
| hipaa-t3| Integrity               | 164.312(c)(1)   |
| hipaa-t4| TransmissionSecurity    | 164.312(e)(1)   |
| hipaa-t5| Encryption              | 164.312(a)(2)(iv)|

### 1.3 HIPAA Physical Safeguard Table

Table t_hipaa_safeguard_physical embodies axiom 3. Column id is the primary key; column y stores the target HIPAA physical safeguard class.

| id      | x                    | y               |
|---------|----------------------|-----------------|
| hipaa-p1| FacilityAccess       | 164.310(a)(1)   |
| hipaa-p2| WorkstationSecurity  | 164.310(c)      |
| hipaa-p3| DeviceMediaControl   | 164.310(d)(1)   |

### 1.4 HIPAA Administrative Safeguard Table

Table t_hipaa_safeguard_admin embodies axiom 4. Column id is the primary key; column y stores the target HIPAA administrative safeguard class.

| id      | x                       | y               |
|---------|-------------------------|-----------------|
| hipaa-a1| SecurityOfficer         | 164.308(a)(2)   |
| hipaa-a2| WorkforceTraining       | 164.308(a)(5)   |
| hipaa-a3| IncidentResponse        | 164.308(a)(6)   |
| hipaa-a4| ContingencyPlan         | 164.308(a)(7)   |

### 1.5 ISO 27001 Annex A Subclass Table

Table t_iso27001_annexa_subclass embodies axiom 5. Column id is the primary key; column y stores the target Annex A control class.

| id     | x                       | y             |
|--------|-------------------------|---------------|
| iso-01 | InformationSecurityPolicy | A.5.1.1     |
| iso-02 | AccessControlPolicy     | A.9.1.1       |
| iso-03 | CryptographicPolicy     | A.10.1.1      |
| iso-04 | LoggingAndMonitoring    | A.12.4.1      |
| iso-05 | KeyManagement           | A.10.1.2      |

## 2 Cross-Table Retrieval Example

A multi-hop query locating every PCI DSS requirement that shares an encryption-related class with both a HIPAA technical safeguard and an ISO 27001 control is formed by successive equi-joins on the y and x columns:

```sql
SELECT p.y AS pci_req, h.y AS hipaa_tech, i.y AS iso_annex
FROM   t_pci_dss_requirement p
JOIN   t_hipaa_safeguard_technical h ON p.x = h.x
JOIN   t_iso27001_annexa_subclass i  ON h.x = i.x
WHERE  p.x = 'DataAtRestEncryption';
```

Execution yields the single joined row (PCI-DSS-3.4, 164.312(a)(2)(iv), A.10.1.2).

```json
{"tables": [{"name": "t_pci_dss_requirement", "rows": [["pci-01", "DataAtRestEncryption", "PCI-DSS-3.4"], ["pci-02", "TransmissionEncryption", "PCI-DSS-4.1"], ["pci-03", "AccessControlList", "PCI-DSS-7.1"], ["pci-04", "AuditLogRetention", "PCI-DSS-10.7"], ["pci-05", "KeyRotationSchedule", "PCI-DSS-3.6"]]}, {"name": "t_hipaa_safeguard_technical", "rows": [["hipaa-t1", "AccessControl", "164.312(a)(1)"], ["hipaa-t2", "AuditControls", "164.312(b)"], ["hipaa-t3", "Integrity", "164.312(c)(1)"], ["hipaa-t4", "TransmissionSecurity", "164.312(e)(1)"], ["hipaa-t5", "Encryption", "164.312(a)(2)(iv)"]]}, {"name": "t_hipaa_safeguard_physical", "rows": [["hipaa-p1", "FacilityAccess", "164.310(a)(1)"], ["hipaa-p2", "WorkstationSecurity", "164.310(c)"], ["hipaa-p3", "DeviceMediaControl", "164.310(d)(1)"]]}, {"name": "t_hipaa_safeguard_admin", "rows": [["hipaa-a1", "SecurityOfficer", "164.308(a)(2)"], ["hipaa-a2", "WorkforceTraining", "164.308(a)(5)"], ["hipaa-a3", "IncidentResponse", "164.308(a)(6)"], ["hipaa-a4", "ContingencyPlan", "164.308(a)(7)"]]}, {"name": "t_iso27001_annexa_subclass", "rows": [["iso-01", "InformationSecurityPolicy", "A.5.1.1"], ["iso-02", "AccessControlPolicy", "A.9.1.1"], ["iso-03", "CryptographicPolicy", "A.10.1.1"], ["iso-04", "LoggingAndMonitoring", "A.12.4.1"], ["iso-05", "KeyManagement", "A.10.1.2"]]}]}
```