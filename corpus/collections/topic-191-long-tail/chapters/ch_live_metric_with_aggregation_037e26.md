---
chapter_id: ch_live_metric_with_aggregation_037e26
topic_id: 191
family: 07_long_tail
cited_terms: ['metric_with_aggregation', 'evidence_basic', 'requirement_min_one_verification']
model: engine-refine
---

A compliance data model must reconcile two competing demands: the need for a stable, queryable core of identifiers and metric definitions, and the need for flexible, extensible metadata that accommodates heterogeneous attribute types without schema migration. The architecture achieves this through a separation of entity definitions, attribute schemas, and typed value stores. At the entity level, records such as `AGGR-0001` through `AGGR-0004` anchor measurable quantities—`memory_usage_gigabytes`, `log_error_rate_per_minute`, `cpu_utilization_percent`, `api_response_time_p99`—each associated with an aggregation temporality reference (`VERI-0001`, `VERI-0006`, `VERI-0002`). Similarly, evidence records identified as `EVID-0001` through `EVID-0004` carry descriptive labels like `Compliance checklist`, `Latency benchmark result`, and `Incident postmortem`, while requirements such as `Latency threshold 50ms`, `Audit log completeness`, and `Backup frequency daily` are linked to verification sources through cross-references to evidence identifiers. This tripartite structure—entities, evidence, and requirements—forms the backbone of traceability, ensuring that every assertion can be resolved to a concrete datum.

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | memory_usage_gigabytes | VERI-0001 |
| AGGR-0002 | log_error_rate_per_minute | VERI-0006 |
| AGGR-0003 | cpu_utilization_percent | VERI-0001 |
| AGGR-0004 | api_response_time_p99 | VERI-0002 |
| AGGR-0005 | queue_depth_messages | VERI-0001 |
| AGGR-0006 | database_connection_pool_active | VERI-0005 |
| AGGR-0007 | http_request_latency_ms | VERI-0005 |
| AGGR-0008 | api_response_time_p99 | VERI-0006 |

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

**t_requirement_min_one_verification**

| id | requirement | verified_by |
| --- | --- | --- |
| VERI-0001 | Latency threshold 50ms | EVID-0004 |
| VERI-0002 | Audit log completeness | EVID-0001 |
| VERI-0003 | Backup frequency daily | EVID-0002 |
| VERI-0004 | Backup frequency daily | EVID-0002 |
| VERI-0005 | Schema validation strict | EVID-0004 |
| VERI-0006 | PII masking rule | EVID-0006 |

**t_requirement_min_one_verification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | effective_date | xsd:date |
| VERI-0002 | enforcement | xsd:string |
| VERI-0003 | mandatory | xsd:boolean |
| VERI-0004 | priority | xsd:integer |
| VERI-0005 | review_cycle_days | xsd:integer |
| VERI-0006 | scope | xsd:string |
| VERI-0007 | encoding | xsd:string |
| VERI-0008 | label_text | xsd:string |

**t_requirement_min_one_verification_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 2023-09-25 |
| VERI-0002 | VERI-0002 | VERI-0001 | 2024-02-07 |
| VERI-0003 | VERI-0003 | VERI-0001 | 2023-08-17 |
| VERI-0004 | VERI-0004 | VERI-0001 | 2025-02-12 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2023-06-21 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2024-04-16 |

**t_requirement_min_one_verification_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | 1 |
| VERI-0002 | VERI-0001 | VERI-0005 | 285 |
| VERI-0003 | VERI-0002 | VERI-0004 | 1 |
| VERI-0004 | VERI-0002 | VERI-0005 | 542 |
| VERI-0005 | VERI-0003 | VERI-0004 | 5 |
| VERI-0006 | VERI-0003 | VERI-0005 | 517 |
| VERI-0007 | VERI-0004 | VERI-0004 | 2 |
| VERI-0008 | VERI-0004 | VERI-0005 | 72 |

Attributes are declared independently of their values, enabling a schema-on-read pattern that preserves type discipline without enforcing rigid column layouts. For aggregated metrics, the attribute catalog includes `checksum` (typed as `xsd:string`), `created_date` (`xsd:date`), `identifier` (`cco:DesignativeICE`), and `license` (`xsd:string`), each registered under a distinct attribute identifier. Requirements carry their own attribute vocabulary: `effective_date` (`xsd:date`), `enforcement` (`xsd:string`), `mandatory` (`xsd:boolean`), and `priority` (`xsd:integer`). The attr_name and attr_type columns together constitute a lightweight type registry, decoupling the definition of what an attribute is from the storage of what its value happens to be. This separation permits the same attribute name to carry different semantic weight across entity types, and it allows new attributes to be introduced without altering the value tables.

Typed value tables materialize the attribute definitions through a vertical partitioning strategy that routes values to storage columns by their declared type. Date-valued attributes—such as the `created_date` entries for metric entities `AGGR-0001` through `AGGR-0004`—are stored in `t_metric_with_aggregation_val_date` with values ranging from `2024-03-19` to `2025-05-29`, while integer-valued attributes like `priority` for requirements `VERI-0001` and `VERI-0002` reside in `t_requirement_min_one_verification_val_int` with values of `1` and `285` or `1` and `542`. Boolean attributes such as `mandatory` are persisted in a dedicated boolean store, where requirement `VERI-0002` carries a value of `true` and the remaining records are `false`. String-valued attributes populate `t_metric_with_aggregation_val_varchar` with entries like `1a4b6c2d` (a checksum), `ref-8842` (an identifier), `Apache-2.0` (a license), and `zone-b` (an environment designation), while requirement varchar values include `Encoding 01`, `Enforcement 02`, `change rationale`, and `fr`. The entity_id column in each value table serves as the foreign key back to the owning entity, and attr_id resolves to the attribute definition, forming a normalized junction that preserves referential integrity across the type-dispatched stores.

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

**t_requirement_min_one_verification_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | false |
| VERI-0002 | VERI-0002 | VERI-0003 | true |
| VERI-0003 | VERI-0003 | VERI-0003 | false |
| VERI-0004 | VERI-0004 | VERI-0003 | false |
| VERI-0005 | VERI-0005 | VERI-0003 | false |
| VERI-0006 | VERI-0006 | VERI-0003 | false |

**t_requirement_min_one_verification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0007 | Encoding 01 |
| VERI-0002 | VERI-0001 | VERI-0002 | Enforcement 02 |
| VERI-0003 | VERI-0001 | VERI-0008 | change rationale |
| VERI-0004 | VERI-0001 | VERI-0009 | fr |
| VERI-0005 | VERI-0001 | VERI-0006 | Scope 05 |
| VERI-0006 | VERI-0002 | VERI-0007 | Encoding 06 |
| VERI-0007 | VERI-0002 | VERI-0002 | Enforcement 07 |
| VERI-0008 | VERI-0002 | VERI-0008 | intake form |

Encoding and dimension metadata provide the final layer of contextual discipline, anchoring evidence records to the character sets and measurement categories under which they were produced. The `t_evidence_basic` table records `dimension_kind` values such as `temperature`, `count`, and `pressure`, distinguishing the physical or logical category of the evidence, while the `encoding` column specifies the character encoding—`ascii`, `latin1`, or `utf8`—used in the source material. These fields are not merely descriptive; they govern how downstream consumers interpret byte sequences and how dimension-based queries filter or aggregate evidence. A `Compliance checklist` recorded with `utf8` encoding and `temperature` dimension kind carries different semantic constraints than the same checklist recorded under `ascii` with `pressure`, and the model makes this distinction explicit rather than deferring it to application logic.

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |
| EVID-0006 | Metric threshold breach | temperature | ascii |

The foreign-key topology binds these layers into a coherent traceability graph. Aggregation temporality references in the metric table point to verification records (`VERI-0001`, `VERI-0006`, `VERI-0002`), which in turn are defined in the requirements table and linked back to evidence through the `verified_by` column—`EVID-0004` verifies `Backup frequency daily`, `EVID-0001` verifies `Latency threshold 50ms`, and `EVID-0002` serves as the verification source for both `Audit log completeness` and `Backup frequency daily`. Attribute identifiers in the value tables resolve to attribute definitions in the attribute catalog tables, and entity identifiers in the value tables resolve to the core entity tables. This chain—entity to attribute definition to typed value, and requirement to verification to evidence—ensures that every stored value can be traced back through its type declaration to the entity it describes and, where applicable, to the evidence that substantiates the requirement it satisfies.