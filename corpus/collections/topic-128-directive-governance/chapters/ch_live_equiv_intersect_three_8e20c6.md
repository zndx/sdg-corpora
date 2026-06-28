---
chapter_id: ch_live_equiv_intersect_three_8e20c6
topic_id: 128
family: 01_foundation
cited_terms: ['equiv_intersect_three', 'artifact_max_one_owner', 'policy_equiv_jurisdiction_and_scope']
model: engine-refine
---

Attributes, their types, and the entities they describe form the foundational vocabulary of any governed data catalog. An attribute is a named property of an entity, and its type constrains the shape of permissible values. In the artifact ownership model, attributes such as `checksum`, `created_date`, `identifier`, and `license` are declared with formal type annotations—`xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string` respectively—ensuring that downstream consumers can interpret stored values without ambiguity. The type system here is not merely decorative; it enforces that a date like `2023-04-04` or `2025-04-14` is semantically distinct from an integer such as `427` or `401`, or a free-form string like `c0ffee42`, `ARN:res/41`, `MIT`, and `rack-7`. By separating attribute definitions from their concrete values, the schema supports extensibility: new attributes can be introduced without restructuring the value tables, and type validation can be applied uniformly across all entities.

**t_artifact_max_one_owner**

| id | artifact | owner |
| --- | --- | --- |
| OWNE-0001 | telemetry-archive-2023 | SCOP-0005 |
| OWNE-0002 | etl-transform-stable | SCOP-0006 |
| OWNE-0003 | etl-transform-stable | SCOP-0005 |
| OWNE-0004 | ml-inference-v2.1 | SCOP-0003 |
| OWNE-0005 | ml-inference-v2.1 | SCOP-0004 |
| OWNE-0006 | etl-transform-stable | SCOP-0006 |

**t_artifact_max_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | checksum | xsd:string |
| OWNE-0002 | created_date | xsd:date |
| OWNE-0003 | identifier | cco:DesignativeICE |
| OWNE-0004 | license | xsd:string |
| OWNE-0005 | mime_type | xsd:string |
| OWNE-0006 | size_bytes | xsd:long |
| OWNE-0007 | uri | xsd:string |
| OWNE-0008 | version | xsd:integer |

**t_artifact_max_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0002 | 2023-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0002 | 2025-04-14 |
| OWNE-0003 | OWNE-0003 | OWNE-0002 | 2024-04-27 |
| OWNE-0004 | OWNE-0004 | OWNE-0002 | 2025-03-27 |
| OWNE-0005 | OWNE-0005 | OWNE-0002 | 2025-06-10 |
| OWNE-0006 | OWNE-0006 | OWNE-0002 | 2023-03-24 |

**t_artifact_max_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0006 | 427 |
| OWNE-0002 | OWNE-0001 | OWNE-0008 | 2 |
| OWNE-0003 | OWNE-0002 | OWNE-0006 | 401 |
| OWNE-0004 | OWNE-0002 | OWNE-0008 | 12 |
| OWNE-0005 | OWNE-0003 | OWNE-0006 | 38 |
| OWNE-0006 | OWNE-0003 | OWNE-0008 | 7 |
| OWNE-0007 | OWNE-0004 | OWNE-0006 | 393 |
| OWNE-0008 | OWNE-0004 | OWNE-0008 | 7 |

**t_artifact_max_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | c0ffee42 |
| OWNE-0002 | OWNE-0001 | OWNE-0003 | ARN:res/41 |
| OWNE-0003 | OWNE-0001 | OWNE-0004 | MIT |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | rack-7 |
| OWNE-0005 | OWNE-0001 | OWNE-0005 | application/octet-stream |
| OWNE-0006 | OWNE-0001 | OWNE-0010 | Name 06 |
| OWNE-0007 | OWNE-0001 | OWNE-0011 | sre |
| OWNE-0008 | OWNE-0001 | OWNE-0012 | Tags 08 |

The entity table serves as the bridge between abstract attribute definitions and their concrete instantiations. Each row in the value tables carries an `entity_id` that points back to a specific entity record, thereby binding a particular value to a particular thing. For instance, the entity identified as `OWNE-0001` is associated with the checksum value `c0ffee42`, the identifier `ARN:res/41`, the license `MIT`, and the integer `427`, while `OWNE-0002` carries the checksum `rack-7`, the identifier `ARN:res/41`, the license `MIT`, and the integer `12`. This design permits a single entity to accumulate a rich set of properties drawn from multiple value tables, each typed appropriately, without requiring a monolithic row structure. The entity identifier itself—`OWNE-0001`, `OWNE-0002`, `OWNE-0003`, `OWNE-0004`—acts as the stable anchor across all attribute-value joins, ensuring referential integrity even as the catalog grows.

Subject and target columns encode the directionality of relationships between entities, a pattern that becomes essential when policies intersect with jurisdictions and governance scopes. In the policy-jurisdiction linkage, a `policy_id` column designates the subject of the relationship—the policy that is being related—while a `jurisdiction_id` column designates the target—the regulatory framework to which the policy is connected. The same pattern appears in the policy-to-scope mapping, where `policy_id` and `governs_scope_id` play the roles of subject and target respectively. This subject-target distinction is not cosmetic; it allows the same relationship table to support asymmetric semantics. A policy may contribute to a jurisdiction, or observe it, or own it, and the direction of the relationship is preserved by which entity occupies the subject column and which occupies the target.

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | AI Model Training |
| SCOP-0002 | Personal Data Processing |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | Third Party Vendors |
| SCOP-0005 | Cross Border Transfers |
| SCOP-0006 | European Commission |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | FDA 21 CFR 11 |
| SCOP-0002 | UK Information Commissioner |
| SCOP-0003 | Industrial Control Systems |
| SCOP-0004 | CCPA |
| SCOP-0005 | UK Information Commissioner |
| SCOP-0006 | National Institute of Standards |

**t_policy_equiv_jurisdiction_and_scope__jurisdiction**

| id | policy_id | jurisdiction_id | role |
| --- | --- | --- | --- |
| SCOP-0001 | SCOP-0001 | SCOP-0002 | contributor |
| SCOP-0002 | SCOP-0001 | SCOP-0001 | observer |
| SCOP-0003 | SCOP-0001 | SCOP-0002 | observer |
| SCOP-0004 | SCOP-0002 | SCOP-0006 | owner |
| SCOP-0005 | SCOP-0003 | SCOP-0005 | contributor |
| SCOP-0006 | SCOP-0004 | SCOP-0002 | owner |
| SCOP-0007 | SCOP-0006 | SCOP-0001 | reviewer |
| SCOP-0008 | SCOP-0001 | SCOP-0006 | reviewer |

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | Basel III |
| SCOP-0002 | CCPA |
| SCOP-0003 | Massachusetts Privacy Board |
| SCOP-0004 | NIST 800-53 |
| SCOP-0005 | EU AI Act |
| SCOP-0006 | EU AI Act |
| SCOP-0007 | Securities Exchange Commission |

**t_policy_equiv_jurisdiction_and_scope__governs_scope**

| id | policy_id | governs_scope_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SCOP-0001 | SCOP-0003 | SCOP-0003 | contributor | Cardinality Note 01 |
| SCOP-0002 | SCOP-0004 | SCOP-0007 | contributor | Cardinality Note 02 |
| SCOP-0003 | SCOP-0005 | SCOP-0002 | observer | Cardinality Note 03 |
| SCOP-0004 | SCOP-0002 | SCOP-0002 | reviewer | Cardinality Note 04 |
| SCOP-0005 | SCOP-0002 | SCOP-0002 | owner | Cardinality Note 05 |
| SCOP-0006 | SCOP-0005 | SCOP-0001 | observer | Cardinality Note 06 |
| SCOP-0007 | SCOP-0003 | SCOP-0007 | observer | Cardinality Note 07 |
| SCOP-0008 | SCOP-0006 | SCOP-0006 | contributor | Cardinality Note 08 |

The role column captures the nature of the relationship between subject and target, adding a layer of semantic precision that a bare foreign key cannot convey. In the policy-jurisdiction association, the role values `contributor`, `observer`, and `owner` distinguish between a policy that actively shapes a regulatory framework and one that merely falls within its purview. For example, policy `SCOP-0001` (AI Model Training) acts as a contributor to jurisdiction `SCOP-0002` and as an observer of jurisdiction `SCOP-0001`, while policy `SCOP-0002` (Personal Data Processing) assumes the role of owner with respect to jurisdiction `SCOP-0006`. In the policy-scope linkage, roles such as `contributor`, `observer`, and `reviewer` serve a similar function, with policy `SCOP-0003` contributing to scope `SCOP-0003`, policy `SCOP-0004` contributing to scope `SCOP-0007`, and policy `SCOP-0002` reviewing scope `SCOP-0002`. The role column thus transforms a binary relationship into a typed association, enabling queries that distinguish between ownership and observation, or between contribution and review.

Cardinality notes provide metadata about the multiplicity constraints governing these relationships, documenting whether a subject can relate to one or many targets and vice versa. In the policy-scope junction table, entries carry cardinality notes such as `Cardinality Note 01`, `Cardinality Note 02`, `Cardinality Note 03`, and `Cardinality Note 04`, each attached to a specific subject-target pairing. These notes are not merely annotations; they encode the business rules that determine whether a policy can govern multiple scopes, whether a scope can be governed by multiple policies, and what happens when those constraints are violated. The presence of cardinality metadata alongside the relationship itself ensures that data quality checks can be automated and that the semantic intent of the model is preserved across system boundaries.

Equivalence and intersection tables extend the model beyond ownership and policy relationships, capturing cases where entities are interchangeable or share common properties across multiple dimensions. The intersection table `t_equiv_intersect_three` records four-way equivalences—linking values such as `lab_sample_registry` with `orc_table`, `crosswalk_rule`, and `dev_sandbox` under identifier `THRE-0001`, or `governance_policy_alpha` with `orc_table`, `lineage_node`, and `hot_cache` under `THRE-0002`. These equivalences are not simple identity claims; they express that a given logical entity can be represented in multiple systems, formats, or zones, and that the mapping between those representations is itself a first-class fact. The identifiers `THRE-0001` through `THRE-0004` serve as the stable keys for these mappings, while the four equivalence columns capture the cross-system references that enable data lineage, format migration, and environment-aware routing.

**t_equiv_intersect_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | lab_sample_registry | orc_table | crosswalk_rule | dev_sandbox |
| THRE-0002 | governance_policy_alpha | orc_table | lineage_node | hot_cache |
| THRE-0003 | governance_policy_alpha | csv_archive | standard_mapping | air_gapped |
| THRE-0004 | sensor_array_gamma | hdf5_archive | crosswalk_rule | staging_zone |
| THRE-0005 | telemetry_stream_alpha | netcdf_file | retention_policy | dev_sandbox |
| THRE-0006 | lab_sample_registry | parquet_dataset | schema_binding | edge_node |