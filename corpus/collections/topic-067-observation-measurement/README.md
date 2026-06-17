# Collection — topic 67 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Información del Plan Docente Academic Year 2018/19 Subject 29915 - Experimentation in Chemistry Faculty / School 110 - Escuela de Ingeniería y Arquitectura Degree 435 - Bachelor's Degree in Chemical Engineering ECTS 6.0 Year 2 Semester Second semester Subject Type Compulsory Module --- 1.General information 1.1.Aims of the course The subject and its expected results respond th... …

## Chapters

- [System Call Classification in eBPF Tracing Subsystems](chapters/0146efce2074e77d.md)
- [Chapter 4: System Call Interface Governance and Kernel Object Classification](chapters/121625e11c71e835.md)
- [Chapter 4: System Call Classification and Security Tiering in eBPF Monitoring Architectures](chapters/4e07795850aaa0fe.md)
- [Chapter 4: Ontological Mapping of Kernel Interface Entities](chapters/5dde8d4961d86eff.md)
- [Chapter 4: System Call Ontology and Kernel Interface Constraints](chapters/69981513b706ccb1.md)
- [Chapter 4: Formal Verification of Kernel Interface Entities and Security Tiering](chapters/82b5b4ddd716ea0f.md)
- [Chapter 4: Ontological Classification of Kernel System Calls for eBPF Auditing Frameworks](chapters/933f5a3df4a03c19.md)
- [Chapter 4: Kernel Interface Taxonomy and Security Classification](chapters/9a1f84eefaac6bd7.md)
- [Chapter 4: Ontological Mapping of Kernel Control Interfaces](chapters/ba5d6bdc648ffcb1.md)
- [Chapter 4: Formal Ontology of Kernel System Calls](chapters/fa12e8d826671358.md)

## Ontology terms grounding this collection

- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_basic` — {X} is a designative information content entity
- `syscall_equiv_in_subsystem` — Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:inSyscallSubsystem some {Y:Class})
- `syscall_max_one_return` — {X} is a designative information content entity
- `syscall_traceable` — {X} is a designative information content entity that traceable by {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier`
- [`t_syscall_basic`](tables/t_syscall_basic.sql) — realizes `syscall_basic`
- [`t_syscall_equiv_in_subsystem`](tables/t_syscall_equiv_in_subsystem.sql) — realizes `syscall_equiv_in_subsystem`
- [`t_syscall_max_one_return`](tables/t_syscall_max_one_return.sql) — realizes `syscall_max_one_return`
- [`t_syscall_traceable`](tables/t_syscall_traceable.sql) — realizes `syscall_traceable`
