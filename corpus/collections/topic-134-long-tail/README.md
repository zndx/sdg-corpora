# Collection — topic 134 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): November 13, 2014 CBCA 3300, 3354, 3538 BRASFIELD & GORRIE, LLC, Appellant, v. DEPARTMENT OF VETERANS AFFAIRS, Respondent. Laurence Schor, Dennis C. Ehlers, and Robert D. Pratt of Asmar, Schor & McKenna, PLLC, Washington, DC; and Axel Bolvig III, Luke D. Martin, and J. Christopher Selman of Bradley Arant Boult Cummings, LLP, Birmingham, AL, counsel for Appellant. Stacey North-Willis, Beth C... …

## Chapters

- [Chapter 4: Regulatory Compliance and Evidence Management in Information Security Governance](chapters/04a7e4f995587d2d.md)
- [Chapter 4: Governance Frameworks and Evidence-Based Compliance Mapping](chapters/1f1967875c83a0cd.md)
- [Chapter 7: Interoperable Governance Frameworks and Evidence Management](chapters/4ec08ceecdffd585.md)
- [Chapter 4: Governance Frameworks and Evidence-Based Compliance Directives](chapters/663496f3ce9d725c.md)
- [Chapter 4: Ontological Formalization of Compliance Directives and Evidence Chains](chapters/7a26565ca94fbb15.md)
- [Governance Frameworks: Compliance Mapping and Evidence Management](chapters/8780defcdd4de946.md)
- [Chapter 4: Directive Governance and Evidence Correlation in Compliance Frameworks](chapters/9a6dcc963c578d62.md)
- [Chapter 4: Governance Frameworks and Evidence Correlation in Multi-Regulatory Environments](chapters/b5a9192988411b7c.md)
- [Compliance Directive Modeling in Evidence-Based Audit Systems](chapters/d7b4350220512e78.md)
- [Chapter 4: Governance Frameworks and Semantic Interoperability in Compliance Ontologies](chapters/db1cbf362a518907.md)
- [Chapter 4: Governance Frameworks and Evidence-Based Compliance Directives](chapters/e966a09d49e80268.md)
- [Chapter 4: Governance Frameworks and Evidence Correlation in Multi-Regulatory Environments](chapters/f0d60cac2a2bd9a8.md)
- [Governance Frameworks: Evidence, Attestation, and Compliance Mapping](chapters/f6b85d1a41c8ab55.md)

## Ontology terms grounding this collection

- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `control_with_evidence_requirement` — {X} is a directive information content entity that requires evidence {Y}
- `hipaa_safeguard_technical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_control_with_evidence_requirement`](tables/t_control_with_evidence_requirement.sql) — realizes `control_with_evidence_requirement`
- [`t_hipaa_safeguard_technical`](tables/t_hipaa_safeguard_technical.sql) — realizes `hipaa_safeguard_technical`
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
