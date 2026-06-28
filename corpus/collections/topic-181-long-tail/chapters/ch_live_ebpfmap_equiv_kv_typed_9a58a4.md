---
chapter_id: ch_live_ebpfmap_equiv_kv_typed_9a58a4
topic_id: 181
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_equiv_kv_typed', 'schemaorg_event_organizer', 'attestation_basic']
model: engine-refine
---

This is a Controlled Document that complies with enterprise data governance formatting and Quality Control standards. Please check that this is the latest available version before use.

The attribute registry constitutes the foundational schema layer, wherein each attribute is declared with a stable identifier and a typed constraint that governs its permissible value domain. In the attestation domain, attributes such as `duration_seconds`, `end_time`, `exit_code`, and `host_name` are registered under the `attestation_basic_attr` table, each bound to an `attr_type` drawn from the XML Schema and custom namespaces—`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string` respectively. Similarly, the schema.org event-organizer facet declares attributes including `checksum`, `created_date`, `identifier`, and `license`, with types `xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string`. These type declarations are not decorative; they enforce value discipline at the ingestion boundary, ensuring that a `created_date` of `2024-07-16` or `2023-04-02` conforms to `xsd:date`, while a `checksum` such as `7b14de08` satisfies `xsd:string`. The `attr_type` column thus serves as the single source of truth for serialization, validation, and downstream type coercion across all value tables.

**t_schemaorg_event_organizer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ORGA-0001 | checksum | xsd:string |
| ORGA-0002 | created_date | xsd:date |
| ORGA-0003 | identifier | cco:DesignativeICE |
| ORGA-0004 | license | xsd:string |
| ORGA-0005 | mime_type | xsd:string |
| ORGA-0006 | size_bytes | xsd:long |
| ORGA-0007 | uri | xsd:string |
| ORGA-0008 | version | xsd:integer |

**t_schemaorg_event_organizer_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0002 | 2024-07-16 |
| ORGA-0002 | ORGA-0002 | ORGA-0002 | 2023-04-02 |
| ORGA-0003 | ORGA-0003 | ORGA-0002 | 2023-04-02 |
| ORGA-0004 | ORGA-0004 | ORGA-0002 | 2023-04-08 |
| ORGA-0005 | ORGA-0005 | ORGA-0002 | 2023-03-07 |
| ORGA-0006 | ORGA-0006 | ORGA-0002 | 2023-12-15 |
| ORGA-0007 | ORGA-0007 | ORGA-0002 | 2023-05-20 |

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

Attribute values are materialized in a family of typed value tables that decouple the attribute definition from its concrete instantiations. The `entity_id` column anchors each value to a specific entity record—`ATTE-0001` for a Vendor risk assessment, `ORGA-0001` for Edge Compute Fest—while the `attr_id` column resolves back to the attribute definition, forming a composite foreign key that guarantees referential integrity between the value and its schema. The `value` column, labeled `misc` in the relational model, holds the actual data, partitioned by type into `val_varchar` (e.g., `gid://svc/77`, `CC-BY-4.0`, `ap-south-2`), `val_int` (e.g., `440`, `7`, `450`, `6`), `val_decimal` (e.g., `7132.97`, `6429.54`, `3894.03`, `6507.32`), `val_datetime` (e.g., `2024-11-18T12:26:52`, `2023-12-15T15:31:35`), and `val_date` (e.g., `2023-04-08`). This normalization by value type eliminates null proliferation and enables indexed, type-safe retrieval without runtime casting.

Relationships between entities are expressed through junction tables that carry a `subject`, a `target`, and a `role`, thereby encoding not only connectivity but also the semantic directionality of the association. In the eBPF map equivalence model, the `t_ebpfmap_equiv_kv_typed__key_type` table links an `ebpfmap_id` (subject) to a `key_type_id` (target) with a `role` of `contributor`, `owner`, or `reviewer`—for instance, `TYPE-0007` contributes to `TYPE-0001`, while `TYPE-0005` owns `TYPE-0004`. The same pattern appears in the value-type mapping, where `t_ebpfmap_equiv_kv_typed__value_type_map` associates an `ebpfmap_id` with a `value_type_map_id` under roles such as `contributor`, `observer`, and `owner`, and additionally carries a `cardinality_note` (e.g., `Cardinality Note 01` through `Cardinality Note 04`) that documents multiplicity constraints on the relationship. These cardinality notes are operational metadata: they inform query planners about one-to-one versus one-to-many joins and guide data quality assertions at pipeline boundaries.

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

The `identifier` column—present in every table as the primary key—provides the stable, opaque reference that all foreign keys resolve against. Identifiers such as `TYPE-0001`, `ORGA-0001`, and `ATTE-0001` are generation-agnostic; they do not encode semantics but serve as the immutable anchor for all cross-table joins. The `entity` column in value tables and the `organizer` column in the event-organizer table both reference these identifiers, ensuring that every value, every relationship, and every attestation can be traced back to its originating entity without ambiguity. This separation of identity from semantics—where the identifier is purely structural and the `attestation`, `schemaorg`, or `ebpfmap` columns carry the human-readable label—enables safe identifier rotation and supports multi-tenant isolation without schema migration.

**t_schemaorg_event_organizer**

| id | schemaorg | organizer |
| --- | --- | --- |
| ORGA-0001 | Edge Compute Fest | ATTE-0001 |
| ORGA-0002 | Telemetry Conference | ATTE-0001 |
| ORGA-0003 | Stream Processing Conclave | ATTE-0002 |
| ORGA-0004 | Governance Workshop | ATTE-0001 |
| ORGA-0005 | Stream Processing Conclave | ATTE-0002 |
| ORGA-0006 | Edge Compute Fest | ATTE-0006 |
| ORGA-0007 | Cloud Observability Meetup | ATTE-0005 |

**t_schemaorg_event_organizer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0006 | 440 |
| ORGA-0002 | ORGA-0001 | ORGA-0008 | 7 |
| ORGA-0003 | ORGA-0002 | ORGA-0006 | 450 |
| ORGA-0004 | ORGA-0002 | ORGA-0008 | 6 |
| ORGA-0005 | ORGA-0003 | ORGA-0006 | 147 |
| ORGA-0006 | ORGA-0003 | ORGA-0008 | 6 |
| ORGA-0007 | ORGA-0004 | ORGA-0006 | 298 |
| ORGA-0008 | ORGA-0004 | ORGA-0008 | 7 |

**t_schemaorg_event_organizer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0001 | 7b14de08 |
| ORGA-0002 | ORGA-0001 | ORGA-0003 | gid://svc/77 |
| ORGA-0003 | ORGA-0001 | ORGA-0004 | CC-BY-4.0 |
| ORGA-0004 | ORGA-0001 | ORGA-0009 | ap-south-2 |
| ORGA-0005 | ORGA-0001 | ORGA-0005 | application/xml |
| ORGA-0006 | ORGA-0001 | ORGA-0010 | Name 06 |
| ORGA-0007 | ORGA-0001 | ORGA-0011 | platform-team |
| ORGA-0008 | ORGA-0001 | ORGA-0012 | Tags 08 |