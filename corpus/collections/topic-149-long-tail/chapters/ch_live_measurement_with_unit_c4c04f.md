---
chapter_id: ch_live_measurement_with_unit_c4c04f
topic_id: 149
family: 02_observation_measurement
cited_terms: ['measurement_with_unit', 'professional_experience', 'division_eligibility_constraint']
model: engine-refine
---

Within any structured data ecosystem, every distinct object is anchored by a unique identifier—a string such as `CONS-0001` or `EXPE-0001` that serves as the immutable handle for referencing that object across queries, relationships, and audits. These identifiers belong to entities, which are the fundamental units of meaning: a division eligibility constraint, a professional experience record, a measurement, or a unit of measure. An entity is not merely a row in a table; it is a conceptual thing that can possess properties, participate in relationships, and carry values. The entity model decouples what something is from how it is stored, allowing the same structural pattern to describe a person like Priya Sharma, an organization such as Nexus Data Corp or Quality Assurance, or a professional experience designation like CertifiedPro and ClearedAllStar.

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Blood pressure |
| UNIT-0002 | Ozone concentration |
| UNIT-0003 | Seismic magnitude |
| UNIT-0004 | Network latency |
| UNIT-0005 | Network latency |
| UNIT-0006 | Battery voltage |
| UNIT-0007 | Network latency |
| UNIT-0008 | Blood pressure |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |

**t_division_eligibility_constraint**

| id | division_eligibility_constraint | qualified_athlete_status | cross_division_transfer |
| --- | --- | --- | --- |
| CONS-0001 | EasternLeagueNovice | RegisteredAmateur | CircuitReroute |
| CONS-0002 | MountainWestOpen | RegisteredAmateur | ZoneRedistribution |
| CONS-0003 | MountainWestOpen | AuditedScholar | SectorTransfer |
| CONS-0004 | SouthernTierPro | Priya Sharma | LeagueBoundaryShift |
| CONS-0005 | CentralStateSenior | SanctionedContender | TierDowngrade |
| CONS-0006 | AtlanticZoneJunior | Sofia Rossi | ConferenceSwitch |
| CONS-0007 | GreatLakesAmateur | Marcus Chen | ZoneRedistribution |

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

Attributes and attribute types form the vocabulary through which entities are described. An attribute—recorded as `attr_name` in the schema—names a property of interest, such as `encoding`, `label_text`, or `language`. Each attribute is paired with an `attr_type` that declares its semantic shape, typically `xsd:string` in the current data, which signals that the attribute holds a text value. This two-level definition (name plus type) is itself an entity, stored in the attribute metadata table, and it enables a schema-on-read approach: new properties can be introduced without altering the underlying storage structure. For instance, the division eligibility constraint entity type declares that it may carry an `encoding` attribute of type `xsd:string` and a `language` attribute of the same type, allowing downstream systems to interpret these properties uniformly.

**t_division_eligibility_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | encoding | xsd:string |
| CONS-0002 | label_text | xsd:string |
| CONS-0003 | language | xsd:string |

Division eligibility constraints govern who may compete in which divisions, and they do so by combining a constraint label with status and transfer rules. A constraint such as `EasternLeagueNovice` or `MountainWestOpen` is paired with a `qualified_athlete_status`—values like `RegisteredAmateur`, `AuditedScholar`, or the person name `Priya Sharma`—and a `cross_division_transfer` mechanism that defines how an athlete moves between divisions. Transfer types include `CircuitReroute`, `ZoneRedistribution`, `SectorTransfer`, and `LeagueBoundaryShift`, each representing a distinct policy for handling cross-division movement. These constraints are themselves entities, meaning they can carry their own attributes: the `encoding` attribute might hold a value like `Encoding 01` or `Encoding 04`, while a `label_text` attribute could store a pre-release note, and a `language` attribute might be set to `fr`, indicating the constraint's display language.

Professional experience records capture the intersection of a person, an organization, and the technical context in which that experience is documented. Each record carries a `professional_experience` value—`CertifiedPro`, `ClearedAllStar`, `RegisteredAmateur`, or the name `Anika Patel`—alongside a `holder` (such as `ML Platform Unit` or `Governance Council`) and an `organization` (like `Nexus Data Corp` or `Systems Reliability`). Crucially, the record also specifies an `encoding` (one of `latin1`, `utf8`, or `ascii`) and a `language` (`fr`, `de`, `es`, or `ja`), ensuring that the experience data can be correctly interpreted and localized. The encoding field is not metadata about the database column; it is a domain-level attribute of the experience record itself, indicating the character set in which the experience description is encoded.

**t_professional_experience**

| id | professional_experience | holder | organization | encoding | language |
| --- | --- | --- | --- | --- | --- |
| EXPE-0001 | CertifiedPro | ML Platform Unit | Nexus Data Corp | latin1 | fr |
| EXPE-0002 | ClearedAllStar | Quality Assurance | Quality Assurance | utf8 | de |
| EXPE-0003 | RegisteredAmateur | Quantum Provenance | Systems Reliability | ascii | es |
| EXPE-0004 | Anika Patel | Governance Council | Quality Assurance | utf8 | ja |
| EXPE-0005 | Jonas Lindström | Atlas Infrastructure | Quantum Provenance | latin1 | es |
| EXPE-0006 | Liam O'Connor | ML Platform Unit | Stratos Cloud | ascii | es |
| EXPE-0007 | David Okonkwo | Platform Operations | Orion Telemetry Inc | ascii | fr |
| EXPE-0008 | David Okonkwo | Aegis Governance Ltd | Quality Assurance | utf8 | ja |

The value storage layer implements an entity-attribute-value (EAV) pattern that allows attributes to hold miscellaneous values without requiring a fixed column schema. In the constraint value table, each row links an `entity_id` (e.g., `CONS-0001`) to an `attr_id` (e.g., `CONS-0001` for the `encoding` attribute) and stores a `value` such as `Encoding 01`, `pre-release note`, or `fr`. This design means that a single entity can carry multiple attributes, each with its own value, and that new attributes can be added to an entity type simply by defining them in the attribute metadata table. The `misc` column accommodates any string value, making the system flexible enough to store everything from encoding declarations and language codes to free-text notes, all while maintaining referential integrity through the `entity_id` and `attr_id` foreign keys.