# Collection — topic 5 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **24 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 5: topic 20, topic 28, topic 30, topic 31, topic 35, topic 40, topic 47, topic 73, topic 90, topic 92, topic 97, topic 98, topic 102, topic 106, topic 123, topic 146, topic 149, topic 151, topic 157, topic 159, topic 170, topic 173, topic 196.

> **Topic gist** (representative FinePDFs text): Daily Comment By Patrick Fearon-Hernandez, CFA, and Thomas Wash Looking for something to read? See our Reading List; these books, separated by category, are ones we find interesting and insightful. We will be adding to the list over time. [Posted: May 12, 2022—9:30 AM EDT] Global equity markets are mostly lower this morning. In Europe, the EuroStoxx 50 index is currently down 2.2% from its prio... …

## Chapters

- [Chapter 4: Governance Frameworks and Directive Compliance Protocols](chapters/0cc1f56add3be6b7.md)
- [Governance Frameworks and Regulatory Compliance Mechanisms](chapters/1aa78d13bf87f8ec.md)
- [Chapter 7: Governance Ontology and Compliance Verification Mechanisms](chapters/42c054db3f3cafc5.md)
- [Chapter 4: Governance Frameworks and Regulatory Compliance Mechanisms](chapters/4493cb809d4cdb5f.md)
- [Chapter 4: Governance Frameworks for Regulatory Compliance and Attestation Protocols](chapters/55ead111acf72ad0.md)
- [Chapter 7: Governance Frameworks for GDPR Compliance and Attestation Protocols](chapters/72583dddc42f608f.md)
- [Chapter 12: Modeling GDPR Attestations and Audit Controls in Relational Form](chapters/90b575d08febb0ec.md)
- [Chapter 4: Directive Governance and Attestation Structures in GDPR Compliance](chapters/c858560fb308db74.md)
- [Chapter 4: Ontological Structures in Compliance Systems](chapters/d19f39440068e8ba.md)
- [Chapter 4: Governance Frameworks and Compliance Attestation in Data Protection](chapters/e56fe6d10b33dea2.md)
- [Chapter 4: Governance Frameworks for Regulatory Compliance and Attestation](chapters/ea8c5736e5db213c.md)
- [Chapter 4: Modeling GDPR Directive Compliance Through Signed Attestations and Audit Subclasses](chapters/f772c77379429a56.md)

## Ontology terms grounding this collection

- `attestation_signed_by` — {X} is a process that signed by person
- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_subclass` — {X} is a process that audits control directive information content entity
- `gdpr_article_subclass` — {X} is a directive information content entity that gdpr article {Y}
- `gdpr_data_subject_right` — {X} is a directive information content entity that grants data subject right {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 21 other collection(s)_
- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence` · _shared with 34 other collection(s)_
- [`t_audit_subclass`](tables/t_audit_subclass.sql) — realizes `audit_subclass` · _shared with 5 other collection(s)_
- [`t_gdpr_article_subclass`](tables/t_gdpr_article_subclass.sql) — realizes `gdpr_article_subclass` · _shared with 3 other collection(s)_
- [`t_gdpr_data_subject_right`](tables/t_gdpr_data_subject_right.sql) — realizes `gdpr_data_subject_right`
