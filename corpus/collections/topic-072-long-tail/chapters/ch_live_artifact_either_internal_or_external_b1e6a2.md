---
chapter_id: ch_live_artifact_either_internal_or_external_b1e6a2
topic_id: 72
family: 07_long_tail
cited_terms: ['artifact_either_internal_or_external', 'attestation_about_compliance_claim', 'baseline_for_metric']
model: engine-refine
---

Artifact records are uniquely identified by an identifier such as EXTE-0001 through EXTE-0004 and classified by an artifact category—Artifact Category 01, Artifact Category 02, and so forth—while a human-readable artifact label provides supplementary context. Each artifact carries a version number, ranging from 5 to 10 in the observed set, and a size in bytes that spans from approximately 43 megabytes (42,978,804 bytes for EXTE-0002) to nearly one gigabyte (996,080,316 bytes for EXTE-0003). The artifact key, which may repeat across records—EXTE-0004 and EXTE-0005 each appear twice—serves as a logical grouping mechanism distinct from the surrogate identifier, enabling multiple versioned instances to be associated with a single artifact definition.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| EXTE-0001 | EXTE-0004 | 123155790 | 6 |
| EXTE-0002 | EXTE-0005 | 42978804 | 5 |
| EXTE-0003 | EXTE-0004 | 996080316 | 5 |
| EXTE-0004 | EXTE-0005 | 597369362 | 10 |
| EXTE-0005 | EXTE-0006 | 12061913 | 9 |
| EXTE-0006 | EXTE-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| EXTE-0001 | Artifact Label 01 | Artifact Category 01 |
| EXTE-0002 | Artifact Label 02 | Artifact Category 02 |
| EXTE-0003 | Artifact Label 03 | Artifact Category 03 |
| EXTE-0004 | Artifact Label 04 | Artifact Category 04 |
| EXTE-0005 | Artifact Label 05 | Artifact Category 05 |
| EXTE-0006 | Artifact Label 06 | Artifact Category 06 |

Attestations function as measured claims about artifacts, each assigned an identifier such as CLAI-0001 through CLAI-0004 and categorized by an attestation category—Attestation Category 01 through Attestation Category 04—with an attestation label providing additional descriptive context. Every attestation record carries a confidence value, a decimal between 0 and 1 that quantifies the degree of assurance in the claim; observed values range from 0.051 for CLAI-0001 to 0.987 for CLAI-0004, reflecting a wide spectrum of evidentiary strength. Paired with confidence is an uncertainty measure expressed in absolute units—values such as 91.51, 986.76, 606.80, and 859.08—alongside a measured value (16.40 through 571.54) that represents the underlying observation. The attestation key, which may recur across records (CLAI-0004 appears twice), links multiple attestation instances to a single attestation definition, analogous to the artifact key's role.

**fact_attestation**

| id | attestation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 0.051 | 91.51 | 571.54 |
| CLAI-0002 | CLAI-0001 | 0.840 | 986.76 | 362.06 |
| CLAI-0003 | CLAI-0003 | 0.482 | 606.80 | 96.81 |
| CLAI-0004 | CLAI-0004 | 0.987 | 859.08 | 16.44 |
| CLAI-0005 | CLAI-0003 | 0.738 | 864.19 | 799.64 |

**dim_attestation**

| id | attestation_label | attestation_category |
| --- | --- | --- |
| CLAI-0001 | Attestation Label 01 | Attestation Category 01 |
| CLAI-0002 | Attestation Label 02 | Attestation Category 02 |
| CLAI-0003 | Attestation Label 03 | Attestation Category 03 |
| CLAI-0004 | Attestation Label 04 | Attestation Category 04 |
| CLAI-0005 | Attestation Label 05 | Attestation Category 05 |
| CLAI-0006 | Attestation Label 06 | Attestation Category 06 |

Baseline definitions establish reference standards against which metrics are evaluated. Observed baselines include Standard_Daylight_Cycle, Power_Consumption, Structural_Stress, and Steady_State_Vibration, each identified by a metric identifier such as METR-0001 through METR-0004. A baseline is associated with one or more target metrics through a junction relationship: Data_Ingestion_Rate is linked to Standard_Daylight_Cycle and Power_Consumption, while Steady_State_Vibration and Power_Consumption serve as targets for other baselines. This many-to-many association is mediated by a role attribute that designates the nature of the relationship—owner, contributor, or observer—with owner indicating primary responsibility, contributor denoting secondary involvement, and observer signifying a monitoring or informational linkage.

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

The structural separation of facts from dimensions reflects a deliberate normalization strategy: artifact and attestation facts capture measurable, versioned, and quantified properties, while their corresponding dimension tables hold categorical and descriptive attributes that change less frequently. This design permits efficient classification and filtering by category without duplicating metadata across fact rows, and it supports the independent evolution of artifact and attestation taxonomies. The subject and target columns in the baseline-to-metric junction table establish the directional semantics of each relationship, while the role column disambiguates the functional capacity of each baseline in relation to its associated metric, ensuring that governance and audit trails can distinguish between primary accountability and peripheral involvement.