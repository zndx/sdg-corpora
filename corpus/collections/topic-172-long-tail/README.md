# Collection — topic 172 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **5 chapters** · **1 topics** (target + style) · **14 ontology terms** · **14 underlying tables**.

> **Topic gist** (representative FinePDFs text): INTERNATIONAL CENTRE FOR SETTLEMENT OF INVESTMENT DISPUTES ICSID Case No. ARB/19/34 AMEC FOSTER WHEELER USA CORPORATION, PROCESS CONSULTANTS, INC., AND JOINT VENTURE FOSTER WHEELER USA CORPORATION AND PROCESS CONSULTANTS, INC. Claimants v. REPUBLIC OF COLOMBIA Respondent RESPONDENT'S ANSWER TO CLAIMANTS' APPLICATION FOR PROVISIONAL MEASURES Counsel for Respondent Ana María Ordoñez Puentes ... …

## Chapters

- [ch_live_entity_match_link_4bfb65](chapters/ch_live_entity_match_link_4bfb65.md)
- [ch_live_nist80053_low_impact_1b4d7e](chapters/ch_live_nist80053_low_impact_1b4d7e.md)
- [ch_live_soc2_processing_integrity_cadfcd](chapters/ch_live_soc2_processing_integrity_cadfcd.md)
- [ch_live_span_with_parent_3f1902](chapters/ch_live_span_with_parent_3f1902.md)
- [ch_live_syscall_with_argument_count_a500ef](chapters/ch_live_syscall_with_argument_count_a500ef.md)

## Ontology terms grounding this collection

- `annotation_basic` — {X} is a descriptive information content entity
- `attribute_set_supports_outlier_claim` — {X} is a descriptive information content entity that supports {Y}
- `audit_basic` — {X} is a process
- `cardinality_exactly_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} exactly 1 {Y:Class}
- `constraint_min_one_check` — {X} is a directive information content entity
- `entity_match_link` — {X} is a descriptive information content entity that matches entity {Y}
- `host_connection_process` — HostConnectionProcess is a process that participates in ParasiticPlant.
- `insertion_loss_specification` — An InsertionLossSpecification is a DescriptiveICE that specifies an InsertionLossValue and a PhaseRelationshipValue.
- `intermediate_floor_assembly` — IntermediateFloorAssembly is a material continuant that contains a LateralRestraintStrap component.
- `nist80053_low_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `observation_with_participant` — {X} is a process that has participant artifact
- `soc2_processing_integrity` — {X} is a directive information content entity that for soc2 domain {Y}
- `span_with_parent` — {X} is a process that has parent span {Y}
- `syscall_with_argument_count` — {X} is a designative information content entity that has argument count {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_annotation_basic`](tables/t_annotation_basic.sql) — realizes `annotation_basic` · _shared with 7 other collection(s)_
- [`t_attribute_set_supports_outlier_claim`](tables/t_attribute_set_supports_outlier_claim.sql) — realizes `attribute_set_supports_outlier_claim` · _shared with 9 other collection(s)_
- [`t_audit_basic`](tables/t_audit_basic.sql) — realizes `audit_basic` · _shared with 8 other collection(s)_
- [`t_cardinality_exactly_one_generic`](tables/t_cardinality_exactly_one_generic.sql) — realizes `cardinality_exactly_one_generic` · _shared with 10 other collection(s)_
- [`t_constraint_min_one_check`](tables/t_constraint_min_one_check.sql) — realizes `constraint_min_one_check` · _shared with 8 other collection(s)_
- [`t_entity_match_link`](tables/t_entity_match_link.sql) — realizes `entity_match_link` · _shared with 11 other collection(s)_
- [`t_host_connection_process`](tables/t_host_connection_process.sql) — realizes `host_connection_process` · _shared with 8 other collection(s)_
- [`t_insertion_loss_specification`](tables/t_insertion_loss_specification.sql) — realizes `insertion_loss_specification` · _shared with 6 other collection(s)_
- [`t_intermediate_floor_assembly`](tables/t_intermediate_floor_assembly.sql) — realizes `intermediate_floor_assembly` · _shared with 7 other collection(s)_
- [`t_nist80053_low_impact`](tables/t_nist80053_low_impact.sql) — realizes `nist80053_low_impact` · _shared with 6 other collection(s)_
- [`t_observation_with_participant`](tables/t_observation_with_participant.sql) — realizes `observation_with_participant` · _shared with 8 other collection(s)_
- [`t_soc2_processing_integrity`](tables/t_soc2_processing_integrity.sql) — realizes `soc2_processing_integrity` · _shared with 5 other collection(s)_
- [`t_span_with_parent`](tables/t_span_with_parent.sql) — realizes `span_with_parent` · _shared with 5 other collection(s)_
- [`t_syscall_with_argument_count`](tables/t_syscall_with_argument_count.sql) — realizes `syscall_with_argument_count` · _shared with 8 other collection(s)_
