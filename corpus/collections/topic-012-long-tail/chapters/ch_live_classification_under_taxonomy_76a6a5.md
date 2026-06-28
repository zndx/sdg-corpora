---
chapter_id: ch_live_classification_under_taxonomy_76a6a5
topic_id: 12
family: 03_directive_governance
cited_terms: ['classification_under_taxonomy', 'trace_in_service', 'ebpf_event_for_syscall']
model: engine-refine
---

Attributes constitute the measurable or descriptive properties bound to domain entities, and their types enforce a strict schema discipline that propagates through every layer of the data model. Across all three domains—taxonomy classification, service-trace mapping, and eBPF-to-syscall correlation—the attribute vocabulary is uniform: each entity carries a `duration_seconds` typed as `xsd:decimal`, an `end_time` typed as `xsd:dateTime`, an `exit_code` typed as `xsd:integer`, and a `host_name` typed as `xsd:string`. This uniformity is not incidental; it enables cross-domain queries and aggregation without type coercion. The attribute definitions themselves are stored in a dedicated registry table—`t_classification_under_taxonomy_attr`, `t_trace_in_service_attr`, and `t_ebpf_event_for_syscall_attr` respectively—where each row declares an `attr_name` and its corresponding `attr_type`, establishing a contract that the value tables must honor.

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

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

**t_ebpf_event_for_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | duration_seconds | xsd:decimal |
| SYSC-0002 | end_time | xsd:dateTime |
| SYSC-0003 | exit_code | xsd:integer |
| SYSC-0004 | host_name | xsd:string |
| SYSC-0005 | log_level | xsd:string |
| SYSC-0006 | phase | xsd:string |
| SYSC-0007 | retry_count | xsd:integer |
| SYSC-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_for_syscall_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0002 | 2025-06-18T16:09:11 |
| SYSC-0002 | SYSC-0001 | SYSC-0008 | 2023-11-08T17:00:45 |
| SYSC-0003 | SYSC-0001 | SYSC-0009 | 2025-04-25T11:16:48 |
| SYSC-0004 | SYSC-0002 | SYSC-0002 | 2024-10-09T21:27:52 |
| SYSC-0005 | SYSC-0002 | SYSC-0008 | 2024-01-10T15:25:08 |
| SYSC-0006 | SYSC-0002 | SYSC-0009 | 2024-10-06T14:16:05 |
| SYSC-0007 | SYSC-0003 | SYSC-0002 | 2023-05-30T09:11:09 |
| SYSC-0008 | SYSC-0003 | SYSC-0008 | 2023-01-31T01:26:46 |

**t_ebpf_event_for_syscall_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | 5668.45 |
| SYSC-0002 | SYSC-0002 | SYSC-0001 | 1373.81 |
| SYSC-0003 | SYSC-0003 | SYSC-0001 | 293.20 |
| SYSC-0004 | SYSC-0004 | SYSC-0001 | 2278.72 |
| SYSC-0005 | SYSC-0005 | SYSC-0001 | 1782.39 |
| SYSC-0006 | SYSC-0006 | SYSC-0001 | 358.71 |

Entities are the primary subjects to which these attributes attach, and they are identified by scoped, human-readable identifiers that encode their domain of origin. Taxonomy entities carry identifiers such as `TAXO-0001` through `TAXO-0004`, service-trace entities use `SERV-0001` through `SERV-0004`, and syscall-correlation entities use `SYSC-0001` through `SYSC-0004`. The entity tables themselves—`t_classification_under_taxonomy`, `t_trace_in_service`, and `t_ebpf_event_for_syscall`—each define a binary relationship between a domain-specific concept and its parent taxonomy or target service. A classification such as "Lab Sample Category" is recorded as belonging to the "EDAM Ontology"; a trace named "ci-cd-deploy-run" is recorded as executing within the "kafka-cluster-east" service; an eBPF event from "node-exporter" is recorded as being triggered by the `mmap` syscall. The identifier column (`id`) serves as the primary key, while the relationship columns (`classification`, `trace`, `ebpf` on one side; `under_taxonomy`, `in_service`, `for_syscall` on the other) establish the foreign-key links that give each entity its contextual meaning.

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | EDAM Ontology |
| TAXO-0002 | Anomaly Detection Model | DQO Framework |
| TAXO-0003 | Experiment Phase Code | LOINC Code Set |
| TAXO-0004 | Telemetry Stream Type | SAREK Pipeline |
| TAXO-0005 | Compliance Framework Set | ENVO Biological |
| TAXO-0006 | Experiment Phase Code | PROMISE Metrics |
| TAXO-0007 | Metadata Schema Version | SAREK Pipeline |
| TAXO-0008 | Experiment Phase Code | OMOP CDM |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |

**t_trace_in_service**

| id | trace | in_service |
| --- | --- | --- |
| SERV-0001 | ci-cd-deploy-run | kafka-cluster-east |
| SERV-0002 | nightly-data-sync | consul-registry |
| SERV-0003 | microservice-call-path | elastic-search-idx |
| SERV-0004 | sensor-telemetry-batch | vault-secrets-mgr |
| SERV-0005 | nightly-data-sync | prometheus-scrape |
| SERV-0006 | microservice-call-path | jaeger-collector |

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

**t_ebpf_event_for_syscall**

| id | ebpf | for_syscall |
| --- | --- | --- |
| SYSC-0001 | node-exporter | mmap |
| SYSC-0002 | node-exporter | openat |
| SYSC-0003 | systemd | connect |
| SYSC-0004 | promtail | bind |
| SYSC-0005 | sshd | read |
| SYSC-0006 | nginx | openat |

**t_ebpf_event_for_syscall_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0003 | 7 |
| SYSC-0002 | SYSC-0001 | SYSC-0007 | 420 |
| SYSC-0003 | SYSC-0002 | SYSC-0003 | 186 |
| SYSC-0004 | SYSC-0002 | SYSC-0007 | 281 |
| SYSC-0005 | SYSC-0003 | SYSC-0003 | 156 |
| SYSC-0006 | SYSC-0003 | SYSC-0007 | 35 |
| SYSC-0007 | SYSC-0004 | SYSC-0003 | 875 |
| SYSC-0008 | SYSC-0004 | SYSC-0007 | 95 |

**t_ebpf_event_for_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | node-a01 |
| SYSC-0002 | SYSC-0001 | SYSC-0005 | Log Level 02 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | closeout |
| SYSC-0004 | SYSC-0001 | SYSC-0010 | failed |
| SYSC-0005 | SYSC-0001 | SYSC-0011 | Triggered By 05 |
| SYSC-0006 | SYSC-0002 | SYSC-0004 | worker-07 |
| SYSC-0007 | SYSC-0002 | SYSC-0005 | Log Level 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0006 | review |

The value tables—organized by data type into `_val_datetime`, `_val_decimal`, `_val_int`, and `_val_varchar` subtables—store the actual measurements and descriptors that populate the attributes defined in the registry. Each value row carries an `entity_id` foreign key pointing back to the entity it describes, an `attr_id` foreign key pointing to the attribute definition, and a `value` column holding the concrete datum. For `duration_seconds`, values such as `4845.29`, `4381.06`, and `5668.45` appear across the taxonomy, service, and syscall domains respectively, all stored in the decimal value tables. For `end_time`, timestamps like `2024-03-16T10:40:44`, `2023-02-11T21:39:45`, and `2025-06-18T16:09:11` populate the datetime value tables. The integer exit codes—`123`, `744`, `7`—and the string hostnames—`worker-07`, `node-b14`, `node-a01`—follow the same pattern in their respective typed value tables. This type-disaggregated storage ensures that each value is persisted in the most appropriate column type, eliminating runtime casting and preserving precision.

The structural parallelism across the three domains is deliberate and consequential. Each domain follows the same four-table pattern: a relationship table, an attribute definition table, and three value tables (decimal, integer, varchar) plus a datetime value table. The attribute names and types are identical across all three domains, which means that a monitoring dashboard or an audit query can reference `duration_seconds` or `exit_code` without knowing whether it is inspecting a taxonomy classification, a service trace, or an eBPF event. The identifiers, while scoped to their domain (`TAXO-`, `SERV-`, `SYSC-`), serve the same function: they are the stable handles through which entities are referenced, attributes are resolved, and values are retrieved. This design supports both domain-isolated operations—where a taxonomy analyst works exclusively with `TAXO-*` identifiers—and cross-domain correlation, where a single analytical pipeline can join value tables across domains using the shared attribute schema.

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