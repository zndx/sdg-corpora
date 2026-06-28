# Collection — topic 3 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **7 topics** (target + style) · **19 ontology terms** · **19 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 3: topic 35, topic 46, topic 67, topic 71, topic 90, topic 91.

> **Topic gist** (representative FinePDFs text): Molecular Docking Compounds of Cinnamaldehyde Derivatives as Anticancer Agents Warsito Warsito\textsuperscript{1*}, Shinta Murlistyarini\textsuperscript{2}, Suratmo Suratmo\textsuperscript{1}, Vina O Azzahra\textsuperscript{1}, Andrian Sucahyo\textsuperscript{1} Abstract **Objective:** Cinnamaldehyde (CM) has a molecular structure with the main reaction center of an aromatic ring which the bioa... …

## Chapters

- [ch_live_aggregation_aggregates_measurement_b1ff9e](chapters/ch_live_aggregation_aggregates_measurement_b1ff9e.md)
- [ch_live_chemical_exposure_risk_profile_e5429b](chapters/ch_live_chemical_exposure_risk_profile_e5429b.md)
- [ch_live_dataset_with_record_count_8275fa](chapters/ch_live_dataset_with_record_count_8275fa.md)
- [ch_live_dataset_with_record_count_dd8334](chapters/ch_live_dataset_with_record_count_dd8334.md)
- [ch_live_dataset_with_record_count_eb1c76](chapters/ch_live_dataset_with_record_count_eb1c76.md)
- [ch_live_directive_only_governs_artifact_2c74b1](chapters/ch_live_directive_only_governs_artifact_2c74b1.md)
- [ch_live_entity_match_link_089e2a](chapters/ch_live_entity_match_link_089e2a.md)
- [ch_live_profile_of_column_7c3543](chapters/ch_live_profile_of_column_7c3543.md)
- [ch_live_regional_quality_benchmark_159985](chapters/ch_live_regional_quality_benchmark_159985.md)

## Ontology terms grounding this collection

- `agent_identified_by_uri` — {X} is an artifact that identified by uri {Y}
- `aggregation_aggregates_measurement` — {X} is a descriptive information content entity that aggregates {Y}
- `audit_basic` — {X} is a process
- `chemical_exposure_risk_profile` — ChemicalExposureRiskProfile is an information content entity that assesses exposure to a ToxicIndustrialChemical, estima
- `classification_basic` — {X} is a process
- `conjunctive_combination` — {X} is a descriptive information content entity that conjunctively combines {Y}
- `constraint_check_subclass` — {X} is a directive information content entity that checks {Y}
- `dataset_with_record_count` — {X} is an artifact
- `dbpedia_label_alignment` — {X} is a descriptive information content entity that aligned to dbpedia label {Y}
- `dempster_combinant_first` — {X} is a descriptive information content entity that has first combinant {Y}
- `directive_only_governs_artifact` — {X} is a directive information content entity that governs {Y}
- `entity_match_link` — {X} is a descriptive information content entity that matches entity {Y}
- `equiv_union_basic` — {X} is equivalent to {Y} or {Z}
- `kernelhook_with_hook_kind` — {X} is an artifact that has hook kind {Y}
- `policy_supersedes` — {X} is a directive information content entity that supersedes {Y}
- `process_either_started_or_completed` — {X} is equivalent to process and {Y} or {Z}
- `profile_of_column` — {X} is a descriptive information content entity that is about {Y}
- `regional_quality_benchmark` — A RegionalQualityBenchmark is a DescriptiveICE that has a minimum threshold and a maximum threshold.
- `storage_structure_composition` — A StorageStructureComposition is a Material Entity that comprises exactly one DatabaseContainer.

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_agent_identified_by_uri`](tables/t_agent_identified_by_uri.sql) — realizes `agent_identified_by_uri` · _shared with 5 other collection(s)_
- [`t_aggregation_aggregates_measurement`](tables/t_aggregation_aggregates_measurement.sql) — realizes `aggregation_aggregates_measurement` · _shared with 6 other collection(s)_
- [`t_audit_basic`](tables/t_audit_basic.sql) — realizes `audit_basic` · _shared with 8 other collection(s)_
- [`t_chemical_exposure_risk_profile`](tables/t_chemical_exposure_risk_profile.sql) — realizes `chemical_exposure_risk_profile` · _shared with 3 other collection(s)_
- [`t_classification_basic`](tables/t_classification_basic.sql) — realizes `classification_basic` · _shared with 4 other collection(s)_
- [`t_conjunctive_combination`](tables/t_conjunctive_combination.sql) — realizes `conjunctive_combination` · _shared with 10 other collection(s)_
- [`t_constraint_check_subclass`](tables/t_constraint_check_subclass.sql) — realizes `constraint_check_subclass` · _shared with 12 other collection(s)_
- [`t_dataset_with_record_count`](tables/t_dataset_with_record_count.sql) — realizes `dataset_with_record_count`
- [`t_dbpedia_label_alignment`](tables/t_dbpedia_label_alignment.sql) — realizes `dbpedia_label_alignment` · _shared with 2 other collection(s)_
- [`t_dempster_combinant_first`](tables/t_dempster_combinant_first.sql) — realizes `dempster_combinant_first` · _shared with 8 other collection(s)_
- [`t_directive_only_governs_artifact`](tables/t_directive_only_governs_artifact.sql) — realizes `directive_only_governs_artifact` · _shared with 8 other collection(s)_
- [`t_entity_match_link`](tables/t_entity_match_link.sql) — realizes `entity_match_link` · _shared with 11 other collection(s)_
- [`t_equiv_union_basic`](tables/t_equiv_union_basic.sql) — realizes `equiv_union_basic` · _shared with 9 other collection(s)_
- [`t_kernelhook_with_hook_kind`](tables/t_kernelhook_with_hook_kind.sql) — realizes `kernelhook_with_hook_kind` · _shared with 5 other collection(s)_
- [`t_policy_supersedes`](tables/t_policy_supersedes.sql) — realizes `policy_supersedes` · _shared with 6 other collection(s)_
- [`t_process_either_started_or_completed`](tables/t_process_either_started_or_completed.sql) — realizes `process_either_started_or_completed` · _shared with 7 other collection(s)_
- [`t_profile_of_column`](tables/t_profile_of_column.sql) — realizes `profile_of_column` · _shared with 6 other collection(s)_
- [`t_regional_quality_benchmark`](tables/t_regional_quality_benchmark.sql) — realizes `regional_quality_benchmark` · _shared with 18 other collection(s)_
- [`t_storage_structure_composition`](tables/t_storage_structure_composition.sql) — realizes `storage_structure_composition` · _shared with 8 other collection(s)_
