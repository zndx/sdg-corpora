# Collection — topic 165 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **2 topics** (target + style) · **23 ontology terms** · **23 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 165: topic 168.

> **Topic gist** (representative FinePDFs text): Malaria Journal Bio Med Central Research Open Access 'A mate or a meal' – Pre-gravid behaviour of female Anopheles gambiae from the islands of São Tomé and Príncipe, West Africa J Derek Charlwood* 1,2 , Joao Pinto 1 , Carla A Sousa 3 , Conceicao Ferreira 4 , Vincenso Petrarca 5 and Virgilio do E Rosario 1 Address: 1 Centro de Málaria e outras Doenças Tropicais, Instituto de Higiene e Medic... …

## Chapters

- [ch_live_allocation_with_run_status_4afd8f](chapters/ch_live_allocation_with_run_status_4afd8f.md)
- [ch_live_cardinality_max_three_generic_4b91f0](chapters/ch_live_cardinality_max_three_generic_4b91f0.md)
- [ch_live_disjunctive_combination_453013](chapters/ch_live_disjunctive_combination_453013.md)
- [ch_live_evidence_independent_or_correlated_60dcb0](chapters/ch_live_evidence_independent_or_correlated_60dcb0.md)
- [ch_live_mass_function_equiv_frame_and_assignment_2605a2](chapters/ch_live_mass_function_equiv_frame_and_assignment_2605a2.md)
- [ch_live_mass_function_equiv_frame_and_assignment_2fbbdc](chapters/ch_live_mass_function_equiv_frame_and_assignment_2fbbdc.md)
- [ch_live_mass_function_equiv_frame_and_assignment_c9c222](chapters/ch_live_mass_function_equiv_frame_and_assignment_c9c222.md)
- [ch_live_policy_min_one_enforcer_a6d907](chapters/ch_live_policy_min_one_enforcer_a6d907.md)
- [ch_live_policy_only_applies_to_046741](chapters/ch_live_policy_only_applies_to_046741.md)
- [ch_live_soc2_security_subclass_e8bbab](chapters/ch_live_soc2_security_subclass_e8bbab.md)
- [ch_live_technology_promotion_initiative_8cfaaa](chapters/ch_live_technology_promotion_initiative_8cfaaa.md)

## Ontology terms grounding this collection

- `allocation_exactly_one_run_id` — {X} is a process
- `allocation_with_run_status` — {X} is a process that has run status {Y}
- `belief_interval_for_claim` — {X} is a descriptive information content entity that for claim {Y}
- `bpf_helper_called_by` — {X} is an artifact that called by program {Y}
- `cardinality_max_three_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} max 3 {Y:Class}
- `directive_supersedes_directive` — {X} is a directive information content entity that supersedes directive information content entity
- `disjunctive_combination` — {X} is a descriptive information content entity that disjunctively combines {Y}
- `equiv_union_basic` — {X} is equivalent to {Y} or {Z}
- `evidence_independent_or_correlated` — {X} is equivalent to descriptive information content entity and {Y} or {Z}
- `forward_compatible_with` — {X} is a descriptive information content entity that forward compatible with {Y}
- `institutional_vision_statement` — An InstitutionalVisionStatement is a cco:DirectiveICE that targetsGoal some EducationalGoal and addressesStakeholder som
- `kernel_event_with_pid` — {X} is a process that with process id {Y}
- `lane_compliance_behavior` — LaneComplianceBehavior is a Process that involvesOperator some VehicleOperator and occursOnStreetType some StreetTraffic
- `mass_function_equiv_frame_and_assignment` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:overFrameOfDiscernment some {Y:Class}) and (sdg:assignsMassTo
- `mass_function_min_one_focal` — {X} is a descriptive information content entity
- `mass_function_normalized_form` — {X} is a descriptive information content entity that has normalized form {Y}
- `policy_min_one_enforcer` — {X} is a directive information content entity
- `policy_only_applies_to` — {X} is a directive information content entity that applies to {Y}
- `profile_of_column` — {X} is a descriptive information content entity that is about {Y}
- `schemaorg_product_brand` — {X} is an artifact that has brand {Y}
- `soc2_security_subclass` — {X} is a directive information content entity that for soc2 domain {Y}
- `technology_promotion_initiative` — A TechnologyPromotionInitiative is a Process that targetsSector some IndustrySector and utilizesChannel some Communicati
- `trace_originates_from` — {X} is a process that originates from {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_allocation_exactly_one_run_id`](tables/t_allocation_exactly_one_run_id.sql) — realizes `allocation_exactly_one_run_id` · _shared with 5 other collection(s)_
- [`t_allocation_with_run_status`](tables/t_allocation_with_run_status.sql) — realizes `allocation_with_run_status` · _shared with 6 other collection(s)_
- [`t_belief_interval_for_claim`](tables/t_belief_interval_for_claim.sql) — realizes `belief_interval_for_claim` · _shared with 6 other collection(s)_
- [`t_bpf_helper_called_by`](tables/t_bpf_helper_called_by.sql) — realizes `bpf_helper_called_by` · _shared with 7 other collection(s)_
- [`t_cardinality_max_three_generic`](tables/t_cardinality_max_three_generic.sql) — realizes `cardinality_max_three_generic` · _shared with 9 other collection(s)_
- [`t_directive_supersedes_directive`](tables/t_directive_supersedes_directive.sql) — realizes `directive_supersedes_directive` · _shared with 6 other collection(s)_
- [`t_disjunctive_combination`](tables/t_disjunctive_combination.sql) — realizes `disjunctive_combination` · _shared with 11 other collection(s)_
- [`t_equiv_union_basic`](tables/t_equiv_union_basic.sql) — realizes `equiv_union_basic` · _shared with 9 other collection(s)_
- [`t_evidence_independent_or_correlated`](tables/t_evidence_independent_or_correlated.sql) — realizes `evidence_independent_or_correlated` · _shared with 5 other collection(s)_
- [`t_forward_compatible_with`](tables/t_forward_compatible_with.sql) — realizes `forward_compatible_with` · _shared with 3 other collection(s)_
- [`t_institutional_vision_statement`](tables/t_institutional_vision_statement.sql) — realizes `institutional_vision_statement` · _shared with 12 other collection(s)_
- [`t_kernel_event_with_pid`](tables/t_kernel_event_with_pid.sql) — realizes `kernel_event_with_pid` · _shared with 3 other collection(s)_
- [`t_lane_compliance_behavior`](tables/t_lane_compliance_behavior.sql) — realizes `lane_compliance_behavior` · _shared with 9 other collection(s)_
- [`t_mass_function_equiv_frame_and_assignment`](tables/t_mass_function_equiv_frame_and_assignment.sql) — realizes `mass_function_equiv_frame_and_assignment` · _shared with 6 other collection(s)_
- [`t_mass_function_min_one_focal`](tables/t_mass_function_min_one_focal.sql) — realizes `mass_function_min_one_focal` · _shared with 9 other collection(s)_
- [`t_mass_function_normalized_form`](tables/t_mass_function_normalized_form.sql) — realizes `mass_function_normalized_form` · _shared with 2 other collection(s)_
- [`t_policy_min_one_enforcer`](tables/t_policy_min_one_enforcer.sql) — realizes `policy_min_one_enforcer` · _shared with 7 other collection(s)_
- [`t_policy_only_applies_to`](tables/t_policy_only_applies_to.sql) — realizes `policy_only_applies_to` · _shared with 5 other collection(s)_
- [`t_profile_of_column`](tables/t_profile_of_column.sql) — realizes `profile_of_column` · _shared with 6 other collection(s)_
- [`t_schemaorg_product_brand`](tables/t_schemaorg_product_brand.sql) — realizes `schemaorg_product_brand` · _shared with 9 other collection(s)_
- [`t_soc2_security_subclass`](tables/t_soc2_security_subclass.sql) — realizes `soc2_security_subclass` · _shared with 9 other collection(s)_
- [`t_technology_promotion_initiative`](tables/t_technology_promotion_initiative.sql) — realizes `technology_promotion_initiative` · _shared with 9 other collection(s)_
- [`t_trace_originates_from`](tables/t_trace_originates_from.sql) — realizes `trace_originates_from` · _shared with 9 other collection(s)_
