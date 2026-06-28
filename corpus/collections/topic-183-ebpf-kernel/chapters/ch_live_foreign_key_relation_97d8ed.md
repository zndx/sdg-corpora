---
chapter_id: ch_live_foreign_key_relation_97d8ed
topic_id: 183
family: 07_long_tail
cited_terms: ['foreign_key_relation', 'xdp_action_drop', 'dempster_combinant_first']
model: engine-refine
---

At the heart of this data model lies a flexible entity-attribute-value architecture that separates the definition of what properties an entity can have from the actual values those properties hold. Each entity—whether it is a network filtering rule like `wlan0_monitor` or `veth1_filter`, or an uncertainty propagation component like `UncertaintyPropagationPipeline` or `MultiSourceInferenceEngine`—is assigned a unique identifier such as `DROP-0001` or `FIRS-0001`. These identifiers serve as the primary keys that anchor every relationship and value assignment throughout the system. The attribute definitions themselves are catalogued separately, specifying both a human-readable name and a formal type. For instance, the attribute `checksum` is typed as `xsd:string`, while `created_date` carries the type `xsd:date`, and `identifier` is classified under `cco:DesignativeICE`. This separation of attribute schema from attribute values enables the same entity to carry heterogeneous data without requiring a rigid, monolithic table structure.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | quarantine |
| DROP-0002 | veth1_filter | conntrack_drop |
| DROP-0003 | docker0_hook | acl_denied |
| DROP-0004 | nfqueue_bridge | threat_block |
| DROP-0005 | eth0_ingress | acl_denied |
| DROP-0006 | wlan0_monitor | threat_block |

**t_xdp_action_drop_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DROP-0001 | checksum | xsd:string |
| DROP-0002 | created_date | xsd:date |
| DROP-0003 | identifier | cco:DesignativeICE |
| DROP-0004 | license | xsd:string |
| DROP-0005 | mime_type | xsd:string |
| DROP-0006 | size_bytes | xsd:long |
| DROP-0007 | uri | xsd:string |
| DROP-0008 | version | xsd:integer |

**t_xdp_action_drop_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0002 | 2025-02-22 |
| DROP-0002 | DROP-0002 | DROP-0002 | 2023-10-04 |
| DROP-0003 | DROP-0003 | DROP-0002 | 2025-04-21 |
| DROP-0004 | DROP-0004 | DROP-0002 | 2023-05-09 |
| DROP-0005 | DROP-0005 | DROP-0002 | 2023-08-28 |
| DROP-0006 | DROP-0006 | DROP-0002 | 2023-05-04 |

**t_xdp_action_drop_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0006 | 265 |
| DROP-0002 | DROP-0001 | DROP-0008 | 7 |
| DROP-0003 | DROP-0002 | DROP-0006 | 394 |
| DROP-0004 | DROP-0002 | DROP-0008 | 7 |
| DROP-0005 | DROP-0003 | DROP-0006 | 114 |
| DROP-0006 | DROP-0003 | DROP-0008 | 8 |
| DROP-0007 | DROP-0004 | DROP-0006 | 460 |
| DROP-0008 | DROP-0004 | DROP-0008 | 9 |

**t_xdp_action_drop_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0001 | 1a4b6c2d |
| DROP-0002 | DROP-0001 | DROP-0003 | urn:uuid:9f2a |
| DROP-0003 | DROP-0001 | DROP-0004 | CC-BY-4.0 |
| DROP-0004 | DROP-0001 | DROP-0009 | us-east-1 |
| DROP-0005 | DROP-0001 | DROP-0005 | application/parquet |
| DROP-0006 | DROP-0001 | DROP-0010 | Name 06 |
| DROP-0007 | DROP-0001 | DROP-0011 | ml-infra |
| DROP-0008 | DROP-0001 | DROP-0012 | Tags 08 |

The actual values assigned to entities are stored in type-specialized value tables, each dedicated to a particular data type. Date attributes such as `created_date` are persisted in a dedicated date-value store, where entries like `2025-02-22` or `2023-10-04` are linked to their corresponding entity and attribute through foreign keys. Integer-valued attributes—such as the value `265` or `394`—reside in an integer-value table, while string-valued attributes like the checksum `1a4b6c2d`, the URN `urn:uuid:9f2a`, the license designation `CC-BY-4.0`, and the region tag `us-east-1` are stored in a variable-character value table. This type-disaggregated storage approach ensures that each value is stored in its most appropriate format, avoids the pitfalls of type coercion, and allows the schema to accommodate new attribute types by adding new value tables rather than altering existing ones.

Beyond attributes, the model supports rich relationship structures between entities through a three-table foreign key relation pattern. A relation definition table establishes the existence of a relationship—such as the one identified as `RELA-0003`—and associates it with a high-level category like `metric_snapshots`. A companion table maps that same relation identifier to a target entity, in this case `data_lake_catalog`, thereby specifying what the relationship points to. The junction table then ties the subject entity to the target entity through a role qualifier, capturing the semantic nature of the connection. For example, the relation `RELA-0003` connects subject `RELA-0003` to target `RELA-0005` with the role `owner`, while the same subject connects to target `RELA-0006` with the role `contributor`. This tripartite structure allows a single subject to hold multiple distinct relationships to the same or different targets, each differentiated by its role.

**t_foreign_key_relation**

| id | foreign |
| --- | --- |
| RELA-0001 | batch_workflows |
| RELA-0002 | config_snapshots |
| RELA-0003 | metric_snapshots |
| RELA-0004 | schema_versions |
| RELA-0005 | query_executions |
| RELA-0006 | batch_workflows |
| RELA-0007 | data_ingestion_jobs |
| RELA-0008 | metric_snapshots |

**t_foreign_key_relation_foreign_key_to**

| id | foreign_key_to |
| --- | --- |
| RELA-0001 | system_clocks |
| RELA-0002 | schema_definitions |
| RELA-0003 | data_lake_catalog |
| RELA-0004 | core_products |
| RELA-0005 | identity_provider |
| RELA-0006 | data_lake_catalog |

**t_foreign_key_relation__foreign_key_to**

| id | foreign_id | foreign_key_to_id | role |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0003 | RELA-0005 | owner |
| RELA-0002 | RELA-0003 | RELA-0006 | owner |
| RELA-0003 | RELA-0007 | RELA-0006 | contributor |
| RELA-0004 | RELA-0006 | RELA-0002 | contributor |
| RELA-0005 | RELA-0008 | RELA-0004 | owner |
| RELA-0006 | RELA-0007 | RELA-0003 | owner |
| RELA-0007 | RELA-0004 | RELA-0002 | owner |
| RELA-0008 | RELA-0005 | RELA-0001 | owner |

**t_dempster_combinant_first__first_combinant**

| id | dempster_id | first_combinant_id | role |
| --- | --- | --- | --- |
| FIRS-0001 | FIRS-0001 | FIRS-0005 | observer |
| FIRS-0002 | FIRS-0005 | FIRS-0002 | reviewer |
| FIRS-0003 | FIRS-0001 | FIRS-0004 | observer |
| FIRS-0004 | FIRS-0005 | FIRS-0006 | owner |
| FIRS-0005 | FIRS-0004 | FIRS-0005 | owner |
| FIRS-0006 | FIRS-0005 | FIRS-0005 | owner |
| FIRS-0007 | FIRS-0006 | FIRS-0004 | contributor |
| FIRS-0008 | FIRS-0002 | FIRS-0005 | observer |

The same relational pattern appears in the Dempster-Shafer evidence combination domain, where uncertainty propagation components are linked to their constituent data sources through role-bearing associations. The `UncertaintyPropagationPipeline` (identified as `FIRS-0001`) is connected to `HistoricalLogArchive` (identified as `FIRS-0005`) with the role `observer`, and also to `GroundTruthLabels` (identified as `FIRS-0004`) with the role `observer`. Meanwhile, the `MultiSourceInferenceEngine` (identified as `FIRS-0005`) connects to `CoreTelemetryFeed` (identified as `FIRS-0002`) with the role `reviewer` and to `PrimaryFlightData` (identified as `FIRS-0006`) with the role `owner`. The role field—whether it expresses `owner`, `contributor`, `observer`, or `reviewer`—encodes the functional relationship between subject and target, enabling downstream systems to reason about provenance, access control, and data lineage without hardcoding relationship semantics into the schema.

Together, these constructs form a composable data architecture where entities, attributes, values, and relationships are all first-class citizens. The identifier provides a stable anchor point, the attribute definition establishes what properties are permissible, the value tables store the actual data in type-appropriate form, and the relationship tables capture how entities connect to one another with semantic precision. This design supports complex domains ranging from network security policy management—where XDP actions like `quarantine` and `threat_block` are applied to interfaces like `docker0_hook` and `nfqueue_bridge`—to multi-source evidence fusion, where uncertainty propagation pipelines aggregate signals from diverse feeds such as `CoreTelemetryFeed` and `GroundTruthLabels`. The uniformity of the underlying model means that new entity types, attribute schemas, and relationship patterns can be introduced without modifying the core data structures, making the system both extensible and self-describing.

**t_dempster_combinant_first**

| id | dempster |
| --- | --- |
| FIRS-0001 | UncertaintyPropagationPipeline |
| FIRS-0002 | MultiSourceInferenceEngine |
| FIRS-0003 | EvidenceCombinationModel |
| FIRS-0004 | ProvenanceAggregator |
| FIRS-0005 | DataQualityFusionService |
| FIRS-0006 | BeliefFusionEngine |

**t_dempster_combinant_first_first_combinant**

| id | first_combinant |
| --- | --- |
| FIRS-0001 | HistoricalLogArchive |
| FIRS-0002 | CoreTelemetryFeed |
| FIRS-0003 | GroundTruthLabels |
| FIRS-0004 | PrimaryFlightData |
| FIRS-0005 | LIDARPointCloud |
| FIRS-0006 | BaselineSensorArray |