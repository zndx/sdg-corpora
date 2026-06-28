---
chapter_id: ch_live_equiv_intersect_with_two_restrictions_aba69a
topic_id: 61
family: 01_foundation
cited_terms: ['equiv_intersect_with_two_restrictions', 'universal_generic', 'two_disjoint_artifacts']
model: engine-refine
---

Attributes, attribute types, entities, identifiers, and miscellaneous values constitute the foundational vocabulary of any structured data governance framework, each serving a distinct ontological role within the broader taxonomy. An identifier functions as the immutable key by which an entity is distinguished across all operational contexts—REST-0001 through REST-0004, GENE-0001 through GENE-0004, ARTI-0001 through ARTI-0004—each prefix encoding a semantic class while the numeric suffix guarantees uniqueness within that namespace. The entity itself represents a discrete, addressable concept or artifact: telemetry_stream_alpha, governance_policy_set, ml_feature_vector, lab_assay_batch, etl-job, config-bundle, data-pipeline-v4, data-lake, traffic-router, access-policy, service-discovery. These are not abstract placeholders but concrete operational objects whose relationships and properties must be tracked with precision.

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

Attribute types define the schema of what can be said about an entity, constraining values to well-defined domains that enable both machine interpretation and human auditability. The type xsd:string accommodates free-form text such as checksums (9d2b7a16), license identifiers (MPL-2.0), and geographic regions (ap-south-2); xsd:date captures temporal metadata with strict ISO 8601 formatting (2023-05-13, 2024-02-28, 2024-03-29, 2023-09-19); xsd:int handles numeric measures (36, 5, 462, 3); and cco:DesignativeICE serves as a custom designative type for URN-style identifiers (urn:uuid:9f2a). This typed discipline ensures that a created_date field cannot be confused with a checksum, and that integer-valued attributes such as those with values 36 and 462 remain numerically comparable across entity instances.

The relationship between an entity and its attributes is mediated through a tripartite linkage: the entity identifier, the attribute identifier, and the value itself. In the date-valued attribute store, entity ARTI-0001 maps to attribute ARTI-0002 with the value 2023-05-13, while entity ARTI-0003 maps to the same attribute ARTI-0002 with the value 2024-03-29—demonstrating that a single attribute definition can be instantiated across multiple entities, each carrying its own value. Similarly, the integer-valued attributes reveal a many-to-many topology: entity ARTI-0001 carries both attribute ARTI-0006 (value 36) and attribute ARTI-0008 (value 5), while entity ARTI-0002 carries ARTI-0006 (value 462) and ARTI-0008 (value 3). This structure permits an entity to accumulate heterogeneous properties without schema drift.

Cross-entity relationships further enrich the data model. The equivalence-intersection table encodes pairwise relationships between concepts: telemetry_stream_alpha intersects with ml_model_checkpoint through the restriction REST-0001, while governance_policy_set relates to sensor_node_array under REST-0002. The universal-generic table establishes broader categorical mappings—Governance Framework relates to CSV Stream, Taxonomy Node to Parquet Format, Event Category to Binary Blob, Validation Pattern to YAML Config—creating a hierarchy that situates specific artifacts within general-purpose categories. The disjoint-artifacts table captures mutually exclusive pairings: etl-job is paired with data-lake, config-bundle with traffic-router and access-policy, and data-pipeline-v4 with service-discovery, enforcing constraints that certain artifacts cannot coexist within the same operational context.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | storage_volume | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | encryption_key | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | centrifuge_tube | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | ingestion_connector | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | protocol_adapter | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | schema_registry | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | centrifuge_tube | inference_dataset |

**t_universal_generic**

| id | universal | related |
| --- | --- | --- |
| GENE-0001 | Governance Framework | CSV Stream |
| GENE-0002 | Taxonomy Node | Parquet Format |
| GENE-0003 | Event Category | Binary Blob |
| GENE-0004 | Validation Pattern | YAML Config |
| GENE-0005 | Compliance Rule | MessagePack |
| GENE-0006 | Taxonomy Node | XML Document |
| GENE-0007 | Compliance Rule | Parquet Format |
| GENE-0008 | Data Standard | JSON Schema |

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

The miscellany of values—whether a checksum like 9d2b7a16, a URN like urn:uuid:9f2a, a license like MPL-2.0, a region like ap-south-2, a date like 2024-02-28, or an integer like 462—represents the raw material of operational reality. Each value, however trivial in isolation, becomes a node in the broader graph of entity relationships, attribute instantiations, and cross-cutting restrictions. The integrity of the entire framework depends on the disciplined separation of identifier (the key), entity (the concept), attribute (the property), attribute type (the domain), and value (the instance)—a separation that, when maintained, enables auditability, traceability, and governance at scale.

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |