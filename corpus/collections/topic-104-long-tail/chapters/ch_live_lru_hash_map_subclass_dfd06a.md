---
chapter_id: ch_live_lru_hash_map_subclass_dfd06a
topic_id: 104
family: 07_long_tail
cited_terms: ['lru_hash_map_subclass', 'schemaorg_org_legalname', 'directive_traces_to_requirement']
model: engine-refine
---

In enterprise data architectures, the identifier serves as the immutable anchor for every entity, a concept instantiated across heterogeneous domains through conventionally structured codes such as MAP-0001 for the primary-db-cache LRU hash map subclass, LEGA-0001 for NexusLabs as a Schema.org organization, and REQU-0001 for the ISO 27001:2022 directive. These identifiers are not merely labels; they are the referential substrate that permits cross-table joins, enforces entity identity across distributed schemas, and provides the stable key against which all attribute values and relationship links are resolved. The identifier space is partitioned by domain prefix—MAP for cache subsystems, LEGA for legal entity registrations, REQU for compliance requirements—yet the underlying mechanism is uniform: a unique string that binds together the entity's definition, its attributes, its values, and its relationships into a single coherent record.

**t_lru_hash_map_subclass**

| id | lru |
| --- | --- |
| MAP-0001 | primary-db-cache |
| MAP-0002 | stream-event-cache |
| MAP-0003 | global-rate-limiter |
| MAP-0004 | prod-session-cache |
| MAP-0005 | primary-db-cache |
| MAP-0006 | stream-event-cache |
| MAP-0007 | prod-session-cache |

**t_lru_hash_map_subclass_l_r_u_hash_config**

| id | l_r_u_hash_config |
| --- | --- |
| MAP-0001 | siphash-2-4 |
| MAP-0002 | xxhash64 |
| MAP-0003 | robin-hood |
| MAP-0004 | sparse-block-map |
| MAP-0005 | murmur3-128 |
| MAP-0006 | murmur3-128 |

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001:2022 |
| REQU-0002 | PCI DSS v4.0 |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | HIPAA Privacy Rule |

Attributes and their types form the second structural layer, defining what properties an entity can possess and constraining the shape of permissible values. The attribute definition table `t_directive_traces_to_requirement_attr` declares that the attribute named `effective_date` carries the type `xsd:date`, that `enforcement` is an `xsd:string`, that `mandatory` is an `xsd:boolean`, and that `priority` is an `xsd:integer`. This separation of attribute metadata from attribute values is critical: it permits the schema to evolve independently of the data, allows type-safe validation at ingestion time, and ensures that the same attribute—say, `mandatory` with type `xsd:boolean`—can be evaluated consistently across every entity to which it applies. The attribute type is not a suggestion; it is a contract that governs how values are stored, compared, and queried.

**t_directive_traces_to_requirement_attr**

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

Attribute values themselves are materialized in a family of type-specialized value tables, each holding the `misc` column that stores the actual data. The boolean value table `t_directive_traces_to_requirement_val_boolean` records that entity REQU-0001 has a `false` value for attribute REQU-0003 (mandatory), while entity REQU-0003 carries `true` for the same attribute. The date value table `t_directive_traces_to_requirement_val_date` anchors the effective date of REQU-0001 to 2023-08-06 and that of REQU-0003 to 2025-05-18. The integer value table `t_directive_traces_to_requirement_val_int` assigns a priority of 4 to entity REQU-0001 and a priority of 132 to entity REQU-0002, while the varchar value table `t_directive_traces_to_requirement_val_varchar` stores free-form values such as "Encoding 01" and "nightly summary" for string attributes. Each value row carries an `entity_id` that identifies the subject entity, an `attr_id` that identifies the attribute being valued, and the `value` itself—a typed misc cell that completes the entity–attribute–value triple.

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

**t_directive_traces_to_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 4 |
| REQU-0002 | REQU-0001 | REQU-0005 | 132 |
| REQU-0003 | REQU-0002 | REQU-0004 | 4 |
| REQU-0004 | REQU-0002 | REQU-0005 | 453 |
| REQU-0005 | REQU-0003 | REQU-0004 | 4 |
| REQU-0006 | REQU-0003 | REQU-0005 | 497 |
| REQU-0007 | REQU-0004 | REQU-0004 | 4 |
| REQU-0008 | REQU-0004 | REQU-0005 | 899 |

**t_directive_traces_to_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | nightly summary |
| REQU-0004 | REQU-0001 | REQU-0009 | ja |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | change rationale |

Relationships between entities are expressed through association tables that decompose a many-to-many link into three explicit columns: subject, target, and role. In the LRU hash map subsystem, the junction table `t_lru_hash_map_subclass__l_r_u_hash_config` records that the LRU subclass identified by MAP-0007 (subject) is linked to the hash configuration MAP-0004 (target) under the role of reviewer, while MAP-0003 (subject) connects to MAP-0002 (target) under the role of observer. The role column is not decorative; it semantically qualifies the direction and nature of the relationship, distinguishing a contributor from a reviewer from an observer within the same structural pattern. The same decomposition appears in the legal entity domain, where `t_schemaorg_org_legalname__legal_name` links the Schema.org organization LEGA-0002 (subject) to the legal name LEGA-0005 (target) under the role of reviewer, and LEGA-0004 (subject) to LEGA-0007 (target) under the role of observer.

**t_lru_hash_map_subclass__l_r_u_hash_config**

| id | lru_id | l_r_u_hash_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0007 | MAP-0004 | reviewer |
| MAP-0002 | MAP-0004 | MAP-0002 | contributor |
| MAP-0003 | MAP-0003 | MAP-0002 | observer |
| MAP-0004 | MAP-0005 | MAP-0004 | reviewer |
| MAP-0005 | MAP-0004 | MAP-0005 | owner |
| MAP-0006 | MAP-0001 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0005 | reviewer |
| MAP-0008 | MAP-0007 | MAP-0002 | observer |

**t_schemaorg_org_legalname**

| id | schemaorg |
| --- | --- |
| LEGA-0001 | NexusLabs |
| LEGA-0002 | BioSynth |
| LEGA-0003 | GlobalDataInc |
| LEGA-0004 | AeroSpaceX |
| LEGA-0005 | QuantumEdge |
| LEGA-0006 | AcmeCorp |
| LEGA-0007 | GlobalDataInc |

**t_schemaorg_org_legalname_legal_name**

| id | legal_name |
| --- | --- |
| LEGA-0001 | TerraForma Holdings Ltd. |
| LEGA-0002 | CloudNative Solutions LLC |
| LEGA-0003 | Global Data Systems LLC |
| LEGA-0004 | Acme Corporation |
| LEGA-0005 | CloudNative Solutions LLC |
| LEGA-0006 | DataBridge Analytics Corp. |
| LEGA-0007 | TerraForma Holdings Ltd. |
| LEGA-0008 | Nexus Laboratories Inc. |

**t_schemaorg_org_legalname__legal_name**

| id | schemaorg_id | legal_name_id | role |
| --- | --- | --- | --- |
| LEGA-0001 | LEGA-0002 | LEGA-0005 | reviewer |
| LEGA-0002 | LEGA-0004 | LEGA-0007 | observer |
| LEGA-0003 | LEGA-0004 | LEGA-0004 | reviewer |
| LEGA-0004 | LEGA-0006 | LEGA-0008 | contributor |
| LEGA-0005 | LEGA-0003 | LEGA-0001 | reviewer |
| LEGA-0006 | LEGA-0007 | LEGA-0007 | reviewer |
| LEGA-0007 | LEGA-0005 | LEGA-0006 | owner |
| LEGA-0008 | LEGA-0003 | LEGA-0001 | contributor |

The entity column in the value tables and the subject column in the association tables are functionally equivalent: both identify the entity that is the active party in a relationship or valuation. The target column in association tables identifies the entity that is the passive party—the legal name being assigned, the hash configuration being reviewed. This subject–target–role triad is the relational primitive that replaces monolithic foreign-key constraints with an explicit, queryable, and semantically rich relationship model. It permits a single entity to participate in multiple relationships of different roles with the same or different targets, and it permits a single target to be referenced by multiple subjects under different roles—all without schema modification. The identifier, the attribute, the type, the value, the subject, the target, and the role together constitute a complete relational ontology: a vocabulary for describing what entities exist, what properties they have, what values those properties take, and how entities relate to one another.