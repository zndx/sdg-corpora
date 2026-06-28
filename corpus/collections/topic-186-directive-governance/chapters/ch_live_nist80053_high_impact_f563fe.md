---
chapter_id: ch_live_nist80053_high_impact_f563fe
topic_id: 186
family: 07_long_tail
cited_terms: ['nist80053_high_impact', 'division_eligibility_constraint', 'frame_refinement']
model: engine-refine
---

Identifiers serve as the immutable anchors of any structured data model, providing stable references that outlive the mutable content they point to. Whether tracking a NIST standard such as `IMPA-0001` (NIST SP 800-171) or an athletic eligibility constraint like `CONS-0001` (EasternLeagueNovice), the identifier column establishes a unique key that other tables can safely reference without ambiguity. These identifiers are not merely labels; they are the connective tissue that allows disparate tables to express relationships through foreign keys. An entity—whether it represents a compliance artifact, an eligibility rule, or a frame of reference—is first and foremost defined by its identifier, which then enables that entity to participate in cross-referencing structures. The same identifier may appear in multiple contexts: as a primary key in its owning table and as a foreign key in junction or value tables, always pointing back to the canonical definition.

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

Attributes and their types form the mechanism by which entities carry descriptive metadata in a normalized, schema-enforced fashion. Rather than embedding free-form properties directly into entity rows, the model separates attribute definitions from their values. A constraint such as `CONS-0001` (EasternLeagueNovice) acquires its descriptive properties through an attribute table that declares `attr_name` values like `encoding`, `label_text`, and `language`, each paired with an `attr_type` such as `xsd:string`. The actual values—`Encoding 01`, `pre-release note`, `fr`—reside in a dedicated value table that links back to both the entity and the attribute through foreign keys (`entity_id` and `attr_id`). This three-table pattern (entity → attribute definition → attribute value) decouples the schema from the data, allowing new attributes to be added without schema migrations and enabling type validation at the metadata level. The `misc` column in the value table holds the concrete string content, keeping it distinct from structural relationships.

Cross-division transfers and eligibility constraints represent domain-specific business rules that govern how entities may transition between categories or qualify for access. In the athletic domain, a `division_eligibility_constraint` such as `MountainWestOpen` is paired with a `qualified_athlete_status` like `EndorsedFreshman` and a `cross_division_transfer` mechanism such as `SectorTransfer`. These three columns together encode a complete policy: who qualifies, under what constraint, and through what transfer pathway. The transfer type itself—whether `CircuitReroute`, `ZoneRedistribution`, `LeagueBoundaryShift`, or `SectorTransfer`—describes the procedural mechanism by which an entity moves from one divisional context to another. Such constraints are not static; they carry their own attributes and values, meaning the rules governing transfers are themselves subject to the same metadata-driven extensibility as the entities they regulate.

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

Relationships between entities are expressed through junction tables that pair a `subject` with a `target` and assign a `role` to the relationship itself. In the NIST impact model, a standard like `IMPA-0003` (Zero Trust Architecture) connects to an impact level such as `IMPA-0003` (Severity-Medium) through a cross-reference row that records the role—`contributor`, `reviewer`, or `observer`—as a first-class property of the link. This role column is critical: it transforms a simple many-to-many association into a semantically rich relationship where the nature of the connection is explicitly modeled. The same pattern appears in frame refinement, where a frame like `REFI-0003` (Data Lake Partition Schema) refines another frame (`REFI-0006`) with the role of `contributor`, while `REFI-0002` (Lab Sample Container Type) refines the same target with the role of `reviewer`. The subject-target-role triad ensures that relationships are not only navigable but interpretable.

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |

Across these domains, the recurring structural pattern is one of separation of concerns: identifiers anchor entities, attributes describe them, values instantiate those descriptions, and junction tables with roles express how entities relate to one another. The NIST compliance framework uses this structure to map standards to impact levels with defined responsibilities; the athletic eligibility system applies it to encode transfer rules and qualification criteria; the frame refinement model leverages it to capture hierarchical refinement relationships. In each case, the foreign-key relationships between `subject` and `target` columns, mediated by role, provide a uniform mechanism for expressing relationships that are themselves first-class data—queryable, auditable, and extensible without schema changes.

**t_nist80053_high_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | NIST SP 800-171 |
| IMPA-0002 | NIST SP 800-61 |
| IMPA-0003 | Zero Trust Architecture |
| IMPA-0004 | NIST SP 800-161 |
| IMPA-0005 | Zero Trust Architecture |
| IMPA-0006 | NIST SP 800-171 |

**t_nist80053_high_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate |
| IMPA-0002 | Tier-4 |
| IMPA-0003 | Severity-Medium |
| IMPA-0004 | Compliance-Low |
| IMPA-0005 | Essential |
| IMPA-0006 | Controlled-High |

**t_nist80053_high_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | IMPA-0002 | contributor |
| IMPA-0002 | IMPA-0003 | IMPA-0003 | contributor |
| IMPA-0003 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0004 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0005 | IMPA-0005 | IMPA-0002 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0006 | contributor |
| IMPA-0007 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0008 | IMPA-0001 | IMPA-0001 | reviewer |

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | Regulatory Audit Trail |
| REFI-0002 | Lab Sample Container Type |
| REFI-0003 | Data Lake Partition Schema |
| REFI-0004 | Regulatory Audit Trail |
| REFI-0005 | Data Lake Partition Schema |
| REFI-0006 | ISO 9001 Quality Framework |