# Collection — topic 75 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): University of Calgary PRISM: University of Calgary's Digital Repository Research Centres, Institutes, Projects and Units Shift: The Project to End Domestic Violence 2020-09 Building a Case for Using "Coercive Control" in Alberta: Discussion Paper Lee, Lianne; Wells, Lana; Gray, Shawna M.; Esina, Elena Lee, L., Wells, L., Gray, S. & Esina, E. (2020). Building a case for using "Coercive Contr... …

## Chapters

- [Chapter 7: Formalization of Governance Directives and Attestation Mechanisms](chapters/17e5013be019aebf.md)
- [Chapter 7: Formalization of Directive Governance and Attestation Mechanisms](chapters/4d496b6a26b89e5c.md)
- [Chapter 4: Governance Frameworks and Directive Ontology in Regulatory Compliance](chapters/64245dcb73087ced.md)
- [Chapter 4: Structural Governance and Directive Compliance Frameworks](chapters/6694f4e3f91a3e50.md)
- [Chapter 4: Governance Structures and Compliance Mechanisms in Enterprise Ontologies](chapters/7bec1cc6db6e70a1.md)
- [Chapter 7: Directive Governance in Municipal Compliance Audit Trails](chapters/963f2350c9c2e75b.md)
- [Chapter 4: Formalization of Directive Governance and Compliance Verification](chapters/a31de4c40bfc4620.md)
- [Chapter 7: Governance Directives and Attestation Protocols](chapters/b65453e32c5f80ec.md)
- [Chapter 4: Governance Directives and Attestation Protocols](chapters/bebf61dcfffc8be1.md)
- [Chapter 4: Governance Structures in Sustainable Infrastructure Compliance](chapters/c8c05acfc5668f7d.md)
- [Chapter 4: Governance Frameworks and Directive Information Content Entities](chapters/e0b692ef708e57f1.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `policy_equiv_jurisdiction_and_scope` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:hasJurisdiction some {Y:Class}) and (sdg:governsScope some {Z:C
- `policy_min_one_enforcer` — {X} is a directive information content entity
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer`
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by`
- [`t_policy_equiv_jurisdiction_and_scope`](tables/t_policy_equiv_jurisdiction_and_scope.sql) — realizes `policy_equiv_jurisdiction_and_scope`
- [`t_policy_min_one_enforcer`](tables/t_policy_min_one_enforcer.sql) — realizes `policy_min_one_enforcer`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
