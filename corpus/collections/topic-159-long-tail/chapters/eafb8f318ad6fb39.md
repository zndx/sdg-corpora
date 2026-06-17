---
chapter_id: eafb8f318ad6fb39
topic_id: 159
family: 07_long_tail
cited_terms: ['mass_function_min_one_focal', 'metric_observed_by_event', 'evidence_observed_by_process', 'claim_observed_by_event', 'audit_produces_evidence']
model: xai/grok-4.3
---

# Chapter 4: Relational Encoding of Descriptive ICE Observation Axioms

This chapter defines five tables that realize the OWL axioms for descriptive information content entities (DescriptiveICE) under observation and evidence-production constraints. The tables are populated with audit-trail instances drawn from laboratory compliance records. Primary-key and foreign-key links permit cross-table retrieval of focal metrics, claims, and evidence produced by a single audit event.

## 1 Table t_metric_observed_by_event

Axiom 2 states that every metric is a DescriptiveICE observed at some bfo:0000015 event. The table therefore stores one row per metric identifier together with its associated event class. Column id is the primary key; column x holds the event class reference.

```sql
CREATE TABLE t_metric_observed_by_event (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| m001 | AuditEvent_2023-09-12 |
| m002 | AuditEvent_2023-09-12 |
| m003 | AuditEvent_2023-10-03 |
| m004 | AuditEvent_2023-10-03 |
| m005 | AuditEvent_2023-11-15 |

## 2 Table t_evidence_observed_by_process

Axiom 3 likewise classifies evidence items as DescriptiveICE observed at process executions. Column id is the primary key; column x records the process class.

```sql
CREATE TABLE t_evidence_observed_by_process (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| e001 | SampleProcessingRun |
| e002 | SampleProcessingRun |
| e003 | CalibrationRun |
| e004 | CalibrationRun |
| e005 | SampleProcessingRun |

## 3 Table t_claim_observed_by_event

Axiom 4 records claims as DescriptiveICE observed at events. Column id is the primary key; column x stores the event class.

```sql
CREATE TABLE t_claim_observed_by_event (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| c001 | AuditEvent_2023-09-12 |
| c002 | AuditEvent_2023-10-03 |
| c003 | AuditEvent_2023-11-15 |
| c004 | AuditEvent_2023-09-12 |
| c005 | AuditEvent_2023-10-03 |

## 4 Table t_audit_produces_evidence

Axiom 5 asserts that an audit (bfo:0000015) produces evidence DescriptiveICE. Column id is the primary key; column x names the audit instance.

```sql
CREATE TABLE t_audit_produces_evidence (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| a001 | Audit_2023-09-12 |
| a002 | Audit_2023-10-03 |
| a003 | Audit_2023-11-15 |
| a004 | Audit_2023-09-12 |
| a005 | Audit_2023-10-03 |

## 5 Table t_mass_function_min_one_focal

Axiom 1 requires every mass-function DescriptiveICE to possess at least one focal metric. Column id is the primary key; column y is a foreign key referencing t_metric_observed_by_event.id; column x stores the focal class.

```sql
CREATE TABLE t_mass_function_min_one_focal (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_metric_observed_by_event(id)
);
```

| id | x | y |
|----|---|---|
| mf001 | FocalMass_LabResult | m001 |
| mf002 | FocalMass_LabResult | m002 |
| mf003 | FocalMass_Calibration | m003 |
| mf004 | FocalMass_LabResult | m004 |
| mf005 | FocalMass_Calibration | m005 |
| mf006 | FocalMass_LabResult | m001 |

## 6 Cross-join example

Question: Which focal mass function, claim, and evidence share the same underlying audit event as metric m001?

Join path: t_mass_function_min_one_focal.y = t_metric_observed_by_event.id, then align x values across t_claim_observed_by_event and t_evidence_observed_by_process on the common event class AuditEvent_2023-09-12.

Resulting joined row:
- mf001, FocalMass_LabResult, m001, c001, e001

```json
{"tables":[{"name":"t_metric_observed_by_event","rows":[["m001","AuditEvent_2023-09-12"],["m002","AuditEvent_2023-09-12"],["m003","AuditEvent_2023-10-03"],["m004","AuditEvent_2023-10-03"],["m005","AuditEvent_2023-11-15"]]},{"name":"t_evidence_observed_by_process","rows":[["e001","SampleProcessingRun"],["e002","SampleProcessingRun"],["e003","CalibrationRun"],["e004","CalibrationRun"],["e005","SampleProcessingRun"]]},{"name":"t_claim_observed_by_event","rows":[["c001","AuditEvent_2023-09-12"],["c002","AuditEvent_2023-10-03"],["c003","AuditEvent_2023-11-15"],["c004","AuditEvent_2023-09-12"],["c005","AuditEvent_2023-10-03"]]},{"name":"t_audit_produces_evidence","rows":[["a001","Audit_2023-09-12"],["a002","Audit_2023-10-03"],["a003","Audit_2023-11-15"],["a004","Audit_2023-09-12"],["a005","Audit_2023-10-03"]]},{"name":"t_mass_function_min_one_focal","rows":[["mf001","FocalMass_LabResult","m001"],["mf002","FocalMass_LabResult","m002"],["mf003","FocalMass_Calibration","m003"],["mf004","FocalMass_LabResult","m004"],["mf005","FocalMass_Calibration","m005"],["mf006","FocalMass_LabResult","m001"]]}]}
```