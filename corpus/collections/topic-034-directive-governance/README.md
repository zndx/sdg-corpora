# Collection — topic 34 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): Computer Security Division 2010 Annual Report # Table of Contents **Welcome** **Division Organization** **The Computer Security Division Implements the Federal Information Security Management Act of 2002** **Security Management and Assurance Group** - Federal Information Security Management Act Implementation Project - FISMA Implementation Project – Phase I - FISMA Implementation Projec... …

## Chapters

- [Kernel Event Ontologies in Relational Audit Trails](chapters/41d3577fd0d384ff.md)
- [Chapter 4: Ontological Formalization of Kernel Telemetry and Event Correlation](chapters/50cc7b6f3c96e32c.md)
- [Chapter 7: Formal Ontology of eBPF Observability and Alert Correlation](chapters/6533b3e26ea596e5.md)
- [Chapter 7: Formal Ontology of Kernel Telemetry and Event Attribution](chapters/69c29324128c5c08.md)
- [Chapter 4: Ontological Formalization of Kernel Telemetry and Alerting Mechanisms](chapters/73678a622a7283ba.md)
- [Chapter 4: Kernel Observability and Event Attribution in eBPF Frameworks](chapters/853eaabaccdd1710.md)
- [Chapter 4: Kernel-Level Observability and Event Correlation Frameworks](chapters/901ed854f87411f1.md)
- [Chapter 4: Ontological Foundations of Kernel Telemetry and Event Attribution](chapters/96e0d6bfeb3c3800.md)
- [Chapter 7: Formal Ontology of eBPF Event Attribution and Metric Correlation](chapters/a9c9605f1d7f1076.md)
- [Chapter 4: Ontological Formalization of Kernel Observability Events](chapters/b223f7c8432e408c.md)
- [Chapter 7: Projection of eBPF Process Axioms onto Kernel Trace Schemas](chapters/d12e6665d09ba1ff.md)
- [Kernel Event Modeling in eBPF-Based Audit Systems](chapters/fce843befc6a41d2.md)

## Ontology terms grounding this collection

- `alert_triggered_by` — {X} is a process that triggered by metric {Y}
- `ebpf_event_min_one_attribute` — {X} is a process
- `ebpfevent_observes_syscall_xref` — {X} is a process that observes syscall designative information content entity
- `syscall_invoked_by_event` — {X} is a designative information content entity that invoked by event {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_alert_triggered_by`](tables/t_alert_triggered_by.sql) — realizes `alert_triggered_by`
- [`t_ebpf_event_min_one_attribute`](tables/t_ebpf_event_min_one_attribute.sql) — realizes `ebpf_event_min_one_attribute`
- [`t_ebpfevent_observes_syscall_xref`](tables/t_ebpfevent_observes_syscall_xref.sql) — realizes `ebpfevent_observes_syscall_xref`
- [`t_syscall_invoked_by_event`](tables/t_syscall_invoked_by_event.sql) — realizes `syscall_invoked_by_event`
