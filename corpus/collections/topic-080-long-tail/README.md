# Collection — topic 80 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **16 chapters** · **10 topics** (target + style) · **33 ontology terms** · **33 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 80: topic 7, topic 51, topic 78, topic 142, topic 144, topic 168, topic 181, topic 188, topic 195.

> **Topic gist** (representative FinePDFs text): Module Handbook Bachelor's Program Mechanical Engineering SPO 2015 (issued), Study Program: Mechanical Engineering 2016 Winter term 2022/23 Date: 20/09/2022 KIT DEPARTMENT OF MECHANICAL ENGINEERING # Table Of Contents 1. About this handbook ........................................................................................................... 7 1.1. Notes and rules ........................ …

## Chapters

- [ch_live_belief_interval_exactly_two_bounds_70b1d0](chapters/ch_live_belief_interval_exactly_two_bounds_70b1d0.md)
- [ch_live_cardinality_min_two_generic_b73414](chapters/ch_live_cardinality_min_two_generic_b73414.md)
- [ch_live_dataset_snapshot_subclass_c4b508](chapters/ch_live_dataset_snapshot_subclass_c4b508.md)
- [ch_live_designative_subclass_basic_37af96](chapters/ch_live_designative_subclass_basic_37af96.md)
- [ch_live_ebpf_event_observed_pid_70fbb5](chapters/ch_live_ebpf_event_observed_pid_70fbb5.md)
- [ch_live_gauge_metric_subclass_c1167c](chapters/ch_live_gauge_metric_subclass_c1167c.md)
- [ch_live_kernel_event_with_tid_05ac80](chapters/ch_live_kernel_event_with_tid_05ac80.md)
- [ch_live_lineage_edge_basic_a6cd89](chapters/ch_live_lineage_edge_basic_a6cd89.md)
- [ch_live_nist80053_control_subclass_4af009](chapters/ch_live_nist80053_control_subclass_4af009.md)
- [ch_live_nist80053_high_impact_30f37d](chapters/ch_live_nist80053_high_impact_30f37d.md)
- [ch_live_outlier_claim_supported_by_lift_5cb0c7](chapters/ch_live_outlier_claim_supported_by_lift_5cb0c7.md)
- [ch_live_policy_applies_to_25857f](chapters/ch_live_policy_applies_to_25857f.md)
- [ch_live_profile_has_null_rate_036879](chapters/ch_live_profile_has_null_rate_036879.md)
- [ch_live_state_transitions_to_f93c90](chapters/ch_live_state_transitions_to_f93c90.md)
- [ch_live_technology_promotion_initiative_70c646](chapters/ch_live_technology_promotion_initiative_70c646.md)
- [ch_live_young_adult_speaker_role_5b9934](chapters/ch_live_young_adult_speaker_role_5b9934.md)

## Ontology terms grounding this collection

- `annotation_only_about_artifact` — {X} is a descriptive information content entity
- `attestation_basic` — {X} is a process
- `belief_interval_exactly_two_bounds` — {X} is a descriptive information content entity
- `cardinality_min_two_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} min 2 {Y:Class}
- `dataset_snapshot_subclass` — {X} is an artifact that snapshot of {Y}
- `descriptive_either_evidence_or_claim` — {X} is equivalent to descriptive information content entity and {Y} or {Z}
- `designative_subclass_basic` — {X} is a designative information content entity
- `division_assignment_record` — A DivisionAssignmentRecord is a descriptive information entity that assigns exactly one athlete to exactly one competiti
- `ebpf_event_observed_pid` — {X} is a process that observes pid {Y}
- `ebpfprogram_loaded_in_kernel` — {X} is an artifact that loaded in {Y}
- `existential_anchored_to_artifact_via_part` — {X} is something that part of artifact
- `foreign_key_relation` — {X} is a descriptive information content entity that foreign key to {Y}
- `gauge_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `instrument_subclass` — {X} is an artifact that produces measurement {Y}
- `kernel_event_with_tid` — {X} is a process that with thread id {Y}
- `lift_subclass` — {X} is a descriptive information content entity that of attribute set {Y}
- `lineage_edge_basic` — {X} is a descriptive information content entity
- `lineage_edge_describes_column_flow` — {X} is a descriptive information content entity that describes column flow {Y}
- `lineage_edge_max_one_target` — {X} is a descriptive information content entity
- `measurement_observed_at` — {X} is a descriptive information content entity that observed at {Y}
- `nist80053_control_subclass` — {X} is a directive information content entity that nist80053 control {Y}
- `nist80053_high_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `outlier_claim_supported_by_lift` — {X} is a descriptive information content entity that has attribute set {Z}
- `policy_applies_to` — {X} is a directive information content entity that applies to {Y}
- `policy_enforced_by` — {X} is a directive information content entity that enforced by {Y}
- `profile_has_null_rate` — {X} is a descriptive information content entity that has null rate {Y}
- `profile_of_dataset` — {X} is a descriptive information content entity
- `profiling_basic` — {X} is a process
- `schemaorg_org_taxid` — {X} is an artifact that has tax id {Y}
- `state_transitions_to` — {X} is a descriptive information content entity that transitions to {Y}
- `technology_promotion_initiative` — A TechnologyPromotionInitiative is a Process that targetsSector some IndustrySector and utilizesChannel some Communicati
- `trace_min_one_span` — {X} is a process
- `young_adult_speaker_role` — A YoungAdultSpeakerRole is a Role that hasQualifyingIndividual exactly 1 YoungAdultIndividual and deliversPresentation s

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_annotation_only_about_artifact`](tables/t_annotation_only_about_artifact.sql) — realizes `annotation_only_about_artifact` · _shared with 8 other collection(s)_
- [`t_attestation_basic`](tables/t_attestation_basic.sql) — realizes `attestation_basic` · _shared with 8 other collection(s)_
- [`t_belief_interval_exactly_two_bounds`](tables/t_belief_interval_exactly_two_bounds.sql) — realizes `belief_interval_exactly_two_bounds` · _shared with 6 other collection(s)_
- [`t_cardinality_min_two_generic`](tables/t_cardinality_min_two_generic.sql) — realizes `cardinality_min_two_generic` · _shared with 8 other collection(s)_
- [`t_dataset_snapshot_subclass`](tables/t_dataset_snapshot_subclass.sql) — realizes `dataset_snapshot_subclass` · _shared with 10 other collection(s)_
- [`t_descriptive_either_evidence_or_claim`](tables/t_descriptive_either_evidence_or_claim.sql) — realizes `descriptive_either_evidence_or_claim` · _shared with 8 other collection(s)_
- [`t_designative_subclass_basic`](tables/t_designative_subclass_basic.sql) — realizes `designative_subclass_basic` · _shared with 2 other collection(s)_
- [`t_division_assignment_record`](tables/t_division_assignment_record.sql) — realizes `division_assignment_record` · _shared with 7 other collection(s)_
- [`t_ebpf_event_observed_pid`](tables/t_ebpf_event_observed_pid.sql) — realizes `ebpf_event_observed_pid` · _shared with 9 other collection(s)_
- [`t_ebpfprogram_loaded_in_kernel`](tables/t_ebpfprogram_loaded_in_kernel.sql) — realizes `ebpfprogram_loaded_in_kernel` · _shared with 7 other collection(s)_
- [`t_existential_anchored_to_artifact_via_part`](tables/t_existential_anchored_to_artifact_via_part.sql) — realizes `existential_anchored_to_artifact_via_part` · _shared with 12 other collection(s)_
- [`t_foreign_key_relation`](tables/t_foreign_key_relation.sql) — realizes `foreign_key_relation` · _shared with 6 other collection(s)_
- [`t_gauge_metric_subclass`](tables/t_gauge_metric_subclass.sql) — realizes `gauge_metric_subclass` · _shared with 9 other collection(s)_
- [`t_instrument_subclass`](tables/t_instrument_subclass.sql) — realizes `instrument_subclass` · _shared with 7 other collection(s)_
- [`t_kernel_event_with_tid`](tables/t_kernel_event_with_tid.sql) — realizes `kernel_event_with_tid` · _shared with 5 other collection(s)_
- [`t_lift_subclass`](tables/t_lift_subclass.sql) — realizes `lift_subclass` · _shared with 2 other collection(s)_
- [`t_lineage_edge_basic`](tables/t_lineage_edge_basic.sql) — realizes `lineage_edge_basic` · _shared with 4 other collection(s)_
- [`t_lineage_edge_describes_column_flow`](tables/t_lineage_edge_describes_column_flow.sql) — realizes `lineage_edge_describes_column_flow` · _shared with 1 other collection(s)_
- [`t_lineage_edge_max_one_target`](tables/t_lineage_edge_max_one_target.sql) — realizes `lineage_edge_max_one_target` · _shared with 11 other collection(s)_
- [`t_measurement_observed_at`](tables/t_measurement_observed_at.sql) — realizes `measurement_observed_at` · _shared with 7 other collection(s)_
- [`t_nist80053_control_subclass`](tables/t_nist80053_control_subclass.sql) — realizes `nist80053_control_subclass` · _shared with 5 other collection(s)_
- [`t_nist80053_high_impact`](tables/t_nist80053_high_impact.sql) — realizes `nist80053_high_impact` · _shared with 8 other collection(s)_
- [`t_outlier_claim_supported_by_lift`](tables/t_outlier_claim_supported_by_lift.sql) — realizes `outlier_claim_supported_by_lift` · _shared with 8 other collection(s)_
- [`t_policy_applies_to`](tables/t_policy_applies_to.sql) — realizes `policy_applies_to` · _shared with 7 other collection(s)_
- [`t_policy_enforced_by`](tables/t_policy_enforced_by.sql) — realizes `policy_enforced_by` · _shared with 12 other collection(s)_
- [`t_profile_has_null_rate`](tables/t_profile_has_null_rate.sql) — realizes `profile_has_null_rate` · _shared with 8 other collection(s)_
- [`t_profile_of_dataset`](tables/t_profile_of_dataset.sql) — realizes `profile_of_dataset` · _shared with 7 other collection(s)_
- [`t_profiling_basic`](tables/t_profiling_basic.sql) — realizes `profiling_basic` · _shared with 7 other collection(s)_
- [`t_schemaorg_org_taxid`](tables/t_schemaorg_org_taxid.sql) — realizes `schemaorg_org_taxid` · _shared with 2 other collection(s)_
- [`t_state_transitions_to`](tables/t_state_transitions_to.sql) — realizes `state_transitions_to` · _shared with 5 other collection(s)_
- [`t_technology_promotion_initiative`](tables/t_technology_promotion_initiative.sql) — realizes `technology_promotion_initiative` · _shared with 9 other collection(s)_
- [`t_trace_min_one_span`](tables/t_trace_min_one_span.sql) — realizes `trace_min_one_span` · _shared with 5 other collection(s)_
- [`t_young_adult_speaker_role`](tables/t_young_adult_speaker_role.sql) — realizes `young_adult_speaker_role` · _shared with 6 other collection(s)_
