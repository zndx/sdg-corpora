---
chapter_id: ch_live_kernelhook_with_hook_kind_6afec4
topic_id: 65
family: 04_ebpf_kernel
cited_terms: ['kernelhook_with_hook_kind', 'ebpf_event_for_syscall', 'attribute_set_max_attrs']
model: engine-refine
---

The foundational architecture for observability data relies on a disciplined separation between structural metadata and runtime values, where each entity is anchored by a unique identifier and classified through categorical dimensions. An identifier such as KIND-0001 or SYSC-0001 serves as the immutable primary key for a record, while the entity column in value tables references that identifier to establish which observation a measurement belongs to. Attributes are defined with a name and an attribute type drawn from an XML Schema namespace—xsd:decimal for duration_seconds at 5668.45, xsd:dateTime for end_time recorded as 2025-06-18T16:09:11, xsd:integer for exit_code with values like 7 and 420, and xsd:string for host_name carrying identifiers such as node-a01. This type discipline ensures that value storage is partitioned into dedicated tables by type, preventing the null-waste and type-coercion errors that plague denormalized designs.

**t_ebpf_event_for_syscall**

| id | ebpf | for_syscall |
| --- | --- | --- |
| SYSC-0001 | node-exporter | mmap |
| SYSC-0002 | node-exporter | openat |
| SYSC-0003 | systemd | connect |
| SYSC-0004 | promtail | bind |
| SYSC-0005 | sshd | read |
| SYSC-0006 | nginx | openat |

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

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

**t_attribute_set_max_attrs_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

The hook kind dimension provides a categorical taxonomy for kernel-level instrumentation points. Each hook kind identifier, ranging from KIND-0001 through KIND-0004, carries a human-readable label—Hook Kind Label 01, Hook Kind Label 02—and is assigned to a category such as Hook Kind Category 01 or Hook Kind Category 02. The fact table for kernel hooks links back to this dimension via a hook_kind_key foreign key, and records the size in bytes of the associated hook payload, which spans from 36,342,735 bytes for KIND-0001 to 560,962,979 bytes for KIND-0002, alongside a version number that tracks schema evolution across revisions 1, 3, and 10. This version column is critical for backward compatibility: when a hook definition changes, the version number allows consumers to select the appropriate schema without ambiguity.

**fact_kernelhook**

| id | hook_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| KIND-0001 | KIND-0002 | 36342735 | 3 |
| KIND-0002 | KIND-0004 | 560962979 | 1 |
| KIND-0003 | KIND-0007 | 456299832 | 10 |
| KIND-0004 | KIND-0004 | 272822846 | 1 |

Attribute sets extend this pattern beyond kernel hooks into domain-specific measurement collections. An attribute set such as ATTR-0001, labeled voltage_dc, groups related attributes under a single semantic umbrella. Within that set, individual attributes carry names like confidence, dimension_kind, method, and recorded_at, each typed as xsd:decimal, xsd:string, or xsd:dateTime. The recorded_at attribute, for instance, stores timestamps such as 2024-07-05T18:39:47 or 2025-03-29T09:43:13, providing a temporal anchor for when a measurement was captured. Decimal values within the same set—0.687, 125.69, 391.05, 0.041—demonstrate the range of precision that the xsd:decimal type accommodates, while varchar values like Dimension Kind 01, Encoding 02, audit excerpt, and de capture free-form metadata that does not fit numeric or temporal categories.

The misc column, appearing across all value tables, holds the actual measurement data and is typed implicitly by the table in which it resides. A datetime value table stores ISO 8601 timestamps, a decimal table stores floating-point numbers, an integer table stores whole numbers, and a varchar table stores character strings. The entity_id and attr_id columns in each value table form a composite foreign key that references the entity and attribute definitions, ensuring referential integrity between the value and its schema. For example, the entity SYSC-0001, which maps the ebpf probe node-exporter to the syscall mmap, has a duration_seconds attribute (attr_id SYSC-0001) with a decimal value of 5668.45, while the same entity carries an exit_code (attr_id SYSC-003) with an integer value of 7 and a host_name (attr_id SYSC-004) with the varchar value node-a01. This multi-table value storage pattern, while verbose, guarantees type safety and enables efficient range queries on numeric columns without the overhead of parsing strings.

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

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

Category and hook kind classifications provide the analytical dimensions that transform raw measurements into actionable telemetry. When a hook kind is assigned to Hook Kind Category 01, all associated kernel events inherit that category, enabling aggregation and filtering at the category level without inspecting individual hook definitions. The size_bytes column in the kernel hook fact table—values such as 272,822,846 for KIND-0004—serves as a capacity planning metric, allowing operators to estimate memory footprints for hook instrumentation at scale. Together, the identifier, attribute type, category, entity, hook kind, misc, size bytes, and version columns form a coherent schema that balances normalization for integrity with type-specific storage for performance, a design that scales to millions of observations while preserving the ability to audit every value against its defining schema.

**dim_hook_kind**

| id | hook_kind_label | hook_kind_category |
| --- | --- | --- |
| KIND-0001 | Hook Kind Label 01 | Hook Kind Category 01 |
| KIND-0002 | Hook Kind Label 02 | Hook Kind Category 02 |
| KIND-0003 | Hook Kind Label 03 | Hook Kind Category 03 |
| KIND-0004 | Hook Kind Label 04 | Hook Kind Category 04 |
| KIND-0005 | Hook Kind Label 05 | Hook Kind Category 05 |
| KIND-0006 | Hook Kind Label 06 | Hook Kind Category 06 |
| KIND-0007 | Hook Kind Label 07 | Hook Kind Category 07 |