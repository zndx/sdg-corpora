---
chapter_id: ch_live_opentelemetry_span_subclass_afcf75
topic_id: 86
family: 07_long_tail
cited_terms: ['opentelemetry_span_subclass', 'outlier_detection_basic', 'profiling_basic']
model: engine-refine
---

In distributed tracing architectures, the identification and characterization of execution spans constitute the foundational layer of observability. Each span carries a unique identifier—values such as SPAN-0001 through SPAN-0004 serve as the primary keys that anchor all subsequent metadata. The span subclass table records the operational nature of these traces, distinguishing between scheduled background workloads like worker.cron.schedule and interactive service invocations such as user-service.login. Associated span context values, including span-link-3a4b5c and propagation-token-x7k2, establish the causal lineage and propagation state of each trace segment, enabling reconstruction of request flows across service boundaries.

**t_opentelemetry_span_subclass**

| id | opentelemetry | span_context |
| --- | --- | --- |
| SPAN-0001 | worker.cron.schedule | span-link-3a4b5c |
| SPAN-0002 | worker.cron.schedule | context-hash-9f8e7d |
| SPAN-0003 | worker.cron.schedule | propagation-token-x7k2 |
| SPAN-0004 | user-service.login | context-hash-9f8e7d |
| SPAN-0005 | http.server.request | trace-root-alpha |
| SPAN-0006 | payment-gateway.process | correlation-id-9a8b7c |

Attribute definitions and their typed values form the second structural tier, separating schema from data. The attribute registry enumerates measurable properties—duration_seconds, end_time, exit_code, and host_name—each bound to a precise data type: xsd:decimal for numeric durations, xsd:dateTime for temporal markers, xsd:integer for exit codes, and xsd:string for host identifiers. This type discipline ensures that value storage tables remain homogeneous. Decimal values such as 2414.42, 5931.72, 930.67, and 6374.61 populate the decimal value table, while integer attributes capture exit codes and retry counts—345 and 35 in one span instance, 179 and 164 in another. Temporal attributes store timestamps like 2025-05-18T08:27:19 and 2024-03-17T19:20:30, and string-valued attributes record host names such as edge-03 alongside operational states including closeout and running. The entity column in each value table provides the foreign-key linkage back to the originating span, ensuring that every typed measurement can be traced to its source execution context.

**t_opentelemetry_span_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPAN-0001 | duration_seconds | xsd:decimal |
| SPAN-0002 | end_time | xsd:dateTime |
| SPAN-0003 | exit_code | xsd:integer |
| SPAN-0004 | host_name | xsd:string |
| SPAN-0005 | log_level | xsd:string |
| SPAN-0006 | phase | xsd:string |
| SPAN-0007 | retry_count | xsd:integer |
| SPAN-0008 | scheduled_at | xsd:dateTime |

**t_opentelemetry_span_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0002 | 2025-05-18T08:27:19 |
| SPAN-0002 | SPAN-0001 | SPAN-0008 | 2024-03-17T19:20:30 |
| SPAN-0003 | SPAN-0001 | SPAN-0009 | 2025-03-13T03:16:10 |
| SPAN-0004 | SPAN-0002 | SPAN-0002 | 2023-06-13T01:08:11 |
| SPAN-0005 | SPAN-0002 | SPAN-0008 | 2023-09-29T11:45:54 |
| SPAN-0006 | SPAN-0002 | SPAN-0009 | 2024-06-14T17:52:28 |
| SPAN-0007 | SPAN-0003 | SPAN-0002 | 2024-09-28T19:19:51 |
| SPAN-0008 | SPAN-0003 | SPAN-0008 | 2024-09-01T02:28:08 |

**t_opentelemetry_span_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0001 | 2414.42 |
| SPAN-0002 | SPAN-0002 | SPAN-0001 | 5931.72 |
| SPAN-0003 | SPAN-0003 | SPAN-0001 | 930.67 |
| SPAN-0004 | SPAN-0004 | SPAN-0001 | 6374.61 |
| SPAN-0005 | SPAN-0005 | SPAN-0001 | 857.91 |
| SPAN-0006 | SPAN-0006 | SPAN-0001 | 5761.32 |

**t_opentelemetry_span_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0003 | 345 |
| SPAN-0002 | SPAN-0001 | SPAN-0007 | 35 |
| SPAN-0003 | SPAN-0002 | SPAN-0003 | 179 |
| SPAN-0004 | SPAN-0002 | SPAN-0007 | 164 |
| SPAN-0005 | SPAN-0003 | SPAN-0003 | 571 |
| SPAN-0006 | SPAN-0003 | SPAN-0007 | 189 |
| SPAN-0007 | SPAN-0004 | SPAN-0003 | 122 |
| SPAN-0008 | SPAN-0004 | SPAN-0007 | 93 |

**t_opentelemetry_span_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0001 | SPAN-0004 | edge-03 |
| SPAN-0002 | SPAN-0001 | SPAN-0005 | Log Level 02 |
| SPAN-0003 | SPAN-0001 | SPAN-0006 | closeout |
| SPAN-0004 | SPAN-0001 | SPAN-0010 | running |
| SPAN-0005 | SPAN-0001 | SPAN-0011 | Triggered By 05 |
| SPAN-0006 | SPAN-0002 | SPAN-0004 | ingest-21 |
| SPAN-0007 | SPAN-0002 | SPAN-0005 | Log Level 07 |
| SPAN-0008 | SPAN-0002 | SPAN-0006 | review |

Outlier detection and performance profiling introduce analytical dimensions that operate at a higher level of abstraction. The outlier fact table records anomalous execution events identified by keys such as DETE-0001 through DETE-0004, each associated with a duration_seconds measurement ranging from 1182.39 to 6466.78 seconds, exit codes spanning 4 to 760, and retry counts between 101 and 308. These metrics quantify the severity and persistence of deviations from expected behavior. The corresponding outlier dimension table assigns categorical labels—Outlier Label 01 through Outlier Label 04—and groups them into categories such as Outlier Category 01 through Outlier Category 04, enabling aggregation and trend analysis across outlier types.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DETE-0001 | DETE-0003 | 3360.34 | 760 | 293 |
| DETE-0002 | DETE-0001 | 6466.78 | 4 | 225 |
| DETE-0003 | DETE-0002 | 5282.09 | 490 | 101 |
| DETE-0004 | DETE-0003 | 1182.39 | 124 | 308 |
| DETE-0005 | DETE-0002 | 3041.72 | 808 | 59 |
| DETE-0006 | DETE-0005 | 3852.38 | 619 | 489 |
| DETE-0007 | DETE-0003 | 1453.07 | 682 | 1 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |

Profiling data follows an analogous structure but focuses on systematic performance measurement rather than anomaly detection. The profiling fact table records events keyed by identifiers like PROF-0001 through PROF-0004, with durations ranging from 1113.38 to 6716.87 seconds, exit codes from 348 to 827, and retry counts from 186 to 303. The profiling dimension table provides human-readable labels—Profiling Label 01 through Profiling Label 04—and associates each with a profiling category such as Profiling Category 01 through Profiling Category 04, further linked through a category_id foreign key to a dedicated category dimension table containing entries like Category Name 01 through Category Name 04. This hierarchical categorization supports drill-down analysis, allowing operators to isolate which profiling categories exhibit the most severe exit codes or the highest retry frequencies, and to correlate duration anomalies with specific operational contexts.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |