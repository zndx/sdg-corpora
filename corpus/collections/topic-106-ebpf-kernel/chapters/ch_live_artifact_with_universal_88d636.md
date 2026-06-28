---
chapter_id: ch_live_artifact_with_universal_88d636
topic_id: 106
family: 01_foundation
cited_terms: ['artifact_with_universal', 'ebpf_event_min_one_attribute', 'log_within_span_context']
model: engine-refine
---

The governance of distributed systems demands a disciplined approach to provenance, where every artifact, event, and observation is anchored to an immutable identifier and contextualized through a structured attribute model. An identifier serves as the primary key that guarantees uniqueness across the entire data fabric—UNIV-0001 through UNIV-0004 for system artifacts, ATTR-0001 through ATTR-0004 for eBPF event records, and CONT-0001 through CONT-0006 for log entries nested within span contexts. These identifiers are not arbitrary; they encode the provenance chain, enabling auditors to trace a Container_Image_Release (UNIV-0004) back to its creation on 2024-10-15, its deployment to us-east-1, and its relationship to the Compliance_Audit_Log that monitors it. Similarly, an eBPF event such as perf_event_sample (ATTR-0001) carries a persistent identity that survives across multiple attribute-value tables, ensuring that temporal, numeric, and categorical observations remain bound to the same originating event.

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | GPU_Compute_Pool | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | Metadata_Registry | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | GPU_Compute_Pool | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | Compliance_Audit_Log | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | Metadata_Registry | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | Metrics_Stream_Prometheus | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | GPU_Compute_Pool | 2023-11-17 | on-prem-dc1 |

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | perf_event_sample |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tc_ingress_filter |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | tracepoint_sched_switch |
| ATTR-0006 | lsm_bpf_attach |

**t_ebpf_event_min_one_attribute_attr**

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

**t_ebpf_event_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-05-05T15:51:23 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2023-02-23T16:05:24 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2023-10-25T19:35:09 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-08-09T05:49:50 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2025-04-07T23:06:46 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2023-01-30T19:25:12 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2023-12-02T01:15:04 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2023-01-06T05:08:04 |

**t_ebpf_event_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 2938.76 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3337.03 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 6550.82 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 5328.03 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 811.82 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 7052.31 |

**t_ebpf_event_min_one_attribute_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 465 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 59 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 938 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 81 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 9 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 492 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 120 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 470 |

**t_ebpf_event_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | node-b14 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | pending |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | edge-03 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | closeout |

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |

The attribute model itself is decomposed into a schema layer and a value layer, a design choice that enforces type safety while permitting heterogeneous data to coexist within a single event record. The schema layer—captured in the attribute definition table—specifies both the attribute name and its corresponding type: duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This separation is critical because it allows the value layer to distribute attribute values across type-specific tables without violating normalization principles. A single entity, identified as ATTR-0001, may simultaneously carry a duration of 2938.76 seconds (stored in the decimal value table), an exit code of 465 (stored in the integer value table), a host name of node-b14 (stored in the varchar value table), and an end time of 2024-05-05T15:51:23 (stored in the datetime value table). The entity column in each value table acts as the foreign key that reassembles these fragments into a coherent observation.

Temporal and spatial metadata provide the environmental context necessary for compliance auditing and incident response. The createddate column records the precise moment an artifact entered the system—Audit_Reporter was registered on 2024-12-09, Feature_Vector_Store on 2024-11-04, Schema_Definition on 2024-10-11, and Container_Image_Release on 2024-10-15—establishing a chronological baseline against which all downstream events are measured. The location column anchors each artifact to a deployment region: three of the four artifacts reside in us-east-1, while Schema_Definition is deployed to on-prem-dc1, a distinction that carries regulatory implications for data residency and access control. These fields are not decorative; they are the first filters applied during any compliance query, enabling an auditor to isolate all artifacts created after a specific date and deployed outside an approved region.

The relationship model, expressed through subject, target, and role columns, captures the semantic connections between log entries and their enclosing span contexts. A log entry such as disk-io.trace (CONT-0004) may participate in multiple span contexts—ml-inference-run and warehouse-replication—each association carrying a distinct role that defines the log's function within that context. The role column distinguishes between reviewer, observer, and contributor, providing a granular view of how each log contributes to the overall trace. When CONT-0004 is linked to CONT-0004 (warehouse-replication) with the role of contributor, the system records not merely that the log belongs to the context, but that it actively generates data within it. This triad of subject, target, and role transforms a flat collection of logs into a directed graph of evidentiary relationships, each edge annotated with its functional significance.

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |

The misc column, appearing across all value tables, serves as the generic value container that holds the actual data—whether a timestamp like 2023-02-23T16:05:24, a decimal measurement of 6550.82, an integer exit code of 938, or a categorical string such as pending. Its name is deliberately generic because it abstracts away the type-specific storage mechanism, presenting a unified interface for value retrieval regardless of whether the underlying data is temporal, numeric, or textual. This abstraction is essential for query engines that must construct composite records from multiple value tables without hardcoding type-specific logic. The combination of misc with the entity and attr foreign keys ensures that every value is traceable to both its originating event and its schema definition, closing the loop on the provenance chain.