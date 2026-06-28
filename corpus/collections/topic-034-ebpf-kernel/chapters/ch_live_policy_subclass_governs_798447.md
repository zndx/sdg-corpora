---
chapter_id: ch_live_policy_subclass_governs_798447
topic_id: 34
family: 03_directive_governance
cited_terms: ['policy_subclass_governs', 'trace_in_service', 'syscall_at_security_tier']
model: engine-refine
---

At the security tier, governance is structured around a dimensional model that separates classification metadata from operational telemetry. The dimension table for security tiers assigns each tier a unique identifier—TIER-0001 through TIER-0005—and pairs it with a human-readable label and a categorical classification, such as At Security Tier Category 01 through At Security Tier Category 04. These categories serve as the primary grouping mechanism for downstream event aggregation, enabling auditors to trace syscall volumes back to their originating security boundary. The fact table for system calls anchors this structure by recording an event count against each tier: TIER-0001 registered 52 events, TIER-0002 registered 238, TIER-0003 registered 198, and TIER-0004 registered 382, providing a quantitative baseline for compliance monitoring across security boundaries.

**t_trace_in_service**

| id | trace | in_service |
| --- | --- | --- |
| SERV-0001 | ci-cd-deploy-run | kafka-cluster-east |
| SERV-0002 | nightly-data-sync | consul-registry |
| SERV-0003 | microservice-call-path | elastic-search-idx |
| SERV-0004 | sensor-telemetry-batch | vault-secrets-mgr |
| SERV-0005 | nightly-data-sync | prometheus-scrape |
| SERV-0006 | microservice-call-path | jaeger-collector |

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

Governance policies are formalized through a subclass registry that binds each policy to a scope, a priority level, and a review cadence. The identifier GOVE-0001 governs the High-Performance Clusters policy under the Audit Log Preservation Guideline scope with a priority of 4 and a review cycle of 799 days, while GOVE-0003 addresses Containerized Microservices at priority 1 with a review cycle of 507 days. The priority field, ranging from 1 to 5, establishes enforcement urgency, and the review cycle days—spanning 277 days for Production Databases (GOVE-0004) to 799 days for High-Performance Clusters—dictate the maximum interval between mandatory compliance reassessments. This dual-axis structure ensures that high-priority policies receive more frequent scrutiny without conflating urgency with scope.

**t_policy_subclass_governs**

| id | policy | governs_scope | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| GOVE-0001 | High-Performance Clusters | Audit Log Preservation Guideline | 4 | 799 |
| GOVE-0002 | Data Classification Framework | Containerized Microservices | 5 | 632 |
| GOVE-0003 | Containerized Microservices | Audit Log Preservation Guideline | 1 | 507 |
| GOVE-0004 | Production Databases | Containerized Microservices | 4 | 277 |
| GOVE-0005 | Data Classification Framework | Edge Telemetry Nodes | 3 | 143 |
| GOVE-0006 | Audit Log Preservation Guideline | Incident Response Protocol | 5 | 666 |

Service-level observability is captured through a trace registry that records execution paths and their associated runtime components. Traces such as ci-cd-deploy-run, nightly-data-sync, microservice-call-path, and sensor-telemetry-batch are each bound to an in-service component—kafka-cluster-east, consul-registry, elastic-search-idx, and vault-secrets-mgr respectively—creating an auditable linkage between deployment pipelines and the infrastructure they touch. Each trace is further decomposed into attributes, where the attribute name (duration_seconds, end_time, exit_code, host_name) and its type (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) define the schema for value capture. This separation of attribute definition from value storage enables type-safe telemetry ingestion without schema migration overhead.

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

The value tables implement a vertical partitioning strategy, storing attribute values by their XSD type in dedicated tables keyed by entity and attribute identifiers. Decimal values such as 4381.06, 2102.62, 5138.88, and 2082.99 represent duration measurements for trace entities, while integer values like 744, 59, 247, and 232 capture exit codes and numeric metadata. DateTime values—including 2023-02-11T21:39:45, 2025-04-17T05:33:23, 2024-09-24T02:59:34, and 2023-11-01T18:02:16—anchor temporal events, and varchar values such as node-b14, Log Level 02, initiation, and failed provide free-form context. Each value row references its entity through an entity_id and its attribute through an attr_id, forming a normalized star schema where the entity serves as the central fact and the attribute tables provide denormalized type-specific detail.

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

Together, these structures enforce a principle of separation of concerns: security tier categories classify boundaries, policy priorities and review cycles govern compliance cadence, and trace attributes with typed values capture operational evidence. The identifier field appears consistently across all tables as the primary key, ensuring referential integrity from the security tier dimension through to the leaf-level value tables. An auditor examining a syscall event count of 382 at TIER-0004 can trace the classification through the tier category, validate the governing policy's priority and review cycle, and inspect the associated trace values for duration, exit code, and host name—all within a single navigable data model.