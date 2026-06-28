# Collection — topic 139 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **4 chapters** · **1 topics** (target + style) · **11 ontology terms** · **11 underlying tables**.

> **Topic gist** (representative FinePDFs text): February 2016 Drug Court Practitioner Fact Sheet Vol. XI, No. 1 Understanding and Detecting Prescription Drug Misuse and Misuse Disorders By Sandra Lapham, MD, MPH, DFASAM Senior Research Scientist, Behavioral Health Research Center of the Southwest, Pacific Institute for Research and Evaluation T his fact sheet is designed for court professionals. It describes prescription drug misuse and pr... …

## Chapters

- [ch_live_client_data_record_903ef2](chapters/ch_live_client_data_record_903ef2.md)
- [ch_live_clinical_performance_evaluation_55364f](chapters/ch_live_clinical_performance_evaluation_55364f.md)
- [ch_live_functional_dependency_lhs_b26bc9](chapters/ch_live_functional_dependency_lhs_b26bc9.md)
- [ch_live_profiling_with_method_256327](chapters/ch_live_profiling_with_method_256327.md)

## Ontology terms grounding this collection

- `attribute_set_min_one` — {X} is a descriptive information content entity
- `client_data_record` — A ClientDataRecord is an information content entity that contains some ClientStatisticalInformation.
- `clinical_performance_evaluation` — A ClinicalPerformanceEvaluation is an InformationContentEntity that utilizes some QuantitativeAnalyticTool, evaluates so
- `clinical_quality_research_role` — A ClinicalQualityResearchRole is a Role that holds role in exactly 1 EMSAuthority and applies to some ClinicalQualityDat
- `constraint_check_subclass` — {X} is a directive information content entity that checks {Y}
- `functional_dependency_lhs` — {X} is a descriptive information content entity that has fdleft hand side {Y}
- `functional_dependency_rhs` — {X} is a descriptive information content entity that has fdright hand side {Y}
- `ganglion_cyst_imaging_finding` — GanglionCystImagingFinding is an information content entity that visualizes some MagneticResonanceImagingModality.
- `professional_experience` — A ProfessionalExperience is an InformationContentEntity that relates a Person to an Organization and records a duration 
- `profiling_with_method` — {X} is a process that applies method {Y}
- `syscall_basic` — {X} is a designative information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attribute_set_min_one`](tables/t_attribute_set_min_one.sql) — realizes `attribute_set_min_one` · _shared with 7 other collection(s)_
- [`t_client_data_record`](tables/t_client_data_record.sql) — realizes `client_data_record` · _shared with 4 other collection(s)_
- [`t_clinical_performance_evaluation`](tables/t_clinical_performance_evaluation.sql) — realizes `clinical_performance_evaluation` · _shared with 5 other collection(s)_
- [`t_clinical_quality_research_role`](tables/t_clinical_quality_research_role.sql) — realizes `clinical_quality_research_role` · _shared with 5 other collection(s)_
- [`t_constraint_check_subclass`](tables/t_constraint_check_subclass.sql) — realizes `constraint_check_subclass` · _shared with 12 other collection(s)_
- [`t_functional_dependency_lhs`](tables/t_functional_dependency_lhs.sql) — realizes `functional_dependency_lhs` · _shared with 8 other collection(s)_
- [`t_functional_dependency_rhs`](tables/t_functional_dependency_rhs.sql) — realizes `functional_dependency_rhs` · _shared with 8 other collection(s)_
- [`t_ganglion_cyst_imaging_finding`](tables/t_ganglion_cyst_imaging_finding.sql) — realizes `ganglion_cyst_imaging_finding` · _shared with 11 other collection(s)_
- [`t_professional_experience`](tables/t_professional_experience.sql) — realizes `professional_experience` · _shared with 8 other collection(s)_
- [`t_profiling_with_method`](tables/t_profiling_with_method.sql) — realizes `profiling_with_method` · _shared with 9 other collection(s)_
- [`t_syscall_basic`](tables/t_syscall_basic.sql) — realizes `syscall_basic` · _shared with 8 other collection(s)_
