# Collection — topic 66 · 05_provo_lineage

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **2 topics** (target + style) · **19 ontology terms** · **19 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 66: topic 82.

> **Topic gist** (representative FinePDFs text): EDITORIAL Open Access Rohan Fernando: a road from Sri Lanka to Ames Daniel Gianola 1* , Rodolfo J. Cantet 2 , Jack C. M. Dekkers 3 and Miguel Pérez‑Enciso 4 About one year ago, some of us learned that Rohan Fernando had announced his intention to retire from his position as Professor of Animal Science at Iowa State University. We felt that it would be appropriate to prepare a volume honoring h... …

## Chapters

- [ch_live_agent_software_or_human_ddc78f](chapters/ch_live_agent_software_or_human_ddc78f.md)
- [ch_live_allocation_at_run_id_b8e817](chapters/ch_live_allocation_at_run_id_b8e817.md)
- [ch_live_belief_interval_subclass_47d847](chapters/ch_live_belief_interval_subclass_47d847.md)
- [ch_live_dengue_transmission_process_b26c0a](chapters/ch_live_dengue_transmission_process_b26c0a.md)
- [ch_live_evidence_subclass_9d345e](chapters/ch_live_evidence_subclass_9d345e.md)
- [ch_live_policy_only_governs_artifacts_b72541](chapters/ch_live_policy_only_governs_artifacts_b72541.md)
- [ch_live_provenance_agent_subclass_e2e496](chapters/ch_live_provenance_agent_subclass_e2e496.md)
- [ch_live_span_with_attribute_225def](chapters/ch_live_span_with_attribute_225def.md)
- [ch_live_syscall_subclass_7d39c8](chapters/ch_live_syscall_subclass_7d39c8.md)

## Ontology terms grounding this collection

- `agent_software_or_human` — {X} is equivalent to artifact and {Y} or {Z}
- `agent_with_role` — {X} is an artifact that has agent role {Y}
- `aggregation_aggregates_measurement` — {X} is a descriptive information content entity that aggregates {Y}
- `allocation_associated_with_agent` — {X} is a process that was associated with {Y}
- `allocation_at_run_id` — {X} is a process that at run identifier {Y}
- `annotation_classifies_class` — {X} is a descriptive information content entity that classifies {Y}
- `belief_interval_subclass` — {X} is a descriptive information content entity that has belief lower bound {Y}
- `column_renamed_from` — {X} is a descriptive information content entity that renamed from {Y}
- `dengue_transmission_process` — A DengueTransmissionProcess is a BFO process that involves a HumanPopulation via sdg:involvesHost and an AedesAegyptiVec
- `entity_match_link` — {X} is a descriptive information content entity that matches entity {Y}
- `equiv_intersect_with_two_restrictions` — {X} is equivalent to {Y} that {p} {Z} and {q} {W}
- `evidence_subclass` — {X} is a descriptive information content entity that supports claim {Y}
- `policy_only_governs_artifacts` — {X} is a directive information content entity
- `profiling_produces_profile` — {X} is a process that produces {Y}
- `provenance_agent_subclass` — {X} is an artifact that has responsibility {Y}
- `schemaorg_place_longitude` — {X} is an artifact that has longitude {Y}
- `span_with_attribute` — {X} is a process that has span attribute {Y}
- `summary_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `syscall_subclass` — {X} is a designative information content entity that in syscall subsystem {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_agent_software_or_human`](tables/t_agent_software_or_human.sql) — realizes `agent_software_or_human` · _shared with 1 other collection(s)_
- [`t_agent_with_role`](tables/t_agent_with_role.sql) — realizes `agent_with_role` · _shared with 7 other collection(s)_
- [`t_aggregation_aggregates_measurement`](tables/t_aggregation_aggregates_measurement.sql) — realizes `aggregation_aggregates_measurement` · _shared with 6 other collection(s)_
- [`t_allocation_associated_with_agent`](tables/t_allocation_associated_with_agent.sql) — realizes `allocation_associated_with_agent` · _shared with 7 other collection(s)_
- [`t_allocation_at_run_id`](tables/t_allocation_at_run_id.sql) — realizes `allocation_at_run_id` · _shared with 6 other collection(s)_
- [`t_annotation_classifies_class`](tables/t_annotation_classifies_class.sql) — realizes `annotation_classifies_class` · _shared with 7 other collection(s)_
- [`t_belief_interval_subclass`](tables/t_belief_interval_subclass.sql) — realizes `belief_interval_subclass` · _shared with 10 other collection(s)_
- [`t_column_renamed_from`](tables/t_column_renamed_from.sql) — realizes `column_renamed_from` · _shared with 6 other collection(s)_
- [`t_dengue_transmission_process`](tables/t_dengue_transmission_process.sql) — realizes `dengue_transmission_process` · _shared with 9 other collection(s)_
- [`t_entity_match_link`](tables/t_entity_match_link.sql) — realizes `entity_match_link` · _shared with 11 other collection(s)_
- [`t_equiv_intersect_with_two_restrictions`](tables/t_equiv_intersect_with_two_restrictions.sql) — realizes `equiv_intersect_with_two_restrictions` · _shared with 12 other collection(s)_
- [`t_evidence_subclass`](tables/t_evidence_subclass.sql) — realizes `evidence_subclass` · _shared with 4 other collection(s)_
- [`t_policy_only_governs_artifacts`](tables/t_policy_only_governs_artifacts.sql) — realizes `policy_only_governs_artifacts` · _shared with 12 other collection(s)_
- [`t_profiling_produces_profile`](tables/t_profiling_produces_profile.sql) — realizes `profiling_produces_profile` · _shared with 8 other collection(s)_
- [`t_provenance_agent_subclass`](tables/t_provenance_agent_subclass.sql) — realizes `provenance_agent_subclass` · _shared with 4 other collection(s)_
- [`t_schemaorg_place_longitude`](tables/t_schemaorg_place_longitude.sql) — realizes `schemaorg_place_longitude` · _shared with 8 other collection(s)_
- [`t_span_with_attribute`](tables/t_span_with_attribute.sql) — realizes `span_with_attribute` · _shared with 8 other collection(s)_
- [`t_summary_metric_subclass`](tables/t_summary_metric_subclass.sql) — realizes `summary_metric_subclass` · _shared with 5 other collection(s)_
- [`t_syscall_subclass`](tables/t_syscall_subclass.sql) — realizes `syscall_subclass` · _shared with 11 other collection(s)_
