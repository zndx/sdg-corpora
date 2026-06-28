---
chapter_id: ch_live_syscall_subclass_d39406
topic_id: 26
family: 04_ebpf_kernel
cited_terms: ['syscall_subclass', 'ebpfmap_with_key_type', 'responsive_optic_nerve_dysfunction']
model: engine-refine
---

Operational observability and clinical tracking both depend on a disciplined taxonomy of identifiers that anchor every recorded event to a stable, queryable entity. Within the kernel-level monitoring layer, each syscall observation is assigned a unique identifier such as SYSC-0001 through SYSC-0004, and these identifiers serve as the primary key for aggregating event counts across the subsystem. A single identifier can appear in multiple contexts — SYSC-0002, for instance, surfaces both as a tracked event with a count of 52 and as a reference within the subsystem dimension, illustrating how the same logical entity is cross-referenced across fact and dimension tables to support both analytical queries and categorical lookups. The event counts themselves carry operational significance: SYSC-0004 registers 382 events, the highest in the observed set, while SYSC-0002 records only 52, a spread that signals varying levels of subsystem activity and may warrant differentiated alerting thresholds or resource allocation.

**fact_syscall**

| id | in_syscall_subsystem_key | event_count |
| --- | --- | --- |
| SYSC-0001 | SYSC-0004 | 238 |
| SYSC-0002 | SYSC-0002 | 52 |
| SYSC-0003 | SYSC-0003 | 198 |
| SYSC-0004 | SYSC-0005 | 382 |
| SYSC-0005 | SYSC-0002 | 283 |
| SYSC-0006 | SYSC-0001 | 288 |

Categorization and labeling provide the semantic layer that transforms raw identifiers into actionable intelligence. The syscall subsystem dimension table assigns each identifier a human-readable label — In Syscall Subsystem Label 01 through Label 04 — alongside a categorical classification such as In Syscall Subsystem Category 01 through Category 04. This two-tier structure, pairing a free-form label with a structured category, enables both ad-hoc identification and programmatic grouping. The same pattern recurs in the key-type dimension, where identifiers like TYPE-0001 through TYPE-0004 are annotated with labels such as Key Type Label 01 and categories like Key Type Category 01, establishing a parallel taxonomy for eBPF map metadata. The consistency of this labeling approach across domains — system observability and key-type classification — reflects a governance principle: every measurable entity should be simultaneously machine-queryable and human-legible.

**dim_in_syscall_subsystem**

| id | in_syscall_subsystem_label | in_syscall_subsystem_category |
| --- | --- | --- |
| SYSC-0001 | In Syscall Subsystem Label 01 | In Syscall Subsystem Category 01 |
| SYSC-0002 | In Syscall Subsystem Label 02 | In Syscall Subsystem Category 02 |
| SYSC-0003 | In Syscall Subsystem Label 03 | In Syscall Subsystem Category 03 |
| SYSC-0004 | In Syscall Subsystem Label 04 | In Syscall Subsystem Category 04 |
| SYSC-0005 | In Syscall Subsystem Label 05 | In Syscall Subsystem Category 05 |
| SYSC-0006 | In Syscall Subsystem Label 06 | In Syscall Subsystem Category 06 |

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |

The eBPF map fact table extends this framework into resource measurement, tracking the size in bytes and version of each map instance. Here, identifiers such as TYPE-0001 through TYPE-0004 anchor records that capture substantial resource footprints — TYPE-0004 alone accounts for 354,373,995 bytes, while TYPE-0003 registers a comparatively modest 31,105,012 bytes. These size differentials are not merely archival; they inform capacity planning, memory budgeting, and performance profiling. The version column, holding values from 1 to 12 across the observed set, introduces a temporal dimension that allows operators to trace the evolution of map configurations and correlate size or behavior changes with specific releases.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |

Beyond system-level telemetry, the same structural discipline applies to clinical observation tracking. The responsive optic nerve dysfunction table employs identifiers — DYSF-0001 through DYSF-0004 — to anchor records that capture patient-level findings across three dimensions: responsiveness, optic nerve dysfunction, and leber optic atrophy. Responsiveness is classified as either Focal Response or Diffuse Response, with the former appearing in three of four observed records. Optic nerve dysfunction entries include MT-ND6 Strain, Secondary Atrophy, Nutritional Deficit, and Hereditary Degeneration, while leber optic atrophy classifications range from Hereditary Degeneration and Nutritional Deficit to Bilateral Atrophy and Focal Atrophy. These categorical distinctions, recorded alongside the stable identifier, enable longitudinal tracking of patient cohorts and support epidemiological analysis without conflating distinct clinical entities.

**t_responsive_optic_nerve_dysfunction**

| id | responsive | optic_nerve_dysfunction | leber_optic_atrophy |
| --- | --- | --- | --- |
| DYSF-0001 | Focal Response | MT-ND6 Strain | Hereditary Degeneration |
| DYSF-0002 | Focal Response | Secondary Atrophy | Nutritional Deficit |
| DYSF-0003 | Diffuse Response | Nutritional Deficit | Bilateral Atrophy |
| DYSF-0004 | Focal Response | Hereditary Degeneration | Focal Atrophy |
| DYSF-0005 | Bilateral Response | Primary Atrophy | Papilledema |
| DYSF-0006 | Left Optic Response | Hereditary Degeneration | MT-ND6 Strain |
| DYSF-0007 | Left Optic Response | Compressive Lesion | Ischemic Optic Neuropathy |

The unifying principle across all these tables is the separation of identity from attribute. Identifiers remain immutable keys that persist across fact and dimension tables, while labels, categories, event counts, sizes, versions, and clinical classifications are treated as mutable attributes that can be updated, enriched, or reclassified without breaking referential integrity. This design supports auditability — every change to a label or category can be traced to a specific version or timestamp — and enables cross-domain correlation, where a single analytical query can join syscall event counts with subsystem categories, eBPF map sizes with key-type classifications, and clinical findings with responsiveness patterns. The result is a governance framework that scales: new identifiers can be added without restructuring existing relationships, and new attribute columns can be introduced without disrupting downstream consumers.