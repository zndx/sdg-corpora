---
chapter_id: ch_live_sysblock_subclass_1c3d97
topic_id: 56
family: 01_foundation
cited_terms: ['sysblock_subclass', 'schemaorg_review_author', 'xdp_action_pass']
model: engine-refine
---

Identifiers serve as the immutable anchors of any structured governance or telemetry framework, providing a deterministic mechanism for record resolution across distributed systems. Each entity—whether a hardware component such as the Telemetry Hub Unit (`SYSB-0001`), a regulatory author record (`AUTH-0001`), or a data processing pipeline (`PASS-0001`)—is assigned a scoped, machine-readable key that guarantees unambiguous reference. These identifiers do not merely label objects; they establish the primary namespace through which compliance audits, lineage tracking, and operational monitoring converge. By decoupling human-readable descriptors from system-level resolution keys, organizations maintain referential integrity even as assets are migrated, decommissioned, or reclassified across environments.

**t_sysblock_subclass**

| id | sysblock | has_part |
| --- | --- | --- |
| SYSB-0001 | Telemetry Hub Unit | Memory Controller Die |
| SYSB-0002 | Governance Registry Core | Network Interface Card |
| SYSB-0003 | Stream Processor Node | Network Interface Card |
| SYSB-0004 | Lab Instrument Controller | Network Interface Card |
| SYSB-0005 | Stream Processor Node | SFP Transceiver Module |
| SYSB-0006 | Telemetry Hub Unit | SFP Transceiver Module |

**t_schemaorg_review_author**

| id | schemaorg | review_author |
| --- | --- | --- |
| AUTH-0001 | Person | James Wilson |
| AUTH-0002 | LocalBusiness | Michael Brown |
| AUTH-0003 | SoftwareApplication | Jane Doe |
| AUTH-0004 | Event | Sarah Miller |
| AUTH-0005 | Place | Jane Doe |
| AUTH-0006 | SoftwareApplication | Robert Chen |

**t_schemaorg_review_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 103 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 471 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 5 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 402 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 1 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 318 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 3 |

**t_schemaorg_review_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 1a4b6c2d |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | ref-8842 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | CC-BY-4.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | application/xml |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | data-engineering |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

**t_xdp_action_pass**

| id | xdp |
| --- | --- |
| PASS-0001 | prod-ingest-xdp |
| PASS-0002 | edge-telemetry-xdp |
| PASS-0003 | compliance-xdp |
| PASS-0004 | prod-ingest-xdp |
| PASS-0005 | streaming-fabric-xdp |
| PASS-0006 | cloud-sync-xdp |

**t_xdp_action_pass_x_d_p_action**

| id | x_d_p_action |
| --- | --- |
| PASS-0001 | route-to-lake |
| PASS-0002 | validate-schema |
| PASS-0003 | sync-replica |
| PASS-0004 | tag-PII |
| PASS-0005 | drop-invalid |
| PASS-0006 | encrypt-payload |

The metadata governing each entity is articulated through a disciplined attribute taxonomy, where every `attr` is paired with a strict `attr type` to enforce semantic consistency and schema validation. Attributes such as `checksum`, `created_date`, `identifier`, and `license` capture the essential provenance and configuration state of an asset, while their corresponding types—`xsd:string`, `xsd:date`, `cco:DesignativeICE`—dictate parsing rules, storage constraints, and interoperability boundaries. This separation of definition from instantiation ensures that downstream consumers, whether automated compliance engines or human auditors, can reliably interpret field semantics without ambiguity. Type declarations also enable early validation, preventing malformed entries from propagating into audit trails or regulatory reports.

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

**t_schemaorg_review_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2025-02-16 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-11-14 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-06-05 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-01-18 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2023-05-28 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-09-03 |

Actual attribute values are persisted in a normalized, type-dispatched value store that isolates heterogeneous data formats from the core schema. Date-bound properties like `2024-02-28` or `2023-05-14` reside in dedicated temporal tables, while numeric metrics such as `221` or `12` are routed to integer stores, and free-form or encoded strings—including cryptographic digests like `a3f9c21e`, organizational markers like `MIT`, or network zoning tags like `zone-b`—are housed in variable-character repositories. This value-dispatch architecture preserves query performance and storage efficiency while maintaining strict type boundaries, a critical requirement when handling sensitive telemetry or legally auditable records. The `misc` designation reflects this pragmatic separation, acknowledging that compliance and operational data rarely conform to a single homogeneous structure.

Relationship mapping and access governance are modeled through explicit subject-target pairs governed by functional roles, creating a transparent audit trail of data ownership and processing responsibilities. In pipeline orchestration, for instance, a processing action such as `prod-ingest-xdp` may assume the subject position while routing to a downstream target like `PASS-0005`, with the intervening `role` field—`observer`, `owner`, or `contributor`—defining the permissible scope of interaction. An `observer` role grants read-only visibility for compliance monitoring, whereas a `contributor` or `owner` designation implies write authority or lifecycle management. This tripartite structure transforms abstract data flows into enforceable policy boundaries, ensuring that every cross-system interaction is both traceable and constrained by predefined operational mandates.

**t_xdp_action_pass__x_d_p_action**

| id | xdp_id | x_d_p_action_id | role |
| --- | --- | --- | --- |
| PASS-0001 | PASS-0001 | PASS-0005 | observer |
| PASS-0002 | PASS-0002 | PASS-0004 | owner |
| PASS-0003 | PASS-0005 | PASS-0003 | observer |
| PASS-0004 | PASS-0005 | PASS-0005 | contributor |
| PASS-0005 | PASS-0003 | PASS-0006 | observer |
| PASS-0006 | PASS-0005 | PASS-0006 | contributor |
| PASS-0007 | PASS-0005 | PASS-0001 | observer |
| PASS-0008 | PASS-0002 | PASS-0001 | contributor |

Collectively, this architectural pattern establishes a deterministic foundation for enterprise governance, where identifiers anchor entities, attributes define metadata contracts, typed values preserve data integrity, and role-mediated relationships enforce access control. When deployed across telemetry ingestion, regulatory authorship, or compliance processing workflows, the model supports granular lineage tracking, automated schema validation, and auditable policy enforcement. The result is a resilient data fabric that scales with operational complexity while maintaining the strict provenance controls required by modern regulatory frameworks and security postures.

**t_schemaorg_review_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |