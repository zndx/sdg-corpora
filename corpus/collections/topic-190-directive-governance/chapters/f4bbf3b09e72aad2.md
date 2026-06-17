---
chapter_id: f4bbf3b09e72aad2
topic_id: 190
family: 07_long_tail
cited_terms: ['trace_supports_claim', 'attestation_signed_by', 'column_lineage_for_compliance_claim', 'attestation_min_one_signer', 'kernel_anomaly_supports_claim']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Ontological Formalization of Audit Evidence and Attestation

## 7.1 Scope and Preamble

This chapter establishes the formal ontological criteria for classifying audit evidence, attestation processes, and compliance artifacts within a governed information system. The definitions provided herein are grounded in the Basic Formal Ontology (BFO) and the Common Core Ontologies (CCO), ensuring that data lineage, digital signatures, and system anomalies are represented with the rigor required for regulatory reporting and high-assurance compliance. The following sections detail five specific axioms that map complex governance concepts to machine-readable relational structures, facilitating the automated validation of audit trails and the verification of custodial responsibilities.

## 7.2 Trace Supports Claim

In the context of digital forensics and continuous auditing, a "trace" is not merely a log entry but a distinct temporal process (bfo:0000015) that serves as evidentiary backing for a specific assertion. The axiom `trace_supports_claim` formalizes this by asserting that a specific class of trace processes exists primarily to substantiate a Descriptive Information Content Entity (DescriptiveICE). A DescriptiveICE is a proposition or statement regarding the state of the world—in this case, a compliance claim or a factual assertion about system behavior.

For a trace to be admissible as evidence, it must be demonstrably connected to the claim it supports. This connection is not causal but evidentiary; the trace process (e.g., a database transaction log) provides the provenance necessary to verify the DescriptiveICE (e.g., "the record was not altered post-submission"). This axiom is critical for establishing the "chain of custody" for digital records, ensuring that every compliance assertion is anchored in a verifiable process occurrence.

**Table 7.1** instantiates this axiom by listing specific trace process classes that satisfy the requirement of supporting a descriptive claim. The primary key is the unique identifier for the trace class, while the `x` column denotes the specific class of the process acting as evidence.

| id | x |
| :--- | :--- |
| LOG-2023-001 | SystemLoginTrace |
| LOG-2023-002 | APITransactionLog |
| LOG-2023-003 | DatabaseCommitTrace |
| LOG-2023-004 | FileAccessAuditLog |
| LOG-2023-005 | ConfigurationChangeTrace |

## 7.3 Attestation Signed By

Attestation represents the formal act of vouching for the accuracy or integrity of information. Under the axiom `attestation_signed_by`, we define attestation as a process (bfo:0000015) that carries the specific property of being signed by an agent. This axiom binds the process of attestation to a `cco:Person`, establishing non-repudiation and assigning accountability. In regulatory frameworks, this distinction is vital: it separates automated system logs from acts of human verification.

The "signing" referenced here may be digital (cryptographic) or physical (wet ink), but ontologically it functions as a relation that links the process to a responsible party. This ensures that the artifact or claim being attested to is not floating in a vacuum of system-generated noise but is explicitly endorsed by a legal or functional person. This axiom supports the "Directive Governance" family by enforcing the requirement that governance directives must be explicitly ratified by authorized individuals.

**Table 7.2** illustrates various attestation processes and the classes of persons authorized to execute them. The table structure relies on the `id` as the primary key for the attestation event, with `x` representing the class of the signer involved in the process.

| id | x |
| :--- | :--- |
| ATT-2023-A1 | SeniorAuditor |
| ATT-2023-B2 | DataProtectionOfficer |
| ATT-2023-C3 | ComplianceOfficer |
| ATT-2023-D4 | SystemAdministrator |
| ATT-2023-E5 | ChiefInformationSecurityOfficer |

## 7.4 Column Lineage for Compliance Claim

Data lineage is a foundational component of data governance, particularly when validating that reported figures or metrics derive from authorized source data. The axiom `column_lineage_for_compliance_claim` addresses this by defining a specific class of artifacts that serve as the bridge between raw data and compliance assertions. Here, the subject is an `cco:Artifact`—a dependent continuant that typically represents a data mapping document, a transformation script, or an ETL (Extract, Transform, Load) specification.

This artifact supports a claim (DescriptiveICE) by demonstrating the mathematical or logical path from a source column to a target report element. For example, an artifact might define how "Column A" in the raw ledger is aggregated and normalized to populate "Line Item 1" on the regulatory report. This artifact is the evidence that the transformation is valid, consistent, and repeatable. Without this formal linkage, compliance claims regarding data accuracy are unsubstantiated.

**Table 7.3** catalogs artifacts that define these critical lineage paths. The `id` serves as the unique reference for the artifact, and `x` denotes the specific class of the artifact (e.g., a mapping specification or transformation logic) that supports the compliance claim.

| id | x |
| :--- | :--- |
| ART-LIN-01 | PIIDataMappingSpec |
| ART-LIN-02 | FinancialAggregationScript |
| ART-LIN-03 | PatientDeIdentificationLogic |
| ART-LIN-04 | TaxCalculationMatrix |
| ART-LIN-05 | MetricNormalizationRule |

## 7.5 Attestation Min One Signer

Building upon the general concept of attestation, the axiom `attestation_min_one_signer` introduces a cardinality constraint to the governance model. It asserts that for a process to be validly classified as an attestation within this framework, it must be signed by *at least one* (`min 1`) `cco:Person`. This constraint prevents the existence of "orphan" attestations—processes that appear to be approvals but lack a responsible agent.

This axiom is particularly relevant for "four-eyes principles" or dual-control environments, though it mandates a minimum of one rather than specifying a maximum. It ensures that the process of verification is not merely a procedural formality but an act of agency. In the context of audit readiness, this constraint allows automated systems to flag any attestation process where the `signedBy` property is null or empty, thereby indicating a failure in the control environment.

**Table 7.4** provides instances of attestation processes where the minimum signer requirement is enforced. The `id` uniquely identifies the attestation process instance, while `x` categorizes the class of the process (e.g., a manual review or a digital authorization workflow).

| id | x |
| :--- | :--- |
| ATT-MIN-01 | AnnualRiskAssessment |
| ATT-MIN-02 | IncidentResponseReview |
| ATT-MIN-03 | AccessGrantApproval |
| ATT-MIN-04 | PolicyChangeAuthorization |
| ATT-MIN-05 | VendorCertificationReview |

## 7.6 Kernel Anomaly Supports Claim

In the domain of system integrity and security monitoring, low-level system events often serve as the primary evidence for claims of intrusion, hardware failure, or kernel-level manipulation. The axiom `kernel_anomaly_supports_claim` classifies these occurrences as `cco:Artifact` (specifically, information artifacts such as kernel dumps or ring-0 buffer logs) that support a DescriptiveICE.

Unlike a "trace," which might follow a standard business process, a "kernel anomaly" represents a deviation from expected operational parameters at the operating system level. This artifact supports a claim—such as "the system suffered a buffer overflow" or "unauthorized code execution occurred." By formalizing this relationship, the ontology allows security incident reports to be anchored in hard technical evidence rather than speculative observation. This is essential for post-incident forensics and for satisfying regulatory requirements regarding breach notification and root cause analysis.

**Table 7.5** lists specific kernel anomaly artifacts that support descriptive claims regarding system state. The `id` is the unique identifier for the anomaly record, and `x` represents the class of the artifact (e.g., a crash dump or an interrupt log).

| id | x |
| :--- | :--- |
| KERN-ANOM-001 | KernelCrashDump |
| KERN-ANOM-002 | Ring0BufferOverflowLog |
| KERN-ANOM-003 | InterruptDesynchronizationLog |
| KERN-ANOM-004 | DriverSignatureFailureLog |
| KERN-ANOM-005 | MemoryPageViolationLog |

```json
{
  "tables": [
    {
      "name": "t_trace_supports_claim",
      "rows": [
        [
          "LOG-2023-001",
          "SystemLoginTrace"
        ],
        [
          "LOG-2023-002",
          "APITransactionLog"
        ],
        [
          "LOG-2023-003",
          "DatabaseCommitTrace"
        ],
        [
          "LOG-2023-004",
          "FileAccessAuditLog"
        ],
        [
          "LOG-2023-005",
          "ConfigurationChangeTrace"
        ]
      ]
    },
    {
      "name": "t_attestation_signed_by",
      "rows": [
        [
          "ATT-2023-A1",
          "SeniorAuditor"
        ],
        [
          "ATT-2023-B2",
          "DataProtectionOfficer"
        ],
        [
          "ATT-2023-C3",
          "ComplianceOfficer"
        ],
        [
          "ATT-2023-D4",
          "SystemAdministrator"
        ],
        [
          "ATT-2023-E5",
          "ChiefInformationSecurityOfficer"
        ]
      ]
    },
    {
      "name": "t_column_lineage_for_compliance_claim",
      "rows": [
        [
          "ART-LIN-01",
          "PIIDataMappingSpec"
        ],
        [
          "ART-LIN-02",
          "FinancialAggregationScript"
        ],
        [
          "ART-LIN-03",
          "PatientDeIdentificationLogic"
        ],
        [
          "ART-LIN-04",
          "TaxCalculationMatrix"
        ],
        [
          "ART-LIN-05",
          "MetricNormalizationRule"
        ]
      ]
    },
    {
      "name": "t_attestation_min_one_signer",
      "rows": [
        [
          "ATT-MIN-01",
          "AnnualRiskAssessment"
        ],
        [
          "ATT-MIN-02",
          "IncidentResponseReview"
        ],
        [
          "ATT-MIN-03",
          "AccessGrantApproval"
        ],
        [
          "ATT-MIN-04",
          "PolicyChangeAuthorization"
        ],
        [
          "ATT-MIN-05",
          "VendorCertificationReview"
        ]
      ]
    },
    {
      "name": "t_kernel_anomaly_supports_claim",
      "rows": [
        [
          "KERN-ANOM-001",
          "KernelCrashDump"
        ],
        [
          "KERN-ANOM-002",
          "Ring0BufferOverflowLog"
        ],
        [
          "KERN-ANOM-003",
          "InterruptDesynchronizationLog"
        ],
        [
          "KERN-ANOM-004",
          "DriverSignatureFailureLog"
        ],
        [
          "KERN-ANOM-005",
          "MemoryPageViolationLog"
        ]
      ]
    }
  ]
}
```