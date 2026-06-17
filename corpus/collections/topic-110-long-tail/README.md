# Collection — topic 110 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): Drug Development Tool (DDT) Reference Guide Click here to access the CDER NextGen Portal. Supported Browsers: Google Chrome, Microsoft Edge and Mozilla Firefox # Table of Contents | Section | Page | |------------------------------------------------------------------------|------| | Introduction ... …

## Chapters

- [Chapter 4: Ontological Constraints for Kernel Interface Governance](chapters/0e7bfc536aa0fd9b.md)
- [Chapter 4: Kernel Interface Governance and Ontological Constraints for eBPF Subsystems](chapters/1bf57dbe9e806bdd.md)
- [Chapter 4: Formal Ontology of Kernel Instrumentation and Security Constraints](chapters/237b7ae17564cd71.md)
- [Chapter 4: Kernel Interface Governance and Axiomatic Compliance](chapters/5445062626132733.md)
- [Chapter 4: Ontological Constraints for Kernel Interface Design](chapters/6d3360d7bf068b7b.md)
- [Chapter 4: Kernel Interface Governance and Artifact Attachment Protocols](chapters/7435900c0fb31828.md)
- [Chapter 4: Ontological Constraints in Kernel Interface Design and eBPF Security Contexts](chapters/804d02579fdf764b.md)
- [Chapter 4: Kernel Interface Semantics and eBPF Governance Frameworks](chapters/88496fdf30d56876.md)
- [Chapter 4: Kernel Interface Governance and eBPF Security Classification](chapters/89b1470f02f51eb4.md)
- [Chapter 4: Formal Ontology of eBPF Kernel Subsystems and Security Constraints](chapters/aa1a0819e3e88ccd.md)
- [Chapter 4: Formal Taxonomy of Kernel Interface Constraints and Security Stratification](chapters/bd3b239d9d8aeaf9.md)
- [Kernel Syscall Classification via Designative Information Content Entities](chapters/d0e62bb085abe65a.md)
- [Kernel Security Audit Data Model](chapters/fba235708f7c2b6e.md)

## Ontology terms grounding this collection

- `kernelhook_max_one_program_attached` — {X} is an artifact
- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_equiv_in_subsystem` — Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:inSyscallSubsystem some {Y:Class})
- `syscall_max_one_return` — {X} is a designative information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_kernelhook_max_one_program_attached`](tables/t_kernelhook_max_one_program_attached.sql) — realizes `kernelhook_max_one_program_attached`
- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier`
- [`t_syscall_equiv_in_subsystem`](tables/t_syscall_equiv_in_subsystem.sql) — realizes `syscall_equiv_in_subsystem`
- [`t_syscall_max_one_return`](tables/t_syscall_max_one_return.sql) — realizes `syscall_max_one_return`
