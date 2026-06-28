---
chapter_id: ch_live_functional_dependency_rhs_ebf674
topic_id: 61
family: 07_long_tail
cited_terms: ['functional_dependency_rhs', 'kernelhook_basic', 'syscall_governed_by_directive']
model: engine-refine
---

The foundational architecture of the registry rests upon a disciplined separation between identity, property, and value. Every record carries an identifier—a globally scoped key such as `RHS-0001`, `KERN-0001`, or `DIRE-0001`—that anchors the entity within its domain. These identifiers are not merely labels; they serve as the connective tissue across the entire schema, appearing as foreign keys in attribute-value mappings, in relationship tables, and in cross-domain references. An entity, whether it is a kernel hook like `Tracepoint-block-io` or `BPF-co-re-syscall`, a functional dependency such as `data ingestion pipeline` or `encryption transformation`, or a governed syscall like `mmap`, `connect`, `epoll_wait`, and `listen`, is first and foremost a keyed node in a graph of properties and relationships. The entity concept is deliberately generic: it abstracts away the semantic category of the thing being described so that the same attribute-value machinery can be applied uniformly across domains as disparate as kernel instrumentation and syscall governance.

**t_functional_dependency_rhs**

| id | functional |
| --- | --- |
| RHS-0001 | data ingestion pipeline |
| RHS-0002 | encryption transformation |
| RHS-0003 | telemetry aggregation service |
| RHS-0004 | access control evaluator |
| RHS-0005 | telemetry aggregation service |
| RHS-0006 | schema validation routine |

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | Tracepoint-block-io |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | Kprobes-schedule |
| KERN-0004 | Fentry-kernel-init |
| KERN-0005 | Kprobes-schedule |
| KERN-0006 | Kretprobe-exit |

**t_syscall_governed_by_directive**

| id | syscall |
| --- | --- |
| DIRE-0001 | mmap |
| DIRE-0002 | connect |
| DIRE-0003 | epoll_wait |
| DIRE-0004 | listen |
| DIRE-0005 | socket |
| DIRE-0006 | bind |

Attributes and attribute types form the second pillar of the model. An attribute name—`checksum`, `created_date`, `identifier`, `license` on the kernel-hook side, or `effective_date`, `enforcement`, `mandatory`, `priority` on the directive side—defines a property slot that any entity may fill. The attribute type constrains the shape of the value that slot can accept: `xsd:string` for free-form text like `a3f9c21e` or `gid://svc/77`, `xsd:date` for temporal markers such as `2023-02-05`, `2024-05-21`, `2024-01-08`, `2025-01-30`, `xsd:boolean` for binary flags like `true` and `false`, `xsd:integer` for numeric measures such as `323`, `186`, `2`, `4`, `80`, `443`, and even domain-specific types like `cco:DesignativeICE` for designative identifiers. This type discipline ensures that the value layer remains homogeneous from the storage engine's perspective while preserving semantic richness at the application layer.

**t_kernelhook_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| KERN-0001 | checksum | xsd:string |
| KERN-0002 | created_date | xsd:date |
| KERN-0003 | identifier | cco:DesignativeICE |
| KERN-0004 | license | xsd:string |
| KERN-0005 | mime_type | xsd:string |
| KERN-0006 | size_bytes | xsd:long |
| KERN-0007 | uri | xsd:string |
| KERN-0008 | version | xsd:integer |

The value layer itself is partitioned by type into dedicated tables—`val_date`, `val_int`, `val_varchar`, `val_boolean`—each carrying an entity_id, an attr_id, and a value column that holds the misc data. This design avoids the null-wasteland problem of a single-column value store: an integer attribute like `323` or `186` never competes for space with a string like `Apache-2.0` or `eu-west-3`, and a date like `2023-07-14` or `2025-03-29` is never confused with a boolean like `true` or `false`. The entity_id in each value row points back to the entity that owns the attribute, and the attr_id points to the attribute definition, creating a triadic relationship that is both queryable and extensible. New attribute types can be introduced by adding a new value table; new attributes can be registered without schema migration; and entities can be enriched with arbitrary properties without altering their core identity.

**t_kernelhook_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0001 | a3f9c21e |
| KERN-0002 | KERN-0001 | KERN-0003 | gid://svc/77 |
| KERN-0003 | KERN-0001 | KERN-0004 | Apache-2.0 |
| KERN-0004 | KERN-0001 | KERN-0009 | eu-west-3 |
| KERN-0005 | KERN-0001 | KERN-0005 | text/plain |
| KERN-0006 | KERN-0001 | KERN-0010 | Name 06 |
| KERN-0007 | KERN-0001 | KERN-0011 | governance |
| KERN-0008 | KERN-0001 | KERN-0012 | Tags 08 |

Relationships between entities are captured through a subject-target-role pattern that generalizes beyond simple foreign keys. In the functional-dependency right-hand-side association, a subject—identified by `functional_id` values like `RHS-0003` or `RHS-0004`—is linked to a target—identified by `f_d_right_hand_side_id` values like `RHS-0007`, `RHS-0001`, `RHS-0005`, `RHS-0006`—through a role that specifies the nature of the connection: `contributor` or `owner`. This triplet structure allows the same pair of entities to participate in multiple relationships with different roles, and it makes the semantics of the relationship first-class data rather than an implicit convention. The subject is the entity that initiates or owns the relationship; the target is the entity that is affected by or receives from it; and the role is the predicate that classifies the link.

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

Together, these constructs—identifier, entity, attr, attr type, misc, subject, target, role—form a coherent ontology for describing systems at a granular level. The kernel-hook domain uses this machinery to track properties like `checksum` values (`a3f9c21e`), creation dates (`2023-02-05`), licenses (`Apache-2.0`), and geographic regions (`eu-west-3`) across hooks such as `Tracepoint-block-io`, `BPF-co-re-syscall`, `Kprobes-schedule`, and `Fentry-kernel-init`. The syscall-directive domain applies the same pattern to govern operations like `mmap`, `connect`, `epoll_wait`, and `listen` with attributes including effective dates (`2023-07-14`, `2025-03-29`, `2024-05-27`, `2024-04-25`), enforcement flags (`true`, `false`), mandatory booleans, and priority integers (`4`, `80`, `443`). The functional-dependency domain uses it to map services like `telemetry aggregation service` and `access control evaluator` to outputs such as `aggregated event count`, `sanitized email address`, `partition key value`, and `enriched sensor reading`, with roles distinguishing `contributor` from `owner`. The uniformity of the model across these domains is not an accident of implementation but a deliberate design choice that enables cross-domain querying, consistent governance, and extensible metadata management without schema fragmentation.

**t_kernelhook_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0002 | 2023-02-05 |
| KERN-0002 | KERN-0002 | KERN-0002 | 2024-05-21 |
| KERN-0003 | KERN-0003 | KERN-0002 | 2024-01-08 |
| KERN-0004 | KERN-0004 | KERN-0002 | 2025-01-30 |
| KERN-0005 | KERN-0005 | KERN-0002 | 2023-03-23 |
| KERN-0006 | KERN-0006 | KERN-0002 | 2024-01-11 |

**t_kernelhook_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0006 | 323 |
| KERN-0002 | KERN-0001 | KERN-0008 | 12 |
| KERN-0003 | KERN-0002 | KERN-0006 | 186 |
| KERN-0004 | KERN-0002 | KERN-0008 | 2 |
| KERN-0005 | KERN-0003 | KERN-0006 | 276 |
| KERN-0006 | KERN-0003 | KERN-0008 | 4 |
| KERN-0007 | KERN-0004 | KERN-0006 | 346 |
| KERN-0008 | KERN-0004 | KERN-0008 | 11 |

**t_syscall_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_syscall_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_syscall_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2023-07-14 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-29 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2024-05-27 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-04-25 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-30 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-07-29 |

**t_syscall_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 4 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 80 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 4 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 443 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 564 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 613 |

**t_syscall_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | fr |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |