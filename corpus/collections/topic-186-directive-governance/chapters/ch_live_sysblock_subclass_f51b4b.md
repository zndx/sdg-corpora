---
chapter_id: ch_live_sysblock_subclass_f51b4b
topic_id: 186
family: 01_foundation
cited_terms: ['sysblock_subclass', 'entity_match_link', 'ice_with_existential']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers form the foundational vocabulary of any structured data model, serving as the mechanisms by which real-world objects and their properties are captured, typed, and related. An entity represents a distinct thing of interest—a physical component, a document, a process, or a relationship—and is distinguished by a unique identifier. In the system block domain, entities such as the Telemetry Hub Unit (SYSB-0001), the Governance Registry Core (SYSB-0002), the Stream Processor Node (SYSB-0003), and the Lab Instrument Controller (SYSB-0004) each carry a structured identifier and a descriptive name, while also declaring their constituent parts through a has_part relationship that references components like the Memory Controller Die or the Network Interface Card. These identifiers are not arbitrary; they follow a consistent naming convention that enables reliable cross-referencing across the entire data model.

Attribute types define the shape and semantics of the properties that entities can possess. Rather than embedding type information directly into values, the model separates attribute metadata from attribute values, allowing a single attribute definition to govern multiple instances. For system block subclasses, attributes such as checksum, created_date, identifier, and license are declared with precise types including xsd:string, xsd:date, cco:DesignativeICE, and xsd:string respectively. This separation of schema from data means that the same attribute definition can be applied across different entity instances, and the type system enforces consistency—ensuring that a created_date value is always a date, and that a checksum is always a string. The use of standardized types like xsd:date and xsd:dateTime, alongside domain-specific types like cco:DesignativeICE, reflects a layered approach to typing that balances interoperability with domain precision.

**t_sysblock_subclass**

| id | sysblock | has_part |
| --- | --- | --- |
| SYSB-0001 | Telemetry Hub Unit | Memory Controller Die |
| SYSB-0002 | Governance Registry Core | Network Interface Card |
| SYSB-0003 | Stream Processor Node | Network Interface Card |
| SYSB-0004 | Lab Instrument Controller | Network Interface Card |
| SYSB-0005 | Stream Processor Node | SFP Transceiver Module |
| SYSB-0006 | Telemetry Hub Unit | SFP Transceiver Module |

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

Attribute values are stored in type-specific value tables, a design choice that optimizes storage and query performance while preserving type safety. Date values such as 2024-02-28, 2023-05-14, 2025-03-07, and 2025-03-22 reside in the date value table, integer values like 221, 12, 94, and 3 in the integer value table, and string values such as a3f9c21e, oid:1.3.6.1, MIT, and zone-b in the varchar value table. Each value record links back to its entity through an entity_id foreign key and to its attribute definition through an attr_id foreign key, creating a clear trace from raw data to its semantic meaning. This three-way linkage—entity, attribute, value—ensures that every stored value is fully contextualized and queryable by any of its three dimensions.

Entity match links extend the model beyond isolated entities by capturing relationships between them, along with the attributes that qualify those relationships. A match link is itself an entity with its own identifier—LINK-0001 through LINK-0004—and connects an entity such as Lab instrument SN-4491 or Sample batch SB-2214 to a matching entity like Reference standard RS-004 or Validation suite VS-605. The quality and nature of each match are described by attributes including confidence (typed as xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). Confidence scores such as 0.249 and 0.772 quantify the strength of a match, while recorded_at timestamps like 2025-02-02T03:38:54 and 2024-07-01T04:17:43 provide an audit trail. Dimension values such as Dimension Kind 01 and Encoding 02, along with language codes like es and de, further characterize the match context.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

The ice_with_existential construct captures a different kind of relationship—one between an independent component entity and the contextual conditions under which it applies. Entities such as Batch Processing Rule, Metadata Schema Version, Provenance Trace Identifier, and Sampling Frequency Specification are each related to contextual factors like Laboratory Zone B, Hydraulic Pressure Range, and Network Latency Budget. These relationships carry their own attributes, including encoding, label_text, and language, all typed as xsd:string, with values such as Encoding 01, audit excerpt, de, and Encoding 04. This pattern allows the model to express not just what entities exist and how they relate, but also the conditions and metadata that govern their applicability, providing a rich, queryable representation of complex operational knowledge.

**t_ice_with_existential**

| id | ice | related |
| --- | --- | --- |
| EXIS-0001 | Batch Processing Rule | Laboratory Zone B |
| EXIS-0002 | Metadata Schema Version | Hydraulic Pressure Range |
| EXIS-0003 | Provenance Trace Identifier | Network Latency Budget |
| EXIS-0004 | Sampling Frequency Specification | Laboratory Zone B |
| EXIS-0005 | Provenance Trace Identifier | Field Sampling Site |
| EXIS-0006 | Quality Control Checkpoint | Laboratory Zone B |
| EXIS-0007 | Instrument Serial Registry | Ambient Air Temperature |
| EXIS-0008 | Provenance Trace Identifier | ISO 8601 Timestamp |

**t_ice_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | encoding | xsd:string |
| EXIS-0002 | label_text | xsd:string |
| EXIS-0003 | language | xsd:string |

**t_ice_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | Encoding 01 |
| EXIS-0002 | EXIS-0001 | EXIS-0002 | audit excerpt |
| EXIS-0003 | EXIS-0001 | EXIS-0003 | de |
| EXIS-0004 | EXIS-0002 | EXIS-0001 | Encoding 04 |
| EXIS-0005 | EXIS-0002 | EXIS-0002 | change rationale |
| EXIS-0006 | EXIS-0002 | EXIS-0003 | de |
| EXIS-0007 | EXIS-0003 | EXIS-0001 | Encoding 07 |
| EXIS-0008 | EXIS-0003 | EXIS-0002 | pre-release note |