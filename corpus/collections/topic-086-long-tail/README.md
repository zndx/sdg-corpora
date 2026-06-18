# Collection — topic 86 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **26 topics** (target + style) · **4 ontology terms** · **4 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 86: topic 1, topic 31, topic 42, topic 68, topic 70, topic 73, topic 75, topic 89, topic 92, topic 96, topic 99, topic 101, topic 102, topic 103, topic 110, topic 122, topic 125, topic 131, topic 132, topic 149, topic 163, topic 169, topic 191, topic 194, topic 199.

> **Topic gist** (representative FinePDFs text): Engineered Science DOI: https://dx.doi.org/10.30919/es8d799 A Novel Multi Regional Reliability Method for COVID-19 Death Forecast Oleg Gaidai1 and Yihan Xing 2,* Abstract Coronavirus disease was reported spread worldwide with low morbidity and mortality, presenting certain burden on worldwide public health. The present study describes a novel bio-system reliability approach, particularly suit... …

## Chapters

- [Chapter 7: Axiomatic Formalization of Compliance Artifacts and Directives](chapters/0a4df1f063b4a905.md)
- [Chapter 4: Ontological Constraints in Asset Governance and Compliance Frameworks](chapters/15a795be5649d9cf.md)
- [Chapter 4: Formal Mapping of Industrial Artifacts to Governance Directives](chapters/1cde1de6e044c1e3.md)
- [Chapter 4: Relational Encoding of Artifact–Directive Equivalences and Cardinality Constraints](chapters/28c0d7ec12b2897e.md)
- [Chapter 4: Ontological Constraints in Artifact Governance and Directive Specification](chapters/29acb60b8e064362.md)
- [Ontological Constraints in Supply Specification Systems](chapters/3b7ed927168932fc.md)
- [Chapter 4: Structural Governance of Artifacts and Directives](chapters/6a1aa0e9895525c2.md)
- [Chapter 4: Structural Governance of Compliance Artifacts and Directives](chapters/6e588eb7135570a7.md)
- [Chapter 4: Ontological Mapping of Governance Artifacts and Constraint Logic](chapters/7491fd3f4132e0f7.md)
- [Chapter 7: Relational Projection of OWL Equivalence and Cardinality Axioms in Artifact Governance](chapters/afc9a9d365d57cea.md)
- [Chapter 4: Structural Constraints and Relational Mapping in Governance Frameworks](chapters/c423785ba9d03e0c.md)
- [Chapter 4: Ontological Formalization of Governance Artifacts and Directives](chapters/dcc7bf3488b10a89.md)
- [Chapter 4: Modeling Artifact Composition and Directive Specification](chapters/df99f8a52ddc55cc.md)

## Ontology terms grounding this collection

- `cardinality_max_three_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} max 3 {Y:Class}
- `cardinality_min_two_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} min 2 {Y:Class}
- `equiv_intersect_artifact_with_part` — Class: {X:Class} EquivalentTo: cco:Artifact and (bfo:0000051 some {Y:Class})
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_cardinality_max_three_generic`](tables/t_cardinality_max_three_generic.sql) — realizes `cardinality_max_three_generic`
- [`t_cardinality_min_two_generic`](tables/t_cardinality_min_two_generic.sql) — realizes `cardinality_min_two_generic`
- [`t_equiv_intersect_artifact_with_part`](tables/t_equiv_intersect_artifact_with_part.sql) — realizes `equiv_intersect_artifact_with_part` · _shared with 1 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
