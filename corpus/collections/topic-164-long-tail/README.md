# Collection — topic 164 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **23 topics** (target + style) · **4 ontology terms** · **4 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 164: topic 1, topic 13, topic 16, topic 20, topic 24, topic 33, topic 34, topic 40, topic 49, topic 54, topic 56, topic 67, topic 76, topic 83, topic 85, topic 91, topic 99, topic 104, topic 107, topic 114, topic 151, topic 186.

> **Topic gist** (representative FinePDFs text): Application for the position: CMR Section Vice Chair Elections to the Board 2014-20145 1. Your Identity Title: Professor Family Name(s): Petersen First Name(s): Steffen E. Birth Date: 24 August 1970 Type of address: Business Institute/Organisation: Queen Mary University of London and Barts Health NHS Trust Department: William Harvey Research Institute and Department of Cardiology A... …

## Chapters

- [Chapter 7: Formal Ontology Constraints in Industrial Process Governance](chapters/0e304e26193b1d65.md)
- [Chapter 4: Ontological Constraints for Process Governance and Measurement Integrity](chapters/17b1bdc6543ef6ad.md)
- [Chapter 4: Relational Encodings of Process and Measurement Constraints](chapters/2268aaacc9f7774a.md)
- [Chapter 7: Formal Verification of Process Measurement Constraints](chapters/26af9b179265ced1.md)
- [Chapter 4: Ontological Constraints for Process Verification in the Environmental Compliance Framework](chapters/59a8827fa8ceb477.md)
- [Chapter 7: Ontological Constraints in Industrial Process Control Systems](chapters/682827ef27491600.md)
- [Chapter 4: Ontological Constraints in Industrial Process Verification](chapters/7b721d6cd2d4fb4b.md)
- [Chapter 4: Ontological Constraints for Process Verification and Measurement Governance](chapters/933b79a03d0d81c2.md)
- [Chapter 4: Relational Encoding of Measurement Processes and Descriptive Instances](chapters/bcff25362e8955e9.md)
- [Ontological Modeling of Laboratory Processes Using Relational Schemas](chapters/be0380b177962c40.md)
- [Chapter 7: Ontological Constraints in Process Governance and Measurement Verification](chapters/c2f0701b593c6533.md)
- [Chapter 4: Protocol for Process Entity Validation and Measurement Integrity](chapters/fff217318b8b86b4.md)

## Ontology terms grounding this collection

- `measurement_equiv_with_dim_unit` — Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasDimension some {Y:Class}) and (sdg:hasUnit some {Z:Class})
- `process_max_one_operator` — {X} is a process
- `process_min_one_input` — {X} is a process
- `process_min_one_output` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_measurement_equiv_with_dim_unit`](tables/t_measurement_equiv_with_dim_unit.sql) — realizes `measurement_equiv_with_dim_unit` · _shared with 1 other collection(s)_
- [`t_process_max_one_operator`](tables/t_process_max_one_operator.sql) — realizes `process_max_one_operator` · _shared with 2 other collection(s)_
- [`t_process_min_one_input`](tables/t_process_min_one_input.sql) — realizes `process_min_one_input` · _shared with 2 other collection(s)_
- [`t_process_min_one_output`](tables/t_process_min_one_output.sql) — realizes `process_min_one_output` · _shared with 1 other collection(s)_
