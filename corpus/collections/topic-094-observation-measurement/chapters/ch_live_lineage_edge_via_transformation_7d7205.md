---
chapter_id: ch_live_lineage_edge_via_transformation_7d7205
topic_id: 94
family: 05_provo_lineage
cited_terms: ['lineage_edge_via_transformation', 'belief_interval_at_confidence_level', 'metric_with_aggregation']
model: engine-refine
---

In governed data systems, **identifier**, **entity**, **attr**, **attr_type**, **confidence**, **uncertainty**, and **misc** form the minimum vocabulary for stating what is known, how strongly it is known, and under what typing rules it may be consumed. An **identifier** is not merely a surrogate key but a durable handle that survives re-ingestion, re-aggregation, and cross-domain linkage: lineage edges carry identifiers such as TRAN-0001 through TRAN-0004, belief intervals are keyed as LEVE-0001 through LEVE-0004, and aggregation metrics resolve as AGGR-0001 through AGGR-0004. Those handles let auditors, orchestrators, and downstream consumers refer to the same logical object across pipelines without collapsing distinct provenance paths. **Entity** denotes the subject to which attributes attach—the belief interval LEVE-0001, the aggregation profile AGGR-0002, or the lineage assertion TRAN-0003—while value rows bind **entity_id** to **attr_id** so that heterogeneous facts about a single entity can be stored without widening a monolithic record. The separation of identity from assertion is what permits a calibration drift reading, a query result set, a schema migration status, and a sensor telemetry snapshot to coexist as comparable belief objects even though their operational semantics differ sharply.

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

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | memory_usage_gigabytes | LEVE-0007 |
| AGGR-0002 | log_error_rate_per_minute | LEVE-0006 |
| AGGR-0003 | cpu_utilization_percent | LEVE-0007 |
| AGGR-0004 | api_response_time_p99 | LEVE-0002 |
| AGGR-0005 | queue_depth_messages | LEVE-0005 |
| AGGR-0006 | database_connection_pool_active | LEVE-0001 |
| AGGR-0007 | http_request_latency_ms | LEVE-0007 |
| AGGR-0008 | api_response_time_p99 | LEVE-0006 |

**t_metric_with_aggregation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | checksum | xsd:string |
| AGGR-0002 | created_date | xsd:date |
| AGGR-0003 | identifier | cco:DesignativeICE |
| AGGR-0004 | license | xsd:string |
| AGGR-0005 | mime_type | xsd:string |
| AGGR-0006 | size_bytes | xsd:long |
| AGGR-0007 | uri | xsd:string |
| AGGR-0008 | version | xsd:integer |

**t_metric_with_aggregation_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0006 | 105 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | 11 |
| AGGR-0003 | AGGR-0002 | AGGR-0006 | 324 |
| AGGR-0004 | AGGR-0002 | AGGR-0008 | 2 |
| AGGR-0005 | AGGR-0003 | AGGR-0006 | 334 |
| AGGR-0006 | AGGR-0003 | AGGR-0008 | 9 |
| AGGR-0007 | AGGR-0004 | AGGR-0006 | 424 |
| AGGR-0008 | AGGR-0004 | AGGR-0008 | 12 |

**Attr** names the facet under measurement or declaration—confidence, dimension_kind, method, recorded_at on belief intervals; checksum, created_date, identifier, and license on aggregation metrics—while **attr_type** constrains how that facet may be serialized, compared, and validated. Typing is not decorative: confidence is declared as xsd:decimal, dimension_kind and method as xsd:string, recorded_at as xsd:dateTime, created_date as xsd:date, and designative identifiers as cco:DesignativeICE. That discipline prevents category errors at the boundary between storage and inference—decimal confidence cannot be silently coerced into lexical tokens, and datetime provenance cannot be flattened into undifferentiated strings without explicit loss of temporal ordering. In practice, attr_type governs which value store receives a **misc** payload: decimals land in typed decimal tables (0.649 for LEVE-0001’s confidence, 0.339 for LEVE-0002), varchars hold lexical misc such as Dimension Kind 01, Encoding 02, audit excerpt, and en, and datetimes preserve instants like 2023-02-13T08:09:52 and 2025-05-13T04:15:37. Misc is thus the evidence-bearing literal—the checksum 1a4b6c2d, the license Apache-2.0, the zone label zone-b—not an informal catch-all but the typed value slot whose interpretation is fully determined by the paired attr and attr_type.

**Confidence** and **uncertainty** articulate complementary dimensions of epistemic posture and must be read in context rather than as interchangeable magnitudes. Along lineage edges, confidence scores of 0.439, 0.111, 0.554, and 0.532 accompany uncertainty figures of 766.93, 650.52, 878.86, and 350.43 for transformations linking Inventory Reconciliation and Patient Cohort Extraction to Genomic Variant Catalog, Clinical Trial Registry, Financial Risk Pipeline, and related paths. A comparatively high confidence of 0.554 on Timezone Normalization does not, by itself, certify fitness for release when paired with uncertainty of 878.86; conversely, TRAN-0004’s reconciliation edge at 0.532 confidence with uncertainty 350.43 may present a tighter operational band despite marginally lower point confidence. Belief intervals extend the same logic into observational states: LEVE-0001’s confidence misc of 0.649 sits alongside varchar misc encoding method and dimension_kind and a recorded_at instant, while LEVE-0002’s confidence of 0.339 is materialized under a different entity binding. Confidence levels themselves are referenced by identifier—beliefs attach at AGGR-0002, AGGR-0003, and AGGR-0007—so that a calibration drift reading, query result set, or migration status is evaluated against an explicit aggregation temporality rather than an implicit global threshold.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Inventory Reconciliation | Genomic Variant Catalog | 0.439 | 766.93 |
| TRAN-0002 | Patient Cohort Extraction | Clinical Trial Registry | 0.111 | 650.52 |
| TRAN-0003 | Timezone Normalization | Financial Risk Pipeline | 0.554 | 878.86 |
| TRAN-0004 | Inventory Reconciliation | Genomic Variant Catalog | 0.532 | 350.43 |
| TRAN-0005 | Schema Migration | SQL Join Aggregation | 0.034 | 365.80 |
| TRAN-0006 | Schema Migration | SQL Join Aggregation | 0.440 | 497.03 |

**t_belief_interval_at_confidence_level**

| id | belief | at_confidence_level |
| --- | --- | --- |
| LEVE-0001 | Calibration drift reading | AGGR-0002 |
| LEVE-0002 | Query result set | AGGR-0003 |
| LEVE-0003 | Schema migration status | AGGR-0007 |
| LEVE-0004 | Sensor telemetry snapshot | AGGR-0002 |
| LEVE-0005 | Data lineage trace | AGGR-0002 |
| LEVE-0006 | Pipeline throughput metric | AGGR-0005 |
| LEVE-0007 | Schema migration status | AGGR-0002 |
| LEVE-0008 | Lab assay concentration | AGGR-0006 |

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

The interplay of entity, attr, and misc becomes operational when metrics inherit aggregation context and lineage constraints propagate into monitoring semantics. Metrics such as memory_usage_gigabytes, log_error_rate_per_minute, cpu_utilization_percent, and api_response_time_p99 are not free-floating scalars; they resolve through aggregation_temporality back to belief intervals (LEVE-0007, LEVE-0006, LEVE-0002), embedding each measurement in a time-bounded interpretive frame. Integer misc values—105 and 11 for AGGR-0001, 324 and 2 for AGGR-0002—coexist with date misc on created_date and varchar misc on checksum, identifier, and license, demonstrating that a single aggregation entity carries both quantitative and declarative facets under distinct attrs. Governance therefore treats attr_type as the enforcement layer, misc as the auditable fact, confidence and uncertainty as the decision-grade qualifiers, identifier as the cross-reference spine, and entity as the unit of compositional integrity. Systems that honor that separation can reconcile low-confidence lineage (0.111 on Patient Cohort Extraction via Clinical Trial Registry) against higher-confidence downstream beliefs without conflating provenance weakness with attribute invalidity, and can require that every misc value remain traceable to a typed attr on a stable entity identified for the life of the compliance record.

**t_metric_with_aggregation_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | 2025-01-26 |
| AGGR-0002 | AGGR-0002 | AGGR-0002 | 2024-12-19 |
| AGGR-0003 | AGGR-0003 | AGGR-0002 | 2025-05-29 |
| AGGR-0004 | AGGR-0004 | AGGR-0002 | 2024-03-19 |
| AGGR-0005 | AGGR-0005 | AGGR-0002 | 2023-09-16 |
| AGGR-0006 | AGGR-0006 | AGGR-0002 | 2023-04-28 |
| AGGR-0007 | AGGR-0007 | AGGR-0002 | 2024-03-10 |
| AGGR-0008 | AGGR-0008 | AGGR-0002 | 2024-10-06 |

**t_metric_with_aggregation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 1a4b6c2d |
| AGGR-0002 | AGGR-0001 | AGGR-0003 | ref-8842 |
| AGGR-0003 | AGGR-0001 | AGGR-0004 | Apache-2.0 |
| AGGR-0004 | AGGR-0001 | AGGR-0009 | zone-b |
| AGGR-0005 | AGGR-0001 | AGGR-0005 | text/plain |
| AGGR-0006 | AGGR-0001 | AGGR-0010 | Name 06 |
| AGGR-0007 | AGGR-0001 | AGGR-0011 | data-engineering |
| AGGR-0008 | AGGR-0001 | AGGR-0012 | Tags 08 |