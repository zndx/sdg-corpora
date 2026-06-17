# Collection — topic 20 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **5 ontology terms** · **5 underlying tables**.

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

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by`
- [`t_audit_for_period`](tables/t_audit_for_period.sql) — realizes `audit_for_period`
- [`t_policy_min_one_enforcer`](tables/t_policy_min_one_enforcer.sql) — realizes `policy_min_one_enforcer`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
