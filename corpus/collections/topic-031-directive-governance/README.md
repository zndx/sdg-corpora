# Collection — topic 31 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **8 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): JOINT OPERATING COMMITTEE MEETING September 4, 2024 6:30 P.M. MINUTES This meeting was called to order by Ingrid Parker, JOC Chairperson, at 6:30p.m. The Pledge of Allegiance was recited. PRESENT: Troy Chiddick Chris Epstein Xaras Collins Ingrid Parker Beth Patruno Maggie Philips, Esq. William Winchester ALSO PRESENT: Chris Dormer, Superintendent of Record Beth Shore, Solicitor Dr. Angela King... …

## Chapters

- [Chapter 4: Formal Verification of Kernel Instrumentation and Security Tiering](chapters/12fcf14e4199f951.md)
- [Chapter 4: Kernel Observation Frameworks and Security Governance](chapters/3ce154642abe5222.md)
- [Chapter 12. Modeling Protocol Compliance and Kernel Subsystem Verification](chapters/477b0a60151a7344.md)
- [Chapter 4: Formal Verification and Security Governance in Kernel-Level Observability](chapters/656662896671104f.md)
- [Chapter 4: Formal Ontology of Kernel Observability and Compliance Artifacts](chapters/6c389ad5966bf72b.md)
- [Chapter 7: Formal Verification of Kernel-Space Security Controls and Protocol Adherence](chapters/92191bf26646e293.md)
- [Chapter 4: Formal Verification of Kernel Observability Artifacts](chapters/a800d2af38c7517c.md)
- [Chapter 4: Kernel-Level Observation and Security Protocol Compliance](chapters/be0eb9949d0fba73.md)

## Ontology terms grounding this collection

- `ebpfprogram_verified_safe` — {X} is an artifact that verified safe by {Y}
- `labrun_with_protocol` — {X} is a process that follows protocol {Y}
- `nist80053_control_subclass` — {X} is a directive information content entity that nist80053 control {Y}
- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_equiv_in_subsystem` — Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:inSyscallSubsystem some {Y:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_ebpfprogram_verified_safe`](tables/t_ebpfprogram_verified_safe.sql) — realizes `ebpfprogram_verified_safe`
- [`t_labrun_with_protocol`](tables/t_labrun_with_protocol.sql) — realizes `labrun_with_protocol`
- [`t_nist80053_control_subclass`](tables/t_nist80053_control_subclass.sql) — realizes `nist80053_control_subclass`
- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier`
- [`t_syscall_equiv_in_subsystem`](tables/t_syscall_equiv_in_subsystem.sql) — realizes `syscall_equiv_in_subsystem`
