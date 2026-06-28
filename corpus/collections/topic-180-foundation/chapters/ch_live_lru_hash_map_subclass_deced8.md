---
chapter_id: ch_live_lru_hash_map_subclass_deced8
topic_id: 180
family: 07_long_tail
cited_terms: ['lru_hash_map_subclass', 'policy_min_one_enforcer', 'schemaorg_creativework_publisher']
model: engine-refine
---

Every persistent object in the system is anchored by a stable identifier, a canonical reference code that survives schema migrations and cross-domain joins. These identifiers—such as MAP-0001 for a primary database cache, ENFO-0001 for an SOC 2 Type II Controls policy, or PUBL-0001 for an API Gateway configuration document—serve as the immutable keys that bind disparate registries into a coherent graph. An identifier does not merely label; it designates an entity, the concrete instance that carries business meaning, operational state, and compliance obligations. Whether the entity represents a runtime caching layer, a regulatory enforcement division, or a published technical artifact, the identifier guarantees unambiguous resolution across every lookup, audit trail, and dependency map.

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | SOC 2 Type II Controls |
| ENFO-0002 | ISO 13485 QMS |
| ENFO-0003 | GDPR Compliance Framework |
| ENFO-0004 | EU AI Act Risk Management |
| ENFO-0005 | ISO 13485 QMS |
| ENFO-0006 | ISO 13485 QMS |

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | API Gateway Config | ENFO-0006 |
| PUBL-0002 | API Gateway Config | ENFO-0004 |
| PUBL-0003 | Cloud Migration Playbook | ENFO-0003 |
| PUBL-0004 | Cloud Migration Playbook | ENFO-0001 |
| PUBL-0005 | Incident Postmortem | ENFO-0005 |
| PUBL-0006 | Telemetry Schema Draft | ENFO-0001 |
| PUBL-0007 | Firmware Release Notes | ENFO-0001 |
| PUBL-0008 | Cloud Migration Playbook | ENFO-0005 |

Relationships between entities are formalized through subject–target pairings, where the subject column points to the initiating entity and the target column points to the recipient or dependent entity. This directional linkage is never implicit; it is explicitly qualified by a role attribute that defines the nature of the association. In a cache configuration registry, MAP-0007 may appear as the subject linked to MAP-0004 as the target under a reviewer role, indicating that the former validates or approves the latter’s hash strategy. Similarly, within a compliance enforcement matrix, ENFO-0005 functions as the subject bound to ENFO-0002 as the target with a contributor role, signaling that the policy framework actively supplies requirements to the enforcement body. The role column thus transforms a raw foreign-key edge into a semantically rich, auditable relationship.

Beyond relational topology, each entity carries a structured set of properties governed by attribute definitions and their corresponding attribute types. An attr name—such as checksum, created_date, or license—declares what aspect of the entity is being measured, while the attr type enforces the schema constraint that governs its storage and validation. Typed declarations like xsd:string for checksum or xsd:date for created_date ensure that downstream consumers can parse, index, and compare values without runtime coercion. This separation of attribute metadata from concrete values decouples schema evolution from data population, allowing new properties to be registered without altering the underlying storage layout.

The actual property values reside in a unified misc column, distributed across type-specific value tables that reference both the owning entity and the defining attribute. When entity PUBL-0001 is queried for its varchar attribute PUBL-0001, the misc field yields 9d2b7a16; when the same entity resolves its date attribute PUBL-0002, the misc field returns 2023-06-28. Integer attributes follow the same pattern, with entity PUBL-0001 storing 72 under attribute PUBL-0006 and 1 under PUBL-0008. By funneling heterogeneous data through a single misc slot and routing it via entity_id and attr_id foreign keys, the architecture preserves type safety at the schema layer while maintaining a flat, queryable value plane. This design supports high-throughput attribute resolution without sacrificing the rigor of xsd or custom namespace constraints.

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

Collectively, these constructs—identifiers, entities, subject–target edges, roles, attributes, types, and misc values—form a disciplined ontology that scales from low-level cache routing to enterprise-grade compliance tracking. The same relational primitives that bind a robin-hood hash config to a production session cache also bind a GDPR Compliance Framework to a Data Stewardship Council, and attach a proprietary license declaration to a cloud migration playbook. Because every relationship is explicitly qualified and every property is type-constrained, the system guarantees that operational telemetry, policy enforcement, and document metadata remain mutually resolvable, auditable, and immune to drift.

**t_lru_hash_map_subclass**

| id | lru |
| --- | --- |
| MAP-0001 | primary-db-cache |
| MAP-0002 | stream-event-cache |
| MAP-0003 | global-rate-limiter |
| MAP-0004 | prod-session-cache |
| MAP-0005 | primary-db-cache |
| MAP-0006 | stream-event-cache |
| MAP-0007 | prod-session-cache |

**t_lru_hash_map_subclass_l_r_u_hash_config**

| id | l_r_u_hash_config |
| --- | --- |
| MAP-0001 | siphash-2-4 |
| MAP-0002 | xxhash64 |
| MAP-0003 | robin-hood |
| MAP-0004 | sparse-block-map |
| MAP-0005 | murmur3-128 |
| MAP-0006 | murmur3-128 |

**t_lru_hash_map_subclass__l_r_u_hash_config**

| id | lru_id | l_r_u_hash_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0007 | MAP-0004 | reviewer |
| MAP-0002 | MAP-0004 | MAP-0002 | contributor |
| MAP-0003 | MAP-0003 | MAP-0002 | observer |
| MAP-0004 | MAP-0005 | MAP-0004 | reviewer |
| MAP-0005 | MAP-0004 | MAP-0005 | owner |
| MAP-0006 | MAP-0001 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0005 | reviewer |
| MAP-0008 | MAP-0007 | MAP-0002 | observer |

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |