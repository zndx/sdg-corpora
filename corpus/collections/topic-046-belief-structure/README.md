# Collection — topic 46 · 06_belief_structure

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **18 topics** (target + style) · **1 ontology terms** · **1 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 46: topic 8, topic 20, topic 26, topic 31, topic 34, topic 54, topic 76, topic 90, topic 94, topic 115, topic 117, topic 122, topic 142, topic 145, topic 165, topic 186, topic 188.

> **Topic gist** (representative FinePDFs text): Package 'rusda' October 14, 2022 rusda-package Interface to USDA Databases Description An interface to the web service methods provided by the United States Department of Agriculture (USDA). The Agricultural Research Service (ARS) provides a large set of databases. The current version of the package holds interfaces to the Systematic Mycology and Microbiology Laboratory (SMML), which consists... …

## Chapters

- [Chapter 4: Ontological Specification of Kernel Audit Entities](chapters/2b625a88fbff71ff.md)
- [Chapter 4: Ontological Formalization of Kernel Syscall Auditing Mechanisms](chapters/37e489aa564e935c.md)
- [Chapter 4: Ontological Formalization of eBPF Kernel Auditing](chapters/6140d815acd9a0c9.md)
- [Chapter 12: Formalization of System Call Audit Trails in eBPF Environments](chapters/69b2ce9cbb995664.md)
- [Chapter 4: Ontological Formalization of Kernel Audit Mechanisms](chapters/6ce658b124856228.md)
- [Chapter 7: Ontological Formalization of Kernel Audit Entities](chapters/6f9e92c3402f6f69.md)
- [Chapter 4: Kernel Audit Semantics and Designative Entities](chapters/ac332314c297e230.md)
- [Audit Trails for Syscall Classification](chapters/bfdc0b18579cf17c.md)
- [Chapter 4: Ontological Mapping of eBPF Audit Provenance](chapters/ca37329051fef908.md)

## Ontology terms grounding this collection

- `syscall_audited_by` — {X} is a designative information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_syscall_audited_by`](tables/t_syscall_audited_by.sql) — realizes `syscall_audited_by` · _shared with 6 other collection(s)_
