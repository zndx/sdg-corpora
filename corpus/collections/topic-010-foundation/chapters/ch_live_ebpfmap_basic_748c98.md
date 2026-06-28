---
chapter_id: ch_live_ebpfmap_basic_748c98
topic_id: 10
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_basic', 'measurement_subclass', 'descriptive_only_about_artifact']
model: engine-refine
---

The governance of eBPF map registries rests on a dual-layer schema that separates measurable attributes from descriptive metadata. The fact table for eBPF maps records each map instance by a unique identifier—EBPF-0001 through EBPF-0004—alongside a self-referential key that links one map to another, as seen when EBPF-0002 references EBPF-0005 and EBPF-0004 points back to EBPF-0001. Each record carries a size in bytes, ranging from 31,105,012 for EBPF-0003 to 354,373,995 for EBPF-0004, and a version number spanning 3 through 12, enabling auditors to track evolution across releases. The companion dimension table assigns each map a human-readable label—Ebpfmap Label 01 through Ebpfmap Label 04—and a category classification such as Ebpfmap Category 01 or Ebpfmap Category 04, providing the semantic context necessary for inventory and compliance reporting.

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| ARTI-0001 | About Label 01 | About Category 01 |
| ARTI-0002 | About Label 02 | About Category 02 |
| ARTI-0003 | About Label 03 | About Category 03 |
| ARTI-0004 | About Label 04 | About Category 04 |
| ARTI-0005 | About Label 05 | About Category 05 |
| ARTI-0006 | About Label 06 | About Category 06 |

Measurement subclassing introduces a parallel structure for observational data, where each measurement type—Heart rate, Seismic magnitude, Soil moisture—is paired with a physical dimension like Electric current, Power, Energy, or Mass. The junction table that binds measurements to dimensions carries a role attribute distinguishing ownership from review, with records such as MEAS-0004 acting as owner against dimension MEAS-0003, and MEAS-0006 serving as reviewer against dimension MEAS-0005. This role-based linkage ensures that accountability for each measurement-dimension pairing is explicit and traceable, a requirement that becomes critical when regulatory frameworks demand demonstrable provenance for sensor-derived data.

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |

Descriptive facts form a third pillar of the schema, capturing quantitative assessments alongside their epistemic bounds. Each fact—ARTI-0001 through ARTI-0004—references an about entity (ARTI-0002 through ARTI-0005) and carries a confidence score between 0.209 and 0.854, an uncertainty magnitude ranging from 452.69 to 846.52, and a measured value such as 646.43 or 110.19. The dimension table for about entities provides labels and categories—About Label 01 through About Label 04, mapped to About Category 01 through About Category 04—that contextualize what each fact describes. The interplay of confidence and uncertainty allows downstream systems to weight evidence appropriately, filtering or prioritizing assertions based on their reliability thresholds.

**fact_descriptive**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.854 | 452.69 | 646.43 |
| ARTI-0002 | ARTI-0002 | 0.209 | 846.52 | 408.39 |
| ARTI-0003 | ARTI-0002 | 0.761 | 532.60 | 850.50 |
| ARTI-0004 | ARTI-0004 | 0.480 | 663.65 | 110.19 |
| ARTI-0005 | ARTI-0006 | 0.697 | 535.73 | 322.53 |
| ARTI-0006 | ARTI-0003 | 0.238 | 734.71 | 457.41 |

Together, these tables constitute a relational architecture for tracking both the structural properties of eBPF maps and the quality of observational claims about them. The foreign-key chains—fact_ebpfmap.id to dim_ebpfmap.id, fact_descriptive.about_key to dim_about.id, and the bidirectional measurement-to-dimension links through the junction table—create a navigable graph where every numeric value can be traced to its source classification, every version can be correlated with its size, and every confidence score can be evaluated against its stated uncertainty. In practice, this means that an auditor querying for all maps exceeding 200 megabytes can join fact_ebpfmap to dim_ebpfmap to retrieve not only the size and version but also the category and label, while a data-quality pipeline can filter descriptive facts by confidence greater than 0.75 and uncertainty below 500 to surface only the most reliable assertions.