---
chapter_id: ch_live_artifact_governed_by_policy_c6a3d5
topic_id: 186
family: 01_foundation
cited_terms: ['artifact_governed_by_policy', 'measurement_subclass_only_one_unit', 'storage_structure_composition']
model: engine-refine
---

Within data governance frameworks, every managed asset must be uniquely identifiable, versioned, and sized to support auditability and lifecycle management. The governance registry captures this through a policy linkage model where each artifact receives a persistent identifier such as POLI-0001 or POLI-0004, is assigned a version number like 9 or 3, and is recorded with its byte footprint—98508200 bytes for an ml_training_dataset, 750925585 bytes for an api_gateway_config, or 765223054 bytes for a batch_ingestion_job. These three dimensions—identifier, version, and size in bytes—form the minimal provenance triad that enables downstream systems to reason about which policy governs which artifact, whether a newer revision has been deployed, and how much storage capacity the artifact consumes.

**t_artifact_governed_by_policy**

| id | artifact | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | ml_training_dataset | 98508200 | 9 |
| POLI-0002 | api_gateway_config | 750925585 | 8 |
| POLI-0003 | payment_transaction_log | 14439485 | 10 |
| POLI-0004 | batch_ingestion_job | 765223054 | 3 |

Measurement systems extend this discipline beyond static artifacts into the domain of observed quantities, where each measurement is defined by a type and a single associated unit. A temperature gradient measurement is paired with newton meters, soil pH with decibels, soil moisture with lumens, and torque with degrees celsius, establishing a one-to-one mapping between measurement subclass and unit of measure. This constraint simplifies validation and eliminates ambiguity in downstream analytics, since every recorded value carries an unambiguous unit context.

**t_measurement_subclass_only_one_unit**

| id | measurement | unit |
| --- | --- | --- |
| UNIT-0001 | temperature gradient | newton meters |
| UNIT-0002 | soil pH | decibels |
| UNIT-0003 | soil moisture | lumens |
| UNIT-0004 | torque | degrees celsius |
| UNIT-0005 | heart rate | lumens |
| UNIT-0006 | packet loss | percent |

**t_measurement_subclass_only_one_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | confidence | xsd:decimal |
| UNIT-0002 | dimension_kind | xsd:string |
| UNIT-0003 | method | xsd:string |
| UNIT-0004 | recorded_at | xsd:dateTime |
| UNIT-0005 | uncertainty | xsd:decimal |
| UNIT-0006 | unit | xsd:string |
| UNIT-0007 | value | xsd:decimal |
| UNIT-0008 | encoding | xsd:string |

To enrich measurements with metadata, the framework defines attributes with explicit data types drawn from the XML Schema definition namespace. The attribute confidence is typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. These type declarations are not merely documentation; they govern how values are stored, validated, and queried across three value tables that partition by type. Decimal attributes such as confidence are persisted in a dedicated decimal store with values like 0.584 or 680.89, string attributes like dimension_kind appear in a varchar store with entries such as Dimension Kind 01 or Encoding 02, and datetime attributes like recorded_at occupy their own table with ISO 8601 timestamps including 2024-07-02T10:17:22 and 2025-05-17T18:10:32. Each value row references an entity—the measurement instance being described—and an attribute, creating a flexible entity-attribute-value pattern that supports arbitrary attribute expansion without schema migration.

**t_measurement_subclass_only_one_unit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0004 | 2024-07-02T10:17:22 |
| UNIT-0002 | UNIT-0002 | UNIT-0004 | 2025-05-17T18:10:32 |
| UNIT-0003 | UNIT-0003 | UNIT-0004 | 2023-09-23T07:34:54 |
| UNIT-0004 | UNIT-0004 | UNIT-0004 | 2023-07-03T17:50:57 |
| UNIT-0005 | UNIT-0005 | UNIT-0004 | 2025-03-23T11:32:54 |
| UNIT-0006 | UNIT-0006 | UNIT-0004 | 2024-10-11T18:39:44 |

**t_measurement_subclass_only_one_unit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | 0.584 |
| UNIT-0002 | UNIT-0001 | UNIT-0005 | 680.89 |
| UNIT-0003 | UNIT-0001 | UNIT-0007 | 977.36 |
| UNIT-0004 | UNIT-0002 | UNIT-0001 | 0.929 |
| UNIT-0005 | UNIT-0002 | UNIT-0005 | 548.84 |
| UNIT-0006 | UNIT-0002 | UNIT-0007 | 51.31 |
| UNIT-0007 | UNIT-0003 | UNIT-0001 | 0.964 |
| UNIT-0008 | UNIT-0003 | UNIT-0005 | 305.75 |

**t_measurement_subclass_only_one_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | Dimension Kind 01 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | Encoding 02 |
| UNIT-0003 | UNIT-0001 | UNIT-0009 | change rationale |
| UNIT-0004 | UNIT-0001 | UNIT-0010 | fr |
| UNIT-0005 | UNIT-0001 | UNIT-0003 | hybrid |
| UNIT-0006 | UNIT-0001 | UNIT-0006 | nm |
| UNIT-0007 | UNIT-0002 | UNIT-0002 | Dimension Kind 07 |
| UNIT-0008 | UNIT-0002 | UNIT-0008 | Encoding 08 |

Storage architecture follows a parallel compositional model, where hierarchical storage structures are defined independently of the database containers they hold. A tiered-storage-pool or archive-tape-library or san-disk-array serves as a logical grouping that comprises concrete database containers such as dev-mongo-shard, staging-redis-cluster, s3-logs-bucket, or cassandra-data-node. The composition relationship itself is mediated through a junction table that assigns a role to each link—observer or reviewer—distinguishing between containers that passively participate in a storage structure and those that actively contribute capacity or data. The subject column identifies the storage structure doing the comprising, while the target column identifies the composition being referenced, enabling recursive composition where one storage structure can comprise another, as seen when COMP-0003 references COMP-0006 with the role observer.

**t_storage_structure_composition**

| id | storage_structure_composition |
| --- | --- |
| COMP-0001 | tiered-storage-pool |
| COMP-0002 | archive-tape-library |
| COMP-0003 | tiered-storage-pool |
| COMP-0004 | san-disk-array |
| COMP-0005 | archive-tape-library |
| COMP-0006 | flash-memory-pool |

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