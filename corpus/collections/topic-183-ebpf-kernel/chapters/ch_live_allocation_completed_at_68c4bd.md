---
chapter_id: ch_live_allocation_completed_at_68c4bd
topic_id: 183
family: 05_provo_lineage
cited_terms: ['allocation_completed_at', 'allocation_exactly_one_run_id', 'allocation_subclass']
model: engine-refine
---

In resource allocation and execution tracking systems, the relationships between entities are not simple associations but structured triples composed of a subject, a role, and a target. The subject is the entity initiating or holding the relationship—the allocation being tracked, such as `ml-train-canary`, `k8s-pod-quota`, or `sensor-fusion-job`. The target is the entity to which the subject is connected, whether that is a completion timestamp like `2023-10-25T22:48:55Z`, a run identifier such as `proc-id-4421` or `session-77b`, or a transformation runtime like `Celery Worker`, `dbt Runner`, or `TensorFlow Serving`. The role mediates the nature of the connection, constraining it to a controlled vocabulary of `owner`, `contributor`, or `observer`. This subject-role-target pattern replaces monolithic relationship columns with a flexible, queryable structure that captures not just which entities are related, but how they are related.

**t_allocation_completed_at**

| id | allocation |
| --- | --- |
| COMP-0001 | ml-train-canary |
| COMP-0002 | k8s-pod-quota |
| COMP-0003 | ml-train-canary |
| COMP-0004 | etl-sync-west |
| COMP-0005 | nightly-ingest |
| COMP-0006 | data-lake-refresh |

**t_allocation_completed_at_completed_at**

| id | completed_at |
| --- | --- |
| COMP-0001 | 2023-10-25T22:48:55Z |
| COMP-0002 | 2024-06-30T15:05:33Z |
| COMP-0003 | 2024-04-12T09:11:08Z |
| COMP-0004 | 2023-10-25T22:48:55Z |
| COMP-0005 | 2023-08-09T19:33:47Z |
| COMP-0006 | 2023-08-09T19:33:47Z |

**t_allocation_completed_at__completed_at**

| id | allocation_id | completed_at_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0005 | COMP-0003 | observer |
| COMP-0002 | COMP-0006 | COMP-0003 | observer |
| COMP-0003 | COMP-0002 | COMP-0005 | owner |
| COMP-0004 | COMP-0001 | COMP-0002 | contributor |
| COMP-0005 | COMP-0004 | COMP-0004 | owner |
| COMP-0006 | COMP-0001 | COMP-0005 | owner |
| COMP-0007 | COMP-0003 | COMP-0003 | reviewer |
| COMP-0008 | COMP-0004 | COMP-0006 | observer |

**t_allocation_exactly_one_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | lab-sample-queue |
| RUN-0002 | nightly-ingest |
| RUN-0003 | index-build-v2 |
| RUN-0004 | cdn-edge-cache-b |
| RUN-0005 | sensor-fusion-job |
| RUN-0006 | data-lake-partition |

**t_allocation_exactly_one_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | proc-id-4421 |
| RUN-0002 | session-77b |
| RUN-0003 | job-handle-11d |
| RUN-0004 | run-88f3a1 |
| RUN-0005 | run-tag-alpha |
| RUN-0006 | batch-snapshot-5e |
| RUN-0007 | pipeline-run-44f |
| RUN-0008 | task-uuid-003 |

**t_allocation_exactly_one_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0002 | RUN-0006 | contributor |
| RUN-0002 | RUN-0004 | RUN-0002 | contributor |
| RUN-0003 | RUN-0003 | RUN-0003 | observer |
| RUN-0004 | RUN-0005 | RUN-0002 | owner |
| RUN-0005 | RUN-0001 | RUN-0007 | contributor |
| RUN-0006 | RUN-0003 | RUN-0007 | observer |
| RUN-0007 | RUN-0004 | RUN-0007 | owner |
| RUN-0008 | RUN-0003 | RUN-0003 | contributor |

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | sensor-fusion-job |
| ALLO-0002 | query-opt-run |
| ALLO-0003 | data-freshness-check |
| ALLO-0004 | gpu-cluster-east |
| ALLO-0005 | storage-tier-archival |
| ALLO-0006 | nightly-ingest |

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

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

Each entity in the system carries a stable identifier that serves as the anchor for all relationships. Allocation entities are identified by keys such as `COMP-0001` through `COMP-0004`, `RUN-0001` through `RUN-0004`, and `ALLO-0001` through `ALLO-0004`, depending on the relationship domain. Completion timestamps are independently identified within their own namespace, as are run identifiers like `proc-id-4421`, `job-handle-11d`, and `run-88f3a1`, and transformation runtimes such as `Flink TaskManager` and `GPU Cluster East`. The separation of entity identifiers from relationship keys ensures that the same target can participate in multiple relationships without ambiguity, and that entity identity remains stable regardless of how many connections it accumulates.

The junction tables that encode these triples are where the data model earns its complexity. In the completion-tracking domain, an allocation such as `COMP-0002` (holding the allocation `k8s-pod-quota`) is linked to a completion timestamp `COMP-0003` through a relationship record that assigns the role `owner`, while a separate relationship record connects `COMP-0001` (`ml-train-canary`) to `COMP-0002` with the role `contributor`. In the run-identifier domain, `RUN-0002` (`nightly-ingest`) connects to `RUN-0002` (the identifier `session-77b`) as a `contributor`, and `RUN-0004` (`cdn-edge-cache-b`) connects to `RUN-0002` as an `owner`. In the transformation domain, `ALLO-0002` (`query-opt-run`) connects to `ALLO-0005` (`dbt Runner`) as an `owner`, while `ALLO-0004` (`gpu-cluster-east`) connects to `ALLO-0006` (`Flink TaskManager`) as an `observer`. Each relationship record carries its own identifier—`ALLO-0001`, `RUN-0003`, `COMP-0004`—allowing relationships themselves to be referenced, audited, and versioned independently of the entities they connect.

This three-part structure has practical consequences for governance and operational clarity. The role column is not decorative; it encodes accountability. An `owner` role on a relationship between an allocation and its completion timestamp signals that the allocation is responsible for producing that completion record. A `contributor` role on a relationship between an allocation and a run identifier indicates that the allocation participates in or depends on that run, but does not own it. An `observer` role on a relationship between an allocation and a transformation runtime signals awareness or monitoring without direct responsibility. When querying which allocations are responsible for completing `2024-06-30T15:05:33Z`, or which run identifiers are owned by the `nightly-ingest` allocation, or which transformation runtimes are observed by `gpu-cluster-east`, the answer is always found by joining through the junction table and filtering on the role column.

The same pattern repeats across different relationship domains—completion tracking, run identification, and transformation assignment—demonstrating that the subject-role-target model is a reusable architectural primitive rather than a domain-specific detail. Whether the target is a point in time, a process handle, or a software runtime, the relationship structure remains identical: a subject identifier, a target identifier, and a role. This uniformity simplifies both the data model and the queries that operate on it. It also means that extending the system to new relationship types requires no schema changes; new entity types simply need their own identifier namespaces and their own junction tables following the same convention. The identifiers, roles, subjects, and targets together form a consistent vocabulary for describing how resources, processes, and systems relate to one another.