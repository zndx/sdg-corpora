# Collection — topic 102 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **1 topics** (target + style) · **19 ontology terms** · **19 underlying tables**.

> **Topic gist** (representative FinePDFs text): UvA-DARE (Digital Academic Repository) Psychotropic medications and the developing brain Solleveld, M.M. Publication date 2018 Document Version Other version License Other Link to publication Citation for published version (APA): Solleveld, M. M. (2018). Psychotropic medications and the developing brain. [Thesis, fully internal, Universiteit van Amsterdam]. General rights It is not permitt... …

## Chapters

- [ch_live_ebpf_event_at_hook_ec6dcb](chapters/ch_live_ebpf_event_at_hook_ec6dcb.md)
- [ch_live_lineage_edge_at_run_time_54bffb](chapters/ch_live_lineage_edge_at_run_time_54bffb.md)
- [ch_live_outlier_claim_subclass_067342](chapters/ch_live_outlier_claim_subclass_067342.md)
- [ch_live_outlier_claim_subclass_bfb29a](chapters/ch_live_outlier_claim_subclass_bfb29a.md)
- [ch_live_outlier_claim_subclass_c05cd4](chapters/ch_live_outlier_claim_subclass_c05cd4.md)
- [ch_live_outlier_claim_subclass_fab1cf](chapters/ch_live_outlier_claim_subclass_fab1cf.md)
- [ch_live_responsive_optic_nerve_dysfunction_a6752c](chapters/ch_live_responsive_optic_nerve_dysfunction_a6752c.md)
- [ch_live_subclass_to_process_d6a474](chapters/ch_live_subclass_to_process_d6a474.md)
- [ch_live_trace_with_root_span_79c758](chapters/ch_live_trace_with_root_span_79c758.md)

## Ontology terms grounding this collection

- `aggregation_over_time_window` — {X} is a descriptive information content entity that over time window {Y}
- `annotation_classifies_class` — {X} is a descriptive information content entity that classifies {Y}
- `belief_interval_equiv_bel_and_pl` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasBeliefLowerBound some {Y:Class}) and (sdg:hasPlausibilityU
- `census_reporting_event` — A CensusReportingEvent is an InformationContentEntity that occurs during a CensusPeriod, tracks a SocialEnterpriseSector
- `ebpf_event_at_hook` — {X} is a process that at hook {Y}
- `ebpfmap_subclass` — {X} is an artifact that has map type {Y}
- `equiv_union_basic` — {X} is equivalent to {Y} or {Z}
- `frame_coarsening` — {X} is a descriptive information content entity that coarsens frame {Y}
- `ice_about_artifact` — {X} is an information content entity that is about artifact
- `kernel_event_with_comm` — {X} is a process that with process comm {Y}
- `lineage_edge_at_run_time` — {X} is a descriptive information content entity that at run time {Y}
- `nist80053_high_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `outlier_claim_subclass` — {X} is a descriptive information content entity that explains anomaly in {Y}
- `responsive_optic_nerve_dysfunction` — ResponsiveOpticNerveDysfunction is equivalent to OpticNerveDysfunction and not LeberOpticAtrophy.
- `schemaorg_creativework_publisher` — {X} is an artifact that has publisher {Y}
- `subclass_to_process` — {X} is a process
- `tc_classifier_subclass` — {X} is an artifact that has tcdirection {Y}
- `trace_with_root_span` — {X} is an artifact that has root span {Y}
- `trace_with_service_name` — {X} is an artifact that has service name {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_aggregation_over_time_window`](tables/t_aggregation_over_time_window.sql) — realizes `aggregation_over_time_window` · _shared with 10 other collection(s)_
- [`t_annotation_classifies_class`](tables/t_annotation_classifies_class.sql) — realizes `annotation_classifies_class` · _shared with 7 other collection(s)_
- [`t_belief_interval_equiv_bel_and_pl`](tables/t_belief_interval_equiv_bel_and_pl.sql) — realizes `belief_interval_equiv_bel_and_pl` · _shared with 13 other collection(s)_
- [`t_census_reporting_event`](tables/t_census_reporting_event.sql) — realizes `census_reporting_event` · _shared with 11 other collection(s)_
- [`t_ebpf_event_at_hook`](tables/t_ebpf_event_at_hook.sql) — realizes `ebpf_event_at_hook` · _shared with 3 other collection(s)_
- [`t_ebpfmap_subclass`](tables/t_ebpfmap_subclass.sql) — realizes `ebpfmap_subclass` · _shared with 7 other collection(s)_
- [`t_equiv_union_basic`](tables/t_equiv_union_basic.sql) — realizes `equiv_union_basic` · _shared with 9 other collection(s)_
- [`t_frame_coarsening`](tables/t_frame_coarsening.sql) — realizes `frame_coarsening` · _shared with 5 other collection(s)_
- [`t_ice_about_artifact`](tables/t_ice_about_artifact.sql) — realizes `ice_about_artifact` · _shared with 4 other collection(s)_
- [`t_kernel_event_with_comm`](tables/t_kernel_event_with_comm.sql) — realizes `kernel_event_with_comm` · _shared with 6 other collection(s)_
- [`t_lineage_edge_at_run_time`](tables/t_lineage_edge_at_run_time.sql) — realizes `lineage_edge_at_run_time` · _shared with 5 other collection(s)_
- [`t_nist80053_high_impact`](tables/t_nist80053_high_impact.sql) — realizes `nist80053_high_impact` · _shared with 8 other collection(s)_
- [`t_outlier_claim_subclass`](tables/t_outlier_claim_subclass.sql) — realizes `outlier_claim_subclass` · _shared with 4 other collection(s)_
- [`t_responsive_optic_nerve_dysfunction`](tables/t_responsive_optic_nerve_dysfunction.sql) — realizes `responsive_optic_nerve_dysfunction` · _shared with 10 other collection(s)_
- [`t_schemaorg_creativework_publisher`](tables/t_schemaorg_creativework_publisher.sql) — realizes `schemaorg_creativework_publisher` · _shared with 7 other collection(s)_
- [`t_subclass_to_process`](tables/t_subclass_to_process.sql) — realizes `subclass_to_process` · _shared with 13 other collection(s)_
- [`t_tc_classifier_subclass`](tables/t_tc_classifier_subclass.sql) — realizes `tc_classifier_subclass` · _shared with 12 other collection(s)_
- [`t_trace_with_root_span`](tables/t_trace_with_root_span.sql) — realizes `trace_with_root_span` · _shared with 10 other collection(s)_
- [`t_trace_with_service_name`](tables/t_trace_with_service_name.sql) — realizes `trace_with_service_name` · _shared with 7 other collection(s)_
