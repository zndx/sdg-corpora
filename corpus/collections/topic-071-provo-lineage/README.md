# Collection — topic 71 · 05_provo_lineage

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **24 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 71: topic 2, topic 23, topic 37, topic 38, topic 43, topic 51, topic 54, topic 57, topic 75, topic 81, topic 86, topic 96, topic 103, topic 106, topic 131, topic 132, topic 136, topic 146, topic 163, topic 179, topic 181, topic 191, topic 199.

> **Topic gist** (representative FinePDFs text): Research overview Research Project Final Evaluation Result The following research project underwent a final evaluation in accordance to Clause 10 and 11, Chapter 2 of the Regulations for Research and Development Evaluations (Regulation No. 74, October 1, 2003.) Evaluation system: *In this evaluation, it was agreed by the review committee to disclose their names and make clear who made report c... …

## Chapters

- [Chapter 4: Governance Frameworks and ISO 27001 Control Mapping](chapters/01fb787f9369269b.md)
- [Governance of Information Security Controls: ISO/IEC 27001 Implementation Frameworks](chapters/0d465d2cdde7af5b.md)
- [Chapter 7. Modeling ISO 27001 Directives and Evidence Chains in Audit Trail Schemas](chapters/33513afa28678830.md)
- [Chapter 4: Formalization of ISO/IEC 27001 Governance Structures](chapters/42b1e603a1c880db.md)
- [Chapter 7: Formalization of ISO/IEC 27001 Governance Structures](chapters/4cf1cce5af4a4bb9.md)
- [Chapter 4: Governance Frameworks and Evidentiary Requirements for ISO 27001 Compliance](chapters/55618ca00ecffdc3.md)
- [Chapter 4: Relational Encoding of ISO 27001 Directive Subclasses and Evidence Chains](chapters/889248d76bd2e883.md)
- [Governance Frameworks: ISO/IEC 27001 Compliance and Evidence Verification](chapters/8fc927a681ee1c82.md)
- [Chapter 7: Governance Frameworks and Evidence Verification in ISO 27001 Contexts](chapters/990774cdee08a33e.md)
- [Chapter 4: Formalization of ISO/IEC 27001 Control Mappings and Evidence Verification](chapters/c4372a1c79a97925.md)
- [Chapter 4: Governance Frameworks and Evidence Verification in ISO/IEC 27001 Compliance](chapters/d8cd39c7cb0c3fe8.md)
- [Chapter 4: Governance Frameworks and Evidence Verification in ISO 27001 Compliance](chapters/e842054c8e7ac44e.md)
- [Chapter 4: Governance Frameworks and Evidence Verification in ISO/IEC 27001 Compliance](chapters/f16f96e0ac4de2ca.md)

## Ontology terms grounding this collection

- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `iso27001_annexa_subclass` — {X} is a directive information content entity that iso27001 annex a {Y}
- `iso27001_clause_subclass` — {X} is a directive information content entity that iso27001 clause {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `verification_produces_evidence` — {X} is a process that produces evidence {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence` · _shared with 34 other collection(s)_
- [`t_iso27001_annexa_subclass`](tables/t_iso27001_annexa_subclass.sql) — realizes `iso27001_annexa_subclass` · _shared with 8 other collection(s)_
- [`t_iso27001_clause_subclass`](tables/t_iso27001_clause_subclass.sql) — realizes `iso27001_clause_subclass` · _shared with 5 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
- [`t_verification_produces_evidence`](tables/t_verification_produces_evidence.sql) — realizes `verification_produces_evidence` · _shared with 14 other collection(s)_
