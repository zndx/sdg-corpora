# Collection — topic 144 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **14 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): JOURNAL OF DESIGN FOR RESILIENCE IN ARCHITECTURE & PLANNING Research Article Online: www.drarch.org Volume 3, Issue 1, (96-111), 2022 DOI: 10.47818/DRArch.2022.v3i1046 A comparative analysis of building large-scale projects in developing countries by emphasizing on land value changes: Tehran-Iran Mall versus IstanbulThird Airport Somaiyeh Nasrollahzadeh* Abstract Today's cities are competi... …

## Chapters

- [Chapter 4: Governance Frameworks and ISO 27001 Compliance Mapping](chapters/15690a1cf52e3c12.md)
- [Chapter 4: Governance Frameworks and ISO 27001 Annex A Compliance](chapters/1ce7aab16d829aab.md)
- [Chapter 4: Governance Frameworks and ISO 27001 Compliance Mapping](chapters/1ef816c450f96d3f.md)
- [Governance Frameworks for Information Security: ISO 27001 Implementation and Audit Protocols](chapters/24cb2eed213b1d42.md)
- [Chapter 4: Formal Governance Structures and ISO 27001 Control Implementation](chapters/2e97e5c52877ff99.md)
- [Chapter 4: Governance Frameworks and ISO/IEC 27001 Attestation Protocols](chapters/5658fa2106dc4e94.md)
- [Governance Frameworks: ISO 27001 Annex A and Audit Attestation Protocols](chapters/5fa16d3280a35618.md)
- [Chapter 4: Ontological Formalization of Audit and Attestation Frameworks](chapters/79f2e052f0c77786.md)
- [Chapter 7: Ontological Mapping of Governance Directives and Audit Processes](chapters/7f6be81c04295a04.md)
- [Chapter 4: Governance Frameworks and ISO 27001 Annex A Compliance Logic](chapters/a89c7c7a3be753ca.md)
- [Chapter 7: Relational Projections of Directive Governance Axioms](chapters/a9ca6eed1924d93f.md)
- [ISO 27001 Attestation and Audit Record Schema](chapters/aad395b7a2498c00.md)
- [ISO 27001 Directive Governance and Attestation Traceability](chapters/d20ade69c528a617.md)
- [Chapter 4: Governance Frameworks and the Ontology of Compliance](chapters/e8db159cedfecae1.md)

## Ontology terms grounding this collection

- `attestation_at_period` — {X} is a process that at attestation period {Y}
- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_conducted_by` — {X} is a process that conducted by person
- `iso27001_annexa_subclass` — {X} is a directive information content entity that iso27001 annex a {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_at_period`](tables/t_attestation_at_period.sql) — realizes `attestation_at_period`
- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by`
- [`t_iso27001_annexa_subclass`](tables/t_iso27001_annexa_subclass.sql) — realizes `iso27001_annexa_subclass`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
