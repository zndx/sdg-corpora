# Collection — topic 70 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **20 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Network Working Group S. Bradner Request for Comments: 1752 Harvard University Category: Standards Track A. Mankin ISI January 1995 The Recommendation for the IP Next Generation Protocol Status of this Memo This document specifies an Internet standards track protocol for the Internet communit... …

## Chapters

- [Chapter 4: Governance Frameworks and Attestation Logic](chapters/03d516e292298077.md)
- [Chapter 4: Governance Ontology for Compliance Attestation and Audit Verification](chapters/0832ff09fd599e95.md)
- [Chapter 4: Governance Frameworks and Compliance Attestation Protocols](chapters/0bea6cc1557e50ef.md)
- [Chapter 4: Formalization of Governance Directives and Attestation Protocols](chapters/26ed41bbe9e0018c.md)
- [Chapter 4: Governance Frameworks and Audit Evidence Verification](chapters/37e9ac86b6f267fc.md)
- [Chapter 4: Modeling Directive Governance and Attestation Structures](chapters/5b8d0936679cc508.md)
- [Chapter 4: Ontological Structures for Regulatory Compliance and Audit Verification](chapters/78599f048d7cfb86.md)
- [Chapter 4: Ontological Mapping of Compliance Directives and Audit Attestation](chapters/7d2b220b96938f81.md)
- [Directive Attestation and Audit Modelling in Educational Data Governance](chapters/8335f98f3dcfe808.md)
- [CHAPTER 7 — FORMAL ATTESTATION AND CONTROL MAPPING IN MULTI-REGULATORY ENVIRONMENTS](chapters/8bd364c236aff0c3.md)
- [Chapter 4: Integrated Governance Frameworks for GDPR and SOC2 Compliance](chapters/8de1b913c3ae1406.md)
- [Chapter 4: Governance Ontology and Compliance Attestation](chapters/8f72e8348effd164.md)
- [Chapter 4: Ontological Structures for Regulatory Compliance and Attestation](chapters/9c18963d50fd774a.md)
- [Chapter 7: Governance Frameworks and Compliance Attestation Protocols](chapters/ae057ac8b68e1165.md)
- [Chapter 4: Governance Frameworks and Compliance Attestation in Multi-Regulatory Environments](chapters/db12651419c3863b.md)
- [Chapter 4: Formalization of Regulatory Directives and Attestation Mechanisms](chapters/db9bc29a3aa005b7.md)
- [Chapter 4: Ontological Mapping of Compliance Directives and Governance Processes](chapters/de1081c6751ccbf7.md)
- [Chapter 4: Governance Frameworks and the Ontology of Compliance Artifacts](chapters/e103e1c4e9c30b9b.md)
- [Chapter 4: Governance Ontology and Compliance Mapping](chapters/e54597e38c39538d.md)
- [Chapter 4: Formal Ontology Mapping in Compliance Governance](chapters/e5893bee32ac50bd.md)

## Ontology terms grounding this collection

- `attestation_signed_by` — {X} is a process that signed by person
- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_subclass` — {X} is a process that audits control directive information content entity
- `gdpr_article_subclass` — {X} is a directive information content entity that gdpr article {Y}
- `soc2_trust_criterion` — {X} is a directive information content entity that soc2 trust criterion {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by`
- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_audit_subclass`](tables/t_audit_subclass.sql) — realizes `audit_subclass`
- [`t_gdpr_article_subclass`](tables/t_gdpr_article_subclass.sql) — realizes `gdpr_article_subclass`
- [`t_soc2_trust_criterion`](tables/t_soc2_trust_criterion.sql) — realizes `soc2_trust_criterion`
