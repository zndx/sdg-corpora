---
chapter_id: fe7baad25fa8939c
topic_id: 89
family: 03_directive_governance
cited_terms: ['control_subclass', 'dempster_conflict_mass', 'policy_supersedes', 'control_with_evidence_requirement', 'verification_produces_evidence']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Ontological Structures for Governance and Evidence Aggregation

This chapter delineates the formal ontological structures required to model high-assurance governance frameworks, specifically focusing on the integration of directive controls with quantitative evidence aggregation. The scope encompasses the definition of control subclasses, the mathematical formalization of conflict mass using Dempster-Shafer theory, and the relational dependencies between policy supersedence, evidence requirements, and verification processes. The objective is to provide a rigorous, evidence-anchored foundation for representing these concepts within a semantic knowledge graph, ensuring that audit trails and compliance metrics are both computable and logically consistent.

## 7.1 Control Subclasses and Mitigation Logic

In the context of governance frameworks, a Directive Information Content Entity (ICE) serves as the foundational semantic unit for prescriptive rules. The axiom `control_subclass` posits that a specific class of control is defined fundamentally by its capacity to mitigate a particular class of risk or threat. This relationship is not merely associative but constitutive; the identity of the control is derived from the specific vulnerability it addresses. When modeling these entities, it is insufficient to treat controls as generic strings. Instead, they must be instantiated as distinct classes inheriting from `cco:DirectiveICE`, with an object property `sdg:mitigates` linking them to the target risk class.

The practical implication of this axiom is that the efficacy of a governance framework can be queried by traversing the mitigation graph. For instance, a directive designed to enforce network segmentation is ontologically distinct from one governing data encryption because they mitigate different threat classes (e.g., lateral movement vs. data exfiltration). The relational schema projection for this axiom enforces that every mitigation control must reference a valid conflict mass identifier, ensuring that no control exists in a vacuum without a quantifiable target.

**Table 7.1: Control Subclass Instances and Mitigation Targets**

This table embodies the `control_subclass` axiom, illustrating the primary key (`id`) and the foreign key relationship (`y`) to the conflict mass entity. It demonstrates how specific control classes (`x`) are mapped to the conflict metrics they are designed to resolve.

| id | x | y |
| :--- | :--- | :--- |
| ctrl_01 | FirewallSegmentationDirective | mass_01 |
| ctrl_02 | CryptographicKeyRotation | mass_02 |
| ctrl_03 | IdentityAccessManagement | mass_03 |
| ctrl_04 | DataLossPreventionProtocol | mass_04 |
| ctrl_05 | PhysicalSecurityZoneControl | mass_05 |

## 7.2 Descriptive ICE and Dempster Conflict Mass

While directives define what *should* be done, Descriptive Information Content Entities (ICE) characterize the state of the system. The axiom `dempster_conflict_mass` introduces a critical layer of semantic rigor by quantifying the uncertainty or conflict between evidence sources. In evidence theory, "conflict mass" represents the portion of belief that cannot be assigned to a specific hypothesis due to contradictory evidence. By asserting that a descriptive class `hasConflictMass` some value `Y`, the ontology captures the friction between observed system states and expected control behaviors.

This formalization allows governance engines to move beyond binary compliance states. Instead of a simple pass/fail, the system assigns a conflict mass value. A high conflict mass indicates that sensor data or audit logs are mutually inconsistent, suggesting either a sophisticated evasion technique or a failure in the monitoring apparatus. The relational structure here is circular yet deterministic: a conflict mass entity (`y`) must reference the control (`x`) it is evaluating, and conversely, the control must reference the conflict mass. This bidirectional linkage ensures that mitigation strategies are always anchored to the specific uncertainty metrics they aim to reduce.

**Table 7.2: Dempster Conflict Mass Assignments**

This table embodies the `dempster_conflict_mass` axiom. The primary key (`id`) represents the unique identifier for the conflict mass instance, while `x` denotes the descriptive class (the phenomenon being measured), and `y` is the foreign key referencing the control ID from Table 7.1, closing the loop.

| id | x | y |
| :--- | :--- | :--- |
| mass_01 | NetworkTrafficConflictMetric | ctrl_01 |
| mass_02 | KeyEntropyConflictMetric | ctrl_02 |
| mass_03 | AuthenticationLogConflictMetric | ctrl_03 |
| mass_04 | ExfiltrationSignalConflictMetric | ctrl_04 |
| mass_05 | ZoneEntryConflictMetric | ctrl_05 |

## 7.3 Policy Supersedence and Temporal Hierarchy

Governance frameworks are dynamic; regulations evolve, and organizational priorities shift. The `policy_supersedes` axiom models this evolution by defining a class relationship wherein a newer directive (`X`) replaces an older or conflicting state (`Y`). In this ontology, supersedence is not a deletion operation but a structural re-mapping. The new policy inherits the mitigation obligations of the old policy while altering the implementation parameters or the conflict mass thresholds.

Crucially, the schema dictates that the superseded entity (`y`) is identified via its conflict mass identifier. This design choice implies that supersedence often occurs when the definition of "acceptable conflict" changes. For example, a legacy policy might tolerate a higher conflict mass in identity logs than a modern zero-trust policy. By linking the supersedence relation to the conflict mass ID, the ontology explicitly tracks how tolerance for uncertainty is tightened over time. This provides an auditable lineage of governance rigor, essential for regulatory reporting where demonstrating the "tightening" of controls is often a requirement.

**Table 7.3: Policy Supersedence Mapping**

This table embodies the `policy_supersedes` axiom. It lists the newer directive classes (`x`) and the conflict mass identifiers (`y`) they replace, effectively updating the governance baseline.

| id | x | y |
| :--- | :--- | :--- |
| sup_01 | ZeroTrustSegmentationPolicy | mass_01 |
| sup_02 | AutomatedKeyManagementPolicy | mass_02 |
| sup_03 | BiometricAuthenticationPolicy | mass_03 |
| sup_04 | AdvancedTrafficInspectionPolicy | mass_04 |
| sup_05 | BadgelessBiometricEntryPolicy | mass_05 |

## 7.4 Evidence Requirements within Controls

A directive is theoretically hollow without the means to verify its execution. The `control_with_evidence_requirement` axiom formalizes the dependency between a control (`X`) and the evidence class (`Y`) it mandates. This transforms the control from a passive statement of intent into an active data consumer. The ontology asserts that `X` `requiresEvidence` `Y`, meaning the existence of `X` in a valid state is contingent upon the presence of `Y`.

In the relational projection, this requirement is again anchored to the conflict mass entity. This structural dependency serves a critical validation function: if a conflict mass is detected (indicating potential non-compliance or uncertainty), the system can immediately query the associated evidence requirements to determine if the necessary proof exists to adjudicate the conflict. For instance, if a "NetworkTrafficConflictMetric" spikes, the "FirewallSegmentationDirective" requires "PacketCaptureLogs" to resolve the discrepancy. Without this linkage, an audit would lack the necessary context to move from detection to resolution.

**Table 7.4: Control Evidence Requirements**

This table embodies the `control_with_evidence_requirement` axiom. It maps specific control classes (`x`) to the evidence types required to validate them, linked via the conflict mass identifier (`y`).

| id | x | y |
| :--- | :--- | :--- |
| req_01 | PacketCaptureLogDirective | mass_01 |
| req_02 | KeyUsageArchiveDirective | mass_02 |
| req_03 | SessionTokenRecordingDirective | mass_03 |
| req_04 | FileIntegrityLogDirective | mass_04 |
| req_05 | VideoSurveillanceFeedDirective | mass_05 |

## 7.5 Verification Processes and Evidence Production

The final component of the governance loop is the generation of evidence itself. The `verification_produces_evidence` axiom assigns this responsibility to a process class (`X`) that is a subclass of `bfo:0000015` (a process). This distinguishes the *act* of verification from the *artifact* of evidence. The ontology asserts that the execution of process `X` `producesEvidence` `Y`.

This axiom is the operational engine of the framework. While the control defines the requirement and the policy defines the hierarchy, the verification process (e.g., an automated script, a manual audit, or a sensor scan) generates the raw data that populates the evidence classes. The relational linkage to the conflict mass (`y`) ensures that verification processes are targeted. They are not generic data producers but specific interventions designed to reduce the conflict mass identified in the descriptive phase. For example, a "DeepPacketInspection" process is executed specifically to produce evidence that lowers the "NetworkTrafficConflictMetric." This completes the semantic cycle: Directive -> Conflict -> Requirement -> Process -> Evidence.

**Table 7.5: Verification Processes and Output**

This table embodies the `verification_produces_evidence` axiom. It identifies the specific process classes (`x`) responsible for generating the evidence needed to address the identified conflict masses (`y`).

| id | x | y |
| :--- | :--- | :--- |
| ver_01 | DeepPacketInspectionProcess | mass_01 |
| ver_02 | HSMKeyAuditProcess | mass_02 |
| ver_03 | LDAPSyncVerificationProcess | mass_03 |
| ver_04 | HashComparisonProcess | mass_04 |
| ver_05 | MotionDetectionAnalysisProcess | mass_05 |

```json
{
  "tables": [
    {
      "name": "t_control_subclass",
      "rows": [
        [
          "ctrl_01",
          "FirewallSegmentationDirective",
          "mass_01"
        ],
        [
          "ctrl_02",
          "CryptographicKeyRotation",
          "mass_02"
        ],
        [
          "ctrl_03",
          "IdentityAccessManagement",
          "mass_03"
        ],
        [
          "ctrl_04",
          "DataLossPreventionProtocol",
          "mass_04"
        ],
        [
          "ctrl_05",
          "PhysicalSecurityZoneControl",
          "mass_05"
        ]
      ]
    },
    {
      "name": "t_dempster_conflict_mass",
      "rows": [
        [
          "mass_01",
          "NetworkTrafficConflictMetric",
          "ctrl_01"
        ],
        [
          "mass_02",
          "KeyEntropyConflictMetric",
          "ctrl_02"
        ],
        [
          "mass_03",
          "AuthenticationLogConflictMetric",
          "ctrl_03"
        ],
        [
          "mass_04",
          "ExfiltrationSignalConflictMetric",
          "ctrl_04"
        ],
        [
          "mass_05",
          "ZoneEntryConflictMetric",
          "ctrl_05"
        ]
      ]
    },
    {
      "name": "t_policy_supersedes",
      "rows": [
        [
          "sup_01",
          "ZeroTrustSegmentationPolicy",
          "mass_01"
        ],
        [
          "sup_02",
          "AutomatedKeyManagementPolicy",
          "mass_02"
        ],
        [
          "sup_03",
          "BiometricAuthenticationPolicy",
          "mass_03"
        ],
        [
          "sup_04",
          "AdvancedTrafficInspectionPolicy",
          "mass_04"
        ],
        [
          "sup_05",
          "BadgelessBiometricEntryPolicy",
          "mass_05"
        ]
      ]
    },
    {
      "name": "t_control_with_evidence_requirement",
      "rows": [
        [
          "req_01",
          "PacketCaptureLogDirective",
          "mass_01"
        ],
        [
          "req_02",
          "KeyUsageArchiveDirective",
          "mass_02"
        ],
        [
          "req_03",
          "SessionTokenRecordingDirective",
          "mass_03"
        ],
        [
          "req_04",
          "FileIntegrityLogDirective",
          "mass_04"
        ],
        [
          "req_05",
          "VideoSurveillanceFeedDirective",
          "mass_05"
        ]
      ]
    },
    {
      "name": "t_verification_produces_evidence",
      "rows": [
        [
          "ver_01",
          "DeepPacketInspectionProcess",
          "mass_01"
        ],
        [
          "ver_02",
          "HSMKeyAuditProcess",
          "mass_02"
        ],
        [
          "ver_03",
          "LDAPSyncVerificationProcess",
          "mass_03"
        ],
        [
          "ver_04",
          "HashComparisonProcess",
          "mass_04"
        ],
        [
          "ver_05",
          "MotionDetectionAnalysisProcess",
          "mass_05"
        ]
      ]
    }
  ]
}
```