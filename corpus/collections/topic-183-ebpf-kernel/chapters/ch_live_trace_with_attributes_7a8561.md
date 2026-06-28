---
chapter_id: ch_live_trace_with_attributes_7a8561
topic_id: 183
family: 02_observation_measurement
cited_terms: ['trace_with_attributes', 'trace_with_root_span', 'trace_with_service_name']
model: engine-refine
---

Distributed tracing systems capture execution context through a layered attribute model that separates metadata definitions from their typed values. Each trace—identified by a unique key such as `ATTR-0001` and associated with a human-readable trace name like `batch-exec-094`, `session-gamma-9`, or `gateway-span-55`—serves as the primary entity to which attributes are affixed. Attribute definitions themselves are catalogued with a name and an XSD type, ensuring type safety across heterogeneous data. The attribute schema supports four core types: `xsd:decimal` for numeric measurements such as `duration_seconds`, `xsd:dateTime` for temporal markers like `end_time`, `xsd:integer` for discrete counts including `exit_code`, and `xsd:string` for free-form labels such as `host_name`. This type discipline is enforced through a value-normalization strategy that routes attribute values into dedicated storage tables—`t_trace_with_attributes_val_decimal`, `t_trace_with_attributes_val_datetime`, `t_trace_with_attributes_val_int`, and `t_trace_with_attributes_val_varchar`—each keyed by an `entity_id` that references the trace and an `attr_id` that references the attribute definition. For instance, the decimal value `1085.14` is stored in the decimal value table with `entity_id` `ATTR-0001` and `attr_id` `ATTR-0001`, while the datetime `2024-07-09T10:21:53` is stored in the datetime table with the same entity reference but a different attribute identifier, `ATTR-0002`. This separation of concerns allows the system to query attribute values by type without scanning heterogeneous columns, and it accommodates the fact that a single trace may carry multiple attributes of different types—`ATTR-0001`, for example, has associated decimal, datetime, integer, and varchar values distributed across four distinct value tables.

**t_trace_with_attributes**

| id | trace |
| --- | --- |
| ATTR-0001 | batch-exec-094 |
| ATTR-0002 | session-gamma-9 |
| ATTR-0003 | gateway-span-55 |
| ATTR-0004 | telemetry-flow-alpha |
| ATTR-0005 | pipeline-run-412 |
| ATTR-0006 | api-call-trace-12 |

**t_trace_with_attributes_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_trace_with_attributes_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-07-09T10:21:53 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2024-10-26T05:28:10 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2024-01-16T11:34:50 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-03-03T12:52:58 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2023-12-16T04:33:56 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2024-09-15T16:03:36 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2024-12-20T02:32:40 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2024-08-26T04:55:34 |

**t_trace_with_attributes_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 1085.14 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3252.57 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 401.17 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 3242.47 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 4250.01 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 3788.41 |

**t_trace_with_attributes_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 445 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 106 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 567 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 380 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 276 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 188 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 89 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 391 |

**t_trace_with_attributes_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | gw-12 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | superseded |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | node-b14 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | execution |

The trace attribute model integrates with a dimensional star schema centered on root spans, which represent the top-level execution units within a trace hierarchy. The fact table `fact_trace` records each trace instance with its `root_span_key`, `size_bytes`, and `version`, forming the analytical grain of the system. Trace identifiers in this fact table—such as `SPAN-0001`, `SPAN-0002`, `SPAN-0003`, and `SPAN-0004`—are distinct from the attribute-level identifiers, reflecting a separate namespace for span-level entities. The `root_span_key` column in `fact_trace` is a foreign key into the `dim_root_span` dimension table, where each root span is described by a `root_span_label` (e.g., `Root Span Label 01`) and a `root_span_category` (e.g., `Root Span Category 01`). This relationship enables aggregation and filtering by span category; for example, traces `SPAN-0003` and `SPAN-0004` both reference `SPAN-0005` as their root span, indicating that multiple trace records can share a common root span parent. The `size_bytes` column captures the storage footprint of each trace record, ranging from `70626790` bytes for `SPAN-0003` to `953122943` bytes for `SPAN-0004`, while the `version` column—taking values such as `4`, `8`, and `12`—tracks schema or protocol revisions across trace instances.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

Service ownership and association are modeled through a tripartite structure that decouples service identity from trace membership. The table `t_trace_with_service_name` establishes the linkage between a trace identifier and a service name, with trace entries such as `notif-send-8876`, `inventory-sync-2290`, `payment-proc-4451`, and `api-gateway-991` each associated with a service name like `inventory-db`, `order-processor`, `metrics-collector`, or `search-engine`. The service names themselves are defined in `t_trace_with_service_name_service_name`, which maps each service name identifier to its human-readable label. The relationship between traces and services is further qualified by the junction table `t_trace_with_service_name__service_name`, which introduces a `role` attribute to describe the nature of the association. A single trace can be linked to multiple services with different roles—`NAME-0001` appears as both the `trace_id` and `service_name_id` in different rows, and the `role` column takes values such as `observer`, `owner`, and `reviewer`. In one example, the trace identified by `NAME-0001` is associated with service `NAME-0006` in the role of `reviewer` and with service `NAME-0005` in the role of `observer`, while the same trace identifier also appears as a service name itself, illustrating the bidirectional nature of service-trace relationships. This role-based association model supports governance queries that distinguish between services that own a trace, those that merely observe it, and those that review its output.

**t_trace_with_service_name**

| id | trace |
| --- | --- |
| NAME-0001 | notif-send-8876 |
| NAME-0002 | inventory-sync-2290 |
| NAME-0003 | payment-proc-4451 |
| NAME-0004 | api-gateway-991 |
| NAME-0005 | cache-warm-5502 |
| NAME-0006 | payment-proc-4451 |

**t_trace_with_service_name_service_name**

| id | service_name |
| --- | --- |
| NAME-0001 | inventory-db |
| NAME-0002 | order-processor |
| NAME-0003 | metrics-collector |
| NAME-0004 | search-engine |
| NAME-0005 | logging-agent |
| NAME-0006 | logging-agent |
| NAME-0007 | config-server |
| NAME-0008 | inventory-db |

**t_trace_with_service_name__service_name**

| id | trace_id | service_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0001 | NAME-0005 | observer |
| NAME-0002 | NAME-0005 | NAME-0007 | observer |
| NAME-0003 | NAME-0004 | NAME-0007 | owner |
| NAME-0004 | NAME-0001 | NAME-0006 | reviewer |
| NAME-0005 | NAME-0002 | NAME-0004 | observer |
| NAME-0006 | NAME-0003 | NAME-0008 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | contributor |
| NAME-0008 | NAME-0003 | NAME-0008 | reviewer |