---
chapter_id: ch_live_requirement_applies_to_system_7d5213
topic_id: 2
family: 03_directive_governance
cited_terms: ['requirement_applies_to_system', 'control_with_evidence_requirement', 'ebpf_event_min_one_attribute']
model: engine-refine
---

When governing technical systems, the binding of a requirement to an operational entity is never a bare assertion; it is a structured proposition enriched by attributes that carry type, value, and temporal scope. A requirement such as latency under 50ms or encryption at rest does not stand alone—it is attached to a system identifier like SYST-0001 or SYST-0002, and the attachment itself is qualified by metadata attributes whose names (effective_date, enforcement, mandatory, priority) and types (xsd:date, xsd:string, xsd:boolean, xsd:integer) are declared in a schema table that governs the entire attribute vocabulary. The attribute type is not merely a data annotation; it is a constraint that determines how values are validated, stored, and compared across the compliance fabric. A boolean attribute such as mandatory resolves to true or false—SYST-0001 carries a false, while SYST-0002 and SYST-0003 carry true—signaling whether the requirement is optional or compulsory for that entity. A date attribute resolves to an xsd:date such as 2025-05-21 or 2023-08-26, anchoring the requirement to a point in its lifecycle, and an integer attribute resolves to a numeric value such as 1, 391, 5, or 295, which may encode priority levels or thresholds.

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

The enforcement dimension introduces a further layer of governance: a requirement is not only defined but classified by its enforcement posture, which determines the consequences of non-compliance. In the control registry, enforcement values such as deprecated, advisory, and mandatory appear alongside the control name—DataEncryptionAtRest, BaselineConfigurationCheck—and the evidence artifact that must be produced, whether SystemAuditLog, ISO27001Certification, or ManagerApprovalEmail. The enforcement classification is itself an attribute, stored as an xsd:string, and it operates in concert with the mandatory boolean to produce a two-dimensional compliance signal: a requirement may be marked mandatory in its attribute table yet classified as advisory in its control definition, a tension that governance frameworks must resolve through policy interpretation. The language attribute, stored as a varchar and taking values such as en, es, or ja, further localizes the requirement to a jurisdictional or organizational context, ensuring that the same control can be deployed across multilingual environments without semantic drift.

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | ISO27001Certification | advisory | es |
| REQU-0003 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | ManagerApprovalEmail | mandatory | ja |

The entity-to-attribute relationship is realized through a value-resolution mechanism that separates the attribute definition from its concrete instantiation. The attribute schema table declares that an attribute named mandatory has type xsd:boolean, but the actual boolean values—false, true, true, false—are stored in a dedicated value table keyed by entity_id and attr_id, forming a composite identifier that ties a specific requirement to a specific attribute on a specific system. Similarly, date values such as 2024-05-05T15:51:23 or 2023-02-23T16:05:24 are resolved through entity_id and attr_id pairs in a datetime value table, while decimal values like 2938.76, 3337.03, 6550.82, and 5328.03 are resolved through a parallel decimal value table. This normalization ensures that the attribute vocabulary is defined once and referenced everywhere, while the values are free to vary per entity without schema modification.

In the eBPF event domain, the same attribute-value pattern applies to runtime telemetry rather than policy requirements. An event type such as perf_event_sample or xdp_rx_drop is associated with attributes like duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string), each resolved through the same entity-attr-value triad. The host_name attribute resolves to values such as node-b14, while the exit_code resolves to integers like 465 or 938, and the duration_seconds resolves to decimals like 2938.76 or 6550.82. The end_time attribute resolves to xsd:dateTime values such as 2023-08-09T05:49:50 or 2023-10-25T19:35:09, anchoring the event to a precise moment in the system's execution timeline. The identifier for each event—ATTR-0001, ATTR-0002, ATTR-0003, ATTR-0004—serves as the primary key that ties the event type to its attribute schema and, transitively, to the resolved values.

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

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

The misc category captures string-valued attributes that do not fit into the typed buckets of boolean, date, integer, or decimal. These varchar values—Encoding 01, Enforcement 02, audit excerpt, fr, Log Level 02, initiation, pending—serve as free-form descriptors, status indicators, or localization tags that complement the structured attributes. They are stored in a dedicated varchar value table, keyed by entity_id and attr_id, and they provide the flexibility needed for attributes whose values are not constrained to a rigid type. The attr_name column in the attribute schema table assigns a semantic label such as host_name or end_time, while the attr_type column assigns the XSD type that governs validation; the value tables then hold the actual data, and the entity_id column ties each value back to the system or event that it describes. This three-table pattern—schema, typed values, and entity linkage—forms the backbone of the attribute system, enabling requirements, controls, and telemetry events to carry rich, typed, and queryable metadata without sacrificing normalization or referential integrity.