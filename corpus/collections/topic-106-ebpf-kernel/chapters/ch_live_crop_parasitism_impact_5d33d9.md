---
chapter_id: ch_live_crop_parasitism_impact_5d33d9
topic_id: 106
family: 08_derived
cited_terms: ['crop_parasitism_impact', 'profile_has_cardinality', 'syscall_max_one_return']
model: engine-refine
---

CROP PARASITISM IMPACT ASSESSMENTS serve as the foundational entities within the agricultural monitoring framework, each uniquely identified by a structured code such as IMPA-0001 through IMPA-0004 and classified under descriptive impact categories including Crop Parasitism Impact 01 through Crop Parasitism Impact 04. These assessments do not exist in isolation; rather, they propagate through a network of relational associations that capture the multidimensional consequences of parasitic pressure on agricultural systems. A parasitism impact record may affect rice cultivation systems—designated as Affects Cultivation System 01 through Affects Cultivation System 04—and simultaneously parasitize specific host organisms classified as Parasitises Host 01 through Parasitises Host 04, which correspond to parasitic weed entities within the taxonomy. The agricultural household, as the ultimate unit of vulnerability, constitutes the terminal target of these impact cascades, with each impact record potentially affecting one or more households designated as Impacts Target 01 through Impacts Target 04.

**t_crop_parasitism_impact**

| id | crop_parasitism_impact |
| --- | --- |
| IMPA-0001 | Crop Parasitism Impact 01 |
| IMPA-0002 | Crop Parasitism Impact 02 |
| IMPA-0003 | Crop Parasitism Impact 03 |
| IMPA-0004 | Crop Parasitism Impact 04 |
| IMPA-0005 | Crop Parasitism Impact 05 |
| IMPA-0006 | Crop Parasitism Impact 06 |

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

**t_crop_parasitism_impact_impacts_target**

| id | impacts_target |
| --- | --- |
| IMPA-0001 | Impacts Target 01 |
| IMPA-0002 | Impacts Target 02 |
| IMPA-0003 | Impacts Target 03 |
| IMPA-0004 | Impacts Target 04 |
| IMPA-0005 | Impacts Target 05 |
| IMPA-0006 | Impacts Target 06 |

The relational architecture governing these associations employs a subject-target-role triad that distinguishes between the nature of influence and the directionality of effect. In the association between crop parasitism impacts and cultivation systems, the role field uniformly assumes the value owner, indicating a structural or definitional relationship wherein the impact entity exercises authoritative control over the affected cultivation system. By contrast, the parasitism-to-host association exhibits role heterogeneity: records IMPA-0001 and IMPA-0004 carry the role observer, while IMPA-0002 and IMPA-0003 carry the role contributor, suggesting a distinction between passive monitoring of host-parasite interactions and active participation in the parasitic mechanism. Similarly, the impact-to-household association distributes roles across observer, reviewer, and owner, with IMPA-0003 exhibiting both an observer relationship to household IMPA-0002 and an owner relationship to the same household, thereby encoding parallel assessment perspectives within a single impact record.

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

**t_syscall_max_one_return__return_type**

| id | syscall_id | return_type_id | role |
| --- | --- | --- | --- |
| RETU-0001 | RETU-0005 | RETU-0003 | observer |
| RETU-0002 | RETU-0001 | RETU-0007 | contributor |
| RETU-0003 | RETU-0004 | RETU-0004 | owner |
| RETU-0004 | RETU-0008 | RETU-0006 | reviewer |
| RETU-0005 | RETU-0006 | RETU-0007 | owner |
| RETU-0006 | RETU-0006 | RETU-0007 | owner |
| RETU-0007 | RETU-0007 | RETU-0002 | contributor |
| RETU-0008 | RETU-0003 | RETU-0005 | reviewer |

Cardinality metadata provides the quantitative scaffolding that transforms qualitative associations into measurable governance parameters. The fact_profile table anchors this dimension with records identified as CARD-0001 through CARD-0004, each carrying a cardinality_key that references a specific cardinality instance, a confidence score ranging from 0.226 to 0.994, an uncertainty magnitude between 284.36 and 622.09, and a misc value quantifying the observed metric—728.94 for CARD-0001, 380.57 for CARD-0002, 607.36 for CARD-0003, and 448.09 for CARD-0004. The dim_cardinality dimension table supplies the categorical taxonomy for these measures, with cardinality_label entries (Cardinality Label 01 through Cardinality Label 04) paired against cardinality_category classifications (Cardinality Category 01 through Cardinality Category 04), enabling hierarchical organization of cardinality concepts by both descriptive and categorical axes. Cardinality notes attached to individual relationship records—Cardinality Note 01 through Cardinality Note 04—further qualify the scope and constraints of each association, specifying whether the relationship is one-to-one, one-to-many, or subject to other multiplicity constraints.

**fact_profile**

| id | cardinality_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CARD-0001 | CARD-0001 | 0.299 | 284.36 | 728.94 |
| CARD-0002 | CARD-0003 | 0.994 | 557.92 | 380.57 |
| CARD-0003 | CARD-0005 | 0.773 | 622.09 | 607.36 |
| CARD-0004 | CARD-0002 | 0.226 | 488.10 | 448.09 |

**dim_cardinality**

| id | cardinality_label | cardinality_category |
| --- | --- | --- |
| CARD-0001 | Cardinality Label 01 | Cardinality Category 01 |
| CARD-0002 | Cardinality Label 02 | Cardinality Category 02 |
| CARD-0003 | Cardinality Label 03 | Cardinality Category 03 |
| CARD-0004 | Cardinality Label 04 | Cardinality Category 04 |
| CARD-0005 | Cardinality Label 05 | Cardinality Category 05 |
| CARD-0006 | Cardinality Label 06 | Cardinality Category 06 |

Temporal provenance is captured through the since field in the impact-to-household association table, which records the effective date from which each relationship became operative. The dates 2023-03-28, 2023-09-02, 2023-10-26, and 2024-06-04 establish a chronological sequence spanning approximately fifteen months, enabling temporal auditing of when particular impact assessments began to apply to specific agricultural households. This temporal dimension is essential for governance frameworks that require versioned accountability: an impact assessment that assumed the role reviewer for household IMPA-0004 as of 2023-03-28 may have been superseded or modified by subsequent assessments, and the since field provides the anchor point for reconstructing the state of the system at any given moment. The combination of role, cardinality_note, and since within a single junction table thus creates a richly qualified relationship record that supports both current-state queries and historical reconstruction.

**t_syscall_max_one_return**

| id | syscall |
| --- | --- |
| RETU-0001 | socket |
| RETU-0002 | write |
| RETU-0003 | read |
| RETU-0004 | fstat |
| RETU-0005 | execve |
| RETU-0006 | execve |
| RETU-0007 | read |
| RETU-0008 | execve |

**t_syscall_max_one_return_return_type**

| id | return_type |
| --- | --- |
| RETU-0001 | process_id |
| RETU-0002 | error_code |
| RETU-0003 | pointer_addr |
| RETU-0004 | memory_size |
| RETU-0005 | pointer_addr |
| RETU-0006 | stat_struct |
| RETU-0007 | process_id |