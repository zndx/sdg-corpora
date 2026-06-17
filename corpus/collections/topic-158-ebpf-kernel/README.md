# Collection — topic 158 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Novel Properties of Magnetic Ultrathin Films Studied by In Situ Spectroscopic Methods Department of Materials Molecular Science Division of Electronic Structure YOKOYAMA, Toshihiko NAKAGAWA, Takeshi TAKAGI, Yasumasa EGUCHI, Keitaro NAKANO, Hirohito FUNAKI, Yumiko TOYAMA, Yu Professor Assistant Professor Assistant Professor Graduate Student Graduate Student* Secretary Secretary (Nanotechno... …

## Chapters

- [Governance Frameworks and Compliance Ontologies: A Technical Specification](chapters/3ce4790cf2f3703d.md)
- [Chapter 4: Directive Information Content Entities in Municipal Planning Records](chapters/46027f92f2d1277d.md)
- [Chapter 4: Governance Frameworks and Spatial Compliance Protocols](chapters/6af9dd45ba5f761d.md)
- [Chapter 4: Governance Frameworks and Site-Based Compliance Artifacts](chapters/99318f68bba0bc0c.md)
- [Regulatory Compliance Data Model for Municipal Facilities](chapters/9c6f069340cae569.md)
- [Chapter 4: Ontological Foundations of Governance and Spatial Compliance](chapters/a9de4c8462035c2e.md)
- [Chapter 4: Formalization of Governance Artifacts and Compliance Directives](chapters/bf5163a42330bb58.md)
- [Chapter 7: Ontological Formalization of Governance Directives and Spatial Compliance](chapters/c881250ce47d17b7.md)
- [Chapter 4: Directive Information Content Entities in Planning Compliance](chapters/e041bc41f7a0c805.md)

## Ontology terms grounding this collection

- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `policy_min_one_enforcer` — {X} is a directive information content entity
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `requirement_min_one_verification` — {X} is a directive information content entity
- `schemaorg_place_address` — {X} is an artifact that has postal address {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_policy_min_one_enforcer`](tables/t_policy_min_one_enforcer.sql) — realizes `policy_min_one_enforcer`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification`
- [`t_schemaorg_place_address`](tables/t_schemaorg_place_address.sql) — realizes `schemaorg_place_address`
