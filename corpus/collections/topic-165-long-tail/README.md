# Collection — topic 165 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **14 chapters** · **25 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 165: topic 15, topic 21, topic 22, topic 24, topic 42, topic 53, topic 68, topic 72, topic 77, topic 78, topic 83, topic 103, topic 106, topic 110, topic 118, topic 133, topic 134, topic 143, topic 145, topic 146, topic 159, topic 169, topic 174, topic 188.

> **Topic gist** (representative FinePDFs text): Malaria Journal Bio Med Central Research Open Access 'A mate or a meal' – Pre-gravid behaviour of female Anopheles gambiae from the islands of São Tomé and Príncipe, West Africa J Derek Charlwood* 1,2 , Joao Pinto 1 , Carla A Sousa 3 , Conceicao Ferreira 4 , Vincenso Petrarca 5 and Virgilio do E Rosario 1 Address: 1 Centro de Málaria e outras Doenças Tropicais, Instituto de Higiene e Medic... …

## Chapters

- [Chapter 4: Formal Ontology of PCI DSS Governance and Control Mechanisms](chapters/0155cb9d9b7da648.md)
- [Chapter 7: Directive Governance and Traceability in PCI DSS Audit Records](chapters/03c85497e770276e.md)
- [Governance Frameworks: PCI-DSS Implementation and Audit Evidence](chapters/163599b1b765aab8.md)
- [Chapter 4: Formalizing Compliance Directives and Audit Trails](chapters/37e6ba5796a16289.md)
- [Governance Frameworks: Compliance, Attestation, and Risk Control in PCI Environments](chapters/543d4f2d15224006.md)
- [Chapter 7: Formal Ontology of PCI DSS Governance and Audit Evidence](chapters/77aa87f642f5f4e5.md)
- [Chapter 7: Formal Ontology of PCI DSS Governance and Audit Verification](chapters/9040cc081a957182.md)
- [Chapter 4: Relational Projection of DirectiveICE and Claim-Support Axioms in PCI DSS Audit Trails](chapters/988843e97e9e9abf.md)
- [Chapter 4. Directive Governance in PCI DSS Compliance Records](chapters/b56858f997f7e7c0.md)
- [Chapter 7: Formal Ontology of Compliance Governance](chapters/d2b1102b5f2c08e5.md)
- [Chapter 7: Formal Ontology of Compliance Directives and Audit Evidence](chapters/d3fd7122c72c2846.md)
- [Chapter 4: Directive Information Content Entities in PCI DSS Compliance Verification](chapters/ebb7f87a4e6131e1.md)
- [Formal Ontology of Compliance Artifacts: A PCI DSS Governance Framework](chapters/fd469734ff7949fb.md)
- [Chapter 4: Ontological Formalization of Compliance Artifacts](chapters/fe4ca9e46b6eb2f4.md)

## Ontology terms grounding this collection

- `attestation_signed_by` — {X} is a process that signed by person
- `control_only_addresses_threat_class` — {X} is a directive information content entity that addresses risk {Y}
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `trace_supports_claim` — {X} is a process that supports claim descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 21 other collection(s)_
- [`t_control_only_addresses_threat_class`](tables/t_control_only_addresses_threat_class.sql) — realizes `control_only_addresses_threat_class` · _shared with 15 other collection(s)_
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement` · _shared with 27 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
- [`t_trace_supports_claim`](tables/t_trace_supports_claim.sql) — realizes `trace_supports_claim` · _shared with 13 other collection(s)_
