# Collection — topic 97 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): Journal of species lists and distribution Mammalia, Chiroptera, Phyllostomidae, Artibeus planirostris (Spix, 1823) and Trachops cirrhosus (Spix, 1823): First record for the state of Sergipe, northeastern Brazil José Anderson Feijó 1 * and Hannah Larissa Nunes 1 1 Universidade Federal da Paraíba, Centro de Ciências Exatas e da Natureza, Departamento de Sistemática e Ecologia, Laboratório de Mast... …

## Chapters

- [Chapter 4: Formal Ontology of Kernel Syscall Security and eBPF Enforcement](chapters/09634db2170589e5.md)
- [Syscall Classification in Kernel Subsystem Monitoring](chapters/31702af617a9ce53.md)
- [Syscall Classification in Kernel Audit Trails](chapters/375d1e40a1ae1689.md)
- [Syscall Subsystem Classification in eBPF Kernel Monitoring](chapters/3f6f0abc55e30026.md)
- [Chapter 4: Ontological Mapping of System Call Interfaces and Security Tiers](chapters/4d48f291866608b4.md)
- [Chapter 4: Ontological Mapping of Kernel Interface Control Elements](chapters/7956ed1f937e3bc6.md)
- [Kernel Syscall Classification via Designative Information Content Entities](chapters/a1a9dd8e6bc52733.md)
- [Chapter 4: Ontological Classification of Kernel Entities and Security Tiers](chapters/ca882f5ae85518ec.md)
- [Chapter 4: Formal Classification of Syscall Entities within eBPF Security Domains](chapters/ddf3f430093544d6.md)
- [Chapter 4: Formal Classification of Designative ICE within Kernel Subsystems](chapters/e4c9dbb6a0942809.md)
- [Chapter 4: Formal Classification of Syscall Contexts and Security Tiers](chapters/fdf29f8c9eb4a9d9.md)

## Ontology terms grounding this collection

- `syscall_at_security_tier` — {X} is a designative information content entity that at security tier {Y}
- `syscall_equiv_in_subsystem` — Class: {X:Class} EquivalentTo: cco:DesignativeICE and (sdg:inSyscallSubsystem some {Y:Class})
- `syscall_only_in_kernel_subsystem` — {X} is a designative information content entity that in syscall subsystem {Y}
- `syscall_subclass` — {X} is a designative information content entity that in syscall subsystem {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_syscall_at_security_tier`](tables/t_syscall_at_security_tier.sql) — realizes `syscall_at_security_tier`
- [`t_syscall_equiv_in_subsystem`](tables/t_syscall_equiv_in_subsystem.sql) — realizes `syscall_equiv_in_subsystem`
- [`t_syscall_only_in_kernel_subsystem`](tables/t_syscall_only_in_kernel_subsystem.sql) — realizes `syscall_only_in_kernel_subsystem`
- [`t_syscall_subclass`](tables/t_syscall_subclass.sql) — realizes `syscall_subclass`
