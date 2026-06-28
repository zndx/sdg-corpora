---
chapter_id: ch_live_allocation_subclass_6b476d
topic_id: 94
family: 05_provo_lineage
cited_terms: ['allocation_subclass', 'trace_subclass', 'belief_interval_at_confidence_level']
model: engine-refine
---

The identifier serves as the immutable anchor across every facet of the system, a stable reference that survives the churn of execution and the evolution of metadata. Allocation identifiers such as ALLO-0001 through ALLO-0004 bind together the operational identity of a pipeline—whether it carries the label nightly-ingest, etl-daily-load, or batch-prod-main—with the transformation engine it invokes, be it a Celery Worker, dbt Runner, Flink TaskManager, or TensorFlow Serving. Trace identifiers like TRAC-0001 through TRAC-0004 perform the same anchoring function for runtime observations, while LEVE-0001 through LEVE-0004 anchor confidence-level assessments of beliefs ranging from calibration drift readings to sensor telemetry snapshots. This uniform identification strategy ensures that an allocation's relationship to a transformation, a trace's association with a span category, and an entity's attribute values all resolve to the same canonical key regardless of which table or view is being queried.

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

**t_belief_interval_at_confidence_level**

| id | belief | at_confidence_level |
| --- | --- | --- |
| LEVE-0001 | Calibration drift reading | Alpha 0.05 threshold |
| LEVE-0002 | Query result set | Confidence band 0.95 |
| LEVE-0003 | Schema migration status | High reliability tier |
| LEVE-0004 | Sensor telemetry snapshot | P value threshold |
| LEVE-0005 | Data lineage trace | Alpha 0.05 threshold |
| LEVE-0006 | Pipeline throughput metric | 99 percent reliable |
| LEVE-0007 | Schema migration status | Ninety-five percent bound |
| LEVE-0008 | Lab assay concentration | 95 percent confidence |

**t_belief_interval_at_confidence_level_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LEVE-0001 | confidence | xsd:decimal |
| LEVE-0002 | dimension_kind | xsd:string |
| LEVE-0003 | method | xsd:string |
| LEVE-0004 | recorded_at | xsd:dateTime |
| LEVE-0005 | uncertainty | xsd:decimal |
| LEVE-0006 | unit | xsd:string |
| LEVE-0007 | value | xsd:decimal |
| LEVE-0008 | encoding | xsd:string |

**t_belief_interval_at_confidence_level_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0004 | 2023-02-13T08:09:52 |
| LEVE-0002 | LEVE-0002 | LEVE-0004 | 2025-01-26T05:24:46 |
| LEVE-0003 | LEVE-0003 | LEVE-0004 | 2023-02-11T13:24:10 |
| LEVE-0004 | LEVE-0004 | LEVE-0004 | 2025-05-13T04:15:37 |
| LEVE-0005 | LEVE-0005 | LEVE-0004 | 2025-01-29T02:47:20 |
| LEVE-0006 | LEVE-0006 | LEVE-0004 | 2023-06-10T12:00:26 |
| LEVE-0007 | LEVE-0007 | LEVE-0004 | 2023-12-02T09:08:00 |
| LEVE-0008 | LEVE-0008 | LEVE-0004 | 2023-02-02T13:44:49 |

**t_belief_interval_at_confidence_level_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0001 | 0.649 |
| LEVE-0002 | LEVE-0001 | LEVE-0005 | 174.38 |
| LEVE-0003 | LEVE-0001 | LEVE-0007 | 717.12 |
| LEVE-0004 | LEVE-0002 | LEVE-0001 | 0.339 |
| LEVE-0005 | LEVE-0002 | LEVE-0005 | 870.57 |
| LEVE-0006 | LEVE-0002 | LEVE-0007 | 357.58 |
| LEVE-0007 | LEVE-0003 | LEVE-0001 | 0.361 |
| LEVE-0008 | LEVE-0003 | LEVE-0005 | 687.09 |

**t_belief_interval_at_confidence_level_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0002 | Dimension Kind 01 |
| LEVE-0002 | LEVE-0001 | LEVE-0008 | Encoding 02 |
| LEVE-0003 | LEVE-0001 | LEVE-0009 | audit excerpt |
| LEVE-0004 | LEVE-0001 | LEVE-0010 | en |
| LEVE-0005 | LEVE-0001 | LEVE-0003 | manual |
| LEVE-0006 | LEVE-0001 | LEVE-0006 | ms |
| LEVE-0007 | LEVE-0002 | LEVE-0002 | Dimension Kind 07 |
| LEVE-0008 | LEVE-0002 | LEVE-0008 | Encoding 08 |

The concept of category provides the primary organizational axis for spans, which themselves represent discrete segments of distributed execution. Each span carries a label—Spans Label 01 through Spans Label 04—and is classified under a category such as Category Name 01 through Category Name 04, with the categorical taxonomy itself materialized in a dedicated dimension table. The category_id foreign key in the spans dimension table creates a many-to-one mapping, allowing multiple spans to share a single category classification while preserving the ability to distinguish individual span instances through their unique identifiers. This separation of categorical taxonomy from span instances enables reclassification without restructuring the trace data.

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

Duration seconds and retry count constitute the principal quantitative measures of execution performance, recorded within the trace fact table alongside the exit code that signals the termination state of a span. A trace identified as TRAC-0003 exhibits a duration of 3940.66 seconds with an exit code of 420 and 396 retries, while TRAC-0004 completes in 3336.66 seconds with exit code 60 but demands 459 retries—illustrating that high retry counts do not necessarily correlate with longer durations, nor do exit codes alone convey the full picture of execution health. The spans_key column in the trace table references the span dimension, creating a bridge between the quantitative performance metrics and the categorical classification of the underlying execution segments.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

The attr and attr_type columns define the schema for typed metadata attached to entities within the belief interval framework. Attribute names such as confidence, dimension_kind, method, and recorded_at are paired with their corresponding XSD types—xsd:decimal, xsd:string, and xsd:dateTime—establishing a rigid type system that governs how values are stored and validated. This type discipline is enforced through a value partitioning strategy: decimal attributes like 0.649, 174.38, and 717.12 reside in one value table, string attributes such as Dimension Kind 01 and audit excerpt in another, and datetime values including 2023-02-13T08:09:52 and 2025-01-26T05:24:46 in a third. The entity_id foreign key binds each value to its parent entity, while attr_id resolves to the attribute definition, creating a normalized entity-attribute-value structure that supports heterogeneous metadata without sacrificing type safety.

The role column in the allocation-transformation junction table captures the nature of the relationship between an allocation and the transformation it executes, with values such as contributor, owner, and observer distinguishing between active participation and passive association. The subject column identifies the allocation side of this relationship, while the target column identifies the transformation, forming a directed association that can be traversed in either direction depending on the query intent. This role-based relationship model, combined with the identifier-based foreign keys that connect allocations to transformations and entities to attributes, creates a graph-like structure within the relational schema—one that supports complex queries about lineage, ownership, and execution dependencies while maintaining the referential integrity guarantees that relational databases provide.

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |