# Collection — topic 7 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **17 chapters** · **35 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 7: topic 2, topic 21, topic 30, topic 31, topic 35, topic 46, topic 47, topic 52, topic 53, topic 56, topic 66, topic 72, topic 75, topic 85, topic 92, topic 94, topic 100, topic 110, topic 123, topic 126, topic 129, topic 142, topic 143, topic 145, topic 151, topic 154, topic 155, topic 169, topic 178, topic 179, topic 187, topic 190, topic 194, topic 198.

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

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence` · _shared with 34 other collection(s)_
- [`t_directive_not_obsolete`](tables/t_directive_not_obsolete.sql) — realizes `directive_not_obsolete`
- [`t_policy_equiv_jurisdiction_and_scope`](tables/t_policy_equiv_jurisdiction_and_scope.sql) — realizes `policy_equiv_jurisdiction_and_scope` · _shared with 3 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence` · _shared with 16 other collection(s)_
