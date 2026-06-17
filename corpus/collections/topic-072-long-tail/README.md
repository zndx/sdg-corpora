# Collection — topic 72 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): 10190 filed in response to this Notice are limited to five (5) pages in length, inclusive of attachments. Persons filing written submissions must file the original document electronically on or before the deadlines stated above and submit 8 true paper copies to the Office of the Secretary by noon the next day pursuant to § 210.4(f) of the Commission's Rules of Practice and Procedure (19 CFR 210... …

## Chapters

- [Chapter 4: Kernel Interface Taxonomy and Security Classification](chapters/17d5d2f9243260b0.md)
- [Chapter 4: Ontological Classification of Kernel Interface Entities](chapters/193333fdad721da1.md)
- [Chapter 4: Formal Taxonomy of Kernel Interface Entities](chapters/25252a73931ca65b.md)
- [Chapter 4: Ontological Mapping of Kernel Interface Governance](chapters/312aa4831e8aca08.md)
- [Chapter 4: Kernel Interface Ontology and Security Classification Framework](chapters/6f7cfd9e19cdd9d8.md)
- [Chapter 4: Taxonomy of Kernel System Calls and Security Classification](chapters/91f317f5012f99df.md)
- [Kernel Interface Classification and Security Stratification](chapters/9cbfe25eabefe856.md)
- [Chapter 4: System Call Classification and Security Tiering Protocols](chapters/a9388379da12a859.md)
- [Chapter 4: Formal Classification of Kernel Syscalls within Security Domains](chapters/c3d96590cc9552e8.md)
- [Chapter 7: Formal Ontology of eBPF Syscall Entities and Security Stratification](chapters/c6413e1af02e25c8.md)
- [Kernel Syscall Classification in eBPF Audit Trails](chapters/d6aa6556835a7eac.md)
- [Syscall Designative Information Content Entities](chapters/ea75a71232e0567d.md)

## Ontology terms grounding this collection

- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_equiv_in_subsystem` — Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:inSyscallSubsystem some {Y:Class})
- `syscall_invoked_by_event` — {X} is a designative information content entity that invoked by event {Y}
- `syscall_max_one_return` — {X} is a designative information content entity
- `syscall_subclass` — {X} is a designative information content entity that in syscall subsystem {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier`
- [`t_syscall_equiv_in_subsystem`](tables/t_syscall_equiv_in_subsystem.sql) — realizes `syscall_equiv_in_subsystem`
- [`t_syscall_invoked_by_event`](tables/t_syscall_invoked_by_event.sql) — realizes `syscall_invoked_by_event`
- [`t_syscall_max_one_return`](tables/t_syscall_max_one_return.sql) — realizes `syscall_max_one_return`
- [`t_syscall_subclass`](tables/t_syscall_subclass.sql) — realizes `syscall_subclass`
