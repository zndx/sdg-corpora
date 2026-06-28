# Collection — topic 123 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **9 topics** (target + style) · **19 ontology terms** · **19 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 123: topic 2, topic 19, topic 24, topic 125, topic 141, topic 169, topic 181, topic 191.

> **Topic gist** (representative FinePDFs text): Characterization of PM2.5 Episodes in the San Joaquin Valley Based on Data Collected During the NASA DISCOVER-AQ Study in the Winter of 2013 REPORT TO THE California Air Resources Board Research Division Project # 14-307 Prepared by: Dr. Christopher D. Cappa\textsuperscript{1} Dr. Qi Zhang\textsuperscript{2} \textsuperscript{1}Department of Civil and Environmental Engineering \textsuperscript... …

## Chapters

- [ch_live_attestation_basic_ca5418](chapters/ch_live_attestation_basic_ca5418.md)
- [ch_live_attestation_signed_by_1ae40b](chapters/ch_live_attestation_signed_by_1ae40b.md)
- [ch_live_constraint_evaluated_during_2e7b83](chapters/ch_live_constraint_evaluated_during_2e7b83.md)
- [ch_live_ebpf_event_observed_pid_35ad9d](chapters/ch_live_ebpf_event_observed_pid_35ad9d.md)
- [ch_live_measurement_basic_834502](chapters/ch_live_measurement_basic_834502.md)
- [ch_live_observation_governed_by_policy_67e415](chapters/ch_live_observation_governed_by_policy_67e415.md)
- [ch_live_observation_governed_by_policy_6b4cb8](chapters/ch_live_observation_governed_by_policy_6b4cb8.md)
- [ch_live_schemaorg_person_roleat_a91e7e](chapters/ch_live_schemaorg_person_roleat_a91e7e.md)
- [ch_live_subclass_to_process_61538f](chapters/ch_live_subclass_to_process_61538f.md)

## Ontology terms grounding this collection

- `aggregation_grouped_by` — {X} is a descriptive information content entity that grouped by designative information content entity
- `attestation_basic` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `campus_event_participation` — A CampusEvent is an occurrent that has participant some ParticipantGroup.
- `constraint_evaluated_during` — {X} is a directive information content entity that evaluated during {Y}
- `dataset_snapshot_subclass` — {X} is an artifact that snapshot of {Y}
- `ebpf_event_observed_pid` — {X} is a process that observes pid {Y}
- `gauge_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `histogram_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `indoor_air_quality_action_plan` — An IndoorAirQualityActionPlan is a DirectiveICE that targets IndoorAirPollution and is verified by a HealthOutcomeMetric
- `measurement_basic` — {X} is a descriptive information content entity
- `nist80053_high_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `observation_governed_by_policy` — {X} is a process that governed by directive information content entity
- `observation_precedes_other` — {X} is a process that precedes {Y}
- `observation_records_state` — {X} is a process that records {Y}
- `schemaorg_person_roleat` — {X} is an artifact that has role at {Y}
- `schemaorg_product_sku` — {X} is an artifact that has sku {Y}
- `subclass_not_basic` — {X} is not {Y}
- `subclass_to_process` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_aggregation_grouped_by`](tables/t_aggregation_grouped_by.sql) — realizes `aggregation_grouped_by` · _shared with 6 other collection(s)_
- [`t_attestation_basic`](tables/t_attestation_basic.sql) — realizes `attestation_basic` · _shared with 8 other collection(s)_
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 5 other collection(s)_
- [`t_campus_event_participation`](tables/t_campus_event_participation.sql) — realizes `campus_event_participation` · _shared with 8 other collection(s)_
- [`t_constraint_evaluated_during`](tables/t_constraint_evaluated_during.sql) — realizes `constraint_evaluated_during` · _shared with 1 other collection(s)_
- [`t_dataset_snapshot_subclass`](tables/t_dataset_snapshot_subclass.sql) — realizes `dataset_snapshot_subclass` · _shared with 10 other collection(s)_
- [`t_ebpf_event_observed_pid`](tables/t_ebpf_event_observed_pid.sql) — realizes `ebpf_event_observed_pid` · _shared with 9 other collection(s)_
- [`t_gauge_metric_subclass`](tables/t_gauge_metric_subclass.sql) — realizes `gauge_metric_subclass` · _shared with 9 other collection(s)_
- [`t_histogram_metric_subclass`](tables/t_histogram_metric_subclass.sql) — realizes `histogram_metric_subclass` · _shared with 9 other collection(s)_
- [`t_indoor_air_quality_action_plan`](tables/t_indoor_air_quality_action_plan.sql) — realizes `indoor_air_quality_action_plan` · _shared with 6 other collection(s)_
- [`t_measurement_basic`](tables/t_measurement_basic.sql) — realizes `measurement_basic` · _shared with 7 other collection(s)_
- [`t_nist80053_high_impact`](tables/t_nist80053_high_impact.sql) — realizes `nist80053_high_impact` · _shared with 8 other collection(s)_
- [`t_observation_governed_by_policy`](tables/t_observation_governed_by_policy.sql) — realizes `observation_governed_by_policy` · _shared with 2 other collection(s)_
- [`t_observation_precedes_other`](tables/t_observation_precedes_other.sql) — realizes `observation_precedes_other` · _shared with 8 other collection(s)_
- [`t_observation_records_state`](tables/t_observation_records_state.sql) — realizes `observation_records_state` · _shared with 14 other collection(s)_
- [`t_schemaorg_person_roleat`](tables/t_schemaorg_person_roleat.sql) — realizes `schemaorg_person_roleat` · _shared with 7 other collection(s)_
- [`t_schemaorg_product_sku`](tables/t_schemaorg_product_sku.sql) — realizes `schemaorg_product_sku` · _shared with 6 other collection(s)_
- [`t_subclass_not_basic`](tables/t_subclass_not_basic.sql) — realizes `subclass_not_basic` · _shared with 11 other collection(s)_
- [`t_subclass_to_process`](tables/t_subclass_to_process.sql) — realizes `subclass_to_process` · _shared with 13 other collection(s)_
