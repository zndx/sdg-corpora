---
chapter_id: ch_live_dataset_was_derived_from_141efd
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_derived_from', 'kernelhook_basic', 'audit_basic']
model: engine-refine
---

In data governance frameworks, the distinction between an entity and its attributes forms the bedrock of traceable, auditable information architecture. An entity represents a discrete, addressable thing—a dataset, a kernel hook, an audit event—each anchored by a stable identifier such as `FROM-0001`, `KERN-0001`, or `AUDI-0001`. These identifiers are not merely labels; they are the immutable keys that permit cross-referencing across the entire knowledge graph, enabling an operator to locate the `patient_demographics_clean` dataset or the `Tracepoint-block-io` kernel hook and then traverse outward to every attribute, relationship, and provenance chain attached to that entity. The identifier serves as the primary contract of persistence: it guarantees that the entity referenced today is the same entity queried tomorrow, regardless of how its attributes evolve.

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | Tracepoint-block-io |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | Kprobes-schedule |
| KERN-0004 | Fentry-kernel-init |
| KERN-0005 | Kprobes-schedule |
| KERN-0006 | Kretprobe-exit |

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

**t_audit_basic**

| id | audit |
| --- | --- |
| AUDI-0001 | Telemetry Integrity Check |
| AUDI-0002 | Logging Compliance Review |
| AUDI-0003 | Logging Compliance Review |
| AUDI-0004 | Model Drift Validation |
| AUDI-0005 | Model Drift Validation |
| AUDI-0006 | Pipeline Latency Review |

**t_audit_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2024-05-14T01:27:39 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-24T17:57:06 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2023-07-30T11:39:04 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2024-03-11T10:39:38 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2025-01-11T17:40:44 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-09-25T22:35:18 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2025-04-27T05:17:32 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2023-12-11T03:24:19 |

**t_audit_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 2391.38 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 1955.36 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 919.71 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 338.61 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1120.15 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 6419.06 |

**t_audit_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 765 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 217 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 123 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 33 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 601 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 361 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 79 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 456 |

**t_audit_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | initiation |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | pending |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | ingest-21 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | closeout |

Attributes and their types constitute the descriptive layer that gives entities their semantic substance. An attribute—`checksum`, `created_date`, `license`, `duration_seconds`, `host_name`—is a named property, and its type constrains the domain of permissible values. The type registry maps each attribute to a schema namespace: `xsd:string` for free-form text such as `a3f9c21e` or `eu-west-3`, `xsd:date` for calendar values like `2023-02-05`, `xsd:dateTime` for timestamped events such as `2024-05-14T01:27:39`, `xsd:decimal` for precise measurements like `2391.38`, and `xsd:integer` for discrete counts such as `765` or `33`. The type `cco:DesignativeICE` further signals a designative identifier class, distinguishing it from ordinary strings. This typed discipline ensures that the value `2024-05-21` stored against the `created_date` attribute of entity `KERN-0002` is semantically distinct from the value `186` stored against a numeric attribute of the same entity, and that query engines, validation pipelines, and downstream consumers can reason about each value without ambiguity.

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

**t_kernelhook_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0002 | 2023-02-05 |
| KERN-0002 | KERN-0002 | KERN-0002 | 2024-05-21 |
| KERN-0003 | KERN-0003 | KERN-0002 | 2024-01-08 |
| KERN-0004 | KERN-0004 | KERN-0002 | 2025-01-30 |
| KERN-0005 | KERN-0005 | KERN-0002 | 2023-03-23 |
| KERN-0006 | KERN-0006 | KERN-0002 | 2024-01-11 |

The value store itself—what the data model terms `misc`—is the material instantiation of an attribute on an entity. Values are partitioned by type into dedicated stores: date values such as `2025-01-30` or `2024-01-08` reside in the date value table, integer values like `323` or `12` in the integer value table, and variable-character values including `gid://svc/77`, `Apache-2.0`, and `pending` in the varchar value table. Each value record binds three keys: the entity to which it belongs, the attribute it describes, and the value itself. This tripartite linkage means that entity `AUDI-0001` carries the attribute `host_name` with value `node-a01`, the attribute `exit_code` with value `765`, and the attribute `duration_seconds` with value `2391.38`, while entity `AUDI-0002` carries the same `host_name` attribute with value `Log Level 02` and the same `duration_seconds` attribute with value `1955.36`. The same attribute name can thus hold different types of values across entities, and the type system—not the attribute name alone—determines the semantics of each value.

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

Relationships between entities introduce a second dimension of structure, governed by the triad of subject, target, and role. In the provenance model, a dataset such as `iot_edge_logs` (subject) is derived from a source such as `raw_sensor_stream` (target), and the `role` column specifies the nature of that derivation—`contributor` when the source supplied partial input, `owner` when it held primary custodianship. The relationship record itself carries an identifier (`FROM-0001`) and foreign keys pointing to both the subject (`dataset_id`) and the target (`was_derived_from_id`), forming a directed edge in the provenance graph. This same pattern appears in the cross-reference table where `FROM-0002` links dataset `FROM-0002` to source `FROM-0004` with role `contributor`, and `FROM-0001` appears twice—once linking `FROM-0001` to `FROM-0001` as `contributor`, and again linking `FROM-0001` to `FROM-0002` as `owner`—demonstrating that a single entity can occupy both subject and target positions across different relationships, and that the role field disambiguates the direction and character of each link.

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

Together, these constructs—identifier, entity, attribute, attribute type, value, subject, target, and role—form a minimal but complete vocabulary for describing what exists, what it is like, and how it relates to other things. The identifier provides addressability; the entity provides identity; the attribute and its type provide description; the value provides instantiation; and the subject–target–role triad provides relational context. In practice, this means that an operator can reconstruct the full provenance of `market_index_history` back to `regulatory_filing_pdf`, verify that the `Logging Compliance Review` audit (`AUDI-0002`) ran on host `Log Level 02` for `1955.36` seconds with exit code `123`, and confirm that the `BPF-co-re-syscall` kernel hook (`KERN-0002`) carries license `Apache-2.0` and was created on `2024-05-21`—all without leaving the model, all through the same primitives of key, attribute, value, and relationship.

**t_audit_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |