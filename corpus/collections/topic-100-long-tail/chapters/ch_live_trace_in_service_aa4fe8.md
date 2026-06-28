---
chapter_id: ch_live_trace_in_service_aa4fe8
topic_id: 100
family: 02_observation_measurement
cited_terms: ['trace_in_service', 'log_record_subclass', 'requirement_refines']
model: engine-refine
---

The attribute-value architecture separates service definitions from their measurable properties, allowing heterogeneous data types to be stored without schema modification. The core service records in t_trace_in_service identify operational traces such as ci-cd-deploy-run and nightly-data-sync, each resolved to an in-service target like kafka-cluster-east or vault-secrets-mgr. Attribute metadata in t_trace_in_service_attr declares the shape of each measurement through attr_name and attr_type pairs—duration_seconds mapped to xsd:decimal, end_time to xsd:dateTime, exit_code to xsd:integer, and host_name to xsd:string. Actual values are materialized across four type-specific tables: t_trace_in_service_val_decimal holds numeric measurements such as 4381.06 and 2102.62, t_trace_in_service_val_int stores integer results including 744 and 247, t_trace_in_service_val_varchar captures free-form strings like node-b14 and failed, and t_trace_in_service_val_datetime records temporal stamps such as 2023-02-11T21:39:45 and 2025-04-17T05:33:23. Each value row is anchored by entity_id, which references the service record, and attr_id, which references the attribute definition, forming a normalized star topology that preserves type safety while supporting arbitrary attribute cardinality.

**t_trace_in_service**

| id | trace | in_service |
| --- | --- | --- |
| SERV-0001 | ci-cd-deploy-run | kafka-cluster-east |
| SERV-0002 | nightly-data-sync | consul-registry |
| SERV-0003 | microservice-call-path | elastic-search-idx |
| SERV-0004 | sensor-telemetry-batch | vault-secrets-mgr |
| SERV-0005 | nightly-data-sync | prometheus-scrape |
| SERV-0006 | microservice-call-path | jaeger-collector |

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

Identifier conventions provide the structural backbone across all tables, with service-oriented records bearing the SERV- prefix and log-oriented records bearing the RECO prefix, creating an unambiguous namespace that prevents cross-domain collisions. The identifier column serves as the primary key in every table, and foreign-key relationships are expressed through entity_id and attr_id columns that reference these identifiers in their respective parent tables. This pattern extends to the requirement refinement table, where identifiers such as REFI-0001 and REFI-0002 label relationships between requirements and their refinements, while the requirement and refines columns themselves carry human-readable names like Access Control Matrix and System Availability Target. The separation between machine-readable identifiers and human-readable labels enables automated joins and programmatic access while preserving readability in reports and audit trails.

Log severity classification operates through a dimension-fact relationship that decouples severity semantics from individual log records. The fact_log table stores each log entry with a log_severity_key that references dim_log_severity, where each severity level is described by a log_severity_label such as Log Severity Label 01 and a log_severity_category such as Log Severity Category 01. This normalization allows severity metadata to be updated independently of log data and supports multi-level categorization where labels provide human-readable descriptions and categories enable grouping and aggregation. Log entries carry size_bytes values ranging from 442933768 to 913386183 and version numbers of 2, 6, or 7, enabling capacity planning and version-aware filtering without embedding this metadata in the severity dimension itself.

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |

Requirement refinement relationships are contextualized through scope and language attributes that govern the applicability and interpretation of each refinement. The t_requirement_refines table records how one requirement refines another—for instance, the Access Control Matrix refines the System Availability Target, while the Data Retention Policy appears in multiple refinement contexts, refining Network Latency Limit, Pipeline Throughput Goal, and GDPR Compliance. Scope values of team, regional, local, and global indicate the organizational or geographic boundary within which each refinement applies, and language values of es, en, and fr specify the linguistic context for documentation and compliance artifacts. This dual-axis contextualization ensures that requirement traceability captures not only the structural relationship between requirements but also the jurisdictional and linguistic constraints under which each relationship is valid.

**t_requirement_refines**

| id | requirement | refines | scope | language |
| --- | --- | --- | --- | --- |
| REFI-0001 | Access Control Matrix | System Availability Target | team | es |
| REFI-0002 | Data Retention Policy | Network Latency Limit | regional | en |
| REFI-0003 | Data Retention Policy | Pipeline Throughput Goal | local | en |
| REFI-0004 | Data Retention Policy | GDPR Compliance | global | fr |