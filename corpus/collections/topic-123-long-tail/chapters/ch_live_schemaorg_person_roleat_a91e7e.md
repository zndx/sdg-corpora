---
chapter_id: ch_live_schemaorg_person_roleat_a91e7e
topic_id: 123
family: 07_long_tail
cited_terms: ['schemaorg_person_roleat', 'histogram_metric_subclass', 'observation_governed_by_policy']
model: engine-refine
---

Attributes and their typed values constitute the foundational mechanism by which entities acquire descriptive properties in a governed data architecture. An attribute—identified by a unique key such as ROLE-0001 or POLI-0001—serves as a named property definition, while its associated type constrains the domain of permissible values. The attribute registry distinguishes between structural types like xsd:string for checksums and host identifiers, xsd:date for temporal metadata, xsd:dateTime for precise event timestamps, xsd:decimal for measured durations, and xsd:integer for discrete codes such as exit status. A custom type, cco:DesignativeICE, appears alongside standard XML Schema types to support domain-specific designations. This separation of attribute definition from value storage enables schema evolution without restructuring: the attribute catalog records that POLI-0001 represents duration_seconds as xsd:decimal, POLI-0002 captures end_time as xsd:dateTime, and POLI-0004 encodes host_name as xsd:string, while the value tables hold the actual data independently.

Entities anchor these attributes to real-world or logical objects, and the relationship between an entity and its attributes is mediated through a composite key linking entity_id to attr_id. In the schemaorg person-role-at domain, entity ROLE-0001 carries a checksum value of c0ffee42, a license designation of CC-BY-4.0, and a created_date of 2025-01-23, each stored in its respective typed value table—varchar for the checksum and license, date for the timestamp. The same entity also holds integer measurements: 325 against attribute ROLE-0006 and 7 against ROLE-0008, demonstrating that a single entity may accumulate heterogeneous attribute values across multiple storage tables. Similarly, governed observations such as POLI-0001—which corresponds to the north vent temperature spike incident—carry a duration of 2405.99 seconds, an exit code of 46, a host identifier of gw-12, and an end_time of 2023-03-21T06:17:05, with each value residing in its type-appropriate table. This multi-table value storage pattern ensures type safety at query time while preserving the flexibility to add new attributes without altering the entity's structural definition.

**t_schemaorg_person_roleat**

| id | schemaorg | role_at |
| --- | --- | --- |
| ROLE-0001 | SANS Institute | POLI-0002 |
| ROLE-0002 | WHO Cyber Health | POLI-0004 |
| ROLE-0003 | NASA Ames Research | POLI-0003 |
| ROLE-0004 | DARPA InfoTech | POLI-0004 |
| ROLE-0005 | Red Hat OpenShift | POLI-0002 |
| ROLE-0006 | IEEE Standards | POLI-0005 |
| ROLE-0007 | DARPA InfoTech | POLI-0001 |

**t_schemaorg_person_roleat_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ROLE-0001 | checksum | xsd:string |
| ROLE-0002 | created_date | xsd:date |
| ROLE-0003 | identifier | cco:DesignativeICE |
| ROLE-0004 | license | xsd:string |
| ROLE-0005 | mime_type | xsd:string |
| ROLE-0006 | size_bytes | xsd:long |
| ROLE-0007 | uri | xsd:string |
| ROLE-0008 | version | xsd:integer |

**t_schemaorg_person_roleat_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0002 | 2025-01-23 |
| ROLE-0002 | ROLE-0002 | ROLE-0002 | 2024-08-11 |
| ROLE-0003 | ROLE-0003 | ROLE-0002 | 2023-01-21 |
| ROLE-0004 | ROLE-0004 | ROLE-0002 | 2023-10-22 |
| ROLE-0005 | ROLE-0005 | ROLE-0002 | 2023-09-13 |
| ROLE-0006 | ROLE-0006 | ROLE-0002 | 2023-05-29 |
| ROLE-0007 | ROLE-0007 | ROLE-0002 | 2024-03-07 |

**t_schemaorg_person_roleat_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0006 | 325 |
| ROLE-0002 | ROLE-0001 | ROLE-0008 | 7 |
| ROLE-0003 | ROLE-0002 | ROLE-0006 | 319 |
| ROLE-0004 | ROLE-0002 | ROLE-0008 | 10 |
| ROLE-0005 | ROLE-0003 | ROLE-0006 | 407 |
| ROLE-0006 | ROLE-0003 | ROLE-0008 | 6 |
| ROLE-0007 | ROLE-0004 | ROLE-0006 | 258 |
| ROLE-0008 | ROLE-0004 | ROLE-0008 | 6 |

**t_schemaorg_person_roleat_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0001 | c0ffee42 |
| ROLE-0002 | ROLE-0001 | ROLE-0003 | urn:uuid:9f2a |
| ROLE-0003 | ROLE-0001 | ROLE-0004 | CC-BY-4.0 |
| ROLE-0004 | ROLE-0001 | ROLE-0009 | zone-b |
| ROLE-0005 | ROLE-0001 | ROLE-0005 | text/plain |
| ROLE-0006 | ROLE-0001 | ROLE-0010 | Name 06 |
| ROLE-0007 | ROLE-0001 | ROLE-0011 | platform-team |
| ROLE-0008 | ROLE-0001 | ROLE-0012 | Tags 08 |

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

The identifier space operates at multiple levels of granularity. Primary keys such as ROLE-0001, METR-0001, and POLI-0001 uniquely address rows within their respective tables, while foreign keys establish cross-table relationships: the role_at column in the person-role-at table references POLI-0002, POLI-0003, and POLI-0004, which in turn identify observations governed by policy. The observation table itself maps POLI-0001 to a north vent temperature spike, POLI-0002 to ingestion pipeline backpressure, POLI-0003 to core switch packet loss, and POLI-0004 to edge gateway heartbeat timeout, creating a chain from abstract role assignments through concrete operational events. Within attribute value tables, the composite of entity_id and attr_id forms the effective foreign key that binds a specific value to a specific property of a specific entity, ensuring referential integrity across the distributed value stores.

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

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

Metric classification introduces a parallel dimensional structure where metric_kind serves as the categorical axis for measured quantities. The dimension table dim_metric_kind assigns each metric kind a label and a category—Metric Kind Label 01 through 04 mapped to Metric Kind Category 01 through 04 respectively—while the fact table fact_histogram records actual measurements indexed by metric_kind_key, size_bytes, and version. A single metric kind, METR-0005, appears across three distinct histogram entries with size_bytes values of 239999637, 652318299, and 823666310, each associated with different versions (3, 9, and 5), illustrating how versioning tracks the evolution of metric definitions over time. The size_bytes column captures the magnitude of measured data objects in raw byte units, ranging from approximately 194 megabytes to 824 megabytes across the observed entries, providing a quantitative basis for capacity planning and performance analysis.

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

The interplay between attribute typing, entity modeling, and metric classification reflects a deliberate architectural choice to separate definition from instance, type from value, and category from measurement. This separation permits the schemaorg person-role-at domain to associate organizations such as SANS Institute, WHO Cyber Health, NASA Ames Research, and DARPA InfoTech with policy-governed roles without embedding organizational metadata directly into the role records. It allows governed observations to carry heterogeneous attribute values—textual hostnames, integer exit codes, decimal durations, and ISO 8601 timestamps—without requiring a monolithic attribute table. And it enables metric facts to be classified by kind and version while recording raw size measurements, supporting both categorical aggregation and quantitative analysis. The result is a data model that scales horizontally across domains while maintaining strict type discipline at the value level.