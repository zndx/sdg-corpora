# Collection — topic 179 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **19 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): Alzheimer Disease and Glioblastoma Expression in Glioma BY Maada-Korsu Joseph M Kandeh G20593108 University of Central Lancashire A thesis submitted in partial fulfilment for the requirements for the degree of MSc (by Research) at the University of Central Lancashire February 2024 RESEARCH STUDENT DECLARATION FORM Type of Award Master by Research School Pharmacy and Biomedical science ... …

## Chapters

- [Chapter 4: Ontological Formalization of Audit Lifecycle and Governance](chapters/135fa2f107144e58.md)
- [Chapter 4: Relational Representations of Audit Processes for Datasets](chapters/1cffd88f026d8ffe.md)
- [Audit Governance Ontologies in Relational Schema Form](chapters/2abbc7770d3f2e32.md)
- [Chapter 4: Directive Governance Ontologies in Audit Trail Systems](chapters/3592284cf24859d6.md)
- [Chapter 4: Ontological Formalization of Audit Governance and Compliance Frameworks](chapters/589b51e4590ad166.md)
- [Chapter 4: Formalization of Audit Assertions and Governance Controls](chapters/6530c844c084405b.md)
- [Chapter 4: Ontological Structuring of Audit Processes and Governance Artifacts](chapters/711e7dee1bf4dca9.md)
- [Chapter 4: Ontological Mapping of Audit Governance Structures](chapters/7e8d14b87fb3e622.md)
- [Chapter 4: Ontological Formalization of Audit Governance and Data Lineage](chapters/8ffde897566c0128.md)
- [Chapter 7: Ontological Formalization of Audit Processes and Governance Controls](chapters/9312d9a4571957b8.md)
- [Audit Governance Ontologies in Relational Schema Form](chapters/ac0d7f8c4fae404a.md)
- [Chapter 4: Ontological Structures in Audit Governance Frameworks](chapters/ad4d363be20d4f90.md)
- [Chapter 4: Audit Process Ontologies Projected to Relational Schemas](chapters/b34299036992e74e.md)
- [Chapter 4: Relational Mapping of Audit Governance Ontologies](chapters/b708a3d10ee4c758.md)
- [Audit Process Schema for Period Compliance](chapters/bba77daa3f4e3545.md)
- [Chapter 4: Ontological Structures in Governance Audit Frameworks](chapters/c4ee02709d550c81.md)
- [Chapter 4: Ontological Foundations of Audit Governance and Data Integrity](chapters/d3564e6afa5b55ec.md)
- [Chapter 4: Governance Frameworks and Audit Ontology Specification](chapters/f1a74b7e84a4b91e.md)
- [Chapter 4: Ontological Structures in Audit Governance](chapters/fde7f591e2543637.md)

## Ontology terms grounding this collection

- `audit_conducted_by` — {X} is a process that conducted by person
- `audit_for_period` — {X} is a process that for audit period {Y}
- `audit_subclass` — {X} is a process that audits control directive information content entity
- `dataset_under_audit` — {X} is an artifact that under audit process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by`
- [`t_audit_for_period`](tables/t_audit_for_period.sql) — realizes `audit_for_period`
- [`t_audit_subclass`](tables/t_audit_subclass.sql) — realizes `audit_subclass`
- [`t_dataset_under_audit`](tables/t_dataset_under_audit.sql) — realizes `dataset_under_audit`
