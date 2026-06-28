---
chapter_id: ch_live_two_disjoint_artifacts_a13638
topic_id: 24
family: 01_foundation
cited_terms: ['two_disjoint_artifacts', 'agent_at_organization', 'ebpfmap_equiv_kv_typed']
model: engine-refine
---

The artifact registry is organized around a core entity table that records discrete technical components—each identified by a code such as `ARTI-0001` through `ARTI-0004`—and classified by a pair of categorical dimensions: a functional category like `etl-job`, `config-bundle`, or `data-pipeline-v4`, and a subordinate component type such as `data-lake`, `traffic-router`, `access-policy`, or `service-discovery`. This two-axis classification enables fine-grained inventorying without requiring a single monolithic type column, and it supports the kind of disjoint-type modeling where an artifact belongs to one category in each dimension independently. The identifier column serves as the primary key, anchoring every subsequent attribute and relationship record to a single, stable entity reference.

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

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

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

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

Attribute metadata is decoupled from the artifact body into a dedicated definition table that pairs each attribute name—`checksum`, `created_date`, `identifier`, `license`—with its semantic type, drawn from a schema vocabulary including `xsd:string`, `xsd:date`, and `cco:DesignativeICE`. This separation of attribute schema from attribute values mirrors a classic entity-attribute-value pattern, but the implementation distributes values across three type-specialized tables rather than a single generic value column. Date attributes such as `created_date` are stored in a dedicated value table where each row links an `entity_id` to an `attr_id` and carries a date value like `2023-05-13`, `2024-02-28`, `2024-03-29`, or `2023-09-19`. Integer-valued attributes—recorded with values such as `36`, `5`, `462`, and `3`—reside in a parallel typed table keyed by the same `entity_id` and `attr_id` pair, while string-valued attributes—including checksums like `9d2b7a16`, URNs such as `urn:uuid:9f2a`, license identifiers like `MPL-2.0`, and region codes like `ap-south-2`—are held in a third varchar-specialized table. The tripartite value store ensures type safety at the storage layer while preserving the flexibility of an extensible attribute model.

**t_ebpfmap_equiv_kv_typed**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | interface_stats |
| TYPE-0002 | rate_limit |
| TYPE-0003 | rate_limit |
| TYPE-0004 | socket_stats |
| TYPE-0005 | interface_stats |
| TYPE-0006 | interface_stats |
| TYPE-0007 | rate_limit |
| TYPE-0008 | rate_limit |

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
| TYPE-0001 | dev_entry |
| TYPE-0002 | task_struct |
| TYPE-0003 | flow_key |
| TYPE-0004 | perf_event |
| TYPE-0005 | stack_trace |
| TYPE-0006 | perf_event |
| TYPE-0007 | stack_trace |

Ownership and provenance are tracked through a separate agent-to-organization mapping table that records which operational agent—`backup-scheduler`, `cert-manager`, or `risk-assessor`—is assigned to which organizational unit, such as `data-governance`, `security-ops`, `cloud-infrastructure`, or `quality-assurance`. Each assignment carries a `created_date` timestamp (for example, `2025-01-04`, `2023-09-23`, `2024-03-21`, `2025-01-23`) and an `owner` designation—`ml-infra`, `analytics`, or `sre`—that identifies the team or system responsible for the relationship. This structure makes it possible to audit not only which agents operate within which organizational boundaries but also when those assignments were established and who holds ultimate accountability.

**t_agent_at_organization**

| id | agent | at_organization | created_date | owner |
| --- | --- | --- | --- | --- |
| ORGA-0001 | backup-scheduler | data-governance | 2025-01-04 | ml-infra |
| ORGA-0002 | cert-manager | security-ops | 2023-09-23 | analytics |
| ORGA-0003 | risk-assessor | cloud-infrastructure | 2024-03-21 | ml-infra |
| ORGA-0004 | risk-assessor | quality-assurance | 2025-01-23 | sre |
| ORGA-0005 | risk-assessor | network-operations | 2024-08-08 | analytics |
| ORGA-0006 | pipeline-runner | infrastructure-security | 2024-08-22 | platform-team |

The eBPF map type system illustrates a more intricate graph of relationships, where entities are connected through role-bearing edges that carry both a subject and a target. The base type table enumerates eBPF map kinds—`interface_stats`, `rate_limit`, `socket_stats`—each associated with a key type such as `bpf_cookie`, `uint32_t`, or `dev_index`, and a value type like `dev_entry`, `task_struct`, `flow_key`, or `perf_event`. The key-type association is mediated by a junction table that links an `ebpfmap_id` to a `key_type_id` through a `role` attribute, with values including `contributor`, `owner`, and `reviewer`. Similarly, the value-type association is captured in a second junction table that connects an `ebpfmap_id` to a `value_type_map_id` and attaches both a `role`—`contributor`, `observer`, or `owner`—and a `cardinality_note` such as `Cardinality Note 01` through `Cardinality Note 04`. These role and cardinality annotations on the relationship edges themselves, rather than on the entities, encode governance semantics: they specify not merely that a map type references a key type, but in what capacity and under what multiplicity constraints.

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