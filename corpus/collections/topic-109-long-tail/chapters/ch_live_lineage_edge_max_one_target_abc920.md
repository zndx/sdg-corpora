---
chapter_id: ch_live_lineage_edge_max_one_target_abc920
topic_id: 109
family: 05_provo_lineage
cited_terms: ['lineage_edge_max_one_target', 'radicalization_process', 'mass_function_with_normalization']
model: engine-refine
---

Data lineage and target attribution form the backbone of traceable analytical pipelines, where each processing step is anchored to a unique identifier such as TARG-0001 or TARG-0003 and classified under a lineage descriptor like Sensor calibration chain, Feature store refresh, or the broader Sensor calibration chain that recurs across multiple edges. These identifiers serve as the primary keys through which lineage edges are resolved, and each edge maps to a downstream target — Compliance audit log, Risk scoring model, Feature vector store, Executive dashboard — establishing a directed graph of data flow. The junction between lineage and target is mediated by a role attribute that distinguishes contributor from owner, thereby encoding not merely the structural connectivity of the pipeline but the governance semantics: TARG-0001 flows into TARG-0001 with contributor role, while TARG-0003 assumes owner over TARG-0005 and simultaneously contributes to TARG-0006, reflecting the dual capacity of a single lineage node to both consume and produce downstream artifacts.

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | Sensor calibration chain |
| TARG-0003 | Feature store refresh |
| TARG-0004 | Sensor calibration chain |
| TARG-0005 | Feature store refresh |
| TARG-0006 | Model training pipeline |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |

Parallel to this lineage topology, the radicalization process registry captures organizational dynamics through a structured pairing of process phase and participating entity. Each process identifier — PROC-0001 through PROC-0004 — is associated with a radicalization process label such as Militia Formation Phase, Network Recruit Wave, or Radicalization Vector Delta, and is linked to an affiliated organization like Sympathizer Network Alpha, Al-Shabaab Recruitment Cell, or Regional Coordination Cell. The same participant, Sympathizer Network Alpha, appears across multiple process entries (PROC-0001 and PROC-0004), indicating that organizational entities are not monolithically bound to a single phase but participate in a multiplicity of process stages, a design that supports the analysis of cross-phase organizational involvement and the mapping of influence pathways.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

The mass function with normalization construct provides a typed attribute-value framework for quantifying and normalizing analytical outputs. Each mass function record carries a mass identifier — Rotor-Assembly-M, Batch-7721, Core-Segment-12, Dust-Collection-1 — and a normalization constant such as Offset-0.02 or 0.982-scaling that calibrates the raw mass value. The attribute schema is extensible: confidence is stored as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime, with each attribute type governing the validation and storage semantics of its corresponding values. This type discipline ensures that temporal metadata like 2024-12-04T17:58:43 or 2023-02-03T12:29:30 is preserved with precision, while numeric attributes such as 0.715, 279.33, and 243.08 are stored with decimal fidelity, and categorical descriptors like Dimension Kind 01, Encoding 02, nightly summary, and ja are retained as free-form strings.

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | Offset-0.02 |
| NORM-0002 | Batch-7721 | 0.982-scaling |
| NORM-0003 | Core-Segment-12 | 0.982-scaling |
| NORM-0004 | Dust-Collection-1 | Offset-0.02 |
| NORM-0005 | Powder-Grade-B | Baseline-0.75 |
| NORM-0006 | Rotor-Assembly-M | 0.982-scaling |

**t_mass_function_with_normalization_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| NORM-0001 | confidence | xsd:decimal |
| NORM-0002 | dimension_kind | xsd:string |
| NORM-0003 | method | xsd:string |
| NORM-0004 | recorded_at | xsd:dateTime |
| NORM-0005 | uncertainty | xsd:decimal |
| NORM-0006 | unit | xsd:string |
| NORM-0007 | value | xsd:decimal |
| NORM-0008 | encoding | xsd:string |

**t_mass_function_with_normalization_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0004 | 2024-12-04T17:58:43 |
| NORM-0002 | NORM-0002 | NORM-0004 | 2023-02-03T12:29:30 |
| NORM-0003 | NORM-0003 | NORM-0004 | 2024-03-08T15:41:30 |
| NORM-0004 | NORM-0004 | NORM-0004 | 2023-01-16T04:53:31 |
| NORM-0005 | NORM-0005 | NORM-0004 | 2023-05-04T19:41:54 |
| NORM-0006 | NORM-0006 | NORM-0004 | 2025-01-09T01:34:48 |

**t_mass_function_with_normalization_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0001 | 0.715 |
| NORM-0002 | NORM-0001 | NORM-0005 | 279.33 |
| NORM-0003 | NORM-0001 | NORM-0007 | 243.08 |
| NORM-0004 | NORM-0002 | NORM-0001 | 0.608 |
| NORM-0005 | NORM-0002 | NORM-0005 | 643.66 |
| NORM-0006 | NORM-0002 | NORM-0007 | 319.15 |
| NORM-0007 | NORM-0003 | NORM-0001 | 0.596 |
| NORM-0008 | NORM-0003 | NORM-0005 | 676.31 |

The entity-attribute-value decomposition within the mass function system allows a single entity — for instance, NORM-0001 — to carry multiple heterogeneous attributes simultaneously: a confidence score of 0.715, a dimension_kind of Dimension Kind 01, a method recorded as Encoding 02, a timestamp of 2024-12-04T17:58:43, and a misc value of nightly summary or ja, each resolved through its own attr_id foreign key. This EAV pattern, combined with the type registry in the attribute definition table, supports a schema-on-read approach where the structure of analytical metadata is defined at query time rather than at ingestion, enabling the system to accommodate evolving attribute schemas without migration. The normalization_constant column then applies a post-hoc calibration — whether an additive offset or a multiplicative scaling factor — to ensure that mass values remain comparable across different measurement contexts, a requirement that is critical when aggregating evidence from disparate sources such as Rotor-Assembly-M and Dust-Collection-1 into a unified analytical view.

**t_mass_function_with_normalization_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0002 | Dimension Kind 01 |
| NORM-0002 | NORM-0001 | NORM-0008 | Encoding 02 |
| NORM-0003 | NORM-0001 | NORM-0009 | nightly summary |
| NORM-0004 | NORM-0001 | NORM-0010 | ja |
| NORM-0005 | NORM-0001 | NORM-0003 | manual |
| NORM-0006 | NORM-0001 | NORM-0006 | count |
| NORM-0007 | NORM-0002 | NORM-0002 | Dimension Kind 07 |
| NORM-0008 | NORM-0002 | NORM-0008 | Encoding 08 |