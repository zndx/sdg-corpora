# Collection — topic 143 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): CTGA Database Information Submission Form Help Topics Everyday the Centre for Arab Genomic Studies receives a variety of publications from scientists in the Arab World or abroad to be considered for the CTGA Database on genetic disorders in Arab populations. Curators of the CTGA Database are working continuously to update each and every record of the database following rigorous steps that includ.. …

## Chapters

- [Chapter 4: Formalization of Belief Structures and Directives in Semantic Governance](chapters/05f1fa2cf10cfd2a.md)
- [Chapter 4: Axiomatic Mapping of Evidence Structures to Relational Schemas](chapters/4396e6ad3f714086.md)
- [Chapter 4: Formalization of Belief Structures and Governance Directives](chapters/4908a5ea9d9dc0ba.md)
- [Chapter 7: Formalization of Belief Structures and Governance Directives](chapters/49e6b1216a8d62c1.md)
- [Chapter 4: Formal Ontology of Uncertainty and Evidence-Based Governance](chapters/634287315a31b3c8.md)
- [Chapter 4: Formal Specification of Belief Structures and Governance Directives](chapters/68c2fbeca17534cf.md)
- [Chapter 4: Formal Ontologies of Evidence and Governance](chapters/7ddea8311b13bfdd.md)
- [Chapter 4: Formalization of Belief Structures and Governance Directives](chapters/8e722f8564335fc5.md)
- [Chapter 4: Ontological Formalization of Belief Structures and Compliance Directives](chapters/9e68958a2c4363bd.md)
- [Chapter 4: Formal Representation of Uncertainty and Directives in Governance Frameworks](chapters/db4b3c23ee46a28d.md)

## Ontology terms grounding this collection

- `belief_interval_equiv_bel_and_pl` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasBeliefLowerBound some {Y:Class}) and (sdg:hasPlausibilityU
- `directive_authored_and_applies` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:authoredBy some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `equiv_intersect_with_negation` — {X} is equivalent to {Y} and not {Z}
- `mass_function_equiv_frame_and_assignment` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:overFrameOfDiscernment some {Y:Class}) and (sdg:assignsMassTo

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_belief_interval_equiv_bel_and_pl`](tables/t_belief_interval_equiv_bel_and_pl.sql) — realizes `belief_interval_equiv_bel_and_pl`
- [`t_directive_authored_and_applies`](tables/t_directive_authored_and_applies.sql) — realizes `directive_authored_and_applies`
- [`t_equiv_intersect_with_negation`](tables/t_equiv_intersect_with_negation.sql) — realizes `equiv_intersect_with_negation`
- [`t_mass_function_equiv_frame_and_assignment`](tables/t_mass_function_equiv_frame_and_assignment.sql) — realizes `mass_function_equiv_frame_and_assignment`
