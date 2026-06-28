# Collection — topic 36 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **17 topics** (target + style) · **29 ontology terms** · **29 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 36: topic 41, topic 45, topic 49, topic 52, topic 53, topic 54, topic 60, topic 62, topic 91, topic 125, topic 126, topic 137, topic 169, topic 181, topic 185, topic 191.

> **Topic gist** (representative FinePDFs text): REDUCING SILICA CONTENT IN RICE HUSK BY DECANTATION METHODS Master thesis for Sustainable Biotechnology Maria Candelaria Dorta Delgado Main supervisor: Mette Lübeck Co-supervisor: Yohanna Cabrera Orozco Collaborator: Andrés Cabrera Orozco Acknowledgments Throughout the writing of this thesis, I have received incredible support from many people, and I would like to express my gratitude to a... …

## Chapters

- [ch_live_aggregation_over_time_window_eb62e0](chapters/ch_live_aggregation_over_time_window_eb62e0.md)
- [ch_live_census_reporting_event_e6e188](chapters/ch_live_census_reporting_event_e6e188.md)
- [ch_live_claim_observed_by_event_374c19](chapters/ch_live_claim_observed_by_event_374c19.md)
- [ch_live_column_lineage_describes_pair_da1c6c](chapters/ch_live_column_lineage_describes_pair_da1c6c.md)
- [ch_live_existential_with_part_of_100255](chapters/ch_live_existential_with_part_of_100255.md)
- [ch_live_pdsa_improvement_model_de0ae4](chapters/ch_live_pdsa_improvement_model_de0ae4.md)
- [ch_live_process_produces_ice_3383ce](chapters/ch_live_process_produces_ice_3383ce.md)
- [ch_live_process_produces_ice_840573](chapters/ch_live_process_produces_ice_840573.md)
- [ch_live_process_produces_ice_ad2270](chapters/ch_live_process_produces_ice_ad2270.md)
- [ch_live_process_with_participant_203f59](chapters/ch_live_process_with_participant_203f59.md)
- [ch_live_shell_dimension_specification_6d88ff](chapters/ch_live_shell_dimension_specification_6d88ff.md)
- [ch_live_table_provenance_source_5137b3](chapters/ch_live_table_provenance_source_5137b3.md)
- [ch_live_training_partnership_development_667cb2](chapters/ch_live_training_partnership_development_667cb2.md)

## Ontology terms grounding this collection

- `aggregation_over_time_window` — {X} is a descriptive information content entity that over time window {Y}
- `attestation_signed_by` — {X} is a process that signed by person
- `attribute_set_supports_outlier_claim` — {X} is a descriptive information content entity that supports {Y}
- `breaking_change_subclass` — {X} is a descriptive information content entity that breaking change for {Y}
- `census_reporting_event` — A CensusReportingEvent is an InformationContentEntity that occurs during a CensusPeriod, tracks a SocialEnterpriseSector
- `claim_observed_by_event` — {X} is a descriptive information content entity
- `column_lineage_describes_pair` — {X} is a descriptive information content entity that from column {Y}
- `constraint_with_violation_consequence` — {X} is a directive information content entity that on violation {Z}
- `control_equiv_implements_with_owner` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:implements some {Y:Class}) and (sdg:hasOwner some cco:Person)
- `ebpfmap_used_by_program` — {X} is an artifact that used by program {Y}
- `entity_type_belongs_to` — {X} is a descriptive information content entity that entity type belongs to {Y}
- `existential_with_part_of` — {X} is something that part of {Y}
- `measurement_of_artifact` — {X} is a descriptive information content entity
- `pdsa_improvement_model` — A PDSAImprovementModel is a Process that improves some ClinicalCare and optimizes some PatientOutcome.
- `process_max_one_operator` — {X} is a process
- `process_produces_ice` — {X} is a process that produces information content entity
- `process_uses_artifact` — {X} is a process that uses artifact
- `process_with_min_one_artifact` — {X} is a process
- `process_with_participant` — {X} is a process that {p} {Y}
- `requirement_under_standard` — {X} is a directive information content entity that under standard {Y}
- `schemaorg_creativework_publisher` — {X} is an artifact that has publisher {Y}
- `schemaorg_place_longitude` — {X} is an artifact that has longitude {Y}
- `shell_dimension_specification` — ShellDimensionSpecification is a descriptive information content entity with exactly one decimal dimension value.
- `social_enterprise_annual_income` — A SocialEnterpriseAnnualIncome is a DescriptiveICE that has an AnnualIncomeValue of type decimal.
- `student_privacy_expectation` — StudentPrivacyExpectation is a DescriptiveICE that appliesTo some ProtectedLocation.
- `table_provenance_source` — {X} is a descriptive information content entity that sourced from table {Y}
- `training_partnership_development` — A TrainingPartnershipDevelopment is a Process that participatesIn some EducationalInstitution.
- `transformation_with_input_dataset` — {X} is a process that has input dataset {Y}
- `xdp_action_drop` — {X} is an artifact that has xdpaction {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_aggregation_over_time_window`](tables/t_aggregation_over_time_window.sql) — realizes `aggregation_over_time_window` · _shared with 10 other collection(s)_
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 5 other collection(s)_
- [`t_attribute_set_supports_outlier_claim`](tables/t_attribute_set_supports_outlier_claim.sql) — realizes `attribute_set_supports_outlier_claim` · _shared with 9 other collection(s)_
- [`t_breaking_change_subclass`](tables/t_breaking_change_subclass.sql) — realizes `breaking_change_subclass` · _shared with 4 other collection(s)_
- [`t_census_reporting_event`](tables/t_census_reporting_event.sql) — realizes `census_reporting_event` · _shared with 11 other collection(s)_
- [`t_claim_observed_by_event`](tables/t_claim_observed_by_event.sql) — realizes `claim_observed_by_event` · _shared with 11 other collection(s)_
- [`t_column_lineage_describes_pair`](tables/t_column_lineage_describes_pair.sql) — realizes `column_lineage_describes_pair`
- [`t_constraint_with_violation_consequence`](tables/t_constraint_with_violation_consequence.sql) — realizes `constraint_with_violation_consequence` · _shared with 8 other collection(s)_
- [`t_control_equiv_implements_with_owner`](tables/t_control_equiv_implements_with_owner.sql) — realizes `control_equiv_implements_with_owner` · _shared with 4 other collection(s)_
- [`t_ebpfmap_used_by_program`](tables/t_ebpfmap_used_by_program.sql) — realizes `ebpfmap_used_by_program` · _shared with 5 other collection(s)_
- [`t_entity_type_belongs_to`](tables/t_entity_type_belongs_to.sql) — realizes `entity_type_belongs_to` · _shared with 9 other collection(s)_
- [`t_existential_with_part_of`](tables/t_existential_with_part_of.sql) — realizes `existential_with_part_of` · _shared with 8 other collection(s)_
- [`t_measurement_of_artifact`](tables/t_measurement_of_artifact.sql) — realizes `measurement_of_artifact` · _shared with 9 other collection(s)_
- [`t_pdsa_improvement_model`](tables/t_pdsa_improvement_model.sql) — realizes `pdsa_improvement_model` · _shared with 10 other collection(s)_
- [`t_process_max_one_operator`](tables/t_process_max_one_operator.sql) — realizes `process_max_one_operator` · _shared with 4 other collection(s)_
- [`t_process_produces_ice`](tables/t_process_produces_ice.sql) — realizes `process_produces_ice` · _shared with 3 other collection(s)_
- [`t_process_uses_artifact`](tables/t_process_uses_artifact.sql) — realizes `process_uses_artifact` · _shared with 5 other collection(s)_
- [`t_process_with_min_one_artifact`](tables/t_process_with_min_one_artifact.sql) — realizes `process_with_min_one_artifact` · _shared with 3 other collection(s)_
- [`t_process_with_participant`](tables/t_process_with_participant.sql) — realizes `process_with_participant` · _shared with 10 other collection(s)_
- [`t_requirement_under_standard`](tables/t_requirement_under_standard.sql) — realizes `requirement_under_standard` · _shared with 7 other collection(s)_
- [`t_schemaorg_creativework_publisher`](tables/t_schemaorg_creativework_publisher.sql) — realizes `schemaorg_creativework_publisher` · _shared with 7 other collection(s)_
- [`t_schemaorg_place_longitude`](tables/t_schemaorg_place_longitude.sql) — realizes `schemaorg_place_longitude` · _shared with 8 other collection(s)_
- [`t_shell_dimension_specification`](tables/t_shell_dimension_specification.sql) — realizes `shell_dimension_specification` · _shared with 12 other collection(s)_
- [`t_social_enterprise_annual_income`](tables/t_social_enterprise_annual_income.sql) — realizes `social_enterprise_annual_income` · _shared with 5 other collection(s)_
- [`t_student_privacy_expectation`](tables/t_student_privacy_expectation.sql) — realizes `student_privacy_expectation` · _shared with 10 other collection(s)_
- [`t_table_provenance_source`](tables/t_table_provenance_source.sql) — realizes `table_provenance_source` · _shared with 2 other collection(s)_
- [`t_training_partnership_development`](tables/t_training_partnership_development.sql) — realizes `training_partnership_development` · _shared with 7 other collection(s)_
- [`t_transformation_with_input_dataset`](tables/t_transformation_with_input_dataset.sql) — realizes `transformation_with_input_dataset` · _shared with 3 other collection(s)_
- [`t_xdp_action_drop`](tables/t_xdp_action_drop.sql) — realizes `xdp_action_drop` · _shared with 9 other collection(s)_
