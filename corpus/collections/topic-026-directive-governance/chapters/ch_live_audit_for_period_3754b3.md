---
chapter_id: ch_live_audit_for_period_3754b3
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_for_period', 'division_eligibility_constraint', 'subclass_to_independent_continuant']
model: engine-refine
---

The architecture of the system rests on a tripartite distinction between entities, their attributes, and the values those attributes assume—a pattern that recurs across every domain of the data model. An entity functions as the anchor point for all descriptive metadata, whether it denotes a physical asset such as a Firewall Appliance 7 or a Server Rack 14A, or an abstract constraint governing athletic eligibility such as the MountainWestOpen division. Each entity carries a stable identifier—CONT-0001 through CONT-0004 for infrastructure continuants, CONS-0001 through CONS-0004 for eligibility constraints—that persists independently of the attribute values attached to it. The attribute itself is a named property, decoupled from any particular value, with a declared type that constrains the domain of acceptable assignments: xsd:string for free-form text like location or name, cco:Person for structured person references, and xsd:string for tag collections. This separation of attribute definition from attribute value enables the same schema to describe both the on-prem-dc1 location of a server rack and the Encoding 01 designation of an eligibility constraint, without requiring schema migration when new properties are introduced.

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

**t_subclass_to_independent_continuant**

| id | independent |
| --- | --- |
| CONT-0001 | Audit Log Stream 5 |
| CONT-0002 | Audit Log Stream 5 |
| CONT-0003 | Firewall Appliance 7 |
| CONT-0004 | Server Rack 14A |
| CONT-0005 | Sensor Node 7B |
| CONT-0006 | Server Rack 14A |

**t_subclass_to_independent_continuant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | location | xsd:string |
| CONT-0002 | name | xsd:string |
| CONT-0003 | owner | cco:Person |
| CONT-0004 | tags | xsd:string |

The value layer—labeled misc in the schema—stores the actual assignments in a flexible key-value structure where each row binds an entity to an attribute through a foreign-key pair (entity_id, attr_id) and carries the value as a misc-type cell. For the subclass-to-independent-continuant hierarchy, entity CONT-0001 receives four distinct attribute assignments: its location is on-prem-dc1, its name is Name 02, its owner is sre, and its tags are Tags 04. The same mechanism applies to division eligibility constraints, where entity CONS-0001 carries the attributes encoding (value Encoding 01), label_text (value pre-release note), and language (value fr). The use of xsd:string as the attr_type for all three attributes signals that the system treats these as lexical values without enforcing semantic validation beyond type conformance, a design choice that prioritizes extensibility over constraint.

**t_subclass_to_independent_continuant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | on-prem-dc1 |
| CONT-0002 | CONT-0001 | CONT-0002 | Name 02 |
| CONT-0003 | CONT-0001 | CONT-0003 | sre |
| CONT-0004 | CONT-0001 | CONT-0004 | Tags 04 |
| CONT-0005 | CONT-0002 | CONT-0001 | us-east-1 |
| CONT-0006 | CONT-0002 | CONT-0002 | Name 06 |
| CONT-0007 | CONT-0002 | CONT-0003 | sre |
| CONT-0008 | CONT-0002 | CONT-0004 | Tags 08 |

Cross-division transfer mechanisms operate as a parallel dimension of the eligibility model, capturing the procedural pathways through which an athlete or participant may move between divisions. The cross_division_transfer column encodes these pathways as named operations—CircuitReroute, ZoneRedistribution, SectorTransfer, and LeagueBoundaryShift—each representing a distinct governance rule for reassignment. These transfers are not free-form text but enumerated concepts that interact with the division_eligibility_constraint and qualified_athlete_status columns to form a complete eligibility profile. An entity such as CONS-0001, classified as EasternLeagueNovice with AccreditedVeteran status, permits a CircuitReroute transfer, while CONS-0003, classified as MountainWestOpen with EndorsedFreshman status, permits a SectorTransfer. The constraint is thus not merely a label but a composite predicate that determines which transfer operations are permissible for a given entity.

The audit tracking subsystem introduces a relational layer that connects audit periods to one another through a junction table, where each row establishes a subject-to-target relationship annotated with a role. The t_audit_for_period table records the audits themselves—Data Privacy Impact Assessment, Annual-2022, GDPR Compliance Review—each identified by a PERI- prefixed code. The cross-reference table t_audit_for_period__for_audit_period maps these audits to one another: PERI-0001 (Data Privacy Impact Assessment) appears as the subject in two relationships, targeting PERI-0003 (HIPAA Security Audit) as an observer and PERI-0005 (SOC2 Type II) as a reviewer. The role column—observer, reviewer—specifies the capacity in which the subject audit participates relative to the target, transforming a simple many-to-many association into a semantically rich graph of audit dependencies. This structure supports traceability across compliance frameworks, enabling an auditor to reconstruct the full chain of assessments that inform a single compliance posture.

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

The independent continuant hierarchy mirrors this attribute-value discipline but applies it to physical and logical infrastructure. The t_subclass_to_independent_continuant table links each infrastructure entity to its parent category, with entries such as Audit Log Stream 5 appearing twice (CONT-0001 and CONT-0002) and Firewall Appliance 7 and Server Rack 14A each occupying a single row. The attribute definitions for this hierarchy—location, name, owner, tags—follow the same xsd:string and cco:Person typing pattern, and the value assignments reuse the entity-attribute-value mechanism. The repetition of entity CONT-0001 across four value rows demonstrates that a single entity can accumulate multiple attributes without schema modification, and that the attr_id foreign key serves as the bridge between the attribute definition and its concrete instantiation. This design, while denormalized at the value level, preserves referential integrity through the composite key of entity_id and attr_id, ensuring that each attribute assignment is uniquely addressable and auditable.