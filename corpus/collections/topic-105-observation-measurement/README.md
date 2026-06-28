# Collection — topic 105 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **14 chapters** · **9 topics** (target + style) · **31 ontology terms** · **31 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 105: topic 120, topic 140, topic 142, topic 156, topic 162, topic 178, topic 181, topic 183.

> **Topic gist** (representative FinePDFs text): William K. Honker, Chief RCRA Permits Branch U. S. Environmental Protection Agency Region 6 1445 Ross Ave., Suite 1200 Dallas, Texas 75202-2733 RE: Response to Notice of Deficiency (NOD) for OU 1082 RCRA Facility Investigation (RFI) Work Plan Dear Mr. Honker: Enclosed is the response to the NOD for the OU 1082 RFI Work Plan which was submitted to your office for review on July 16, 1993. Environ... …

## Chapters

- [ch_live_classification_subclass_377549](chapters/ch_live_classification_subclass_377549.md)
- [ch_live_classification_subclass_653441](chapters/ch_live_classification_subclass_653441.md)
- [ch_live_classification_subclass_67d4a3](chapters/ch_live_classification_subclass_67d4a3.md)
- [ch_live_classification_subclass_df41f5](chapters/ch_live_classification_subclass_df41f5.md)
- [ch_live_dataset_under_audit_384ccc](chapters/ch_live_dataset_under_audit_384ccc.md)
- [ch_live_evidence_subclass_44a6df](chapters/ch_live_evidence_subclass_44a6df.md)
- [ch_live_outlier_claim_against_baseline_ee030c](chapters/ch_live_outlier_claim_against_baseline_ee030c.md)
- [ch_live_plausibility_function_for_49abaa](chapters/ch_live_plausibility_function_for_49abaa.md)
- [ch_live_port_isolation_measurement_adab3e](chapters/ch_live_port_isolation_measurement_adab3e.md)
- [ch_live_requirement_traces_to_b29483](chapters/ch_live_requirement_traces_to_b29483.md)
- [ch_live_schemaorg_event_starttime_e2dcf5](chapters/ch_live_schemaorg_event_starttime_e2dcf5.md)
- [ch_live_shell_dimension_specification_fcd64d](chapters/ch_live_shell_dimension_specification_fcd64d.md)
- [ch_live_verification_targets_artifact_14a691](chapters/ch_live_verification_targets_artifact_14a691.md)
- [ch_live_verification_targets_artifact_20f485](chapters/ch_live_verification_targets_artifact_20f485.md)

## Ontology terms grounding this collection

- `allocation_completed_at` — {X} is a process that completed at {Y}
- `allocation_subclass` — {X} is a process that executes transformation {Y}
- `annotation_classifies_class` — {X} is a descriptive information content entity that classifies {Y}
- `artifact_either_active_or_archived` — {X} is equivalent to artifact and {Y} or {Z}
- `belief_interval_exactly_two_bounds` — {X} is a descriptive information content entity
- `bullying_response_process` — A BullyingResponseProcess is an Occurrent that has a participant who is a SchoolStaffRole.
- `claim_basic` — {X} is a descriptive information content entity
- `classification_subclass` — {X} is a process that classifies artifact artifact
- `constraint_with_predicate` — {X} is a directive information content entity that has predicate {Y}
- `constraint_with_severity_classification` — {X} is a directive information content entity that has severity {Y}
- `dataset_under_audit` — {X} is an artifact that under audit process
- `dempster_combinant_first` — {X} is a descriptive information content entity that has first combinant {Y}
- `ebpfevent_via_program_xref` — {X} is a process that via program artifact
- `ebpfmap_equiv_kv_typed` — Class: {X:Class} EquivalentTo: cco:Artifact and (sdg:hasKeyType some {Y:Class}) and (sdg:hasValueTypeMap some {Z:Class})
- `evidence_subclass` — {X} is a descriptive information content entity that supports claim {Y}
- `executive_leadership_role` — An ExecutiveLeadershipRole is a Role that reports exactly one ChiefExecutiveOfficerRole and is a member of some Executiv
- `lineage_edge_via_transformation` — {X} is a descriptive information content entity that via transformation {Y}
- `measurement_with_precision` — {X} is a descriptive information content entity that has precision {Y}
- `outlier_claim_against_baseline` — {X} is a descriptive information content entity that against {Y}
- `patient_insurance_record` — PatientInsuranceRecord is an information content entity containing at least one InsuranceInformationItem.
- `plausibility_function_for` — {X} is a descriptive information content entity that plausibility for claim {Y}
- `port_isolation_measurement` — A PortIsolationMeasurement is an InformationContentEntity that measures a PortPair, depends on an ImpedanceTermination, 
- `professional_expertise_domain` — A ProfessionalExpertiseDomain is a DescriptiveICE that covers some IndustrySector and provides some ServiceType.
- `requirement_traces_to` — {X} is a directive information content entity that traces to {Y}
- `schemaorg_event_starttime` — {X} is an artifact that has event start time {Y}
- `shell_dimension_specification` — ShellDimensionSpecification is a descriptive information content entity with exactly one decimal dimension value.
- `subclass_to_process` — {X} is a process
- `syscall_invoked_by_event` — {X} is a designative information content entity that invoked by event {Y}
- `verification_basic` — {X} is a process
- `verification_targets_artifact` — {X} is a process that targets artifact {Y}
- `xdp_action_pass` — {X} is an artifact that has xdpaction {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_allocation_completed_at`](tables/t_allocation_completed_at.sql) — realizes `allocation_completed_at` · _shared with 8 other collection(s)_
- [`t_allocation_subclass`](tables/t_allocation_subclass.sql) — realizes `allocation_subclass` · _shared with 12 other collection(s)_
- [`t_annotation_classifies_class`](tables/t_annotation_classifies_class.sql) — realizes `annotation_classifies_class` · _shared with 7 other collection(s)_
- [`t_artifact_either_active_or_archived`](tables/t_artifact_either_active_or_archived.sql) — realizes `artifact_either_active_or_archived` · _shared with 7 other collection(s)_
- [`t_belief_interval_exactly_two_bounds`](tables/t_belief_interval_exactly_two_bounds.sql) — realizes `belief_interval_exactly_two_bounds` · _shared with 6 other collection(s)_
- [`t_bullying_response_process`](tables/t_bullying_response_process.sql) — realizes `bullying_response_process` · _shared with 5 other collection(s)_
- [`t_claim_basic`](tables/t_claim_basic.sql) — realizes `claim_basic` · _shared with 15 other collection(s)_
- [`t_classification_subclass`](tables/t_classification_subclass.sql) — realizes `classification_subclass` · _shared with 3 other collection(s)_
- [`t_constraint_with_predicate`](tables/t_constraint_with_predicate.sql) — realizes `constraint_with_predicate` · _shared with 8 other collection(s)_
- [`t_constraint_with_severity_classification`](tables/t_constraint_with_severity_classification.sql) — realizes `constraint_with_severity_classification` · _shared with 5 other collection(s)_
- [`t_dataset_under_audit`](tables/t_dataset_under_audit.sql) — realizes `dataset_under_audit` · _shared with 1 other collection(s)_
- [`t_dempster_combinant_first`](tables/t_dempster_combinant_first.sql) — realizes `dempster_combinant_first` · _shared with 8 other collection(s)_
- [`t_ebpfevent_via_program_xref`](tables/t_ebpfevent_via_program_xref.sql) — realizes `ebpfevent_via_program_xref` · _shared with 7 other collection(s)_
- [`t_ebpfmap_equiv_kv_typed`](tables/t_ebpfmap_equiv_kv_typed.sql) — realizes `ebpfmap_equiv_kv_typed` · _shared with 8 other collection(s)_
- [`t_evidence_subclass`](tables/t_evidence_subclass.sql) — realizes `evidence_subclass` · _shared with 4 other collection(s)_
- [`t_executive_leadership_role`](tables/t_executive_leadership_role.sql) — realizes `executive_leadership_role` · _shared with 4 other collection(s)_
- [`t_lineage_edge_via_transformation`](tables/t_lineage_edge_via_transformation.sql) — realizes `lineage_edge_via_transformation` · _shared with 11 other collection(s)_
- [`t_measurement_with_precision`](tables/t_measurement_with_precision.sql) — realizes `measurement_with_precision` · _shared with 5 other collection(s)_
- [`t_outlier_claim_against_baseline`](tables/t_outlier_claim_against_baseline.sql) — realizes `outlier_claim_against_baseline` · _shared with 5 other collection(s)_
- [`t_patient_insurance_record`](tables/t_patient_insurance_record.sql) — realizes `patient_insurance_record` · _shared with 9 other collection(s)_
- [`t_plausibility_function_for`](tables/t_plausibility_function_for.sql) — realizes `plausibility_function_for` · _shared with 8 other collection(s)_
- [`t_port_isolation_measurement`](tables/t_port_isolation_measurement.sql) — realizes `port_isolation_measurement` · _shared with 5 other collection(s)_
- [`t_professional_expertise_domain`](tables/t_professional_expertise_domain.sql) — realizes `professional_expertise_domain` · _shared with 7 other collection(s)_
- [`t_requirement_traces_to`](tables/t_requirement_traces_to.sql) — realizes `requirement_traces_to` · _shared with 15 other collection(s)_
- [`t_schemaorg_event_starttime`](tables/t_schemaorg_event_starttime.sql) — realizes `schemaorg_event_starttime` · _shared with 10 other collection(s)_
- [`t_shell_dimension_specification`](tables/t_shell_dimension_specification.sql) — realizes `shell_dimension_specification` · _shared with 12 other collection(s)_
- [`t_subclass_to_process`](tables/t_subclass_to_process.sql) — realizes `subclass_to_process` · _shared with 13 other collection(s)_
- [`t_syscall_invoked_by_event`](tables/t_syscall_invoked_by_event.sql) — realizes `syscall_invoked_by_event` · _shared with 7 other collection(s)_
- [`t_verification_basic`](tables/t_verification_basic.sql) — realizes `verification_basic` · _shared with 12 other collection(s)_
- [`t_verification_targets_artifact`](tables/t_verification_targets_artifact.sql) — realizes `verification_targets_artifact` · _shared with 7 other collection(s)_
- [`t_xdp_action_pass`](tables/t_xdp_action_pass.sql) — realizes `xdp_action_pass` · _shared with 8 other collection(s)_
