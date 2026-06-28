---
chapter_id: ch_live_process_with_participant_b55122
topic_id: 60
family: 01_foundation
cited_terms: ['process_with_participant', 'pignistic_transformation', 'kernelhook_basic']
model: engine-refine
---

In operational data models, the distinction between what an entity is and what it is composed of determines both query efficiency and semantic clarity. An identifier serves as the immutable anchor of any record—PART-0001, TRAN-0001, KERN-0001—each a stable handle that survives attribute mutations and cross-referencing. The entity itself is the conceptual object to which properties attach: a process with participant, a pignistic transformation, a kernel hook. These entities are not monolithic; they decompose into attributes, each named for its semantic purpose and typed for its data domain. An attribute such as `duration_seconds` or `checksum` carries no value on its own—it is a schema-level declaration that a value will follow, and that value will conform to a specific type. The attr type, whether `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`, `xsd:date`, or the domain-specific `cco:DesignativeICE`, governs not only storage layout but validation, comparison, and serialization. A duration of 565.34 and a duration of 6522.24 are both `xsd:decimal`, yet their magnitudes signal fundamentally different process executions—one a brief access review, the other a prolonged compliance audit.

**t_process_with_participant**

| id | process | related |
| --- | --- | --- |
| PART-0001 | access review | validation suite |
| PART-0002 | network synchronization | scheduler service |
| PART-0003 | compliance audit | training cluster |
| PART-0004 | compliance audit | ingestion pipeline |
| PART-0005 | network synchronization | ingestion pipeline |
| PART-0006 | schema migration | scheduler service |
| PART-0007 | schema migration | compliance dataset |
| PART-0008 | quality assurance | validation suite |

**t_process_with_participant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PART-0001 | duration_seconds | xsd:decimal |
| PART-0002 | end_time | xsd:dateTime |
| PART-0003 | exit_code | xsd:integer |
| PART-0004 | host_name | xsd:string |
| PART-0005 | log_level | xsd:string |
| PART-0006 | phase | xsd:string |
| PART-0007 | retry_count | xsd:integer |
| PART-0008 | scheduled_at | xsd:dateTime |

**t_process_with_participant_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0002 | 2024-06-12T21:46:50 |
| PART-0002 | PART-0001 | PART-0008 | 2024-08-24T17:43:03 |
| PART-0003 | PART-0001 | PART-0009 | 2024-02-26T12:31:34 |
| PART-0004 | PART-0002 | PART-0002 | 2023-09-13T23:16:55 |
| PART-0005 | PART-0002 | PART-0008 | 2023-09-18T01:53:27 |
| PART-0006 | PART-0002 | PART-0009 | 2023-12-19T06:07:05 |
| PART-0007 | PART-0003 | PART-0002 | 2025-02-28T12:35:26 |
| PART-0008 | PART-0003 | PART-0008 | 2023-01-21T19:46:12 |

**t_process_with_participant_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0001 | 565.34 |
| PART-0002 | PART-0002 | PART-0001 | 6522.24 |
| PART-0003 | PART-0003 | PART-0001 | 236.49 |
| PART-0004 | PART-0004 | PART-0001 | 5070.41 |
| PART-0005 | PART-0005 | PART-0001 | 5946.70 |
| PART-0006 | PART-0006 | PART-0001 | 6238.25 |
| PART-0007 | PART-0007 | PART-0001 | 1191.07 |
| PART-0008 | PART-0008 | PART-0001 | 3672.98 |

**t_process_with_participant_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0003 | 231 |
| PART-0002 | PART-0001 | PART-0007 | 324 |
| PART-0003 | PART-0002 | PART-0003 | 759 |
| PART-0004 | PART-0002 | PART-0007 | 24 |
| PART-0005 | PART-0003 | PART-0003 | 283 |
| PART-0006 | PART-0003 | PART-0007 | 408 |
| PART-0007 | PART-0004 | PART-0003 | 247 |
| PART-0008 | PART-0004 | PART-0007 | 74 |

**t_process_with_participant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0004 | gw-12 |
| PART-0002 | PART-0001 | PART-0005 | Log Level 02 |
| PART-0003 | PART-0001 | PART-0006 | review |
| PART-0004 | PART-0001 | PART-0010 | failed |
| PART-0005 | PART-0001 | PART-0011 | Triggered By 05 |
| PART-0006 | PART-0002 | PART-0004 | node-b14 |
| PART-0007 | PART-0002 | PART-0005 | Log Level 07 |
| PART-0008 | PART-0002 | PART-0006 | execution |

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | Tracepoint-block-io |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | Kprobes-schedule |
| KERN-0004 | Fentry-kernel-init |
| KERN-0005 | Kprobes-schedule |
| KERN-0006 | Kretprobe-exit |

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

The entity-attribute-value decomposition separates definition from instantiation. Attribute definitions live in a dedicated registry: `duration_seconds` maps to `xsd:decimal`, `end_time` to `xsd:dateTime`, `exit_code` to `xsd:integer`, `host_name` to `xsd:string`. These definitions are then materialized across type-specific value tables, each keyed by an identifier that references both the entity and the attribute. The entity_id column binds a value to its owner—PART-0001 owns a `duration_seconds` of 565.34 and an `end_time` of 2024-06-12T21:46:50—while the attr_id column binds it to its schema. This separation permits heterogeneous attribute sets without schema migration: one entity may carry `gw-12` as a `host_name` and `a3f9c21e` as a `checksum`, while another carries `Log Level 02` and `gid://svc/77`, all without altering the underlying table structure. The misc column, the catch-all for actual values, holds timestamps like 2024-08-24T17:43:03, integers like 231 and 759, strings like `review` and `failed`, and dates like 2023-02-05 and 2025-01-30, each typed at the table level rather than at the row level.

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

Relationships between entities introduce a third dimension: the role. A pignistic transformation does not merely point to a transformed belief state; it does so through a named relationship that carries semantic weight. The subject—the originating entity, such as TRAN-0008 or TRAN-0005—participates in a relationship with a target, such as TRAN-0005 or TRAN-0002, under a role that specifies the nature of the connection. The role reviewer appears repeatedly, designating entities that evaluate or validate other entities' outputs; the role contributor designates entities that supply material. This triad—subject, target, role—transforms a simple foreign key into a typed edge in a knowledge graph, enabling queries that distinguish between an entity that reviews a transformation and one that contributes to it. The pignistic transformation itself, whether described as a diagnostic confidence matrix, a telemetry belief assignment, or an anomaly likelihood set, becomes meaningful only when its outputs—the pignistic probability distribution, the transformed belief state, the betting probability set—are linked back through these role-bearing relationships.

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |

The practical consequence of this architecture is that governance and auditability become queryable properties rather than external documentation. A compliance audit process (PART-0003) with a training cluster as its related component carries an exit code of 759 and a duration of 236.49 seconds; a network synchronization process (PART-0002) tied to a scheduler service ran for 6522.24 seconds and terminated with exit code 24. These values are not embedded in a monolithic row but are retrievable through their attribute names and types, enabling dynamic schema evolution without application code changes. Similarly, a kernel hook such as Tracepoint-block-io (KERN-0001) carries a created_date of 2023-02-05, a license of Apache-2.0, and an identifier of a3f9c21e, all independently queryable and independently mutable. The attr type system ensures that a date value like 2024-05-21 cannot be confused with an integer like 323, even though both reside in value tables keyed by the same structural pattern. This typed separation of concerns—identifier for identity, attr and attr_type for schema, entity and misc for instantiation, subject and target with role for relationship—forms the backbone of a data model that scales without sacrificing precision.