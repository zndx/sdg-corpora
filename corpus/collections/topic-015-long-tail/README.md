# Collection — topic 15 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **17 chapters** · **31 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 15: topic 7, topic 8, topic 21, topic 22, topic 26, topic 32, topic 42, topic 47, topic 54, topic 71, topic 73, topic 75, topic 83, topic 100, topic 104, topic 111, topic 120, topic 122, topic 125, topic 128, topic 134, topic 144, topic 155, topic 160, topic 162, topic 166, topic 171, topic 191, topic 193, topic 196.

> **Topic gist** (representative FinePDFs text): Warwick Research in Nursing Warwick Medical School University of Warwick 17th Annual Report 1st August 2023 to 31st July 2024 | Contents | Page | |-----------------------------------------------|------| | Director’s Message | 3 | | Summary of Progress | 4 | | Senior staff - Warwick Research in Nursin... …

## Chapters

- [Chapter 4: Interoperability of Governance Directives and Control Frameworks](chapters/07c04ecf1c3bb572.md)
- [Chapter 4: Governance Frameworks and Control Harmonization in Multi-Standard Environments](chapters/26a54cdfcc2903e6.md)
- [Modeling DirectiveICE Subclasses for ISO 27001 and PCI DSS Compliance](chapters/55d5047a72f43213.md)
- [Chapter 4. Relational Projection of Directive ICE Governance Axioms](chapters/56d825fe0606453a.md)
- [Chapter 7: Formal Ontology of Governance Directives and Compliance Controls](chapters/645a24a815425969.md)
- [Chapter 4: Governance Frameworks and Control Mapping in Multi-Regulatory Environments](chapters/702547556dd39336.md)
- [Chapter 4: Interoperability of Compliance Directives and Risk Taxonomies](chapters/78c495359583f6c4.md)
- [Chapter 4: Governance Frameworks and Directive Mapping in Multi-Standard Compliance](chapters/7b09d6476879774b.md)
- [Chapter 4: Ontological Mapping of Governance Frameworks and Control Directives](chapters/84adb009c9ad3b86.md)
- [87b1a8a28d91067d](chapters/87b1a8a28d91067d.md)
- [Compliance Directive Schema for ISO 27001 and PCI DSS Controls](chapters/b4a71635cbf7f942.md)
- [Chapter 4: Axiomatic Mapping of Compliance Controls and Risk Mitigation Frameworks](chapters/bea39248f81a6b1b.md)
- [Chapter 4. Directive Controls in Information Security Governance](chapters/d07a5ff649e3895c.md)
- [Chapter 4: Governance Frameworks and Risk Mapping in Information Security Compliance](chapters/e40e2846d1d59d79.md)
- [Chapter 4: Governance Frameworks and Control Mapping in Compliance Ontologies](chapters/e55d9c0323cb5fda.md)
- [Chapter 4: Ontological Mapping of Compliance Directives and Risk Mitigation](chapters/e7aba18262ed0bc6.md)
- [Chapter 7: Relational Projections of Directive ICE Ontologies for ISO 27001 and PCI DSS Audit Trails](chapters/f16678b654ab4233.md)

## Ontology terms grounding this collection

- `control_addresses_risk` — {X} is a directive information content entity that addresses risk {Y}
- `control_only_addresses_threat_class` — {X} is a directive information content entity that addresses risk {Y}
- `iso27001_annexa_subclass` — {X} is a directive information content entity that iso27001 annex a {Y}
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_control_addresses_risk`](tables/t_control_addresses_risk.sql) — realizes `control_addresses_risk` · _shared with 6 other collection(s)_
- [`t_control_only_addresses_threat_class`](tables/t_control_only_addresses_threat_class.sql) — realizes `control_only_addresses_threat_class` · _shared with 15 other collection(s)_
- [`t_iso27001_annexa_subclass`](tables/t_iso27001_annexa_subclass.sql) — realizes `iso27001_annexa_subclass` · _shared with 8 other collection(s)_
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement` · _shared with 27 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
