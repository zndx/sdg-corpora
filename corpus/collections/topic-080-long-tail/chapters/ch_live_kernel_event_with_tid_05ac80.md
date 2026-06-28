---
chapter_id: ch_live_kernel_event_with_tid_05ac80
topic_id: 80
family: 07_long_tail
cited_terms: ['kernel_event_with_tid', 'lift_subclass', 'policy_enforced_by']
model: engine-refine
---

In a typed attribute–value governance model, every recordable fact is anchored by an identifier that remains stable across ingestion, reconciliation, and audit. Identifiers such as TID-0001, LIFT-0003, and ENFO-0004 function as durable handles: they do not denote the semantic content of a kernel execution, a lift subclass, or a policy enforcement binding, but they permit unambiguous reference when the same logical object is observed under ZFS on Linux, Darwin 22.4.0, FreeBSD 13.2, or Linux 5.15.0, or when it is classified under Elevator-Controller-22, Data-Migration-7B, Sample-Handler-14, or Conveyor-Lift-42. Without such keys, cross-environment correlation of duration_seconds, exit_code, and host_name readings would collapse into ambiguous text; with them, an auditor can assert that TID-0001 and TID-0002 are distinct kernel-event instances even when both carry duration_seconds values (5060.73 and 6983.04) drawn from the same attribute definition.

**t_kernel_event_with_tid**

| id | kernel | with_thread_id |
| --- | --- | --- |
| TID-0001 | ZFS on Linux | LIFT-0003 |
| TID-0002 | Darwin 22.4.0 | LIFT-0006 |
| TID-0003 | FreeBSD 13.2 | LIFT-0001 |
| TID-0004 | Linux 5.15.0 | LIFT-0002 |
| TID-0005 | ZFS on Linux | LIFT-0003 |
| TID-0006 | Red Hat 4.18 | LIFT-0006 |

**t_kernel_event_with_tid_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TID-0001 | duration_seconds | xsd:decimal |
| TID-0002 | end_time | xsd:dateTime |
| TID-0003 | exit_code | xsd:integer |
| TID-0004 | host_name | xsd:string |
| TID-0005 | log_level | xsd:string |
| TID-0006 | phase | xsd:string |
| TID-0007 | retry_count | xsd:integer |
| TID-0008 | scheduled_at | xsd:dateTime |

**t_lift_subclass**

| id | lift | of_attribute_set |
| --- | --- | --- |
| LIFT-0001 | Elevator-Controller-22 | TID-0001 |
| LIFT-0002 | Data-Migration-7B | TID-0002 |
| LIFT-0003 | Sample-Handler-14 | TID-0006 |
| LIFT-0004 | Conveyor-Lift-42 | TID-0001 |
| LIFT-0005 | Telemetry-Relay-8F | TID-0003 |
| LIFT-0006 | Elevator-Controller-22 | TID-0005 |

**t_lift_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO27001 Encryption |
| ENFO-0002 | CCPA Data Deletion |
| ENFO-0003 | PCI-DSS Tokenization |
| ENFO-0004 | FINRA Record Retention |
| ENFO-0005 | FINRA Record Retention |
| ENFO-0006 | HIPAA Audit Trail |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

An entity is the object to which attributes attach—the bearer of state in the operational record. In practice, entity_id ties each stored value back to the instance under measurement: multiple datetime facts for TID-0001 (2025-02-14T18:33:06, 2024-07-20T10:27:40, 2024-06-11T20:07:21) all reference the same entity while differing in attr_id, demonstrating that one kernel event accumulates several temporal and categorical observations without conflating them. The lift subclass domain exhibits the same pattern: LIFT-0001 carries confidence 0.387, dimension_kind “Dimension Kind 01”, method “Encoding 02”, and recorded_at 2023-07-08T17:11:17 as separate assertions about a single Elevator-Controller-22 entity. Entity boundaries therefore delimit accountability: compliance queries ask not merely “what value was recorded?” but “which identifiable instance owned that value at the time of enforcement.”

Attributes and attribute types form the controlled vocabulary and typing contract that make entity state machine-readable and legally defensible. An attr (whether named duration_seconds, end_time, exit_code, host_name, confidence, or dimension_kind) declares the semantic slot; attr_type (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) declares how that slot may be populated and which validation and storage partition applies. Duration readings map to decimal partitions (363.99 through 6644.72), exit codes to integer partitions (883, 384, 644, 289), host identifiers and operational labels to varchar partitions (gw-12, Log Level 02, review, running), and temporal endpoints to datetime partitions. This separation matters because governance frameworks treat type discipline as a control: a host_name cannot silently absorb an exit_code, and a recorded_at timestamp cannot be substituted for a confidence score without violating the declared attr_type contract that downstream SIEM rules, retention policies, and audit boards rely upon.

The misc designation marks the payload—the instantiated value held in a typed value store once entity, attr, and attr_type have been resolved. Misc is not miscellaneous in the colloquial sense; it is the evidence residue of an attribute assertion, the concrete datum an investigator retrieves when ISO27001 Encryption, CCPA Data Deletion, PCI-DSS Tokenization, or FINRA Record Retention obligations require proof of what was known at a point in time. When LIFT-0003 records intake form and en alongside Sample-Handler-14, or when TID-0001 records running as an operational state, those misc values become the auditable facts; the surrounding identifier graph explains who said what, about whom, under which type rule. Operational guides therefore instruct collectors to preserve misc integrity: truncation, implicit casting, or commingling of differently typed misc stores breaks the chain from raw telemetry to enforceable attestation.

Subject, target, and role articulate directed relationships among identified objects, especially where policy enforcement is delegated across tools and accountable parties. In enforcement bindings, the subject (policy_id) names the obligation or control frame—ENFO-0001 for ISO27001 Encryption, ENFO-0002 for CCPA Data Deletion—while the target (enforced_by_id) names the mechanism or authority charged with observing or operating that control, such as Splunk SIEM, the ISO Audit Board, or AWS Config Rules. Role qualifies the nature of that charge: observer, reviewer, or owner. A single target may serve multiple subjects under different roles, as when AWS Config Rules appears as reviewer for PCI-DSS Tokenization and owner for FINRA Record Retention, or when Splunk SIEM observes ISO27001 Encryption while also participating in other enforcement paths. These triples prevent symmetric ambiguity: compliance is not “policy near tool” but “this subject is enforced by that target in this capacity,” a distinction material when FINRA retention demands owner accountability whereas PCI tokenization may require independent review.

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role constitute the minimum interoperable grammar for cross-domain evidence management. Kernel events bound to lift subclasses through with_thread_id and of_attribute_set linkages (LIFT-0003 on TID-0003, LIFT-0006 on TID-0002) show how identifiers compose across layers without collapsing entity boundaries: the kernel records duration and exit_code for TID-0001 while the associated lift subclass supplies confidence and recorded_at for LIFT-0001. Policy enforcement overlays the same grammar onto regulatory objects, ensuring that telemetry, classification metadata, and control assignments share a common referential discipline. Practitioners who master these primitives can trace a decimal misc value back to its attr and entity, lift that entity into a subclass context, and simultaneously read which subject–target–role tuple governs its retention or review—an end-to-end chain that transforms isolated table entries into an operational compliance narrative without sacrificing the precision the framework demands.

**t_kernel_event_with_tid_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0002 | 2025-02-14T18:33:06 |
| TID-0002 | TID-0001 | TID-0008 | 2024-07-20T10:27:40 |
| TID-0003 | TID-0001 | TID-0009 | 2024-06-11T20:07:21 |
| TID-0004 | TID-0002 | TID-0002 | 2025-04-06T19:50:52 |
| TID-0005 | TID-0002 | TID-0008 | 2025-02-15T21:22:11 |
| TID-0006 | TID-0002 | TID-0009 | 2024-07-12T03:26:24 |
| TID-0007 | TID-0003 | TID-0002 | 2024-05-24T01:52:05 |
| TID-0008 | TID-0003 | TID-0008 | 2023-12-06T07:40:08 |

**t_kernel_event_with_tid_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0001 | 5060.73 |
| TID-0002 | TID-0002 | TID-0001 | 6983.04 |
| TID-0003 | TID-0003 | TID-0001 | 363.99 |
| TID-0004 | TID-0004 | TID-0001 | 6644.72 |
| TID-0005 | TID-0005 | TID-0001 | 5301.35 |
| TID-0006 | TID-0006 | TID-0001 | 4668.07 |

**t_kernel_event_with_tid_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0003 | 883 |
| TID-0002 | TID-0001 | TID-0007 | 384 |
| TID-0003 | TID-0002 | TID-0003 | 644 |
| TID-0004 | TID-0002 | TID-0007 | 289 |
| TID-0005 | TID-0003 | TID-0003 | 158 |
| TID-0006 | TID-0003 | TID-0007 | 165 |
| TID-0007 | TID-0004 | TID-0003 | 803 |
| TID-0008 | TID-0004 | TID-0007 | 36 |

**t_kernel_event_with_tid_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0004 | gw-12 |
| TID-0002 | TID-0001 | TID-0005 | Log Level 02 |
| TID-0003 | TID-0001 | TID-0006 | review |
| TID-0004 | TID-0001 | TID-0010 | running |
| TID-0005 | TID-0001 | TID-0011 | Triggered By 05 |
| TID-0006 | TID-0002 | TID-0004 | node-b14 |
| TID-0007 | TID-0002 | TID-0005 | Log Level 07 |
| TID-0008 | TID-0002 | TID-0006 | execution |

**t_lift_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2023-07-08T17:11:17 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-09-30T16:47:04 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-05-04T22:26:39 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2023-07-25T13:54:30 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-12T01:02:41 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2024-03-06T23:43:02 |

**t_lift_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.387 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 587.63 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 57.65 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.879 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 736.98 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 707.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.901 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 70.32 |

**t_lift_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | intake form |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | en |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |