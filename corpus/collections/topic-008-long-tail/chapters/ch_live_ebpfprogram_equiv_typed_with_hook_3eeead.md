---
chapter_id: ch_live_ebpfprogram_equiv_typed_with_hook_3eeead
topic_id: 8
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_equiv_typed_with_hook', 'belief_interval_equiv_bel_and_pl', 'iso27001_annexa_subclass']
model: engine-refine
---

The governance of eBPF programs and their lifecycle metadata rests on a fact table that anchors each program instance to a unique identifier and a suite of classification attributes. A program is distinguished by an identifier such as HOOK-0001 or HOOK-0002, and its operational footprint is quantified through a size_bytes measure that ranges from 113,209,263 bytes for the smallest instance to 784,335,640 bytes for the largest, reflecting the substantial memory footprint that eBPF programs can occupy. Each program carries a version number—values of 9, 11, and 12 are observed—and is classified along two orthogonal dimensions: program_type and attaches_to_hook. These two foreign-key columns do not store free-text labels directly; instead, they reference dimension tables that normalize the classification space into structured category and misc (label) attributes.

**fact_ebpfprogram**

| id | program_type_key | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- | --- |
| HOOK-0001 | HOOK-0007 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0005 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0001 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0003 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0007 | HOOK-0006 | 167519051 | 1 |

**dim_program_type**

| id | program_type_label | program_type_category |
| --- | --- | --- |
| HOOK-0001 | Program Type Label 01 | Program Type Category 01 |
| HOOK-0002 | Program Type Label 02 | Program Type Category 02 |
| HOOK-0003 | Program Type Label 03 | Program Type Category 03 |
| HOOK-0004 | Program Type Label 04 | Program Type Category 04 |
| HOOK-0005 | Program Type Label 05 | Program Type Category 05 |
| HOOK-0006 | Program Type Label 06 | Program Type Category 06 |
| HOOK-0007 | Program Type Label 07 | Program Type Category 07 |
| HOOK-0008 | Program Type Label 08 | Program Type Category 08 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

The dimension tables for program type and attaches to hook each expose an identifier, a misc column that holds human-readable labels, and a category column that groups those labels into broader taxonomies. A program type might carry the label Program Type Label 01 under the umbrella of Program Type Category 01, while an attaches_to_hook entry could present Attaches To Hook Label 03 within Attaches To Hook Category 03. This separation of identifier, misc, and category into dedicated dimension tables ensures that the fact table remains lean and that classification changes propagate without denormalization. The foreign-key relationships are explicit: the program_type_key in the fact table points to the identifier in the program type dimension, and the attaches_to_hook_key points to the identifier in the attaches_to_hook dimension, creating a clean star-schema topology that supports both analytical rollups and referential integrity checks.

Beyond program classification, the data model captures belief intervals—structured representations of uncertainty—through a set of tables that separate attribute definitions from their typed values. The belief interval entity is identified by a BEL- prefixed identifier, such as BEL-0001 or BEL-0002, and carries a belief value drawn from a controlled vocabulary including signal_attenuation, thermal_runaway, latency_spike, and sensor_drift. Each belief is bounded by a belief_lower_bound that references an ISO standard subclass (for example, ANNE-0004 or ANNE-0002) and a plausibility_upper_bound that takes values like ground_truth_marker, non_contradictory_set, direct_observation_7, or secondary_sensor_read. The attribute schema that governs these belief intervals is itself modeled: an attr column identifies the attribute (confidence, dimension_kind, method, recorded_at), while an attr_type column specifies its data type using XML Schema datatypes such as xsd:decimal, xsd:string, and xsd:dateTime.

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | ANNE-0005 | ground_truth_marker |
| BEL-0002 | thermal_runaway | ANNE-0004 | non_contradictory_set |
| BEL-0003 | latency_spike | ANNE-0002 | direct_observation_7 |
| BEL-0004 | sensor_drift | ANNE-0001 | secondary_sensor_read |
| BEL-0005 | thermal_runaway | ANNE-0001 | ground_truth_marker |
| BEL-0006 | calibration_failure | ANNE-0001 | extended_telemetry |
| BEL-0007 | data_corruption | ANNE-0006 | secondary_sensor_read |
| BEL-0008 | packet_loss | ANNE-0006 | tentative_marker |

**t_belief_interval_equiv_bel_and_pl_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BEL-0001 | confidence | xsd:decimal |
| BEL-0002 | dimension_kind | xsd:string |
| BEL-0003 | method | xsd:string |
| BEL-0004 | recorded_at | xsd:dateTime |
| BEL-0005 | uncertainty | xsd:decimal |
| BEL-0006 | unit | xsd:string |
| BEL-0007 | value | xsd:decimal |
| BEL-0008 | encoding | xsd:string |

**t_belief_interval_equiv_bel_and_pl_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0004 | 2025-01-05T17:59:26 |
| BEL-0002 | BEL-0002 | BEL-0004 | 2024-10-14T22:53:55 |
| BEL-0003 | BEL-0003 | BEL-0004 | 2023-07-18T12:12:54 |
| BEL-0004 | BEL-0004 | BEL-0004 | 2023-03-22T01:52:23 |
| BEL-0005 | BEL-0005 | BEL-0004 | 2025-03-12T03:35:20 |
| BEL-0006 | BEL-0006 | BEL-0004 | 2025-06-14T01:50:46 |
| BEL-0007 | BEL-0007 | BEL-0004 | 2023-03-18T15:47:07 |
| BEL-0008 | BEL-0008 | BEL-0004 | 2023-02-26T17:53:54 |

**t_belief_interval_equiv_bel_and_pl_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0001 | 0.034 |
| BEL-0002 | BEL-0001 | BEL-0005 | 388.43 |
| BEL-0003 | BEL-0001 | BEL-0007 | 756.27 |
| BEL-0004 | BEL-0002 | BEL-0001 | 0.503 |
| BEL-0005 | BEL-0002 | BEL-0005 | 930.65 |
| BEL-0006 | BEL-0002 | BEL-0007 | 513.67 |
| BEL-0007 | BEL-0003 | BEL-0001 | 0.478 |
| BEL-0008 | BEL-0003 | BEL-0005 | 619.21 |

The typed values for belief interval attributes are stored in three separate value tables—decimal, varchar, and datetime—each linking back to the belief entity through an entity_id foreign key and to the attribute definition through an attr_id foreign key. A decimal value such as 0.034 or 388.43 might be associated with BEL-0001 and BEL-0002 respectively, while a varchar value like Dimension Kind 01 or intake form attaches to the same entity through different attribute references. Timestamps are captured in the datetime table, where recorded_at values such as 2025-01-05T17:59:26 or 2023-03-22T01:52:23 provide temporal provenance for the belief records. This value-type partitioning avoids null proliferation and enforces type safety at the storage layer, a design choice that mirrors the separation of misc labels from category groupings in the program classification dimensions.

**t_belief_interval_equiv_bel_and_pl_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0002 | Dimension Kind 01 |
| BEL-0002 | BEL-0001 | BEL-0008 | Encoding 02 |
| BEL-0003 | BEL-0001 | BEL-0009 | intake form |
| BEL-0004 | BEL-0001 | BEL-0010 | es |
| BEL-0005 | BEL-0001 | BEL-0003 | hybrid |
| BEL-0006 | BEL-0001 | BEL-0006 | deg_C |
| BEL-0007 | BEL-0002 | BEL-0002 | Dimension Kind 07 |
| BEL-0008 | BEL-0002 | BEL-0008 | Encoding 08 |

The ISO 27001 annex mapping layer introduces a subject-target-role triad that governs how standards and controls relate to one another. The t_iso27001_annexa_subclass table enumerates standards such as ISO/IEC 27001, ISO/IEC 27701, and ISO 20000-1, each identified by an ANNE- prefixed key. The t_iso27001_annexa_subclass_iso27001_annex_a table maps these standards to specific Annex A controls—A.5.22 Cloud security, A.5.7 Threat intelligence, A.6.3 Remote working, A.8.12 Data masking—using a junction table that carries three columns: subject (the standard identifier, e.g., ANNE-0003), target (the Annex A control identifier, e.g., ANNE-0001), and role (observer, reviewer, or owner). This role attribute is the linchpin of the mapping, encoding the nature of the relationship between a standard and a control in a way that supports governance workflows and audit trail generation. The same subject-target-role pattern recurs across the belief interval value tables, where entity and attr columns serve as the foreign keys that bind typed values to their conceptual definitions, ensuring that every data point carries both its semantic context and its type constraint.

**t_iso27001_annexa_subclass**

| id | iso |
| --- | --- |
| ANNE-0001 | ISO/IEC 27001 |
| ANNE-0002 | ISO/IEC 27001 |
| ANNE-0003 | ISO/IEC 27701 |
| ANNE-0004 | ISO 20000-1 |
| ANNE-0005 | ISO/IEC 27701 |
| ANNE-0006 | ISO 20000-1 |

**t_iso27001_annexa_subclass_iso27001_annex_a**

| id | iso27001_annex_a |
| --- | --- |
| ANNE-0001 | A.5.22 Cloud security |
| ANNE-0002 | A.5.7 Threat intelligence |
| ANNE-0003 | A.6.3 Remote working |
| ANNE-0004 | A.8.12 Data masking |
| ANNE-0005 | A.7.4 Physical security monitoring |
| ANNE-0006 | A.5.30 Incident response |
| ANNE-0007 | A.8.22 Data leakage prevention |

**t_iso27001_annexa_subclass__iso27001_annex_a**

| id | iso_id | iso27001_annex_a_id | role |
| --- | --- | --- | --- |
| ANNE-0001 | ANNE-0003 | ANNE-0001 | observer |
| ANNE-0002 | ANNE-0001 | ANNE-0004 | reviewer |
| ANNE-0003 | ANNE-0002 | ANNE-0007 | owner |
| ANNE-0004 | ANNE-0001 | ANNE-0003 | observer |
| ANNE-0005 | ANNE-0003 | ANNE-0007 | observer |
| ANNE-0006 | ANNE-0004 | ANNE-0005 | contributor |
| ANNE-0007 | ANNE-0003 | ANNE-0001 | reviewer |
| ANNE-0008 | ANNE-0006 | ANNE-0006 | reviewer |