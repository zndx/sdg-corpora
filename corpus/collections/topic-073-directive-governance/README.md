# Collection — topic 73 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **18 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 73: topic 5, topic 23, topic 27, topic 31, topic 32, topic 42, topic 64, topic 83, topic 101, topic 109, topic 113, topic 122, topic 125, topic 134, topic 162, topic 169, topic 199.

> **Topic gist** (representative FinePDFs text): 1. Evaluation of the judicial systems (2016-2018 cycle) Serbia Reference data 2016 (01/01/2016 - 31/12/2016) Start/end date of the data collection campaign : 01/06/2017 - 31/12/2017 Objective : The CEPEJ decided, at its 28th plenary meeting, to launch the seventh evaluation cycle 2016 – 2018, focused on 2016 data. The CEPEJ wishes to use the methodology developed in the previous cycles to get... …

## Chapters

- [Chapter 4: Governance Frameworks for Data Compliance and Audit Protocols](chapters/0740f7d3573e2da2.md)
- [Chapter 4: GDPR Attestations and Directive Governance in School Oversight](chapters/1ee9f8877137ffa6.md)
- [Chapter 4: Directive Governance and Evidence Anchoring in Regulatory Ontologies](chapters/3c9ccb7bb628a678.md)
- [Chapter 4: Governance Frameworks and Directive Compliance Verification](chapters/8705cf58eed7351e.md)
- [Chapter 4: Governance Structures and Regulatory Compliance Frameworks](chapters/874541d01dca0fcd.md)
- [Chapter 4: Governance Frameworks and Evidence Chains in Regulatory Compliance](chapters/8f638a53b58132ce.md)
- [Chapter 4: Governance Frameworks and Evidence-Based Compliance in Data Processing](chapters/bf341043f1cf192c.md)
- [Chapter 4: Governance Frameworks and Evidence Verification in Regulatory Compliance](chapters/c0a287e3d60312a1.md)
- [Chapter 4: Governance Frameworks and Attestation Protocols](chapters/d101b18b4694bdc6.md)
- [Chapter 4: Governance Frameworks and Compliance Attestation Protocols](chapters/f84ab090b08e958b.md)

## Ontology terms grounding this collection

- `attestation_signed_by` — {X} is a process that signed by person
- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_conducted_by` — {X} is a process that conducted by person
- `gdpr_lawful_basis` — {X} is a directive information content entity that has lawful basis {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 21 other collection(s)_
- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence` · _shared with 34 other collection(s)_
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by` · _shared with 19 other collection(s)_
- [`t_gdpr_lawful_basis`](tables/t_gdpr_lawful_basis.sql) — realizes `gdpr_lawful_basis` · _shared with 9 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
