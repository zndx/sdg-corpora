---
chapter_id: ch_live_ebpfmap_with_value_type_a142b2
topic_id: 83
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_value_type', 'dempster_conflict_mass', 'training_partnership_development']
model: engine-refine
---

Evidence classification within the data governance framework rests upon a dual-axis structure: categorical taxonomy and versioned instantiation. The value type map dimension assigns each record a category and a human-readable label, anchoring entries such as Value Type Map Category 01 through Value Type Map Category 04 to their corresponding identifiers TYPE-0001 through TYPE-0004. These identifiers serve as the immutable primary keys that propagate through the fact layer, where each type map key is paired with a size in bytes and a version number. The size metric carries operational significance—TYPE-0004 registers 354,373,995 bytes, nearly eleven times the footprint of TYPE-0003 at 31,105,012 bytes—while version numbers (3, 6, 12, 5) signal the maturity or revision state of each mapping, enabling auditors to trace lineage and confirm that downstream consumers reference the correct iteration.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

The Dempster-Shafer evidence layer introduces a second classification schema centered on conflict mass, confidence, and uncertainty. Conflict mass records are themselves categorized and labeled through a dedicated dimension table, with entries such as Conflict Mass Category 01 and Conflict Mass Label 01 providing the semantic context for the numerical facts. Each fact row carries a conflict mass key—MASS-0003, MASS-0002, MASS-0005, MASS-0001—that references this dimension, while the confidence and uncertainty fields quantify the reliability and dispersion of the underlying assessment. Confidence values span a wide dynamic range: 0.728 for MASS-0004 indicates a high degree of evidentiary support, whereas 0.014 for MASS-0002 reflects near-negligible conviction. Uncertainty, measured on a substantially larger scale, ranges from 9.49 to 687.80, with MASS-0003 exhibiting the greatest indeterminacy. The associated value field—520.46, 137.18, 197.61, 846.10—represents the aggregated evidence magnitude, which must be interpreted in conjunction with both the confidence and uncertainty dimensions to assess whether a finding warrants regulatory action or further investigation.

Training partnership development records operate under a parallel but distinct classification model. Each partnership record is identified by a DEVE-prefixed identifier—DEVE-0001 through DEVE-0004—and carries a descriptive program name such as Advanced Analytics Cohort, Machine Learning Track, Biostatistics Collaboration, and Engineering Mentorship Program. The participating entity, recorded under the educational institution column, may be an organizational unit or an individual practitioner: Clinical Preceptor Team, Elena Rostova, Research Associate Kim, and Industry Liaison Office. This column functions as a foreign key into the institutional participant registry, ensuring that every partnership engagement can be traced to a verifiable stakeholder. The misc column, present across multiple tables, provides supplementary metadata—label strings and category designations—that do not participate in referential integrity but support reporting, filtering, and human-readable output.

**t_training_partnership_development**

| id | training_partnership_development | has_participant |
| --- | --- | --- |
| DEVE-0001 | Advanced Analytics Cohort | Clinical Preceptor Team |
| DEVE-0002 | Machine Learning Track | Elena Rostova |
| DEVE-0003 | Biostatistics Collaboration | Research Associate Kim |
| DEVE-0004 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0005 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0006 | Data Governance Workshop | Research Associate Kim |
| DEVE-0007 | Research Methods Alliance | Elena Rostova |
| DEVE-0008 | Machine Learning Track | Elena Rostova |

Together, these structures form a layered evidentiary architecture. Identifiers provide the join keys that bind dimension tables to their corresponding fact tables; categories and labels supply the semantic taxonomy required for compliance reporting; version and size metrics enable capacity planning and change management for the type map layer; and the Dempster-Shafer fields (confidence, uncertainty, conflict mass) quantify the strength and reliability of each evidence assessment. An auditor reviewing a record such as TYPE-0002 would confirm its category assignment (Value Type Map Category 02), verify its version (6), inspect its storage footprint (156,714,508 bytes), and then cross-reference the associated conflict mass and confidence values to determine whether the evidence meets the threshold for operational deployment.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |