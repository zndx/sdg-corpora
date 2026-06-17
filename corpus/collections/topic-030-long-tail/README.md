# Collection — topic 30 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **15 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): **Basic Information** - **Catalog Number:** 20536-1-AP - **Size:** 150ul, Concentration: 600 ug/ml by Nanodrop; - **Source:** Rabbit - **Isotype:** IgG - **Immunogen Catalog Number:** AC14521 - **GenBank Accession Number:** BC002409 - **GeneID (NCBI):** 60 - **UNIPROT ID:** P60709 - **Full Name:** actin, beta - **Calculated MW:** 375 aa, 42 kDa - **Observed MW:** 42 kDa **Purification Method:** .. …

## Chapters

- [Chapter 4: Evidence Traceability and Compliance Attestation in Data Governance Frameworks](chapters/017f3a3e2b1a4e43.md)
- [Chapter 4. Evidence Anchoring and Compliance Provenance in Distributed Systems](chapters/0285a1ad16df3332.md)
- [Chapter 4: Evidence Verification and Compliance Attestation in Data Governance](chapters/075b861d677f4623.md)
- [Audit Trail Modeling for Claim Support in Regulatory Documentation](chapters/0a988cd1e6854efc.md)
- [Chapter 12: Evidence Tracing and Attestation in Compliance Architectures](chapters/6395ca7978426591.md)
- [Chapter 4: Evidence Traceability and Attestation in Automated Compliance Frameworks](chapters/76fd4064a063303c.md)
- [Chapter 7: Ontological Foundations for Compliance Evidence and Data Lineage](chapters/82ae605e509d81ff.md)
- [Chapter 4: Modeling Compliance Claims and Attestations](chapters/98f0faf23bf53f9e.md)
- [Chapter 4: Ontological Mapping of Audit Evidence and Compliance Directives](chapters/b099c942564d4a1d.md)
- [Chapter 7: Evidence Tracing and Regulatory Compliance in Data Governance Systems](chapters/c843a60d898e2f31.md)
- [Data Governance Ontologies for Regulatory Compliance](chapters/cc3686f6c16d4d96.md)
- [Chapter 4: Evidence Tracing and Attestation Mechanisms in Regulatory Compliance Frameworks](chapters/ccbbe2beff222995.md)
- [Chapter 4: Evidence Verification and Compliance Auditing in Data Governance Systems](chapters/d041d72c2b83ea9f.md)
- [Chapter 4: Ontological Foundations for Audit Traceability and Compliance Governance](chapters/e31e7a092acb845f.md)
- [Chapter 4: Evidence Lineage and Attestation in Compliance Frameworks](chapters/e92a56e82828e215.md)

## Ontology terms grounding this collection

- `attestation_signed_by` — {X} is a process that signed by person
- `column_lineage_for_compliance_claim` — {X} is an artifact that supports claim descriptive information content entity
- `gdpr_lawful_basis` — {X} is a directive information content entity that has lawful basis {Y}
- `kernel_anomaly_supports_claim` — {X} is an artifact that supports claim descriptive information content entity
- `trace_supports_claim` — {X} is a process that supports claim descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by`
- [`t_column_lineage_for_compliance_claim`](tables/t_column_lineage_for_compliance_claim.sql) — realizes `column_lineage_for_compliance_claim`
- [`t_gdpr_lawful_basis`](tables/t_gdpr_lawful_basis.sql) — realizes `gdpr_lawful_basis`
- [`t_kernel_anomaly_supports_claim`](tables/t_kernel_anomaly_supports_claim.sql) — realizes `kernel_anomaly_supports_claim`
- [`t_trace_supports_claim`](tables/t_trace_supports_claim.sql) — realizes `trace_supports_claim`
