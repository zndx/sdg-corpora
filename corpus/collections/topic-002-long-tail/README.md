# Collection — topic 2 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **24 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 2: topic 24, topic 25, topic 33, topic 37, topic 38, topic 42, topic 43, topic 47, topic 58, topic 78, topic 81, topic 88, topic 92, topic 103, topic 122, topic 133, topic 151, topic 170, topic 181, topic 185, topic 186, topic 196, topic 197.

> **Topic gist** (representative FinePDFs text): The petitioner is seeking the approval of the Site Development Plan package that would allow for the development of this 1.6 acre site into the authorized senior care center housing 95 beds. This Site Development Plan package includes the engineered plan, Landscape Plan, and Lighting Plan. The Site Plan Subcommittee is recommending the approval of the Site Development Plan package that would allo. …

## Chapters

- [Chapter 4: Governance Frameworks and Audit Ontologies](chapters/2f3b9a22131bacd3.md)
- [Chapter 4: Governance Frameworks and Compliance Ontologies](chapters/3c1122083fba4226.md)
- [Chapter 4: Governance Frameworks and Audit Protocol Ontologies](chapters/6e0584ce96d66d66.md)
- [Chapter 4: Ontological Formalization of Audit Governance and PCI DSS Compliance](chapters/7d3ab751f6ef9603.md)
- [Chapter 4: Governance Frameworks and the Ontology of Compliance Auditing](chapters/9cb83e217a15b7c3.md)
- [Chapter 4: Governance Ontology and Relational Compliance Structures](chapters/ac18dce42af42301.md)
- [Chapter 4: Governance Frameworks for PCI DSS Compliance Audits](chapters/ad822831de875c4c.md)
- [Chapter 4: Governance Frameworks and Compliance Verification Mechanisms](chapters/bc73c4fbc9601508.md)
- [Chapter 4: Governance Directives, Audit Processes, and Attestation Mechanisms](chapters/c7e3d432455ce9ee.md)
- [Chapter 7: Ontological Structures in Governance and Compliance Auditing](chapters/cd1434961aa5e7e5.md)
- [Chapter 4: Formal Verification Mechanisms in PCI-DSS Governance Frameworks](chapters/e0d781d9f02405bb.md)
- [Directive Governance in PCI DSS Attestation Processes](chapters/f00aa1806d2e51cc.md)

## Ontology terms grounding this collection

- `attestation_signed_by` — {X} is a process that signed by person
- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_conducted_by` — {X} is a process that conducted by person
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 21 other collection(s)_
- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence` · _shared with 34 other collection(s)_
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by` · _shared with 19 other collection(s)_
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement` · _shared with 27 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
