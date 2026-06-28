# Collection — topic 138 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **7 topics** (target + style) · **21 ontology terms** · **21 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 138: topic 34, topic 44, topic 49, topic 183, topic 184, topic 188.

> **Topic gist** (representative FinePDFs text): Lingnan College Hong Kong: calendar 1995-1996 Follow this and additional works at: https://commons.ln.edu.hk/lingnan_calendar Part of the Education Commons Recommended Citation Lingnan College (1995). Lingnan College Hong Kong: calendar 1995-1996. Hong Kong: Lingnan College. This Book is brought to you for free and open access by the Lingnan University (Hong Kong): Publications at Digital Comm... …

## Chapters

- [ch_live_descriptive_not_retracted_31c393](chapters/ch_live_descriptive_not_retracted_31c393.md)
- [ch_live_designative_for_specific_role_b21c30](chapters/ch_live_designative_for_specific_role_b21c30.md)
- [ch_live_designative_for_specific_role_ce0609](chapters/ch_live_designative_for_specific_role_ce0609.md)
- [ch_live_directive_only_governs_artifact_868284](chapters/ch_live_directive_only_governs_artifact_868284.md)
- [ch_live_gdpr_data_subject_right_f1792e](chapters/ch_live_gdpr_data_subject_right_f1792e.md)
- [ch_live_measurement_observed_at_ac8844](chapters/ch_live_measurement_observed_at_ac8844.md)
- [ch_live_syscall_at_security_tier_7b848e](chapters/ch_live_syscall_at_security_tier_7b848e.md)
- [ch_live_syscall_traceable_22a4cf](chapters/ch_live_syscall_traceable_22a4cf.md)
- [ch_live_transformation_basic_09cb6d](chapters/ch_live_transformation_basic_09cb6d.md)

## Ontology terms grounding this collection

- `artifact_with_role` — {X} is an artifact that has role {Y}
- `cardinality_max_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} max 1 {Y:Class}
- `claim_min_one_evidence` — {X} is a descriptive information content entity
- `dataset_snapshot_subclass` — {X} is an artifact that snapshot of {Y}
- `descriptive_not_retracted` — {X} is not {Y}
- `descriptive_only_about_artifact` — {X} is a descriptive information content entity that is about {Y}
- `designative_for_specific_role` — Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:identifies some {Y:Class})
- `directive_only_governs_artifact` — {X} is a directive information content entity that governs {Y}
- `equiv_intersect_basic` — {X} is equivalent to {Y} and {Z}
- `equiv_intersect_with_restriction` — {X} is equivalent to {Y} that {p} {Z}
- `gdpr_data_subject_right` — {X} is a directive information content entity that grants data subject right {Y}
- `ice_about_artifact` — {X} is an information content entity that is about artifact
- `measurement_observed_at` — {X} is a descriptive information content entity that observed at {Y}
- `nist80053_control_subclass` — {X} is a directive information content entity that nist80053 control {Y}
- `pignistic_transformation` — {X} is a descriptive information content entity that has pignistic transform {Y}
- `span_within_trace` — {X} is a process that part of {Y}
- `state_observed_at_time` — {X} is a descriptive information content entity that observed at {Y}
- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_traceable` — {X} is a designative information content entity that traceable by {Y}
- `trace_with_service_name` — {X} is an artifact that has service name {Y}
- `transformation_basic` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_artifact_with_role`](tables/t_artifact_with_role.sql) — realizes `artifact_with_role` · _shared with 8 other collection(s)_
- [`t_cardinality_max_one_generic`](tables/t_cardinality_max_one_generic.sql) — realizes `cardinality_max_one_generic` · _shared with 9 other collection(s)_
- [`t_claim_min_one_evidence`](tables/t_claim_min_one_evidence.sql) — realizes `claim_min_one_evidence` · _shared with 5 other collection(s)_
- [`t_dataset_snapshot_subclass`](tables/t_dataset_snapshot_subclass.sql) — realizes `dataset_snapshot_subclass` · _shared with 10 other collection(s)_
- [`t_descriptive_not_retracted`](tables/t_descriptive_not_retracted.sql) — realizes `descriptive_not_retracted` · _shared with 14 other collection(s)_
- [`t_descriptive_only_about_artifact`](tables/t_descriptive_only_about_artifact.sql) — realizes `descriptive_only_about_artifact` · _shared with 7 other collection(s)_
- [`t_designative_for_specific_role`](tables/t_designative_for_specific_role.sql) — realizes `designative_for_specific_role` · _shared with 4 other collection(s)_
- [`t_directive_only_governs_artifact`](tables/t_directive_only_governs_artifact.sql) — realizes `directive_only_governs_artifact` · _shared with 8 other collection(s)_
- [`t_equiv_intersect_basic`](tables/t_equiv_intersect_basic.sql) — realizes `equiv_intersect_basic` · _shared with 3 other collection(s)_
- [`t_equiv_intersect_with_restriction`](tables/t_equiv_intersect_with_restriction.sql) — realizes `equiv_intersect_with_restriction` · _shared with 6 other collection(s)_
- [`t_gdpr_data_subject_right`](tables/t_gdpr_data_subject_right.sql) — realizes `gdpr_data_subject_right` · _shared with 7 other collection(s)_
- [`t_ice_about_artifact`](tables/t_ice_about_artifact.sql) — realizes `ice_about_artifact` · _shared with 4 other collection(s)_
- [`t_measurement_observed_at`](tables/t_measurement_observed_at.sql) — realizes `measurement_observed_at` · _shared with 7 other collection(s)_
- [`t_nist80053_control_subclass`](tables/t_nist80053_control_subclass.sql) — realizes `nist80053_control_subclass` · _shared with 5 other collection(s)_
- [`t_pignistic_transformation`](tables/t_pignistic_transformation.sql) — realizes `pignistic_transformation` · _shared with 4 other collection(s)_
- [`t_span_within_trace`](tables/t_span_within_trace.sql) — realizes `span_within_trace` · _shared with 7 other collection(s)_
- [`t_state_observed_at_time`](tables/t_state_observed_at_time.sql) — realizes `state_observed_at_time` · _shared with 9 other collection(s)_
- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier` · _shared with 6 other collection(s)_
- [`t_syscall_traceable`](tables/t_syscall_traceable.sql) — realizes `syscall_traceable` · _shared with 4 other collection(s)_
- [`t_trace_with_service_name`](tables/t_trace_with_service_name.sql) — realizes `trace_with_service_name` · _shared with 7 other collection(s)_
- [`t_transformation_basic`](tables/t_transformation_basic.sql) — realizes `transformation_basic` · _shared with 5 other collection(s)_
