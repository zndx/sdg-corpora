---
chapter_id: ch_live_entity_match_link_4bfb65
topic_id: 172
family: 07_long_tail
cited_terms: ['entity_match_link', 'cardinality_exactly_one_generic', 'intermediate_floor_assembly']
model: engine-refine
---

In a robust data governance framework, establishing precise relationships between disparate data assets is paramount, with unique identifiers serving as the foundational anchors for traceability. The system achieves this through entity matching, where a central match link acts as the nexus connecting an originating entity to its corresponding reference or validation counterpart. For instance, a specific laboratory instrument, identified as SN-4491, is explicitly linked to a Reference standard RS-004 via a match link designated LINK-0001. Similarly, a Dataset versioned as v4.2.1 is matched to a Validation suite VS-605, while a Sample batch SB-2214 and a Governance policy DOC-992 maintain their own distinct linkage records. These relationships ensure that every entity maintains a verifiable connection to its counterpart, creating an auditable chain of custody for critical data assets.

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

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |

To enrich these relationships with contextual metadata, the framework employs a typed attribute system that captures the nuances of each match while enforcing semantic consistency. Attributes such as `confidence`, `dimension_kind`, `method`, and `recorded_at` are defined with strict data typing, ensuring that the metadata accurately reflects the nature of the data it describes. By assigning an attribute a specific type—such as `xsd:decimal` for numerical precision or `xsd:string` for categorical descriptors—the system guarantees that the metadata remains structurally sound. This structured approach allows for granular interrogation of the match, enabling operators to assess the reliability of a linkage or understand the specific methodology applied during the matching process.

The underlying architecture supports this flexibility through a specialized value storage mechanism that segregates data by its intrinsic type, often categorized under miscellaneous value containers depending on the operational context. Numerical attributes are persisted as precise decimals, such as a confidence score of 0.772 or a measurement of 448.20. Textual attributes capture descriptive details, ranging from categorical labels like "Dimension Kind 01" to narrative entries such as an "audit excerpt" or language codes like "es". Temporal attributes are strictly formatted as ISO 8601 datetimes, recording precise moments of activity, such as 2025-02-02T03:38:54. This separation of concerns ensures that complex, multi-faceted attributes can be stored and queried efficiently without compromising data integrity.

Beyond attribute metadata, the governance model enforces strict structural rules through cardinality constraints to prevent data ambiguity and ensure clear ownership. The system mandates specific hierarchy and ownership relationships, guaranteeing that critical resources are managed without conflict. For example, a CoreService is governed by an `ExclusiveOwner` cardinality, meaning it must belong to a single, unambiguous owner, while a SourceSystem is bound by a `StrictParent` relationship, enforcing a rigid hierarchical dependency. These cardinality rules—whether defining a `DesignatedOwner` or a `SingleSource` requirement—act as the structural backbone of the framework, ensuring that every entity operates within a well-defined organizational context.

In operational contexts, this relational precision extends to the physical mapping of infrastructure components, linking high-level structural units to their constituent parts. The framework tracks complex assemblies by documenting how an intermediate floor assembly, such as the Gearbox Intermediate Shelf or the Wing Spar Floor, incorporates specific hardware. For instance, a Motor Mount Deck is explicitly recorded as containing a Damping Mount, while a distinct configuration includes a Shear Pin Assembly. By systematically mapping lateral restraint straps and other critical fasteners to their parent assemblies, the system provides a comprehensive structural bill of materials that supports both maintenance workflows and physical integrity audits.

**t_intermediate_floor_assembly**

| id | intermediate_floor_assembly | contains_component |
| --- | --- | --- |
| ASSE-0001 | Gearbox Intermediate Shelf | Retaining Clip |
| ASSE-0002 | Motor Mount Deck | Locking Clevis |
| ASSE-0003 | Wing Spar Floor | Shear Pin Assembly |
| ASSE-0004 | Motor Mount Deck | Damping Mount |