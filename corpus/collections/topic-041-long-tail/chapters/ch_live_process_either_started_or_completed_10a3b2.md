---
chapter_id: ch_live_process_either_started_or_completed_10a3b2
topic_id: 41
family: 07_long_tail
cited_terms: ['process_either_started_or_completed', 'nonbreaking_change_subclass', 'transformation_associated_with_agent']
model: engine-refine
---

In operational data governance, the management of process attributes requires a disciplined separation between entity identity, attribute definition, and value storage. Each process instance—whether a Microtome sectioning operation, a Chromatography elution, or a Reactor startup sequence—is assigned a unique identifier such as COMP-0001 or COMP-0002, establishing a stable reference point across the system. The attributes themselves, including duration_seconds, end_time, exit_code, and host_name, are declared with explicit type annotations drawn from the XML Schema Definition namespace: xsd:decimal for numeric measurements, xsd:dateTime for temporal markers, xsd:integer for discrete counts, and xsd:string for textual descriptors. This type-aware attribute registry ensures that downstream consumers can interpret values without ambiguity, a requirement that becomes critical when processes span heterogeneous execution environments.

**t_process_either_started_or_completed**

| id | process | process_2 | process_3 |
| --- | --- | --- | --- |
| COMP-0001 | Microtome sectioning | Hash partitioning pass | Log rotation routine |
| COMP-0002 | Chromatography elution | Pressure equalization | Data retention purge |
| COMP-0003 | Reactor startup sequence | Hash partitioning pass | Data retention purge |
| COMP-0004 | Reactor startup sequence | Buffer exchange step | Baseline calibration sweep |
| COMP-0005 | ETL data ingestion | Cache invalidation sweep | Sample deidentification pass |
| COMP-0006 | PCR thermal cycle | Cache invalidation sweep | Sample deidentification pass |

**t_process_either_started_or_completed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMP-0001 | duration_seconds | xsd:decimal |
| COMP-0002 | end_time | xsd:dateTime |
| COMP-0003 | exit_code | xsd:integer |
| COMP-0004 | host_name | xsd:string |
| COMP-0005 | log_level | xsd:string |
| COMP-0006 | phase | xsd:string |
| COMP-0007 | retry_count | xsd:integer |
| COMP-0008 | scheduled_at | xsd:dateTime |

**t_process_either_started_or_completed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0002 | 2023-09-15T18:52:08 |
| COMP-0002 | COMP-0001 | COMP-0008 | 2024-08-13T16:34:41 |
| COMP-0003 | COMP-0001 | COMP-0009 | 2025-03-15T23:53:33 |
| COMP-0004 | COMP-0002 | COMP-0002 | 2025-06-15T09:08:30 |
| COMP-0005 | COMP-0002 | COMP-0008 | 2025-01-13T18:32:01 |
| COMP-0006 | COMP-0002 | COMP-0009 | 2023-05-31T03:15:32 |
| COMP-0007 | COMP-0003 | COMP-0002 | 2024-08-17T22:03:21 |
| COMP-0008 | COMP-0003 | COMP-0008 | 2023-03-17T02:37:48 |

**t_process_either_started_or_completed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0001 | 992.92 |
| COMP-0002 | COMP-0002 | COMP-0001 | 6910.53 |
| COMP-0003 | COMP-0003 | COMP-0001 | 4781.54 |
| COMP-0004 | COMP-0004 | COMP-0001 | 3156.19 |
| COMP-0005 | COMP-0005 | COMP-0001 | 593.89 |
| COMP-0006 | COMP-0006 | COMP-0001 | 5472.77 |

**t_process_either_started_or_completed_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0003 | 522 |
| COMP-0002 | COMP-0001 | COMP-0007 | 9 |
| COMP-0003 | COMP-0002 | COMP-0003 | 153 |
| COMP-0004 | COMP-0002 | COMP-0007 | 96 |
| COMP-0005 | COMP-0003 | COMP-0003 | 508 |
| COMP-0006 | COMP-0003 | COMP-0007 | 474 |
| COMP-0007 | COMP-0004 | COMP-0003 | 5 |
| COMP-0008 | COMP-0004 | COMP-0007 | 25 |

**t_process_either_started_or_completed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0004 | node-a01 |
| COMP-0002 | COMP-0001 | COMP-0005 | Log Level 02 |
| COMP-0003 | COMP-0001 | COMP-0006 | initiation |
| COMP-0004 | COMP-0001 | COMP-0010 | running |
| COMP-0005 | COMP-0001 | COMP-0011 | Triggered By 05 |
| COMP-0006 | COMP-0002 | COMP-0004 | ingest-21 |
| COMP-0007 | COMP-0002 | COMP-0005 | Log Level 07 |
| COMP-0008 | COMP-0002 | COMP-0006 | review |

The value storage layer implements a type-partitioned design, where each attribute type is persisted in its own dedicated table. Decimal-valued attributes such as duration_seconds appear as precise floating-point figures—992.92, 6910.53, 4781.54, 3156.19—each row linking a specific entity to a specific attribute through foreign keys. Temporal values like 2023-09-15T18:52:08 and 2025-06-15T09:08:30 occupy the datetime table, while integer-valued attributes such as exit_code take on discrete values like 522, 9, 153, and 96. String-valued attributes capture operational metadata including host identifiers like node-a01, log classifications such as Log Level 02, and state descriptors ranging from initiation to running. This partitioning strategy, while introducing join complexity, guarantees type safety at the storage layer and enables optimized indexing per data type.

Beyond process attributes, the same structural pattern extends to change management and agent association records. Nonbreaking changes—categorized by subclass entries such as Metric Name Addition, Dependency Version Bump, License Header Update, and Field Nullability Change—are linked to the systems they affect, including ML Feature Store, Cloud Storage Bucket, GraphQL Endpoint, and Event Ingestion Pipeline. Similarly, transformation operations like Archive Export Run, Feature Engineering Job, Model Retraining Cycle, and Sensor Calibration Pass are associated with execution contexts ranging from GitHub CI Pipeline and Docker Container to human roles such as Senior Data Engineer. In each case, the relationship is mediated through a junction table that carries a role attribute, specifying whether the association is one of contributor, reviewer, or observer.

**t_nonbreaking_change_subclass**

| id | nonbreaking |
| --- | --- |
| CHAN-0001 | Metric Name Addition |
| CHAN-0002 | Dependency Version Bump |
| CHAN-0003 | License Header Update |
| CHAN-0004 | Field Nullability Change |
| CHAN-0005 | Field Nullability Change |
| CHAN-0006 | Log Format Extension |

**t_nonbreaking_change_subclass_non_breaking_change_for**

| id | non_breaking_change_for |
| --- | --- |
| CHAN-0001 | ML Feature Store |
| CHAN-0002 | Cloud Storage Bucket |
| CHAN-0003 | GraphQL Endpoint |
| CHAN-0004 | Event Ingestion Pipeline |
| CHAN-0005 | REST API Gateway |
| CHAN-0006 | Data Lake Warehouse |

The role attribute in these association tables serves as a semantic qualifier that transforms a simple many-to-many link into a contextually meaningful relationship. A Senior Data Engineer may appear as a contributor to a Model Retraining Cycle and as an observer of a Sensor Calibration Pass, with the role field encoding the nature of their involvement. This design permits a single entity to participate in multiple relationships with different functional meanings, avoiding the need for redundant entity duplication. The identifier columns in these junction tables—nonbreaking_id and non_breaking_change_for_id, or transformation_id and was_associated_with_id—function as the subject and target of the relationship, respectively, establishing a directional semantics that supports audit trails and access control policies.

**t_nonbreaking_change_subclass__non_breaking_change_for**

| id | nonbreaking_id | non_breaking_change_for_id | role |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0004 | CHAN-0006 | observer |
| CHAN-0002 | CHAN-0006 | CHAN-0005 | contributor |
| CHAN-0003 | CHAN-0001 | CHAN-0003 | reviewer |
| CHAN-0004 | CHAN-0003 | CHAN-0002 | contributor |
| CHAN-0005 | CHAN-0002 | CHAN-0006 | observer |
| CHAN-0006 | CHAN-0005 | CHAN-0001 | reviewer |
| CHAN-0007 | CHAN-0001 | CHAN-0005 | reviewer |
| CHAN-0008 | CHAN-0002 | CHAN-0006 | owner |

**t_transformation_associated_with_agent__was_associated_with**

| id | transformation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0006 | AGEN-0001 | contributor |
| AGEN-0002 | AGEN-0007 | AGEN-0001 | reviewer |
| AGEN-0003 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0004 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0007 | AGEN-0006 | contributor |
| AGEN-0007 | AGEN-0001 | AGEN-0004 | observer |
| AGEN-0008 | AGEN-0003 | AGEN-0002 | observer |

Together, these tables form a cohesive entity-attribute-value architecture augmented by role-bearing association records. The identifier provides the anchor, the attribute definition supplies the schema, the type-partitioned value tables ensure data integrity, and the role-annotated junction tables capture the relational fabric that connects processes, changes, transformations, and their associated agents. This pattern, while requiring careful join management, offers the flexibility to evolve attribute sets and relationship types without schema migration, making it suitable for dynamic operational environments where process definitions and organizational roles shift over time.

**t_transformation_associated_with_agent**

| id | transformation |
| --- | --- |
| AGEN-0001 | Archive Export Run |
| AGEN-0002 | Feature Engineering Job |
| AGEN-0003 | Model Retraining Cycle |
| AGEN-0004 | Sensor Calibration Pass |
| AGEN-0005 | Schema Migration Run |
| AGEN-0006 | Partition Pruning Step |
| AGEN-0007 | Daily ETL Pipeline |

**t_transformation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | GitHub CI Pipeline |
| AGEN-0002 | Docker Container |
| AGEN-0003 | Senior Data Engineer |
| AGEN-0004 | Senior Data Engineer |
| AGEN-0005 | Docker Container |
| AGEN-0006 | Docker Container |