# Collection — topic 47 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): An Efficient Method for Evaluating the Effect of Lattice Vibrations on the NMR Second Moment ROLF SJÖBLOM* Institute of Chemistry, University of Uppsala, S-75121 Uppsala, Sweden AND URI SHMUELI Department of Chemistry, Tel-Aviv University, 61390 Ramat-Aviv, Israel Received September 7, 1978 An improved algorithm for the evaluation of intra- and inter-molecular contributions to the NMR secon... …

## Chapters

- [Chapter 4: Compliance Frameworks and Directive Ontology in Multi-Regulatory Environments](chapters/2ae147af95560bc0.md)
- [Chapter 4: Formal Ontology of Compliance Directives](chapters/3563cbe4ce6b5615.md)
- [4 Directive Governance in Relational Form](chapters/3e2320ac5ab71edb.md)
- [Chapter 4: Formalization of Regulatory Directives and Safeguard Implementation](chapters/52f956f6e6f10eb6.md)
- [Chapter 4: Ontological Formalization of Cross-Regulatory Compliance Directives](chapters/737d3a561a6658b2.md)
- [Regulatory Directive Compliance Schema](chapters/744a43c551ec79fa.md)
- [Chapter 4: Regulatory Directive Mapping and Ontological Formalization](chapters/d8669ccb5ba7c198.md)
- [Chapter 4: Regulatory Directives and Compliance Frameworks](chapters/f33e32cef762ea79.md)
- [Chapter 4: Regulatory Directive Mapping and Control Equivalence Frameworks](chapters/f743bd2befa44bdb.md)

## Ontology terms grounding this collection

- `hipaa_safeguard_admin` — {X} is a directive information content entity that hipaa safeguard {Y}
- `hipaa_safeguard_physical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `hipaa_safeguard_technical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_hipaa_safeguard_admin`](tables/t_hipaa_safeguard_admin.sql) — realizes `hipaa_safeguard_admin`
- [`t_hipaa_safeguard_physical`](tables/t_hipaa_safeguard_physical.sql) — realizes `hipaa_safeguard_physical`
- [`t_hipaa_safeguard_technical`](tables/t_hipaa_safeguard_technical.sql) — realizes `hipaa_safeguard_technical`
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
