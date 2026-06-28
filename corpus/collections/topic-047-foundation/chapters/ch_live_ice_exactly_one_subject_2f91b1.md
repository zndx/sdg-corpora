---
chapter_id: ch_live_ice_exactly_one_subject_2f91b1
topic_id: 47
family: 01_foundation
cited_terms: ['ice_exactly_one_subject', 'column_tag_from_annotator', 'dempster_conflict_mass']
model: engine-refine
---

Every auditable data lineage begins with a stable identifier that anchors a record to its source and operational purpose. Within the governance framework, identifiers such as SUBJ-0001 or ANNO-0001 function as immutable handles, ensuring that downstream processes can unambiguously resolve provenance without ambiguity. These identifiers are not merely cataloguing labels; they serve as relational anchors that bind heterogeneous observations into coherent entities. An entity, for instance, may aggregate multiple attribute definitions—encoding, label_text, language—each representing a distinct dimension of metadata that must be tracked independently. By decoupling the attribute name from its runtime value, the system preserves structural stability while allowing individual records to carry only the properties they actually require, thereby eliminating schema bloat across heterogeneous pipelines.

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | Measurement Timeframe |
| SUBJ-0002 | Provenance Graph Export | Message Type Definition |
| SUBJ-0003 | Raw Observation Feed | Quality Check Script |
| SUBJ-0004 | Provenance Graph Export | Primary Data Source |
| SUBJ-0005 | Schema Registry Entry | Primary Data Source |
| SUBJ-0006 | Audit Trail Report | Primary Data Source |
| SUBJ-0007 | Schema Registry Entry | Field Survey Zone |
| SUBJ-0008 | Sensor Configuration File | Data Governance Board |

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | lab_technician |
| ANNO-0002 | compliance_flag | lab_technician |
| ANNO-0003 | api_version | auto_classifier |
| ANNO-0004 | api_version | compliance_officer |
| ANNO-0005 | compliance_flag | governance_board |
| ANNO-0006 | event_timestamp | ml_inference_engine |

The integrity of any attribute-driven registry depends on strict type enforcement, which is why each attribute carries an explicit attr type declaration. Values such as xsd:string, xsd:decimal, and xsd:dateTime are not optional metadata; they are contractual constraints that prevent type coercion errors during ingestion, transformation, and reporting. Once typed, the actual payload resides in a misc column, a deliberately generic container that holds heterogeneous values without compromising the underlying schema. A single entity might therefore store Encoding 01 as a string, capture a timestamp like 2025-01-07T23:20:10 as a dateTime, or record a language code such as fr, all while remaining compliant with the declared type contract. This separation of schema from instance data is what allows the framework to scale across disparate ingestion streams without requiring structural migrations or post-hoc normalization.

**t_column_tag_from_annotator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_column_tag_from_annotator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2025-01-07T23:20:10 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-03-06T18:58:36 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2024-05-08T12:18:31 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-05-11T14:25:42 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2023-11-26T14:31:09 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2024-05-18T09:15:26 |

**t_column_tag_from_annotator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.302 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 639.96 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 206.06 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.049 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 98.50 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 895.36 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.609 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 158.17 |

**t_column_tag_from_annotator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | nightly summary |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | en |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | hybrid |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | kg |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

When evidence streams converge, the system must quantify not only what is believed but where disagreement arises. This is managed through a category dimension that classifies conflict mass into discrete buckets, such as Conflict Mass Category 01 or Conflict Mass Category 03. Each category is linked to a conflict mass key that points to a labeled dimension, enabling auditors to trace which friction points are systemic versus transient. The conflict mass itself operates as a diagnostic metric: it measures the degree of incompatibility between overlapping belief assignments, flagging records that require manual review before fusion. By isolating conflict into a dedicated categorical layer, the framework ensures that high-friction data does not silently corrupt downstream analytics or compliance reports, preserving the epistemic boundary between verified signals and unresolved disputes.

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

Complementing the conflict dimension are two scalar measures that govern belief assignment: confidence and uncertainty. Confidence values, recorded as decimals such as 0.728 or 0.014, represent the degree of positive belief assigned to a proposition, while uncertainty captures the residual ignorance or unallocated mass, often reaching magnitudes like 687.80 or 392.06 in low-signal scenarios. Together, they form a closed belief system where the sum of confidence, uncertainty, and conflict mass accounts for the total evidence space. In practice, an annotator reviewing ingestion_latency might assign a confidence of 0.302 alongside an uncertainty of 9.49, signaling that the observation is plausible but heavily qualified. This tripartite quantification ensures that every data point carries its own epistemic weight, allowing downstream consumers to apply risk thresholds automatically rather than relying on binary pass/fail judgments.

The architecture ultimately functions as a provenance-aware belief registry, where structural rigidity and semantic flexibility coexist. Identifiers and entities provide the relational skeleton; attributes and their types enforce contractual compliance; categories and conflict mass isolate friction; and confidence paired with uncertainty quantifies epistemic certainty. When a record such as MASS-0001 is evaluated, the system does not merely store a value like 520.46—it stores the full context of its classification, its belief assignment, and its degree of disagreement with competing sources. This design eliminates the need for post-hoc data cleaning, because every observation arrives pre-qualified by its own metadata envelope. In regulated environments, where audit trails must survive scrutiny and data lineage must be reconstructible, such a framework transforms raw ingestion into governed, quantifiably reliable evidence.

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |