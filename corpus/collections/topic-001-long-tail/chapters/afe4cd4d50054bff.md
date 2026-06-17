---
chapter_id: afe4cd4d50054bff
topic_id: 1
family: 03_directive_governance
cited_terms: ['verification_min_one_evidence', 'verification_basic', 'attestation_min_one_signer', 'audit_basic', 'attestation_basic']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Directive Governance and Verification Protocols

This chapter delineates the structural and functional requirements of core governance processes within a regulated technical environment. It establishes the ontological foundations for verification, attestation, and audit activities, defining them as specific subclasses of processes that must satisfy rigorous integrity constraints. The text provides a formal analysis of evidence production and signatory authorization, ensuring that all procedural definitions align with the directive governance framework family (03_directive_governance).

## 1. Basic Verification Processes

In accordance with the Basic Formal Ontology (BFO), a process is defined as an entity that unfolds in time, possessing temporal parts and maintaining a specific identity through its duration. Within the scope of directive governance, the concept of verification is formally anchored to this definition. Specifically, any entity classified as a verification process is axiomatically a subclass of `bfo:0000015` (Process). This classification ensures that verification is not treated as a static object or a data point, but rather as a temporal occurrence that transforms the state of a system or record.

The governance framework mandates that all verification activities be registered as distinct process classes. These classes represent the types of activities performed—such as integrity checking, validation routines, or status confirmation—rather than specific instances of execution. By defining these classes as subclasses of BFO Process, the ontology enforces a temporal dimension upon them, allowing for the tracking of start times, durations, and termination states. This structural definition is critical for maintaining audit trails and ensuring that verification actions are observable and recordable events within the system log.

To illustrate the implementation of this axiom, consider the registration of standard verification protocols utilized in system maintenance. The following table catalogs the verification process classes defined within the governance schema. Each entry represents a class `X` that satisfies the condition `SubClassOf: bfo:0000015`.

**Table 1.1: Basic Verification Process Classes**
This table embodies the axiom `verification_basic`, listing the primary key (`id`) and the process class (`x`) which is a subclass of `bfo:Process`.

| id | x |
| :--- | :--- |
| ver-001 | SystemIntegrityCheck |
| ver-002 | DataValidationRoutine |
| ver-003 | ConfigurationComplianceScan |
| ver-004 | NetworkConnectivityTest |
| ver-005 | CryptographicKeyVerification |

## 2. Evidence Production in Verification

While the definition of a verification process establishes its temporal nature, the utility of such a process in a governance context is derived from its output. A verification activity that occurs without producing a record is effectively opaque to auditors and regulators. Consequently, the framework imposes a constraint upon verification processes: they must produce evidence. This is formalized by the axiom stating that a verification process is a subclass of processes that produce a minimum of one evidence artifact.

The relationship between the process and the evidence is one of production. The evidence artifact, typically a log file, a digital certificate, or a status report, serves as the persistent record that the process occurred and what its outcome was. The ontology defines this via the object property `sdg:producesEvidence`, linking the process class `X` to an evidence class `Y`. This constraint ensures that for every verification process defined in the system, there exists a corresponding class of artifact that is generated as a result. This linkage is fundamental to the concept of "evidence-anchored" governance, where assertions are always supported by tangible data artifacts.

The following table details the specific mapping between verification process classes and the classes of evidence they generate. This structure enforces the `min 1` cardinality constraint, ensuring that no verification process is defined without a corresponding output type.

**Table 2.1: Verification to Evidence Mapping**
This table embodies the axiom `verification_min_one_evidence`. The primary key is `id`; `x` represents the verification process (Foreign Key conceptually to verification classes), and `y` represents the evidence class produced, which is mandatory (NOT NULL).

| id | x | y |
| :--- | :--- | :--- |
| vme-101 | SystemIntegrityCheck | IntegrityReportLog |
| vme-102 | DataValidationRoutine | ValidationErrorSnapshot |
| vme-103 | ConfigurationComplianceScan | ComplianceDeviationRecord |
| vme-104 | NetworkConnectivityTest | LatencyMeasurementArtifact |
| vme-105 | CryptographicKeyVerification | KeyValidityCertificate |

## 3. Basic Audit Processes

Distinct from routine verification, the audit process serves as a higher-order review mechanism, often retrospective in nature. Within the ontological structure, an audit is defined strictly as a process (`bfo:0000015`). This definition aligns the audit with other temporal activities but distinguishes it by its specific purpose: the examination and evaluation of the adequacy and effectiveness of subject matter.

The classification of an activity as an "Audit Process" triggers specific governance controls, including extended retention requirements for associated records and stricter access controls. By treating the audit as a process class, the framework allows for the modeling of various audit types—financial, operational, technical, or compliance—under a single hierarchical root. This uniformity simplifies the reporting structure, allowing stakeholders to query all audit-related activities through a common parent class.

The registration of audit process classes is depicted in the table below. These classes represent the standardized categories of audits permitted within the directive governance framework.

**Table 3.1: Basic Audit Process Classes**
This table embodies the axiom `audit_basic`, listing the primary key (`id`) and the audit process class (`x`).

| id | x |
| :--- | :--- |
| aud-201 | AnnualFinancialAudit |
| aud-202 | QuarterlySecurityAudit |
| aud-203 | ThirdPartyComplianceAudit |
| aud-204 | InternalControlAudit |
| aud-205 | AccessLogAudit |

## 4. Basic Attestation Processes

Attestation functions as the formal act of declaring that a process or set of facts is true or genuine. In the context of this framework, attestation is modeled as a distinct class of process. Like verification and audit, it is axiomatically a subclass of `bfo:0000015`. However, the semantic distinction lies in the performative nature of the act: an attestation is a process of validation and assertion, often serving as the bridge between a technical verification and a human-readable confirmation.

The governance framework utilizes attestation processes to formalize sign-offs. For instance, a system administrator may perform a verification (an automated check), but a senior officer must perform an attestation (a formal acceptance of the results). By defining attestation as a process, the system can track the lifecycle of this acceptance, noting when it started and when it was concluded. This is crucial for maintaining a chain of custody and ensuring that critical system states are not merely observed but actively affirmed by authorized agents.

The following table provides the inventory of attestation process classes currently recognized by the governance ontology.

**Table 4.1: Basic Attestation Process Classes**
This table embodies the axiom `attestation_basic`, listing the primary key (`id`) and the attestation process class (`x`).

| id | x |
| :--- | :--- |
| att-301 | SystemStatusAttestation |
| att-302 | SoftwareBillOfMaterialsAttestation |
| att-303 | PrivacyPolicyComplianceAttestation |
| att-304 | IncidentContainmentAttestation |
| att-305 | ServiceLevelAgreementAttestation |

## 5. Signatory Requirements in Attestation

The validity of an attestation is intrinsically linked to agency. An attestation cannot exist in a vacuum; it requires an actor to perform the act of attesting. To enforce this requirement, the ontology introduces a constraint on attestation processes: they must be signed by at least one person. This is formalized by the axiom `sdg:signedBy min 1 cco:Person`.

This constraint ensures that every attestation process class is associated with a human agent who bears responsibility for the assertion. This prevents "orphan" attestations—automated sign-offs that lack human accountability—and enforces the principle of individual responsibility within the governance framework. The `cco:Person` entity represents the individual signer, grounding the abstract process in a specific legal or organizational identity.

While the relational schema for the process class itself focuses on the definition of the process (`X`), the axiom dictates that any instance of this class must possess a property linking it to a person. The table below lists the attestation process classes that are subject to this signatory constraint.

**Table 5.1: Attestation Processes with Signatory Requirements**
This table embodies the axiom `attestation_min_one_signer`. It lists the primary key (`id`) and the attestation process class (`x`), which is constrained by the ontology to require a signatory.

| id | x |
| :--- | :--- |
| ams-401 | SystemStatusAttestation |
| ams-402 | SoftwareBillOfMaterialsAttestation |
| ams-403 | PrivacyPolicyComplianceAttestation |
| ams-404 | IncidentContainmentAttestation |
| ams-405 | ServiceLevelAgreementAttestation |

```json
{
  "tables": [
    {
      "name": "t_verification_basic",
      "rows": [
        ["ver-001", "SystemIntegrityCheck"],
        ["ver-002", "DataValidationRoutine"],
        ["ver-003", "ConfigurationComplianceScan"],
        ["ver-004", "NetworkConnectivityTest"],
        ["ver-005", "CryptographicKeyVerification"]
      ]
    },
    {
      "name": "t_verification_min_one_evidence",
      "rows": [
        ["vme-101", "SystemIntegrityCheck", "IntegrityReportLog"],
        ["vme-102", "DataValidationRoutine", "ValidationErrorSnapshot"],
        ["vme-103", "ConfigurationComplianceScan", "ComplianceDeviationRecord"],
        ["vme-104", "NetworkConnectivityTest", "LatencyMeasurementArtifact"],
        ["vme-105", "CryptographicKeyVerification", "KeyValidityCertificate"]
      ]
    },
    {
      "name": "t_audit_basic",
      "rows": [
        ["aud-201", "AnnualFinancialAudit"],
        ["aud-202", "QuarterlySecurityAudit"],
        ["aud-203", "ThirdPartyComplianceAudit"],
        ["aud-204", "InternalControlAudit"],
        ["aud-205", "AccessLogAudit"]
      ]
    },
    {
      "name": "t_attestation_basic",
      "rows": [
        ["att-301", "SystemStatusAttestation"],
        ["att-302", "SoftwareBillOfMaterialsAttestation"],
        ["att-303", "PrivacyPolicyComplianceAttestation"],
        ["att-304", "IncidentContainmentAttestation"],
        ["att-305", "ServiceLevelAgreementAttestation"]
      ]
    },
    {
      "name": "t_attestation_min_one_signer",
      "rows": [
        ["ams-401", "SystemStatusAttestation"],
        ["ams-402", "SoftwareBillOfMaterialsAttestation"],
        ["ams-403", "PrivacyPolicyComplianceAttestation"],
        ["ams-404", "IncidentContainmentAttestation"],
        ["ams-405", "ServiceLevelAgreementAttestation"]
      ]
    }
  ]
}
```