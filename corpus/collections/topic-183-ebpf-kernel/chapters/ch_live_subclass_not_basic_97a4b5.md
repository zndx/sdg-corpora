---
chapter_id: ch_live_subclass_not_basic_97a4b5
topic_id: 183
family: 01_foundation
cited_terms: ['subclass_not_basic', 'bpf_helper_called_by', 'division_eligibility_constraint']
model: engine-refine
---

The data model centers on a flexible entity-attribute-value architecture where discrete entities are described through typed attributes whose values are stored separately by data type. Each entity receives a unique identifier—conventions such as `CALL-0001` for BPF helper records and `CONS-0001` for division eligibility constraints—providing the stable reference point across all attribute and value tables. Attributes themselves are defined by a name and a type, where the type governs how the value is stored and interpreted. Common attribute types include `xsd:string` for free-form text, `xsd:date` for calendar dates, and domain-specific types such as `cco:DesignativeICE`, which signals a specialized designator format. This separation of attribute definition from value storage allows the system to accommodate heterogeneous data without requiring a rigid, monolithic schema.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |

**t_division_eligibility_constraint**

| id | division_eligibility_constraint | qualified_athlete_status | cross_division_transfer |
| --- | --- | --- | --- |
| CONS-0001 | EasternLeagueNovice | AccreditedVeteran | CircuitReroute |
| CONS-0002 | MountainWestOpen | AccreditedVeteran | ZoneRedistribution |
| CONS-0003 | MountainWestOpen | EndorsedFreshman | SectorTransfer |
| CONS-0004 | SouthernTierPro | LicensedElite | LeagueBoundaryShift |
| CONS-0005 | CentralStateSenior | ClearedAllStar | TierDowngrade |
| CONS-0006 | AtlanticZoneJunior | SanctionedContender | ConferenceSwitch |
| CONS-0007 | GreatLakesAmateur | CertifiedPro | ZoneRedistribution |

**t_division_eligibility_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | encoding | xsd:string |
| CONS-0002 | label_text | xsd:string |
| CONS-0003 | language | xsd:string |

**t_division_eligibility_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | pre-release note |
| CONS-0003 | CONS-0001 | CONS-0003 | fr |
| CONS-0004 | CONS-0002 | CONS-0001 | Encoding 04 |
| CONS-0005 | CONS-0002 | CONS-0002 | intake form |
| CONS-0006 | CONS-0002 | CONS-0003 | es |
| CONS-0007 | CONS-0003 | CONS-0001 | Encoding 07 |
| CONS-0008 | CONS-0003 | CONS-0002 | audit excerpt |

Attribute values are materialized in type-specific value tables, each keyed by a composite of the entity and the attribute it describes. String-valued attributes appear in the varchar value table, where entries such as `1a4b6c2d`, `ARN:res/41`, and `proprietary` illustrate the range of textual data that can be attached to an entity. Integer values—`67`, `11`, `259`, `9`—reside in the integer value table, while date attributes store calendar values like `2024-07-02`, `2025-01-26`, and `2023-11-11` in the date value table. The same attribute can be referenced across multiple entities, and a single entity can carry multiple attributes of different types, creating a sparse but highly expressive property graph. This design supports extensibility: new attributes can be introduced without schema migrations, and values are always stored in the column type that matches their declared attribute type.

The BPF helper domain demonstrates this pattern in practice. A record identifying the `socket_connect_trace` helper, called by the `envoy` program, carries attributes such as `checksum` and `identifier` of type `xsd:string`, alongside `created_date` typed as `xsd:date` and `license` typed as `cco:DesignativeICE`. Each of these attributes resolves to a concrete value through the entity-attribute linkage, allowing the system to store program metadata without hardcoding fields. Similarly, the `lsm:inode_create` helper invoked by `falco` and the `tracepoint:sched_process_exit` helper called by `kubelet` follow the same attribute-value pattern, ensuring consistent querying and reporting across all BPF instrumentation records.

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | envoy |
| CALL-0002 | xdp_router | kubelet |
| CALL-0003 | lsm:inode_create | falco |
| CALL-0004 | tracepoint:sched_process_exit | kubelet |
| CALL-0005 | raw_tracepoint:sys_enter | kubelet |
| CALL-0006 | cgroup_skb_ingress | istiod |

**t_bpf_helper_called_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CALL-0001 | checksum | xsd:string |
| CALL-0002 | created_date | xsd:date |
| CALL-0003 | identifier | cco:DesignativeICE |
| CALL-0004 | license | xsd:string |
| CALL-0005 | mime_type | xsd:string |
| CALL-0006 | size_bytes | xsd:long |
| CALL-0007 | uri | xsd:string |
| CALL-0008 | version | xsd:integer |

**t_bpf_helper_called_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0002 | 2024-07-02 |
| CALL-0002 | CALL-0002 | CALL-0002 | 2025-01-26 |
| CALL-0003 | CALL-0003 | CALL-0002 | 2024-10-16 |
| CALL-0004 | CALL-0004 | CALL-0002 | 2023-11-11 |
| CALL-0005 | CALL-0005 | CALL-0002 | 2024-05-09 |
| CALL-0006 | CALL-0006 | CALL-0002 | 2025-02-22 |

**t_bpf_helper_called_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0006 | 67 |
| CALL-0002 | CALL-0001 | CALL-0008 | 11 |
| CALL-0003 | CALL-0002 | CALL-0006 | 259 |
| CALL-0004 | CALL-0002 | CALL-0008 | 9 |
| CALL-0005 | CALL-0003 | CALL-0006 | 333 |
| CALL-0006 | CALL-0003 | CALL-0008 | 11 |
| CALL-0007 | CALL-0004 | CALL-0006 | 103 |
| CALL-0008 | CALL-0004 | CALL-0008 | 4 |

**t_bpf_helper_called_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0001 | 1a4b6c2d |
| CALL-0002 | CALL-0001 | CALL-0003 | ARN:res/41 |
| CALL-0003 | CALL-0001 | CALL-0004 | proprietary |
| CALL-0004 | CALL-0001 | CALL-0009 | zone-b |
| CALL-0005 | CALL-0001 | CALL-0005 | application/octet-stream |
| CALL-0006 | CALL-0001 | CALL-0010 | Name 06 |
| CALL-0007 | CALL-0001 | CALL-0011 | data-engineering |
| CALL-0008 | CALL-0001 | CALL-0012 | Tags 08 |

Beyond infrastructure observability, the same architectural principles govern the athletic eligibility domain, where constraints encode the rules that determine which athletes may compete in which divisions. A division eligibility constraint such as `EasternLeagueNovice` or `MountainWestOpen` is paired with a qualified athlete status—`AccreditedVeteran`, `EndorsedFreshman`, or `LicensedElite`—and a cross-division transfer mechanism like `CircuitReroute`, `ZoneRedistribution`, `SectorTransfer`, or `LeagueBoundaryShift`. The cross-division transfer field captures how an athlete or program may move between competitive boundaries, whether through circuit-level reassignment, geographic zone redistribution, sector-level transfers, or formal league boundary shifts. These three dimensions—eligibility constraint, athlete qualification, and transfer pathway—form a composite rule that can be evaluated against roster data to enforce competitive integrity.

Attributes and values extend to the eligibility constraint domain as well. Constraints carry string-valued attributes such as `encoding` with values like `Encoding 01` and `Encoding 04`, descriptive `label_text` entries such as `pre-release note`, and `language` attributes with values like `fr`. These ancillary properties allow the system to attach metadata about how a constraint should be rendered, encoded, or localized without altering the core rule structure. The identifier `CONS-0001` ties together the constraint definition with its encoding, label, and language attributes, mirroring the same entity-attribute-value linkage used for BPF records. This uniformity across domains means that querying, auditing, and reporting follow a single pattern regardless of whether the entity represents a kernel-level tracing hook or a collegiate athletic eligibility rule.