---
chapter_id: ch_live_alert_governed_by_runbook_10ac57
topic_id: 119
family: 07_long_tail
cited_terms: ['alert_governed_by_runbook', 'span_with_parent', 'lineage_edge_with_confidence']
model: engine-refine
---

Within enterprise data governance, the structuring of metadata around discrete entities demands a disciplined separation between what an attribute is, what form its value takes, and which entity it qualifies. Attribute definitions—such as `effective_date`, `enforcement`, `mandatory`, and `priority`—are catalogued with explicit type declarations (`xsd:date`, `xsd:string`, `xsd:boolean`, `xsd:integer`) that constrain the domain of permissible values and ensure type safety across downstream consumers. Each attribute is anchored to an entity through a composite key that binds the attribute identifier to the entity identifier, producing a normalized fact table where the attribute value occupies its own typed column. Thus, the boolean attribute `mandatory` resolves to `false` for entity `RUNB-0001` and `true` for `RUNB-0003`, while the date attribute `effective_date` yields `2023-06-14` for `RUNB-0001` and `2025-03-21` for `RUNB-0003`. This schema pattern—where attribute names, types, and values are stored in distinct tables keyed by `attr`, `attr_type`, and `entity_id` respectively—decouples the schema from the data, permitting new attributes to be introduced without schema migration.

**t_alert_governed_by_runbook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RUNB-0001 | effective_date | xsd:date |
| RUNB-0002 | enforcement | xsd:string |
| RUNB-0003 | mandatory | xsd:boolean |
| RUNB-0004 | priority | xsd:integer |
| RUNB-0005 | review_cycle_days | xsd:integer |
| RUNB-0006 | scope | xsd:string |
| RUNB-0007 | encoding | xsd:string |
| RUNB-0008 | label_text | xsd:string |

**t_alert_governed_by_runbook_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0003 | false |
| RUNB-0002 | RUNB-0002 | RUNB-0003 | false |
| RUNB-0003 | RUNB-0003 | RUNB-0003 | true |
| RUNB-0004 | RUNB-0004 | RUNB-0003 | true |
| RUNB-0005 | RUNB-0005 | RUNB-0003 | true |
| RUNB-0006 | RUNB-0006 | RUNB-0003 | true |

**t_alert_governed_by_runbook_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0001 | 2023-06-14 |
| RUNB-0002 | RUNB-0002 | RUNB-0001 | 2023-01-20 |
| RUNB-0003 | RUNB-0003 | RUNB-0001 | 2025-03-21 |
| RUNB-0004 | RUNB-0004 | RUNB-0001 | 2025-02-03 |
| RUNB-0005 | RUNB-0005 | RUNB-0001 | 2023-12-24 |
| RUNB-0006 | RUNB-0006 | RUNB-0001 | 2024-09-30 |

**t_alert_governed_by_runbook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0004 | 3 |
| RUNB-0002 | RUNB-0001 | RUNB-0005 | 802 |
| RUNB-0003 | RUNB-0002 | RUNB-0004 | 2 |
| RUNB-0004 | RUNB-0002 | RUNB-0005 | 702 |
| RUNB-0005 | RUNB-0003 | RUNB-0004 | 5 |
| RUNB-0006 | RUNB-0003 | RUNB-0005 | 87 |
| RUNB-0007 | RUNB-0004 | RUNB-0004 | 1 |
| RUNB-0008 | RUNB-0004 | RUNB-0005 | 47 |

**t_alert_governed_by_runbook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0007 | Encoding 01 |
| RUNB-0002 | RUNB-0001 | RUNB-0002 | Enforcement 02 |
| RUNB-0003 | RUNB-0001 | RUNB-0008 | pre-release note |
| RUNB-0004 | RUNB-0001 | RUNB-0009 | en |
| RUNB-0005 | RUNB-0001 | RUNB-0006 | Scope 05 |
| RUNB-0006 | RUNB-0002 | RUNB-0007 | Encoding 06 |
| RUNB-0007 | RUNB-0002 | RUNB-0002 | Enforcement 07 |
| RUNB-0008 | RUNB-0002 | RUNB-0008 | change rationale |

The identifier space serves as the universal addressing mechanism across all entity types. Runbook identifiers such as `RUNB-0001` through `RUNB-0004` reference operational procedures like "Data Pipeline Stalled" and "TLS Certificate Expiry," while span identifiers such as `PARE-0001` through `PARE-0004` reference distributed tracing components like "orchestrator job" and "api gateway route." Lineage identifiers such as `CONF-0001` through `CONF-0004` reference provenance relationships between data assets, exemplified by `ml_training_dataset_prep` and `data_lake_warehouse_sync`. The uniformity of the identifier pattern—prefix, hyphen, zero-padded sequence—enables cross-referencing between tables without ambiguity, and the prefix itself encodes the entity class, allowing parsers to dispatch lookups to the appropriate catalog.

**t_alert_governed_by_runbook**

| id | alert |
| --- | --- |
| RUNB-0001 | Data Pipeline Stalled |
| RUNB-0002 | API Gateway Timeout |
| RUNB-0003 | CPU Utilization Critical |
| RUNB-0004 | TLS Certificate Expiry |
| RUNB-0005 | Disk Space Warning |
| RUNB-0006 | Memory Leak Detected |

**t_span_with_parent**

| id | span |
| --- | --- |
| PARE-0001 | orchestrator job |
| PARE-0002 | api gateway route |
| PARE-0003 | request router |
| PARE-0004 | gateway auth check |
| PARE-0005 | kafka consumer process |
| PARE-0006 | gateway auth check |
| PARE-0007 | orchestrator job |
| PARE-0008 | service mesh proxy |

**t_span_with_parent_parent_span**

| id | parent_span |
| --- | --- |
| PARE-0001 | cache lookup session |
| PARE-0002 | service mesh proxy |
| PARE-0003 | load balancer forward |
| PARE-0004 | service mesh proxy |
| PARE-0005 | kafka consumer process |
| PARE-0006 | kafka consumer process |

Relationships between entities are expressed through the subject-target-role triad, which models directed edges in a property graph. In the span hierarchy, the subject column (`span_id`) identifies the child entity—`PARE-0004`, `PARE-0002`, `PARE-0003`, `PARE-0005`—while the target column (`parent_span_id`) identifies the parent—`PARE-0002`, `PARE-0005`, `PARE-0001`, `PARE-0005`—and the role column assigns a semantic label to the edge, such as `owner`, `observer`, or `reviewer`. This three-column junction table permits multiple relationship types between the same pair of entities and supports role-based access control and traversal logic. The same pattern generalizes to any binary relationship where the nature of the connection carries metadata beyond a simple existence claim.

**t_span_with_parent__parent_span**

| id | span_id | parent_span_id | role |
| --- | --- | --- | --- |
| PARE-0001 | PARE-0004 | PARE-0002 | owner |
| PARE-0002 | PARE-0002 | PARE-0005 | observer |
| PARE-0003 | PARE-0003 | PARE-0001 | owner |
| PARE-0004 | PARE-0005 | PARE-0005 | reviewer |
| PARE-0005 | PARE-0005 | PARE-0003 | owner |
| PARE-0006 | PARE-0005 | PARE-0002 | observer |
| PARE-0007 | PARE-0004 | PARE-0002 | observer |
| PARE-0008 | PARE-0006 | PARE-0005 | contributor |

Temporal provenance and measurement semantics are captured through the `recorded_at` and `unit` columns, which annotate facts with when they were observed and in what physical or logical scale. The lineage confidence table records timestamps such as `2024-07-21T21:36:51`, `2025-03-12T13:46:59`, `2023-02-17T19:37:00`, and `2024-01-06T01:59:57`, enabling temporal queries that reconstruct the state of provenance at any point in time. The unit column carries measurement context—`deg_C`, `mg/L`, `ratio`, `nm`—that disambiguates numeric values and supports unit-aware aggregation and validation. Confidence scores such as `partial_match`, `statistical_overlap`, and `95_percent` further qualify the strength of the relationship, allowing consumers to apply threshold-based filtering. Together, `recorded_at` and `unit` transform a static graph into a versioned, physically grounded model suitable for audit and compliance.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |