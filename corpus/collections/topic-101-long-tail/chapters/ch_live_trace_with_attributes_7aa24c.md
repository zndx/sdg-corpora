---
chapter_id: ch_live_trace_with_attributes_7aa24c
topic_id: 101
family: 02_observation_measurement
cited_terms: ['trace_with_attributes', 'kernelhook_observes_event_class', 'iso27001_clause_subclass']
model: engine-refine
---

Attributes constitute the foundational classification layer within the telemetry and governance data model, serving as typed descriptors that attach semantic meaning to observed entities. Each attribute is declared with a name—duration_seconds, end_time, exit_code, host_name—and bound to a precise data type from the XSD namespace, including xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This type discipline is not merely declarative; it governs the physical storage strategy, with separate value tables partitioned by type to ensure type-safe retrieval and to prevent cross-contamination between numeric, temporal, and textual measurements. An attribute such as duration_seconds, typed as xsd:decimal, yields values like 1085.14 or 3252.57, while exit_code, typed as xsd:integer, carries discrete values such as 445 or 567. The separation of value storage by type enforces schema integrity at query time and reflects a design principle common to high-assurance observability systems: that the cost of type confusion in audit data is unacceptable.

Identifiers anchor every attribute and entity within the model, providing stable, globally unique references that survive across system restarts and data migrations. The identifier space follows a structured naming convention—ATTR-0001 through ATTR-0004 for trace attributes, EVEN-0001 through EVEN-0004 for event observation records, and CLAU-0001 through CLAU-0005 for ISO 27001 clause subclasses—ensuring that no two entities collide within their respective namespaces. These identifiers function as the primary keys of the attribute registry and as the foreign keys that bind value rows to their defining attributes. An entity, in this context, is any observable unit to which attributes are affixed; the entity_id column in each typed value table establishes the provenance of a measurement, linking a value such as 2024-07-09T10:21:53 back to the entity ATTR-0001 and the attribute ATTR-0002. The same entity may carry multiple attributes simultaneously, as evidenced by ATTR-0001 appearing as the entity_id across datetime, decimal, integer, and varchar value tables, each contributing a distinct dimension of observability.

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

**t_iso27001_clause_subclass**

| id | iso |
| --- | --- |
| CLAU-0001 | Iso 01 |
| CLAU-0002 | Iso 02 |
| CLAU-0003 | Iso 03 |
| CLAU-0004 | Iso 04 |
| CLAU-0005 | Iso 05 |
| CLAU-0006 | Iso 06 |

**t_iso27001_clause_subclass_iso27001_clause**

| id | iso27001_clause |
| --- | --- |
| CLAU-0001 | Risk treatment |
| CLAU-0002 | Performance evaluation |
| CLAU-0003 | Improvement |
| CLAU-0004 | Leadership |
| CLAU-0005 | Risk treatment |
| CLAU-0006 | Risk treatment |

Location and miscellaneous fields provide the operational context necessary for attribution and incident response. The location dimension, drawn from the kernelhook observation registry, encodes geographic and availability-zone placement—ap-south-2, us-east-1, zone-b—allowing operators to correlate attribute values with infrastructure topology. A kernelhook such as perf-monitor, deployed in ap-south-2 under the name probe_capture_main, observes the event class ATTR-0003, and this triad of hook, event, and location forms the minimal provenance tuple for any captured signal. The miscellaneous value space, represented by varchar-typed attributes, carries free-form descriptors that do not fit the rigid type taxonomy: host identifiers like gw-12, log-level annotations such as Log Level 02, lifecycle states including initiation and superseded, and stream names like event_feed_prod. These values are essential for human-readable correlation but are deliberately isolated from typed value tables to prevent schema drift from unstructured data.

**t_kernelhook_observes_event_class**

| id | kernelhook | observes_event | location | name |
| --- | --- | --- | --- | --- |
| EVEN-0001 | perf-monitor | ATTR-0003 | ap-south-2 | probe_capture_main |
| EVEN-0002 | syscall-hook | ATTR-0003 | us-east-1 | audit_log_stream |
| EVEN-0003 | kernel-watcher | ATTR-0003 | zone-b | net_watch_stream |
| EVEN-0004 | telemetry-daemon | ATTR-0003 | us-east-1 | event_feed_prod |
| EVEN-0005 | ebpf-probe | ATTR-0002 | on-prem-dc1 | probe_capture_main |

The role, subject, and target columns define the governance relationships that bind ISO 27001 clause subclasses to their parent clauses, establishing accountability and review chains. In this relationship model, the subject identifies the clause subclass—CLAU-0004, CLAU-0001, CLAU-0005—while the target identifies the parent ISO 27001 clause, such as CLAU-0001 (Risk treatment), CLAU-0003 (Improvement), or CLAU-0006. The role column assigns a functional position within that relationship: reviewer, contributor, or owner. A single subclass may participate in multiple relationships with different roles; CLAU-0004, for instance, appears as a reviewer against CLAU-0001 and as a contributor against CLAU-0006, reflecting the multi-faceted nature of compliance obligations. This role-based linkage ensures that every clause subclass can be traced to its governing standard and that the individuals or systems responsible for each clause are explicitly declared, satisfying the auditability requirements of ISO 27001's governance framework.

**t_iso27001_clause_subclass__iso27001_clause**

| id | iso_id | iso27001_clause_id | role |
| --- | --- | --- | --- |
| CLAU-0001 | CLAU-0004 | CLAU-0001 | reviewer |
| CLAU-0002 | CLAU-0001 | CLAU-0003 | contributor |
| CLAU-0003 | CLAU-0004 | CLAU-0006 | contributor |
| CLAU-0004 | CLAU-0005 | CLAU-0006 | owner |
| CLAU-0005 | CLAU-0005 | CLAU-0004 | owner |
| CLAU-0006 | CLAU-0006 | CLAU-0006 | owner |
| CLAU-0007 | CLAU-0001 | CLAU-0006 | reviewer |
| CLAU-0008 | CLAU-0005 | CLAU-0003 | contributor |

The integration of these concepts—typed attributes, stable identifiers, location-aware observation, and role-based governance—forms a coherent data model for compliance-grade telemetry. Trace identifiers such as batch-exec-094, session-gamma-9, gateway-span-55, and telemetry-flow-alpha provide the operational context within which attributes are measured, while the kernelhook observation registry (perf-monitor, syscall-hook, kernel-watcher, telemetry-daemon) provides the mechanism by which events are captured and attributed to specific locations and probe names. The ISO 27001 clause hierarchy, with its subclasses mapping to clauses like Leadership, Risk treatment, Performance evaluation, and Improvement, provides the normative framework against which all observed data is evaluated. Together, these structures ensure that every measurement can be traced to its source, its type, its location, and its governing standard, and that every governance obligation can be traced to its responsible parties and its evidentiary basis.