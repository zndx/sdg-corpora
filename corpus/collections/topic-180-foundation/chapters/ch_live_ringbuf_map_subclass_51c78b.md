---
chapter_id: ch_live_ringbuf_map_subclass_51c78b
topic_id: 180
family: 07_long_tail
cited_terms: ['ringbuf_map_subclass', 'artifact_not_revoked', 'allocation_completed_at']
model: engine-refine
---

The architecture of attribute-value binding rests on a tripartite distinction between the attribute definition itself, the type that constrains its representation, and the entity to which a concrete value attaches. An attribute such as `checksum` or `created_date` is declared independently of any particular instance; its permissible form is governed by a type annotation drawn from a schema vocabulary—`xsd:string` for a checksum like `c0ffee42`, `xsd:date` for a creation timestamp such as `2024-01-18`, or `cco:DesignativeICE` for an identifier reference. This separation of declaration from instantiation permits a single attribute definition to be reused across many entities without redundancy. The entity, identified by a stable key such as `REVO-0001` or `REVO-0002`, serves as the anchor point to which values are affixed through a foreign-key linkage: the `entity_id` column in each value table points back to the entity, while the `attr_id` column resolves to the corresponding attribute definition. In practice, entity `REVO-0001` carries a checksum value of `c0ffee42` stored in the varchar value table, a license value of `Apache-2.0` in the same table, and a `created_date` of `2024-01-18` in the date value table—all referencing the same entity but resolved through distinct type-specialized value stores.

The value tables themselves are partitioned by type, a design choice that enforces schema discipline at query time. Date values reside in `t_artifact_not_revoked_val_date` with entries ranging from `2023-01-26` to `2024-08-03`; integer values occupy `t_artifact_not_revoked_val_int` with magnitudes such as `140` and `115`; and free-form strings are held in `t_artifact_not_revoked_val_varchar`, where values include identifiers like `ref-8842` and resource tags such as `rack-7`. Each value row carries both an `entity_id` and an `attr_id`, forming a composite foreign key that binds a specific attribute to a specific entity at a specific value. This structure means that the attribute `created_date`—defined once with type `xsd:date`—can be evaluated against multiple entities, each contributing its own date: `2023-09-26` for `REVO-0002`, `2023-01-26` for `REVO-0003`, and `2024-08-03` for `REVO-0004`. The type separation is not merely organizational; it prevents type confusion at the storage layer and allows each value table to be optimized for its domain.

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

**t_artifact_not_revoked_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REVO-0001 | checksum | xsd:string |
| REVO-0002 | created_date | xsd:date |
| REVO-0003 | identifier | cco:DesignativeICE |
| REVO-0004 | license | xsd:string |
| REVO-0005 | mime_type | xsd:string |
| REVO-0006 | size_bytes | xsd:long |
| REVO-0007 | uri | xsd:string |
| REVO-0008 | version | xsd:integer |

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

**t_artifact_not_revoked_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0006 | 140 |
| REVO-0002 | REVO-0001 | REVO-0008 | 2 |
| REVO-0003 | REVO-0002 | REVO-0006 | 115 |
| REVO-0004 | REVO-0002 | REVO-0008 | 2 |
| REVO-0005 | REVO-0003 | REVO-0006 | 293 |
| REVO-0006 | REVO-0003 | REVO-0008 | 12 |
| REVO-0007 | REVO-0004 | REVO-0006 | 361 |
| REVO-0008 | REVO-0004 | REVO-0008 | 1 |

**t_artifact_not_revoked_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0001 | c0ffee42 |
| REVO-0002 | REVO-0001 | REVO-0003 | ref-8842 |
| REVO-0003 | REVO-0001 | REVO-0004 | Apache-2.0 |
| REVO-0004 | REVO-0001 | REVO-0009 | rack-7 |
| REVO-0005 | REVO-0001 | REVO-0005 | text/plain |
| REVO-0006 | REVO-0001 | REVO-0010 | Name 06 |
| REVO-0007 | REVO-0001 | REVO-0011 | analytics |
| REVO-0008 | REVO-0001 | REVO-0012 | Tags 08 |

Beyond the attribute-value axis, the data model introduces a subject-target-role pattern for expressing relationships between entities. In the ring buffer subsystem, a ring buffer such as `metrics capture ring` (identified as `MAP-0001`) is linked to a configuration such as `sync mode spec` (identified as `MAP-0006`) through a junction table that assigns a role to the relationship. The role—`observer`, `reviewer`, `contributor`, or `owner`—qualifies the nature of the association rather than merely asserting its existence. For instance, the ring buffer `MAP-0001` is associated with configuration `MAP-0006` under the role `observer`, while the same ring buffer is linked to configuration `MAP-0007` under the role `owner`. This triad of subject (the ring buffer), target (the configuration), and role (the relationship qualifier) generalizes beyond ring buffers: the same pattern appears in the allocation subsystem, where an allocation such as `data-lake-partition` (`COMP-0001`) is connected to a completion timestamp (`2023-10-25T22:48:55Z`) with the role `contributor`, and another allocation (`COMP-0002`, also `data-lake-partition`) is linked to a different timestamp (`2024-04-12T09:11:08Z`) under the role `owner`.

**t_ringbuf_map_subclass__ring_buffer_config**

| id | ringbuf_id | ring_buffer_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | observer |
| MAP-0002 | MAP-0003 | MAP-0004 | reviewer |
| MAP-0003 | MAP-0005 | MAP-0004 | contributor |
| MAP-0004 | MAP-0001 | MAP-0007 | owner |
| MAP-0005 | MAP-0002 | MAP-0006 | contributor |
| MAP-0006 | MAP-0006 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0002 | owner |
| MAP-0008 | MAP-0002 | MAP-0003 | owner |

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

The identifiers used throughout the model follow a consistent naming convention that encodes both the entity class and a sequential number. Ring buffer subclasses carry identifiers prefixed with `MAP-` (e.g., `MAP-0001` through `MAP-0004`), artifact records use `REVO-` (e.g., `REVO-0001` through `REVO-0004`), and allocation records use `COMP-` (e.g., `COMP-0001` through `COMP-0004`). This convention supports disambiguation at the application layer without requiring a single monolithic identity namespace. The identifiers serve as the primary keys for their respective entity tables and as foreign keys in the value and junction tables, creating a web of referential integrity that can be traversed in either direction. An artifact such as `audit-log-sept` (entity `REVO-0001`) can be located by its name, and from there all associated attributes and values can be resolved through the foreign-key chains.

**t_ringbuf_map_subclass**

| id | ringbuf |
| --- | --- |
| MAP-0001 | metrics capture ring |
| MAP-0002 | diagnostic trace buffer |
| MAP-0003 | audit log ring |
| MAP-0004 | sensor stream buffer |
| MAP-0005 | diagnostic trace buffer |
| MAP-0006 | event queue ring |
| MAP-0007 | telemetry fifo ring |

**t_ringbuf_map_subclass_ring_buffer_config**

| id | ring_buffer_config |
| --- | --- |
| MAP-0001 | sync mode spec |
| MAP-0002 | sync mode spec |
| MAP-0003 | compression profile |
| MAP-0004 | buffer depth spec |
| MAP-0005 | compression profile |
| MAP-0006 | sample rate config |
| MAP-0007 | overflow handling spec |
| MAP-0008 | compression profile |

**t_allocation_completed_at**

| id | allocation |
| --- | --- |
| COMP-0001 | data-lake-partition |
| COMP-0002 | storage-tier-archival |
| COMP-0003 | data-lake-partition |
| COMP-0004 | k8s-pod-quota |
| COMP-0005 | telemetry-ingest-pipe |
| COMP-0006 | k8s-pod-quota |

**t_allocation_completed_at_completed_at**

| id | completed_at |
| --- | --- |
| COMP-0001 | 2023-10-25T22:48:55Z |
| COMP-0002 | 2024-06-30T15:05:33Z |
| COMP-0003 | 2024-04-12T09:11:08Z |
| COMP-0004 | 2023-10-25T22:48:55Z |
| COMP-0005 | 2023-08-09T19:33:47Z |
| COMP-0006 | 2023-08-09T19:33:47Z |

The misc values—free-form strings stored in the varchar value table—illustrate how the model accommodates unstructured metadata alongside typed attributes. Values such as `c0ffee42` (a checksum), `ref-8842` (a reference identifier), `Apache-2.0` (a license designation), and `rack-7` (a physical location tag) are all stored in the same table but are distinguished by the `attr_id` they reference. This design allows the system to treat structured and semi-structured data uniformly at the storage layer while preserving type discipline through the attribute definition table. The attribute `license`, for example, is declared with type `xsd:string` and is associated with entity `REVO-0001` carrying the value `Apache-2.0`; the same attribute could, in principle, be associated with other entities carrying different license strings, all without modifying the schema.