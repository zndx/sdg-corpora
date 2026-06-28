---
chapter_id: ch_live_schemaorg_place_geocoord_a5faef
topic_id: 35
family: 07_long_tail
cited_terms: ['schemaorg_place_geocoord', 'directive_traces_to_requirement', 'storage_structure_composition']
model: engine-refine
---

Compliance frameworks and data governance architectures rely on a disciplined separation between declarative requirements, their typed attributes, and the storage infrastructures that materialize them. At the requirement level, directives such as ISO 27001:2022, PCI DSS v4.0, the EU AI Act Article 9, and internal Data Classification Policy are each identified by a stable surrogate key—REQU-0001 through REQU-0004—and enriched with a fixed schema of attributes: effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). These attributes are not stored inline with the requirement definition; instead, their values are materialized in dedicated type-specific tables, a design that enforces type safety and permits heterogeneous value sets without schema mutation. For instance, the mandatory attribute across the four requirements resolves to false, false, true, and false respectively, while effective_date values span from 2023-08-06 through 2025-05-18, and priority integers range from 4 to 453. String-valued attributes such as enforcement carry values like "Enforcement 02" and "ja," and auxiliary attributes capture operational metadata including "nightly summary" and "Encoding 01." This attribute-value decomposition mirrors the EAV (entity-attribute-value) pattern commonly employed in regulatory data models, where the attribute definition table establishes the schema and the value tables hold the instances.

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

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

The entity concept operates as the connective tissue binding requirements to their attribute values. Each value row carries an entity_id that references the originating requirement, ensuring that a boolean value of true for attribute REQU-0003 belongs unambiguously to requirement REQU-0003, and that integer priority values of 4 and 132 both attach to requirement REQU-0001. This entity-level indirection permits a single requirement to carry multiple values for the same attribute—REQU-0001, for example, holds two distinct integer priorities (4 and 132) across two attribute instances (REQU-0004 and REQU-0005)—supporting scenarios where a single directive is subject to multiple classification tiers or evaluation criteria. The identifier column in each value table serves as the primary key for the value row itself, distinct from the entity_id foreign key, establishing a clear separation between value identity and value provenance.

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001:2022 |
| REQU-0002 | PCI DSS v4.0 |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | HIPAA Privacy Rule |

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

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

Geographic coordinate metadata follows a parallel dimensional model, where the dimension table dim_geo_coordinates provides the human-readable labels and categorical classifications for coordinate sets. Each coordinate entry—GEOC-0001 through GEOC-0004—carries a label such as "Geo Coordinates Label 01" and a category like "Geo Coordinates Category 01," while the fact table fact_schemaorg references these coordinates via the geo_coordinates_key foreign key and attaches operational metadata including file size (ranging from 114,301,972 bytes for GEOC-0002 to 998,785,819 bytes for GEOC-0004) and version numbers spanning 3 through 8. Notably, multiple fact rows can reference the same coordinate key—GEOC-0004 appears in three separate fact entries—indicating that a single geographic coordinate definition may be associated with multiple data assets or schema registrations. The identifier pattern GEOC-0001 establishes a consistent naming convention that distinguishes coordinate entities from requirement entities (REQU-*) and storage composition entities (COMP-*), preventing namespace collisions across the governance data model.

**fact_schemaorg**

| id | geo_coordinates_key | size_bytes | version |
| --- | --- | --- | --- |
| GEOC-0001 | GEOC-0004 | 895265030 | 3 |
| GEOC-0002 | GEOC-0006 | 114301972 | 5 |
| GEOC-0003 | GEOC-0004 | 338701831 | 4 |
| GEOC-0004 | GEOC-0004 | 998785819 | 8 |

**dim_geo_coordinates**

| id | geo_coordinates_label | geo_coordinates_category |
| --- | --- | --- |
| GEOC-0001 | Geo Coordinates Label 01 | Geo Coordinates Category 01 |
| GEOC-0002 | Geo Coordinates Label 02 | Geo Coordinates Category 02 |
| GEOC-0003 | Geo Coordinates Label 03 | Geo Coordinates Category 03 |
| GEOC-0004 | Geo Coordinates Label 04 | Geo Coordinates Category 04 |
| GEOC-0005 | Geo Coordinates Label 05 | Geo Coordinates Category 05 |
| GEOC-0006 | Geo Coordinates Label 06 | Geo Coordinates Category 06 |

Storage infrastructure is modeled through a composition hierarchy that separates the structural definition from the membership relationship. The t_storage_structure_composition table defines storage compositions such as tiered-storage-pool, archive-tape-library, and san-disk-array, while t_storage_structure_composition_comprises enumerates the database containers that belong to each composition—dev-mongo-shard, staging-redis-cluster, s3-logs-bucket, and cassandra-data-node. The junction table t_storage_structure_composition__comprises introduces the role dimension, assigning each container a functional role within its composition: observer or reviewer. This role attribute is critical for governance, as it determines whether a container participates in data processing (observer) or in compliance verification (reviewer). The same composition COMP-0003, for instance, links to container COMP-0006 with the role reviewer, while composition COMP-0001 links to COMP-0006 with the role observer, demonstrating that the same target container can assume different governance roles depending on the composition context. The subject column in the junction table anchors the composition side of the relationship, while comprises_id references the target composition, and the role column captures the semantic relationship between them.

**t_storage_structure_composition_comprises**

| id | comprises |
| --- | --- |
| COMP-0001 | dev-mongo-shard |
| COMP-0002 | staging-redis-cluster |
| COMP-0003 | s3-logs-bucket |
| COMP-0004 | cassandra-data-node |
| COMP-0005 | oracle-tablespace-main |
| COMP-0006 | neo4j-graph-store |

**t_storage_structure_composition__comprises**

| id | storage_id | comprises_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0003 | COMP-0006 | observer |
| COMP-0002 | COMP-0002 | COMP-0004 | reviewer |
| COMP-0003 | COMP-0006 | COMP-0001 | observer |
| COMP-0004 | COMP-0003 | COMP-0006 | reviewer |
| COMP-0005 | COMP-0002 | COMP-0002 | contributor |
| COMP-0006 | COMP-0001 | COMP-0006 | reviewer |
| COMP-0007 | COMP-0006 | COMP-0003 | owner |
| COMP-0008 | COMP-0002 | COMP-0006 | reviewer |

Together, these tables form a cohesive governance data model where identifiers provide stable references across domains, attributes and their typed values capture regulatory and operational metadata, geographic coordinates link data assets to spatial dimensions, and storage compositions with role-annotated memberships ensure that infrastructure elements are classified according to their compliance function. The model's strength lies in its normalization: requirements are defined once and enriched through attribute-value pairs; storage structures are decomposed into compositions and containers with explicit roles; and geographic metadata is separated from the facts that reference it. This architecture supports auditability, as every value can be traced to its source requirement through the entity_id foreign key, and every storage container can be classified by its role within a composition, enabling precise mapping between regulatory requirements and the technical controls that implement them.

**t_storage_structure_composition**

| id | storage_structure_composition |
| --- | --- |
| COMP-0001 | tiered-storage-pool |
| COMP-0002 | archive-tape-library |
| COMP-0003 | tiered-storage-pool |
| COMP-0004 | san-disk-array |
| COMP-0005 | archive-tape-library |
| COMP-0006 | flash-memory-pool |