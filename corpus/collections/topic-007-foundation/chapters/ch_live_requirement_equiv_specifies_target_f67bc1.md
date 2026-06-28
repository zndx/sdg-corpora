---
chapter_id: ch_live_requirement_equiv_specifies_target_f67bc1
topic_id: 7
family: 03_directive_governance
cited_terms: ['requirement_equiv_specifies_target', 'subclass_to_designative_ice', 'state_transitions_from']
model: engine-refine
---

In relational data models, the identifier functions as the immutable primary key that anchors every row to a unique entity within a table. Across the requirement specification hierarchy, identifiers such as TARG-0001 through TARG-0004 serve as stable handles for equivalence specifications, while the subclass-to-designative ice tables employ ICE-0001 through ICE-0004 to distinguish individual designative instances like CryoStream-Link, CryoVault-Label, AeroFrost-ID, and IceSheet-Ref. Similarly, state transition records are keyed by FROM-0001 through FROM-0004. These identifiers are not merely sequential tokens; they encode the semantic domain of their parent table through prefix conventions, enabling rapid visual classification and supporting referential integrity when rows in one table must point to rows in another.

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

**t_state_transitions_from**

| id | state |
| --- | --- |
| FROM-0001 | MaintenanceWindow |
| FROM-0002 | DrainingEndpoint |
| FROM-0003 | MaintenanceWindow |
| FROM-0004 | SynchronizedState |
| FROM-0005 | DrainingEndpoint |
| FROM-0006 | ReplicationGap |
| FROM-0007 | CorruptionDetected |

**t_state_transitions_from_transitions_from**

| id | transitions_from |
| --- | --- |
| FROM-0001 | StagingDataset |
| FROM-0002 | ValidationQueue |
| FROM-0003 | ArchiveBucket |
| FROM-0004 | BackupSnapshot |
| FROM-0005 | ProductionMirror |
| FROM-0006 | LegacyWarehouse |
| FROM-0007 | LegacyWarehouse |

Attributes and their associated types constitute the descriptive schema of an entity. The attribute name column—attr_name in the ice attribute registry—captures property labels such as encoding, label_text, and language, while the attr_type column assigns a formal type constraint, here consistently xsd:string across all three registered attributes. This separation of attribute identity from attribute typing mirrors the distinction between a column's name and its data type in a relational schema, except that it is itself modeled as data within the database. An entity, identified by its own primary key, is the concrete instance to which attribute values are bound. In the ice value table, entity_id references such as ICE-0001 and ICE-0002 tie individual value records to their parent designative instances, establishing that CryoStream-Link (ICE-0001) carries multiple attribute assignments while CryoVault-Label (ICE-0002) carries at least one.

The misc column—labeled value in the ice value table—holds the actual data payloads assigned to attributes. These values range from structured codes like Encoding 01 and Encoding 04 to free-text annotations such as change rationale and language tags like es. The attr_id column bridges each misc value to its corresponding attribute definition, forming a three-way linkage: entity → attribute → value. This structure permits a single entity to accumulate heterogeneous attribute assignments without requiring a fixed schema; ICE-0001, for instance, carries three distinct attribute values (Encoding 01, change rationale, and es) mapped through three different attr_id references, demonstrating the flexibility of an entity-attribute-value pattern over rigid tabular normalization.

Role and cardinality note columns enrich the semantic relationships between entities beyond simple foreign-key joins. In the requirement equivalence specification tables, role values such as reviewer, owner, and contributor appear in junction tables that connect requirements to their specified targets—for example, TARG-0004 (which references LatencyThreshold) assumes the reviewer role when linked to TARG-0002, while TARG-0002 itself appears as owner in two separate associations. The applies_to junction table extends this pattern by introducing a cardinality_note column alongside role, with entries like Cardinality Note 01 through Cardinality Note 04 providing additional constraints on how many times a requirement may apply to a given target. These annotations transform a bare many-to-many relationship into a governed association with documented semantics.

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |

Subject and target columns formalize the directional nature of inter-table relationships. In the state transitions junction table, state_id functions as the subject—the originating state such as MaintenanceWindow or SynchronizedState—while transitions_from_id serves as the target, pointing to the source state from which the transition originates, including StagingDataset, ValidationQueue, ArchiveBucket, and BackupSnapshot. The same subject-target pattern appears in the requirement equivalence tables, where requirement_id and specifies_id establish a directed mapping from requirements to their specified protocols or standards, with KafkaProtocol and GDPRArticle appearing as targets of LatencyThreshold and DataLineageTrace specifications respectively. This subject-target framing makes explicit the asymmetry inherent in most relational associations, distinguishing the entity that initiates or owns a relationship from the entity that is referenced or affected by it.

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

**t_state_transitions_from__transitions_from**

| id | state_id | transitions_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0007 | FROM-0006 | contributor |
| FROM-0002 | FROM-0005 | FROM-0004 | reviewer |
| FROM-0003 | FROM-0006 | FROM-0001 | observer |
| FROM-0004 | FROM-0002 | FROM-0006 | reviewer |
| FROM-0005 | FROM-0007 | FROM-0004 | reviewer |
| FROM-0006 | FROM-0006 | FROM-0005 | observer |
| FROM-0007 | FROM-0003 | FROM-0002 | owner |
| FROM-0008 | FROM-0003 | FROM-0006 | observer |