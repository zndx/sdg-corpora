# Collection — topic 21 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **18 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): Recreating gut-liver axis during NAFLD onset by using a Caco-2/HepG2 co-culture system Marica Meroni¹, Erika Paolini¹,², Miriam Longo¹,³, Roberto Piciotti¹,⁴, Giada Tria¹, Silvia Fargion¹, Anna Ludovica Fracanzani¹,⁴, Paola Dongiovanni¹ ¹General Medicine and Metabolic Diseases, Fondazione IRCCS Ca’ Granda Ospedale Maggiore Policlinico, Milan 20122, Italy. ²Department of Pharmacological and Biomo.. …

## Chapters

- [Chapter 4: Formalization of Governance Directives and Risk Mitigation Logic](chapters/021ca5e90343d7ac.md)
- [Chapter 4: Formal Specification of Governance Directives and Risk Controls](chapters/0e0afcbd2c405bd2.md)
- [Chapter 4: Formal Ontology of Governance Directives and Risk Mitigation Protocols](chapters/160eb6cf62d7e2c6.md)
- [Chapter 4: Formalization of Governance Directives in Compliance Ontologies](chapters/2327e9723f107da3.md)
- [Chapter 4: Governance Directives and Risk Mitigation Logic](chapters/2d09f26078b294c1.md)
- [Chapter 4: Directive Governance Patterns in Workplace Safety Audit Trails](chapters/3bc3dbba22c847a5.md)
- [Chapter 4: Governance Frameworks and Risk Directive Logic](chapters/4c9406bad5f8d96b.md)
- [Chapter 4: Formal Specification of Governance Directives and Risk Mitigation](chapters/5a62d739bd69962e.md)
- [Chapter 4: Governance Directives and Risk Mitigation Frameworks](chapters/5a6b199991b2b350.md)
- [Chapter 4: Formal Specification of Governance Directives and Risk Mitigation](chapters/5acbb08d75a288c8.md)
- [Directive Governance in Environmental Compliance Systems](chapters/6214031fd1bb5a35.md)
- [Chapter 4: Governance Directives and Risk Mitigation Frameworks](chapters/6dfc683cbb3a3e49.md)
- [Chapter 7: Formal Ontology of Governance Directives and Risk Mitigation](chapters/898b1f92e5d9d034.md)
- [Chapter 4: Ontological Formalization of Governance Directives and Risk Mitigation](chapters/8a2efabea17819df.md)
- [Chapter 4: Formalization of Governance Directives and Risk Mitigation Strategies](chapters/8b1501f394a04fdc.md)
- [Chapter 4: Governance Framework Implementation: Directive Controls and Risk Correlation](chapters/8bc5ae8e53a8c3d0.md)
- [Chapter 4: Directive Controls for Risk and Requirement Governance](chapters/aa56f23f40740e04.md)
- [Chapter 4: Ontological Structures in Governance and Risk Mitigation](chapters/c40976316671b7c4.md)

## Ontology terms grounding this collection

- `control_addresses_risk` — {X} is a directive information content entity that addresses risk {Y}
- `control_only_addresses_threat_class` — {X} is a directive information content entity that addresses risk {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `requirement_has_priority` — {X} is a directive information content entity that has priority {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_control_addresses_risk`](tables/t_control_addresses_risk.sql) — realizes `control_addresses_risk`
- [`t_control_only_addresses_threat_class`](tables/t_control_only_addresses_threat_class.sql) — realizes `control_only_addresses_threat_class`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
- [`t_requirement_has_priority`](tables/t_requirement_has_priority.sql) — realizes `requirement_has_priority`
