---
chapter_id: ch_live_ebpfmap_equiv_kv_typed_1a9921
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_equiv_kv_typed', 'ebpfmap_exactly_one_type', 'ebpfmap_only_one_value_type']
model: engine-refine
---

The eBPF map equivalence framework organizes kernel-level map relationships through a fact-dimension architecture where each entity is anchored by a typed identifier such as TYPE-0001 or TYPE-0004, establishing a consistent reference scheme across all tables. The central fact table, `fact_ebpfmap`, records the quantitative and versioned attributes of each map: `size_bytes` captures the memory footprint of the underlying data structure, with values ranging from 31,105,012 bytes for a `perf_buffer` variant to 354,373,995 bytes for a `task_storage` instance, while `version` tracks the evolution of the type mapping, spanning from version 3 through version 12. The `type_map` column in this fact table functions as a foreign key pointing to the dimension table `dim_value_type_map`, which supplies both a `category` for classification and a `misc` label for human-readable identification—Value Type Map Category 01 through 04 paired with their corresponding labels.

**t_ebpfmap_equiv_kv_typed**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | connection_pool |
| TYPE-0002 | cgroup_policy |
| TYPE-0003 | tcp_conn_map |
| TYPE-0004 | perf_event_array |
| TYPE-0005 | cgroup_policy |
| TYPE-0006 | interface_stats |
| TYPE-0007 | tcp_conn_map |
| TYPE-0008 | dns_cache |

**t_ebpfmap_equiv_kv_typed_key_type**

| id | key_type |
| --- | --- |
| TYPE-0001 | bpf_cookie |
| TYPE-0002 | uint32_t |
| TYPE-0003 | uint32_t |
| TYPE-0004 | dev_index |
| TYPE-0005 | pid_t |
| TYPE-0006 | inode_key |

**t_ebpfmap_equiv_kv_typed_value_type_map**

| id | value_type_map |
| --- | --- |
| TYPE-0001 | sockmap |
| TYPE-0002 | task_struct |
| TYPE-0003 | dev_entry |
| TYPE-0004 | devmap |
| TYPE-0005 | ringbuf_entry |
| TYPE-0006 | lru_hash |
| TYPE-0007 | array |

**t_ebpfmap_exactly_one_type**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | conntrack_map |
| TYPE-0002 | sock_ops_map |
| TYPE-0003 | perf_buffer |
| TYPE-0004 | task_storage |
| TYPE-0005 | connection_pool |
| TYPE-0006 | interface_stats |
| TYPE-0007 | socket_stats |

**t_ebpfmap_exactly_one_type_map_type**

| id | map_type |
| --- | --- |
| TYPE-0001 | dev_entry |
| TYPE-0002 | lru_hash |
| TYPE-0003 | cgroup_id |
| TYPE-0004 | perf_event |
| TYPE-0005 | dev_entry |
| TYPE-0006 | stack |
| TYPE-0007 | ringbuf_entry |
| TYPE-0008 | cpumap |

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

The relational model employs junction tables to express many-to-many associations between eBPF maps and their type definitions, using `subject` and `target` columns to denote the direction of the relationship. In `t_ebpfmap_equiv_kv_typed__key_type`, for instance, the `subject` column references an eBPF map identifier such as TYPE-0007 or TYPE-0005, while the `target` column points to a key type identifier like TYPE-0001 or TYPE-0004, together encoding that a `connection_pool` map associates with a `bpf_cookie` key type and a `tcp_conn_map` map associates with a `dev_index` key type. The `t_ebpfmap_equiv_kv_typed__value_type_map` table follows the same pattern, linking maps such as TYPE-0005 to value type maps like TYPE-0002 (which corresponds to `task_struct`), and maps such as TYPE-0006 to TYPE-0001 (which corresponds to `sockmap`).

**t_ebpfmap_equiv_kv_typed__key_type**

| id | ebpfmap_id | key_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0001 | contributor |
| TYPE-0002 | TYPE-0002 | TYPE-0002 | owner |
| TYPE-0003 | TYPE-0005 | TYPE-0002 | owner |
| TYPE-0004 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0005 | reviewer |
| TYPE-0006 | TYPE-0002 | TYPE-0003 | owner |
| TYPE-0007 | TYPE-0006 | TYPE-0006 | owner |
| TYPE-0008 | TYPE-0004 | TYPE-0003 | owner |

**t_ebpfmap_equiv_kv_typed__value_type_map**

| id | ebpfmap_id | value_type_map_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | TYPE-0002 | contributor | Cardinality Note 01 |
| TYPE-0002 | TYPE-0002 | TYPE-0006 | contributor | Cardinality Note 02 |
| TYPE-0003 | TYPE-0003 | TYPE-0003 | observer | Cardinality Note 03 |
| TYPE-0004 | TYPE-0006 | TYPE-0001 | owner | Cardinality Note 04 |
| TYPE-0005 | TYPE-0007 | TYPE-0005 | owner | Cardinality Note 05 |
| TYPE-0006 | TYPE-0002 | TYPE-0002 | reviewer | Cardinality Note 06 |
| TYPE-0007 | TYPE-0005 | TYPE-0004 | observer | Cardinality Note 07 |
| TYPE-0008 | TYPE-0007 | TYPE-0001 | reviewer | Cardinality Note 08 |

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

The `role` column in each junction table assigns a governance classification to the relationship, distinguishing between contributor, owner, observer, and reviewer. A `cgroup_policy` map holds an owner role with respect to its `uint32_t` key type, while a `perf_buffer` map assumes a reviewer role with respect to its `dev_entry` map type; similarly, the `task_storage` map is classified as an observer in its relationship to the `lru_hash` map type. These role assignments provide an auditable trail of responsibility, indicating which component or process is responsible for defining, consuming, or merely referencing a given type association.

Cardinality constraints are captured explicitly in the `cardinality_note` column of the value type mapping junction table, where entries such as Cardinality Note 01 through Cardinality 04 document the multiplicity rules governing how many value type instances may be associated with a given eBPF map. This explicit notation avoids ambiguity in scenarios where a map might support one-to-one, one-to-many, or many-to-many relationships with its value types, and it complements the structural information provided by the `value_type_map` column in the `t_ebpfmap_equiv_kv_typed_value_type_map` table, which enumerates the concrete value types—`sockmap`, `task_struct`, `dev_entry`, and `devmap`—available for association.

The framework further distinguishes between maps that support exactly one type and those that support multiple equivalent key-value type combinations. The `t_ebpfmap_exactly_one_type` table enumerates maps such as `conntrack_map`, `sock_ops_map`, `perf_buffer`, and `task_storage`, each of which is constrained to a single map type drawn from the set `dev_entry`, `lru_hash`, `cgroup_id`, and `perf_event`. The junction table `t_ebpfmap_exactly_one_type__map_type` then records the specific associations—TYPE-0007 maps to TYPE-0007, TYPE-0002 maps to TYPE-0005—alongside the role classification, ensuring that even single-type maps are tracked with the same rigor as their multi-type counterparts.