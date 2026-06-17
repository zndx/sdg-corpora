---
chapter_id: eb52ed0bd6e7fd59
topic_id: 112
family: 06_belief_structure
cited_terms: ['mass_function_subclass', 'attestation_with_supporting_evidence', 'claim_refuted_by_evidence', 'claim_not_disconfirmed']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Evidential Reasoning and Belief Structures in Compliance Governance

This chapter delineates the formal ontological structures required to model evidential reasoning within high-assurance compliance frameworks. It provides a rigorous examination of how descriptive claims, evidentiary processes, and belief functions interact to establish verifiable governance artifacts. The discussion is anchored in the axiomatization of belief structures, specifically focusing on the derivation of mass functions, the role of attestation, and the logical status of claims under scrutiny. Readers will be introduced to the relational schemata necessary to implement these concepts in a persistent audit layer, ensuring that all governance assertions are traceable to their evidentiary roots.

## 4.1 Mass Functions over Frames of Discernment

In the context of evidential reasoning, a "mass function" serves as a mathematical and logical representation of subjective belief, distinct from classical probability. It operates over a "frame of discernment"—a set of mutually exclusive and exhaustive hypotheses representing the possible states of the world regarding a specific compliance parameter. Within the ontology, the axiom `mass_function_subclass` posits that a specific Information Content Entity (ICE), representing a belief distribution, is a subclass of descriptive ICE that operates over a specific frame of discernment.

This structure is critical for auditability because it forces the explicit declaration of the hypothesis space before any belief is assigned. A governance framework cannot merely assert a belief; it must define the boundaries of that belief (the frame) and the process that validates it. The relationship is recursive in nature: the mass function (the belief) is defined by the frame, but the validity of the frame is often confirmed by the attestation process. This creates a dependency where the belief structure (`X`) relies on the integrity of the frame (`Y`), which in turn is instantiated through an attestation process.

The following table embodies the `mass_function_subclass` axiom. It illustrates specific belief distributions (`x`) regarding compliance states, defined over specific frames of discernment (`y`). The primary key is `id`, and the foreign key `y` establishes a mandatory link to an attestation record, ensuring that every frame of discernment is formally recognized and supported by a governance process.

| id | x | y |
|---|---|---|
| mf_001 | BeliefInTransactionLegitimacy | att_001 |
| mf_002 | BeliefInDataSovereignty | att_002 |
| mf_003 | BeliefInAccessControlIntegrity | att_003 |
| mf_004 | BeliefInAuditLogCompleteness | att_004 |
| mf_005 | BeliefInNetworkSegmentation | att_005 |

To illustrate, consider `mf_001`. The entity `BeliefInTransactionLegitimacy` is not a floating abstraction; it is a mass function defined strictly over the frame of discernment identified by `att_001`. In a practical audit scenario, this might represent the aggregation of evidence regarding a specific transaction set, where the frame includes hypotheses such as "Valid," "Suspicious," or "Fraudulent." The mass function assigns a degree of belief to these subsets. By linking this to an attestation, the organization ensures that the very definition of what constitutes "legitimacy" has been vetted and documented.

## 4.2 Attestation with Supporting Evidence

While mass functions describe the *state* of belief, attestation describes the *process* of verification. According to the axiom `attestation_with_supporting_evidence`, an attestation is a process (specifically, a `bfo:Process`) that possesses supporting evidence. This distinction is vital: governance is not static; it is an activity. An attestation is the temporal act of verifying a claim, and it must be substantiated by artifacts—logs, receipts, system outputs, or peer reviews—that constitute the supporting evidence.

In this relational model, the attestation process (`X`) is substantiated by its supporting evidence (`Y`). However, the schema reveals a sophisticated feedback loop: the supporting evidence (`Y`) for the attestation is itself a mass function. This implies that evidence is not merely raw data but is interpreted data—a belief structure. The attestation process relies on the existence of a mass function (the interpreted evidence) to function. This enforces a standard where raw data must be elevated to the status of "evidence" (a belief about the data) before it can support an attestation.

The table below represents the `attestation_with_supporting_evidence` axiom. It defines the attestation processes (`x`) and the specific mass functions (`y`) that serve as their supporting evidence. The primary key is `id`, and the foreign key `y` references the mass function being utilized as proof, creating a tight coupling between the process of verification and the belief structure it relies upon.

| id | x | y |
|---|---|---|
| att_001 | QuarterlyTransactionAudit | mf_001 |
| att_002 | DataResidencyVerification | mf_002 |
| att_003 | RoleBasedAccessControlReview | mf_003 |
| att_004 | LogRetentionVerification | mf_004 |
| att_005 | FirewallConfigurationAudit | mf_005 |

For instance, `att_002` represents the `DataResidencyVerification` process. This process does not occur in a vacuum; it requires supporting evidence. That evidence is `mf_002` (`BeliefInDataSovereignty`). This indicates that the auditor has performed an analysis (created a mass function) regarding where the data resides and has assigned belief to the hypothesis that the data is within the correct jurisdiction. The attestation process consumes this belief structure to formally sign off on compliance. This architecture prevents "empty" attestations—processes that claim verification without referencing the specific analytical artifacts that justify them.

## 4.3 Claims Refuted by Evidence

A robust governance framework must account for the failure of compliance postulates. The axiom `claim_refuted_by_evidence` formalizes the negation of a descriptive claim. It asserts that a specific claim (an ICE) is refuted by specific evidence. This is distinct from a claim being false; it is a stronger, evidential assertion that the claim has been actively disproven by the available data.

This concept is central to the "findings" phase of an audit. When a control is claimed to be effective, but testing reveals a deficiency, the claim is not merely "not true"—it is *refuted*. The ontology captures this by linking the refuted claim (`X`) to the evidence (`Y`) that performed the refutation. Structurally, the evidence (`Y`) is an attestation. This makes logical sense: refutation is rarely the result of raw data alone; it is the result of a test or an attestation process that produced a negative result.

The following table embodies the `claim_refuted_by_evidence` axiom. It lists claims (`x`) that have been actively disproven and the attestation processes (`y`) that provided the refuting evidence. The primary key is `id`, and the foreign key `y` ensures that every refutation is traceable to a specific audit or test event.

| id | x | y |
|---|---|---|
| ref_001 | ClaimOfOfflineEncryption | att_005 |
| ref_002 | ClaimOfManualReviewCompletion | att_003 |
| ref_003 | ClaimOfImmutableLogs | att_004 |
| ref_004 | ClaimOfUserConsent | att_001 |
| ref_005 | ClaimOfVendorCompliance | att_002 |

Consider the row `ref_001`. The `ClaimOfOfflineEncryption` might be a standard assertion by a system vendor. However, the attestation `att_005` (the `FirewallConfigurationAudit`) may have revealed that the encryption keys are actually managed by an online service, thereby refuting the claim. By recording this in the schema, the organization maintains a permanent record of *why* the claim was rejected. This is crucial for regulatory reporting, as it shifts the burden of proof from a simple denial to a specific, documented evidentiary cause.

## 4.4 Claims Not Disconfirmed

In formal logic and evidential reasoning, the absence of evidence is not evidence of absence. The axiom `claim_not_disconfirmed` captures the Open World Assumption (OWA) often required in complex governance environments. It states that a claim (`X`) is *not* a specific class (`Y`)—typically, "Disconfirmed" or "Refuted." This represents a state of "limbo" or "pending status" where a claim has neither been proven true nor actively refuted.

This distinction is vital for risk management. A claim that is "not disconfirmed" is treated differently from a "verified" claim. It represents a residual uncertainty or a gap in the audit coverage. For example, if a specific control cannot be tested due to technical limitations, the claim of its effectiveness is "not disconfirmed," but it cannot be attested as true. This allows the ontology to accurately model the state of the governance environment without forcing false positives.

The table below embodies the `claim_not_disconfirmed` axiom. It lists claims (`x`) and the specific status or class (`y`) that they are definitively *not* associated with. The primary key is `id`. Unlike previous tables, this structure does not require a foreign key to an attestation, as the status of "not disconfirmed" may arise from a lack of attestation rather than a specific one.

| id | x | y |
|---|---|---|
| nd_001 | ClaimOfLegacySystemPatch | DisconfirmedStatus |
| nd_002 | ClaimOfThirdPartyAccessLog | DisconfirmedStatus |
| nd_003 | ClaimOfDisasterRecoveryTest | DisconfirmedStatus |
| nd_004 | ClaimOfEmployeeTraining | DisconfirmedStatus |
| nd_005 | ClaimOfDataAnonymization | DisconfirmedStatus |

For example, `nd_001` represents the `ClaimOfLegacySystemPatch`. The audit team may not have had access to the legacy system to verify the patch level. Therefore, they cannot refute the claim. The record shows that this claim is *not* `DisconfirmedStatus`. In a compliance report, this would trigger a "review required" or "unable to verify" flag, rather than a "pass" or "fail." This nuance is lost in binary systems but is preserved in this ontological approach, allowing for more granular risk assessment and resource allocation for future audits.

```json
{
  "tables": [
    {
      "name": "t_mass_function_subclass",
      "rows": [
        ["mf_001", "BeliefInTransactionLegitimacy", "att_001"],
        ["mf_002", "BeliefInDataSovereignty", "att_002"],
        ["mf_003", "BeliefInAccessControlIntegrity", "att_003"],
        ["mf_004", "BeliefInAuditLogCompleteness", "att_004"],
        ["mf_005", "BeliefInNetworkSegmentation", "att_005"]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        ["att_001", "QuarterlyTransactionAudit", "mf_001"],
        ["att_002", "DataResidencyVerification", "mf_002"],
        ["att_003", "RoleBasedAccessControlReview", "mf_003"],
        ["att_004", "LogRetentionVerification", "mf_004"],
        ["att_005", "FirewallConfigurationAudit", "mf_005"]
      ]
    },
    {
      "name": "t_claim_refuted_by_evidence",
      "rows": [
        ["ref_001", "ClaimOfOfflineEncryption", "att_005"],
        ["ref_002", "ClaimOfManualReviewCompletion", "att_003"],
        ["ref_003", "ClaimOfImmutableLogs", "att_004"],
        ["ref_004", "ClaimOfUserConsent", "att_001"],
        ["ref_005", "ClaimOfVendorCompliance", "att_002"]
      ]
    },
    {
      "name": "t_claim_not_disconfirmed",
      "rows": [
        ["nd_001", "ClaimOfLegacySystemPatch", "DisconfirmedStatus"],
        ["nd_002", "ClaimOfThirdPartyAccessLog", "DisconfirmedStatus"],
        ["nd_003", "ClaimOfDisasterRecoveryTest", "DisconfirmedStatus"],
        ["nd_004", "ClaimOfEmployeeTraining", "DisconfirmedStatus"],
        ["nd_005", "ClaimOfDataAnonymization", "DisconfirmedStatus"]
      ]
    }
  ]
}
```