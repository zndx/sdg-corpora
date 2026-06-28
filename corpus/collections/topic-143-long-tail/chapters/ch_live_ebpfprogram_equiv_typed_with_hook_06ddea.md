---
chapter_id: ch_live_ebpfprogram_equiv_typed_with_hook_06ddea
topic_id: 143
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_equiv_typed_with_hook', 'rollback_relation', 'schemaorg_creativework_publisher']
model: engine-refine
---

eBPF program deployments are governed through a dimensional model that anchors each program instance to its classification, attachment point, and resource footprint. The central fact table records an identifier for every program—values such as HOOK-0001 through HOOK-0004—alongside its program type, the kernel hook to which it attaches, its compiled size in bytes, and its version number. Program sizes vary substantially across instances, ranging from approximately 113 megabytes for the smallest compiled module to nearly 785 megabytes for the largest, reflecting the diversity of instrumentation workloads deployed in production. Version numbers cluster around 9 through 12, indicating a controlled release cadence where programs are iteratively updated without wholesale replacement. The program type and hook attachment are not stored as free text within the fact table; instead, each row carries foreign keys that reference dedicated dimension tables, ensuring that classification remains consistent across queries and that categorical metadata is maintained in a single authoritative location.

**fact_ebpfprogram**

| id | program_type_key | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- | --- |
| HOOK-0001 | HOOK-0007 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0005 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0001 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0003 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0007 | HOOK-0006 | 167519051 | 1 |

The dimension tables for program type and hook attachment each expose an identifier, a human-readable label, and a category. Program type labels—such as Program Type Label 01 through Program Type Label 04—are grouped under corresponding categories like Program Type Category 01 through Program Type Category 04, forming a two-level taxonomy that supports both granular and aggregated reporting. Similarly, hook attachment dimensions carry labels such as Attaches To Hook Label 01 and Attaches To Hook Label 02, each assigned to an Attaches To Hook Category ranging from 01 to 04. This separation of label from category enables downstream consumers to filter programs by broad classification while preserving the ability to drill into specific hook points. The foreign-key relationship between the fact table and these dimensions means that any change to a program type's category or a hook's classification propagates automatically to all associated program records, eliminating the need for redundant updates and reducing the risk of inconsistent metadata.

**dim_program_type**

| id | program_type_label | program_type_category |
| --- | --- | --- |
| HOOK-0001 | Program Type Label 01 | Program Type Category 01 |
| HOOK-0002 | Program Type Label 02 | Program Type Category 02 |
| HOOK-0003 | Program Type Label 03 | Program Type Category 03 |
| HOOK-0004 | Program Type Label 04 | Program Type Category 04 |
| HOOK-0005 | Program Type Label 05 | Program Type Category 05 |
| HOOK-0006 | Program Type Label 06 | Program Type Category 06 |
| HOOK-0007 | Program Type Label 07 | Program Type Category 07 |
| HOOK-0008 | Program Type Label 08 | Program Type Category 08 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

Beyond the core eBPF program model, the schema employs an entity-attribute-value pattern to attach typed properties to relational entities, a design choice that accommodates schemas that evolve without requiring structural changes to the underlying tables. The rollback relation table captures pairs of rollback operations and their targets—nightly-sync-rollback rolls back to telemetry-ingest-pause, for instance—while a companion attribute definition table enumerates the properties that may be measured on each relation, such as confidence, dimension_kind, method, and recorded_at, each annotated with an XML Schema type like xsd:decimal, xsd:string, or xsd:dateTime. The actual values are stored in separate typed value tables: decimal values such as 0.023 and 717.59 reside in the decimal store, string values like Dimension Kind 01 and Encoding 02 in the varchar store, and timestamped entries such as 2024-05-22T12:01:29 in the datetime store. This type-disaggregated approach ensures that queries targeting a specific attribute type can be executed without type coercion overhead, while the entity identifier and attribute identifier columns maintain referential integrity across the value tables.

**t_rollback_relation**

| id | rollback | rolls_back_to |
| --- | --- | --- |
| RELA-0001 | release-tag-v3.2 | batch-processing-halt |
| RELA-0002 | telemetry-archive-oct | dataset-v111-stable |
| RELA-0003 | nightly-sync-rollback | telemetry-ingest-pause |
| RELA-0004 | config-deploy-fail | telemetry-archive-oct |
| RELA-0005 | model-checkpoint-88 | dataset-v111-stable |
| RELA-0006 | batch-processing-halt | model-checkpoint-88 |

**t_rollback_relation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RELA-0001 | confidence | xsd:decimal |
| RELA-0002 | dimension_kind | xsd:string |
| RELA-0003 | method | xsd:string |
| RELA-0004 | recorded_at | xsd:dateTime |
| RELA-0005 | uncertainty | xsd:decimal |
| RELA-0006 | unit | xsd:string |
| RELA-0007 | value | xsd:decimal |
| RELA-0008 | encoding | xsd:string |

**t_rollback_relation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0004 | 2024-05-22T12:01:29 |
| RELA-0002 | RELA-0002 | RELA-0004 | 2024-03-03T15:52:05 |
| RELA-0003 | RELA-0003 | RELA-0004 | 2024-01-11T10:28:20 |
| RELA-0004 | RELA-0004 | RELA-0004 | 2025-05-09T21:44:43 |
| RELA-0005 | RELA-0005 | RELA-0004 | 2023-08-15T18:37:49 |
| RELA-0006 | RELA-0006 | RELA-0004 | 2023-12-04T10:02:30 |

**t_rollback_relation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0001 | 0.023 |
| RELA-0002 | RELA-0001 | RELA-0005 | 717.59 |
| RELA-0003 | RELA-0001 | RELA-0007 | 918.13 |
| RELA-0004 | RELA-0002 | RELA-0001 | 0.999 |
| RELA-0005 | RELA-0002 | RELA-0005 | 360.64 |
| RELA-0006 | RELA-0002 | RELA-0007 | 735.68 |
| RELA-0007 | RELA-0003 | RELA-0001 | 0.137 |
| RELA-0008 | RELA-0003 | RELA-0005 | 883.40 |

**t_rollback_relation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0002 | Dimension Kind 01 |
| RELA-0002 | RELA-0001 | RELA-0008 | Encoding 02 |
| RELA-0003 | RELA-0001 | RELA-0009 | pre-release note |
| RELA-0004 | RELA-0001 | RELA-0010 | de |
| RELA-0005 | RELA-0001 | RELA-0003 | automated |
| RELA-0006 | RELA-0001 | RELA-0006 | kg |
| RELA-0007 | RELA-0002 | RELA-0002 | Dimension Kind 07 |
| RELA-0008 | RELA-0002 | RELA-0008 | Encoding 08 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

A parallel entity-attribute-value structure governs the schema.org creative work publisher domain, where relations between creative works and their publishers are enriched with properties such as checksum, created_date, identifier, and license. The attribute definition table assigns types including xsd:string, xsd:date, and cco:DesignativeICE to these properties, and the value tables store the corresponding data: checksums like 9d2b7a16, dates such as 2023-06-28 and 2024-12-26, integer counts including 72 and 54, and categorical values like proprietary and zone-b. The publisher dimension itself links creative works—API Gateway Config and Cloud Migration Playbook—to publishing entities such as the NIST Cybersecurity Office and the AWS Documentation Team, creating a bidirectional mapping that supports both work-centric and publisher-centric queries. Together, these two EAV subsystems demonstrate a consistent architectural pattern: attribute metadata is declared once in a definition table, and values are materialized in type-specific stores, allowing the schema to accommodate heterogeneous property sets while preserving type safety and query performance.

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | API Gateway Config | NIST Cybersecurity Office |
| PUBL-0002 | API Gateway Config | AWS Documentation Team |
| PUBL-0003 | Cloud Migration Playbook | AWS Documentation Team |
| PUBL-0004 | Cloud Migration Playbook | NIST Cybersecurity Office |
| PUBL-0005 | Incident Postmortem | ISO Technical Committee |
| PUBL-0006 | Telemetry Schema Draft | AWS Documentation Team |
| PUBL-0007 | Firmware Release Notes | Elastic Search Team |
| PUBL-0008 | Cloud Migration Playbook | Apache Software Foundation |

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |