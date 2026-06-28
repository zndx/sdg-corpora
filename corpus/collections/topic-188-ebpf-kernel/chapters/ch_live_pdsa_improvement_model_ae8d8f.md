---
chapter_id: ch_live_pdsa_improvement_model_ae8d8f
topic_id: 188
family: 08_derived
cited_terms: ['pdsa_improvement_model', 'descriptive_only_about_artifact', 'kernelhook_for_subsystem']
model: engine-refine
---

The PDSA improvement model registry establishes a structured taxonomy of quality-improvement initiatives, each uniquely identified by an alphanumeric key such as `MODE-0001` through `MODE-0004`. These identifiers anchor the canonical model definitions—`Opioid-Taper-Init`, `Insulin-Protocol-Opt`, `Sepsis-Protocol-V2`, and `Bedside-Handoff-Rev`—which serve as the primary entities to which clinical care improvements and patient outcomes are subsequently bound. The direct improvement mapping table links each model to a single clinical care target; for instance, `MODE-0001` and `MODE-0002` both target `Wound-Care-Standard`, while `MODE-0003` is associated with `Hand-Hygiene-Protocol`. This one-to-one association captures the primary clinical objective of each initiative, yet the governance of these relationships is further articulated through a separate relationship table that records the `role` of each participant—`reviewer`, `contributor`, or `owner`—and attaches a `cardinality_note` to constrain the multiplicity of the linkage. In the optimization facet, `MODE-0001` targets `Pain-Management-Score`, `MODE-0002` targets `Complication-Rate`, `MODE-0003` targets `Adverse-Event-Frequency`, and `MODE-0004` targets `Functional-Recovery-Time`, with the cross-reference table assigning roles such as `reviewer` for `MODE-0005` and `owner` for `MODE-0001` and `MODE-0005`, each annotated with cardinality notes ranging from `Cardinality Note 01` through `Cardinality Note 04` to document the structural constraints on the relationship.

**t_pdsa_improvement_model**

| id | p_d_s_a_improvement_model |
| --- | --- |
| MODE-0001 | Opioid-Taper-Init |
| MODE-0002 | Insulin-Protocol-Opt |
| MODE-0003 | Sepsis-Protocol-V2 |
| MODE-0004 | Bedside-Handoff-Rev |
| MODE-0005 | Fall-Prevention-Q4 |
| MODE-0006 | Bedside-Handoff-Rev |

**t_pdsa_improvement_model_improves**

| id | improves |
| --- | --- |
| MODE-0001 | Wound-Care-Standard |
| MODE-0002 | Wound-Care-Standard |
| MODE-0003 | Hand-Hygiene-Protocol |
| MODE-0004 | Wound-Care-Standard |
| MODE-0005 | Medication-Reconciliation |
| MODE-0006 | Ventilator-Management |
| MODE-0007 | Ventilator-Management |
| MODE-0008 | Wound-Care-Standard |

**t_pdsa_improvement_model__improves**

| id | pdsa_id | improves_id | role |
| --- | --- | --- | --- |
| MODE-0001 | MODE-0001 | MODE-0005 | reviewer |
| MODE-0002 | MODE-0001 | MODE-0006 | contributor |
| MODE-0003 | MODE-0004 | MODE-0003 | contributor |
| MODE-0004 | MODE-0005 | MODE-0004 | owner |
| MODE-0005 | MODE-0003 | MODE-0005 | contributor |
| MODE-0006 | MODE-0003 | MODE-0002 | owner |
| MODE-0007 | MODE-0001 | MODE-0008 | owner |
| MODE-0008 | MODE-0001 | MODE-0008 | observer |

**t_pdsa_improvement_model_optimizes**

| id | optimizes |
| --- | --- |
| MODE-0001 | Pain-Management-Score |
| MODE-0002 | Complication-Rate |
| MODE-0003 | Adverse-Event-Frequency |
| MODE-0004 | Functional-Recovery-Time |
| MODE-0005 | LOS-Reduction |
| MODE-0006 | Complication-Rate |

**t_pdsa_improvement_model__optimizes**

| id | pdsa_id | optimizes_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| MODE-0001 | MODE-0005 | MODE-0005 | reviewer | Cardinality Note 01 |
| MODE-0002 | MODE-0001 | MODE-0004 | owner | Cardinality Note 02 |
| MODE-0003 | MODE-0003 | MODE-0001 | contributor | Cardinality Note 03 |
| MODE-0004 | MODE-0005 | MODE-0004 | owner | Cardinality Note 04 |
| MODE-0005 | MODE-0005 | MODE-0003 | contributor | Cardinality Note 05 |
| MODE-0006 | MODE-0005 | MODE-0004 | observer | Cardinality Note 06 |
| MODE-0007 | MODE-0005 | MODE-0006 | owner | Cardinality Note 07 |
| MODE-0008 | MODE-0006 | MODE-0004 | reviewer | Cardinality Note 08 |

Descriptive assertions about entities are captured in a fact table that records a `confidence` score, an `uncertainty` magnitude, and a numeric `value` alongside a foreign key pointing to the subject of the assertion. The confidence values—`0.854`, `0.209`, `0.761`, and `0.480`—span a wide range, indicating that some assertions carry substantial evidentiary weight while others remain provisional. Corresponding uncertainty figures, such as `452.69` and `846.52`, quantify the dispersion or noise associated with each measurement, while the observed values themselves—`646.43`, `408.39`, `850.50`, `110.19`—represent the substantive data points underpinning the assertion. These facts reference an `about` dimension table that provides a human-readable `about_label` and an `about_category` for each subject, enabling classification and aggregation across heterogeneous domains. The `about_key` column in the fact table serves as the join point, ensuring that every quantitative claim can be traced back to its labeled and categorized entity.

**fact_descriptive**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.854 | 452.69 | 646.43 |
| ARTI-0002 | ARTI-0002 | 0.209 | 846.52 | 408.39 |
| ARTI-0003 | ARTI-0002 | 0.761 | 532.60 | 850.50 |
| ARTI-0004 | ARTI-0004 | 0.480 | 663.65 | 110.19 |
| ARTI-0005 | ARTI-0006 | 0.697 | 535.73 | 322.53 |
| ARTI-0006 | ARTI-0003 | 0.238 | 734.71 | 457.41 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| ARTI-0001 | About Label 01 | About Category 01 |
| ARTI-0002 | About Label 02 | About Category 02 |
| ARTI-0003 | About Label 03 | About Category 03 |
| ARTI-0004 | About Label 04 | About Category 04 |
| ARTI-0005 | About Label 05 | About Category 05 |
| ARTI-0006 | About Label 06 | About Category 06 |

Kernel subsystem hooks follow an analogous dimensional pattern, where each hook is identified by a key such as `SUBS-0001` through `SUBS-0004` and linked to a target kernel subsystem via the `for_kernel_subsystem_key` column. The subsystems themselves are catalogued in a dimension table that supplies a `for_kernel_subsystem_label` and a `for_kernel_subsystem_category`, providing the same classification infrastructure found in the clinical domain. The hook facts record a `size_bytes` metric—values such as `36342735`, `560962979`, `456299832`, and `272822846`—which quantify the memory footprint of each hook, alongside a `version` number that tracks the evolution of the hook implementation. These size measurements, spanning from approximately 36 megabytes to 560 megabytes, reflect the substantial resource requirements of kernel-level integrations and serve as a basis for capacity planning and performance analysis. The version field, with values of `3`, `1`, `10`, and `1`, indicates that hooks are independently versioned, allowing subsystems to evolve at different rates without requiring synchronized releases.

**fact_kernelhook**

| id | for_kernel_subsystem_key | size_bytes | version |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0005 | 36342735 | 3 |
| SUBS-0002 | SUBS-0007 | 560962979 | 1 |
| SUBS-0003 | SUBS-0001 | 456299832 | 10 |
| SUBS-0004 | SUBS-0005 | 272822846 | 1 |

**dim_for_kernel_subsystem**

| id | for_kernel_subsystem_label | for_kernel_subsystem_category |
| --- | --- | --- |
| SUBS-0001 | For Kernel Subsystem Label 01 | For Kernel Subsystem Category 01 |
| SUBS-0002 | For Kernel Subsystem Label 02 | For Kernel Subsystem Category 02 |
| SUBS-0003 | For Kernel Subsystem Label 03 | For Kernel Subsystem Category 03 |
| SUBS-0004 | For Kernel Subsystem Label 04 | For Kernel Subsystem Category 04 |
| SUBS-0005 | For Kernel Subsystem Label 05 | For Kernel Subsystem Category 05 |
| SUBS-0006 | For Kernel Subsystem Label 06 | For Kernel Subsystem Category 06 |
| SUBS-0007 | For Kernel Subsystem Label 07 | For Kernel Subsystem Category 07 |