# Collection — topic 173 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **16 chapters** · **30 topics** (target + style) · **4 ontology terms** · **4 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 173: topic 16, topic 23, topic 56, topic 58, topic 71, topic 75, topic 78, topic 90, topic 94, topic 99, topic 103, topic 104, topic 114, topic 118, topic 123, topic 125, topic 126, topic 128, topic 129, topic 130, topic 136, topic 144, topic 149, topic 174, topic 176, topic 183, topic 185, topic 194, topic 195.

> **Topic gist** (representative FinePDFs text): RFA 12-07 CONCEPT PROPOSAL CIRM EARLY TRANSLATIONAL IV RESEARCH AWARDS The objective of the CIRM Early Translational Research Awards is to fund and advance promising stem cell discoveries toward clinical development. The Governing Board (ICOC) has funded three cycles of Early Translational Research Awards, most recently in May of 2012 (21 awards). These programs cover diverse therapeutic areas s.. …

## Chapters

- [Laboratory Measurement Processes in LIMS](chapters/03243df36e3b2783.md)
- [Chapter 7: Ontological Mapping of Laboratory Processes and ISO 27001 Governance Frameworks](chapters/0f9726df051eb191.md)
- [Chapter 7: Structural Alignment of Laboratory Processes and ISO 27001 Governance Artifacts](chapters/189da7eb2e216c47.md)
- [Laboratory Process Ontologies in ISO 27001-Compliant Testing Environments](chapters/228c8b7da4d85ade.md)
- [Chapter 4: Ontological Mapping of Laboratory Processes to ISO 27001 Compliance Frameworks](chapters/76a77bf3e9580f2b.md)
- [Chapter 4. Relational Encodings of Process and Directive Ontologies in Laboratory Measurement Systems](chapters/7c42c19f513032a8.md)
- [Chapter 7: Ontological Formalization of ISO 27001 Audit Evidence](chapters/805411d54dfbadba.md)
- [Chapter 4: Relational Representation of Laboratory Processes and Directive Subclasses](chapters/823d9196d32ae258.md)
- [Chapter 4: Ontological Formalization of ISO 27001 Audit Processes and Measurement Provenance](chapters/8a8eb0cc2a1ab033.md)
- [Chapter 12: Ontological Formalization of Compliance Evidence and ISO 27001 Clause Mapping](chapters/8bec546fc4b74ecc.md)
- [Evidence Generation and Clause Mapping in ISO 27001 Governance Frameworks](chapters/8ffc55f313b1473c.md)
- [Chapter 4: Audit Methodologies and Compliance Verification in ISO/IEC 27001 Frameworks](chapters/9b90a33e5ccb54c4.md)
- [Chapter 4: Ontological Formalization of Compliance Processes and Measurement Artifacts](chapters/a4fb82df5e61c86a.md)
- [Ontological Representation of Laboratory Processes and ISO 27001 Compliance Directives](chapters/b72729e7a91650ff.md)
- [Chapter 4: Ontological Foundations of Evidence Generation in Compliance Frameworks](chapters/c0db1488e6fd5568.md)
- [Chapter 7: Ontological Formalization of Laboratory Compliance and Measurement Provenance](chapters/e110d532e926b31e.md)

## Ontology terms grounding this collection

- `iso27001_clause_subclass` — {X} is a directive information content entity that iso27001 clause {Y}
- `labrun_produces_measurement` — {X} is a process that produces descriptive information content entity
- `measurement_produced_by_run` — {X} is a descriptive information content entity
- `state_basic` — {X} is a descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_iso27001_clause_subclass`](tables/t_iso27001_clause_subclass.sql) — realizes `iso27001_clause_subclass` · _shared with 5 other collection(s)_
- [`t_labrun_produces_measurement`](tables/t_labrun_produces_measurement.sql) — realizes `labrun_produces_measurement` · _shared with 1 other collection(s)_
- [`t_measurement_produced_by_run`](tables/t_measurement_produced_by_run.sql) — realizes `measurement_produced_by_run`
- [`t_state_basic`](tables/t_state_basic.sql) — realizes `state_basic`
