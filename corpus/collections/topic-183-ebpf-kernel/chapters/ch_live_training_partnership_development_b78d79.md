---
chapter_id: ch_live_training_partnership_development_b78d79
topic_id: 183
family: 08_derived
cited_terms: ['training_partnership_development', 'allocation_basic', 'annotation_assigned_by']
model: engine-refine
---

Allocation tracking in the operational data model centers on a star-schema arrangement where a fact table records the measurable outcomes of each allocation event and a dimension table supplies its descriptive metadata. Every allocation is identified by a unique identifier such as ALLO-0001 through ALLO-0004, and the allocation_key column captures cases where the same logical allocation recurs across multiple rows — ALLO-0003, for instance, appears three times within the sample, indicating repeated invocations of a single allocation definition. Each fact row carries a duration_seconds measurement ranging from roughly 1,151 seconds to over 7,000 seconds, an exit_code that classifies the termination state (values like 604, 457, 988, and 141), and a retry_count that quantifies how many times the system attempted to complete the allocation before reaching its final state, with observed counts spanning from 32 to 415 retries. The companion dimension table enriches these facts with an allocation_label drawn from a generic misc category and an allocation_category that groups allocations into logical buckets such as Allocation Category 01 through Allocation Category 04, enabling downstream aggregation by functional type.

**fact_allocation**

| id | allocation_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ALLO-0001 | ALLO-0002 | 6322.19 | 604 | 49 |
| ALLO-0002 | ALLO-0003 | 1151.17 | 457 | 282 |
| ALLO-0003 | ALLO-0003 | 4950.80 | 988 | 415 |
| ALLO-0004 | ALLO-0003 | 7031.31 | 141 | 32 |
| ALLO-0005 | ALLO-0001 | 3728.13 | 271 | 498 |
| ALLO-0006 | ALLO-0005 | 4892.58 | 91 | 385 |
| ALLO-0007 | ALLO-0002 | 586.50 | 781 | 414 |
| ALLO-0008 | ALLO-0004 | 850.51 | 189 | 222 |

**dim_allocation**

| id | allocation_label | allocation_category |
| --- | --- | --- |
| ALLO-0001 | Allocation Label 01 | Allocation Category 01 |
| ALLO-0002 | Allocation Label 02 | Allocation Category 02 |
| ALLO-0003 | Allocation Label 03 | Allocation Category 03 |
| ALLO-0004 | Allocation Label 04 | Allocation Category 04 |
| ALLO-0005 | Allocation Label 05 | Allocation Category 05 |
| ALLO-0006 | Allocation Label 06 | Allocation Category 06 |

Training partnership development is captured in a separate entity table that links program identifiers to the educational institutions participating in each initiative. Identifiers such as DEVE-0001 through DEVE-0004 serve as the primary keys for records describing programs like the Advanced Analytics Cohort, Machine Learning Track, Biostatistics Collaboration, and Engineering Mentorship Program. Each record carries a has_participant reference pointing to an educationalinstitution — for example, the Clinical Preceptor Team, Elena Rostova, Research Associate Kim, or the Industry Liaison Office — establishing a clear mapping between development programs and the individuals or teams that take part in them. This structure supports governance queries that answer which institutions are engaged in which partnership tracks and at what scale.

**t_training_partnership_development**

| id | training_partnership_development | has_participant |
| --- | --- | --- |
| DEVE-0001 | Advanced Analytics Cohort | Clinical Preceptor Team |
| DEVE-0002 | Machine Learning Track | Elena Rostova |
| DEVE-0003 | Biostatistics Collaboration | Research Associate Kim |
| DEVE-0004 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0005 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0006 | Data Governance Workshop | Research Associate Kim |
| DEVE-0007 | Research Methods Alliance | Elena Rostova |
| DEVE-0008 | Machine Learning Track | Elena Rostova |

The annotation subsystem models attribute metadata and typed values through a normalized set of tables that separate schema definitions from data instances. The attribute definition table assigns each attribute a name — confidence, dimension_kind, method, recorded_at — and an attr_type that declares its semantic type, such as xsd:decimal, xsd:string, or xsd:dateTime. These type declarations drive the physical storage layout: decimal attributes are persisted in a dedicated value table alongside an entity_id foreign key that ties the measurement back to its parent annotation record, with sample values like 0.167, 103.53, and 863.30; datetime attributes land in a parallel table where entity_id references the same annotation and values are stored as ISO 8601 timestamps such as 2025-05-21T21:38:03 and 2024-06-17T00:22:41; and string attributes are held in a third value table with entries like Dimension Kind 01, Encoding 02, calibration record, and de. The entity_id column in each value table acts as the join key back to the annotation's identifier, ensuring that every typed value can be traced to its originating record.

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | policy_engine_v2 |
| ASSI-0002 | telemetry_ingestion | catalog_sync_daemon |
| ASSI-0003 | provenance_trace | schema_registry_service |
| ASSI-0004 | provenance_trace | etl_pipeline_runner |
| ASSI-0005 | source_system_sync | data_steward_cli |
| ASSI-0006 | source_system_sync | catalog_sync_daemon |

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

Together, these tables form a coherent governance framework where allocation facts are enriched by categorical dimensions, training partnerships are explicitly linked to participating institutions, and annotation attributes are stored in a type-safe, extensible manner. The use of distinct value tables per attr_type avoids the pitfalls of wide nullable columns and enables the system to accommodate new attribute definitions without schema migrations. Exit codes and retry counts on allocation facts provide the signal needed for operational dashboards and compliance audits, while the training partnership table supports programmatic oversight of educational collaborations. The annotation attribute system, with its separation of attr definitions from typed values, allows the platform to record provenance metadata — such as provenance_trace annotations assigned by schema_registry_service or etl_pipeline_runner — with full type fidelity and traceability.