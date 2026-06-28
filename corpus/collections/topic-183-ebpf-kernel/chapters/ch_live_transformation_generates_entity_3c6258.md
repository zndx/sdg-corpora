---
chapter_id: ch_live_transformation_generates_entity_3c6258
topic_id: 183
family: 05_provo_lineage
cited_terms: ['transformation_generates_entity', 'black_belt_certification_requirement', 'dengue_transmission_process']
model: engine-refine
---

The transformation-to-entity lineage model captures how data engineering processes produce concrete artifacts, each with measurable characteristics that support downstream governance. A transformation such as a schema migration routine or batch ingestion pipeline is recorded alongside the entity it generates—calibrated sensor readings, a feature matrix, or a cleaned telemetry dataset—along with the elapsed duration in seconds and the operational phase. Duration values range from roughly 2,310 seconds for a batch ingestion pipeline producing a feature matrix to nearly 6,875 seconds for a feature engineering step yielding a cleaned telemetry dataset, all of which fall within the execution phase. This linkage between identifier, transformation, generated entity, duration, and phase provides an auditable trail that connects operational effort to data product output, enabling capacity planning and quality attribution.

**t_transformation_generates_entity**

| id | transformation | generates_entity | duration_seconds | phase |
| --- | --- | --- | --- | --- |
| ENTI-0001 | schema migration routine | calibrated sensor readings | 5649.07 | execution |
| ENTI-0002 | batch ingestion pipeline | feature matrix | 2309.83 | execution |
| ENTI-0003 | archival compression job | feature matrix | 2913.69 | execution |
| ENTI-0004 | feature engineering step | cleaned telemetry dataset | 6875.45 | execution |
| ENTI-0005 | telemetry aggregation task | feature matrix | 2931.10 | closeout |
| ENTI-0006 | batch ingestion pipeline | reconciliation report | 4817.44 | review |

**t_black_belt_certification_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | Dimension Kind 01 |
| REQU-0002 | REQU-0001 | REQU-0008 | Encoding 02 |
| REQU-0003 | REQU-0001 | REQU-0009 | pre-release note |
| REQU-0004 | REQU-0001 | REQU-0010 | ja |
| REQU-0005 | REQU-0001 | REQU-0003 | hybrid |
| REQU-0006 | REQU-0001 | REQU-0006 | m/s |
| REQU-0007 | REQU-0002 | REQU-0002 | Dimension Kind 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | Encoding 08 |

Certification requirements impose structured quality gates on data assets, and these requirements are themselves modeled as first-class entities with typed attributes. A requirement such as ProvenanceTrackingBB or LabQualityControlBB carries attributes like confidence, dimension_kind, method, and recorded_at, each with a defined schema type—xsd:decimal for numeric measures, xsd:string for categorical or textual descriptors, and xsd:dateTime for temporal stamps. The attribute-value pairs are stored in a normalized, type-disaggregated fashion: decimal values such as 0.856 or 807.42 reside in one store, string values like Dimension Kind 01, Encoding 02, pre-release note, or ja in another, and datetime values such as 2025-05-17T18:36:12 or 2024-10-05T03:41:40 in a third. This design preserves type safety while allowing each requirement to accumulate a heterogeneous set of quality criteria without schema rigidity.

**t_black_belt_certification_requirement**

| id | black_belt_certification_requirement |
| --- | --- |
| REQU-0001 | ProvenanceTrackingBB |
| REQU-0002 | LabQualityControlBB |
| REQU-0003 | ProvenanceTrackingBB |
| REQU-0004 | LabQualityControlBB |
| REQU-0005 | ProvenanceTrackingBB |
| REQU-0006 | DataEngineeringBlackBelt |
| REQU-0007 | MLOpsQualityBB |
| REQU-0008 | APIGatewayBB |

**t_black_belt_certification_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | confidence | xsd:decimal |
| REQU-0002 | dimension_kind | xsd:string |
| REQU-0003 | method | xsd:string |
| REQU-0004 | recorded_at | xsd:dateTime |
| REQU-0005 | uncertainty | xsd:decimal |
| REQU-0006 | unit | xsd:string |
| REQU-0007 | value | xsd:decimal |
| REQU-0008 | encoding | xsd:string |

**t_black_belt_certification_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 2025-05-17T18:36:12 |
| REQU-0002 | REQU-0002 | REQU-0004 | 2024-10-05T03:41:40 |
| REQU-0003 | REQU-0003 | REQU-0004 | 2024-07-29T04:57:09 |
| REQU-0004 | REQU-0004 | REQU-0004 | 2025-04-05T22:06:20 |
| REQU-0005 | REQU-0005 | REQU-0004 | 2024-09-27T11:02:14 |
| REQU-0006 | REQU-0006 | REQU-0004 | 2023-05-05T18:06:19 |
| REQU-0007 | REQU-0007 | REQU-0004 | 2023-08-07T06:49:00 |
| REQU-0008 | REQU-0008 | REQU-0004 | 2023-09-09T17:25:37 |

**t_black_belt_certification_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 0.856 |
| REQU-0002 | REQU-0001 | REQU-0005 | 807.42 |
| REQU-0003 | REQU-0001 | REQU-0007 | 629.05 |
| REQU-0004 | REQU-0002 | REQU-0001 | 0.026 |
| REQU-0005 | REQU-0002 | REQU-0005 | 321.43 |
| REQU-0006 | REQU-0002 | REQU-0007 | 502.76 |
| REQU-0007 | REQU-0003 | REQU-0001 | 0.827 |
| REQU-0008 | REQU-0003 | REQU-0005 | 134.63 |

The event fact table operationalizes this governance framework by recording observable occurrences—such as dengue-related events—with counts that quantify exposure or incidence. Each fact row carries an identifier, an event count ranging from 56 to 444, and foreign-key references to host and vector dimensions. A single process identifier like PROC-0001 may involve host PROC-0002 and vector PROC-0004, yielding 251 recorded events, while PROC-0002 involves host PROC-0001 and vector PROC-0002 with a count of 444. These counts serve as the quantitative backbone for risk assessment, resource allocation, and compliance reporting, grounding abstract quality requirements in measurable outcomes.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |

Host and vector dimensions provide the categorical context that transforms raw event counts into actionable intelligence. Each host and vector is described by a label and a category—Involves Host Label 01 through 04 mapped to categories Involves Host Category 01 through 04, and similarly for vectors with labels and categories following the same pattern. The fact table's foreign keys to these dimensions enable slicing events by host type, vector type, or their combination, supporting epidemiological analysis, targeted intervention, and regulatory documentation. The categorical taxonomy ensures that event data can be aggregated, filtered, and reported consistently across operational and compliance workflows.

Together, these tables form a cohesive data governance architecture: transformations generate entities with traceable durations and phases; certification requirements define the quality attributes those entities must satisfy; event facts quantify real-world occurrences; and host/vector dimensions supply the classification framework that makes those quantities interpretable. The foreign-key relationships—between transformations and entities, between requirements and their typed attribute values, and between event facts and their dimensional contexts—create a navigable graph of provenance, compliance, and impact. This structure supports end-to-end auditability, from the engineering process that produced a data artifact through the quality criteria it was held to, down to the observable events it helped inform.