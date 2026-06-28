# Collection — topic 143 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **7 chapters** · **1 topics** (target + style) · **16 ontology terms** · **16 underlying tables**.

> **Topic gist** (representative FinePDFs text): CTGA Database Information Submission Form Help Topics Everyday the Centre for Arab Genomic Studies receives a variety of publications from scientists in the Arab World or abroad to be considered for the CTGA Database on genetic disorders in Arab populations. Curators of the CTGA Database are working continuously to update each and every record of the database following rigorous steps that includ.. …

## Chapters

- [ch_live_cardinality_max_one_generic_ca5b6d](chapters/ch_live_cardinality_max_one_generic_ca5b6d.md)
- [ch_live_constraint_with_severity_classification_254cb2](chapters/ch_live_constraint_with_severity_classification_254cb2.md)
- [ch_live_ebpfprogram_equiv_typed_with_hook_06ddea](chapters/ch_live_ebpfprogram_equiv_typed_with_hook_06ddea.md)
- [ch_live_measurement_subclass_only_one_unit_179d31](chapters/ch_live_measurement_subclass_only_one_unit_179d31.md)
- [ch_live_observation_precedes_other_dc5904](chapters/ch_live_observation_precedes_other_dc5904.md)
- [ch_live_transformation_ends_at_63aaba](chapters/ch_live_transformation_ends_at_63aaba.md)
- [ch_live_xdp_action_drop_38b3b6](chapters/ch_live_xdp_action_drop_38b3b6.md)

## Ontology terms grounding this collection

- `belief_interval_equiv_bel_and_pl` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasBeliefLowerBound some {Y:Class}) and (sdg:hasPlausibilityU
- `belief_interval_for_claim` — {X} is a descriptive information content entity that for claim {Y}
- `cardinality_max_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} max 1 {Y:Class}
- `cardinality_max_three_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} max 3 {Y:Class}
- `cardinality_min_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} min 1 {Y:Class}
- `constraint_with_severity_classification` — {X} is a directive information content entity that has severity {Y}
- `ebpfprogram_equiv_typed_with_hook` — Class: {X:Class} EquivalentTo: cco:Artifact and (sdg:hasProgramType some {Y:Class}) and (sdg:attachesToHook some {Z:Clas
- `mass_function_assigns_to_subset` — {X} is a descriptive information content entity that assigns mass to {Y}
- `measurement_subclass_only_one_unit` — {X} is a descriptive information content entity that has unit {Y}
- `observation_precedes_other` — {X} is a process that precedes {Y}
- `rollback_relation` — {X} is a descriptive information content entity that rolls back to {Y}
- `schemaorg_creativework_publisher` — {X} is an artifact that has publisher {Y}
- `schemaorg_place_longitude` — {X} is an artifact that has longitude {Y}
- `trace_with_attributes` — {X} is a process that has attribute designative information content entity
- `transformation_ends_at` — {X} is a process that ended at time {Y}
- `xdp_action_drop` — {X} is an artifact that has xdpaction {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_belief_interval_equiv_bel_and_pl`](tables/t_belief_interval_equiv_bel_and_pl.sql) — realizes `belief_interval_equiv_bel_and_pl` · _shared with 13 other collection(s)_
- [`t_belief_interval_for_claim`](tables/t_belief_interval_for_claim.sql) — realizes `belief_interval_for_claim` · _shared with 6 other collection(s)_
- [`t_cardinality_max_one_generic`](tables/t_cardinality_max_one_generic.sql) — realizes `cardinality_max_one_generic` · _shared with 9 other collection(s)_
- [`t_cardinality_max_three_generic`](tables/t_cardinality_max_three_generic.sql) — realizes `cardinality_max_three_generic` · _shared with 9 other collection(s)_
- [`t_cardinality_min_one_generic`](tables/t_cardinality_min_one_generic.sql) — realizes `cardinality_min_one_generic` · _shared with 6 other collection(s)_
- [`t_constraint_with_severity_classification`](tables/t_constraint_with_severity_classification.sql) — realizes `constraint_with_severity_classification` · _shared with 5 other collection(s)_
- [`t_ebpfprogram_equiv_typed_with_hook`](tables/t_ebpfprogram_equiv_typed_with_hook.sql) — realizes `ebpfprogram_equiv_typed_with_hook` · _shared with 6 other collection(s)_
- [`t_mass_function_assigns_to_subset`](tables/t_mass_function_assigns_to_subset.sql) — realizes `mass_function_assigns_to_subset` · _shared with 4 other collection(s)_
- [`t_measurement_subclass_only_one_unit`](tables/t_measurement_subclass_only_one_unit.sql) — realizes `measurement_subclass_only_one_unit` · _shared with 7 other collection(s)_
- [`t_observation_precedes_other`](tables/t_observation_precedes_other.sql) — realizes `observation_precedes_other` · _shared with 8 other collection(s)_
- [`t_rollback_relation`](tables/t_rollback_relation.sql) — realizes `rollback_relation` · _shared with 6 other collection(s)_
- [`t_schemaorg_creativework_publisher`](tables/t_schemaorg_creativework_publisher.sql) — realizes `schemaorg_creativework_publisher` · _shared with 7 other collection(s)_
- [`t_schemaorg_place_longitude`](tables/t_schemaorg_place_longitude.sql) — realizes `schemaorg_place_longitude` · _shared with 8 other collection(s)_
- [`t_trace_with_attributes`](tables/t_trace_with_attributes.sql) — realizes `trace_with_attributes` · _shared with 10 other collection(s)_
- [`t_transformation_ends_at`](tables/t_transformation_ends_at.sql) — realizes `transformation_ends_at` · _shared with 6 other collection(s)_
- [`t_xdp_action_drop`](tables/t_xdp_action_drop.sql) — realizes `xdp_action_drop` · _shared with 9 other collection(s)_
