---
chapter_id: ch_live_soc2_trust_criterion_17bdaf
topic_id: 125
family: 07_long_tail
cited_terms: ['soc2_trust_criterion', 'sample_subclass', 'belief_interval_for_claim']
model: engine-refine
---

Attribute definitions constitute the semantic backbone of the compliance framework, where each attribute—designated by a human-readable name such as `effective_date`, `enforcement`, `mandatory`, or `priority`—is bound to a strict type constraint drawn from the XML Schema definition space. The type discipline is explicit: `xsd:date` governs temporal attributes, `xsd:string` accommodates free-form text, `xsd:boolean` restricts values to binary truth assignments, and `xsd:integer` enforces whole-number cardinality. This type-level separation is not merely declarative; it drives a physical partitioning of value storage across four distinct tables, each dedicated to a single type family. Boolean attributes such as `mandatory` are persisted in a dedicated boolean value table, where rows link an entity identifier to an attribute identifier and carry a value of either `true` or `false`. Date attributes like `effective_date` reside in a parallel date table, storing concrete calendar dates such as `2025-04-05` and `2024-03-02`. Integer attributes, exemplified by `priority`, are stored with values ranging from `2` to `767`, while string-valued attributes capture textual content including `Encoding 01`, `Enforcement 02`, and `change rationale`. The type-safe partitioning ensures that queries against attribute values can be routed to the appropriate storage table without runtime type coercion, and it enforces schema-level integrity at the point of insertion.

The entity model anchors every attribute-value pair to a subject of assessment, with entities identified by structured reference strings that follow a consistent naming convention. Trust criterion records map identifiers such as `CRIT-0001` through `CRIT-0004` to named organizations—`CyberShield Ltd`, `DataVault Inc`, `CloudScale Services`, and `HealthSys Networks`—and associate each with a trust criterion code like `CLAI-0005` or `CLAI-0003`. These identifiers serve as the primary keys for all attribute-value relationships, enabling a many-to-many structure where a single entity can carry multiple attributes and a single attribute definition can be instantiated across numerous entities. The foreign-key linkage between the attribute definition table and the typed value tables is expressed through the `attr_id` column, which references the identifier of the attribute being instantiated, while the `entity_id` column in each value table points back to the entity being described. This bidirectional navigability supports both entity-centric queries—retrieving all attributes of `CyberShield Ltd`—and attribute-centric queries—finding all entities that have `mandatory` set to `true`.

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | CLAI-0005 |
| CRIT-0002 | DataVault Inc | CLAI-0004 |
| CRIT-0003 | CloudScale Services | CLAI-0006 |
| CRIT-0004 | HealthSys Networks | CLAI-0003 |
| CRIT-0005 | RetailChain Partners | CLAI-0006 |
| CRIT-0006 | FinTech Global | CLAI-0002 |

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

Location and identifier semantics extend beyond the compliance domain into the provenance tracking of physical and logical samples. The sample subclass table records observations such as `ENV-WATER-7B`, `TELEMETRY-PKG-9`, `TRACE-CACHE-5`, and `SEDIMENT-LAKE-9`, each collected from a source identified by codes like `CLAI-0002` and `CLAI-0004`. Provenance is captured through heterogeneous identifier formats: URN-style references such as `gid://svc/77`, opaque alphanumeric strings like `ref-8842`, and DOI-resolved identifiers including `doi:10.1109/x`. These identifiers are not merely labels; they encode the namespace and resolution protocol of the originating system, enabling cross-referencing between disparate data sources. The `location` column complements this by recording the physical or logical placement of each sample, with values spanning cloud regions (`us-east-1`, `ap-south-2`), rack-level positions (`rack-7`), and on-premises data centers (`on-prem-dc1`). The co-occurrence of location and identifier within the same record establishes a verifiable chain of custody, where the provenance of a sample can be traced from its collection point through to its analytical destination.

**t_sample_subclass**

| id | sample | collected_from | identifier | location |
| --- | --- | --- | --- | --- |
| SAMP-0001 | ENV-WATER-7B | CLAI-0002 | gid://svc/77 | us-east-1 |
| SAMP-0002 | TELEMETRY-PKG-9 | CLAI-0002 | gid://svc/77 | rack-7 |
| SAMP-0003 | TRACE-CACHE-5 | CLAI-0004 | ref-8842 | on-prem-dc1 |
| SAMP-0004 | SEDIMENT-LAKE-9 | CLAI-0003 | doi:10.1109/x | ap-south-2 |
| SAMP-0005 | TELEMETRY-PKG-9 | CLAI-0004 | ref-8842 | on-prem-dc1 |
| SAMP-0006 | ENV-WATER-7B | CLAI-0002 | doi:10.1109/x | us-east-1 |

Measurement claims are classified by dimension kind, a categorical attribute that specifies the physical or abstract quantity being measured. The belief interval table associates qualitative observations—`Network packet loss`, `CPU utilization rate`, `Checksum mismatch found`, `Pipeline latency elevated`—with sample claims such as `SAMP-0005` and `SAMP-0006`, and assigns each claim a dimension kind drawn from the set {`time`, `length`, `count`, `mass`}. These dimension kinds are not decorative; they determine the interpretation of the associated numeric value, which ranges from `457.08` to `866.46` across the observed records. A claim with dimension kind `count` and value `659.49` represents a different class of measurement than one with dimension kind `mass` and value `457.08`, even though both are stored in the same column. The dimension kind thus acts as a type-level discriminator within a unified value column, enabling the system to store heterogeneous measurements without requiring separate tables for each physical quantity. This design mirrors the type-safe partitioning used for attribute values, but applies the principle at the level of measurement semantics rather than data type, ensuring that quantitative claims are interpreted correctly regardless of their source.

**t_belief_interval_for_claim**

| id | belief | for_claim | dimension_kind | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Network packet loss | SAMP-0005 | time | 547.06 |
| CLAI-0002 | CPU utilization rate | SAMP-0004 | length | 866.46 |
| CLAI-0003 | Checksum mismatch found | SAMP-0005 | count | 659.49 |
| CLAI-0004 | Pipeline latency elevated | SAMP-0006 | mass | 457.08 |
| CLAI-0005 | Token expiration imminent | SAMP-0006 | count | 592.24 |
| CLAI-0006 | Memory leak probability | SAMP-0003 | time | 852.17 |