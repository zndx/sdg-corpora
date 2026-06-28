---
chapter_id: ch_live_metric_with_aggregation_ee76a7
topic_id: 20
family: 07_long_tail
cited_terms: ['metric_with_aggregation', 'metric_with_unit', 'myxoid_degeneration_process']
model: engine-refine
---

The identifier column serves as the primary key across all metric and process tables, establishing a consistent addressing scheme that enables cross-referencing between metric definitions, their associated attributes, and the actual attribute values stored in separate typed value tables. In the aggregation metric domain, identifiers follow the pattern AGGR-0001 through AGGR-0004, while the unit-based metric tables use the parallel prefix UNIT-0001 through UNIT-0004, creating two distinct but structurally identical namespaces for different metric categories. This dual-namespace approach isolates aggregation-based metrics—such as `database_connection_pool_active` with `per_minute` temporality and `api_response_time_p99` with `24_hours` temporality—from unit-based metrics like `megabytes per second` with `network bandwidth` as its unit and `cpu_utilization_percent` with `queue_depth_messages` as its unit, ensuring that attribute schemas and value storage remain appropriately scoped.

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | database_connection_pool_active | per_minute |
| AGGR-0002 | api_response_time_p99 | 24_hours |
| AGGR-0003 | log_error_rate_per_minute | 5_minutes |
| AGGR-0004 | packet loss | 5_minutes |
| AGGR-0005 | disk_io_bytes_per_second | 1_month |
| AGGR-0006 | error rate | per_minute |
| AGGR-0007 | milliseconds | 30_minutes |
| AGGR-0008 | decibels | 1_hour |

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

**t_metric_with_unit**

| id | metric | metric_unit |
| --- | --- | --- |
| UNIT-0001 | megabytes per second | network bandwidth |
| UNIT-0002 | temperature | pressure |
| UNIT-0003 | degrees Celsius | records per second |
| UNIT-0004 | cpu_utilization_percent | queue_depth_messages |
| UNIT-0005 | data ingestion rate | battery_voltage_millivolts |
| UNIT-0006 | decibels | http_request_latency_ms |

**t_metric_with_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | checksum | xsd:string |
| UNIT-0002 | created_date | xsd:date |
| UNIT-0003 | identifier | cco:DesignativeICE |
| UNIT-0004 | license | xsd:string |
| UNIT-0005 | mime_type | xsd:string |
| UNIT-0006 | size_bytes | xsd:long |
| UNIT-0007 | uri | xsd:string |
| UNIT-0008 | version | xsd:integer |

**t_metric_with_unit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0006 | 97 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | 2 |
| UNIT-0003 | UNIT-0002 | UNIT-0006 | 477 |
| UNIT-0004 | UNIT-0002 | UNIT-0008 | 11 |
| UNIT-0005 | UNIT-0003 | UNIT-0006 | 499 |
| UNIT-0006 | UNIT-0003 | UNIT-0008 | 7 |
| UNIT-0007 | UNIT-0004 | UNIT-0006 | 214 |
| UNIT-0008 | UNIT-0004 | UNIT-0008 | 1 |

The attr and attr_type columns define the metadata schema that governs how supplementary information is attached to each metric entity. The attr column, realized as attr_name in the attribute definition tables, enumerates the set of permissible attribute names—`checksum`, `created_date`, `identifier`, and `license`—while attr_type specifies the data type constraint for each attribute using a combination of XML Schema and custom namespace types: `xsd:string` for free-form text such as checksums and license identifiers, `xsd:date` for temporal metadata, and `cco:DesignativeICE` for structured designative values. This type discipline ensures that when attribute values are stored in the typed value tables, they conform to their declared schemas, preventing type mismatches at query time and enabling the database engine to enforce constraints without application-level validation.

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

**t_metric_with_unit_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | 2023-09-28 |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | 2024-02-22 |
| UNIT-0003 | UNIT-0003 | UNIT-0002 | 2023-12-02 |
| UNIT-0004 | UNIT-0004 | UNIT-0002 | 2024-09-28 |
| UNIT-0005 | UNIT-0005 | UNIT-0002 | 2024-02-26 |
| UNIT-0006 | UNIT-0006 | UNIT-0002 | 2024-12-06 |

The entity column functions as the foreign key linking attribute values back to the metric or process they describe, creating a many-to-one relationship between the value tables and the core definition tables. In the aggregation metric context, entity_id values such as AGGR-0001 and AGGR-0002 appear repeatedly across the value tables, indicating that a single metric entity can carry multiple attributes of different types simultaneously. For instance, the metric identified as AGGR-0001 stores its `checksum` value `1a4b6c2d` in the varchar value table under entity_id AGGR-0001 and attr_id AGGR-0001, its `created_date` value `2025-01-26` in the date value table under the same entity_id but attr_id AGGR-0002, and its integer attributes `105` and `11` in the int value table under attr_ids AGGR-0006 and AGGR-0008 respectively. This denormalized value storage pattern—splitting values across three tables by type rather than using a single heterogeneous column—preserves type safety while allowing each metric to carry an arbitrary set of attributes without schema migration.

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

The misc column, appearing as the value column in all three typed value tables, holds the actual attribute data and represents the most frequently queried element of the schema. Its values span the full range of supported types: hexadecimal checksums like `c0ffee42` and `1a4b6c2d`, reference identifiers such as `ref-8842` and `oid:1.3.6.1`, license designations including `Apache-2.0` and `GPL-3.0`, geographic zone labels like `zone-b` and `eu-west-3`, and numeric measurements ranging from `2` to `477`. The separation of misc values into varchar, int, and date tables means that queries targeting a specific attribute type can be optimized for that type's storage format, while the entity_id and attr_id columns together form a composite foreign key that uniquely identifies each attribute value within its type-specific table.

**t_metric_with_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | c0ffee42 |
| UNIT-0002 | UNIT-0001 | UNIT-0003 | oid:1.3.6.1 |
| UNIT-0003 | UNIT-0001 | UNIT-0004 | GPL-3.0 |
| UNIT-0004 | UNIT-0001 | UNIT-0009 | eu-west-3 |
| UNIT-0005 | UNIT-0001 | UNIT-0005 | application/parquet |
| UNIT-0006 | UNIT-0001 | UNIT-0010 | Name 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0011 | data-engineering |
| UNIT-0008 | UNIT-0001 | UNIT-0012 | Tags 08 |

The myxoiddegenerationprocess, connectivetissueregion, and ganglioncystformation columns appear exclusively in the t_myxoid_degeneration_process table, where they model a clinical domain entity describing the pathological progression from tissue degeneration to cyst formation. The myxoiddegenerationprocess column identifies the anatomical origin of the degenerative process—`Knee Synovium`, `Elbow Tendon Myxoid`, `MCL Ligament Myxoid`, and `Knee Synovial Myxoid`—while the degrades column, typed as connectivetissueregion, specifies the anatomical structure being degraded, ranging from `Ankle Ligament Capsule` and `Wrist Flexor Sheath Myxoid` to `Hip Acetabular Labrum` and `Elbow Medial Tendon`. The results_in column, typed as ganglioncystformation, captures the clinical outcome, with observed cyst formations including `Patellar Retinaculum Cyst`, `Achilles Paratenon Cyst`, and `Elbow Lateral Epicondyle Cyst`. This three-column structure encodes a causal chain—degeneration process degrades connective tissue region, which results in ganglion cyst formation—using the same identifier-based foreign key pattern that underpins the metric tables, with process identifiers PROC-0001 through PROC-0004 providing the stable reference point for this clinical ontology.

**t_myxoid_degeneration_process**

| id | myxoid_degeneration_process | degrades | results_in |
| --- | --- | --- | --- |
| PROC-0001 | Knee Synovium | Ankle Ligament Capsule | Patellar Retinaculum Cyst |
| PROC-0002 | Elbow Tendon Myxoid | Wrist Flexor Sheath Myxoid | Achilles Paratenon Cyst |
| PROC-0003 | MCL Ligament Myxoid | Hip Acetabular Labrum | Achilles Paratenon Cyst |
| PROC-0004 | Knee Synovial Myxoid | Elbow Medial Tendon | Elbow Lateral Epicondyle Cyst |