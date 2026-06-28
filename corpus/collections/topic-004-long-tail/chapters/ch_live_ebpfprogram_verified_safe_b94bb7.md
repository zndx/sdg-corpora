---
chapter_id: ch_live_ebpfprogram_verified_safe_b94bb7
topic_id: 4
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_verified_safe', 'process_with_min_one_artifact', 'ebpfmap_exactly_one_type']
model: engine-refine
---

The foundational unit of any structured dataset is the identifier, a stable, human-readable token that anchors every record to a unique position within the schema. Identifiers such as SAFE-0001, ARTI-0001, and TYPE-0001 serve as the primary keys across all tables, providing the immutable reference point by which entities are located, related, and queried. An entity is the thing being described—whether an eBPF program like sock_ops_connect or cgroup_sock_map, a process such as Schema migration job or Batch ingestion run, or a map type like dns_query_cache and tcp_conn_map. Each entity is first declared in its own nominal table, where the identifier and a descriptive name column establish its existence, and from there it becomes a referent for every foreign-key relationship and attribute binding that follows.

**t_process_with_min_one_artifact**

| id | process |
| --- | --- |
| ARTI-0001 | Schema migration job |
| ARTI-0002 | Data quality validation |
| ARTI-0003 | Provenance capture run |
| ARTI-0004 | Batch ingestion run |
| ARTI-0005 | Stream processing cycle |
| ARTI-0006 | Metadata extraction run |
| ARTI-0007 | Model retraining pass |

**t_process_with_min_one_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | duration_seconds | xsd:decimal |
| ARTI-0002 | end_time | xsd:dateTime |
| ARTI-0003 | exit_code | xsd:integer |
| ARTI-0004 | host_name | xsd:string |
| ARTI-0005 | log_level | xsd:string |
| ARTI-0006 | phase | xsd:string |
| ARTI-0007 | retry_count | xsd:integer |
| ARTI-0008 | scheduled_at | xsd:dateTime |

**t_process_with_min_one_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2025-04-14T02:53:50 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 2024-05-27T05:53:32 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | 2023-10-14T03:08:29 |
| ARTI-0004 | ARTI-0002 | ARTI-0002 | 2024-12-11T09:34:24 |
| ARTI-0005 | ARTI-0002 | ARTI-0008 | 2025-03-21T21:19:18 |
| ARTI-0006 | ARTI-0002 | ARTI-0009 | 2023-01-02T13:07:40 |
| ARTI-0007 | ARTI-0003 | ARTI-0002 | 2024-10-24T03:35:48 |
| ARTI-0008 | ARTI-0003 | ARTI-0008 | 2023-04-04T03:39:03 |

**t_process_with_min_one_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 148.27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 6895.59 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 3687.07 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 1136.57 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 4210.38 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 5529.13 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 4109.43 |

**t_process_with_min_one_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | 973 |
| ARTI-0002 | ARTI-0001 | ARTI-0007 | 28 |
| ARTI-0003 | ARTI-0002 | ARTI-0003 | 750 |
| ARTI-0004 | ARTI-0002 | ARTI-0007 | 47 |
| ARTI-0005 | ARTI-0003 | ARTI-0003 | 118 |
| ARTI-0006 | ARTI-0003 | ARTI-0007 | 269 |
| ARTI-0007 | ARTI-0004 | ARTI-0003 | 506 |
| ARTI-0008 | ARTI-0004 | ARTI-0007 | 132 |

**t_process_with_min_one_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | node-a01 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | Log Level 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0006 | initiation |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | failed |
| ARTI-0005 | ARTI-0001 | ARTI-0011 | Triggered By 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0004 | edge-03 |
| ARTI-0007 | ARTI-0002 | ARTI-0005 | Log Level 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0006 | execution |

Attributes and their types form the descriptive layer that gives entities measurable or categorical properties. An attribute is a named dimension of an entity, such as duration_seconds, end_time, exit_code, or host_name, each of which is itself a first-class entity with a corresponding attr_type that constrains the shape of permissible values. The type system is explicit and machine-readable: xsd:decimal for numeric quantities, xsd:dateTime for temporal markers, xsd:integer for whole-number counts, and xsd:string for free-form text. This separation of attribute definition from attribute value is deliberate—it allows the schema to evolve independently of the data, and it ensures that every value stored in a value table can be validated against a known type contract before it is ever consumed by downstream logic.

Values, stored under the misc column across four distinct value tables, are the actual data points that populate the attribute slots. A single entity may carry multiple attribute values of different types: the entity ARTI-0001, for instance, has a duration_seconds value of 148.27 in the decimal table, an end_time of 2025-04-14T02:53:50 in the datetime table, an exit_code of 973 in the integer table, and a host_name of node-a01 in the varchar table. The value tables are linked back to their attribute definitions via the attr_id foreign key and to their owning entities via the entity_id foreign key, creating a normalized, entity-attribute-value pattern that avoids wide, sparse tables while preserving type safety through the four separate value tables.

Relationships between entities are expressed through subject–target pairs annotated with a role, a design that makes the semantics of every connection explicit and queryable. In the relationship table t_ebpfprogram_verified_safe__verified_safe_by, the ebpfprogram_id column is the subject, the verified_safe_by_id column is the target, and the role column carries values such as contributor, reviewer, or owner. The same pattern appears in t_ebpfmap_exactly_one_type__map_type, where ebpfmap_id is the subject, map_type_id is the target, and roles include observer, owner, contributor, and reviewer. A single subject may relate to multiple targets—SAFE-0004, for example, appears as the ebpfprogram_id in two rows with different verified_safe_by_id values and different roles—and a single target may be the recipient of relationships from multiple subjects, making the role column the critical disambiguator that tells you not just who is connected to whom, but in what capacity.

**t_ebpfprogram_verified_safe**

| id | ebpfprogram |
| --- | --- |
| SAFE-0001 | sock_ops_connect |
| SAFE-0002 | cgroup_sock_map |
| SAFE-0003 | kprobe_do_sys_open |
| SAFE-0004 | tc_police_ingress |
| SAFE-0005 | netfilter_hook |
| SAFE-0006 | xdp_prog_map |

**t_ebpfprogram_verified_safe_verified_safe_by**

| id | verified_safe_by |
| --- | --- |
| SAFE-0001 | libbpf |
| SAFE-0002 | Kani_bpf |
| SAFE-0003 | Z3_solver |
| SAFE-0004 | Kani_bpf |
| SAFE-0005 | veristat |
| SAFE-0006 | FramaC_bpf |

**t_ebpfprogram_verified_safe__verified_safe_by**

| id | ebpfprogram_id | verified_safe_by_id | role |
| --- | --- | --- | --- |
| SAFE-0001 | SAFE-0004 | SAFE-0002 | contributor |
| SAFE-0002 | SAFE-0004 | SAFE-0004 | reviewer |
| SAFE-0003 | SAFE-0003 | SAFE-0005 | owner |
| SAFE-0004 | SAFE-0002 | SAFE-0003 | owner |
| SAFE-0005 | SAFE-0001 | SAFE-0003 | contributor |
| SAFE-0006 | SAFE-0003 | SAFE-0006 | contributor |
| SAFE-0007 | SAFE-0001 | SAFE-0005 | owner |
| SAFE-0008 | SAFE-0001 | SAFE-0002 | owner |

**t_ebpfmap_exactly_one_type**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | dns_query_cache |
| TYPE-0002 | task_storage |
| TYPE-0003 | perf_event_trace |
| TYPE-0004 | tcp_conn_map |
| TYPE-0005 | cgroup_sock_map |
| TYPE-0006 | netfilter_hook |
| TYPE-0007 | tc_police_ingress |

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