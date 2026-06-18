# Collection — topic 19 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **16 chapters** · **29 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 19: topic 3, topic 5, topic 24, topic 25, topic 37, topic 47, topic 56, topic 64, topic 81, topic 86, topic 88, topic 98, topic 103, topic 115, topic 117, topic 118, topic 120, topic 122, topic 131, topic 133, topic 134, topic 153, topic 158, topic 160, topic 163, topic 165, topic 181, topic 196.

> **Topic gist** (representative FinePDFs text): COLLEGE OF EDUCATION GRADUATE PROGRAMS HANDBOOK 2006-2007 The College of Education Graduate Programs Handbook is for informational purposes and does not constitute a contract. Programs listed are subject to change, and individual departments and units should be consulted for further information. The commitment of the University to the most fundamental principles of academic freedom, equality of .. …

## Chapters

- [DOCUMENT ID: KCG-2024-SEC-04](chapters/07e75ef08de682f8.md)
- [Chapter 4: Kernel Interface Governance and eBPF Artifact Verification](chapters/192299b0c4c5dd7d.md)
- [Chapter 7: Kernel Interface Governance and eBPF Verification Protocols](chapters/2bf0778fbc3ea24e.md)
- [Chapter 4: System Call Classification and eBPF Verification Protocols](chapters/2fb8c8f624f5c1db.md)
- [Chapter 4: Kernel Interface Governance and eBPF Verification Protocols](chapters/35a63b9553c80ba3.md)
- [Kernel Syscall Classification and eBPF Verification](chapters/487ff57607996000.md)
- [Chapter 4: Kernel Interface Classification and eBPF Verification Protocols](chapters/623eceab445ddaf4.md)
- [Chapter 4: Kernel Interface Governance and eBPF Verification Protocols](chapters/69f0caf6a41111a0.md)
- [Chapter 4: Kernel Interface Governance and eBPF Verification Protocols](chapters/73fd24a42897d961.md)
- [Chapter 7: Ontological Governance of Kernel Interfaces and eBPF Verification](chapters/9b36654c6904c398.md)
- [Chapter 4: Designative Information Content Entities in eBPF Syscall Subsystems](chapters/9e7959db95d0e12d.md)
- [Chapter 4: Kernel Interface Governance and eBPF Artifact Verification](chapters/b5a53d8607d5a3e2.md)
- [Chapter 4: Formal Stratification and Verification of Kernel Control Interfaces](chapters/c50918f40610ab21.md)
- [Chapter 7: Ontological Constraints for Kernel Interface Security](chapters/c7edca327a223b40.md)
- [Chapter 4: Kernel Interface Governance and eBPF Verification Protocols](chapters/f0468c2a12aca05a.md)
- [Chapter 4: Governance of Kernel-Level Artifacts and System Call Interfaces](chapters/ff612faf2710a4e7.md)

## Ontology terms grounding this collection

- `ebpfprogram_verified_safe` — {X} is an artifact that verified safe by {Y}
- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_audited_by` — {X} is a designative information content entity
- `syscall_equiv_in_subsystem` — Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:inSyscallSubsystem some {Y:Class})
- `syscall_max_one_return` — {X} is a designative information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_ebpfprogram_verified_safe`](tables/t_ebpfprogram_verified_safe.sql) — realizes `ebpfprogram_verified_safe` · _shared with 3 other collection(s)_
- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier` · _shared with 7 other collection(s)_
- [`t_syscall_audited_by`](tables/t_syscall_audited_by.sql) — realizes `syscall_audited_by` · _shared with 6 other collection(s)_
- [`t_syscall_equiv_in_subsystem`](tables/t_syscall_equiv_in_subsystem.sql) — realizes `syscall_equiv_in_subsystem` · _shared with 6 other collection(s)_
- [`t_syscall_max_one_return`](tables/t_syscall_max_one_return.sql) — realizes `syscall_max_one_return` · _shared with 4 other collection(s)_
