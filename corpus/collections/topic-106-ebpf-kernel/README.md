# Collection — topic 106 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **15 chapters** · **10 topics** (target + style) · **32 ontology terms** · **32 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 106: topic 65, topic 95, topic 129, topic 135, topic 140, topic 142, topic 181, topic 195, topic 196.

> **Topic gist** (representative FinePDFs text): OPTIMAL CONTROLLER DESIGN FOR MORE-ELECTRIC AIRCRAFT POWER SYSTEMS by Sinan Yigit BS, TOBB University of Economics and Technology, 2011 Submitted to the Graduate Faculty of Swanson School of Engineering in partial fulfillment of the requirements for the degree of Master of Science University of Pittsburgh 2014 This thesis was presented by Sinan Yigit It was defended on July 23, 2014 an... …

## Chapters

- [ch_live_artifact_with_universal_88d636](chapters/ch_live_artifact_with_universal_88d636.md)
- [ch_live_census_data_collection_process_6cfaad](chapters/ch_live_census_data_collection_process_6cfaad.md)
- [ch_live_crop_parasitism_impact_5d33d9](chapters/ch_live_crop_parasitism_impact_5d33d9.md)
- [ch_live_ebpf_event_min_one_attribute_4396e4](chapters/ch_live_ebpf_event_min_one_attribute_4396e4.md)
- [ch_live_ebpf_event_min_one_attribute_922693](chapters/ch_live_ebpf_event_min_one_attribute_922693.md)
- [ch_live_ebpf_event_min_one_attribute_cfb30a](chapters/ch_live_ebpf_event_min_one_attribute_cfb30a.md)
- [ch_live_existential_anchored_to_artifact_via_part_1f9c7d](chapters/ch_live_existential_anchored_to_artifact_via_part_1f9c7d.md)
- [ch_live_host_connection_process_bc2d97](chapters/ch_live_host_connection_process_bc2d97.md)
- [ch_live_professional_experience_f16f1f](chapters/ch_live_professional_experience_f16f1f.md)
- [ch_live_professional_expertise_domain_d9d8c1](chapters/ch_live_professional_expertise_domain_d9d8c1.md)
- [ch_live_syscall_invoked_by_event_579336](chapters/ch_live_syscall_invoked_by_event_579336.md)
- [ch_live_syscall_max_one_return_b0a9c3](chapters/ch_live_syscall_max_one_return_b0a9c3.md)
- [ch_live_syscall_max_one_return_fa3555](chapters/ch_live_syscall_max_one_return_fa3555.md)
- [ch_live_transformation_ends_at_7882f2](chapters/ch_live_transformation_ends_at_7882f2.md)
- [ch_live_verification_min_one_evidence_6feb50](chapters/ch_live_verification_min_one_evidence_6feb50.md)

## Ontology terms grounding this collection

- `allocation_at_run_id` — {X} is a process that at run identifier {Y}
- `artifact_with_universal` — {X} is an artifact that {p} {Y}
- `attestation_basic` — {X} is a process
- `attribute_set_basic` — {X} is a descriptive information content entity
- `cardinality_exactly_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} exactly 1 {Y:Class}
- `cardinality_min_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} min 1 {Y:Class}
- `census_data_collection_process` — A CensusDataCollectionProcess is a Process that involves an OrganizationalScreeningActivity and includes a Representativ
- `column_dropped_at_version` — {X} is a descriptive information content entity that dropped at schema version {Y}
- `column_property_subclass` — {X} is a descriptive information content entity that annotates property of {Y}
- `crop_parasitism_impact` — CropParasitismImpact is an information content entity that affects exactly one RiceCultivationSystem, parasitises exactl
- `ebpf_event_min_one_attribute` — {X} is a process
- `ebpf_event_observed_pid` — {X} is a process that observes pid {Y}
- `ebpf_event_subclass` — {X} is a process that captured by {Y}
- `ebpfmap_with_key_type` — {X} is an artifact that has key type {Y}
- `existential_anchored_to_artifact_via_part` — {X} is something that part of artifact
- `host_connection_process` — HostConnectionProcess is a process that participates in ParasiticPlant.
- `lineage_edge_via_transformation` — {X} is a descriptive information content entity that via transformation {Y}
- `lineage_edge_with_provenance` — {X} is a descriptive information content entity that with provenance {Y}
- `log_within_span_context` — {X} is an artifact that within span context {Y}
- `process_min_one_output` — {X} is a process
- `professional_experience` — A ProfessionalExperience is an InformationContentEntity that relates a Person to an Organization and records a duration 
- `professional_expertise_domain` — A ProfessionalExpertiseDomain is a DescriptiveICE that covers some IndustrySector and provides some ServiceType.
- `profile_has_cardinality` — {X} is a descriptive information content entity that has cardinality {Y}
- `profiling_basic` — {X} is a process
- `profiling_with_method` — {X} is a process that applies method {Y}
- `span_with_attribute` — {X} is a process that has span attribute {Y}
- `strategic_planning_process` — A StrategicPlanningProcess is a Process that targets a BusinessDivision and produces a PlanningArtifact.
- `syscall_invoked_by_event` — {X} is a designative information content entity that invoked by event {Y}
- `syscall_max_one_return` — {X} is a designative information content entity
- `syscall_only_in_kernel_subsystem` — {X} is a designative information content entity that in syscall subsystem {Y}
- `transformation_ends_at` — {X} is a process that ended at time {Y}
- `verification_min_one_evidence` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_allocation_at_run_id`](tables/t_allocation_at_run_id.sql) — realizes `allocation_at_run_id` · _shared with 6 other collection(s)_
- [`t_artifact_with_universal`](tables/t_artifact_with_universal.sql) — realizes `artifact_with_universal` · _shared with 11 other collection(s)_
- [`t_attestation_basic`](tables/t_attestation_basic.sql) — realizes `attestation_basic` · _shared with 8 other collection(s)_
- [`t_attribute_set_basic`](tables/t_attribute_set_basic.sql) — realizes `attribute_set_basic` · _shared with 6 other collection(s)_
- [`t_cardinality_exactly_one_generic`](tables/t_cardinality_exactly_one_generic.sql) — realizes `cardinality_exactly_one_generic` · _shared with 10 other collection(s)_
- [`t_cardinality_min_one_generic`](tables/t_cardinality_min_one_generic.sql) — realizes `cardinality_min_one_generic` · _shared with 6 other collection(s)_
- [`t_census_data_collection_process`](tables/t_census_data_collection_process.sql) — realizes `census_data_collection_process` · _shared with 8 other collection(s)_
- [`t_column_dropped_at_version`](tables/t_column_dropped_at_version.sql) — realizes `column_dropped_at_version` · _shared with 7 other collection(s)_
- [`t_column_property_subclass`](tables/t_column_property_subclass.sql) — realizes `column_property_subclass` · _shared with 6 other collection(s)_
- [`t_crop_parasitism_impact`](tables/t_crop_parasitism_impact.sql) — realizes `crop_parasitism_impact` · _shared with 9 other collection(s)_
- [`t_ebpf_event_min_one_attribute`](tables/t_ebpf_event_min_one_attribute.sql) — realizes `ebpf_event_min_one_attribute` · _shared with 6 other collection(s)_
- [`t_ebpf_event_observed_pid`](tables/t_ebpf_event_observed_pid.sql) — realizes `ebpf_event_observed_pid` · _shared with 9 other collection(s)_
- [`t_ebpf_event_subclass`](tables/t_ebpf_event_subclass.sql) — realizes `ebpf_event_subclass` · _shared with 3 other collection(s)_
- [`t_ebpfmap_with_key_type`](tables/t_ebpfmap_with_key_type.sql) — realizes `ebpfmap_with_key_type` · _shared with 7 other collection(s)_
- [`t_existential_anchored_to_artifact_via_part`](tables/t_existential_anchored_to_artifact_via_part.sql) — realizes `existential_anchored_to_artifact_via_part` · _shared with 12 other collection(s)_
- [`t_host_connection_process`](tables/t_host_connection_process.sql) — realizes `host_connection_process` · _shared with 8 other collection(s)_
- [`t_lineage_edge_via_transformation`](tables/t_lineage_edge_via_transformation.sql) — realizes `lineage_edge_via_transformation` · _shared with 11 other collection(s)_
- [`t_lineage_edge_with_provenance`](tables/t_lineage_edge_with_provenance.sql) — realizes `lineage_edge_with_provenance` · _shared with 7 other collection(s)_
- [`t_log_within_span_context`](tables/t_log_within_span_context.sql) — realizes `log_within_span_context` · _shared with 9 other collection(s)_
- [`t_process_min_one_output`](tables/t_process_min_one_output.sql) — realizes `process_min_one_output` · _shared with 7 other collection(s)_
- [`t_professional_experience`](tables/t_professional_experience.sql) — realizes `professional_experience` · _shared with 8 other collection(s)_
- [`t_professional_expertise_domain`](tables/t_professional_expertise_domain.sql) — realizes `professional_expertise_domain` · _shared with 7 other collection(s)_
- [`t_profile_has_cardinality`](tables/t_profile_has_cardinality.sql) — realizes `profile_has_cardinality` · _shared with 7 other collection(s)_
- [`t_profiling_basic`](tables/t_profiling_basic.sql) — realizes `profiling_basic` · _shared with 7 other collection(s)_
- [`t_profiling_with_method`](tables/t_profiling_with_method.sql) — realizes `profiling_with_method` · _shared with 9 other collection(s)_
- [`t_span_with_attribute`](tables/t_span_with_attribute.sql) — realizes `span_with_attribute` · _shared with 8 other collection(s)_
- [`t_strategic_planning_process`](tables/t_strategic_planning_process.sql) — realizes `strategic_planning_process` · _shared with 9 other collection(s)_
- [`t_syscall_invoked_by_event`](tables/t_syscall_invoked_by_event.sql) — realizes `syscall_invoked_by_event` · _shared with 7 other collection(s)_
- [`t_syscall_max_one_return`](tables/t_syscall_max_one_return.sql) — realizes `syscall_max_one_return` · _shared with 1 other collection(s)_
- [`t_syscall_only_in_kernel_subsystem`](tables/t_syscall_only_in_kernel_subsystem.sql) — realizes `syscall_only_in_kernel_subsystem` · _shared with 4 other collection(s)_
- [`t_transformation_ends_at`](tables/t_transformation_ends_at.sql) — realizes `transformation_ends_at` · _shared with 6 other collection(s)_
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence` · _shared with 2 other collection(s)_
