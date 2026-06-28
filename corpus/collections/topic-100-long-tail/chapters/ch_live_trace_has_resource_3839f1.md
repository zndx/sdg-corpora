---
chapter_id: ch_live_trace_has_resource_3839f1
topic_id: 100
family: 02_observation_measurement
cited_terms: ['trace_has_resource', 'trace_in_service', 'trace_min_one_span']
model: engine-refine
---

DISTRIBUTED TRACEABILITY AND RESOURCE ATTRIBUTION FRAMEWORK

OCTOBER 2025

SECTION 4

TRACEABILITY METRICS AND RESOURCE ATTRIBUTION

The observability architecture captures execution lifecycles through a fact table of trace records, each anchored by a unique identifier and linked to a dimensional catalog of spans that classify operational activity by category and label. A trace record carries three quantitative measures: the elapsed duration in seconds, the exit code signaling completion status, and the retry count reflecting transient failure recovery. Span identifiers such as SPAN-0001 through SPAN-0006 serve as foreign keys into the spans dimension, where categorical labels like Spans Category 01 and Spans Category 04 provide the taxonomic grouping necessary for aggregated reporting. Duration values across the trace fact table range from 1874.27 seconds for SPAN-0001 to 3940.66 seconds for SPAN-0003, while exit codes span from 60 to 900 and retry counts from 179 to 459, indicating substantial variance in execution complexity and failure resilience across the workload portfolio.

**t_trace_in_service**

| id | trace | in_service |
| --- | --- | --- |
| SERV-0001 | ci-cd-deploy-run | kafka-cluster-east |
| SERV-0002 | nightly-data-sync | consul-registry |
| SERV-0003 | microservice-call-path | elastic-search-idx |
| SERV-0004 | sensor-telemetry-batch | vault-secrets-mgr |
| SERV-0005 | nightly-data-sync | prometheus-scrape |
| SERV-0006 | microservice-call-path | jaeger-collector |

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| SPAN-0001 | SPAN-0005 | 1874.27 | 491 | 399 |
| SPAN-0002 | SPAN-0002 | 2092.44 | 900 | 179 |
| SPAN-0003 | SPAN-0004 | 3940.66 | 420 | 396 |
| SPAN-0004 | SPAN-0006 | 3336.66 | 60 | 459 |

**dim_spans**

| id | spans_label | spans_category |
| --- | --- | --- |
| SPAN-0001 | Spans Label 01 | Spans Category 01 |
| SPAN-0002 | Spans Label 02 | Spans Category 02 |
| SPAN-0003 | Spans Label 03 | Spans Category 03 |
| SPAN-0004 | Spans Label 04 | Spans Category 04 |
| SPAN-0005 | Spans Label 05 | Spans Category 05 |
| SPAN-0006 | Spans Label 06 | Spans Category 06 |

Resource attribution extends the trace model by associating individual execution traces with the infrastructure components they consume. The resource linkage table maps trace names such as batch-etl-nightly and lab-assay-protocol-2b to resources including s3-data-lake-warehouse, postgresql-primary-db, and network-bandwidth-10g, with identifiers RESO-0001 through RESO-0004 providing stable references for downstream queries. A single resource may participate in multiple traces — s3-data-lake-warehouse appears under both RESO-0001 and RESO-0004 — while a single trace may consume multiple resources, establishing a many-to-many relationship that captures the distributed nature of modern data pipelines. The attribute definition table for resource traces declares four typed properties: duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string, each requiring a dedicated value store to preserve type fidelity.

**t_trace_has_resource**

| id | trace | resource |
| --- | --- | --- |
| RESO-0001 | batch-etl-nightly | s3-data-lake-warehouse |
| RESO-0002 | lab-assay-protocol-2b | postgresql-primary-db |
| RESO-0003 | governance-audit-cycle-9 | network-bandwidth-10g |
| RESO-0004 | lab-assay-protocol-2b | s3-data-lake-warehouse |
| RESO-0005 | ml-training-run-aurora | iot-sensor-bus-7 |
| RESO-0006 | governance-audit-cycle-9 | gpu-cluster-node-04 |
| RESO-0007 | lab-assay-protocol-2b | gpu-cluster-node-04 |
| RESO-0008 | api-gateway-chain-alpha | compute-node-vm-128 |

**t_trace_has_resource_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RESO-0001 | duration_seconds | xsd:decimal |
| RESO-0002 | end_time | xsd:dateTime |
| RESO-0003 | exit_code | xsd:integer |
| RESO-0004 | host_name | xsd:string |
| RESO-0005 | log_level | xsd:string |
| RESO-0006 | phase | xsd:string |
| RESO-0007 | retry_count | xsd:integer |
| RESO-0008 | scheduled_at | xsd:dateTime |

**t_trace_has_resource_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0002 | 2024-06-04T06:37:56 |
| RESO-0002 | RESO-0001 | RESO-0008 | 2024-12-02T12:01:14 |
| RESO-0003 | RESO-0001 | RESO-0009 | 2023-01-28T15:18:51 |
| RESO-0004 | RESO-0002 | RESO-0002 | 2024-10-26T21:48:09 |
| RESO-0005 | RESO-0002 | RESO-0008 | 2023-05-28T23:57:13 |
| RESO-0006 | RESO-0002 | RESO-0009 | 2024-11-25T19:57:56 |
| RESO-0007 | RESO-0003 | RESO-0002 | 2025-04-19T16:24:22 |
| RESO-0008 | RESO-0003 | RESO-0008 | 2023-04-30T19:04:21 |

**t_trace_has_resource_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0001 | 6459.38 |
| RESO-0002 | RESO-0002 | RESO-0001 | 3107.88 |
| RESO-0003 | RESO-0003 | RESO-0001 | 4594.49 |
| RESO-0004 | RESO-0004 | RESO-0001 | 2602.26 |
| RESO-0005 | RESO-0005 | RESO-0001 | 5003.83 |
| RESO-0006 | RESO-0006 | RESO-0001 | 252.98 |
| RESO-0007 | RESO-0007 | RESO-0001 | 239.70 |
| RESO-0008 | RESO-0008 | RESO-0001 | 3334.43 |

**t_trace_has_resource_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0003 | 866 |
| RESO-0002 | RESO-0001 | RESO-0007 | 141 |
| RESO-0003 | RESO-0002 | RESO-0003 | 185 |
| RESO-0004 | RESO-0002 | RESO-0007 | 294 |
| RESO-0005 | RESO-0003 | RESO-0003 | 284 |
| RESO-0006 | RESO-0003 | RESO-0007 | 200 |
| RESO-0007 | RESO-0004 | RESO-0003 | 838 |
| RESO-0008 | RESO-0004 | RESO-0007 | 136 |

**t_trace_in_service_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SERV-0001 | duration_seconds | xsd:decimal |
| SERV-0002 | end_time | xsd:dateTime |
| SERV-0003 | exit_code | xsd:integer |
| SERV-0004 | host_name | xsd:string |
| SERV-0005 | log_level | xsd:string |
| SERV-0006 | phase | xsd:string |
| SERV-0007 | retry_count | xsd:integer |
| SERV-0008 | scheduled_at | xsd:dateTime |

**t_trace_in_service_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0002 | 2023-02-11T21:39:45 |
| SERV-0002 | SERV-0001 | SERV-0008 | 2025-04-17T05:33:23 |
| SERV-0003 | SERV-0001 | SERV-0009 | 2024-09-24T02:59:34 |
| SERV-0004 | SERV-0002 | SERV-0002 | 2023-11-01T18:02:16 |
| SERV-0005 | SERV-0002 | SERV-0008 | 2023-07-24T15:59:25 |
| SERV-0006 | SERV-0002 | SERV-0009 | 2023-09-19T06:42:34 |
| SERV-0007 | SERV-0003 | SERV-0002 | 2025-04-22T19:55:46 |
| SERV-0008 | SERV-0003 | SERV-0008 | 2024-12-15T02:05:50 |

**t_trace_in_service_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0001 | 4381.06 |
| SERV-0002 | SERV-0002 | SERV-0001 | 2102.62 |
| SERV-0003 | SERV-0003 | SERV-0001 | 5138.88 |
| SERV-0004 | SERV-0004 | SERV-0001 | 2082.99 |
| SERV-0005 | SERV-0005 | SERV-0001 | 6123.82 |
| SERV-0006 | SERV-0006 | SERV-0001 | 5465.25 |

**t_trace_in_service_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0003 | 744 |
| SERV-0002 | SERV-0001 | SERV-0007 | 59 |
| SERV-0003 | SERV-0002 | SERV-0003 | 247 |
| SERV-0004 | SERV-0002 | SERV-0007 | 232 |
| SERV-0005 | SERV-0003 | SERV-0003 | 916 |
| SERV-0006 | SERV-0003 | SERV-0007 | 56 |
| SERV-0007 | SERV-0004 | SERV-0003 | 376 |
| SERV-0008 | SERV-0004 | SERV-0007 | 417 |

Typed attribute values are materialized across four separate value tables, partitioned by XML Schema datatype to enforce precision and enable efficient range queries. Decimal-valued attributes such as duration_seconds store measurements like 6459.38, 3107.88, 4594.49, and 2602.26 seconds, each associated with entity identifiers that reference the resource linkage records. Integer-valued attributes capture exit codes and retry counts — values including 866, 141, 185, and 294 appear across the integer value store — while datetime attributes record temporal boundaries such as 2024-06-04T06:37:56 and 2024-12-02T12:01:14, and varchar attributes preserve free-form metadata including host identifiers like node-b14, log level designations such as Log Level 02, and lifecycle states including closeout and running.

**t_trace_has_resource_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0004 | node-b14 |
| RESO-0002 | RESO-0001 | RESO-0005 | Log Level 02 |
| RESO-0003 | RESO-0001 | RESO-0006 | closeout |
| RESO-0004 | RESO-0001 | RESO-0010 | running |
| RESO-0005 | RESO-0001 | RESO-0011 | Triggered By 05 |
| RESO-0006 | RESO-0002 | RESO-0004 | worker-07 |
| RESO-0007 | RESO-0002 | RESO-0005 | Log Level 07 |
| RESO-0008 | RESO-0002 | RESO-0006 | review |

**t_trace_in_service_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0004 | node-b14 |
| SERV-0002 | SERV-0001 | SERV-0005 | Log Level 02 |
| SERV-0003 | SERV-0001 | SERV-0006 | initiation |
| SERV-0004 | SERV-0001 | SERV-0010 | failed |
| SERV-0005 | SERV-0001 | SERV-0011 | Triggered By 05 |
| SERV-0006 | SERV-0002 | SERV-0004 | node-b14 |
| SERV-0007 | SERV-0002 | SERV-0005 | Log Level 07 |
| SERV-0008 | SERV-0002 | SERV-0006 | initiation |

The service attribution model mirrors the resource model, providing an orthogonal axis of observability that maps traces to the operational services they invoke. Service linkage records such as SERV-0001 through SERV-0004 associate trace names like ci-cd-deploy-run and nightly-data-sync with services including kafka-cluster-east, consul-registry, elastic-search-idx, and vault-secrets-mgr. The service attribute schema is structurally identical to the resource schema, declaring the same four typed properties — duration_seconds, end_time, exit_code, and host_name — with corresponding value tables storing decimal measurements such as 4381.06 and 5138.88 seconds, integer values including 744 and 247, datetime stamps like 2023-02-11T21:39:45 and 2025-04-17T05:33:23, and varchar entries such as node-b14, initiation, and failed. This parallel structure enables consistent analytical patterns across both resource and service dimensions while maintaining data type separation for query optimization.