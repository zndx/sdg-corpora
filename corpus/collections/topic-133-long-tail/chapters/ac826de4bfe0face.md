---
chapter_id: ac826de4bfe0face
topic_id: 133
family: 07_long_tail
cited_terms: ['trace_supports_claim', 'gdpr_lawful_basis', 'column_lineage_for_compliance_claim', 'kernel_anomaly_supports_claim', 'attestation_about_compliance_claim']
model: xai/grok-4.3
---

# Compliance Claim Traceability in Audit Systems

This chapter defines five table structures that record how process traces, directives, artifacts, and attestations participate in claim support under GDPR constraints. The structures derive directly from the listed OWL axioms and are populated with instance references that satisfy the subclass and existential restrictions. Primary keys are the id columns; cross-table navigation occurs by matching x and y values that denote the same DescriptiveICE or DirectiveICE individuals.

## 1. Trace Support for Descriptive Claims

Axiom trace_supports_claim is embodied by table t_trace_supports_claim. The id column is the primary key. The x column holds the identifier of a bfo:0000015 process that supports a cco:DescriptiveICE claim. Matching an x value to an x value in another table yields the DescriptiveICE supported by multiple process types.

```sql
CREATE TABLE t_trace_supports_claim (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
| --- | --- |
| tr-001 | ProcessingActivityLog |
| tr-002 | DataTransferTrace |
| tr-003 | RetentionScheduleExecution |
| tr-004 | AccessControlAudit |
| tr-005 | ConsentWithdrawalLog |

## 1.1 Lawful Basis for Directives

Axiom gdpr_lawful_basis is embodied by table t_gdpr_lawful_basis. The id column is the primary key. The x column references a cco:DirectiveICE; the y column references the Class that supplies the lawful basis. Joining on x to an x value in t_trace_supports_claim links a directive to the process trace that supports its associated claim.

```sql
CREATE TABLE t_gdpr_lawful_basis (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
```

| id | x | y |
| --- | --- | --- |
| lb-001 | ConsentDirective | Consent |
| lb-002 | ContractPerformanceDirective | Contract |
| lb-003 | LegalObligationDirective | LegalObligation |
| lb-004 | VitalInterestsDirective | VitalInterests |
| lb-005 | PublicTaskDirective | PublicTask |
| lb-006 | LegitimateInterestsDirective | LegitimateInterests |

## 1.2 Column Lineage Artifacts Supporting Claims

Axiom column_lineage_for_compliance_claim is embodied by table t_column_lineage_for_compliance_claim. The id column is the primary key. The x column holds the identifier of a cco:Artifact whose lineage supports a cco:DescriptiveICE claim. An x value may be joined to an x value in t_trace_supports_claim to retrieve the process that produced the lineage artifact.

```sql
CREATE TABLE t_column_lineage_for_compliance_claim (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
| --- | --- |
| cl-001 | CustomerEmailLineage |
| cl-002 | TransactionAmountLineage |
| cl-003 | HealthRecordIdentifierLineage |
| cl-004 | LocationHistoryLineage |
| cl-005 | MarketingPreferenceLineage |

## 2. Kernel Anomaly Artifacts Supporting Claims

Axiom kernel_anomaly_supports_claim is embodied by table t_kernel_anomaly_supports_claim. The id column is the primary key. The x column holds the identifier of a cco:Artifact that records an anomaly and supports a cco:DescriptiveICE claim. Matching x values across this table and t_column_lineage_for_compliance_claim identifies artifacts that both carry lineage and report anomalies.

```sql
CREATE TABLE t_kernel_anomaly_supports_claim (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
| --- | --- |
| ka-001 | ProcessingLatencyAnomaly |
| ka-002 | UnauthorizedFieldAccessAnomaly |
| ka-003 | RetentionOverrunAnomaly |
| ka-004 | ConsentMismatchAnomaly |
| ka-005 | CrossBorderTransferAnomaly |

## 2.1 Attestations About Compliance Claims

Axiom attestation_about_compliance_claim is embodied by table t_attestation_about_compliance_claim. The id column is the primary key. The x column holds the identifier of a bfo:0000015 process that attests to a cco:DescriptiveICE claim. Joining on x to an x value in t_gdpr_lawful_basis retrieves the directive whose lawful basis is attested by the same process.

```sql
CREATE TABLE t_attestation_about_compliance_claim (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
| --- | --- |
| at-001 | ExternalAuditorReview |
| at-002 | InternalComplianceSignOff |
| at-003 | RegulatorNotification |
| at-004 | DataProtectionOfficerAttestation |
| at-005 | ThirdPartyCertification |

## 3. Multi-Hop Query Example

Question: Which lawful basis applies to the directive whose supporting claim is attested by ExternalAuditorReview and whose trace is ProcessingActivityLog?

Start with t_attestation_about_compliance_claim where x = ExternalAuditorReview. The matching x value ProcessingActivityLog appears in t_trace_supports_claim (id tr-001). The same x value appears in t_gdpr_lawful_basis (id lb-001) with y = Consent. The joined row is therefore:

- attestation id: at-001
- trace id: tr-001
- directive x: ConsentDirective
- lawful basis y: Consent

```json
{"tables": [{"name": "t_trace_supports_claim", "rows": [["tr-001", "ProcessingActivityLog"], ["tr-002", "DataTransferTrace"], ["tr-003", "RetentionScheduleExecution"], ["tr-004", "AccessControlAudit"], ["tr-005", "ConsentWithdrawalLog"]]}, {"name": "t_gdpr_lawful_basis", "rows": [["lb-001", "ConsentDirective", "Consent"], ["lb-002", "ContractPerformanceDirective", "Contract"], ["lb-003", "LegalObligationDirective", "LegalObligation"], ["lb-004", "VitalInterestsDirective", "VitalInterests"], ["lb-005", "PublicTaskDirective", "PublicTask"], ["lb-006", "LegitimateInterestsDirective", "LegitimateInterests"]]}, {"name": "t_column_lineage_for_compliance_claim", "rows": [["cl-001", "CustomerEmailLineage"], ["cl-002", "TransactionAmountLineage"], ["cl-003", "HealthRecordIdentifierLineage"], ["cl-004", "LocationHistoryLineage"], ["cl-005", "MarketingPreferenceLineage"]]}, {"name": "t_kernel_anomaly_supports_claim", "rows": [["ka-001", "ProcessingLatencyAnomaly"], ["ka-002", "UnauthorizedFieldAccessAnomaly"], ["ka-003", "RetentionOverrunAnomaly"], ["ka-004", "ConsentMismatchAnomaly"], ["ka-005", "CrossBorderTransferAnomaly"]]}, {"name": "t_attestation_about_compliance_claim", "rows": [["at-001", "ExternalAuditorReview"], ["at-002", "InternalComplianceSignOff"], ["at-003", "RegulatorNotification"], ["at-004", "DataProtectionOfficerAttestation"], ["at-005", "ThirdPartyCertification"]]}]}
```