# Collection — topic 4 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Material Safety Data Sheet May be used to Comply with OSHA's Hazard Communication Standard, 29 CFR 1910.1200(q). Standard must be Consulted for specific requirements Identity (As Used On Label and List) Note: Blank spaces are not permitted. If any item is not applicable, or no information is available, the space must be marked to indicate that Date Prepared: G3033 Fragrance Plus 02-14-... …

## Chapters

- [Chapter 4: Governance Frameworks and ISO 27001 Compliance Mapping](chapters/43ae6bbcfe481a8b.md)
- [Chapter 4: Ontological Mapping of ISO 27001 Governance Controls](chapters/53b3599447e34a33.md)
- [Chapter 7: Formal Ontology of Governance Controls and ISO 27001 Compliance](chapters/5f2f31b4f244cb94.md)
- [Chapter 4: Relational Projection of ISO 27001 Directive and Attestation Axioms](chapters/6b088057688badb3.md)
- [Chapter 4: Formal Ontology of Governance Directives and Attestation Protocols](chapters/88aea4f54c19ef54.md)
- [Chapter 7: Formal Ontology of ISO 27001 Governance and Attestation Protocols](chapters/8f2b9e9f22400fb3.md)
- [Chapter 4: Governance Structures and ISO/IEC 27001 Compliance Protocols](chapters/9fef941d78338b47.md)
- [Governance Frameworks: ISO 27001 Directive Mapping and Attestation Protocols](chapters/c93aca1049f8c426.md)
- [Chapter 4: Governance Frameworks and ISO/IEC 27001 Compliance Structures](chapters/dfc50d43a4011020.md)
- [Chapter 12: Directive Instances and Attestation Linkage in ISO 27001 Governance Records](chapters/ef554a3637fbaa21.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `iso27001_annexa_subclass` — {X} is a directive information content entity that iso27001 annex a {Y}
- `iso27001_clause_subclass` — {X} is a directive information content entity that iso27001 clause {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer`
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by`
- [`t_iso27001_annexa_subclass`](tables/t_iso27001_annexa_subclass.sql) — realizes `iso27001_annexa_subclass`
- [`t_iso27001_clause_subclass`](tables/t_iso27001_clause_subclass.sql) — realizes `iso27001_clause_subclass`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
