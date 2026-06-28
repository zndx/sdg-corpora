# Collection — topic 83 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **4 topics** (target + style) · **26 ontology terms** · **26 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 83: topic 109, topic 142, topic 184.

> **Topic gist** (representative FinePDFs text): FOR RELEASE November 14, 2013 FOR FURTHER INFORMATION ON THIS REPORT: Amy Mitchell,Director of Journalism Research Jesse Holcomb,Senior Researcher Dana Page,Communications Manager 202.419.4372 www.pewresearch.org PEW RESEARCH CENTER About This Report This is the latest in a multi-part research project by the Pew Research Center and The John S. and the James L. Knight foundation examining ... …

## Chapters

- [ch_live_annotation_only_about_artifact_55d3b1](chapters/ch_live_annotation_only_about_artifact_55d3b1.md)
- [ch_live_apolitical_islam_c7f8ac](chapters/ch_live_apolitical_islam_c7f8ac.md)
- [ch_live_campus_event_participation_9801c0](chapters/ch_live_campus_event_participation_9801c0.md)
- [ch_live_claim_governed_by_directive_725475](chapters/ch_live_claim_governed_by_directive_725475.md)
- [ch_live_dempster_conflict_mass_153e41](chapters/ch_live_dempster_conflict_mass_153e41.md)
- [ch_live_dempster_conflict_mass_38a6c1](chapters/ch_live_dempster_conflict_mass_38a6c1.md)
- [ch_live_dempster_conflict_mass_951aff](chapters/ch_live_dempster_conflict_mass_951aff.md)
- [ch_live_ebpfmap_with_value_type_a142b2](chapters/ch_live_ebpfmap_with_value_type_a142b2.md)
- [ch_live_instrument_subclass_d1f420](chapters/ch_live_instrument_subclass_d1f420.md)
- [ch_live_policy_constrains_only_artifact_9bd065](chapters/ch_live_policy_constrains_only_artifact_9bd065.md)
- [ch_live_syscall_governed_by_directive_455fab](chapters/ch_live_syscall_governed_by_directive_455fab.md)
- [ch_live_syscall_governed_by_directive_d2e867](chapters/ch_live_syscall_governed_by_directive_d2e867.md)

## Ontology terms grounding this collection

- `annotation_only_about_artifact` — {X} is a descriptive information content entity
- `apolitical_islam` — An ApoliticalIslam is a DoctrinalNarrative that is not a PoliticalIslamStance.
- `belief_interval_equiv_bel_and_pl` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasBeliefLowerBound some {Y:Class}) and (sdg:hasPlausibilityU
- `belief_interval_only_unit_range` — {X} is a descriptive information content entity that has belief lower bound {Y}
- `campus_event_participation` — A CampusEvent is an occurrent that has participant some ParticipantGroup.
- `claim_governed_by_directive` — {X} is a descriptive information content entity that governed by directive information content entity
- `column_pair_subject` — {X} is a descriptive information content entity that has subject column {Y}
- `dempster_combinant_second` — {X} is a descriptive information content entity that has second combinant {Y}
- `dempster_conflict_mass` — {X} is a descriptive information content entity that has conflict mass {Y}
- `dengue_transmission_process` — A DengueTransmissionProcess is a BFO process that involves a HumanPopulation via sdg:involvesHost and an AedesAegyptiVec
- `descriptive_either_evidence_or_claim` — {X} is equivalent to descriptive information content entity and {Y} or {Z}
- `ebpfmap_with_value_type` — {X} is an artifact that has value type map {Y}
- `ebpfprogram_observes_syscall` — {X} is an artifact that observes syscall {Y}
- `ice_subclass_with_part` — {X} is an information content entity that has part information content entity
- `indoor_air_quality_action_plan` — An IndoorAirQualityActionPlan is a DirectiveICE that targets IndoorAirPollution and is verified by a HealthOutcomeMetric
- `instrument_subclass` — {X} is an artifact that produces measurement {Y}
- `kernel_event_with_comm` — {X} is a process that with process comm {Y}
- `knowledge_base_integration` — A KnowledgeBaseIntegration is an InformationContentEntity that incorporatesIndigenousKnowledge some IndigenousKnowledgeB
- `pdsa_improvement_model` — A PDSAImprovementModel is a Process that improves some ClinicalCare and optimizes some PatientOutcome.
- `policy_constrains_only_artifact` — {X} is a directive information content entity
- `radicalization_process` — A RadicalizationProcess is a Process that involves some AffiliatedOrganization.
- `requirement_basic` — {X} is a directive information content entity
- `schemaorg_person_roleat` — {X} is an artifact that has role at {Y}
- `syscall_governed_by_directive` — {X} is a designative information content entity that governed by directive information content entity
- `trace_with_service_name` — {X} is an artifact that has service name {Y}
- `training_partnership_development` — A TrainingPartnershipDevelopment is a Process that participatesIn some EducationalInstitution.

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_annotation_only_about_artifact`](tables/t_annotation_only_about_artifact.sql) — realizes `annotation_only_about_artifact` · _shared with 8 other collection(s)_
- [`t_apolitical_islam`](tables/t_apolitical_islam.sql) — realizes `apolitical_islam` · _shared with 11 other collection(s)_
- [`t_belief_interval_equiv_bel_and_pl`](tables/t_belief_interval_equiv_bel_and_pl.sql) — realizes `belief_interval_equiv_bel_and_pl` · _shared with 13 other collection(s)_
- [`t_belief_interval_only_unit_range`](tables/t_belief_interval_only_unit_range.sql) — realizes `belief_interval_only_unit_range` · _shared with 5 other collection(s)_
- [`t_campus_event_participation`](tables/t_campus_event_participation.sql) — realizes `campus_event_participation` · _shared with 8 other collection(s)_
- [`t_claim_governed_by_directive`](tables/t_claim_governed_by_directive.sql) — realizes `claim_governed_by_directive` · _shared with 5 other collection(s)_
- [`t_column_pair_subject`](tables/t_column_pair_subject.sql) — realizes `column_pair_subject` · _shared with 9 other collection(s)_
- [`t_dempster_combinant_second`](tables/t_dempster_combinant_second.sql) — realizes `dempster_combinant_second` · _shared with 7 other collection(s)_
- [`t_dempster_conflict_mass`](tables/t_dempster_conflict_mass.sql) — realizes `dempster_conflict_mass` · _shared with 5 other collection(s)_
- [`t_dengue_transmission_process`](tables/t_dengue_transmission_process.sql) — realizes `dengue_transmission_process` · _shared with 9 other collection(s)_
- [`t_descriptive_either_evidence_or_claim`](tables/t_descriptive_either_evidence_or_claim.sql) — realizes `descriptive_either_evidence_or_claim` · _shared with 8 other collection(s)_
- [`t_ebpfmap_with_value_type`](tables/t_ebpfmap_with_value_type.sql) — realizes `ebpfmap_with_value_type` · _shared with 5 other collection(s)_
- [`t_ebpfprogram_observes_syscall`](tables/t_ebpfprogram_observes_syscall.sql) — realizes `ebpfprogram_observes_syscall` · _shared with 4 other collection(s)_
- [`t_ice_subclass_with_part`](tables/t_ice_subclass_with_part.sql) — realizes `ice_subclass_with_part` · _shared with 9 other collection(s)_
- [`t_indoor_air_quality_action_plan`](tables/t_indoor_air_quality_action_plan.sql) — realizes `indoor_air_quality_action_plan` · _shared with 6 other collection(s)_
- [`t_instrument_subclass`](tables/t_instrument_subclass.sql) — realizes `instrument_subclass` · _shared with 7 other collection(s)_
- [`t_kernel_event_with_comm`](tables/t_kernel_event_with_comm.sql) — realizes `kernel_event_with_comm` · _shared with 6 other collection(s)_
- [`t_knowledge_base_integration`](tables/t_knowledge_base_integration.sql) — realizes `knowledge_base_integration` · _shared with 6 other collection(s)_
- [`t_pdsa_improvement_model`](tables/t_pdsa_improvement_model.sql) — realizes `pdsa_improvement_model` · _shared with 10 other collection(s)_
- [`t_policy_constrains_only_artifact`](tables/t_policy_constrains_only_artifact.sql) — realizes `policy_constrains_only_artifact` · _shared with 9 other collection(s)_
- [`t_radicalization_process`](tables/t_radicalization_process.sql) — realizes `radicalization_process` · _shared with 11 other collection(s)_
- [`t_requirement_basic`](tables/t_requirement_basic.sql) — realizes `requirement_basic` · _shared with 6 other collection(s)_
- [`t_schemaorg_person_roleat`](tables/t_schemaorg_person_roleat.sql) — realizes `schemaorg_person_roleat` · _shared with 7 other collection(s)_
- [`t_syscall_governed_by_directive`](tables/t_syscall_governed_by_directive.sql) — realizes `syscall_governed_by_directive` · _shared with 6 other collection(s)_
- [`t_trace_with_service_name`](tables/t_trace_with_service_name.sql) — realizes `trace_with_service_name` · _shared with 7 other collection(s)_
- [`t_training_partnership_development`](tables/t_training_partnership_development.sql) — realizes `training_partnership_development` · _shared with 7 other collection(s)_
