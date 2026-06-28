---
chapter_id: ch_live_policy_subclass_governs_28aaf4
topic_id: 159
family: 03_directive_governance
cited_terms: ['policy_subclass_governs', 'opentelemetry_span_subclass', 'lineage_edge_max_one_target']
model: engine-refine
---

Governance policies establish the control framework that governs operational scopes, with each policy carrying a priority level and a review cycle that determines how frequently the governing rules must be re-evaluated. A policy such as "High-Performance Clusters" governs scope SPAN-0001 with a priority of 4 and a review cycle of 799 days, while "Data Classification Framework" applies to scope SPAN-0004 at priority 5 with a 632-day review interval. The "Containerized Microservices" policy, assigned priority 1, governs SPAN-0003 with a 507-day review cycle, and "Production Databases" covers SPAN-0006 at priority 4 with a shorter 277-day review period. These review cycles reflect the risk profile of each policy domain, with higher-priority policies like Data Classification Framework commanding more frequent reassessment.

**t_policy_subclass_governs**

| id | policy | governs_scope | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| GOVE-0001 | High-Performance Clusters | SPAN-0001 | 4 | 799 |
| GOVE-0002 | Data Classification Framework | SPAN-0004 | 5 | 632 |
| GOVE-0003 | Containerized Microservices | SPAN-0003 | 1 | 507 |
| GOVE-0004 | Production Databases | SPAN-0006 | 4 | 277 |
| GOVE-0005 | Data Classification Framework | SPAN-0002 | 3 | 143 |
| GOVE-0006 | Audit Log Preservation Guideline | SPAN-0006 | 5 | 666 |

OpenTelemetry spans serve as the operational bridge between governance policies and actual system behavior, mapping telemetry signals to their governing scope. The span "worker.cron.schedule" appears across multiple identifiers—SPAN-0001 and SPAN-0002—both governed by scope GOVE-0004, while "user-service.login" at SPAN-0004 falls under GOVE-0003. This many-to-one relationship between spans and governance scopes ensures that every telemetry event can be traced back to the policy framework that regulates it, creating an auditable chain from raw operational data to governance requirements.

**t_opentelemetry_span_subclass**

| id | opentelemetry | span_context |
| --- | --- | --- |
| SPAN-0001 | worker.cron.schedule | GOVE-0004 |
| SPAN-0002 | worker.cron.schedule | GOVE-0004 |
| SPAN-0003 | worker.cron.schedule | GOVE-0003 |
| SPAN-0004 | user-service.login | GOVE-0003 |
| SPAN-0005 | http.server.request | GOVE-0005 |
| SPAN-0006 | payment-gateway.process | GOVE-0001 |

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

Attribute definitions provide the schema for capturing span-level metadata, with each attribute declared by name and typed according to XML Schema definitions. The attribute `duration_seconds` is typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`. These type declarations are not merely documentation—they dictate how values are stored, validated, and queried across the value tables. The separation of attribute definitions from their actual values enables flexible schema evolution: new attributes can be introduced without restructuring the value storage layer, and type constraints are enforced at the definition level rather than scattered across individual value records.

Value storage is partitioned by data type into dedicated tables, each linking an entity (the span instance) to an attribute and its concrete value. Decimal values such as 2414.42, 5931.72, 930.67, and 6374.61 are stored in the decimal value table, corresponding to the `duration_seconds` attribute across spans SPAN-0001 through SPAN-0004. Integer values like 345, 35, 179, and 164 reside in the integer value table, associated with attributes SPAN-0003 and SPAN-0007. String values including "edge-03", "Log Level 02", "closeout", and "running" are held in the varchar value table, linked to attributes SPAN-0004, SPAN-0005, SPAN-0006, and SPAN-0010. Datetime values such as 2025-05-18T08:27:19, 2024-03-17T19:20:30, 2025-03-13T03:16:10, and 2023-06-13T01:08:11 are stored in the datetime value table, associated with attributes SPAN-0002, SPAN-0008, SPAN-0009, and SPAN-0002. This type-partitioned design ensures type safety while allowing each value to reference its entity and attribute through foreign keys.

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

Data lineage is modeled through a three-table structure that captures the flow of data between targets within defined lineage chains. The lineage table defines chains such as "Sensor calibration chain" and "Feature store refresh," while the target table identifies specific data assets like "Compliance audit log," "Risk scoring model," "Feature vector store," and "Executive dashboard." The join table connects lineage edges to their target endpoints, assigning each connection a role—either "contributor" or "owner." For instance, lineage edge TARG-0001 links lineage TARG-0006 to target TARG-0001 with the role of contributor, while TARG-0002 connects TARG-0001 to TARG-0003 as owner. This role-based assignment clarifies accountability within each lineage chain, distinguishing between entities that produce data and those that own it.

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | Sensor calibration chain |
| TARG-0003 | Feature store refresh |
| TARG-0004 | Sensor calibration chain |
| TARG-0005 | Feature store refresh |
| TARG-0006 | Model training pipeline |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |