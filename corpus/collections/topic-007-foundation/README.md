# Collection — topic 7 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **17 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): 3rd WORLD CONFERENCE on DESIGN, ARTS AND EDUCATION- DAE-2014 May 02-03, 2014 Royal Princess Hotel Conference Center ***** Dubrovnik, Croatia ABSTRACTS BOOK Organization Academic World Education and Research Center Non-profit international organization www.awer-center.org Organizating Committee Prof. Dr. Ayşe Çakır İlhan, Ankara University, Turkey Prof. Dr. Jesus Garcia Laborda, Universidad ... …

## Chapters

- [Chapter 4: Governance Frameworks and Directive Ontology in Compliance Systems](chapters/19444c4d624f3bed.md)
- [Chapter 4: Governance Directives and Evidentiary Verification Protocols](chapters/1f1c1de5845b2cfd.md)
- [Directive Governance in Compliance Auditing](chapters/238d20af78500b98.md)
- [Chapter 4: Directive Governance in Audit Trail Systems](chapters/25832af252392624.md)
- [Governance Frameworks: Directive Ontology and Evidence Verification](chapters/43c561135e03afee.md)
- [Chapter 4: Ontological Formalization of Directive Governance Structures](chapters/602e66489493df27.md)
- [Chapter 4: Directive Governance Patterns in Regulatory Compliance Systems](chapters/62dae991bced2987.md)
- [Chapter 4: Governance Frameworks and Directive Ontologies](chapters/68cbb47b24b88449.md)
- [Directive Governance Ontologies in Compliance Audit Systems](chapters/7746089e68e0b888.md)
- [Directive Governance in Laboratory Compliance Systems](chapters/8d7daef20b1b8298.md)
- [Chapter 4: Formal Ontologies of Governance and Compliance](chapters/9ea4858e5041e1ca.md)
- [Governance Directives and Verification Mechanisms](chapters/b62169b019ffc0a3.md)
- [Chapter 7: Formal Ontology of Governance Directives and Verification Protocols](chapters/ba94316c6fb857da.md)
- [Chapter 4: Semantic Modeling of Governance Directives and Verification Protocols](chapters/c3cc361c79bbbc58.md)
- [Chapter 4: Formal Ontology of Directive Governance and Verification Mechanisms](chapters/e13d36f1ab56ddf9.md)
- [Chapter 4: Governance Frameworks and Directive Ontology in Compliance Systems](chapters/e1b0065aeeeac5db.md)
- [Chapter 4: Governance Frameworks and Directive Ontologies for Information and Communication Entities](chapters/ef7be8196c1853d7.md)

## Ontology terms grounding this collection

- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `directive_not_obsolete` — {X} is not {Y}
- `policy_equiv_jurisdiction_and_scope` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:hasJurisdiction some {Y:Class}) and (sdg:governsScope some {Z:C
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `verification_min_one_evidence` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_directive_not_obsolete`](tables/t_directive_not_obsolete.sql) — realizes `directive_not_obsolete`
- [`t_policy_equiv_jurisdiction_and_scope`](tables/t_policy_equiv_jurisdiction_and_scope.sql) — realizes `policy_equiv_jurisdiction_and_scope`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence`
