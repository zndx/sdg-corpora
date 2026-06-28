---
chapter_id: ch_live_annotation_classifies_artifact_4fe605
topic_id: 101
family: 02_observation_measurement
cited_terms: ['annotation_classifies_artifact', 'division_eligibility_constraint', 'iso27001_clause_subclass']
model: engine-refine
---

The governance architecture rests upon a tripartite classification of artifacts, constraints, and standard clauses, each anchored by a stable identifier that serves as the primary key for all downstream relationships. Artifacts are classified under annotations such as *Source Verified*, *PII Redacted*, *PII Sensitive*, and *Deprecated*, with identifiers ranging from ARTI-0001 through ARTI-0004. These annotations function as the top-level categorization mechanism, determining the handling requirements and access controls applicable to each classified item. Parallel to this, division eligibility constraints—identified as CONS-0001 through CONS-0004—encode the regulatory boundaries governing athlete participation across competitive divisions. Each constraint row binds together a division eligibility designation such as *EasternLeagueNovice* or *MountainWestOpen*, a qualified athlete status including *AccreditedVeteran*, *EndorsedFreshman*, or *LicensedElite*, and a cross-division transfer mechanism like *CircuitReroute*, *ZoneRedistribution*, *SectorTransfer*, or *LeagueBoundaryShift*. The ISO 27001 clause subclass table provides a third classification axis, mapping clause identifiers CLAU-0001 through CLAU-0004 to their corresponding clause categories—*Risk treatment*, *Performance evaluation*, *Improvement*, and *Leadership*—thereby establishing the normative framework against which artifact and constraint classifications are evaluated.

**t_annotation_classifies_artifact**

| id | annotation |
| --- | --- |
| ARTI-0001 | Source Verified |
| ARTI-0002 | PII Redacted |
| ARTI-0003 | PII Sensitive |
| ARTI-0004 | Deprecated |
| ARTI-0005 | GDPR Compliant |
| ARTI-0006 | GDPR Compliant |

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

**t_iso27001_clause_subclass**

| id | iso |
| --- | --- |
| CLAU-0001 | Iso 01 |
| CLAU-0002 | Iso 02 |
| CLAU-0003 | Iso 03 |
| CLAU-0004 | Iso 04 |
| CLAU-0005 | Iso 05 |
| CLAU-0006 | Iso 06 |

**t_iso27001_clause_subclass_iso27001_clause**

| id | iso27001_clause |
| --- | --- |
| CLAU-0001 | Risk treatment |
| CLAU-0002 | Performance evaluation |
| CLAU-0003 | Improvement |
| CLAU-0004 | Leadership |
| CLAU-0005 | Risk treatment |
| CLAU-0006 | Risk treatment |

Attributes and their types form the second structural layer, enabling each classified entity to carry typed metadata without denormalizing the core classification tables. The artifact attribute definitions enumerate property names such as *confidence*, *dimension_kind*, *method*, and *recorded_at*, each bound to an XML Schema type—*xsd:decimal*, *xsd:string*, or *xsd:dateTime*—that governs the shape and validation of stored values. The constraint attribute definitions follow the same pattern, declaring properties like *encoding*, *label_text*, and *language*, all typed as *xsd:string*. This attribute-type pairing is essential: it decouples the schema of metadata from the schema of values, allowing the system to accommodate heterogeneous data without schema migration. When a new attribute is introduced, only the attribute definition table requires modification; the value tables remain stable, each already prepared to receive values of its designated type.

Value storage is partitioned by data type into three distinct tables, each dedicated to a single XML Schema primitive. Decimal values—such as 0.727, 765.80, 266.33, and 0.091—are persisted in the decimal value table, where each row links an entity identifier to an attribute identifier and carries the numeric value. String values—including *Dimension Kind 01*, *Encoding 02*, *pre-release note*, and language codes such as *ja* and *fr*—reside in the varchar value table, following the same entity-to-attribute linkage pattern. DateTime values, representing timestamps like 2024-11-28T13:33:59, 2024-06-29T04:58:51, 2023-01-05T00:51:32, and 2024-11-30T14:24:01, are stored in the datetime value table. The entity identifier in each value table references the primary key of the attribute definition table, not the classification table, establishing a many-to-many relationship: a single artifact or constraint can carry multiple attributes, and a single attribute definition can be instantiated across multiple entities. This design ensures that the value tables remain type-safe while supporting arbitrary combinations of entities and attributes.

**t_annotation_classifies_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-11-28T13:33:59 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-06-29T04:58:51 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-01-05T00:51:32 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-11-30T14:24:01 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2023-01-14T09:06:44 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2023-02-15T12:01:42 |

**t_annotation_classifies_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.727 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 765.80 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 266.33 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.091 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 761.16 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 564.24 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.118 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 599.96 |

**t_annotation_classifies_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | pre-release note |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | ja |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | automated |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

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

The ISO 27001 clause subclass relationship table introduces a ternary association that connects a subject clause subclass to a target clause through a named role. Each row in this junction table carries an identifier, a subject identifier referencing the clause subclass, a target identifier referencing the ISO 27001 clause, and a role designation—*reviewer*, *contributor*, or *owner*—that specifies the nature of the relationship. For example, clause subclass CLAU-0004 may serve as a *contributor* to clause CLAU-0006, while CLAU-0001 acts as a *reviewer* of clause CLAU-0001. This role-based association model allows the same pair of clauses to participate in multiple relationships with different semantic meanings, and it supports the kind of governance accountability required by ISO 27001 certification audits. The role column is the critical differentiator: it transforms a simple many-to-many link into a semantically rich relationship that can be queried, reported, and enforced as part of the compliance framework.

**t_iso27001_clause_subclass__iso27001_clause**

| id | iso_id | iso27001_clause_id | role |
| --- | --- | --- | --- |
| CLAU-0001 | CLAU-0004 | CLAU-0001 | reviewer |
| CLAU-0002 | CLAU-0001 | CLAU-0003 | contributor |
| CLAU-0003 | CLAU-0004 | CLAU-0006 | contributor |
| CLAU-0004 | CLAU-0005 | CLAU-0006 | owner |
| CLAU-0005 | CLAU-0005 | CLAU-0004 | owner |
| CLAU-0006 | CLAU-0006 | CLAU-0006 | owner |
| CLAU-0007 | CLAU-0001 | CLAU-0006 | reviewer |
| CLAU-0008 | CLAU-0005 | CLAU-0003 | contributor |

Together, these tables implement a normalized, type-safe metadata management system that separates classification from attribute definition from attribute value storage. The identifier column provides the stable anchor across all tables; the entity column in value tables resolves to attribute definitions rather than to classification records, enabling flexible attribute composition; the attr_name and attr_type columns in attribute definition tables enforce schema discipline; and the role column in the ISO 27001 junction table encodes governance semantics. Representative values—*PII Sensitive* artifacts carrying a confidence of 0.727, *MountainWestOpen* constraints with *EndorsedFreshman* status and *SectorTransfer* transfer mechanisms, *fr*-labeled constraint attributes—demonstrate that the system accommodates both operational metadata and regulatory classification within a single coherent model. The architecture supports auditability at every level: any artifact can be traced from its classification annotation through its typed attributes to its concrete values, and any ISO 27001 clause relationship can be inspected for the roles assigned to each participating subclass.

**t_annotation_classifies_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |