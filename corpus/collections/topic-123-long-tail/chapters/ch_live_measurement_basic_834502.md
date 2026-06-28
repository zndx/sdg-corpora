---
chapter_id: ch_live_measurement_basic_834502
topic_id: 123
family: 02_observation_measurement
cited_terms: ['measurement_basic', 'schemaorg_product_sku', 'observation_governed_by_policy']
model: engine-refine
---

Attributes, attribute types, entities, identifiers, and miscellaneous values constitute the foundational vocabulary of a normalized metadata registry, where the distinction between what an attribute is and what it holds is enforced through structural separation. An entity represents a discrete, observable thing—a measurement, a product, or an operational incident—and is assigned a stable identifier that serves as the primary key across all subsequent tables. The identifier MEAS-0001, for instance, anchors a measurement entity whose domain is the Air Quality Index, while SKU-0001 identifies a product entity catalogued under the schemaorg name Pixel 8 Pro, and POLI-0001 designates an observation entity describing a north vent temperature spike. These identifiers are not arbitrary; they encode the entity class (MEAS, SKU, POLI) and a sequential ordinal, enabling both human readability and machine-parsable routing of queries to the correct entity family.

**t_schemaorg_product_sku**

| id | schemaorg | s_k_u |
| --- | --- | --- |
| SKU-0001 | Pixel 8 Pro | MEAS-0002 |
| SKU-0002 | MX Master 3S | MEAS-0004 |
| SKU-0003 | Galaxy S24 Ultra | MEAS-0001 |
| SKU-0004 | PlayStation 5 | MEAS-0006 |
| SKU-0005 | PlayStation 5 | MEAS-0007 |
| SKU-0006 | QuietComfort Ultra | MEAS-0003 |

**t_schemaorg_product_sku_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SKU-0001 | checksum | xsd:string |
| SKU-0002 | created_date | xsd:date |
| SKU-0003 | identifier | cco:DesignativeICE |
| SKU-0004 | license | xsd:string |
| SKU-0005 | mime_type | xsd:string |
| SKU-0006 | size_bytes | xsd:long |
| SKU-0007 | uri | xsd:string |
| SKU-0008 | version | xsd:integer |

**t_schemaorg_product_sku_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0002 | 2025-05-15 |
| SKU-0002 | SKU-0002 | SKU-0002 | 2023-06-09 |
| SKU-0003 | SKU-0003 | SKU-0002 | 2025-02-16 |
| SKU-0004 | SKU-0004 | SKU-0002 | 2024-10-26 |
| SKU-0005 | SKU-0005 | SKU-0002 | 2025-01-20 |
| SKU-0006 | SKU-0006 | SKU-0002 | 2023-04-12 |

**t_schemaorg_product_sku_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0006 | 222 |
| SKU-0002 | SKU-0001 | SKU-0008 | 9 |
| SKU-0003 | SKU-0002 | SKU-0006 | 488 |
| SKU-0004 | SKU-0002 | SKU-0008 | 10 |
| SKU-0005 | SKU-0003 | SKU-0006 | 413 |
| SKU-0006 | SKU-0003 | SKU-0008 | 5 |
| SKU-0007 | SKU-0004 | SKU-0006 | 223 |
| SKU-0008 | SKU-0004 | SKU-0008 | 4 |

**t_schemaorg_product_sku_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SKU-0001 | SKU-0001 | SKU-0001 | c0ffee42 |
| SKU-0002 | SKU-0001 | SKU-0003 | ARN:res/41 |
| SKU-0003 | SKU-0001 | SKU-0004 | Apache-2.0 |
| SKU-0004 | SKU-0001 | SKU-0009 | eu-west-3 |
| SKU-0005 | SKU-0001 | SKU-0005 | application/json |
| SKU-0006 | SKU-0001 | SKU-0010 | Name 06 |
| SKU-0007 | SKU-0001 | SKU-0011 | data-engineering |
| SKU-0008 | SKU-0001 | SKU-0012 | Tags 08 |

Attribute definitions reside in their own tables, decoupled from values to permit schema evolution without data migration. Each attribute is described by a name and a type, where the type is expressed in a schema-aware vocabulary such as xsd:decimal, xsd:string, xsd:dateTime, xsd:date, xsd:integer, or cco:DesignativeICE. The attribute recorded_at, typed as xsd:dateTime, captures temporal provenance; the attribute confidence, typed as xsd:decimal, quantifies measurement reliability; the attribute checksum, typed as xsd:string, stores a hexadecimal digest such as c0ffee42; and the attribute license, typed as xsd:string, carries the value Apache-2.0. This type discipline is not decorative—it dictates which value table receives the data and constrains the set of admissible operations.

Value storage is partitioned by type, a design choice that eliminates null columns and enforces type safety at the storage layer. Decimal values such as 0.231, 407.80, 947.91, 2405.99, and 5333.00 are stored in the decimal value table, where each row links an entity_id to an attr_id and carries the numeric value. Integer values—222, 9, 488, 10, 46, 468, 386, 493—occupy the integer value table under the same entity-to-attribute linkage pattern. String values, ranging from Dimension Kind 01 and Encoding 02 to calibration record and es, are stored in the varchar value table, while temporal values such as 2024-05-15T18:00:29, 2024-04-18T18:40:50, 2023-06-19T08:04:37, and 2024-12-12T18:49:55 are stored in the datetime value table. Date-only values like 2025-05-15, 2023-06-09, 2025-02-16, and 2024-10-26 are stored in the date value table. The foreign-key columns entity_id and attr_id in each value table form the bridge between the abstract attribute definition and its concrete instantiation on a specific entity.

The foreign-key topology is uniform across all three entity families. In the measurement family, the table t_measurement_basic provides the entity catalogue; t_measurement_basic_attr defines the attribute schema; and the three value tables—t_measurement_basic_val_datetime, t_measurement_basic_val_decimal, and t_measurement_basic_val_varchar—each carry entity_id as a foreign key referencing t_measurement_basic.id and attr_id as a foreign key referencing t_measurement_basic_attr.id. The product-SKU family follows the same pattern: t_schemaorg_product_sku anchors the entities, t_schemaorg_product_sku_attr defines attributes such as identifier, checksum, created_date, and license, and the value tables t_schemaorg_product_sku_val_date, t_schemaorg_product_sku_val_int, and t_schemaorg_product_sku_val_varchar resolve entity-attribute pairs to typed values. The observation-policy family mirrors this structure with t_observation_governed_by_policy, t_observation_governed_by_policy_attr, and the four value tables for datetime, decimal, integer, and varchar types. This tripartite architecture—entity catalogue, attribute schema, typed value store—ensures that adding a new attribute requires only a row in the attribute table and does not perturb any existing value rows.

**t_measurement_basic**

| id | measurement |
| --- | --- |
| MEAS-0001 | Air Quality Index |
| MEAS-0002 | Disk Throughput |
| MEAS-0003 | Water pH Level |
| MEAS-0004 | Air Quality Index |
| MEAS-0005 | Network Latency |
| MEAS-0006 | Air Quality Index |
| MEAS-0007 | Disk Throughput |

**t_measurement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | confidence | xsd:decimal |
| MEAS-0002 | dimension_kind | xsd:string |
| MEAS-0003 | method | xsd:string |
| MEAS-0004 | recorded_at | xsd:dateTime |
| MEAS-0005 | uncertainty | xsd:decimal |
| MEAS-0006 | unit | xsd:string |
| MEAS-0007 | value | xsd:decimal |
| MEAS-0008 | encoding | xsd:string |

**t_measurement_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0004 | 2024-05-15T18:00:29 |
| MEAS-0002 | MEAS-0002 | MEAS-0004 | 2024-04-18T18:40:50 |
| MEAS-0003 | MEAS-0003 | MEAS-0004 | 2023-06-19T08:04:37 |
| MEAS-0004 | MEAS-0004 | MEAS-0004 | 2024-12-12T18:49:55 |
| MEAS-0005 | MEAS-0005 | MEAS-0004 | 2024-07-10T05:51:16 |
| MEAS-0006 | MEAS-0006 | MEAS-0004 | 2023-05-22T02:44:37 |
| MEAS-0007 | MEAS-0007 | MEAS-0004 | 2023-01-22T19:04:55 |

**t_measurement_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | 0.231 |
| MEAS-0002 | MEAS-0001 | MEAS-0005 | 407.80 |
| MEAS-0003 | MEAS-0001 | MEAS-0007 | 947.91 |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | 0.117 |
| MEAS-0005 | MEAS-0002 | MEAS-0005 | 521.52 |
| MEAS-0006 | MEAS-0002 | MEAS-0007 | 399.99 |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | 0.530 |
| MEAS-0008 | MEAS-0003 | MEAS-0005 | 792.36 |

**t_measurement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0002 | Dimension Kind 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0008 | Encoding 02 |
| MEAS-0003 | MEAS-0001 | MEAS-0009 | calibration record |
| MEAS-0004 | MEAS-0001 | MEAS-0010 | es |
| MEAS-0005 | MEAS-0001 | MEAS-0003 | automated |
| MEAS-0006 | MEAS-0001 | MEAS-0006 | ms |
| MEAS-0007 | MEAS-0002 | MEAS-0002 | Dimension Kind 07 |
| MEAS-0008 | MEAS-0002 | MEAS-0008 | Encoding 08 |

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

**t_observation_governed_by_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | duration_seconds | xsd:decimal |
| POLI-0002 | end_time | xsd:dateTime |
| POLI-0003 | exit_code | xsd:integer |
| POLI-0004 | host_name | xsd:string |
| POLI-0005 | log_level | xsd:string |
| POLI-0006 | phase | xsd:string |
| POLI-0007 | retry_count | xsd:integer |
| POLI-0008 | scheduled_at | xsd:dateTime |

**t_observation_governed_by_policy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0002 | 2023-03-21T06:17:05 |
| POLI-0002 | POLI-0001 | POLI-0008 | 2024-08-23T18:14:17 |
| POLI-0003 | POLI-0001 | POLI-0009 | 2024-06-11T06:45:45 |
| POLI-0004 | POLI-0002 | POLI-0002 | 2023-08-16T19:41:47 |
| POLI-0005 | POLI-0002 | POLI-0008 | 2023-07-01T10:02:32 |
| POLI-0006 | POLI-0002 | POLI-0009 | 2023-11-28T22:50:00 |
| POLI-0007 | POLI-0003 | POLI-0002 | 2025-02-28T14:09:39 |
| POLI-0008 | POLI-0003 | POLI-0008 | 2024-08-01T00:25:22 |

**t_observation_governed_by_policy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2405.99 |
| POLI-0002 | POLI-0002 | POLI-0001 | 5333.00 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2745.86 |
| POLI-0004 | POLI-0004 | POLI-0001 | 5236.87 |
| POLI-0005 | POLI-0005 | POLI-0001 | 6390.38 |
| POLI-0006 | POLI-0006 | POLI-0001 | 4927.03 |

**t_observation_governed_by_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | 46 |
| POLI-0002 | POLI-0001 | POLI-0007 | 468 |
| POLI-0003 | POLI-0002 | POLI-0003 | 386 |
| POLI-0004 | POLI-0002 | POLI-0007 | 493 |
| POLI-0005 | POLI-0003 | POLI-0003 | 146 |
| POLI-0006 | POLI-0003 | POLI-0007 | 163 |
| POLI-0007 | POLI-0004 | POLI-0003 | 133 |
| POLI-0008 | POLI-0004 | POLI-0007 | 341 |

**t_observation_governed_by_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | gw-12 |
| POLI-0002 | POLI-0001 | POLI-0005 | Log Level 02 |
| POLI-0003 | POLI-0001 | POLI-0006 | execution |
| POLI-0004 | POLI-0001 | POLI-0010 | complete |
| POLI-0005 | POLI-0001 | POLI-0011 | Triggered By 05 |
| POLI-0006 | POLI-0002 | POLI-0004 | worker-07 |
| POLI-0007 | POLI-0002 | POLI-0005 | Log Level 07 |
| POLI-0008 | POLI-0002 | POLI-0006 | execution |

The practical consequence of this design is that queries must traverse from entity to attribute to value, a three-hop join that is predictable and indexable. To retrieve the recorded_at timestamp for the measurement MEAS-0001, one joins t_measurement_basic to t_measurement_basic_val_datetime on entity_id, then filters on the attr_id that corresponds to the attribute named recorded_at in t_measurement_basic_attr. The result is 2024-05-15T18:00:29. To retrieve the confidence decimal for the same entity, one joins through t_measurement_basic_val_decimal, filtering on the attr_id for confidence, yielding 0.231. The same traversal applies to products and observations: the created_date for SKU-0001 is 2025-05-15, the duration_seconds for POLI-0001 is 2405.99, and the host_name for POLI-0001 is gw-12. The uniformity of the join pattern across entity families means that a single query template, parameterized by entity prefix, can be reused without modification.

This architecture also supports heterogeneous attribute sets per entity family without schema drift. The measurement family carries attributes like dimension_kind and method, the product family carries checksum and license, and the observation family carries duration_seconds, end_time, exit_code, and host_name. No attribute is shared across families, and no family is forced to store nulls for attributes it does not use. The type system—expressed through xsd and cco namespaces—provides a machine-readable contract between the attribute definition and the value table, enabling validation at ingestion time and type coercion at query time. In operational terms, this means that a value of 2024-08-23T18:14:17 stored against the attr_id for end_time is guaranteed to be a valid dateTime, and a value of 5333.00 stored against the attr_id for duration_seconds is guaranteed to be a valid decimal, because the type declared in the attribute table is enforced by the partitioned value store.