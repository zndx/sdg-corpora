# Collection — topic 188 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **1 topics** (target + style) · **27 ontology terms** · **27 underlying tables**.

> **Topic gist** (representative FinePDFs text): III. Materials and methods 1. Antibodies Rabbit polyclonal antibodies against VILIP-1 and hippocalcin raised against recombinant Histagged VILIP-1 or hippocalcin fusion proteins and affinity-purified as previously described (Braunewell et al., 2001; Bernstein et al., 2003) were used. Other antibodies were purchased from indicating companies: Chicken polyclonal antibody against NCS-1 Calbiochem... …

## Chapters

- [ch_live_annotation_basic_08881b](chapters/ch_live_annotation_basic_08881b.md)
- [ch_live_constraint_basic_c957c5](chapters/ch_live_constraint_basic_c957c5.md)
- [ch_live_ebpf_event_observed_pid_7e7afb](chapters/ch_live_ebpf_event_observed_pid_7e7afb.md)
- [ch_live_indoor_environmental_monitoring_process_da0b38](chapters/ch_live_indoor_environmental_monitoring_process_da0b38.md)
- [ch_live_national_dataset_augmentation_process_fa4713](chapters/ch_live_national_dataset_augmentation_process_fa4713.md)
- [ch_live_nist80053_control_subclass_114ded](chapters/ch_live_nist80053_control_subclass_114ded.md)
- [ch_live_nist80053_control_subclass_88849d](chapters/ch_live_nist80053_control_subclass_88849d.md)
- [ch_live_nist80053_control_subclass_d7ea10](chapters/ch_live_nist80053_control_subclass_d7ea10.md)
- [ch_live_pdsa_improvement_model_ae8d8f](chapters/ch_live_pdsa_improvement_model_ae8d8f.md)
- [ch_live_process_min_one_input_d9019f](chapters/ch_live_process_min_one_input_d9019f.md)
- [ch_live_requirement_traces_to_a920c9](chapters/ch_live_requirement_traces_to_a920c9.md)
- [ch_live_universal_combined_with_existential_20f87f](chapters/ch_live_universal_combined_with_existential_20f87f.md)

## Ontology terms grounding this collection

- `annotation_basic` — {X} is a descriptive information content entity
- `black_belt_certification_requirement` — A BlackBeltCertificationRequirement is a descriptive information entity that specifies a decimal dan certification level
- `claim_subclass` — {X} is a descriptive information content entity that claim about {Y}
- `claim_with_belief_interval` — {X} is a descriptive information content entity that has belief interval {Y}
- `constraint_basic` — {X} is a directive information content entity
- `descriptive_only_about_artifact` — {X} is a descriptive information content entity that is about {Y}
- `ebpf_event_observed_pid` — {X} is a process that observes pid {Y}
- `ebpfevent_via_program_xref` — {X} is a process that via program artifact
- `ebpfmap_with_key_type` — {X} is an artifact that has key type {Y}
- `ebpfmap_with_max_entries` — {X} is an artifact that has max entries {Y}
- `ebpfprogram_union_kprobe_or_xdp` — {X} is equivalent to artifact and {Y} or {Z}
- `host_connection_process` — HostConnectionProcess is a process that participates in ParasiticPlant.
- `indoor_environmental_monitoring_process` — An IndoorEnvironmentalMonitoringProcess is an Occurrent that monitors an IndoorEnvironment and uses a MonitoringProtocol
- `kernelhook_for_subsystem` — {X} is an artifact that for kernel subsystem {Y}
- `kernelhook_subclass` — {X} is an artifact that at kernel function {Y}
- `national_dataset_augmentation_process` — NationalDatasetAugmentationProcess is a process that incorporates CopernicusObservationSource and augments ExistingNatio
- `nist80053_control_subclass` — {X} is a directive information content entity that nist80053 control {Y}
- `nist80053_high_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `pdsa_improvement_model` — A PDSAImprovementModel is a Process that improves some ClinicalCare and optimizes some PatientOutcome.
- `policy_enforced_by` — {X} is a directive information content entity that enforced by {Y}
- `process_min_one_input` — {X} is a process
- `profile_of_column` — {X} is a descriptive information content entity that is about {Y}
- `requirement_traces_to` — {X} is a directive information content entity that traces to {Y}
- `schemaorg_person_affiliation` — {X} is an artifact that has affiliation {Y}
- `school_security_policy` — SchoolSecurityPolicy is a DirectiveICE that targets some SafetyObjective and mustSatisfy some ConstitutionalConstraint.
- `soc2_privacy_subclass` — {X} is a directive information content entity that for soc2 domain {Y}
- `universal_combined_with_existential` — {X} is something that {p} {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_annotation_basic`](tables/t_annotation_basic.sql) — realizes `annotation_basic` · _shared with 7 other collection(s)_
- [`t_black_belt_certification_requirement`](tables/t_black_belt_certification_requirement.sql) — realizes `black_belt_certification_requirement` · _shared with 7 other collection(s)_
- [`t_claim_subclass`](tables/t_claim_subclass.sql) — realizes `claim_subclass` · _shared with 12 other collection(s)_
- [`t_claim_with_belief_interval`](tables/t_claim_with_belief_interval.sql) — realizes `claim_with_belief_interval` · _shared with 6 other collection(s)_
- [`t_constraint_basic`](tables/t_constraint_basic.sql) — realizes `constraint_basic` · _shared with 6 other collection(s)_
- [`t_descriptive_only_about_artifact`](tables/t_descriptive_only_about_artifact.sql) — realizes `descriptive_only_about_artifact` · _shared with 7 other collection(s)_
- [`t_ebpf_event_observed_pid`](tables/t_ebpf_event_observed_pid.sql) — realizes `ebpf_event_observed_pid` · _shared with 9 other collection(s)_
- [`t_ebpfevent_via_program_xref`](tables/t_ebpfevent_via_program_xref.sql) — realizes `ebpfevent_via_program_xref` · _shared with 7 other collection(s)_
- [`t_ebpfmap_with_key_type`](tables/t_ebpfmap_with_key_type.sql) — realizes `ebpfmap_with_key_type` · _shared with 7 other collection(s)_
- [`t_ebpfmap_with_max_entries`](tables/t_ebpfmap_with_max_entries.sql) — realizes `ebpfmap_with_max_entries` · _shared with 7 other collection(s)_
- [`t_ebpfprogram_union_kprobe_or_xdp`](tables/t_ebpfprogram_union_kprobe_or_xdp.sql) — realizes `ebpfprogram_union_kprobe_or_xdp` · _shared with 7 other collection(s)_
- [`t_host_connection_process`](tables/t_host_connection_process.sql) — realizes `host_connection_process` · _shared with 8 other collection(s)_
- [`t_indoor_environmental_monitoring_process`](tables/t_indoor_environmental_monitoring_process.sql) — realizes `indoor_environmental_monitoring_process` · _shared with 5 other collection(s)_
- [`t_kernelhook_for_subsystem`](tables/t_kernelhook_for_subsystem.sql) — realizes `kernelhook_for_subsystem` · _shared with 9 other collection(s)_
- [`t_kernelhook_subclass`](tables/t_kernelhook_subclass.sql) — realizes `kernelhook_subclass` · _shared with 3 other collection(s)_
- [`t_national_dataset_augmentation_process`](tables/t_national_dataset_augmentation_process.sql) — realizes `national_dataset_augmentation_process` · _shared with 11 other collection(s)_
- [`t_nist80053_control_subclass`](tables/t_nist80053_control_subclass.sql) — realizes `nist80053_control_subclass` · _shared with 5 other collection(s)_
- [`t_nist80053_high_impact`](tables/t_nist80053_high_impact.sql) — realizes `nist80053_high_impact` · _shared with 8 other collection(s)_
- [`t_pdsa_improvement_model`](tables/t_pdsa_improvement_model.sql) — realizes `pdsa_improvement_model` · _shared with 10 other collection(s)_
- [`t_policy_enforced_by`](tables/t_policy_enforced_by.sql) — realizes `policy_enforced_by` · _shared with 12 other collection(s)_
- [`t_process_min_one_input`](tables/t_process_min_one_input.sql) — realizes `process_min_one_input` · _shared with 7 other collection(s)_
- [`t_profile_of_column`](tables/t_profile_of_column.sql) — realizes `profile_of_column` · _shared with 6 other collection(s)_
- [`t_requirement_traces_to`](tables/t_requirement_traces_to.sql) — realizes `requirement_traces_to` · _shared with 15 other collection(s)_
- [`t_schemaorg_person_affiliation`](tables/t_schemaorg_person_affiliation.sql) — realizes `schemaorg_person_affiliation` · _shared with 5 other collection(s)_
- [`t_school_security_policy`](tables/t_school_security_policy.sql) — realizes `school_security_policy` · _shared with 8 other collection(s)_
- [`t_soc2_privacy_subclass`](tables/t_soc2_privacy_subclass.sql) — realizes `soc2_privacy_subclass` · _shared with 7 other collection(s)_
- [`t_universal_combined_with_existential`](tables/t_universal_combined_with_existential.sql) — realizes `universal_combined_with_existential` · _shared with 11 other collection(s)_
