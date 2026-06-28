---
chapter_id: ch_live_metric_emission_subclass_9485c1
topic_id: 7
family: 07_long_tail
cited_terms: ['metric_emission_subclass', 'program_with_entry_exactly_one', 'subclass_to_designative_ice']
model: engine-refine
---

The foundational mechanism for describing observable properties in a telemetry system rests on a clear separation between attribute definitions and their runtime values. An attribute definition—identified by a unique key such as EMIS-0001—specifies both a human-readable name and a strict type constraint. The attribute catalog includes duration_seconds typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string, each anchored to its own identifier within the attribute registry. This type discipline ensures that downstream consumers of metric emission data can interpret values without ambiguity, and it enforces schema-level correctness at ingestion time rather than deferring validation to query time.

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

Values are materialized in type-specific tables that reference both the entity producing the observation and the attribute being recorded. A decimal measurement such as 1381.85 or 954.50 is stored alongside its entity_id and attr_id, linking the numeric observation back to the attribute definition duration_seconds (EMIS-0001) and the emitting component. Similarly, temporal observations like 2023-10-31T14:37:44 and 2024-08-14T22:51:22 reside in the datetime value table, while integer exit codes—204, 449, 526, 447—occupy their own partition. String-valued attributes capture host identifiers such as node-a01, log levels like Log Level 02, execution states including execution and complete, and encoding designations such as Encoding 01 and Encoding 04. The entity_id column serves as the foreign key binding each value to its source, while attr_id resolves to the corresponding definition in the attribute catalog.

The emission source itself is cataloged in a subclass table that maps each metric to its producer. The metric garbage_collection_pause is emitted by prometheus_agent, api_throughput by istio_sidecar, memory_utilization by nginx_worker, and bytes_transferred by postgres_main. Each of these emission records carries its own identifier—EMIS-0001 through EMIS-0004—and serves as the entity_id in the value tables, creating a direct lineage from raw observation through attribute definition to the component that generated it. This structure supports fine-grained attribution: any measured value can be traced back to both the metric it belongs to and the specific process or sidecar responsible for its emission.

**t_metric_emission_subclass**

| id | metric | emits_metric |
| --- | --- | --- |
| EMIS-0001 | garbage_collection_pause | prometheus_agent |
| EMIS-0002 | api_throughput | istio_sidecar |
| EMIS-0003 | memory_utilization | nginx_worker |
| EMIS-0004 | bytes_transferred | postgres_main |
| EMIS-0005 | active_connections | etl_pipeline |
| EMIS-0006 | memory_utilization | etl_pipeline |
| EMIS-0007 | disk_io_wait | etl_pipeline |

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

Beyond telemetry, the same attr–entity–identifier pattern extends to designative identifiers used for resource labeling. The designative ICE subclass associates names such as CryoStream-Link, CryoVault-Label, AeroFrost-ID, and IceSheet-Ref with attribute definitions for encoding, label_text, and language, all typed as xsd:string. Value records like change rationale and es (Spanish) are linked to these designatives through the same entity_id and attr_id foreign-key mechanism, demonstrating that the schema supports both numeric telemetry and textual metadata under a unified modeling approach.

**t_subclass_to_designative_ice**

| id | designative |
| --- | --- |
| ICE-0001 | CryoStream-Link |
| ICE-0002 | CryoVault-Label |
| ICE-0003 | AeroFrost-ID |
| ICE-0004 | IceSheet-Ref |
| ICE-0005 | CryoStream-Link |
| ICE-0006 | IceSheet-Ref |

**t_subclass_to_designative_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | encoding | xsd:string |
| ICE-0002 | label_text | xsd:string |
| ICE-0003 | language | xsd:string |

**t_subclass_to_designative_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | Encoding 01 |
| ICE-0002 | ICE-0001 | ICE-0002 | change rationale |
| ICE-0003 | ICE-0001 | ICE-0003 | es |
| ICE-0004 | ICE-0002 | ICE-0001 | Encoding 04 |
| ICE-0005 | ICE-0002 | ICE-0002 | nightly summary |
| ICE-0006 | ICE-0002 | ICE-0003 | fr |
| ICE-0007 | ICE-0003 | ICE-0001 | Encoding 07 |
| ICE-0008 | ICE-0003 | ICE-0002 | change rationale |

Programmatic resources introduce a version dimension that anchors each deployment to a reproducible state. The program registry records entries such as inventory_sync with entry point api_gateway under identifier ARN:res/41 at version 12, and nightly_etl with entry point api_gateway under the same identifier at version 8. The health_check program, triggered via cron_trigger and identified as ref-8842, carries version 11. Version numbers provide an immutable reference for rollback, audit, and compliance tracking, ensuring that every observed metric or designative label can be correlated to a specific program release. Together, the attr, attr_type, entity, identifier, misc, and version columns form a coherent governance framework where definitions, values, sources, and versions are all cross-referenced through explicit foreign keys.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | api_gateway | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | main.py | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | api_gateway | ARN:res/41 | 8 |
| ONE-0004 | health_check | cron_trigger | ref-8842 | 11 |
| ONE-0005 | health_check | api_gateway | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | command_line | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | start_service | urn:uuid:9f2a | 1 |