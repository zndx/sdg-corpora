---
chapter_id: ch_live_ebpfmap_with_value_type_b0539f
topic_id: 183
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_value_type', 'intermediate_floor_assembly', 'ebpfevent_at_kernel_hook_xref']
model: engine-refine
---

The foundation of the event-tracking architecture rests on a disciplined separation between structural metadata and runtime attribute values, each anchored by a unique identifier that propagates across relational boundaries. Every entity—whether an eBPF map, a kernel hook cross-reference, or a floor assembly—carries an identifier such as TYPE-0001 or XREF-0001 that serves as the immutable key through which all downstream relationships resolve. These identifiers are not merely row labels; they are the join keys that bind the dimensional catalog of value type maps to the factual records of eBPF map instances, where each map instance carries a type map key like TYPE-0002 to reference its classification, a size in bytes such as 208979093 or 354373995 to declare its memory footprint, and a version number—3, 6, 12, or 5—to track schema evolution. The version field is critical for backward compatibility, ensuring that consumers of eBPF map data can validate that the structural layout they expect matches the layout the map was compiled against.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

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

Attribute definitions and their typed values form the second pillar of the architecture, decoupling schema from data to support heterogeneous value storage. Each attribute—identified by its own identifier such as XREF-0001 through XREF-0004—carries a name like duration_seconds, end_time, exit_code, or host_name, and is assigned a type from the XML Schema Definition namespace: xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. This type annotation dictates which value table holds the actual data for that attribute. Decimal-valued attributes such as duration_seconds store measurements like 6431.54 or 1550.57 in the decimal value table; integer-valued attributes like exit_code hold whole numbers such as 571 or 436 in the integer value table; datetime attributes such as end_time carry timestamps like 2023-05-01T02:25:15 or 2025-02-12T09:55:43 in the datetime value table; and string-valued attributes like host_name store text such as node-b14 or execution in the varchar value table. The entity_id column in each value table references the cross-reference identifier, creating a many-to-one relationship where a single entity can have multiple typed attributes stored across different tables.

The value type map dimension provides the categorical taxonomy that organizes how data types are classified and labeled across the system. Each entry in this dimension—identified by a type map key like TYPE-0001 through TYPE-0004—carries a human-readable label such as Value Type Map Label 01 and a category designation like Value Type Map Category 01. These categories serve as the grouping mechanism for value type maps, enabling aggregation and filtering at the classification level rather than the individual type level. When an eBPF map fact record references a type map key, it implicitly inherits the category and label from the dimension, allowing analysts to reason about map sizes and versions within the context of their type classification. The category field is particularly important for governance, as it establishes the data stewardship boundaries for each class of value type.

Beyond the eBPF event domain, the same identifier-driven relational pattern extends to physical assembly tracking, where the intermediate floor assembly table records structural components and their associated lateral restraint straps. An assembly identified as ASSE-0001 might represent the Gearbox Intermediate Shelf and contain a Retaining Clip as its lateral restraint component, while ASSE-0002 corresponds to the Motor Mount Deck with a Locking Clevis. The intermediate floor assembly column names the physical structure, and the lateral restraint strap column identifies the specific restraint mechanism—whether a Shear Pin Assembly, Damping Mount, or other component—that secures it. This parallel structure demonstrates how the identifier-attr-entity-value pattern is not confined to a single domain but is a reusable modeling idiom applied across both software observability and physical infrastructure tracking.

**t_intermediate_floor_assembly**

| id | intermediate_floor_assembly | contains_component |
| --- | --- | --- |
| ASSE-0001 | Gearbox Intermediate Shelf | Retaining Clip |
| ASSE-0002 | Motor Mount Deck | Locking Clevis |
| ASSE-0003 | Wing Spar Floor | Shear Pin Assembly |
| ASSE-0004 | Motor Mount Deck | Damping Mount |

The cross-reference table linking eBPF events to kernel hooks—where identifiers like XREF-0001 map to events such as tracepoint_file_open or kprobe_do_execve—serves as the bridge between the event catalog and the attribute-value system. Each cross-reference row is the entity that the typed value tables reference, and its attributes are defined in the attribute definition table. This three-layer structure—event catalog, attribute schema, and typed value storage—ensures that the system can accommodate new event types and attributes without schema migrations, since the attribute definitions and their values are stored independently. The misc column, appearing in both the value type map dimension and the value tables, captures supplementary metadata that does not fit the primary classification schema, such as log levels or execution states, providing a catch-all for information that is relevant but not central to the typed attribute model.

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

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