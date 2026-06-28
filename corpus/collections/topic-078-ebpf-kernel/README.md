# Collection — topic 78 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **6 chapters** · **7 topics** (target + style) · **13 ontology terms** · **13 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 78: topic 34, topic 44, topic 49, topic 70, topic 120, topic 142.

> **Topic gist** (representative FinePDFs text): ENERGY STAR ® Residential New Construction Programs Historical Document This document is provided for reference because it has been superseded by a more recent Version or Revision. Please find current program documents on the Program Requirements webpage. Use of older Versions and Revisions, such as this document, are typically limited to homes and buildings with a permit date (or, for manufact... …

## Chapters

- [ch_live_identifier_uniquely_identifies_2e3131](chapters/ch_live_identifier_uniquely_identifies_2e3131.md)
- [ch_live_indoor_air_quality_action_plan_9c1e7d](chapters/ch_live_indoor_air_quality_action_plan_9c1e7d.md)
- [ch_live_sysblock_subclass_9abf3d](chapters/ch_live_sysblock_subclass_9abf3d.md)
- [ch_live_syscall_audited_by_639fbd](chapters/ch_live_syscall_audited_by_639fbd.md)
- [ch_live_syscall_audited_by_894bbb](chapters/ch_live_syscall_audited_by_894bbb.md)
- [ch_live_syscall_audited_by_e4dea6](chapters/ch_live_syscall_audited_by_e4dea6.md)

## Ontology terms grounding this collection

- `annotation_classifies_artifact` — {X} is a descriptive information content entity
- `attribute_set_subclass` — {X} is a descriptive information content entity that has attribute designative information content entity
- `identifier_uniquely_identifies` — {X} is a designative information content entity
- `indoor_air_quality_action_plan` — An IndoorAirQualityActionPlan is a DirectiveICE that targets IndoorAirPollution and is verified by a HealthOutcomeMetric
- `labrun_subclass` — {X} is a process that has input sample {Y}
- `measurement_with_method` — {X} is a descriptive information content entity that via method {Y}
- `outlier_claim_against_baseline` — {X} is a descriptive information content entity that against {Y}
- `soc2_processing_integrity` — {X} is a directive information content entity that for soc2 domain {Y}
- `sysblock_subclass` — {X} is an artifact that has part {Y}
- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_audited_by` — {X} is a designative information content entity
- `taper_tolerance_constraint` — TaperToleranceConstraint is a descriptive information content entity defined by upper and lower tolerance limits express
- `transformation_only_uses_datasets` — {X} is a process that uses entity {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_annotation_classifies_artifact`](tables/t_annotation_classifies_artifact.sql) — realizes `annotation_classifies_artifact` · _shared with 6 other collection(s)_
- [`t_attribute_set_subclass`](tables/t_attribute_set_subclass.sql) — realizes `attribute_set_subclass` · _shared with 8 other collection(s)_
- [`t_identifier_uniquely_identifies`](tables/t_identifier_uniquely_identifies.sql) — realizes `identifier_uniquely_identifies` · _shared with 8 other collection(s)_
- [`t_indoor_air_quality_action_plan`](tables/t_indoor_air_quality_action_plan.sql) — realizes `indoor_air_quality_action_plan` · _shared with 6 other collection(s)_
- [`t_labrun_subclass`](tables/t_labrun_subclass.sql) — realizes `labrun_subclass` · _shared with 10 other collection(s)_
- [`t_measurement_with_method`](tables/t_measurement_with_method.sql) — realizes `measurement_with_method` · _shared with 9 other collection(s)_
- [`t_outlier_claim_against_baseline`](tables/t_outlier_claim_against_baseline.sql) — realizes `outlier_claim_against_baseline` · _shared with 5 other collection(s)_
- [`t_soc2_processing_integrity`](tables/t_soc2_processing_integrity.sql) — realizes `soc2_processing_integrity` · _shared with 5 other collection(s)_
- [`t_sysblock_subclass`](tables/t_sysblock_subclass.sql) — realizes `sysblock_subclass` · _shared with 6 other collection(s)_
- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier` · _shared with 6 other collection(s)_
- [`t_syscall_audited_by`](tables/t_syscall_audited_by.sql) — realizes `syscall_audited_by` · _shared with 3 other collection(s)_
- [`t_taper_tolerance_constraint`](tables/t_taper_tolerance_constraint.sql) — realizes `taper_tolerance_constraint` · _shared with 7 other collection(s)_
- [`t_transformation_only_uses_datasets`](tables/t_transformation_only_uses_datasets.sql) — realizes `transformation_only_uses_datasets` · _shared with 8 other collection(s)_
