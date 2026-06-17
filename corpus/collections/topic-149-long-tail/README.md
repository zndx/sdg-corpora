# Collection — topic 149 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **4 ontology terms** · **4 underlying tables**.

> **Topic gist** (representative FinePDFs text): HAZARD COMMUNICATION PROGRAM (MODEL) INSTRUCTIONS FOR ADAPTING THIS MODEL TO A SPECIFIC PROGRAM FOR AN INDIVIDUAL DEPARTMENT This model is available for Southern Illinois University Carbondale campus departments as an aid to complying with the Occupational Safety and Health Administration (OSHA) requirement of maintaining a work place specific written Hazard Communication Program. "Hazard Commun.. …

## Chapters

- [eBPF Artifact Attachment Constraints](chapters/1372bd26cafd801e.md)
- [Chapter 7: Governance of Kernel-Level Artifacts and Attachment Constraints](chapters/2b76725fe017971e.md)
- [Chapter 4: Ontological Constraints for eBPF Kernel Instrumentation](chapters/2f3522dfc31798bd.md)
- [Chapter 4: Governance of eBPF Artifacts and Kernel Hook Constraints](chapters/4d60165dd217a071.md)
- [Chapter 4: Kernel Hook Artifacts and eBPF Program Binding Constraints](chapters/563df79a7ffd9377.md)
- [Chapter 4: Kernel Hook and Program Attachment Constraints](chapters/851314313059b185.md)
- [Chapter 4: Governance of eBPF Artifacts and Kernel Hook Constraints](chapters/9181ae964795730c.md)
- [eBPF Kernel Artifact Attachment Reference](chapters/9cef0995ee2129e6.md)
- [Chapter 4: eBPF Artifact Attachment and Constraint Governance](chapters/9f677c394fea83e4.md)
- [Chapter 4: Governance of eBPF Artifacts and Kernel Hook Constraints](chapters/c5770ec68089adf1.md)
- [Chapter 4: Kernel Artifact Attachment Constraints and Hook Governance](chapters/c9d2172378ac1282.md)
- [Chapter 4: eBPF Artifact Governance and Kernel Hook Constraints](chapters/d1999c0e470f3506.md)

## Ontology terms grounding this collection

- `ebpfprogram_attaches_kernelhook_xref` — {X} is an artifact that attaches to hook artifact
- `ebpfprogram_only_attached_to_kprobe` — {X} is an artifact that attaches to hook {Y}
- `ebpfprogram_subclass` — {X} is an artifact that attaches to hook {Y}
- `kernelhook_max_one_program_attached` — {X} is an artifact

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_ebpfprogram_attaches_kernelhook_xref`](tables/t_ebpfprogram_attaches_kernelhook_xref.sql) — realizes `ebpfprogram_attaches_kernelhook_xref`
- [`t_ebpfprogram_only_attached_to_kprobe`](tables/t_ebpfprogram_only_attached_to_kprobe.sql) — realizes `ebpfprogram_only_attached_to_kprobe`
- [`t_ebpfprogram_subclass`](tables/t_ebpfprogram_subclass.sql) — realizes `ebpfprogram_subclass`
- [`t_kernelhook_max_one_program_attached`](tables/t_kernelhook_max_one_program_attached.sql) — realizes `kernelhook_max_one_program_attached`
