# Collection — topic 30 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **12 topics** (target + style) · **20 ontology terms** · **20 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 30: topic 35, topic 44, topic 45, topic 49, topic 61, topic 66, topic 82, topic 107, topic 111, topic 188, topic 191.

> **Topic gist** (representative FinePDFs text): **Basic Information** - **Catalog Number:** 20536-1-AP - **Size:** 150ul, Concentration: 600 ug/ml by Nanodrop; - **Source:** Rabbit - **Isotype:** IgG - **Immunogen Catalog Number:** AC14521 - **GenBank Accession Number:** BC002409 - **GeneID (NCBI):** 60 - **UNIPROT ID:** P60709 - **Full Name:** actin, beta - **Calculated MW:** 375 aa, 42 kDa - **Observed MW:** 42 kDa **Purification Method:** .. …

## Chapters

- [ch_live_agent_responsible_for_f65661](chapters/ch_live_agent_responsible_for_f65661.md)
- [ch_live_control_basic_ed4de4](chapters/ch_live_control_basic_ed4de4.md)
- [ch_live_equiv_intersect_with_two_restrictions_90237e](chapters/ch_live_equiv_intersect_with_two_restrictions_90237e.md)
- [ch_live_existential_two_clauses_98deb6](chapters/ch_live_existential_two_clauses_98deb6.md)
- [ch_live_kernelhook_in_kernel_module_2a6e38](chapters/ch_live_kernelhook_in_kernel_module_2a6e38.md)
- [ch_live_kernelhook_in_kernel_module_8fdc62](chapters/ch_live_kernelhook_in_kernel_module_8fdc62.md)
- [ch_live_profile_has_cardinality_708cef](chapters/ch_live_profile_has_cardinality_708cef.md)
- [ch_live_regional_quality_benchmark_46df89](chapters/ch_live_regional_quality_benchmark_46df89.md)
- [ch_live_schemaorg_creativework_date_c3c169](chapters/ch_live_schemaorg_creativework_date_c3c169.md)
- [ch_live_schemaorg_event_location_28aba6](chapters/ch_live_schemaorg_event_location_28aba6.md)

## Ontology terms grounding this collection

- `agent_responsible_for` — {X} is an artifact that responsible for {Y}
- `agent_with_role` — {X} is an artifact that has agent role {Y}
- `attestation_min_one_signer` — {X} is a process
- `control_basic` — {X} is a directive information content entity
- `dataset_snapshot_subclass` — {X} is an artifact that snapshot of {Y}
- `ebpfevent_via_program_xref` — {X} is a process that via program artifact
- `ebpfmap_used_by_program` — {X} is an artifact that used by program {Y}
- `ebpfprogram_writes_to_map` — {X} is an artifact that writes to map {Y}
- `equiv_intersect_with_two_restrictions` — {X} is equivalent to {Y} that {p} {Z} and {q} {W}
- `existential_two_clauses` — {X} is something that {p} {Y}
- `ganglion_cyst_imaging_finding` — GanglionCystImagingFinding is an information content entity that visualizes some MagneticResonanceImagingModality.
- `kernelhook_in_kernel_module` — {X} is an artifact that in kernel module {Y}
- `lineage_edge_max_one_target` — {X} is a descriptive information content entity
- `process_max_one_operator` — {X} is a process
- `profile_has_cardinality` — {X} is a descriptive information content entity that has cardinality {Y}
- `qualification_process` — A QualificationProcess is an occurrent behavior that requires a membership registration and yields a championship entry.
- `regional_quality_benchmark` — A RegionalQualityBenchmark is a DescriptiveICE that has a minimum threshold and a maximum threshold.
- `schemaorg_creativework_date` — {X} is an artifact that has date published {Y}
- `schemaorg_event_location` — {X} is an artifact that has event location {Y}
- `two_disjoint_artifacts` — {X} is not {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_agent_responsible_for`](tables/t_agent_responsible_for.sql) — realizes `agent_responsible_for` · _shared with 1 other collection(s)_
- [`t_agent_with_role`](tables/t_agent_with_role.sql) — realizes `agent_with_role` · _shared with 7 other collection(s)_
- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer` · _shared with 4 other collection(s)_
- [`t_control_basic`](tables/t_control_basic.sql) — realizes `control_basic` · _shared with 8 other collection(s)_
- [`t_dataset_snapshot_subclass`](tables/t_dataset_snapshot_subclass.sql) — realizes `dataset_snapshot_subclass` · _shared with 10 other collection(s)_
- [`t_ebpfevent_via_program_xref`](tables/t_ebpfevent_via_program_xref.sql) — realizes `ebpfevent_via_program_xref` · _shared with 7 other collection(s)_
- [`t_ebpfmap_used_by_program`](tables/t_ebpfmap_used_by_program.sql) — realizes `ebpfmap_used_by_program` · _shared with 5 other collection(s)_
- [`t_ebpfprogram_writes_to_map`](tables/t_ebpfprogram_writes_to_map.sql) — realizes `ebpfprogram_writes_to_map` · _shared with 4 other collection(s)_
- [`t_equiv_intersect_with_two_restrictions`](tables/t_equiv_intersect_with_two_restrictions.sql) — realizes `equiv_intersect_with_two_restrictions` · _shared with 12 other collection(s)_
- [`t_existential_two_clauses`](tables/t_existential_two_clauses.sql) — realizes `existential_two_clauses` · _shared with 4 other collection(s)_
- [`t_ganglion_cyst_imaging_finding`](tables/t_ganglion_cyst_imaging_finding.sql) — realizes `ganglion_cyst_imaging_finding` · _shared with 11 other collection(s)_
- [`t_kernelhook_in_kernel_module`](tables/t_kernelhook_in_kernel_module.sql) — realizes `kernelhook_in_kernel_module` · _shared with 2 other collection(s)_
- [`t_lineage_edge_max_one_target`](tables/t_lineage_edge_max_one_target.sql) — realizes `lineage_edge_max_one_target` · _shared with 11 other collection(s)_
- [`t_process_max_one_operator`](tables/t_process_max_one_operator.sql) — realizes `process_max_one_operator` · _shared with 4 other collection(s)_
- [`t_profile_has_cardinality`](tables/t_profile_has_cardinality.sql) — realizes `profile_has_cardinality` · _shared with 7 other collection(s)_
- [`t_qualification_process`](tables/t_qualification_process.sql) — realizes `qualification_process` · _shared with 6 other collection(s)_
- [`t_regional_quality_benchmark`](tables/t_regional_quality_benchmark.sql) — realizes `regional_quality_benchmark` · _shared with 18 other collection(s)_
- [`t_schemaorg_creativework_date`](tables/t_schemaorg_creativework_date.sql) — realizes `schemaorg_creativework_date` · _shared with 7 other collection(s)_
- [`t_schemaorg_event_location`](tables/t_schemaorg_event_location.sql) — realizes `schemaorg_event_location` · _shared with 10 other collection(s)_
- [`t_two_disjoint_artifacts`](tables/t_two_disjoint_artifacts.sql) — realizes `two_disjoint_artifacts` · _shared with 7 other collection(s)_
