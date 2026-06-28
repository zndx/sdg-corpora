---
chapter_id: ch_live_allocation_subclass_7f4559
topic_id: 42
family: 05_provo_lineage
cited_terms: ['allocation_subclass', 'transformation_min_one_output', 'transformation_min_one_input']
model: engine-refine
---

An identifier is a stable, opaque reference that anchors an entity across every relationship in which it participates, decoupling identity from mutable attributes. In data-engineering registries, identifiers such as ALLO-0001, OUTP-0001, and INPU-0001 serve as the immutable keys through which allocations, transformations, and datasets are addressed regardless of what those entities are called. The human-readable labels—nightly-ingest, JoinEnrichment, windowed telemetry buffer—may evolve as pipelines are refactored or renamed, but the identifier persists as the single point of truth for joins, audits, and lineage queries. This separation of identity from description is what permits a system to track a transformation like FieldEncryption across both its input and output relationships without ambiguity.

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | JoinEnrichment |
| OUTP-0002 | RowFiltering |
| OUTP-0003 | BatchCompaction |
| OUTP-0004 | FieldEncryption |
| OUTP-0005 | schema migration |
| OUTP-0006 | telemetry aggregation |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | aggregated metrics store |
| OUTP-0002 | masked PII archive |
| OUTP-0003 | masked PII archive |
| OUTP-0004 | deduplicated user profiles |
| OUTP-0005 | normalized feature set |
| OUTP-0006 | cleaned sensor logs |

**t_transformation_min_one_input**

| id | transformation |
| --- | --- |
| INPU-0001 | JoinEnrichment |
| INPU-0002 | feature engineering |
| INPU-0003 | FieldEncryption |
| INPU-0004 | DataMasking |
| INPU-0005 | telemetry aggregation |
| INPU-0006 | data normalization |

**t_transformation_min_one_input_input_dataset**

| id | input_dataset |
| --- | --- |
| INPU-0001 | windowed telemetry buffer |
| INPU-0002 | cleaned sensor logs |
| INPU-0003 | windowed telemetry buffer |
| INPU-0004 | aggregated metrics store |
| INPU-0005 | curated events table |
| INPU-0006 | windowed telemetry buffer |

A role defines the nature of the relationship between two entities, answering not merely which entities are connected but how they interact. Within the allocation-subclass registry, the same allocation identifier ALLO-0001 participates in a relationship with the execution engine Celery Worker under the role contributor, while ALLO-0004 links to TensorFlow Serving as observer—two distinct relationship semantics between otherwise parallel entities. Roles such as contributor, owner, reviewer, and observer encode governance expectations: a contributor is expected to modify or produce, an observer is entitled to read but not alter, and an owner carries accountability. These role labels are not metadata attached to a single entity; they are properties of the edge itself, and they change independently of either endpoint.

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

The subject is the entity that initiates or owns the relationship—the source of the directed edge. In the transformation-output registry, the transformation OUTP-0006 appears as the subject in three separate relationships, producing outputs to the datasets OUTP-0003, OUTP-0005, and OUTP-0001 with roles of reviewer, contributor, and contributor respectively. The subject is always the entity whose behavior or configuration drives the connection: an allocation triggers an execution engine, a transformation writes to a dataset, a transformation reads from a dataset. Identifying the subject is essential for tracing causality and for determining which entity's lifecycle governs the relationship.

The target is the entity that receives the relationship—the destination of the directed edge. In the input-dataset registry, the dataset INPU-0001 serves as the target of a relationship from transformation INPU-0001 under the role observer, while INPU-0002 is the target of INPU-0003, also as observer. Targets may be shared across multiple subjects: the aggregated metrics store, referenced as the output of transformation OUTP-0001, simultaneously functions as the input source for downstream transformations, making it a target in one relationship and a subject in another. This dual capacity is what makes the subject-target distinction critical—without it, a dataset's role in the pipeline would be ambiguous.

Together, these four concepts—identifier, role, subject, target—form the minimal vocabulary for describing any directed, typed relationship in a data platform. An identifier provides the address, a role provides the semantics, a subject provides the direction, and a target provides the destination. Consider the allocation ALLO-0001, which is identified by the string ALLO-0001, named nightly-ingest, and linked via its subject position to the execution engine Celery Worker under the role contributor. Or consider the transformation JoinEnrichment, identified as OUTP-0001, which reads from the input dataset windowed telemetry buffer (INPU-0001) as observer and writes to the output dataset aggregated metrics store (OUTP-0003) as reviewer. Every such relationship can be decomposed into these four components, and every lineage query, access-control check, or impact analysis reduces to traversing edges defined by subject, target, and role, anchored by identifiers.

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

**t_transformation_min_one_input__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0006 | INPU-0005 | observer |
| INPU-0002 | INPU-0004 | INPU-0001 | observer |
| INPU-0003 | INPU-0003 | INPU-0002 | observer |
| INPU-0004 | INPU-0001 | INPU-0004 | observer |
| INPU-0005 | INPU-0006 | INPU-0003 | reviewer |
| INPU-0006 | INPU-0003 | INPU-0001 | contributor |
| INPU-0007 | INPU-0005 | INPU-0005 | contributor |
| INPU-0008 | INPU-0003 | INPU-0005 | contributor |