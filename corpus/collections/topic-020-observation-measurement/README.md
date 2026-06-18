# Collection — topic 20 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **18 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 20: topic 6, topic 34, topic 40, topic 64, topic 71, topic 74, topic 80, topic 99, topic 100, topic 119, topic 120, topic 151, topic 154, topic 162, topic 169, topic 170, topic 191.

> **Topic gist** (representative FinePDFs text): Manufacturer declaration EHEDG and 3-A, Installation and Cleaning Instructions Hygienic process fittings Document ID: 63436 # Contents 1 About this document ................................................................. 3 1.1 Function ........................................................................... 3 1.2 Scope .................................................................. …

## Chapters

- [Chapter 4: Directive Governance Structures in Municipal Compliance Audits](chapters/0f9efc9a69b408ca.md)
- [Governance Frameworks: Directives, Audits, and Attestations](chapters/4d3a53408610b322.md)
- [Chapter 7: Ontological Structures in Governance and Audit Compliance](chapters/67c6e395133f20aa.md)
- [Directive Governance in Municipal Compliance Audits](chapters/8d43f28d4d2e0549.md)
- [Chapter 4: Governance Frameworks and Audit Compliance Protocols](chapters/96c366474411703c.md)
- [Chapter 4: Governance Directives and Audit Verification Mechanisms](chapters/a40ec41e1525ab27.md)
- [Audit Governance Relations in Directive Information Systems](chapters/ae9012d135f25cc0.md)
- [Chapter 4: Governance Frameworks and Audit Ontologies](chapters/b32a37f5b17e1b0c.md)
- [Chapter 4: Directive Governance Ontologies Projected to Audit Compliance Schemas](chapters/bd4edaf046fdee86.md)

## Ontology terms grounding this collection

- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_conducted_by` — {X} is a process that conducted by person
- `audit_for_period` — {X} is a process that for audit period {Y}
- `policy_min_one_enforcer` — {X} is a directive information content entity
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence` · _shared with 34 other collection(s)_
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by` · _shared with 19 other collection(s)_
- [`t_audit_for_period`](tables/t_audit_for_period.sql) — realizes `audit_for_period` · _shared with 11 other collection(s)_
- [`t_policy_min_one_enforcer`](tables/t_policy_min_one_enforcer.sql) — realizes `policy_min_one_enforcer` · _shared with 6 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
