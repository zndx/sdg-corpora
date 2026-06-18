# Collection — topic 178 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **16 chapters** · **30 topics** (target + style) · **4 ontology terms** · **4 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 178: topic 3, topic 4, topic 6, topic 23, topic 31, topic 42, topic 53, topic 58, topic 71, topic 85, topic 94, topic 95, topic 97, topic 98, topic 108, topic 112, topic 126, topic 128, topic 132, topic 139, topic 154, topic 157, topic 169, topic 171, topic 174, topic 176, topic 181, topic 193, topic 194.

> **Topic gist** (representative FinePDFs text): June 2024 Quarterly Activities Report HIGHLIGHTS EARAHEEDY (LSR – 100%) – Base Metals, Gold - A further 2,206 geochemical soil samples taken in new areas as well as infilling anomalies previously reported COOLGARDIE WEST (LSR – 100%) – Gold, Nickel, Lithium - 307 infill soil samples taken to better define gold (Au) anomalies prior to drilling - First pass aircore drilling planned for September ... …

## Chapters

- [Chapter 7: Ontological Foundations of Governance Artifacts and Directives](chapters/2b945e2dd0d1b461.md)
- [Chapter 4: Structural Governance and Artifact Integrity in Compliance Frameworks](chapters/4c04b334ade572ba.md)
- [Chapter 4: Structural Formalization of Regulatory Directives and Artifacts](chapters/54b294fb9c17cf07.md)
- [Modeling Artifacts and Directives in Laboratory Certification Records](chapters/604692a36953b926.md)
- [Chapter 4: Governance Frameworks and Artifact Specification in Utility Compliance](chapters/62fb110c442df6c7.md)
- [Directive Specification and Artifact Composition in Compliance Ontologies](chapters/6cf0715063c7e2f9.md)
- [Chapter 4: Ontological Foundations of Governance Artifacts and Directives](chapters/72b30b410dd718e6.md)
- [Chapter 4: Ontological Foundations of Governance Artifacts](chapters/7347a47a53ed8b2b.md)
- [Ontological Foundations of Artifacts and Directives in Laboratory Information Systems](chapters/94652d8404acae96.md)
- [Chapter 4: Ontological Foundations of Governance Artifacts](chapters/b64853991d0364ca.md)
- [Governance Artifacts and Directive Structures in Compliance Frameworks](chapters/d2df0cf32a241aa3.md)
- [Chapter 4. Directive and Artifact Ontologies in Municipal Energy Compliance](chapters/e5ebb0061ca76741.md)
- [Chapter 4: Modeling Directive Artifacts and Descriptive Entities in Administrative Compliance Records](chapters/e8ba6840d45c13d6.md)
- [Chapter 4: Ontological Structuring of Compliance Artifacts and Governance Directives](chapters/ee24373b23efc968.md)
- [Chapter 4: Ontological Foundations of Governance Artifacts](chapters/fa93fde09590d160.md)
- [Chapter 4: Ontological Foundations of Governance Artifacts](chapters/fc5b52f03e750997.md)

## Ontology terms grounding this collection

- `directive_authored_and_applies` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:authoredBy some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `equiv_intersect_artifact_with_part` — Class: {X:Class} EquivalentTo: cco:Artifact and (bfo:0000051 some {Y:Class})
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `subclass_to_descriptive_ice` — {X} is a descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_directive_authored_and_applies`](tables/t_directive_authored_and_applies.sql) — realizes `directive_authored_and_applies` · _shared with 2 other collection(s)_
- [`t_equiv_intersect_artifact_with_part`](tables/t_equiv_intersect_artifact_with_part.sql) — realizes `equiv_intersect_artifact_with_part` · _shared with 1 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
- [`t_subclass_to_descriptive_ice`](tables/t_subclass_to_descriptive_ice.sql) — realizes `subclass_to_descriptive_ice` · _shared with 1 other collection(s)_
