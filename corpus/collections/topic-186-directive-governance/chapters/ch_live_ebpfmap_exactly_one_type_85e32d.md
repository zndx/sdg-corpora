---
chapter_id: ch_live_ebpfmap_exactly_one_type_85e32d
topic_id: 186
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_exactly_one_type', 'allocation_subclass', 'functional_dependency_rhs']
model: engine-refine
---

An identifier is a stable, opaque key that anchors an entity within a relational structure, enabling unambiguous reference regardless of how the entity's descriptive attributes change over time. In the eBPF map catalog, identifiers such as TYPE-0001 through TYPE-0004 serve as the primary keys for both the map name table and the map type table, allowing the system to distinguish cgroup_sock_map from tcp_conn_map or perf_event_array without relying on string matching. Similarly, allocation identifiers like ALLO-0001 through ALLO-0004 uniquely tag resources such as nightly-ingest and etl-daily-load, while RHS-0001 through RHS-0004 identify functional dependencies ranging from data ingestion pipeline to access control evaluator. The identifier's purpose is purely referential — it is the handle by which the system locates, joins, and constrains records, and it carries no semantic weight beyond its own uniqueness.

**t_ebpfmap_exactly_one_type**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | cgroup_sock_map |
| TYPE-0002 | tcp_conn_map |
| TYPE-0003 | perf_event_array |
| TYPE-0004 | dns_query_cache |
| TYPE-0005 | tcp_conn_map |
| TYPE-0006 | skb_drop_reason_map |
| TYPE-0007 | skb_drop_reason_map |

**t_ebpfmap_exactly_one_type_map_type**

| id | map_type |
| --- | --- |
| TYPE-0001 | queue |
| TYPE-0002 | devmap |
| TYPE-0003 | hash |
| TYPE-0004 | ringbuf |
| TYPE-0005 | queue |
| TYPE-0006 | cgroup_storage |
| TYPE-0007 | lru_hash |
| TYPE-0008 | cpumap |

The subject and target distinguish the two ends of a binary relationship, with the subject occupying the active or originating position and the target representing the entity being related to. In the eBPF map type association table, the column ebpfmap_id designates the subject — the map whose type is being classified — while map_type_id designates the target — the classification itself, whether queue, devmap, hash, or ringbuf. The same directional logic applies in the allocation-subclass relationship, where allocation_id (the subject) points to executes_transformation_id (the target), establishing that nightly-ingest is associated with Celery Worker and batch-prod-main with TensorFlow Serving. In the functional dependency model, functional_id serves as the subject linking to f_d_right_hand_side_id as the target, connecting services like telemetry aggregation service to outcomes such as enriched sensor reading. This subject-target distinction is not merely syntactic; it encodes the direction of the relationship and determines how queries traverse the graph.

**t_ebpfmap_exactly_one_type__map_type**

| id | ebpfmap_id | map_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0007 | observer |
| TYPE-0002 | TYPE-0002 | TYPE-0005 | owner |
| TYPE-0003 | TYPE-0002 | TYPE-0001 | contributor |
| TYPE-0004 | TYPE-0001 | TYPE-0005 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0008 | reviewer |
| TYPE-0006 | TYPE-0006 | TYPE-0005 | contributor |
| TYPE-0007 | TYPE-0007 | TYPE-0001 | observer |
| TYPE-0008 | TYPE-0005 | TYPE-0005 | contributor |

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

**t_functional_dependency_rhs_f_d_right_hand_side**

| id | f_d_right_hand_side |
| --- | --- |
| RHS-0001 | aggregated event count |
| RHS-0002 | sanitized email address |
| RHS-0003 | partition key value |
| RHS-0004 | enriched sensor reading |
| RHS-0005 | derived priority level |
| RHS-0006 | computed latency metric |
| RHS-0007 | computed latency metric |

The role column captures the nature of the relationship between subject and target, providing semantic context that a bare foreign key cannot convey on its own. Within the eBPF map type associations, a single map may assume different roles across its type relationships — observer, owner, contributor, or reviewer — each implying a distinct operational posture toward the target type. The allocation-subclass relationship table uses the same role vocabulary: nightly-ingest acts as a contributor to Celery Worker, while batch-prod-main assumes the observer role toward TensorFlow Serving. In the functional dependency model, the role distribution skews heavily toward owner, with three of four relationships assigning that designation, suggesting that a data ingestion pipeline or encryption transformation typically owns its right-hand side outputs such as aggregated event count or sanitized email address. The role is the interpretive layer that transforms a structural link into a business-meaningful association.

**t_functional_dependency_rhs__f_d_right_hand_side**

| id | functional_id | f_d_right_hand_side_id | role |
| --- | --- | --- | --- |
| RHS-0001 | RHS-0003 | RHS-0007 | contributor |
| RHS-0002 | RHS-0004 | RHS-0001 | owner |
| RHS-0003 | RHS-0002 | RHS-0005 | owner |
| RHS-0004 | RHS-0003 | RHS-0006 | owner |
| RHS-0005 | RHS-0003 | RHS-0001 | owner |
| RHS-0006 | RHS-0001 | RHS-0005 | owner |
| RHS-0007 | RHS-0001 | RHS-0006 | contributor |
| RHS-0008 | RHS-0002 | RHS-0001 | contributor |

This four-element pattern — identifier, subject, target, role — forms the backbone of many enterprise data models, particularly those that must express many-to-many relationships with additional context. Rather than collapsing a relationship into a simple foreign key pair, the model introduces a dedicated junction table that carries its own identifier and a role attribute, allowing the same subject-target pair to be reinterpreted under different roles without data duplication. The eBPF map catalog, the allocation-subclass execution graph, and the functional dependency model all follow this identical structural template, demonstrating that the pattern is domain-agnostic and reusable across infrastructure, data engineering, and security contexts.

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

**t_functional_dependency_rhs**

| id | functional |
| --- | --- |
| RHS-0001 | data ingestion pipeline |
| RHS-0002 | encryption transformation |
| RHS-0003 | telemetry aggregation service |
| RHS-0004 | access control evaluator |
| RHS-0005 | telemetry aggregation service |
| RHS-0006 | schema validation routine |