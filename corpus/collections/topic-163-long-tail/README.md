# Collection — topic 163 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **6 chapters** · **3 topics** (target + style) · **13 ontology terms** · **13 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 163: topic 166, topic 184.

> **Topic gist** (representative FinePDFs text): DEPARTMENT OF MICROBIOLOGY ISPAT GENERAL HOSPITAL SAIL, RSP, ROURKELA COVID-19 (RT-PCR) Test Report Sr. No. 1 2 3 4 5 Prepared by: Checked and Approved by: Krishna Ch. Majhi Note: The results relate only to the specimens tested and should be correlated with clinical findings. Interpretation guidance:- * Testing of referred clinical specimens was considered on the basis of request / r... …

## Chapters

- [ch_live_backward_compatible_with_ba0554](chapters/ch_live_backward_compatible_with_ba0554.md)
- [ch_live_functional_dependency_rhs_6becbb](chapters/ch_live_functional_dependency_rhs_6becbb.md)
- [ch_live_log_with_resource_attribute_8606bf](chapters/ch_live_log_with_resource_attribute_8606bf.md)
- [ch_live_schemaorg_creativework_date_85d65b](chapters/ch_live_schemaorg_creativework_date_85d65b.md)
- [ch_live_schemaorg_review_rating_24f786](chapters/ch_live_schemaorg_review_rating_24f786.md)
- [ch_live_schemaorg_review_rating_8ba88b](chapters/ch_live_schemaorg_review_rating_8ba88b.md)

## Ontology terms grounding this collection

- `backward_compatible_with` — {X} is a descriptive information content entity that backward compatible with {Y}
- `cardinality_exactly_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} exactly 1 {Y:Class}
- `census_data_collection_process` — A CensusDataCollectionProcess is a Process that involves an OrganizationalScreeningActivity and includes a Representativ
- `clinical_performance_evaluation` — A ClinicalPerformanceEvaluation is an InformationContentEntity that utilizes some QuantitativeAnalyticTool, evaluates so
- `functional_dependency_rhs` — {X} is a descriptive information content entity that has fdright hand side {Y}
- `labrun_subclass` — {X} is a process that has input sample {Y}
- `log_with_resource_attribute` — {X} is an artifact that has resource attribute {Y}
- `observation_records_state` — {X} is a process that records {Y}
- `requirement_under_standard` — {X} is a directive information content entity that under standard {Y}
- `schema_revision_of` — {X} is an artifact that schema revision of {Y}
- `schemaorg_creativework_date` — {X} is an artifact that has date published {Y}
- `schemaorg_review_rating` — {X} is an artifact that has review rating {Y}
- `transformation_only_uses_datasets` — {X} is a process that uses entity {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_backward_compatible_with`](tables/t_backward_compatible_with.sql) — realizes `backward_compatible_with` · _shared with 6 other collection(s)_
- [`t_cardinality_exactly_one_generic`](tables/t_cardinality_exactly_one_generic.sql) — realizes `cardinality_exactly_one_generic` · _shared with 10 other collection(s)_
- [`t_census_data_collection_process`](tables/t_census_data_collection_process.sql) — realizes `census_data_collection_process` · _shared with 8 other collection(s)_
- [`t_clinical_performance_evaluation`](tables/t_clinical_performance_evaluation.sql) — realizes `clinical_performance_evaluation` · _shared with 5 other collection(s)_
- [`t_functional_dependency_rhs`](tables/t_functional_dependency_rhs.sql) — realizes `functional_dependency_rhs` · _shared with 8 other collection(s)_
- [`t_labrun_subclass`](tables/t_labrun_subclass.sql) — realizes `labrun_subclass` · _shared with 10 other collection(s)_
- [`t_log_with_resource_attribute`](tables/t_log_with_resource_attribute.sql) — realizes `log_with_resource_attribute` · _shared with 10 other collection(s)_
- [`t_observation_records_state`](tables/t_observation_records_state.sql) — realizes `observation_records_state` · _shared with 14 other collection(s)_
- [`t_requirement_under_standard`](tables/t_requirement_under_standard.sql) — realizes `requirement_under_standard` · _shared with 7 other collection(s)_
- [`t_schema_revision_of`](tables/t_schema_revision_of.sql) — realizes `schema_revision_of` · _shared with 9 other collection(s)_
- [`t_schemaorg_creativework_date`](tables/t_schemaorg_creativework_date.sql) — realizes `schemaorg_creativework_date` · _shared with 7 other collection(s)_
- [`t_schemaorg_review_rating`](tables/t_schemaorg_review_rating.sql) — realizes `schemaorg_review_rating` · _shared with 6 other collection(s)_
- [`t_transformation_only_uses_datasets`](tables/t_transformation_only_uses_datasets.sql) — realizes `transformation_only_uses_datasets` · _shared with 8 other collection(s)_
