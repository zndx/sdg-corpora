# Collection — topic 91 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **9 topics** (target + style) · **24 ontology terms** · **24 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 91: topic 12, topic 36, topic 46, topic 92, topic 94, topic 105, topic 181, topic 183.

> **Topic gist** (representative FinePDFs text): Read Online Chemical Engineering Projects For Final Year Chemical Engineering Projects For Final Year Thank you for reading chemical engineering projects for final year. As you may know, people have search hundreds times for their chosen readings like this chemical engineering projects for final year, but end up in malicious downloads. Rather than reading a good book with a cup of coffee in the .. …

## Chapters

- [ch_live_aggregation_uses_function_e73b6f](chapters/ch_live_aggregation_uses_function_e73b6f.md)
- [ch_live_annotation_basic_6c5339](chapters/ch_live_annotation_basic_6c5339.md)
- [ch_live_attribute_set_max_attrs_cec1fa](chapters/ch_live_attribute_set_max_attrs_cec1fa.md)
- [ch_live_classification_basic_07ff92](chapters/ch_live_classification_basic_07ff92.md)
- [ch_live_classification_basic_3278f2](chapters/ch_live_classification_basic_3278f2.md)
- [ch_live_classification_basic_5e046d](chapters/ch_live_classification_basic_5e046d.md)
- [ch_live_classification_basic_d094df](chapters/ch_live_classification_basic_d094df.md)
- [ch_live_dempster_combinant_second_3f3c7d](chapters/ch_live_dempster_combinant_second_3f3c7d.md)
- [ch_live_process_with_min_one_artifact_0c56a0](chapters/ch_live_process_with_min_one_artifact_0c56a0.md)
- [ch_live_profile_has_distribution_ad1253](chapters/ch_live_profile_has_distribution_ad1253.md)
- [ch_live_state_transitions_to_8220fb](chapters/ch_live_state_transitions_to_8220fb.md)

## Ontology terms grounding this collection

- `aggregation_uses_function` — {X} is a descriptive information content entity that uses aggregation function {Y}
- `annotation_basic` — {X} is a descriptive information content entity
- `artifact_not_deprecated` — {X} is not {Y}
- `attribute_set_max_attrs` — {X} is a descriptive information content entity
- `belief_interval_at_confidence_level` — {X} is a descriptive information content entity that at confidence level {Y}
- `belief_interval_equiv_bel_and_pl` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasBeliefLowerBound some {Y:Class}) and (sdg:hasPlausibilityU
- `carbon_credit_transaction` — A CarbonCreditTransaction is an InformationContentEntity that derives from some CarbonCreditProject, transferred to some
- `classification_assigns_tier` — {X} is a process that assigns tier {Y}
- `classification_basic` — {X} is a process
- `classification_subclass` — {X} is a process that classifies artifact artifact
- `classification_under_taxonomy` — {X} is a process that under taxonomy {Y}
- `control_equiv_implements_with_owner` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:implements some {Y:Class}) and (sdg:hasOwner some cco:Person)
- `dempster_combinant_second` — {X} is a descriptive information content entity that has second combinant {Y}
- `electricity_usage_pattern_record` — A UsagePatternRecord is an informational entity that records a ServiceUsageCategory, corresponds to a TariffStructure, a
- `equiv_intersect_anchored_artifact` — {X} is equivalent to {Y} and artifact
- `financial_strategy_oversight` — A FinancialStrategyOversight is a Process that directs some FinancialActivity and oversees some RiskManagementActivity.
- `observation_records_state` — {X} is a process that records {Y}
- `policy_enforced_by` — {X} is a directive information content entity that enforced by {Y}
- `process_with_min_one_artifact` — {X} is a process
- `professional_experience` — A ProfessionalExperience is an InformationContentEntity that relates a Person to an Organization and records a duration 
- `profile_has_distribution` — {X} is a descriptive information content entity that has distribution {Y}
- `state_transitions_to` — {X} is a descriptive information content entity that transitions to {Y}
- `subclass_basic` — {X} is a {Y}
- `subclass_not_basic` — {X} is not {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_aggregation_uses_function`](tables/t_aggregation_uses_function.sql) — realizes `aggregation_uses_function` · _shared with 4 other collection(s)_
- [`t_annotation_basic`](tables/t_annotation_basic.sql) — realizes `annotation_basic` · _shared with 7 other collection(s)_
- [`t_artifact_not_deprecated`](tables/t_artifact_not_deprecated.sql) — realizes `artifact_not_deprecated` · _shared with 10 other collection(s)_
- [`t_attribute_set_max_attrs`](tables/t_attribute_set_max_attrs.sql) — realizes `attribute_set_max_attrs` · _shared with 6 other collection(s)_
- [`t_belief_interval_at_confidence_level`](tables/t_belief_interval_at_confidence_level.sql) — realizes `belief_interval_at_confidence_level` · _shared with 2 other collection(s)_
- [`t_belief_interval_equiv_bel_and_pl`](tables/t_belief_interval_equiv_bel_and_pl.sql) — realizes `belief_interval_equiv_bel_and_pl` · _shared with 13 other collection(s)_
- [`t_carbon_credit_transaction`](tables/t_carbon_credit_transaction.sql) — realizes `carbon_credit_transaction` · _shared with 8 other collection(s)_
- [`t_classification_assigns_tier`](tables/t_classification_assigns_tier.sql) — realizes `classification_assigns_tier` · _shared with 2 other collection(s)_
- [`t_classification_basic`](tables/t_classification_basic.sql) — realizes `classification_basic` · _shared with 4 other collection(s)_
- [`t_classification_subclass`](tables/t_classification_subclass.sql) — realizes `classification_subclass` · _shared with 3 other collection(s)_
- [`t_classification_under_taxonomy`](tables/t_classification_under_taxonomy.sql) — realizes `classification_under_taxonomy` · _shared with 1 other collection(s)_
- [`t_control_equiv_implements_with_owner`](tables/t_control_equiv_implements_with_owner.sql) — realizes `control_equiv_implements_with_owner` · _shared with 4 other collection(s)_
- [`t_dempster_combinant_second`](tables/t_dempster_combinant_second.sql) — realizes `dempster_combinant_second` · _shared with 7 other collection(s)_
- [`t_electricity_usage_pattern_record`](tables/t_electricity_usage_pattern_record.sql) — realizes `electricity_usage_pattern_record` · _shared with 5 other collection(s)_
- [`t_equiv_intersect_anchored_artifact`](tables/t_equiv_intersect_anchored_artifact.sql) — realizes `equiv_intersect_anchored_artifact` · _shared with 5 other collection(s)_
- [`t_financial_strategy_oversight`](tables/t_financial_strategy_oversight.sql) — realizes `financial_strategy_oversight` · _shared with 7 other collection(s)_
- [`t_observation_records_state`](tables/t_observation_records_state.sql) — realizes `observation_records_state` · _shared with 14 other collection(s)_
- [`t_policy_enforced_by`](tables/t_policy_enforced_by.sql) — realizes `policy_enforced_by` · _shared with 12 other collection(s)_
- [`t_process_with_min_one_artifact`](tables/t_process_with_min_one_artifact.sql) — realizes `process_with_min_one_artifact` · _shared with 3 other collection(s)_
- [`t_professional_experience`](tables/t_professional_experience.sql) — realizes `professional_experience` · _shared with 8 other collection(s)_
- [`t_profile_has_distribution`](tables/t_profile_has_distribution.sql) — realizes `profile_has_distribution` · _shared with 8 other collection(s)_
- [`t_state_transitions_to`](tables/t_state_transitions_to.sql) — realizes `state_transitions_to` · _shared with 5 other collection(s)_
- [`t_subclass_basic`](tables/t_subclass_basic.sql) — realizes `subclass_basic` · _shared with 12 other collection(s)_
- [`t_subclass_not_basic`](tables/t_subclass_not_basic.sql) — realizes `subclass_not_basic` · _shared with 11 other collection(s)_
