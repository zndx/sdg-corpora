# Collection — topic 186 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): CODE OF ORDINANCES ROCK RIVER WATER RECLAMATION DISTRICT Contents Title 4 Service to Outlying Territories, Permits, Discharge Standards, Section 5. Computation of Basin Connection Charge ......................... 5-4 TITLE 1 ABBREVIATIONS AND DEFINITIONS ARTICLE I. Abbreviations The following abbreviations shall have the designated meanings throughout this Code of Ordinances: AO Administ... …

## Chapters

- [Chapter 7: Governance of Geospatial Artifacts and Evidence-Based Attestation Protocols](chapters/1c2edc3c31f7298c.md)
- [Chapter 7: Spatial Governance and Compliance Verification in Urban Infrastructure](chapters/1fb9b017b6b098bc.md)
- [Chapter 7: Spatial Governance and Asset Verification Protocols](chapters/34a53f88c92573f7.md)
- [Chapter 4: Ontological Structures for Spatial Governance and Audit Compliance](chapters/516d8deb624fc8d5.md)
- [Chapter 4: Geospatial Verification and Evidence Management in Regulatory Compliance](chapters/5416c4b27b2299d5.md)
- [Chapter 4: Relational Modeling of Place Attestations and Audits](chapters/59c6dd48b2e4cea1.md)
- [Chapter 7: Spatial Governance and Evidentiary Standards in Regulatory Compliance](chapters/7b7a7297dc953e73.md)
- [Chapter 7: Structured Compliance of Physical Artifacts and Directives](chapters/bc5494cbbe4cd3ac.md)
- [Regulatory Compliance Modeling for Public Facilities](chapters/bcbb3557248729f1.md)
- [Chapter 7: Governance of Spatial Artifacts and Evidence Verification](chapters/d6c175be451f5af6.md)
- [Chapter 4: Geospatial Compliance and Site Attestation Protocols](chapters/d8c86829ffbdd1dc.md)
- [Chapter 4: Spatial Governance and Evidence-Based Compliance](chapters/e8e55768ac030526.md)
- [Chapter 7: Ontological Mapping of Spatial Governance and Audit Trails](chapters/fbd0279dcf9a6193.md)

## Ontology terms grounding this collection

- `attestation_with_supporting_evidence` — {X} is a process that with supporting evidence {Y}
- `audit_with_findings` — {X} is a process that has findings {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `schemaorg_place_address` — {X} is an artifact that has postal address {Y}
- `schemaorg_place_geocoord` — {X} is an artifact that has geo coordinates {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_with_supporting_evidence`](tables/t_attestation_with_supporting_evidence.sql) — realizes `attestation_with_supporting_evidence`
- [`t_audit_with_findings`](tables/t_audit_with_findings.sql) — realizes `audit_with_findings`
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target`
- [`t_schemaorg_place_address`](tables/t_schemaorg_place_address.sql) — realizes `schemaorg_place_address`
- [`t_schemaorg_place_geocoord`](tables/t_schemaorg_place_geocoord.sql) — realizes `schemaorg_place_geocoord`
