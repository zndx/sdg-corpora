---
chapter_id: ch_live_functional_dependency_lhs_b26bc9
topic_id: 139
family: 07_long_tail
cited_terms: ['functional_dependency_lhs', 'functional_dependency_rhs', 'ganglion_cyst_imaging_finding']
model: engine-refine
---

Functional dependency analysis in structured data environments relies on a clear separation between left-hand side determinants and right-hand side outcomes, each tracked through dedicated dimension and fact structures. The left-hand side is catalogued in a dimension table where each entry carries a stable identifier such as LHS-0001 through LHS-0004, a human-readable label like F D Left Hand Side Label 01, and a categorical classification such as F D Left Hand Side Category 01. These categorical groupings enable analysts to aggregate and filter functional relationships by domain, while the identifiers serve as the primary keys that anchor downstream fact records. The corresponding fact table records each observed functional dependency instance by referencing the left-hand side dimension, and attaches a confidence score alongside an uncertainty measure and a numeric value. Confidence values range from 0.117 to 0.950 across the observed instances, with the highest confidence record (LHS-0004) also carrying an uncertainty of 187.13 and a value of 896.76, illustrating how confidence and uncertainty are tracked as complementary metrics rather than simple inverses.

**fact_functional**

| id | f_d_left_hand_side_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| LHS-0001 | LHS-0006 | 0.516 | 249.67 | 163.64 |
| LHS-0002 | LHS-0002 | 0.130 | 197.20 | 234.79 |
| LHS-0003 | LHS-0006 | 0.117 | 994.01 | 139.46 |
| LHS-0004 | LHS-0001 | 0.950 | 187.13 | 896.76 |
| LHS-0005 | LHS-0003 | 0.902 | 938.45 | 27.14 |
| LHS-0006 | LHS-0002 | 0.388 | 256.27 | 476.93 |
| LHS-0007 | LHS-0001 | 0.665 | 479.74 | 169.53 |

**dim_f_d_left_hand_side**

| id | f_d_left_hand_side_label | f_d_left_hand_side_category |
| --- | --- | --- |
| LHS-0001 | F D Left Hand Side Label 01 | F D Left Hand Side Category 01 |
| LHS-0002 | F D Left Hand Side Label 02 | F D Left Hand Side Category 02 |
| LHS-0003 | F D Left Hand Side Label 03 | F D Left Hand Side Category 03 |
| LHS-0004 | F D Left Hand Side Label 04 | F D Left Hand Side Category 04 |
| LHS-0005 | F D Left Hand Side Label 05 | F D Left Hand Side Category 05 |
| LHS-0006 | F D Left Hand Side Label 06 | F D Left Hand Side Category 06 |

**t_functional_dependency_rhs**

| id | functional |
| --- | --- |
| RHS-0001 | data ingestion pipeline |
| RHS-0002 | encryption transformation |
| RHS-0003 | telemetry aggregation service |
| RHS-0004 | access control evaluator |
| RHS-0005 | telemetry aggregation service |
| RHS-0006 | schema validation routine |

**t_functional_dependency_rhs_f_d_right_hand_side**

| id | f_d_right_hand_side |
| --- | --- |
| RHS-0001 | aggregated event count |
| RHS-0002 | sanitized email address |
| RHS-0003 | partition key value |
| RHS-0004 | enriched sensor reading |
| RHS-0005 | derived priority level |
| RHS-0006 | computed latency metric |
| RHS-0007 | computed latency metric |

The right-hand side of functional dependencies is modelled through a parallel structure that captures both the functional context and the resulting values. A functional descriptor table assigns descriptive labels to each dependency context, with entries such as data ingestion pipeline, encryption transformation, telemetry aggregation service, and access control evaluator. The actual right-hand side values—aggregated event count, sanitized email address, partition key value, and enriched sensor reading—are stored in a separate dimension table, each identified by an RHS-prefixed key. The linkage between functional contexts and their right-hand side values is mediated by a junction table that records which functional context produces which output value, and assigns a role to each relationship. Roles such as contributor and owner distinguish between values that feed into a functional outcome and those that constitute the primary output, enabling governance frameworks to trace data lineage and assign accountability for each transformation step.

In medical imaging contexts, the same structural principles apply to the documentation and classification of diagnostic findings. A dedicated table captures ganglion cyst imaging observations, recording the anatomical location such as Dorsal right ankle, Left medial malleolus, Bilateral distal radius, and Right dorsal metatarsal. Each finding is associated with the magnetic resonance imaging modality used to visualize it, with examples including MIP reconstruction, Sagittal PD FS, Gadolinium enhanced T1, and T2 weighted fat sat. These modalities represent distinct acquisition and processing techniques, each suited to particular diagnostic questions. The findings table also records the encoding format—ascii, latin1, or unicode—and the language of the record, with Japanese (ja) and English (en) appearing across the dataset. This combination of encoding and language metadata ensures that imaging reports remain interoperable across systems and regions, preserving both the technical integrity and the semantic meaning of clinical documentation.

**t_ganglion_cyst_imaging_finding**

| id | ganglion_cyst_imaging_finding | visualizes | encoding | language |
| --- | --- | --- | --- | --- |
| FIND-0001 | Dorsal right ankle | MIP reconstruction | ascii | ja |
| FIND-0002 | Left medial malleolus | Sagittal PD FS | ascii | ja |
| FIND-0003 | Bilateral distal radius | Gadolinium enhanced T1 | latin1 | en |
| FIND-0004 | Right dorsal metatarsal | T2 weighted fat sat | unicode | ja |
| FIND-0005 | Palmar left thumb | Sagittal PD FS | unicode | de |
| FIND-0006 | Left scapholunate ligament | STIR sequence | unicode | en |
| FIND-0007 | Palmar left thumb | PD weighted fat sat | unicode | en |

The identifier scheme across all tables follows a consistent pattern that supports referential integrity and traceability. Left-hand side dimension entries use LHS-prefixed identifiers, right-hand side entries use RHS-prefixed identifiers, and imaging findings use FIND-prefixed identifiers. These identifiers serve as the primary keys within their respective tables and as foreign keys in the fact and junction tables that relate them. The confidence metric in the functional dependency fact table, the role assignments in the junction table, and the encoding and language fields in the imaging findings table all represent attributes that enrich the core relational structure without altering its topology. Together, these elements form a data model that supports both analytical queries—such as identifying which functional dependencies have the highest confidence—and operational governance tasks, such as determining which team owns a particular right-hand side value or which imaging modality was used for a specific anatomical finding.

**t_functional_dependency_rhs__f_d_right_hand_side**

| id | functional_id | f_d_right_hand_side_id | role |
| --- | --- | --- | --- |
| RHS-0001 | RHS-0003 | RHS-0007 | contributor |
| RHS-0002 | RHS-0004 | RHS-0001 | owner |
| RHS-0003 | RHS-0002 | RHS-0005 | owner |
| RHS-0004 | RHS-0003 | RHS-0006 | owner |
| RHS-0005 | RHS-0003 | RHS-0001 | owner |
| RHS-0006 | RHS-0001 | RHS-0005 | owner |
| RHS-0007 | RHS-0001 | RHS-0006 | contributor |
| RHS-0008 | RHS-0002 | RHS-0001 | contributor |