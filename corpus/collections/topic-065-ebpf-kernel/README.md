# Collection — topic 65 · 04_ebpf_kernel

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Mapping Streambased Applications to an Intel IXP Network Processor using Compaan —MASTER'S THESIS— of Johan Walters student nr.: 9917047 firstname.lastname@example.org and David Snuijf student nr.: 9921354 email@example.com Supervisors: Dr. ir. Bart Kienhuis Dr. ir. Todor Stefanov LIACS Leiden University August 31st, 2006 Contents List of Figures 8.1 Receiving on two sourcenodes . . . . .... …

## Chapters

- [Chapter 4: Governance Protocols for Regulatory Compliance](chapters/04b764d2faef3bb5.md)
- [Chapter 4: Ontological Structures for Governance and Compliance Verification](chapters/1202161ba15ce706.md)
- [Chapter 7: Formal Governance Structures and Evidentiary Traceability](chapters/1507a983cb6037e4.md)
- [Chapter 4: Ontological Foundations for Governance and Audit Traceability](chapters/1b4b418f3a3a71d5.md)
- [Chapter 4: Governance Frameworks for Digital Attestation and Audit Traceability](chapters/3275f636e4c8f6a3.md)
- [Chapter 4: Governance Structures and Attestation Protocols](chapters/357bd1e89814baf5.md)
- [Chapter 4: Governance Protocols for Attestation and Evidence Verification](chapters/3e298e1d6cb86f2e.md)
- [Regulatory Attestation and Audit Traceability](chapters/4483b58f312b06e9.md)
- [Chapter 7: Formal Ontology of Governance Processes and Verification Mechanisms](chapters/6d91297d9798306a.md)
- [Chapter 4: Ontological Structures for Governance and Audit Verification](chapters/6ea0da24bfec0f27.md)
- [Chapter 4: Governance Frameworks and Attestation Protocols](chapters/863e4c7b54a04298.md)
- [Chapter 4: Governance Protocols and Evidence Traceability](chapters/9ea972c7894513ef.md)
- [Chapter 4: Governance Frameworks and Audit Compliance Protocols](chapters/c778c60c0d4df61b.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `audit_for_period` — {X} is a process that for audit period {Y}
- `requirement_min_one_verification` — {X} is a directive information content entity
- `trace_supports_claim` — {X} is a process that supports claim descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer`
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by`
- [`t_audit_for_period`](tables/t_audit_for_period.sql) — realizes `audit_for_period`
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification`
- [`t_trace_supports_claim`](tables/t_trace_supports_claim.sql) — realizes `trace_supports_claim`
