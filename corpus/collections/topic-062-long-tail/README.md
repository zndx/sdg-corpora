# Collection — topic 62 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **24 topics** (target + style) · **4 ontology terms** · **4 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 62: topic 4, topic 8, topic 34, topic 42, topic 46, topic 51, topic 52, topic 54, topic 66, topic 85, topic 86, topic 97, topic 103, topic 113, topic 114, topic 143, topic 149, topic 174, topic 179, topic 190, topic 194, topic 196, topic 198.

> **Topic gist** (representative FinePDFs text): ISSN (E): 2277-7695 ISSN (P): 2349-8242 NAAS Rating: 5.23 TPI 2022; 11(12): 3056-3061 © 2022 TPI www.thepharmajournal.com Received: 07-10-2022 Accepted: 11-11-2022 Katkar Ankush Haribhau Research Scholar, Department of Fruit Science, Pt. Kishori Lal Shukla College of Horticulture and Research Station, IGKV, Raipur Chhattisgarh, India MS Paikra Professor, Department of Fruit Science, Pt. Kishor... …

## Chapters

- [Chapter 4: Kernel Security Governance and eBPF Verification Frameworks](chapters/03dd9fedddcf0df5.md)
- [Chapter 4: Governance Frameworks for Kernel Extension Security and System Call Taxonomy](chapters/5dcc7946b737722f.md)
- [Kernel-Level Security Artifacts and Syscall Governance Frameworks](chapters/5e492f8df78f33bd.md)
- [Chapter 4: eBPF Artifact Verification and Syscall Governance](chapters/60a94c764da1cafd.md)
- [Chapter 4: Kernel-Level Security Verification and Audit Compliance Frameworks](chapters/632a27ff9865548e.md)
- [Chapter 4: Kernel Security Governance and eBPF Verification Frameworks](chapters/6672d789f4356713.md)
- [Chapter 4: Ontological Formalization of Kernel Security Artifacts and System Call Governance](chapters/683f32f036ea44aa.md)
- [Chapter 4: Kernel Extension Governance and System Call Classification](chapters/68ba6d5727d7e221.md)
- [Chapter 4: Kernel-Level Security Assertions and eBPF Artifact Verification](chapters/8d6366c21d9863ef.md)
- [Chapter 7: Kernel Artifact Governance and System Call Classification](chapters/b314e2a71c06b3c7.md)
- [Chapter 4: Kernel Security Governance and eBPF Verification Frameworks](chapters/c2439e945a732405.md)
- [eBPF Verification and Syscall Audit Schema](chapters/de537b1fadb01da2.md)
- [Chapter 4: Kernel Extension Governance and Syscall Security Frameworks](chapters/e8fd9f6dbf01a030.md)

## Ontology terms grounding this collection

- `ebpfprogram_verified_safe` — {X} is an artifact that verified safe by {Y}
- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_audited_by` — {X} is a designative information content entity
- `syscall_equiv_in_subsystem` — Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:inSyscallSubsystem some {Y:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_ebpfprogram_verified_safe`](tables/t_ebpfprogram_verified_safe.sql) — realizes `ebpfprogram_verified_safe` · _shared with 3 other collection(s)_
- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier` · _shared with 7 other collection(s)_
- [`t_syscall_audited_by`](tables/t_syscall_audited_by.sql) — realizes `syscall_audited_by` · _shared with 6 other collection(s)_
- [`t_syscall_equiv_in_subsystem`](tables/t_syscall_equiv_in_subsystem.sql) — realizes `syscall_equiv_in_subsystem` · _shared with 6 other collection(s)_
