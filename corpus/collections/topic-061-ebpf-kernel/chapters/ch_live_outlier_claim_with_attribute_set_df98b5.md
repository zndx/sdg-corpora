---
chapter_id: ch_live_outlier_claim_with_attribute_set_df98b5
topic_id: 61
family: 02_observation_measurement
cited_terms: ['outlier_claim_with_attribute_set', 'two_disjoint_artifacts', 'equiv_intersect_with_two_restrictions']
model: engine-refine
---

In operational data governance, the distinction between an entity and its identifier forms the bedrock of traceability. An entity represents a discrete artifact under management—a `etl-job`, a `config-bundle`, a `data-pipeline-v4`—while its identifier, such as `ARTI-0001` or `ARTI-0002`, serves as the immutable handle by which that entity is referenced across systems. This separation of identity from substance permits entities to be described, related, and constrained without conflating their essential nature with the metadata that qualifies them. The same discipline applies to outlier tracking, where records bearing identifiers like `SET-0001` through `SET-0004` denote distinct anomaly claims—`checksum_mismatch`, `pipeline_stall`, `log_flooding`, `latency_spike`—each independently addressable regardless of the attribute sets they subsequently reference.

**t_outlier_claim_with_attribute_set**

| id | outlier |
| --- | --- |
| SET-0001 | checksum_mismatch |
| SET-0002 | pipeline_stall |
| SET-0003 | log_flooding |
| SET-0004 | latency_spike |
| SET-0005 | checksum_mismatch |
| SET-0006 | log_flooding |
| SET-0007 | latency_spike |

**t_outlier_claim_with_attribute_set_attribute_set**

| id | attribute_set |
| --- | --- |
| SET-0001 | tolerance_ranges |
| SET-0002 | baseline_values |
| SET-0003 | baseline_values |
| SET-0004 | calibration_constants |
| SET-0005 | tolerance_ranges |
| SET-0006 | temporal_windows |

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

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

Attributes and their types constitute the vocabulary through which entities are characterized. An attribute name such as `checksum`, `created_date`, `identifier`, or `license` declares a property of interest, while the attribute type—`xsd:string`, `xsd:date`, `cco:DesignativeICE`—imposes a schema-level contract on the values that attribute may accept. This typed attribute model ensures that the date `2023-05-13` stored against the `created_date` attribute is semantically distinct from the string `9d2b7a16` stored against a `checksum` attribute, even though both reside in value tables that share the same structural pattern. The type annotation is not merely decorative; it governs validation, comparison, and transformation logic downstream.

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

The value tables themselves embody the misc category—the raw material of entity description. Integer values such as `36`, `5`, `462`, and `3` coexist alongside varchar values like `urn:uuid:9f2a`, `MPL-2.0`, and `ap-south-2`, each row binding a value to a specific entity via `entity_id` and to a specific attribute via `attr_id`. This tripartite linkage—entity, attribute, value—realizes an entity-attribute-value model that is both flexible and queryable. The same `attr_id` of `ARTI-0002` may be referenced across multiple entities (`ARTI-0001` through `ARTI-0004`), each contributing its own date value (`2023-05-13`, `2024-02-28`, `2024-03-29`, `2023-09-19`), demonstrating how a single attribute definition can be instantiated across a population of entities without schema modification.

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

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

Subject and target emerge as relational primitives when entities or their attributes enter into structured associations. In the junction table connecting outlier claims to attribute sets, `outlier_id` functions as the subject—the entity initiating or bearing the relationship—while `attribute_set_id` serves as the target—the entity receiving or being referenced by the relationship. The pair `SET-0003` (subject) and `SET-0005` (target) is not merely a foreign-key pair; it is qualified by a role, such as `contributor` or `owner`, which encodes the semantic nature of the association. This three-element construct—subject, target, role—transforms a bare referential link into a governed relationship that can be queried, audited, and constrained by policy.

**t_outlier_claim_with_attribute_set__attribute_set**

| id | outlier_id | attribute_set_id | role |
| --- | --- | --- | --- |
| SET-0001 | SET-0003 | SET-0005 | contributor |
| SET-0002 | SET-0001 | SET-0004 | owner |
| SET-0003 | SET-0004 | SET-0001 | contributor |
| SET-0004 | SET-0007 | SET-0002 | contributor |
| SET-0005 | SET-0004 | SET-0005 | contributor |
| SET-0006 | SET-0006 | SET-0006 | contributor |
| SET-0007 | SET-0004 | SET-0002 | owner |
| SET-0008 | SET-0001 | SET-0006 | owner |

Equivalence and intersection relationships extend the model beyond simple attribution into the realm of constraint and classification. Records identified as `REST-0001` through `REST-0004` encode pairs of equivalent entities—`telemetry_stream_alpha` with `ml_model_checkpoint`, `governance_policy_set` with `sensor_node_array`—alongside pairs of related entities—`storage_volume` with `inference_dataset`, `encryption_key` with `backup_volume`. These relationships, whether equivalence or mere association, are themselves first-class data objects with their own identifiers and structural integrity, enabling the system to reason about entity identity, substitution, and dependency across operational boundaries.

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