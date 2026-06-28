# Collection — topic 136 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **6 chapters** · **1 topics** (target + style) · **14 ontology terms** · **14 underlying tables**.

> **Topic gist** (representative FinePDFs text): srobinson on DSK4SPTVN1PROD with NOTICES 53156 NUCLEAR REGULATORY COMMISSION [NRC–2010–0383] Agency Information Collection Activities: Submission for the Office of Management and Budget Review; Comment Request AGENCY : Nuclear Regulatory Commission. ACTION: Notice of Office of Management and Budget review of information collection and solicitation of public comment. SUMMARY: The U.S. Nucl... …

## Chapters

- [ch_live_attestation_subclass_2f822a](chapters/ch_live_attestation_subclass_2f822a.md)
- [ch_live_attestation_subclass_79ddbb](chapters/ch_live_attestation_subclass_79ddbb.md)
- [ch_live_attestation_subclass_8ec7ff](chapters/ch_live_attestation_subclass_8ec7ff.md)
- [ch_live_counter_metric_subclass_7e34c4](chapters/ch_live_counter_metric_subclass_7e34c4.md)
- [ch_live_national_dataset_augmentation_process_bd7e75](chapters/ch_live_national_dataset_augmentation_process_bd7e75.md)
- [ch_live_radicalization_process_759f0c](chapters/ch_live_radicalization_process_759f0c.md)

## Ontology terms grounding this collection

- `attestation_subclass` — {X} is a process that attests to control directive information content entity
- `claim_basic` — {X} is a descriptive information content entity
- `counter_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `ebpfprogram_has_program_type` — {X} is an artifact that has program type {Y}
- `equiv_intersect_anchored_artifact` — {X} is equivalent to {Y} and artifact
- `equiv_intersect_artifact_with_part` — Class: {X:Class} EquivalentTo: cco:Artifact and (bfo:0000051 some {Y:Class})
- `national_dataset_augmentation_process` — NationalDatasetAugmentationProcess is a process that incorporates CopernicusObservationSource and augments ExistingNatio
- `program_with_entry_exactly_one` — {X} is an artifact
- `radicalization_process` — A RadicalizationProcess is a Process that involves some AffiliatedOrganization.
- `reference_within_dataset` — {X} is a designative information content entity that points to {Y}
- `regional_quality_benchmark` — A RegionalQualityBenchmark is a DescriptiveICE that has a minimum threshold and a maximum threshold.
- `school_security_policy` — SchoolSecurityPolicy is a DirectiveICE that targets some SafetyObjective and mustSatisfy some ConstitutionalConstraint.
- `shell_dimension_specification` — ShellDimensionSpecification is a descriptive information content entity with exactly one decimal dimension value.
- `soc2_availability_subclass` — {X} is a directive information content entity that for soc2 domain {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_subclass`](tables/t_attestation_subclass.sql) — realizes `attestation_subclass` · _shared with 6 other collection(s)_
- [`t_claim_basic`](tables/t_claim_basic.sql) — realizes `claim_basic` · _shared with 15 other collection(s)_
- [`t_counter_metric_subclass`](tables/t_counter_metric_subclass.sql) — realizes `counter_metric_subclass` · _shared with 9 other collection(s)_
- [`t_ebpfprogram_has_program_type`](tables/t_ebpfprogram_has_program_type.sql) — realizes `ebpfprogram_has_program_type` · _shared with 2 other collection(s)_
- [`t_equiv_intersect_anchored_artifact`](tables/t_equiv_intersect_anchored_artifact.sql) — realizes `equiv_intersect_anchored_artifact` · _shared with 5 other collection(s)_
- [`t_equiv_intersect_artifact_with_part`](tables/t_equiv_intersect_artifact_with_part.sql) — realizes `equiv_intersect_artifact_with_part` · _shared with 3 other collection(s)_
- [`t_national_dataset_augmentation_process`](tables/t_national_dataset_augmentation_process.sql) — realizes `national_dataset_augmentation_process` · _shared with 11 other collection(s)_
- [`t_program_with_entry_exactly_one`](tables/t_program_with_entry_exactly_one.sql) — realizes `program_with_entry_exactly_one` · _shared with 10 other collection(s)_
- [`t_radicalization_process`](tables/t_radicalization_process.sql) — realizes `radicalization_process` · _shared with 11 other collection(s)_
- [`t_reference_within_dataset`](tables/t_reference_within_dataset.sql) — realizes `reference_within_dataset` · _shared with 8 other collection(s)_
- [`t_regional_quality_benchmark`](tables/t_regional_quality_benchmark.sql) — realizes `regional_quality_benchmark` · _shared with 18 other collection(s)_
- [`t_school_security_policy`](tables/t_school_security_policy.sql) — realizes `school_security_policy` · _shared with 8 other collection(s)_
- [`t_shell_dimension_specification`](tables/t_shell_dimension_specification.sql) — realizes `shell_dimension_specification` · _shared with 12 other collection(s)_
- [`t_soc2_availability_subclass`](tables/t_soc2_availability_subclass.sql) — realizes `soc2_availability_subclass` · _shared with 9 other collection(s)_
