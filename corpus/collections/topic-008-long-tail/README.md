# Collection — topic 8 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **8 chapters** · **10 topics** (target + style) · **17 ontology terms** · **17 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 8: topic 16, topic 20, topic 23, topic 25, topic 39, topic 55, topic 76, topic 88, topic 93.

> **Topic gist** (representative FinePDFs text): Metabolic disturbances of non-alcoholic fatty liver resemble the alterations typical for type 2 diabetes Citation for published version (APA): Brouwers, B., Schrauwen-Hinderling, V. B., Jelenik, T., Gemmink, A., Havekes, B., Bruls, Y., Dahlmans, D., Roden, M., Hesselink, M. K. C., & Schrauwen, P. (2017). Metabolic disturbances of non-alcoholic fatty liver resemble the alterations typical for type. …

## Chapters

- [ch_live_allocation_subclass_65f8ef](chapters/ch_live_allocation_subclass_65f8ef.md)
- [ch_live_ebpfmap_pinned_at_path_7a4981](chapters/ch_live_ebpfmap_pinned_at_path_7a4981.md)
- [ch_live_ebpfprogram_equiv_typed_with_hook_3eeead](chapters/ch_live_ebpfprogram_equiv_typed_with_hook_3eeead.md)
- [ch_live_iso27001_annexa_subclass_4b45ea](chapters/ch_live_iso27001_annexa_subclass_4b45ea.md)
- [ch_live_iso27001_annexa_subclass_709f69](chapters/ch_live_iso27001_annexa_subclass_709f69.md)
- [ch_live_metric_observed_by_event_5f3649](chapters/ch_live_metric_observed_by_event_5f3649.md)
- [ch_live_outlier_claim_min_one_attribute_002f23](chapters/ch_live_outlier_claim_min_one_attribute_002f23.md)
- [ch_live_policy_enforced_by_3e4184](chapters/ch_live_policy_enforced_by_3e4184.md)

## Ontology terms grounding this collection

- `allocation_subclass` — {X} is a process that executes transformation {Y}
- `belief_interval_equiv_bel_and_pl` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasBeliefLowerBound some {Y:Class}) and (sdg:hasPlausibilityU
- `belief_interval_with_upper_bound` — {X} is a descriptive information content entity that has plausibility upper bound {Y}
- `division_eligibility_constraint` — A DivisionEligibilityConstraint is equivalent to a qualified athlete status that explicitly excludes cross-division tran
- `ebpfmap_pinned_at_path` — {X} is an artifact that pinned at path {Y}
- `ebpfprogram_equiv_typed_with_hook` — Class: {X:Class} EquivalentTo: cco:Artifact and (sdg:hasProgramType some {Y:Class}) and (sdg:attachesToHook some {Z:Clas
- `hipaa_safeguard_physical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `institutional_vision_statement` — An InstitutionalVisionStatement is a cco:DirectiveICE that targetsGoal some EducationalGoal and addressesStakeholder som
- `iso27001_annexa_subclass` — {X} is a directive information content entity that iso27001 annex a {Y}
- `legal_advocate_role` — A LegalAdvocateRole is an agent_role that has exactly one Person as its bearer and assists some DomesticViolenceSurvivor
- `metric_observed_by_event` — {X} is a descriptive information content entity
- `outlier_claim_min_one_attribute` — {X} is a descriptive information content entity
- `policy_enforced_by` — {X} is a directive information content entity that enforced by {Y}
- `requirement_under_standard` — {X} is a directive information content entity that under standard {Y}
- `span_within_trace` — {X} is a process that part of {Y}
- `technology_promotion_initiative` — A TechnologyPromotionInitiative is a Process that targetsSector some IndustrySector and utilizesChannel some Communicati
- `transformation_associated_with_agent` — {X} is a process that was associated with {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_allocation_subclass`](tables/t_allocation_subclass.sql) — realizes `allocation_subclass` · _shared with 12 other collection(s)_
- [`t_belief_interval_equiv_bel_and_pl`](tables/t_belief_interval_equiv_bel_and_pl.sql) — realizes `belief_interval_equiv_bel_and_pl` · _shared with 13 other collection(s)_
- [`t_belief_interval_with_upper_bound`](tables/t_belief_interval_with_upper_bound.sql) — realizes `belief_interval_with_upper_bound` · _shared with 1 other collection(s)_
- [`t_division_eligibility_constraint`](tables/t_division_eligibility_constraint.sql) — realizes `division_eligibility_constraint` · _shared with 11 other collection(s)_
- [`t_ebpfmap_pinned_at_path`](tables/t_ebpfmap_pinned_at_path.sql) — realizes `ebpfmap_pinned_at_path` · _shared with 3 other collection(s)_
- [`t_ebpfprogram_equiv_typed_with_hook`](tables/t_ebpfprogram_equiv_typed_with_hook.sql) — realizes `ebpfprogram_equiv_typed_with_hook` · _shared with 6 other collection(s)_
- [`t_hipaa_safeguard_physical`](tables/t_hipaa_safeguard_physical.sql) — realizes `hipaa_safeguard_physical` · _shared with 1 other collection(s)_
- [`t_institutional_vision_statement`](tables/t_institutional_vision_statement.sql) — realizes `institutional_vision_statement` · _shared with 12 other collection(s)_
- [`t_iso27001_annexa_subclass`](tables/t_iso27001_annexa_subclass.sql) — realizes `iso27001_annexa_subclass` · _shared with 2 other collection(s)_
- [`t_legal_advocate_role`](tables/t_legal_advocate_role.sql) — realizes `legal_advocate_role` · _shared with 5 other collection(s)_
- [`t_metric_observed_by_event`](tables/t_metric_observed_by_event.sql) — realizes `metric_observed_by_event` · _shared with 7 other collection(s)_
- [`t_outlier_claim_min_one_attribute`](tables/t_outlier_claim_min_one_attribute.sql) — realizes `outlier_claim_min_one_attribute` · _shared with 4 other collection(s)_
- [`t_policy_enforced_by`](tables/t_policy_enforced_by.sql) — realizes `policy_enforced_by` · _shared with 12 other collection(s)_
- [`t_requirement_under_standard`](tables/t_requirement_under_standard.sql) — realizes `requirement_under_standard` · _shared with 7 other collection(s)_
- [`t_span_within_trace`](tables/t_span_within_trace.sql) — realizes `span_within_trace` · _shared with 7 other collection(s)_
- [`t_technology_promotion_initiative`](tables/t_technology_promotion_initiative.sql) — realizes `technology_promotion_initiative` · _shared with 9 other collection(s)_
- [`t_transformation_associated_with_agent`](tables/t_transformation_associated_with_agent.sql) — realizes `transformation_associated_with_agent` · _shared with 8 other collection(s)_
