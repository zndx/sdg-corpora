# Collection — topic 78 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **20 chapters** · **37 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 78: topic 4, topic 6, topic 7, topic 22, topic 31, topic 32, topic 49, topic 52, topic 56, topic 68, topic 72, topic 73, topic 74, topic 77, topic 89, topic 90, topic 96, topic 98, topic 102, topic 106, topic 111, topic 125, topic 127, topic 128, topic 130, topic 132, topic 138, topic 153, topic 154, topic 163, topic 171, topic 173, topic 174, topic 185, topic 190, topic 194.

> **Topic gist** (representative FinePDFs text): ENERGY STAR ® Residential New Construction Programs Historical Document This document is provided for reference because it has been superseded by a more recent Version or Revision. Please find current program documents on the Program Requirements webpage. Use of older Versions and Revisions, such as this document, are typically limited to homes and buildings with a permit date (or, for manufact... …

## Chapters

- [Directive Governance in Regulatory Compliance Ontologies](chapters/01cb5bf014994977.md)
- [Chapter 4: Relational Modeling of Compliance Directives and Evidence Chains](chapters/07a9c628ee5821d2.md)
- [Chapter 4: Governance Directives and Evidentiary Compliance Frameworks](chapters/09fe8794e6b55cb1.md)
- [Chapter 4: Governance Frameworks and the Ontology of Compliance](chapters/108fe5f2fead64f4.md)
- [Chapter 4: Ontological Foundations of Compliance Governance](chapters/1233938eadb5e5b1.md)
- [Directive Governance in Data Protection Compliance](chapters/1717fabd105d0248.md)
- [Modeling Directive Information Content Entities in Audit Governance Schemas](chapters/17a26d4ddb7c4909.md)
- [Chapter 7: Ontological Mapping of Regulatory Directives and Evidentiary Controls](chapters/24f8281aa22e7ab0.md)
- [Chapter 4: Governance Frameworks and Evidence Traceability in Compliance Architectures](chapters/3f07939d95fe4c29.md)
- [Chapter 4: Regulatory Compliance and Evidence Management in Distributed Systems](chapters/5fd44d824a8af271.md)
- [Chapter 4: Jurisdictional Directives and Evidentiary Compliance](chapters/60f6bbd0c72a25f1.md)
- [Chapter 4: Formalization of Regulatory Directives and Evidentiary Traceability](chapters/940504782e280f8c.md)
- [Chapter 4: Governance Frameworks and Evidence Traceability in Compliance Architectures](chapters/9e3480bc11de2339.md)
- [Chapter 4: Governance Frameworks and Evidence Traceability in Regulatory Compliance](chapters/bf9744e87f01c2d4.md)
- [Chapter 4: Governance Directives and Evidence Traceability in Regulatory Compliance Frameworks](chapters/bfe73f1cfa47771a.md)
- [Chapter 4: Ontological Foundations of Regulatory Compliance and Evidence Management](chapters/df537c1158b3cc6f.md)
- [Chapter 7: Governance Frameworks and Regulatory Compliance Mapping](chapters/e396cdbdc7f30334.md)
- [Chapter 9: Directive Information Content Entities in Regulatory Audit Trails](chapters/eeed8f1597393b04.md)
- [Chapter 4: Regulatory Alignment and Evidence Governance Frameworks](chapters/f3e67dc7bd812648.md)
- [Governance Frameworks: Jurisdictional Scope and Evidence Traceability](chapters/f604dcde17688b92.md)

## Ontology terms grounding this collection

- `control_with_evidence_requirement` — {X} is a directive information content entity that requires evidence {Y}
- `gdpr_lawful_basis` — {X} is a directive information content entity that has lawful basis {Y}
- `policy_equiv_jurisdiction_and_scope` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:hasJurisdiction some {Y:Class}) and (sdg:governsScope some {Z:C
- `policy_with_jurisdiction` — {X} is a directive information content entity that has jurisdiction {Y}
- `trace_supports_claim` — {X} is a process that supports claim descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_control_with_evidence_requirement`](tables/t_control_with_evidence_requirement.sql) — realizes `control_with_evidence_requirement` · _shared with 14 other collection(s)_
- [`t_gdpr_lawful_basis`](tables/t_gdpr_lawful_basis.sql) — realizes `gdpr_lawful_basis` · _shared with 9 other collection(s)_
- [`t_policy_equiv_jurisdiction_and_scope`](tables/t_policy_equiv_jurisdiction_and_scope.sql) — realizes `policy_equiv_jurisdiction_and_scope` · _shared with 3 other collection(s)_
- [`t_policy_with_jurisdiction`](tables/t_policy_with_jurisdiction.sql) — realizes `policy_with_jurisdiction` · _shared with 2 other collection(s)_
- [`t_trace_supports_claim`](tables/t_trace_supports_claim.sql) — realizes `trace_supports_claim` · _shared with 13 other collection(s)_
