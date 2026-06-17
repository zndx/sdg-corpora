# Collection — topic 191 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): SOLICITATION, OFFER AND AWARD 1. THIS CONTRACT IS A RATED ORDER UNDER DPAS (15 CFR 700) 2. CONTRACT NUMBER: TIB-2007-C-002 3. SOLICITATION NUMBER: TIB-2006-R-002 4. TYPE OF SOLICITATION: [ ] SEALED BID (IFB) [X] NEGOTIATED (RFP) 5. DATE ISSUED: 6. REQUISITION/PURCHASE NUMBER: 7. ISSUED BY: FEDERAL RETIREMENT THRIFT INVESTMENT BOARD 1250 H STREET N.W., SUITE 200 WASHINGTON, DC 20005 8. AD... …

## Chapters

- [Chapter 4: Governance Directives and Evidence Management Frameworks](chapters/4df17e1aae60b3f7.md)
- [Chapter 4: Governance Directives and Evidence Correlation in Compliance Frameworks](chapters/734312344e8e461a.md)
- [Chapter 4: Directive Governance and Evidence Management in Compliance Frameworks](chapters/840ea34a0229378b.md)
- [Chapter 4: Governance Frameworks and Evidence Verification Protocols](chapters/98284be0b7a345e2.md)
- [Chapter 4: Directive Controls, Attestations and Evidence Production in Governance Audit Trails](chapters/c7e19623ac62e61e.md)
- [Chapter 4: Directive Governance and Evidentiary Standards](chapters/c93ffaed87e2e1a6.md)
- [Chapter 4: Governance Frameworks and Evidence Provenance](chapters/df443dd17420b172.md)
- [Directive Governance in Audit Trail Systems](chapters/e08ea36aceaf99d8.md)
- [Chapter 4: Governance Directives and Evidence Lifecycle Management](chapters/e53ef4f8801a64ea.md)
- [Directive Governance in Audit Trail Systems](chapters/f639f63bd2586bc2.md)
- [Chapter 4: Governance Directives and Evidence Verification Mechanisms](chapters/fcaa2aa354716be2.md)

## Ontology terms grounding this collection

- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `control_only_addresses_threat_class` — {X} is a directive information content entity that addresses risk {Y}
- `control_with_evidence_requirement` — {X} is a directive information content entity that requires evidence {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `verification_produces_evidence` — {X} is a process that produces evidence {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_control_only_addresses_threat_class`](tables/t_control_only_addresses_threat_class.sql) — realizes `control_only_addresses_threat_class`
- [`t_control_with_evidence_requirement`](tables/t_control_with_evidence_requirement.sql) — realizes `control_with_evidence_requirement`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
- [`t_verification_produces_evidence`](tables/t_verification_produces_evidence.sql) — realizes `verification_produces_evidence`
