---
chapter_id: ch_live_schemaorg_event_location_deb330
topic_id: 20
family: 07_long_tail
cited_terms: ['schemaorg_event_location', 'metric_emission_subclass', 'metric_with_unit']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers constitute the structural vocabulary of any system that must represent heterogeneous data with disciplined semantics. An entity is a distinct, addressable thing—whether a physical location such as the Basement Server Room or the Network Zone Secure, a measurable phenomenon like data ingestion rate or packet loss, or a quantified relationship such as latency measured against cpu_usage_percent. Each entity receives a stable identifier, a scoped key that serves as the anchor for all subsequent property assignments and cross-references. The identifier LOCA-0001, for instance, uniquely names an entity whose schemaorg classification is audit-log-archive and whose event_location is AWS us-east-1; similarly, EMIS-0001 identifies a metric emission subclass whose metric is data ingestion rate and whose emitting component is prometheus_agent. These identifiers are not arbitrary—they follow a predictable prefix convention (LOCA, EMIS, UNIT) that signals the entity's domain at a glance, enabling operators to distinguish location records from emission metrics and unit-bounded measurements without consulting a lookup table.

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | AWS us-east-1 |
| LOCA-0002 | data-lake-ingestion-job | Basement Server Room |
| LOCA-0003 | provenance-trace-record | Room 4B Server Hall |
| LOCA-0004 | provenance-trace-record | Network Zone Secure |
| LOCA-0005 | field-observation-dataset | Network Zone Secure |
| LOCA-0006 | governance-policy-update | Basement Server Room |
| LOCA-0007 | lab-sample-tracker | AWS us-east-1 |
| LOCA-0008 | field-observation-dataset | Facility 7 Calibration Lab |

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |

**t_metric_emission_subclass**

| id | metric | emits_metric |
| --- | --- | --- |
| EMIS-0001 | data ingestion rate | prometheus_agent |
| EMIS-0002 | data ingestion rate | istio_sidecar |
| EMIS-0003 | decibels | nginx_worker |
| EMIS-0004 | packet loss | postgres_main |
| EMIS-0005 | CPU utilization | etl_pipeline |
| EMIS-0006 | decibels | etl_pipeline |
| EMIS-0007 | liters per minute | etl_pipeline |

**t_metric_emission_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EMIS-0001 | duration_seconds | xsd:decimal |
| EMIS-0002 | end_time | xsd:dateTime |
| EMIS-0003 | exit_code | xsd:integer |
| EMIS-0004 | host_name | xsd:string |
| EMIS-0005 | log_level | xsd:string |
| EMIS-0006 | phase | xsd:string |
| EMIS-0007 | retry_count | xsd:integer |
| EMIS-0008 | scheduled_at | xsd:dateTime |

**t_metric_emission_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0002 | 2023-10-31T14:37:44 |
| EMIS-0002 | EMIS-0001 | EMIS-0008 | 2024-08-14T22:51:22 |
| EMIS-0003 | EMIS-0001 | EMIS-0009 | 2023-09-21T19:46:28 |
| EMIS-0004 | EMIS-0002 | EMIS-0002 | 2024-10-02T07:51:18 |
| EMIS-0005 | EMIS-0002 | EMIS-0008 | 2023-02-02T08:38:58 |
| EMIS-0006 | EMIS-0002 | EMIS-0009 | 2024-11-30T14:13:18 |
| EMIS-0007 | EMIS-0003 | EMIS-0002 | 2023-11-21T22:47:51 |
| EMIS-0008 | EMIS-0003 | EMIS-0008 | 2023-01-18T00:53:02 |

**t_metric_emission_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0001 | 1381.85 |
| EMIS-0002 | EMIS-0002 | EMIS-0001 | 954.50 |
| EMIS-0003 | EMIS-0003 | EMIS-0001 | 5476.70 |
| EMIS-0004 | EMIS-0004 | EMIS-0001 | 3136.71 |
| EMIS-0005 | EMIS-0005 | EMIS-0001 | 6003.14 |
| EMIS-0006 | EMIS-0006 | EMIS-0001 | 3720.68 |
| EMIS-0007 | EMIS-0007 | EMIS-0001 | 2471.19 |

**t_metric_emission_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0003 | 204 |
| EMIS-0002 | EMIS-0001 | EMIS-0007 | 449 |
| EMIS-0003 | EMIS-0002 | EMIS-0003 | 526 |
| EMIS-0004 | EMIS-0002 | EMIS-0007 | 447 |
| EMIS-0005 | EMIS-0003 | EMIS-0003 | 729 |
| EMIS-0006 | EMIS-0003 | EMIS-0007 | 20 |
| EMIS-0007 | EMIS-0004 | EMIS-0003 | 636 |
| EMIS-0008 | EMIS-0004 | EMIS-0007 | 481 |

**t_metric_with_unit**

| id | metric | metric_unit |
| --- | --- | --- |
| UNIT-0001 | latency | cpu_usage_percent |
| UNIT-0002 | temperature | memory footprint |
| UNIT-0003 | degrees Celsius | records per second |
| UNIT-0004 | bytes_transferred | data ingestion rate |
| UNIT-0005 | parts per million | garbage_collection_pause |
| UNIT-0006 | decibels | kilopascals |

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

An attribute is a named property that an entity may possess, and an attribute type constrains the shape of the value that attribute can hold. The attribute definition layer—separate from the value layer—declares what properties are admissible and in what form. Within the location domain, the attribute named checksum carries the type xsd:string, while created_date is typed as xsd:date and identifier as cco:DesignativeICE. In the emission subclass domain, duration_seconds is xsd:decimal, end_time is xsd:dateTime, exit_code is xsd:integer, and host_name is xsd:string. This separation of declaration from instantiation is deliberate: it allows the schema to evolve independently of the data, and it ensures that every value stored against an attribute conforms to a known type before it enters the system. The type system is not merely documentation; it is a guardrail. A value typed as xsd:date, such as 2024-05-14 or 2023-06-13, cannot be confused with a decimal like 1381.85 or a timestamp like 2023-10-31T14:37:44, even though all three represent temporal or quantitative information.

The value tables are where entities and attributes intersect in practice. Each value record carries three foreign keys: the entity to which the value belongs, the attribute against which it is measured, and the value itself, typed according to the attribute's declaration. The entity_id column in t_schemaorg_event_location_val_varchar, for example, points back to LOCA-0001, while the attr_id column references LOCA-0001 (the checksum attribute), and the value column holds c0ffee42. The same entity, LOCA-0001, also carries a created_date value of 2024-05-14 in the date-valued table and an integer value of 400 against attribute LOCA-0006 in the integer-valued table. This multi-table value architecture—splitting values by type into date, integer, decimal, varchar, and datetime tables—avoids the null-sparsity problem of a single wide table while preserving type safety. A decimal value of 954.50 against EMIS-0001's duration_seconds attribute is stored in t_metric_emission_subclass_val_decimal; a string value of node-a01 against the host_name attribute is stored in t_metric_emission_subclass_val_varchar. The attr_id foreign key in each value table resolves to the corresponding row in the attribute definition table, which in turn declares the attribute's name and type.

Identifiers also serve as the connective tissue between related tables. The attr_id in a value table is itself an identifier that references the primary key of the attribute definition table; the entity_id references the primary key of the entity table. This creates a clean three-hop path: from a value like 2024-02-21, one follows entity_id to UNIT-0002 (a metric with unit whose metric is temperature and whose metric_unit is memory footprint), then follows attr_id to UNIT-0002 in the attribute table (where attr_name is created_date and attr_type is xsd:date), and finally confirms the type constraint. The same pattern holds across all three domains. In the metric emission subclass domain, the value 204 against entity EMIS-0001 and attribute EMIS-0003 resolves to the attribute named exit_code of type xsd:integer. In the metric with unit domain, the value eu-west-3 against entity UNIT-0001 and attribute UNIT-0009 is a varchar that, while not directly declared in the attribute definition table's sample rows, follows the same referential discipline.

**t_metric_emission_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0004 | node-a01 |
| EMIS-0002 | EMIS-0001 | EMIS-0005 | Log Level 02 |
| EMIS-0003 | EMIS-0001 | EMIS-0006 | execution |
| EMIS-0004 | EMIS-0001 | EMIS-0010 | complete |
| EMIS-0005 | EMIS-0001 | EMIS-0011 | Triggered By 05 |
| EMIS-0006 | EMIS-0002 | EMIS-0004 | worker-07 |
| EMIS-0007 | EMIS-0002 | EMIS-0005 | Log Level 07 |
| EMIS-0008 | EMIS-0002 | EMIS-0006 | execution |

**t_metric_with_unit_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | 2023-09-28 |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | 2024-02-22 |
| UNIT-0003 | UNIT-0003 | UNIT-0002 | 2023-12-02 |
| UNIT-0004 | UNIT-0004 | UNIT-0002 | 2024-09-28 |
| UNIT-0005 | UNIT-0005 | UNIT-0002 | 2024-02-26 |
| UNIT-0006 | UNIT-0006 | UNIT-0002 | 2024-12-06 |

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

The practical significance of this architecture lies in its ability to represent heterogeneous, loosely structured metadata within a rigidly typed framework. An entity such as LOCA-0004, classified as a provenance-trace-record located in Network Zone Secure, carries a license attribute with value Apache-2.0 and a created_date of 2023-08-21. Another entity, UNIT-0003, classified as degrees Celsius with metric_unit records per second, carries a checksum of c0ffee42 and an identifier of oid:1.3.6.1. The same attribute name—checksum, created_date, identifier, license—appears in both the location and metric-with-unit domains, yet the values are typed and stored in domain-specific value tables, preventing cross-domain contamination. This design supports a governance model in which attribute definitions can be audited, versioned, and constrained independently of the data they describe, while the value tables provide a queryable, type-safe record of every property assignment. The result is a system where every datum is traceable to its entity, its attribute, and its type, and where the identifiers that bind them together form a coherent, navigable graph.