---
chapter_id: ch_live_audit_for_period_919ff9
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_for_period', 'ebpf_event_subclass', 'ebpfevent_at_kernel_hook_xref']
model: engine-refine
---

Within compliance and governance frameworks, the management of audit periods and their interrelationships demands a structured approach to tracking which assessments reference or depend upon one another. The audit period registry assigns each period a unique identifier—PERI-0001 through PERI-0004, for instance—alongside a descriptive audit designation such as Data Privacy Impact Assessment, Annual-2022, or GDPR Compliance Review. These periods do not exist in isolation; a bridge table establishes the cross-references between them, recording a subject audit, a target audit period, and the role that the subject plays vis-à-vis the target. In practice, PERI-0001 appears as the subject referencing PERI-0003 as its target with the role of observer, while PERI-0002 references PERI-0005 as reviewer. The role column is critical here: it encodes the nature of the dependency—whether one audit period merely observes another or actively reviews it—transforming a simple many-to-many relationship into a semantically rich graph that auditors can traverse to understand the full scope of compliance obligations.

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

The same relational discipline extends to the operational telemetry captured through eBPF event subclassing, where the distinction between an entity, its attributes, and the attribute values becomes essential for maintaining queryable, type-safe observability data. An eBPF event subclass such as tcp_sendmsg or nginx_handle_request receives a unique identifier—EVEN-0001, EVEN-0003—and is associated with a captured_by cross-reference, XREF-0005 or XREF-0004, that anchors the event to a kernel hook context. The attribute definitions are stored separately from the values they describe: the attribute table records an attr_name like duration_seconds or host_name alongside its attr_type, which follows an XSD schema vocabulary—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string—ensuring that downstream consumers can validate and interpret values without schema discovery at query time.

**t_ebpf_event_subclass**

| id | ebpf | captured_by |
| --- | --- | --- |
| EVEN-0001 | tcp_sendmsg | XREF-0005 |
| EVEN-0002 | softirq_entry | XREF-0005 |
| EVEN-0003 | nginx_handle_request | XREF-0004 |
| EVEN-0004 | kretprobe_sys_openat | XREF-0007 |
| EVEN-0005 | kretprobe_sys_openat | XREF-0007 |
| EVEN-0006 | sockops | XREF-0002 |

**t_ebpf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | duration_seconds | xsd:decimal |
| EVEN-0002 | end_time | xsd:dateTime |
| EVEN-0003 | exit_code | xsd:integer |
| EVEN-0004 | host_name | xsd:string |
| EVEN-0005 | log_level | xsd:string |
| EVEN-0006 | phase | xsd:string |
| EVEN-0007 | retry_count | xsd:integer |
| EVEN-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2023-12-16T10:45:28 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 2024-10-14T13:06:33 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | 2023-04-24T00:44:09 |
| EVEN-0004 | EVEN-0002 | EVEN-0002 | 2025-02-16T07:35:15 |
| EVEN-0005 | EVEN-0002 | EVEN-0008 | 2025-04-20T08:07:57 |
| EVEN-0006 | EVEN-0002 | EVEN-0009 | 2024-07-28T17:18:43 |
| EVEN-0007 | EVEN-0003 | EVEN-0002 | 2023-11-26T07:43:04 |
| EVEN-0008 | EVEN-0003 | EVEN-0008 | 2024-06-08T03:25:45 |

**t_ebpf_event_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 2720.22 |
| EVEN-0002 | EVEN-0002 | EVEN-0001 | 5609.93 |
| EVEN-0003 | EVEN-0003 | EVEN-0001 | 2196.86 |
| EVEN-0004 | EVEN-0004 | EVEN-0001 | 3453.77 |
| EVEN-0005 | EVEN-0005 | EVEN-0001 | 849.28 |
| EVEN-0006 | EVEN-0006 | EVEN-0001 | 5507.03 |

**t_ebpf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0003 | 850 |
| EVEN-0002 | EVEN-0001 | EVEN-0007 | 82 |
| EVEN-0003 | EVEN-0002 | EVEN-0003 | 274 |
| EVEN-0004 | EVEN-0002 | EVEN-0007 | 150 |
| EVEN-0005 | EVEN-0003 | EVEN-0003 | 331 |
| EVEN-0006 | EVEN-0003 | EVEN-0007 | 359 |
| EVEN-0007 | EVEN-0004 | EVEN-0003 | 62 |
| EVEN-0008 | EVEN-0004 | EVEN-0007 | 407 |

**t_ebpf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | ingest-21 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | Log Level 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0006 | closeout |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | superseded |
| EVEN-0005 | EVEN-0001 | EVEN-0011 | Triggered By 05 |
| EVEN-0006 | EVEN-0002 | EVEN-0004 | gw-12 |
| EVEN-0007 | EVEN-0002 | EVEN-0005 | Log Level 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0006 | initiation |

**t_ebpfevent_at_kernel_hook_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | nginx_handle_request |
| XREF-0002 | tracepoint_net_tcp_connect |
| XREF-0003 | tracepoint_net_tcp_connect |
| XREF-0004 | python3_main |
| XREF-0005 | sched_process_exec |
| XREF-0006 | nginx_handle_request |
| XREF-0007 | nginx_handle_request |

**t_ebpfevent_at_kernel_hook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | duration_seconds | xsd:decimal |
| XREF-0002 | end_time | xsd:dateTime |
| XREF-0003 | exit_code | xsd:integer |
| XREF-0004 | host_name | xsd:string |
| XREF-0005 | log_level | xsd:string |
| XREF-0006 | phase | xsd:string |
| XREF-0007 | retry_count | xsd:integer |
| XREF-0008 | scheduled_at | xsd:dateTime |

**t_ebpfevent_at_kernel_hook_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2023-05-01T02:25:15 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2024-11-27T07:20:09 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2025-02-12T09:55:43 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-05-24T23:07:29 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2024-09-21T23:23:59 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2024-03-30T22:13:30 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2023-05-04T20:31:37 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2025-01-21T19:19:05 |

**t_ebpfevent_at_kernel_hook_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 6431.54 |
| XREF-0002 | XREF-0002 | XREF-0001 | 4806.21 |
| XREF-0003 | XREF-0003 | XREF-0001 | 5462.31 |
| XREF-0004 | XREF-0004 | XREF-0001 | 1550.57 |
| XREF-0005 | XREF-0005 | XREF-0001 | 39.90 |
| XREF-0006 | XREF-0006 | XREF-0001 | 2405.95 |
| XREF-0007 | XREF-0007 | XREF-0001 | 1945.32 |

**t_ebpfevent_at_kernel_hook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 571 |
| XREF-0002 | XREF-0001 | XREF-0007 | 284 |
| XREF-0003 | XREF-0002 | XREF-0003 | 60 |
| XREF-0004 | XREF-0002 | XREF-0007 | 436 |
| XREF-0005 | XREF-0003 | XREF-0003 | 3 |
| XREF-0006 | XREF-0003 | XREF-0007 | 8 |
| XREF-0007 | XREF-0004 | XREF-0003 | 922 |
| XREF-0008 | XREF-0004 | XREF-0007 | 55 |

**t_ebpfevent_at_kernel_hook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | node-b14 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | execution |
| XREF-0004 | XREF-0001 | XREF-0010 | pending |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | edge-03 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | review |

The separation of attribute values by type into dedicated tables—val_datetime, val_decimal, val_int, val_varchar—reflects a deliberate normalization strategy that avoids the pitfalls of wide, sparse columns while preserving type integrity. Each value row carries an entity_id that identifies the owning entity, an attr_id that resolves to the attribute definition, and a value column that holds the misc data in its native type. For the tcp_sendmsg event (EVEN-0001), the duration_seconds attribute yields a decimal value of 2720.22, while the same entity's host_name attribute stores the varchar value ingest-21. The end_time attribute, typed as xsd:dateTime, holds 2023-12-16T10:45:28, and the exit_code attribute, typed as xsd:integer, records 850. This type-disaggregated design means that a query for all decimal-valued attributes across entities touches only the val_decimal table, while a query for string-valued attributes touches only val_varchar, reducing I/O and enabling type-specific indexing strategies.

The kernel hook cross-reference tables mirror this exact pattern, demonstrating that the entity-attribute-value model is applied consistently across both event subclass and kernel hook domains. The cross-reference registry—XREF-0001 through XREF-0004—maps kernel hooks such as nginx_handle_request, tracepoint_net_tcp_connect, and python3_main to their respective attribute definitions and typed values. For the nginx_handle_request hook (XREF-0001), the duration_seconds attribute records 6431.54 as a decimal, the end_time attribute stores 2023-05-01T02:25:15 as a datetime, the exit_code attribute holds 571 as an integer, and the host_name attribute captures node-b14 as a varchar. The attr_name columns in both the event subclass and kernel hook attribute tables are identical—duration_seconds, end_time, exit_code, host_name—indicating a shared attribute vocabulary that enables cross-domain comparisons, such as correlating the duration of an eBPF-traced event with the duration of the kernel hook that captured it.

The identifier, entity, attr, attr_type, misc, role, subject, and target concepts form a coherent vocabulary for describing relational data structures in compliance and observability contexts. The identifier is the primary key that anchors every record—PERI-0001, EVEN-0001, XREF-0001—providing a stable reference point across tables. The entity is the owning object to which attribute values are attached, referenced through entity_id foreign keys in the value tables. The attr and attr_type columns define what properties exist and how they should be interpreted, while the misc column in the value tables holds the actual data in its native type. The role column in the audit bridge table encodes the semantic relationship between subject and target entities, transforming a generic foreign-key pair into a governed relationship with business meaning. Together, these concepts enable a data model that is both rigorously normalized and semantically expressive, supporting the complex querying and reporting requirements of compliance audits and operational telemetry analysis.