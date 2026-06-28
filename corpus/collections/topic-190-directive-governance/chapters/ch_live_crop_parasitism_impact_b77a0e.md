---
chapter_id: ch_live_crop_parasitism_impact_b77a0e
topic_id: 190
family: 08_derived
cited_terms: ['crop_parasitism_impact', 'ebpfprogram_observes_syscall', 'ebpfmap_equiv_kv_typed']
model: engine-refine
---

Crop parasitism impact records serve as the central entities in agricultural impact tracking, each assigned a unique identifier such as IMPA-0001 through IMPA-0004 to distinguish individual impact assessments. These identifiers anchor a network of relationships that capture how parasitic pressure propagates through farming systems and ultimately reaches the households that depend on them. Each impact record carries a descriptive label—Crop Parasitism Impact 01, for instance—that provides human-readable context, while the identifier itself functions as the stable reference point across all associated relationship tables. This separation of human-readable description from machine-stable identification ensures that impact assessments remain traceable even as their contextual descriptions evolve over time.

**t_crop_parasitism_impact**

| id | crop_parasitism_impact |
| --- | --- |
| IMPA-0001 | Crop Parasitism Impact 01 |
| IMPA-0002 | Crop Parasitism Impact 02 |
| IMPA-0003 | Crop Parasitism Impact 03 |
| IMPA-0004 | Crop Parasitism Impact 04 |
| IMPA-0005 | Crop Parasitism Impact 05 |
| IMPA-0006 | Crop Parasitism Impact 06 |

**t_crop_parasitism_impact_impacts_target**

| id | impacts_target |
| --- | --- |
| IMPA-0001 | Impacts Target 01 |
| IMPA-0002 | Impacts Target 02 |
| IMPA-0003 | Impacts Target 03 |
| IMPA-0004 | Impacts Target 04 |
| IMPA-0005 | Impacts Target 05 |
| IMPA-0006 | Impacts Target 06 |

**t_ebpfprogram_observes_syscall**

| id | ebpfprogram |
| --- | --- |
| SYSC-0001 | audit_syscall |
| SYSC-0002 | monitor_network |
| SYSC-0003 | log_dns_query |
| SYSC-0004 | flow_table |
| SYSC-0005 | perf_buffer |
| SYSC-0006 | track_memory |

**t_ebpfprogram_observes_syscall_observes_syscall**

| id | observes_syscall |
| --- | --- |
| SYSC-0001 | openat |
| SYSC-0002 | connect |
| SYSC-0003 | statx |
| SYSC-0004 | socket |
| SYSC-0005 | clone |
| SYSC-0006 | sendmsg |
| SYSC-0007 | execve |

**t_ebpfmap_equiv_kv_typed**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | conntrack_map |
| TYPE-0002 | connection_pool |
| TYPE-0003 | filter_packet |
| TYPE-0004 | profile_latency |
| TYPE-0005 | log_dns_query |
| TYPE-0006 | log_dns_query |
| TYPE-0007 | filter_packet |
| TYPE-0008 | connection_pool |

**t_ebpfmap_equiv_kv_typed_key_type**

| id | key_type |
| --- | --- |
| TYPE-0001 | bpf_cookie |
| TYPE-0002 | uint32_t |
| TYPE-0003 | uint32_t |
| TYPE-0004 | dev_index |
| TYPE-0005 | pid_t |
| TYPE-0006 | inode_key |

The propagation of parasitism effects is modeled through subject-target relationships that connect impact records to the entities they affect. When a crop parasitism impact influences a rice cultivation system, the relationship is captured through a junction table where the impact record serves as the subject and the cultivation system as the target. For example, IMPA-0001 links to Affects Cultivation System 06, while IMPA-0002 connects to Affects Cultivation System 02, establishing which farming systems bear the brunt of specific parasitic pressures. Similarly, parasitic weed hosts are linked to impact records through a parasitises_host relationship, where IMPA-0004 associates with Parasitises Host 03 and IMPA-0001 with Parasitises Host 07. These relationships do not merely list associations; they encode the directionality of impact, making clear which entity initiates the effect and which receives it.

**t_crop_parasitism_impact_affects_cultivation_system**

| id | affects_cultivation_system |
| --- | --- |
| IMPA-0001 | Affects Cultivation System 01 |
| IMPA-0002 | Affects Cultivation System 02 |
| IMPA-0003 | Affects Cultivation System 03 |
| IMPA-0004 | Affects Cultivation System 04 |
| IMPA-0005 | Affects Cultivation System 05 |
| IMPA-0006 | Affects Cultivation System 06 |
| IMPA-0007 | Affects Cultivation System 07 |
| IMPA-0008 | Affects Cultivation System 08 |

**t_crop_parasitism_impact__affects_cultivation_system**

| id | crop_id | affects_cultivation_system_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0006 | owner |
| IMPA-0002 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0003 | IMPA-0002 | IMPA-0002 | owner |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0005 | IMPA-0001 | IMPA-0001 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0007 | contributor |
| IMPA-0007 | IMPA-0002 | IMPA-0003 | observer |
| IMPA-0008 | IMPA-0002 | IMPA-0003 | reviewer |

**t_crop_parasitism_impact_parasitises_host**

| id | parasitises_host |
| --- | --- |
| IMPA-0001 | Parasitises Host 01 |
| IMPA-0002 | Parasitises Host 02 |
| IMPA-0003 | Parasitises Host 03 |
| IMPA-0004 | Parasitises Host 04 |
| IMPA-0005 | Parasitises Host 05 |
| IMPA-0006 | Parasitises Host 06 |
| IMPA-0007 | Parasitises Host 07 |

**t_crop_parasitism_impact__parasitises_host**

| id | crop_id | parasitises_host_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0004 | IMPA-0003 | contributor | Cardinality Note 01 |
| IMPA-0002 | IMPA-0006 | IMPA-0001 | observer | Cardinality Note 02 |
| IMPA-0003 | IMPA-0005 | IMPA-0004 | contributor | Cardinality Note 03 |
| IMPA-0004 | IMPA-0001 | IMPA-0007 | observer | Cardinality Note 04 |
| IMPA-0005 | IMPA-0001 | IMPA-0003 | reviewer | Cardinality Note 05 |
| IMPA-0006 | IMPA-0006 | IMPA-0002 | contributor | Cardinality Note 06 |
| IMPA-0007 | IMPA-0004 | IMPA-0005 | observer | Cardinality Note 07 |
| IMPA-0008 | IMPA-0004 | IMPA-0002 | reviewer | Cardinality Note 08 |

The role attribute further qualifies each relationship by specifying the nature of the connection between subject and target. In the cultivation system relationships, the role is consistently recorded as owner, indicating that the impacted cultivation system holds primary responsibility or stewardship over the affected area. In contrast, the parasitic weed relationships employ a richer role vocabulary: IMPA-0004 carries the role contributor, suggesting an active participatory relationship with the host, while IMPA-0001 carries the role observer, implying a monitoring or evidentiary connection. This role distinction allows governance frameworks to differentiate between direct causal agents and indirect indicators, supporting more nuanced risk assessments and intervention strategies.

**t_ebpfprogram_observes_syscall__observes_syscall**

| id | ebpfprogram_id | observes_syscall_id | role |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | contributor |
| SYSC-0002 | SYSC-0003 | SYSC-0001 | owner |
| SYSC-0003 | SYSC-0002 | SYSC-0005 | observer |
| SYSC-0004 | SYSC-0002 | SYSC-0006 | contributor |
| SYSC-0005 | SYSC-0002 | SYSC-0006 | observer |
| SYSC-0006 | SYSC-0002 | SYSC-0004 | observer |
| SYSC-0007 | SYSC-0002 | SYSC-0004 | reviewer |
| SYSC-0008 | SYSC-0001 | SYSC-0001 | contributor |

**t_ebpfmap_equiv_kv_typed__key_type**

| id | ebpfmap_id | key_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0001 | contributor |
| TYPE-0002 | TYPE-0002 | TYPE-0002 | owner |
| TYPE-0003 | TYPE-0005 | TYPE-0002 | owner |
| TYPE-0004 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0005 | reviewer |
| TYPE-0006 | TYPE-0002 | TYPE-0003 | owner |
| TYPE-0007 | TYPE-0006 | TYPE-0006 | owner |
| TYPE-0008 | TYPE-0004 | TYPE-0003 | owner |

At the downstream end of the impact chain, agricultural households appear as the ultimate recipients of parasitism effects. The impacts_target relationship connects impact records to household entities, with IMPA-0002 linking to Impacts Target 04 and IMPA-0003 linking to Impacts Target 02. Here, the role attribute takes on additional granularity: IMPA-0002 carries the role observer, IMPA-0006 carries reviewer, and IMPA-0003 appears with both observer and owner roles across separate relationship instances. This multiplicity of roles within the same impact record reflects the layered nature of household-level impacts, where a single parasitism event may simultaneously be monitored, reviewed, and directly owned by different stakeholders within the household structure.

Temporal tracking is enforced through the since attribute, which records the date from which each relationship became active in the system. IMPA-0002's connection to Impacts Target 04 became effective on 2024-06-04, while IMPA-0006's connection to the same target dates back to 2023-03-28. IMPA-0003's two relationships to Impacts Target 02 were established on 2023-09-02 and 2023-10-26 respectively, indicating that the impact relationship was refined or extended over time. This temporal dimension is critical for longitudinal analysis, enabling auditors and researchers to reconstruct the evolution of parasitism impacts and correlate them with seasonal patterns, intervention timelines, or policy changes.

Cardinality notes provide structural constraints on the relationships, specifying how many target entities a subject may connect to and vice versa. In the parasitic weed relationships, Cardinality Note 01 through Cardinality Note 04 are assigned to IMPA-0004, IMPA-0006, IMPA-0005, and IMPA-0001 respectively, encoding the multiplicity rules that govern how many hosts each impact record may reference. The same cardinality note values appear in the impacts_target relationships for IMPA-0002, IMPA-0006, and IMPA-0003, suggesting a consistent constraint model across relationship types. These cardinality constraints are not merely technical metadata; they represent governance decisions about the expected scope of impact propagation and ensure data integrity by preventing unbounded or semantically invalid relationship expansions.

**t_crop_parasitism_impact__impacts_target**

| id | crop_id | impacts_target_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 01 | 2024-06-04 |
| IMPA-0002 | IMPA-0006 | IMPA-0004 | reviewer | Cardinality Note 02 | 2023-03-28 |
| IMPA-0003 | IMPA-0003 | IMPA-0002 | observer | Cardinality Note 03 | 2023-09-02 |
| IMPA-0004 | IMPA-0003 | IMPA-0002 | owner | Cardinality Note 04 | 2023-10-26 |
| IMPA-0005 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 05 | 2023-11-01 |
| IMPA-0006 | IMPA-0002 | IMPA-0001 | observer | Cardinality Note 06 | 2023-08-27 |
| IMPA-0007 | IMPA-0001 | IMPA-0005 | contributor | Cardinality Note 07 | 2025-05-05 |
| IMPA-0008 | IMPA-0003 | IMPA-0001 | contributor | Cardinality Note 08 | 2024-10-30 |

**t_ebpfmap_equiv_kv_typed_value_type_map**

| id | value_type_map |
| --- | --- |
| TYPE-0001 | dev_entry |
| TYPE-0002 | task_struct |
| TYPE-0003 | flow_key |
| TYPE-0004 | perf_event |
| TYPE-0005 | stack_trace |
| TYPE-0006 | perf_event |
| TYPE-0007 | stack_trace |

**t_ebpfmap_equiv_kv_typed__value_type_map**

| id | ebpfmap_id | value_type_map_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | TYPE-0002 | contributor | Cardinality Note 01 |
| TYPE-0002 | TYPE-0002 | TYPE-0006 | contributor | Cardinality Note 02 |
| TYPE-0003 | TYPE-0003 | TYPE-0003 | observer | Cardinality Note 03 |
| TYPE-0004 | TYPE-0006 | TYPE-0001 | owner | Cardinality Note 04 |
| TYPE-0005 | TYPE-0007 | TYPE-0005 | owner | Cardinality Note 05 |
| TYPE-0006 | TYPE-0002 | TYPE-0002 | reviewer | Cardinality Note 06 |
| TYPE-0007 | TYPE-0005 | TYPE-0004 | observer | Cardinality Note 07 |
| TYPE-0008 | TYPE-0007 | TYPE-0001 | reviewer | Cardinality Note 08 |