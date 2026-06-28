---
chapter_id: ch_live_policy_with_jurisdiction_f7b5b2
topic_id: 2
family: 03_directive_governance
cited_terms: ['policy_with_jurisdiction', 'metric_emission_subclass', 'kernelhook_only_kprobe']
model: engine-refine
---

In compliance and governance frameworks, the management of heterogeneous attribute data demands a disciplined separation between schema definition and value storage. The identifier column serves as the primary key across all entity tables, anchoring records with machine-readable codes such as JURI-0001, EMIS-0001, and KPRO-0001. These identifiers propagate through the data model as foreign keys, establishing referential integrity between entity definitions, their attribute schemas, and the actual values assigned to those attributes. The attr column names the attribute being described—effective_date, enforcement, mandatory, priority, duration_seconds, exit_code, host_name—while attr_type declares the XML Schema datatype governing its representation, ranging from xsd:date and xsd:dateTime through xsd:boolean, xsd:integer, xsd:decimal, and xsd:string. This type-level discipline ensures that value validation occurs at the schema layer before any value is persisted.

The value storage strategy employs type-dispatched tables, each dedicated to a single attr_type, with the entity column referencing the identifier of the record to which the value belongs and the attr_id column pointing to the corresponding attribute definition. For policy-with-jurisdiction records, the mandatory attribute (JURI-0003) is stored as a boolean, yielding values of true for JURI-0003 and false for JURI-0001, JURI-0002, and JURI-0004; the effective_date attribute (JURI-0001) carries xsd:date values such as 2023-11-22, 2024-05-18, 2025-06-18, and 2023-05-18; and the priority attribute (JURI-0004) stores xsd:integer values including 4 and 1. The varchar dispatch table captures free-form attribute values—Encoding 01, Enforcement 02, intake form, ja—assigned to attributes JURI-0007, JURI-0002, JURI-0008, and JURI-0009 respectively. This same pattern recurs for metric emission subclass entities, where decimal values such as 1381.85, 954.50, 5476.70, and 3136.71 populate the duration_seconds attribute (EMIS-0001), integer values 204, 449, 526, and 447 fill exit_code (EMIS-0003), and string values node-a01, Log Level 02, execution, and complete populate host_name and other varchar attributes.

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Financial Conduct Authority | EMIS-0005 |
| JURI-0002 | European Union | EMIS-0002 |
| JURI-0003 | European Union | EMIS-0002 |
| JURI-0004 | FISMA | EMIS-0001 |
| JURI-0005 | California Attorney General | EMIS-0007 |
| JURI-0006 | Federal Trade Commission | EMIS-0007 |

**t_policy_with_jurisdiction_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| JURI-0001 | effective_date | xsd:date |
| JURI-0002 | enforcement | xsd:string |
| JURI-0003 | mandatory | xsd:boolean |
| JURI-0004 | priority | xsd:integer |
| JURI-0005 | review_cycle_days | xsd:integer |
| JURI-0006 | scope | xsd:string |
| JURI-0007 | encoding | xsd:string |
| JURI-0008 | label_text | xsd:string |

**t_policy_with_jurisdiction_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0003 | false |
| JURI-0002 | JURI-0002 | JURI-0003 | false |
| JURI-0003 | JURI-0003 | JURI-0003 | true |
| JURI-0004 | JURI-0004 | JURI-0003 | false |
| JURI-0005 | JURI-0005 | JURI-0003 | false |
| JURI-0006 | JURI-0006 | JURI-0003 | true |

**t_policy_with_jurisdiction_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0001 | 2023-11-22 |
| JURI-0002 | JURI-0002 | JURI-0001 | 2024-05-18 |
| JURI-0003 | JURI-0003 | JURI-0001 | 2025-06-18 |
| JURI-0004 | JURI-0004 | JURI-0001 | 2023-05-18 |
| JURI-0005 | JURI-0005 | JURI-0001 | 2025-03-17 |
| JURI-0006 | JURI-0006 | JURI-0001 | 2024-10-08 |

**t_policy_with_jurisdiction_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0007 | Encoding 01 |
| JURI-0002 | JURI-0001 | JURI-0002 | Enforcement 02 |
| JURI-0003 | JURI-0001 | JURI-0008 | intake form |
| JURI-0004 | JURI-0001 | JURI-0009 | ja |
| JURI-0005 | JURI-0001 | JURI-0006 | Scope 05 |
| JURI-0006 | JURI-0002 | JURI-0007 | Encoding 06 |
| JURI-0007 | JURI-0002 | JURI-0002 | Enforcement 07 |
| JURI-0008 | JURI-0002 | JURI-0008 | change rationale |

**t_metric_emission_subclass**

| id | metric | emits_metric |
| --- | --- | --- |
| EMIS-0001 | garbage_collection_pause | JURI-0006 |
| EMIS-0002 | api_throughput | JURI-0002 |
| EMIS-0003 | memory_utilization | JURI-0001 |
| EMIS-0004 | bytes_transferred | JURI-0001 |
| EMIS-0005 | active_connections | JURI-0003 |
| EMIS-0006 | memory_utilization | JURI-0006 |
| EMIS-0007 | disk_io_wait | JURI-0002 |

**t_metric_emission_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EMIS-0001 | duration_seconds | xsd:decimal |
| EMIS-0002 | end_time | xsd:dateTime |
| EMIS-0003 | exit_code | xsd:integer |
| EMIS-0004 | host_name | xsd:string |
| EMIS-0005 | log_level | xsd:string |
| EMIS-0006 | phase | xsd:string |
| EMIS-0007 | retry_count | xsd:integer |
| EMIS-0008 | scheduled_at | xsd:dateTime |

**t_metric_emission_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0001 | 1381.85 |
| EMIS-0002 | EMIS-0002 | EMIS-0001 | 954.50 |
| EMIS-0003 | EMIS-0003 | EMIS-0001 | 5476.70 |
| EMIS-0004 | EMIS-0004 | EMIS-0001 | 3136.71 |
| EMIS-0005 | EMIS-0005 | EMIS-0001 | 6003.14 |
| EMIS-0006 | EMIS-0006 | EMIS-0001 | 3720.68 |
| EMIS-0007 | EMIS-0007 | EMIS-0001 | 2471.19 |

**t_metric_emission_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0004 | node-a01 |
| EMIS-0002 | EMIS-0001 | EMIS-0005 | Log Level 02 |
| EMIS-0003 | EMIS-0001 | EMIS-0006 | execution |
| EMIS-0004 | EMIS-0001 | EMIS-0010 | complete |
| EMIS-0005 | EMIS-0001 | EMIS-0011 | Triggered By 05 |
| EMIS-0006 | EMIS-0002 | EMIS-0004 | worker-07 |
| EMIS-0007 | EMIS-0002 | EMIS-0005 | Log Level 07 |
| EMIS-0008 | EMIS-0002 | EMIS-0006 | execution |

The entity column in each value table functions as the foreign key binding a misc value back to its parent record, while the attr_id column resolves the attribute definition from the schema table. This two-key join—entity plus attr—uniquely identifies a single value within a type-specific table. A single entity may thus carry multiple attributes of different types, each resolved through its own dispatch table. The policy-with-jurisdiction entity JURI-0001, for instance, simultaneously references a boolean value in t_policy_with_jurisdiction_val_boolean, a date value in t_policy_with_jurisdiction_val_date, an integer value in t_policy_with_jurisdiction_val_int, and a varchar value in t_policy_with_jurisdiction_val_varchar, each through a distinct attr_id. The metric emission entity EMIS-0001 follows the same pattern, carrying decimal, integer, and varchar values across its respective dispatch tables.

The relationship between kernel hooks and hook kinds introduces a ternary association table that models the role column as the semantic glue between subject and target. In t_kernelhook_only_kprobe__hook_kind, the kernelhook_id column identifies the subject—the kernel hook being classified, such as KPRO-0002 (kfree) or KPRO-0004 (vfs_read)—while hook_kind_id identifies the target—the hook kind to which the subject is assigned, such as KPRO-0005 or KPRO-0002. The role column then specifies the nature of the assignment: owner, contributor, or reviewer. This three-column structure (subject, target, role) generalizes the binary foreign-key relationship into a typed association, enabling a single kernel hook to participate in multiple relationships with different roles and a single hook kind to be associated with multiple subjects. The identifiers KPRO-0001 through KPRO-0006 appear across the kernel hook entity table, its hook kind table, and this junction table, forming a closed referential graph.

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

Across all three entity families—policy-with-jurisdiction, metric emission subclass, and kernel hook—the same structural principles apply. An identifier uniquely names each entity. An attr table defines the attribute schema with name and type. Type-specific value tables store the misc values, each keyed by entity and attr. Where relationships require semantic labeling, a junction table introduces subject, target, and role columns. This architecture supports extensibility: new attributes require only a row in the attr table and a value in the appropriate dispatch table, without schema migration. It also enforces type safety at the database level, since each value table accepts only its declared attr_type. The result is a governance data model that scales across regulatory domains, operational metrics, and system-level hooks while maintaining a uniform, auditable structure.

**t_policy_with_jurisdiction_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0004 | 4 |
| JURI-0002 | JURI-0001 | JURI-0005 | 326 |
| JURI-0003 | JURI-0002 | JURI-0004 | 1 |
| JURI-0004 | JURI-0002 | JURI-0005 | 210 |
| JURI-0005 | JURI-0003 | JURI-0004 | 2 |
| JURI-0006 | JURI-0003 | JURI-0005 | 496 |
| JURI-0007 | JURI-0004 | JURI-0004 | 2 |
| JURI-0008 | JURI-0004 | JURI-0005 | 607 |

**t_metric_emission_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0002 | 2023-10-31T14:37:44 |
| EMIS-0002 | EMIS-0001 | EMIS-0008 | 2024-08-14T22:51:22 |
| EMIS-0003 | EMIS-0001 | EMIS-0009 | 2023-09-21T19:46:28 |
| EMIS-0004 | EMIS-0002 | EMIS-0002 | 2024-10-02T07:51:18 |
| EMIS-0005 | EMIS-0002 | EMIS-0008 | 2023-02-02T08:38:58 |
| EMIS-0006 | EMIS-0002 | EMIS-0009 | 2024-11-30T14:13:18 |
| EMIS-0007 | EMIS-0003 | EMIS-0002 | 2023-11-21T22:47:51 |
| EMIS-0008 | EMIS-0003 | EMIS-0008 | 2023-01-18T00:53:02 |

**t_metric_emission_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0003 | 204 |
| EMIS-0002 | EMIS-0001 | EMIS-0007 | 449 |
| EMIS-0003 | EMIS-0002 | EMIS-0003 | 526 |
| EMIS-0004 | EMIS-0002 | EMIS-0007 | 447 |
| EMIS-0005 | EMIS-0003 | EMIS-0003 | 729 |
| EMIS-0006 | EMIS-0003 | EMIS-0007 | 20 |
| EMIS-0007 | EMIS-0004 | EMIS-0003 | 636 |
| EMIS-0008 | EMIS-0004 | EMIS-0007 | 481 |