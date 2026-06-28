# Collection — topic 161 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **1 topics** (target + style) · **29 ontology terms** · **29 underlying tables**.

> **Topic gist** (representative FinePDFs text): September 11, 2007 Mr. Scott Miller U.S. EPA Region 4 61 Forsyth Street, SW Atlanta, Georgia 30303 Work Order No. 05791.007.001.0001 Re: Submittal of Second Quarter 2007 Groundwater Sampling Results Former Cabot Carbon Site, Gainesville, Florida Dear Mr. Miller: Enclosed are two copies of the above referenced report for your files. If you have any questions, please call me at (770) ... …

## Chapters

- [ch_live_aggregation_basic_61e6a5](chapters/ch_live_aggregation_basic_61e6a5.md)
- [ch_live_allocation_succeeded_or_failed_de1d08](chapters/ch_live_allocation_succeeded_or_failed_de1d08.md)
- [ch_live_cardinality_exactly_one_generic_59d48a](chapters/ch_live_cardinality_exactly_one_generic_59d48a.md)
- [ch_live_descriptive_not_retracted_1f9759](chapters/ch_live_descriptive_not_retracted_1f9759.md)
- [ch_live_entity_match_link_5c2051](chapters/ch_live_entity_match_link_5c2051.md)
- [ch_live_measurement_max_one_value_9a8afb](chapters/ch_live_measurement_max_one_value_9a8afb.md)
- [ch_live_measurement_observed_at_ce3c1f](chapters/ch_live_measurement_observed_at_ce3c1f.md)
- [ch_live_measurement_produced_by_run_32f5c2](chapters/ch_live_measurement_produced_by_run_32f5c2.md)
- [ch_live_measurement_produced_by_run_c1e9b7](chapters/ch_live_measurement_produced_by_run_c1e9b7.md)
- [ch_live_metric_observed_by_event_d9a983](chapters/ch_live_metric_observed_by_event_d9a983.md)
- [ch_live_schemaorg_event_starttime_66107d](chapters/ch_live_schemaorg_event_starttime_66107d.md)
- [ch_live_soc2_privacy_subclass_748f9d](chapters/ch_live_soc2_privacy_subclass_748f9d.md)
- [ch_live_syscall_invoked_by_event_f6d887](chapters/ch_live_syscall_invoked_by_event_f6d887.md)

## Ontology terms grounding this collection

- `aggregation_aggregates_measurement` — {X} is a descriptive information content entity that aggregates {Y}
- `aggregation_basic` — {X} is a descriptive information content entity
- `aggregation_grouped_by` — {X} is a descriptive information content entity that grouped by designative information content entity
- `aggregation_over_time_window` — {X} is a descriptive information content entity that over time window {Y}
- `allocation_succeeded_or_failed` — {X} is equivalent to process and {Y} or {Z}
- `attribute_set_supports_outlier_claim` — {X} is a descriptive information content entity that supports {Y}
- `black_belt_certification_requirement` — A BlackBeltCertificationRequirement is a descriptive information entity that specifies a decimal dan certification level
- `cardinality_exactly_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} exactly 1 {Y:Class}
- `claim_basic` — {X} is a descriptive information content entity
- `dempster_combinant_first` — {X} is a descriptive information content entity that has first combinant {Y}
- `descriptive_not_retracted` — {X} is not {Y}
- `ebpfevent_at_kernel_hook_xref` — {X} is a process that at kernel hook artifact
- `ebpfmap_subclass` — {X} is an artifact that has map type {Y}
- `entity_match_link` — {X} is a descriptive information content entity that matches entity {Y}
- `measurement_max_one_value` — {X} is a descriptive information content entity
- `measurement_observed_at` — {X} is a descriptive information content entity that observed at {Y}
- `measurement_of_artifact` — {X} is a descriptive information content entity
- `measurement_produced_by_run` — {X} is a descriptive information content entity
- `metric_observed_by_event` — {X} is a descriptive information content entity
- `nist80053_moderate_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `policy_enforced_by` — {X} is a directive information content entity that enforced by {Y}
- `requirement_traces_to` — {X} is a directive information content entity that traces to {Y}
- `schema_revision_of` — {X} is an artifact that schema revision of {Y}
- `schemaorg_event_starttime` — {X} is an artifact that has event start time {Y}
- `soc2_privacy_subclass` — {X} is a directive information content entity that for soc2 domain {Y}
- `state_transitions_from` — {X} is a descriptive information content entity that transitions from {Y}
- `subclass_basic` — {X} is a {Y}
- `syscall_invoked_by_event` — {X} is a designative information content entity that invoked by event {Y}
- `uretprobe_subclass` — {X} is an artifact that attaches to return hook {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_aggregation_aggregates_measurement`](tables/t_aggregation_aggregates_measurement.sql) — realizes `aggregation_aggregates_measurement` · _shared with 6 other collection(s)_
- [`t_aggregation_basic`](tables/t_aggregation_basic.sql) — realizes `aggregation_basic` · _shared with 2 other collection(s)_
- [`t_aggregation_grouped_by`](tables/t_aggregation_grouped_by.sql) — realizes `aggregation_grouped_by` · _shared with 6 other collection(s)_
- [`t_aggregation_over_time_window`](tables/t_aggregation_over_time_window.sql) — realizes `aggregation_over_time_window` · _shared with 10 other collection(s)_
- [`t_allocation_succeeded_or_failed`](tables/t_allocation_succeeded_or_failed.sql) — realizes `allocation_succeeded_or_failed` · _shared with 7 other collection(s)_
- [`t_attribute_set_supports_outlier_claim`](tables/t_attribute_set_supports_outlier_claim.sql) — realizes `attribute_set_supports_outlier_claim` · _shared with 9 other collection(s)_
- [`t_black_belt_certification_requirement`](tables/t_black_belt_certification_requirement.sql) — realizes `black_belt_certification_requirement` · _shared with 7 other collection(s)_
- [`t_cardinality_exactly_one_generic`](tables/t_cardinality_exactly_one_generic.sql) — realizes `cardinality_exactly_one_generic` · _shared with 10 other collection(s)_
- [`t_claim_basic`](tables/t_claim_basic.sql) — realizes `claim_basic` · _shared with 15 other collection(s)_
- [`t_dempster_combinant_first`](tables/t_dempster_combinant_first.sql) — realizes `dempster_combinant_first` · _shared with 8 other collection(s)_
- [`t_descriptive_not_retracted`](tables/t_descriptive_not_retracted.sql) — realizes `descriptive_not_retracted` · _shared with 14 other collection(s)_
- [`t_ebpfevent_at_kernel_hook_xref`](tables/t_ebpfevent_at_kernel_hook_xref.sql) — realizes `ebpfevent_at_kernel_hook_xref` · _shared with 7 other collection(s)_
- [`t_ebpfmap_subclass`](tables/t_ebpfmap_subclass.sql) — realizes `ebpfmap_subclass` · _shared with 7 other collection(s)_
- [`t_entity_match_link`](tables/t_entity_match_link.sql) — realizes `entity_match_link` · _shared with 11 other collection(s)_
- [`t_measurement_max_one_value`](tables/t_measurement_max_one_value.sql) — realizes `measurement_max_one_value` · _shared with 4 other collection(s)_
- [`t_measurement_observed_at`](tables/t_measurement_observed_at.sql) — realizes `measurement_observed_at` · _shared with 7 other collection(s)_
- [`t_measurement_of_artifact`](tables/t_measurement_of_artifact.sql) — realizes `measurement_of_artifact` · _shared with 9 other collection(s)_
- [`t_measurement_produced_by_run`](tables/t_measurement_produced_by_run.sql) — realizes `measurement_produced_by_run` · _shared with 1 other collection(s)_
- [`t_metric_observed_by_event`](tables/t_metric_observed_by_event.sql) — realizes `metric_observed_by_event` · _shared with 7 other collection(s)_
- [`t_nist80053_moderate_impact`](tables/t_nist80053_moderate_impact.sql) — realizes `nist80053_moderate_impact` · _shared with 11 other collection(s)_
- [`t_policy_enforced_by`](tables/t_policy_enforced_by.sql) — realizes `policy_enforced_by` · _shared with 12 other collection(s)_
- [`t_requirement_traces_to`](tables/t_requirement_traces_to.sql) — realizes `requirement_traces_to` · _shared with 15 other collection(s)_
- [`t_schema_revision_of`](tables/t_schema_revision_of.sql) — realizes `schema_revision_of` · _shared with 9 other collection(s)_
- [`t_schemaorg_event_starttime`](tables/t_schemaorg_event_starttime.sql) — realizes `schemaorg_event_starttime` · _shared with 10 other collection(s)_
- [`t_soc2_privacy_subclass`](tables/t_soc2_privacy_subclass.sql) — realizes `soc2_privacy_subclass` · _shared with 7 other collection(s)_
- [`t_state_transitions_from`](tables/t_state_transitions_from.sql) — realizes `state_transitions_from` · _shared with 8 other collection(s)_
- [`t_subclass_basic`](tables/t_subclass_basic.sql) — realizes `subclass_basic` · _shared with 12 other collection(s)_
- [`t_syscall_invoked_by_event`](tables/t_syscall_invoked_by_event.sql) — realizes `syscall_invoked_by_event` · _shared with 7 other collection(s)_
- [`t_uretprobe_subclass`](tables/t_uretprobe_subclass.sql) — realizes `uretprobe_subclass` · _shared with 5 other collection(s)_
