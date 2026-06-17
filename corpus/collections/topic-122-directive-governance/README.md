# Collection — topic 122 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Annual report and audited financial statements iShares II PLC For the financial year ended 31 October 2024 # CONTENTS ## Overview | Section | Page | |----------------------------------------------|------| | General information | 3 | | Chair's statement | 5 | | Background ... …

## Chapters

- [Chapter 4: Ontological Compliance Framework for Kernel Observability](chapters/016f5ba7ae8e27e4.md)
- [Chapter 4: Relational Projections of Ontological Axioms in Observability Frameworks](chapters/08670ecb1f13cfbf.md)
- [Chapter 4: Ontological Foundations for System Event Auditing and Traceability](chapters/27b0541c9cf68425.md)
- [Chapter 4: Modeling Process Observations in System Audit Trails](chapters/40ed011ea82257c2.md)
- [Chapter 4: Ontological Formalization of Process Attribution and Traceability](chapters/45c8b723e9667635.md)
- [Chapter 4: Ontological Foundations of System Event Tracing and Audit Compliance](chapters/4f384cd6123d54fd.md)
- [Chapter 4: Ontological Foundations for System Event Auditing](chapters/729f00ef73a0b220.md)
- [Chapter 7: Ontological Constraints for System Observability and Audit Trails](chapters/900df399c11e397d.md)
- [Chapter 4: Governance Framework for Process Artifacts and Operator Traces](chapters/99b86bc7b5ac2c6b.md)
- [Chapter 4: Ontological Constraints for System Observability and Process Traceability](chapters/ae43adac41bf3058.md)
- [Chapter 4: Ontological Foundations for System Audit and Traceability](chapters/e0d672fd4764f9cf.md)
- [Chapter 7: Ontological Constraints in System Auditability](chapters/e55e98444d302145.md)

## Ontology terms grounding this collection

- `ebpf_event_observed_pid` — {X} is a process that observes pid {Y}
- `observation_with_participant` — {X} is a process that has participant artifact
- `process_max_one_operator` — {X} is a process
- `schemaorg_event_starttime` — {X} is an artifact that has event start time {Y}
- `trace_subclass` — {X} is a process that has spans {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_ebpf_event_observed_pid`](tables/t_ebpf_event_observed_pid.sql) — realizes `ebpf_event_observed_pid`
- [`t_observation_with_participant`](tables/t_observation_with_participant.sql) — realizes `observation_with_participant`
- [`t_process_max_one_operator`](tables/t_process_max_one_operator.sql) — realizes `process_max_one_operator`
- [`t_schemaorg_event_starttime`](tables/t_schemaorg_event_starttime.sql) — realizes `schemaorg_event_starttime`
- [`t_trace_subclass`](tables/t_trace_subclass.sql) — realizes `trace_subclass`
