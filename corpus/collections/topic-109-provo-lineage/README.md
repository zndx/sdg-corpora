# Collection — topic 109 · 05_provo_lineage

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **24 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 109: topic 26, topic 30, topic 33, topic 37, topic 42, topic 44, topic 49, topic 50, topic 57, topic 64, topic 65, topic 76, topic 83, topic 120, topic 128, topic 143, topic 149, topic 155, topic 171, topic 174, topic 178, topic 190, topic 196.

> **Topic gist** (representative FinePDFs text): International Workshop "What can FCA do for Artificial Intelligence?" (FCA4AI at IJCAI 2013, Beijing, China, August 4 2013) Sergei O. Kuznetsov, Amedeo Napoli, Sebastian Rudolph To cite this version: Sergei O. Kuznetsov, Amedeo Napoli, Sebastian Rudolph. International Workshop "What can FCA do for Artificial Intelligence?" (FCA4AI at IJCAI 2013, Beijing, China, August 4 2013). Sergei O. Kuznetsov. …

## Chapters

- [Measurement Provenance and Control Annotation in Laboratory Runs](chapters/0995f5c8c656e53c.md)
- [Chapter 7: Provenance Tracking and Compliance in Automated Laboratory Environments](chapters/0d96830227237edb.md)
- [Laboratory Measurement Provenance and Control Annotation](chapters/2d5e0a850f3ae8bb.md)
- [Laboratory Data Management: Modeling Measurement Provenance and Controls](chapters/3c80afcc50d542d9.md)
- [Measurement Provenance and Control Templates in Regulated Laboratory Systems](chapters/52dd926f728cfdcc.md)
- [Chapter 7: Laboratory Measurement Provenance in Controlled Research Protocols](chapters/81272dd51c1c478a.md)
- [Evidence-Based Data Lineage in Regulated Laboratory Environments](chapters/8589e63e4a89f1a7.md)
- [Chapter 4: Ontological Mapping of Laboratory Data Lineage and Compliance Controls](chapters/9ebe0227e6a51f39.md)
- [Chapter 4: Ontological Integration of Laboratory Processes and Compliance Controls](chapters/a9420181e91066c9.md)
- [Measurement Provenance in Laboratory Information Systems](chapters/b9b3ea77540e925a.md)
- [Chapter 4: Evidence Generation and Control Mapping in Automated Compliance Frameworks](chapters/c8b4ea1b8b1b086f.md)
- [Chapter 4: Ontological Frameworks for Laboratory Data Governance and Compliance Verification](chapters/dc8e915351b3445d.md)
- [Chapter 12. Measurement Provenance and Control Subclasses in Regulated Laboratory Systems](chapters/e0ba54c19e5df6d6.md)

## Ontology terms grounding this collection

- `column_tag_subclass` — {X} is a descriptive information content entity that annotates column {Y}
- `labrun_produces_measurement` — {X} is a process that produces descriptive information content entity
- `measurement_with_method` — {X} is a descriptive information content entity that via method {Y}
- `nist80053_control_subclass` — {X} is a directive information content entity that nist80053 control {Y}
- `table_provenance_source` — {X} is a descriptive information content entity that sourced from table {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_column_tag_subclass`](tables/t_column_tag_subclass.sql) — realizes `column_tag_subclass` · _shared with 1 other collection(s)_
- [`t_labrun_produces_measurement`](tables/t_labrun_produces_measurement.sql) — realizes `labrun_produces_measurement` · _shared with 1 other collection(s)_
- [`t_measurement_with_method`](tables/t_measurement_with_method.sql) — realizes `measurement_with_method`
- [`t_nist80053_control_subclass`](tables/t_nist80053_control_subclass.sql) — realizes `nist80053_control_subclass` · _shared with 1 other collection(s)_
- [`t_table_provenance_source`](tables/t_table_provenance_source.sql) — realizes `table_provenance_source` · _shared with 1 other collection(s)_
