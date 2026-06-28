# Collection — topic 135 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **15 chapters** · **6 topics** (target + style) · **34 ontology terms** · **34 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 135: topic 27, topic 86, topic 100, topic 140, topic 170.

> **Topic gist** (representative FinePDFs text): BMC Bioinformatics Introduction Open Access Trends in modeling Biomedical Complex Systems Luciano Milanesi* 1 , Paolo Romano 2 , Gastone Castellani 3 , Daniel Remondini 3 and Pietro Liò 4 Address: 1 Institute of Biomedical Technology, National Research Council, Milan, Italy, 2 Bioinformatics, National Cancer Research Institute, Genoa, Italy, 3 Physics Department of Bologna University, Galvani... …

## Chapters

- [ch_live_aggregation_uses_function_c64c22](chapters/ch_live_aggregation_uses_function_c64c22.md)
- [ch_live_artifact_with_min_two_parts_504983](chapters/ch_live_artifact_with_min_two_parts_504983.md)
- [ch_live_belief_interval_basic_3b816d](chapters/ch_live_belief_interval_basic_3b816d.md)
- [ch_live_claim_basic_0f45c1](chapters/ch_live_claim_basic_0f45c1.md)
- [ch_live_evidence_observed_by_process_4b56ea](chapters/ch_live_evidence_observed_by_process_4b56ea.md)
- [ch_live_ganglion_cyst_imaging_finding_6bab5e](chapters/ch_live_ganglion_cyst_imaging_finding_6bab5e.md)
- [ch_live_ganglion_cyst_tissue_origin_30381a](chapters/ch_live_ganglion_cyst_tissue_origin_30381a.md)
- [ch_live_mass_function_subclass_a6bb59](chapters/ch_live_mass_function_subclass_a6bb59.md)
- [ch_live_observation_records_state_887968](chapters/ch_live_observation_records_state_887968.md)
- [ch_live_policy_authored_by_676b1f](chapters/ch_live_policy_authored_by_676b1f.md)
- [ch_live_process_max_one_operator_0c314e](chapters/ch_live_process_max_one_operator_0c314e.md)
- [ch_live_process_min_one_output_447d81](chapters/ch_live_process_min_one_output_447d81.md)
- [ch_live_process_min_one_output_e02d70](chapters/ch_live_process_min_one_output_e02d70.md)
- [ch_live_trace_basic_95a708](chapters/ch_live_trace_basic_95a708.md)
- [ch_live_transformation_governed_by_951d92](chapters/ch_live_transformation_governed_by_951d92.md)

## Ontology terms grounding this collection

- `aggregation_uses_function` — {X} is a descriptive information content entity that uses aggregation function {Y}
- `alert_governed_by_runbook` — {X} is a process that governed by directive information content entity
- `alert_triggered_by` — {X} is a process that triggered by metric {Y}
- `allocation_with_input_facets` — {X} is a process that has input facet {Y}
- `artifact_with_min_two_parts` — {X} is an artifact
- `belief_interval_basic` — {X} is a descriptive information content entity
- `chemical_exposure_risk_profile` — ChemicalExposureRiskProfile is an information content entity that assesses exposure to a ToxicIndustrialChemical, estima
- `claim_basic` — {X} is a descriptive information content entity
- `constraint_with_predicate` — {X} is a directive information content entity that has predicate {Y}
- `ebpfprogram_union_kprobe_or_xdp` — {X} is equivalent to artifact and {Y} or {Z}
- `equiv_union_three` — {X} is equivalent to {W} or {Y} or {Z}
- `evidence_observed_by_process` — {X} is a descriptive information content entity
- `financial_strategy_oversight` — A FinancialStrategyOversight is a Process that directs some FinancialActivity and oversees some RiskManagementActivity.
- `ganglion_cyst_imaging_finding` — GanglionCystImagingFinding is an information content entity that visualizes some MagneticResonanceImagingModality.
- `ganglion_cyst_tissue_origin` — GanglionCystTissueOrigin is a continuant that bears the part-of relation to some ConnectiveTissueStructure.
- `labrun_subclass` — {X} is a process that has input sample {Y}
- `mass_function_subclass` — {X} is a descriptive information content entity that over frame of discernment {Y}
- `observation_records_state` — {X} is a process that records {Y}
- `observation_with_participant` — {X} is a process that has participant artifact
- `policy_authored_by` — {X} is a directive information content entity that authored by {Y}
- `policy_constrains_only_artifact` — {X} is a directive information content entity
- `process_max_one_operator` — {X} is a process
- `process_min_one_input` — {X} is a process
- `process_min_one_output` — {X} is a process
- `program_with_entry_exactly_one` — {X} is an artifact
- `requirement_satisfies` — {X} is a directive information content entity that satisfies {Y}
- `schemaorg_product_price` — {X} is an artifact that has price {Y}
- `subclass_to_independent_continuant` — {X} is an independent continuant
- `summary_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `syscall_with_return_type` — {X} is a designative information content entity that has return type {Y}
- `trace_basic` — {X} is a process that has observed at {Y}
- `transformation_governed_by` — {X} is a process that governed by directive information content entity
- `verification_basic` — {X} is a process
- `xdp_action_pass` — {X} is an artifact that has xdpaction {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_aggregation_uses_function`](tables/t_aggregation_uses_function.sql) — realizes `aggregation_uses_function` · _shared with 4 other collection(s)_
- [`t_alert_governed_by_runbook`](tables/t_alert_governed_by_runbook.sql) — realizes `alert_governed_by_runbook` · _shared with 5 other collection(s)_
- [`t_alert_triggered_by`](tables/t_alert_triggered_by.sql) — realizes `alert_triggered_by` · _shared with 2 other collection(s)_
- [`t_allocation_with_input_facets`](tables/t_allocation_with_input_facets.sql) — realizes `allocation_with_input_facets` · _shared with 3 other collection(s)_
- [`t_artifact_with_min_two_parts`](tables/t_artifact_with_min_two_parts.sql) — realizes `artifact_with_min_two_parts` · _shared with 6 other collection(s)_
- [`t_belief_interval_basic`](tables/t_belief_interval_basic.sql) — realizes `belief_interval_basic` · _shared with 9 other collection(s)_
- [`t_chemical_exposure_risk_profile`](tables/t_chemical_exposure_risk_profile.sql) — realizes `chemical_exposure_risk_profile` · _shared with 3 other collection(s)_
- [`t_claim_basic`](tables/t_claim_basic.sql) — realizes `claim_basic` · _shared with 15 other collection(s)_
- [`t_constraint_with_predicate`](tables/t_constraint_with_predicate.sql) — realizes `constraint_with_predicate` · _shared with 8 other collection(s)_
- [`t_ebpfprogram_union_kprobe_or_xdp`](tables/t_ebpfprogram_union_kprobe_or_xdp.sql) — realizes `ebpfprogram_union_kprobe_or_xdp` · _shared with 7 other collection(s)_
- [`t_equiv_union_three`](tables/t_equiv_union_three.sql) — realizes `equiv_union_three` · _shared with 5 other collection(s)_
- [`t_evidence_observed_by_process`](tables/t_evidence_observed_by_process.sql) — realizes `evidence_observed_by_process` · _shared with 7 other collection(s)_
- [`t_financial_strategy_oversight`](tables/t_financial_strategy_oversight.sql) — realizes `financial_strategy_oversight` · _shared with 7 other collection(s)_
- [`t_ganglion_cyst_imaging_finding`](tables/t_ganglion_cyst_imaging_finding.sql) — realizes `ganglion_cyst_imaging_finding` · _shared with 11 other collection(s)_
- [`t_ganglion_cyst_tissue_origin`](tables/t_ganglion_cyst_tissue_origin.sql) — realizes `ganglion_cyst_tissue_origin` · _shared with 13 other collection(s)_
- [`t_labrun_subclass`](tables/t_labrun_subclass.sql) — realizes `labrun_subclass` · _shared with 10 other collection(s)_
- [`t_mass_function_subclass`](tables/t_mass_function_subclass.sql) — realizes `mass_function_subclass` · _shared with 3 other collection(s)_
- [`t_observation_records_state`](tables/t_observation_records_state.sql) — realizes `observation_records_state` · _shared with 14 other collection(s)_
- [`t_observation_with_participant`](tables/t_observation_with_participant.sql) — realizes `observation_with_participant` · _shared with 8 other collection(s)_
- [`t_policy_authored_by`](tables/t_policy_authored_by.sql) — realizes `policy_authored_by` · _shared with 10 other collection(s)_
- [`t_policy_constrains_only_artifact`](tables/t_policy_constrains_only_artifact.sql) — realizes `policy_constrains_only_artifact` · _shared with 9 other collection(s)_
- [`t_process_max_one_operator`](tables/t_process_max_one_operator.sql) — realizes `process_max_one_operator` · _shared with 4 other collection(s)_
- [`t_process_min_one_input`](tables/t_process_min_one_input.sql) — realizes `process_min_one_input` · _shared with 7 other collection(s)_
- [`t_process_min_one_output`](tables/t_process_min_one_output.sql) — realizes `process_min_one_output` · _shared with 7 other collection(s)_
- [`t_program_with_entry_exactly_one`](tables/t_program_with_entry_exactly_one.sql) — realizes `program_with_entry_exactly_one` · _shared with 10 other collection(s)_
- [`t_requirement_satisfies`](tables/t_requirement_satisfies.sql) — realizes `requirement_satisfies` · _shared with 9 other collection(s)_
- [`t_schemaorg_product_price`](tables/t_schemaorg_product_price.sql) — realizes `schemaorg_product_price` · _shared with 6 other collection(s)_
- [`t_subclass_to_independent_continuant`](tables/t_subclass_to_independent_continuant.sql) — realizes `subclass_to_independent_continuant` · _shared with 7 other collection(s)_
- [`t_summary_metric_subclass`](tables/t_summary_metric_subclass.sql) — realizes `summary_metric_subclass` · _shared with 5 other collection(s)_
- [`t_syscall_with_return_type`](tables/t_syscall_with_return_type.sql) — realizes `syscall_with_return_type` · _shared with 9 other collection(s)_
- [`t_trace_basic`](tables/t_trace_basic.sql) — realizes `trace_basic` · _shared with 5 other collection(s)_
- [`t_transformation_governed_by`](tables/t_transformation_governed_by.sql) — realizes `transformation_governed_by` · _shared with 5 other collection(s)_
- [`t_verification_basic`](tables/t_verification_basic.sql) — realizes `verification_basic` · _shared with 12 other collection(s)_
- [`t_xdp_action_pass`](tables/t_xdp_action_pass.sql) — realizes `xdp_action_pass` · _shared with 8 other collection(s)_
