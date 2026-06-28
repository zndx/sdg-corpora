---
chapter_id: ch_live_schemaorg_event_starttime_66107d
topic_id: 161
family: 07_long_tail
cited_terms: ['schemaorg_event_starttime', 'measurement_max_one_value', 'state_transitions_from']
model: engine-refine
---

September 14, 2025

Governance Framework: Entity Linkage and Temporal Metadata

Every auditable data asset requires a stable, globally unique identifier to anchor its provenance across the lifecycle of ingestion, transformation, and archival. Within the schemaorg fact table, identifiers such as STAR-0001 through STAR-0004 serve as the immutable primary keys that distinguish individual records, while the same convention extends to measurement records (VALU-0001 through VALU-0004) and state-transition records (FROM-0001 through FROM-0004). These identifiers are not merely enumeration tokens; they are the referential fulcrum upon which all foreign-key relationships pivot, ensuring that a measurement of Soil pH at 98.6 can be traced back to its originating record without ambiguity, just as a state transition from StagingDataset to MaintenanceWindow can be unambiguously attributed to its source and destination entities.

The event start time dimension provides the temporal scaffolding against which all schemaorg records are dated and versioned. Each identifier in the fact table maps to an event_start_time_key—STAR-0005, STAR-0003, or STAR-0001—that resolves through the dimension table to a human-readable label (Event Start Time Label 01 through Event Start Time Label 04) and a categorical classification (Event Start Time Category 01 through Event Start Time Category 04). This two-tier structure permits both machine-consumable temporal joins and human-interpretable categorization, a design that proves essential when reconciling records of vastly different sizes: a schemaorg entry of 895,265,030 bytes (version 3) and another of 998,785,819 bytes (version 8) may share the same event start time key yet represent materially different data volumes and revision states.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

Version numbers and size metrics operate in tandem as change-detection signals. The fact table records version values ranging from 3 to 8, each paired with a size_bytes field that quantifies the payload at that revision. A version 5 record carrying 114,301,972 bytes stands in stark contrast to a version 8 record carrying 998,785,819 bytes, signaling not merely incremental updates but potentially divergent data schemas or expanded content. These metrics enable downstream systems to detect schema drift, enforce retention policies, and compute storage forecasts without inspecting the payload itself.

The junction tables governing measurements and state transitions introduce the triad of subject, target, and role to model many-to-many relationships with semantic precision. In the measurement linkage table, a record with identifier VALU-0001 associates measurement_id VALU-0005 (the subject) with numeric_value_id VALU-0001 (the target) under the role of reviewer, indicating that the numeric value 98.6 was assessed by the measurement entity in a supervisory capacity. Similarly, the state-transition junction table maps state_id FROM-0007 to transitions_from_id FROM-0006 under the role of contributor, establishing that the transition from BackupSnapshot to SynchronizedState was authored by the source state entity. The role field—taking values of reviewer, observer, or contributor—adds a layer of accountability that distinguishes between entities that merely witness a relationship and those that actively participate in or authorize it.

**t_measurement_max_one_value**

| id | measurement |
| --- | --- |
| VALU-0001 | Soil pH |
| VALU-0002 | Water turbidity |
| VALU-0003 | Air particulate |
| VALU-0004 | CPU load |
| VALU-0005 | Battery voltage |
| VALU-0006 | Air particulate |
| VALU-0007 | Core temperature |

**t_measurement_max_one_value_numeric_value**

| id | numeric_value |
| --- | --- |
| VALU-0001 | 98.6 |
| VALU-0002 | 120.5 |
| VALU-0003 | 98.6 |
| VALU-0004 | 0.042 |
| VALU-0005 | 0.042 |
| VALU-0006 | 0.85 |

**t_measurement_max_one_value__numeric_value**

| id | measurement_id | numeric_value_id | role |
| --- | --- | --- | --- |
| VALU-0001 | VALU-0005 | VALU-0001 | reviewer |
| VALU-0002 | VALU-0002 | VALU-0003 | observer |
| VALU-0003 | VALU-0005 | VALU-0005 | contributor |
| VALU-0004 | VALU-0003 | VALU-0001 | observer |
| VALU-0005 | VALU-0007 | VALU-0005 | owner |
| VALU-0006 | VALU-0004 | VALU-0005 | observer |
| VALU-0007 | VALU-0003 | VALU-0006 | contributor |
| VALU-0008 | VALU-0002 | VALU-0006 | owner |

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

Together, these constructs form a coherent metadata architecture: identifiers provide referential stability, event start times supply temporal context, categories and labels enable human interpretation, size and version fields track evolution, and subject-target-role junctions encode the relational semantics that bind discrete entities into a navigable graph. This design ensures that every data point, whether a CPU load reading of 0.042 or a state transition from DrainingEndpoint to a SynchronizedState, carries within it the full chain of provenance, classification, and accountability required for compliance auditing and operational governance.