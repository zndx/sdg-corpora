# Collection — topic 41 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **15 chapters** · **15 topics** (target + style) · **30 ontology terms** · **30 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 41: topic 10, topic 45, topic 52, topic 78, topic 79, topic 80, topic 105, topic 140, topic 143, topic 148, topic 155, topic 168, topic 178, topic 181.

> **Topic gist** (representative FinePDFs text): Interfaces in Inorganic Matrix Composites: Atomistic Simulation and Experiment J. Megusar, S. Yip, J.A. Cornie, B.V. Chambers, A. Isik, M. Tang, and C.S. Yoon Materials Processing Center Massachusetts Institute of Technology Cambridge, MA 02139 Air Force Office of Scientific Research Directorate of Aerospace and Materials Sciences 110 Duncan Ave, Suite B115 Bolling AFB DC 20332-0001 AFOSR/NA At... …

## Chapters

- [ch_live_artifact_has_id_074b30](chapters/ch_live_artifact_has_id_074b30.md)
- [ch_live_bpf_helper_subclass_920eee](chapters/ch_live_bpf_helper_subclass_920eee.md)
- [ch_live_breaking_change_subclass_405df1](chapters/ch_live_breaking_change_subclass_405df1.md)
- [ch_live_breaking_change_subclass_65c1a4](chapters/ch_live_breaking_change_subclass_65c1a4.md)
- [ch_live_breaking_change_subclass_7ab293](chapters/ch_live_breaking_change_subclass_7ab293.md)
- [ch_live_classification_subclass_9c4b1d](chapters/ch_live_classification_subclass_9c4b1d.md)
- [ch_live_column_lineage_for_compliance_claim_d8efe9](chapters/ch_live_column_lineage_for_compliance_claim_d8efe9.md)
- [ch_live_nist80053_low_impact_ae0436](chapters/ch_live_nist80053_low_impact_ae0436.md)
- [ch_live_nist80053_moderate_impact_57415c](chapters/ch_live_nist80053_moderate_impact_57415c.md)
- [ch_live_nonbreaking_change_subclass_be3e9a](chapters/ch_live_nonbreaking_change_subclass_be3e9a.md)
- [ch_live_nonbreaking_change_subclass_ed1c8b](chapters/ch_live_nonbreaking_change_subclass_ed1c8b.md)
- [ch_live_policy_subclass_fb6fcf](chapters/ch_live_policy_subclass_fb6fcf.md)
- [ch_live_process_either_started_or_completed_10a3b2](chapters/ch_live_process_either_started_or_completed_10a3b2.md)
- [ch_live_syscall_audited_by_43eb9f](chapters/ch_live_syscall_audited_by_43eb9f.md)
- [ch_live_telemetry_span_observes_syscall_44794d](chapters/ch_live_telemetry_span_observes_syscall_44794d.md)

## Ontology terms grounding this collection

- `artifact_has_id` — {X} is an artifact that has identifier designative information content entity
- `bpf_helper_subclass` — {X} is an artifact that has bpfhelper function {Y}
- `breaking_change_subclass` — {X} is a descriptive information content entity that breaking change for {Y}
- `bullying_response_process` — A BullyingResponseProcess is an Occurrent that has a participant who is a SchoolStaffRole.
- `classification_subclass` — {X} is a process that classifies artifact artifact
- `column_lineage_for_compliance_claim` — {X} is an artifact that supports claim descriptive information content entity
- `ebpfprogram_equiv_typed_with_hook` — Class: {X:Class} EquivalentTo: cco:Artifact and (sdg:hasProgramType some {Y:Class}) and (sdg:attachesToHook some {Z:Clas
- `entomological_surveillance_record` — An EntomologicalSurveillanceRecord is a BFO continuant that realizes a VectorSpeciesIdentification via sdg:realizes and 
- `identifier_uniquely_identifies` — {X} is a designative information content entity
- `kernel_anomaly_supports_claim` — {X} is an artifact that supports claim descriptive information content entity
- `kernel_event_with_tid` — {X} is a process that with thread id {Y}
- `kernelhook_only_kprobe` — {X} is an artifact that has hook kind {Y}
- `lineage_governed_by_directive` — {X} is a descriptive information content entity that governed by directive information content entity
- `log_record_subclass` — {X} is an artifact that has log severity {Y}
- `nist80053_low_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `nist80053_moderate_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `nonbreaking_change_subclass` — {X} is a descriptive information content entity that non breaking change for {Y}
- `outlier_claim_supported_by_lift` — {X} is a descriptive information content entity that has attribute set {Z}
- `policy_subclass` — {X} is a directive information content entity that governs {Y}
- `process_either_started_or_completed` — {X} is equivalent to process and {Y} or {Z}
- `schemaorg_event_location` — {X} is an artifact that has event location {Y}
- `storage_structure_composition` — A StorageStructureComposition is a Material Entity that comprises exactly one DatabaseContainer.
- `subclass_not_basic` — {X} is not {Y}
- `survey_response_record` — SurveyResponseRecord is a subclass of cco:InformationContentEntity that captures at least one ResearcherProfileAttribute
- `syscall_audited_by` — {X} is a designative information content entity
- `telemetry_span_observes_syscall` — {X} is a process that observes syscall designative information content entity
- `transformation_associated_with_agent` — {X} is a process that was associated with {Y}
- `transformation_informed_by` — {X} is a process that informed by {Y}
- `transformation_only_uses_datasets` — {X} is a process that uses entity {Y}
- `verification_basic` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_artifact_has_id`](tables/t_artifact_has_id.sql) — realizes `artifact_has_id` · _shared with 1 other collection(s)_
- [`t_bpf_helper_subclass`](tables/t_bpf_helper_subclass.sql) — realizes `bpf_helper_subclass` · _shared with 3 other collection(s)_
- [`t_breaking_change_subclass`](tables/t_breaking_change_subclass.sql) — realizes `breaking_change_subclass` · _shared with 4 other collection(s)_
- [`t_bullying_response_process`](tables/t_bullying_response_process.sql) — realizes `bullying_response_process` · _shared with 5 other collection(s)_
- [`t_classification_subclass`](tables/t_classification_subclass.sql) — realizes `classification_subclass` · _shared with 3 other collection(s)_
- [`t_column_lineage_for_compliance_claim`](tables/t_column_lineage_for_compliance_claim.sql) — realizes `column_lineage_for_compliance_claim` · _shared with 2 other collection(s)_
- [`t_ebpfprogram_equiv_typed_with_hook`](tables/t_ebpfprogram_equiv_typed_with_hook.sql) — realizes `ebpfprogram_equiv_typed_with_hook` · _shared with 6 other collection(s)_
- [`t_entomological_surveillance_record`](tables/t_entomological_surveillance_record.sql) — realizes `entomological_surveillance_record` · _shared with 5 other collection(s)_
- [`t_identifier_uniquely_identifies`](tables/t_identifier_uniquely_identifies.sql) — realizes `identifier_uniquely_identifies` · _shared with 8 other collection(s)_
- [`t_kernel_anomaly_supports_claim`](tables/t_kernel_anomaly_supports_claim.sql) — realizes `kernel_anomaly_supports_claim` · _shared with 4 other collection(s)_
- [`t_kernel_event_with_tid`](tables/t_kernel_event_with_tid.sql) — realizes `kernel_event_with_tid` · _shared with 5 other collection(s)_
- [`t_kernelhook_only_kprobe`](tables/t_kernelhook_only_kprobe.sql) — realizes `kernelhook_only_kprobe` · _shared with 3 other collection(s)_
- [`t_lineage_governed_by_directive`](tables/t_lineage_governed_by_directive.sql) — realizes `lineage_governed_by_directive` · _shared with 8 other collection(s)_
- [`t_log_record_subclass`](tables/t_log_record_subclass.sql) — realizes `log_record_subclass` · _shared with 9 other collection(s)_
- [`t_nist80053_low_impact`](tables/t_nist80053_low_impact.sql) — realizes `nist80053_low_impact` · _shared with 6 other collection(s)_
- [`t_nist80053_moderate_impact`](tables/t_nist80053_moderate_impact.sql) — realizes `nist80053_moderate_impact` · _shared with 11 other collection(s)_
- [`t_nonbreaking_change_subclass`](tables/t_nonbreaking_change_subclass.sql) — realizes `nonbreaking_change_subclass` · _shared with 2 other collection(s)_
- [`t_outlier_claim_supported_by_lift`](tables/t_outlier_claim_supported_by_lift.sql) — realizes `outlier_claim_supported_by_lift` · _shared with 8 other collection(s)_
- [`t_policy_subclass`](tables/t_policy_subclass.sql) — realizes `policy_subclass` · _shared with 9 other collection(s)_
- [`t_process_either_started_or_completed`](tables/t_process_either_started_or_completed.sql) — realizes `process_either_started_or_completed` · _shared with 7 other collection(s)_
- [`t_schemaorg_event_location`](tables/t_schemaorg_event_location.sql) — realizes `schemaorg_event_location` · _shared with 10 other collection(s)_
- [`t_storage_structure_composition`](tables/t_storage_structure_composition.sql) — realizes `storage_structure_composition` · _shared with 8 other collection(s)_
- [`t_subclass_not_basic`](tables/t_subclass_not_basic.sql) — realizes `subclass_not_basic` · _shared with 11 other collection(s)_
- [`t_survey_response_record`](tables/t_survey_response_record.sql) — realizes `survey_response_record` · _shared with 10 other collection(s)_
- [`t_syscall_audited_by`](tables/t_syscall_audited_by.sql) — realizes `syscall_audited_by` · _shared with 3 other collection(s)_
- [`t_telemetry_span_observes_syscall`](tables/t_telemetry_span_observes_syscall.sql) — realizes `telemetry_span_observes_syscall` · _shared with 7 other collection(s)_
- [`t_transformation_associated_with_agent`](tables/t_transformation_associated_with_agent.sql) — realizes `transformation_associated_with_agent` · _shared with 8 other collection(s)_
- [`t_transformation_informed_by`](tables/t_transformation_informed_by.sql) — realizes `transformation_informed_by` · _shared with 4 other collection(s)_
- [`t_transformation_only_uses_datasets`](tables/t_transformation_only_uses_datasets.sql) — realizes `transformation_only_uses_datasets` · _shared with 8 other collection(s)_
- [`t_verification_basic`](tables/t_verification_basic.sql) — realizes `verification_basic` · _shared with 12 other collection(s)_
