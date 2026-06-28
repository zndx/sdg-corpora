---
chapter_id: ch_live_subclass_to_designative_ice_e1f73b
topic_id: 7
family: 01_foundation
cited_terms: ['subclass_to_designative_ice', 'agent_with_role', 'mass_function_basic']
model: engine-refine
---

Agent role governance anchors operational accountability within distributed metadata systems by binding executable capacity to a stable identifier and a human-legible classification layer. Each role instance is keyed by a surrogate identifier—ROLE-0001 through ROLE-0004 in the reference population—and resolved against a role key such as ROLE-0005 or ROLE-0006 that may recur across multiple fact rows, signalling that distinct operational profiles can share a common authorization template while retaining independent audit trails. The dimension table supplies the interpretive surface: agent_role_label entries (Agent Role Label 01–04) furnish display and reporting semantics, while agent_role_category (Agent Role Category 01–04) partitions the role space into enforceable policy bands. Category assignment is not decorative; it determines which controls apply at ingestion, transformation, and publication, and it allows compliance reviewers to aggregate obligations without traversing implementation-specific keys.

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |

Identifier discipline extends beyond agent roles into subclass designatives and their attribute registries, where the same identifier namespace—ICE-0001, ICE-0002, ICE-0003, ICE-0004—serves both as entity keys and as foreign references in value tables. A designative such as CryoStream-Link or AeroFrost-ID names a governed artifact class; CryoVault-Label and IceSheet-Ref complete the quartet of subclass bindings that downstream systems must treat as authoritative labels rather than free text. Attributes are declared separately from values: attr_name records encoding, label_text, and language for ICE-0001 through ICE-0003, each bound to attr_type xsd:string, which constrains validation, serialization, and interchange without prescribing the business meaning of the attribute itself. This separation—declaration in the attribute catalog, instantiation in the value store—is the practical mechanism by which schema evolution can proceed without rewriting historical records.

**t_subclass_to_designative_ice**

| id | designative |
| --- | --- |
| ICE-0001 | CryoStream-Link |
| ICE-0002 | CryoVault-Label |
| ICE-0003 | AeroFrost-ID |
| ICE-0004 | IceSheet-Ref |
| ICE-0005 | CryoStream-Link |
| ICE-0006 | IceSheet-Ref |

**t_subclass_to_designative_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | encoding | xsd:string |
| ICE-0002 | label_text | xsd:string |
| ICE-0003 | language | xsd:string |

**t_subclass_to_designative_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | Encoding 01 |
| ICE-0002 | ICE-0001 | ICE-0002 | change rationale |
| ICE-0003 | ICE-0001 | ICE-0003 | es |
| ICE-0004 | ICE-0002 | ICE-0001 | Encoding 04 |
| ICE-0005 | ICE-0002 | ICE-0002 | nightly summary |
| ICE-0006 | ICE-0002 | ICE-0003 | fr |
| ICE-0007 | ICE-0003 | ICE-0001 | Encoding 07 |
| ICE-0008 | ICE-0003 | ICE-0002 | change rationale |

Entity–attribute–value resolution is the operational heart of the model. The entity_id field ties a concrete instance (ICE-0001, ICE-0002) to attribute identifiers (ICE-0001, ICE-0002, ICE-0003) and stores the resulting misc value: Encoding 01 and es for ICE-0001, change rationale for ICE-0002, Encoding 04 for ICE-0002 under a repeated attribute key. The misc column is deliberately polymorphic in label—it holds encodings, rationales, and locale codes—because governance systems routinely require a single storage pattern for heterogeneous attestations that share audit requirements but not semantic type. Practitioners must therefore treat misc not as an undifferentiated dump but as a typed payload whose interpretation is recoverable only through the attr_id join; a value of es is meaningless without the language attribute declaration, just as Encoding 04 is meaningless without the encoding attribute binding established for that entity.

Encoding and method constitute cross-cutting compliance dimensions that appear both as governed attributes and as first-class fields on mass-function records. In t_mass_function_basic, FUNC-0001 through FUNC-0004 associate measurable quantities—Filter cake, Effluent mass, Target mass, Total solids—with method automated or manual and with character encoding ascii or latin1. Automated handling of Filter cake under ascii encoding implies machine-parseable, normalized payloads suitable for straight-through validation; manual capture of Total solids under ascii signals human attestation with a constrained character set that must be honored at export. The parallel presence of encoding as an ICE attribute (with stored values Encoding 01 and Encoding 04) demonstrates layered encoding governance: transport-level character sets on mass functions coexist with domain-specific encoding designations on designative subclasses, and reconciling the two layers is a routine compliance task when evidence must be reproduced across jurisdictions or legacy systems.

**t_mass_function_basic**

| id | mass | method | encoding |
| --- | --- | --- | --- |
| FUNC-0001 | Filter cake | automated | ascii |
| FUNC-0002 | Effluent mass | manual | latin1 |
| FUNC-0003 | Target mass | automated | latin1 |
| FUNC-0004 | Total solids | manual | ascii |
| FUNC-0005 | Effluent mass | hybrid | latin1 |
| FUNC-0006 | Feedstock mass | automated | latin1 |

Fact-level agent records close the loop between role semantics and measurable operational footprint. Each fact row carries size_bytes—211345771, 458577289, 548859900, 20883723—and version—7, 1, 1, 12—alongside agent_role_key references that may duplicate across rows (ROLE-0006 appears twice; ROLE-0005 twice as well). Size_bytes supports retention policy, capacity planning, and evidentiary weighting: a role-associated artifact approaching five hundred megabytes triggers different archival and integrity-check schedules than one under twenty-one million bytes. Version governs compatibility and change control; version 7 on ROLE-0001 against version 12 on another ROLE-0005-keyed row signals asymmetric maturity within a shared role key family, requiring explicit migration rules before bulk reprocessing. Together, identifier stability, categorical role assignment, typed attributes, entity-bound values, encoding and method constraints, and fact-level size and version metadata form an interlocking evidence chain: every published assertion remains traceable to a named designative, a declared attribute type, a resolved entity value, and the agent role context under which the record was created or certified.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |