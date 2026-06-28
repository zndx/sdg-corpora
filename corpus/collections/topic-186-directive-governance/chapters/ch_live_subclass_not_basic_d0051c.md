---
chapter_id: ch_live_subclass_not_basic_d0051c
topic_id: 186
family: 01_foundation
cited_terms: ['subclass_not_basic', 'transformation_only_uses_datasets', 'state_transitions_from']
model: engine-refine
---

An identifier is the immutable handle by which any entity is distinguished within a data fabric. Whether the entity is a transformation rule, a state definition, or a subclass record, the identifier provides the single point of reference that enables cross-table joins, audit trails, and referential integrity. In practice, identifiers follow a disciplined naming convention that encodes provenance and domain: records such as DATA-0001 and DATA-0003 anchor transformation definitions like calibration routine and telemetry ingestion filter, while FROM-0001 through FROM-0004 identify state definitions including MaintenanceWindow, DrainingEndpoint, and SynchronizedState. The prefix signals the owning domain, and the numeric suffix guarantees uniqueness within that domain, making it possible to trace a single transformation or state across every table that references it.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |

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

Subject and target define the directional semantics of a relationship. In a binary association, the subject is the entity that initiates or owns the relationship, while the target is the entity that is acted upon or referenced. This distinction is not merely syntactic; it determines query direction, permission boundaries, and the semantics of cascade operations. When a transformation with identifier DATA-0003 relates to an entity identified as DATA-0002, the transformation is the subject and the entity is the target — the transformation consumes, validates, or transforms the target. The same pattern appears in state-transition modeling, where a state such as MaintenanceWindow (subject) relates to a source like StagingDataset (target), indicating that the state governs or originates from that source.

Role qualifies the relationship between subject and target by specifying the capacity in which the subject interacts with the target. A single subject may relate to multiple targets through distinct roles, and a single target may be related to by multiple subjects, each under a different role. In the transformation-to-entity associations, the role values reviewer, observer, and contributor describe whether the transformation inspects the entity for correctness, passively monitors it, or actively writes to it. Similarly, in state-transition associations, the same triad of roles — contributor, reviewer, observer — appears, indicating that the state assumes one of these capacities relative to the transition source. The role column thus transforms a bare foreign-key link into a semantically rich assertion about data lineage and operational responsibility.

These four concepts — identifier, subject, target, role — operate together to produce a graph of traceable, queryable relationships. Consider the transformation DATA-0003, which appears as a subject in two distinct associations: it relates to entity DATA-0002 under the role reviewer, and to entity DATA-0003 under the role contributor. This means the calibration routine inspects the event log archive for validation purposes while also writing to the ingestion buffer queue as a data producer. The same transformation DATA-0001 relates to DATA-0002 as an observer and to DATA-0004 as a contributor, meaning the signal denoising filter passively monitors the event log archive while actively populating the historical metrics dataset. Each association is independently addressable by its own identifier — DATA-0001 through DATA-0004 in this case — enabling precise queries such as "which transformations contribute to entity DATA-0004?" or "which entities does transformation DATA-0003 review?"

The operational value of this structure lies in its ability to answer governance questions without application-level logic. A compliance auditor can trace every target entity back to its contributing subjects and their roles, verifying that only authorized transformations write to sensitive datasets. An incident response team can determine which states govern a given transition source, identifying whether a system in DrainingEndpoint state should permit writes from a particular StagingDataset. The separation of identifier (what), subject (who acts), target (what is acted upon), and role (how) creates a queryable ontology that supports access control, data lineage, and operational runbooks without embedding any of that logic in application code.

**t_transformation_only_uses_datasets**

| id | transformation |
| --- | --- |
| DATA-0001 | validation check |
| DATA-0002 | signal denoising filter |
| DATA-0003 | calibration routine |
| DATA-0004 | telemetry ingestion filter |
| DATA-0005 | feature engineering step |
| DATA-0006 | format conversion layer |

**t_transformation_only_uses_datasets_uses_entity**

| id | uses_entity |
| --- | --- |
| DATA-0001 | event log archive |
| DATA-0002 | feature registry cache |
| DATA-0003 | ingestion buffer queue |
| DATA-0004 | historical metrics dataset |
| DATA-0005 | configuration manifest |
| DATA-0006 | configuration manifest |

**t_transformation_only_uses_datasets__uses_entity**

| id | transformation_id | uses_entity_id | role |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | DATA-0002 | reviewer |
| DATA-0002 | DATA-0001 | DATA-0002 | observer |
| DATA-0003 | DATA-0003 | DATA-0003 | contributor |
| DATA-0004 | DATA-0001 | DATA-0004 | contributor |
| DATA-0005 | DATA-0005 | DATA-0001 | observer |
| DATA-0006 | DATA-0005 | DATA-0003 | reviewer |
| DATA-0007 | DATA-0003 | DATA-0006 | reviewer |
| DATA-0008 | DATA-0005 | DATA-0003 | contributor |

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