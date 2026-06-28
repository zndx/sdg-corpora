---
chapter_id: ch_live_ringbuf_map_subclass_f4e716
topic_id: 166
family: 07_long_tail
cited_terms: ['ringbuf_map_subclass', 'artifact_max_one_owner', 'claim_supported_by_evidence']
model: engine-refine
---

The governance of digital assets rests upon a disciplined architecture of identifiers, attributes, and typed values that together render every claim auditable and every resource accountable. Each entity—whether a ring buffer such as the metrics capture ring or the diagnostic trace buffer, an artifact such as telemetry-archive-2023 or etl-transform-stable, or a claim such as Model accuracy benchmark or Server latency threshold breach—is assigned a stable identifier, MAP-0001 through MAP-0004 for ring buffers, OWNE-0001 through OWNE-0004 for ownership records, and EVID-0001 through EVID-0004 for evidence-backed assertions. These identifiers serve as the immutable anchors of the system; they do not change, they do not collide, and they permit every downstream relationship to be resolved without ambiguity. The ring buffer subclass table maps each identifier to a functional category—sensor stream buffer, audit log ring—while the artifact ownership table binds artifacts to owners such as EVID-0005, EVID-0006, and EVID-0003, establishing a clear chain of custodianship that compliance auditors can trace from resource to responsible party.

**t_ringbuf_map_subclass**

| id | ringbuf |
| --- | --- |
| MAP-0001 | metrics capture ring |
| MAP-0002 | diagnostic trace buffer |
| MAP-0003 | audit log ring |
| MAP-0004 | sensor stream buffer |
| MAP-0005 | diagnostic trace buffer |
| MAP-0006 | event queue ring |
| MAP-0007 | telemetry fifo ring |

**t_ringbuf_map_subclass_ring_buffer_config**

| id | ring_buffer_config |
| --- | --- |
| MAP-0001 | sync mode spec |
| MAP-0002 | sync mode spec |
| MAP-0003 | compression profile |
| MAP-0004 | buffer depth spec |
| MAP-0005 | compression profile |
| MAP-0006 | sample rate config |
| MAP-0007 | overflow handling spec |
| MAP-0008 | compression profile |

**t_artifact_max_one_owner**

| id | artifact | owner |
| --- | --- | --- |
| OWNE-0001 | telemetry-archive-2023 | EVID-0005 |
| OWNE-0002 | etl-transform-stable | EVID-0006 |
| OWNE-0003 | etl-transform-stable | EVID-0005 |
| OWNE-0004 | ml-inference-v2.1 | EVID-0003 |
| OWNE-0005 | ml-inference-v2.1 | EVID-0004 |
| OWNE-0006 | etl-transform-stable | EVID-0006 |

**t_artifact_max_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | checksum | xsd:string |
| OWNE-0002 | created_date | xsd:date |
| OWNE-0003 | identifier | cco:DesignativeICE |
| OWNE-0004 | license | xsd:string |
| OWNE-0005 | mime_type | xsd:string |
| OWNE-0006 | size_bytes | xsd:long |
| OWNE-0007 | uri | xsd:string |
| OWNE-0008 | version | xsd:integer |

**t_artifact_max_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0002 | 2023-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0002 | 2025-04-14 |
| OWNE-0003 | OWNE-0003 | OWNE-0002 | 2024-04-27 |
| OWNE-0004 | OWNE-0004 | OWNE-0002 | 2025-03-27 |
| OWNE-0005 | OWNE-0005 | OWNE-0002 | 2025-06-10 |
| OWNE-0006 | OWNE-0006 | OWNE-0002 | 2023-03-24 |

**t_artifact_max_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0006 | 427 |
| OWNE-0002 | OWNE-0001 | OWNE-0008 | 2 |
| OWNE-0003 | OWNE-0002 | OWNE-0006 | 401 |
| OWNE-0004 | OWNE-0002 | OWNE-0008 | 12 |
| OWNE-0005 | OWNE-0003 | OWNE-0006 | 38 |
| OWNE-0006 | OWNE-0003 | OWNE-0008 | 7 |
| OWNE-0007 | OWNE-0004 | OWNE-0006 | 393 |
| OWNE-0008 | OWNE-0004 | OWNE-0008 | 7 |

**t_artifact_max_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | c0ffee42 |
| OWNE-0002 | OWNE-0001 | OWNE-0003 | ARN:res/41 |
| OWNE-0003 | OWNE-0001 | OWNE-0004 | MIT |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | rack-7 |
| OWNE-0005 | OWNE-0001 | OWNE-0005 | application/octet-stream |
| OWNE-0006 | OWNE-0001 | OWNE-0010 | Name 06 |
| OWNE-0007 | OWNE-0001 | OWNE-0011 | sre |
| OWNE-0008 | OWNE-0001 | OWNE-0012 | Tags 08 |

**t_claim_supported_by_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2024-08-09T04:01:38 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-12-19T17:45:47 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2024-10-20T14:55:58 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2024-09-01T03:06:06 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2024-01-23T04:47:13 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-03-02T02:15:09 |

**t_claim_supported_by_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | nightly summary |
| EVID-0004 | EVID-0001 | EVID-0010 | de |
| EVID-0005 | EVID-0001 | EVID-0003 | automated |
| EVID-0006 | EVID-0001 | EVID-0006 | ms |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

Attributes and their types constitute the schema by which entities are described, and the separation of attribute definition from attribute value is a deliberate design choice that enforces type discipline across the entire registry. The artifact ownership attribute table declares that checksum, license, and identifier are xsd:string values, that created_date is xsd:date, and that identifier carries the cco:DesignativeICE type—a controlled classification scheme that signals the attribute's semantic role within the compliance ontology. Similarly, the evidence claim attribute table defines confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime, ensuring that every value stored against these attributes can be validated against its declared type before acceptance. This type-aware separation means that the system can reject a malformed confidence value—such as a string where 0.768 or 0.833 is expected—without conflating schema errors with data errors, a distinction that matters when regulatory frameworks require proof of data integrity at the point of ingestion.

Typed value tables materialize the abstract attribute definitions into concrete, queryable facts, and the choice of value table by type—date, integer, decimal, varchar, datetime—reflects a normalization strategy that preserves type fidelity while avoiding the pitfalls of a single wide attribute table. The created_date attribute, defined as xsd:date, finds its values in the date value table as 2023-04-04, 2025-04-14, 2024-04-27, and 2025-03-27, each row linking back to its entity and attribute through foreign keys. Integer attributes such as those holding values 427, 2, 401, and 12 reside in the integer value table, while decimal attributes capturing confidence scores of 0.768, 631.25, and 135.16 occupy the decimal table. Varchar values—c0ffee42 for a checksum, ARN:res/41 for an Amazon Resource Name, MIT for a license, rack-7 for a physical location, and strings like Dimension Kind 01 and Encoding 02 for evidence dimensions—are stored in the varchar table. The datetime table holds timestamps such as 2024-08-09T04:01:38 and 2023-12-19T17:45:47, preserving the precision required for audit trails. This type-segregated storage ensures that a decimal comparison, a date range query, or a string containment search operates on correctly typed data without runtime coercion.

The subject-target-role triad governs how entities relate to one another, and the junction table linking ring buffers to their configuration profiles exemplifies this pattern. Each row in the association table carries a subject—the ring buffer identifier such as MAP-0001 or MAP-0003—and a target—the configuration profile identifier such as MAP-0006 or MAP-0004—along with a role that describes the nature of the relationship: observer, reviewer, contributor, or owner. The role column is not metadata; it is a first-class relationship attribute that determines what actions the subject may perform with respect to the target. A ring buffer acting as observer may read configuration parameters but not modify them; an owner may alter the sync mode spec or compression profile. This role-based relationship model generalizes beyond ring buffers to every inter-entity linkage in the system, providing a uniform mechanism for expressing permissions, dependencies, and provenance without hardcoding relationship semantics into the schema.

**t_ringbuf_map_subclass__ring_buffer_config**

| id | ringbuf_id | ring_buffer_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | observer |
| MAP-0002 | MAP-0003 | MAP-0004 | reviewer |
| MAP-0003 | MAP-0005 | MAP-0004 | contributor |
| MAP-0004 | MAP-0001 | MAP-0007 | owner |
| MAP-0005 | MAP-0002 | MAP-0006 | contributor |
| MAP-0006 | MAP-0006 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0002 | owner |
| MAP-0008 | MAP-0002 | MAP-0003 | owner |

Evidence and claims form the backbone of the compliance assertion layer, where every operational claim must be supported by traceable evidence and annotated with typed attributes that quantify its reliability. The claim supported by evidence table binds assertions such as Model accuracy benchmark and Emissions compliance record to specific evidence identifiers—MAP-0002, MAP-0006, MAP-0004—creating a directed graph from claim to evidence that auditors can traverse. The evidence attributes table enriches each linkage with metadata: a confidence decimal such as 0.768 or 0.833 that quantifies the strength of the support, a dimension_kind string like Dimension Kind 01 that categorizes the evidence type, a method string such as Encoding 02 that describes how the evidence was collected, and a recorded_at timestamp like 2024-10-20T14:55:58 that anchors the evidence in time. This structure ensures that no claim exists in isolation; every assertion is tethered to measurable, typed, and timestamped evidence, and the confidence score provides a single numeric summary of evidentiary strength that can be aggregated, thresholded, and reported.

**t_claim_supported_by_evidence**

| id | claim | supported_by_evidence |
| --- | --- | --- |
| EVID-0001 | Model accuracy benchmark | MAP-0002 |
| EVID-0002 | Server latency threshold breach | MAP-0006 |
| EVID-0003 | Server latency threshold breach | MAP-0002 |
| EVID-0004 | Emissions compliance record | MAP-0004 |
| EVID-0005 | Emissions compliance record | MAP-0007 |
| EVID-0006 | Batch ingestion delay anomaly | MAP-0001 |

**t_claim_supported_by_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_claim_supported_by_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.768 |
| EVID-0002 | EVID-0001 | EVID-0005 | 631.25 |
| EVID-0003 | EVID-0001 | EVID-0007 | 135.16 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.833 |
| EVID-0005 | EVID-0002 | EVID-0005 | 5.88 |
| EVID-0006 | EVID-0002 | EVID-0007 | 87.07 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.936 |
| EVID-0008 | EVID-0003 | EVID-0005 | 975.53 |