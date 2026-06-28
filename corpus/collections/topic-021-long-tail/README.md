# Collection — topic 21 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **8 chapters** · **9 topics** (target + style) · **17 ontology terms** · **17 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 21: topic 30, topic 106, topic 107, topic 111, topic 129, topic 158, topic 188, topic 196.

> **Topic gist** (representative FinePDFs text): Recreating gut-liver axis during NAFLD onset by using a Caco-2/HepG2 co-culture system Marica Meroni¹, Erika Paolini¹,², Miriam Longo¹,³, Roberto Piciotti¹,⁴, Giada Tria¹, Silvia Fargion¹, Anna Ludovica Fracanzani¹,⁴, Paola Dongiovanni¹ ¹General Medicine and Metabolic Diseases, Fondazione IRCCS Ca’ Granda Ospedale Maggiore Policlinico, Milan 20122, Italy. ²Department of Pharmacological and Biomo.. …

## Chapters

- [ch_live_artifact_not_revoked_f7dc11](chapters/ch_live_artifact_not_revoked_f7dc11.md)
- [ch_live_claim_governed_by_directive_050271](chapters/ch_live_claim_governed_by_directive_050271.md)
- [ch_live_column_tag_from_annotator_c15a9b](chapters/ch_live_column_tag_from_annotator_c15a9b.md)
- [ch_live_column_tag_subclass_fa462f](chapters/ch_live_column_tag_subclass_fa462f.md)
- [ch_live_control_with_classification_tier_a69161](chapters/ch_live_control_with_classification_tier_a69161.md)
- [ch_live_ebpf_event_min_one_attribute_7e72b9](chapters/ch_live_ebpf_event_min_one_attribute_7e72b9.md)
- [ch_live_schemaorg_event_endtime_f79446](chapters/ch_live_schemaorg_event_endtime_f79446.md)
- [ch_live_yager_combination_657921](chapters/ch_live_yager_combination_657921.md)

## Ontology terms grounding this collection

- `artifact_not_revoked` — {X} is not {Y}
- `claim_governed_by_directive` — {X} is a descriptive information content entity that governed by directive information content entity
- `column_tag_from_annotator` — {X} is a descriptive information content entity that by annotator {Y}
- `column_tag_subclass` — {X} is a descriptive information content entity that annotates column {Y}
- `column_type_changed_from` — {X} is a descriptive information content entity that type changed from {Y}
- `control_with_classification_tier` — {X} is a directive information content entity that at classification tier designative information content entity
- `ebpf_event_min_one_attribute` — {X} is a process
- `ebpfevent_via_program_xref` — {X} is a process that via program artifact
- `ebpfmap_equiv_kv_typed` — Class: {X:Class} EquivalentTo: cco:Artifact and (sdg:hasKeyType some {Y:Class}) and (sdg:hasValueTypeMap some {Z:Class})
- `ebpfprogram_min_one_hook` — {X} is an artifact
- `equiv_union_three` — {X} is equivalent to {W} or {Y} or {Z}
- `flood_defence_condition_characterisation` — FloodDefenceConditionCharacterisation is a process that involves EarthObservationData and employs ValidationProcess.
- `kernelhook_in_kernel_module` — {X} is an artifact that in kernel module {Y}
- `policy_with_review_cycle` — {X} is a directive information content entity that has review cycle {Y}
- `schemaorg_event_endtime` — {X} is an artifact that has event end time {Y}
- `schemaorg_person_birthplace` — {X} is an artifact that has birthplace {Y}
- `yager_combination` — {X} is a descriptive information content entity that yager combines {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_artifact_not_revoked`](tables/t_artifact_not_revoked.sql) — realizes `artifact_not_revoked` · _shared with 8 other collection(s)_
- [`t_claim_governed_by_directive`](tables/t_claim_governed_by_directive.sql) — realizes `claim_governed_by_directive` · _shared with 5 other collection(s)_
- [`t_column_tag_from_annotator`](tables/t_column_tag_from_annotator.sql) — realizes `column_tag_from_annotator` · _shared with 6 other collection(s)_
- [`t_column_tag_subclass`](tables/t_column_tag_subclass.sql) — realizes `column_tag_subclass` · _shared with 1 other collection(s)_
- [`t_column_type_changed_from`](tables/t_column_type_changed_from.sql) — realizes `column_type_changed_from` · _shared with 6 other collection(s)_
- [`t_control_with_classification_tier`](tables/t_control_with_classification_tier.sql) — realizes `control_with_classification_tier` · _shared with 10 other collection(s)_
- [`t_ebpf_event_min_one_attribute`](tables/t_ebpf_event_min_one_attribute.sql) — realizes `ebpf_event_min_one_attribute` · _shared with 6 other collection(s)_
- [`t_ebpfevent_via_program_xref`](tables/t_ebpfevent_via_program_xref.sql) — realizes `ebpfevent_via_program_xref` · _shared with 7 other collection(s)_
- [`t_ebpfmap_equiv_kv_typed`](tables/t_ebpfmap_equiv_kv_typed.sql) — realizes `ebpfmap_equiv_kv_typed` · _shared with 8 other collection(s)_
- [`t_ebpfprogram_min_one_hook`](tables/t_ebpfprogram_min_one_hook.sql) — realizes `ebpfprogram_min_one_hook` · _shared with 5 other collection(s)_
- [`t_equiv_union_three`](tables/t_equiv_union_three.sql) — realizes `equiv_union_three` · _shared with 5 other collection(s)_
- [`t_flood_defence_condition_characterisation`](tables/t_flood_defence_condition_characterisation.sql) — realizes `flood_defence_condition_characterisation` · _shared with 6 other collection(s)_
- [`t_kernelhook_in_kernel_module`](tables/t_kernelhook_in_kernel_module.sql) — realizes `kernelhook_in_kernel_module` · _shared with 2 other collection(s)_
- [`t_policy_with_review_cycle`](tables/t_policy_with_review_cycle.sql) — realizes `policy_with_review_cycle` · _shared with 8 other collection(s)_
- [`t_schemaorg_event_endtime`](tables/t_schemaorg_event_endtime.sql) — realizes `schemaorg_event_endtime` · _shared with 5 other collection(s)_
- [`t_schemaorg_person_birthplace`](tables/t_schemaorg_person_birthplace.sql) — realizes `schemaorg_person_birthplace` · _shared with 3 other collection(s)_
- [`t_yager_combination`](tables/t_yager_combination.sql) — realizes `yager_combination` · _shared with 5 other collection(s)_
