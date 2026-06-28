---
chapter_id: ch_live_ebpfevent_at_kernel_hook_xref_d5f9fe
topic_id: 72
family: 04_ebpf_kernel
cited_terms: ['ebpfevent_at_kernel_hook_xref', 'belief_interval_only_unit_range', 'attestation_about_compliance_claim']
model: engine-refine
---

Kernel event tracing relies on a cross-referencing architecture wherein each hook invocation receives a unique identifier—XREF-0001 through XREF-0004—and is associated with a concrete kernel event such as `tracepoint_file_open`, `tracepoint_sched_switch`, or `kprobe_do_execve`. These identifiers serve as the primary key for resolving all subsequent attribute bindings, ensuring that every measurement, timestamp, or classification can be traced back to its originating event without ambiguity. The attribute schema itself is defined separately from the values it constrains: each attribute carries a name—`duration_seconds`, `end_time`, `exit_code`, `host_name`—and a type from the XSD vocabulary, including `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. This separation of attribute definition from value storage permits heterogeneous value types to be persisted in dedicated tables, with the decimal values for duration ranging from 1550.57 to 6431.54, the integer exit codes spanning 60 to 601, the timestamps covering the interval from 2023-05-01T02:25:15 through 2025-02-12T09:55:43, and the string-valued host identifiers such as `node-b14` alongside categorical labels like `Log Level 02`, `execution`, and `pending`.

**t_ebpfevent_at_kernel_hook_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | tracepoint_file_open |
| XREF-0002 | tracepoint_sched_switch |
| XREF-0003 | tracepoint_sched_switch |
| XREF-0004 | kprobe_do_execve |
| XREF-0005 | kretprobe_sys_openat |
| XREF-0006 | tracepoint_file_open |
| XREF-0007 | tracepoint_file_open |

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

The entity column within each value table functions as the foreign key that binds a particular measurement to its parent cross-reference record, thereby constructing a directed graph of evidence. A single entity—XREF-0001, for instance—may carry multiple attribute values across the four value tables, each row representing a distinct observation about the same kernel event. This design enforces referential integrity while allowing the attribute set to vary across events: some hooks record duration and exit code, others record host name and end time, and the schema accommodates this variability without requiring null columns or sparse matrices. The attr_id column in each value table points back to the attribute definition, completing the triad of entity, attribute, and value that constitutes the fundamental unit of recorded evidence.

Beyond raw event data, the system maintains a parallel structure for expressing confidence in derived claims. The belief interval framework assigns each interval a unique identifier—RANG-0001 through RANG-0004—and a descriptive label such as "throughput projection," "packet loss guarantee," or "noise floor estimate." Each interval is bounded by a lower confidence threshold expressed as a natural language constraint: "95 pct threshold," "0.84 confidence floor," "0.82 probability threshold," and "0.89 certainty bound." The associated attribute schema for these intervals includes a `confidence` field of type `xsd:decimal`, a `dimension_kind` of type `xsd:string`, a `method` of type `xsd:string`, and a `recorded_at` timestamp of type `xsd:dateTime`. The decimal values stored against these intervals—0.727, 0.788, 281.42, 343.70—represent the measured quantities that the confidence bounds are intended to qualify, while the string-valued attributes capture metadata such as "Dimension Kind 01," "Encoding 02," "change rationale," and locale codes like "fr."

**t_belief_interval_only_unit_range**

| id | belief | belief_lower_bound |
| --- | --- | --- |
| RANG-0001 | throughput projection | 95 pct threshold |
| RANG-0002 | throughput projection | 0.84 confidence floor |
| RANG-0003 | packet loss guarantee | 0.82 probability threshold |
| RANG-0004 | noise floor estimate | 0.89 certainty bound |
| RANG-0005 | thermal drift assertion | 0.82 probability threshold |
| RANG-0006 | packet loss guarantee | 0.87 reliability floor |

**t_belief_interval_only_unit_range_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RANG-0001 | confidence | xsd:decimal |
| RANG-0002 | dimension_kind | xsd:string |
| RANG-0003 | method | xsd:string |
| RANG-0004 | recorded_at | xsd:dateTime |
| RANG-0005 | uncertainty | xsd:decimal |
| RANG-0006 | unit | xsd:string |
| RANG-0007 | value | xsd:decimal |
| RANG-0008 | encoding | xsd:string |

**t_belief_interval_only_unit_range_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0004 | 2025-06-14T16:53:04 |
| RANG-0002 | RANG-0002 | RANG-0004 | 2023-08-16T07:36:41 |
| RANG-0003 | RANG-0003 | RANG-0004 | 2023-03-26T19:32:25 |
| RANG-0004 | RANG-0004 | RANG-0004 | 2025-03-17T08:26:16 |
| RANG-0005 | RANG-0005 | RANG-0004 | 2025-04-30T01:20:27 |
| RANG-0006 | RANG-0006 | RANG-0004 | 2023-02-14T23:11:05 |

**t_belief_interval_only_unit_range_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0001 | 0.727 |
| RANG-0002 | RANG-0001 | RANG-0005 | 281.42 |
| RANG-0003 | RANG-0001 | RANG-0007 | 343.70 |
| RANG-0004 | RANG-0002 | RANG-0001 | 0.788 |
| RANG-0005 | RANG-0002 | RANG-0005 | 676.76 |
| RANG-0006 | RANG-0002 | RANG-0007 | 95.73 |
| RANG-0007 | RANG-0003 | RANG-0001 | 0.294 |
| RANG-0008 | RANG-0003 | RANG-0005 | 403.37 |

**t_belief_interval_only_unit_range_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0002 | Dimension Kind 01 |
| RANG-0002 | RANG-0001 | RANG-0008 | Encoding 02 |
| RANG-0003 | RANG-0001 | RANG-0009 | change rationale |
| RANG-0004 | RANG-0001 | RANG-0010 | fr |
| RANG-0005 | RANG-0001 | RANG-0003 | hybrid |
| RANG-0006 | RANG-0001 | RANG-0006 | ms |
| RANG-0007 | RANG-0002 | RANG-0002 | Dimension Kind 07 |
| RANG-0008 | RANG-0002 | RANG-0008 | Encoding 08 |

The attestation layer sits atop both the event and belief structures, providing a formal mechanism for asserting claims with quantified confidence and uncertainty. Each attestation record carries an identifier—CLAI-0001 through CLAI-0004—and references another attestation through the `attestation_key` column, enabling chains of dependency where one claim substantiates another. The confidence values range from 0.051 to 0.987, capturing the full spectrum from near-total skepticism to near-certainty, while the uncertainty values—91.51, 986.76, 606.80, 859.08—quantify the margin of error in absolute terms. The `value` column holds the asserted quantity itself, with figures such as 571.54, 362.06, 96.81, and 16.44 representing the specific claims under evaluation. The `dim_attestation` table provides the categorical taxonomy for these claims, assigning each attestation a label—"Attestation Label 01" through "Attestation Label 04"—and a category—"Attestation Category 01" through "Attestation Category 04"—that determines its governance treatment and the evidentiary standards against which it is assessed.

**fact_attestation**

| id | attestation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 0.051 | 91.51 | 571.54 |
| CLAI-0002 | CLAI-0001 | 0.840 | 986.76 | 362.06 |
| CLAI-0003 | CLAI-0003 | 0.482 | 606.80 | 96.81 |
| CLAI-0004 | CLAI-0004 | 0.987 | 859.08 | 16.44 |
| CLAI-0005 | CLAI-0003 | 0.738 | 864.19 | 799.64 |

**dim_attestation**

| id | attestation_label | attestation_category |
| --- | --- | --- |
| CLAI-0001 | Attestation Label 01 | Attestation Category 01 |
| CLAI-0002 | Attestation Label 02 | Attestation Category 02 |
| CLAI-0003 | Attestation Label 03 | Attestation Category 03 |
| CLAI-0004 | Attestation Label 04 | Attestation Category 04 |
| CLAI-0005 | Attestation Label 05 | Attestation Category 05 |
| CLAI-0006 | Attestation Label 06 | Attestation Category 06 |