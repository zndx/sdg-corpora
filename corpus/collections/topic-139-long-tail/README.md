# Collection — topic 139 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **15 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): February 2016 Drug Court Practitioner Fact Sheet Vol. XI, No. 1 Understanding and Detecting Prescription Drug Misuse and Misuse Disorders By Sandra Lapham, MD, MPH, DFASAM Senior Research Scientist, Behavioral Health Research Center of the Southwest, Pacific Institute for Research and Evaluation T his fact sheet is designed for court professionals. It describes prescription drug misuse and pr... …

## Chapters

- [Ontological Modeling of Laboratory Processes via Relational Schemas](chapters/0374328fe760a2c4.md)
- [Chapter 7: Kernel-Space Observability and Metric Compliance Auditing](chapters/183cc37a42d11521.md)
- [Chapter 7: Relational Encoding of Metric-Emission and Traceable Process Classes](chapters/3a43732ff8aed1a9.md)
- [Chapter 7: Ontological Frameworks for Kernel Observability and Compliance Auditing](chapters/51996ac24434a037.md)
- [Chapter 7: Formal Ontologies for Kernel Observability and Compliance Auditing](chapters/536581ac640c2938.md)
- [Chapter 4: Ontological Foundations of System Observability and Metric Attribution](chapters/5eda6ad73ecf47f5.md)
- [Chapter 7: Process Subclassing, Protocol Adherence and Kernel Traceability in Laboratory Monitoring](chapters/7d40692489069563.md)
- [Laboratory Execution Ontologies and Kernel Traceability](chapters/7e5bbbf30529798d.md)
- [Chapter 7: Kernel Observability and Metric Emission Protocols](chapters/8d52cdd22478d5d4.md)
- [Chapter 4: Ontological Foundations for Kernel-Level Observability and Compliance Tracing](chapters/9ac12d876c73a9b6.md)
- [Chapter 7: Ontological Compliance for Kernel Observability and Metric Traceability](chapters/9f74a548aeb64144.md)
- [Chapter 7: Observability Frameworks and Metric Compliance in Kernel-Space Environments](chapters/abf66720643d435c.md)
- [Chapter 4: Ontological Foundations for Kernel Audit and Metric Compliance](chapters/dada66c6928f2fd6.md)
- [Chapter 4: Kernel-Level Observability and Compliance Tracing Frameworks](chapters/ec748184cdf2b493.md)
- [Chapter 4: Ontological Foundations for Kernel Audit and Compliance Frameworks](chapters/f3c4200fca35b03d.md)

## Ontology terms grounding this collection

- `alert_triggered_by` — {X} is a process that triggered by metric {Y}
- `ebpfevent_observes_syscall_xref` — {X} is a process that observes syscall designative information content entity
- `labrun_with_protocol` — {X} is a process that follows protocol {Y}
- `metric_emission_subclass` — {X} is a process that emits metric {Y}
- `syscall_traceable` — {X} is a designative information content entity that traceable by {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_alert_triggered_by`](tables/t_alert_triggered_by.sql) — realizes `alert_triggered_by`
- [`t_ebpfevent_observes_syscall_xref`](tables/t_ebpfevent_observes_syscall_xref.sql) — realizes `ebpfevent_observes_syscall_xref`
- [`t_labrun_with_protocol`](tables/t_labrun_with_protocol.sql) — realizes `labrun_with_protocol`
- [`t_metric_emission_subclass`](tables/t_metric_emission_subclass.sql) — realizes `metric_emission_subclass`
- [`t_syscall_traceable`](tables/t_syscall_traceable.sql) — realizes `syscall_traceable`
