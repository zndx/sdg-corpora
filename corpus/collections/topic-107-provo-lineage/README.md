# Collection — topic 107 · 05_provo_lineage

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Biology 115: Introductory Plant Biology Laboratory The University of Tennessee, Spring, 2017 2 credits: 1 credit lab, 1 credit discussion Catalog Description: Laboratory work will analyze plant structure, morphology, and function, with an emphasis on methods for observation, identification, and data collection. The discussion will focus on agricultural priority areas of the future: sustainable... …

## Chapters

- [Audit Evidence and Directive Management in Examination Processes](chapters/487f8d4d0e9dbaea.md)
- [Chapter 4: Governance Frameworks and the Ontology of Assurance](chapters/4be4642d36c461fe.md)
- [Chapter 4: Formalization of Governance Artifacts and Evidence Chains](chapters/4dda297e0668a44a.md)
- [Governance Artifacts and Evidentiary Structures](chapters/69b0821beb027150.md)
- [Chapter 7: Governance Ontology and Evidence Provenance](chapters/704d30695276e757.md)
- [Audit Trail Modeling for Facility Maintenance Directives](chapters/7488e95dca64673c.md)
- [Chapter 7: Relational Encoding of Audit, Directive and Attestation Ontologies](chapters/822608c931b9613e.md)
- [Chapter 4: The Ontology of Audit Evidence and Governance Directives](chapters/a39b5de71f3ae9d0.md)
- [Chapter 4: Ontological Foundations of Audit Evidence and Governance Directives](chapters/b23e6f9621a119d6.md)
- [Audit Evidence Structures in Compliance Reporting](chapters/c448e9a204fb0291.md)
- [Regulatory Audit Modeling: Evidence Production and Directive Governance](chapters/d998c4dc9bdb3e63.md)
- [Chapter 4: Structural Ontology of Compliance Artifacts](chapters/df41b12a01a3494c.md)

## Ontology terms grounding this collection

- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_produces_evidence` — {X} is a process that produces evidence descriptive information content entity
- `claim_min_one_evidence` — {X} is a descriptive information content entity
- `directive_authored_and_applies` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:authoredBy some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `evidence_basic` — {X} is a descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_audit_produces_evidence`](tables/t_audit_produces_evidence.sql) — realizes `audit_produces_evidence`
- [`t_claim_min_one_evidence`](tables/t_claim_min_one_evidence.sql) — realizes `claim_min_one_evidence`
- [`t_directive_authored_and_applies`](tables/t_directive_authored_and_applies.sql) — realizes `directive_authored_and_applies`
- [`t_evidence_basic`](tables/t_evidence_basic.sql) — realizes `evidence_basic`
