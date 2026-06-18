# Collection — topic 38 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **23 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 38: topic 15, topic 20, topic 24, topic 33, topic 37, topic 44, topic 47, topic 62, topic 91, topic 94, topic 97, topic 101, topic 120, topic 122, topic 126, topic 127, topic 130, topic 131, topic 163, topic 170, topic 194, topic 196.

> **Topic gist** (representative FinePDFs text): UNITED STATES ENVIRONMENTAL PROTECTION AGENCY REGIONS 1595 Wynkoop Street DENVER, CO 80202-1129 PhOne 800-227-8917 http://www.epa.govlregion08 PORTIONS OF THIS DOCUMENT HAVE BEEN REDACTED. THE AGENCY HAS DETERMINED PORTIONS NOTED AS "**,, TO BE CONFIDENTIAL BUSINESS INFORMATION AND NOT TO BE RELEASED REDACTIONS APPEAR ON THE FOLLOWING PAGES OF THE TITLE V PETITION BEFORE THE ADMINISTRATOR UNI... …

## Chapters

- [Chapter 4: Ontological Structures in Regulatory Auditing and Data Verification](chapters/00548ea20f2d9c19.md)
- [Chapter 4: Ontological Foundations of Audit Evidence and Verification Protocols](chapters/1e2399b5ae7332fa.md)
- [Modeling Audit Processes and Evidence Linkage](chapters/21641d8a218a1477.md)
- [Chapter 7: Audit Processes for Dataset Classification and Verification](chapters/5a2f0a42678195eb.md)
- [Chapter 4: Governance Frameworks for Data Audit and Verification Protocols](chapters/5d5c30bf29759c2d.md)
- [Chapter 4: Ontological Foundations of Audit and Verification Processes](chapters/7df66ab9700f7f67.md)
- [Chapter 4: Ontological Foundations of Audit and Verification Processes](chapters/aac8cccd82072cd0.md)
- [Chapter 4: Audit Ontology and Evidence Verification in Governance Frameworks](chapters/b27b5395e4f77fa7.md)
- [Regulatory Audit Processes for Compliance Datasets](chapters/bc9c8c69a228c352.md)
- [Chapter 7: Ontological Foundations of Audit and Verification Processes](chapters/cad0b896a8e0e582.md)
- [Chapter 4: Ontological Foundations of Audit and Verification Processes](chapters/d7ede39ca86fcd5c.md)
- [Chapter 4: Governance Frameworks for Data Audit and Verification Processes](chapters/eaab83ca67bb6d51.md)

## Ontology terms grounding this collection

- `audit_basic` — {X} is a process
- `audit_with_findings` — {X} is a process that has findings {Y}
- `classification_basic` — {X} is a process
- `dataset_under_audit` — {X} is an artifact that under audit process
- `verification_min_one_evidence` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_audit_basic`](tables/t_audit_basic.sql) — realizes `audit_basic` · _shared with 5 other collection(s)_
- [`t_audit_with_findings`](tables/t_audit_with_findings.sql) — realizes `audit_with_findings` · _shared with 6 other collection(s)_
- [`t_classification_basic`](tables/t_classification_basic.sql) — realizes `classification_basic` · _shared with 2 other collection(s)_
- [`t_dataset_under_audit`](tables/t_dataset_under_audit.sql) — realizes `dataset_under_audit` · _shared with 5 other collection(s)_
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence` · _shared with 16 other collection(s)_
