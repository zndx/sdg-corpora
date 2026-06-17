---
chapter_id: abcabf309ea4a8c3
topic_id: 112
family: 06_belief_structure
cited_terms: ['mass_function_subclass', 'attestation_with_supporting_evidence', 'claim_refuted_by_evidence', 'claim_not_disconfirmed']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Formal Verification of Belief Structures in Industrial Compliance Frameworks

## 4.1 Scope and Preamble

This chapter delineates the formal ontological structures required to manage evidence, belief, and refutation within high-assurance industrial compliance environments. It addresses the necessity of rigorous definition when handling uncertainty in safety-critical systems, specifically focusing on the integration of Dempster-Shafer belief structures into standard audit protocols. The text provides a detailed examination of how descriptive information content entities (ICE) interact with processes of attestation and evidentiary support to establish verified truths or identify refuted claims. Readers will apply these axioms to construct verifiable data tables that support regulatory submissions and internal governance audits.

## 4.2 Mass Function Subclasses and Frames of Discernment

In the context of formal verification and audit, a "Mass Function" serves as a mathematical representation of belief, distinct from classical probability. It allows for the allocation of belief to subsets of a hypothesis space, rather than solely to individual atomic events. This capability is crucial in complex engineering systems where evidence may be incomplete or ambiguous.

The axiom **Mass Function Subclass** (template_id: `mass_function_subclass`) formalizes this concept. It asserts that a specific class of belief assessment (X) is a subclass of `cco:DescriptiveICE` and operates over a specific "Frame of Discernment" (Y). The Frame of Discernment represents the set of mutually exclusive propositions that define the universe of discourse for a specific verification task. For instance, when assessing the integrity of a pressure valve, the frame of discernment is not merely "pass" or "fail," but includes the specific operational states and environmental conditions defined by the governing attestation process.

### 4.2.1 Operational Context and Axiom Application

Consider a scenario involving a 2/2 brass servo-assisted solenoid valve operating within a pressure range of 0.5 to 140 Bar. The verification of this component cannot rely on binary logic alone. Instead, a `ValveIntegrityMassFunction` is established. This entity is a `DescriptiveICE` that encapsulates the distribution of belief regarding the valve's failure modes. It operates over a Frame of Discernment defined by the `PressureTestAttestation` protocol.

The relationship is structural: the Mass Function (X) *over* Frame of Discernment (Y). The Frame of Discernment (Y) is not merely a passive set; in the relational schema, it is anchored to an instance of attestation. This linkage ensures that the belief structure is grounded in a specific, governed process.

**Table 4.1: Mass Function Subclass Instances**

This table illustrates the instantiation of mass functions over specific frames of discernment derived from attestation protocols. The `id` serves as the primary key for the belief structure, while `x` denotes the specific mass function class, and `y` references the attestation protocol that defines the frame of discernment.

| id | x | y |
| :--- | :--- | :--- |
| `mf_valve_01` | `ValveIntegrityMassFunction` | `att_pressure_protocol_a` |
| `mf_flow_02` | `FlowRateDistribution` | `att_flow_calibration_b` |
| `mf_temp_03` | `ThermalStabilityBelief` | `att_thermal_test_c` |
| `mf_viscosity_04` | `MediaViscosityAssessment` | `att_fluid_check_d` |
| `mf_coil_05` | `CoilResponseFunction` | `att_electrical_test_e` |

*Table 4.1 Note: The `y` column (Foreign Key) must correspond to valid identifiers in the attestation tables, ensuring that every belief function is strictly bounded by a defined governance process.*

## 4.3 Attestation with Supporting Evidence

Attestation is the fundamental process by which a system or component is verified against a specific standard or requirement. In the Basic Formal Ontology (BFO), attestation is a process (`bfo:0000015`). However, for an attestation to be valid within a rigorous compliance framework, it must be supported by evidence.

The axiom **Attestation with Supporting Evidence** (template_id: `attestation_with_supporting_evidence`) posits that an attestation class (X) possesses a relationship `withSupportingEvidence` to a supporting entity (Y). In this schema, the supporting evidence (Y) is identified as the Mass Function defined in the previous section. This creates a circular dependency in the logical structure: the Mass Function defines the belief over the Frame of Discernment (the Attestation), and the Attestation is supported by the Mass Function. This circularity is intentional and reflects the real-world audit loop where protocols define the scope of evidence collection, and the resulting evidence validates the protocol execution.

### 4.3.1 Evidence Anchoring and Process Verification

For a solenoid valve operating at a media temperature of -15°C to +145°C, the attestation process involves verifying the component's response time (200 mSec Max) and pressure handling capabilities. The `PressureTestAttestation` is the process entity. Its validity is not assumed; it is derived from the `ValveIntegrityMassFunction`. This mass function aggregates sensor data, historical performance logs, and real-time telemetry to form a body of evidence.

The verbalization "{X} is something that with supporting evidence {Y}" mandates that no attestation can exist in isolation. The "supporting evidence" is the quantitative or qualitative data structure (the Mass Function) that provides the epistemic weight to the attestation.

**Table 4.2: Attestation with Supporting Evidence Instances**

This table details the attestation processes and their corresponding supporting evidence (mass functions). The `id` is the primary key for the attestation record. The `y` column represents the foreign key linking to the mass function that provides the evidentiary basis for the attestation.

| id | x | y |
| :--- | :--- | :--- |
| `att_pressure_protocol_a` | `PressureTestAttestation` | `mf_valve_01` |
| `att_flow_calibration_b` | `FlowCalibrationAttestation` | `mf_flow_02` |
| `att_thermal_test_c` | `ThermalStressAttestation` | `mf_temp_03` |
| `att_fluid_check_d` | `FluidCompatibilityAttestation` | `mf_viscosity_04` |
| `att_electrical_test_e` | `CoilIntegrityAttestation` | `mf_coil_05` |

*Table 4.2 Note: The linkage between `att_pressure_protocol_a` and `mf_valve_01` demonstrates the closure of the evidentiary loop, where the protocol defines the frame, and the function supports the protocol.*

## 4.4 Claims Refuted by Evidence

A critical aspect of technical governance is the ability to formally identify and record when a hypothesis or claim is proven false. This is distinct from a claim being merely unproven; refutation implies the presence of positive evidence that contradicts the claim.

The axiom **Claim Refuted by Evidence** (template_id: `claim_refuted_by_evidence`) defines a class (X) as a `DescriptiveICE` that is `refutedByEvidence` some class (Y). Here, the refuting agent (Y) is an instance of Attestation. This structure allows the audit trail to explicitly map failed assertions to the specific test processes or verification steps that demonstrated the failure.

### 4.4.1 Handling Refutation in Safety Systems

In the verification of a "Normally Closed" 2-way servo-assisted valve, a claim might be asserted: "The valve maintains seal integrity at 140 Bar." If the `PressureTestAttestation` (the process) generates evidence (the Mass Function) showing a pressure drop or leakage at 135 Bar, the claim is refuted.

Formally recording this refutation is essential for root cause analysis and regulatory reporting. It prevents the recurrence of the failed claim in future design iterations and serves as a permanent record of the component's limitations. The relationship is directional: the Claim is the object being acted upon by the Evidence (via the Attestation).

**Table 4.3: Claims Refuted by Evidence Instances**

This table captures specific claims that have been disproven during the verification phase. The `x` column contains the refuted claim (a DescriptiveICE), and the `y` column contains the ID of the attestation process that provided the refuting evidence.

| id | x | y |
| :--- | :--- | :--- |
| `cr_valve_leak` | `Claim_SealIntegrityAtMaxPressure` | `att_pressure_protocol_a` |
| `cr_flow_slow` | `Claim_ResponseTimeUnder200mSec` | `att_flow_calibration_b` |
| `cr_temp_fail` | `Claim_OperationAtMinus20C` | `att_thermal_test_c` |
| `cr_visc_err` | `Claim_CompatibleWith1000cSt` | `att_fluid_check_d` |
| `cr_coil_heat` | `Claim_CoilDutyCycle100Percent` | `att_electrical_test_e` |

*Table 4.3 Note: The claim `Claim_SealIntegrityAtMaxPressure` is explicitly refuted by the evidence generated during `att_pressure_protocol_a`, formally documenting the failure mode for the audit record.*

## 4.5 Claims Not Disconfirmed

While refutation addresses positive proof of failure, the axiom **Claim Not Disconfirmed** (template_id: `claim_not_disconfirmed`) addresses logical exclusion and the persistence of validity. It asserts that a class (X) is a `DescriptiveICE` that is *not* a class (Y).

This axiom is typically employed to define the boundaries of a system's verified state. It is used to assert that a specific claim does *not* fall into a category of failure or error. Unlike refutation, which relies on an external evidentiary process to prove a negative, "not disconfirmed" is often a logical assertion regarding the classification of the claim itself. It serves to carve out safe operating zones by explicitly denying membership in failure classes.

### 4.5.1 Defining Safe Operating Envelopes

For the brass valve mentioned in the style references, the ambient temperature range is -15°C to +50°C. A claim such as "System Operational Status" may be asserted. To ensure precision, the governance framework must assert that this claim is *not* a "CriticalFailureState." This is not necessarily because a test was run to prove it didn't fail (though that may be true), but because by definition and classification, the current state is logically distinct from the failure state.

This construct is vital for automated compliance checking. It allows rule-based systems to validate that no valid claim has been erroneously categorized as a defect. It reinforces the logical integrity of the knowledge base.

**Table 4.4: Claims Not Disconfirmed Instances**

This table lists claims and explicitly states what they are not. This logical exclusion helps maintain the integrity of the classification system by preventing false positives in failure detection.

| id | x | y |
| :--- | :--- | :--- |
| `cnd_op_safe` | `Claim_OperationalStatus` | `CriticalFailureState` |
| `cnd_press_nom` | `Claim_PressureNominal` | `OverPressureEvent` |
| `cnd_media_clean` | `Claim_MediaPurity` | `ContaminantState` |
| `cnd_mount_vert` | `Claim_MountingOrientation` | `HorizontalInstallation` |
| `cnd_coil_active` | `Claim_CoilEnergized` | `OpenCircuitFault` |

*Table 4.4 Note: The entry `cnd_op_safe` asserts that the `Claim_OperationalStatus` is logically distinct from and never instances the `CriticalFailureState`, ensuring the exclusion of failure modes in the nominal operating definition.*

```json
{
  "tables": [
    {
      "name": "t_mass_function_subclass",
      "rows": [
        [
          "mf_valve_01",
          "ValveIntegrityMassFunction",
          "att_pressure_protocol_a"
        ],
        [
          "mf_flow_02",
          "FlowRateDistribution",
          "att_flow_calibration_b"
        ],
        [
          "mf_temp_03",
          "ThermalStabilityBelief",
          "att_thermal_test_c"
        ],
        [
          "mf_viscosity_04",
          "MediaViscosityAssessment",
          "att_fluid_check_d"
        ],
        [
          "mf_coil_05",
          "CoilResponseFunction",
          "att_electrical_test_e"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "att_pressure_protocol_a",
          "PressureTestAttestation",
          "mf_valve_01"
        ],
        [
          "att_flow_calibration_b",
          "FlowCalibrationAttestation",
          "mf_flow_02"
        ],
        [
          "att_thermal_test_c",
          "ThermalStressAttestation",
          "mf_temp_03"
        ],
        [
          "att_fluid_check_d",
          "FluidCompatibilityAttestation",
          "mf_viscosity_04"
        ],
        [
          "att_electrical_test_e",
          "CoilIntegrityAttestation",
          "mf_coil_05"
        ]
      ]
    },
    {
      "name": "t_claim_refuted_by_evidence",
      "rows": [
        [
          "cr_valve_leak",
          "Claim_SealIntegrityAtMaxPressure",
          "att_pressure_protocol_a"
        ],
        [
          "cr_flow_slow",
          "Claim_ResponseTimeUnder200mSec",
          "att_flow_calibration_b"
        ],
        [
          "cr_temp_fail",
          "Claim_OperationAtMinus20C",
          "att_thermal_test_c"
        ],
        [
          "cr_visc_err",
          "Claim_CompatibleWith1000cSt",
          "att_fluid_check_d"
        ],
        [
          "cr_coil_heat",
          "Claim_CoilDutyCycle100Percent",
          "att_electrical_test_e"
        ]
      ]
    },
    {
      "name": "t_claim_not_disconfirmed",
      "rows": [
        [
          "cnd_op_safe",
          "Claim_OperationalStatus",
          "CriticalFailureState"
        ],
        [
          "cnd_press_nom",
          "Claim_PressureNominal",
          "OverPressureEvent"
        ],
        [
          "cnd_media_clean",
          "Claim_MediaPurity",
          "ContaminantState"
        ],
        [
          "cnd_mount_vert",
          "Claim_MountingOrientation",
          "HorizontalInstallation"
        ],
        [
          "cnd_coil_active",
          "Claim_CoilEnergized",
          "OpenCircuitFault"
        ]
      ]
    }
  ]
}
```