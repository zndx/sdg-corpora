---
chapter_id: ch_live_ebpfprogram_attaches_kernelhook_xref_674ef7
topic_id: 23
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_attaches_kernelhook_xref', 'schemaorg_place_address', 'claim_min_one_evidence']
model: engine-refine
---

In systems of record that must accommodate heterogeneous data without rigid schema constraints, the distinction between an entity and its attributes forms the foundational architecture for flexible yet queryable information models. An entity—whether designated as a BPF program such as dns_query_parser or network_latency_tracker, an institutional place like CERN Main Campus or the Smithsonian Institution, or a substantive claim such as Antibiotic resistance rising or Glacier mass loss accelerating—serves as the primary anchor point for all associated metadata. Each entity receives a stable identifier, XREF-0001 through XREF-0004 for programmatic objects, ADDR-0001 through ADDR-0004 for geographic or organizational locations, and EVID-0001 through EVID-0004 for evidentiary claims, providing a consistent addressing mechanism across domains. The entity itself carries a descriptive label, but the richness of its representation emerges through the attribute-value pairs that attach to it, decoupled from the entity's core identity to permit schema evolution without structural disruption.

**t_ebpfprogram_attaches_kernelhook_xref**

| id | ebpfprogram |
| --- | --- |
| XREF-0001 | dns_query_parser |
| XREF-0002 | network_latency_tracker |
| XREF-0003 | block_io_monitor |
| XREF-0004 | tcp_retrans_monitor |
| XREF-0005 | tcp_retrans_monitor |
| XREF-0006 | syscall_trace_logger |

**t_ebpfprogram_attaches_kernelhook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | checksum | xsd:string |
| XREF-0002 | created_date | xsd:date |
| XREF-0003 | identifier | cco:DesignativeICE |
| XREF-0004 | license | xsd:string |
| XREF-0005 | mime_type | xsd:string |
| XREF-0006 | size_bytes | xsd:long |
| XREF-0007 | uri | xsd:string |
| XREF-0008 | version | xsd:integer |

**t_ebpfprogram_attaches_kernelhook_xref_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2025-04-17 |
| XREF-0002 | XREF-0002 | XREF-0002 | 2025-02-23 |
| XREF-0003 | XREF-0003 | XREF-0002 | 2025-06-16 |
| XREF-0004 | XREF-0004 | XREF-0002 | 2023-07-21 |
| XREF-0005 | XREF-0005 | XREF-0002 | 2024-01-20 |
| XREF-0006 | XREF-0006 | XREF-0002 | 2025-03-02 |

**t_ebpfprogram_attaches_kernelhook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0006 | 268 |
| XREF-0002 | XREF-0001 | XREF-0008 | 11 |
| XREF-0003 | XREF-0002 | XREF-0006 | 212 |
| XREF-0004 | XREF-0002 | XREF-0008 | 1 |
| XREF-0005 | XREF-0003 | XREF-0006 | 251 |
| XREF-0006 | XREF-0003 | XREF-0008 | 5 |
| XREF-0007 | XREF-0004 | XREF-0006 | 130 |
| XREF-0008 | XREF-0004 | XREF-0008 | 6 |

**t_ebpfprogram_attaches_kernelhook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 7b14de08 |
| XREF-0002 | XREF-0001 | XREF-0003 | ref-8842 |
| XREF-0003 | XREF-0001 | XREF-0004 | Apache-2.0 |
| XREF-0004 | XREF-0001 | XREF-0009 | ap-south-2 |
| XREF-0005 | XREF-0001 | XREF-0005 | application/octet-stream |
| XREF-0006 | XREF-0001 | XREF-0010 | Name 06 |
| XREF-0007 | XREF-0001 | XREF-0011 | platform-team |
| XREF-0008 | XREF-0001 | XREF-0012 | Tags 08 |

Attributes constitute the dimensional vocabulary through which entities are characterized, each attribute defined by a name and a type that governs the shape of permissible values. The attribute created_date, typed as xsd:date, captures temporal information with the precision of ISO 8601 formatting, yielding values such as 2025-04-17 and 2023-07-21 that anchor entities to specific points in time. The attribute checksum, typed as xsd:string, accommodates hexadecimal identifiers like 7b14de08, while the attribute license, also xsd:string, stores human-readable designations such as Apache-2.0. More specialized type annotations, including cco:DesignativeICE for the identifier attribute, signal domain-specific semantics that extend beyond generic string typing, enabling downstream systems to interpret values with appropriate rigor. This type-level discipline ensures that despite the flexibility of an attribute-value model, data integrity is preserved through schema-enforced value constraints.

The separation of attribute values by type into dedicated storage tables—date values in one structure, integer values in another, and variable-length strings in a third—reflects a practical engineering compromise between normalization and query performance. Integer-valued attributes such as those holding the values 268, 11, 212, and 1 are stored separately from string-valued attributes like ref-8842 or ap-south-2, allowing each table to optimize its storage layout for the specific data type it contains. This type-partitioned design means that a single entity, identified by entity_id XREF-0001, may simultaneously carry a date value of 2025-04-17 from the date table, an integer value of 268 from the integer table, and a string value of 7b14de08 from the varchar table, all linked through a common attr_id that references the attribute definition. The entity thus becomes a composite of values distributed across multiple tables, unified only by the foreign keys that bind them.

Beyond attribute-value relationships, entities participate in inter-entity associations that are themselves characterized by roles, introducing a ternary relationship model where the nature of the connection between two entities is as significant as the connection itself. The association between a place entity and a postal address entity is mediated through a cross-reference table that carries not only the subject identifier (schemaorg_id) and the target identifier (postal_address_id) but also a role designation that specifies the functional relationship. The address 700 1st Ave, when linked to CERN Main Campus, carries the role contributor, while the same place entity, when associated with 2875 Broadway, assumes the role reviewer. This role-bearing relationship model extends to evidentiary associations as well: the claim Deforestation rate doubled is linked to supporting evidence through a relationship table where the role contributor identifies which evidence item substantiates the claim, and the role reviewer identifies which evidence item evaluates it.

**t_schemaorg_place_address**

| id | schemaorg |
| --- | --- |
| ADDR-0001 | CERN Main Campus |
| ADDR-0002 | Smithsonian Institution |
| ADDR-0003 | Royal Society |
| ADDR-0004 | UN Secretariat |
| ADDR-0005 | Royal Society |
| ADDR-0006 | RAND Corporation |
| ADDR-0007 | CERN Main Campus |

**t_schemaorg_place_address_postal_address**

| id | postal_address |
| --- | --- |
| ADDR-0001 | 700 1st Ave |
| ADDR-0002 | 350 Fifth Ave |
| ADDR-0003 | 2875 Broadway |
| ADDR-0004 | 1000 Independence Ave |
| ADDR-0005 | 1 Infinite Loop |
| ADDR-0006 | 1000 Independence Ave |

**t_schemaorg_place_address__postal_address**

| id | schemaorg_id | postal_address_id | role |
| --- | --- | --- | --- |
| ADDR-0001 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0002 | ADDR-0004 | ADDR-0001 | contributor |
| ADDR-0003 | ADDR-0001 | ADDR-0006 | reviewer |
| ADDR-0004 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0005 | ADDR-0002 | ADDR-0005 | observer |
| ADDR-0006 | ADDR-0004 | ADDR-0005 | contributor |
| ADDR-0007 | ADDR-0004 | ADDR-0003 | owner |
| ADDR-0008 | ADDR-0003 | ADDR-0001 | observer |

**t_claim_min_one_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Antibiotic resistance rising |
| EVID-0002 | Glacier mass loss accelerating |
| EVID-0003 | Antibiotic resistance rising |
| EVID-0004 | Deforestation rate doubled |
| EVID-0005 | Ocean acidity increased 0.3 |
| EVID-0006 | Ocean acidity increased 0.3 |
| EVID-0007 | Deforestation rate doubled |

**t_claim_min_one_evidence_supported_by_evidence**

| id | supported_by_evidence |
| --- | --- |
| EVID-0001 | Lancet longitudinal cohort study |
| EVID-0002 | Lancet longitudinal cohort study |
| EVID-0003 | ICES marine ecosystem index |
| EVID-0004 | WHO mortality surveillance Q3 |
| EVID-0005 | WHO mortality surveillance Q3 |
| EVID-0006 | EPA ambient monitor 7B |
| EVID-0007 | IPCC AR6 synthesis report |
| EVID-0008 | ICES marine ecosystem index |

**t_claim_min_one_evidence__supported_by_evidence**

| id | claim_id | supported_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0004 | EVID-0002 | contributor |
| EVID-0002 | EVID-0003 | EVID-0007 | reviewer |
| EVID-0003 | EVID-0007 | EVID-0004 | owner |
| EVID-0004 | EVID-0007 | EVID-0005 | contributor |
| EVID-0005 | EVID-0005 | EVID-0004 | reviewer |
| EVID-0006 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0007 | EVID-0007 | EVID-0003 | reviewer |
| EVID-0008 | EVID-0004 | EVID-0004 | owner |

The subject and target terminology in these relationship tables formalizes the directional nature of associations, where the subject is the entity initiating or owning the relationship and the target is the entity receiving or being referenced by it. In the evidentiary domain, the claim EVID-0004 serves as the subject when linked to the supporting evidence EVID-0002 with the role contributor, establishing that the evidence item contributes to the claim's substantiation. Conversely, the claim EVID-0007 appears as the subject in two distinct relationships: one where EVID-0004 is the target with the role owner, indicating ownership of the claim, and another where EVID-0005 is the target with the role contributor, indicating that a second evidence item also supports the same claim. This multiplicity of relationships from a single subject to multiple targets, differentiated by role, enables rich knowledge graphs where the same pair of entities can participate in multiple semantically distinct associations.

Identifier stability across all three relationship layers—the entity identifier, the attribute identifier, and the relationship identifier—provides the connective tissue that makes this distributed model coherent. The identifier XREF-0001 appears as a primary key in the entity table, as an entity_id in the value tables, and as a relationship identifier in the cross-reference structure, creating a consistent addressing namespace. Similarly, the address identifiers ADDR-0001 through ADDR-0004 serve as primary keys in the place table, as postal_address values in the address table, and as both subject and target foreign keys in the relationship table. This identifier consistency ensures that queries can traverse from entity to attribute to value to related entity without ambiguity, maintaining referential integrity across a schema that deliberately avoids the rigidity of a fully normalized relational model while preserving the queryability that such normalization provides.