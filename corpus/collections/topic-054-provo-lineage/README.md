# Collection — topic 54 · 05_provo_lineage

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **6 topics** (target + style) · **23 ontology terms** · **23 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 54: topic 60, topic 61, topic 62, topic 83, topic 142.

> **Topic gist** (representative FinePDFs text): Mathieu Blanchette - Curriculum Vitae in a Nutshell Career path: * PhD in computer science (2002) from U. of Washington. * Assistant (2003-2008) and associate (2008-now) professor at McGill's School of Computer Science since 2003. Research topics and productivity: * Research area: bioinformatics, with applications in genomics, epigenomics, evolution, phylogenetics, gene regulation, and proteom... …

## Chapters

- [ch_live_audit_basic_9cc0bc](chapters/ch_live_audit_basic_9cc0bc.md)
- [ch_live_carbon_credit_transaction_c5fb17](chapters/ch_live_carbon_credit_transaction_c5fb17.md)
- [ch_live_functional_dependency_lhs_8bd8d1](chapters/ch_live_functional_dependency_lhs_8bd8d1.md)
- [ch_live_myxoid_degeneration_process_d313b8](chapters/ch_live_myxoid_degeneration_process_d313b8.md)
- [ch_live_training_partnership_development_0c2155](chapters/ch_live_training_partnership_development_0c2155.md)
- [ch_live_transformation_starts_at_1e2ecb](chapters/ch_live_transformation_starts_at_1e2ecb.md)
- [ch_live_transformation_with_input_dataset_191653](chapters/ch_live_transformation_with_input_dataset_191653.md)
- [ch_live_transformation_with_output_dataset_3ad1da](chapters/ch_live_transformation_with_output_dataset_3ad1da.md)
- [ch_live_transformation_with_output_dataset_456787](chapters/ch_live_transformation_with_output_dataset_456787.md)
- [ch_live_transformation_with_output_dataset_f3cee7](chapters/ch_live_transformation_with_output_dataset_f3cee7.md)

## Ontology terms grounding this collection

- `annotation_classifies_class` — {X} is a descriptive information content entity that classifies {Y}
- `anonymous_demographic_information` — AnonymousDemographicInformation is equivalent to DemographicInformation and not PersonallyIdentifiableInformation.
- `audit_basic` — {X} is a process
- `bpf_helper_called_by` — {X} is an artifact that called by program {Y}
- `carbon_credit_transaction` — A CarbonCreditTransaction is an InformationContentEntity that derives from some CarbonCreditProject, transferred to some
- `dempster_conflict_mass` — {X} is a descriptive information content entity that has conflict mass {Y}
- `functional_dependency_lhs` — {X} is a descriptive information content entity that has fdleft hand side {Y}
- `human_rights_impact_report` — A HumanRightsImpactReport is an InformationContentEntity that reportsOn some FindingEntity.
- `kernel_event_with_comm` — {X} is a process that with process comm {Y}
- `material_density_specification` — A MaterialDensitySpecification is a DescriptiveICE that has exactly one density value.
- `myxoid_degeneration_process` — MyxoidDegenerationProcess is a process that degrades some ConnectiveTissueRegion and results in some GanglionCystFormati
- `policy_effective_period` — {X} is a directive information content entity
- `schemaorg_label_alignment` — {X} is a descriptive information content entity that aligned to schema org label {Y}
- `social_enterprise_annual_income` — A SocialEnterpriseAnnualIncome is a DescriptiveICE that has an AnnualIncomeValue of type decimal.
- `training_partnership_development` — A TrainingPartnershipDevelopment is a Process that participatesIn some EducationalInstitution.
- `transformation_associated_with_agent` — {X} is a process that was associated with {Y}
- `transformation_basic` — {X} is a process
- `transformation_starts_at` — {X} is a process that started at time {Y}
- `transformation_subclass` — {X} is a process that uses entity {Y}
- `transformation_with_input_dataset` — {X} is a process that has input dataset {Y}
- `transformation_with_output_dataset` — {X} is a process that has output dataset {Y}
- `two_disjoint_artifacts` — {X} is not {Y}
- `universal_combined_with_existential` — {X} is something that {p} {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_annotation_classifies_class`](tables/t_annotation_classifies_class.sql) — realizes `annotation_classifies_class` · _shared with 7 other collection(s)_
- [`t_anonymous_demographic_information`](tables/t_anonymous_demographic_information.sql) — realizes `anonymous_demographic_information` · _shared with 10 other collection(s)_
- [`t_audit_basic`](tables/t_audit_basic.sql) — realizes `audit_basic` · _shared with 8 other collection(s)_
- [`t_bpf_helper_called_by`](tables/t_bpf_helper_called_by.sql) — realizes `bpf_helper_called_by` · _shared with 7 other collection(s)_
- [`t_carbon_credit_transaction`](tables/t_carbon_credit_transaction.sql) — realizes `carbon_credit_transaction` · _shared with 8 other collection(s)_
- [`t_dempster_conflict_mass`](tables/t_dempster_conflict_mass.sql) — realizes `dempster_conflict_mass` · _shared with 5 other collection(s)_
- [`t_functional_dependency_lhs`](tables/t_functional_dependency_lhs.sql) — realizes `functional_dependency_lhs` · _shared with 8 other collection(s)_
- [`t_human_rights_impact_report`](tables/t_human_rights_impact_report.sql) — realizes `human_rights_impact_report` · _shared with 7 other collection(s)_
- [`t_kernel_event_with_comm`](tables/t_kernel_event_with_comm.sql) — realizes `kernel_event_with_comm` · _shared with 6 other collection(s)_
- [`t_material_density_specification`](tables/t_material_density_specification.sql) — realizes `material_density_specification` · _shared with 5 other collection(s)_
- [`t_myxoid_degeneration_process`](tables/t_myxoid_degeneration_process.sql) — realizes `myxoid_degeneration_process` · _shared with 7 other collection(s)_
- [`t_policy_effective_period`](tables/t_policy_effective_period.sql) — realizes `policy_effective_period` · _shared with 8 other collection(s)_
- [`t_schemaorg_label_alignment`](tables/t_schemaorg_label_alignment.sql) — realizes `schemaorg_label_alignment` · _shared with 4 other collection(s)_
- [`t_social_enterprise_annual_income`](tables/t_social_enterprise_annual_income.sql) — realizes `social_enterprise_annual_income` · _shared with 5 other collection(s)_
- [`t_training_partnership_development`](tables/t_training_partnership_development.sql) — realizes `training_partnership_development` · _shared with 7 other collection(s)_
- [`t_transformation_associated_with_agent`](tables/t_transformation_associated_with_agent.sql) — realizes `transformation_associated_with_agent` · _shared with 8 other collection(s)_
- [`t_transformation_basic`](tables/t_transformation_basic.sql) — realizes `transformation_basic` · _shared with 5 other collection(s)_
- [`t_transformation_starts_at`](tables/t_transformation_starts_at.sql) — realizes `transformation_starts_at` · _shared with 3 other collection(s)_
- [`t_transformation_subclass`](tables/t_transformation_subclass.sql) — realizes `transformation_subclass` · _shared with 5 other collection(s)_
- [`t_transformation_with_input_dataset`](tables/t_transformation_with_input_dataset.sql) — realizes `transformation_with_input_dataset` · _shared with 3 other collection(s)_
- [`t_transformation_with_output_dataset`](tables/t_transformation_with_output_dataset.sql) — realizes `transformation_with_output_dataset` · _shared with 4 other collection(s)_
- [`t_two_disjoint_artifacts`](tables/t_two_disjoint_artifacts.sql) — realizes `two_disjoint_artifacts` · _shared with 7 other collection(s)_
- [`t_universal_combined_with_existential`](tables/t_universal_combined_with_existential.sql) — realizes `universal_combined_with_existential` · _shared with 11 other collection(s)_
