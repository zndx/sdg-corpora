# Collection — topic 37 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **5 chapters** · **11 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 37: topic 8, topic 31, topic 95, topic 112, topic 128, topic 143, topic 169, topic 178, topic 183, topic 187.

> **Topic gist** (representative FinePDFs text): AAVP Newsletter American Association of Veterinary Parasitologists Summer, 2021 Volume 43, Number 2 In this issue IN THIS ISSUE ................................................................... 1 FROM THE PRESIDENT ................................................. 2 FROM THE SECRETARY/TREASURER ........ …

## Chapters

- [Chapter 7: Ontological Formalization of Audit Processes and Evidence Artifacts](chapters/2edf0837787ecd22.md)
- [Chapter 4: Audit Trail Ontology and Evidence Verification Protocols](chapters/a7fcddddf0dc423d.md)
- [Chapter 4: Ontological Structures for Audit Governance and Attestation](chapters/c08f969003b7bf11.md)
- [Chapter 7: Formalization of Audit Lifecycle and Attestation Protocols](chapters/d4f12121a8a0429d.md)
- [Chapter 4: Ontological Foundations of Audit Governance and Attestation](chapters/dfbf5fdfd28e2ab6.md)

## Ontology terms grounding this collection

- `attestation_signed_by` — {X} is a process that signed by person
- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_conducted_by` — {X} is a process that conducted by person
- `audit_for_period` — {X} is a process that for audit period {Y}
- `dataset_under_audit` — {X} is an artifact that under audit process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 21 other collection(s)_
- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence` · _shared with 34 other collection(s)_
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by` · _shared with 19 other collection(s)_
- [`t_audit_for_period`](tables/t_audit_for_period.sql) — realizes `audit_for_period` · _shared with 11 other collection(s)_
- [`t_dataset_under_audit`](tables/t_dataset_under_audit.sql) — realizes `dataset_under_audit` · _shared with 5 other collection(s)_
