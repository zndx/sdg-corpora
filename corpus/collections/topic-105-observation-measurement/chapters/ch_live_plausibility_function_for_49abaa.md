---
chapter_id: ch_live_plausibility_function_for_49abaa
topic_id: 105
family: 07_long_tail
cited_terms: ['plausibility_function_for', 'constraint_with_severity_classification', 'dataset_under_audit']
model: engine-refine
---

Attributes, their typed values, and the entities that bear them constitute the fundamental unit of auditable data within the governance framework. Each attribute—whether designated as `confidence`, `dimension_kind`, `method`, or `recorded_at`—is declared with an explicit type such as `xsd:decimal`, `xsd:string`, `xsd:dateTime`, or `xsd:integer`, establishing a schema-level contract that governs how values are stored, validated, and interpreted across audit domains. The `t_plausibility_function_for_attr` table codifies these declarations for plausibility functions, while `t_dataset_under_audit_attr` performs the same role for datasets under audit, including attributes like `duration_seconds`, `end_time`, `exit_code`, and `host_name`. This dual-layer typing ensures that a decimal value such as `0.286` or `84.30` is never conflated with a string like `Dimension Kind 01` or a timestamp such as `2023-05-06T07:18:55`, and that integer exit codes like `966` or `22` are preserved with their full precision.

Entities serve as the primary carriers of attribute-value pairs, each identified by a unique key—`FUNC-0001`, `AUDI-0001`, and their counterparts—that anchors the data to a specific plausibility function or audited dataset. The value tables are partitioned by type to enforce this discipline: `t_plausibility_function_for_val_decimal` holds numeric measurements for entities like `FUNC-0001` and `FUNC-0002`, with values ranging from `0.033` to `878.30`; `t_plausibility_function_for_val_varchar` stores categorical and textual data such as `Encoding 02`, `pre-release note`, and the language tag `en`; `t_plausibility_function_for_val_datetime` records temporal observations including `2024-05-13T15:52:44` and `2025-06-06T01:40:51`; and the corresponding audit value tables (`t_dataset_under_audit_val_decimal`, `t_dataset_under_audit_val_int`, `t_dataset_under_audit_val_varchar`, `t_dataset_under_audit_val_datetime`) mirror this structure for datasets like `genomic_variant_calls`, `supply_chain_logs`, and `user_session_metrics`. The `entity_id` column in each value table explicitly links a measured or observed value back to its parent entity, ensuring traceability from raw data point through to audit conclusion.

**t_plausibility_function_for_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | Dimension Kind 01 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | Encoding 02 |
| FUNC-0003 | FUNC-0001 | FUNC-0009 | pre-release note |
| FUNC-0004 | FUNC-0001 | FUNC-0010 | en |
| FUNC-0005 | FUNC-0001 | FUNC-0003 | manual |
| FUNC-0006 | FUNC-0001 | FUNC-0006 | kg |
| FUNC-0007 | FUNC-0002 | FUNC-0002 | Dimension Kind 07 |
| FUNC-0008 | FUNC-0002 | FUNC-0008 | Encoding 08 |

**t_dataset_under_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | execution |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | running |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | gw-12 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | review |

Constraints governing these data elements are classified by severity and priority, with each constraint assigned a language tag that determines its applicable regulatory or operational context. The `t_constraint_with_severity_classification` table maps constraints such as `Access control policy`, `PII encryption mandate`, `Sensor calibration interval`, and `Log retention period` to severity levels identified by function keys like `FUNC-0004` and `FUNC-0003`, and to priority integers of `3` or `5`. The language column—populated with `es`, `en`, and `fr`—indicates the jurisdictional or linguistic scope of each constraint, enabling multilingual compliance frameworks to be expressed within a single unified model. Plausibility functions, identified by keys such as `CLAS-0001` through `CLAS-0006`, are linked to these constraints and to specific plausibility indicators including `firmware_version_mismatch`, `disputed_rating`, `weak_indication`, and `model_convergence_failure`, forming a chain of evidence from observed anomaly to classified regulatory impact.

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Access control policy | FUNC-0004 | 3 | es |
| CLAS-0002 | PII encryption mandate | FUNC-0003 | 5 | en |
| CLAS-0003 | Sensor calibration interval | FUNC-0006 | 3 | es |
| CLAS-0004 | Log retention period | FUNC-0003 | 3 | fr |
| CLAS-0005 | Lab containment level | FUNC-0001 | 3 | ja |
| CLAS-0006 | Lab containment level | FUNC-0005 | 2 | fr |

The practical effect of this architecture is that every auditable datum—whether a decimal duration of `1678.44` seconds, a host identifier of `node-a01`, an exit code of `222`, or a recorded timestamp of `2025-02-12T00:42:30`—is embedded within a structured provenance graph. The graph connects the value to its attribute, the attribute to its declared type, the entity to its dataset or plausibility function, and the function to its severity classification and priority ranking. This graph is not merely descriptive; it is the mechanism by which compliance officers can query, for instance, all decimal-valued attributes across datasets under audit that exceed a threshold, or all datetime-valued attributes recorded within a specific window, and then trace those results back to the constraints they potentially violate. The separation of value types into dedicated tables, while seemingly redundant, eliminates the risk of type coercion errors and ensures that a value like `84.30` is always treated as a numeric measurement rather than a string, a distinction that is critical when priority `5` constraints such as `PII encryption mandate` are evaluated against the underlying data.

**t_plausibility_function_for**

| id | plausibility | plausibility_for_claim |
| --- | --- | --- |
| FUNC-0001 | firmware_version_mismatch | CLAS-0006 |
| FUNC-0002 | disputed_rating | CLAS-0003 |
| FUNC-0003 | weak_indication | CLAS-0001 |
| FUNC-0004 | model_convergence_failure | CLAS-0006 |
| FUNC-0005 | network_latency_spike | CLAS-0004 |
| FUNC-0006 | authentication_token_expired | CLAS-0003 |
| FUNC-0007 | packet_loss_rate_high | CLAS-0002 |

**t_plausibility_function_for_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | confidence | xsd:decimal |
| FUNC-0002 | dimension_kind | xsd:string |
| FUNC-0003 | method | xsd:string |
| FUNC-0004 | recorded_at | xsd:dateTime |
| FUNC-0005 | uncertainty | xsd:decimal |
| FUNC-0006 | unit | xsd:string |
| FUNC-0007 | value | xsd:decimal |
| FUNC-0008 | encoding | xsd:string |

**t_plausibility_function_for_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0004 | 2023-05-06T07:18:55 |
| FUNC-0002 | FUNC-0002 | FUNC-0004 | 2023-03-14T16:18:20 |
| FUNC-0003 | FUNC-0003 | FUNC-0004 | 2024-05-13T15:52:44 |
| FUNC-0004 | FUNC-0004 | FUNC-0004 | 2025-06-06T01:40:51 |
| FUNC-0005 | FUNC-0005 | FUNC-0004 | 2023-05-21T17:57:56 |
| FUNC-0006 | FUNC-0006 | FUNC-0004 | 2024-10-18T22:54:00 |
| FUNC-0007 | FUNC-0007 | FUNC-0004 | 2023-11-29T06:24:08 |

**t_plausibility_function_for_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | 0.286 |
| FUNC-0002 | FUNC-0001 | FUNC-0005 | 84.30 |
| FUNC-0003 | FUNC-0001 | FUNC-0007 | 878.30 |
| FUNC-0004 | FUNC-0002 | FUNC-0001 | 0.033 |
| FUNC-0005 | FUNC-0002 | FUNC-0005 | 492.02 |
| FUNC-0006 | FUNC-0002 | FUNC-0007 | 356.58 |
| FUNC-0007 | FUNC-0003 | FUNC-0001 | 0.482 |
| FUNC-0008 | FUNC-0003 | FUNC-0005 | 926.97 |

**t_dataset_under_audit**

| id | dataset |
| --- | --- |
| AUDI-0001 | genomic_variant_calls |
| AUDI-0002 | supply_chain_logs |
| AUDI-0003 | user_session_metrics |
| AUDI-0004 | genomic_variant_calls |
| AUDI-0005 | iot_sensor_readings |
| AUDI-0006 | satellite_imagery_band4 |

**t_dataset_under_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_dataset_under_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2025-02-12T00:42:30 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-05T07:28:41 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2024-05-20T18:48:03 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2023-01-27T02:28:31 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2023-01-08T19:31:43 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2023-02-20T22:50:34 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2024-12-18T21:18:14 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2024-04-14T04:31:20 |

**t_dataset_under_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 1678.44 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 5254.25 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 582.65 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 741.84 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 6993.92 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 111.23 |

**t_dataset_under_audit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 966 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 22 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 222 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 333 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 372 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 83 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 123 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 109 |