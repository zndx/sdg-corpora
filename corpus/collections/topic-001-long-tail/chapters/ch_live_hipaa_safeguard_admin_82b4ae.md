---
chapter_id: ch_live_hipaa_safeguard_admin_82b4ae
topic_id: 1
family: 07_long_tail
cited_terms: ['hipaa_safeguard_admin', 'ebpfprogram_attaches_kernelhook_xref', 'audit_targets_data_artifact']
model: engine-refine
---

Within compliance and systems governance frameworks, the structural vocabulary of identifier, entity, attribute, attribute type, and value forms the backbone of metadata management. An identifier serves as the immutable key for every record—ADMI-0001 through ADMI-0004 for HIPAA safeguard entries, XREF-0001 through XREF-0004 for eBPF program–kernel hook cross-references, and ARTI-0001 through ARTI-0004 for audit targets data artifacts—each prefixed to signal its domain context. The entity represents the governed object itself: a Privacy Rule safeguard, a dns_query_parser program, or a Cloud-Bucket-Encryption audit. Rather than embedding every property directly into the entity table, the model delegates properties to an attribute definition layer where attr_name and attr_type declare what can be measured and in what form. Thus, the HIPAA safeguard entity carries attributes such as effective_date typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer; the eBPF cross-reference entity carries checksum and license as xsd:string, created_date as xsd:date, and identifier as cco:DesignativeICE; the audit artifact entity carries duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This separation of schema from instance permits heterogeneous property sets across entity types without schema migration.

**t_ebpfprogram_attaches_kernelhook_xref**

| id | ebpfprogram |
| --- | --- |
| XREF-0001 | dns_query_parser |
| XREF-0002 | network_latency_tracker |
| XREF-0003 | block_io_monitor |
| XREF-0004 | tcp_retrans_monitor |
| XREF-0005 | tcp_retrans_monitor |
| XREF-0006 | syscall_trace_logger |

**t_ebpfprogram_attaches_kernelhook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | checksum | xsd:string |
| XREF-0002 | created_date | xsd:date |
| XREF-0003 | identifier | cco:DesignativeICE |
| XREF-0004 | license | xsd:string |
| XREF-0005 | mime_type | xsd:string |
| XREF-0006 | size_bytes | xsd:long |
| XREF-0007 | uri | xsd:string |
| XREF-0008 | version | xsd:integer |

**t_ebpfprogram_attaches_kernelhook_xref_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2025-04-17 |
| XREF-0002 | XREF-0002 | XREF-0002 | 2025-02-23 |
| XREF-0003 | XREF-0003 | XREF-0002 | 2025-06-16 |
| XREF-0004 | XREF-0004 | XREF-0002 | 2023-07-21 |
| XREF-0005 | XREF-0005 | XREF-0002 | 2024-01-20 |
| XREF-0006 | XREF-0006 | XREF-0002 | 2025-03-02 |

**t_ebpfprogram_attaches_kernelhook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0006 | 268 |
| XREF-0002 | XREF-0001 | XREF-0008 | 11 |
| XREF-0003 | XREF-0002 | XREF-0006 | 212 |
| XREF-0004 | XREF-0002 | XREF-0008 | 1 |
| XREF-0005 | XREF-0003 | XREF-0006 | 251 |
| XREF-0006 | XREF-0003 | XREF-0008 | 5 |
| XREF-0007 | XREF-0004 | XREF-0006 | 130 |
| XREF-0008 | XREF-0004 | XREF-0008 | 6 |

**t_audit_targets_data_artifact**

| id | audit |
| --- | --- |
| ARTI-0001 | Cloud-Bucket-Encryption |
| ARTI-0002 | SOC2-Q3-2023 |
| ARTI-0003 | API-Auth-Token-Rotation |
| ARTI-0004 | Vendor-Access-Assessment |
| ARTI-0005 | Cloud-Bucket-Encryption |
| ARTI-0006 | Model-Pipeline-Validation |

**t_audit_targets_data_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | duration_seconds | xsd:decimal |
| ARTI-0002 | end_time | xsd:dateTime |
| ARTI-0003 | exit_code | xsd:integer |
| ARTI-0004 | host_name | xsd:string |
| ARTI-0005 | log_level | xsd:string |
| ARTI-0006 | phase | xsd:string |
| ARTI-0007 | retry_count | xsd:integer |
| ARTI-0008 | scheduled_at | xsd:dateTime |

**t_audit_targets_data_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2024-12-01T01:08:20 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 2025-04-11T08:34:59 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | 2024-01-10T01:48:17 |
| ARTI-0004 | ARTI-0002 | ARTI-0002 | 2023-12-13T07:58:05 |
| ARTI-0005 | ARTI-0002 | ARTI-0008 | 2024-04-04T16:02:49 |
| ARTI-0006 | ARTI-0002 | ARTI-0009 | 2023-03-02T22:50:55 |
| ARTI-0007 | ARTI-0003 | ARTI-0002 | 2025-03-24T22:59:49 |
| ARTI-0008 | ARTI-0003 | ARTI-0008 | 2024-12-31T14:33:38 |

**t_audit_targets_data_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 4704.44 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2823.51 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 460.93 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 4764.85 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 3458.42 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 1214.20 |

**t_audit_targets_data_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | 102 |
| ARTI-0002 | ARTI-0001 | ARTI-0007 | 288 |
| ARTI-0003 | ARTI-0002 | ARTI-0003 | 803 |
| ARTI-0004 | ARTI-0002 | ARTI-0007 | 1 |
| ARTI-0005 | ARTI-0003 | ARTI-0003 | 425 |
| ARTI-0006 | ARTI-0003 | ARTI-0007 | 187 |
| ARTI-0007 | ARTI-0004 | ARTI-0003 | 75 |
| ARTI-0008 | ARTI-0004 | ARTI-0007 | 345 |

**t_audit_targets_data_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | node-a01 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | Log Level 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0006 | execution |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | running |
| ARTI-0005 | ARTI-0001 | ARTI-0011 | Triggered By 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0004 | node-a01 |
| ARTI-0007 | ARTI-0002 | ARTI-0005 | Log Level 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0006 | closeout |

The value tables materialize the attribute definitions into concrete data, partitioned by type to enforce type safety at the storage layer. Each value row carries an identifier, an entity_id that binds the value to its owning entity, an attr_id that resolves to the attribute definition, and the value itself. Boolean values—true and false—populate t_hipaa_safeguard_admin_val_boolean, where entity ADMI-0001 and ADMI-0003 assert mandatory as true while ADMI-0002 and ADMI-0004 assert false, all against attr_id ADMI-0003. Date values populate t_hipaa_safeguard_admin_val_date with entries such as 2024-01-07, 2023-01-18, 2025-04-08, and 2024-08-23 linked to entity ADMI-0001 through ADMI-0004 under attr_id ADMI-0001. Integer values appear in t_hipaa_safeguard_admin_val_int with values 1, 309, 1, and 623 mapped to entities ADMI-0001 and ADMI-0002 under attributes ADMI-0004 and ADMI-0005. String values reside in t_hipaa_safeguard_admin_val_varchar, carrying entries such as Encoding 01, Enforcement 02, change rationale, and fr across attributes ADMI-0007, ADMI-0002, ADMI-0008, and ADMI-0009 for entity ADMI-0001. The same type-partitioned pattern recurs for eBPF cross-references—XREF-0001 through XREF-0004 with date values 2025-04-17, 2025-02-23, 2025-06-16, 2023-07-21; integer values 268, 11, 212, 1; and varchar values 7b14de08, ref-8842, Apache-2.0, ap-south-2—and for audit artifacts—ARTI-0001 through ARTI-0004 with datetime values 2024-12-01T01:08:20, 2025-04-11T08:34:59, 2024-01-10T01:48:17, 2023-12-13T07:58:05; decimal values 4704.44, 2823.51, 460.93, 4764.85; integer values 102, 288, 803, 1; and varchar values node-a01, Log Level 02, execution, running.

**t_hipaa_safeguard_admin**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| ADMI-0001 | Privacy Rule | ARTI-0003 |
| ADMI-0002 | Security Rule | ARTI-0003 |
| ADMI-0003 | Transactions Rule | ARTI-0002 |
| ADMI-0004 | Contingency Plan | ARTI-0001 |
| ADMI-0005 | Audit Controls | ARTI-0004 |
| ADMI-0006 | Unique ID Rule | ARTI-0003 |
| ADMI-0007 | HITECH Amendment | ARTI-0004 |

**t_hipaa_safeguard_admin_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ADMI-0001 | effective_date | xsd:date |
| ADMI-0002 | enforcement | xsd:string |
| ADMI-0003 | mandatory | xsd:boolean |
| ADMI-0004 | priority | xsd:integer |
| ADMI-0005 | review_cycle_days | xsd:integer |
| ADMI-0006 | scope | xsd:string |
| ADMI-0007 | encoding | xsd:string |
| ADMI-0008 | label_text | xsd:string |

**t_hipaa_safeguard_admin_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0003 | true |
| ADMI-0002 | ADMI-0002 | ADMI-0003 | false |
| ADMI-0003 | ADMI-0003 | ADMI-0003 | true |
| ADMI-0004 | ADMI-0004 | ADMI-0003 | false |
| ADMI-0005 | ADMI-0005 | ADMI-0003 | true |
| ADMI-0006 | ADMI-0006 | ADMI-0003 | false |
| ADMI-0007 | ADMI-0007 | ADMI-0003 | false |

**t_hipaa_safeguard_admin_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0001 | 2024-01-07 |
| ADMI-0002 | ADMI-0002 | ADMI-0001 | 2023-01-18 |
| ADMI-0003 | ADMI-0003 | ADMI-0001 | 2025-04-08 |
| ADMI-0004 | ADMI-0004 | ADMI-0001 | 2024-08-23 |
| ADMI-0005 | ADMI-0005 | ADMI-0001 | 2023-10-19 |
| ADMI-0006 | ADMI-0006 | ADMI-0001 | 2024-11-12 |
| ADMI-0007 | ADMI-0007 | ADMI-0001 | 2023-08-20 |

**t_hipaa_safeguard_admin_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0004 | 1 |
| ADMI-0002 | ADMI-0001 | ADMI-0005 | 309 |
| ADMI-0003 | ADMI-0002 | ADMI-0004 | 1 |
| ADMI-0004 | ADMI-0002 | ADMI-0005 | 623 |
| ADMI-0005 | ADMI-0003 | ADMI-0004 | 3 |
| ADMI-0006 | ADMI-0003 | ADMI-0005 | 849 |
| ADMI-0007 | ADMI-0004 | ADMI-0004 | 5 |
| ADMI-0008 | ADMI-0004 | ADMI-0005 | 665 |

**t_hipaa_safeguard_admin_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0007 | Encoding 01 |
| ADMI-0002 | ADMI-0001 | ADMI-0002 | Enforcement 02 |
| ADMI-0003 | ADMI-0001 | ADMI-0008 | change rationale |
| ADMI-0004 | ADMI-0001 | ADMI-0009 | fr |
| ADMI-0005 | ADMI-0001 | ADMI-0006 | Scope 05 |
| ADMI-0006 | ADMI-0002 | ADMI-0007 | Encoding 06 |
| ADMI-0007 | ADMI-0002 | ADMI-0002 | Enforcement 07 |
| ADMI-0008 | ADMI-0002 | ADMI-0008 | audit excerpt |

**t_ebpfprogram_attaches_kernelhook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 7b14de08 |
| XREF-0002 | XREF-0001 | XREF-0003 | ref-8842 |
| XREF-0003 | XREF-0001 | XREF-0004 | Apache-2.0 |
| XREF-0004 | XREF-0001 | XREF-0009 | ap-south-2 |
| XREF-0005 | XREF-0001 | XREF-0005 | application/octet-stream |
| XREF-0006 | XREF-0001 | XREF-0010 | Name 06 |
| XREF-0007 | XREF-0001 | XREF-0011 | platform-team |
| XREF-0008 | XREF-0001 | XREF-0012 | Tags 08 |

The foreign-key relationships between these tables enforce referential integrity across the metadata graph. The entity_id column in every value table points back to the identifier in the corresponding entity table, ensuring that a value such as true in t_hipaa_safeguard_admin_val_boolean can be unambiguously traced to entity ADMI-0001. The attr_id column in every value table points to the identifier in the corresponding attribute definition table, so that the same value true resolves to attribute ADMI-0003, which in turn declares attr_name mandatory and attr_type xsd:boolean. This two-hop resolution—value to entity via entity_id, value to attribute definition via attr_id—allows any stored value to be interpreted correctly: the system knows not only which governed object the value belongs to but also what property it describes and what type it must conform to. In the eBPF domain, entity XREF-0001 (the dns_query_parser cross-reference) carries varchar value 7b14de08 under attribute XREF-0001, integer value 268 under attribute XREF-0006, and date value 2025-04-17 under attribute XREF-0002, each traceable through the same key chain. In the audit domain, entity ARTI-0001 (Cloud-Bucket-Encryption) carries varchar value node-a01 under attribute ARTI-0004, decimal value 4704.44 under attribute ARTI-0001, and integer value 102 under attribute ARTI-0003, again through the identical resolution pattern.

This architecture matters because compliance and systems governance demand that metadata be both extensible and auditable. Extensibility arises from the ability to define new attributes—new attr_name and attr_type pairs—without altering the entity schema or adding columns to value tables. A new attribute such as review_status typed as xsd:string can be declared in the attribute definition table and immediately populated in t_hipaa_safeguard_admin_val_varchar without any DDL change. Auditing arises from the explicit linkage: every value row carries its own identifier and the two foreign keys that anchor it to entity and attribute, producing a complete provenance trail. When an auditor queries for all values of attribute ADMI-0003 (mandatory) across HIPAA safeguard entities, the result set—true for ADMI-0001, false for ADMI-0002, true for ADMI-0003, false for ADMI-0004—comes with the full context of which safeguard each value describes and what the attribute semantically represents. The same discipline applies across domains: the eBPF cross-reference values for attribute XREF-0002 (created_date) yield 2025-04-17, 2025-02-23, 2025-06-16, and 2023-07-21 for entities XREF-0001 through XREF-0004, and the audit artifact values for attribute ARTI-0001 (duration_seconds) yield 4704.44, 2823.51, 460.93, and 4764.85 for entities ARTI-0001 through ARTI-0004. The uniformity of the pattern across HIPAA safeguards, eBPF programs, and audit artifacts ensures that governance tooling can operate on metadata generically, regardless of the domain-specific entities and attributes it encounters.