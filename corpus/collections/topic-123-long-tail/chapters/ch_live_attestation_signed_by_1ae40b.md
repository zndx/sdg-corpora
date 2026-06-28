---
chapter_id: ch_live_attestation_signed_by_1ae40b
topic_id: 123
family: 03_directive_governance
cited_terms: ['attestation_signed_by', 'observation_governed_by_policy', 'subclass_not_basic']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers constitute the foundational vocabulary of any structured data model, and their disciplined application determines whether a system can support auditability, traceability, and operational governance at scale. An entity represents a discrete, addressable thing in the domain—a certification event, an operational observation, a policy violation—and it is distinguished by a stable identifier that survives across queries, joins, and temporal snapshots. In the attestation domain, identifiers such as SIGN-0001 through SIGN-0004 anchor records to specific compliance activities, each carrying a human-readable label like System Access Certification, Data Lineage Certification, or Privacy Impact Assessment. Similarly, the observation domain employs identifiers POLI-0001 through POLI-0004 to tag events ranging from north vent temperature spike to ingestion pipeline backpressure, core switch packet loss, and edge gateway heartbeat timeout. These identifiers are not arbitrary; they encode provenance and enable deterministic referential integrity across the entire data fabric.

**t_attestation_signed_by**

| id | attestation |
| --- | --- |
| SIGN-0001 | System Access Certification |
| SIGN-0002 | Data Lineage Certification |
| SIGN-0003 | Privacy Impact Assessment |
| SIGN-0004 | System Access Certification |
| SIGN-0005 | Data Lineage Certification |
| SIGN-0006 | Model Performance Signoff |

**t_attestation_signed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_signed_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-11-18T17:18:55 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2024-04-18T06:27:25 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2023-01-19T17:50:39 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2025-06-04T16:32:01 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-04-02T11:15:56 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2023-07-13T05:58:46 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2023-10-19T08:02:32 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2025-01-01T00:25:23 |

**t_attestation_signed_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 2368.11 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 5757.34 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 785.50 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 5676.02 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 992.24 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 815.51 |

**t_attestation_signed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 407 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 30 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 633 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 373 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 166 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 260 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 596 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 36 |

**t_attestation_signed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | gw-12 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | closeout |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | pending |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | worker-07 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | review |

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

**t_observation_governed_by_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | duration_seconds | xsd:decimal |
| POLI-0002 | end_time | xsd:dateTime |
| POLI-0003 | exit_code | xsd:integer |
| POLI-0004 | host_name | xsd:string |
| POLI-0005 | log_level | xsd:string |
| POLI-0006 | phase | xsd:string |
| POLI-0007 | retry_count | xsd:integer |
| POLI-0008 | scheduled_at | xsd:dateTime |

**t_observation_governed_by_policy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0002 | 2023-03-21T06:17:05 |
| POLI-0002 | POLI-0001 | POLI-0008 | 2024-08-23T18:14:17 |
| POLI-0003 | POLI-0001 | POLI-0009 | 2024-06-11T06:45:45 |
| POLI-0004 | POLI-0002 | POLI-0002 | 2023-08-16T19:41:47 |
| POLI-0005 | POLI-0002 | POLI-0008 | 2023-07-01T10:02:32 |
| POLI-0006 | POLI-0002 | POLI-0009 | 2023-11-28T22:50:00 |
| POLI-0007 | POLI-0003 | POLI-0002 | 2025-02-28T14:09:39 |
| POLI-0008 | POLI-0003 | POLI-0008 | 2024-08-01T00:25:22 |

**t_observation_governed_by_policy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2405.99 |
| POLI-0002 | POLI-0002 | POLI-0001 | 5333.00 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2745.86 |
| POLI-0004 | POLI-0004 | POLI-0001 | 5236.87 |
| POLI-0005 | POLI-0005 | POLI-0001 | 6390.38 |
| POLI-0006 | POLI-0006 | POLI-0001 | 4927.03 |

**t_observation_governed_by_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | 46 |
| POLI-0002 | POLI-0001 | POLI-0007 | 468 |
| POLI-0003 | POLI-0002 | POLI-0003 | 386 |
| POLI-0004 | POLI-0002 | POLI-0007 | 493 |
| POLI-0005 | POLI-0003 | POLI-0003 | 146 |
| POLI-0006 | POLI-0003 | POLI-0007 | 163 |
| POLI-0007 | POLI-0004 | POLI-0003 | 133 |
| POLI-0008 | POLI-0004 | POLI-0007 | 341 |

**t_observation_governed_by_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | gw-12 |
| POLI-0002 | POLI-0001 | POLI-0005 | Log Level 02 |
| POLI-0003 | POLI-0001 | POLI-0006 | execution |
| POLI-0004 | POLI-0001 | POLI-0010 | complete |
| POLI-0005 | POLI-0001 | POLI-0011 | Triggered By 05 |
| POLI-0006 | POLI-0002 | POLI-0004 | worker-07 |
| POLI-0007 | POLI-0002 | POLI-0005 | Log Level 07 |
| POLI-0008 | POLI-0002 | POLI-0006 | execution |

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |

The attribute concept decouples what is measured from how it is stored. Rather than hardcoding columns for every possible property, the model defines attributes as first-class metadata entries—each with a name and a type—that describe the dimensions along which an entity can be observed. For attestation records, the attribute schema includes duration_seconds typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. The observation domain mirrors this structure precisely, reusing the same attribute names and types to ensure cross-domain comparability. This uniformity is not incidental; it allows governance queries to traverse attestation and observation records through a single, consistent attribute vocabulary, reducing the cognitive and operational overhead of maintaining separate schemas for related domains.

Value tables materialize the attribute-entity relationship by binding typed data to specific entity-attribute pairs. The model partitions values by their XML Schema type to preserve precision and enable type-safe operations: datetime values such as 2023-11-18T17:18:55 and 2024-04-18T06:27:25 reside in a dedicated value table alongside 2023-01-19T17:50:39 and 2025-06-04T16:32:01; decimal values like 2368.11, 5757.34, 785.50, and 5676.02 occupy their own store, as do integer values such as 407, 30, 633, and 373; and string values including gw-12, Log Level 02, closeout, and pending are held separately from execution and complete. Each value row carries an entity_id that points back to the entity it describes and an attr_id that resolves to the attribute definition, forming a triad that is both queryable and auditable. The same pattern repeats for observations, where decimal values 2405.99, 5333.00, 2745.86, and 5236.87, integer values 46, 468, 386, and 493, and string values gw-12, Log Level 02, execution, and complete are bound to their respective observation entities through identical entity-attribute-value triads.

The subclass mechanism extends this model by allowing entities to carry additional, domain-specific properties without modifying the core attribute schema. Records in the subclass table, identified by NOT-0001 through NOT-0004, carry paired values such as Not 01 and Not 2 01, Not 02 and Not 2 02, Not 03 and Not 2 03, Not 04 and Not 2 04, demonstrating how hierarchical or categorical distinctions can be encoded as entity-level metadata. This approach preserves the flat, queryable structure of the EAV core while providing a mechanism for specialized classification that does not require schema evolution.

Together, these constructs form a governance-ready data architecture. Identifiers provide deterministic anchors, attributes define the measurement vocabulary, types enforce semantic correctness, and value tables deliver the actual observations. The result is a system in which any compliance event—whether a System Access Certification with a duration of 2368.11 seconds, a host_name of gw-12, and an exit_code of 407, or an observation of core switch packet loss with a duration of 2745.86 seconds and an exit_code of 386—can be queried, joined, and audited through a uniform interface. The model scales not by adding columns, but by adding attribute definitions and value bindings, making it inherently adaptable to new compliance requirements, new observation types, and new classification schemes without schema migration.