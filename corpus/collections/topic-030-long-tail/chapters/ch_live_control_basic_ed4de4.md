---
chapter_id: ch_live_control_basic_ed4de4
topic_id: 30
family: 03_directive_governance
cited_terms: ['control_basic', 'kernelhook_in_kernel_module', 'process_max_one_operator']
model: engine-refine
---

The identifier column serves as the canonical key across all operational registries, establishing a uniform addressing scheme that enables cross-referencing between control mandates, kernel hooks, and process operators. Control records carry identifiers such as CONT-0001 through CONT-0004, kernel module mappings use MODU-0001 through MODU-0004, and process-operator associations are keyed as OPER-0001 through OPER-0004. This consistent prefix-based nomenclature—where the prefix encodes the entity class and the numeric suffix provides uniqueness—allows foreign-key relationships to be resolved without ambiguity. The operator column in the process-to-control linkage table, for instance, references identifiers from the control registry: SchemaEvolution maps to CONT-0003, KeyRotation to CONT-0001, and both BatchExport and a second SchemaEvolution entry resolve to CONT-0005 and CONT-0004 respectively. Such referential integrity ensures that every process operator can be traced back to its governing control requirement.

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |

**t_process_max_one_operator**

| id | process | operator |
| --- | --- | --- |
| OPER-0001 | SchemaEvolution | CONT-0003 |
| OPER-0002 | BatchExport | CONT-0005 |
| OPER-0003 | KeyRotation | CONT-0001 |
| OPER-0004 | SchemaEvolution | CONT-0004 |
| OPER-0005 | ModelTraining | CONT-0007 |
| OPER-0006 | AuditCompaction | CONT-0002 |

**t_process_max_one_operator_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0003 | 284 |
| OPER-0002 | OPER-0001 | OPER-0007 | 368 |
| OPER-0003 | OPER-0002 | OPER-0003 | 91 |
| OPER-0004 | OPER-0002 | OPER-0007 | 298 |
| OPER-0005 | OPER-0003 | OPER-0003 | 778 |
| OPER-0006 | OPER-0003 | OPER-0007 | 263 |
| OPER-0007 | OPER-0004 | OPER-0003 | 756 |
| OPER-0008 | OPER-0004 | OPER-0007 | 105 |

The entity–attribute–value triad forms the backbone of the metadata model, decoupling attribute definitions from their runtime values and enabling type-specific storage. The attribute definition table declares four attributes—duration_seconds, end_time, exit_code, and host_name—each annotated with an XSD type (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) that dictates how values are persisted. Values for these attributes are distributed across four dedicated value tables, each typed to its attribute's schema: decimal values such as 3596.17, 2700.62, 5101.62, and 2639.57 reside in the decimal store; datetime values like 2025-02-16T08:36:01, 2025-02-03T08:52:18, and 2024-10-29T11:02:54 in the datetime store; integer values including 284, 368, 91, and 298 in the integer store; and string values such as gw-12, Log Level 02, initiation, and pending in the varchar store. The entity_id column in each value table points back to the originating process operator, while attr_id references the attribute definition, creating a normalized graph where schema and data are maintained independently yet linked at query time.

**t_process_max_one_operator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OPER-0001 | duration_seconds | xsd:decimal |
| OPER-0002 | end_time | xsd:dateTime |
| OPER-0003 | exit_code | xsd:integer |
| OPER-0004 | host_name | xsd:string |
| OPER-0005 | log_level | xsd:string |
| OPER-0006 | phase | xsd:string |
| OPER-0007 | retry_count | xsd:integer |
| OPER-0008 | scheduled_at | xsd:dateTime |

**t_process_max_one_operator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0002 | 2025-02-16T08:36:01 |
| OPER-0002 | OPER-0001 | OPER-0008 | 2025-02-03T08:52:18 |
| OPER-0003 | OPER-0001 | OPER-0009 | 2024-10-29T11:02:54 |
| OPER-0004 | OPER-0002 | OPER-0002 | 2024-01-13T15:11:53 |
| OPER-0005 | OPER-0002 | OPER-0008 | 2023-10-19T14:19:43 |
| OPER-0006 | OPER-0002 | OPER-0009 | 2025-02-16T12:03:32 |
| OPER-0007 | OPER-0003 | OPER-0002 | 2024-02-17T13:45:28 |
| OPER-0008 | OPER-0003 | OPER-0008 | 2024-11-18T13:09:46 |

**t_process_max_one_operator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0001 | 3596.17 |
| OPER-0002 | OPER-0002 | OPER-0001 | 2700.62 |
| OPER-0003 | OPER-0003 | OPER-0001 | 5101.62 |
| OPER-0004 | OPER-0004 | OPER-0001 | 2639.57 |
| OPER-0005 | OPER-0005 | OPER-0001 | 6522.26 |
| OPER-0006 | OPER-0006 | OPER-0001 | 4952.76 |

**t_process_max_one_operator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0004 | gw-12 |
| OPER-0002 | OPER-0001 | OPER-0005 | Log Level 02 |
| OPER-0003 | OPER-0001 | OPER-0006 | initiation |
| OPER-0004 | OPER-0001 | OPER-0010 | pending |
| OPER-0005 | OPER-0001 | OPER-0011 | Triggered By 05 |
| OPER-0006 | OPER-0002 | OPER-0004 | node-a01 |
| OPER-0007 | OPER-0002 | OPER-0005 | Log Level 07 |
| OPER-0008 | OPER-0002 | OPER-0006 | execution |

Effective date and mandatory flag columns in the control registry govern the temporal applicability and enforcement posture of each compliance requirement. The control Anomaly detection limit (CONT-0001) carries an effective date of 2025-01-22 and is marked non-mandatory, whereas the Data retention mandate (CONT-0003) took effect on 2024-12-05 and is enforced as mandatory; similarly, the entry effective 2025-05-27 (CONT-0004) is mandatory, while the Audit logging standard (CONT-0002), effective 2025-04-27, remains non-mandatory. These two fields together determine whether a control is both active and obligatory at any given point in time, enabling auditors to reconstruct the compliance landscape as it existed on any historical date. The interplay between effective_date and is_mandatory is critical for temporal queries: a control may be mandatory in principle but not yet in force if its effective_date lies in the future, or conversely, may have lapsed if the current date exceeds any implicit expiration.

License and location columns in the kernel hook registry capture the legal and geographic dimensions of infrastructure deployment. Kernel hooks such as PsSetCreateProcessNotify_Monitor are associated with modules like ntoskrnl.exe and kdcom.sys, each carrying a license designation—CC-BY-4.0, GPL-3.0, or MIT—that determines redistribution and modification rights. The nvlddmkm.sys and storport.sys modules are both licensed under MIT, while the IDT_KiDispatch_Stub hook carries no explicit license in the registry. Geographic placement is recorded in the location column with values spanning zone-b, us-east-1, eu-west-3, and ap-south-2, reflecting a multi-region deployment topology. These fields are essential for regulatory compliance: the GPL-3.0 license on kdcom.sys imposes copyleft obligations that differ materially from the permissive MIT license on hal.dll, and the eu-west-3 location triggers data sovereignty considerations under GDPR that do not apply to ap-south-2.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | PsSetCreateProcessNotify_Monitor | ntoskrnl.exe | CC-BY-4.0 | zone-b |
| MODU-0002 | PsSetCreateProcessNotify_Monitor | kdcom.sys | GPL-3.0 | us-east-1 |
| MODU-0003 | nvlddmkm.sys | IDT_KiDispatch_Stub | MIT | eu-west-3 |
| MODU-0004 | storport.sys | hal.dll | MIT | ap-south-2 |
| MODU-0005 | iaStorAC.sys | iaStorAC.sys | proprietary | zone-b |
| MODU-0006 | ntoskrnl.exe | storport.sys | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | nvlddmkm.sys | Inline_NtQuerySystem | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | dxgkrnl.sys | SSDT_Dispatch_Rewrite | MPL-2.0 | zone-b |