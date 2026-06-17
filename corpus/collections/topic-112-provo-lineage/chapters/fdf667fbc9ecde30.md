---
chapter_id: fdf667fbc9ecde30
topic_id: 112
family: 06_belief_structure
cited_terms: ['mass_function_subclass', 'attestation_with_supporting_evidence', 'claim_refuted_by_evidence', 'claim_not_disconfirmed']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Ontological Structures of Evidence and Belief in Governance Audits

## 4.1 Scope and Preamble

This chapter delineates the formal ontological structures required to model evidence chains, belief assignments, and refutation logic within a high-assurance governance framework. The content herein is intended for systems architects and compliance officers responsible for implementing audit trails that satisfy rigorous evidentiary standards. We define the precise relationships between Information Content Entities (ICE), processes of attestation, and the logical negation of claims through the lens of the Basic Formal Ontology (BFO) and the Common Core Ontologies (CCO). The mappings provided are deterministic, ensuring that every assertion of belief is anchored to a verifiable frame of discernment and supported by independent evidentiary artifacts.

## 4.2 Mass Function Subclass and Frames of Discernment

### 4.2.1 Conceptual Definition

In the context of epistemic auditing, a "Mass Function" represents a mathematical assignment of belief to a specific subset of hypotheses. Unlike a simple probability distribution, a mass function allows for the explicit allocation of belief to the set of hypotheses themselves, representing uncertainty or ignorance. Within this ontology, the entity `{X}` is classified as a `cco:DescriptiveICE` (Descriptive Information Content Entity) and is constrained by the axiom `mass_function_subclass`.

The critical constraint imposed by this axiom is that `{X}` must operate `sdg:overFrameOfDiscernment` some `{Y}`. The "Frame of Discernment" constitutes the exhaustive set of mutually exclusive propositions relevant to a specific audit query. In this schema, the Frame of Discernment is not merely an abstract set but is modeled as a specific instance of an attestation process (as detailed in Section 4.3). This linkage ensures that the belief mass is not floating in a vacuum but is strictly bounded by the operational context of the evidence collection process.

### 4.2.2 Relational Implementation

The implementation of this axiom requires a rigid foreign key structure. The primary key of the mass function entity must reference a valid attestation process. This enforces the rule that a belief assignment (`{X}`) cannot exist without a defined, procedural context (`{Y}`) that establishes the boundaries of what is being discerned.

The following table illustrates instances of Mass Functions defined over specific Attestation contexts. Note that the `y` column serves as a foreign key to the attestation records, grounding the belief in the procedural reality of the audit.

**Table 4.1: Mass Function Instances and Discernment Frames**

| id | x | y |
| :--- | :--- | :--- |
| mf_101 | ServerAvailabilityBelief | att_proc_01 |
| mf_102 | DataIntegrityAssessment | att_proc_02 |
| mf_103 | UserAuthVerification | att_proc_03 |
| mf_104 | NetworkSegregationProof | att_proc_04 |
| mf_105 | EncryptionStandardCompliance | att_proc_05 |

*Table 4.1 Notes:*
*   **Column `x`**: Represents the specific DescriptiveICE (the belief or claim).
*   **Column `y`**: Represents the Frame of Discernment (ID of the Attestation process).
*   **Constraint**: `y` must exist in `t_attestation_with_supporting_evidence`.

### 4.2.3 Audit Implications

When an auditor encounters a Mass Function entry such as `ServerAvailabilityBelief`, the ontology mandates that they consult the referenced Frame of Discernment (`att_proc_01`). This frame defines the universe of discourse—e.g., whether the server is considered "available" only if it responds to HTTP pings, or if SSH connectivity is also required. Without this reference, the belief mass is semantically undefined and therefore non-compliant with the governance framework.

## 4.3 Attestation with Supporting Evidence

### 4.3.1 Conceptual Definition

Attestation is the formal process of vouching for the truth or validity of a state of affairs. Ontologically, `{X}` in this axiom is a subclass of `bfo:0000015` (Process). It is an occurrence that happens in time, performed by an agent or system, to validate a specific condition. The axiom `attestation_with_supporting_evidence` posits that for an attestation process to be valid within the system, it must possess the property `sdg:withSupportingEvidence`.

This structure creates a recursive dependency between belief and process. While the Mass Function (Section 4.2) relies on an Attestation to define its Frame, the Attestation relies on a Mass Function (or another evidentiary artifact) to support its validity. This circularity is intentional and models the "evidence chain" required in high-trust environments: a belief is defined by a process, and that process is justified by evidence which itself may be a belief assignment derived from a prior process.

### 4.3.2 Relational Implementation

The schema for `t_attestation_with_supporting_evidence` enforces that every attestation record (`id`) must point to a supporting evidentiary record (`y`). In the data model, the supporting evidence (`y`) is typed as a reference to a Mass Function. This implies that the "evidence" is treated as an informational entity carrying a belief mass.

**Table 4.2: Attestation Processes and Evidentiary Support**

| id | x | y |
| :--- | :--- | :--- |
| att_proc_01 | UptimeMonitorCheck | mf_101 |
| att_proc_02 | HashVerificationRoutine | mf_102 |
| att_proc_03 | KerberosLogAnalysis | mf_103 |
| att_proc_04 | FirewallConfigAudit | mf_104 |
| att_proc_05 | CryptographicModuleTest | mf_105 |

*Table 4.2 Notes:*
*   **Column `x`**: The specific Attestation Process (e.g., a script execution, a manual review).
*   **Column `y`**: The Supporting Evidence (ID of the Mass Function).
*   **Constraint**: `y` must exist in `t_mass_function_subclass`.

### 4.3.3 Verification Logic

The data in Tables 4.1 and 4.2 demonstrates a closed loop of verification. For instance, the `ServerAvailabilityBelief` (mf_101) is defined over the frame of `UptimeMonitorCheck` (att_proc_01). Conversely, the `UptimeMonitorCheck` process is supported by the evidence contained within `ServerAvailabilityBelief`. While this appears circular, in a temporal audit log, these represent different snapshots: the attestation is the *act* of checking, while the mass function is the *record* of the result derived from a previous cycle or a lower-level sensor input. This structure ensures that no assertion is self-certifying; it must point to an externalized process, and that process must consume an evidence artifact.

## 4.4 Claim Refutation by Evidence

### 4.4.1 Conceptual Definition

Not all evidentiary processes result in the confirmation of a hypothesis. A critical component of any governance framework is the ability to formally record the refutation of a claim. The axiom `claim_refuted_by_evidence` defines a relationship where a DescriptiveICE (`{X}`) is negated or invalidated by the presence of specific evidence (`{Y}`).

In this schema, `{X}` represents a claim that has been put forward (perhaps by a user, a system, or a previous audit stage) and `{Y}` represents the attestation that actively disproves it. The relationship `sdg:refutedByEvidence` is distinct from a mere lack of confirmation; it is a positive assertion of falsehood based on contradictory data.

### 4.4.2 Relational Implementation

The table `t_claim_refuted_by_evidence` links the refuted claim to the attestation that provided the disproving data. The foreign key constraint ensures that the refutation is always backed by a valid, recorded process instance (`attestation`), rather than an arbitrary assertion.

**Table 4.3: Refuted Claims and Disproving Attestations**

| id | x | y |
| :--- | :--- | :--- |
| ref_01 | ClaimOfAdminAccess | att_proc_03 |
| ref_02 | ClaimOfOpenPort80 | att_proc_04 |
| ref_03 | ClaimOfWeakCipher | att_proc_05 |
| ref_04 | ClaimOfPhysicalAccess | att_proc_06 |
| ref_05 | ClaimOfDataExfiltration | att_proc_07 |

*Table 4.3 Notes:*
*   **Column `x`**: The Claim (DescriptiveICE) being refuted.
*   **Column `y`**: The Attestation Process ID that provides the refuting evidence.
*   **Constraint**: `y` must exist in `t_attestation_with_supporting_evidence`.

### 4.4.3 Governance Impact

Recording refutations is essential for maintaining the integrity of the compliance posture. For example, if a system logs a `ClaimOfAdminAccess` (ref_01), but the attestation `KerberosLogAnalysis` (att_proc_03) reveals that the session ID was associated with a guest account, the claim is formally refuted. This entry prevents the erroneous claim from being aggregated into a risk assessment as a valid "positive" finding. The ontology treats the refutation as a first-class object, ensuring that negative findings are preserved with the same rigor as positive confirmations.

## 4.5 Claim Not Disconfirmed

### 4.5.1 Conceptual Definition

The final axiom, `claim_not_disconfirmed`, addresses the logical state of a claim that has not been refuted, but may also not have been positively affirmed to a degree of certainty. In formal logic, this is distinct from "proven true"; it merely indicates that the negation of the claim is not supported by available evidence.

Ontologically, `{X}` is a `cco:DescriptiveICE` that bears the relationship `not {Y}`. Here, `{Y}` represents a conflicting claim or a specific state of invalidity. This axiom is crucial for managing "open" items in an audit—assertions that remain plausible because no evidence has been found to disprove them, yet sufficient evidence to fully validate them is pending.

### 4.5.2 Relational Implementation

The table `t_claim_not_disconfirmed` is structurally simpler, lacking foreign key dependencies to other tables in this specific schema subset. It records the disjointness or the non-refutation status of claims. This allows the system to query for all claims that are currently "standing" without implying they are "verified."

**Table 4.4: Non-Disconfirmed Claims and Logical Exclusions**

| id | x | y |
| :--- | :--- | :--- |
| nd_01 | HypothesisInternalThreat | HypothesisExternalAttack |
| nd_02 | StatusServiceRunning | StatusServiceStopped |
| nd_03 | AssertionLogIntegrity | AssertionLogTampering |
| nd_04 | AssumptionCompliance | AssumptionViolation |
| nd_05 | BeliefSecureChannel | BeliefCompromisedChannel |

*Table 4.4 Notes:*
*   **Column `x`**: The Claim that is standing (not disconfirmed).
*   **Column `y`**: The state or claim that is explicitly *not* the case for `{X}`.
*   **Constraint**: None (Internal logical consistency).

### 4.5.2 Operational Usage

In practice, Table 4.4 allows the compliance engine to report on the "survivorship" of hypotheses. For instance, `HypothesisInternalThreat` (nd_01) is recorded as "not disconfirmed" relative to `HypothesisExternalAttack`. This indicates that the investigation has ruled out the external vector (or at least not confirmed it), leaving the internal hypothesis as the prevailing theory. This logical structure is vital for incident response, where narrowing the frame of discernment is often achieved by eliminating impossible states rather than immediately identifying the true one.

```json
{
  "tables": [
    {
      "name": "t_mass_function_subclass",
      "rows": [
        [
          "mf_101",
          "ServerAvailabilityBelief",
          "att_proc_01"
        ],
        [
          "mf_102",
          "DataIntegrityAssessment",
          "att_proc_02"
        ],
        [
          "mf_103",
          "UserAuthVerification",
          "att_proc_03"
        ],
        [
          "mf_104",
          "NetworkSegregationProof",
          "att_proc_04"
        ],
        [
          "mf_105",
          "EncryptionStandardCompliance",
          "att_proc_05"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "att_proc_01",
          "UptimeMonitorCheck",
          "mf_101"
        ],
        [
          "att_proc_02",
          "HashVerificationRoutine",
          "mf_102"
        ],
        [
          "att_proc_03",
          "KerberosLogAnalysis",
          "mf_103"
        ],
        [
          "att_proc_04",
          "FirewallConfigAudit",
          "mf_104"
        ],
        [
          "att_proc_05",
          "CryptographicModuleTest",
          "mf_105"
        ]
      ]
    },
    {
      "name": "t_claim_refuted_by_evidence",
      "rows": [
        [
          "ref_01",
          "ClaimOfAdminAccess",
          "att_proc_03"
        ],
        [
          "ref_02",
          "ClaimOfOpenPort80",
          "att_proc_04"
        ],
        [
          "ref_03",
          "ClaimOfWeakCipher",
          "att_proc_05"
        ],
        [
          "ref_04",
          "ClaimOfPhysicalAccess",
          "att_proc_06"
        ],
        [
          "ref_05",
          "ClaimOfDataExfiltration",
          "att_proc_07"
        ]
      ]
    },
    {
      "name": "t_claim_not_disconfirmed",
      "rows": [
        [
          "nd_01",
          "HypothesisInternalThreat",
          "HypothesisExternalAttack"
        ],
        [
          "nd_02",
          "StatusServiceRunning",
          "StatusServiceStopped"
        ],
        [
          "nd_03",
          "AssertionLogIntegrity",
          "AssertionLogTampering"
        ],
        [
          "nd_04",
          "AssumptionCompliance",
          "AssumptionViolation"
        ],
        [
          "nd_05",
          "BeliefSecureChannel",
          "BeliefCompromisedChannel"
        ]
      ]
    }
  ]
}
```