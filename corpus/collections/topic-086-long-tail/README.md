# Collection — topic 86 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **7 topics** (target + style) · **29 ontology terms** · **29 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 86: topic 140, topic 142, topic 184, topic 185, topic 195, topic 196.

> **Topic gist** (representative FinePDFs text): Engineered Science DOI: https://dx.doi.org/10.30919/es8d799 A Novel Multi Regional Reliability Method for COVID-19 Death Forecast Oleg Gaidai1 and Yihan Xing 2,* Abstract Coronavirus disease was reported spread worldwide with low morbidity and mortality, presenting certain burden on worldwide public health. The present study describes a novel bio-system reliability approach, particularly suit... …

## Chapters

- [ch_live_backward_compatible_with_0f1a23](chapters/ch_live_backward_compatible_with_0f1a23.md)
- [ch_live_cardinality_max_one_generic_ac3793](chapters/ch_live_cardinality_max_one_generic_ac3793.md)
- [ch_live_kernelhook_with_attached_program_5d3a30](chapters/ch_live_kernelhook_with_attached_program_5d3a30.md)
- [ch_live_lineage_edge_via_transformation_49187f](chapters/ch_live_lineage_edge_via_transformation_49187f.md)
- [ch_live_measurement_with_method_8d7ce3](chapters/ch_live_measurement_with_method_8d7ce3.md)
- [ch_live_observation_with_participant_d2ebdd](chapters/ch_live_observation_with_participant_d2ebdd.md)
- [ch_live_opentelemetry_span_subclass_afcf75](chapters/ch_live_opentelemetry_span_subclass_afcf75.md)
- [ch_live_outlier_claim_supported_by_lift_827b67](chapters/ch_live_outlier_claim_supported_by_lift_827b67.md)
- [ch_live_outlier_detection_basic_fbe182](chapters/ch_live_outlier_detection_basic_fbe182.md)
- [ch_live_outlier_detection_produces_claim_4757e6](chapters/ch_live_outlier_detection_produces_claim_4757e6.md)
- [ch_live_outlier_detection_produces_claim_f2e325](chapters/ch_live_outlier_detection_produces_claim_f2e325.md)
- [ch_live_subclass_basic_43972b](chapters/ch_live_subclass_basic_43972b.md)
- [ch_live_xdp_action_drop_5e8b8a](chapters/ch_live_xdp_action_drop_5e8b8a.md)

## Ontology terms grounding this collection

- `attribute_set_min_one` — {X} is a descriptive information content entity
- `backward_compatible_with` — {X} is a descriptive information content entity that backward compatible with {Y}
- `belief_interval_equiv_bel_and_pl` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasBeliefLowerBound some {Y:Class}) and (sdg:hasPlausibilityU
- `cardinality_max_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} max 1 {Y:Class}
- `constraint_with_violation_consequence` — {X} is a directive information content entity that on violation {Z}
- `division_assignment_record` — A DivisionAssignmentRecord is a descriptive information entity that assigns exactly one athlete to exactly one competiti
- `gauge_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `internal_communication_requirement` — InternalCommunicationRequirement is a directive ICE that specifies an EnterpriseSocialMedia and targets an Organizationa
- `kernelhook_with_attached_program` — {X} is an artifact that has attached program {Y}
- `lineage_edge_via_transformation` — {X} is a descriptive information content entity that via transformation {Y}
- `measurement_with_method` — {X} is a descriptive information content entity that via method {Y}
- `observation_with_participant` — {X} is a process that has participant artifact
- `ontology_class_match` — {X} is a descriptive information content entity that matches ontology class {Y}
- `opentelemetry_span_subclass` — {X} is a process that has span context {Y}
- `outlier_claim_supported_by_lift` — {X} is a descriptive information content entity that has attribute set {Z}
- `outlier_claim_with_attribute_set` — {X} is a descriptive information content entity that has attribute set {Y}
- `outlier_detection_basic` — {X} is a process
- `outlier_detection_produces_claim` — {X} is a process that produces {Y}
- `policy_enforced_by` — {X} is a directive information content entity that enforced by {Y}
- `process_uses_artifact` — {X} is a process that uses artifact
- `profiling_basic` — {X} is a process
- `profiling_with_method` — {X} is a process that applies method {Y}
- `requirement_traces_to` — {X} is a directive information content entity that traces to {Y}
- `requirement_verified_by` — {X} is a directive information content entity that verified by {Y}
- `settlement_financing_activity` — A SettlementFinancingActivity is an Occurrent that funds some FinancialInstitution and benefits some SettlementProject.
- `social_networking_service_usage` — A SocialNetworkingServiceUsage is a process that involves a StaffMember and utilizes a SocialNetworkingService.
- `state_observed_at_time` — {X} is a descriptive information content entity that observed at {Y}
- `subclass_basic` — {X} is a {Y}
- `xdp_action_drop` — {X} is an artifact that has xdpaction {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attribute_set_min_one`](tables/t_attribute_set_min_one.sql) — realizes `attribute_set_min_one` · _shared with 7 other collection(s)_
- [`t_backward_compatible_with`](tables/t_backward_compatible_with.sql) — realizes `backward_compatible_with` · _shared with 6 other collection(s)_
- [`t_belief_interval_equiv_bel_and_pl`](tables/t_belief_interval_equiv_bel_and_pl.sql) — realizes `belief_interval_equiv_bel_and_pl` · _shared with 13 other collection(s)_
- [`t_cardinality_max_one_generic`](tables/t_cardinality_max_one_generic.sql) — realizes `cardinality_max_one_generic` · _shared with 9 other collection(s)_
- [`t_constraint_with_violation_consequence`](tables/t_constraint_with_violation_consequence.sql) — realizes `constraint_with_violation_consequence` · _shared with 8 other collection(s)_
- [`t_division_assignment_record`](tables/t_division_assignment_record.sql) — realizes `division_assignment_record` · _shared with 7 other collection(s)_
- [`t_gauge_metric_subclass`](tables/t_gauge_metric_subclass.sql) — realizes `gauge_metric_subclass` · _shared with 9 other collection(s)_
- [`t_internal_communication_requirement`](tables/t_internal_communication_requirement.sql) — realizes `internal_communication_requirement` · _shared with 9 other collection(s)_
- [`t_kernelhook_with_attached_program`](tables/t_kernelhook_with_attached_program.sql) — realizes `kernelhook_with_attached_program` · _shared with 9 other collection(s)_
- [`t_lineage_edge_via_transformation`](tables/t_lineage_edge_via_transformation.sql) — realizes `lineage_edge_via_transformation` · _shared with 11 other collection(s)_
- [`t_measurement_with_method`](tables/t_measurement_with_method.sql) — realizes `measurement_with_method` · _shared with 9 other collection(s)_
- [`t_observation_with_participant`](tables/t_observation_with_participant.sql) — realizes `observation_with_participant` · _shared with 8 other collection(s)_
- [`t_ontology_class_match`](tables/t_ontology_class_match.sql) — realizes `ontology_class_match` · _shared with 9 other collection(s)_
- [`t_opentelemetry_span_subclass`](tables/t_opentelemetry_span_subclass.sql) — realizes `opentelemetry_span_subclass` · _shared with 7 other collection(s)_
- [`t_outlier_claim_supported_by_lift`](tables/t_outlier_claim_supported_by_lift.sql) — realizes `outlier_claim_supported_by_lift` · _shared with 8 other collection(s)_
- [`t_outlier_claim_with_attribute_set`](tables/t_outlier_claim_with_attribute_set.sql) — realizes `outlier_claim_with_attribute_set` · _shared with 5 other collection(s)_
- [`t_outlier_detection_basic`](tables/t_outlier_detection_basic.sql) — realizes `outlier_detection_basic` · _shared with 4 other collection(s)_
- [`t_outlier_detection_produces_claim`](tables/t_outlier_detection_produces_claim.sql) — realizes `outlier_detection_produces_claim` · _shared with 2 other collection(s)_
- [`t_policy_enforced_by`](tables/t_policy_enforced_by.sql) — realizes `policy_enforced_by` · _shared with 12 other collection(s)_
- [`t_process_uses_artifact`](tables/t_process_uses_artifact.sql) — realizes `process_uses_artifact` · _shared with 5 other collection(s)_
- [`t_profiling_basic`](tables/t_profiling_basic.sql) — realizes `profiling_basic` · _shared with 7 other collection(s)_
- [`t_profiling_with_method`](tables/t_profiling_with_method.sql) — realizes `profiling_with_method` · _shared with 9 other collection(s)_
- [`t_requirement_traces_to`](tables/t_requirement_traces_to.sql) — realizes `requirement_traces_to` · _shared with 15 other collection(s)_
- [`t_requirement_verified_by`](tables/t_requirement_verified_by.sql) — realizes `requirement_verified_by` · _shared with 7 other collection(s)_
- [`t_settlement_financing_activity`](tables/t_settlement_financing_activity.sql) — realizes `settlement_financing_activity` · _shared with 4 other collection(s)_
- [`t_social_networking_service_usage`](tables/t_social_networking_service_usage.sql) — realizes `social_networking_service_usage` · _shared with 4 other collection(s)_
- [`t_state_observed_at_time`](tables/t_state_observed_at_time.sql) — realizes `state_observed_at_time` · _shared with 9 other collection(s)_
- [`t_subclass_basic`](tables/t_subclass_basic.sql) — realizes `subclass_basic` · _shared with 12 other collection(s)_
- [`t_xdp_action_drop`](tables/t_xdp_action_drop.sql) — realizes `xdp_action_drop` · _shared with 9 other collection(s)_
