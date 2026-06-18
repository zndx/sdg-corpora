# Collection — topic 28 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **18 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 28: topic 24, topic 46, topic 50, topic 73, topic 78, topic 85, topic 88, topic 107, topic 111, topic 112, topic 117, topic 121, topic 165, topic 166, topic 193, topic 196, topic 197.

> **Topic gist** (representative FinePDFs text): Improved cardiac and venous pressures during hospital stay in patients with acute heart failure: an echocardiography and biomarkers study Eiichi Akiyama, Raphaël Cinotti, Kamilė Čerlinskaitė, Lucas van Aelst, Mattia Arrigo, Rui Placido, Tahar Chouihed, Nicolas Girerd, Faiez Zannad, Patrick Rossignol, et al. To cite this version: Eiichi Akiyama, Raphaël Cinotti, Kamilė Čerlinskaitė, Lucas van Ae... …

## Chapters

- [Attestation and Verification Structures in Administrative Records](chapters/135ad8d03a702500.md)
- [Attestation and Verification Structures in Administrative Records](chapters/33565e7ae30942c0.md)
- [Chapter 4: Directive Governance in Audit Documentation](chapters/72adc197175eb6fd.md)
- [Chapter 7: Structural Governance and Entity Verification Protocols](chapters/86b19a15ca495cc8.md)
- [Chapter 7: Governance Frameworks for Regulatory Compliance and Entity Verification](chapters/92e231a99e528250.md)
- [Chapter 4: Governance Frameworks for Regulatory Compliance and Facility Verification](chapters/ae88ab5e000d4410.md)
- [Chapter 4: Ontological Foundations of Governance and Attestation](chapters/b05b41854558634f.md)
- [Chapter 4: Governance Protocols and Entity Verification Standards](chapters/fe26742c4f780bcc.md)
- [Chapter 4: Governance Frameworks for Attestation, Artifacts, and Verification Protocols](chapters/ff009b7f36851867.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `requirement_min_one_verification` — {X} is a directive information content entity
- `schemaorg_place_address` — {X} is an artifact that has postal address {Y}
- `verification_min_one_evidence` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer` · _shared with 16 other collection(s)_
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 21 other collection(s)_
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification` · _shared with 8 other collection(s)_
- [`t_schemaorg_place_address`](tables/t_schemaorg_place_address.sql) — realizes `schemaorg_place_address` · _shared with 12 other collection(s)_
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence` · _shared with 16 other collection(s)_
