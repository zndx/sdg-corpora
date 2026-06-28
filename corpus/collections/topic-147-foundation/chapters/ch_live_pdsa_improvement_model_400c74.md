---
chapter_id: ch_live_pdsa_improvement_model_400c74
topic_id: 147
family: 08_derived
cited_terms: ['pdsa_improvement_model', 'profiling_targets_dataset', 'belief_interval_equiv_bel_and_pl']
model: engine-refine
---

The PDSA improvement model registry establishes a formal taxonomy of quality-improvement initiatives, each identified by a stable surrogate key such as MODE-0001 through MODE-0004 and annotated with a human-readable model name—Opioid-Taper-Init, Insulin-Protocol-Opt, Sepsis-Protocol-V2, Bedside-Handoff-Rev—that conveys the clinical domain and intervention scope. These models do not exist in isolation; they are explicitly linked to the clinical care targets they seek to advance. The relationship between a PDSA model and its intended clinical improvement is captured in a binary association table where each row records that a given model, MODE-0001 for instance, improves a target such as Wound-Care-Standard. Multiple models may converge on the same target—MODE-0001, MODE-0002, and MODE-0004 all improve Wound-Care-Standard—while MODE-0003 targets Hand-Hygiene-Protocol, reflecting a many-to-many structure that supports cross-model coordination and aggregate impact assessment.

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

The association between models and clinical care targets is further qualified by a junction table that introduces a role attribute, assigning each participating model a position in the improvement effort: reviewer, contributor, or owner. This role dimension enables governance tracking, clarifying which model is accountable for a given improvement outcome and which are providing supporting evidence. A single model can hold multiple roles across different associations—MODE-0001 appears as both contributor and reviewer in separate rows—indicating that the same improvement initiative may play different governance roles depending on the target context. The junction table's own surrogate identifier, MODE-0001 through MODE-0004, provides an independent handle for audit trails and change management on the relationship itself.

Beyond clinical care targets, each PDSA model is also linked to measurable patient outcomes it is designed to optimize. The optimization association records that MODE-0001 targets Pain-Management-Score, MODE-0002 targets Complication-Rate, MODE-0003 targets Adverse-Event-Frequency, and MODE-0004 targets Functional-Recovery-Time. A parallel junction table enriches this relationship with a role attribute—owner or contributor—and a cardinality note, where entries such as Cardinality Note 01 through Cardinality Note 04 encode constraints on the multiplicity of the optimization link. These cardinality annotations serve as a formal mechanism for documenting whether a model is expected to optimize a single outcome, a bounded set, or an open-ended collection, thereby supporting downstream query optimization and data integrity validation.

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

The profiling subsystem operates as a separate analytical domain, structured around a fact-dimension pair that captures the execution characteristics of data profiling jobs. The fact table, fact_profiling, records each job run with a unique identifier—DATA-0001 through DATA-0004—alongside a profiling_key that references a dimension member, a duration_seconds measurement ranging from 1113.38 seconds for DATA-0002 to 6716.87 seconds for DATA-0001, an exit_code indicating the termination status (values such as 725, 809, 348, 827), and a retry_count that quantifies how many times the job was reattempted before final completion, with values spanning from 186 to 303. The dimension table, dim_profiling, provides descriptive metadata for each profiling entity, including a profiling_label such as Profiling Label 01 and a profiling_category such as Profiling Category 01, enabling categorical aggregation and filtering of execution metrics.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 6716.87 | 725 | 209 |
| DATA-0002 | DATA-0006 | 1113.38 | 809 | 186 |
| DATA-0003 | DATA-0006 | 2546.61 | 348 | 303 |
| DATA-0004 | DATA-0006 | 2074.93 | 827 | 264 |

**dim_profiling**

| id | profiling_label | profiling_category |
| --- | --- | --- |
| DATA-0001 | Profiling Label 01 | Profiling Category 01 |
| DATA-0002 | Profiling Label 02 | Profiling Category 02 |
| DATA-0003 | Profiling Label 03 | Profiling Category 03 |
| DATA-0004 | Profiling Label 04 | Profiling Category 04 |
| DATA-0005 | Profiling Label 05 | Profiling Category 05 |
| DATA-0006 | Profiling Label 06 | Profiling Category 06 |

The belief interval framework models epistemic uncertainty through a tripartite structure of belief, belief lower bound, and plausibility upper bound. Each interval is identified by a key such as BEL-0001 through BEL-0004 and associated with a belief state—signal_attenuation, thermal_runaway, latency_spike, sensor_drift—alongside a lower bound value like extended_telemetry or non_contradictory_set and an upper bound such as ground_truth_marker or direct_observation_7. The attribute schema for these intervals is defined in a dedicated metadata table that declares four attributes—confidence typed as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime—each with a distinct XML Schema datatype. Values for these attributes are stored in three separate value tables partitioned by type: decimal values such as 0.034 and 388.43 populate the decimal store, string values including Dimension Kind 01, Encoding 02, and intake form reside in the varchar store, and timestamped values like 2025-01-05T17:59:26 and 2024-10-14T22:53:55 are held in the datetime store. Each value row references its parent entity through an entity_id foreign key and its attribute definition through an attr_id, enabling a normalized, type-safe representation of heterogeneous attribute data without sacrificing query performance.

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | extended_telemetry | ground_truth_marker |
| BEL-0002 | thermal_runaway | non_contradictory_set | non_contradictory_set |
| BEL-0003 | latency_spike | potential_scenario_4 | direct_observation_7 |
| BEL-0004 | sensor_drift | indirect_indicator_beta | secondary_sensor_read |
| BEL-0005 | thermal_runaway | candidate_hypothesis | ground_truth_marker |
| BEL-0006 | calibration_failure | baseline_reference | extended_telemetry |
| BEL-0007 | data_corruption | potential_scenario_4 | secondary_sensor_read |
| BEL-0008 | packet_loss | primary_sensor_read | tentative_marker |

**t_belief_interval_equiv_bel_and_pl_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BEL-0001 | confidence | xsd:decimal |
| BEL-0002 | dimension_kind | xsd:string |
| BEL-0003 | method | xsd:string |
| BEL-0004 | recorded_at | xsd:dateTime |
| BEL-0005 | uncertainty | xsd:decimal |
| BEL-0006 | unit | xsd:string |
| BEL-0007 | value | xsd:decimal |
| BEL-0008 | encoding | xsd:string |

**t_belief_interval_equiv_bel_and_pl_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0004 | 2025-01-05T17:59:26 |
| BEL-0002 | BEL-0002 | BEL-0004 | 2024-10-14T22:53:55 |
| BEL-0003 | BEL-0003 | BEL-0004 | 2023-07-18T12:12:54 |
| BEL-0004 | BEL-0004 | BEL-0004 | 2023-03-22T01:52:23 |
| BEL-0005 | BEL-0005 | BEL-0004 | 2025-03-12T03:35:20 |
| BEL-0006 | BEL-0006 | BEL-0004 | 2025-06-14T01:50:46 |
| BEL-0007 | BEL-0007 | BEL-0004 | 2023-03-18T15:47:07 |
| BEL-0008 | BEL-0008 | BEL-0004 | 2023-02-26T17:53:54 |

**t_belief_interval_equiv_bel_and_pl_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0001 | 0.034 |
| BEL-0002 | BEL-0001 | BEL-0005 | 388.43 |
| BEL-0003 | BEL-0001 | BEL-0007 | 756.27 |
| BEL-0004 | BEL-0002 | BEL-0001 | 0.503 |
| BEL-0005 | BEL-0002 | BEL-0005 | 930.65 |
| BEL-0006 | BEL-0002 | BEL-0007 | 513.67 |
| BEL-0007 | BEL-0003 | BEL-0001 | 0.478 |
| BEL-0008 | BEL-0003 | BEL-0005 | 619.21 |

**t_belief_interval_equiv_bel_and_pl_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0002 | Dimension Kind 01 |
| BEL-0002 | BEL-0001 | BEL-0008 | Encoding 02 |
| BEL-0003 | BEL-0001 | BEL-0009 | intake form |
| BEL-0004 | BEL-0001 | BEL-0010 | es |
| BEL-0005 | BEL-0001 | BEL-0003 | hybrid |
| BEL-0006 | BEL-0001 | BEL-0006 | deg_C |
| BEL-0007 | BEL-0002 | BEL-0002 | Dimension Kind 07 |
| BEL-0008 | BEL-0002 | BEL-0008 | Encoding 08 |