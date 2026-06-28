# Collection — topic 180 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **1 topics** (target + style) · **20 ontology terms** · **20 underlying tables**.

> **Topic gist** (representative FinePDFs text): Philip H. Bucksbaum Faculty Annual Report 2019-20 section listing accomplishments (papers, talks, service activities) for 2019-2020 are on the next and following pages pp. FAR-1 to FAR-10 Curriculum Vita Education: 1975, A.B. magna cum laude in Physics, Harvard University. 1980, Ph.D. in Physics, University of California, Berkeley, CA. 1978, M.A. in Physics, University of California, Berkele... …

## Chapters

- [ch_live_attribute_set_min_one_9dcbfb](chapters/ch_live_attribute_set_min_one_9dcbfb.md)
- [ch_live_directive_traces_to_requirement_e83621](chapters/ch_live_directive_traces_to_requirement_e83621.md)
- [ch_live_disjunctive_combination_d35429](chapters/ch_live_disjunctive_combination_d35429.md)
- [ch_live_log_with_resource_attribute_1fca7e](chapters/ch_live_log_with_resource_attribute_1fca7e.md)
- [ch_live_lru_hash_map_subclass_07a19c](chapters/ch_live_lru_hash_map_subclass_07a19c.md)
- [ch_live_lru_hash_map_subclass_deced8](chapters/ch_live_lru_hash_map_subclass_deced8.md)
- [ch_live_requirement_applies_to_system_02a39c](chapters/ch_live_requirement_applies_to_system_02a39c.md)
- [ch_live_requirement_verified_by_b269cb](chapters/ch_live_requirement_verified_by_b269cb.md)
- [ch_live_ringbuf_map_subclass_51c78b](chapters/ch_live_ringbuf_map_subclass_51c78b.md)

## Ontology terms grounding this collection

- `allocation_completed_at` — {X} is a process that completed at {Y}
- `artifact_not_revoked` — {X} is not {Y}
- `attribute_set_min_one` — {X} is a descriptive information content entity
- `campus_event_participation` — A CampusEvent is an occurrent that has participant some ParticipantGroup.
- `directive_traces_to_requirement` — {X} is a directive information content entity that traces to directive information content entity
- `disjunctive_combination` — {X} is a descriptive information content entity that disjunctively combines {Y}
- `ice_with_existential` — {X} is an information content entity that {p} {Y}
- `log_with_resource_attribute` — {X} is an artifact that has resource attribute {Y}
- `log_within_span_context` — {X} is an artifact that within span context {Y}
- `lru_hash_map_subclass` — {X} is an artifact that has lruhash config {Y}
- `policy_basic` — {X} is a directive information content entity
- `policy_min_one_enforcer` — {X} is a directive information content entity
- `profiling_with_method` — {X} is a process that applies method {Y}
- `provenance_agent_subclass` — {X} is an artifact that has responsibility {Y}
- `requirement_applies_to_system` — {X} is a directive information content entity
- `requirement_verified_by` — {X} is a directive information content entity that verified by {Y}
- `responsive_optic_nerve_dysfunction` — ResponsiveOpticNerveDysfunction is equivalent to OpticNerveDysfunction and not LeberOpticAtrophy.
- `ringbuf_map_subclass` — {X} is an artifact that has ring buffer config {Y}
- `schemaorg_creativework_publisher` — {X} is an artifact that has publisher {Y}
- `schemaorg_product_price` — {X} is an artifact that has price {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_allocation_completed_at`](tables/t_allocation_completed_at.sql) — realizes `allocation_completed_at` · _shared with 8 other collection(s)_
- [`t_artifact_not_revoked`](tables/t_artifact_not_revoked.sql) — realizes `artifact_not_revoked` · _shared with 8 other collection(s)_
- [`t_attribute_set_min_one`](tables/t_attribute_set_min_one.sql) — realizes `attribute_set_min_one` · _shared with 7 other collection(s)_
- [`t_campus_event_participation`](tables/t_campus_event_participation.sql) — realizes `campus_event_participation` · _shared with 8 other collection(s)_
- [`t_directive_traces_to_requirement`](tables/t_directive_traces_to_requirement.sql) — realizes `directive_traces_to_requirement` · _shared with 10 other collection(s)_
- [`t_disjunctive_combination`](tables/t_disjunctive_combination.sql) — realizes `disjunctive_combination` · _shared with 11 other collection(s)_
- [`t_ice_with_existential`](tables/t_ice_with_existential.sql) — realizes `ice_with_existential` · _shared with 3 other collection(s)_
- [`t_log_with_resource_attribute`](tables/t_log_with_resource_attribute.sql) — realizes `log_with_resource_attribute` · _shared with 10 other collection(s)_
- [`t_log_within_span_context`](tables/t_log_within_span_context.sql) — realizes `log_within_span_context` · _shared with 9 other collection(s)_
- [`t_lru_hash_map_subclass`](tables/t_lru_hash_map_subclass.sql) — realizes `lru_hash_map_subclass` · _shared with 4 other collection(s)_
- [`t_policy_basic`](tables/t_policy_basic.sql) — realizes `policy_basic` · _shared with 6 other collection(s)_
- [`t_policy_min_one_enforcer`](tables/t_policy_min_one_enforcer.sql) — realizes `policy_min_one_enforcer` · _shared with 7 other collection(s)_
- [`t_profiling_with_method`](tables/t_profiling_with_method.sql) — realizes `profiling_with_method` · _shared with 9 other collection(s)_
- [`t_provenance_agent_subclass`](tables/t_provenance_agent_subclass.sql) — realizes `provenance_agent_subclass` · _shared with 4 other collection(s)_
- [`t_requirement_applies_to_system`](tables/t_requirement_applies_to_system.sql) — realizes `requirement_applies_to_system` · _shared with 8 other collection(s)_
- [`t_requirement_verified_by`](tables/t_requirement_verified_by.sql) — realizes `requirement_verified_by` · _shared with 7 other collection(s)_
- [`t_responsive_optic_nerve_dysfunction`](tables/t_responsive_optic_nerve_dysfunction.sql) — realizes `responsive_optic_nerve_dysfunction` · _shared with 10 other collection(s)_
- [`t_ringbuf_map_subclass`](tables/t_ringbuf_map_subclass.sql) — realizes `ringbuf_map_subclass` · _shared with 4 other collection(s)_
- [`t_schemaorg_creativework_publisher`](tables/t_schemaorg_creativework_publisher.sql) — realizes `schemaorg_creativework_publisher` · _shared with 7 other collection(s)_
- [`t_schemaorg_product_price`](tables/t_schemaorg_product_price.sql) — realizes `schemaorg_product_price` · _shared with 6 other collection(s)_
