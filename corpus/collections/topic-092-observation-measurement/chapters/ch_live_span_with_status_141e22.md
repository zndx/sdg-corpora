---
chapter_id: ch_live_span_with_status_141e22
topic_id: 92
family: 07_long_tail
cited_terms: ['span_with_status', 'claim_governed_by_directive', 'baseline_for_metric']
model: engine-refine
---

The governance of operational telemetry and compliance assertions rests upon a disciplined separation of identity, property, and relationship. Every observable entity—whether a span such as `certificate-renewal-cycle` or `api-gateway-request`, a claim such as `Mercury threshold exceeded` or `Latency within bounds`, or a baseline such as `Standard_Daylight_Cycle` or `Structural_Stress`—is anchored by a stable identifier, exemplified by the prefixes `STAT-`, `DIRE-`, and `METR-` followed by sequential ordinals. These identifiers function as the immutable keys through which all downstream associations are resolved, ensuring that a degraded status, a recorded timestamp, or a measured decimal value can be traced back to the precise entity it qualifies without ambiguity.

**t_span_with_status**

| id | span |
| --- | --- |
| STAT-0001 | certificate-renewal-cycle |
| STAT-0002 | certificate-renewal-cycle |
| STAT-0003 | data-ingestion-batch |
| STAT-0004 | api-gateway-request |
| STAT-0005 | certificate-renewal-cycle |
| STAT-0006 | session-initialization |

**t_span_with_status_span_status**

| id | span_status |
| --- | --- |
| STAT-0001 | degraded |
| STAT-0002 | timeout |
| STAT-0003 | partial_failure |
| STAT-0004 | partial_failure |
| STAT-0005 | partial_failure |
| STAT-0006 | degraded |

Attributes constitute the dimensional vocabulary by which entities are described and measured. Each attribute carries a name—`confidence`, `dimension_kind`, `method`, `recorded_at`—and a type that constrains the shape of its values: `xsd:decimal` for numeric precision, `xsd:string` for categorical labels, and `xsd:dateTime` for temporal anchoring. The type system enforces semantic discipline across heterogeneous value stores; a confidence score of `0.133` or `0.222` is stored in a decimal-typed value table, while a dimension kind such as `Dimension Kind 01` or an encoding designation like `Encoding 02` resides in a varchar-typed counterpart, and a recorded-at timestamp such as `2025-05-26T03:20:10` or `2024-09-09T11:00:31` is persisted in its own datetime-typed container. This value-type segregation is not an artifact of schema design but a deliberate mechanism for preserving type safety across a polyglot persistence layer.

The misc column, as it appears in the value tables, is the operational carrier for the actual datum—the raw measurement, the audit excerpt, the language tag `en`—detached from its attribute definition and stored in a type-specific table. This decoupling allows the attribute schema to evolve independently of the data it describes: new value types can be introduced without altering the attribute registry, and historical values remain intact even as their semantic interpretation shifts. The entity column in each value table reattaches the misc datum to its governing entity, forming a triad of entity, attribute, and value that is both queryable and auditable.

Subject, target, and role complete the relational fabric by expressing how entities, attributes, and baselines interconnect. A junction table such as the one linking spans to their statuses or baselines to their metrics does not merely associate two identifiers; it assigns a role—`contributor`, `observer`, or `owner`—that qualifies the nature of the relationship. A span identified as `STAT-0001` may serve as a contributor to one status and an observer of another, while a baseline such as `METR-0007` may own one metric and contribute to another. The subject column names the originating entity in the relationship, the target column names the recipient, and the role column names the capacity in which the subject acts. This three-part relationship model transforms flat associations into a navigable graph where the semantics of connection are as explicit as the connections themselves.

**t_span_with_status__span_status**

| id | span_id | span_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0005 | contributor |
| STAT-0002 | STAT-0005 | STAT-0006 | observer |
| STAT-0003 | STAT-0001 | STAT-0001 | contributor |
| STAT-0004 | STAT-0001 | STAT-0002 | observer |
| STAT-0005 | STAT-0003 | STAT-0002 | owner |
| STAT-0006 | STAT-0001 | STAT-0001 | owner |
| STAT-0007 | STAT-0004 | STAT-0006 | observer |
| STAT-0008 | STAT-0003 | STAT-0004 | reviewer |

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

In practice, this architecture supports compliance assertions that are both granular and traceable. A claim such as `Access policy enforced` can carry a confidence of `628.22` and a dimension kind of `Dimension Kind 01`, while a baseline like `Power_Consumption` can be governed by a metric for `Data_Ingestion_Rate` with the baseline acting as owner. The same structural primitives—identifier, attribute, type, value, entity, subject, target, role—recur across every domain, from operational telemetry to regulatory claims, providing a unified vocabulary for governance that scales without fragmenting.

**t_claim_governed_by_directive**

| id | claim |
| --- | --- |
| DIRE-0001 | Mercury threshold exceeded |
| DIRE-0002 | Access policy enforced |
| DIRE-0003 | Latency within bounds |
| DIRE-0004 | Mercury threshold exceeded |
| DIRE-0005 | Emission limits met |
| DIRE-0006 | Certificate chain valid |
| DIRE-0007 | Sampling frequency adequate |
| DIRE-0008 | Sensor calibration valid |

**t_claim_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | confidence | xsd:decimal |
| DIRE-0002 | dimension_kind | xsd:string |
| DIRE-0003 | method | xsd:string |
| DIRE-0004 | recorded_at | xsd:dateTime |
| DIRE-0005 | uncertainty | xsd:decimal |
| DIRE-0006 | unit | xsd:string |
| DIRE-0007 | value | xsd:decimal |
| DIRE-0008 | encoding | xsd:string |

**t_claim_governed_by_directive_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2025-05-26T03:20:10 |
| DIRE-0002 | DIRE-0002 | DIRE-0004 | 2024-09-09T11:00:31 |
| DIRE-0003 | DIRE-0003 | DIRE-0004 | 2023-10-05T17:19:44 |
| DIRE-0004 | DIRE-0004 | DIRE-0004 | 2023-08-28T07:17:18 |
| DIRE-0005 | DIRE-0005 | DIRE-0004 | 2023-09-24T23:34:03 |
| DIRE-0006 | DIRE-0006 | DIRE-0004 | 2025-02-15T08:57:16 |
| DIRE-0007 | DIRE-0007 | DIRE-0004 | 2025-03-19T03:02:46 |
| DIRE-0008 | DIRE-0008 | DIRE-0004 | 2023-07-28T10:43:49 |

**t_claim_governed_by_directive_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 0.133 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 628.22 |
| DIRE-0003 | DIRE-0001 | DIRE-0007 | 405.89 |
| DIRE-0004 | DIRE-0002 | DIRE-0001 | 0.222 |
| DIRE-0005 | DIRE-0002 | DIRE-0005 | 369.68 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | 150.76 |
| DIRE-0007 | DIRE-0003 | DIRE-0001 | 0.686 |
| DIRE-0008 | DIRE-0003 | DIRE-0005 | 548.91 |

**t_claim_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0002 | Dimension Kind 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0008 | Encoding 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0009 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0010 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0003 | manual |
| DIRE-0006 | DIRE-0001 | DIRE-0006 | mg/L |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Dimension Kind 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | Encoding 08 |