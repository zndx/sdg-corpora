---
chapter_id: ch_live_process_produces_ice_ad2270
topic_id: 36
family: 01_foundation
cited_terms: ['process_produces_ice', 'schemaorg_creativework_publisher', 'measurement_of_artifact']
model: engine-refine
---

Identifiers serve as the immutable anchors of any structured data model, providing stable references that persist across entity lifecycles and attribute mutations. Within the process domain, identifiers such as ICE-0001 through ICE-0004 designate distinct freezing operations—Plate freezing, Cryogenic freezing, Spray cooling, and Direct expansion freezing—each of which functions as an entity capable of accumulating descriptive metadata. Similarly, the publisher domain employs identifiers like PUBL-0001 and PUBL-0002 to associate creative works such as API Gateway Config and Cloud Migration Playbook with their respective publishers, while ARTI-0001 through ARTI-0004 anchor measurement artifacts including latency_p99_ms, yield_stress_test, and pressure_transducer. These identifiers are not merely labels; they constitute the primary keys that enable cross-referencing between entity definitions, attribute schemas, and the value instances that populate them.

**t_process_produces_ice**

| id | process |
| --- | --- |
| ICE-0001 | Plate freezing |
| ICE-0002 | Cryogenic freezing |
| ICE-0003 | Spray cooling |
| ICE-0004 | Direct expansion freezing |
| ICE-0005 | Directional solidification |
| ICE-0006 | Spiral freezing |

**t_process_produces_ice_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0003 | 140 |
| ICE-0002 | ICE-0001 | ICE-0007 | 235 |
| ICE-0003 | ICE-0002 | ICE-0003 | 217 |
| ICE-0004 | ICE-0002 | ICE-0007 | 99 |
| ICE-0005 | ICE-0003 | ICE-0003 | 880 |
| ICE-0006 | ICE-0003 | ICE-0007 | 326 |
| ICE-0007 | ICE-0004 | ICE-0003 | 176 |
| ICE-0008 | ICE-0004 | ICE-0007 | 291 |

**t_process_produces_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0004 | ingest-21 |
| ICE-0002 | ICE-0001 | ICE-0005 | Log Level 02 |
| ICE-0003 | ICE-0001 | ICE-0006 | initiation |
| ICE-0004 | ICE-0001 | ICE-0010 | running |
| ICE-0005 | ICE-0001 | ICE-0011 | Triggered By 05 |
| ICE-0006 | ICE-0002 | ICE-0004 | edge-03 |
| ICE-0007 | ICE-0002 | ICE-0005 | Log Level 07 |
| ICE-0008 | ICE-0002 | ICE-0006 | closeout |

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | API Gateway Config | ARTI-0006 |
| PUBL-0002 | API Gateway Config | ARTI-0004 |
| PUBL-0003 | Cloud Migration Playbook | ARTI-0003 |
| PUBL-0004 | Cloud Migration Playbook | ARTI-0001 |
| PUBL-0005 | Incident Postmortem | ARTI-0005 |
| PUBL-0006 | Telemetry Schema Draft | ARTI-0001 |
| PUBL-0007 | Firmware Release Notes | ARTI-0001 |
| PUBL-0008 | Cloud Migration Playbook | ARTI-0005 |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Attributes define the shape of observability within each entity, specifying both the semantic meaning and the data type of each measurable or descriptive property. In the process domain, attributes such as duration_seconds, end_time, exit_code, and host_name capture operational characteristics of freezing procedures, each declared with a precise type annotation—xsd:decimal for duration_seconds, xsd:dateTime for end_time, xsd:integer for exit_code, and xsd:string for host_name. The publisher domain mirrors this structure with attributes like checksum, created_date, identifier, and license, where types range from xsd:string and xsd:date to the domain-specific cco:DesignativeICE. Measurement artifacts carry their own attribute vocabulary—confidence, dimension_kind, method, and recorded_at—typed respectively as xsd:decimal, xsd:string, xsd:string, and xsd:dateTime. This type discipline ensures that every value stored against an attribute conforms to an expected schema, enabling consistent validation and query semantics across heterogeneous data sources.

**t_process_produces_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | duration_seconds | xsd:decimal |
| ICE-0002 | end_time | xsd:dateTime |
| ICE-0003 | exit_code | xsd:integer |
| ICE-0004 | host_name | xsd:string |
| ICE-0005 | log_level | xsd:string |
| ICE-0006 | phase | xsd:string |
| ICE-0007 | retry_count | xsd:integer |
| ICE-0008 | scheduled_at | xsd:dateTime |

**t_process_produces_ice_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0002 | 2024-12-21T05:38:52 |
| ICE-0002 | ICE-0001 | ICE-0008 | 2023-10-15T09:29:56 |
| ICE-0003 | ICE-0001 | ICE-0009 | 2023-08-06T18:23:28 |
| ICE-0004 | ICE-0002 | ICE-0002 | 2023-05-16T09:39:52 |
| ICE-0005 | ICE-0002 | ICE-0008 | 2023-09-23T10:34:19 |
| ICE-0006 | ICE-0002 | ICE-0009 | 2025-02-04T21:26:44 |
| ICE-0007 | ICE-0003 | ICE-0002 | 2023-02-04T12:13:18 |
| ICE-0008 | ICE-0003 | ICE-0008 | 2024-02-01T06:54:56 |

**t_process_produces_ice_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | 5646.64 |
| ICE-0002 | ICE-0002 | ICE-0001 | 6078.60 |
| ICE-0003 | ICE-0003 | ICE-0001 | 2298.30 |
| ICE-0004 | ICE-0004 | ICE-0001 | 3884.97 |
| ICE-0005 | ICE-0005 | ICE-0001 | 5116.46 |
| ICE-0006 | ICE-0006 | ICE-0001 | 5090.16 |

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |

**t_measurement_of_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

The value tables constitute the misc layer of the model, where actual data instances are materialized and linked to their parent entities through foreign-key relationships. Each value table is partitioned by type—datetime, decimal, integer, and varchar—so that the value column in t_process_produces_ice_val_decimal holds numeric observations such as 5646.64, 6078.60, 2298.30, and 3884.97, while t_process_produces_ice_val_datetime stores temporal markers like 2024-12-21T05:38:52 and 2023-10-15T09:29:56. The varchar tables accommodate free-form strings: ingest-21, Log Level 02, initiation, and running appear as process state descriptors, while 9d2b7a16, ARN:res/41, proprietary, and zone-b serve as publisher metadata values. Measurement artifacts similarly distribute their values across type-specific tables, with decimal values such as 0.670, 226.14, and 361.86 representing confidence scores and dimensional measurements, and varchar values like Dimension Kind 01, Encoding 02, intake form, and fr capturing methodological annotations.

The entity_id and attr_id columns in each value table form the join keys that bind a concrete value to a specific entity and attribute, creating a normalized structure that avoids null proliferation and type ambiguity. For instance, the decimal value 5646.64 is associated with entity ICE-0001 and attribute ICE-0001, while the datetime value 2024-12-21T05:38:52 links entity ICE-0001 to attribute ICE-0002. This same pattern recurs across domains: PUBL-0001 connects to PUBL-0002 for a created_date value of 2023-06-28, and ARTI-0001 references ARTI-0004 for a recorded_at timestamp of 2023-05-19T07:46:35. The integer tables follow identically, with values such as 140, 235, 217, and 99 in the process domain, and 72, 1, 54, and 3 in the publisher domain, each row establishing a precise triple of entity, attribute, and typed value.

This tripartite architecture—identifiers for stable entity references, attributes for schema definition, and value tables for typed data instances—provides a flexible yet rigorous foundation for metadata management. It accommodates heterogeneous data types without sacrificing type safety, supports extensibility through the addition of new attributes without schema migration, and enables precise querying across domains through consistent foreign-key relationships. The design ensures that every observation, whether a freezing duration of 5646.64 seconds, a publisher checksum of 9d2b7a16, or a measurement confidence of 0.670, is traceable to its originating entity and governed by its declared attribute type.