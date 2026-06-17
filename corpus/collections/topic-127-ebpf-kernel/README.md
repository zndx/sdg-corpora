# Collection — topic 127 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Table of Contents 0. Summary ‐ Popular version SAFER is a vehicle and traffic safety centre, inaugurated in 2006. It is comprised of 24 partners from industry, academy and public authorities; Chalmers is the host and Vinnova the funding agency. The vision is to provide excellent multi-disciplinary research and collaboration to eliminate fatalities and serious injuries, making the partners from s.. …

## Chapters

- [Chapter 7: Governance Directives and Verification Protocols](chapters/06b1ba883dc7ef08.md)
- [Chapter 4: Governance Frameworks and Directive Verification Protocols](chapters/0e36d8cfb15d5286.md)
- [Chapter 4: Directive Governance and Attestation Frameworks](chapters/217c1b15fc186639.md)
- [Chapter 7: Directive Governance Patterns in School Authorization Systems](chapters/373f70275a6675b5.md)
- [Chapter 4: Governance Structures and Attestation Protocols in Compliance Frameworks](chapters/46a1863399d85428.md)
- [Chapter 4: Governance Frameworks and Compliance Verification Protocols](chapters/a4d73b4fc7283a0d.md)
- [Chapter 4: Directive Governance Frameworks and Ontological Constraints](chapters/b3bfea1c244488ae.md)
- [Chapter 4: Governance Frameworks and Compliance Mechanisms](chapters/bb71f0ebceb6df13.md)
- [Chapter 12: Directive Governance Structures in Authorization Systems](chapters/d98c23fe9789fa5c.md)
- [Chapter 4: Governance Structures and Attestation Protocols in Compliance Frameworks](chapters/f401d41a69f3fb2a.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `requirement_min_one_verification` — {X} is a directive information content entity
- `verification_min_one_evidence` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer`
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification`
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence`
