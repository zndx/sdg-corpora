# Collection — topic 96 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **26 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 96: topic 6, topic 14, topic 23, topic 24, topic 33, topic 39, topic 76, topic 83, topic 93, topic 94, topic 99, topic 101, topic 112, topic 114, topic 120, topic 123, topic 126, topic 132, topic 153, topic 154, topic 159, topic 162, topic 163, topic 164, topic 166.

> **Topic gist** (representative FinePDFs text): 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 FOOD AND DRUG ADMINISTRATION CENTER FOR DRUG EVALUATION AND RESEARCH ONCOLOGIC DRUGS ADVISORY COMMITTEE (ODAC) Afternoon Session Thursday, July 13, 2017 1:01 p.m. to 4:09 p.m. FDA White Oak Campus White Oak Conference Center The Great Room Silver Spring, Maryland 1 ``` Brian I. Rini, MD, FACP 1 (afternoon sessio... …

## Chapters

- [Chapter 4: Structural Governance and the Ontology of Compliance Directives](chapters/0ffb5fd186d8d7cf.md)
- [Governance Frameworks and PCI DSS Compliance Directives](chapters/4232ad0fe41b2b65.md)
- [Chapter 4: Governance Frameworks and Directive Compliance Structures](chapters/4af97e67ff04f648.md)
- [Governance Frameworks for PCI DSS: Ontological Formalization and Compliance Artifacts](chapters/5230840182561915.md)
- [Chapter 4: Formal Ontology of Compliance Directives and Governance Frameworks](chapters/5f4455f43352c22f.md)
- [Chapter 7: Governance Frameworks and Compliance Ontology in PCI DSS Environments](chapters/6ff8d7b44acfca8c.md)
- [Chapter 4: Formalization of Directive Governance and PCI-DSS Compliance Mapping](chapters/72e184056ab0595a.md)
- [Directive Governance in PCI DSS Compliance Models](chapters/c4113afabf00ac4c.md)
- [Chapter 4: Governance Frameworks and PCI DSS Compliance Ontology](chapters/c767e212ef441373.md)
- [Chapter 4: Governance Frameworks and Compliance Mapping in Secure Environments](chapters/c7815b9977858f30.md)
- [Directive Governance Models for PCI DSS Compliance](chapters/cc399ae48dc33f27.md)
- [Chapter 4: Governance Frameworks and Compliance Directives](chapters/d571f3ca8d212657.md)
- [Chapter 4: Ontological Mapping of PCI DSS Governance Structures](chapters/ec3974191d4c70ed.md)

## Ontology terms grounding this collection

- `attestation_signed_by` — {X} is a process that signed by person
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `policy_equiv_jurisdiction_and_scope` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:hasJurisdiction some {Y:Class}) and (sdg:governsScope some {Z:C
- `policy_min_one_enforcer` — {X} is a directive information content entity
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 21 other collection(s)_
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement` · _shared with 27 other collection(s)_
- [`t_policy_equiv_jurisdiction_and_scope`](tables/t_policy_equiv_jurisdiction_and_scope.sql) — realizes `policy_equiv_jurisdiction_and_scope` · _shared with 3 other collection(s)_
- [`t_policy_min_one_enforcer`](tables/t_policy_min_one_enforcer.sql) — realizes `policy_min_one_enforcer` · _shared with 6 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
