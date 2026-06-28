---
chapter_id: ch_live_requirement_basic_cb8be5
topic_id: 47
family: 03_directive_governance
cited_terms: ['requirement_basic', 'frame_refinement', 'subclass_to_information_content_entity']
model: engine-refine
---

Requirements, frames, and information content entities constitute the foundational objects of the governance model, each distinguished by a stable identifier that anchors all downstream references. A requirement such as `REQU-0001` carries the label "Privacy Constraint," while `REQU-0002` and `REQU-0003` both denote "Encryption Standard," illustrating that distinct identifiers may correspond to semantically equivalent policy statements. Frame refinements follow the same identification discipline: `REFI-0001` and `REFI-0004` both map to the frame "Regulatory Audit Trail," and `REFI-0002` references "Lab Sample Container Type." Information content entities, identified by prefixes such as `ENTI-0001`, carry domain-specific information descriptors—"schema_registry," "telemetry_stream," "compliance_audit," "data_catalog_entry"—that classify the nature of the content without conflating identity with description.

**t_requirement_basic**

| id | requirement |
| --- | --- |
| REQU-0001 | Privacy Constraint |
| REQU-0002 | Encryption Standard |
| REQU-0003 | Encryption Standard |
| REQU-0004 | Privacy Constraint |
| REQU-0005 | Latency Threshold |
| REQU-0006 | Performance SLA |
| REQU-0007 | Encryption Standard |
| REQU-0008 | Data Quality Check |

**t_requirement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_requirement_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 5 |
| REQU-0002 | REQU-0001 | REQU-0005 | 962 |
| REQU-0003 | REQU-0002 | REQU-0004 | 5 |
| REQU-0004 | REQU-0002 | REQU-0005 | 675 |
| REQU-0005 | REQU-0003 | REQU-0004 | 5 |
| REQU-0006 | REQU-0003 | REQU-0005 | 160 |
| REQU-0007 | REQU-0004 | REQU-0004 | 5 |
| REQU-0008 | REQU-0004 | REQU-0005 | 57 |

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | Regulatory Audit Trail |
| REFI-0002 | Lab Sample Container Type |
| REFI-0003 | Data Lake Partition Schema |
| REFI-0004 | Regulatory Audit Trail |
| REFI-0005 | Data Lake Partition Schema |
| REFI-0006 | ISO 9001 Quality Framework |

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

Attributes provide the dimensional structure through which these entities are characterized, and the attribute type system enforces type discipline at the schema level. The attribute registry defines properties such as `effective_date`, `enforcement`, `mandatory`, and `priority`, each bound to an XML Schema datatype: `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer` respectively. This separation of attribute definition from attribute value permits a single entity to carry heterogeneous properties without schema mutation. The boolean attribute `mandatory` (identified as `REQU-0003`) is evaluated against multiple entities, yielding `true` for `REQU-0001` and `false` for `REQU-0002`, `REQU-0003`, and `REQU-0004`, thereby encoding compliance posture as a typed predicate. Date attributes such as `effective_date` (identified as `REQU-0001`) anchor temporal validity to individual requirements, with values ranging from `2023-09-17` through `2025-06-11`, establishing a chronological ordering of policy applicability. Integer-valued attributes like `priority` (identified as `REQU-0004`) and an unnamed attribute (`REQU-0005`) carry magnitudes of `5`, `962`, and `675`, enabling ordinal comparison across requirements. Varchar attributes store free-form annotations—`"Encoding 01"`, `"Enforcement 02"`, `"calibration record"`—and language codes such as `"en"`, providing a flexible extension point for metadata that does not conform to the rigid type hierarchy.

**t_requirement_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | true |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | false |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | true |
| REQU-0006 | REQU-0006 | REQU-0003 | false |
| REQU-0007 | REQU-0007 | REQU-0003 | false |
| REQU-0008 | REQU-0008 | REQU-0003 | false |

**t_requirement_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2025-06-11 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2024-12-28 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2023-09-17 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2024-08-31 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-05-25 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-05-27 |
| REQU-0007 | REQU-0007 | REQU-0001 | 2023-07-24 |
| REQU-0008 | REQU-0008 | REQU-0001 | 2023-09-16 |

**t_requirement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | calibration record |
| REQU-0004 | REQU-0001 | REQU-0009 | en |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | calibration record |

The value tables implement a vertical partitioning strategy in which each attribute type is materialized in its own table, linked to the owning entity through a composite foreign key of `entity_id` and `attr_id`. This design ensures that a boolean value, a date value, an integer value, and a varchar value for the same entity are stored in separate tables yet remain joinable through the shared entity identifier. The `entity_id` column in each value table references the primary key of the corresponding entity table, while the `attr_id` column references the attribute definition, creating a bipartite mapping that decouples the attribute schema from the entity schema. The `id` column in each value table serves as a surrogate primary key for the value row itself, enabling stable references to individual attribute evaluations independent of the entity or attribute they describe.

Frame refinements introduce a relational layer in which one frame refines another, and the nature of that refinement is captured by a role predicate. The relationship table joins a `frame_id` (the subject of the refinement) to a `refines_frame_id` (the target being refined), with a `role` column specifying the refinement posture: `observer`, `owner`, `contributor`, or `reviewer`. For instance, the frame `REFI-0005` acts as an `observer` of `REFI-0004`, while `REFI-0006` assumes the role of `reviewer` over `REFI-0005`. The `refines_frame` column in the refinement table provides a denormalized label for the target frame—"Ground Station Uplink," "Sterile Container Variant," "IPv4 Header Format," "Ku Band Downlink"—allowing direct human-readable reference without requiring a join. This tripartite structure (subject, target, role) generalizes the refinement relationship beyond a simple binary link, enabling the same frame to participate in multiple refinement relationships with different roles.

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |

Information content entities carry a multilingual labeling layer that separates machine-readable identifiers from human-readable descriptions. The `label_text` column stores display strings such as "nightly summary," "pre-release note," "intake form," and "change rationale," while the `language` column records the locale of each label using ISO two-letter codes: `en`, `ja`, `es`. The same entity may carry multiple labels in different languages, supporting internationalization without duplicating the entity itself. The `information` column provides a machine-oriented classification—"schema_registry," "telemetry_stream," "compliance_audit," "data_catalog_entry"—that complements the human-facing label by encoding the content type in a controlled vocabulary. This separation of identifier, classification, label, and language creates a four-tier addressing scheme that supports both programmatic resolution and multilingual presentation.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |