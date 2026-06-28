---
chapter_id: ch_live_allocation_subclass_6e0f76
topic_id: 183
family: 05_provo_lineage
cited_terms: ['allocation_subclass', 'dataset_snapshot_subclass', 'perf_buffer_map_subclass']
model: engine-refine
---

Every operational entity is anchored by a unique identifier—such as `MAP-0001` or `ALLO-0001`—which serves as the immutable primary key for tracking resources across the system. To maintain flexibility without sacrificing data integrity, attributes are decoupled from the core entity definition. An attribute, such as `checksum`, `created_date`, or `license`, is formally typed to ensure validation; for instance, `created_date` is enforced as an `xsd:date`, while `identifier` attributes utilize the `cco:DesignativeICE` type. This schema-on-read approach allows the system to accommodate diverse metadata requirements, ranging from structural checksums like `a3f9c21e` to licensing terms such as `CC-BY-4.0`, without rigidly altering the underlying data model.

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

The actual values for these attributes are persisted in type-specific repositories, linked back to the originating entity and attribute definition. For example, a `created_date` value of `2023-01-21` is stored in a dedicated date repository, while an integer metric like `60` or a string value like `gid://svc/77` resides in its respective storage table. This separation ensures that complex, multi-faceted entities—such as a performance buffer map configured with `cassandra-perf` and `tracepoint-raw`—can carry an arbitrary number of properties without bloating the primary record. The system resolves these values by joining the entity identifier with the attribute identifier, reconstructing a complete profile of the resource at query time.

**t_perf_buffer_map_subclass**

| id | perf | perf_buffer_config |
| --- | --- | --- |
| MAP-0001 | cassandra-perf | tracepoint-raw |
| MAP-0002 | netperf-tcp | kprobe-struct |
| MAP-0003 | iperf3-stream | tracepoint-raw |
| MAP-0004 | tpch-10gb | commit-atomic |
| MAP-0005 | spec-jbb2015 | flush-threshold-256 |
| MAP-0006 | pgbench-default | kprobe-struct |
| MAP-0007 | spark-stress | polling-sync |

**t_perf_buffer_map_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MAP-0001 | checksum | xsd:string |
| MAP-0002 | created_date | xsd:date |
| MAP-0003 | identifier | cco:DesignativeICE |
| MAP-0004 | license | xsd:string |
| MAP-0005 | mime_type | xsd:string |
| MAP-0006 | size_bytes | xsd:long |
| MAP-0007 | uri | xsd:string |
| MAP-0008 | version | xsd:integer |

**t_perf_buffer_map_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0002 | 2023-01-21 |
| MAP-0002 | MAP-0002 | MAP-0002 | 2023-09-17 |
| MAP-0003 | MAP-0003 | MAP-0002 | 2023-07-22 |
| MAP-0004 | MAP-0004 | MAP-0002 | 2024-09-18 |
| MAP-0005 | MAP-0005 | MAP-0002 | 2025-02-25 |
| MAP-0006 | MAP-0006 | MAP-0002 | 2024-02-08 |
| MAP-0007 | MAP-0007 | MAP-0002 | 2024-05-18 |

**t_perf_buffer_map_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | 60 |
| MAP-0002 | MAP-0001 | MAP-0008 | 11 |
| MAP-0003 | MAP-0002 | MAP-0006 | 123 |
| MAP-0004 | MAP-0002 | MAP-0008 | 12 |
| MAP-0005 | MAP-0003 | MAP-0006 | 190 |
| MAP-0006 | MAP-0003 | MAP-0008 | 10 |
| MAP-0007 | MAP-0004 | MAP-0006 | 100 |
| MAP-0008 | MAP-0004 | MAP-0008 | 1 |

**t_perf_buffer_map_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0001 | a3f9c21e |
| MAP-0002 | MAP-0001 | MAP-0003 | gid://svc/77 |
| MAP-0003 | MAP-0001 | MAP-0004 | CC-BY-4.0 |
| MAP-0004 | MAP-0001 | MAP-0009 | ap-south-2 |
| MAP-0005 | MAP-0001 | MAP-0005 | application/xml |
| MAP-0006 | MAP-0001 | MAP-0010 | Name 06 |
| MAP-0007 | MAP-0001 | MAP-0011 | governance |
| MAP-0008 | MAP-0001 | MAP-0012 | Tags 08 |

In the context of data governance, the system rigorously tracks the lineage and state of datasets through a snapshotting mechanism. Each recorded dataset instance is assigned a `version` number—ranging from minor iterations like `2` to major releases like `10`—and a precise `size_bytes` metric, such as `350697080` bytes, to monitor storage consumption and growth. Crucially, every snapshot is explicitly linked to a parent dataset via a `snapshot_of` relationship, establishing a clear audit trail. This allows operators to trace a specific data artifact back to its source category, ensuring that data consumption aligns with the intended `Snapshot Of Category 01` or `Snapshot Of Category 04` classifications.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

Operational workflows are governed by a role-based mapping system that defines how resources interact. An allocation, such as `nightly-ingest` or `batch-prod-main`, acts as the subject that executes a specific transformation, such as a `Celery Worker` or `Flink TaskManager`. The relationship between the subject and the target transformation is mediated by a defined `role`, which dictates the nature of the interaction. For instance, an allocation might act as an `owner` with full control, a `contributor` with modification rights, or an `observer` with read-only access. This granular assignment of roles ensures that critical infrastructure components, like a `TensorFlow Serving` instance or a `dbt Runner`, are invoked with the appropriate permissions and resource constraints.

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