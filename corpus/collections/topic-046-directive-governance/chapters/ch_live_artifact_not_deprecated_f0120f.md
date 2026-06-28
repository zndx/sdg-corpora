---
chapter_id: ch_live_artifact_not_deprecated_f0120f
topic_id: 46
family: 07_long_tail
cited_terms: ['artifact_not_deprecated', 'intermediate_floor_assembly', 'column_pair_subject']
model: engine-refine
---

Artifact management in this framework rests on a dual-layer model that separates immutable identity from mutable metadata. The fact table anchors each artifact with a unique identifier such as DEPR-0001 through DEPR-0004, an artifact_key that may reference a canonical artifact across multiple fact rows, a size_bytes field capturing the payload footprint, and a version number tracking revisions. A single artifact_key can appear repeatedly with different sizes and versions—for instance, DEPR-0004 maps to a fact row of 996,080,316 bytes at version 5, while DEPR-0005 appears at both version 5 (42,978,804 bytes) and version 10 (597,369,362 bytes), illustrating how artifact_key serves as a stable reference point across evolving fact records. The companion dimension table enriches each identifier with an artifact_label, such as Artifact Label 01 through Artifact Label 04, and an artifact_category like Artifact Category 01 through Artifact Category 04, enabling classification and filtering without altering the underlying fact records.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |

Physical assembly tracking follows a parallel relational pattern, where each assembly record carries an identifier, a descriptive intermediatefloorassembly name, and a contains_component field that enumerates the lateralrestraintstrap elements within that assembly. Assemblies such as Gearbox Intermediate Shelf, Motor Mount Deck, Wing Spar Floor, and repeated instances of Motor Mount Deck are each associated with distinct lateral restraint components—Retaining Clip, Locking Clevis, Shear Pin Assembly, and Damping Mount—allowing auditors to trace which restraint hardware belongs to which structural assembly. The repetition of Motor Mount Deck across multiple identifiers signals that the same assembly type can be instantiated in different contexts, each with its own component complement.

**t_intermediate_floor_assembly**

| id | intermediate_floor_assembly | contains_component |
| --- | --- | --- |
| ASSE-0001 | Gearbox Intermediate Shelf | Retaining Clip |
| ASSE-0002 | Motor Mount Deck | Locking Clevis |
| ASSE-0003 | Wing Spar Floor | Shear Pin Assembly |
| ASSE-0004 | Motor Mount Deck | Damping Mount |

Structured attribute data is modeled through an entity-attribute-value (EAV) architecture that decouples attribute definitions from their runtime values. The subject table establishes column-to-subject mappings, pairing operational columns like log_level, batch_token, transaction_id, and timestamp_utc with their corresponding subject columns such as asset_tag, control_id, and record_id. These mappings are then enriched with attribute metadata: each attribute carries a name—confidence, dimension_kind, method, recorded_at—and a type annotation drawn from the XSD namespace, including xsd:decimal, xsd:string, and xsd:dateTime. This type discipline ensures that value storage is routed to the correct typed value table, preserving data integrity across heterogeneous attribute domains.

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | asset_tag |
| SUBJ-0002 | batch_token | asset_tag |
| SUBJ-0003 | transaction_id | control_id |
| SUBJ-0004 | timestamp_utc | record_id |
| SUBJ-0005 | patient_id | dataset_uid |
| SUBJ-0006 | transaction_id | dataset_uid |
| SUBJ-0007 | batch_token | record_id |

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

Value storage is partitioned by type into three dedicated tables, each keyed by a composite of entity and attribute identifiers. Decimal attributes such as confidence are stored in the decimal value table with entries like 0.167 and 866.89, while string attributes such as dimension_kind and method reside in the varchar value table with values including Dimension Kind 01, Encoding 02, audit excerpt, and ja. Datetime attributes like recorded_at are persisted in the datetime value table with ISO 8601 timestamps such as 2023-03-08T01:00:53 and 2025-01-28T08:00:28. The entity_id column in each value table references the subject entity, and the attr_id column resolves to the attribute definition, creating a tripartite join path from entity through attribute to typed value. This separation by type eliminates null columns and enforces schema validation at insert time, while the shared entity_id and attr_id keys maintain referential integrity across the three value tables.

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |