---
chapter_id: 89c8fc3f9bdfe3d7
topic_id: 56
family: 03_directive_governance
cited_terms: ['verification_produces_evidence', 'designative_subclass_basic', 'attestation_with_supporting_evidence', 'subclass_to_designative_ice']
model: xai/grok-4.3
---

# Chapter 4: Designative Information Content Entities in Attestation and Verification Processes

This chapter defines four tables that implement the axioms for designative information content entities and the processes that reference them as evidence. The tables support audit trail systems in regulatory compliance environments, where verifications and attestations must be traceable to specific designative entities.

## 1 Scope and Table Overview

The selected domain is audit trail systems for technical equipment certification. Each table is introduced with its axiom mapping, primary-key definition, and foreign-key constraints. All column values are instances consistent with the slot types declared in the axioms.

### 1.1 t_designative_subclass_basic

This table embodies AXIOM 2 by recording classes that are direct subclasses of cco:DesignativeICE. Column id is the primary key; column x holds the class name.

| id | x |
| id | x |
| dsc001 | ComplianceCertificate |
| dsc002 | AuditFinding |
| dsc003 | EquipmentCalibrationRecord |
| dsc004 | OperatorAttestation |
| dsc005 | LineMonitoringLog |

### 1.2 t_subclass_to_designative_ice

This table embodies AXIOM 4 by recording additional classes that are subclasses of cco:DesignativeICE. Column id is the primary key; column x holds the class name.

| id | x |
| id | x |
| sdi001 | TestResultSummary |
| sdi002 | SupervisionReport |
| sdi003 | BreakoutBoxConfiguration |
| sdi004 | AES67StreamValidation |

### 1.3 t_verification_produces_evidence

This table embodies AXIOM 1 by linking verification processes to the designative evidence they produce. Column id is the primary key; column y is a foreign key referencing t_designative_subclass_basic(id).

| id | x | y |
| id | x | y |
| vpe001 | DeviceVerification | dsc001 |
| vpe002 | CalibrationVerification | dsc003 |
| vpe003 | StreamVerification | dsc005 |
| vpe004 | ConfigurationVerification | dsc003 |

### 1.4 t_attestation_with_supporting_evidence

This table embodies AXIOM 3 by linking attestation processes to the designative evidence that supports them. Column id is the primary key; column y is a foreign key referencing t_designative_subclass_basic(id).

| id | x | y |
| id | x | y |
| awe001 | FinalComplianceAttestation | dsc002 |
| awe002 | OperatorQualificationAttestation | dsc004 |
| awe003 | SystemIntegrationAttestation | dsc001 |
| awe004 | MonitoringContinuityAttestation | dsc005 |

## 2 Cross-Join Demonstration

A multi-hop query can retrieve the supporting evidence class for an attestation that itself rests on evidence produced by a verification. Consider the following path: start at t_attestation_with_supporting_evidence (awe003), follow y to t_designative_subclass_basic (dsc001), then locate any verification in t_verification_produces_evidence whose y matches the same dsc001 row. The joined result yields:

- Attestation: SystemIntegrationAttestation
- Supporting evidence class: ComplianceCertificate
- Producing verification class: DeviceVerification

This trace satisfies the axioms because the attestation references a designative ICE that a verification process is declared to produce.

```json
{"tables": [{"name": "t_designative_subclass_basic", "rows": [["dsc001", "ComplianceCertificate"], ["dsc002", "AuditFinding"], ["dsc003", "EquipmentCalibrationRecord"], ["dsc004", "OperatorAttestation"], ["dsc005", "LineMonitoringLog"]]}, {"name": "t_subclass_to_designative_ice", "rows": [["sdi001", "TestResultSummary"], ["sdi002", "SupervisionReport"], ["sdi003", "BreakoutBoxConfiguration"], ["sdi004", "AES67StreamValidation"]]}, {"name": "t_verification_produces_evidence", "rows": [["vpe001", "DeviceVerification", "dsc001"], ["vpe002", "CalibrationVerification", "dsc003"], ["vpe003", "StreamVerification", "dsc005"], ["vpe004", "ConfigurationVerification", "dsc003"]]}, {"name": "t_attestation_with_supporting_evidence", "rows": [["awe001", "FinalComplianceAttestation", "dsc002"], ["awe002", "OperatorQualificationAttestation", "dsc004"], ["awe003", "SystemIntegrationAttestation", "dsc001"], ["awe004", "MonitoringContinuityAttestation", "dsc005"]]}]}
```