# Collection — topic 76 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Disinfection Profiling and Benchmarking Guidance Manual | Date | Event Description | |------------|-------------------| | 2023-10-01 | Annual Meeting | | 2023-11-15 | Workshop on Data Analysis | | 2024-02-28 | Conference on Machine Learning | DISCLAIMER This manual describes the practice of disinfection profiling and benchmarking as required under the U.S. Environmental Protection Agen... …

## Chapters

- [Chapter 4: Audit Trail Governance and Verification Protocols](chapters/1b34716e058c1d49.md)
- [Chapter 4: Governance Frameworks and Audit Verification Protocols](chapters/5d246fe46b251493.md)
- [Chapter 4: Formal Ontology of Audit Governance and Evidence Verification](chapters/5ff30b03d019624f.md)
- [Chapter 4: Governance Frameworks and Audit Evidence Management](chapters/81f1c32dd0039a91.md)
- [Audit Processes in Parish Governance Records](chapters/8697e95f58064135.md)
- [Chapter 4: Governance Protocols and Audit Lifecycle Ontologies](chapters/90cdf454fa758b7b.md)
- [Chapter 4: Directive Governance and Audit Lifecycle Ontologies](chapters/aa287defeeeb5e21.md)
- [Chapter 4: Ontological Foundations of Audit Governance](chapters/afb5dc548e47c49d.md)
- [Chapter 4: Directive Governance Processes in Audit Trails](chapters/c8861c5b1fcc81bf.md)
- [Chapter 7: Ontological Foundations of Audit Governance and Verification Protocols](chapters/cd0e22c7247afb66.md)
- [Chapter 7: Structural Integrity of Audit Processes and Evidence Verification](chapters/e989e0f64961dc8b.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `audit_conducted_by` — {X} is a process that conducted by person
- `audit_for_period` — {X} is a process that for audit period {Y}
- `audit_with_findings` — {X} is a process that has findings {Y}
- `verification_min_one_evidence` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer`
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by`
- [`t_audit_for_period`](tables/t_audit_for_period.sql) — realizes `audit_for_period`
- [`t_audit_with_findings`](tables/t_audit_with_findings.sql) — realizes `audit_with_findings`
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence`
