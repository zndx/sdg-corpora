# Collection — topic 56 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **4 topics** (target + style) · **25 ontology terms** · **25 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 56: topic 136, topic 163, topic 166.

> **Topic gist** (representative FinePDFs text): 2020-21 Surgery Rese arch Residents Surgery W e are proud to present this year's new research residents. Research is a key component of the UW Department of Surgery's residency programs and these residents have each "paused" their clinical training in order to complete a two-year research fellowship. Our research residents, along with their clinical peers who work hard to find time to participat.. …

## Chapters

- [ch_live_annotation_governed_by_classification_policy_5f374e](chapters/ch_live_annotation_governed_by_classification_policy_5f374e.md)
- [ch_live_artifact_not_deprecated_49ec22](chapters/ch_live_artifact_not_deprecated_49ec22.md)
- [ch_live_profile_has_null_rate_1f1bae](chapters/ch_live_profile_has_null_rate_1f1bae.md)
- [ch_live_reference_within_dataset_9ec0e3](chapters/ch_live_reference_within_dataset_9ec0e3.md)
- [ch_live_sample_subclass_9f9654](chapters/ch_live_sample_subclass_9f9654.md)
- [ch_live_schema_migration_subclass_46b55d](chapters/ch_live_schema_migration_subclass_46b55d.md)
- [ch_live_schema_migration_subclass_8325db](chapters/ch_live_schema_migration_subclass_8325db.md)
- [ch_live_schema_migration_subclass_bfc97c](chapters/ch_live_schema_migration_subclass_bfc97c.md)
- [ch_live_schemaorg_product_sku_880332](chapters/ch_live_schemaorg_product_sku_880332.md)
- [ch_live_schemaorg_review_author_11c2b8](chapters/ch_live_schemaorg_review_author_11c2b8.md)
- [ch_live_schemaorg_review_author_e3059c](chapters/ch_live_schemaorg_review_author_e3059c.md)
- [ch_live_sysblock_subclass_1c3d97](chapters/ch_live_sysblock_subclass_1c3d97.md)

## Ontology terms grounding this collection

- `annotation_governed_by_classification_policy` — {X} is a descriptive information content entity that governed by directive information content entity
- `artifact_not_deprecated` — {X} is not {Y}
- `attestation_subclass` — {X} is a process that attests to control directive information content entity
- `attribute_set_min_one` — {X} is a descriptive information content entity
- `cgroup_skb_subclass` — {X} is an artifact that attaches to cgroup {Y}
- `claim_subclass` — {X} is a descriptive information content entity that claim about {Y}
- `claim_with_belief_interval` — {X} is a descriptive information content entity that has belief interval {Y}
- `constraint_check_subclass` — {X} is a directive information content entity that checks {Y}
- `dempster_combinant_second` — {X} is a descriptive information content entity that has second combinant {Y}
- `directive_not_superseded` — {X} is not {Y}
- `log_with_resource_attribute` — {X} is an artifact that has resource attribute {Y}
- `pdsa_improvement_model` — A PDSAImprovementModel is a Process that improves some ClinicalCare and optimizes some PatientOutcome.
- `port_isolation_measurement` — A PortIsolationMeasurement is an InformationContentEntity that measures a PortPair, depends on an ImpedanceTermination, 
- `profile_has_null_rate` — {X} is a descriptive information content entity that has null rate {Y}
- `program_with_entry_exactly_one` — {X} is an artifact
- `reference_within_dataset` — {X} is a designative information content entity that points to {Y}
- `sample_subclass` — {X} is an artifact that collected from {Y}
- `schema_evolution_under_directive` — {X} is a descriptive information content entity that governed by directive information content entity
- `schema_migration_subclass` — {X} is a process that migrates schema to {Y}
- `schemaorg_product_sku` — {X} is an artifact that has sku {Y}
- `schemaorg_review_author` — {X} is an artifact that has review author {Y}
- `schemaorg_review_rating` — {X} is an artifact that has review rating {Y}
- `sysblock_subclass` — {X} is an artifact that has part {Y}
- `transformation_subclass` — {X} is a process that uses entity {Y}
- `xdp_action_pass` — {X} is an artifact that has xdpaction {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_annotation_governed_by_classification_policy`](tables/t_annotation_governed_by_classification_policy.sql) — realizes `annotation_governed_by_classification_policy` · _shared with 5 other collection(s)_
- [`t_artifact_not_deprecated`](tables/t_artifact_not_deprecated.sql) — realizes `artifact_not_deprecated` · _shared with 10 other collection(s)_
- [`t_attestation_subclass`](tables/t_attestation_subclass.sql) — realizes `attestation_subclass` · _shared with 6 other collection(s)_
- [`t_attribute_set_min_one`](tables/t_attribute_set_min_one.sql) — realizes `attribute_set_min_one` · _shared with 7 other collection(s)_
- [`t_cgroup_skb_subclass`](tables/t_cgroup_skb_subclass.sql) — realizes `cgroup_skb_subclass` · _shared with 6 other collection(s)_
- [`t_claim_subclass`](tables/t_claim_subclass.sql) — realizes `claim_subclass` · _shared with 12 other collection(s)_
- [`t_claim_with_belief_interval`](tables/t_claim_with_belief_interval.sql) — realizes `claim_with_belief_interval` · _shared with 6 other collection(s)_
- [`t_constraint_check_subclass`](tables/t_constraint_check_subclass.sql) — realizes `constraint_check_subclass` · _shared with 12 other collection(s)_
- [`t_dempster_combinant_second`](tables/t_dempster_combinant_second.sql) — realizes `dempster_combinant_second` · _shared with 7 other collection(s)_
- [`t_directive_not_superseded`](tables/t_directive_not_superseded.sql) — realizes `directive_not_superseded` · _shared with 4 other collection(s)_
- [`t_log_with_resource_attribute`](tables/t_log_with_resource_attribute.sql) — realizes `log_with_resource_attribute` · _shared with 10 other collection(s)_
- [`t_pdsa_improvement_model`](tables/t_pdsa_improvement_model.sql) — realizes `pdsa_improvement_model` · _shared with 10 other collection(s)_
- [`t_port_isolation_measurement`](tables/t_port_isolation_measurement.sql) — realizes `port_isolation_measurement` · _shared with 5 other collection(s)_
- [`t_profile_has_null_rate`](tables/t_profile_has_null_rate.sql) — realizes `profile_has_null_rate` · _shared with 8 other collection(s)_
- [`t_program_with_entry_exactly_one`](tables/t_program_with_entry_exactly_one.sql) — realizes `program_with_entry_exactly_one` · _shared with 10 other collection(s)_
- [`t_reference_within_dataset`](tables/t_reference_within_dataset.sql) — realizes `reference_within_dataset` · _shared with 8 other collection(s)_
- [`t_sample_subclass`](tables/t_sample_subclass.sql) — realizes `sample_subclass` · _shared with 5 other collection(s)_
- [`t_schema_evolution_under_directive`](tables/t_schema_evolution_under_directive.sql) — realizes `schema_evolution_under_directive` · _shared with 4 other collection(s)_
- [`t_schema_migration_subclass`](tables/t_schema_migration_subclass.sql) — realizes `schema_migration_subclass` · _shared with 2 other collection(s)_
- [`t_schemaorg_product_sku`](tables/t_schemaorg_product_sku.sql) — realizes `schemaorg_product_sku` · _shared with 6 other collection(s)_
- [`t_schemaorg_review_author`](tables/t_schemaorg_review_author.sql) — realizes `schemaorg_review_author` · _shared with 4 other collection(s)_
- [`t_schemaorg_review_rating`](tables/t_schemaorg_review_rating.sql) — realizes `schemaorg_review_rating` · _shared with 6 other collection(s)_
- [`t_sysblock_subclass`](tables/t_sysblock_subclass.sql) — realizes `sysblock_subclass` · _shared with 6 other collection(s)_
- [`t_transformation_subclass`](tables/t_transformation_subclass.sql) — realizes `transformation_subclass` · _shared with 5 other collection(s)_
- [`t_xdp_action_pass`](tables/t_xdp_action_pass.sql) — realizes `xdp_action_pass` · _shared with 8 other collection(s)_
