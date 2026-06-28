---
chapter_id: ch_live_tc_classifier_subclass_622638
topic_id: 158
family: 07_long_tail
cited_terms: ['tc_classifier_subclass', 'ebpfprogram_min_one_hook', 'soc2_confidentiality_subclass']
model: engine-refine
---

The governance of technical controls rests upon a structured taxonomy that separates measurable attributes from their categorical descriptions, ensuring that every operational artifact can be classified, prioritized, and reviewed against established compliance benchmarks. At the core of this architecture lie fact tables that capture quantitative properties—size in bytes, version identifiers, and review cadences—while parallel dimension tables supply the human-readable labels and category assignments that give those measurements their regulatory meaning. The fact_soc table, for instance, records compliance artifacts with identifiers such as CONF-0001 through CONF-0004, each associated with a priority level ranging from 1 to 5 and a review cycle measured in days, with values spanning from 372 days for CONF-0004 to 890 days for CONF-0003, reflecting the varying rigor applied to different control domains.

**fact_soc**

| id | for_s_o_c2_domain_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0002 | 3 | 494 |
| CONF-0002 | CONF-0005 | 2 | 767 |
| CONF-0003 | CONF-0003 | 1 | 890 |
| CONF-0004 | CONF-0005 | 5 | 372 |

The for_s_o_c2_domain dimension anchors these compliance records to their respective SOC 2 domains, linking each fact record through a foreign key relationship that maps CONF-0002 and CONF-0004 to CONF-0005, while CONF-0003 stands independently under CONF-0003. The dimension itself carries a dual-layer classification: a misc label—For S O C2 Domain Label 01 through For S O C2 Domain Label 04—and a category field—For S O C2 Domain Category 01 through For S O C2 Domain Category 04—that together enable both granular search and broad aggregation. This separation of identifier, label, and category mirrors the broader design principle that governs all dimension tables in the framework, where the id column serves as the immutable key, the misc column provides the displayable name, and the category column supplies the grouping taxonomy.

**dim_for_s_o_c2_domain**

| id | for_s_o_c2_domain_label | for_s_o_c2_domain_category |
| --- | --- | --- |
| CONF-0001 | For S O C2 Domain Label 01 | For S O C2 Domain Category 01 |
| CONF-0002 | For S O C2 Domain Label 02 | For S O C2 Domain Category 02 |
| CONF-0003 | For S O C2 Domain Label 03 | For S O C2 Domain Category 03 |
| CONF-0004 | For S O C2 Domain Label 04 | For S O C2 Domain Category 04 |
| CONF-0005 | For S O C2 Domain Label 05 | For S O C2 Domain Category 05 |
| CONF-0006 | For S O C2 Domain Label 06 | For S O C2 Domain Category 06 |

A parallel structure governs the classification of technical components by their attachment points and their transport control characteristics. The fact_ebpfprogram table records eBPF program artifacts with identifiers HOOK-0001 through HOOK-0004, each carrying a size_bytes measurement that ranges from 113,209,263 bytes for HOOK-0003 to 784,335,640 bytes for HOOK-0001, and a version number that varies between 9 and 12. The attaches_to_hook_key column in this fact table references the dim_attaches_to_hook dimension, where identifiers HOOK-0001 through HOOK-0004 are paired with labels such as Attaches To Hook Label 01 and categories like Attaches To Hook Category 01, establishing the linkage between a program's operational footprint and its hook classification. Similarly, the fact_classifier table tracks classifier artifacts with identifiers CLAS-0001 through CLAS-0004, recording sizes from 623,892,633 bytes for CLAS-0004 to 883,422,563 bytes for CLAS-0002, and versions ranging from 1 to 9, with the t_c_direction_key column pointing to the dim_t_c_dimension for directional classification.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**fact_ebpfprogram**

| id | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0006 | 167519051 | 1 |

The dimension tables for both attaches_to_hook and t_c_direction follow an identical schema pattern: an identifier column that serves as the primary key, a misc column containing the human-readable label, and a category column that assigns the item to a broader classification group. In dim_attaches_to_hook, the identifiers HOOK-0001 through HOOK-0004 map to labels Attaches To Hook Label 01 through Attaches To Hook Label 04 and categories Attaches To Hook Category 01 through Attaches To Hook Category 04; in dim_t_c_direction, the identifiers CLAS-0001 through CLAS-0004 map to labels T C Direction Label 01 through T C Direction Label 04 and categories T C Direction Category 01 through T C Direction Category 04. This uniformity across dimensions ensures that any fact table can be enriched with descriptive context through a single join operation, and that the resulting metadata is consistently structured regardless of the domain being modeled.

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

The practical effect of this design is that compliance officers and technical auditors can query the system from multiple angles: by priority and review cycle to identify which controls require immediate attention, by size and version to track the evolution of technical artifacts, by category to aggregate controls across domains, or by label to locate specific items within a given classification. The foreign key relationships—fact_soc to dim_for_s_o_c2_domain, fact_ebpfprogram to dim_attaches_to_hook, and fact_classifier to dim_t_c_direction—ensure that every measurement is traceable to its categorical definition, and that the misc labels provide a stable, human-interpretable layer above the raw identifiers. In this way, the framework transforms what could be a flat collection of compliance records into a navigable knowledge graph, where each fact is anchored to its domain, each dimension is partitioned by category, and every artifact carries both its quantitative properties and its qualitative classification in a single, queryable structure.