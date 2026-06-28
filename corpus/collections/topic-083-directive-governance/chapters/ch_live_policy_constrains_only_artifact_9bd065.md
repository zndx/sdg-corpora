---
chapter_id: ch_live_policy_constrains_only_artifact_9bd065
topic_id: 83
family: 01_foundation
cited_terms: ['policy_constrains_only_artifact', 'dempster_conflict_mass', 'pdsa_improvement_model']
model: engine-refine
---

Governance artifacts are anchored by unique identifiers—ARTI-0001 through ARTI-0004—that distinguish individual policy constraints and bind them to their enforcement posture and organizational reach. Each artifact encodes a regulatory policy such as CCPA or SOX, an enforcement mechanism that ranges from mandatory compliance to hard blocking, and a scope dimension that determines whether the constraint applies at the team, local, or global level. The enforcement attribute is the operational hinge: a blocking enforcement on artifact ARTI-0002 under SOX will actively prevent non-compliant actions, whereas a mandatory enforcement on ARTI-0001 under CCPA signals a required control without necessarily halting execution. Scope further modulates applicability, with global-scoped policies like ARTI-0004 (CCPA, mandatory) imposing uniform requirements across all organizational units, while local-scoped policies like ARTI-0003 (SOX, mandatory) confine their reach to a single jurisdiction or business unit.

**t_policy_constrains_only_artifact**

| id | policy | enforcement | scope |
| --- | --- | --- | --- |
| ARTI-0001 | CCPA | mandatory | team |
| ARTI-0002 | SOX | blocking | global |
| ARTI-0003 | SOX | mandatory | local |
| ARTI-0004 | CCPA | mandatory | global |
| ARTI-0005 | Basel-III | deprecated | team |
| ARTI-0006 | NIST-800-53 | deprecated | regional |
| ARTI-0007 | NIST-800-53 | advisory | regional |

Conflict-mass reasoning introduces a probabilistic layer atop deterministic policy constraints. The fact table for Dempster–Shafer conflict mass records, each keyed by an identifier such as MASS-0001, carries a confidence value that quantifies the strength of evidence—ranging from 0.014 in MASS-0002 to 0.728 in MASS-0004—alongside an uncertainty measure that spans from 9.49 to 687.80, reflecting the dispersion of belief across competing hypotheses. The misc value column holds the computed mass assignments, with figures such as 520.46 and 846.10 representing the aggregated evidence weight. These fact records reference a conflict mass key that points into a dimension table where each conflict mass entity is further classified by a label—Conflict Mass Label 01 through 04—and a category—Conflict Mass Category 01 through 04—that provides the semantic grouping necessary for downstream aggregation and audit. The identifier column in both the fact and dimension tables ensures traceability from raw evidence through classification to final decision support.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

Clinical improvement initiatives are modeled through the PDSA improvement model, where each model—identified by codes such as MODE-0001 through MODE-0004—carries a descriptive name that encodes its clinical focus: Opioid-Taper-Init, Insulin-Protocol-Opt, Sepsis-Protocol-V2, and Bedside-Handoff-Rev. These models are not abstract; they are explicitly linked to the clinical care practices they aim to improve, as recorded in a dedicated relationship table. Model MODE-0001, for instance, improves Wound-Care-Standard, a relationship that appears consistently across MODE-0001, MODE-0002, and MODE-0004, while MODE-0003 targets Hand-Hygiene-Protocol. The clinical care outcome is the direct object of improvement, and the model name itself serves as a human-readable identifier that conveys the intervention's domain and version.

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

The optimization of patient outcomes follows a parallel structure, where each PDSA model is associated with measurable patient outcome metrics such as Pain-Management-Score, Complication-Rate, Adverse-Event-Frequency, and Functional-Recovery-Time. Model MODE-0001 optimizes Pain-Management-Score, MODE-0002 targets Complication-Rate, MODE-0003 addresses Adverse-Event-Frequency, and MODE-0004 focuses on Functional-Recovery-Time. These associations are materialized through a join table that captures the many-to-many relationship between PDSA models and patient outcomes, with each association row carrying a role attribute that designates the nature of the model's involvement—owner, contributor, or reviewer. The role attribute is critical for governance: MODE-0005 appears as the owner of its own optimization target, while MODE-0001 acts as an owner in one association and MODE-0003 serves as a contributor in another, establishing a clear accountability hierarchy.

Cardinality notes in the optimization join table—Cardinality Note 01 through 04—provide additional structural metadata about the multiplicity and constraints of the relationships between PDSA models and patient outcomes. These notes, paired with the role designations, enable precise documentation of whether a model is the primary driver of an outcome improvement or a secondary contributor, and whether the relationship is one-to-one, one-to-many, or many-to-many. The join table's own identifier column (MODE-0001 through MODE-0004) serves as the primary key for each association record, while the subject and target columns (pdsa_id and optimizes_id) form the foreign keys that bind the improvement model to the patient outcome it optimizes. This layered approach—combining identifiers, roles, cardinality notes, and categorical labels—ensures that every governance constraint, conflict-mass assessment, and clinical improvement model can be traced, audited, and reasoned about with full contextual fidelity.

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