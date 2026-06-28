# Collection — topic 184 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **2 topics** (target + style) · **20 ontology terms** · **20 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 184: topic 187.

> **Topic gist** (representative FinePDFs text): SEnDIng D1.4 FINAL PROJECT REPORT Editor(s): Vasileios Gkamas Responsible Organisation(s): UPATRAS Document Version-Status: SEnDINg_DLV1.4-Final Submission date: M38 Dissemination level: Public SEnDIng © Members of SEnDIng project 1 /27 Deliverable factsheet Project Number: Project Acronym: 591848-EPP-1-2017-1-EL-EPPKA2-SSA SEnDIng Project Title: Sector Skills Alliance for th... …

## Chapters

- [ch_live_backward_compatible_with_afc4ab](chapters/ch_live_backward_compatible_with_afc4ab.md)
- [ch_live_backward_compatible_with_d337e1](chapters/ch_live_backward_compatible_with_d337e1.md)
- [ch_live_cardinality_exactly_one_generic_0bfee8](chapters/ch_live_cardinality_exactly_one_generic_0bfee8.md)
- [ch_live_conjunctive_combination_f92293](chapters/ch_live_conjunctive_combination_f92293.md)
- [ch_live_requirement_satisfies_fec252](chapters/ch_live_requirement_satisfies_fec252.md)
- [ch_live_strategic_commitment_35ad2a](chapters/ch_live_strategic_commitment_35ad2a.md)
- [ch_live_survey_response_record_53f0e5](chapters/ch_live_survey_response_record_53f0e5.md)
- [ch_live_survey_response_record_ef63d3](chapters/ch_live_survey_response_record_ef63d3.md)
- [ch_live_tc_classifier_subclass_702df4](chapters/ch_live_tc_classifier_subclass_702df4.md)

## Ontology terms grounding this collection

- `allocation_subclass` — {X} is a process that executes transformation {Y}
- `backward_compatible_with` — {X} is a descriptive information content entity that backward compatible with {Y}
- `cardinality_exactly_one_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} exactly 1 {Y:Class}
- `column_tag_from_annotator` — {X} is a descriptive information content entity that by annotator {Y}
- `conjunctive_combination` — {X} is a descriptive information content entity that conjunctively combines {Y}
- `ebpfmap_equiv_kv_typed` — Class: {X:Class} EquivalentTo: cco:Artifact and (sdg:hasKeyType some {Y:Class}) and (sdg:hasValueTypeMap some {Z:Class})
- `entomological_surveillance_record` — An EntomologicalSurveillanceRecord is a BFO continuant that realizes a VectorSpeciesIdentification via sdg:realizes and 
- `evidence_independent_of` — {X} is a descriptive information content entity that evidence independent of {Y}
- `ice_subclass_with_part` — {X} is an information content entity that has part information content entity
- `lineage_edge_with_provenance` — {X} is a descriptive information content entity that with provenance {Y}
- `mass_function_only_assigns_subsets` — {X} is a descriptive information content entity that assigns mass to {Y}
- `observation_with_participant` — {X} is a process that has participant artifact
- `port_isolation_measurement` — A PortIsolationMeasurement is an InformationContentEntity that measures a PortPair, depends on an ImpedanceTermination, 
- `requirement_satisfies` — {X} is a directive information content entity that satisfies {Y}
- `school_security_policy` — SchoolSecurityPolicy is a DirectiveICE that targets some SafetyObjective and mustSatisfy some ConstitutionalConstraint.
- `span_with_attribute` — {X} is a process that has span attribute {Y}
- `strategic_commitment` — A StrategicCommitment is a DirectiveICE that pursuesObjective some OrganizationalObjective and supportsStakeholder some 
- `survey_response_record` — SurveyResponseRecord is a subclass of cco:InformationContentEntity that captures at least one ResearcherProfileAttribute
- `sysblock_subclass` — {X} is an artifact that has part {Y}
- `tc_classifier_subclass` — {X} is an artifact that has tcdirection {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_allocation_subclass`](tables/t_allocation_subclass.sql) — realizes `allocation_subclass` · _shared with 12 other collection(s)_
- [`t_backward_compatible_with`](tables/t_backward_compatible_with.sql) — realizes `backward_compatible_with` · _shared with 6 other collection(s)_
- [`t_cardinality_exactly_one_generic`](tables/t_cardinality_exactly_one_generic.sql) — realizes `cardinality_exactly_one_generic` · _shared with 10 other collection(s)_
- [`t_column_tag_from_annotator`](tables/t_column_tag_from_annotator.sql) — realizes `column_tag_from_annotator` · _shared with 6 other collection(s)_
- [`t_conjunctive_combination`](tables/t_conjunctive_combination.sql) — realizes `conjunctive_combination` · _shared with 10 other collection(s)_
- [`t_ebpfmap_equiv_kv_typed`](tables/t_ebpfmap_equiv_kv_typed.sql) — realizes `ebpfmap_equiv_kv_typed` · _shared with 8 other collection(s)_
- [`t_entomological_surveillance_record`](tables/t_entomological_surveillance_record.sql) — realizes `entomological_surveillance_record` · _shared with 5 other collection(s)_
- [`t_evidence_independent_of`](tables/t_evidence_independent_of.sql) — realizes `evidence_independent_of` · _shared with 4 other collection(s)_
- [`t_ice_subclass_with_part`](tables/t_ice_subclass_with_part.sql) — realizes `ice_subclass_with_part` · _shared with 9 other collection(s)_
- [`t_lineage_edge_with_provenance`](tables/t_lineage_edge_with_provenance.sql) — realizes `lineage_edge_with_provenance` · _shared with 7 other collection(s)_
- [`t_mass_function_only_assigns_subsets`](tables/t_mass_function_only_assigns_subsets.sql) — realizes `mass_function_only_assigns_subsets` · _shared with 5 other collection(s)_
- [`t_observation_with_participant`](tables/t_observation_with_participant.sql) — realizes `observation_with_participant` · _shared with 8 other collection(s)_
- [`t_port_isolation_measurement`](tables/t_port_isolation_measurement.sql) — realizes `port_isolation_measurement` · _shared with 5 other collection(s)_
- [`t_requirement_satisfies`](tables/t_requirement_satisfies.sql) — realizes `requirement_satisfies` · _shared with 9 other collection(s)_
- [`t_school_security_policy`](tables/t_school_security_policy.sql) — realizes `school_security_policy` · _shared with 8 other collection(s)_
- [`t_span_with_attribute`](tables/t_span_with_attribute.sql) — realizes `span_with_attribute` · _shared with 8 other collection(s)_
- [`t_strategic_commitment`](tables/t_strategic_commitment.sql) — realizes `strategic_commitment` · _shared with 6 other collection(s)_
- [`t_survey_response_record`](tables/t_survey_response_record.sql) — realizes `survey_response_record` · _shared with 10 other collection(s)_
- [`t_sysblock_subclass`](tables/t_sysblock_subclass.sql) — realizes `sysblock_subclass` · _shared with 6 other collection(s)_
- [`t_tc_classifier_subclass`](tables/t_tc_classifier_subclass.sql) — realizes `tc_classifier_subclass` · _shared with 12 other collection(s)_
