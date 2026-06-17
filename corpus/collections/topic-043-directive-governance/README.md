# Collection — topic 43 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): OFFICE OF POLICY AND MANAGEMENT OFFICE OF THE SECRETARY Jeffrey R. Beckham, Secretary Paul E. Potamianos, Deputy Secretary Charlene Casamento, Undersecretary Matthew Dayton, Undersecretary Martin Heft, Undersecretary David Krayeski, Undersecretary Susan Sherman, Undersecretary Claudio Gualtieri, Senior Policy Advisor to the Secretary Alexis Aronne, Executive Secretary Allison Blancato, Executi... …

## Chapters

- [Corporate Governance Directive Schema](chapters/1a101032631ea02c.md)
- [Chapter 4: Governance Frameworks and Verification Protocols](chapters/1c39b89bf8a10b0b.md)
- [Directive Governance in Corporate Audit Processes](chapters/2ef69941c37e4dff.md)
- [Corporate Governance Audit Ontologies in Relational Form](chapters/3386e9b965990982.md)
- [Chapter 7: Governance Frameworks and Audit Verification Protocols](chapters/3e5f82620e411ead.md)
- [Chapter 7: Governance Protocols for Audit and Attestation Verification](chapters/5eeab6adc4042c33.md)
- [Directive Governance Ontologies in Audit Trail Schemas](chapters/63ab140bb3f44f1b.md)
- [Chapter 4: Ontological Constraints in Governance and Audit Frameworks](chapters/81ec4825f91608c8.md)
- [Chapter 7: Directive Verification and Attestation in Governance Records](chapters/8ded27293b3665b7.md)
- [Chapter 7: Ontological Constraints in Governance Verification Protocols](chapters/a1cb48fbb918fe15.md)
- [Chapter 4: Ontological Foundations of Audit Governance](chapters/a7c6152804badf57.md)
- [Chapter 4: Governance Frameworks: Audit Verification and Attestation Protocols](chapters/cfaef61176e1965c.md)
- [Chapter 7: Governance Structures and Verification Protocols](chapters/d08087898e79cafa.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `audit_conducted_by` — {X} is a process that conducted by person
- `audit_for_period` — {X} is a process that for audit period {Y}
- `requirement_min_one_verification` — {X} is a directive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer`
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by`
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by`
- [`t_audit_for_period`](tables/t_audit_for_period.sql) — realizes `audit_for_period`
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification`
