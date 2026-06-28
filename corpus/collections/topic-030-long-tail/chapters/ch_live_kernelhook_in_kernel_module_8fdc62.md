---
chapter_id: ch_live_kernelhook_in_kernel_module_8fdc62
topic_id: 30
family: 04_ebpf_kernel
cited_terms: ['kernelhook_in_kernel_module', 'ebpfevent_via_program_xref', 'schemaorg_creativework_date']
model: engine-refine
---

The foundational unit of any structured data model is the identifier, a stable, unique key that anchors every record and enables cross-referencing across tables. In the kernel hook registry, identifiers such as `MODU-0001` through `MODU-0004` distinguish individual hook-to-module mappings, while event cross-references use `XREF-0001` through `XREF-0004` to tag programmatic event definitions, and schema.org creative works are keyed by `DATE-0001` through `DATE-0004`. These identifiers are not merely labels; they serve as the join keys that bind heterogeneous data into a coherent graph. The kernel module table links `MODU-0001` to the `PsSetCreateProcessNotify_Monitor` hook residing in `ntoskrnl.exe`, licensed under `CC-BY-4.0` and deployed in `zone-b`, while the event cross-reference table maps `XREF-0001` to the `DATA_LAKE_SYNC_FAIL` event, establishing a common addressing scheme across entirely different domains of system telemetry and kernel instrumentation.

**t_ebpfevent_via_program_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | DATA_LAKE_SYNC_FAIL |
| XREF-0002 | DATA_LAKE_SYNC_FAIL |
| XREF-0003 | TELEMETRY_HEARTBEAT |
| XREF-0004 | BATCH_ETL_COMPLETE |
| XREF-0005 | BATCH_ETL_COMPLETE |
| XREF-0006 | BATCH_ETL_COMPLETE |
| XREF-0007 | AUDIT_LOG_ROTATE |
| XREF-0008 | SYS_METRIC_COLLECT_9 |

**t_schemaorg_creativework_date**

| id | schemaorg |
| --- | --- |
| DATE-0001 | Quantum Error Correction |
| DATE-0002 | Human Genome Release |
| DATE-0003 | OAuth 2.0 Guidelines |
| DATE-0004 | Human Genome Release |
| DATE-0005 | Human Genome Release |
| DATE-0006 | OpenTelemetry Specification |

Attributes and their types form the descriptive layer that gives identifiers semantic meaning. The attribute definition table enumerates properties such as `duration_seconds`, `end_time`, `exit_code`, and `host_name`, each bound to a strict type—`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, or `xsd:string`—that governs how values are stored, validated, and queried. This type discipline is enforced at the storage layer through dedicated value tables: decimal values like `523.38` and `5096.06` populate the decimal store, datetime values such as `2024-04-10T05:27:34` and `2023-11-22T11:52:36` reside in the datetime store, integer values including `165`, `480`, `408`, and `150` fill the integer store, and free-form strings like `worker-07`, `Log Level 02`, `review`, and `failed` are held in the varchar store. The entity column in each value table—always referencing an identifier like `XREF-0001` or `XREF-0002`—ties the typed value back to its owning record, while the `attr_id` column points to the attribute definition, creating a normalized entity-attribute-value pattern that supports an open-ended schema without sacrificing type safety.

**t_ebpfevent_via_program_xref_attr**

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

**t_ebpfevent_via_program_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2024-04-10T05:27:34 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2023-11-22T11:52:36 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2023-03-12T23:52:23 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-06-01T11:10:59 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2025-03-29T17:45:15 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2025-05-05T19:52:00 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2025-04-08T16:02:54 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2023-08-28T04:07:50 |

**t_ebpfevent_via_program_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 523.38 |
| XREF-0002 | XREF-0002 | XREF-0001 | 5096.06 |
| XREF-0003 | XREF-0003 | XREF-0001 | 3292.30 |
| XREF-0004 | XREF-0004 | XREF-0001 | 4000.50 |
| XREF-0005 | XREF-0005 | XREF-0001 | 6997.28 |
| XREF-0006 | XREF-0006 | XREF-0001 | 6461.53 |
| XREF-0007 | XREF-0007 | XREF-0001 | 396.42 |
| XREF-0008 | XREF-0008 | XREF-0001 | 2149.89 |

**t_ebpfevent_via_program_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 165 |
| XREF-0002 | XREF-0001 | XREF-0007 | 480 |
| XREF-0003 | XREF-0002 | XREF-0003 | 408 |
| XREF-0004 | XREF-0002 | XREF-0007 | 150 |
| XREF-0005 | XREF-0003 | XREF-0003 | 507 |
| XREF-0006 | XREF-0003 | XREF-0007 | 419 |
| XREF-0007 | XREF-0004 | XREF-0003 | 413 |
| XREF-0008 | XREF-0004 | XREF-0007 | 9 |

**t_ebpfevent_via_program_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | worker-07 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | review |
| XREF-0004 | XREF-0001 | XREF-0010 | failed |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | ingest-21 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | execution |

Licensing and location metadata provide the governance and operational context that identifiers and attributes alone cannot convey. The kernel hook registry attaches a license—`GPL-3.0`, `MIT`, or `CC-BY-4.0`—to each hook-module pairing, establishing the legal framework under which the code may be used, modified, or redistributed. Simultaneously, a location field such as `us-east-1`, `eu-west-3`, `ap-south-2`, or `zone-b` anchors the module to a geographic or logical deployment region, enabling compliance audits, data residency checks, and incident response routing. These two fields operate orthogonally: a hook in `nvlddmkm.sys` licensed under `MIT` may reside in `eu-west-3`, while another in `kdcom.sys` under `GPL-3.0` may be deployed in `us-east-1`, and the combination of license and location becomes a queryable composite key for policy enforcement engines.

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

The subject-target-role triad captures the relational semantics that bind entities into a navigable knowledge graph. In the schema.org creative work date linkage table, the `subject` column (referencing a `schemaorg_id` such as `DATE-0005` or `DATE-0006`) points to the creative work entity, the `target` column (referencing a `date_published_id` such as `DATE-0001` or `DATE-0002`) points to the publication date entity, and the `role` column—taking values like `owner`, `contributor`, or `observer`—describes the nature of the relationship between them. This three-column pattern generalizes beyond schema.org: any system that needs to express that one entity plays a particular role with respect to another can adopt the same structure. The same creative work, `DATE-0006`, appears with two different roles across two date targets, illustrating how a single subject can participate in multiple relationships simultaneously, each with its own semantic label.

**t_schemaorg_creativework_date_date_published**

| id | date_published |
| --- | --- |
| DATE-0001 | 2024-05-11 |
| DATE-0002 | 2022-11-05 |
| DATE-0003 | 2023-12-01 |
| DATE-0004 | 2023-04-12 |
| DATE-0005 | 2023-12-01 |
| DATE-0006 | 2024-01-18 |

**t_schemaorg_creativework_date__date_published**

| id | schemaorg_id | date_published_id | role |
| --- | --- | --- | --- |
| DATE-0001 | DATE-0006 | DATE-0004 | owner |
| DATE-0002 | DATE-0006 | DATE-0001 | contributor |
| DATE-0003 | DATE-0005 | DATE-0001 | contributor |
| DATE-0004 | DATE-0005 | DATE-0002 | observer |
| DATE-0005 | DATE-0005 | DATE-0005 | owner |
| DATE-0006 | DATE-0003 | DATE-0005 | owner |
| DATE-0007 | DATE-0004 | DATE-0004 | observer |
| DATE-0008 | DATE-0004 | DATE-0004 | owner |

Together, these constructs—identifiers, attributes with typed values, licensing and location metadata, and subject-target-role relationships—form a minimal but complete vocabulary for describing, governing, and querying structured data. The kernel hook registry uses identifiers and metadata to track which hooks reside in which modules under which licenses and in which regions. The event-based programming cross-reference uses identifiers and an EAV pattern with strict typing to capture arbitrary event properties without schema migration. The schema.org date linkage uses identifiers and a role-annotated relationship table to express publication provenance. In each case, the same primitives recur: a stable key, a named property, a typed value, and a relationship with a role, combined in different configurations to serve different domains.