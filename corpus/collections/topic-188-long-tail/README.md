# Collection — topic 188 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): III. Materials and methods 1. Antibodies Rabbit polyclonal antibodies against VILIP-1 and hippocalcin raised against recombinant Histagged VILIP-1 or hippocalcin fusion proteins and affinity-purified as previously described (Braunewell et al., 2001; Bernstein et al., 2003) were used. Other antibodies were purchased from indicating companies: Chicken polyclonal antibody against NCS-1 Calbiochem... …

## Chapters

- [Chapter 7: Ontological Mapping for Process Audit and Artifact Verification](chapters/24d5a9d7ce3a8004.md)
- [Chapter 7: Ontological Constraints for Process Audit Trails](chapters/5624ad03f72ac7fb.md)
- [Measurement Processes and Artifact Participation](chapters/77f8dddc155e927a.md)
- [Laboratory Process Observation Schema](chapters/8491674bc4239c1d.md)
- [Chapter 4: Ontological Constraints in Process Verification and Event Logging](chapters/a9c9d84063478cb2.md)
- [Chapter 4: Ontological Constraints for Audit Trail Verification and Process Governance](chapters/b80884ce13014206.md)
- [Chapter 4: Ontological Constraints for Process-Artifact Interoperability in Regulated Systems](chapters/bdfb083cc39004de.md)
- [Chapter 4: Ontological Structures for Operational Auditing and Process Verification](chapters/cdf9870bb982ca47.md)
- [Chapter 4: Ontological Framework for Event Governance and Process Audit](chapters/e6c8ff45a272152f.md)

## Ontology terms grounding this collection

- `observation_with_participant` — {X} is a process that has participant artifact
- `process_min_one_input` — {X} is a process
- `process_min_one_output` — {X} is a process
- `schemaorg_event_starttime` — {X} is an artifact that has event start time {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_observation_with_participant`](tables/t_observation_with_participant.sql) — realizes `observation_with_participant`
- [`t_process_min_one_input`](tables/t_process_min_one_input.sql) — realizes `process_min_one_input`
- [`t_process_min_one_output`](tables/t_process_min_one_output.sql) — realizes `process_min_one_output`
- [`t_schemaorg_event_starttime`](tables/t_schemaorg_event_starttime.sql) — realizes `schemaorg_event_starttime`
