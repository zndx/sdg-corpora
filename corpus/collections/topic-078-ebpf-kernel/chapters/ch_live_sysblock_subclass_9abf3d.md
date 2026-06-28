---
chapter_id: ch_live_sysblock_subclass_9abf3d
topic_id: 78
family: 01_foundation
cited_terms: ['sysblock_subclass', 'syscall_at_security_tier', 'syscall_audited_by']
model: engine-refine
---

System blocks constitute the foundational taxonomy of the governance framework, each identified by a stable code such as SYSB-0001 through SYSB-0004 and classified by functional role—Audit Log Archiver, accept4, Metadata Validator Daemon, clone—alongside their constituent parts, which range from Memory Controller Die to Network Interface Card. This classification establishes the entity boundary against which all attribute data and event telemetry are measured. Attributes themselves are defined in a dedicated registry that pairs a name with a type constraint: checksum and license are bound to xsd:string, created_date to xsd:date, and identifier to cco:DesignativeICE, ensuring that every value assigned to a system block conforms to a predictable schema. The type discipline is not merely declarative; it governs how values are stored, validated, and queried across the operational data layer.

**t_sysblock_subclass**

| id | sysblock | has_part |
| --- | --- | --- |
| SYSB-0001 | Audit Log Archiver | Memory Controller Die |
| SYSB-0002 | accept4 | Network Interface Card |
| SYSB-0003 | Metadata Validator Daemon | Network Interface Card |
| SYSB-0004 | clone | Network Interface Card |
| SYSB-0005 | mmap | SFP Transceiver Module |
| SYSB-0006 | Audit Log Archiver | SFP Transceiver Module |

**t_sysblock_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSB-0001 | checksum | xsd:string |
| SYSB-0002 | created_date | xsd:date |
| SYSB-0003 | identifier | cco:DesignativeICE |
| SYSB-0004 | license | xsd:string |
| SYSB-0005 | mime_type | xsd:string |
| SYSB-0006 | size_bytes | xsd:long |
| SYSB-0007 | uri | xsd:string |
| SYSB-0008 | version | xsd:integer |

**t_sysblock_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSB-0001 | SYSB-0001 | SYSB-0002 | 2024-02-28 |
| SYSB-0002 | SYSB-0002 | SYSB-0002 | 2023-05-14 |
| SYSB-0003 | SYSB-0003 | SYSB-0002 | 2025-03-07 |
| SYSB-0004 | SYSB-0004 | SYSB-0002 | 2025-03-22 |
| SYSB-0005 | SYSB-0005 | SYSB-0002 | 2025-05-04 |
| SYSB-0006 | SYSB-0006 | SYSB-0002 | 2024-11-29 |

**t_sysblock_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSB-0001 | SYSB-0001 | SYSB-0006 | 221 |
| SYSB-0002 | SYSB-0001 | SYSB-0008 | 12 |
| SYSB-0003 | SYSB-0002 | SYSB-0006 | 94 |
| SYSB-0004 | SYSB-0002 | SYSB-0008 | 3 |
| SYSB-0005 | SYSB-0003 | SYSB-0006 | 114 |
| SYSB-0006 | SYSB-0003 | SYSB-0008 | 9 |
| SYSB-0007 | SYSB-0004 | SYSB-0006 | 176 |
| SYSB-0008 | SYSB-0004 | SYSB-0008 | 10 |

Attribute values are materialized in three parallel value tables, each specialized for a distinct data type. String-valued attributes such as a3f9c21e, oid:1.3.6.1, MIT, and zone-b reside in the varchar store, where they are linked to their owning entity and attribute through foreign keys. Date-valued attributes—2024-02-28, 2023-05-14, 2025-03-07, 2025-03-22—are held in the date store, while integer-valued attributes such as 221, 12, 94, and 3 occupy the integer store. This normalization by type enables efficient range queries on dates, numeric aggregations on integers, and exact-match lookups on strings, while the shared entity_id and attr_id columns maintain referential integrity back to the attribute registry and, transitively, to the system block subclass.

**t_sysblock_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSB-0001 | SYSB-0001 | SYSB-0001 | a3f9c21e |
| SYSB-0002 | SYSB-0001 | SYSB-0003 | oid:1.3.6.1 |
| SYSB-0003 | SYSB-0001 | SYSB-0004 | MIT |
| SYSB-0004 | SYSB-0001 | SYSB-0009 | zone-b |
| SYSB-0005 | SYSB-0001 | SYSB-0005 | application/xml |
| SYSB-0006 | SYSB-0001 | SYSB-0010 | Name 06 |
| SYSB-0007 | SYSB-0001 | SYSB-0011 | analytics |
| SYSB-0008 | SYSB-0001 | SYSB-0012 | Tags 08 |

Security-tier telemetry is captured in a star schema centered on the fact table of syscall events. Each fact row carries an event_count—238, 52, 198, 382 in the observed data—and a foreign key pointing to the security tier dimension. The dimension table supplies the human-readable label and the categorical classification for each tier, with entries such as At Security Tier Label 01 mapped to At Security Tier Category 01, and so forth through the four observed tiers. This separation of measure from dimension permits analysts to slice event volumes by category or label without duplicating descriptive text within the fact table, and it supports roll-up queries that aggregate event counts across categories or drill down to individual tier identifiers.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

The audit mapping layer bridges system calls to their operational characteristics, recording which format and language govern each audited syscall. Formats observed include JSON, UUID, and CSV, while languages span fr, en, and ja. System calls such as unlinkat, Telemetry Hub Unit, and Data Lake Ingestion Block are each associated with a specific format-language pair, establishing the encoding and locale expectations for audit records. This mapping is essential for downstream consumers of audit data: a JSON-formatted, English-language audit stream requires a different parser and localization pipeline than a CSV-formatted, Japanese-language stream, and the mapping table provides the authoritative source for routing decisions.

**t_syscall_audited_by**

| id | syscall | format | language |
| --- | --- | --- | --- |
| AUDI-0001 | unlinkat | JSON | fr |
| AUDI-0002 | Telemetry Hub Unit | UUID | en |
| AUDI-0003 | Telemetry Hub Unit | CSV | ja |
| AUDI-0004 | Data Lake Ingestion Block | UUID | en |