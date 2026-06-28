---
chapter_id: ch_live_agent_basic_d5b77a
topic_id: 35
family: 05_provo_lineage
cited_terms: ['agent_basic', 'claim_with_belief_interval', 'sysblock_subclass']
model: engine-refine
---

The governance architecture distinguishes between operational agents and the system blocks they govern, each identified through a stable, versioned registry. Agent entities are tracked in a fact table that records their unique identifiers—such as AGEN-0001 through AGEN-0004—alongside their canonical agent keys, which may differ from their row identifiers; agent AGEN-0003, for instance, carries the key AGEN-0004, while two distinct agents share the key AGEN-0004, indicating that agent keys serve as logical groupings rather than unique handles. Each agent carries a version number—ranging from 1 to 12—and a size in bytes, with values spanning from approximately 20 megabytes for AGEN-0004 to nearly 549 megabytes for AGEN-0003, reflecting the heterogeneous resource footprints of deployed components. A companion dimension table enriches these identifiers with human-readable labels, such as Agent Label 01, and categorical classifications like Agent Category 01, enabling downstream queries to filter or aggregate agents by functional domain rather than by opaque identifier alone.

**fact_agent**

| id | agent_key | size_bytes | version |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | 211345771 | 7 |
| AGEN-0002 | AGEN-0003 | 458577289 | 1 |
| AGEN-0003 | AGEN-0004 | 548859900 | 1 |
| AGEN-0004 | AGEN-0004 | 20883723 | 12 |
| AGEN-0005 | AGEN-0006 | 490849751 | 11 |

**dim_agent**

| id | agent_label | agent_category |
| --- | --- | --- |
| AGEN-0001 | Agent Label 01 | Agent Category 01 |
| AGEN-0002 | Agent Label 02 | Agent Category 02 |
| AGEN-0003 | Agent Label 03 | Agent Category 03 |
| AGEN-0004 | Agent Label 04 | Agent Category 04 |
| AGEN-0005 | Agent Label 05 | Agent Category 05 |
| AGEN-0006 | Agent Label 06 | Agent Category 06 |

**t_sysblock_subclass**

| id | sysblock | has_part |
| --- | --- | --- |
| SYSB-0001 | Telemetry Hub Unit | INTE-0003 |
| SYSB-0002 | Governance Registry Core | INTE-0005 |
| SYSB-0003 | Stream Processor Node | INTE-0005 |
| SYSB-0004 | Lab Instrument Controller | INTE-0004 |
| SYSB-0005 | Stream Processor Node | INTE-0002 |
| SYSB-0006 | Telemetry Hub Unit | INTE-0001 |

Claims and their associated belief intervals constitute a parallel governance layer, capturing operational assertions and the confidence with which they are held. Claims such as "Network bandwidth saturated" or "Compliance audit passed" are recorded with identifiers like INTE-0001 and INTE-0004, and each is paired with a belief interval that quantifies uncertainty—expressed either as ordinal tiers ("low medium high tier") or as numeric ranges ("0.75 to 0.88 interval"). The relationship between claims and belief intervals is mediated by a junction table that assigns a role to each pairing: the same belief interval, identified as INTE-0002, is linked to two different claims (INTE-0001 and INTE-0004) under the role of reviewer, while also appearing as the target of a claim where the role is owner. This role distinction—reviewer versus owner—establishes accountability for each claim-belief association, ensuring that confidence assessments are traceable to responsible parties.

**t_claim_with_belief_interval**

| id | claim |
| --- | --- |
| INTE-0001 | Network bandwidth saturated |
| INTE-0002 | Network bandwidth saturated |
| INTE-0003 | API response time degraded |
| INTE-0004 | Compliance audit passed |
| INTE-0005 | Compliance audit passed |
| INTE-0006 | Server CPU exceeds threshold |

**t_claim_with_belief_interval_belief_interval**

| id | belief_interval |
| --- | --- |
| INTE-0001 | low medium high tier |
| INTE-0002 | 0.75 to 0.88 interval |
| INTE-0003 | 0.75 to 0.88 interval |
| INTE-0004 | plus minus two units |
| INTE-0005 | 70 to 85 percent range |
| INTE-0006 | medium certainty window |
| INTE-0007 | 0.75 to 0.88 interval |
| INTE-0008 | 0.8 to 0.95 certainty |

**t_claim_with_belief_interval__belief_interval**

| id | claim_id | belief_interval_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0005 | reviewer |
| INTE-0002 | INTE-0001 | INTE-0002 | owner |
| INTE-0003 | INTE-0001 | INTE-0004 | reviewer |
| INTE-0004 | INTE-0004 | INTE-0002 | reviewer |
| INTE-0005 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0006 | INTE-0006 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0002 | INTE-0001 | contributor |
| INTE-0008 | INTE-0001 | INTE-0007 | reviewer |

System blocks form the structural backbone of the governed environment, with entries such as Telemetry Hub Unit, Governance Registry Core, Stream Processor Node, and Lab Instrument Controller each carrying a unique identifier and a decomposition into constituent parts. The has_part relationship links a system block to its subcomponents by identifier; for example, the Stream Processor Node (SYSB-0003) contains INTE-0005, while the Lab Instrument Controller (SYSB-0004) contains INTE-0004, demonstrating that subcomponent identifiers are drawn from the same namespace as claim identifiers, enabling cross-referencing between structural and operational governance layers. This unified identifier space means that a single entity—say, INTE-0005—can simultaneously function as a subcomponent of a system block and as a belief interval associated with a claim, supporting a coherent ontology across governance domains.

Attributes and their values are modeled through a schema-on-read pattern that separates attribute definitions from their concrete instantiations. The attribute definition table records names such as checksum, created_date, identifier, and license, each annotated with a type from a formal vocabulary: xsd:string for textual values, xsd:date for temporal data, and cco:DesignativeICE for designative identifiers. Values are materialized in three type-specific tables—date, integer, and varchar—each linking an entity (identified by its system block ID) to an attribute (identified by its attribute ID) and storing the actual value. A created_date attribute, for instance, is associated with system block SYSB-0001 and holds the value 2024-02-28, while the same attribute is recorded for SYSB-0002 as 2023-05-14, SYSB-0003 as 2025-03-07, and SYSB-0004 as 2025-03-22, establishing a temporal provenance for each governed component. Integer attributes capture numeric properties—values such as 221, 12, 94, and 3 are stored against attributes SYSB-0006 and SYSB-0008 for entities SYSB-0001 and SYSB-0002—while varchar attributes hold heterogeneous string data, including a checksum value of a3f9c21e, an OID reference of oid:1.3.6.1, the string MIT, and the zone designation zone-b, all associated with entity SYSB-0001 across attributes SYSB-0001, SYSB-0003, SYSB-0004, and SYSB-0009. This separation of attribute schema from value storage enables flexible extension of the governed model without schema migration, while the type annotations ensure that values are interpreted correctly across the governance framework.

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