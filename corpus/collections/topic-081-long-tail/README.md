# Collection — topic 81 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **1 topics** (target + style) · **25 ontology terms** · **25 underlying tables**.

> **Topic gist** (representative FinePDFs text): Medical Device Services Who We Are At Regulatory Compliance Associates Inc (RCA), we provide worldwide services to the pharmaceutical, medical device, biologics, combination products, and compounding pharmacies industries for resolution of compliance and regulatory challenges. Our backgrounds include every facet of R&D, operations, regulatory affairs, quality and manufacturing. We are used to w... …

## Chapters

- [ch_live_equiv_intersect_artifact_with_part_26d14b](chapters/ch_live_equiv_intersect_artifact_with_part_26d14b.md)
- [ch_live_ganglion_cyst_tissue_origin_27e0df](chapters/ch_live_ganglion_cyst_tissue_origin_27e0df.md)
- [ch_live_lineage_edge_to_target_4ac114](chapters/ch_live_lineage_edge_to_target_4ac114.md)
- [ch_live_nist80053_high_impact_65ee5f](chapters/ch_live_nist80053_high_impact_65ee5f.md)
- [ch_live_soc2_privacy_subclass_f1ceb3](chapters/ch_live_soc2_privacy_subclass_f1ceb3.md)
- [ch_live_soc2_processing_integrity_ae39d8](chapters/ch_live_soc2_processing_integrity_ae39d8.md)
- [ch_live_subclass_basic_c65e27](chapters/ch_live_subclass_basic_c65e27.md)
- [ch_live_telemetry_span_observes_syscall_f8ae2c](chapters/ch_live_telemetry_span_observes_syscall_f8ae2c.md)
- [ch_live_third_party_data_sharing_425b47](chapters/ch_live_third_party_data_sharing_425b47.md)

## Ontology terms grounding this collection

- `artifact_not_deprecated` — {X} is not {Y}
- `clinical_performance_evaluation` — A ClinicalPerformanceEvaluation is an InformationContentEntity that utilizes some QuantitativeAnalyticTool, evaluates so
- `clinical_quality_research_role` — A ClinicalQualityResearchRole is a Role that holds role in exactly 1 EMSAuthority and applies to some ClinicalQualityDat
- `constraint_check_subclass` — {X} is a directive information content entity that checks {Y}
- `digital_media_service` — DigitalMediaService is an information content entity that provides at least one ServiceFunction.
- `entity_match_link` — {X} is a descriptive information content entity that matches entity {Y}
- `entomological_surveillance_record` — An EntomologicalSurveillanceRecord is a BFO continuant that realizes a VectorSpeciesIdentification via sdg:realizes and 
- `equiv_intersect_artifact_with_part` — Class: {X:Class} EquivalentTo: cco:Artifact and (bfo:0000051 some {Y:Class})
- `ganglion_cyst_imaging_finding` — GanglionCystImagingFinding is an information content entity that visualizes some MagneticResonanceImagingModality.
- `ganglion_cyst_tissue_origin` — GanglionCystTissueOrigin is a continuant that bears the part-of relation to some ConnectiveTissueStructure.
- `gauge_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `gdpr_article_subclass` — {X} is a directive information content entity that gdpr article {Y}
- `lineage_edge_to_target` — {X} is a descriptive information content entity that to target {Y}
- `mental_health_education_program` — A MentalHealthEducationProgram is an Occurrent that hasDeliveredPresentation some EducationalPresentation and targetsDem
- `nist80053_high_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `outlier_claim_supported_by` — {X} is a descriptive information content entity that supported by {Y}
- `professional_expertise_domain` — A ProfessionalExpertiseDomain is a DescriptiveICE that covers some IndustrySector and provides some ServiceType.
- `responsive_optic_nerve_dysfunction` — ResponsiveOpticNerveDysfunction is equivalent to OpticNerveDysfunction and not LeberOpticAtrophy.
- `soc2_privacy_subclass` — {X} is a directive information content entity that for soc2 domain {Y}
- `soc2_processing_integrity` — {X} is a directive information content entity that for soc2 domain {Y}
- `subclass_basic` — {X} is a {Y}
- `technology_promotion_initiative` — A TechnologyPromotionInitiative is a Process that targetsSector some IndustrySector and utilizesChannel some Communicati
- `telemetry_span_observes_syscall` — {X} is a process that observes syscall designative information content entity
- `third_party_data_sharing` — ThirdPartyDataSharing is a Process that participates in an ExternalBusinessPartner.
- `universal_combined_with_existential` — {X} is something that {p} {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_artifact_not_deprecated`](tables/t_artifact_not_deprecated.sql) — realizes `artifact_not_deprecated` · _shared with 10 other collection(s)_
- [`t_clinical_performance_evaluation`](tables/t_clinical_performance_evaluation.sql) — realizes `clinical_performance_evaluation` · _shared with 5 other collection(s)_
- [`t_clinical_quality_research_role`](tables/t_clinical_quality_research_role.sql) — realizes `clinical_quality_research_role` · _shared with 5 other collection(s)_
- [`t_constraint_check_subclass`](tables/t_constraint_check_subclass.sql) — realizes `constraint_check_subclass` · _shared with 12 other collection(s)_
- [`t_digital_media_service`](tables/t_digital_media_service.sql) — realizes `digital_media_service` · _shared with 5 other collection(s)_
- [`t_entity_match_link`](tables/t_entity_match_link.sql) — realizes `entity_match_link` · _shared with 11 other collection(s)_
- [`t_entomological_surveillance_record`](tables/t_entomological_surveillance_record.sql) — realizes `entomological_surveillance_record` · _shared with 5 other collection(s)_
- [`t_equiv_intersect_artifact_with_part`](tables/t_equiv_intersect_artifact_with_part.sql) — realizes `equiv_intersect_artifact_with_part` · _shared with 3 other collection(s)_
- [`t_ganglion_cyst_imaging_finding`](tables/t_ganglion_cyst_imaging_finding.sql) — realizes `ganglion_cyst_imaging_finding` · _shared with 11 other collection(s)_
- [`t_ganglion_cyst_tissue_origin`](tables/t_ganglion_cyst_tissue_origin.sql) — realizes `ganglion_cyst_tissue_origin` · _shared with 13 other collection(s)_
- [`t_gauge_metric_subclass`](tables/t_gauge_metric_subclass.sql) — realizes `gauge_metric_subclass` · _shared with 9 other collection(s)_
- [`t_gdpr_article_subclass`](tables/t_gdpr_article_subclass.sql) — realizes `gdpr_article_subclass` · _shared with 9 other collection(s)_
- [`t_lineage_edge_to_target`](tables/t_lineage_edge_to_target.sql) — realizes `lineage_edge_to_target` · _shared with 8 other collection(s)_
- [`t_mental_health_education_program`](tables/t_mental_health_education_program.sql) — realizes `mental_health_education_program` · _shared with 9 other collection(s)_
- [`t_nist80053_high_impact`](tables/t_nist80053_high_impact.sql) — realizes `nist80053_high_impact` · _shared with 8 other collection(s)_
- [`t_outlier_claim_supported_by`](tables/t_outlier_claim_supported_by.sql) — realizes `outlier_claim_supported_by` · _shared with 10 other collection(s)_
- [`t_professional_expertise_domain`](tables/t_professional_expertise_domain.sql) — realizes `professional_expertise_domain` · _shared with 7 other collection(s)_
- [`t_responsive_optic_nerve_dysfunction`](tables/t_responsive_optic_nerve_dysfunction.sql) — realizes `responsive_optic_nerve_dysfunction` · _shared with 10 other collection(s)_
- [`t_soc2_privacy_subclass`](tables/t_soc2_privacy_subclass.sql) — realizes `soc2_privacy_subclass` · _shared with 7 other collection(s)_
- [`t_soc2_processing_integrity`](tables/t_soc2_processing_integrity.sql) — realizes `soc2_processing_integrity` · _shared with 5 other collection(s)_
- [`t_subclass_basic`](tables/t_subclass_basic.sql) — realizes `subclass_basic` · _shared with 12 other collection(s)_
- [`t_technology_promotion_initiative`](tables/t_technology_promotion_initiative.sql) — realizes `technology_promotion_initiative` · _shared with 9 other collection(s)_
- [`t_telemetry_span_observes_syscall`](tables/t_telemetry_span_observes_syscall.sql) — realizes `telemetry_span_observes_syscall` · _shared with 7 other collection(s)_
- [`t_third_party_data_sharing`](tables/t_third_party_data_sharing.sql) — realizes `third_party_data_sharing` · _shared with 6 other collection(s)_
- [`t_universal_combined_with_existential`](tables/t_universal_combined_with_existential.sql) — realizes `universal_combined_with_existential` · _shared with 11 other collection(s)_
