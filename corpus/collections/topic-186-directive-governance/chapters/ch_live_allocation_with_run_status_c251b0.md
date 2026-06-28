---
chapter_id: ch_live_allocation_with_run_status_c251b0
topic_id: 186
family: 05_provo_lineage
cited_terms: ['allocation_with_run_status', 'annotation_assigned_by', 'annotation_at_tier']
model: engine-refine
---

An identifier is the immutable handle by which every record in the system is addressed, and it follows a domain-specific prefix scheme that signals the annotation context at a glance. Allocation records carry identifiers such as STAT-0001 through STAT-0004, annotation-assigned-by records use ASSI-0001 through ASSI-0004, and tier-level annotations are keyed by TIER-0001 through TIER-0004. These identifiers are not merely sequential counters; they encode provenance and scope, enabling cross-table joins without ambiguity. An allocation identified as STAT-0001 might represent a kafka-consumer-group resource, while STAT-0004 could denote a gpu-cluster-alpha, and each carries its own run_status—timeout-expired, disconnected-drift, or succeeded-final—allowing operators to trace the lifecycle of a resource through its execution history.

**t_allocation_with_run_status**

| id | allocation |
| --- | --- |
| STAT-0001 | kafka-consumer-group |
| STAT-0002 | kafka-consumer-group |
| STAT-0003 | vault-secret-rotate |
| STAT-0004 | gpu-cluster-alpha |
| STAT-0005 | gpu-cluster-alpha |
| STAT-0006 | batch-etl-nightly |

**t_allocation_with_run_status_run_status**

| id | run_status |
| --- | --- |
| STAT-0001 | timeout-expired |
| STAT-0002 | disconnected-drift |
| STAT-0003 | succeeded-final |
| STAT-0004 | succeeded-final |
| STAT-0005 | succeeded-final |
| STAT-0006 | retrying-backoff |

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | ProvenanceSource EPA7 | policy_engine_v2 |
| ASSI-0002 | MetadataTag Deprecated | catalog_sync_daemon |
| ASSI-0003 | ObservationNote Drift | schema_registry_service |
| ASSI-0004 | source_system_sync | etl_pipeline_runner |
| ASSI-0005 | TelemetryLabel HighLatency | data_steward_cli |
| ASSI-0006 | TelemetryLabel HighLatency | catalog_sync_daemon |

**t_annotation_at_tier**

| id | annotation | at_tier |
| --- | --- | --- |
| TIER-0001 | DatasetVersion v3.2.1 | L0 Unprocessed |
| TIER-0002 | access_level_public | Cold Archive |
| TIER-0003 | DatasetVersion v3.2.1 | Baseline Reference |
| TIER-0004 | QualityFlag Pass | L0 Unprocessed |
| TIER-0005 | AnomalyFlag Outlier | Cold Archive |
| TIER-0006 | AnomalyFlag Outlier | L0 Unprocessed |
| TIER-0007 | schema_version_v2 | Derived Metrics |
| TIER-0008 | data_quality_check | Cold Archive |

An attribute, or attr, is a named property that captures a dimension of quality, provenance, or metadata about an annotated entity. The attribute definition lives separately from its value: a row in an attribute registry declares an attr_name such as confidence, dimension_kind, method, or recorded_at, and pairs it with an attr_type drawn from the XSD namespace—xsd:decimal for numeric precision, xsd:string for free-form text, and xsd:dateTime for temporal stamps. This separation of schema from data means that the attribute vocabulary can evolve without restructuring value storage. For instance, the confidence attribute is consistently typed as xsd:decimal across both the assigned-by and tier-level annotation contexts, while recorded_at is uniformly xsd:dateTime, ensuring that downstream consumers can parse values without per-attribute type discovery.

**t_annotation_assigned_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |

**t_annotation_at_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_annotation_at_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2023-08-28T08:07:44 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2024-09-06T16:54:15 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-05-23T23:56:22 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2025-03-16T10:06:06 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2023-04-25T04:15:41 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-06-14T22:17:53 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2024-03-09T22:47:27 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-01-10T07:31:27 |

**t_annotation_at_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.089 |
| TIER-0002 | TIER-0001 | TIER-0005 | 784.31 |
| TIER-0003 | TIER-0001 | TIER-0007 | 319.44 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.223 |
| TIER-0005 | TIER-0002 | TIER-0005 | 427.90 |
| TIER-0006 | TIER-0002 | TIER-0007 | 411.91 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.933 |
| TIER-0008 | TIER-0003 | TIER-0005 | 35.44 |

Attribute values are stored in type-dispatched value tables, each keyed by a composite of the annotation record, the entity being described, and the attribute being measured. A decimal value such as 0.167 or 103.53 resides in the decimal value table, a string like "Dimension Kind 01" or "calibration record" in the varchar table, and a timestamp such as 2025-05-21T21:38:03 in the datetime table. The entity_id column in these value tables points back to the annotation record that owns the measurement—ASSI-0001 might carry a confidence of 0.167 and a recorded_at of 2025-05-21T21:38:03, while TIER-0001 holds a confidence of 0.089 and a recorded_at of 2023-08-28T08:07:44. This value-per-type design avoids nullable columns and type coercion at query time, at the cost of requiring the consumer to know the attr_type before selecting the correct value table.

**t_annotation_at_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | es |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

A subject and target pair, mediated by a role, expresses a typed relationship between two entities. In the allocation-run_status join table, allocation_id serves as the subject—the resource being characterized—while run_status_id is the target—the state or condition being attributed to it. The role column disambiguates the nature of the relationship: the same allocation_id STAT-0001 appears with the role contributor when linked to one run_status and with the role reviewer when linked to another, indicating that a single entity can occupy multiple relational positions depending on context. This subject-target-role triple pattern generalizes beyond allocation status to any domain where entities must be related with semantic precision.

**t_allocation_with_run_status__run_status**

| id | allocation_id | run_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0006 | reviewer |
| STAT-0002 | STAT-0006 | STAT-0004 | observer |
| STAT-0003 | STAT-0004 | STAT-0002 | contributor |
| STAT-0004 | STAT-0001 | STAT-0005 | contributor |
| STAT-0005 | STAT-0006 | STAT-0001 | observer |
| STAT-0006 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0007 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0008 | STAT-0005 | STAT-0006 | observer |

The entity itself is the thing being annotated, and it is identified by the same identifier scheme used throughout the system. An annotation record such as ASSI-0001, which carries the annotation text "ProvenanceSource EPA7" and was assigned by the policy_engine_v2, becomes the entity_id in value tables that store its attributes. Similarly, a tier annotation like TIER-0001, describing a DatasetVersion v3.2.1 at the L0 Unprocessed tier, serves as the entity for its own set of attribute values. The assigned_by column on the annotation record—whether policy_engine_v2, catalog_sync_daemon, schema_registry_service, or etl_pipeline_runner—provides an additional layer of provenance, indicating which system or process created the annotation, while the annotation text itself—ranging from "MetadataTag Deprecated" to "QualityFlag Pass"—conveys the human-readable judgment or observation.

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |